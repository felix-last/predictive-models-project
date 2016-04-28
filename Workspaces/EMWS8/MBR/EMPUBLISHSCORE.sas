*------------------------------------------------------------*;
* MBR: Create decision matrix;
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
%macro EM_MBR;
%let _MBRTRAIN = EMSCORE.EM_TRAIN_MBR;
%if %symexist(em_train) %then %do;
%let _MBRTRAIN = EMWS8.PRINCOMP_TRAIN;
%end;
*------------------------------------------------------------* ;
* MBR: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* MBR: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    PC_1 PC_10 PC_11 PC_12 PC_13 PC_14 PC_15 PC_16 PC_17 PC_2 PC_3 PC_4 PC_5 PC_6
   PC_7 PC_8 PC_9 Year_Birth
%mend DMDBVar;
*------------------------------------------------------------*;
* MBR: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=&_MBRTRAIN
dmdbcat=WORK.MBR_DMDB
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
* MBR: Interval Variables Macro ;
*------------------------------------------------------------* ;
%macro pmbrvar;
    PC_1 PC_10 PC_11 PC_12 PC_13 PC_14 PC_15 PC_16 PC_17 PC_2 PC_3 PC_4 PC_5 PC_6
   PC_7 PC_8 PC_9 Year_Birth
%mend pmbrvar;
%let _vvnoption = %sysfunc(getoption(VALIDVARNAME));
%if &_vvnoption = ANY and ^%symexist(em_train) %then %do;
data em_MBR;
set &em_score_output;
run;
data &em_score_output;
set &em_score_output;
keep %pmbrvar;
run;
%end;
options validvarname=V7;
%if ^%symexist(em_train) %then %do;
proc pmbr data=&_MBRTRAIN dmdbcat=WORK.MBR_DMDB %end;
%else %do;
proc pmbr data=EMWS8.PRINCOMP_TRAIN dmdbcat=WORK.MBR_DMDB %end;
k = 20
epsilon = 0
buckets = 1000
method = RDTREE
weighted
;
var %pmbrvar;
target DepVar;
score data=&em_score_output out=&em_score_output role=score;
;
run;
quit;
options validvarname=&_vvnoption;
%if &_vvnoption = ANY and ^%symexist(em_train) %then %do;
data &em_score_output;
merge em_MBR &em_score_output;
run;
proc delete data=em_MBR;
run;
%end;
%mend EM_MBR;
%EM_MBR;
