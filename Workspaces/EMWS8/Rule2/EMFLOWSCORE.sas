*------------------------------------------------------------*;
* Rule Induction Scoring Code;
*------------------------------------------------------------*;
length _bin $12 I__bin $12 I_DepVar $32;
label I_DepVar = 'Into: DepVar';
label F_DepVar = 'Into: DepVar';
*;
drop I__bin;
*;
F_DepVar=putn(DepVar, 'best.');
%DMNORMIP(F_DepVar);
I_DepVar = '';
I__bin= '0';
*;
*------------------------------------------------------------*;
* Null Model;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
*Binary model for DepVar = 0;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I__bin $ 12;
label I__bin = 'Into: _bin' ;
*** Target Values;
array RULE2_1DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE2_1DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

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

*** Check PC_12 for missing values ;
if missing( PC_12 ) then do;
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

*** Check Year_Birth for missing values ;
if missing( Year_Birth ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.848778433;
   _P1 = 0.151221567;
   goto RULE2_1DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: PC_1 ;
_TEMP = PC_1 ;
_LP0 = _LP0 + (   -0.26954538993436 * _TEMP);

***  Effect: PC_10 ;
_TEMP = PC_10 ;
_LP0 = _LP0 + (    0.64298546191549 * _TEMP);

***  Effect: PC_11 ;
_TEMP = PC_11 ;
_LP0 = _LP0 + (   -0.20476065541485 * _TEMP);

***  Effect: PC_12 ;
_TEMP = PC_12 ;
_LP0 = _LP0 + (   -0.12743171542628 * _TEMP);

***  Effect: PC_13 ;
_TEMP = PC_13 ;
_LP0 = _LP0 + (    1.10503864281047 * _TEMP);

***  Effect: PC_14 ;
_TEMP = PC_14 ;
_LP0 = _LP0 + (   -0.47070066205459 * _TEMP);

***  Effect: PC_15 ;
_TEMP = PC_15 ;
_LP0 = _LP0 + (    0.27866462830127 * _TEMP);

***  Effect: PC_16 ;
_TEMP = PC_16 ;
_LP0 = _LP0 + (   -0.29228285295779 * _TEMP);

***  Effect: PC_17 ;
_TEMP = PC_17 ;
_LP0 = _LP0 + (    0.09077869563516 * _TEMP);

***  Effect: PC_2 ;
_TEMP = PC_2 ;
_LP0 = _LP0 + (    0.49216130375915 * _TEMP);

***  Effect: PC_3 ;
_TEMP = PC_3 ;
_LP0 = _LP0 + (    0.12545955198911 * _TEMP);

***  Effect: PC_4 ;
_TEMP = PC_4 ;
_LP0 = _LP0 + (   -0.15867643727867 * _TEMP);

***  Effect: PC_5 ;
_TEMP = PC_5 ;
_LP0 = _LP0 + (    0.33181560721534 * _TEMP);

***  Effect: PC_6 ;
_TEMP = PC_6 ;
_LP0 = _LP0 + (   -0.16318363469576 * _TEMP);

***  Effect: PC_7 ;
_TEMP = PC_7 ;
_LP0 = _LP0 + (   -0.10858313490894 * _TEMP);

***  Effect: PC_8 ;
_TEMP = PC_8 ;
_LP0 = _LP0 + (   -0.32504481403824 * _TEMP);

***  Effect: PC_9 ;
_TEMP = PC_9 ;
_LP0 = _LP0 + (    -0.4740117191236 * _TEMP);

***  Effect: Year_Birth ;
_TEMP = Year_Birth ;
_LP0 = _LP0 + (   -0.01248469025693 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     27.3541091117543 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE2_1DR1:


*** Posterior Probabilities and Predicted Level;
label P__bin1 = 'Predicted: _bin=1' ;
label P__bin0 = 'Predicted: _bin=0' ;
P__bin1 = _P0;
_MAXP = _P0;
_IY = 1;
P__bin0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I__bin = RULE2_1DRF[_IY];
U__bin = RULE2_1DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
*;
%DMNORMIP(I__bin);
if I__bin eq '1' then do;
I_DepVar = ("0");
%DMNORMCP(I_DepVar, I_DepVar);
P_DepVar0=P__bin1;
P_DepVar1 = 1-P__bin1;
end;
*;
*;
* END Binary Model for DepVar = 0;
;
*;
DROP P__bin1 P__bin0;
*------------------------------------------------------------*;
*Binary model for DepVar = 1;
*------------------------------------------------------------*;
*;
%DMNORMIP(I__bin);
if I__bin ne '1' then do;
*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I__bin $ 12;
label I__bin = 'Into: _bin' ;
*** Target Values;
array RULE2_2DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE2_2DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

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

*** Check PC_12 for missing values ;
if missing( PC_12 ) then do;
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

*** Check Year_Birth for missing values ;
if missing( Year_Birth ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.8734793187;
   _P1 = 0.1265206813;
   goto RULE2_2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: PC_1 ;
_TEMP = PC_1 ;
_LP0 = _LP0 + (   -0.03612390911596 * _TEMP);

***  Effect: PC_10 ;
_TEMP = PC_10 ;
_LP0 = _LP0 + (    0.06820597280816 * _TEMP);

***  Effect: PC_11 ;
_TEMP = PC_11 ;
_LP0 = _LP0 + (   -0.17043934950998 * _TEMP);

***  Effect: PC_12 ;
_TEMP = PC_12 ;
_LP0 = _LP0 + (   -0.08762035785807 * _TEMP);

***  Effect: PC_13 ;
_TEMP = PC_13 ;
_LP0 = _LP0 + (   -0.00710586984487 * _TEMP);

***  Effect: PC_14 ;
_TEMP = PC_14 ;
_LP0 = _LP0 + (    0.16652236865491 * _TEMP);

***  Effect: PC_15 ;
_TEMP = PC_15 ;
_LP0 = _LP0 + (    0.08979058114247 * _TEMP);

***  Effect: PC_16 ;
_TEMP = PC_16 ;
_LP0 = _LP0 + (      0.220612910808 * _TEMP);

***  Effect: PC_17 ;
_TEMP = PC_17 ;
_LP0 = _LP0 + (     0.3532578688198 * _TEMP);

***  Effect: PC_2 ;
_TEMP = PC_2 ;
_LP0 = _LP0 + (    0.01707898306859 * _TEMP);

***  Effect: PC_3 ;
_TEMP = PC_3 ;
_LP0 = _LP0 + (   -0.04098600315279 * _TEMP);

***  Effect: PC_4 ;
_TEMP = PC_4 ;
_LP0 = _LP0 + (   -0.12424996467647 * _TEMP);

***  Effect: PC_5 ;
_TEMP = PC_5 ;
_LP0 = _LP0 + (    0.14871522071704 * _TEMP);

***  Effect: PC_6 ;
_TEMP = PC_6 ;
_LP0 = _LP0 + (    0.01740995003177 * _TEMP);

***  Effect: PC_7 ;
_TEMP = PC_7 ;
_LP0 = _LP0 + (   -0.11689871002672 * _TEMP);

***  Effect: PC_8 ;
_TEMP = PC_8 ;
_LP0 = _LP0 + (   -0.07038379844183 * _TEMP);

***  Effect: PC_9 ;
_TEMP = PC_9 ;
_LP0 = _LP0 + (   -0.15243029909114 * _TEMP);

***  Effect: Year_Birth ;
_TEMP = Year_Birth ;
_LP0 = _LP0 + (    0.01263443774752 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     -22.431397048942 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE2_2DR1:


*** Posterior Probabilities and Predicted Level;
label P__bin1 = 'Predicted: _bin=1' ;
label P__bin0 = 'Predicted: _bin=0' ;
P__bin1 = _P0;
_MAXP = _P0;
_IY = 1;
P__bin0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I__bin = RULE2_2DRF[_IY];
U__bin = RULE2_2DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
*;
%DMNORMIP(I__bin);
if I__bin eq '1' then do;
I_DepVar = ("1");
%DMNORMCP(I_DepVar, I_DepVar);
P_DepVar1=P__bin1;
P_DepVar0 = 1-P__bin1;
end;
*;
*;
end;
*;
DROP P__bin1 P__bin0;
*------------------------------------------------------------*;
* Cleanup Model for DepVar;
* Null Model based on training frequencies;
*------------------------------------------------------------*;
%DMNORMIP(I__bin);
if I__bin ne '1' then do;
I_DepVar = ("1");
%DMNORMCP(I_DepVar, I_DepVar);
P_DepVar1 = 0.15122156697556;
P_DepVar0 = 0.84877843302443;
*;
end;
*;
*;
drop U__bin _bin;
*;
_FORMAT = PUT(DepVar, BEST.);
%DMNORMCP(_FORMAT, F_DepVar);
*------------------------------------------------------------*;
*Computing Residual Vars: DepVar;
*------------------------------------------------------------*;
Label R_DepVar1='Residual: DepVar=1';
Label R_DepVar0='Residual: DepVar=0';
if
 F_DepVar ne '1'
and F_DepVar ne '0'
 then do;
R_DepVar1=.;
R_DepVar0=.;
end;
else do;
R_DepVar1= - P_DepVar1;
R_DepVar0= - P_DepVar0;
select(F_DepVar);
when('1')R_DepVar1= R_DepVar1+1;
when('0')R_DepVar0= R_DepVar0+1;
otherwise;
end;
end;
