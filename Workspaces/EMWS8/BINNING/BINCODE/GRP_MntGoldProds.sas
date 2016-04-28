 
*------------------------------------------------------------*;
* Variable: MntGoldProds;
*------------------------------------------------------------*;
LABEL GRP_MntGoldProds =
'Grouped: MntGoldProds';
 
if MISSING(MntGoldProds) then do;
GRP_MntGoldProds = 1;
end;
else if NOT MISSING(MntGoldProds) then do;
if MntGoldProds < 3 then do;
GRP_MntGoldProds = 2;
end;
else
if 3 <= MntGoldProds AND MntGoldProds < 7 then do;
GRP_MntGoldProds = 3;
end;
else
if 7 <= MntGoldProds AND MntGoldProds < 12 then do;
GRP_MntGoldProds = 4;
end;
else
if 12 <= MntGoldProds AND MntGoldProds < 17 then do;
GRP_MntGoldProds = 5;
end;
else
if 17 <= MntGoldProds AND MntGoldProds < 25 then do;
GRP_MntGoldProds = 6;
end;
else
if 25 <= MntGoldProds AND MntGoldProds < 34 then do;
GRP_MntGoldProds = 7;
end;
else
if 34 <= MntGoldProds AND MntGoldProds < 48 then do;
GRP_MntGoldProds = 8;
end;
else
if 48 <= MntGoldProds AND MntGoldProds < 74 then do;
GRP_MntGoldProds = 9;
end;
else
if 74 <= MntGoldProds AND MntGoldProds < 116 then do;
GRP_MntGoldProds = 10;
end;
else
if 116 <= MntGoldProds then do;
GRP_MntGoldProds = 11;
end;
end;
