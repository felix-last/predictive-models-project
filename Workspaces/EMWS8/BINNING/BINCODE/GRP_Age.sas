 
*------------------------------------------------------------*;
* Variable: Age;
*------------------------------------------------------------*;
LABEL GRP_Age = "Grouped: Age";
 
if MISSING(Age) then do;
GRP_Age = 1;
end;
else if NOT MISSING(Age) then do;
if Age < 36 then do;
GRP_Age = 2;
end;
else
if 36 <= Age AND Age < 50 then do;
GRP_Age = 3;
end;
else
if 50 <= Age AND Age < 64 then do;
GRP_Age = 4;
end;
else
if 64 <= Age then do;
GRP_Age = 5;
end;
end;
