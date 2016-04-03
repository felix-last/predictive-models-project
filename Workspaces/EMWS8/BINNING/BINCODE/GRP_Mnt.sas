 
*------------------------------------------------------------*;
* Variable: Mnt;
*------------------------------------------------------------*;
LABEL GRP_Mnt =
'Grouped: Mnt';
 
if MISSING(Mnt) then do;
GRP_Mnt = 1;
end;
else if NOT MISSING(Mnt) then do;
if Mnt < 67.6 then do;
GRP_Mnt = 2;
end;
else
if 67.6 <= Mnt AND Mnt < 407.68 then do;
GRP_Mnt = 3;
end;
else
if 407.68 <= Mnt AND Mnt < 1127.36 then do;
GRP_Mnt = 4;
end;
else
if 1127.36 <= Mnt then do;
GRP_Mnt = 5;
end;
end;
