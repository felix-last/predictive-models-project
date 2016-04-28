 
*------------------------------------------------------------*;
* Variable: AcceptedCmpTotal;
*------------------------------------------------------------*;
LABEL GRP_AcceptedCmpTotal = "Grouped: AcceptedCmpTotal";
 
if MISSING(AcceptedCmpTotal) then do;
GRP_AcceptedCmpTotal = 1;
end;
else if NOT MISSING(AcceptedCmpTotal) then do;
if AcceptedCmpTotal < 0 then do;
GRP_AcceptedCmpTotal = 2;
end;
else
if 0 <= AcceptedCmpTotal AND AcceptedCmpTotal < 1 then do;
GRP_AcceptedCmpTotal = 3;
end;
else
if 1 <= AcceptedCmpTotal then do;
GRP_AcceptedCmpTotal = 4;
end;
end;
