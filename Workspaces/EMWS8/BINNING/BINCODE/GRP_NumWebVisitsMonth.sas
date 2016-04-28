 
*------------------------------------------------------------*;
* Variable: NumWebVisitsMonth;
*------------------------------------------------------------*;
LABEL GRP_NumWebVisitsMonth =
'Grouped: NumWebVisitsMonth';
 
if MISSING(NumWebVisitsMonth) then do;
GRP_NumWebVisitsMonth = 1;
end;
else if NOT MISSING(NumWebVisitsMonth) then do;
if NumWebVisitsMonth < 2 then do;
GRP_NumWebVisitsMonth = 2;
end;
else
if 2 <= NumWebVisitsMonth AND NumWebVisitsMonth < 3 then do;
GRP_NumWebVisitsMonth = 3;
end;
else
if 3 <= NumWebVisitsMonth AND NumWebVisitsMonth < 4 then do;
GRP_NumWebVisitsMonth = 4;
end;
else
if 4 <= NumWebVisitsMonth AND NumWebVisitsMonth < 5 then do;
GRP_NumWebVisitsMonth = 5;
end;
else
if 5 <= NumWebVisitsMonth AND NumWebVisitsMonth < 6 then do;
GRP_NumWebVisitsMonth = 6;
end;
else
if 6 <= NumWebVisitsMonth AND NumWebVisitsMonth < 7 then do;
GRP_NumWebVisitsMonth = 7;
end;
else
if 7 <= NumWebVisitsMonth AND NumWebVisitsMonth < 8 then do;
GRP_NumWebVisitsMonth = 8;
end;
else
if 8 <= NumWebVisitsMonth then do;
GRP_NumWebVisitsMonth = 9;
end;
end;
