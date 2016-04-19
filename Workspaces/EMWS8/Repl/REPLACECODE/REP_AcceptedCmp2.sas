   
* ;
* Defining: REP_AcceptedCmp2;
* ;
Label REP_AcceptedCmp2='Replacement: AcceptedCmp2';
format REP_AcceptedCmp2 BEST.;
REP_AcceptedCmp2=AcceptedCmp2;
*;
_UFORMAT200 = strip(put(AcceptedCmp2,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp2= .;
