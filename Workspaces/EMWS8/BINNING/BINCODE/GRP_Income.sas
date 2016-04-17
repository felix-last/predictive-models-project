 
*------------------------------------------------------------*;
* Variable: Income;
*------------------------------------------------------------*;
LABEL GRP_Income =
'Grouped: Income';
 
if MISSING(Income) then do;
GRP_Income = 1;
end;
else if NOT MISSING(Income) then do;
if Income < 35268 then do;
GRP_Income = 2;
end;
else
if 35268 <= Income AND Income < 52157 then do;
GRP_Income = 3;
end;
else
if 52157 <= Income AND Income < 69486 then do;
GRP_Income = 4;
end;
else
if 69486 <= Income then do;
GRP_Income = 5;
end;
end;
