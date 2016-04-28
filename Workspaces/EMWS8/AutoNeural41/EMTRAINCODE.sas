*------------------------------------------------------------*;
* AutoNeural41: Create decision matrix;
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
data EM_AutoNeural41;
set EMWS8.Meta2_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
DepVar Education Income Kidhome Marital_Status MntFishProducts MntFruits
MntGoldProds MntMeatProducts MntSweetProducts MntWines NumCatalogPurchases
NumDealsPurchases NumStorePurchases NumWebPurchases NumWebVisitsMonth Recency
Teenhome );
run;
*------------------------------------------------------------* ;
* AutoNeural41: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural41: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Income Kidhome MntFishProducts MntFruits MntGoldProds MntMeatProducts
   MntSweetProducts MntWines NumCatalogPurchases NumDealsPurchases
   NumStorePurchases NumWebPurchases NumWebVisitsMonth Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* AutoNeural41: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_AutoNeural41
dmdbcat=WORK.AutoNeural41_DMDB
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
* AutoNeural41: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    Income Kidhome MntFishProducts MntFruits MntGoldProds MntMeatProducts
   MntSweetProducts MntWines NumCatalogPurchases NumDealsPurchases
   NumStorePurchases NumWebPurchases NumWebVisitsMonth Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* AutoNeural41: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
%mend BININPUTS;
*------------------------------------------------------------* ;
* AutoNeural41: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Education Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* AutoNeural41: Ordinal Inputs Macro ;
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
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect binary DepVar;
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 6 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 6 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS8.AutoNeural41_HISTORY;
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
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect binary H1x1_;
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
prelim 20 outest=_anpre pretime=45 preiter=25
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 4 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 4 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SINE;
connect interval H1x1_;
connect binary H1x1_;
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
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 3 : SINE : ))";
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 45 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 45 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
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
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Direct connection;
;
*------------------------------------------------------------*;
connect interval DepVar;
connect binary DepVar;
connect nominal DepVar;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural41_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
inest = EMWS8.AutoNeural41_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 26 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 26 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 5 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 5 / id = H2x1_ act=LOG;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural41_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 25 outest=_anpre pretime=35 preiter=25
tech = Default
inest = EMWS8.AutoNeural41_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 26 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 26 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 5 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 5 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural41_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 25 outest=_anpre pretime=35 preiter=25
tech = Default
inest = EMWS8.AutoNeural41_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=887 maxiter=50
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 3 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 3 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 5 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 5 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural41_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 25 outest=_anpre pretime=35 preiter=25
tech = Default
inest = EMWS8.AutoNeural41_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=882 maxiter=50
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 27 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 27 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural41_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Final Training))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
inest = EMWS8.AutoNeural41_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Final Training))";
train estiter=1 outest=_anest outfit=_anfit maxtime=878 maxiter=5
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
data EMWS8.AutoNeural41_ESTDS;
set _anest;
if _ITER_ eq 4 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural41_OUTFIT;
set _anfit;
if _ITER_ eq 4 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural41_OUTFIT noobs;
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
proc neural data=EM_AutoNeural41 dmdbcat=WORK.AutoNeural41_DMDB
validdata=EMWS8.Meta2_VALIDATE
;
*;
nloptions noprint;
performance alldetails noutilfile;
input %INTINPUTS / level=interval id=interval;
input %BININPUTS / level=nominal id=binary;
input %NOMINPUTS / level=nominal id=nominal;
target DepVar / level=NOMINAL id=DepVar
;
*------------------------------------------------------------*;
* Layer #1;
;
*------------------------------------------------------------*;
Hidden 5 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
initial inest= EMWS8.AutoNeural41_ESTDS bylabel;
train tech=none;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural41\SCORECODE.sas"
group=AutoNeural41
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural41\RESIDUALSCORECODE.sas"
group=AutoNeural41
residual
;
;
score data=EMWS8.Meta2_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.AutoNeural41_OUTKEY;
score data=EMWS8.Meta2_VALIDATE out=_NULL_
outfit=WORK.FIT2
outkey=EMWS8.AutoNeural41_OUTKEY;
run;
data EMWS8.AutoNeural41_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generate Weights Plotting data set;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS8.AutoNeural41_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS8.AutoNeural41_WEIGHTS;
by _name_;
run;
data EMWS8.AutoNeural41_WEIGHTS;
set EMWS8.AutoNeural41_WEIGHTS;
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
