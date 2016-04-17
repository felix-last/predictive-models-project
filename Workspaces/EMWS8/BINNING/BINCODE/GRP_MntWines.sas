 
*------------------------------------------------------------*;
* Variable: MntWines;
*------------------------------------------------------------*;
LABEL GRP_MntWines =
'Grouped: MntWines';
 
if MISSING(MntWines) then do;
GRP_MntWines = 1;
end;
else if NOT MISSING(MntWines) then do;
if MntWines < 24 then do;
GRP_MntWines = 2;
end;
else
if 24 <= MntWines AND MntWines < 183.5 then do;
GRP_MntWines = 3;
end;
else
if 183.5 <= MntWines AND MntWines < 508 then do;
GRP_MntWines = 4;
end;
else
if 508 <= MntWines then do;
GRP_MntWines = 5;
end;
end;
