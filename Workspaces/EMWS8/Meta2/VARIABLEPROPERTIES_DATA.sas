*------------------------------------------------------------*;
* Variable Attributes for DATA;
*------------------------------------------------------------*;
if upcase(NAME) = "ACCEPTEDCMPTOTAL" then NEWROLE="REJECTED";
if upcase(NAME) = "AGE" then NEWROLE="REJECTED";
if upcase(NAME) = "FRQ" then NEWROLE="REJECTED";
if upcase(NAME) = "HIGHEREDUCATION" then NEWROLE="REJECTED";
if upcase(NAME) = "HIGHEREDUCATION" then HIDE="Y";
if upcase(NAME) = "HIGHEREDUCATIONBINARY" then NEWROLE="REJECTED";
if upcase(NAME) = "MNT" then NEWROLE="REJECTED";
if upcase(NAME) = "MONTHSASCUSTOMER" then NEWROLE="REJECTED";
if upcase(NAME) = "NUMDISTPURCHASES" then NEWROLE="REJECTED";
if upcase(NAME) = "RFMSTAT" then NEWROLE="REJECTED";
if upcase(NAME) = "RMNTFRQ" then NEWROLE="REJECTED";
if upcase(NAME) = "YEAR_BIRTH" then NEWROLE="REJECTED";