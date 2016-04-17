 
*------------------------------------------------------------*;
* Variable: Recency;
*------------------------------------------------------------*;
LABEL GRP_Recency =
'Grouped: Recency';
 
if MISSING(Recency) then do;
GRP_Recency = 1;
end;
else if NOT MISSING(Recency) then do;
if Recency < 24 then do;
GRP_Recency = 2;
end;
else
if 24 <= Recency AND Recency < 48 then do;
GRP_Recency = 3;
end;
else
if 48 <= Recency AND Recency < 73 then do;
GRP_Recency = 4;
end;
else
if 73 <= Recency then do;
GRP_Recency = 5;
end;
end;
