 
*------------------------------------------------------------*;
* Variable: MntGoldProds;
*------------------------------------------------------------*;
LABEL GRP_MntGoldProds =
'Grouped: MntGoldProds';
 
if MISSING(MntGoldProds) then do;
GRP_MntGoldProds = 1;
end;
else if NOT MISSING(MntGoldProds) then do;
if MntGoldProds < 9 then do;
GRP_MntGoldProds = 2;
end;
else
if 9 <= MntGoldProds AND MntGoldProds < 25 then do;
GRP_MntGoldProds = 3;
end;
else
if 25 <= MntGoldProds AND MntGoldProds < 59 then do;
GRP_MntGoldProds = 4;
end;
else
if 59 <= MntGoldProds then do;
GRP_MntGoldProds = 5;
end;
end;
