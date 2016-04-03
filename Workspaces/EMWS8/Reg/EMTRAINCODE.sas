*------------------------------------------------------------*;
* Reg: Create decision matrix;
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
data EM_DMREG / view=EM_DMREG;
set EMWS8.Meta_TRAIN(keep=
CatPurchase Clothes DepVar Dependents HouseKeeping Marital_Status Mnt Rcn
Recomendation SmallAppliances Toys );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Dependents(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    CatPurchase Clothes HouseKeeping Mnt Rcn Recomendation SmallAppliances Toys
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
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
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS8.Meta_VALIDATE
outest = EMWS8.Reg_EMESTIMATE
outterms = EMWS8.Reg_OUTTERMS
outmap= EMWS8.Reg_MAPDS namelen=200
;
class
DepVar
Dependents
Marital_Status
;
model DepVar =
CatPurchase
Clothes
Dependents
HouseKeeping
Marital_Status
Mnt
Rcn
Recomendation
SmallAppliances
Toys
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
