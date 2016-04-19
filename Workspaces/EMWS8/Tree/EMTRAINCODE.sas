*------------------------------------------------------------*;
* Tree: Create decision matrix;
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
*------------------------------------------------------------* ;
* Tree: Tree Variables Macro ;
*------------------------------------------------------------* ;
%macro EM_TREEVARS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
   AcceptedCmpTotal Age Complain Education Frq HigherEducationBinary Income
   Kidhome Marital_Status Mnt MntFishProducts MntFruits MntGoldProds
   MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer NumCatalogPurchases
   NumDealsPurchases NumDistPurchases NumStorePurchases NumWebPurchases
   NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend EM_TREEVARS;
*------------------------------------------------------------* ;
* Tree: Tree Targets Macro ;
*------------------------------------------------------------* ;
%macro EM_TREETARGETS;
    DepVar
%mend EM_TREETARGETS;
data EMWS8.EM_Tree / view=EMWS8.EM_Tree;
set EMWS8.Meta_TRAIN(keep=%EM_TREEVARS %EM_TREETARGETS);
run;
*------------------------------------------------------------* ;
* Tree: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Tree: Binary and Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
   Education HigherEducationBinary Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Tree: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Tree: Run ARBOR procedure;
*------------------------------------------------------------*;
proc arbor data=EMWS8.EM_Tree
Leafsize=5
Mincatsize = 5
Maxbranch=2
Maxdepth=6
alpha = 0.2
Padjust=
CHAIDBEFORE
DEPTH
MAXRULES=5
MAXSURRS=0
Missing=USEINSEARCH
Exhaustive=5000
event='1'
;
;
input %INTINPUTS
/ level = interval;
input %NOMINPUTS
/ level=nominal;
target DepVar / level=BINARY
Criterion=PROBCHISQ
;
;
Performance DISK
NodeSize=20000
;
Assess
Validata=EMWS8.Meta_VALIDATE
measure=MISC
;
SUBTREE BEST
;
MAKEMACRO NLEAVES=nleaves;
save
MODEL=EMWS8.Tree_EMTREE
SEQUENCE=EMWS8.Tree_OUTSEQ
IMPORTANCE=EMWS8.Tree_OUTIMPORT
NODESTAT=EMWS8.Tree_OUTNODES
SUMMARY=EMWS8.Tree_OUTSUMMARY
STATSBYNODE=EMWS8.Tree_OUTSTATS
Topology=EMWS8.Tree_OUTTOPOLOGY
Pathlistnonmissing = EMWS8.Tree_OUTPATH
Rules = EMWS8.Tree_OUTRULES
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Tree\EMPUBLISHSCORE.sas"
group=Tree
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Tree\EMFLOWSCORE.sas"
group=Tree
residual
;
score data=EMWS8.EM_Tree out=_NULL_
outfit=WORK.FIT1
role=TRAIN
;
score data=EMWS8.Meta_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
;
run;
quit;
%put &nleaves;
data EMWS8.Tree_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Tree_OUTIMPORT;
set EMWS8.Tree_OUTIMPORT;
label NAME = "%sysfunc(sasmsg(sashelp.dmine, meta_name_vlabel, noquote))" LABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel, noquote))" NRULES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nrules_vlabel, noquote))" IMPORTANCE =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_importance_vlabel, noquote))" NSURROGATES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nsurrogates_vlabel, noquote))"
VIMPORTANCE = "%sysfunc(sasmsg(sashelp.dmine, rpt_vimportance_vlabel, noquote))" RATIO = "%sysfunc(sasmsg(sashelp.dmine, rpt_ratio_vlabel, noquote))"
;
run;
