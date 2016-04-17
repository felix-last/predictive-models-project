*------------------------------------------------------------*;
* Neural20: Create decision matrix;
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
data EM_Neural20;
set EMWS8.BINNING_TRAIN(keep=
DepVar GRP_AcceptedCmp5 GRP_Frq GRP_Income GRP_Mnt GRP_MntFishProducts
GRP_MntGoldProds GRP_MntMeatProducts GRP_MntWines GRP_NumCatalogPurchases
GRP_NumDistPurchases GRP_NumWebPurchases GRP_RFMstat GRP_RMntFrq GRP_Recency );
run;
*------------------------------------------------------------* ;
* Neural20: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) GRP_AcceptedCmp5(ASC) GRP_Frq(ASC) GRP_Income(ASC) GRP_Mnt(ASC)
   GRP_MntFishProducts(ASC) GRP_MntGoldProds(ASC) GRP_MntMeatProducts(ASC)
   GRP_MntWines(ASC) GRP_NumCatalogPurchases(ASC) GRP_NumDistPurchases(ASC)
   GRP_NumWebPurchases(ASC) GRP_RFMstat(ASC) GRP_RMntFrq(ASC) GRP_Recency(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural20: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;

%mend DMDBVar;
*------------------------------------------------------------*;
* Neural20: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural20
dmdbcat=WORK.Neural20_DMDB
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
* Neural20: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;

%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural20: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural20: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    GRP_AcceptedCmp5 GRP_Frq GRP_Income GRP_Mnt GRP_MntFishProducts
   GRP_MntGoldProds GRP_MntMeatProducts GRP_MntWines GRP_NumCatalogPurchases
   GRP_NumDistPurchases GRP_NumWebPurchases GRP_RFMstat GRP_RMntFrq GRP_Recency
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural20: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural20 dmdbcat=WORK.Neural20_DMDB
validdata = EMWS8.BINNING_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %NOMINPUTS / level=nominal id=nom
;
target DepVar / level=NOMINAL id=DepVar
bias
;
arch MLP
Hidden=2
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS8.Neural20_PRELIM_OUTEST
;
save network=EMWS8.Neural20_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS8.Neural20_outest estiter=1
Outfit=EMWS8.Neural20_OUTFIT
;
run;
quit;
proc sort data=EMWS8.Neural20_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural20;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural20(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS8.Neural20_INITIAL;
set EMWS8.Neural20_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural20 dmdbcat=WORK.Neural20_DMDB
validdata = EMWS8.BINNING_VALIDATE
network = EMWS8.Neural20_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS8.Neural20_INITIAL;
train tech=NONE;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural20\SCORECODE.sas"
group=Neural20
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Neural20\RESIDUALSCORECODE.sas"
group=Neural20
residual
;
;
score data=EMWS8.BINNING_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.Neural20_OUTKEY;
score data=EMWS8.BINNING_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS8.Neural20_OUTKEY;
run;
quit;
data EMWS8.Neural20_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Neural20_EMESTIMATE;
set EMWS8.Neural20_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural20;
run;
quit;