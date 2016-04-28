 
*------------------------------------------------------------*;
* Variable: MntSweetProducts;
*------------------------------------------------------------*;
LABEL GRP_MntSweetProducts =
'Grouped: MntSweetProducts';
 
if MISSING(MntSweetProducts) then do;
GRP_MntSweetProducts = 1;
end;
else if NOT MISSING(MntSweetProducts) then do;
if MntSweetProducts < 0 then do;
GRP_MntSweetProducts = 2;
end;
else
if 0 <= MntSweetProducts AND MntSweetProducts < 1 then do;
GRP_MntSweetProducts = 3;
end;
else
if 1 <= MntSweetProducts AND MntSweetProducts < 3 then do;
GRP_MntSweetProducts = 4;
end;
else
if 3 <= MntSweetProducts AND MntSweetProducts < 5 then do;
GRP_MntSweetProducts = 5;
end;
else
if 5 <= MntSweetProducts AND MntSweetProducts < 9 then do;
GRP_MntSweetProducts = 6;
end;
else
if 9 <= MntSweetProducts AND MntSweetProducts < 16 then do;
GRP_MntSweetProducts = 7;
end;
else
if 16 <= MntSweetProducts AND MntSweetProducts < 27 then do;
GRP_MntSweetProducts = 8;
end;
else
if 27 <= MntSweetProducts AND MntSweetProducts < 46 then do;
GRP_MntSweetProducts = 9;
end;
else
if 46 <= MntSweetProducts AND MntSweetProducts < 84 then do;
GRP_MntSweetProducts = 10;
end;
else
if 84 <= MntSweetProducts then do;
GRP_MntSweetProducts = 11;
end;
end;
