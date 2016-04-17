*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) Education(ASC) HigherEducationBinary(ASC)
   Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome Year_Birth
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
    AcceptedCmp1 AcceptedCmp2 AcceptedCmp3 AcceptedCmp4 AcceptedCmp5
   AcceptedCmpTotal Age Complain Education Frq HigherEducationBinary Income
   Kidhome Marital_Status Mnt MntFishProducts MntFruits MntGoldProds
   MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer NumCatalogPurchases
   NumDealsPurchases NumDistPurchases NumStorePurchases NumWebPurchases
   NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome Year_Birth
%mend INPUTS;
proc dmneurl data=EMWS8.Part_TRAIN dmdbcat=WORK.EM_DMDB
outstat=EMWS8.PRINCOMP_OUTSTAT outclass=EMWS8.PRINCOMP_OUTCLASS
CORR
NOMONITOR
;
var %INPUTS;
;
run;
