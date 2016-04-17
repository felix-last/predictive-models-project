 
*------------------------------------------------------------*;
* Variable: AcceptedCmp5;
*------------------------------------------------------------*;
LABEL GRP_AcceptedCmp5 =
'Grouped: AcceptedCmp5';
 
_UFormat = put(AcceptedCmp5,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_AcceptedCmp5 = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '0'
) then do;
GRP_AcceptedCmp5 = 2;
end;
else
if (_UFORMAT eq '1'
) then do;
GRP_AcceptedCmp5 = 3;
end;
else do;
GRP_AcceptedCmp5 = 1;
end;
end;
