* ;
* Variable: HouseKeeping ;
* ;
Label REP_HouseKeeping='Replacement: HouseKeeping';
REP_HouseKeeping =HouseKeeping ;
if HouseKeeping  eq . then REP_HouseKeeping = . ;
else
if HouseKeeping <0  then REP_HouseKeeping  = . ;
else
if HouseKeeping >35  then REP_HouseKeeping  = . ;
* ;
* Variable: Kitchen ;
* ;
Label REP_Kitchen='Replacement: Kitchen';
REP_Kitchen =Kitchen ;
if Kitchen  eq . then REP_Kitchen = . ;
else
if Kitchen <0  then REP_Kitchen  = . ;
else
if Kitchen >40  then REP_Kitchen  = . ;
* ;
* Variable: Toys ;
* ;
Label REP_Toys='Replacement: Toys';
REP_Toys =Toys ;
if Toys  eq . then REP_Toys = . ;
else
if Toys <0  then REP_Toys  = . ;
else
if Toys >40  then REP_Toys  = . ;
   
* ;
* Defining New Variables;
* ;
Label REP_DepVar='Replacement: DepVar';
format REP_DepVar BEST.;
REP_DepVar= DepVar;
Label REP_Dependents='Replacement: Dependents';
format REP_Dependents BEST.;
REP_Dependents= Dependents;
Length REP_Education $10;
Label REP_Education='Replacement: Education';
format REP_Education $10.0;
REP_Education= Education;
Length REP_Gender $1;
Label REP_Gender='Replacement: Gender';
format REP_Gender $1.0;
REP_Gender= Gender;
Length REP_Marital_Status $12;
Label REP_Marital_Status='Replacement: Marital_Status';
format REP_Marital_Status $12.0;
REP_Marital_Status= Marital_Status;
* ;
* Replace Unknown Class Levels ;
* ;
length _UFORMAT200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
*;
_UFORMAT200 = strip(put(DepVar,BEST.));
if ^(_UFORMAT200 in(
"0", "1"
, "" )) then
REP_DepVar= .;
*;
_UFORMAT200 = strip(put(Dependents,BEST.));
if ^(_UFORMAT200 in(
"1", "0"
, "" )) then
REP_Dependents= .;
*;
_UFORMAT200 = strip(put(Education,$10.0));
if ^(_UFORMAT200 in(
"Graduation", "2n Cycle", "Master", "Basic", "PhD", "", "OldSchool"
)) then
REP_Education= "";
*;
_UFORMAT200 = strip(put(Gender,$1.0));
if ^(_UFORMAT200 in(
"F", "M", "?"
, "" )) then
REP_Gender= "";
*;
_UFORMAT200 = strip(put(Marital_Status,$12.0));
if ^(_UFORMAT200 in(
"Married", "Together", "Single", "Divorced", "Widow", "BigConfusion", ""
)) then
REP_Marital_Status= "";
   
* ;
* Replace Specific Class Levels ;
* ;
length _UFormat200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
* ;
* Variable: Education;
* ;
_UFORMAT200 = strip(
put(Education,$10.0));
if _UFORMAT200 =  "OldSchool" then
REP_Education="";
* ;
* Variable: Gender;
* ;
_UFORMAT200 = strip(
put(Gender,$1.0));
if _UFORMAT200 =  "?" then
REP_Gender="";
* ;
* Variable: Marital_Status;
* ;
_UFORMAT200 = strip(
put(Marital_Status,$12.0));
if _UFORMAT200 =  "BigConfusion" then
REP_Marital_Status="";
