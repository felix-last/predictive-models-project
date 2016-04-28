*------------------------------------------------------------*;
* Generating Bins for interval variables;
*------------------------------------------------------------*;
if AcceptedCmpTotal eq . then BIN_AcceptedCmpTotal= .;
else do;
if AcceptedCmpTotal < 0 then BIN_AcceptedCmpTotal=1;
else if AcceptedCmpTotal >= 0 then BIN_AcceptedCmpTotal=2;
end;
if Age eq . then BIN_Age= .;
else do;
if Age < 38 then BIN_Age=1;
else if Age < 46 then BIN_Age=2;
else if Age < 57 then BIN_Age=3;
else if Age >= 57 then BIN_Age=4;
end;
if Frq eq . then BIN_Frq= .;
else do;
if Frq < 6 then BIN_Frq=1;
else if Frq < 12 then BIN_Frq=2;
else if Frq < 18 then BIN_Frq=3;
else if Frq >= 18 then BIN_Frq=4;
end;
if Income eq . then BIN_Income= .;
else do;
if Income < 35268 then BIN_Income=1;
else if Income < 52157 then BIN_Income=2;
else if Income < 69486 then BIN_Income=3;
else if Income >= 69486 then BIN_Income=4;
end;
if Kidhome eq . then BIN_Kidhome= .;
else do;
if Kidhome < 0 then BIN_Kidhome=1;
else if Kidhome < 1 then BIN_Kidhome=2;
else if Kidhome >= 1 then BIN_Kidhome=3;
end;
if Mnt eq . then BIN_Mnt= .;
else do;
if Mnt < 72 then BIN_Mnt=1;
else if Mnt < 405.5 then BIN_Mnt=2;
else if Mnt < 1064 then BIN_Mnt=3;
else if Mnt >= 1064 then BIN_Mnt=4;
end;
if MntFishProducts eq . then BIN_MntFishProducts= .;
else do;
if MntFishProducts < 3 then BIN_MntFishProducts=1;
else if MntFishProducts < 13 then BIN_MntFishProducts=2;
else if MntFishProducts < 47 then BIN_MntFishProducts=3;
else if MntFishProducts >= 47 then BIN_MntFishProducts=4;
end;
if MntFruits eq . then BIN_MntFruits= .;
else do;
if MntFruits < 2 then BIN_MntFruits=1;
else if MntFruits < 9 then BIN_MntFruits=2;
else if MntFruits < 35 then BIN_MntFruits=3;
else if MntFruits >= 35 then BIN_MntFruits=4;
end;
if MntGoldProds eq . then BIN_MntGoldProds= .;
else do;
if MntGoldProds < 9 then BIN_MntGoldProds=1;
else if MntGoldProds < 25 then BIN_MntGoldProds=2;
else if MntGoldProds < 59 then BIN_MntGoldProds=3;
else if MntGoldProds >= 59 then BIN_MntGoldProds=4;
end;
if MntMeatProducts eq . then BIN_MntMeatProducts= .;
else do;
if MntMeatProducts < 17 then BIN_MntMeatProducts=1;
else if MntMeatProducts < 72 then BIN_MntMeatProducts=2;
else if MntMeatProducts < 246 then BIN_MntMeatProducts=3;
else if MntMeatProducts >= 246 then BIN_MntMeatProducts=4;
end;
if MntSweetProducts eq . then BIN_MntSweetProducts= .;
else do;
if MntSweetProducts < 2 then BIN_MntSweetProducts=1;
else if MntSweetProducts < 9 then BIN_MntSweetProducts=2;
else if MntSweetProducts < 35 then BIN_MntSweetProducts=3;
else if MntSweetProducts >= 35 then BIN_MntSweetProducts=4;
end;
if MntWines eq . then BIN_MntWines= .;
else do;
if MntWines < 24 then BIN_MntWines=1;
else if MntWines < 183.5 then BIN_MntWines=2;
else if MntWines < 508 then BIN_MntWines=3;
else if MntWines >= 508 then BIN_MntWines=4;
end;
if MonthsAsCustomer eq . then BIN_MonthsAsCustomer= .;
else do;
if MonthsAsCustomer < 70 then BIN_MonthsAsCustomer=1;
else if MonthsAsCustomer < 84 then BIN_MonthsAsCustomer=2;
else if MonthsAsCustomer < 99 then BIN_MonthsAsCustomer=3;
else if MonthsAsCustomer >= 99 then BIN_MonthsAsCustomer=4;
end;
if NumCatalogPurchases eq . then BIN_NumCatalogPurchases= .;
else do;
if NumCatalogPurchases < 0 then BIN_NumCatalogPurchases=1;
else if NumCatalogPurchases < 2 then BIN_NumCatalogPurchases=2;
else if NumCatalogPurchases < 4 then BIN_NumCatalogPurchases=3;
else if NumCatalogPurchases >= 4 then BIN_NumCatalogPurchases=4;
end;
if NumDealsPurchases eq . then BIN_NumDealsPurchases= .;
else do;
if NumDealsPurchases < 1 then BIN_NumDealsPurchases=1;
else if NumDealsPurchases < 2 then BIN_NumDealsPurchases=2;
else if NumDealsPurchases < 3 then BIN_NumDealsPurchases=3;
else if NumDealsPurchases >= 3 then BIN_NumDealsPurchases=4;
end;
if NumDistPurchases eq . then BIN_NumDistPurchases= .;
else do;
if NumDistPurchases < 3 then BIN_NumDistPurchases=1;
else if NumDistPurchases < 6 then BIN_NumDistPurchases=2;
else if NumDistPurchases < 10 then BIN_NumDistPurchases=3;
else if NumDistPurchases >= 10 then BIN_NumDistPurchases=4;
end;
if NumStorePurchases eq . then BIN_NumStorePurchases= .;
else do;
if NumStorePurchases < 3 then BIN_NumStorePurchases=1;
else if NumStorePurchases < 5 then BIN_NumStorePurchases=2;
else if NumStorePurchases < 8 then BIN_NumStorePurchases=3;
else if NumStorePurchases >= 8 then BIN_NumStorePurchases=4;
end;
if NumWebPurchases eq . then BIN_NumWebPurchases= .;
else do;
if NumWebPurchases < 2 then BIN_NumWebPurchases=1;
else if NumWebPurchases < 4 then BIN_NumWebPurchases=2;
else if NumWebPurchases < 6 then BIN_NumWebPurchases=3;
else if NumWebPurchases >= 6 then BIN_NumWebPurchases=4;
end;
if NumWebVisitsMonth eq . then BIN_NumWebVisitsMonth= .;
else do;
if NumWebVisitsMonth < 3 then BIN_NumWebVisitsMonth=1;
else if NumWebVisitsMonth < 6 then BIN_NumWebVisitsMonth=2;
else if NumWebVisitsMonth < 7 then BIN_NumWebVisitsMonth=3;
else if NumWebVisitsMonth >= 7 then BIN_NumWebVisitsMonth=4;
end;
if RFMstat eq . then BIN_RFMstat= .;
else do;
if RFMstat < 10.34 then BIN_RFMstat=1;
else if RFMstat < 128.09 then BIN_RFMstat=2;
else if RFMstat < 455.22 then BIN_RFMstat=3;
else if RFMstat >= 455.22 then BIN_RFMstat=4;
end;
if RMntFrq eq . then BIN_RMntFrq= .;
else do;
if RMntFrq < 13.25 then BIN_RMntFrq=1;
else if RMntFrq < 30.4 then BIN_RMntFrq=2;
else if RMntFrq < 52.86 then BIN_RMntFrq=3;
else if RMntFrq >= 52.86 then BIN_RMntFrq=4;
end;
if Recency eq . then BIN_Recency= .;
else do;
if Recency < 24 then BIN_Recency=1;
else if Recency < 48 then BIN_Recency=2;
else if Recency < 73 then BIN_Recency=3;
else if Recency >= 73 then BIN_Recency=4;
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
