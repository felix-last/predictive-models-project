 
*------------------------------------------------------------*;
* Variable: NumDistPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumDistPurchases = "Grouped: NumDistPurchases";
 
if MISSING(NumDistPurchases) then do;
GRP_NumDistPurchases = 1;
end;
else if NOT MISSING(NumDistPurchases) then do;
if NumDistPurchases < 3 then do;
GRP_NumDistPurchases = 2;
end;
else
if 3 <= NumDistPurchases AND NumDistPurchases < 6 then do;
GRP_NumDistPurchases = 3;
end;
else
if 6 <= NumDistPurchases AND NumDistPurchases < 10 then do;
GRP_NumDistPurchases = 4;
end;
else
if 10 <= NumDistPurchases then do;
GRP_NumDistPurchases = 5;
end;
end;
