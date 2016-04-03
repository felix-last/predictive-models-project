*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;

if NAME="RMntFrq_Exmpl2" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;

if NAME="Age_Exmpl2" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="Year_Birth" then delete;

if NAME="MonthsAsCustomer" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="Dt_Customer" then delete;
