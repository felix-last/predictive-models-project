if name = '_NODE_' then do;
role = 'SEGMENT';
level = 'NOMINAL';
end;
if upcase(name) = 'ACCEPTEDCMPTOTAL' then role = 'INPUT';
else
if upcase(name) = 'RECENCY' then role = 'INPUT';
else
if upcase(name) = 'NUMCATALOGPURCHASES' then role = 'INPUT';
else
if upcase(name) = 'MNTMEATPRODUCTS' then role = 'INPUT';
else
if upcase(name) = 'G_MARITAL_STATUS' then role = 'INPUT';
else
if upcase(name) = 'RFMSTAT' then role = 'INPUT';
else
if upcase(name) = 'FRQ' then role = 'INPUT';
else
if upcase(name) = 'MNTSWEETPRODUCTS' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNT' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'RMNTFRQ' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'NUMWEBPURCHASES' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'INCOME' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTGOLDPRODS' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTFRUITS' then do;
role = 'REJECTED';
comment = "Tree4: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";