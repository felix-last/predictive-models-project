if NAME="AcceptedCmp1" then ROLE="REJECTED";
else
if NAME="REP_AcceptedCmp1" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="AcceptedCmp2" then ROLE="REJECTED";
else
if NAME="REP_AcceptedCmp2" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="AcceptedCmp3" then ROLE="REJECTED";
else
if NAME="REP_AcceptedCmp3" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="AcceptedCmp4" then ROLE="REJECTED";
else
if NAME="REP_AcceptedCmp4" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="AcceptedCmp5" then ROLE="REJECTED";
else
if NAME="REP_AcceptedCmp5" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="Complain" then ROLE="REJECTED";
else
if NAME="REP_Complain" then do;
ROLE="INPUT";
LEVEL="BINARY";
end;
else
if NAME="DepVar" then ROLE="REJECTED";
else
if NAME="REP_DepVar" then do;
ROLE="TARGET";
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
if NAME="Marital_Status" then ROLE="REJECTED";
else
if NAME="REP_Marital_Status" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
