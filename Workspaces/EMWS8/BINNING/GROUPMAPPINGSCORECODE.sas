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
_LABEL_='0<= AcceptedCmpTotal< 1';
UB=1;
end;
else
if DISPLAY_VAR='AcceptedCmpTotal' and _GROUP_ = 4 then do;
_LABEL_='1<= AcceptedCmpTotal';
UB=.;
end;
 
if DISPLAY_VAR='Age' and _GROUP_ = 2 then do;
_LABEL_='Age< 31';
UB=31;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 3 then do;
_LABEL_='31<= Age< 36';
UB=36;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 4 then do;
_LABEL_='36<= Age< 40';
UB=40;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 5 then do;
_LABEL_='40<= Age< 43';
UB=43;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 6 then do;
_LABEL_='43<= Age< 46';
UB=46;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 7 then do;
_LABEL_='46<= Age< 50';
UB=50;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 8 then do;
_LABEL_='50<= Age< 55';
UB=55;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 9 then do;
_LABEL_='55<= Age< 59';
UB=59;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 10 then do;
_LABEL_='59<= Age< 64';
UB=64;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 11 then do;
_LABEL_='64<= Age';
UB=.;
end;
 
if DISPLAY_VAR='Frq' and _GROUP_ = 2 then do;
_LABEL_='Frq< 4';
UB=4;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 3 then do;
_LABEL_='4<= Frq< 5';
UB=5;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 4 then do;
_LABEL_='5<= Frq< 6';
UB=6;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 5 then do;
_LABEL_='6<= Frq< 9';
UB=9;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 6 then do;
_LABEL_='9<= Frq< 12';
UB=12;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 7 then do;
_LABEL_='12<= Frq< 15';
UB=15;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 8 then do;
_LABEL_='15<= Frq< 17';
UB=17;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 9 then do;
_LABEL_='17<= Frq< 20';
UB=20;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 10 then do;
_LABEL_='20<= Frq< 23';
UB=23;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 11 then do;
_LABEL_='23<= Frq';
UB=.;
end;
 
if DISPLAY_VAR='Income' and _GROUP_ = 2 then do;
_LABEL_='Income< 23983';
UB=23983;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 3 then do;
_LABEL_='23983<= Income< 31322';
UB=31322;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 4 then do;
_LABEL_='31322<= Income< 38157';
UB=38157;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 5 then do;
_LABEL_='38157<= Income< 44900';
UB=44900;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 6 then do;
_LABEL_='44900<= Income< 52157';
UB=52157;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 7 then do;
_LABEL_='52157<= Income< 59111';
UB=59111;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 8 then do;
_LABEL_='59111<= Income< 65808';
UB=65808;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 9 then do;
_LABEL_='65808<= Income< 72025';
UB=72025;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 10 then do;
_LABEL_='72025<= Income< 79470';
UB=79470;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 11 then do;
_LABEL_='79470<= Income';
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
_LABEL_='Mnt< 34';
UB=34;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 3 then do;
_LABEL_='34<= Mnt< 57';
UB=57;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 4 then do;
_LABEL_='57<= Mnt< 94';
UB=94;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 5 then do;
_LABEL_='94<= Mnt< 219';
UB=219;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 6 then do;
_LABEL_='219<= Mnt< 405.5';
UB=405.5;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 7 then do;
_LABEL_='405.5<= Mnt< 650';
UB=650;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 8 then do;
_LABEL_='650<= Mnt< 906';
UB=906;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 9 then do;
_LABEL_='906<= Mnt< 1215';
UB=1215;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 10 then do;
_LABEL_='1215<= Mnt< 1526';
UB=1526;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 11 then do;
_LABEL_='1526<= Mnt';
UB=.;
end;
 
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 2 then do;
_LABEL_='MntFishProducts< 0';
UB=0;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 3 then do;
_LABEL_='0<= MntFishProducts< 2';
UB=2;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 4 then do;
_LABEL_='2<= MntFishProducts< 4';
UB=4;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 5 then do;
_LABEL_='4<= MntFishProducts< 7';
UB=7;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 6 then do;
_LABEL_='7<= MntFishProducts< 13';
UB=13;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 7 then do;
_LABEL_='13<= MntFishProducts< 23';
UB=23;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 8 then do;
_LABEL_='23<= MntFishProducts< 37';
UB=37;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 9 then do;
_LABEL_='37<= MntFishProducts< 62';
UB=62;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 10 then do;
_LABEL_='62<= MntFishProducts< 116';
UB=116;
end;
else
if DISPLAY_VAR='MntFishProducts' and _GROUP_ = 11 then do;
_LABEL_='116<= MntFishProducts';
UB=.;
end;
 
