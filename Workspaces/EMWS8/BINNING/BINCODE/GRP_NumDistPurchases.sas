 
*------------------------------------------------------------*;
* Variable: NumDistPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumDistPurchases = "Grouped: NumDistPurchases";
 
if MISSING(NumDistPurchases) then do;
GRP_NumDistPurchases = 1;
end;
else if NOT MISSING(NumDistPurchases) then do;
if NumDistPurchases < 1 then do;
GRP_NumDistPurchases = 2;
end;
else
if 1 <= NumDistPurchases AND NumDistPurchases < 2 then do;
GRP_NumDistPurchases = 3;
end;
else
if 2 <= NumDistPurchases AND NumDistPurchases < 3 then do;
GRP_NumDistPurchases = 4;
end;
else
if 3 <= NumDistPurchases AND NumDistPurchases < 5 then do;
GRP_NumDistPurchases = 5;
end;
else
if 5 <= NumDistPurchases AND NumDistPurchases < 6 then do;
GRP_NumDistPurchases = 6;
end;
else
if 6 <= NumDistPurchases AND NumDistPurchases < 8 then do;
GRP_NumDistPurchases = 7;
end;
else
if 8 <= NumDistPurchases AND NumDistPurchases < 9 then do;
GRP_NumDistPurchases = 8;
end;
else
if 9 <= NumDistPurchases AND NumDistPurchases < 11 then do;
GRP_NumDistPurchases = 9;
end;
else
if 11 <= NumDistPurchases AND NumDistPurchases < 13 then do;
GRP_NumDistPurchases = 10;
end;
else
if 13 <= NumDistPurchases then do;
GRP_NumDistPurchases = 11;
end;
end;
