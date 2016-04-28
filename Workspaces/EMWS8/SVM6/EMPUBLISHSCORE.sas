data WORK._inoutest;
  length   _TARGET_                         $  32
           _TYPE_                           $  32
           _NAME_                           $  32
           _MEAN_                               8
           _STDEV_                              8
           PC_1                                 8
           PC_10                                8
           PC_11                                8
           PC_12                                8
           PC_13                                8
           PC_14                                8
           PC_15                                8
           PC_16                                8
           PC_17                                8
           PC_2                                 8
           PC_3                                 8
           PC_4                                 8
           PC_5                                 8
           PC_6                                 8
           PC_7                                 8
           PC_8                                 8
           PC_9                                 8
           Year_Birth                           8
           ;
 
_TARGET_="DepVar"; _TYPE_="_MEAN_"; _NAME_=""; _MEAN_=.; _STDEV_=.; PC_1=0.07390853256453; PC_10=-0.04472587469376; PC_11=0.03798396819229; PC_12=-0.04222833199894; PC_13=0.00997206690509;
PC_14=0.02310233165523; PC_15=-0.01669459473555; PC_16=0.05670748784496; PC_17=-0.02029800582671; PC_2=0.06091963816872; PC_3=-0.05963729524699; PC_4=0.03432837038346; PC_5=-0.01209848473637;
PC_6=0.03796691053265; PC_7=-0.05577441195207; PC_8=0.01728555444536; PC_9=-0.01100458026491; Year_Birth=1968.821;
output;
_TARGET_="DepVar"; _TYPE_="_STDEV_"; _NAME_=""; _MEAN_=.; _STDEV_=.; PC_1=3.37963207735432; PC_10=1.19980258279327; PC_11=1.1641926629956; PC_12=1.14304621891041; PC_13=1.14643721402971;
PC_14=1.11953429979971; PC_15=1.06732256800103; PC_16=1.08871251643392; PC_17=0.98966272681419; PC_2=1.81692334087727; PC_3=1.73366063885727; PC_4=1.59929530007772; PC_5=1.51618192739851;
PC_6=1.23552817377106; PC_7=1.32935105097151; PC_8=1.24045448061619; PC_9=1.23290675498022; Year_Birth=12.1302143881173;
output;
_TARGET_="DepVar"; _TYPE_="_PARMS_"; _NAME_=""; _MEAN_=1.37667566955574; _STDEV_=0; PC_1=1.19104657493455; PC_10=-1.80488326658669; PC_11=0.39262680883996; PC_12=0.28908352627949;
PC_13=-2.89679570863866; PC_14=0.43199212746881; PC_15=-0.62008314844298; PC_16=0.39879893086312; PC_17=-0.48012114463814; PC_2=-1.72242286551066; PC_3=-0.42010779811042; PC_4=0.55377697693974;
PC_5=-0.38062842016336; PC_6=0.08901716023414; PC_7=0.34561687623864; PC_8=1.55728552573612; PC_9=0.61588955821181; Year_Birth=0.39379773772307;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Intercept"; _MEAN_=.; _STDEV_=.; PC_1=-0.46888407123983; PC_10=0.29140674969157; PC_11=-0.07186446536017; PC_12=-0.23333401388236;
PC_13=0.39570606295269; PC_14=-0.17963777125912; PC_15=-0.06292258388734; PC_16=-0.33184130705048; PC_17=-0.10807197740257; PC_2=0.57423098202606; PC_3=-0.03358514044759; PC_4=-0.31229298681565;
PC_5=0.049990925127; PC_6=0.80068192612749; PC_7=-0.09726857606287; PC_8=0.36432780250876; PC_9=0.10802390202861; Year_Birth=-72.9259259259259;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Scale"; _MEAN_=.; _STDEV_=.; PC_1=0.11474791603718; PC_10=0.15360134134808; PC_11=0.24824933771779; PC_12=0.28506012441376; PC_13=0.16236392165018;
PC_14=0.27744798693715; PC_15=0.2518336906369; PC_16=0.31850008739953; PC_17=0.28571831627717; PC_2=0.13539748573476; PC_3=0.17082645082774; PC_4=0.19432777305346; PC_5=0.19002242925578;
PC_6=0.14040974048616; PC_7=0.25165693308172; PC_8=0.14015051817951; PC_9=0.29912238631119; Year_Birth=0.03703703703703;
output;
;
run;
data WORK._inoutfit;
  length   _TARGET_                         $  32
           _Y_SCALE_                        $  32
           _X_SCALE_                        $  32
           _DATA_                           $  32
           _TYPE_                           $  32
           _TASK_                           $  32
           _METHOD_                         $  32
           _KERNEL_                         $  32
           _CONVER_                         $  32
           _NIV_                                8
           _NCV_                                8
           _NOBS_                               8
           _NTRAIN_                             8
           _NCLEV_                              8
           _NYLEV_                              8
           _ACCU_                               8
           _L1_                                 8
           _RegC_                               8
           _NSV_                                8
           _SVOM_                               8
           _Bias_                               8
           _NLV_                                8
           _Radius_                             8
           _VCDim_                              8
           _OBJ_                                8
           _NormW_                              8
           _Margin_                             8
           _K_PAR_                              8
           _K_PAR2_                             8
           _K_PAR3_                             8
           ;
 
  label    _NIV_="N Interval vars"
           _NCV_="N Class vars"
           _NOBS_="N Observations"
           _NTRAIN_="N Traningobs"
           _NCLEV_="N_C_levels"
           _NYLEV_="N_Y_levels"
           _ACCU_="Classification Error"
           _L1_="L1 Loss"
           _RegC_="Regularization Parameter"
           _NSV_="Number Support Vectors"
           _SVOM_="Support Vectors on Margin"
           _Bias_="Bias"
           _NLV_="Norm of Longest Vector"
           _Radius_="Radius of Sphere"
           _VCDim_="Estim. VC Dimensionality"
           _OBJ_="Objective Function"
           _NormW_="L2 Norm of W"
           _Margin_="Geometric Margin"
           _K_PAR_="Kernel Function Parameter 1"
           _K_PAR2_="Kernel Function Parameter 2"
           _K_PAR3_="Kernel Function Parameter 3"
           ;
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_FITIND_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=18; _NCV_=1;
_NOBS_=1000; _NTRAIN_=1000; _NCLEV_=0; _NYLEV_=2; _ACCU_=88; _L1_=.; _RegC_=1; _NSV_=256; _SVOM_=238; _Bias_=0; _NLV_=2.64346509443837; _Radius_=2.64346509443837; _VCDim_=147.380672173844;
_OBJ_=-236.249080315818; _NormW_=20.9477111522718; _Margin_=0.43698014783989; _K_PAR_=1.37667566955574; _K_PAR2_=.; _K_PAR3_=.;
output;
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_ACCTAB_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=840; _NCV_=9;
_NOBS_=0; _NTRAIN_=79; _NCLEV_=72; _NYLEV_=0; _ACCU_=0; _L1_=0; _RegC_=0; _NSV_=.; _SVOM_=.; _Bias_=.; _NLV_=.; _Radius_=.; _VCDim_=.; _OBJ_=.; _NormW_=.; _Margin_=.; _K_PAR_=.; _K_PAR2_=.;
_K_PAR3_=.;
output;
;
run;
data WORK._inoutclass;
  length   _NAME_                           $  10
           _VAR_                            $  10
           _LEVEL_                          $  12
           _CTYP_                               8
           _UNFMT_                              8
           _CNLN_                               8
           _CULN_                               8
           _CLMIS_                              8
           _ORDER_                              8
           ;
 
