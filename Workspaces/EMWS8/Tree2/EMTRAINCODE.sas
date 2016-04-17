*------------------------------------------------------------*;
* Tree2: Create decision matrix;
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
* Tree2: Tree Variables Macro ;
*------------------------------------------------------------* ;
%macro EM_TREEVARS;
    PC_1 PC_10 PC_11 PC_12 PC_13 PC_14 PC_15 PC_16 PC_17 PC_18 PC_19 PC_2 PC_20
   PC_3 PC_4 PC_5 PC_6 PC_7 PC_8 PC_9
%mend EM_TREEVARS;
*------------------------------------------------------------* ;
* Tree2: Tree Targets Macro ;
*------------------------------------------------------------* ;
%macro EM_TREETARGETS;
    DepVar
%mend EM_TREETARGETS;
data EMWS8.EM_Tree2 / view=EMWS8.EM_Tree2;
set EMWS8.PRINCOMP_TRAIN(keep=%EM_TREEVARS %EM_TREETARGETS);
run;
*------------------------------------------------------------* ;
* Tree2: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    PC_1 PC_10 PC_11 PC_12 PC_13 PC_14 PC_15 PC_16 PC_17 PC_18 PC_19 PC_2 PC_20
   PC_3 PC_4 PC_5 PC_6 PC_7 PC_8 PC_9
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Tree2: Binary and Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Tree2: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Tree2: Run ARBOR procedure;
*------------------------------------------------------------*;
proc arbor data=EMWS8.EM_Tree2
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
target DepVar / level=BINARY
Criterion=PROBCHISQ
;
;
Performance DISK
NodeSize=20000
;
Assess
Validata=EMWS8.PRINCOMP_VALIDATE
measure=MISC
;
SUBTREE BEST
;
MAKEMACRO NLEAVES=nleaves;
save
MODEL=EMWS8.Tree2_EMTREE
SEQUENCE=EMWS8.Tree2_OUTSEQ
IMPORTANCE=EMWS8.Tree2_OUTIMPORT
NODESTAT=EMWS8.Tree2_OUTNODES
SUMMARY=EMWS8.Tree2_OUTSUMMARY
STATSBYNODE=EMWS8.Tree2_OUTSTATS
Topology=EMWS8.Tree2_OUTTOPOLOGY
Pathlistnonmissing = EMWS8.Tree2_OUTPATH
Rules = EMWS8.Tree2_OUTRULES
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Tree2\EMPUBLISHSCORE.sas"
group=Tree2
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Tree2\EMFLOWSCORE.sas"
group=Tree2
residual
;
score data=EMWS8.EM_Tree2 out=_NULL_
outfit=WORK.FIT1
role=TRAIN
;
score data=EMWS8.PRINCOMP_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
;
run;
quit;
%put &nleaves;
data EMWS8.Tree2_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS8.Tree2_OUTIMPORT;
set EMWS8.Tree2_OUTIMPORT;
label NAME = "%sysfunc(sasmsg(sashelp.dmine, meta_name_vlabel, noquote))" LABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel, noquote))" NRULES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nrules_vlabel, noquote))" IMPORTANCE =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_importance_vlabel, noquote))" NSURROGATES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nsurrogates_vlabel, noquote))"
VIMPORTANCE = "%sysfunc(sasmsg(sashelp.dmine, rpt_vimportance_vlabel, noquote))" RATIO = "%sysfunc(sasmsg(sashelp.dmine, rpt_ratio_vlabel, noquote))"
;
run;
