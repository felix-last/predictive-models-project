 
*------------------------------------------------------------*;
* Variable: NumCatalogPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumCatalogPurchases =
'Grouped: NumCatalogPurchases';
 
if MISSING(NumCatalogPurchases) then do;
GRP_NumCatalogPurchases = 1;
end;
else if NOT MISSING(NumCatalogPurchases) then do;
if NumCatalogPurchases < 0 then do;
GRP_NumCatalogPurchases = 2;
end;
else
if 0 <= NumCatalogPurchases AND NumCatalogPurchases < 1 then do;
GRP_NumCatalogPurchases = 3;
end;
else
if 1 <= NumCatalogPurchases AND NumCatalogPurchases < 2 then do;
GRP_NumCatalogPurchases = 4;
end;
else
if 2 <= NumCatalogPurchases AND NumCatalogPurchases < 4 then do;
GRP_NumCatalogPurchases = 5;
end;
else
if 4 <= NumCatalogPurchases AND NumCatalogPurchases < 5 then do;
GRP_NumCatalogPurchases = 6;
end;
else
if 5 <= NumCatalogPurchases AND NumCatalogPurchases < 7 then do;
GRP_NumCatalogPurchases = 7;
end;
else
if 7 <= NumCatalogPurchases then do;
GRP_NumCatalogPurchases = 8;
end;
end;
