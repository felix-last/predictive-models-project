 
*------------------------------------------------------------*;
* Variable: Dependents;
*------------------------------------------------------------*;
LABEL GRP_Dependents =
'Grouped: Dependents';
 
_UFormat = put(Dependents,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_Dependents = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '1'
) then do;
GRP_Dependents = 2;
end;
else
if (_UFORMAT eq '0'
) then do;
GRP_Dependents = 3;
end;
else do;
GRP_Dependents = 1;
end;
end;
