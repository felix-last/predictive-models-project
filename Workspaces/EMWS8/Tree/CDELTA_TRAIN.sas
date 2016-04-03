if name = '_NODE_' then do;
role = 'SEGMENT';
level = 'NOMINAL';
end;
if upcase(name) = 'MNT' then role = 'INPUT';
else
if upcase(name) = 'RCN' then role = 'INPUT';
else
if upcase(name) = 'HOUSEKEEPING' then role = 'INPUT';
else
if upcase(name) = 'RECOMENDATION' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'CATPURCHASE' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'CLOTHES' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'DEPENDENTS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'SMALLAPPLIANCES' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'TOYS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'MARITAL_STATUS' then do;
role = 'REJECTED';
comment = "Tree: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";
