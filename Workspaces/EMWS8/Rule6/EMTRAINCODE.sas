*------------------------------------------------------------*;
* Rule6: Create decision matrix;
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
* Rule6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Rule6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* Rule6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS8.Meta2_TRAIN
dmdbcat=WORK.Rule6_DMDB
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
* Rule Induction Training;
*------------------------------------------------------------*;
* Get counts for DepVar;
;
data _scr(keep= _level_ DepVar);
set EMWS8.Meta2_TRAIN;
length _level_ $16;
label _level_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_rulelevel_vlabel, NOQUOTE, DepVar))";
_tmp=putn(DepVar, 'best.');
%DMNORMCP(_tmp, _level_);
run;
proc freq data=_scr noprint;
table _level_ / out=_count;
run;
* Get Normalized counts for DepVar;
;
data _scr(keep= _level_ DepVar);
set EMWS8.Meta2_VALIDATE;
length _level_ $16;
label _level_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_rulelevel_vlabel, NOQUOTE, DepVar))";
_tmp = putn(DepVar, 'best.');
%DMNORMCP(_tmp, _level_);
run;
proc freq data=_scr noprint;
table _level_ / out= _vcount;
run;
data _vcount;
set _vcount;
label count = "%sysfunc(sasmsg(sashelp.dmine, rpt_validcount_vlabel, NOQUOTE))";
label percent = "%sysfunc(sasmsg(sashelp.dmine, rpt_validpercent_vlabel, NOQUOTE))";
rename count = vcount;
rename percent = vpercent;
run;
data _count;
merge _count _vcount;
by _level_;
run;
data _count;
set _count;
label count = "%sysfunc(sasmsg(sashelp.dmine, rpt_traincount_vlabel, NOQUOTE))";
label percent = "%sysfunc(sasmsg(sashelp.dmine, rpt_trainpercent_vlabel, NOQUOTE))";
run;
proc sort data=_count;
by DESCENDING count;
run;
*;
title9 "%sysfunc(sasmsg(sashelp.dmine, rpt_tarfreq_title, NOQUOTE, DepVar))";
*;
proc print data=_count noobs label;
run;
title9;
*------------------------------------------------------------*;
* Rip Model 1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TREE MODEL DepVar BINARY RIP1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Rule6: Create decision matrix;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Rule6: Tree Variables Macro ;
*------------------------------------------------------------* ;
%macro EM_TREEVARS;
    AcceptedCmpTotal Frq Income Marital_Status Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend EM_TREEVARS;
*------------------------------------------------------------* ;
* Rule6: Tree Targets Macro ;
*------------------------------------------------------------* ;
%macro EM_TREETARGETS;
    DepVar
