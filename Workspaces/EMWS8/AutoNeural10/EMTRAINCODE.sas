*------------------------------------------------------------*;
* AutoNeural10: Create decision matrix;
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
data EM_AutoNeural10;
set EMWS8.Meta_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
AcceptedCmpTotal Age Complain DepVar Education Frq HigherEducationBinary Income
Kidhome Marital_Status Mnt MntFishProducts MntFruits MntGoldProds
MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer NumCatalogPurchases
NumDealsPurchases NumDistPurchases NumStorePurchases NumWebPurchases
NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome );
run;
*------------------------------------------------------------* ;
* AutoNeural10: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural10: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* AutoNeural10: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_AutoNeural10
dmdbcat=WORK.AutoNeural10_DMDB
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
* AutoNeural10: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* AutoNeural10: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
   HigherEducationBinary
%mend BININPUTS;
*------------------------------------------------------------* ;
* AutoNeural10: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Education Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* AutoNeural10: Ordinal Inputs Macro ;
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
* Autoneural: search / SINGLE LAYER;
;
*------------------------------------------------------------*;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS8.AutoNeural10_HISTORY;
length _func_ _status_ _step_ $16;
label _func_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_function_vlabel  , NOQUOTE))";
label _status_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_status_vlabel  , NOQUOTE))";
label _iter_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_iteration_vlabel  , NOQUOTE))";
label _step_ = "%sysfunc(sasmsg(sashelp.dmine, rpt_step_vlabel  , NOQUOTE))";
_func_ = '';
_status_ = '';
_step_ = 'SINGLE LAYER 1';
set
_anfit(where=(_name_ eq 'OVERALL' and _iter_ eq 0))
;
run;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=TANH;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 2 : TANH : ))";
prelim 20 outest=_anpre pretime=45 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 2 : TANH : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 4 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 4 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=GAUSS;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 3 : NORMAL : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 44 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 44 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=EXP;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 5 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 5 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=IDE;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 5 : IDENTITY : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 6 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=889 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 26 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 26 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=REC;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 20 outest=_anpre pretime=44 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=886 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 42 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 42 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 8 : SINE : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 8 : SINE : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 17 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 17 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 9 : SOFTMAX : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 9 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=872 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 50 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 50 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=SQUARE;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 10 : SQUARE : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 10 : SQUARE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=869 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 24 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 24 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=867 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 28 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 28 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=TANH;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : TANH : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : TANH : ))";
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 22 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 22 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=GAUSS;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=863 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 23 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 23 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=EXP;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 20 outest=_anpre pretime=43 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=860 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 31 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 31 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 5 : IDENTITY : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=852 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 20 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 20 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 6 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=849 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 10 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 10 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=REC;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=848 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=SINE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 8 : SINE : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 8 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=848 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 9 : SOFTMAX : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 9 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=847 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 11 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 11 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 10 : SQUARE : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 10 : SQUARE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=847 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 11 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 11 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=846 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 21 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 21 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=TANH;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 2 : TANH : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 2 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=845 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 7 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 7 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=GAUSS;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 20 outest=_anpre pretime=42 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 3 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=840 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=EXP;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 20 outest=_anpre pretime=41 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=835 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=IDE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 20 outest=_anpre pretime=41 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 5 : IDENTITY : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=822 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 20 outest=_anpre pretime=40 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 6 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=817 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=REC;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 20 outest=_anpre pretime=40 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=811 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SINE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 8 : SINE : ))";
prelim 20 outest=_anpre pretime=38 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 8 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=776 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 22 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 22 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 9 : SOFTMAX : ))";
prelim 20 outest=_anpre pretime=38 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 9 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=770 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 10 : SQUARE : ))";
prelim 20 outest=_anpre pretime=38 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 10 : SQUARE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=770 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 49 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 49 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x1_ act=LOG;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 20 outest=_anpre pretime=38 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=769 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 15 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 15 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=TANH;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 2 : TANH : ))";
prelim 20 outest=_anpre pretime=38 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 2 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=767 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 48 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 48 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=GAUSS;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 20 outest=_anpre pretime=38 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 3 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=762 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 5 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 5 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=EXP;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 20 outest=_anpre pretime=37 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=756 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=IDE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 20 outest=_anpre pretime=37 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 5 : IDENTITY : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=744 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 20 outest=_anpre pretime=36 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 6 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=739 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=REC;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 20 outest=_anpre pretime=36 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=734 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=SINE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 8 : SINE : ))";
prelim 20 outest=_anpre pretime=34 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 8 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=695 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 5 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 5 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=SOFTMAX;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 9 : SOFTMAX : ))";
prelim 20 outest=_anpre pretime=34 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 9 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=690 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 6 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 6 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 5 / id = H1x4_ act=SQUARE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 10 : SQUARE : ))";
prelim 20 outest=_anpre pretime=34 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 10 : SQUARE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=685 maxiter=50
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 32 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 32 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural10_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Final Training))";
prelim 20 outest=_anpre pretime=34 preiter=25
tech = Default
inest = EMWS8.AutoNeural10_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Final Training))";
train estiter=1 outest=_anest outfit=_anfit maxtime=681 maxiter=5
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
data EMWS8.AutoNeural10_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural10_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural10_OUTFIT noobs;
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
proc neural data=EM_AutoNeural10 dmdbcat=WORK.AutoNeural10_DMDB
validdata=EMWS8.Meta_VALIDATE
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
Hidden 5 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 5 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
initial inest= EMWS8.AutoNeural10_ESTDS bylabel;
train tech=none;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural10\SCORECODE.sas"
group=AutoNeural10
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural10\RESIDUALSCORECODE.sas"
group=AutoNeural10
residual
;
;
score data=EMWS8.Meta_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.AutoNeural10_OUTKEY;
score data=EMWS8.Meta_VALIDATE out=_NULL_
outfit=WORK.FIT2
outkey=EMWS8.AutoNeural10_OUTKEY;
run;
data EMWS8.AutoNeural10_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generate Weights Plotting data set;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS8.AutoNeural10_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS8.AutoNeural10_WEIGHTS;
by _name_;
run;
data EMWS8.AutoNeural10_WEIGHTS;
set EMWS8.AutoNeural10_WEIGHTS;
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