if DISPLAY_VAR='MntFruits' and _GROUP_ = 2 then do;
_LABEL_='MntFruits< 0';
UB=0;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 3 then do;
_LABEL_='0<= MntFruits< 1';
UB=1;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 4 then do;
_LABEL_='1<= MntFruits< 3';
UB=3;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 5 then do;
_LABEL_='3<= MntFruits< 5';
UB=5;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 6 then do;
_LABEL_='5<= MntFruits< 9';
UB=9;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 7 then do;
_LABEL_='9<= MntFruits< 16';
UB=16;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 8 then do;
_LABEL_='16<= MntFruits< 27';
UB=27;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 9 then do;
_LABEL_='27<= MntFruits< 44';
UB=44;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 10 then do;
_LABEL_='44<= MntFruits< 84';
UB=84;
end;
else
if DISPLAY_VAR='MntFruits' and _GROUP_ = 11 then do;
_LABEL_='84<= MntFruits';
UB=.;
end;
 
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 2 then do;
_LABEL_='MntGoldProds< 3';
UB=3;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 3 then do;
_LABEL_='3<= MntGoldProds< 7';
UB=7;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 4 then do;
_LABEL_='7<= MntGoldProds< 12';
UB=12;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 5 then do;
_LABEL_='12<= MntGoldProds< 17';
UB=17;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 6 then do;
_LABEL_='17<= MntGoldProds< 25';
UB=25;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 7 then do;
_LABEL_='25<= MntGoldProds< 34';
UB=34;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 8 then do;
_LABEL_='34<= MntGoldProds< 48';
UB=48;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 9 then do;
_LABEL_='48<= MntGoldProds< 74';
UB=74;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 10 then do;
_LABEL_='74<= MntGoldProds< 116';
UB=116;
end;
else
if DISPLAY_VAR='MntGoldProds' and _GROUP_ = 11 then do;
_LABEL_='116<= MntGoldProds';
UB=.;
end;
 
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 2 then do;
_LABEL_='MntMeatProducts< 7';
UB=7;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 3 then do;
_LABEL_='7<= MntMeatProducts< 12';
UB=12;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 4 then do;
_LABEL_='12<= MntMeatProducts< 21';
UB=21;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 5 then do;
_LABEL_='21<= MntMeatProducts< 38';
UB=38;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 6 then do;
_LABEL_='38<= MntMeatProducts< 72';
UB=72;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 7 then do;
_LABEL_='72<= MntMeatProducts< 116';
UB=116;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 8 then do;
_LABEL_='116<= MntMeatProducts< 186';
UB=186;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 9 then do;
_LABEL_='186<= MntMeatProducts< 309';
UB=309;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 10 then do;
_LABEL_='309<= MntMeatProducts< 518';
UB=518;
end;
else
if DISPLAY_VAR='MntMeatProducts' and _GROUP_ = 11 then do;
_LABEL_='518<= MntMeatProducts';
UB=.;
end;
 
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 2 then do;
_LABEL_='MntSweetProducts< 0';
UB=0;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 3 then do;
_LABEL_='0<= MntSweetProducts< 1';
UB=1;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 4 then do;
_LABEL_='1<= MntSweetProducts< 3';
UB=3;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 5 then do;
_LABEL_='3<= MntSweetProducts< 5';
UB=5;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 6 then do;
_LABEL_='5<= MntSweetProducts< 9';
UB=9;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 7 then do;
_LABEL_='9<= MntSweetProducts< 16';
UB=16;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 8 then do;
_LABEL_='16<= MntSweetProducts< 27';
UB=27;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 9 then do;
_LABEL_='27<= MntSweetProducts< 46';
UB=46;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 10 then do;
_LABEL_='46<= MntSweetProducts< 84';
UB=84;
end;
else
if DISPLAY_VAR='MntSweetProducts' and _GROUP_ = 11 then do;
_LABEL_='84<= MntSweetProducts';
UB=.;
end;
 
