data EMWS8.MdlComp_EMRANK;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural8" MODEL "Neural8" MODELDESCRIPTION "Neural Binning" TARGETLABEL "DepVar";
set EMWS8.Neural8_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural8" MODEL "Neural8" MODELDESCRIPTION "Neural Binning" TARGETLABEL "DepVar";
set EMWS8.Neural8_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural8" MODEL "Neural8" MODELDESCRIPTION "Neural Binning" TARGETLABEL "DepVar";
set WORK.Neural8_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural8" MODEL "Neural8" MODELDESCRIPTION "Neural Binning" TARGETLABEL "DepVar";
set EMWS8.Neural8_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGETLABEL =
   "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural8" MODEL "Neural8" MODELDESCRIPTION "Neural Binning" TARGETLABEL "DepVar";
set EMWS8.Neural8_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural5" MODEL "Neural5" MODELDESCRIPTION "Neural PrinComp" TARGETLABEL "DepVar";
set EMWS8.Neural5_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural5" MODEL "Neural5" MODELDESCRIPTION "Neural PrinComp" TARGETLABEL "DepVar";
set EMWS8.Neural5_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural5" MODEL "Neural5" MODELDESCRIPTION "Neural PrinComp" TARGETLABEL "DepVar";
set WORK.Neural5_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural5" MODEL "Neural5" MODELDESCRIPTION "Neural PrinComp" TARGETLABEL "DepVar";
set EMWS8.Neural5_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural5" MODEL "Neural5" MODELDESCRIPTION "Neural PrinComp" TARGETLABEL "DepVar";
set EMWS8.Neural5_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural6" MODEL "Neural6" MODELDESCRIPTION "Neural Variable Selection" TARGETLABEL "DepVar";
set EMWS8.Neural6_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural6" MODEL "Neural6" MODELDESCRIPTION "Neural Variable Selection" TARGETLABEL "DepVar";
set EMWS8.Neural6_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural6" MODEL "Neural6" MODELDESCRIPTION "Neural Variable Selection" TARGETLABEL "DepVar";
set WORK.Neural6_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural6" MODEL "Neural6" MODELDESCRIPTION "Neural Variable Selection" TARGETLABEL "DepVar";
set EMWS8.Neural6_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural6" MODEL "Neural6" MODELDESCRIPTION "Neural Variable Selection" TARGETLABEL "DepVar";
set EMWS8.Neural6_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg" MODEL "Reg" MODELDESCRIPTION "Regression" TARGETLABEL "DepVar";
set EMWS8.Reg_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg" MODEL "Reg" MODELDESCRIPTION "Regression" TARGETLABEL "DepVar";
set EMWS8.Reg_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg" MODEL "Reg" MODELDESCRIPTION "Regression" TARGETLABEL "DepVar";
set WORK.Reg_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg" MODEL "Reg" MODELDESCRIPTION "Regression" TARGETLABEL "DepVar";
set EMWS8.Reg_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Reg" MODEL "Reg" MODELDESCRIPTION "Regression" TARGETLABEL "DepVar";
set EMWS8.Reg_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree" MODEL "Tree" MODELDESCRIPTION "Decision Tree" TARGETLABEL "DepVar";
set EMWS8.Tree_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree" MODEL "Tree" MODELDESCRIPTION "Decision Tree" TARGETLABEL "DepVar";
set EMWS8.Tree_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree" MODEL "Tree" MODELDESCRIPTION "Decision Tree" TARGETLABEL "DepVar";
set WORK.Tree_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree" MODEL "Tree" MODELDESCRIPTION "Decision Tree" TARGETLABEL "DepVar";
set EMWS8.Tree_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Tree" MODEL "Tree" MODELDESCRIPTION "Decision Tree" TARGETLABEL "DepVar";
set EMWS8.Tree_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural4" MODEL "Neural4" MODELDESCRIPTION "Neural Network (4)" TARGETLABEL "DepVar";
set EMWS8.Neural4_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural4" MODEL "Neural4" MODELDESCRIPTION "Neural Network (4)" TARGETLABEL "DepVar";
set EMWS8.Neural4_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural4" MODEL "Neural4" MODELDESCRIPTION "Neural Network (4)" TARGETLABEL "DepVar";
set WORK.Neural4_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural4" MODEL "Neural4" MODELDESCRIPTION "Neural Network (4)" TARGETLABEL "DepVar";
set EMWS8.Neural4_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural4" MODEL "Neural4" MODELDESCRIPTION "Neural Network (4)" TARGETLABEL "DepVar";
set EMWS8.Neural4_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural" MODEL "Neural" MODELDESCRIPTION "Neural Network" TARGETLABEL "DepVar";
set EMWS8.Neural_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural" MODEL "Neural" MODELDESCRIPTION "Neural Network" TARGETLABEL "DepVar";
set EMWS8.Neural_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural" MODEL "Neural" MODELDESCRIPTION "Neural Network" TARGETLABEL "DepVar";
set WORK.Neural_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural" MODEL "Neural" MODELDESCRIPTION "Neural Network" TARGETLABEL "DepVar";
set EMWS8.Neural_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural" MODEL "Neural" MODELDESCRIPTION "Neural Network" TARGETLABEL "DepVar";
set EMWS8.Neural_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural2" MODEL "Neural2" MODELDESCRIPTION "Neural Network (2)" TARGETLABEL "DepVar";
set EMWS8.Neural2_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural2" MODEL "Neural2" MODELDESCRIPTION "Neural Network (2)" TARGETLABEL "DepVar";
set EMWS8.Neural2_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural2" MODEL "Neural2" MODELDESCRIPTION "Neural Network (2)" TARGETLABEL "DepVar";
set WORK.Neural2_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural2" MODEL "Neural2" MODELDESCRIPTION "Neural Network (2)" TARGETLABEL "DepVar";
set EMWS8.Neural2_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural2" MODEL "Neural2" MODELDESCRIPTION "Neural Network (2)" TARGETLABEL "DepVar";
set EMWS8.Neural2_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural3" MODEL "Neural3" MODELDESCRIPTION "Neural Network (3)" TARGETLABEL "DepVar";
set EMWS8.Neural3_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural3" MODEL "Neural3" MODELDESCRIPTION "Neural Network (3)" TARGETLABEL "DepVar";
set EMWS8.Neural3_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural3" MODEL "Neural3" MODELDESCRIPTION "Neural Network (3)" TARGETLABEL "DepVar";
set WORK.Neural3_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural3" MODEL "Neural3" MODELDESCRIPTION "Neural Network (3)" TARGETLABEL "DepVar";
set EMWS8.Neural3_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Neural3" MODEL "Neural3" MODELDESCRIPTION "Neural Network (3)" TARGETLABEL "DepVar";
set EMWS8.Neural3_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Ensmbl" MODEL "Ensmbl" MODELDESCRIPTION "Ensemble" TARGETLABEL "DepVar";
set EMWS8.Ensmbl_EMRANK;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMRANK;
set EMWS8.MdlComp_EMRANK work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Ensmbl" MODEL "Ensmbl" MODELDESCRIPTION "Ensemble" TARGETLABEL "DepVar";
set EMWS8.Ensmbl_EMSCOREDIST;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMSCOREDIST;
set EMWS8.MdlComp_EMSCOREDIST work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Ensmbl" MODEL "Ensmbl" MODELDESCRIPTION "Ensemble" TARGETLABEL "DepVar";
set WORK.Ensmbl_OUTFIT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMOUTFIT;
set EMWS8.MdlComp_EMOUTFIT work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Ensmbl" MODEL "Ensmbl" MODELDESCRIPTION "Ensemble" TARGETLABEL "DepVar";
set EMWS8.Ensmbl_EMCLASSIFICATION;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMCLASSIFICATION;
set EMWS8.MdlComp_EMCLASSIFICATION work.MdlComp_TEMP;
run;
data work.MdlComp_TEMP;
length PARENT $16 MODEL $16 MODELDESCRIPTION $81 DATAROLE $20 TARGET $32 TARGETLABEL $200;
label PARENT = "%sysfunc(sasmsg(sashelp.dmine, rpt_parent_vlabel  ,  NOQUOTE))" MODEL = "%sysfunc(sasmsg(sashelp.dmine, rpt_modelnode_vlabel, NOQUOTE))" MODELDESCRIPTION = "%sysfunc(sasmsg(sashelp.dmine, rpt_modeldesc_vlabel, NOQUOTE))" TARGET =
   "%sysfunc(sasmsg(sashelp.dmine, rpt_targetvar_vlabel, NOQUOTE))" TARGETLABEL = "%sysfunc(sasmsg(sashelp.dmine, meta_targetlabel_vlabel, NOQUOTE))";
retain parent "Ensmbl" MODEL "Ensmbl" MODELDESCRIPTION "Ensemble" TARGETLABEL "DepVar";
set EMWS8.Ensmbl_EMEVENTREPORT;
where upcase(TARGET) = upcase("DepVar");
run;
data EMWS8.MdlComp_EMEVENTREPORT;
set EMWS8.MdlComp_EMEVENTREPORT work.MdlComp_TEMP;
run;
