   
* ;
* Defining: REP_Marital_Status;
* ;
Length REP_Marital_Status$8;
Label REP_Marital_Status='Replacement: Marital_Status';
format REP_Marital_Status $8.0;
REP_Marital_Status=Marital_Status;
*;
_UFORMAT200 = strip(put(Marital_Status,$8.0));
if ^(_UFORMAT200 in(
"Married", "Together", "Single", "Divorced", "Widow"
, "" )) then
REP_Marital_Status= "";
