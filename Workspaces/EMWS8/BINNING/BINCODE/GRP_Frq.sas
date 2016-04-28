 
*------------------------------------------------------------*;
* Variable: Frq;
*------------------------------------------------------------*;
LABEL GRP_Frq = "Grouped: Frq";
 
if MISSING(Frq) then do;
GRP_Frq = 1;
end;
else if NOT MISSING(Frq) then do;
if Frq < 4 then do;
GRP_Frq = 2;
end;
else
if 4 <= Frq AND Frq < 5 then do;
GRP_Frq = 3;
end;
else
if 5 <= Frq AND Frq < 6 then do;
GRP_Frq = 4;
end;
else
if 6 <= Frq AND Frq < 9 then do;
GRP_Frq = 5;
end;
else
if 9 <= Frq AND Frq < 12 then do;
GRP_Frq = 6;
end;
else
if 12 <= Frq AND Frq < 15 then do;
GRP_Frq = 7;
end;
else
if 15 <= Frq AND Frq < 17 then do;
GRP_Frq = 8;
end;
else
if 17 <= Frq AND Frq < 20 then do;
GRP_Frq = 9;
end;
else
if 20 <= Frq AND Frq < 23 then do;
GRP_Frq = 10;
end;
else
if 23 <= Frq then do;
GRP_Frq = 11;
end;
end;
