if name = '_NODE_' then do;
role = 'SEGMENT';
level = 'NOMINAL';
end;
if upcase(name) = 'PC_1' then role = 'INPUT';
else
if upcase(name) = 'PC_10' then role = 'INPUT';
else
if upcase(name) = 'PC_13' then role = 'INPUT';
else
if upcase(name) = 'PC_2' then role = 'INPUT';
else
if upcase(name) = 'PC_9' then role = 'INPUT';
else
if upcase(name) = 'PC_14' then role = 'INPUT';
else
if upcase(name) = 'PC_3' then role = 'INPUT';
else
if upcase(name) = 'PC_12' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_16' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_11' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_7' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_17' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_4' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_5' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_6' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_15' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_8' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'YEAR_BIRTH' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";
