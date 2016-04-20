*------------------------------------------------------------*;
* Tree4: Create decision matrix;
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
* Tree4: Tree Variables Macro ;
*------------------------------------------------------------* ;
%macro EM_TREEVARS;
    AcceptedCmpTotal Frq G_Marital_Status Income Mnt MntGoldProds MntMeatProducts
   MntWines NumDistPurchases RFMstat RMntFrq Recency
%mend EM_TREEVARS;
*------------------------------------------------------------* ;
* Tree4: Tree Targets Macro ;
*------------------------------------------------------------* ;
%macro EM_TREETARGETS;
    DepVar
%mend EM_TREETARGETS;
data EMWS8.EM_Tree4 / view=EMWS8.EM_Tree4;
set EMWS8.Varsel_TRAIN(keep=%EM_TREEVARS %EM_TREETARGETS);
run;
*------------------------------------------------------------* ;
* Tree4: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts MntWines
   NumDistPurchases RFMstat RMntFrq Recency
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Tree4: Binary and Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    G_Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Tree4: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Tree4: Run ARBOR procedure;
*------------------------------------------------------------*;
proc arbor data=EMWS8.EM_Tree4
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
Validata=EMWS8.Varsel_VALIDATE
measure=MISC
;
SUBTREE BEST
;
MAKEMACRO NLEAVES=nleaves;
save
MODEL=EMWS8.Tree4_EMTREE
SEQUENCE=EMWS8.Tree4_OUTSEQ
IMPORTANCE=EMWS8.Tree4_OUTIMPORT
NODESTAT=EMWS8.Tree4_OUTNODES
SUMMARY=EMWS8.Tree4_OUTSUMMARY
STATSBYNODE=EMWS8.Tree4_OUTSTATS
Topology=EMWS8.Tree4_OUTTOPOLOGY
Pathlistnonmissing = EMWS8.Tree4_OUTPATH
Rules = EMWS8.Tree4_OUTRULES
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Tree4\EMPUBLISHSCORE.sas"
group=Tree4
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Tree4\EMFLOWSCORE.sas"
group=Tree4
residual
;
score data=EMWS8.EM_Tree4 out=_NULL_
outfit=WORK.FIT1
role=TRAIN
;
score data=EMWS8.Varsel_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
;
run;
quit;
%put &nleaves;
data EMWS8.Tree4_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Tree4_OUTIMPORT;
set EMWS8.Tree4_OUTIMPORT;
label NAME = "%sysfunc(sasmsg(sashelp.dmine, meta_name_vlabel, noquote))" LABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel, noquote))" NRULES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nrules_vlabel, noquote))" IMPORTANCE =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_importance_vlabel, noquote))" NSURROGATES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nsurrogates_vlabel, noquote))"
VIMPORTANCE = "%sysfunc(sasmsg(sashelp.dmine, rpt_vimportance_vlabel, noquote))" RATIO = "%sysfunc(sasmsg(sashelp.dmine, rpt_ratio_vlabel, noquote))"
;
run;
