   
* ;
* Defining: REP_AcceptedCmp1;
* ;
Label REP_AcceptedCmp1='Replacement: AcceptedCmp1';
format REP_AcceptedCmp1 BEST.;
REP_AcceptedCmp1=AcceptedCmp1;
*;
_UFORMAT200 = strip(put(AcceptedCmp1,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp1= .;
