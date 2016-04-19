   
* ;
* Defining New Variables;
* ;
Label REP_AcceptedCmp1='Replacement: AcceptedCmp1';
format REP_AcceptedCmp1 BEST.;
REP_AcceptedCmp1= AcceptedCmp1;
Label REP_AcceptedCmp2='Replacement: AcceptedCmp2';
format REP_AcceptedCmp2 BEST.;
REP_AcceptedCmp2= AcceptedCmp2;
Label REP_AcceptedCmp3='Replacement: AcceptedCmp3';
format REP_AcceptedCmp3 BEST.;
REP_AcceptedCmp3= AcceptedCmp3;
Label REP_AcceptedCmp4='Replacement: AcceptedCmp4';
format REP_AcceptedCmp4 BEST.;
REP_AcceptedCmp4= AcceptedCmp4;
Label REP_AcceptedCmp5='Replacement: AcceptedCmp5';
format REP_AcceptedCmp5 BEST.;
REP_AcceptedCmp5= AcceptedCmp5;
Label REP_Complain='Replacement: Complain';
format REP_Complain BEST.;
REP_Complain= Complain;
Length REP_Education $10;
Label REP_Education='Replacement: Education';
format REP_Education $10.0;
REP_Education= Education;
Length REP_Marital_Status $8;
Label REP_Marital_Status='Replacement: Marital_Status';
format REP_Marital_Status $8.0;
REP_Marital_Status= Marital_Status;
* ;
* Replace Unknown Class Levels ;
* ;
length _UFORMAT200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
*;
_UFORMAT200 = strip(put(AcceptedCmp1,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp1= .;
*;
_UFORMAT200 = strip(put(AcceptedCmp2,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp2= .;
*;
_UFORMAT200 = strip(put(AcceptedCmp3,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp3= .;
*;
_UFORMAT200 = strip(put(AcceptedCmp4,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp4= .;
*;
_UFORMAT200 = strip(put(AcceptedCmp5,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_AcceptedCmp5= .;
*;
_UFORMAT200 = strip(put(Complain,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_Complain= .;
*;
_UFORMAT200 = strip(put(Education,$10.0));
if ^(_UFORMAT200 in(
"Graduation", "PhD", "Master", "2n Cycle", "Basic"
, "" )) then
REP_Education= "";
*;
_UFORMAT200 = strip(put(Marital_Status,$8.0));
if ^(_UFORMAT200 in(
"Married", "Together", "Single", "Divorced", "Widow"
, "" )) then
REP_Marital_Status= "";
