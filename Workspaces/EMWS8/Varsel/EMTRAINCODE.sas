*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    DepVar(DESC) Dependents(ASC) Education(ASC) Gender(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age Age_Exmpl2 CatPurchase Clothes Frq HigherEducation HouseKeeping Income
   Kitchen Mnt MonthsAsCustomer NetPurchase RMntFrq RMntFrq_Exmpl2 Rcn
   Recomendation SmallAppliances Toys
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\VM-SAS\AppData\Local\Temp\SAS Temporary Files\_TD1700_VM-SAS-PC_\Prc2";
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
               AGE AGE_EXMPL2 CATPURCHASE CLOTHES DEPENDENTS EDUCATION FRQ GENDER
              HigherEducation HOUSEKEEPING INCOME KITCHEN MARITAL_STATUS MNT MONTHSASCUSTOMER
   NetPurchase RMNTFRQ RMNTFRQ_EXMPL2 RCN RECOMENDATION SMALLAPPLIANCES TOYS
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS8.Varsel_OUTGROUP outest=EMWS8.Varsel_OUTESTDMINE outeffect=EMWS8.Varsel_OUTEFFECT outrsquare =EMWS8.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target DepVar;
code file="E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Varsel\EMFLOWSCORE.sas";
code file="E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
proc print data =EMWS8.Varsel_OUTEFFECT;
proc print data =EMWS8.Varsel_OUTRSQUARE;
run;
