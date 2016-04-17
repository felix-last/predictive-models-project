 
*------------------------------------------------------------*;
* Variable: NumWebPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumWebPurchases =
'Grouped: NumWebPurchases';
 
if MISSING(NumWebPurchases) then do;
GRP_NumWebPurchases = 1;
end;
else if NOT MISSING(NumWebPurchases) then do;
if NumWebPurchases < 2 then do;
GRP_NumWebPurchases = 2;
end;
else
if 2 <= NumWebPurchases AND NumWebPurchases < 4 then do;
GRP_NumWebPurchases = 3;
end;
else
if 4 <= NumWebPurchases AND NumWebPurchases < 6 then do;
GRP_NumWebPurchases = 4;
end;
else
if 6 <= NumWebPurchases then do;
GRP_NumWebPurchases = 5;
end;
end;
