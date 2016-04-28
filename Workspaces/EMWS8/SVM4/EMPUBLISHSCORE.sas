data WORK._inoutest;
  length   _TARGET_                         $  32
           _TYPE_                           $  32
           _NAME_                           $  32
           _MEAN_                               8
           _STDEV_                              8
           GRP_AcceptedCmp5_1_                  8
           GRP_AcceptedCmp5_2_                  8
           GRP_AcceptedCmpTotal_1_              8
           GRP_AcceptedCmpTotal_2_              8
           GRP_Frq_1_                           8
           GRP_Frq_2_                           8
           GRP_Frq_3_                           8
           GRP_Frq_4_                           8
           GRP_Frq_5_                           8
           GRP_Frq_6_                           8
           GRP_Frq_7_                           8
           GRP_Frq_8_                           8
           GRP_Frq_9_                           8
           GRP_Frq_10_                          8
           GRP_Income_1_                        8
           GRP_Income_2_                        8
           GRP_Income_3_                        8
           GRP_Income_4_                        8
           GRP_Income_5_                        8
           GRP_Income_6_                        8
           GRP_Income_7_                        8
           GRP_Income_8_                        8
           GRP_Income_9_                        8
           GRP_Income_10_                       8
           GRP_Mnt_1_                           8
           GRP_Mnt_2_                           8
           GRP_Mnt_3_                           8
           GRP_Mnt_4_                           8
           GRP_Mnt_5_                           8
           GRP_Mnt_6_                           8
           GRP_Mnt_7_                           8
           GRP_Mnt_8_                           8
           GRP_Mnt_9_                           8
           GRP_Mnt_10_                          8
           GRP_MntFishProducts_1_               8
           GRP_MntFishProducts_2_               8
           GRP_MntFishProducts_3_               8
           GRP_MntFishProducts_4_               8
           GRP_MntFishProducts_5_               8
           GRP_MntFishProducts_6_               8
           GRP_MntFishProducts_7_               8
           GRP_MntFishProducts_8_               8
           GRP_MntFishProducts_9_               8
           GRP_MntGoldProds_1_                  8
           GRP_MntGoldProds_2_                  8
           GRP_MntGoldProds_3_                  8
           GRP_MntGoldProds_4_                  8
           GRP_MntGoldProds_5_                  8
           GRP_MntGoldProds_6_                  8
           GRP_MntGoldProds_7_                  8
           GRP_MntGoldProds_8_                  8
           GRP_MntGoldProds_9_                  8
           GRP_MntGoldProds_10_                 8
           GRP_MntMeatProducts_1_               8
           GRP_MntMeatProducts_2_               8
           GRP_MntMeatProducts_3_               8
           GRP_MntMeatProducts_4_               8
           GRP_MntMeatProducts_5_               8
           GRP_MntMeatProducts_6_               8
           GRP_MntMeatProducts_7_               8
           GRP_MntMeatProducts_8_               8
           GRP_MntMeatProducts_9_               8
           GRP_MntMeatProducts_10_              8
           GRP_MntSweetProducts_1_              8
           GRP_MntSweetProducts_2_              8
           GRP_MntSweetProducts_3_              8
           GRP_MntSweetProducts_4_              8
           GRP_MntSweetProducts_5_              8
           GRP_MntSweetProducts_6_              8
           GRP_MntSweetProducts_7_              8
           GRP_MntSweetProducts_8_              8
           GRP_MntSweetProducts_9_              8
           GRP_MntWines_1_                      8
           GRP_MntWines_2_                      8
           GRP_MntWines_3_                      8
           GRP_MntWines_4_                      8
           GRP_MntWines_5_                      8
           GRP_MntWines_6_                      8
           GRP_MntWines_7_                      8
           GRP_MntWines_8_                      8
           GRP_MntWines_9_                      8
           GRP_MntWines_10_                     8
           GRP_NumCatalogPurchases_1_           8
           GRP_NumCatalogPurchases_2_           8
           GRP_NumCatalogPurchases_3_           8
           GRP_NumCatalogPurchases_4_           8
           GRP_NumCatalogPurchases_5_           8
           GRP_NumCatalogPurchases_6_           8
           GRP_NumDistPurchases_1_              8
           GRP_NumDistPurchases_2_              8
           GRP_NumDistPurchases_3_              8
           GRP_NumDistPurchases_4_              8
           GRP_NumDistPurchases_5_              8
           GRP_NumDistPurchases_6_              8
           GRP_NumDistPurchases_7_              8
           GRP_NumDistPurchases_8_              8
           GRP_NumDistPurchases_9_              8
           GRP_NumDistPurchases_10_             8
           GRP_NumWebPurchases_1_               8
           GRP_NumWebPurchases_2_               8
           GRP_NumWebPurchases_3_               8
           GRP_NumWebPurchases_4_               8
           GRP_NumWebPurchases_5_               8
           GRP_NumWebPurchases_6_               8
           GRP_NumWebPurchases_7_               8
           GRP_NumWebPurchases_8_               8
           GRP_NumWebVisitsMonth_1_             8
           GRP_NumWebVisitsMonth_2_             8
           GRP_NumWebVisitsMonth_3_             8
           GRP_NumWebVisitsMonth_4_             8
           GRP_NumWebVisitsMonth_5_             8
           GRP_NumWebVisitsMonth_6_             8
           GRP_NumWebVisitsMonth_7_             8
           GRP_NumWebVisitsMonth_8_             8
           GRP_RFMstat_1_                       8
           GRP_RFMstat_2_                       8
           GRP_RFMstat_3_                       8
           GRP_RFMstat_4_                       8
           GRP_RFMstat_5_                       8
           GRP_RFMstat_6_                       8
           GRP_RFMstat_7_                       8
           GRP_RFMstat_8_                       8
           GRP_RFMstat_9_                       8
           GRP_RFMstat_10_                      8
           GRP_RMntFrq_1_                       8
           GRP_RMntFrq_2_                       8
           GRP_RMntFrq_3_                       8
           GRP_RMntFrq_4_                       8
           GRP_RMntFrq_5_                       8
           GRP_RMntFrq_6_                       8
           GRP_RMntFrq_7_                       8
           GRP_RMntFrq_8_                       8
           GRP_RMntFrq_9_                       8
           GRP_RMntFrq_10_                      8
           GRP_Recency_1_                       8
           GRP_Recency_2_                       8
           GRP_Recency_3_                       8
           GRP_Recency_4_                       8
           GRP_Recency_5_                       8
           GRP_Recency_6_                       8
           GRP_Recency_7_                       8
           GRP_Recency_8_                       8
           GRP_Recency_9_                       8
           GRP_Recency_10_                      8
           Year_Birth                           8
           ;
 
  label    GRP_AcceptedCmp5_1_="2"
           GRP_AcceptedCmp5_2_="3"
           GRP_AcceptedCmpTotal_1_="3"
           GRP_AcceptedCmpTotal_2_="4"
           GRP_Frq_1_="2"
           GRP_Frq_2_="3"
           GRP_Frq_3_="4"
           GRP_Frq_4_="5"
           GRP_Frq_5_="6"
           GRP_Frq_6_="7"
           GRP_Frq_7_="8"
           GRP_Frq_8_="9"
           GRP_Frq_9_="10"
           GRP_Frq_10_="11"
           GRP_Income_1_="2"
           GRP_Income_2_="3"
           GRP_Income_3_="4"
           GRP_Income_4_="5"
           GRP_Income_5_="6"
           GRP_Income_6_="7"
           GRP_Income_7_="8"
           GRP_Income_8_="9"
           GRP_Income_9_="10"
           GRP_Income_10_="11"
           GRP_Mnt_1_="2"
           GRP_Mnt_2_="3"
           GRP_Mnt_3_="4"
           GRP_Mnt_4_="5"
           GRP_Mnt_5_="6"
           GRP_Mnt_6_="7"
           GRP_Mnt_7_="8"
           GRP_Mnt_8_="9"
           GRP_Mnt_9_="10"
           GRP_Mnt_10_="11"
           GRP_MntFishProducts_1_="3"
           GRP_MntFishProducts_2_="4"
           GRP_MntFishProducts_3_="5"
           GRP_MntFishProducts_4_="6"
           GRP_MntFishProducts_5_="7"
           GRP_MntFishProducts_6_="8"
           GRP_MntFishProducts_7_="9"
           GRP_MntFishProducts_8_="10"
           GRP_MntFishProducts_9_="11"
           GRP_MntGoldProds_1_="2"
           GRP_MntGoldProds_2_="3"
           GRP_MntGoldProds_3_="4"
           GRP_MntGoldProds_4_="5"
           GRP_MntGoldProds_5_="6"
           GRP_MntGoldProds_6_="7"
           GRP_MntGoldProds_7_="8"
           GRP_MntGoldProds_8_="9"
           GRP_MntGoldProds_9_="10"
           GRP_MntGoldProds_10_="11"
           GRP_MntMeatProducts_1_="2"
           GRP_MntMeatProducts_2_="3"
           GRP_MntMeatProducts_3_="4"
           GRP_MntMeatProducts_4_="5"
           GRP_MntMeatProducts_5_="6"
           GRP_MntMeatProducts_6_="7"
           GRP_MntMeatProducts_7_="8"
           GRP_MntMeatProducts_8_="9"
           GRP_MntMeatProducts_9_="10"
           GRP_MntMeatProducts_10_="11"
           GRP_MntSweetProducts_1_="3"
           GRP_MntSweetProducts_2_="4"
           GRP_MntSweetProducts_3_="5"
           GRP_MntSweetProducts_4_="6"
           GRP_MntSweetProducts_5_="7"
           GRP_MntSweetProducts_6_="8"
           GRP_MntSweetProducts_7_="9"
           GRP_MntSweetProducts_8_="10"
           GRP_MntSweetProducts_9_="11"
           GRP_MntWines_1_="2"
           GRP_MntWines_2_="3"
           GRP_MntWines_3_="4"
           GRP_MntWines_4_="5"
           GRP_MntWines_5_="6"
           GRP_MntWines_6_="7"
           GRP_MntWines_7_="8"
           GRP_MntWines_8_="9"
           GRP_MntWines_9_="10"
           GRP_MntWines_10_="11"
           GRP_NumCatalogPurchases_1_="3"
           GRP_NumCatalogPurchases_2_="4"
           GRP_NumCatalogPurchases_3_="5"
           GRP_NumCatalogPurchases_4_="6"
           GRP_NumCatalogPurchases_5_="7"
           GRP_NumCatalogPurchases_6_="8"
           GRP_NumDistPurchases_1_="2"
           GRP_NumDistPurchases_2_="3"
           GRP_NumDistPurchases_3_="4"
           GRP_NumDistPurchases_4_="5"
           GRP_NumDistPurchases_5_="6"
           GRP_NumDistPurchases_6_="7"
           GRP_NumDistPurchases_7_="8"
           GRP_NumDistPurchases_8_="9"
           GRP_NumDistPurchases_9_="10"
           GRP_NumDistPurchases_10_="11"
           GRP_NumWebPurchases_1_="2"
           GRP_NumWebPurchases_2_="3"
           GRP_NumWebPurchases_3_="4"
           GRP_NumWebPurchases_4_="5"
           GRP_NumWebPurchases_5_="6"
           GRP_NumWebPurchases_6_="7"
           GRP_NumWebPurchases_7_="8"
           GRP_NumWebPurchases_8_="9"
           GRP_NumWebVisitsMonth_1_="2"
           GRP_NumWebVisitsMonth_2_="3"
           GRP_NumWebVisitsMonth_3_="4"
           GRP_NumWebVisitsMonth_4_="5"
           GRP_NumWebVisitsMonth_5_="6"
           GRP_NumWebVisitsMonth_6_="7"
           GRP_NumWebVisitsMonth_7_="8"
           GRP_NumWebVisitsMonth_8_="9"
           GRP_RFMstat_1_="2"
           GRP_RFMstat_2_="3"
           GRP_RFMstat_3_="4"
           GRP_RFMstat_4_="5"
           GRP_RFMstat_5_="6"
           GRP_RFMstat_6_="7"
           GRP_RFMstat_7_="8"
           GRP_RFMstat_8_="9"
           GRP_RFMstat_9_="10"
           GRP_RFMstat_10_="11"
           GRP_RMntFrq_1_="2"
           GRP_RMntFrq_2_="3"
           GRP_RMntFrq_3_="4"
           GRP_RMntFrq_4_="5"
           GRP_RMntFrq_5_="6"
           GRP_RMntFrq_6_="7"
           GRP_RMntFrq_7_="8"
           GRP_RMntFrq_8_="9"
           GRP_RMntFrq_9_="10"
           GRP_RMntFrq_10_="11"
           GRP_Recency_1_="2"
           GRP_Recency_2_="3"
           GRP_Recency_3_="4"
           GRP_Recency_4_="5"
           GRP_Recency_5_="6"
           GRP_Recency_6_="7"
           GRP_Recency_7_="8"
           GRP_Recency_8_="9"
           GRP_Recency_9_="10"
           GRP_Recency_10_="11"
           ;
