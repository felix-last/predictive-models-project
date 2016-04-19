*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Education(ASC)
   HigherEducationBinary(ASC) Marital_Status(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    AcceptedCmpTotal Age Frq Income Kidhome Mnt MntFishProducts MntFruits
   MntGoldProds MntMeatProducts MntSweetProducts MntWines MonthsAsCustomer
   NumCatalogPurchases NumDealsPurchases NumDistPurchases NumStorePurchases
   NumWebPurchases NumWebVisitsMonth RFMstat RMntFrq Recency Teenhome
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\LUKASF~1\AppData\Local\Temp\SAS Temporary Files\_TD8012_WN7LF-LEAVE_\Prc2";
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
               ACCEPTEDCMP1 ACCEPTEDCMP2 ACCEPTEDCMP3 ACCEPTEDCMP4 ACCEPTEDCMP5
              AcceptedCmpTotal AGE COMPLAIN EDUCATION FRQ HIGHEREDUCATIONBINARY INCOME
              Kidhome MARITAL_STATUS MNT MNTFISHPRODUCTS MNTFRUITS MNTGOLDPRODS
              MntMeatProducts MNTSWEETPRODUCTS MNTWINES MONTHSASCUSTOMER NUMCATALOGPURCHASES
              NumDealsPurchases NUMDISTPURCHASES NUMSTOREPURCHASES NUMWEBPURCHASES
   NumWebVisitsMonth RFMSTAT RMNTFRQ RECENCY TEENHOME
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
