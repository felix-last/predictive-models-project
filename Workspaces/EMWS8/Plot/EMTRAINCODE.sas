*------------------------------------------------------------* ;
* Plot: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    AcceptedCmp1(ASC) AcceptedCmp2(ASC) AcceptedCmp3(ASC) AcceptedCmp4(ASC)
   AcceptedCmp5(ASC) Complain(ASC) DepVar(DESC) Dt_Customer(ASC) Education(ASC)
   Income(ASC) Kidhome(ASC) Marital_Status(ASC) MntFishProducts(ASC)
   MntFruits(ASC) MntGoldProds(ASC) MntMeatProducts(ASC) MntSweetProducts(ASC)
   MntWines(ASC) NumCatalogPurchases(ASC) NumDealsPurchases(ASC)
   NumStorePurchases(ASC) NumWebPurchases(ASC) NumWebVisitsMonth(ASC) Recency(ASC)
   Teenhome(ASC) Year_Birth(ASC)
%mend DMDBClass;
*------------------------------------------------------------*;
* Plot: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS8.FIMPORT_train
dmdbcat=WORK.Plot_DMDB
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
* Plot: Creating variable by class target charts;
*------------------------------------------------------------*;
goptions ftext="SWISS";
goptions nodisplay device=PNG;
axis1 width=2 offset=(1,1) label=(rotate=90 angle=270) minor=none;
axis2 width=2 minor=none;
pattern1 value=solid;
proc gchart
data=EMWS8.FIMPORT_train gout=WORK.PlotGRAPH;
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
title "Dt_Customer by DepVar";
vbar Dt_Customer /
name = "Dt_Customer    x DepVar         " description = "Dt_Customer by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
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
* Plot: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\AcceptedCmp2 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay ACCEPTE1;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\AcceptedCmp3 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay ACCEPTE2;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\AcceptedCmp4 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay ACCEPTE3;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\AcceptedCmp5 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay ACCEPTE4;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\AcceptedCmp1 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay ACCEPTED;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Complain by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay COMPLAIN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Dt_Customer by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay DT_CUSTO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Education by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay EDUCATIO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Income by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay INCOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Kidhome by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay KIDHOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Marital_Status by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MARITAL_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\MntFishProducts by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNTFISHP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\MntFruits by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNTFRUIT;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\MntGoldProds by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNTGOLDP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\MntMeatProducts by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNTMEATP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\MntSweetProducts by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNTSWEET;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\MntWines by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNTWINES;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\NumCatalogPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay NUMCATAL;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\NumDealsPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay NUMDEALS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\NumStorePurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay NUMSTORE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\NumWebPurchases by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay NUMWEBPU;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\NumWebVisitsMonth by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay NUMWEBVI;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Recency by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay RECENCY;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Teenhome by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay TEENHOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "C:\\predictive-models-project\Workspaces\EMWS8\Plot\GRAPH\Year_Birth by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay YEAR_BIR;
quit;
goptions device=win;
filename gsasfile;
