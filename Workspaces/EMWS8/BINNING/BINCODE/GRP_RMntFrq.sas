 
*------------------------------------------------------------*;
* Variable: RMntFrq;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq = "Grouped: RMntFrq";
 
if MISSING(RMntFrq) then do;
GRP_RMntFrq = 1;
end;
else if NOT MISSING(RMntFrq) then do;
if RMntFrq < 7.83 then do;
GRP_RMntFrq = 2;
end;
else
if 7.83 <= RMntFrq AND RMntFrq < 11 then do;
GRP_RMntFrq = 3;
end;
else
if 11 <= RMntFrq AND RMntFrq < 15.83 then do;
GRP_RMntFrq = 4;
end;
else
if 15.83 <= RMntFrq AND RMntFrq < 23.77 then do;
GRP_RMntFrq = 5;
end;
else
if 23.77 <= RMntFrq AND RMntFrq < 30.4 then do;
GRP_RMntFrq = 6;
end;
else
if 30.4 <= RMntFrq AND RMntFrq < 36.55 then do;
GRP_RMntFrq = 7;
end;
else
if 36.55 <= RMntFrq AND RMntFrq < 43.06 then do;
GRP_RMntFrq = 8;
end;
else
if 43.06 <= RMntFrq AND RMntFrq < 68.73 then do;
GRP_RMntFrq = 9;
end;
else
if 68.73 <= RMntFrq AND RMntFrq < 75.83 then do;
GRP_RMntFrq = 10;
end;
else
if 75.83 <= RMntFrq then do;
GRP_RMntFrq = 11;
end;
end;
