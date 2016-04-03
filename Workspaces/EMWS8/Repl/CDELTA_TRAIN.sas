if NAME="HouseKeeping" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_HouseKeeping" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="Kitchen" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Kitchen" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="Toys" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Toys" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
if NAME="DepVar" then ROLE="REJECTED";
else
if NAME="REP_DepVar" then do;
ROLE="TARGET";
LEVEL="BINARY";
end;
else
if NAME="Dependents" then ROLE="REJECTED";
else
if NAME="REP_Dependents" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="Education" then ROLE="REJECTED";
else
if NAME="REP_Education" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Gender" then ROLE="REJECTED";
else
if NAME="REP_Gender" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="Marital_Status" then ROLE="REJECTED";
else
if NAME="REP_Marital_Status" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
