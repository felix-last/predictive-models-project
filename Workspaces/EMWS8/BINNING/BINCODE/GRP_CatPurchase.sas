 
*------------------------------------------------------------*;
* Variable: CatPurchase;
*------------------------------------------------------------*;
LABEL GRP_CatPurchase =
'Grouped: CatPurchase';
 
if MISSING(CatPurchase) then do;
GRP_CatPurchase = 1;
end;
else if NOT MISSING(CatPurchase) then do;
if CatPurchase < 43 then do;
GRP_CatPurchase = 2;
end;
else
if 43 <= CatPurchase AND CatPurchase < 55 then do;
GRP_CatPurchase = 3;
end;
else
if 55 <= CatPurchase AND CatPurchase < 73 then do;
GRP_CatPurchase = 4;
end;
else
if 73 <= CatPurchase then do;
GRP_CatPurchase = 5;
end;
end;
