 
*------------------------------------------------------------*;
* Variable: RMntFrq;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq = "Grouped: RMntFrq";
 
if MISSING(RMntFrq) then do;
GRP_RMntFrq = 1;
end;
else if NOT MISSING(RMntFrq) then do;
if RMntFrq < 7 then do;
GRP_RMntFrq = 2;
end;
else
if 7 <= RMntFrq AND RMntFrq < 23.84 then do;
GRP_RMntFrq = 3;
end;
else
if 23.84 <= RMntFrq AND RMntFrq < 40.38 then do;
GRP_RMntFrq = 4;
end;
else
if 40.38 <= RMntFrq then do;
GRP_RMntFrq = 5;
end;
end;
