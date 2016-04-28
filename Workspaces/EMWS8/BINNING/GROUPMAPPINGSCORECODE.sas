 length _LABEL_ $200;
 label _LABEL_="%sysfunc(sasmsg(sashelp.dmine, rpt_groupvalues_vlabel , NOQUOTE))";
 
if DISPLAY_VAR='AcceptedCmp1' and _GROUP_ = 2 then
_LABEL_='0';
else
if DISPLAY_VAR='AcceptedCmp1' and _GROUP_ = 3 then
_LABEL_='1';
 
if DISPLAY_VAR='AcceptedCmp2' and _GROUP_ = 2 then
_LABEL_='0';
else
if DISPLAY_VAR='AcceptedCmp2' and _GROUP_ = 3 then
_LABEL_='1';
 
if DISPLAY_VAR='AcceptedCmp3' and _GROUP_ = 2 then
_LABEL_='0';
else
if DISPLAY_VAR='AcceptedCmp3' and _GROUP_ = 3 then
_LABEL_='1';
 
if DISPLAY_VAR='AcceptedCmp4' and _GROUP_ = 2 then
_LABEL_='0';
else
if DISPLAY_VAR='AcceptedCmp4' and _GROUP_ = 3 then
_LABEL_='1';
 
if DISPLAY_VAR='AcceptedCmp5' and _GROUP_ = 2 then
_LABEL_='0';
else
if DISPLAY_VAR='AcceptedCmp5' and _GROUP_ = 3 then
_LABEL_='1';
 
if DISPLAY_VAR='AcceptedCmpTotal' and _GROUP_ = 2 then do;
_LABEL_='AcceptedCmpTotal< 0';
UB=0;
end;
else
if DISPLAY_VAR='AcceptedCmpTotal' and _GROUP_ = 3 then do;
_LABEL_='0<= AcceptedCmpTotal';
UB=.;
end;
 
if DISPLAY_VAR='Age' and _GROUP_ = 2 then do;
_LABEL_='Age< 38';
UB=38;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 3 then do;
_LABEL_='38<= Age< 46';
UB=46;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 4 then do;
_LABEL_='46<= Age< 57';
UB=57;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 5 then do;
_LABEL_='57<= Age';
UB=.;
end;
 
if DISPLAY_VAR='Frq' and _GROUP_ = 2 then do;
_LABEL_='Frq< 6';
UB=6;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 3 then do;
_LABEL_='6<= Frq< 12';
UB=12;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 4 then do;
_LABEL_='12<= Frq< 18';
UB=18;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 5 then do;
_LABEL_='18<= Frq';
UB=.;
end;
 
if DISPLAY_VAR='Income' and _GROUP_ = 2 then do;
_LABEL_='Income< 35268';
UB=35268;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 3 then do;
_LABEL_='35268<= Income< 52157';
UB=52157;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 4 then do;
_LABEL_='52157<= Income< 69486';
UB=69486;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 5 then do;
_LABEL_='69486<= Income';
UB=.;
end;
 
if DISPLAY_VAR='Kidhome' and _GROUP_ = 2 then do;
_LABEL_='Kidhome< 0';
UB=0;
end;
else
if DISPLAY_VAR='Kidhome' and _GROUP_ = 3 then do;
_LABEL_='0<= Kidhome< 1';
UB=1;
end;
else
if DISPLAY_VAR='Kidhome' and _GROUP_ = 4 then do;
_LABEL_='1<= Kidhome';
UB=.;
end;
 
if DISPLAY_VAR='Mnt' and _GROUP_ = 2 then do;
_LABEL_='Mnt< 72';
UB=72;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 3 then do;
_LABEL_='72<= Mnt< 405.5';
UB=405.5;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 4 then do;
_LABEL_='405.5<= Mnt< 1064';
UB=1064;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 5 then do;
_LABEL_='1064<= Mnt';
UB=.;
end;
 
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 2 then do;
_LABEL_='MntFishProducts< 3';
UB=3;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 3 then do;
_LABEL_='3<= MntFishProducts< 13';
UB=13;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 4 then do;
_LABEL_='13<= MntFishProducts< 47';
UB=47;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 5 then do;
_LABEL_='47<= MntFishProducts';
UB=.;
end;
 
