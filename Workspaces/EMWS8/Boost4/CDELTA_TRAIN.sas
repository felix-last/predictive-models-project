if upcase(NAME) = "GRP_ACCEPTEDCMP5" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GRP_FRQ" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_INCOME" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_MNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_MNTFISHPRODUCTS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_MNTGOLDPRODS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_MNTMEATPRODUCTS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_MNTWINES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_NUMCATALOGPURCHASES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_NUMDISTPURCHASES" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_NUMWEBPURCHASES" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "GRP_RECENCY" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_RFMSTAT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "GRP_RMNTFRQ" then do;
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
if upcase(NAME) = "YEAR_BIRTH" then do;
ROLE = "INPUT";
end;
