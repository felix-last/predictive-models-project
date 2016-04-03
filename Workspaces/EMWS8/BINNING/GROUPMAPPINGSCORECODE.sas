 length _LABEL_ $200;
 label _LABEL_="%sysfunc(sasmsg(sashelp.dmine, rpt_groupvalues_vlabel , NOQUOTE))";
 
if DISPLAY_VAR='Age' and _GROUP_ = 2 then do;
_LABEL_='Age< 36';
UB=36;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 3 then do;
_LABEL_='36<= Age< 50';
UB=50;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 4 then do;
_LABEL_='50<= Age< 64';
UB=64;
end;
else
if DISPLAY_VAR='Age' and _GROUP_ = 5 then do;
_LABEL_='64<= Age';
UB=.;
end;
 
if DISPLAY_VAR='Age_Exmpl2' and _GROUP_ = 2 then do;
_LABEL_='Age_Exmpl2< 36';
UB=36;
end;
else
if DISPLAY_VAR='Age_Exmpl2' and _GROUP_ = 3 then do;
_LABEL_='36<= Age_Exmpl2< 50';
UB=50;
end;
else
if DISPLAY_VAR='Age_Exmpl2' and _GROUP_ = 4 then do;
_LABEL_='50<= Age_Exmpl2< 64';
UB=64;
end;
else
if DISPLAY_VAR='Age_Exmpl2' and _GROUP_ = 5 then do;
_LABEL_='64<= Age_Exmpl2';
UB=.;
end;
 
if DISPLAY_VAR='CatPurchase' and _GROUP_ = 2 then do;
_LABEL_='CatPurchase< 43';
UB=43;
end;
else
if DISPLAY_VAR='CatPurchase' and _GROUP_ = 3 then do;
_LABEL_='43<= CatPurchase< 55';
UB=55;
end;
else
if DISPLAY_VAR='CatPurchase' and _GROUP_ = 4 then do;
_LABEL_='55<= CatPurchase< 73';
UB=73;
end;
else
if DISPLAY_VAR='CatPurchase' and _GROUP_ = 5 then do;
_LABEL_='73<= CatPurchase';
UB=.;
end;
 
if DISPLAY_VAR='Clothes' and _GROUP_ = 2 then do;
_LABEL_='Clothes< 35';
UB=35;
end;
else
if DISPLAY_VAR='Clothes' and _GROUP_ = 3 then do;
_LABEL_='35<= Clothes< 53';
UB=53;
end;
else
if DISPLAY_VAR='Clothes' and _GROUP_ = 4 then do;
_LABEL_='53<= Clothes< 70';
UB=70;
end;
else
if DISPLAY_VAR='Clothes' and _GROUP_ = 5 then do;
_LABEL_='70<= Clothes';
UB=.;
end;
 
if DISPLAY_VAR='Frq' and _GROUP_ = 2 then do;
_LABEL_='Frq< 11';
UB=11;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 3 then do;
_LABEL_='11<= Frq< 18';
UB=18;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 4 then do;
_LABEL_='18<= Frq< 28';
UB=28;
end;
else
if DISPLAY_VAR='Frq' and _GROUP_ = 5 then do;
_LABEL_='28<= Frq';
UB=.;
end;
 
if DISPLAY_VAR='HigherEducation' and _GROUP_ = 2 then do;
_LABEL_='HigherEducation< 0';
UB=0;
end;
else
if DISPLAY_VAR='HigherEducation' and _GROUP_ = 3 then do;
_LABEL_='0<= HigherEducation< 1';
UB=1;
end;
else
if DISPLAY_VAR='HigherEducation' and _GROUP_ = 4 then do;
_LABEL_='1<= HigherEducation';
UB=.;
end;
 
