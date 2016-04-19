*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG10DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG10DRU[2]  _TEMPORARY_ (1 0);

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
   goto REG10DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.71107732112007) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.81763295180983) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.8618538514738) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.64997710050937) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.91699409369659) * _TEMP * _5_0;

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (    0.00003628120307 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (    0.09345382071006) * _TEMP * _8_0;
_LP0 = _LP0 + (   -0.47894059934485) * _TEMP * _8_1;
_LP0 = _LP0 + (    0.46164092141221) * _TEMP * _8_2;
_LP0 = _LP0 + (    -0.5078574429985) * _TEMP * _8_3;

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (   -0.00285470778488 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (   -0.00481548089585 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (    0.00485302069895 * _TEMP);

***  Effect: MntWines ;
_TEMP = MntWines ;
_LP0 = _LP0 + (   -0.00184060065513 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (    0.40015202354101 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (    0.39526484909287 * _TEMP);

***  Effect: NumStorePurchases ;
_TEMP = NumStorePurchases ;
_LP0 = _LP0 + (   -0.21400418800044 * _TEMP);

***  Effect: NumWebPurchases ;
_TEMP = NumWebPurchases ;
_LP0 = _LP0 + (    -0.2223953481686 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (    0.54388363089232 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (   -0.05513564922633 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (   -0.70674092258187 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -0.62163391257391) + _LP0);
_P1 = 1.0 - _P0;

REG10DR1:

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
I_DepVar = REG10DRF[_IY];
U_DepVar = REG10DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
