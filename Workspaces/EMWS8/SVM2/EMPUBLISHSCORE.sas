data WORK._inoutest;
  length   _TARGET_                         $  32
           _TYPE_                           $  32
           _NAME_                           $  32
           _MEAN_                               8
           _STDEV_                              8
           AcceptedCmp1_1_                      8
           AcceptedCmp1_2_                      8
           AcceptedCmp2_1_                      8
           AcceptedCmp2_2_                      8
           AcceptedCmp3_1_                      8
           AcceptedCmp3_2_                      8
           AcceptedCmp4_1_                      8
           AcceptedCmp4_2_                      8
           AcceptedCmp5_1_                      8
           AcceptedCmp5_2_                      8
           Complain_1_                          8
           Complain_2_                          8
           Education_1_                         8
           Education_2_                         8
           Education_3_                         8
           Education_4_                         8
           Education_5_                         8
           Marital_Status_1_                    8
           Marital_Status_2_                    8
           Marital_Status_3_                    8
           Marital_Status_4_                    8
           Marital_Status_5_                    8
           Income                               8
           Kidhome                              8
           MntFishProducts                      8
           MntFruits                            8
           MntGoldProds                         8
           MntMeatProducts                      8
           MntSweetProducts                     8
           MntWines                             8
           NumCatalogPurchases                  8
           NumDealsPurchases                    8
           NumStorePurchases                    8
           NumWebPurchases                      8
           NumWebVisitsMonth                    8
           Recency                              8
           Teenhome                             8
           ;
 
  label    AcceptedCmp1_1_="0"
           AcceptedCmp1_2_="1"
           AcceptedCmp2_1_="0"
           AcceptedCmp2_2_="1"
           AcceptedCmp3_1_="0"
           AcceptedCmp3_2_="1"
           AcceptedCmp4_1_="0"
           AcceptedCmp4_2_="1"
           AcceptedCmp5_1_="0"
           AcceptedCmp5_2_="1"
           Complain_1_="0"
           Complain_2_="1"
           Education_1_="2N CYCLE"
           Education_2_="BASIC"
           Education_3_="GRADUATION"
           Education_4_="MASTER"
           Education_5_="PHD"
           Marital_Status_1_="DIVORCED"
           Marital_Status_2_="MARRIED"
           Marital_Status_3_="SINGLE"
           Marital_Status_4_="TOGETHER"
           Marital_Status_5_="WIDOW"
           ;
