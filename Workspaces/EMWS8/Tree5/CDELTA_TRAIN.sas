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
if upcase(name) = 'NUMWEBVISITSMONTH' then role = 'INPUT';
else
if upcase(name) = 'MNTMEATPRODUCTS' then role = 'INPUT';
else
if upcase(name) = 'MARITAL_STATUS' then role = 'INPUT';
else
if upcase(name) = 'FRQ' then role = 'INPUT';
else
if upcase(name) = 'NUMDEALSPURCHASES' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNT' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTGOLDPRODS' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'TEENHOME' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'INCOME' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'RFMSTAT' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'YEAR_BIRTH' then do;
role = 'REJECTED';
comment = "Tree5: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";
