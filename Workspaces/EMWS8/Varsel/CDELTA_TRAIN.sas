if upcase(name) = 'ACCEPTEDCMP1' then role = 'REJECTED';
else
if upcase(name) = 'ACCEPTEDCMP2' then role = 'REJECTED';
else
if upcase(name) = 'ACCEPTEDCMP3' then role = 'REJECTED';
else
if upcase(name) = 'ACCEPTEDCMP4' then role = 'REJECTED';
else
if upcase(name) = 'ACCEPTEDCMP5' then role = 'REJECTED';
else
if upcase(name) = 'AGE' then role = 'REJECTED';
else
if upcase(name) = 'COMPLAIN' then role = 'REJECTED';
else
if upcase(name) = 'EDUCATION' then role = 'REJECTED';
else
if upcase(name) = 'HIGHEREDUCATIONBINARY' then role = 'REJECTED';
else
if upcase(name) = 'KIDHOME' then role = 'REJECTED';
else
if upcase(name) = 'MARITAL_STATUS' then role = 'REJECTED';
else
if upcase(name) = 'MNTFISHPRODUCTS' then role = 'REJECTED';
else
if upcase(name) = 'MNTFRUITS' then role = 'REJECTED';
else
if upcase(name) = 'MNTSWEETPRODUCTS' then role = 'REJECTED';
else
if upcase(name) = 'MONTHSASCUSTOMER' then role = 'REJECTED';
else
if upcase(name) = 'NUMCATALOGPURCHASES' then role = 'REJECTED';
else
if upcase(name) = 'NUMDEALSPURCHASES' then role = 'REJECTED';
else
if upcase(name) = 'NUMSTOREPURCHASES' then role = 'REJECTED';
else
if upcase(name) = 'NUMWEBPURCHASES' then role = 'REJECTED';
else
if upcase(name) = 'NUMWEBVISITSMONTH' then role = 'REJECTED';
else
if upcase(name) = 'TEENHOME' then role = 'REJECTED';
else
if upcase(name) = 'YEAR_BIRTH' then role = 'REJECTED';
if upcase(strip(name)) = "G_MARITAL_STATUS" then level = "NOMINAL";