%mend EM_TREETARGETS;
data WORK.EM_Rule6 / view=WORK.EM_Rule6;
set EMWS8.Meta2_TRAIN(keep=%EM_TREEVARS %EM_TREETARGETS);
run;
*------------------------------------------------------------* ;
* Rule6: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Rule6: Binary and Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Rule6: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Rule6: Run ARBOR procedure;
*------------------------------------------------------------*;
proc arbor data=WORK.EM_Rule6
Leafsize=50
Mincatsize = 5
Maxdepth=4
Missing=USEINSEARCH
;
;
input %INTINPUTS
/ level = interval;
input %NOMINPUTS
/ level=nominal;
target DepVar / level=BINARY
Criterion=GINI
;
;
Performance DISK
;
Assess
Validata=EMWS8.Meta2_VALIDATE
measure=ASE
;
MAKEMACRO NLEAVES=nleaves;
save
MODEL=WORK.OUTTREE_TREE_05TSK61
SEQUENCE=WORK.OUTSEQ_TREE_05TSK61
IMPORTANCE=WORK.OUTIMPORT_TREE_05TSK61
NODESTAT=WORK.OUTNODES_TREE_05TSK61
SUMMARY=WORK.OUTSUMMARY_TREE_05TSK61
STATSBYNODE=WORK.OUTSTATS_TREE_05TSK61
Pathlistnonmissing = WORK.OUTPATH_TREE_05TSK61
Rules = WORK.OUTRULES_TREE_05TSK61
;
code file="C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD11884_WN7LF-LEAVE_\Prc2\RIP1.sas"
group=Rule6
;
code file="C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD11884_WN7LF-LEAVE_\Prc2\RIP1_res.sas"
group=Rule6
residual
;
score data=EMWS8.Meta2_TRAIN out=_ptrain
;
score data=EMWS8.Meta2_VALIDATE out=_pvalid
;
run;
quit;
data WORK.OUTIMPORT_TREE_05TSK61;
set WORK.OUTIMPORT_TREE_05TSK61;
label NAME = "%sysfunc(sasmsg(sashelp.dmine, meta_name_vlabel, noquote))" LABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel, noquote))" NRULES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nrules_vlabel, noquote))" IMPORTANCE =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_importance_vlabel, noquote))" NSURROGATES = "%sysfunc(sasmsg(sashelp.dmine, rpt_nsurrogates_vlabel, noquote))"
VIMPORTANCE = "%sysfunc(sasmsg(sashelp.dmine, rpt_vimportance_vlabel, noquote))" RATIO = "%sysfunc(sasmsg(sashelp.dmine, rpt_ratio_vlabel, noquote))"
;
run;
* RIP1: Print leaf table;
;
data leafds;
set leafds;
format P_DEPVAR0 8.4;
format P_DEPVAR1 8.4;
;
run;
title9 "%sysfunc(sasmsg(sashelp.dmine, rpt_leaftable_title, NOQUOTE, RIP1, 100))";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_text_title, NOQUOTE, %nrbquote(No leaf was ripped from the model.)))";
proc print data = leafds NOOBS LABEL;
var NODE N
P_DEPVAR0
P_DEPVAR1
;
run;
title9;
title10;
* Create training data set with binary target for modeling;
;
data _ptrain;
length _bin $12;
set _ptrain;
_tmp=putn(DepVar, 'best.');
%DMNORMIP(_tmp);
_tmpLevel = '0';
%DMNORMCP(_tmpLevel, _tmpLevel);
if _tmp eq _tmpLevel then _bin = '1';
else _bin = '0';
drop _tmp _tmpLevel
;
run;
* Create validation data set with binary target for modeling;
;
data _pvalid;
length _bin $12;
set _pvalid;
_tmp = putn(DepVar, 'best.');
%DMNORMIP(_TMP);
_tmpLevel = '0';
%DMNORMCP(_tmpLevel, _tmpLevel);
if _tmp eq _tmpLevel then _bin = '1';
else _bin = '0';
drop _tmp
;
run;
data _train;
set _ptrain;
run;
data _valid;
set _pvalid;
*------------------------------------------------------------*;
* Binary Model DepVar = 0;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* REGRESSION MODEL DepVar binary BIN1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Binary Model DepVar = 0;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* REGRESSION MODEL DepVar binary BIN1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Rule6: Create decision matrix;
*------------------------------------------------------------*;
data EM_DMREG / view=EM_DMREG;
set work._train(keep=
AcceptedCmpTotal DepVar Frq Income Marital_Status Mnt MntGoldProds
MntMeatProducts NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat
Recency Teenhome Year_Birth _bin);
run;
*------------------------------------------------------------* ;
* Rule6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(ASC) Marital_Status(ASC) _bin(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Rule6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* Rule6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Rule6_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
_bin
;
run;
quit;
*------------------------------------------------------------*;
* Rule6: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Rule6_DMDB
validata = work._valid
outest = WORK.DMREG_2_6M9LU_OUTEST
outterms = WORK.DMREG_2_6M9LU_OUTTERMS
outmap= WORK.DMREG_2_6M9LU_MAP namelen=200
;
class
_bin
Marital_Status
;
model _bin =
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
;
;
score data=_train
out=_ptrain(label="")
;
score data=_valid
out=_pvalid(label="")
;
code file="C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD11884_WN7LF-LEAVE_\Prc2\BIN1.sas"
group=Rule6_1
;
code file="C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD11884_WN7LF-LEAVE_\Prc2\BIN1_res.sas"
group=Rule6_1
residual
;
run;
quit;
* BINARY: Training Classification;
;
proc freq data = _ptrain noprint;
tables F__bin * I__bin / out = _count;
run;
data _count;
set _count;
label count = "%sysfunc(sasmsg(sashelp.dmine, rpt_traincount_vlabel, NOQUOTE))";
label percent = "%sysfunc(sasmsg(sashelp.dmine, rpt_trainpercent_vlabel, NOQUOTE))";
label F__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_from_vlabel, NOQUOTE))";
label I__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_into_vlabel, NOQUOTE))";
run;
* BINARY: Validation Classification;
;
proc freq data = _pvalid noprint;
tables f__bin * i__bin / out=_vcount;
run;
data _vcount;
set _vcount;
length key $64;
label count = "%sysfunc(sasmsg(sashelp.dmine, rpt_validcount_vlabel, NOQUOTE))";
label percent = "%sysfunc(sasmsg(sashelp.dmine, rpt_validpercent_vlabel, NOQUOTE))";
label f__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_from_vlabel, NOQUOTE))";
label i__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_into_vlabel, NOQUOTE))";
rename count = vcount;
rename percent= vpercent;
key = ktrim(kleft(f__bin) !! '_' !! ktrim(kleft(i__bin)));
run;
*;
data _count;
set _count;
length key $64;
key = ktrim(kleft(f__bin) !! '_' !! ktrim(kleft(i__bin)));
run;
* Merge Train and Valid classification;
;
proc sort data=_count;
by key;
run;
proc sort data=_vcount;
by key;
run;
*;
data _count;
merge _count _vcount;
by key;
drop key;
run;
*BINARY: Print Classification;
;
title9 "%sysfunc(sasmsg(sashelp.dmine, rpt_binmodel_title, NOQUOTE, DepVar, %nrbquote(0)))";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_classification_title, NOQUOTE))";
proc print data = _count noobs label;
run;
title9;
title10;
* Extract misfit training values;
;
data _ptrain;
set _ptrain;
if not ( I__bin eq '1' and F__bin eq '1') then output;
keep
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
DepVar;
run;
* Extract misfit validation values;
;
data _pvalid;
set _pvalid;
if not (I__bin eq '1' and F__bin eq '1') then output;
keep
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
DepVar;
run;
* Create training data set with binary target for modeling;
;
data _ptrain;
length _bin $12;
set _ptrain;
_tmp=putn(DepVar, 'best.');
%DMNORMIP(_tmp);
_tmpLevel = '1';
%DMNORMCP(_tmpLevel, _tmpLevel);
if _tmp eq _tmpLevel then _bin = '1';
else _bin = '0';
drop _tmp _tmpLevel
;
run;
* Create validation data set with binary target for modeling;
;
data _pvalid;
length _bin $12;
set _pvalid;
_tmp = putn(DepVar, 'best.');
%DMNORMIP(_TMP);
_tmpLevel = '1';
%DMNORMCP(_tmpLevel, _tmpLevel);
if _tmp eq _tmpLevel then _bin = '1';
else _bin = '0';
drop _tmp
;
run;
data _train;
set _ptrain;
run;
data _valid;
set _pvalid;
*------------------------------------------------------------*;
* Binary Model DepVar = 1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* REGRESSION MODEL DepVar binary BIN2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Binary Model DepVar = 1;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* REGRESSION MODEL DepVar binary BIN2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Rule6: Create decision matrix;
*------------------------------------------------------------*;
data EM_DMREG / view=EM_DMREG;
set work._train(keep=
AcceptedCmpTotal DepVar Frq Income Marital_Status Mnt MntGoldProds
MntMeatProducts NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat
Recency Teenhome Year_Birth _bin);
run;
*------------------------------------------------------------* ;
* Rule6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(ASC) Marital_Status(ASC) _bin(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Rule6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Income Mnt MntGoldProds MntMeatProducts
   NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth RFMstat Recency
   Teenhome Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* Rule6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Rule6_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
_bin
;
run;
quit;
*------------------------------------------------------------*;
* Rule6: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Rule6_DMDB
validata = work._valid
outest = WORK.DMREG_130MOT3_OUTEST
outterms = WORK.DMREG_130MOT3_OUTTERMS
outmap= WORK.DMREG_130MOT3_MAP namelen=200
;
class
_bin
Marital_Status
;
model _bin =
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
;
;
score data=_train
out=_ptrain(label="")
;
score data=_valid
out=_pvalid(label="")
;
code file="C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD11884_WN7LF-LEAVE_\Prc2\BIN2.sas"
group=Rule6_2
;
code file="C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD11884_WN7LF-LEAVE_\Prc2\BIN2_res.sas"
group=Rule6_2
residual
;
run;
quit;
* BINARY: Training Classification;
;
proc freq data = _ptrain noprint;
tables F__bin * I__bin / out = _count;
run;
data _count;
set _count;
label count = "%sysfunc(sasmsg(sashelp.dmine, rpt_traincount_vlabel, NOQUOTE))";
label percent = "%sysfunc(sasmsg(sashelp.dmine, rpt_trainpercent_vlabel, NOQUOTE))";
label F__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_from_vlabel, NOQUOTE))";
label I__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_into_vlabel, NOQUOTE))";
run;
* BINARY: Validation Classification;
;
proc freq data = _pvalid noprint;
tables f__bin * i__bin / out=_vcount;
run;
data _vcount;
set _vcount;
length key $64;
label count = "%sysfunc(sasmsg(sashelp.dmine, rpt_validcount_vlabel, NOQUOTE))";
label percent = "%sysfunc(sasmsg(sashelp.dmine, rpt_validpercent_vlabel, NOQUOTE))";
label f__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_from_vlabel, NOQUOTE))";
label i__bin = "%sysfunc(sasmsg(sashelp.dmine, rpt_into_vlabel, NOQUOTE))";
rename count = vcount;
rename percent= vpercent;
key = ktrim(kleft(f__bin) !! '_' !! ktrim(kleft(i__bin)));
run;
*;
data _count;
set _count;
length key $64;
key = ktrim(kleft(f__bin) !! '_' !! ktrim(kleft(i__bin)));
run;
* Merge Train and Valid classification;
;
proc sort data=_count;
by key;
run;
proc sort data=_vcount;
by key;
run;
*;
data _count;
merge _count _vcount;
by key;
drop key;
run;
*BINARY: Print Classification;
;
title9 "%sysfunc(sasmsg(sashelp.dmine, rpt_binmodel_title, NOQUOTE, DepVar, %nrbquote(1)))";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_classification_title, NOQUOTE))";
proc print data = _count noobs label;
run;
title9;
title10;
* Extract misfit training values;
;
data _ptrain;
set _ptrain;
if not ( I__bin eq '1' and F__bin eq '1') then output;
keep
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
DepVar;
run;
* Extract misfit validation values;
;
data _pvalid;
set _pvalid;
if not (I__bin eq '1' and F__bin eq '1') then output;
keep
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
DepVar;
run;
data _train;
set _ptrain;
run;
data _valid;
set _pvalid;
title8;
