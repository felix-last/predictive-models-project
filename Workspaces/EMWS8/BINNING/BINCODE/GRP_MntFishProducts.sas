 
*------------------------------------------------------------*;
* Variable: MntFishProducts;
*------------------------------------------------------------*;
LABEL GRP_MntFishProducts =
'Grouped: MntFishProducts';
 
if MISSING(MntFishProducts) then do;
GRP_MntFishProducts = 1;
end;
else if NOT MISSING(MntFishProducts) then do;
if MntFishProducts < 3 then do;
GRP_MntFishProducts = 2;
end;
else
if 3 <= MntFishProducts AND MntFishProducts < 13 then do;
GRP_MntFishProducts = 3;
end;
else
if 13 <= MntFishProducts AND MntFishProducts < 47 then do;
GRP_MntFishProducts = 4;
end;
else
if 47 <= MntFishProducts then do;
GRP_MntFishProducts = 5;
end;
end;
