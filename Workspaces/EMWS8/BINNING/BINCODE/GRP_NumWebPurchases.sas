 
*------------------------------------------------------------*;
* Variable: NumWebPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumWebPurchases =
'Grouped: NumWebPurchases';
 
if MISSING(NumWebPurchases) then do;
GRP_NumWebPurchases = 1;
end;
else if NOT MISSING(NumWebPurchases) then do;
if NumWebPurchases < 1 then do;
GRP_NumWebPurchases = 2;
end;
else
if 1 <= NumWebPurchases AND NumWebPurchases < 2 then do;
GRP_NumWebPurchases = 3;
end;
else
if 2 <= NumWebPurchases AND NumWebPurchases < 3 then do;
GRP_NumWebPurchases = 4;
end;
else
if 3 <= NumWebPurchases AND NumWebPurchases < 4 then do;
GRP_NumWebPurchases = 5;
end;
else
if 4 <= NumWebPurchases AND NumWebPurchases < 5 then do;
GRP_NumWebPurchases = 6;
end;
else
if 5 <= NumWebPurchases AND NumWebPurchases < 6 then do;
GRP_NumWebPurchases = 7;
end;
else
if 6 <= NumWebPurchases AND NumWebPurchases < 8 then do;
GRP_NumWebPurchases = 8;
end;
else
if 8 <= NumWebPurchases then do;
GRP_NumWebPurchases = 9;
end;
end;
