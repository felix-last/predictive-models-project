   
* ;
* Defining: REP_AcceptedCmp3;
* ;
Label REP_AcceptedCmp3='Replacement: AcceptedCmp3';
format REP_AcceptedCmp3 BEST.;
REP_AcceptedCmp3=AcceptedCmp3;
*;
_UFORMAT200 = strip(put(AcceptedCmp3,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp3= .;
