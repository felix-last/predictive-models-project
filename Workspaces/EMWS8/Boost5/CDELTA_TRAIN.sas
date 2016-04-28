if upcase(NAME) = "ACCEPTEDCMP1" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "ACCEPTEDCMP2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "ACCEPTEDCMP3" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "ACCEPTEDCMP4" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "ACCEPTEDCMP5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "COMPLAIN" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "EDUCATION" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "INCOME" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "KIDHOME" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MARITAL_STATUS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTFISHPRODUCTS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTFRUITS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTGOLDPRODS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTMEATPRODUCTS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTSWEETPRODUCTS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTWINES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMCATALOGPURCHASES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMDEALSPURCHASES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMSTOREPURCHASES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMWEBPURCHASES" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "NUMWEBVISITSMONTH" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_DEPVAR0" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_DEPVAR1" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "RECENCY" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "TEENHOME" then do;
ROLE = "REJECTED";
end;
