*------------------------------------------------------------*;
* Neural3: Create decision matrix;
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
DepVar="1"; COUNT=114; DATAPRIOR=0.0643642072; TRAINPRIOR=0.06989576946658; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
DepVar="0"; COUNT=1517; DATAPRIOR=0.9356357928; TRAINPRIOR=0.93010423053341; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify DepVar(type=PROFIT label=DepVar);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural3;
set EMWS8.Meta_TRAIN(keep=
CatPurchase Clothes DepVar Dependents HouseKeeping Marital_Status Mnt Rcn
Recomendation SmallAppliances Toys );
run;
*------------------------------------------------------------* ;
* Neural3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Dependents(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    CatPurchase Clothes HouseKeeping Mnt Rcn Recomendation SmallAppliances Toys
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural3
dmdbcat=WORK.Neural3_DMDB
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
* Neural3: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    CatPurchase Clothes HouseKeeping Mnt Rcn Recomendation SmallAppliances Toys
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural3: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    Dependents
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural3: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural3: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
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
Hidden=2
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS8.Neural3_PRELIM_OUTEST
;
save network=EMWS8.Neural3_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS8.Neural3_outest estiter=1
Outfit=EMWS8.Neural3_OUTFIT
;
run;
quit;
proc sort data=EMWS8.Neural3_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural3;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural3(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS8.Neural3_INITIAL;
set EMWS8.Neural3_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
validdata = EMWS8.Meta_VALIDATE
network = EMWS8.Neural3_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS8.Neural3_INITIAL;
train tech=NONE;
code file="E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Neural3\SCORECODE.sas"
group=Neural3
;
;
code file="E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Neural3\RESIDUALSCORECODE.sas"
group=Neural3
residual
;
;
score data=EMWS8.Meta_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.Neural3_OUTKEY;
score data=EMWS8.Meta_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS8.Neural3_OUTKEY;
run;
quit;
data EMWS8.Neural3_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Neural3_EMESTIMATE;
set EMWS8.Neural3_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural3;
run;
quit;
