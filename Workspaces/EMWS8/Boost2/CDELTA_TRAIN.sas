if upcase(NAME) = "ACCEPTEDCMPTOTAL" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "INCOME" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MNT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "NUMDISTPURCHASES" then do;
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
if upcase(NAME) = "RFMSTAT" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "RMNTFRQ" then do;
ROLE = "INPUT";
end;
