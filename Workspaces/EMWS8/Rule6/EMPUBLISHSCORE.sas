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
array RULE6_1DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE6_1DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

drop _DM_BAD;
_DM_BAD=0;

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

*** Check MntMeatProducts for missing values ;
if missing( MntMeatProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntSweetProducts for missing values ;
if missing( MntSweetProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntWines for missing values ;
if missing( MntWines ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumCatalogPurchases for missing values ;
if missing( NumCatalogPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumDealsPurchases for missing values ;
if missing( NumDealsPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumStorePurchases for missing values ;
if missing( NumStorePurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebPurchases for missing values ;
if missing( NumWebPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebVisitsMonth for missing values ;
if missing( NumWebVisitsMonth ) then do;
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
drop _8_0 _8_1 _8_2 _8_3 ;
*** encoding is sparse, initialize to zero;
_8_0 = 0;
_8_1 = 0;
_8_2 = 0;
_8_3 = 0;
if missing( Marital_Status ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   _8_3 = .;
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
            _8_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               _8_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            _8_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         _8_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            _8_0 = -1;
            _8_1 = -1;
            _8_2 = -1;
            _8_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      _8_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.848778433;
   _P1 = 0.151221567;
   goto RULE6_1DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.30271168583926) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.44422337587782) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.55151381493371) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.13778239661671) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (     1.6991813722155) * _TEMP * _5_0;

***  Effect: Complain ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.58014815223929) * _TEMP * _6_0;

***  Effect: Education ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.04994533687265) * _TEMP * _7_0;
_LP0 = _LP0 + (    0.45023070876115) * _TEMP * _7_1;
_LP0 = _LP0 + (   -0.31513684427512) * _TEMP * _7_2;
_LP0 = _LP0 + (    0.01204338575327) * _TEMP * _7_3;

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (   -0.00006945953057 * _TEMP);

***  Effect: Kidhome ;
_TEMP = Kidhome ;
_LP0 = _LP0 + (    0.39791001409736 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.23405229738843) * _TEMP * _8_0;
_LP0 = _LP0 + (    0.90656763920639) * _TEMP * _8_1;
_LP0 = _LP0 + (   -0.88813618423783) * _TEMP * _8_2;
_LP0 = _LP0 + (    0.97701536667587) * _TEMP * _8_3;

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    0.00543098669935 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (    0.00797246105418 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (   -0.00254628299218 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (   -0.00886243713943 * _TEMP);

***  Effect: MntSweetProducts ;
_TEMP = MntSweetProducts ;
_LP0 = _LP0 + (    0.00477257502519 * _TEMP);

***  Effect: MntWines ;
_TEMP = MntWines ;
_LP0 = _LP0 + (      0.003294419551 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (   -0.69912495673356 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (   -0.76670862172692 * _TEMP);

***  Effect: NumStorePurchases ;
_TEMP = NumStorePurchases ;
_LP0 = _LP0 + (    0.39475254330454 * _TEMP);

***  Effect: NumWebPurchases ;
_TEMP = NumWebPurchases ;
_LP0 = _LP0 + (    0.42616867076457 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (   -1.02108180182914 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (    0.10392363357654 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (    1.52393250618649 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     1.85986004688347 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE6_1DR1:


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
I__bin = RULE6_1DRF[_IY];
U__bin = RULE6_1DRU[_IY];

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
array RULE6_2DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE6_2DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

drop _DM_BAD;
_DM_BAD=0;

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

*** Check MntMeatProducts for missing values ;
if missing( MntMeatProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntSweetProducts for missing values ;
if missing( MntSweetProducts ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MntWines for missing values ;
if missing( MntWines ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumCatalogPurchases for missing values ;
if missing( NumCatalogPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumDealsPurchases for missing values ;
if missing( NumDealsPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumStorePurchases for missing values ;
if missing( NumStorePurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebPurchases for missing values ;
if missing( NumWebPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebVisitsMonth for missing values ;
if missing( NumWebVisitsMonth ) then do;
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
drop _8_0 _8_1 _8_2 _8_3 ;
*** encoding is sparse, initialize to zero;
_8_0 = 0;
_8_1 = 0;
_8_2 = 0;
_8_3 = 0;
if missing( Marital_Status ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   _8_3 = .;
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
            _8_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               _8_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            _8_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         _8_3 = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            _8_0 = -1;
            _8_1 = -1;
            _8_2 = -1;
            _8_3 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      _8_3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.8713592233;
   _P1 = 0.1286407767;
   goto RULE6_2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.13773153310839) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.69854896768436) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.10887756730094) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (    0.12360934803533) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.16721801014195) * _TEMP * _5_0;

***  Effect: Complain ;
_TEMP = 1;
_LP0 = _LP0 + (   -4.63526530350848) * _TEMP * _6_0;

***  Effect: Education ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.76470922254198) * _TEMP * _7_0;
_LP0 = _LP0 + (    8.23676050917962) * _TEMP * _7_1;
_LP0 = _LP0 + (   -2.41422571646518) * _TEMP * _7_2;
_LP0 = _LP0 + (   -1.91933682899996) * _TEMP * _7_3;

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (  7.7309974931774E-6 * _TEMP);

***  Effect: Kidhome ;
_TEMP = Kidhome ;
_LP0 = _LP0 + (    0.05417383432468 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.51372044694245) * _TEMP * _8_0;
_LP0 = _LP0 + (    0.21828839315376) * _TEMP * _8_1;
_LP0 = _LP0 + (   -0.40518979689526) * _TEMP * _8_2;
_LP0 = _LP0 + (    0.03845646294641) * _TEMP * _8_3;

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    0.01281750144242 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (   -0.00197925930141 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (   -0.00223803412293 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (    0.00045369131167 * _TEMP);

***  Effect: MntSweetProducts ;
_TEMP = MntSweetProducts ;
_LP0 = _LP0 + (    0.00094858891566 * _TEMP);

***  Effect: MntWines ;
_TEMP = MntWines ;
_LP0 = _LP0 + (    0.00010985529741 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (    0.11478613286229 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (    0.03800790233327 * _TEMP);

***  Effect: NumStorePurchases ;
_TEMP = NumStorePurchases ;
_LP0 = _LP0 + (    0.01186083057989 * _TEMP);

***  Effect: NumWebPurchases ;
_TEMP = NumWebPurchases ;
_LP0 = _LP0 + (   -0.07704813334381 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (    0.16843661820589 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (   -0.01923499522774 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (    -0.3809220479832 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     8.31965834720203 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE6_2DR1:


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
I__bin = RULE6_2DRF[_IY];
U__bin = RULE6_2DRU[_IY];

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
