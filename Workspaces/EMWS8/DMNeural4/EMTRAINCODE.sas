*------------------------------------------------------------*;
* DMNeural4: Create decision matrix;
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
* DMNeural4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) GRP_AcceptedCmp5(ASC) GRP_Frq(ASC) GRP_Income(ASC) GRP_Mnt(ASC)
   GRP_MntFishProducts(ASC) GRP_MntGoldProds(ASC) GRP_MntMeatProducts(ASC)
   GRP_MntWines(ASC) GRP_NumCatalogPurchases(ASC) GRP_NumDistPurchases(ASC)
   GRP_NumWebPurchases(ASC) GRP_RFMstat(ASC) GRP_RMntFrq(ASC) GRP_Recency(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* DMNeural4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* DMNeural4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS8.BINNING_TRAIN
dmdbcat=WORK.DMNeural4_DMDB
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
* DMNeural4: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    GRP_AcceptedCmp5 GRP_Frq GRP_Income GRP_Mnt GRP_MntFishProducts
   GRP_MntGoldProds GRP_MntMeatProducts GRP_MntWines GRP_NumCatalogPurchases
   GRP_NumDistPurchases GRP_NumWebPurchases GRP_RFMstat GRP_RMntFrq GRP_Recency
   Year_Birth
%mend INPUTS;
proc dmneurl data=EMWS8.BINNING_TRAIN dmdbcat=WORK.DMNeural4_DMDB
outest=EMWS8.DMNeural4_ESTIMATE outfit=WORK._OUTFIT_DMNEURAL
out=WORK._OUT_DMNEURAL outclass=WORK._OUTCLASSDMNEURL_0L2HRP_
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
