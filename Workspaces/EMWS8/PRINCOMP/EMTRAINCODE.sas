*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Dependents(ASC) Education(ASC) Gender(ASC) Marital_Status(ASC)
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
proc dmdb batch data=EMWS8.Part_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* PRINCOMP: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
    Age Age_Exmpl2 CatPurchase Clothes Dependents Education Frq Gender
   HigherEducation HouseKeeping Income Kitchen Marital_Status Mnt MonthsAsCustomer
   NetPurchase RMntFrq RMntFrq_Exmpl2 Rcn Recomendation SmallAppliances Toys
%mend INPUTS;
proc dmneurl data=EMWS8.Part_TRAIN dmdbcat=WORK.EM_DMDB
outstat=EMWS8.PRINCOMP_OUTSTAT outclass=EMWS8.PRINCOMP_OUTCLASS
CORR
NOMONITOR
;
var %INPUTS;
;
run;
