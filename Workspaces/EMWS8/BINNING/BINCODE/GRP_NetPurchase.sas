 
*------------------------------------------------------------*;
* Variable: NetPurchase;
*------------------------------------------------------------*;
LABEL GRP_NetPurchase =
'Grouped: NetPurchase';
 
if MISSING(NetPurchase) then do;
GRP_NetPurchase = 1;
end;
else if NOT MISSING(NetPurchase) then do;
if NetPurchase < 27 then do;
GRP_NetPurchase = 2;
end;
else
if 27 <= NetPurchase AND NetPurchase < 45 then do;
GRP_NetPurchase = 3;
end;
else
if 45 <= NetPurchase AND NetPurchase < 57 then do;
GRP_NetPurchase = 4;
end;
else
if 57 <= NetPurchase then do;
GRP_NetPurchase = 5;
end;
end;
