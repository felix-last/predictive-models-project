 
*------------------------------------------------------------*;
* Variable: MntMeatProducts;
*------------------------------------------------------------*;
LABEL GRP_MntMeatProducts =
'Grouped: MntMeatProducts';
 
if MISSING(MntMeatProducts) then do;
GRP_MntMeatProducts = 1;
end;
else if NOT MISSING(MntMeatProducts) then do;
if MntMeatProducts < 7 then do;
GRP_MntMeatProducts = 2;
end;
else
if 7 <= MntMeatProducts AND MntMeatProducts < 12 then do;
GRP_MntMeatProducts = 3;
end;
else
if 12 <= MntMeatProducts AND MntMeatProducts < 21 then do;
GRP_MntMeatProducts = 4;
end;
else
if 21 <= MntMeatProducts AND MntMeatProducts < 38 then do;
GRP_MntMeatProducts = 5;
end;
else
if 38 <= MntMeatProducts AND MntMeatProducts < 72 then do;
GRP_MntMeatProducts = 6;
end;
else
if 72 <= MntMeatProducts AND MntMeatProducts < 116 then do;
GRP_MntMeatProducts = 7;
end;
else
if 116 <= MntMeatProducts AND MntMeatProducts < 186 then do;
GRP_MntMeatProducts = 8;
end;
else
if 186 <= MntMeatProducts AND MntMeatProducts < 309 then do;
GRP_MntMeatProducts = 9;
end;
else
if 309 <= MntMeatProducts AND MntMeatProducts < 518 then do;
GRP_MntMeatProducts = 10;
end;
else
if 518 <= MntMeatProducts then do;
GRP_MntMeatProducts = 11;
end;
end;
