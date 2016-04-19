*------------------------------------------------------------*;
* Reg2: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS8.PRINCOMP_TRAIN(keep=
DepVar PC_1 PC_10 PC_11 PC_12 PC_13 PC_14 PC_15 PC_16 PC_17 PC_2 PC_3 PC_4
PC_5 PC_6 PC_7 PC_8 PC_9 Year_Birth );
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    PC_1 PC_10 PC_11 PC_12 PC_13 PC_14 PC_15 PC_16 PC_17 PC_2 PC_3 PC_4 PC_5 PC_6
   PC_7 PC_8 PC_9 Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg2_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
DepVar
;
run;
quit;
*------------------------------------------------------------*;
* Reg2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg2_DMDB
validata = EMWS8.PRINCOMP_VALIDATE
outest = EMWS8.Reg2_EMESTIMATE
outterms = EMWS8.Reg2_OUTTERMS
outmap= EMWS8.Reg2_MAPDS namelen=200
;
class
DepVar
;
model DepVar =
PC_1
PC_10
PC_11
PC_12
PC_13
PC_14
PC_15
PC_16
PC_17
PC_2
PC_3
PC_4
PC_5
PC_6
PC_7
PC_8
PC_9
Year_Birth
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg2\EMPUBLISHSCORE.sas"
group=Reg2
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg2\EMFLOWSCORE.sas"
group=Reg2
residual
;
run;
quit;
