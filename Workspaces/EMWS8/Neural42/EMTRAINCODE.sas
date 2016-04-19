*------------------------------------------------------------*;
* Neural42: Create decision matrix;
*------------------------------------------------------------*;
data WORK.DepVar;
  length   DepVar                           $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
DepVar="1"; COUNT=359; DATAPRIOR=0.0643642072; TRAINPRIOR=0.15122156697556; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
DepVar="0"; COUNT=2015; DATAPRIOR=0.9356357928; TRAINPRIOR=0.84877843302443; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify DepVar(type=PROFIT label=DepVar);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural42;
set EMWS8.Meta3_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
AcceptedCmpTotal Age Complain DepVar Education Frq HigherEducationBinary Income
Kidhome Mnt MntFishProducts MntFruits MntGoldProds MntSweetProducts
MonthsAsCustomer NumDealsPurchases NumWebVisitsMonth RFMstat RMntFrq Recency
Teenhome );
run;
*------------------------------------------------------------* ;
* Neural42: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural42: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntSweetProducts MonthsAsCustomer NumDealsPurchases
   NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural42: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural42
dmdbcat=WORK.Neural42_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
DepVar
;
run;
quit;
*------------------------------------------------------------* ;
* Neural42: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntSweetProducts MonthsAsCustomer NumDealsPurchases
   NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural42: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
   HigherEducationBinary
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural42: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Education
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural42: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural42 dmdbcat=WORK.Neural42_DMDB
validdata = EMWS8.Meta3_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %BININPUTS / level=nominal id=bin
;
input %NOMINPUTS / level=nominal id=nom
;
target DepVar / level=NOMINAL id=DepVar
bias
;
arch MLP
Hidden=1
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS8.Neural42_PRELIM_OUTEST
;
save network=EMWS8.Neural42_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS8.Neural42_outest estiter=1
Outfit=EMWS8.Neural42_OUTFIT
;
run;
quit;
proc sort data=EMWS8.Neural42_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural42;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural42(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS8.Neural42_INITIAL;
set EMWS8.Neural42_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural42 dmdbcat=WORK.Neural42_DMDB
validdata = EMWS8.Meta3_VALIDATE
network = EMWS8.Neural42_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS8.Neural42_INITIAL;
train tech=NONE;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural42\SCORECODE.sas"
group=Neural42
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural42\RESIDUALSCORECODE.sas"
group=Neural42
residual
;
;
score data=EMWS8.Meta3_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.Neural42_OUTKEY;
score data=EMWS8.Meta3_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS8.Neural42_OUTKEY;
run;
quit;
data EMWS8.Neural42_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Neural42_EMESTIMATE;
set EMWS8.Neural42_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural42;
run;
quit;
