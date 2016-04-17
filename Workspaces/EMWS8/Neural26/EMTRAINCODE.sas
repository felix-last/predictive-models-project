*------------------------------------------------------------*;
* Neural26: Create decision matrix;
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
data EM_Neural26;
set EMWS8.Varsel_TRAIN(keep=
AcceptedCmpTotal DepVar Frq G_Marital_Status Income Mnt MntFruits MntGoldProds
MntMeatProducts MntSweetProducts NumCatalogPurchases NumWebPurchases RFMstat
RMntFrq Recency );
run;
*------------------------------------------------------------* ;
* Neural26: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) G_Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural26: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Income Mnt MntFruits MntGoldProds MntMeatProducts
   MntSweetProducts NumCatalogPurchases NumWebPurchases RFMstat RMntFrq Recency
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural26: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural26
dmdbcat=WORK.Neural26_DMDB
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
* Neural26: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Frq Income Mnt MntFruits MntGoldProds MntMeatProducts
   MntSweetProducts NumCatalogPurchases NumWebPurchases RFMstat RMntFrq Recency
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural26: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural26: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    G_Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural26: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural26 dmdbcat=WORK.Neural26_DMDB
validdata = EMWS8.Varsel_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %NOMINPUTS / level=nominal id=nom
;
target DepVar / level=NOMINAL id=DepVar
bias
;
arch MLP
Hidden=4
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS8.Neural26_PRELIM_OUTEST
;
save network=EMWS8.Neural26_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS8.Neural26_outest estiter=1
Outfit=EMWS8.Neural26_OUTFIT
;
run;
quit;
proc sort data=EMWS8.Neural26_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural26;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural26(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS8.Neural26_INITIAL;
set EMWS8.Neural26_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural26 dmdbcat=WORK.Neural26_DMDB
validdata = EMWS8.Varsel_VALIDATE
network = EMWS8.Neural26_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS8.Neural26_INITIAL;
train tech=NONE;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural26\SCORECODE.sas"
group=Neural26
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural26\RESIDUALSCORECODE.sas"
group=Neural26
residual
;
;
score data=EMWS8.Varsel_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.Neural26_OUTKEY;
score data=EMWS8.Varsel_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS8.Neural26_OUTKEY;
run;
quit;
data EMWS8.Neural26_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Neural26_EMESTIMATE;
set EMWS8.Neural26_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural26;
run;
quit;
