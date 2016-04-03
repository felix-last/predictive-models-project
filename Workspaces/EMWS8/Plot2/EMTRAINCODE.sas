*------------------------------------------------------------* ;
* Plot2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Age(ASC) Age_Exmpl2(ASC) CatPurchase(ASC) Clothes(ASC) DepVar(DESC)
   Dependents(ASC) Education(ASC) Frq(ASC) Gender(ASC) HigherEducation(ASC)
   HouseKeeping(ASC) Income(ASC) Kitchen(ASC) Marital_Status(ASC) Mnt(ASC)
   MonthsAsCustomer(ASC) NetPurchase(ASC) RMntFrq(ASC) RMntFrq_Exmpl2(ASC)
   Rcn(ASC) Recomendation(ASC) SmallAppliances(ASC) Toys(ASC)
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
title "Age_Exmpl2 by DepVar";
vbar Age_Exmpl2 /
name = "Age_Exmpl2     x DepVar         " description = "Age_Exmpl2 by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
raxis=axis1 maxis=axis2;
run;
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
title "HigherEducation by DepVar";
vbar HigherEducation /
name = "HigherEducationx DepVar         " description = "HigherEducation by DepVar"
PERCENT
type=PERCENT
subgroup=DepVar
noframe
missing
discrete
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
title "RMntFrq_Exmpl2 by DepVar";
vbar RMntFrq_Exmpl2 /
name = "RMntFrq_Exmpl2 x DepVar         " description = "RMntFrq_Exmpl2 by DepVar"
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
quit;
title;
goptions display;
*------------------------------------------------------------*;
* Plot2: Copying graphs to node folder;
*------------------------------------------------------------*;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Age by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay AGE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Age_Exmpl2 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay AGE_EXMP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\CatPurchase by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay CATPURCH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Clothes by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay CLOTHES;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Dependents by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay DEPENDEN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Education by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay EDUCATIO;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Frq by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay FRQ;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Gender by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay GENDER;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\HigherEducation by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay HIGHERED;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\HouseKeeping by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay HOUSEKEE;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Income by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay INCOME;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Kitchen by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay KITCHEN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Marital_Status by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MARITAL_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Mnt by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MNT;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\MonthsAsCustomer by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay MONTHSAS;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\NetPurchase by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay NETPURCH;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Rcn by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RCN;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Recomendation by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RECOMEND;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\RMntFrq by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RMNTFRQ;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\RMntFrq_Exmpl2 by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay RMNTFRQ_;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\SmallAppliances by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay SMALLAPP;
quit;
goptions device=win;
filename gsasfile;
filename gsasfile "E:\DataMining_EMProjects\Tugas\Workspaces\EMWS8\Plot2\GRAPH\Toys by DepVar.gif";
goptions device= GIF display gaccess= gsasfile gsfmode= replace cback= white;
proc greplay igout=WORK.PLOT2GRAPH nofs;
replay TOYS;
quit;
goptions device=win;
filename gsasfile;
