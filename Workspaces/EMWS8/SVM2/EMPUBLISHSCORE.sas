data WORK._inoutest;
  length   _TARGET_                         $  32
           _TYPE_                           $  32
           _NAME_                           $  32
           _MEAN_                               8
           _STDEV_                              8
           Marital_Status_1_                    8
           Marital_Status_2_                    8
           Marital_Status_3_                    8
           Marital_Status_4_                    8
           Marital_Status_5_                    8
           AcceptedCmpTotal                     8
           Frq                                  8
           Income                               8
           Mnt                                  8
           MntGoldProds                         8
           MntMeatProducts                      8
           NumCatalogPurchases                  8
           NumDealsPurchases                    8
           NumWebVisitsMonth                    8
           RFMstat                              8
           Recency                              8
           Teenhome                             8
           Year_Birth                           8
           ;
 
  label    Marital_Status_1_="DIVORCED"
           Marital_Status_2_="MARRIED"
           Marital_Status_3_="SINGLE"
           Marital_Status_4_="TOGETHER"
           Marital_Status_5_="WIDOW"
           ;
_TARGET_="DepVar"; _TYPE_="_MEAN_"; _NAME_=""; _MEAN_=.; _STDEV_=.; Marital_Status_1_=0.112; Marital_Status_2_=0.424; Marital_Status_3_=0.222; Marital_Status_4_=0.216; Marital_Status_5_=0.026;
AcceptedCmpTotal=0.31; Frq=12.76; Income=52534.801; Mnt=640.14; MntGoldProds=44.252; MntMeatProducts=173.505; NumCatalogPurchases=2.695; NumDealsPurchases=2.278; NumWebVisitsMonth=5.27;
RFMstat=557.25346709576; Recency=48.11; Teenhome=0.507; Year_Birth=1968.821;
output;
_TARGET_="DepVar"; _TYPE_="_STDEV_"; _NAME_=""; _MEAN_=.; _STDEV_=.; Marital_Status_1_=0.31552425509864; Marital_Status_2_=0.49443752736667; Marital_Status_3_=0.415799096787;
Marital_Status_4_=0.41172018837253; Marital_Status_5_=0.15921478998305; AcceptedCmpTotal=0.6710814781756; Frq=7.21903833723817; Income=20624.6374558095; Mnt=622.100314419789;
MntGoldProds=51.3808572183112; MntMeatProducts=217.716054197331; NumCatalogPurchases=2.82027107366099; NumDealsPurchases=1.71103583938024; NumWebVisitsMonth=2.32992028372829;
RFMstat=1652.04165719928; Recency=29.1646442885298; Teenhome=0.55159337854551; Year_Birth=12.1302143881173;
output;
_TARGET_="DepVar"; _TYPE_="_PARMS_"; _NAME_=""; _MEAN_=1.95246967892537; _STDEV_=0; Marital_Status_1_=-0.00341126628228; Marital_Status_2_=-0.20432068743986; Marital_Status_3_=0.22121090787141;
Marital_Status_4_=-0.18731399755412; Marital_Status_5_=0.17383504340485; AcceptedCmpTotal=2.6570789340383; Frq=-2.17712681519651; Income=1.58217868430817; Mnt=-1.38818076533711;
MntGoldProds=0.28414536622011; MntMeatProducts=1.86525826245851; NumCatalogPurchases=2.13018522603932; NumDealsPurchases=1.94428632399089; NumWebVisitsMonth=1.78199754132268;
RFMstat=0.48292147281951; Recency=-2.06197675571015; Teenhome=-0.64851701402282; Year_Birth=0.37983471031638;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Intercept"; _MEAN_=.; _STDEV_=.; Marital_Status_1_=-1; Marital_Status_2_=-1; Marital_Status_3_=-1; Marital_Status_4_=-1; Marital_Status_5_=-1;
AcceptedCmpTotal=-1; Frq=-1.20689655172413; Income=-1.15706148433573; Mnt=-1.00459242250287; MntGoldProds=-1; MntMeatProducts=-1.00207684319833; NumCatalogPurchases=-1; NumDealsPurchases=-1;
NumWebVisitsMonth=-1; RFMstat=-1.00001654673729; Recency=-1; Teenhome=-1; Year_Birth=-72.9259259259259;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Scale"; _MEAN_=.; _STDEV_=.; Marital_Status_1_=2; Marital_Status_2_=2; Marital_Status_3_=2; Marital_Status_4_=2; Marital_Status_5_=2;
AcceptedCmpTotal=0.5; Frq=0.06896551724137; Income=0.00002094153124; Mnt=0.00076540375047; MntGoldProds=0.00803212851405; MntMeatProducts=0.00207684319833; NumCatalogPurchases=0.18181818181818;
NumDealsPurchases=0.2; NumWebVisitsMonth=0.22222222222222; RFMstat=0.00006825529133; Recency=0.02020202020202; Teenhome=1; Year_Birth=0.03703703703703;
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
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_FITIND_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=13; _NCV_=2;
_NOBS_=1000; _NTRAIN_=1000; _NCLEV_=5; _NYLEV_=2; _ACCU_=62; _L1_=.; _RegC_=0.9; _NSV_=200; _SVOM_=184; _Bias_=0; _NLV_=4.02329236583784; _Radius_=4.02329236583784; _VCDim_=591.650782004608;
_OBJ_=-155.589992998515; _NormW_=36.4894734929248; _Margin_=0.33109010165486; _K_PAR_=1.95246967892537; _K_PAR2_=.; _K_PAR3_=.;
output;
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_ACCTAB_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=835; _NCV_=14;
_NOBS_=0; _NTRAIN_=48; _NCLEV_=103; _NYLEV_=0; _ACCU_=0; _L1_=0; _RegC_=0; _NSV_=.; _SVOM_=.; _Bias_=.; _NLV_=.; _Radius_=.; _VCDim_=.; _OBJ_=.; _NormW_=.; _Margin_=.; _K_PAR_=.; _K_PAR2_=.;
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
_NAME_="Marital_Status_1_"; _VAR_="Marital_Status"; _LEVEL_="DIVORCED"; _CTYP_=2; _UNFMT_=1; _CNLN_=8; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Marital_Status_2_"; _VAR_="Marital_Status"; _LEVEL_="MARRIED"; _CTYP_=2; _UNFMT_=1; _CNLN_=8; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Marital_Status_3_"; _VAR_="Marital_Status"; _LEVEL_="SINGLE"; _CTYP_=2; _UNFMT_=1; _CNLN_=8; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Marital_Status_4_"; _VAR_="Marital_Status"; _LEVEL_="TOGETHER"; _CTYP_=2; _UNFMT_=1; _CNLN_=8; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Marital_Status_5_"; _VAR_="Marital_Status"; _LEVEL_="WIDOW"; _CTYP_=2; _UNFMT_=1; _CNLN_=8; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmpTotal"; _VAR_="AcceptedCmpTotal"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Frq"; _VAR_="Frq"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Income"; _VAR_="Income"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Mnt"; _VAR_="Mnt"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntGoldProds"; _VAR_="MntGoldProds"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntMeatProducts"; _VAR_="MntMeatProducts"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumCatalogPurchases"; _VAR_="NumCatalogPurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumDealsPurchases"; _VAR_="NumDealsPurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumWebVisitsMonth"; _VAR_="NumWebVisitsMonth"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="RFMstat"; _VAR_="RFMstat"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Recency"; _VAR_="Recency"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Teenhome"; _VAR_="Teenhome"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
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
