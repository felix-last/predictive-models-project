if name = '_NODE_' then do;
role = 'SEGMENT';
level = 'NOMINAL';
end;
if upcase(name) = 'PC_1' then role = 'INPUT';
else
if upcase(name) = 'PC_5' then role = 'INPUT';
else
if upcase(name) = 'PC_13' then role = 'INPUT';
else
if upcase(name) = 'PC_12' then role = 'INPUT';
else
if upcase(name) = 'PC_3' then role = 'INPUT';
else
if upcase(name) = 'PC_14' then role = 'INPUT';
else
if upcase(name) = 'PC_11' then role = 'INPUT';
else
if upcase(name) = 'PC_10' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_16' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_19' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_18' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_15' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_2' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_20' then do;
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
if upcase(name) = 'PC_7' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_6' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_9' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
else
if upcase(name) = 'PC_8' then do;
role = 'REJECTED';
comment = "Tree2: TREELOWIMPORTANCE";
end;
if upcase(name) = 'Q_DepVar1' then role = "ASSESS";
if upcase(name) = 'Q_DepVar0' then role = "ASSESS";
