   
* ;
* Defining: REP_Complain;
* ;
Label REP_Complain='Replacement: Complain';
format REP_Complain BEST.;
REP_Complain=Complain;
*;
_UFORMAT200 = strip(put(Complain,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_Complain= .;
