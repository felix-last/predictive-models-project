   
* ;
* Defining: REP_AcceptedCmp4;
* ;
Label REP_AcceptedCmp4='Replacement: AcceptedCmp4';
format REP_AcceptedCmp4 BEST.;
REP_AcceptedCmp4=AcceptedCmp4;
*;
_UFORMAT200 = strip(put(AcceptedCmp4,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp4= .;
