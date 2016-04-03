   
* ;
* Defining: REP_Marital_Status;
* ;
Length REP_Marital_Status$12;
Label REP_Marital_Status='Replacement: Marital_Status';
format REP_Marital_Status $12.0;
REP_Marital_Status=Marital_Status;
*;
_UFORMAT200 = strip(put(Marital_Status,$12.0));
if ^(_UFORMAT200 in(
"Married", "Together", "Single", "Divorced", "Widow", "BigConfusion", ""
)) then
REP_Marital_Status= "";
* ;
* Variable: Marital_Status;
* ;
_UFORMAT200 = strip(
put(Marital_Status,$12.0));
if _UFORMAT200 =  "BigConfusion" then
REP_Marital_Status="";
