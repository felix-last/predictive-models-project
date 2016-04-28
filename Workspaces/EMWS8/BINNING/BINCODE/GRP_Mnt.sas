 
*------------------------------------------------------------*;
* Variable: Mnt;
*------------------------------------------------------------*;
LABEL GRP_Mnt = "Grouped: Mnt";
 
if MISSING(Mnt) then do;
GRP_Mnt = 1;
end;
else if NOT MISSING(Mnt) then do;
if Mnt < 34 then do;
GRP_Mnt = 2;
end;
else
if 34 <= Mnt AND Mnt < 57 then do;
GRP_Mnt = 3;
end;
else
if 57 <= Mnt AND Mnt < 94 then do;
GRP_Mnt = 4;
end;
else
if 94 <= Mnt AND Mnt < 219 then do;
GRP_Mnt = 5;
end;
else
if 219 <= Mnt AND Mnt < 405.5 then do;
GRP_Mnt = 6;
end;
else
if 405.5 <= Mnt AND Mnt < 650 then do;
GRP_Mnt = 7;
end;
else
if 650 <= Mnt AND Mnt < 906 then do;
GRP_Mnt = 8;
end;
else
if 906 <= Mnt AND Mnt < 1215 then do;
GRP_Mnt = 9;
end;
else
if 1215 <= Mnt AND Mnt < 1526 then do;
GRP_Mnt = 10;
end;
else
if 1526 <= Mnt then do;
GRP_Mnt = 11;
end;
end;
