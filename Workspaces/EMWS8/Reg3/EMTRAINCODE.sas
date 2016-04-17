*------------------------------------------------------------*;
* Reg3: Create decision matrix;
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
set EMWS8.BINNING_TRAIN(keep=
DepVar GRP_AcceptedCmp5 GRP_Frq GRP_Income GRP_Mnt GRP_MntFishProducts
GRP_MntGoldProds GRP_MntMeatProducts GRP_MntWines GRP_NumCatalogPurchases
GRP_NumDistPurchases GRP_NumWebPurchases GRP_RFMstat GRP_RMntFrq GRP_Recency );
run;
*------------------------------------------------------------* ;
* Reg3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) GRP_AcceptedCmp5(ASC) GRP_Frq(ASC) GRP_Income(ASC) GRP_Mnt(ASC)
   GRP_MntFishProducts(ASC) GRP_MntGoldProds(ASC) GRP_MntMeatProducts(ASC)
   GRP_MntWines(ASC) GRP_NumCatalogPurchases(ASC) GRP_NumDistPurchases(ASC)
   GRP_NumWebPurchases(ASC) GRP_RFMstat(ASC) GRP_RMntFrq(ASC) GRP_Recency(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;

%mend DMDBVar;
*------------------------------------------------------------*;
* Reg3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg3_DMDB
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
* Reg3: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg3_DMDB
validata = EMWS8.BINNING_VALIDATE
outest = EMWS8.Reg3_EMESTIMATE
outterms = EMWS8.Reg3_OUTTERMS
outmap= EMWS8.Reg3_MAPDS namelen=200
;
class
DepVar
GRP_AcceptedCmp5
GRP_Frq
GRP_Income
GRP_Mnt
GRP_MntFishProducts
GRP_MntGoldProds
GRP_MntMeatProducts
GRP_MntWines
GRP_NumCatalogPurchases
GRP_NumDistPurchases
GRP_NumWebPurchases
GRP_RFMstat
GRP_RMntFrq
GRP_Recency
;
model DepVar =
GRP_AcceptedCmp5
GRP_Frq
GRP_Income
GRP_Mnt
GRP_MntFishProducts
GRP_MntGoldProds
GRP_MntMeatProducts
GRP_MntWines
GRP_NumCatalogPurchases
GRP_NumDistPurchases
GRP_NumWebPurchases
GRP_RFMstat
GRP_RMntFrq
GRP_Recency
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=STEPWISE choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg3\EMPUBLISHSCORE.sas"
group=Reg3
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Reg3\EMFLOWSCORE.sas"
group=Reg3
residual
;
run;
quit;
