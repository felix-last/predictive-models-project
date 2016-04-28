*------------------------------------------------------------*;
* DMNeural: Create decision matrix;
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
DepVar="1"; COUNT=359; DATAPRIOR=0.15122156697556; TRAINPRIOR=0.15122156697556; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
DepVar="0"; COUNT=2015; DATAPRIOR=0.84877843302443; TRAINPRIOR=0.84877843302443; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify DepVar(type=PROFIT label=DepVar);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
*------------------------------------------------------------* ;
* DMNeural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* DMNeural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* DMNeural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS8.Meta_TRAIN
dmdbcat=WORK.DMNeural_DMDB
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
* DMNeural: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
   AcceptedCmpTotal Age Complain Education Frq HigherEducationBinary Income
   Kidhome Marital_Status Mnt MntFishProducts MntFruits MntGoldProds
   MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer NumCatalogPurchases
   NumDealsPurchases NumDistPurchases NumStorePurchases NumWebPurchases
   NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend INPUTS;
proc dmneurl data=EMWS8.Meta_TRAIN dmdbcat=WORK.DMNeural_DMDB
outest=EMWS8.DMNeural_ESTIMATE outfit=WORK._OUTFIT_DMNEURAL
out=WORK._OUT_DMNEURAL outclass=WORK._OUTCLASSDMNEURL_3WSHPUI
optcrit=ACC maxcomp=6 maxstage=10 maxfunc=1000
selcrit=SSE
maxiter=400 maxvect=800 memsiz=8 stopr2=0.00005 cutoff=0.5 maxrows = 3000
absgconv=0.0005 gconv=1E-8
NOMONITOR
;
var %INPUTS;
target DepVar;
;
run;
