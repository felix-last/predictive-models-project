*------------------------------------------------------------*;
* Generating Bins for interval variables;
*------------------------------------------------------------*;
if Age eq . then BIN_Age= .;
else do;
if Age < 36 then BIN_Age=1;
else if Age < 50 then BIN_Age=2;
else if Age < 64 then BIN_Age=3;
else if Age >= 64 then BIN_Age=4;
end;
if Age_Exmpl2 eq . then BIN_Age_Exmpl2= .;
else do;
if Age_Exmpl2 < 36 then BIN_Age_Exmpl2=1;
else if Age_Exmpl2 < 50 then BIN_Age_Exmpl2=2;
else if Age_Exmpl2 < 64 then BIN_Age_Exmpl2=3;
else if Age_Exmpl2 >= 64 then BIN_Age_Exmpl2=4;
end;
if CatPurchase eq . then BIN_CatPurchase= .;
else do;
if CatPurchase < 43 then BIN_CatPurchase=1;
else if CatPurchase < 55 then BIN_CatPurchase=2;
else if CatPurchase < 73 then BIN_CatPurchase=3;
else if CatPurchase >= 73 then BIN_CatPurchase=4;
end;
if Clothes eq . then BIN_Clothes= .;
else do;
if Clothes < 35 then BIN_Clothes=1;
else if Clothes < 53 then BIN_Clothes=2;
else if Clothes < 70 then BIN_Clothes=3;
else if Clothes >= 70 then BIN_Clothes=4;
end;
if Frq eq . then BIN_Frq= .;
else do;
if Frq < 11 then BIN_Frq=1;
else if Frq < 18 then BIN_Frq=2;
else if Frq < 28 then BIN_Frq=3;
else if Frq >= 28 then BIN_Frq=4;
end;
if HigherEducation eq . then BIN_HigherEducation= .;
else do;
if HigherEducation < 0 then BIN_HigherEducation=1;
else if HigherEducation < 1 then BIN_HigherEducation=2;
else if HigherEducation >= 1 then BIN_HigherEducation=3;
end;
if HouseKeeping eq . then BIN_HouseKeeping= .;
else do;
if HouseKeeping < 1 then BIN_HouseKeeping=1;
else if HouseKeeping < 4 then BIN_HouseKeeping=2;
else if HouseKeeping < 9 then BIN_HouseKeeping=3;
else if HouseKeeping >= 9 then BIN_HouseKeeping=4;
end;
if Income eq . then BIN_Income= .;
else do;
if Income < 51921.45 then BIN_Income=1;
else if Income < 74868.15 then BIN_Income=2;
else if Income < 97525.05 then BIN_Income=3;
else if Income >= 97525.05 then BIN_Income=4;
end;
if Kitchen eq . then BIN_Kitchen= .;
else do;
if Kitchen < 2 then BIN_Kitchen=1;
else if Kitchen < 4 then BIN_Kitchen=2;
else if Kitchen < 9 then BIN_Kitchen=3;
else if Kitchen >= 9 then BIN_Kitchen=4;
end;
if Mnt eq . then BIN_Mnt= .;
else do;
if Mnt < 67.6 then BIN_Mnt=1;
else if Mnt < 407.68 then BIN_Mnt=2;
else if Mnt < 1127.36 then BIN_Mnt=3;
else if Mnt >= 1127.36 then BIN_Mnt=4;
end;
if MonthsAsCustomer eq . then BIN_MonthsAsCustomer= .;
else do;
if MonthsAsCustomer < 67 then BIN_MonthsAsCustomer=1;
else if MonthsAsCustomer < 80 then BIN_MonthsAsCustomer=2;
else if MonthsAsCustomer < 95 then BIN_MonthsAsCustomer=3;
else if MonthsAsCustomer >= 95 then BIN_MonthsAsCustomer=4;
end;
if NetPurchase eq . then BIN_NetPurchase= .;
else do;
if NetPurchase < 27 then BIN_NetPurchase=1;
else if NetPurchase < 45 then BIN_NetPurchase=2;
else if NetPurchase < 57 then BIN_NetPurchase=3;
else if NetPurchase >= 57 then BIN_NetPurchase=4;
end;
if RMntFrq eq . then BIN_RMntFrq= .;
else do;
if RMntFrq < 7 then BIN_RMntFrq=1;
else if RMntFrq < 23.84 then BIN_RMntFrq=2;
else if RMntFrq < 40.38 then BIN_RMntFrq=3;
else if RMntFrq >= 40.38 then BIN_RMntFrq=4;
end;
if RMntFrq_Exmpl2 eq . then BIN_RMntFrq_Exmpl2= .;
else do;
if RMntFrq_Exmpl2 < 7 then BIN_RMntFrq_Exmpl2=1;
else if RMntFrq_Exmpl2 < 23.84 then BIN_RMntFrq_Exmpl2=2;
else if RMntFrq_Exmpl2 < 40.38 then BIN_RMntFrq_Exmpl2=3;
else if RMntFrq_Exmpl2 >= 40.38 then BIN_RMntFrq_Exmpl2=4;
end;
if Rcn eq . then BIN_Rcn= .;
else do;
if Rcn < 28 then BIN_Rcn=1;
else if Rcn < 53 then BIN_Rcn=2;
else if Rcn < 78 then BIN_Rcn=3;
else if Rcn >= 78 then BIN_Rcn=4;
end;
if Recomendation eq . then BIN_Recomendation= .;
else do;
if Recomendation < 3 then BIN_Recomendation=1;
else if Recomendation < 4 then BIN_Recomendation=2;
else if Recomendation < 5 then BIN_Recomendation=3;
else if Recomendation >= 5 then BIN_Recomendation=4;
end;
if SmallAppliances eq . then BIN_SmallAppliances= .;
else do;
if SmallAppliances < 19 then BIN_SmallAppliances=1;
else if SmallAppliances < 27 then BIN_SmallAppliances=2;
else if SmallAppliances < 37 then BIN_SmallAppliances=3;
else if SmallAppliances >= 37 then BIN_SmallAppliances=4;
end;
if Toys eq . then BIN_Toys= .;
else do;
if Toys < 1 then BIN_Toys=1;
else if Toys < 4 then BIN_Toys=2;
else if Toys < 9 then BIN_Toys=3;
else if Toys >= 9 then BIN_Toys=4;
end;
drop
Age
Age_Exmpl2
CatPurchase
Clothes
Frq
HigherEducation
HouseKeeping
Income
Kitchen
Mnt
MonthsAsCustomer
NetPurchase
RMntFrq
RMntFrq_Exmpl2
Rcn
Recomendation
SmallAppliances
Toys
;
