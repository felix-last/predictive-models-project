length _UFormat $200;
drop _UFormat;
_UFormat='';
 
*------------------------------------------------------------*;
* Variable: AcceptedCmp5;
*------------------------------------------------------------*;
LABEL GRP_AcceptedCmp5 =
'Grouped: AcceptedCmp5';
 
_UFormat = put(AcceptedCmp5,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_AcceptedCmp5 = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '0'
) then do;
GRP_AcceptedCmp5 = 2;
end;
else
if (_UFORMAT eq '1'
) then do;
GRP_AcceptedCmp5 = 3;
end;
else do;
GRP_AcceptedCmp5 = 1;
end;
end;
 
*------------------------------------------------------------*;
* Variable: AcceptedCmpTotal;
*------------------------------------------------------------*;
LABEL GRP_AcceptedCmpTotal = "Grouped: AcceptedCmpTotal";
 
if MISSING(AcceptedCmpTotal) then do;
GRP_AcceptedCmpTotal = 1;
end;
else if NOT MISSING(AcceptedCmpTotal) then do;
if AcceptedCmpTotal < 0 then do;
GRP_AcceptedCmpTotal = 2;
end;
else
if 0 <= AcceptedCmpTotal AND AcceptedCmpTotal < 1 then do;
GRP_AcceptedCmpTotal = 3;
end;
else
if 1 <= AcceptedCmpTotal then do;
GRP_AcceptedCmpTotal = 4;
end;
end;
 
*------------------------------------------------------------*;
* Variable: Frq;
*------------------------------------------------------------*;
LABEL GRP_Frq = "Grouped: Frq";
 
if MISSING(Frq) then do;
GRP_Frq = 1;
end;
else if NOT MISSING(Frq) then do;
if Frq < 4 then do;
GRP_Frq = 2;
end;
else
if 4 <= Frq AND Frq < 5 then do;
GRP_Frq = 3;
end;
else
if 5 <= Frq AND Frq < 6 then do;
GRP_Frq = 4;
end;
else
if 6 <= Frq AND Frq < 9 then do;
GRP_Frq = 5;
end;
else
if 9 <= Frq AND Frq < 12 then do;
GRP_Frq = 6;
end;
else
if 12 <= Frq AND Frq < 15 then do;
GRP_Frq = 7;
end;
else
if 15 <= Frq AND Frq < 17 then do;
GRP_Frq = 8;
end;
else
if 17 <= Frq AND Frq < 20 then do;
GRP_Frq = 9;
end;
else
if 20 <= Frq AND Frq < 23 then do;
GRP_Frq = 10;
end;
else
if 23 <= Frq then do;
GRP_Frq = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: Income;
*------------------------------------------------------------*;
LABEL GRP_Income =
'Grouped: Income';
 
if MISSING(Income) then do;
GRP_Income = 1;
end;
else if NOT MISSING(Income) then do;
if Income < 23983 then do;
GRP_Income = 2;
end;
else
if 23983 <= Income AND Income < 31322 then do;
GRP_Income = 3;
end;
else
if 31322 <= Income AND Income < 38157 then do;
GRP_Income = 4;
end;
else
if 38157 <= Income AND Income < 44900 then do;
GRP_Income = 5;
end;
else
if 44900 <= Income AND Income < 52157 then do;
GRP_Income = 6;
end;
else
if 52157 <= Income AND Income < 59111 then do;
GRP_Income = 7;
end;
else
if 59111 <= Income AND Income < 65808 then do;
GRP_Income = 8;
end;
else
if 65808 <= Income AND Income < 72025 then do;
GRP_Income = 9;
end;
else
if 72025 <= Income AND Income < 79470 then do;
GRP_Income = 10;
end;
else
if 79470 <= Income then do;
GRP_Income = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: Mnt;
*------------------------------------------------------------*;
LABEL GRP_Mnt = "Grouped: Mnt";
 
