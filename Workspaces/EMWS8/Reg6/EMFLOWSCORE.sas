*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG6DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG6DRU[2]  _TEMPORARY_ (1 0);

*** Generate dummy variables for DepVar ;
drop _Y ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   _Y = .;
end;
else do;
   if F_DepVar = '0'  then do;
      _Y = 1;
   end;
   else if F_DepVar = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

drop _DM_BAD;
_DM_BAD=0;

*** Check PC_1 for missing values ;
if missing( PC_1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_10 for missing values ;
if missing( PC_10 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_11 for missing values ;
if missing( PC_11 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_13 for missing values ;
if missing( PC_13 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_14 for missing values ;
if missing( PC_14 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_15 for missing values ;
if missing( PC_15 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_16 for missing values ;
if missing( PC_16 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_17 for missing values ;
if missing( PC_17 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_2 for missing values ;
if missing( PC_2 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_3 for missing values ;
if missing( PC_3 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_4 for missing values ;
if missing( PC_4 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_5 for missing values ;
if missing( PC_5 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_6 for missing values ;
if missing( PC_6 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_7 for missing values ;
if missing( PC_7 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_8 for missing values ;
if missing( PC_8 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_9 for missing values ;
if missing( PC_9 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG6DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: PC_1 ;
_TEMP = PC_1 ;
_LP0 = _LP0 + (    0.14663332022041 * _TEMP);

***  Effect: PC_10 ;
_TEMP = PC_10 ;
_LP0 = _LP0 + (   -0.35719965217248 * _TEMP);

***  Effect: PC_11 ;
_TEMP = PC_11 ;
_LP0 = _LP0 + (    0.11801296747238 * _TEMP);

***  Effect: PC_13 ;
_TEMP = PC_13 ;
_LP0 = _LP0 + (   -0.57063758954814 * _TEMP);

***  Effect: PC_14 ;
_TEMP = PC_14 ;
_LP0 = _LP0 + (    0.23480225159013 * _TEMP);

***  Effect: PC_15 ;
_TEMP = PC_15 ;
_LP0 = _LP0 + (   -0.14644921819342 * _TEMP);

***  Effect: PC_16 ;
_TEMP = PC_16 ;
_LP0 = _LP0 + (    0.15192877131626 * _TEMP);

***  Effect: PC_17 ;
_TEMP = PC_17 ;
_LP0 = _LP0 + (   -0.07714648797052 * _TEMP);

***  Effect: PC_2 ;
_TEMP = PC_2 ;
_LP0 = _LP0 + (   -0.27282057439703 * _TEMP);

***  Effect: PC_3 ;
_TEMP = PC_3 ;
_LP0 = _LP0 + (   -0.05565967229284 * _TEMP);

***  Effect: PC_4 ;
_TEMP = PC_4 ;
_LP0 = _LP0 + (    0.08016034574081 * _TEMP);

***  Effect: PC_5 ;
_TEMP = PC_5 ;
_LP0 = _LP0 + (   -0.19902615949141 * _TEMP);

***  Effect: PC_6 ;
_TEMP = PC_6 ;
_LP0 = _LP0 + (    0.09321765205309 * _TEMP);

***  Effect: PC_7 ;
_TEMP = PC_7 ;
_LP0 = _LP0 + (    0.07966372964424 * _TEMP);

***  Effect: PC_8 ;
_TEMP = PC_8 ;
_LP0 = _LP0 + (    0.18049397279056 * _TEMP);

***  Effect: PC_9 ;
_TEMP = PC_9 ;
_LP0 = _LP0 + (    0.25366163319277 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -1.53808507948744) + _LP0);
_P1 = 1.0 - _P0;

REG6DR1:

*** Residuals;
if (_Y = .) then do;
   R_DepVar1 = .;
   R_DepVar0 = .;
end;
else do;
    label R_DepVar1 = 'Residual: DepVar=1' ;
    label R_DepVar0 = 'Residual: DepVar=0' ;
   R_DepVar1 = - _P0;
   R_DepVar0 = - _P1;
   select( _Y );
      when (0)  R_DepVar1 = R_DepVar1 + 1;
      when (1)  R_DepVar0 = R_DepVar0 + 1;
   end;
end;

*** Posterior Probabilities and Predicted Level;
label P_DepVar1 = 'Predicted: DepVar=1' ;
label P_DepVar0 = 'Predicted: DepVar=0' ;
P_DepVar1 = _P0;
_MAXP = _P0;
_IY = 1;
P_DepVar0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_DepVar = REG6DRF[_IY];
U_DepVar = REG6DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
