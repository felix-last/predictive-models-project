*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG9DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG9DRU[2]  _TEMPORARY_ (1 0);

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

*** Check Income for missing values ;
if missing( Income ) then do;
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

*** Check MntMeatProducts for missing values ;
if missing( MntMeatProducts ) then do;
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
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG9DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.28114872833376) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (    -1.4871451186069) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.58721567367346) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (    -1.1573037622615) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.68835129992038) * _TEMP * _5_0;

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (    0.00006770818936 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (    0.18351716765826) * _TEMP * _8_0;
_LP0 = _LP0 + (   -0.88993819943493) * _TEMP * _8_1;
_LP0 = _LP0 + (    0.89971120865107) * _TEMP * _8_2;
_LP0 = _LP0 + (   -0.96825171718714) * _TEMP * _8_3;

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    -0.0053789406447 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (   -0.00810096702081 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (    0.00876618054091 * _TEMP);

***  Effect: MntWines ;
_TEMP = MntWines ;
_LP0 = _LP0 + (   -0.00323708533956 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (    0.72583602627024 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (    0.71587738133808 * _TEMP);

***  Effect: NumStorePurchases ;
_TEMP = NumStorePurchases ;
_LP0 = _LP0 + (   -0.38414846639641 * _TEMP);

***  Effect: NumWebPurchases ;
_TEMP = NumWebPurchases ;
_LP0 = _LP0 + (   -0.39960732899531 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (    1.00690630599849 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (   -0.10368937560371 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (   -1.33387551959166 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -1.29156803352583 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG9DR1:

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
I_DepVar = REG9DRF[_IY];
U_DepVar = REG9DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