_TARGET_="DepVar"; _TYPE_="_MEAN_"; _NAME_=""; _MEAN_=.; _STDEV_=.; AcceptedCmp1_1_=0.94; AcceptedCmp1_2_=0.06; AcceptedCmp2_1_=0.988; AcceptedCmp2_2_=0.012; AcceptedCmp3_1_=0.911;
AcceptedCmp3_2_=0.089; AcceptedCmp4_1_=0.931; AcceptedCmp4_2_=0.069; AcceptedCmp5_1_=0.92; AcceptedCmp5_2_=0.08; Complain_1_=0.991; Complain_2_=0.009; Education_1_=0.084; Education_2_=0.03;
Education_3_=0.483; Education_4_=0.175; Education_5_=0.228; Marital_Status_1_=0.112; Marital_Status_2_=0.424; Marital_Status_3_=0.222; Marital_Status_4_=0.216; Marital_Status_5_=0.026;
Income=52534.801; Kidhome=0.422; MntFishProducts=36.635; MntFruits=27.865; MntGoldProds=44.252; MntMeatProducts=173.505; MntSweetProducts=27.478; MntWines=330.405; NumCatalogPurchases=2.695;
NumDealsPurchases=2.278; NumStorePurchases=5.914; NumWebPurchases=4.151; NumWebVisitsMonth=5.27; Recency=48.11; Teenhome=0.507;
output;
_TARGET_="DepVar"; _TYPE_="_STDEV_"; _NAME_=""; _MEAN_=.; _STDEV_=.; AcceptedCmp1_1_=0.23760567429347; AcceptedCmp1_2_=0.23760567429347; AcceptedCmp2_1_=0.10893974420691;
AcceptedCmp2_2_=0.10893974420691; AcceptedCmp3_1_=0.2848862231842; AcceptedCmp3_2_=0.2848862231842; AcceptedCmp4_1_=0.25358096005675; AcceptedCmp4_2_=0.25358096005675;
AcceptedCmp5_1_=0.27142894774447; AcceptedCmp5_2_=0.27142894774447; Complain_1_=0.0944877131056; Complain_2_=0.0944877131056; Education_1_=0.27752661317614; Education_2_=0.17067257872642;
Education_3_=0.49996095943679; Education_4_=0.38015722999769; Education_5_=0.41975253685021; Marital_Status_1_=0.31552425509864; Marital_Status_2_=0.49443752736667; Marital_Status_3_=0.415799096787;
Marital_Status_4_=0.41172018837253; Marital_Status_5_=0.15921478998305; Income=20624.6374558095; Kidhome=0.53122330351576; MntFishProducts=51.9036777768856; MntFruits=41.1902344058687;
MntGoldProds=51.3808572183112; MntMeatProducts=217.716054197331; MntSweetProducts=40.0596091879125; MntWines=354.509350870826; NumCatalogPurchases=2.82027107366099;
NumDealsPurchases=1.71103583938024; NumStorePurchases=3.26025048627145; NumWebPurchases=2.67906259284406; NumWebVisitsMonth=2.32992028372829; Recency=29.1646442885298; Teenhome=0.55159337854551;
output;
_TARGET_="DepVar"; _TYPE_="_PARMS_"; _NAME_=""; _MEAN_=1.50156779488685; _STDEV_=0; AcceptedCmp1_1_=-0.27026861463723; AcceptedCmp1_2_=0.27026861463723; AcceptedCmp2_1_=-0.26433787342284;
AcceptedCmp2_2_=0.26433787342284; AcceptedCmp3_1_=-0.39667166857106; AcceptedCmp3_2_=0.39667166857106; AcceptedCmp4_1_=-0.38470666985242; AcceptedCmp4_2_=0.38470666985242;
AcceptedCmp5_1_=-0.41218989780235; AcceptedCmp5_2_=0.41218989780235; Complain_1_=-0.22466385637231; Complain_2_=0.22466385637231; Education_1_=0.06593543371555; Education_2_=-0.10000771185553;
Education_3_=0.06916870869742; Education_4_=-0.14013450485313; Education_5_=0.1050380742957; Marital_Status_1_=0.03966812451429; Marital_Status_2_=-0.16686514464654;
Marital_Status_3_=0.31436632516634; Marital_Status_4_=-0.21229053008002; Marital_Status_5_=0.02512122504596; Income=1.72029399172076; Kidhome=-0.39552978164895; MntFishProducts=-0.60176078955958;
MntFruits=-0.05901455690496; MntGoldProds=0.0795105649016; MntMeatProducts=1.4878330211448; MntSweetProducts=0.070817240769; MntWines=-0.96790729381282; NumCatalogPurchases=1.6078996103001;
NumDealsPurchases=2.20429731774113; NumStorePurchases=-1.10360727489949; NumWebPurchases=-0.85464458631641; NumWebVisitsMonth=2.02845246207076; Recency=-2.28703034712209; Teenhome=-0.85878089099284;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Intercept"; _MEAN_=.; _STDEV_=.; AcceptedCmp1_1_=-1; AcceptedCmp1_2_=-1; AcceptedCmp2_1_=-1; AcceptedCmp2_2_=-1; AcceptedCmp3_1_=-1;
AcceptedCmp3_2_=-1; AcceptedCmp4_1_=-1; AcceptedCmp4_2_=-1; AcceptedCmp5_1_=-1; AcceptedCmp5_2_=-1; Complain_1_=-1; Complain_2_=-1; Education_1_=-1; Education_2_=-1; Education_3_=-1; Education_4_=-1;
Education_5_=-1; Marital_Status_1_=-1; Marital_Status_2_=-1; Marital_Status_3_=-1; Marital_Status_4_=-1; Marital_Status_5_=-1; Income=-1.15706148433573; Kidhome=-1; MntFishProducts=-1; MntFruits=-1;
MntGoldProds=-1; MntMeatProducts=-1.00207684319833; MntSweetProducts=-1; MntWines=-1; NumCatalogPurchases=-1; NumDealsPurchases=-1; NumStorePurchases=-1.36363636363636; NumWebPurchases=-1;
NumWebVisitsMonth=-1; Recency=-1; Teenhome=-1;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Scale"; _MEAN_=.; _STDEV_=.; AcceptedCmp1_1_=2; AcceptedCmp1_2_=2; AcceptedCmp2_1_=2; AcceptedCmp2_2_=2; AcceptedCmp3_1_=2; AcceptedCmp3_2_=2;
AcceptedCmp4_1_=2; AcceptedCmp4_2_=2; AcceptedCmp5_1_=2; AcceptedCmp5_2_=2; Complain_1_=2; Complain_2_=2; Education_1_=2; Education_2_=2; Education_3_=2; Education_4_=2; Education_5_=2;
Marital_Status_1_=2; Marital_Status_2_=2; Marital_Status_3_=2; Marital_Status_4_=2; Marital_Status_5_=2; Income=0.00002094153124; Kidhome=1; MntFishProducts=0.007722007722;
MntFruits=0.01005025125628; MntGoldProds=0.00803212851405; MntMeatProducts=0.00207684319833; MntSweetProducts=0.01005025125628; MntWines=0.00133511348464; NumCatalogPurchases=0.18181818181818;
NumDealsPurchases=0.2; NumStorePurchases=0.18181818181818; NumWebPurchases=0.18181818181818; NumWebVisitsMonth=0.22222222222222; Recency=0.02020202020202; Teenhome=1;
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
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_FITIND_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=15; _NCV_=9;
_NOBS_=1000; _NTRAIN_=1000; _NCLEV_=22; _NYLEV_=2; _ACCU_=52; _L1_=.; _RegC_=0.8; _NSV_=188; _SVOM_=158; _Bias_=0; _NLV_=5.90510589415796; _Radius_=5.86403884160414; _VCDim_=952.816307105668;
_OBJ_=-127.624785068697; _NormW_=27.679577996717; _Margin_=0.38014585845659; _K_PAR_=1.50156779488685; _K_PAR2_=.; _K_PAR3_=.;
output;
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_ACCTAB_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=833; _NCV_=16;
_NOBS_=0; _NTRAIN_=36; _NCLEV_=115; _NYLEV_=0; _ACCU_=0; _L1_=0; _RegC_=0; _NSV_=.; _SVOM_=.; _Bias_=.; _NLV_=.; _Radius_=.; _VCDim_=.; _OBJ_=.; _NormW_=.; _Margin_=.; _K_PAR_=.; _K_PAR2_=.;
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
_NAME_="AcceptedCmp1_1_"; _VAR_="AcceptedCmp1"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp1_2_"; _VAR_="AcceptedCmp1"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp2_1_"; _VAR_="AcceptedCmp2"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp2_2_"; _VAR_="AcceptedCmp2"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp3_1_"; _VAR_="AcceptedCmp3"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp3_2_"; _VAR_="AcceptedCmp3"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp4_1_"; _VAR_="AcceptedCmp4"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp4_2_"; _VAR_="AcceptedCmp4"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp5_1_"; _VAR_="AcceptedCmp5"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="AcceptedCmp5_2_"; _VAR_="AcceptedCmp5"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Complain_1_"; _VAR_="Complain"; _LEVEL_="0"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Complain_2_"; _VAR_="Complain"; _LEVEL_="1"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Education_1_"; _VAR_="Education"; _LEVEL_="2N CYCLE"; _CTYP_=2; _UNFMT_=1; _CNLN_=10; _CULN_=10; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Education_2_"; _VAR_="Education"; _LEVEL_="BASIC"; _CTYP_=2; _UNFMT_=1; _CNLN_=10; _CULN_=10; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Education_3_"; _VAR_="Education"; _LEVEL_="GRADUATION"; _CTYP_=2; _UNFMT_=1; _CNLN_=10; _CULN_=10; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Education_4_"; _VAR_="Education"; _LEVEL_="MASTER"; _CTYP_=2; _UNFMT_=1; _CNLN_=10; _CULN_=10; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="Education_5_"; _VAR_="Education"; _LEVEL_="PHD"; _CTYP_=2; _UNFMT_=1; _CNLN_=10; _CULN_=10; _CLMIS_=2147000000; _ORDER_=1;
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
_NAME_="Income"; _VAR_="Income"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Kidhome"; _VAR_="Kidhome"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntFishProducts"; _VAR_="MntFishProducts"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntFruits"; _VAR_="MntFruits"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntGoldProds"; _VAR_="MntGoldProds"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntMeatProducts"; _VAR_="MntMeatProducts"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntSweetProducts"; _VAR_="MntSweetProducts"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="MntWines"; _VAR_="MntWines"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumCatalogPurchases"; _VAR_="NumCatalogPurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumDealsPurchases"; _VAR_="NumDealsPurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumStorePurchases"; _VAR_="NumStorePurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumWebPurchases"; _VAR_="NumWebPurchases"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="NumWebVisitsMonth"; _VAR_="NumWebVisitsMonth"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Recency"; _VAR_="Recency"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
output;
_NAME_="Teenhome"; _VAR_="Teenhome"; _LEVEL_=""; _CTYP_=0; _UNFMT_=0; _CNLN_=0; _CULN_=8; _CLMIS_=0; _ORDER_=0;
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