if MISSING(Mnt) then do;
GRP_Mnt = 1;
end;
else if NOT MISSING(Mnt) then do;
if Mnt < 34 then do;
GRP_Mnt = 2;
end;
else
if 34 <= Mnt AND Mnt < 57 then do;
GRP_Mnt = 3;
end;
else
if 57 <= Mnt AND Mnt < 94 then do;
GRP_Mnt = 4;
end;
else
if 94 <= Mnt AND Mnt < 219 then do;
GRP_Mnt = 5;
end;
else
if 219 <= Mnt AND Mnt < 405.5 then do;
GRP_Mnt = 6;
end;
else
if 405.5 <= Mnt AND Mnt < 650 then do;
GRP_Mnt = 7;
end;
else
if 650 <= Mnt AND Mnt < 906 then do;
GRP_Mnt = 8;
end;
else
if 906 <= Mnt AND Mnt < 1215 then do;
GRP_Mnt = 9;
end;
else
if 1215 <= Mnt AND Mnt < 1526 then do;
GRP_Mnt = 10;
end;
else
if 1526 <= Mnt then do;
GRP_Mnt = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: MntFishProducts;
*------------------------------------------------------------*;
LABEL GRP_MntFishProducts =
'Grouped: MntFishProducts';
 
if MISSING(MntFishProducts) then do;
GRP_MntFishProducts = 1;
end;
else if NOT MISSING(MntFishProducts) then do;
if MntFishProducts < 0 then do;
GRP_MntFishProducts = 2;
end;
else
if 0 <= MntFishProducts AND MntFishProducts < 2 then do;
GRP_MntFishProducts = 3;
end;
else
if 2 <= MntFishProducts AND MntFishProducts < 4 then do;
GRP_MntFishProducts = 4;
end;
else
if 4 <= MntFishProducts AND MntFishProducts < 7 then do;
GRP_MntFishProducts = 5;
end;
else
if 7 <= MntFishProducts AND MntFishProducts < 13 then do;
GRP_MntFishProducts = 6;
end;
else
if 13 <= MntFishProducts AND MntFishProducts < 23 then do;
GRP_MntFishProducts = 7;
end;
else
if 23 <= MntFishProducts AND MntFishProducts < 37 then do;
GRP_MntFishProducts = 8;
end;
else
if 37 <= MntFishProducts AND MntFishProducts < 62 then do;
GRP_MntFishProducts = 9;
end;
else
if 62 <= MntFishProducts AND MntFishProducts < 116 then do;
GRP_MntFishProducts = 10;
end;
else
if 116 <= MntFishProducts then do;
GRP_MntFishProducts = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: MntGoldProds;
*------------------------------------------------------------*;
LABEL GRP_MntGoldProds =
'Grouped: MntGoldProds';
 
if MISSING(MntGoldProds) then do;
GRP_MntGoldProds = 1;
end;
else if NOT MISSING(MntGoldProds) then do;
if MntGoldProds < 3 then do;
GRP_MntGoldProds = 2;
end;
else
if 3 <= MntGoldProds AND MntGoldProds < 7 then do;
GRP_MntGoldProds = 3;
end;
else
if 7 <= MntGoldProds AND MntGoldProds < 12 then do;
GRP_MntGoldProds = 4;
end;
else
if 12 <= MntGoldProds AND MntGoldProds < 17 then do;
GRP_MntGoldProds = 5;
end;
else
if 17 <= MntGoldProds AND MntGoldProds < 25 then do;
GRP_MntGoldProds = 6;
end;
else
if 25 <= MntGoldProds AND MntGoldProds < 34 then do;
GRP_MntGoldProds = 7;
end;
else
if 34 <= MntGoldProds AND MntGoldProds < 48 then do;
GRP_MntGoldProds = 8;
end;
else
if 48 <= MntGoldProds AND MntGoldProds < 74 then do;
GRP_MntGoldProds = 9;
end;
else
if 74 <= MntGoldProds AND MntGoldProds < 116 then do;
GRP_MntGoldProds = 10;
end;
else
if 116 <= MntGoldProds then do;
GRP_MntGoldProds = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: MntMeatProducts;
*------------------------------------------------------------*;
LABEL GRP_MntMeatProducts =
'Grouped: MntMeatProducts';
 
