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
if upcase(name) = 'NUMSTOREPURCHASES' then role = 'INPUT';
else
if upcase(name) = 'NUMWEBVISITSMONTH' then role = 'INPUT';
else
if upcase(name) = 'MARITAL_STATUS' then role = 'INPUT';
else
if upcase(name) = 'KIDHOME' then role = 'INPUT';
else
if upcase(name) = 'MNTFISHPRODUCTS' then role = 'INPUT';
else
if upcase(name) = 'NUMDEALSPURCHASES' then role = 'INPUT';
else
if upcase(name) = 'RFMSTAT' then role = 'INPUT';
else
if upcase(name) = 'NUMWEBPURCHASES' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTMEATPRODUCTS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTFRUITS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTGOLDPRODS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'ACCEPTEDCMP3' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTSWEETPRODUCTS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNTWINES' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MNT' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'TEENHOME' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'ACCEPTEDCMP1' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'ACCEPTEDCMP2' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'COMPLAIN' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'ACCEPTEDCMP4' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'ACCEPTEDCMP5' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'HIGHEREDUCATIONBINARY' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'NUMDISTPURCHASES' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";
