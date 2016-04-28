*------------------------------------------------------------*;
* Reg9: Create decision matrix;
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
set EMWS8.Meta2_TRAIN(keep=
AcceptedCmpTotal DepVar Frq Income Marital_Status Mnt MntGoldProds
MntMeatProducts NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat
Recency Teenhome Year_Birth );
run;
*------------------------------------------------------------* ;
* Reg9: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg9: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg9: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg9_DMDB
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
* Reg9: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg9_DMDB
validata = EMWS8.Meta2_VALIDATE
outest = EMWS8.Reg9_EMESTIMATE
outterms = EMWS8.Reg9_OUTTERMS
outmap= EMWS8.Reg9_MAPDS namelen=200
;
class
DepVar
Marital_Status
;
model DepVar =
AcceptedCmpTotal
Frq
Income
Marital_Status
Mnt
MntGoldProds
MntMeatProducts
NumCatalogPurchases
NumDealsPurchases
NumWebVisitsMonth
RFMstat
Recency
Teenhome
Year_Birth
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg9\EMPUBLISHSCORE.sas"
group=Reg9
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg9\EMFLOWSCORE.sas"
group=Reg9
residual
;
run;
quit;
