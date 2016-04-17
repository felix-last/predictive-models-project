*------------------------------------------------------------*;
* Neural10: Create decision matrix;
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
data EM_Neural10;
set EMWS8.Meta_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
AcceptedCmpTotal Complain DepVar HigherEducationBinary Kidhome Marital_Status
Mnt MntFishProducts MntFruits MntGoldProds MntMeatProducts MntSweetProducts
MntWines NumCatalogPurchases NumDealsPurchases NumDistPurchases
NumStorePurchases NumWebPurchases NumWebVisitsMonth RFMstat Recency Teenhome );
run;
*------------------------------------------------------------* ;
* Neural10: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) HigherEducationBinary(ASC)
   Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural10: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Kidhome Mnt MntFishProducts MntFruits MntGoldProds
   MntMeatProducts MntSweetProducts MntWines NumCatalogPurchases NumDealsPurchases
   NumDistPurchases NumStorePurchases NumWebPurchases NumWebVisitsMonth RFMstat
   Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural10: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural10
dmdbcat=WORK.Neural10_DMDB
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
* Neural10: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Kidhome Mnt MntFishProducts MntFruits MntGoldProds
   MntMeatProducts MntSweetProducts MntWines NumCatalogPurchases NumDealsPurchases
   NumDistPurchases NumStorePurchases NumWebPurchases NumWebVisitsMonth RFMstat
   Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural10: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
   HigherEducationBinary
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural10: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural10: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural10 dmdbcat=WORK.Neural10_DMDB
validdata = EMWS8.Meta_VALIDATE
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
Hidden=7
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS8.Neural10_PRELIM_OUTEST
;
save network=EMWS8.Neural10_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS8.Neural10_outest estiter=1
Outfit=EMWS8.Neural10_OUTFIT
;
run;
quit;
proc sort data=EMWS8.Neural10_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural10;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural10(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS8.Neural10_INITIAL;
set EMWS8.Neural10_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural10 dmdbcat=WORK.Neural10_DMDB
validdata = EMWS8.Meta_VALIDATE
network = EMWS8.Neural10_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS8.Neural10_INITIAL;
train tech=NONE;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural10\SCORECODE.sas"
group=Neural10
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural10\RESIDUALSCORECODE.sas"
group=Neural10
residual
;
;
score data=EMWS8.Meta_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.Neural10_OUTKEY;
score data=EMWS8.Meta_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS8.Neural10_OUTKEY;
run;
quit;
data EMWS8.Neural10_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Neural10_EMESTIMATE;
set EMWS8.Neural10_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural10;
run;
quit;