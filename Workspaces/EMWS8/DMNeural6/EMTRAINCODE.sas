*------------------------------------------------------------*;
* DMNeural6: Create decision matrix;
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
DepVar="1"; COUNT=359; DATAPRIOR=0.151221567; TRAINPRIOR=0.15122156697556; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
DepVar="0"; COUNT=2015; DATAPRIOR=0.848778433; TRAINPRIOR=0.84877843302443; DECPRIOR=.; DECISION1=0; DECISION2=1;
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
* DMNeural6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* DMNeural6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* DMNeural6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS8.Meta2_TRAIN
dmdbcat=WORK.DMNeural6_DMDB
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
* DMNeural6: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    AcceptedCmpTotal Frq Income Marital_Status Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend INPUTS;
proc dmneurl data=EMWS8.Meta2_TRAIN dmdbcat=WORK.DMNeural6_DMDB
outest=EMWS8.DMNeural6_ESTIMATE outfit=WORK._OUTFIT_DMNEURAL
out=WORK._OUT_DMNEURAL outclass=WORK._OUTCLASSDMNEURL_20VZPSZ
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