if DISPLAY_VAR='MntWines' and _GROUP_ = 2 then do;
_LABEL_='MntWines< 6';
UB=6;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 3 then do;
_LABEL_='6<= MntWines< 16';
UB=16;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 4 then do;
_LABEL_='16<= MntWines< 33';
UB=33;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 5 then do;
_LABEL_='33<= MntWines< 84';
UB=84;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 6 then do;
_LABEL_='84<= MntWines< 183.5';
UB=183.5;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 7 then do;
_LABEL_='183.5<= MntWines< 298';
UB=298;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 8 then do;
_LABEL_='298<= MntWines< 429';
UB=429;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 9 then do;
_LABEL_='429<= MntWines< 602';
UB=602;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 10 then do;
_LABEL_='602<= MntWines< 836';
UB=836;
end;
else
if DISPLAY_VAR='MntWines' and _GROUP_ = 11 then do;
_LABEL_='836<= MntWines';
UB=.;
end;
 
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 2 then do;
_LABEL_='MonthsAsCustomer< 61';
UB=61;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 3 then do;
_LABEL_='61<= MonthsAsCustomer< 67';
UB=67;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 4 then do;
_LABEL_='67<= MonthsAsCustomer< 73';
UB=73;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 5 then do;
_LABEL_='73<= MonthsAsCustomer< 78';
UB=78;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 6 then do;
_LABEL_='78<= MonthsAsCustomer< 84';
UB=84;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 7 then do;
_LABEL_='84<= MonthsAsCustomer< 89';
UB=89;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 8 then do;
_LABEL_='89<= MonthsAsCustomer< 96';
UB=96;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 9 then do;
_LABEL_='96<= MonthsAsCustomer< 102';
UB=102;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 10 then do;
_LABEL_='102<= MonthsAsCustomer< 108';
UB=108;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 11 then do;
_LABEL_='108<= MonthsAsCustomer';
UB=.;
end;
 
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumCatalogPurchases< 0';
UB=0;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 3 then do;
_LABEL_='0<= NumCatalogPurchases< 1';
UB=1;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 4 then do;
_LABEL_='1<= NumCatalogPurchases< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 5 then do;
_LABEL_='2<= NumCatalogPurchases< 4';
UB=4;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 6 then do;
_LABEL_='4<= NumCatalogPurchases< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 7 then do;
_LABEL_='5<= NumCatalogPurchases< 7';
UB=7;
end;
else
if DISPLAY_VAR='NumCatalogPurchases' and _GROUP_ = 8 then do;
_LABEL_='7<= NumCatalogPurchases';
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
_LABEL_='3<= NumDealsPurchases< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumDealsPurchases' and _GROUP_ = 6 then do;
_LABEL_='5<= NumDealsPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumDistPurchases< 1';
UB=1;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 3 then do;
_LABEL_='1<= NumDistPurchases< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 4 then do;
_LABEL_='2<= NumDistPurchases< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 5 then do;
_LABEL_='3<= NumDistPurchases< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 6 then do;
_LABEL_='5<= NumDistPurchases< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 7 then do;
_LABEL_='6<= NumDistPurchases< 8';
UB=8;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 8 then do;
_LABEL_='8<= NumDistPurchases< 9';
UB=9;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 9 then do;
_LABEL_='9<= NumDistPurchases< 11';
UB=11;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 10 then do;
_LABEL_='11<= NumDistPurchases< 13';
UB=13;
end;
else
if DISPLAY_VAR='NumDistPurchases' and _GROUP_ = 11 then do;
_LABEL_='13<= NumDistPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 2 then do;
_LABEL_='NumStorePurchases< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 3 then do;
_LABEL_='3<= NumStorePurchases< 4';
UB=4;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 4 then do;
_LABEL_='4<= NumStorePurchases< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 5 then do;
_LABEL_='5<= NumStorePurchases< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 6 then do;
_LABEL_='6<= NumStorePurchases< 8';
UB=8;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 7 then do;
_LABEL_='8<= NumStorePurchases< 9';
UB=9;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 8 then do;
_LABEL_='9<= NumStorePurchases< 11';
UB=11;
end;
else
if DISPLAY_VAR='NumStorePurchases' and _GROUP_ = 9 then do;
_LABEL_='11<= NumStorePurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 2 then do;
_LABEL_='NumWebPurchases< 1';
UB=1;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 3 then do;
_LABEL_='1<= NumWebPurchases< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 4 then do;
_LABEL_='2<= NumWebPurchases< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 5 then do;
_LABEL_='3<= NumWebPurchases< 4';
UB=4;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 6 then do;
_LABEL_='4<= NumWebPurchases< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 7 then do;
_LABEL_='5<= NumWebPurchases< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 8 then do;
_LABEL_='6<= NumWebPurchases< 8';
UB=8;
end;
else
if DISPLAY_VAR='NumWebPurchases' and _GROUP_ = 9 then do;
_LABEL_='8<= NumWebPurchases';
UB=.;
end;
 
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 2 then do;
_LABEL_='NumWebVisitsMonth< 2';
UB=2;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 3 then do;
_LABEL_='2<= NumWebVisitsMonth< 3';
UB=3;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 4 then do;
_LABEL_='3<= NumWebVisitsMonth< 4';
UB=4;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 5 then do;
_LABEL_='4<= NumWebVisitsMonth< 5';
UB=5;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 6 then do;
_LABEL_='5<= NumWebVisitsMonth< 6';
UB=6;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 7 then do;
_LABEL_='6<= NumWebVisitsMonth< 7';
UB=7;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 8 then do;
_LABEL_='7<= NumWebVisitsMonth< 8';
UB=8;
end;
else
if DISPLAY_VAR='NumWebVisitsMonth' and _GROUP_ = 9 then do;
_LABEL_='8<= NumWebVisitsMonth';
UB=.;
end;
 
