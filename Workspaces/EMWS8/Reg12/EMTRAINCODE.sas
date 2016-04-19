*------------------------------------------------------------*;
* Reg12: Create decision matrix;
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
set EMWS8.Meta3_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
AcceptedCmpTotal Age Complain DepVar Education Frq HigherEducationBinary Income
Kidhome Marital_Status MntFishProducts MntFruits MntGoldProds MntSweetProducts
MonthsAsCustomer NumDealsPurchases NumWebVisitsMonth RFMstat RMntFrq Recency
Teenhome );
run;
*------------------------------------------------------------* ;
* Reg12: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg12: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome MntFishProducts MntFruits MntGoldProds
   MntSweetProducts MonthsAsCustomer NumDealsPurchases NumWebVisitsMonth RFMstat
   RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg12: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg12_DMDB
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
* Reg12: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg12_DMDB
validata = EMWS8.Meta3_VALIDATE
outest = EMWS8.Reg12_EMESTIMATE
outterms = EMWS8.Reg12_OUTTERMS
outmap= EMWS8.Reg12_MAPDS namelen=200
;
class
DepVar
AcceptedCmp1
AcceptedCmp2
AcceptedCmp3
AcceptedCmp4
AcceptedCmp5
Complain
Education
HigherEducationBinary
Marital_Status
;
model DepVar =
AcceptedCmp1
AcceptedCmp2
AcceptedCmp3
AcceptedCmp4
AcceptedCmp5
AcceptedCmpTotal
Age
Complain
Education
Frq
HigherEducationBinary
Income
Kidhome
Marital_Status
MntFishProducts
MntFruits
MntGoldProds
MntSweetProducts
MonthsAsCustomer
NumDealsPurchases
NumWebVisitsMonth
RFMstat
RMntFrq
Recency
Teenhome
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg12\EMPUBLISHSCORE.sas"
group=Reg12
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg12\EMFLOWSCORE.sas"
group=Reg12
residual
;
run;
quit;
