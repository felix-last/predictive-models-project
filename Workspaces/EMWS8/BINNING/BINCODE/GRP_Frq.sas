 
*------------------------------------------------------------*;
* Variable: Frq;
*------------------------------------------------------------*;
LABEL GRP_Frq = "Grouped: Frq";
 
if MISSING(Frq) then do;
GRP_Frq = 1;
end;
else if NOT MISSING(Frq) then do;
if Frq < 6 then do;
GRP_Frq = 2;
end;
else
if 6 <= Frq AND Frq < 12 then do;
GRP_Frq = 3;
end;
else
if 12 <= Frq AND Frq < 18 then do;
GRP_Frq = 4;
end;
else
if 18 <= Frq then do;
GRP_Frq = 5;
end;
end;