if DISPLAY_VAR='MntFruits' and _GROUP_ = 2 then do;
_LABEL_='MntFruits< 2';
UB=2;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 3 then do;
_LABEL_='2<= MntFruits< 9';
UB=9;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 4 then do;
_LABEL_='9<= MntFruits< 35';
UB=35;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 5 then do;
_LABEL_='35<= MntFruits';
UB=.;
end;
 
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 2 then do;
_LABEL_='MntGoldProds< 9';
UB=9;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 3 then do;
_LABEL_='9<= MntGoldProds< 25';
UB=25;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 4 then do;
_LABEL_='25<= MntGoldProds< 59';
UB=59;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 5 then do;
_LABEL_='59<= MntGoldProds';
UB=.;
end;
 
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 2 then do;
_LABEL_='MntMeatProducts< 17';
UB=17;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 3 then do;
_LABEL_='17<= MntMeatProducts< 72';
UB=72;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 4 then do;
_LABEL_='72<= MntMeatProducts< 246';
UB=246;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 5 then do;
_LABEL_='246<= MntMeatProducts';
UB=.;
end;
 
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 2 then do;
_LABEL_='MntSweetProducts< 2';
UB=2;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 3 then do;
_LABEL_='2<= MntSweetProducts< 9';
UB=9;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 4 then do;
_LABEL_='9<= MntSweetProducts< 35';
UB=35;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 5 then do;
_LABEL_='35<= MntSweetProducts';
UB=.;
end;
 
if DISPLAY_VAR='MntWines' and _GROUP_ = 2 then do;
_LABEL_='MntWines< 24';
UB=24;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 3 then do;
_LABEL_='24<= MntWines< 183.5';
UB=183.5;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 4 then do;
_LABEL_='183.5<= MntWines< 508';
UB=508;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 5 then do;
_LABEL_='508<= MntWines';
UB=.;
end;
 
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 2 then do;
_LABEL_='MonthsAsCustomer< 70';
UB=70;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 3 then do;
_LABEL_='70<= MonthsAsCustomer< 84';
UB=84;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 4 then do;
_LABEL_='84<= MonthsAsCustomer< 99';
UB=99;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 5 then do;
_LABEL_='99<= MonthsAsCustomer';
UB=.;
end;
 
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumCatalogPurchases< 0';
UB=0;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 3 then do;
_LABEL_='0<= NumCatalogPurchases< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 4 then do;
_LABEL_='2<= NumCatalogPurchases< 4';
UB=4;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 5 then do;
_LABEL_='4<= NumCatalogPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumDealsPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumDealsPurchases< 1';
UB=1;
end;
else
if DISPLAY_VAR='NumDealsPurchases' and _GROUP_ = 3 then do;
_LABEL_='1<= NumDealsPurchases< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumDealsPurchases' and _GROUP_ = 4 then do;
_LABEL_='2<= NumDealsPurchases< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumDealsPurchases' and _GROUP_ = 5 then do;
_LABEL_='3<= NumDealsPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumDistPurchases< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 3 then do;
_LABEL_='3<= NumDistPurchases< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 4 then do;
_LABEL_='6<= NumDistPurchases< 10';
UB=10;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 5 then do;
_LABEL_='10<= NumDistPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 2 then do;
_LABEL_='NumStorePurchases< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 3 then do;
_LABEL_='3<= NumStorePurchases< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 4 then do;
_LABEL_='5<= NumStorePurchases< 8';
UB=8;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 5 then do;
_LABEL_='8<= NumStorePurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumWebPurchases< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 3 then do;
_LABEL_='2<= NumWebPurchases< 4';
UB=4;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 4 then do;
_LABEL_='4<= NumWebPurchases< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 5 then do;
_LABEL_='6<= NumWebPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 2 then do;
_LABEL_='NumWebVisitsMonth< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 3 then do;
_LABEL_='3<= NumWebVisitsMonth< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 4 then do;
_LABEL_='6<= NumWebVisitsMonth< 7';
UB=7;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 5 then do;
_LABEL_='7<= NumWebVisitsMonth';
UB=.;
end;
 
