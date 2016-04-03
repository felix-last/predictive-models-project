if upcase(name) = 'AGE' then role = 'REJECTED';
else
if upcase(name) = 'AGE_EXMPL2' then role = 'REJECTED';
else
if upcase(name) = 'CLOTHES' then role = 'REJECTED';
else
if upcase(name) = 'DEPENDENTS' then role = 'REJECTED';
else
if upcase(name) = 'EDUCATION' then role = 'REJECTED';
else
if upcase(name) = 'GENDER' then role = 'REJECTED';
else
if upcase(name) = 'HIGHEREDUCATION' then role = 'REJECTED';
else
if upcase(name) = 'HOUSEKEEPING' then role = 'REJECTED';
else
if upcase(name) = 'KITCHEN' then role = 'REJECTED';
else
if upcase(name) = 'MARITAL_STATUS' then role = 'REJECTED';
else
if upcase(name) = 'MONTHSASCUSTOMER' then role = 'REJECTED';
else
if upcase(name) = 'NETPURCHASE' then role = 'REJECTED';
else
if upcase(name) = 'RMNTFRQ' then role = 'REJECTED';
else
if upcase(name) = 'RCN' then role = 'REJECTED';
else
if upcase(name) = 'SMALLAPPLIANCES' then role = 'REJECTED';
else
if upcase(name) = 'TOYS' then role = 'REJECTED';
if upcase(strip(name)) = "G_MARITAL_STATUS" then level = "NOMINAL";
if upcase(strip(name)) = "G_EDUCATION" then level = "NOMINAL";
