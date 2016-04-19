if name = '_NODE_' then do;
role = 'SEGMENT';
level = 'NOMINAL';
end;
if upcase(name) = 'GRP_RFMSTAT' then role = 'INPUT';
else
if upcase(name) = 'GRP_ACCEPTEDCMP5' then role = 'INPUT';
else
if upcase(name) = 'GRP_RECENCY' then role = 'INPUT';
else
if upcase(name) = 'GRP_NUMCATALOGPURCHASES' then role = 'INPUT';
else
if upcase(name) = 'GRP_MNTWINES' then role = 'INPUT';
else
if upcase(name) = 'GRP_MNTMEATPRODUCTS' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_INCOME' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_FRQ' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_NUMWEBPURCHASES' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'YEAR_BIRTH' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_MNTFISHPRODUCTS' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_NUMDISTPURCHASES' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_RMNTFRQ' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_MNT' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'GRP_MNTGOLDPRODS' then do;
role = 'REJECTED';
comment = "Tree3: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";
