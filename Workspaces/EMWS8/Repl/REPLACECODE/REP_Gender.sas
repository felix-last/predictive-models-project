   
* ;
* Defining: REP_Gender;
* ;
Length REP_Gender$1;
Label REP_Gender='Replacement: Gender';
format REP_Gender $1.0;
REP_Gender=Gender;
*;
_UFORMAT200 = strip(put(Gender,$1.0));
if ^(_UFORMAT200 in(
"F", "M", "?"
, "" )) then
REP_Gender= "";
* ;
* Variable: Gender;
* ;
_UFORMAT200 = strip(
put(Gender,$1.0));
if _UFORMAT200 =  "?" then
REP_Gender="";