if MISSING(MntMeatProducts) then do;
GRP_MntMeatProducts = 1;
end;
else if NOT MISSING(MntMeatProducts) then do;
if MntMeatProducts < 7 then do;
GRP_MntMeatProducts = 2;
end;
else
if 7 <= MntMeatProducts AND MntMeatProducts < 12 then do;
GRP_MntMeatProducts = 3;
end;
else
if 12 <= MntMeatProducts AND MntMeatProducts < 21 then do;
GRP_MntMeatProducts = 4;
end;
else
if 21 <= MntMeatProducts AND MntMeatProducts < 38 then do;
GRP_MntMeatProducts = 5;
end;
else
if 38 <= MntMeatProducts AND MntMeatProducts < 72 then do;
GRP_MntMeatProducts = 6;
end;
else
if 72 <= MntMeatProducts AND MntMeatProducts < 116 then do;
GRP_MntMeatProducts = 7;
end;
else
if 116 <= MntMeatProducts AND MntMeatProducts < 186 then do;
GRP_MntMeatProducts = 8;
end;
else
if 186 <= MntMeatProducts AND MntMeatProducts < 309 then do;
GRP_MntMeatProducts = 9;
end;
else
if 309 <= MntMeatProducts AND MntMeatProducts < 518 then do;
GRP_MntMeatProducts = 10;
end;
else
if 518 <= MntMeatProducts then do;
GRP_MntMeatProducts = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: MntSweetProducts;
*------------------------------------------------------------*;
LABEL GRP_MntSweetProducts =
'Grouped: MntSweetProducts';
 
if MISSING(MntSweetProducts) then do;
GRP_MntSweetProducts = 1;
end;
else if NOT MISSING(MntSweetProducts) then do;
if MntSweetProducts < 0 then do;
GRP_MntSweetProducts = 2;
end;
else
if 0 <= MntSweetProducts AND MntSweetProducts < 1 then do;
GRP_MntSweetProducts = 3;
end;
else
if 1 <= MntSweetProducts AND MntSweetProducts < 3 then do;
GRP_MntSweetProducts = 4;
end;
else
if 3 <= MntSweetProducts AND MntSweetProducts < 5 then do;
GRP_MntSweetProducts = 5;
end;
else
if 5 <= MntSweetProducts AND MntSweetProducts < 9 then do;
GRP_MntSweetProducts = 6;
end;
else
if 9 <= MntSweetProducts AND MntSweetProducts < 16 then do;
GRP_MntSweetProducts = 7;
end;
else
if 16 <= MntSweetProducts AND MntSweetProducts < 27 then do;
GRP_MntSweetProducts = 8;
end;
else
if 27 <= MntSweetProducts AND MntSweetProducts < 46 then do;
GRP_MntSweetProducts = 9;
end;
else
if 46 <= MntSweetProducts AND MntSweetProducts < 84 then do;
GRP_MntSweetProducts = 10;
end;
else
if 84 <= MntSweetProducts then do;
GRP_MntSweetProducts = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: MntWines;
*------------------------------------------------------------*;
LABEL GRP_MntWines =
'Grouped: MntWines';
 
if MISSING(MntWines) then do;
GRP_MntWines = 1;
end;
else if NOT MISSING(MntWines) then do;
if MntWines < 6 then do;
GRP_MntWines = 2;
end;
else
if 6 <= MntWines AND MntWines < 16 then do;
GRP_MntWines = 3;
end;
else
if 16 <= MntWines AND MntWines < 33 then do;
GRP_MntWines = 4;
end;
else
if 33 <= MntWines AND MntWines < 84 then do;
GRP_MntWines = 5;
end;
else
if 84 <= MntWines AND MntWines < 183.5 then do;
GRP_MntWines = 6;
end;
else
if 183.5 <= MntWines AND MntWines < 298 then do;
GRP_MntWines = 7;
end;
else
if 298 <= MntWines AND MntWines < 429 then do;
GRP_MntWines = 8;
end;
else
if 429 <= MntWines AND MntWines < 602 then do;
GRP_MntWines = 9;
end;
else
if 602 <= MntWines AND MntWines < 836 then do;
GRP_MntWines = 10;
end;
else
if 836 <= MntWines then do;
GRP_MntWines = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: NumCatalogPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumCatalogPurchases =
'Grouped: NumCatalogPurchases';
 
if MISSING(NumCatalogPurchases) then do;
GRP_NumCatalogPurchases = 1;
end;
else if NOT MISSING(NumCatalogPurchases) then do;
if NumCatalogPurchases < 0 then do;
GRP_NumCatalogPurchases = 2;
end;
else
if 0 <= NumCatalogPurchases AND NumCatalogPurchases < 1 then do;
GRP_NumCatalogPurchases = 3;
end;
else
if 1 <= NumCatalogPurchases AND NumCatalogPurchases < 2 then do;
GRP_NumCatalogPurchases = 4;
end;
else
if 2 <= NumCatalogPurchases AND NumCatalogPurchases < 4 then do;
GRP_NumCatalogPurchases = 5;
end;
else
if 4 <= NumCatalogPurchases AND NumCatalogPurchases < 5 then do;
GRP_NumCatalogPurchases = 6;
end;
else
if 5 <= NumCatalogPurchases AND NumCatalogPurchases < 7 then do;
GRP_NumCatalogPurchases = 7;
end;
else
if 7 <= NumCatalogPurchases then do;
GRP_NumCatalogPurchases = 8;
end;
end;
 
