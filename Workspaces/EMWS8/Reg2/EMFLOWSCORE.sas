*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG2DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG2DRU[2]  _TEMPORARY_ (1 0);

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
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: PC_1 ;
_TEMP = PC_1 ;
_LP0 = _LP0 + (    0.26588047366542 * _TEMP);

***  Effect: PC_10 ;
_TEMP = PC_10 ;
_LP0 = _LP0 + (   -0.66919261648431 * _TEMP);

***  Effect: PC_11 ;
_TEMP = PC_11 ;
_LP0 = _LP0 + (    0.24414650462815 * _TEMP);

***  Effect: PC_13 ;
_TEMP = PC_13 ;
_LP0 = _LP0 + (   -1.07436868401794 * _TEMP);

***  Effect: PC_14 ;
_TEMP = PC_14 ;
_LP0 = _LP0 + (    0.44251390953597 * _TEMP);

***  Effect: PC_15 ;
_TEMP = PC_15 ;
_LP0 = _LP0 + (   -0.26512634322926 * _TEMP);

***  Effect: PC_16 ;
_TEMP = PC_16 ;
_LP0 = _LP0 + (    0.28971609982801 * _TEMP);

***  Effect: PC_2 ;
_TEMP = PC_2 ;
_LP0 = _LP0 + (   -0.49528883857799 * _TEMP);

***  Effect: PC_3 ;
_TEMP = PC_3 ;
_LP0 = _LP0 + (   -0.10447517157595 * _TEMP);

***  Effect: PC_4 ;
_TEMP = PC_4 ;
_LP0 = _LP0 + (    0.13678148584551 * _TEMP);

***  Effect: PC_5 ;
_TEMP = PC_5 ;
_LP0 = _LP0 + (   -0.35151849887767 * _TEMP);

***  Effect: PC_6 ;
_TEMP = PC_6 ;
_LP0 = _LP0 + (     0.1612221904472 * _TEMP);

***  Effect: PC_7 ;
_TEMP = PC_7 ;
_LP0 = _LP0 + (    0.13756842141361 * _TEMP);

***  Effect: PC_8 ;
_TEMP = PC_8 ;
_LP0 = _LP0 + (    0.33565116397792 * _TEMP);

***  Effect: PC_9 ;
_TEMP = PC_9 ;
_LP0 = _LP0 + (    0.46160039482548 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -2.76146098736578 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG2DR1:

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
I_DepVar = REG2DRF[_IY];
U_DepVar = REG2DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
