 
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
