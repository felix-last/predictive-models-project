length _UFormat $200;
drop _UFormat;
_UFormat='';

*------------------------------------------------------------*;
* Variable: Age;
*------------------------------------------------------------*;
LABEL GRP_Age = "Grouped: Age";

if MISSING(Age) then do;
GRP_Age = 1;
end;
else if NOT MISSING(Age) then do;
if Age < 36 then do;
GRP_Age = 2;
end;
else
if 36 <= Age AND Age < 50 then do;
GRP_Age = 3;
end;
else
if 50 <= Age AND Age < 64 then do;
GRP_Age = 4;
end;
else
if 64 <= Age then do;
GRP_Age = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Age_Exmpl2;
*------------------------------------------------------------*;
LABEL GRP_Age_Exmpl2 = "Grouped: Age_Exmpl2";

if MISSING(Age_Exmpl2) then do;
GRP_Age_Exmpl2 = 1;
end;
else if NOT MISSING(Age_Exmpl2) then do;
if Age_Exmpl2 < 36 then do;
GRP_Age_Exmpl2 = 2;
end;
else
if 36 <= Age_Exmpl2 AND Age_Exmpl2 < 50 then do;
GRP_Age_Exmpl2 = 3;
end;
else
if 50 <= Age_Exmpl2 AND Age_Exmpl2 < 64 then do;
GRP_Age_Exmpl2 = 4;
end;
else
if 64 <= Age_Exmpl2 then do;
GRP_Age_Exmpl2 = 5;
end;
end;

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

*------------------------------------------------------------*;
* Variable: Frq;
*------------------------------------------------------------*;
LABEL GRP_Frq =
'Grouped: Frq';

if MISSING(Frq) then do;
GRP_Frq = 1;
end;
else if NOT MISSING(Frq) then do;
if Frq < 11 then do;
GRP_Frq = 2;
end;
else
if 11 <= Frq AND Frq < 18 then do;
GRP_Frq = 3;
end;
else
if 18 <= Frq AND Frq < 28 then do;
GRP_Frq = 4;
end;
else
if 28 <= Frq then do;
GRP_Frq = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Income;
*------------------------------------------------------------*;
LABEL GRP_Income =
'Grouped: Income';

if MISSING(Income) then do;
GRP_Income = 1;
end;
else if NOT MISSING(Income) then do;
if Income < 51921.45 then do;
GRP_Income = 2;
end;
else
if 51921.45 <= Income AND Income < 74868.15 then do;
GRP_Income = 3;
end;
else
if 74868.15 <= Income AND Income < 97525.05 then do;
GRP_Income = 4;
end;
else
if 97525.05 <= Income then do;
GRP_Income = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Mnt;
*------------------------------------------------------------*;
LABEL GRP_Mnt =
'Grouped: Mnt';

if MISSING(Mnt) then do;
GRP_Mnt = 1;
end;
else if NOT MISSING(Mnt) then do;
if Mnt < 67.6 then do;
GRP_Mnt = 2;
end;
else
if 67.6 <= Mnt AND Mnt < 407.68 then do;
GRP_Mnt = 3;
end;
else
if 407.68 <= Mnt AND Mnt < 1127.36 then do;
GRP_Mnt = 4;
end;
else
if 1127.36 <= Mnt then do;
GRP_Mnt = 5;
end;
end;

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

*------------------------------------------------------------*;
* Variable: RMntFrq;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq = "Grouped: RMntFrq";

if MISSING(RMntFrq) then do;
GRP_RMntFrq = 1;
end;
else if NOT MISSING(RMntFrq) then do;
if RMntFrq < 7 then do;
GRP_RMntFrq = 2;
end;
else
if 7 <= RMntFrq AND RMntFrq < 23.84 then do;
GRP_RMntFrq = 3;
end;
else
if 23.84 <= RMntFrq AND RMntFrq < 40.38 then do;
GRP_RMntFrq = 4;
end;
else
if 40.38 <= RMntFrq then do;
GRP_RMntFrq = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: RMntFrq_Exmpl2;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq_Exmpl2 = "Grouped: RMntFrq_Exmpl2";

if MISSING(RMntFrq_Exmpl2) then do;
GRP_RMntFrq_Exmpl2 = 1;
end;
else if NOT MISSING(RMntFrq_Exmpl2) then do;
if RMntFrq_Exmpl2 < 7 then do;
GRP_RMntFrq_Exmpl2 = 2;
end;
else
if 7 <= RMntFrq_Exmpl2 AND RMntFrq_Exmpl2 < 23.84 then do;
GRP_RMntFrq_Exmpl2 = 3;
end;
else
if 23.84 <= RMntFrq_Exmpl2 AND RMntFrq_Exmpl2 < 40.38 then do;
GRP_RMntFrq_Exmpl2 = 4;
end;
else
if 40.38 <= RMntFrq_Exmpl2 then do;
GRP_RMntFrq_Exmpl2 = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Recomendation;
*------------------------------------------------------------*;
LABEL GRP_Recomendation =
'Grouped: Recomendation';

if MISSING(Recomendation) then do;
GRP_Recomendation = 1;
end;
else if NOT MISSING(Recomendation) then do;
if Recomendation < 3 then do;
GRP_Recomendation = 2;
end;
else
if 3 <= Recomendation AND Recomendation < 4 then do;
GRP_Recomendation = 3;
end;
else
if 4 <= Recomendation AND Recomendation < 5 then do;
GRP_Recomendation = 4;
end;
else
if 5 <= Recomendation then do;
GRP_Recomendation = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Dependents;
*------------------------------------------------------------*;
LABEL GRP_Dependents =
'Grouped: Dependents';

_UFormat = put(Dependents,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_Dependents = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '1'
) then do;
GRP_Dependents = 2;
end;
else
if (_UFORMAT eq '0'
) then do;
GRP_Dependents = 3;
end;
else do;
GRP_Dependents = 1;
end;
end;
