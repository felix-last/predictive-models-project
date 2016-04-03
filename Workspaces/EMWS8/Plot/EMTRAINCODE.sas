*------------------------------------------------------------* ;
* Plot: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    CatPurchase(ASC) Clothes(ASC) DepVar(DESC) Dependents(ASC) Dt_Customer(ASC)
   Education(ASC) Frq(ASC) Gender(ASC) HouseKeeping(ASC) Income(ASC) Kitchen(ASC)
   Marital_Status(ASC) Mnt(ASC) NetPurchase(ASC) Rcn(ASC) Recomendation(ASC)
   SmallAppliances(ASC) Toys(ASC) Year_Birth(ASC)
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
title "CatPurchase by DepVar";
vbar CatPurchase /
name = "CatPurchase    x DepVar         " description = "CatPurchase by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Clothes by DepVar";
vbar Clothes /
name = "Clothes        x DepVar         " description = "Clothes by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Dependents by DepVar";
vbar Dependents /
name = "Dependents     x DepVar         " description = "Dependents by DepVar"
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
title "Gender by DepVar";
vbar Gender /
name = "Gender         x DepVar         " description = "Gender by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "HouseKeeping by DepVar";
vbar HouseKeeping /
name = "HouseKeeping   x DepVar         " description = "HouseKeeping by DepVar"
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
title "Kitchen by DepVar";
vbar Kitchen /
name = "Kitchen        x DepVar         " description = "Kitchen by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
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
title "NetPurchase by DepVar";
vbar NetPurchase /
name = "NetPurchase    x DepVar         " description = "NetPurchase by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Rcn by DepVar";
vbar Rcn /
name = "Rcn            x DepVar         " description = "Rcn by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Recomendation by DepVar";
vbar Recomendation /
name = "Recomendation  x DepVar         " description = "Recomendation by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
raxis=axis1 maxis=axis2;
run;
title "SmallAppliances by DepVar";
vbar SmallAppliances /
name = "SmallAppliancesx DepVar         " description = "SmallAppliances by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
title "Toys by DepVar";
vbar Toys /
name = "Toys           x DepVar         " description = "Toys by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
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
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\CatPurchase by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay CATPURCH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Clothes by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay CLOTHES;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Dependents by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay DEPENDEN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Dt_Customer by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay DT_CUSTO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Education by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay EDUCATIO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Frq by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay FRQ;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Gender by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay GENDER;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\HouseKeeping by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay HOUSEKEE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Income by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay INCOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Kitchen by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay KITCHEN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Marital_Status by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MARITAL_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Mnt by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay MNT;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\NetPurchase by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay NETPURCH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Rcn by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay RCN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Recomendation by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay RECOMEND;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\SmallAppliances by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay SMALLAPP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Toys by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay TOYS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot\GRAPH\Year_Birth by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOTGRAPH nofs;
replay YEAR_BIR;
quit;
goptions device=win;
filename gsasfile;
