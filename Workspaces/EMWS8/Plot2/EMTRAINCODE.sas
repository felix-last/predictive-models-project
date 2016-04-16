*------------------------------------------------------------* ;
* Plot2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) AcceptedCmpTotal(ASC) Age(ASC) Complain(ASC) DepVar(DESC)
   Education(ASC) Frq(ASC) HigherEducationBinary(ASC) Income(ASC) Kidhome(ASC)
   Marital_Status(ASC) Mnt(ASC) MntFishProducts(ASC) MntFruits(ASC)
   MntGoldProds(ASC) MntMeatProducts(ASC) MntSweetProducts(ASC) MntWines(ASC)
   MonthsAsCustomer(ASC) NumCatalogPurchases(ASC) NumDealsPurchases(ASC)
   NumDistPurchases(ASC) NumStorePurchases(ASC) NumWebPurchases(ASC)
   NumWebVisitsMonth(ASC) RFMstat(ASC) RMntFrq(ASC) Recency(ASC) Teenhome(ASC)
   Year_Birth(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS8.Part_TRAIN
dmdbcat=WORK.Plot2_DMDB
maxlevel = 23
nonorm
;
class %DMDBClass;
target
DepVar
;
run;
quit;
*------------------------------------------------------------*;
* Plot2: Creating variable by class target charts;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG;
axis1 width=2 offset=(1,1) label=(rotate=90 angle=270) minor=none;
axis2 width=2 minor=none;
pattern1 value=solid;
proc gchart
data=EMWS8.Part_TRAIN gout=WORK.Plot2GRAPH;
*;
title "AcceptedCmp1 by DepVar";
vbar AcceptedCmp1 /
name = "AcceptedCmp1   x DepVar         " description = "AcceptedCmp1 by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "AcceptedCmp2 by DepVar";
vbar AcceptedCmp2 /
name = "AcceptedCmp2   x DepVar         " description = "AcceptedCmp2 by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "AcceptedCmp3 by DepVar";
vbar AcceptedCmp3 /
name = "AcceptedCmp3   x DepVar         " description = "AcceptedCmp3 by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "AcceptedCmp4 by DepVar";
vbar AcceptedCmp4 /
name = "AcceptedCmp4   x DepVar         " description = "AcceptedCmp4 by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "AcceptedCmp5 by DepVar";
vbar AcceptedCmp5 /
name = "AcceptedCmp5   x DepVar         " description = "AcceptedCmp5 by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "AcceptedCmpTotal by DepVar";
vbar AcceptedCmpTotal /
name = "AcceptedCmpTotax DepVar         " description = "AcceptedCmpTotal by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "Age by DepVar";
vbar Age /
name = "Age            x DepVar         " description = "Age by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Complain by DepVar";
vbar Complain /
name = "Complain       x DepVar         " description = "Complain by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "Education by DepVar";
vbar Education /
name = "Education      x DepVar         " description = "Education by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Frq by DepVar";
vbar Frq /
name = "Frq            x DepVar         " description = "Frq by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "HigherEducationBinary by DepVar";
vbar HigherEducationBinary /
name = "HigherEducationx DepVar         " description = "HigherEducationBinary by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "Income by DepVar";
vbar Income /
name = "Income         x DepVar         " description = "Income by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Kidhome by DepVar";
vbar Kidhome /
name = "Kidhome        x DepVar         " description = "Kidhome by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "Marital_Status by DepVar";
vbar Marital_Status /
name = "Marital_Status x DepVar         " description = "Marital_Status by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Mnt by DepVar";
vbar Mnt /
name = "Mnt            x DepVar         " description = "Mnt by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MntFishProducts by DepVar";
vbar MntFishProducts /
name = "MntFishProductsx DepVar         " description = "MntFishProducts by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MntFruits by DepVar";
vbar MntFruits /
name = "MntFruits      x DepVar         " description = "MntFruits by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MntGoldProds by DepVar";
vbar MntGoldProds /
name = "MntGoldProds   x DepVar         " description = "MntGoldProds by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MntMeatProducts by DepVar";
vbar MntMeatProducts /
name = "MntMeatProductsx DepVar         " description = "MntMeatProducts by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MntSweetProducts by DepVar";
vbar MntSweetProducts /
name = "MntSweetProductx DepVar         " description = "MntSweetProducts by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MntWines by DepVar";
vbar MntWines /
name = "MntWines       x DepVar         " description = "MntWines by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "MonthsAsCustomer by DepVar";
vbar MonthsAsCustomer /
name = "MonthsAsCustomex DepVar         " description = "MonthsAsCustomer by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "NumCatalogPurchases by DepVar";
vbar NumCatalogPurchases /
name = "NumCatalogPurchx DepVar         " description = "NumCatalogPurchases by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "NumDealsPurchases by DepVar";
vbar NumDealsPurchases /
name = "NumDealsPurchasx DepVar         " description = "NumDealsPurchases by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "NumDistPurchases by DepVar";
vbar NumDistPurchases /
name = "NumDistPurchasex DepVar         " description = "NumDistPurchases by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "NumStorePurchases by DepVar";
vbar NumStorePurchases /
name = "NumStorePurchasx DepVar         " description = "NumStorePurchases by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "NumWebPurchases by DepVar";
vbar NumWebPurchases /
name = "NumWebPurchasesx DepVar         " description = "NumWebPurchases by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "NumWebVisitsMonth by DepVar";
vbar NumWebVisitsMonth /
name = "NumWebVisitsMonx DepVar         " description = "NumWebVisitsMonth by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "RFMstat by DepVar";
vbar RFMstat /
name = "RFMstat        x DepVar         " description = "RFMstat by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "RMntFrq by DepVar";
vbar RMntFrq /
name = "RMntFrq        x DepVar         " description = "RMntFrq by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Recency by DepVar";
vbar Recency /
name = "Recency        x DepVar         " description = "Recency by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Teenhome by DepVar";
vbar Teenhome /
name = "Teenhome       x DepVar         " description = "Teenhome by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "Year_Birth by DepVar";
vbar Year_Birth /
name = "Year_Birth     x DepVar         " description = "Year_Birth by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
quit;
title;
goptions display;
*------------------------------------------------------------*;
* Plot2: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\AcceptedCmp2 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay ACCEPTE1;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\AcceptedCmp3 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay ACCEPTE2;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\AcceptedCmp4 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay ACCEPTE3;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\AcceptedCmp5 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay ACCEPTE4;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\AcceptedCmpTotal by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay ACCEPTE5;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\AcceptedCmp1 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay ACCEPTED;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Age by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay AGE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Complain by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay COMPLAIN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Education by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay EDUCATIO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Frq by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay FRQ;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\HigherEducationBinary by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay HIGHERED;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Income by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay INCOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Kidhome by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay KIDHOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Marital_Status by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MARITAL_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Mnt by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNT;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MntFishProducts by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNTFISHP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MntFruits by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNTFRUIT;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MntGoldProds by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNTGOLDP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MntMeatProducts by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNTMEATP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MntSweetProducts by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNTSWEET;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MntWines by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNTWINES;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\MonthsAsCustomer by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MONTHSAS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\NumCatalogPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NUMCATAL;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\NumDealsPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NUMDEALS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\NumDistPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NUMDISTP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\NumStorePurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NUMSTORE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\NumWebPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NUMWEBPU;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\NumWebVisitsMonth by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NUMWEBVI;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Recency by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RECENCY;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\RFMstat by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RFMSTAT;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\RMntFrq by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RMNTFRQ;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Teenhome by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay TEENHOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot2\GRAPH\Year_Birth by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay YEAR_BIR;
quit;
goptions device=win;
filename gsasfile;
