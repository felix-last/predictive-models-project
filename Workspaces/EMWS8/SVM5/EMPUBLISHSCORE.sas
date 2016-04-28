data WORK._inoutest;
  length   _TARGET_                         $  32
           _TYPE_                           $  32
           _NAME_                           $  32
           _MEAN_                               8
           _STDEV_                              8
           AcceptedCmpTotal                     8
           Mnt                                  8
           MntMeatProducts                      8
           NumCatalogPurchases                  8
           RFMstat                              8
           Recency                              8
           ;
 
_TARGET_="DepVar"; _TYPE_="_MEAN_"; _NAME_=""; _MEAN_=.; _STDEV_=.; AcceptedCmpTotal=0.31; Mnt=640.14; MntMeatProducts=173.505; NumCatalogPurchases=2.695; RFMstat=557.25346709576; Recency=48.11;
output;
_TARGET_="DepVar"; _TYPE_="_STDEV_"; _NAME_=""; _MEAN_=.; _STDEV_=.; AcceptedCmpTotal=0.6710814781756; Mnt=622.100314419789; MntMeatProducts=217.716054197331; NumCatalogPurchases=2.82027107366099;
RFMstat=1652.04165719928; Recency=29.1646442885298;
output;
_TARGET_="DepVar"; _TYPE_="_PARMS_"; _NAME_=""; _MEAN_=0.94360475165078; _STDEV_=0; AcceptedCmpTotal=1.76073334664852; Mnt=-0.86821665842182; MntMeatProducts=0.76098940096545;
NumCatalogPurchases=0.51962972824693; RFMstat=0.63026076138374; Recency=-0.93746662776736;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Intercept"; _MEAN_=.; _STDEV_=.; AcceptedCmpTotal=-1; Mnt=-1.00459242250287; MntMeatProducts=-1.00207684319833; NumCatalogPurchases=-1;
RFMstat=-1.00001654673729; Recency=-1;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Scale"; _MEAN_=.; _STDEV_=.; AcceptedCmpTotal=0.5; Mnt=0.00076540375047; MntMeatProducts=0.00207684319833; NumCatalogPurchases=0.18181818181818;
RFMstat=0.00006825529133; Recency=0.02020202020202;
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
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_FITIND_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=6; _NCV_=1;
_NOBS_=1000; _NTRAIN_=1000; _NCLEV_=0; _NYLEV_=2; _ACCU_=103; _L1_=.; _RegC_=0.4; _NSV_=262; _SVOM_=256; _Bias_=0; _NLV_=2.44059241774622; _Radius_=2.44059241774622; _VCDim_=36.6149000689582;
_OBJ_=-100.660212078371; _NormW_=5.97917431233856; _Margin_=0.81791728896631; _K_PAR_=0.94360475165078; _K_PAR2_=.; _K_PAR3_=.;
output;
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_ACCTAB_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=841; _NCV_=8;
_NOBS_=0; _NTRAIN_=95; _NCLEV_=56; _NYLEV_=0; _ACCU_=0; _L1_=0; _RegC_=0; _NSV_=.; _SVOM_=.; _Bias_=.; _NLV_=.; _Radius_=.; _VCDim_=.; _OBJ_=.; _NormW_=.; _Margin_=.; _K_PAR_=.; _K_PAR2_=.;
_K_PAR3_=.;
output;
;
run;
data WORK._inoutclass;
  length   _NAME_                           $  19
           _VAR_                            $  19
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
_NAME_="AcceptedCmpTotal"; _VAR_="AcceptedCmpTotal"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Mnt"; _VAR_="Mnt"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntMeatProducts"; _VAR_="MntMeatProducts"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumCatalogPurchases"; _VAR_="NumCatalogPurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="RFMstat"; _VAR_="RFMstat"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Recency"; _VAR_="Recency"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
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
