*------------------------------------------------------------*;
* Rule Induction Scoring Code;
*------------------------------------------------------------*;
length _bin $12 I__bin $12 I_DepVar $32;
label I_DepVar = 'Into: DepVar';
*;
I_DepVar = '';
I__bin= '0';
*;
*------------------------------------------------------------*;
* No Ripping Models were created;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Binary model for DepVar = 0;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I__bin $ 12;
label I__bin = 'Into: _bin' ;
*** Target Values;
array RULE5_1DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE5_1DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

drop _DM_BAD;
_DM_BAD=0;

*** Check AcceptedCmpTotal for missing values ;
if missing( AcceptedCmpTotal ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Income for missing values ;
if missing( Income ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Mnt for missing values ;
if missing( Mnt ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumDistPurchases for missing values ;
if missing( NumDistPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check RFMstat for missing values ;
if missing( RFMstat ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check RMntFrq for missing values ;
if missing( RMntFrq ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.848778433;
   _P1 = 0.151221567;
   goto RULE5_1DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmpTotal ;
_TEMP = AcceptedCmpTotal ;
_LP0 = _LP0 + (   -1.39892542777179 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (    0.00002486456481 * _TEMP);

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (    0.00222462909018 * _TEMP);

***  Effect: NumDistPurchases ;
_TEMP = NumDistPurchases ;
_LP0 = _LP0 + (   -0.17203152013744 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (   -0.00061047201485 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (   -0.03762017413848 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     2.79794572900008 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE5_1DR1:


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
I__bin = RULE5_1DRF[_IY];
U__bin = RULE5_1DRU[_IY];

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
* Binary model for DepVar = 1;
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
array RULE5_2DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE5_2DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

drop _DM_BAD;
_DM_BAD=0;

*** Check AcceptedCmpTotal for missing values ;
if missing( AcceptedCmpTotal ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Income for missing values ;
if missing( Income ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Mnt for missing values ;
if missing( Mnt ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumDistPurchases for missing values ;
if missing( NumDistPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check RFMstat for missing values ;
if missing( RFMstat ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check RMntFrq for missing values ;
if missing( RMntFrq ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.8820638821;
   _P1 = 0.1179361179;
   goto RULE5_2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmpTotal ;
_TEMP = AcceptedCmpTotal ;
_LP0 = _LP0 + (   -0.38948339516329 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + ( -1.4713983209058E-6 * _TEMP);

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (    0.00077235683449 * _TEMP);

***  Effect: NumDistPurchases ;
_TEMP = NumDistPurchases ;
_LP0 = _LP0 + (   -0.06725999965564 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (   -0.00005588087816 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (    -0.0174463929883 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     3.63208415998884 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE5_2DR1:


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
I__bin = RULE5_2DRF[_IY];
U__bin = RULE5_2DRU[_IY];

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
* Cleanup Model for DepVar * Null Model based on training frequencies;
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
drop I__bin U__bin;