*------------------------------------------------------------*;
* Variable: NumDistPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumDistPurchases = "Grouped: NumDistPurchases";
 
if MISSING(NumDistPurchases) then do;
GRP_NumDistPurchases = 1;
end;
else if NOT MISSING(NumDistPurchases) then do;
if NumDistPurchases < 1 then do;
GRP_NumDistPurchases = 2;
end;
else
if 1 <= NumDistPurchases AND NumDistPurchases < 2 then do;
GRP_NumDistPurchases = 3;
end;
else
if 2 <= NumDistPurchases AND NumDistPurchases < 3 then do;
GRP_NumDistPurchases = 4;
end;
else
if 3 <= NumDistPurchases AND NumDistPurchases < 5 then do;
GRP_NumDistPurchases = 5;
end;
else
if 5 <= NumDistPurchases AND NumDistPurchases < 6 then do;
GRP_NumDistPurchases = 6;
end;
else
if 6 <= NumDistPurchases AND NumDistPurchases < 8 then do;
GRP_NumDistPurchases = 7;
end;
else
if 8 <= NumDistPurchases AND NumDistPurchases < 9 then do;
GRP_NumDistPurchases = 8;
end;
else
if 9 <= NumDistPurchases AND NumDistPurchases < 11 then do;
GRP_NumDistPurchases = 9;
end;
else
if 11 <= NumDistPurchases AND NumDistPurchases < 13 then do;
GRP_NumDistPurchases = 10;
end;
else
if 13 <= NumDistPurchases then do;
GRP_NumDistPurchases = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: NumWebPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumWebPurchases =
'Grouped: NumWebPurchases';
 
if MISSING(NumWebPurchases) then do;
GRP_NumWebPurchases = 1;
end;
else if NOT MISSING(NumWebPurchases) then do;
if NumWebPurchases < 1 then do;
GRP_NumWebPurchases = 2;
end;
else
if 1 <= NumWebPurchases AND NumWebPurchases < 2 then do;
GRP_NumWebPurchases = 3;
end;
else
if 2 <= NumWebPurchases AND NumWebPurchases < 3 then do;
GRP_NumWebPurchases = 4;
end;
else
if 3 <= NumWebPurchases AND NumWebPurchases < 4 then do;
GRP_NumWebPurchases = 5;
end;
else
if 4 <= NumWebPurchases AND NumWebPurchases < 5 then do;
GRP_NumWebPurchases = 6;
end;
else
if 5 <= NumWebPurchases AND NumWebPurchases < 6 then do;
GRP_NumWebPurchases = 7;
end;
else
if 6 <= NumWebPurchases AND NumWebPurchases < 8 then do;
GRP_NumWebPurchases = 8;
end;
else
if 8 <= NumWebPurchases then do;
GRP_NumWebPurchases = 9;
end;
end;
 
*------------------------------------------------------------*;
* Variable: NumWebVisitsMonth;
*------------------------------------------------------------*;
LABEL GRP_NumWebVisitsMonth =
'Grouped: NumWebVisitsMonth';
 
if MISSING(NumWebVisitsMonth) then do;
GRP_NumWebVisitsMonth = 1;
end;
else if NOT MISSING(NumWebVisitsMonth) then do;
if NumWebVisitsMonth < 2 then do;
GRP_NumWebVisitsMonth = 2;
end;
else
if 2 <= NumWebVisitsMonth AND NumWebVisitsMonth < 3 then do;
GRP_NumWebVisitsMonth = 3;
end;
else
if 3 <= NumWebVisitsMonth AND NumWebVisitsMonth < 4 then do;
GRP_NumWebVisitsMonth = 4;
end;
else
if 4 <= NumWebVisitsMonth AND NumWebVisitsMonth < 5 then do;
GRP_NumWebVisitsMonth = 5;
end;
else
if 5 <= NumWebVisitsMonth AND NumWebVisitsMonth < 6 then do;
GRP_NumWebVisitsMonth = 6;
end;
else
if 6 <= NumWebVisitsMonth AND NumWebVisitsMonth < 7 then do;
GRP_NumWebVisitsMonth = 7;
end;
else
if 7 <= NumWebVisitsMonth AND NumWebVisitsMonth < 8 then do;
GRP_NumWebVisitsMonth = 8;
end;
else
if 8 <= NumWebVisitsMonth then do;
GRP_NumWebVisitsMonth = 9;
end;
end;
 
