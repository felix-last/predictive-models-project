*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;

if NAME="MonthsAsCustomer" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="Dt_Customer" then delete;

if NAME="HigherEducationBinary" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="BINARY";
end;
if NAME="HigherEducation" then delete;

if NAME="NumDistPurchases" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
