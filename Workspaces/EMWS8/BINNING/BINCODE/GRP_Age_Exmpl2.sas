 
*------------------------------------------------------------*;
* Variable: Age_Exmpl2;
*------------------------------------------------------------*;
LABEL GRP_Age_Exmpl2 = "Grouped: Age_Exmpl2";
 
if MISSING(Age_Exmpl2) then do;
GRP_Age_Exmpl2 = 1;
end;
else if NOT MISSING(Age_Exmpl2) then do;
if Age_Exmpl2 < 36 then do;
GRP_Age_Exmpl2 = 2;
end;
else
if 36 <= Age_Exmpl2 AND Age_Exmpl2 < 50 then do;
GRP_Age_Exmpl2 = 3;
end;
else
if 50 <= Age_Exmpl2 AND Age_Exmpl2 < 64 then do;
GRP_Age_Exmpl2 = 4;
end;
else
if 64 <= Age_Exmpl2 then do;
GRP_Age_Exmpl2 = 5;
end;
end;
