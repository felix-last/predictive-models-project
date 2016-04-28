if upcase(NAME) = "ACCEPTEDCMPTOTAL" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNTMEATPRODUCTS" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMCATALOGPURCHASES" then do;
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
if upcase(NAME) = "RFMSTAT" then do;
ROLE = "INPUT";
end;
