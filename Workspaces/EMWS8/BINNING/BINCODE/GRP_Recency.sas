 
*------------------------------------------------------------*;
* Variable: Recency;
*------------------------------------------------------------*;
LABEL GRP_Recency =
'Grouped: Recency';
 
if MISSING(Recency) then do;
GRP_Recency = 1;
end;
else if NOT MISSING(Recency) then do;
if Recency < 9 then do;
GRP_Recency = 2;
end;
else
if 9 <= Recency AND Recency < 19 then do;
GRP_Recency = 3;
end;
else
if 19 <= Recency AND Recency < 29 then do;
GRP_Recency = 4;
end;
else
if 29 <= Recency AND Recency < 38 then do;
GRP_Recency = 5;
end;
else
if 38 <= Recency AND Recency < 48 then do;
GRP_Recency = 6;
end;
else
if 48 <= Recency AND Recency < 58 then do;
GRP_Recency = 7;
end;
else
if 58 <= Recency AND Recency < 68 then do;
GRP_Recency = 8;
end;
else
if 68 <= Recency AND Recency < 79 then do;
GRP_Recency = 9;
end;
else
if 79 <= Recency AND Recency < 90 then do;
GRP_Recency = 10;
end;
else
if 90 <= Recency then do;
GRP_Recency = 11;
end;
end;
