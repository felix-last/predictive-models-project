 
*------------------------------------------------------------*;
* Variable: Recomendation;
*------------------------------------------------------------*;
LABEL GRP_Recomendation =
'Grouped: Recomendation';
 
if MISSING(Recomendation) then do;
GRP_Recomendation = 1;
end;
else if NOT MISSING(Recomendation) then do;
if Recomendation < 3 then do;
GRP_Recomendation = 2;
end;
else
if 3 <= Recomendation AND Recomendation < 4 then do;
GRP_Recomendation = 3;
end;
else
if 4 <= Recomendation AND Recomendation < 5 then do;
GRP_Recomendation = 4;
end;
else
if 5 <= Recomendation then do;
GRP_Recomendation = 5;
end;
end;
