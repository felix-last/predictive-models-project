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
array RULE4_1DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE4_1DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

drop _DM_BAD;
_DM_BAD=0;

*** Check Age for missing values ;
if missing( Age ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Frq for missing values ;
if missing( Frq ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Income for missing values ;
if missing( Income ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Kidhome for missing values ;
if missing( Kidhome ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntFishProducts for missing values ;
if missing( MntFishProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntFruits for missing values ;
if missing( MntFruits ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntGoldProds for missing values ;
if missing( MntGoldProds ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntSweetProducts for missing values ;
if missing( MntSweetProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MonthsAsCustomer for missing values ;
if missing( MonthsAsCustomer ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumDealsPurchases for missing values ;
if missing( NumDealsPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebVisitsMonth for missing values ;
if missing( NumWebVisitsMonth ) then do;
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

*** Check Recency for missing values ;
if missing( Recency ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Teenhome for missing values ;
if missing( Teenhome ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for AcceptedCmp1 ;
drop _1_0 ;
if missing( AcceptedCmp1 ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp1 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp2 ;
drop _2_0 ;
if missing( AcceptedCmp2 ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp2 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp3 ;
drop _3_0 ;
if missing( AcceptedCmp3 ) then do;
   _3_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp3 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _3_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _3_0 = -1;
   end;
   else do;
      _3_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp4 ;
drop _4_0 ;
if missing( AcceptedCmp4 ) then do;
   _4_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp4 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _4_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _4_0 = -1;
   end;
   else do;
      _4_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp5 ;
drop _5_0 ;
if missing( AcceptedCmp5 ) then do;
   _5_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp5 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _5_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _5_0 = -1;
   end;
   else do;
      _5_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Complain ;
drop _6_0 ;
if missing( Complain ) then do;
   _6_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Complain , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _6_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _6_0 = -1;
   end;
   else do;
      _6_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Education ;
drop _7_0 _7_1 _7_2 _7_3 ;
*** encoding is sparse, initialize to zero;
_7_0 = 0;
_7_1 = 0;
_7_2 = 0;
_7_3 = 0;
if missing( Education ) then do;
   _7_0 = .;
   _7_1 = .;
   _7_2 = .;
   _7_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Education , $10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'GRADUATION'  then do;
      _7_2 = 1;
   end;
   else if _dm10 = 'PHD'  then do;
      _7_0 = -1;
      _7_1 = -1;
      _7_2 = -1;
      _7_3 = -1;
   end;
   else if _dm10 = 'MASTER'  then do;
      _7_3 = 1;
   end;
   else if _dm10 = '2N CYCLE'  then do;
      _7_0 = 1;
   end;
   else if _dm10 = 'BASIC'  then do;
      _7_1 = 1;
   end;
   else do;
      _7_0 = .;
      _7_1 = .;
      _7_2 = .;
      _7_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Marital_Status ;
drop _9_0 _9_1 _9_2 _9_3 ;
*** encoding is sparse, initialize to zero;
_9_0 = 0;
_9_1 = 0;
_9_2 = 0;
_9_3 = 0;
if missing( Marital_Status ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   _9_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( Marital_Status , $8. );
   %DMNORMIP( _dm8 )
   _dm_find = 0; drop _dm_find;
   if _dm8 <= 'SINGLE'  then do;
      if _dm8 <= 'MARRIED'  then do;
         if _dm8 = 'DIVORCED'  then do;
            _9_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               _9_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            _9_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         _9_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            _9_0 = -1;
            _9_1 = -1;
            _9_2 = -1;
            _9_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      _9_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.848778433;
   _P1 = 0.151221567;
   goto RULE4_1DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.97418552471108) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.68156741676811) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.32848439989106) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.53311779107273) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.95118474053675) * _TEMP * _5_0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (    0.01979462562675 * _TEMP);

***  Effect: Complain ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.54041637411203) * _TEMP * _6_0;

***  Effect: Education ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.09757703065208) * _TEMP * _7_0;
_LP0 = _LP0 + (    0.10550056008301) * _TEMP * _7_1;
_LP0 = _LP0 + (   -0.31683916083951) * _TEMP * _7_2;
_LP0 = _LP0 + (    0.23324682796678) * _TEMP * _7_3;

***  Effect: Frq ;
_TEMP = Frq ;
_LP0 = _LP0 + (    0.06627503591699 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (   -0.00004901079751 * _TEMP);

***  Effect: Kidhome ;
_TEMP = Kidhome ;
_LP0 = _LP0 + (    0.19312294408187 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.24578027352194) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.70193582579037) * _TEMP * _9_1;
_LP0 = _LP0 + (    -0.4511231588711) * _TEMP * _9_2;
_LP0 = _LP0 + (    0.77973690767148) * _TEMP * _9_3;

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    0.00049956522901 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (    0.00396176260942 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (   -0.00056979316437 * _TEMP);

***  Effect: MntSweetProducts ;
_TEMP = MntSweetProducts ;
_LP0 = _LP0 + (    0.00409766321973 * _TEMP);

***  Effect: MonthsAsCustomer ;
_TEMP = MonthsAsCustomer ;
_LP0 = _LP0 + (    -0.0065808574528 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (   -0.41504533192296 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (   -0.27734369181934 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (   -0.00011005920443 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (   -0.01158011947691 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (    0.06167776080023 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (    1.44620738686244 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -0.03523097804062 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE4_1DR1:


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
I__bin = RULE4_1DRF[_IY];
U__bin = RULE4_1DRU[_IY];

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
array RULE4_2DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE4_2DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

drop _DM_BAD;
_DM_BAD=0;

*** Check Age for missing values ;
if missing( Age ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Frq for missing values ;
if missing( Frq ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Income for missing values ;
if missing( Income ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Kidhome for missing values ;
if missing( Kidhome ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntFishProducts for missing values ;
if missing( MntFishProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntFruits for missing values ;
if missing( MntFruits ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntGoldProds for missing values ;
if missing( MntGoldProds ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntSweetProducts for missing values ;
if missing( MntSweetProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MonthsAsCustomer for missing values ;
if missing( MonthsAsCustomer ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumDealsPurchases for missing values ;
if missing( NumDealsPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebVisitsMonth for missing values ;
if missing( NumWebVisitsMonth ) then do;
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

*** Check Recency for missing values ;
if missing( Recency ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Teenhome for missing values ;
if missing( Teenhome ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for AcceptedCmp1 ;
drop _1_0 ;
if missing( AcceptedCmp1 ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp1 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp2 ;
drop _2_0 ;
if missing( AcceptedCmp2 ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp2 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp3 ;
drop _3_0 ;
if missing( AcceptedCmp3 ) then do;
   _3_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp3 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _3_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _3_0 = -1;
   end;
   else do;
      _3_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp4 ;
drop _4_0 ;
if missing( AcceptedCmp4 ) then do;
   _4_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp4 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _4_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _4_0 = -1;
   end;
   else do;
      _4_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp5 ;
drop _5_0 ;
if missing( AcceptedCmp5 ) then do;
   _5_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp5 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _5_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _5_0 = -1;
   end;
   else do;
      _5_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Complain ;
drop _6_0 ;
if missing( Complain ) then do;
   _6_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Complain , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      _6_0 = 1;
   end;
   else if _dm12 = '1'  then do;
      _6_0 = -1;
   end;
   else do;
      _6_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Education ;
drop _7_0 _7_1 _7_2 _7_3 ;
*** encoding is sparse, initialize to zero;
_7_0 = 0;
_7_1 = 0;
_7_2 = 0;
_7_3 = 0;
if missing( Education ) then do;
   _7_0 = .;
   _7_1 = .;
   _7_2 = .;
   _7_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Education , $10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'GRADUATION'  then do;
      _7_2 = 1;
   end;
   else if _dm10 = 'PHD'  then do;
      _7_0 = -1;
      _7_1 = -1;
      _7_2 = -1;
      _7_3 = -1;
   end;
   else if _dm10 = 'MASTER'  then do;
      _7_3 = 1;
   end;
   else if _dm10 = '2N CYCLE'  then do;
      _7_0 = 1;
   end;
   else if _dm10 = 'BASIC'  then do;
      _7_1 = 1;
   end;
   else do;
      _7_0 = .;
      _7_1 = .;
      _7_2 = .;
      _7_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Marital_Status ;
drop _9_0 _9_1 _9_2 _9_3 ;
*** encoding is sparse, initialize to zero;
_9_0 = 0;
_9_1 = 0;
_9_2 = 0;
_9_3 = 0;
if missing( Marital_Status ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   _9_3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( Marital_Status , $8. );
   %DMNORMIP( _dm8 )
   _dm_find = 0; drop _dm_find;
   if _dm8 <= 'SINGLE'  then do;
      if _dm8 <= 'MARRIED'  then do;
         if _dm8 = 'DIVORCED'  then do;
            _9_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               _9_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            _9_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         _9_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            _9_0 = -1;
            _9_1 = -1;
            _9_2 = -1;
            _9_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      _9_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.860911271;
   _P1 = 0.139088729;
   goto RULE4_2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.16890678844078) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.03354787759567) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.05226834720161) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.05614277968589) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.28035826890341) * _TEMP * _5_0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (   -0.00331888161595 * _TEMP);

***  Effect: Complain ;
_TEMP = 1;
_LP0 = _LP0 + (    0.41932661341097) * _TEMP * _6_0;

***  Effect: Education ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.94148642567409) * _TEMP * _7_0;
_LP0 = _LP0 + (    7.04331964927999) * _TEMP * _7_1;
_LP0 = _LP0 + (   -1.84653459246083) * _TEMP * _7_2;
_LP0 = _LP0 + (   -1.72829661845225) * _TEMP * _7_3;

***  Effect: Frq ;
_TEMP = Frq ;
_LP0 = _LP0 + (    0.00727087817719 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (   -0.00003549313241 * _TEMP);

***  Effect: Kidhome ;
_TEMP = Kidhome ;
_LP0 = _LP0 + (   -0.71347762563628 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (    0.62230545564027) * _TEMP * _9_0;
_LP0 = _LP0 + (     0.0812166675529) * _TEMP * _9_1;
_LP0 = _LP0 + (   -0.22016205695017) * _TEMP * _9_2;
_LP0 = _LP0 + (   -0.27129885515911) * _TEMP * _9_3;

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    0.00043874339286 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (   -0.00080533081632 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (   -0.00010944243681 * _TEMP);

***  Effect: MntSweetProducts ;
_TEMP = MntSweetProducts ;
_LP0 = _LP0 + (   -0.00082832116638 * _TEMP);

***  Effect: MonthsAsCustomer ;
_TEMP = MonthsAsCustomer ;
_LP0 = _LP0 + (    0.01256221882265 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (   -0.11670159812232 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (   -0.23476706905643 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (  4.6096891616041E-6 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (    0.00306634890495 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (    0.00940933569599 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (    0.44425327545555 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     5.81096403466168 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE4_2DR1:


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
I__bin = RULE4_2DRF[_IY];
U__bin = RULE4_2DRU[_IY];

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
