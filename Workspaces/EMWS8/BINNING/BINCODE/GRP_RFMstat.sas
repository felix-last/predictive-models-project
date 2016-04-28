 
*------------------------------------------------------------*;
* Variable: RFMstat;
*------------------------------------------------------------*;
LABEL GRP_RFMstat = "Grouped: RFMstat";
 
if MISSING(RFMstat) then do;
GRP_RFMstat = 1;
end;
else if NOT MISSING(RFMstat) then do;
if RFMstat < 3 then do;
GRP_RFMstat = 2;
end;
else
if 3 <= RFMstat AND RFMstat < 6.88 then do;
GRP_RFMstat = 3;
end;
else
if 6.88 <= RFMstat AND RFMstat < 18.67 then do;
GRP_RFMstat = 4;
end;
else
if 18.67 <= RFMstat AND RFMstat < 52.5 then do;
GRP_RFMstat = 5;
end;
else
if 52.5 <= RFMstat AND RFMstat < 128.09 then do;
GRP_RFMstat = 6;
end;
else
if 128.09 <= RFMstat AND RFMstat < 234.14 then do;
GRP_RFMstat = 7;
end;
else
if 234.14 <= RFMstat AND RFMstat < 369.14 then do;
GRP_RFMstat = 8;
end;
else
if 369.14 <= RFMstat AND RFMstat < 571.29 then do;
GRP_RFMstat = 9;
end;
else
if 571.29 <= RFMstat AND RFMstat < 1073.68 then do;
GRP_RFMstat = 10;
end;
else
if 1073.68 <= RFMstat then do;
GRP_RFMstat = 11;
end;
end;