if DISPLAY_VAR='RFMstat' and _GROUP_ = 2 then do;
_LABEL_='RFMstat< 3';
UB=3;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 3 then do;
_LABEL_='3<= RFMstat< 6.88';
UB=6.88;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 4 then do;
_LABEL_='6.88<= RFMstat< 18.67';
UB=18.67;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 5 then do;
_LABEL_='18.67<= RFMstat< 52.5';
UB=52.5;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 6 then do;
_LABEL_='52.5<= RFMstat< 128.09';
UB=128.09;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 7 then do;
_LABEL_='128.09<= RFMstat< 234.14';
UB=234.14;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 8 then do;
_LABEL_='234.14<= RFMstat< 369.14';
UB=369.14;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 9 then do;
_LABEL_='369.14<= RFMstat< 571.29';
UB=571.29;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 10 then do;
_LABEL_='571.29<= RFMstat< 1073.68';
UB=1073.68;
end;
else
if DISPLAY_VAR='RFMstat' and _GROUP_ = 11 then do;
_LABEL_='1073.68<= RFMstat';
UB=.;
end;
 
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 2 then do;
_LABEL_='RMntFrq< 7.83';
UB=7.83;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 3 then do;
_LABEL_='7.83<= RMntFrq< 11';
UB=11;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 4 then do;
_LABEL_='11<= RMntFrq< 15.83';
UB=15.83;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 5 then do;
_LABEL_='15.83<= RMntFrq< 23.77';
UB=23.77;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 6 then do;
_LABEL_='23.77<= RMntFrq< 30.4';
UB=30.4;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 7 then do;
_LABEL_='30.4<= RMntFrq< 36.55';
UB=36.55;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 8 then do;
_LABEL_='36.55<= RMntFrq< 43.06';
UB=43.06;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 9 then do;
_LABEL_='43.06<= RMntFrq< 68.73';
UB=68.73;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 10 then do;
_LABEL_='68.73<= RMntFrq< 75.83';
UB=75.83;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 11 then do;
_LABEL_='75.83<= RMntFrq';
UB=.;
end;
 
if DISPLAY_VAR='Recency' and _GROUP_ = 2 then do;
_LABEL_='Recency< 9';
UB=9;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 3 then do;
_LABEL_='9<= Recency< 19';
UB=19;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 4 then do;
_LABEL_='19<= Recency< 29';
UB=29;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 5 then do;
_LABEL_='29<= Recency< 38';
UB=38;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 6 then do;
_LABEL_='38<= Recency< 48';
UB=48;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 7 then do;
_LABEL_='48<= Recency< 58';
UB=58;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 8 then do;
_LABEL_='58<= Recency< 68';
UB=68;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 9 then do;
_LABEL_='68<= Recency< 79';
UB=79;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 10 then do;
_LABEL_='79<= Recency< 90';
UB=90;
end;
else
if DISPLAY_VAR='Recency' and _GROUP_ = 11 then do;
_LABEL_='90<= Recency';
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
