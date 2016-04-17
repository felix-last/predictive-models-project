 
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
if 0 <= NumCatalogPurchases AND NumCatalogPurchases < 2 then do;
GRP_NumCatalogPurchases = 3;
end;
else
if 2 <= NumCatalogPurchases AND NumCatalogPurchases < 4 then do;
GRP_NumCatalogPurchases = 4;
end;
else
if 4 <= NumCatalogPurchases then do;
GRP_NumCatalogPurchases = 5;
end;
end;