_NAME_="DepVar_1_"; _VAR_="DepVar"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="DepVar_2_"; _VAR_="DepVar"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="PC_1"; _VAR_="PC_1"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_10"; _VAR_="PC_10"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_11"; _VAR_="PC_11"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_12"; _VAR_="PC_12"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_13"; _VAR_="PC_13"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_14"; _VAR_="PC_14"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_15"; _VAR_="PC_15"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_16"; _VAR_="PC_16"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_17"; _VAR_="PC_17"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_2"; _VAR_="PC_2"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_3"; _VAR_="PC_3"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_4"; _VAR_="PC_4"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_5"; _VAR_="PC_5"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_6"; _VAR_="PC_6"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_7"; _VAR_="PC_7"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_8"; _VAR_="PC_8"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="PC_9"; _VAR_="PC_9"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Year_Birth"; _VAR_="Year_Birth"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
;
run;
 
/*-------------------------------------------------*/
/* SVM Score Code  */
/*-------------------------------------------------*/
 
proc svmscore data= &em_score_output inest=WORK._inoutest infit=WORK._inoutfit inclass=WORK._inoutclass
              out = &em_score_output(rename=(_I_=I_DepVar))
;
run;
data &em_score_output(drop=_P);
     set &em_score_output;
if (_P_ < -600) then _p =0;
else _P = 1/(1+EXP((-1)*(_P_)));
 P_DepVar1 = _P ;
 P_DepVar0 = 1 - _P ;
