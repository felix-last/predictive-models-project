*------------------------------------------------------------*;
* AutoNeural38: Create decision matrix;
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
data EM_AutoNeural38;
set EMWS8.Meta3_TRAIN(keep=
AcceptedCmpTotal DepVar Frq Marital_Status Mnt MntMeatProducts
NumCatalogPurchases NumDealsPurchases NumWebVisitsMonth Recency );
run;
*------------------------------------------------------------* ;
* AutoNeural38: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural38: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Frq Mnt MntMeatProducts NumCatalogPurchases NumDealsPurchases
   NumWebVisitsMonth Recency
%mend DMDBVar;
*------------------------------------------------------------*;
* AutoNeural38: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_AutoNeural38
dmdbcat=WORK.AutoNeural38_DMDB
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
* AutoNeural38: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Frq Mnt MntMeatProducts NumCatalogPurchases NumDealsPurchases
   NumWebVisitsMonth Recency
%mend INTINPUTS;
*------------------------------------------------------------* ;
* AutoNeural38: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* AutoNeural38: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* AutoNeural38: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
* set printing options;
;
options linesize = 80;
options pagesize = 6000;
options nonumber;
options nocenter;
options nodate;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_autonet_title  , NOQUOTE))";
*;
*------------------------------------------------------------*;
* Autoneural: search / FUNNEL LAYERS;
;
*------------------------------------------------------------*;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*;
netoptions ranscale = 1;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=1800 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 3 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 3 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS8.AutoNeural38_HISTORY;
length _func_ _status_ _step_ $16;
label _func_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_function_vlabel  , NOQUOTE))";
label _status_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_status_vlabel  , NOQUOTE))";
label _iter_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_iteration_vlabel  , NOQUOTE))";
label _step_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_step_vlabel  , NOQUOTE))";
_func_ = '';
_status_ = '';
_step_ = 'FUNNEL LAYERS 1';
set
_anfit(where=(_name_ eq 'OVERALL' and _iter_ eq 0))
;
run;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 8 outest=_anpre pretime=112 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=900 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=SINE;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 8 outest=_anpre pretime=112 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=899 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 35 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 35 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 8 outest=_anpre pretime=112 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=898 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 8 outest=_anpre pretime=112 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=897 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=LOG;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 10 outest=_anpre pretime=89 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=897 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 13 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 13 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 10 outest=_anpre pretime=89 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=895 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 10 outest=_anpre pretime=89 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=894 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 47 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 47 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 10 outest=_anpre pretime=89 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=893 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 37 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 37 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=LOG;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 12 outest=_anpre pretime=74 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=892 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 19 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 19 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 12 outest=_anpre pretime=74 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=891 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 12 outest=_anpre pretime=74 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=890 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 9 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 9 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 12 outest=_anpre pretime=74 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=888 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 14 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 14 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=LOG;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 14 outest=_anpre pretime=63 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=888 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 6 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 6 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SINE;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 14 outest=_anpre pretime=63 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=885 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 13 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 13 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 14 outest=_anpre pretime=63 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=883 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 22 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 22 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=LOG;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 FUNNEL LAYERS trial # 1 : LOGISTIC : ))";
prelim 14 outest=_anpre pretime=62 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 FUNNEL LAYERS trial # 1 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=881 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 3 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 3 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SINE;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 FUNNEL LAYERS trial # 2 : SINE : ))";
prelim 14 outest=_anpre pretime=62 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 FUNNEL LAYERS trial # 2 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=878 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 31 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 31 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 FUNNEL LAYERS trial # 3 : SOFTMAX : ))";
prelim 14 outest=_anpre pretime=62 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 FUNNEL LAYERS trial # 3 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=876 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 30 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 30 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
Hidden 2 / id = H1x5_ act=LOG;
connect interval H1x5_;
connect nominal H1x5_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
connect H1x5_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
connect H1x5_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
connect H1x5_ H2x3_;
Hidden 2 / id = H2x4_ act=SINE;
connect H1x1_ H2x4_;
connect H1x2_ H2x4_;
connect H1x3_ H2x4_;
connect H1x4_ H2x4_;
connect H1x5_ H2x4_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
connect H2x4_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
connect H2x4_ H3x2_;
Hidden 2 / id = H3x3_ act=SOFTMAX;
connect H2x1_ H3x3_;
connect H2x2_ H3x3_;
connect H2x3_ H3x3_;
connect H2x4_ H3x3_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H3x3_ H4x1_;
Hidden 2 / id = H4x2_ act=SOFTMAX;
connect H3x1_ H4x2_;
connect H3x2_ H4x2_;
connect H3x3_ H4x2_;
*------------------------------------------------------------*;
* Layer #5;
;
*------------------------------------------------------------*;
Hidden 2 / id = H5x1_ act=LOG;
connect H4x1_ H5x1_;
connect H4x2_ H5x1_;
connect H5x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 6 FUNNEL LAYERS trial # 1 : LOGISTIC : ))";
prelim 16 outest=_anpre pretime=54 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 6 FUNNEL LAYERS trial # 1 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=874 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 20 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 20 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
Hidden 2 / id = H1x5_ act=LOG;
connect interval H1x5_;
connect nominal H1x5_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
connect H1x5_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
connect H1x5_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
connect H1x5_ H2x3_;
Hidden 2 / id = H2x4_ act=SINE;
connect H1x1_ H2x4_;
connect H1x2_ H2x4_;
connect H1x3_ H2x4_;
connect H1x4_ H2x4_;
connect H1x5_ H2x4_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
connect H2x4_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
connect H2x4_ H3x2_;
Hidden 2 / id = H3x3_ act=SOFTMAX;
connect H2x1_ H3x3_;
connect H2x2_ H3x3_;
connect H2x3_ H3x3_;
connect H2x4_ H3x3_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H3x3_ H4x1_;
Hidden 2 / id = H4x2_ act=SOFTMAX;
connect H3x1_ H4x2_;
connect H3x2_ H4x2_;
connect H3x3_ H4x2_;
*------------------------------------------------------------*;
* Layer #5;
;
*------------------------------------------------------------*;
Hidden 2 / id = H5x1_ act=SINE;
connect H4x1_ H5x1_;
connect H4x2_ H5x1_;
connect H5x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 6 FUNNEL LAYERS trial # 2 : SINE : ))";
prelim 16 outest=_anpre pretime=54 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 6 FUNNEL LAYERS trial # 2 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=870 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
Hidden 2 / id = H1x5_ act=LOG;
connect interval H1x5_;
connect nominal H1x5_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
connect H1x5_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
connect H1x5_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
connect H1x5_ H2x3_;
Hidden 2 / id = H2x4_ act=SINE;
connect H1x1_ H2x4_;
connect H1x2_ H2x4_;
connect H1x3_ H2x4_;
connect H1x4_ H2x4_;
connect H1x5_ H2x4_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
connect H2x4_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
connect H2x4_ H3x2_;
Hidden 2 / id = H3x3_ act=SOFTMAX;
connect H2x1_ H3x3_;
connect H2x2_ H3x3_;
connect H2x3_ H3x3_;
connect H2x4_ H3x3_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H3x3_ H4x1_;
Hidden 2 / id = H4x2_ act=SOFTMAX;
connect H3x1_ H4x2_;
connect H3x2_ H4x2_;
connect H3x3_ H4x2_;
*------------------------------------------------------------*;
* Layer #5;
;
*------------------------------------------------------------*;
Hidden 2 / id = H5x1_ act=SOFTMAX;
connect H4x1_ H5x1_;
connect H4x2_ H5x1_;
connect H5x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 6 FUNNEL LAYERS trial # 3 : SOFTMAX : ))";
prelim 16 outest=_anpre pretime=54 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 6 FUNNEL LAYERS trial # 3 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=866 maxiter=50
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 26 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 26 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural38_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Final Training))";
prelim 14 outest=_anpre pretime=61 preiter=25
tech = Default
inest = EMWS8.AutoNeural38_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Final Training))";
train estiter=1 outest=_anest outfit=_anfit maxtime=862 maxiter=5
tech = Default;
;
run;
*;
proc print data=_anfit(where=(_name_ eq 'OVERALL')) noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
*------------------------------------------------------------*;
* Extract best iteration;
;
*------------------------------------------------------------*;
%global _iter;
data _null_;
set _anfit(where=(_NAME_ eq 'OVERALL'));
retain _min 1e+64;
if _VMISC_ < _min then do;
_min = _VMISC_;
call symput('_iter',put(_ITER_, 6.));
end;
run;
*;
data EMWS8.AutoNeural38_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural38_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural38_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*------------------------------------------------------------*;
* AutoNeural Final Network;
;
*------------------------------------------------------------*;
*;
proc neural data=EM_AutoNeural38 dmdbcat=WORK.AutoNeural38_DMDB
validdata=EMWS8.Meta3_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 2 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect nominal H1x1_;
Hidden 2 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect nominal H1x2_;
Hidden 2 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect nominal H1x3_;
Hidden 2 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 2 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 2 / id = H2x2_ act=SINE;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 2 / id = H2x3_ act=SINE;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 2 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 2 / id = H3x2_ act=SOFTMAX;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 2 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
initial inest= EMWS8.AutoNeural38_ESTDS bylabel;
train tech=none;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural38\SCORECODE.sas"
group=AutoNeural38
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural38\RESIDUALSCORECODE.sas"
group=AutoNeural38
residual
;
;
score data=EMWS8.Meta3_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.AutoNeural38_OUTKEY;
score data=EMWS8.Meta3_VALIDATE out=_NULL_
outfit=WORK.FIT2
outkey=EMWS8.AutoNeural38_OUTKEY;
run;
data EMWS8.AutoNeural38_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generate Weights Plotting data set;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS8.AutoNeural38_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS8.AutoNeural38_WEIGHTS;
by _name_;
run;
data EMWS8.AutoNeural38_WEIGHTS;
set EMWS8.AutoNeural38_WEIGHTS;
FROM = ktrim(kleft(kscan(_LABEL_, 1, '-->')));
TO = ktrim(kleft(kscan(_LABEL_, 2, '>')));
WEIGHT = COL1;
if (TO eq '') or (FROM eq '') then delete;
label _LABEL_ ="%sysfunc(sasmsg(sashelp.dmine, meta_label_vlabel  , NOQUOTE))" FROM = "%sysfunc(sasmsg(sashelp.dmine, rpt_from_vlabel  , NOQUOTE))" TO = "%sysfunc(sasmsg(sashelp.dmine, rpt_into_vlabel  , NOQUOTE))" WEIGHT =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_weight_vlabel  , NOQUOTE))";
keep FROM TO WEIGHT _LABEL_;
run;
* restore printing options;
;
title10;
options linesize=95;
options pagesize=10000;
options nonumber;
options nocenter;
options nodate;
*;
