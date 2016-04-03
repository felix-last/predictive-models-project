   
* ;
* Defining: REP_Dependents;
* ;
Label REP_Dependents='Replacement: Dependents';
format REP_Dependents BEST.;
REP_Dependents=Dependents;
*;
_UFORMAT200 = strip(put(Dependents,BEST.));
if ^(_UFORMAT200 in(
"1", "0"
, "" )) then
REP_Dependents= .;
