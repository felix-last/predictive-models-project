   
* ;
* Defining: REP_Education;
* ;
Length REP_Education$10;
Label REP_Education='Replacement: Education';
format REP_Education $10.0;
REP_Education=Education;
*;
_UFORMAT200 = strip(put(Education,$10.0));
if ^(_UFORMAT200 in(
"Graduation", "2n Cycle", "Master", "Basic", "PhD", "", "OldSchool"
)) then
REP_Education= "";
* ;
* Variable: Education;
* ;
_UFORMAT200 = strip(
put(Education,$10.0));
if _UFORMAT200 =  "OldSchool" then
REP_Education="";
