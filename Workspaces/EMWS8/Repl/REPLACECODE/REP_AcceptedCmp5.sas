   
* ;
* Defining: REP_AcceptedCmp5;
* ;
Label REP_AcceptedCmp5='Replacement: AcceptedCmp5';
format REP_AcceptedCmp5 BEST.;
REP_AcceptedCmp5=AcceptedCmp5;
*;
_UFORMAT200 = strip(put(AcceptedCmp5,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp5= .;
