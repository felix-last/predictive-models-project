*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG7DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG7DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check Year_Birth for missing values ;
if missing( Year_Birth ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop _1_0 ;
if missing( GRP_AcceptedCmp5 ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '3'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop _2_0 _2_1 _2_2 ;
if missing( GRP_Frq ) then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _2_0 = -1;
      _2_1 = -1;
      _2_2 = -1;
   end;
   else if _dm12 = '3'  then do;
      _2_0 = 0;
      _2_1 = 1;
      _2_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = 0;
      _2_1 = 0;
      _2_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _2_0 = 1;
      _2_1 = 0;
      _2_2 = 0;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      _2_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop _3_0 _3_1 _3_2 ;
if missing( GRP_Income ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _3_0 = -1;
      _3_1 = -1;
      _3_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _3_0 = 0;
      _3_1 = 0;
      _3_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = 0;
      _3_1 = 1;
      _3_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _3_0 = 1;
      _3_1 = 0;
      _3_2 = 0;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop _5_0 _5_1 _5_2 ;
if missing( GRP_MntFishProducts ) then do;
   _5_0 = .;
   _5_1 = .;
   _5_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _5_0 = 0;
      _5_1 = 1;
      _5_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _5_0 = -1;
      _5_1 = -1;
      _5_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _5_0 = 0;
      _5_1 = 0;
      _5_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _5_0 = 1;
      _5_1 = 0;
      _5_2 = 0;
   end;
   else do;
      _5_0 = .;
      _5_1 = .;
      _5_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop _7_0 _7_1 _7_2 ;
if missing( GRP_MntMeatProducts ) then do;
   _7_0 = .;
   _7_1 = .;
   _7_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _7_0 = 0;
      _7_1 = 1;
      _7_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _7_0 = 0;
      _7_1 = 0;
      _7_2 = 1;
   end;
   else if _dm12 = '5'  then do;
      _7_0 = -1;
      _7_1 = -1;
      _7_2 = -1;
   end;
   else if _dm12 = '2'  then do;
      _7_0 = 1;
      _7_1 = 0;
      _7_2 = 0;
   end;
   else do;
      _7_0 = .;
      _7_1 = .;
      _7_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop _8_0 _8_1 _8_2 ;
if missing( GRP_MntWines ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _8_0 = 0;
      _8_1 = 1;
      _8_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _8_0 = -1;
      _8_1 = -1;
      _8_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _8_0 = 0;
      _8_1 = 0;
      _8_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _8_0 = 1;
      _8_1 = 0;
      _8_2 = 0;
   end;
   else do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop _9_0 _9_1 ;
if missing( GRP_NumCatalogPurchases ) then do;
   _9_0 = .;
   _9_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _9_0 = 1;
      _9_1 = 0;
   end;
   else if _dm12 = '5'  then do;
      _9_0 = -1;
      _9_1 = -1;
   end;
   else if _dm12 = '4'  then do;
      _9_0 = 0;
      _9_1 = 1;
   end;
   else do;
      _9_0 = .;
      _9_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop _10_0 _10_1 _10_2 ;
if missing( GRP_NumDistPurchases ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _10_0 = -1;
      _10_1 = -1;
      _10_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _10_0 = 0;
      _10_1 = 0;
      _10_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _10_0 = 1;
      _10_1 = 0;
      _10_2 = 0;
   end;
   else if _dm12 = '3'  then do;
      _10_0 = 0;
      _10_1 = 1;
      _10_2 = 0;
   end;
   else do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop _13_0 _13_1 _13_2 ;
if missing( GRP_RMntFrq ) then do;
   _13_0 = .;
   _13_1 = .;
   _13_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _13_0 = 0;
      _13_1 = 1;
      _13_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _13_0 = -1;
      _13_1 = -1;
      _13_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _13_0 = 0;
      _13_1 = 0;
      _13_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _13_0 = 1;
      _13_1 = 0;
      _13_2 = 0;
   end;
   else do;
      _13_0 = .;
      _13_1 = .;
      _13_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop _14_0 _14_1 _14_2 ;
if missing( GRP_Recency ) then do;
   _14_0 = .;
   _14_1 = .;
   _14_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _14_0 = -1;
      _14_1 = -1;
      _14_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _14_0 = 0;
      _14_1 = 0;
      _14_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _14_0 = 0;
      _14_1 = 1;
      _14_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _14_0 = 1;
      _14_1 = 0;
      _14_2 = 0;
   end;
   else do;
      _14_0 = .;
      _14_1 = .;
      _14_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG7DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.5862337869734) * _TEMP * _1_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (     1.0565693238421) * _TEMP * _2_0;
_LP0 = _LP0 + (     0.0911336121088) * _TEMP * _2_1;
_LP0 = _LP0 + (   -0.37448220273968) * _TEMP * _2_2;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (    0.51658584340625) * _TEMP * _3_0;
_LP0 = _LP0 + (    0.48505772489262) * _TEMP * _3_1;
_LP0 = _LP0 + (   -0.50854630566525) * _TEMP * _3_2;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.38994498659965) * _TEMP * _5_0;
_LP0 = _LP0 + (    0.03146325606998) * _TEMP * _5_1;
_LP0 = _LP0 + (   -0.05372169204837) * _TEMP * _5_2;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.79733877870259) * _TEMP * _7_0;
_LP0 = _LP0 + (   -0.15003183676105) * _TEMP * _7_1;
_LP0 = _LP0 + (    0.31191597751128) * _TEMP * _7_2;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    0.53434964580952) * _TEMP * _8_0;
_LP0 = _LP0 + (    0.22167667253067) * _TEMP * _8_1;
_LP0 = _LP0 + (     -0.305489910536) * _TEMP * _8_2;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (     -0.629899271763) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.03240844395355) * _TEMP * _9_1;

***  Effect: GRP_NumDistPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.42622019893988) * _TEMP * _10_0;
_LP0 = _LP0 + (    0.05466498093201) * _TEMP * _10_1;
_LP0 = _LP0 + (    0.25182489000571) * _TEMP * _10_2;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.14979245852204) * _TEMP * _13_0;
_LP0 = _LP0 + (     0.0056028143187) * _TEMP * _13_1;
_LP0 = _LP0 + (   -0.23315930182624) * _TEMP * _13_2;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    1.06974976023651) * _TEMP * _14_0;
_LP0 = _LP0 + (    0.29139327664531) * _TEMP * _14_1;
_LP0 = _LP0 + (   -0.34742570667526) * _TEMP * _14_2;

***  Effect: Year_Birth ;
_TEMP = Year_Birth ;
_LP0 = _LP0 + (    0.01045707390649 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -21.5603180840073) + _LP0);
_P1 = 1.0 - _P0;

REG7DR1:


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
I_DepVar = REG7DRF[_IY];
U_DepVar = REG7DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
