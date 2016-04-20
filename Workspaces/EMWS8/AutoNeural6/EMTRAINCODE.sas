*------------------------------------------------------------*;
* AutoNeural6: Create decision matrix;
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
data EM_AutoNeural6;
set EMWS8.Meta_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
AcceptedCmpTotal Age Complain DepVar Education Frq HigherEducationBinary Income
Kidhome Marital_Status Mnt MntFishProducts MntFruits MntGoldProds
MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer NumCatalogPurchases
NumDealsPurchases NumDistPurchases NumStorePurchases NumWebPurchases
NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome );
run;
*------------------------------------------------------------* ;
* AutoNeural6: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural6: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* AutoNeural6: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_AutoNeural6
dmdbcat=WORK.AutoNeural6_DMDB
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
* AutoNeural6: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* AutoNeural6: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
   HigherEducationBinary
%mend BININPUTS;
*------------------------------------------------------------* ;
* AutoNeural6: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Education Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* AutoNeural6: Ordinal Inputs Macro ;
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
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS8.AutoNeural6_HISTORY;
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
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=TANH;
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
prelim 6 outest=_anpre pretime=149 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 2 : TANH : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
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
prelim 6 outest=_anpre pretime=149 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 3 : NORMAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=EXP;
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
prelim 6 outest=_anpre pretime=149 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=IDE;
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
prelim 6 outest=_anpre pretime=149 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 5 : IDENTITY : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=896 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=LOG;
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
prelim 6 outest=_anpre pretime=149 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 6 : LOGISTIC : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=REC;
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
prelim 6 outest=_anpre pretime=149 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=SINE;
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
prelim 6 outest=_anpre pretime=148 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 8 : SINE : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=SQUARE;
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
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 9 : SQUARE : ))";
prelim 6 outest=_anpre pretime=148 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 SINGLE LAYER trial # 9 : SQUARE : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 6 outest=_anpre pretime=148 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=TANH;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : TANH : ))";
prelim 6 outest=_anpre pretime=148 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 2 : TANH : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 9 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 9 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=GAUSS;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 6 outest=_anpre pretime=148 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 3 : NORMAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=EXP;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 6 outest=_anpre pretime=147 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 48 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 48 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=IDE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 6 outest=_anpre pretime=147 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 5 : IDENTITY : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=LOG;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 6 outest=_anpre pretime=146 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 6 : LOGISTIC : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=REC;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 6 outest=_anpre pretime=146 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=879 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SINE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 8 : SINE : ))";
prelim 6 outest=_anpre pretime=146 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 8 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=877 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 9 : SQUARE : ))";
prelim 6 outest=_anpre pretime=145 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 SINGLE LAYER trial # 9 : SQUARE : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 8 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 8 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 6 outest=_anpre pretime=145 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 9 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 9 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=TANH;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 2 : TANH : ))";
prelim 6 outest=_anpre pretime=145 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 2 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=871 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 16 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 16 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=GAUSS;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 6 outest=_anpre pretime=145 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 3 : NORMAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 7 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 7 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=EXP;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 6 outest=_anpre pretime=144 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 12 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 12 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=IDE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 6 outest=_anpre pretime=144 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 5 : IDENTITY : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=868 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 9 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 9 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=LOG;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 6 outest=_anpre pretime=144 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 6 : LOGISTIC : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 3 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 3 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=REC;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 6 outest=_anpre pretime=144 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SINE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 8 : SINE : ))";
prelim 6 outest=_anpre pretime=144 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 8 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=864 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 15 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 15 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 9 : SQUARE : ))";
prelim 6 outest=_anpre pretime=143 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 SINGLE LAYER trial # 9 : SQUARE : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 39 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 39 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 1 : DIRECT : ))";
prelim 6 outest=_anpre pretime=143 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 1 : DIRECT : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=862 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 24 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 24 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=TANH;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 2 : TANH : ))";
prelim 6 outest=_anpre pretime=143 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 2 : TANH : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=862 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 32 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 32 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=GAUSS;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 3 : NORMAL : ))";
prelim 6 outest=_anpre pretime=143 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 3 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=861 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 48 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 48 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=EXP;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
prelim 6 outest=_anpre pretime=143 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 4 : EXPONENTIAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=859 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=IDE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 5 : IDENTITY : ))";
prelim 6 outest=_anpre pretime=143 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 5 : IDENTITY : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=858 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 6 : LOGISTIC : ))";
prelim 6 outest=_anpre pretime=142 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 6 : LOGISTIC : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=857 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 28 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 28 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=REC;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
prelim 6 outest=_anpre pretime=142 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 7 : RECIPROCAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=856 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 17 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 17 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=SINE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 8 : SINE : ))";
prelim 6 outest=_anpre pretime=142 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 8 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=854 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=SQUARE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 9 : SQUARE : ))";
prelim 6 outest=_anpre pretime=142 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 SINGLE LAYER trial # 9 : SQUARE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=853 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 5 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 5 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=TANH;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 1 : TANH : ))";
prelim 6 outest=_anpre pretime=142 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 1 : TANH : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 25 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 25 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=GAUSS;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 2 : NORMAL : ))";
prelim 6 outest=_anpre pretime=141 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 2 : NORMAL : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=850 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 25 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 25 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=EXP;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 3 : EXPONENTIAL : ))";
prelim 6 outest=_anpre pretime=141 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 3 : EXPONENTIAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 1 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 1 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=IDE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 4 : IDENTITY : ))";
prelim 6 outest=_anpre pretime=141 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 4 : IDENTITY : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 24 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 24 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=LOG;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 5 : LOGISTIC : ))";
prelim 6 outest=_anpre pretime=141 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 5 : LOGISTIC : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 40 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 40 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=REC;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 6 : RECIPROCAL : ))";
prelim 6 outest=_anpre pretime=141 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 6 : RECIPROCAL : ))";
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 4 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 4 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=SINE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 7 : SINE : ))";
prelim 6 outest=_anpre pretime=140 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 7 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=844 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 17 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 17 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
Hidden 1 / id = H1x4_ act=SQUARE;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
connect H1x4_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 8 : SQUARE : ))";
prelim 6 outest=_anpre pretime=140 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 5 SINGLE LAYER trial # 8 : SQUARE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=843 maxiter=50
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 13 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 13 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural6_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Final Training))";
prelim 6 outest=_anpre pretime=140 preiter=25
tech = Default
inest = EMWS8.AutoNeural6_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Final Training))";
train estiter=1 outest=_anest outfit=_anfit maxtime=842 maxiter=5
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
data EMWS8.AutoNeural6_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural6_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural6_OUTFIT noobs;
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
proc neural data=EM_AutoNeural6 dmdbcat=WORK.AutoNeural6_DMDB
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
Hidden 1 / id = H1x1_ act=GAUSS;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
Hidden 1 / id = H1x2_ act=SQUARE;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
connect H1x2_ DepVar;
Hidden 1 / id = H1x3_ act=SQUARE;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
connect H1x3_ DepVar;
*;
initial inest= EMWS8.AutoNeural6_ESTDS bylabel;
train tech=none;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural6\SCORECODE.sas"
group=AutoNeural6
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural6\RESIDUALSCORECODE.sas"
group=AutoNeural6
residual
;
;
score data=EMWS8.Meta_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.AutoNeural6_OUTKEY;
score data=EMWS8.Meta_VALIDATE out=_NULL_
outfit=WORK.FIT2
outkey=EMWS8.AutoNeural6_OUTKEY;
run;
data EMWS8.AutoNeural6_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generate Weights Plotting data set;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS8.AutoNeural6_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS8.AutoNeural6_WEIGHTS;
by _name_;
run;
data EMWS8.AutoNeural6_WEIGHTS;
set EMWS8.AutoNeural6_WEIGHTS;
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
