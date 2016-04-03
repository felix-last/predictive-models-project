 
*------------------------------------------------------------*;
* Variable: Income;
*------------------------------------------------------------*;
LABEL GRP_Income =
'Grouped: Income';
 
if MISSING(Income) then do;
GRP_Income = 1;
end;
else if NOT MISSING(Income) then do;
if Income < 51921.45 then do;
GRP_Income = 2;
end;
else
if 51921.45 <= Income AND Income < 74868.15 then do;
GRP_Income = 3;
end;
else
if 74868.15 <= Income AND Income < 97525.05 then do;
GRP_Income = 4;
end;
else
if 97525.05 <= Income then do;
GRP_Income = 5;
end;
end;
