 
*------------------------------------------------------------*;
* Variable: RMntFrq_Exmpl2;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq_Exmpl2 = "Grouped: RMntFrq_Exmpl2";
 
if MISSING(RMntFrq_Exmpl2) then do;
GRP_RMntFrq_Exmpl2 = 1;
end;
else if NOT MISSING(RMntFrq_Exmpl2) then do;
if RMntFrq_Exmpl2 < 7 then do;
GRP_RMntFrq_Exmpl2 = 2;
end;
else
if 7 <= RMntFrq_Exmpl2 AND RMntFrq_Exmpl2 < 23.84 then do;
GRP_RMntFrq_Exmpl2 = 3;
end;
else
if 23.84 <= RMntFrq_Exmpl2 AND RMntFrq_Exmpl2 < 40.38 then do;
GRP_RMntFrq_Exmpl2 = 4;
end;
else
if 40.38 <= RMntFrq_Exmpl2 then do;
GRP_RMntFrq_Exmpl2 = 5;
end;
end;
