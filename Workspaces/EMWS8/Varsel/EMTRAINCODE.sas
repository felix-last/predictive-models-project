*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Income Mnt NumDealsPurchases NumDistPurchases
   NumStorePurchases RFMstat RMntFrq
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD16928_WN7LF-LEAVE_\Prc2";
proc dmdb batch data=EMWS8.Part_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
DepVar
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
               ACCEPTEDCMPTOTAL AGE INCOME MNT NUMDEALSPURCHASES NUMDISTPURCHASES
   NumStorePurchases RFMSTAT RMNTFRQ
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS8.Varsel_OUTGROUP outest=EMWS8.Varsel_OUTESTDMINE outeffect=EMWS8.Varsel_OUTEFFECT outrsquare =EMWS8.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target DepVar;
code file="C:\\predictive-models-project\Workspaces\EMWS8\Varsel\EMFLOWSCORE.sas";
code file="C:\\predictive-models-project\Workspaces\EMWS8\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
proc print data =EMWS8.Varsel_OUTEFFECT;
proc print data =EMWS8.Varsel_OUTRSQUARE;
run;
