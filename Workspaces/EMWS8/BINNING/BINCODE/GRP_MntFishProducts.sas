 
*------------------------------------------------------------*;
* Variable: MntFishProducts;
*------------------------------------------------------------*;
LABEL GRP_MntFishProducts =
'Grouped: MntFishProducts';
 
if MISSING(MntFishProducts) then do;
GRP_MntFishProducts = 1;
end;
else if NOT MISSING(MntFishProducts) then do;
if MntFishProducts < 0 then do;
GRP_MntFishProducts = 2;
end;
else
if 0 <= MntFishProducts AND MntFishProducts < 2 then do;
GRP_MntFishProducts = 3;
end;
else
if 2 <= MntFishProducts AND MntFishProducts < 4 then do;
GRP_MntFishProducts = 4;
end;
else
if 4 <= MntFishProducts AND MntFishProducts < 7 then do;
GRP_MntFishProducts = 5;
end;
else
if 7 <= MntFishProducts AND MntFishProducts < 13 then do;
GRP_MntFishProducts = 6;
end;
else
if 13 <= MntFishProducts AND MntFishProducts < 23 then do;
GRP_MntFishProducts = 7;
end;
else
if 23 <= MntFishProducts AND MntFishProducts < 37 then do;
GRP_MntFishProducts = 8;
end;
else
if 37 <= MntFishProducts AND MntFishProducts < 62 then do;
GRP_MntFishProducts = 9;
end;
else
if 62 <= MntFishProducts AND MntFishProducts < 116 then do;
GRP_MntFishProducts = 10;
end;
else
if 116 <= MntFishProducts then do;
GRP_MntFishProducts = 11;
end;
end;