if DISPLAY_VAR='HouseKeeping' and _GROUP_ = 2 then do;
_LABEL_='HouseKeeping< 1';
UB=1;
end;
else
if DISPLAY_VAR='HouseKeeping' and _GROUP_ = 3 then do;
_LABEL_='1<= HouseKeeping< 4';
UB=4;
end;
else
if DISPLAY_VAR='HouseKeeping' and _GROUP_ = 4 then do;
_LABEL_='4<= HouseKeeping< 9';
UB=9;
end;
else
if DISPLAY_VAR='HouseKeeping' and _GROUP_ = 5 then do;
_LABEL_='9<= HouseKeeping';
UB=.;
end;
 
if DISPLAY_VAR='Income' and _GROUP_ = 2 then do;
_LABEL_='Income< 51921.45';
UB=51921.45;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 3 then do;
_LABEL_='51921.45<= Income< 74868.15';
UB=74868.15;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 4 then do;
_LABEL_='74868.15<= Income< 97525.05';
UB=97525.05;
end;
else
if DISPLAY_VAR='Income' and _GROUP_ = 5 then do;
_LABEL_='97525.05<= Income';
UB=.;
end;
 
if DISPLAY_VAR='Kitchen' and _GROUP_ = 2 then do;
_LABEL_='Kitchen< 2';
UB=2;
end;
else
if DISPLAY_VAR='Kitchen' and _GROUP_ = 3 then do;
_LABEL_='2<= Kitchen< 4';
UB=4;
end;
else
if DISPLAY_VAR='Kitchen' and _GROUP_ = 4 then do;
_LABEL_='4<= Kitchen< 9';
UB=9;
end;
else
if DISPLAY_VAR='Kitchen' and _GROUP_ = 5 then do;
_LABEL_='9<= Kitchen';
UB=.;
end;
 
if DISPLAY_VAR='Mnt' and _GROUP_ = 2 then do;
_LABEL_='Mnt< 67.6';
UB=67.6;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 3 then do;
_LABEL_='67.6<= Mnt< 407.68';
UB=407.68;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 4 then do;
_LABEL_='407.68<= Mnt< 1127.36';
UB=1127.36;
end;
else
if DISPLAY_VAR='Mnt' and _GROUP_ = 5 then do;
_LABEL_='1127.36<= Mnt';
UB=.;
end;
 
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 2 then do;
_LABEL_='MonthsAsCustomer< 67';
UB=67;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 3 then do;
_LABEL_='67<= MonthsAsCustomer< 80';
UB=80;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 4 then do;
_LABEL_='80<= MonthsAsCustomer< 95';
UB=95;
end;
else
if DISPLAY_VAR='MonthsAsCustomer' and _GROUP_ = 5 then do;
_LABEL_='95<= MonthsAsCustomer';
UB=.;
end;
 
if DISPLAY_VAR='NetPurchase' and _GROUP_ = 2 then do;
_LABEL_='NetPurchase< 27';
UB=27;
end;
else
if DISPLAY_VAR='NetPurchase' and _GROUP_ = 3 then do;
_LABEL_='27<= NetPurchase< 45';
UB=45;
end;
else
if DISPLAY_VAR='NetPurchase' and _GROUP_ = 4 then do;
_LABEL_='45<= NetPurchase< 57';
UB=57;
end;
else
if DISPLAY_VAR='NetPurchase' and _GROUP_ = 5 then do;
_LABEL_='57<= NetPurchase';
UB=.;
end;
 
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 2 then do;
_LABEL_='RMntFrq< 7';
UB=7;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 3 then do;
_LABEL_='7<= RMntFrq< 23.84';
UB=23.84;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 4 then do;
_LABEL_='23.84<= RMntFrq< 40.38';
UB=40.38;
end;
else
if DISPLAY_VAR='RMntFrq' and _GROUP_ = 5 then do;
_LABEL_='40.38<= RMntFrq';
UB=.;
end;
 