_TARGET_="DepVar"; _TYPE_="_MEAN_"; _NAME_=""; _MEAN_=.; _STDEV_=.; GRP_AcceptedCmp5_1_=0.92; GRP_AcceptedCmp5_2_=0.08; GRP_AcceptedCmpTotal_1_=0.781; GRP_AcceptedCmpTotal_2_=0.219; GRP_Frq_1_=0.067;
GRP_Frq_2_=0.072; GRP_Frq_3_=0.089; GRP_Frq_4_=0.149; GRP_Frq_5_=0.085; GRP_Frq_6_=0.118; GRP_Frq_7_=0.073; GRP_Frq_8_=0.133; GRP_Frq_9_=0.109; GRP_Frq_10_=0.105; GRP_Income_1_=0.088;
GRP_Income_2_=0.096; GRP_Income_3_=0.099; GRP_Income_4_=0.107; GRP_Income_5_=0.107; GRP_Income_6_=0.092; GRP_Income_7_=0.096; GRP_Income_8_=0.111; GRP_Income_9_=0.101; GRP_Income_10_=0.103;
GRP_Mnt_1_=0.098; GRP_Mnt_2_=0.091; GRP_Mnt_3_=0.101; GRP_Mnt_4_=0.105; GRP_Mnt_5_=0.098; GRP_Mnt_6_=0.089; GRP_Mnt_7_=0.104; GRP_Mnt_8_=0.095; GRP_Mnt_9_=0.101; GRP_Mnt_10_=0.118;
GRP_MntFishProducts_1_=0.146; GRP_MntFishProducts_2_=0.13; GRP_MntFishProducts_3_=0.099; GRP_MntFishProducts_4_=0.119; GRP_MntFishProducts_5_=0.097; GRP_MntFishProducts_6_=0.101;
GRP_MntFishProducts_7_=0.104; GRP_MntFishProducts_8_=0.105; GRP_MntFishProducts_9_=0.099; GRP_MntGoldProds_1_=0.074; GRP_MntGoldProds_2_=0.12; GRP_MntGoldProds_3_=0.105; GRP_MntGoldProds_4_=0.108;
GRP_MntGoldProds_5_=0.085; GRP_MntGoldProds_6_=0.09; GRP_MntGoldProds_7_=0.116; GRP_MntGoldProds_8_=0.102; GRP_MntGoldProds_9_=0.101; GRP_MntGoldProds_10_=0.099; GRP_MntMeatProducts_1_=0.098;
GRP_MntMeatProducts_2_=0.099; GRP_MntMeatProducts_3_=0.095; GRP_MntMeatProducts_4_=0.097; GRP_MntMeatProducts_5_=0.1; GRP_MntMeatProducts_6_=0.11; GRP_MntMeatProducts_7_=0.087;
GRP_MntMeatProducts_8_=0.105; GRP_MntMeatProducts_9_=0.112; GRP_MntMeatProducts_10_=0.097; GRP_MntSweetProducts_1_=0.159; GRP_MntSweetProducts_2_=0.134; GRP_MntSweetProducts_3_=0.092;
GRP_MntSweetProducts_4_=0.105; GRP_MntSweetProducts_5_=0.106; GRP_MntSweetProducts_6_=0.105; GRP_MntSweetProducts_7_=0.088; GRP_MntSweetProducts_8_=0.106; GRP_MntSweetProducts_9_=0.105;
GRP_MntWines_1_=0.088; GRP_MntWines_2_=0.098; GRP_MntWines_3_=0.105; GRP_MntWines_4_=0.093; GRP_MntWines_5_=0.102; GRP_MntWines_6_=0.104; GRP_MntWines_7_=0.082; GRP_MntWines_8_=0.1;
GRP_MntWines_9_=0.109; GRP_MntWines_10_=0.119; GRP_NumCatalogPurchases_1_=0.244; GRP_NumCatalogPurchases_2_=0.225; GRP_NumCatalogPurchases_3_=0.225; GRP_NumCatalogPurchases_4_=0.084;
GRP_NumCatalogPurchases_5_=0.102; GRP_NumCatalogPurchases_6_=0.12; GRP_NumDistPurchases_1_=0.013; GRP_NumDistPurchases_2_=0.122; GRP_NumDistPurchases_3_=0.101; GRP_NumDistPurchases_4_=0.152;
GRP_NumDistPurchases_5_=0.066; GRP_NumDistPurchases_6_=0.123; GRP_NumDistPurchases_7_=0.062; GRP_NumDistPurchases_8_=0.123; GRP_NumDistPurchases_9_=0.092; GRP_NumDistPurchases_10_=0.146;
GRP_NumWebPurchases_1_=0.015; GRP_NumWebPurchases_2_=0.159; GRP_NumWebPurchases_3_=0.167; GRP_NumWebPurchases_4_=0.142; GRP_NumWebPurchases_5_=0.126; GRP_NumWebPurchases_6_=0.106;
GRP_NumWebPurchases_7_=0.149; GRP_NumWebPurchases_8_=0.136; GRP_NumWebVisitsMonth_1_=0.069; GRP_NumWebVisitsMonth_2_=0.088; GRP_NumWebVisitsMonth_3_=0.113; GRP_NumWebVisitsMonth_4_=0.094;
GRP_NumWebVisitsMonth_5_=0.127; GRP_NumWebVisitsMonth_6_=0.15; GRP_NumWebVisitsMonth_7_=0.152; GRP_NumWebVisitsMonth_8_=0.207; GRP_RFMstat_1_=0.095; GRP_RFMstat_2_=0.097; GRP_RFMstat_3_=0.101;
GRP_RFMstat_4_=0.107; GRP_RFMstat_5_=0.1; GRP_RFMstat_6_=0.091; GRP_RFMstat_7_=0.093; GRP_RFMstat_8_=0.102; GRP_RFMstat_9_=0.108; GRP_RFMstat_10_=0.106; GRP_RMntFrq_1_=0.1; GRP_RMntFrq_2_=0.08;
GRP_RMntFrq_3_=0.113; GRP_RMntFrq_4_=0.106; GRP_RMntFrq_5_=0.09; GRP_RMntFrq_6_=0.102; GRP_RMntFrq_7_=0.088; GRP_RMntFrq_8_=0.097; GRP_RMntFrq_9_=0.115; GRP_RMntFrq_10_=0.109; GRP_Recency_1_=0.099;
GRP_Recency_2_=0.101; GRP_Recency_3_=0.119; GRP_Recency_4_=0.1; GRP_Recency_5_=0.091; GRP_Recency_6_=0.089; GRP_Recency_7_=0.093; GRP_Recency_8_=0.105; GRP_Recency_9_=0.102; GRP_Recency_10_=0.101;
Year_Birth=1968.821;
output;
_TARGET_="DepVar"; _TYPE_="_STDEV_"; _NAME_=""; _MEAN_=.; _STDEV_=.; GRP_AcceptedCmp5_1_=0.27142894774447; GRP_AcceptedCmp5_2_=0.27142894774447; GRP_AcceptedCmpTotal_1_=0.41377555535605;
GRP_AcceptedCmpTotal_2_=0.41377555535605; GRP_Frq_1_=0.25014710386805; GRP_Frq_2_=0.25861725171164; GRP_Frq_3_=0.2848862231842; GRP_Frq_4_=0.35626665003326; GRP_Frq_5_=0.27902124086322;
GRP_Frq_6_=0.32276954655013; GRP_Frq_7_=0.26026666851277; GRP_Frq_8_=0.3397446488562; GRP_Frq_9_=0.31179515104667; GRP_Frq_10_=0.30670681288336; GRP_Income_1_=0.28343665312788;
GRP_Income_2_=0.29473864841732; GRP_Income_3_=0.29881145943268; GRP_Income_4_=0.30926792049394; GRP_Income_5_=0.30926792049394; GRP_Income_6_=0.28917057184232; GRP_Income_7_=0.29473864841732;
GRP_Income_8_=0.31428932176861; GRP_Income_9_=0.30147950160813; GRP_Income_10_=0.30411097231682; GRP_Mnt_1_=0.29746341705239; GRP_Mnt_2_=0.28775302222878; GRP_Mnt_3_=0.30147950160813;
GRP_Mnt_4_=0.30670681288336; GRP_Mnt_5_=0.29746341705239; GRP_Mnt_6_=0.2848862231842; GRP_Mnt_7_=0.30541328929383; GRP_Mnt_8_=0.29336165574434; GRP_Mnt_9_=0.30147950160813;
GRP_Mnt_10_=0.32276954655013; GRP_MntFishProducts_1_=0.35328290194801; GRP_MntFishProducts_2_=0.33647171235218; GRP_MntFishProducts_3_=0.29881145943268; GRP_MntFishProducts_4_=0.32395052700056;
GRP_MntFishProducts_5_=0.29610585721778; GRP_MntFishProducts_6_=0.30147950160813; GRP_MntFishProducts_7_=0.30541328929383; GRP_MntFishProducts_8_=0.30670681288336;
GRP_MntFishProducts_9_=0.29881145943268; GRP_MntGoldProds_1_=0.26190187588597; GRP_MntGoldProds_2_=0.32512413891574; GRP_MntGoldProds_3_=0.30670681288336; GRP_MntGoldProds_4_=0.31053571844867;
GRP_MntGoldProds_5_=0.27902124086322; GRP_MntGoldProds_6_=0.28632495871296; GRP_MntGoldProds_7_=0.32038515359898; GRP_MntGoldProds_8_=0.30279974849343; GRP_MntGoldProds_9_=0.30147950160813;
GRP_MntGoldProds_10_=0.29881145943268; GRP_MntMeatProducts_1_=0.29746341705239; GRP_MntMeatProducts_2_=0.29881145943268; GRP_MntMeatProducts_3_=0.29336165574434;
GRP_MntMeatProducts_4_=0.29610585721778; GRP_MntMeatProducts_5_=0.30015011259383; GRP_MntMeatProducts_6_=0.31304631925323; GRP_MntMeatProducts_7_=0.28197608145108;
GRP_MntMeatProducts_8_=0.30670681288336; GRP_MntMeatProducts_9_=0.31552425509864; GRP_MntMeatProducts_10_=0.29610585721778; GRP_MntSweetProducts_1_=0.36585906146062;
GRP_MntSweetProducts_2_=0.34082276942739; GRP_MntSweetProducts_3_=0.28917057184232; GRP_MntSweetProducts_4_=0.30670681288336; GRP_MntSweetProducts_5_=0.30799165387857;
GRP_MntSweetProducts_6_=0.30670681288336; GRP_MntSweetProducts_7_=0.28343665312788; GRP_MntSweetProducts_8_=0.30799165387857; GRP_MntSweetProducts_9_=0.30670681288336;
GRP_MntWines_1_=0.28343665312788; GRP_MntWines_2_=0.29746341705239; GRP_MntWines_3_=0.30670681288336; GRP_MntWines_4_=0.29057776142615; GRP_MntWines_5_=0.30279974849343;
GRP_MntWines_6_=0.30541328929383; GRP_MntWines_7_=0.27450200609713; GRP_MntWines_8_=0.30015011259383; GRP_MntWines_9_=0.31179515104667; GRP_MntWines_10_=0.32395052700056;
GRP_NumCatalogPurchases_1_=0.42970763159228; GRP_NumCatalogPurchases_2_=0.41779127509983; GRP_NumCatalogPurchases_3_=0.41779127509983; GRP_NumCatalogPurchases_4_=0.27752661317614;
GRP_NumCatalogPurchases_5_=0.30279974849343; GRP_NumCatalogPurchases_6_=0.32512413891574; GRP_NumDistPurchases_1_=0.11333068359382; GRP_NumDistPurchases_2_=0.32744957355785;
GRP_NumDistPurchases_3_=0.30147950160813; GRP_NumDistPurchases_4_=0.35920053594757; GRP_NumDistPurchases_5_=0.24840633185509; GRP_NumDistPurchases_6_=0.3286015504817;
GRP_NumDistPurchases_7_=0.24127621974453; GRP_NumDistPurchases_8_=0.3286015504817; GRP_NumDistPurchases_9_=0.28917057184232; GRP_NumDistPurchases_10_=0.35328290194801;
GRP_NumWebPurchases_1_=0.12161327966052; GRP_NumWebPurchases_2_=0.36585906146062; GRP_NumWebPurchases_3_=0.37316249845107; GRP_NumWebPurchases_4_=0.34922479573758;
GRP_NumWebPurchases_5_=0.3320154126456; GRP_NumWebPurchases_6_=0.30799165387857; GRP_NumWebPurchases_7_=0.35626665003326; GRP_NumWebPurchases_8_=0.34296008750526;
GRP_NumWebVisitsMonth_1_=0.25358096005675; GRP_NumWebVisitsMonth_2_=0.28343665312788; GRP_NumWebVisitsMonth_3_=0.3167512136225; GRP_NumWebVisitsMonth_4_=0.29197474077263;
GRP_NumWebVisitsMonth_5_=0.33313958333104; GRP_NumWebVisitsMonth_6_=0.35725009115132; GRP_NumWebVisitsMonth_7_=0.35920053594757; GRP_NumWebVisitsMonth_8_=0.40535825551642;
GRP_RFMstat_1_=0.29336165574434; GRP_RFMstat_2_=0.29610585721778; GRP_RFMstat_3_=0.30147950160813; GRP_RFMstat_4_=0.30926792049394; GRP_RFMstat_5_=0.30015011259383; GRP_RFMstat_6_=0.28775302222878;
GRP_RFMstat_7_=0.29057776142615; GRP_RFMstat_8_=0.30279974849343; GRP_RFMstat_9_=0.31053571844867; GRP_RFMstat_10_=0.30799165387857; GRP_RMntFrq_1_=0.30015011259383; GRP_RMntFrq_2_=0.27142894774447;
GRP_RMntFrq_3_=0.3167512136225; GRP_RMntFrq_4_=0.30799165387857; GRP_RMntFrq_5_=0.28632495871296; GRP_RMntFrq_6_=0.30279974849343; GRP_RMntFrq_7_=0.28343665312788; GRP_RMntFrq_8_=0.29610585721778;
GRP_RMntFrq_9_=0.3191815735234; GRP_RMntFrq_10_=0.31179515104667; GRP_Recency_1_=0.29881145943268; GRP_Recency_2_=0.30147950160813; GRP_Recency_3_=0.32395052700056; GRP_Recency_4_=0.30015011259383;
GRP_Recency_5_=0.28775302222878; GRP_Recency_6_=0.2848862231842; GRP_Recency_7_=0.29057776142615; GRP_Recency_8_=0.30670681288336; GRP_Recency_9_=0.30279974849343; GRP_Recency_10_=0.30147950160813;
Year_Birth=12.1302143881173;
output;
_TARGET_="DepVar"; _TYPE_="_PARMS_"; _NAME_=""; _MEAN_=-2.08125986490477; _STDEV_=0; GRP_AcceptedCmp5_1_=-0.22581472604354; GRP_AcceptedCmp5_2_=0.22581472604354;
GRP_AcceptedCmpTotal_1_=-0.41040834429667; GRP_AcceptedCmpTotal_2_=0.41040834429667; GRP_Frq_1_=0.20655553687739; GRP_Frq_2_=0.70241075129849; GRP_Frq_3_=0.46453040016663;
GRP_Frq_4_=0.21868186025588; GRP_Frq_5_=-0.09462065444363; GRP_Frq_6_=-0.01145000538864; GRP_Frq_7_=-0.02652593473956; GRP_Frq_8_=-0.15613586752541; GRP_Frq_9_=-0.58614701477108;
GRP_Frq_10_=-0.71729907172993; GRP_Income_1_=-0.26304891038014; GRP_Income_2_=-0.44276158502722; GRP_Income_3_=-0.04675415515611; GRP_Income_4_=0.4500753051468; GRP_Income_5_=0.305651559205;
GRP_Income_6_=-0.24296999341596; GRP_Income_7_=-0.07594325288598; GRP_Income_8_=-0.0734499536547; GRP_Income_9_=0.09713819655019; GRP_Income_10_=0.29206278961827; GRP_Mnt_1_=0.67151885539824;
GRP_Mnt_2_=0.44390074151133; GRP_Mnt_3_=-0.18038822021785; GRP_Mnt_4_=-0.18649521701657; GRP_Mnt_5_=0.03064698486928; GRP_Mnt_6_=-0.50337332399677; GRP_Mnt_7_=-0.51033859378401;
GRP_Mnt_8_=-0.13154551976869; GRP_Mnt_9_=0.18558450930847; GRP_Mnt_10_=0.18048978369669; GRP_MntFishProducts_1_=0.0103566312843; GRP_MntFishProducts_2_=0.21098140251495;
GRP_MntFishProducts_3_=0.04817045719666; GRP_MntFishProducts_4_=-0.2078931238798; GRP_MntFishProducts_5_=0.09883818679926; GRP_MntFishProducts_6_=0.33725698121572;
GRP_MntFishProducts_7_=-0.14458425189513; GRP_MntFishProducts_8_=0.03583891340473; GRP_MntFishProducts_9_=-0.38896519664058; GRP_MntGoldProds_1_=0.68827300584297;
GRP_MntGoldProds_2_=0.33131242613515; GRP_MntGoldProds_3_=-0.0988727705116; GRP_MntGoldProds_4_=-0.02948241670558; GRP_MntGoldProds_5_=0.22346706134342; GRP_MntGoldProds_6_=-0.04773711203985;
GRP_MntGoldProds_7_=-0.06922689993906; GRP_MntGoldProds_8_=-0.35918204170365; GRP_MntGoldProds_9_=-0.31588882783357; GRP_MntGoldProds_10_=-0.32266242458807; GRP_MntMeatProducts_1_=-1.39126904571555;
GRP_MntMeatProducts_2_=-0.4186157002482; GRP_MntMeatProducts_3_=-0.25344655960659; GRP_MntMeatProducts_4_=-0.37026142491325; GRP_MntMeatProducts_5_=0.12110235267267;
GRP_MntMeatProducts_6_=0.06543049509113; GRP_MntMeatProducts_7_=0.50113111645388; GRP_MntMeatProducts_8_=0.46015697951423; GRP_MntMeatProducts_9_=0.6253561265087;
GRP_MntMeatProducts_10_=0.6604156602431; GRP_MntSweetProducts_1_=-0.45915012973801; GRP_MntSweetProducts_2_=-0.08206627586462; GRP_MntSweetProducts_3_=-0.23881128611608;
GRP_MntSweetProducts_4_=0.05869779337121; GRP_MntSweetProducts_5_=0.2232947539393; GRP_MntSweetProducts_6_=-0.02046810946707; GRP_MntSweetProducts_7_=0.19136970632939;
GRP_MntSweetProducts_8_=0.26847185846293; GRP_MntSweetProducts_9_=0.05866168908308; GRP_MntWines_1_=0.39567015157772; GRP_MntWines_2_=0.13170502797144; GRP_MntWines_3_=0.16590358337585;
GRP_MntWines_4_=0.54401609534199; GRP_MntWines_5_=0.24735193392397; GRP_MntWines_6_=0.05240581898438; GRP_MntWines_7_=0.05458857302145; GRP_MntWines_8_=-0.35295977545485;
GRP_MntWines_9_=-0.75579998743957; GRP_MntWines_10_=-0.48288142130226; GRP_NumCatalogPurchases_1_=-1.40393670177514; GRP_NumCatalogPurchases_2_=-0.53719344857793;
GRP_NumCatalogPurchases_3_=0.04430896591537; GRP_NumCatalogPurchases_4_=0.47462026377705; GRP_NumCatalogPurchases_5_=0.43709301428307; GRP_NumCatalogPurchases_6_=0.98510790637764;
GRP_NumDistPurchases_1_=1.8873791418627E-14; GRP_NumDistPurchases_2_=-0.50838615904173; GRP_NumDistPurchases_3_=0.14453498817542; GRP_NumDistPurchases_4_=0.47475720576959;
GRP_NumDistPurchases_5_=0.07918524012726; GRP_NumDistPurchases_6_=-0.36305540155146; GRP_NumDistPurchases_7_=-0.82667324267368; GRP_NumDistPurchases_8_=0.0403819603475;
GRP_NumDistPurchases_9_=0.55836676270462; GRP_NumDistPurchases_10_=0.40088864614257; GRP_NumWebPurchases_1_=1.8873791418627E-14; GRP_NumWebPurchases_2_=0.07713277882693;
GRP_NumWebPurchases_3_=-0.00620696536375; GRP_NumWebPurchases_4_=-0.01130517929842; GRP_NumWebPurchases_5_=0.05275793358608; GRP_NumWebPurchases_6_=0.57018562871718;
GRP_NumWebPurchases_7_=-0.20405639013773; GRP_NumWebPurchases_8_=-0.47850780633019; GRP_NumWebVisitsMonth_1_=-0.82422415709216; GRP_NumWebVisitsMonth_2_=-0.4810151629646;
GRP_NumWebVisitsMonth_3_=-0.70926202509174; GRP_NumWebVisitsMonth_4_=-0.45608684762267; GRP_NumWebVisitsMonth_5_=-0.15182368166098; GRP_NumWebVisitsMonth_6_=0.44414894980172;
GRP_NumWebVisitsMonth_7_=0.67338766251526; GRP_NumWebVisitsMonth_8_=1.50487526211528; GRP_RFMstat_1_=0.02872653439852; GRP_RFMstat_2_=-0.19946288174482; GRP_RFMstat_3_=-0.34104210348882;
GRP_RFMstat_4_=-0.33730448612097; GRP_RFMstat_5_=0.09265285069028; GRP_RFMstat_6_=0.16271745671701; GRP_RFMstat_7_=-0.14437071394575; GRP_RFMstat_8_=0.072997488214; GRP_RFMstat_9_=0.24125641140122;
GRP_RFMstat_10_=0.42382944387945; GRP_RMntFrq_1_=0.36373217954953; GRP_RMntFrq_2_=0.01142900127695; GRP_RMntFrq_3_=-0.01450841231986; GRP_RMntFrq_4_=-0.405225117198; GRP_RMntFrq_5_=-0.12316373178203;
GRP_RMntFrq_6_=0.21041453965015; GRP_RMntFrq_7_=-0.11595971282951; GRP_RMntFrq_8_=0.02195061407585; GRP_RMntFrq_9_=-0.00766298672361; GRP_RMntFrq_10_=0.05899362630068;
GRP_Recency_1_=0.86672525423229; GRP_Recency_2_=0.58374975189556; GRP_Recency_3_=0.84006454381292; GRP_Recency_4_=0.71652159397914; GRP_Recency_5_=0.08192790916856; GRP_Recency_6_=-0.21955331909845;
GRP_Recency_7_=-0.33673674096804; GRP_Recency_8_=-0.67815589067011; GRP_Recency_9_=-0.45454310235175; GRP_Recency_10_=-1.39999999999998; Year_Birth=0.15039279684926;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Intercept"; _MEAN_=.; _STDEV_=.; GRP_AcceptedCmp5_1_=-1; GRP_AcceptedCmp5_2_=-1; GRP_AcceptedCmpTotal_1_=-1; GRP_AcceptedCmpTotal_2_=-1; GRP_Frq_1_=-1;
GRP_Frq_2_=-1; GRP_Frq_3_=-1; GRP_Frq_4_=-1; GRP_Frq_5_=-1; GRP_Frq_6_=-1; GRP_Frq_7_=-1; GRP_Frq_8_=-1; GRP_Frq_9_=-1; GRP_Frq_10_=-1; GRP_Income_1_=-1; GRP_Income_2_=-1; GRP_Income_3_=-1;
GRP_Income_4_=-1; GRP_Income_5_=-1; GRP_Income_6_=-1; GRP_Income_7_=-1; GRP_Income_8_=-1; GRP_Income_9_=-1; GRP_Income_10_=-1; GRP_Mnt_1_=-1; GRP_Mnt_2_=-1; GRP_Mnt_3_=-1; GRP_Mnt_4_=-1;
GRP_Mnt_5_=-1; GRP_Mnt_6_=-1; GRP_Mnt_7_=-1; GRP_Mnt_8_=-1; GRP_Mnt_9_=-1; GRP_Mnt_10_=-1; GRP_MntFishProducts_1_=-1; GRP_MntFishProducts_2_=-1; GRP_MntFishProducts_3_=-1; GRP_MntFishProducts_4_=-1;
GRP_MntFishProducts_5_=-1; GRP_MntFishProducts_6_=-1; GRP_MntFishProducts_7_=-1; GRP_MntFishProducts_8_=-1; GRP_MntFishProducts_9_=-1; GRP_MntGoldProds_1_=-1; GRP_MntGoldProds_2_=-1;
GRP_MntGoldProds_3_=-1; GRP_MntGoldProds_4_=-1; GRP_MntGoldProds_5_=-1; GRP_MntGoldProds_6_=-1; GRP_MntGoldProds_7_=-1; GRP_MntGoldProds_8_=-1; GRP_MntGoldProds_9_=-1; GRP_MntGoldProds_10_=-1;
GRP_MntMeatProducts_1_=-1; GRP_MntMeatProducts_2_=-1; GRP_MntMeatProducts_3_=-1; GRP_MntMeatProducts_4_=-1; GRP_MntMeatProducts_5_=-1; GRP_MntMeatProducts_6_=-1; GRP_MntMeatProducts_7_=-1;
GRP_MntMeatProducts_8_=-1; GRP_MntMeatProducts_9_=-1; GRP_MntMeatProducts_10_=-1; GRP_MntSweetProducts_1_=-1; GRP_MntSweetProducts_2_=-1; GRP_MntSweetProducts_3_=-1; GRP_MntSweetProducts_4_=-1;
GRP_MntSweetProducts_5_=-1; GRP_MntSweetProducts_6_=-1; GRP_MntSweetProducts_7_=-1; GRP_MntSweetProducts_8_=-1; GRP_MntSweetProducts_9_=-1; GRP_MntWines_1_=-1; GRP_MntWines_2_=-1; GRP_MntWines_3_=-1;
GRP_MntWines_4_=-1; GRP_MntWines_5_=-1; GRP_MntWines_6_=-1; GRP_MntWines_7_=-1; GRP_MntWines_8_=-1; GRP_MntWines_9_=-1; GRP_MntWines_10_=-1; GRP_NumCatalogPurchases_1_=-1;
GRP_NumCatalogPurchases_2_=-1; GRP_NumCatalogPurchases_3_=-1; GRP_NumCatalogPurchases_4_=-1; GRP_NumCatalogPurchases_5_=-1; GRP_NumCatalogPurchases_6_=-1; GRP_NumDistPurchases_1_=-1;
GRP_NumDistPurchases_2_=-1; GRP_NumDistPurchases_3_=-1; GRP_NumDistPurchases_4_=-1; GRP_NumDistPurchases_5_=-1; GRP_NumDistPurchases_6_=-1; GRP_NumDistPurchases_7_=-1; GRP_NumDistPurchases_8_=-1;
GRP_NumDistPurchases_9_=-1; GRP_NumDistPurchases_10_=-1; GRP_NumWebPurchases_1_=-1; GRP_NumWebPurchases_2_=-1; GRP_NumWebPurchases_3_=-1; GRP_NumWebPurchases_4_=-1; GRP_NumWebPurchases_5_=-1;
GRP_NumWebPurchases_6_=-1; GRP_NumWebPurchases_7_=-1; GRP_NumWebPurchases_8_=-1; GRP_NumWebVisitsMonth_1_=-1; GRP_NumWebVisitsMonth_2_=-1; GRP_NumWebVisitsMonth_3_=-1; GRP_NumWebVisitsMonth_4_=-1;
GRP_NumWebVisitsMonth_5_=-1; GRP_NumWebVisitsMonth_6_=-1; GRP_NumWebVisitsMonth_7_=-1; GRP_NumWebVisitsMonth_8_=-1; GRP_RFMstat_1_=-1; GRP_RFMstat_2_=-1; GRP_RFMstat_3_=-1; GRP_RFMstat_4_=-1;
GRP_RFMstat_5_=-1; GRP_RFMstat_6_=-1; GRP_RFMstat_7_=-1; GRP_RFMstat_8_=-1; GRP_RFMstat_9_=-1; GRP_RFMstat_10_=-1; GRP_RMntFrq_1_=-1; GRP_RMntFrq_2_=-1; GRP_RMntFrq_3_=-1; GRP_RMntFrq_4_=-1;
GRP_RMntFrq_5_=-1; GRP_RMntFrq_6_=-1; GRP_RMntFrq_7_=-1; GRP_RMntFrq_8_=-1; GRP_RMntFrq_9_=-1; GRP_RMntFrq_10_=-1; GRP_Recency_1_=-1; GRP_Recency_2_=-1; GRP_Recency_3_=-1; GRP_Recency_4_=-1;
GRP_Recency_5_=-1; GRP_Recency_6_=-1; GRP_Recency_7_=-1; GRP_Recency_8_=-1; GRP_Recency_9_=-1; GRP_Recency_10_=-1; Year_Birth=-72.9259259259259;
output;
_TARGET_="DepVar"; _TYPE_="_Standard"; _NAME_="_Scale"; _MEAN_=.; _STDEV_=.; GRP_AcceptedCmp5_1_=2; GRP_AcceptedCmp5_2_=2; GRP_AcceptedCmpTotal_1_=2; GRP_AcceptedCmpTotal_2_=2; GRP_Frq_1_=2;
GRP_Frq_2_=2; GRP_Frq_3_=2; GRP_Frq_4_=2; GRP_Frq_5_=2; GRP_Frq_6_=2; GRP_Frq_7_=2; GRP_Frq_8_=2; GRP_Frq_9_=2; GRP_Frq_10_=2; GRP_Income_1_=2; GRP_Income_2_=2; GRP_Income_3_=2; GRP_Income_4_=2;
GRP_Income_5_=2; GRP_Income_6_=2; GRP_Income_7_=2; GRP_Income_8_=2; GRP_Income_9_=2; GRP_Income_10_=2; GRP_Mnt_1_=2; GRP_Mnt_2_=2; GRP_Mnt_3_=2; GRP_Mnt_4_=2; GRP_Mnt_5_=2; GRP_Mnt_6_=2;
GRP_Mnt_7_=2; GRP_Mnt_8_=2; GRP_Mnt_9_=2; GRP_Mnt_10_=2; GRP_MntFishProducts_1_=2; GRP_MntFishProducts_2_=2; GRP_MntFishProducts_3_=2; GRP_MntFishProducts_4_=2; GRP_MntFishProducts_5_=2;
GRP_MntFishProducts_6_=2; GRP_MntFishProducts_7_=2; GRP_MntFishProducts_8_=2; GRP_MntFishProducts_9_=2; GRP_MntGoldProds_1_=2; GRP_MntGoldProds_2_=2; GRP_MntGoldProds_3_=2; GRP_MntGoldProds_4_=2;
GRP_MntGoldProds_5_=2; GRP_MntGoldProds_6_=2; GRP_MntGoldProds_7_=2; GRP_MntGoldProds_8_=2; GRP_MntGoldProds_9_=2; GRP_MntGoldProds_10_=2; GRP_MntMeatProducts_1_=2; GRP_MntMeatProducts_2_=2;
GRP_MntMeatProducts_3_=2; GRP_MntMeatProducts_4_=2; GRP_MntMeatProducts_5_=2; GRP_MntMeatProducts_6_=2; GRP_MntMeatProducts_7_=2; GRP_MntMeatProducts_8_=2; GRP_MntMeatProducts_9_=2;
GRP_MntMeatProducts_10_=2; GRP_MntSweetProducts_1_=2; GRP_MntSweetProducts_2_=2; GRP_MntSweetProducts_3_=2; GRP_MntSweetProducts_4_=2; GRP_MntSweetProducts_5_=2; GRP_MntSweetProducts_6_=2;
GRP_MntSweetProducts_7_=2; GRP_MntSweetProducts_8_=2; GRP_MntSweetProducts_9_=2; GRP_MntWines_1_=2; GRP_MntWines_2_=2; GRP_MntWines_3_=2; GRP_MntWines_4_=2; GRP_MntWines_5_=2; GRP_MntWines_6_=2;
GRP_MntWines_7_=2; GRP_MntWines_8_=2; GRP_MntWines_9_=2; GRP_MntWines_10_=2; GRP_NumCatalogPurchases_1_=2; GRP_NumCatalogPurchases_2_=2; GRP_NumCatalogPurchases_3_=2; GRP_NumCatalogPurchases_4_=2;
GRP_NumCatalogPurchases_5_=2; GRP_NumCatalogPurchases_6_=2; GRP_NumDistPurchases_1_=2; GRP_NumDistPurchases_2_=2; GRP_NumDistPurchases_3_=2; GRP_NumDistPurchases_4_=2; GRP_NumDistPurchases_5_=2;
GRP_NumDistPurchases_6_=2; GRP_NumDistPurchases_7_=2; GRP_NumDistPurchases_8_=2; GRP_NumDistPurchases_9_=2; GRP_NumDistPurchases_10_=2; GRP_NumWebPurchases_1_=2; GRP_NumWebPurchases_2_=2;
GRP_NumWebPurchases_3_=2; GRP_NumWebPurchases_4_=2; GRP_NumWebPurchases_5_=2; GRP_NumWebPurchases_6_=2; GRP_NumWebPurchases_7_=2; GRP_NumWebPurchases_8_=2; GRP_NumWebVisitsMonth_1_=2;
GRP_NumWebVisitsMonth_2_=2; GRP_NumWebVisitsMonth_3_=2; GRP_NumWebVisitsMonth_4_=2; GRP_NumWebVisitsMonth_5_=2; GRP_NumWebVisitsMonth_6_=2; GRP_NumWebVisitsMonth_7_=2; GRP_NumWebVisitsMonth_8_=2;
GRP_RFMstat_1_=2; GRP_RFMstat_2_=2; GRP_RFMstat_3_=2; GRP_RFMstat_4_=2; GRP_RFMstat_5_=2; GRP_RFMstat_6_=2; GRP_RFMstat_7_=2; GRP_RFMstat_8_=2; GRP_RFMstat_9_=2; GRP_RFMstat_10_=2; GRP_RMntFrq_1_=2;
GRP_RMntFrq_2_=2; GRP_RMntFrq_3_=2; GRP_RMntFrq_4_=2; GRP_RMntFrq_5_=2; GRP_RMntFrq_6_=2; GRP_RMntFrq_7_=2; GRP_RMntFrq_8_=2; GRP_RMntFrq_9_=2; GRP_RMntFrq_10_=2; GRP_Recency_1_=2; GRP_Recency_2_=2;
GRP_Recency_3_=2; GRP_Recency_4_=2; GRP_Recency_5_=2; GRP_Recency_6_=2; GRP_Recency_7_=2; GRP_Recency_8_=2; GRP_Recency_9_=2; GRP_Recency_10_=2; Year_Birth=0.03703703703703;
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
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_FITIND_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=1; _NCV_=18;
_NOBS_=1000; _NTRAIN_=1000; _NCLEV_=144; _NYLEV_=2; _ACCU_=42; _L1_=.; _RegC_=0.7; _NSV_=216; _SVOM_=98; _Bias_=0; _NLV_=12.0415945787922; _Radius_=12.0415945787922; _VCDim_=4029.85418439965;
_OBJ_=-88.7884211711186; _NormW_=27.7852012717217; _Margin_=0.37942262305926; _K_PAR_=-2.08125986490477; _K_PAR2_=.; _K_PAR3_=.;
output;
_TARGET_="DepVar"; _Y_SCALE_="BINARY"; _X_SCALE_="SCALE_X"; _DATA_="TRAINING"; _TYPE_="_ACCTAB_"; _TASK_=" C_CLAS"; _METHOD_=" FQP"; _KERNEL_="      Linear"; _CONVER_="_CONVER_"; _NIV_=831; _NCV_=18;
_NOBS_=0; _NTRAIN_=24; _NCLEV_=127; _NYLEV_=0; _ACCU_=0; _L1_=0; _RegC_=0; _NSV_=.; _SVOM_=.; _Bias_=.; _NLV_=.; _Radius_=.; _VCDim_=.; _OBJ_=.; _NormW_=.; _Margin_=.; _K_PAR_=.; _K_PAR2_=.;
_K_PAR3_=.;
output;
;
run;
data WORK._inoutclass;
  length   _NAME_                           $  26
           _VAR_                            $  23
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
_NAME_="GRP_AcceptedCmp5_1_"; _VAR_="GRP_AcceptedCmp5"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_AcceptedCmp5_2_"; _VAR_="GRP_AcceptedCmp5"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_AcceptedCmpTotal_1_"; _VAR_="GRP_AcceptedCmpTotal"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_AcceptedCmpTotal_2_"; _VAR_="GRP_AcceptedCmpTotal"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_1_"; _VAR_="GRP_Frq"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_2_"; _VAR_="GRP_Frq"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_3_"; _VAR_="GRP_Frq"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_4_"; _VAR_="GRP_Frq"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_5_"; _VAR_="GRP_Frq"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_6_"; _VAR_="GRP_Frq"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_7_"; _VAR_="GRP_Frq"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_8_"; _VAR_="GRP_Frq"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_9_"; _VAR_="GRP_Frq"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Frq_10_"; _VAR_="GRP_Frq"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_1_"; _VAR_="GRP_Income"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_2_"; _VAR_="GRP_Income"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_3_"; _VAR_="GRP_Income"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_4_"; _VAR_="GRP_Income"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_5_"; _VAR_="GRP_Income"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_6_"; _VAR_="GRP_Income"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_7_"; _VAR_="GRP_Income"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_8_"; _VAR_="GRP_Income"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_9_"; _VAR_="GRP_Income"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Income_10_"; _VAR_="GRP_Income"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_1_"; _VAR_="GRP_Mnt"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_2_"; _VAR_="GRP_Mnt"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_3_"; _VAR_="GRP_Mnt"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_4_"; _VAR_="GRP_Mnt"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_5_"; _VAR_="GRP_Mnt"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_6_"; _VAR_="GRP_Mnt"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_7_"; _VAR_="GRP_Mnt"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_8_"; _VAR_="GRP_Mnt"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_9_"; _VAR_="GRP_Mnt"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Mnt_10_"; _VAR_="GRP_Mnt"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_1_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_2_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_3_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_4_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_5_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_6_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_7_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_8_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntFishProducts_9_"; _VAR_="GRP_MntFishProducts"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_1_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_2_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_3_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_4_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_5_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_6_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_7_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_8_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_9_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntGoldProds_10_"; _VAR_="GRP_MntGoldProds"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_1_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_2_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_3_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_4_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_5_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_6_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_7_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_8_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_9_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntMeatProducts_10_"; _VAR_="GRP_MntMeatProducts"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_1_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_2_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_3_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_4_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_5_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_6_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_7_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_8_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntSweetProducts_9_"; _VAR_="GRP_MntSweetProducts"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_1_"; _VAR_="GRP_MntWines"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_2_"; _VAR_="GRP_MntWines"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_3_"; _VAR_="GRP_MntWines"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_4_"; _VAR_="GRP_MntWines"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_5_"; _VAR_="GRP_MntWines"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_6_"; _VAR_="GRP_MntWines"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_7_"; _VAR_="GRP_MntWines"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_8_"; _VAR_="GRP_MntWines"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_9_"; _VAR_="GRP_MntWines"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_MntWines_10_"; _VAR_="GRP_MntWines"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumCatalogPurchases_1_"; _VAR_="GRP_NumCatalogPurchases"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumCatalogPurchases_2_"; _VAR_="GRP_NumCatalogPurchases"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumCatalogPurchases_3_"; _VAR_="GRP_NumCatalogPurchases"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumCatalogPurchases_4_"; _VAR_="GRP_NumCatalogPurchases"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumCatalogPurchases_5_"; _VAR_="GRP_NumCatalogPurchases"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumCatalogPurchases_6_"; _VAR_="GRP_NumCatalogPurchases"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_1_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_2_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_3_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_4_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_5_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_6_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_7_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_8_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_9_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumDistPurchases_10_"; _VAR_="GRP_NumDistPurchases"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_1_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_2_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_3_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_4_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_5_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_6_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_7_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebPurchases_8_"; _VAR_="GRP_NumWebPurchases"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_1_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_2_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_3_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_4_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_5_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_6_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_7_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_NumWebVisitsMonth_8_"; _VAR_="GRP_NumWebVisitsMonth"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_1_"; _VAR_="GRP_RFMstat"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_2_"; _VAR_="GRP_RFMstat"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_3_"; _VAR_="GRP_RFMstat"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_4_"; _VAR_="GRP_RFMstat"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_5_"; _VAR_="GRP_RFMstat"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_6_"; _VAR_="GRP_RFMstat"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_7_"; _VAR_="GRP_RFMstat"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_8_"; _VAR_="GRP_RFMstat"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_9_"; _VAR_="GRP_RFMstat"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RFMstat_10_"; _VAR_="GRP_RFMstat"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_1_"; _VAR_="GRP_RMntFrq"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_2_"; _VAR_="GRP_RMntFrq"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_3_"; _VAR_="GRP_RMntFrq"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_4_"; _VAR_="GRP_RMntFrq"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_5_"; _VAR_="GRP_RMntFrq"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_6_"; _VAR_="GRP_RMntFrq"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_7_"; _VAR_="GRP_RMntFrq"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_8_"; _VAR_="GRP_RMntFrq"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_9_"; _VAR_="GRP_RMntFrq"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_RMntFrq_10_"; _VAR_="GRP_RMntFrq"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_1_"; _VAR_="GRP_Recency"; _LEVEL_="2"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_2_"; _VAR_="GRP_Recency"; _LEVEL_="3"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_3_"; _VAR_="GRP_Recency"; _LEVEL_="4"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_4_"; _VAR_="GRP_Recency"; _LEVEL_="5"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_5_"; _VAR_="GRP_Recency"; _LEVEL_="6"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_6_"; _VAR_="GRP_Recency"; _LEVEL_="7"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_7_"; _VAR_="GRP_Recency"; _LEVEL_="8"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_8_"; _VAR_="GRP_Recency"; _LEVEL_="9"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_9_"; _VAR_="GRP_Recency"; _LEVEL_="10"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
output;
_NAME_="GRP_Recency_10_"; _VAR_="GRP_Recency"; _LEVEL_="11"; _CTYP_=1; _UNFMT_=1; _CNLN_=12; _CULN_=8; _CLMIS_=2147000000; _ORDER_=1;
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