if DISPLAY_VAR='RFMstat' and _GROUP_ = 2 then do;
_LABEL_='RFMstat< 10.34';
UB=10.34;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 3 then do;
_LABEL_='10.34<= RFMstat< 128.09';
UB=128.09;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 4 then do;
_LABEL_='128.09<= RFMstat< 455.22';
UB=455.22;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 5 then do;
_LABEL_='455.22<= RFMstat';
UB=.;
end;
 
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 2 then do;
_LABEL_='RMntFrq< 13.25';
UB=13.25;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 3 then do;
_LABEL_='13.25<= RMntFrq< 30.4';
UB=30.4;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 4 then do;
_LABEL_='30.4<= RMntFrq< 52.86';
UB=52.86;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 5 then do;
_LABEL_='52.86<= RMntFrq';
UB=.;
end;
 
if DISPLAY_VAR='Recency' and _GROUP_ = 2 then do;
_LABEL_='Recency< 24';
UB=24;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 3 then do;
_LABEL_='24<= Recency< 48';
UB=48;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 4 then do;
_LABEL_='48<= Recency< 73';
UB=73;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 5 then do;
_LABEL_='73<= Recency';
UB=.;
end;
 
if DISPLAY_VAR='Teenhome' and _GROUP_ = 2 then do;
_LABEL_='Teenhome< 0';
UB=0;
end;
else
if DISPLAY_VAR='Teenhome' and _GROUP_ = 3 then do;
_LABEL_='0<= Teenhome< 1';
UB=1;
end;
else
if DISPLAY_VAR='Teenhome' and _GROUP_ = 4 then do;
_LABEL_='1<= Teenhome';
UB=.;
end;
 
if DISPLAY_VAR='Complain' and _GROUP_ = 2 then
_LABEL_='0';
else
if DISPLAY_VAR='Complain' and _GROUP_ = 3 then
_LABEL_='1';
 
if DISPLAY_VAR='Education' and _GROUP_ = 2 then
_LABEL_='GRADUATION';
else
if DISPLAY_VAR='Education' and _GROUP_ = 3 then
_LABEL_='PHD';
else
if DISPLAY_VAR='Education' and _GROUP_ = 4 then
_LABEL_='MASTER';
else
if DISPLAY_VAR='Education' and _GROUP_ = 5 then
_LABEL_='2N CYCLE';
else
if DISPLAY_VAR='Education' and _GROUP_ = 6 then
_LABEL_='BASIC';
 
if DISPLAY_VAR='HigherEducationBinary' and _GROUP_ = 2 then
_LABEL_='1';
else
if DISPLAY_VAR='HigherEducationBinary' and _GROUP_ = 3 then
_LABEL_='0';
 
if DISPLAY_VAR='Marital_Status' and _GROUP_ = 2 then
_LABEL_='MARRIED';
else
if DISPLAY_VAR='Marital_Status' and _GROUP_ = 3 then
_LABEL_='TOGETHER';
else
if DISPLAY_VAR='Marital_Status' and _GROUP_ = 4 then
_LABEL_='SINGLE';
else
if DISPLAY_VAR='Marital_Status' and _GROUP_ = 5 then
_LABEL_='DIVORCED';
else
if DISPLAY_VAR='Marital_Status' and _GROUP_ = 6 then
_LABEL_='WIDOW';