*------------------------------------------------------------*;
* Variable: RFMstat;
*------------------------------------------------------------*;
LABEL GRP_RFMstat = "Grouped: RFMstat";
 
if MISSING(RFMstat) then do;
GRP_RFMstat = 1;
end;
else if NOT MISSING(RFMstat) then do;
if RFMstat < 3 then do;
GRP_RFMstat = 2;
end;
else
if 3 <= RFMstat AND RFMstat < 6.88 then do;
GRP_RFMstat = 3;
end;
else
if 6.88 <= RFMstat AND RFMstat < 18.67 then do;
GRP_RFMstat = 4;
end;
else
if 18.67 <= RFMstat AND RFMstat < 52.5 then do;
GRP_RFMstat = 5;
end;
else
if 52.5 <= RFMstat AND RFMstat < 128.09 then do;
GRP_RFMstat = 6;
end;
else
if 128.09 <= RFMstat AND RFMstat < 234.14 then do;
GRP_RFMstat = 7;
end;
else
if 234.14 <= RFMstat AND RFMstat < 369.14 then do;
GRP_RFMstat = 8;
end;
else
if 369.14 <= RFMstat AND RFMstat < 571.29 then do;
GRP_RFMstat = 9;
end;
else
if 571.29 <= RFMstat AND RFMstat < 1073.68 then do;
GRP_RFMstat = 10;
end;
else
if 1073.68 <= RFMstat then do;
GRP_RFMstat = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: RMntFrq;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq = "Grouped: RMntFrq";
 
if MISSING(RMntFrq) then do;
GRP_RMntFrq = 1;
end;
else if NOT MISSING(RMntFrq) then do;
if RMntFrq < 7.83 then do;
GRP_RMntFrq = 2;
end;
else
if 7.83 <= RMntFrq AND RMntFrq < 11 then do;
GRP_RMntFrq = 3;
end;
else
if 11 <= RMntFrq AND RMntFrq < 15.83 then do;
GRP_RMntFrq = 4;
end;
else
if 15.83 <= RMntFrq AND RMntFrq < 23.77 then do;
GRP_RMntFrq = 5;
end;
else
if 23.77 <= RMntFrq AND RMntFrq < 30.4 then do;
GRP_RMntFrq = 6;
end;
else
if 30.4 <= RMntFrq AND RMntFrq < 36.55 then do;
GRP_RMntFrq = 7;
end;
else
if 36.55 <= RMntFrq AND RMntFrq < 43.06 then do;
GRP_RMntFrq = 8;
end;
else
if 43.06 <= RMntFrq AND RMntFrq < 68.73 then do;
GRP_RMntFrq = 9;
end;
else
if 68.73 <= RMntFrq AND RMntFrq < 75.83 then do;
GRP_RMntFrq = 10;
end;
else
if 75.83 <= RMntFrq then do;
GRP_RMntFrq = 11;
end;
end;
 
*------------------------------------------------------------*;
* Variable: Recency;
*------------------------------------------------------------*;
LABEL GRP_Recency =
'Grouped: Recency';
 
if MISSING(Recency) then do;
GRP_Recency = 1;
end;
else if NOT MISSING(Recency) then do;
if Recency < 9 then do;
GRP_Recency = 2;
end;
else
if 9 <= Recency AND Recency < 19 then do;
GRP_Recency = 3;
end;
else
if 19 <= Recency AND Recency < 29 then do;
GRP_Recency = 4;
end;
else
if 29 <= Recency AND Recency < 38 then do;
GRP_Recency = 5;
end;
else
if 38 <= Recency AND Recency < 48 then do;
GRP_Recency = 6;
end;
else
if 48 <= Recency AND Recency < 58 then do;
GRP_Recency = 7;
end;
else
if 58 <= Recency AND Recency < 68 then do;
GRP_Recency = 8;
end;
else
if 68 <= Recency AND Recency < 79 then do;
GRP_Recency = 9;
end;
else
if 79 <= Recency AND Recency < 90 then do;
GRP_Recency = 10;
end;
else
if 90 <= Recency then do;
GRP_Recency = 11;
end;
end;
