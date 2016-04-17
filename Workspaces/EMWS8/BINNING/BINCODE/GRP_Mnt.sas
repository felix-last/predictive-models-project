 
*------------------------------------------------------------*;
* Variable: Mnt;
*------------------------------------------------------------*;
LABEL GRP_Mnt = "Grouped: Mnt";
 
if MISSING(Mnt) then do;
GRP_Mnt = 1;
end;
else if NOT MISSING(Mnt) then do;
if Mnt < 72 then do;
GRP_Mnt = 2;
end;
else
if 72 <= Mnt AND Mnt < 405.5 then do;
GRP_Mnt = 3;
end;
else
if 405.5 <= Mnt AND Mnt < 1064 then do;
GRP_Mnt = 4;
end;
else
if 1064 <= Mnt then do;
GRP_Mnt = 5;
end;
end;
