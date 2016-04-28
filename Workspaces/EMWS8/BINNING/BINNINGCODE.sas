*------------------------------------------------------------*;
* Generating Bins for interval variables;
*------------------------------------------------------------*;
if AcceptedCmpTotal eq . then BIN_AcceptedCmpTotal= .;
else do;
if AcceptedCmpTotal < 0 then BIN_AcceptedCmpTotal=1;
else if AcceptedCmpTotal < 1 then BIN_AcceptedCmpTotal=2;
else if AcceptedCmpTotal >= 1 then BIN_AcceptedCmpTotal=3;
end;
if Age eq . then BIN_Age= .;
else do;
if Age < 31 then BIN_Age=1;
else if Age < 36 then BIN_Age=2;
else if Age < 40 then BIN_Age=3;
else if Age < 43 then BIN_Age=4;
else if Age < 46 then BIN_Age=5;
else if Age < 50 then BIN_Age=6;
else if Age < 55 then BIN_Age=7;
else if Age < 59 then BIN_Age=8;
else if Age < 64 then BIN_Age=9;
else if Age >= 64 then BIN_Age=10;
end;
if Frq eq . then BIN_Frq= .;
else do;
if Frq < 4 then BIN_Frq=1;
else if Frq < 5 then BIN_Frq=2;
else if Frq < 6 then BIN_Frq=3;
else if Frq < 9 then BIN_Frq=4;
else if Frq < 12 then BIN_Frq=5;
else if Frq < 15 then BIN_Frq=6;
else if Frq < 17 then BIN_Frq=7;
else if Frq < 20 then BIN_Frq=8;
else if Frq < 23 then BIN_Frq=9;
else if Frq >= 23 then BIN_Frq=10;
end;
if Income eq . then BIN_Income= .;
else do;
if Income < 23983 then BIN_Income=1;
else if Income < 31322 then BIN_Income=2;
else if Income < 38157 then BIN_Income=3;
else if Income < 44900 then BIN_Income=4;
else if Income < 52157 then BIN_Income=5;
else if Income < 59111 then BIN_Income=6;
else if Income < 65808 then BIN_Income=7;
else if Income < 72025 then BIN_Income=8;
else if Income < 79470 then BIN_Income=9;
else if Income >= 79470 then BIN_Income=10;
end;
if Kidhome eq . then BIN_Kidhome= .;
else do;
if Kidhome < 0 then BIN_Kidhome=1;
else if Kidhome < 1 then BIN_Kidhome=2;
else if Kidhome >= 1 then BIN_Kidhome=3;
end;
if Mnt eq . then BIN_Mnt= .;
else do;
if Mnt < 34 then BIN_Mnt=1;
else if Mnt < 57 then BIN_Mnt=2;
else if Mnt < 94 then BIN_Mnt=3;
else if Mnt < 219 then BIN_Mnt=4;
else if Mnt < 405.5 then BIN_Mnt=5;
else if Mnt < 650 then BIN_Mnt=6;
else if Mnt < 906 then BIN_Mnt=7;
else if Mnt < 1215 then BIN_Mnt=8;
else if Mnt < 1526 then BIN_Mnt=9;
else if Mnt >= 1526 then BIN_Mnt=10;
end;
if MntFishProducts eq . then BIN_MntFishProducts= .;
else do;
if MntFishProducts < 0 then BIN_MntFishProducts=1;
else if MntFishProducts < 2 then BIN_MntFishProducts=2;
else if MntFishProducts < 4 then BIN_MntFishProducts=3;
else if MntFishProducts < 7 then BIN_MntFishProducts=4;
else if MntFishProducts < 13 then BIN_MntFishProducts=5;
else if MntFishProducts < 23 then BIN_MntFishProducts=6;
else if MntFishProducts < 37 then BIN_MntFishProducts=7;
else if MntFishProducts < 62 then BIN_MntFishProducts=8;
else if MntFishProducts < 116 then BIN_MntFishProducts=9;
else if MntFishProducts >= 116 then BIN_MntFishProducts=10;
end;
if MntFruits eq . then BIN_MntFruits= .;
else do;
if MntFruits < 0 then BIN_MntFruits=1;
else if MntFruits < 1 then BIN_MntFruits=2;
else if MntFruits < 3 then BIN_MntFruits=3;
else if MntFruits < 5 then BIN_MntFruits=4;
else if MntFruits < 9 then BIN_MntFruits=5;
else if MntFruits < 16 then BIN_MntFruits=6;
else if MntFruits < 27 then BIN_MntFruits=7;
else if MntFruits < 44 then BIN_MntFruits=8;
else if MntFruits < 84 then BIN_MntFruits=9;
else if MntFruits >= 84 then BIN_MntFruits=10;
end;
if MntGoldProds eq . then BIN_MntGoldProds= .;
else do;
if MntGoldProds < 3 then BIN_MntGoldProds=1;
else if MntGoldProds < 7 then BIN_MntGoldProds=2;
else if MntGoldProds < 12 then BIN_MntGoldProds=3;
else if MntGoldProds < 17 then BIN_MntGoldProds=4;
else if MntGoldProds < 25 then BIN_MntGoldProds=5;
else if MntGoldProds < 34 then BIN_MntGoldProds=6;
else if MntGoldProds < 48 then BIN_MntGoldProds=7;
else if MntGoldProds < 74 then BIN_MntGoldProds=8;
else if MntGoldProds < 116 then BIN_MntGoldProds=9;
else if MntGoldProds >= 116 then BIN_MntGoldProds=10;
end;
if MntMeatProducts eq . then BIN_MntMeatProducts= .;
else do;
if MntMeatProducts < 7 then BIN_MntMeatProducts=1;
else if MntMeatProducts < 12 then BIN_MntMeatProducts=2;
else if MntMeatProducts < 21 then BIN_MntMeatProducts=3;
else if MntMeatProducts < 38 then BIN_MntMeatProducts=4;
else if MntMeatProducts < 72 then BIN_MntMeatProducts=5;
else if MntMeatProducts < 116 then BIN_MntMeatProducts=6;
else if MntMeatProducts < 186 then BIN_MntMeatProducts=7;
else if MntMeatProducts < 309 then BIN_MntMeatProducts=8;
else if MntMeatProducts < 518 then BIN_MntMeatProducts=9;
else if MntMeatProducts >= 518 then BIN_MntMeatProducts=10;
end;
if MntSweetProducts eq . then BIN_MntSweetProducts= .;
else do;
if MntSweetProducts < 0 then BIN_MntSweetProducts=1;
else if MntSweetProducts < 1 then BIN_MntSweetProducts=2;
else if MntSweetProducts < 3 then BIN_MntSweetProducts=3;
else if MntSweetProducts < 5 then BIN_MntSweetProducts=4;
else if MntSweetProducts < 9 then BIN_MntSweetProducts=5;
else if MntSweetProducts < 16 then BIN_MntSweetProducts=6;
else if MntSweetProducts < 27 then BIN_MntSweetProducts=7;
else if MntSweetProducts < 46 then BIN_MntSweetProducts=8;
else if MntSweetProducts < 84 then BIN_MntSweetProducts=9;
else if MntSweetProducts >= 84 then BIN_MntSweetProducts=10;
end;
if MntWines eq . then BIN_MntWines= .;
else do;
if MntWines < 6 then BIN_MntWines=1;
else if MntWines < 16 then BIN_MntWines=2;
else if MntWines < 33 then BIN_MntWines=3;
else if MntWines < 84 then BIN_MntWines=4;
else if MntWines < 183.5 then BIN_MntWines=5;
else if MntWines < 298 then BIN_MntWines=6;
else if MntWines < 429 then BIN_MntWines=7;
else if MntWines < 602 then BIN_MntWines=8;
else if MntWines < 836 then BIN_MntWines=9;
else if MntWines >= 836 then BIN_MntWines=10;
end;
if MonthsAsCustomer eq . then BIN_MonthsAsCustomer= .;
else do;
if MonthsAsCustomer < 61 then BIN_MonthsAsCustomer=1;
else if MonthsAsCustomer < 67 then BIN_MonthsAsCustomer=2;
else if MonthsAsCustomer < 73 then BIN_MonthsAsCustomer=3;
else if MonthsAsCustomer < 78 then BIN_MonthsAsCustomer=4;
else if MonthsAsCustomer < 84 then BIN_MonthsAsCustomer=5;
else if MonthsAsCustomer < 89 then BIN_MonthsAsCustomer=6;
else if MonthsAsCustomer < 96 then BIN_MonthsAsCustomer=7;
else if MonthsAsCustomer < 102 then BIN_MonthsAsCustomer=8;
else if MonthsAsCustomer < 108 then BIN_MonthsAsCustomer=9;
else if MonthsAsCustomer >= 108 then BIN_MonthsAsCustomer=10;
end;
if NumCatalogPurchases eq . then BIN_NumCatalogPurchases= .;
else do;
if NumCatalogPurchases < 0 then BIN_NumCatalogPurchases=1;
else if NumCatalogPurchases < 1 then BIN_NumCatalogPurchases=2;
else if NumCatalogPurchases < 2 then BIN_NumCatalogPurchases=3;
else if NumCatalogPurchases < 4 then BIN_NumCatalogPurchases=4;
else if NumCatalogPurchases < 5 then BIN_NumCatalogPurchases=5;
else if NumCatalogPurchases < 7 then BIN_NumCatalogPurchases=6;
else if NumCatalogPurchases >= 7 then BIN_NumCatalogPurchases=7;
end;
if NumDealsPurchases eq . then BIN_NumDealsPurchases= .;
else do;
if NumDealsPurchases < 1 then BIN_NumDealsPurchases=1;
else if NumDealsPurchases < 2 then BIN_NumDealsPurchases=2;
else if NumDealsPurchases < 3 then BIN_NumDealsPurchases=3;
else if NumDealsPurchases < 5 then BIN_NumDealsPurchases=4;
else if NumDealsPurchases >= 5 then BIN_NumDealsPurchases=5;
end;
if NumDistPurchases eq . then BIN_NumDistPurchases= .;
else do;
if NumDistPurchases < 1 then BIN_NumDistPurchases=1;
else if NumDistPurchases < 2 then BIN_NumDistPurchases=2;
else if NumDistPurchases < 3 then BIN_NumDistPurchases=3;
else if NumDistPurchases < 5 then BIN_NumDistPurchases=4;
else if NumDistPurchases < 6 then BIN_NumDistPurchases=5;
else if NumDistPurchases < 8 then BIN_NumDistPurchases=6;
else if NumDistPurchases < 9 then BIN_NumDistPurchases=7;
else if NumDistPurchases < 11 then BIN_NumDistPurchases=8;
else if NumDistPurchases < 13 then BIN_NumDistPurchases=9;
else if NumDistPurchases >= 13 then BIN_NumDistPurchases=10;
end;
if NumStorePurchases eq . then BIN_NumStorePurchases= .;
else do;
if NumStorePurchases < 3 then BIN_NumStorePurchases=1;
else if NumStorePurchases < 4 then BIN_NumStorePurchases=2;
else if NumStorePurchases < 5 then BIN_NumStorePurchases=3;
else if NumStorePurchases < 6 then BIN_NumStorePurchases=4;
else if NumStorePurchases < 8 then BIN_NumStorePurchases=5;
else if NumStorePurchases < 9 then BIN_NumStorePurchases=6;
else if NumStorePurchases < 11 then BIN_NumStorePurchases=7;
else if NumStorePurchases >= 11 then BIN_NumStorePurchases=8;
end;
if NumWebPurchases eq . then BIN_NumWebPurchases= .;
else do;
if NumWebPurchases < 1 then BIN_NumWebPurchases=1;
else if NumWebPurchases < 2 then BIN_NumWebPurchases=2;
else if NumWebPurchases < 3 then BIN_NumWebPurchases=3;
else if NumWebPurchases < 4 then BIN_NumWebPurchases=4;
else if NumWebPurchases < 5 then BIN_NumWebPurchases=5;
else if NumWebPurchases < 6 then BIN_NumWebPurchases=6;
else if NumWebPurchases < 8 then BIN_NumWebPurchases=7;
else if NumWebPurchases >= 8 then BIN_NumWebPurchases=8;
end;
if NumWebVisitsMonth eq . then BIN_NumWebVisitsMonth= .;
else do;
if NumWebVisitsMonth < 2 then BIN_NumWebVisitsMonth=1;
else if NumWebVisitsMonth < 3 then BIN_NumWebVisitsMonth=2;
else if NumWebVisitsMonth < 4 then BIN_NumWebVisitsMonth=3;
else if NumWebVisitsMonth < 5 then BIN_NumWebVisitsMonth=4;
else if NumWebVisitsMonth < 6 then BIN_NumWebVisitsMonth=5;
else if NumWebVisitsMonth < 7 then BIN_NumWebVisitsMonth=6;
else if NumWebVisitsMonth < 8 then BIN_NumWebVisitsMonth=7;
else if NumWebVisitsMonth >= 8 then BIN_NumWebVisitsMonth=8;
end;
if RFMstat eq . then BIN_RFMstat= .;
else do;
if RFMstat < 3 then BIN_RFMstat=1;
else if RFMstat < 6.88 then BIN_RFMstat=2;
else if RFMstat < 18.67 then BIN_RFMstat=3;
else if RFMstat < 52.5 then BIN_RFMstat=4;
else if RFMstat < 128.09 then BIN_RFMstat=5;
else if RFMstat < 234.14 then BIN_RFMstat=6;
else if RFMstat < 369.14 then BIN_RFMstat=7;
else if RFMstat < 571.29 then BIN_RFMstat=8;
else if RFMstat < 1073.68 then BIN_RFMstat=9;
else if RFMstat >= 1073.68 then BIN_RFMstat=10;
end;
if RMntFrq eq . then BIN_RMntFrq= .;
else do;
if RMntFrq < 7.83 then BIN_RMntFrq=1;
else if RMntFrq < 11 then BIN_RMntFrq=2;
else if RMntFrq < 15.83 then BIN_RMntFrq=3;
else if RMntFrq < 23.77 then BIN_RMntFrq=4;
else if RMntFrq < 30.4 then BIN_RMntFrq=5;
else if RMntFrq < 36.55 then BIN_RMntFrq=6;
else if RMntFrq < 43.06 then BIN_RMntFrq=7;
else if RMntFrq < 68.73 then BIN_RMntFrq=8;
else if RMntFrq < 75.83 then BIN_RMntFrq=9;
else if RMntFrq >= 75.83 then BIN_RMntFrq=10;
end;
if Recency eq . then BIN_Recency= .;
else do;
if Recency < 9 then BIN_Recency=1;
else if Recency < 19 then BIN_Recency=2;
else if Recency < 29 then BIN_Recency=3;
else if Recency < 38 then BIN_Recency=4;
else if Recency < 48 then BIN_Recency=5;
else if Recency < 58 then BIN_Recency=6;
else if Recency < 68 then BIN_Recency=7;
else if Recency < 79 then BIN_Recency=8;
else if Recency < 90 then BIN_Recency=9;
else if Recency >= 90 then BIN_Recency=10;
end;
if Teenhome eq . then BIN_Teenhome= .;
else do;
if Teenhome < 0 then BIN_Teenhome=1;
else if Teenhome < 1 then BIN_Teenhome=2;
else if Teenhome >= 1 then BIN_Teenhome=3;
end;
drop
AcceptedCmpTotal
Age
Frq
Income
Kidhome
Mnt
MntFishProducts
MntFruits
MntGoldProds
MntMeatProducts
MntSweetProducts
MntWines
MonthsAsCustomer
NumCatalogPurchases
NumDealsPurchases
NumDistPurchases
NumStorePurchases
NumWebPurchases
NumWebVisitsMonth
RFMstat
RMntFrq
Recency
Teenhome
;