if DISPLAY_VAR='RMntFrq_Exmpl2' and _GROUP_ = 2 then do;
_LABEL_='RMntFrq_Exmpl2< 7';
UB=7;
end;
else
if DISPLAY_VAR='RMntFrq_Exmpl2' and _GROUP_ = 3 then do;
_LABEL_='7<= RMntFrq_Exmpl2< 23.84';
UB=23.84;
end;
else
if DISPLAY_VAR='RMntFrq_Exmpl2' and _GROUP_ = 4 then do;
_LABEL_='23.84<= RMntFrq_Exmpl2< 40.38';
UB=40.38;
end;
else
if DISPLAY_VAR='RMntFrq_Exmpl2' and _GROUP_ = 5 then do;
_LABEL_='40.38<= RMntFrq_Exmpl2';
UB=.;
end;
 
if DISPLAY_VAR='Rcn' and _GROUP_ = 2 then do;
_LABEL_='Rcn< 28';
UB=28;
end;
else
if DISPLAY_VAR='Rcn' and _GROUP_ = 3 then do;
_LABEL_='28<= Rcn< 53';
UB=53;
end;
else
if DISPLAY_VAR='Rcn' and _GROUP_ = 4 then do;
_LABEL_='53<= Rcn< 78';
UB=78;
end;
else
if DISPLAY_VAR='Rcn' and _GROUP_ = 5 then do;
_LABEL_='78<= Rcn';
UB=.;
end;
 
if DISPLAY_VAR='Recomendation' and _GROUP_ = 2 then do;
_LABEL_='Recomendation< 3';
UB=3;
end;
else
if DISPLAY_VAR='Recomendation' and _GROUP_ = 3 then do;
_LABEL_='3<= Recomendation< 4';
UB=4;
end;
else
if DISPLAY_VAR='Recomendation' and _GROUP_ = 4 then do;
_LABEL_='4<= Recomendation< 5';
UB=5;
end;
else
if DISPLAY_VAR='Recomendation' and _GROUP_ = 5 then do;
_LABEL_='5<= Recomendation';
UB=.;
end;
 
if DISPLAY_VAR='SmallAppliances' and _GROUP_ = 2 then do;
_LABEL_='SmallAppliances< 19';
UB=19;
end;
else
if DISPLAY_VAR='SmallAppliances' and _GROUP_ = 3 then do;
_LABEL_='19<= SmallAppliances< 27';
UB=27;
end;
else
if DISPLAY_VAR='SmallAppliances' and _GROUP_ = 4 then do;
_LABEL_='27<= SmallAppliances< 37';
UB=37;
end;
else
if DISPLAY_VAR='SmallAppliances' and _GROUP_ = 5 then do;
_LABEL_='37<= SmallAppliances';
UB=.;
end;
 
if DISPLAY_VAR='Toys' and _GROUP_ = 2 then do;
_LABEL_='Toys< 1';
UB=1;
end;
else
if DISPLAY_VAR='Toys' and _GROUP_ = 3 then do;
_LABEL_='1<= Toys< 4';
UB=4;
end;
else
if DISPLAY_VAR='Toys' and _GROUP_ = 4 then do;
_LABEL_='4<= Toys< 9';
UB=9;
end;
else
if DISPLAY_VAR='Toys' and _GROUP_ = 5 then do;
_LABEL_='9<= Toys';
UB=.;
end;
 
if DISPLAY_VAR='Dependents' and _GROUP_ = 2 then
_LABEL_='1';
else
if DISPLAY_VAR='Dependents' and _GROUP_ = 3 then
_LABEL_='0';
 
if DISPLAY_VAR='Education' and _GROUP_ = 2 then
_LABEL_='GRADUATION';
else
if DISPLAY_VAR='Education' and _GROUP_ = 3 then
_LABEL_='2N CYCLE';
else
if DISPLAY_VAR='Education' and _GROUP_ = 4 then
_LABEL_='MASTER';
else
if DISPLAY_VAR='Education' and _GROUP_ = 5 then
_LABEL_='BASIC';
else
if DISPLAY_VAR='Education' and _GROUP_ = 6 then
_LABEL_='PHD';
 
if DISPLAY_VAR='Gender' and _GROUP_ = 2 then
_LABEL_='F';
else
if DISPLAY_VAR='Gender' and _GROUP_ = 3 then
_LABEL_='M';
 
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
