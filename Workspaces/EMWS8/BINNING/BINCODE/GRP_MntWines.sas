 
*------------------------------------------------------------*;
* Variable: MntWines;
*------------------------------------------------------------*;
LABEL GRP_MntWines =
'Grouped: MntWines';
 
if MISSING(MntWines) then do;
GRP_MntWines = 1;
end;
else if NOT MISSING(MntWines) then do;
if MntWines < 6 then do;
GRP_MntWines = 2;
end;
else
if 6 <= MntWines AND MntWines < 16 then do;
GRP_MntWines = 3;
end;
else
if 16 <= MntWines AND MntWines < 33 then do;
GRP_MntWines = 4;
end;
else
if 33 <= MntWines AND MntWines < 84 then do;
GRP_MntWines = 5;
end;
else
if 84 <= MntWines AND MntWines < 183.5 then do;
GRP_MntWines = 6;
end;
else
if 183.5 <= MntWines AND MntWines < 298 then do;
GRP_MntWines = 7;
end;
else
if 298 <= MntWines AND MntWines < 429 then do;
GRP_MntWines = 8;
end;
else
if 429 <= MntWines AND MntWines < 602 then do;
GRP_MntWines = 9;
end;
else
if 602 <= MntWines AND MntWines < 836 then do;
GRP_MntWines = 10;
end;
else
if 836 <= MntWines then do;
GRP_MntWines = 11;
end;
end;
