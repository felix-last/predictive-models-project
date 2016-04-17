 
*------------------------------------------------------------*;
* Variable: RMntFrq;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq = "Grouped: RMntFrq";
 
if MISSING(RMntFrq) then do;
GRP_RMntFrq = 1;
end;
else if NOT MISSING(RMntFrq) then do;
if RMntFrq < 13.25 then do;
GRP_RMntFrq = 2;
end;
else
if 13.25 <= RMntFrq AND RMntFrq < 30.4 then do;
GRP_RMntFrq = 3;
end;
else
if 30.4 <= RMntFrq AND RMntFrq < 52.86 then do;
GRP_RMntFrq = 4;
end;
else
if 52.86 <= RMntFrq then do;
GRP_RMntFrq = 5;
end;
end;
