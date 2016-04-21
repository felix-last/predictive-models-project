*------------------------------------------------------------*;
* AutoNeural12: Create decision matrix;
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
data EM_AutoNeural12;
set EMWS8.Meta_TRAIN(keep=
AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
AcceptedCmpTotal Age Complain DepVar Education Frq HigherEducationBinary Income
Kidhome Marital_Status Mnt MntFishProducts MntFruits MntGoldProds
MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer NumCatalogPurchases
NumDealsPurchases NumDistPurchases NumStorePurchases NumWebPurchases
NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome );
run;
*------------------------------------------------------------* ;
* AutoNeural12: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* AutoNeural12: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* AutoNeural12: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_AutoNeural12
dmdbcat=WORK.AutoNeural12_DMDB
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
* AutoNeural12: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend INTINPUTS;
*------------------------------------------------------------* ;
* AutoNeural12: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5 Complain
   HigherEducationBinary
%mend BININPUTS;
*------------------------------------------------------------* ;
* AutoNeural12: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    Education Marital_Status
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* AutoNeural12: Ordinal Inputs Macro ;
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
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
%sysfunc(sasmsg(sashelp.dmine, starthistory_note , NOQUOTE));
data EMWS8.AutoNeural12_HISTORY;
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
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=LOG;
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
prelim 28 outest=_anpre pretime=32 preiter=25
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 14 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 14 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SINE;
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
prelim 28 outest=_anpre pretime=32 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 3 : SINE : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 24 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 24 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
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
prelim 28 outest=_anpre pretime=31 preiter=25
tech = Default
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 1 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 21 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 21 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
connect H1x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 28 outest=_anpre pretime=31 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 40 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 40 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=LOG;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 13 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 13 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SINE;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 3 : SINE : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 2 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 25 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 25 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H2x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 10 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 10 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=LOG;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 10 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 10 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 3 : SINE : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 23 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 23 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SOFTMAX;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 3 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 1 : DIRECT : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 1 : DIRECT : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 0 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 0 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
Hidden 7 / id = H1x4_ act=SOFTMAX;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 7 / id = H2x3_ act=SOFTMAX;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 7 / id = H3x2_ act=SINE;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 7 / id = H4x1_ act=LOG;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 2 : LOGISTIC : ))";
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 4 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 4 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
Hidden 7 / id = H1x4_ act=SOFTMAX;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 7 / id = H2x3_ act=SOFTMAX;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 7 / id = H3x2_ act=SINE;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 7 / id = H4x1_ act=SINE;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 3 : SINE : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 3 : SINE : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=824 maxiter=50
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 2 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 2 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
Hidden 7 / id = H1x4_ act=SOFTMAX;
connect interval H1x4_;
connect binary H1x4_;
connect nominal H1x4_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
connect H1x4_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
connect H1x4_ H2x2_;
Hidden 7 / id = H2x3_ act=SOFTMAX;
connect H1x1_ H2x3_;
connect H1x2_ H2x3_;
connect H1x3_ H2x3_;
connect H1x4_ H2x3_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H2x3_ H3x1_;
Hidden 7 / id = H3x2_ act=SINE;
connect H2x1_ H3x2_;
connect H2x2_ H3x2_;
connect H2x3_ H3x2_;
*------------------------------------------------------------*;
* Layer #4;
;
*------------------------------------------------------------*;
Hidden 7 / id = H4x1_ act=SOFTMAX;
connect H3x1_ H4x1_;
connect H3x2_ H4x1_;
connect H4x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Search # 4 FUNNEL LAYERS trial # 4 : SOFTMAX : ))";
train estiter=1 outest=_anest outfit=_anfit maxtime=804 maxiter=50
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 22 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 22 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
var _iter_ _aic_ _averr_ _misc_
_vaverr_ _vmisc_
;
run;
title9;
title10;
*;
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
netoptions ranscale = 1;
*;
initial
inest = EMWS8.AutoNeural12_ESTDS bylabel;
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_prelim_title  ,NOQUOTE, Final Training))";
prelim 32 outest=_anpre pretime=30 preiter=25
tech = Default
inest = EMWS8.AutoNeural12_ESTDS bylabel
;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_train_title  ,NOQUOTE, Final Training))";
train estiter=1 outest=_anest outfit=_anfit maxtime=781 maxiter=5
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
data EMWS8.AutoNeural12_ESTDS;
set _anest;
if _ITER_ eq 4 then do;
output;
stop;
end;
run;
*;
data EMWS8.AutoNeural12_OUTFIT;
set _anfit;
if _ITER_ eq 4 and _NAME_ eq "OVERALL" then do;
output;
stop;
end;
run;
*;
title9 " ";
title10 "%sysfunc(sasmsg(sashelp.dmine, rpt_selectediteration_title  , NOQUOTE, _VMISC_))";
proc print data=EMWS8.AutoNeural12_OUTFIT noobs;
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
proc neural data=EM_AutoNeural12 dmdbcat=WORK.AutoNeural12_DMDB
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
Hidden 7 / id = H1x1_ act=SOFTMAX;
connect interval H1x1_;
connect binary H1x1_;
connect nominal H1x1_;
Hidden 7 / id = H1x2_ act=SOFTMAX;
connect interval H1x2_;
connect binary H1x2_;
connect nominal H1x2_;
Hidden 7 / id = H1x3_ act=SOFTMAX;
connect interval H1x3_;
connect binary H1x3_;
connect nominal H1x3_;
*------------------------------------------------------------*;
* Layer #2;
;
*------------------------------------------------------------*;
Hidden 7 / id = H2x1_ act=SOFTMAX;
connect H1x1_ H2x1_;
connect H1x2_ H2x1_;
connect H1x3_ H2x1_;
Hidden 7 / id = H2x2_ act=SOFTMAX;
connect H1x1_ H2x2_;
connect H1x2_ H2x2_;
connect H1x3_ H2x2_;
*------------------------------------------------------------*;
* Layer #3;
;
*------------------------------------------------------------*;
Hidden 7 / id = H3x1_ act=SINE;
connect H2x1_ H3x1_;
connect H2x2_ H3x1_;
connect H3x1_ DepVar;
*;
initial inest= EMWS8.AutoNeural12_ESTDS bylabel;
train tech=none;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural12\SCORECODE.sas"
group=AutoNeural12
;
;
code file="C:\\predictive-models-project\Workspaces\EMWS8\AutoNeural12\RESIDUALSCORECODE.sas"
group=AutoNeural12
residual
;
;
score data=EMWS8.Meta_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS8.AutoNeural12_OUTKEY;
score data=EMWS8.Meta_VALIDATE out=_NULL_
outfit=WORK.FIT2
outkey=EMWS8.AutoNeural12_OUTKEY;
run;
data EMWS8.AutoNeural12_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
*------------------------------------------------------------*;
* Generate Weights Plotting data set;
*------------------------------------------------------------*;
data tempweight ( drop = _tech_ _decay_ _seed_ _nobj_ _obj_ _objerr_ _averr_ _p_num_ where= (_type_ eq "PARMS"));
set EMWS8.AutoNeural12_ESTDS;
run;
proc sort;
by _name_;
run;
proc transpose data=tempweight out=EMWS8.AutoNeural12_WEIGHTS;
by _name_;
run;
data EMWS8.AutoNeural12_WEIGHTS;
set EMWS8.AutoNeural12_WEIGHTS;
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
