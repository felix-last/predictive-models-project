 
*------------------------------------------------------------*;
* Variable: Frq;
*------------------------------------------------------------*;
LABEL GRP_Frq =
'Grouped: Frq';
 
if MISSING(Frq) then do;
GRP_Frq = 1;
end;
else if NOT MISSING(Frq) then do;
if Frq < 11 then do;
GRP_Frq = 2;
end;
else
if 11 <= Frq AND Frq < 18 then do;
GRP_Frq = 3;
end;
else
if 18 <= Frq AND Frq < 28 then do;
GRP_Frq = 4;
end;
else
if 28 <= Frq then do;
GRP_Frq = 5;
end;
end;
