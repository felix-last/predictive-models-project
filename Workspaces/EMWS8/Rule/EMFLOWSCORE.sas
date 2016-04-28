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
array RULE_1DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE_1DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

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

*** Check Mnt for missing values ;
if missing( Mnt ) then do;
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

*** Check MonthsAsCustomer for missing values ;
if missing( MonthsAsCustomer ) then do;
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

*** Check NumDistPurchases for missing values ;
if missing( NumDistPurchases ) then do;
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
   goto RULE_1DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.37959490891636) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.38881644367343) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.49836425611786) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.18986757703774) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    1.88753592135037) * _TEMP * _5_0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (    0.02031375470687 * _TEMP);

***  Effect: Complain ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.40204765702117) * _TEMP * _6_0;

***  Effect: Education ;
_TEMP = 1;
_LP0 = _LP0 + (    0.02225506337329) * _TEMP * _7_0;
_LP0 = _LP0 + (    0.61176531164578) * _TEMP * _7_1;
_LP0 = _LP0 + (   -0.36644839378194) * _TEMP * _7_2;
_LP0 = _LP0 + (   -0.12231177702126) * _TEMP * _7_3;

***  Effect: Frq ;
_TEMP = Frq ;
_LP0 = _LP0 + (     0.3666224217102 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (   -0.00005713252434 * _TEMP);

***  Effect: Kidhome ;
_TEMP = Kidhome ;
_LP0 = _LP0 + (    0.41057471857215 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.27437867955027) * _TEMP * _9_0;
_LP0 = _LP0 + (    1.02225430661359) * _TEMP * _9_1;
_LP0 = _LP0 + (   -0.75468142744006) * _TEMP * _9_2;
_LP0 = _LP0 + (    1.04712905781542) * _TEMP * _9_3;

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (    0.00461659402024 * _TEMP);

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    0.00251764049354 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (    0.00413411554031 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (   -0.00602352418747 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (   -0.01296976269642 * _TEMP);

***  Effect: MntSweetProducts ;
_TEMP = MntSweetProducts ;
_LP0 = _LP0 + (    0.00105376667989 * _TEMP);

***  Effect: MonthsAsCustomer ;
_TEMP = MonthsAsCustomer ;
_LP0 = _LP0 + (    0.00973147761427 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (   -1.19498863276998 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (   -0.75556665247436 * _TEMP);

***  Effect: NumDistPurchases ;
_TEMP = NumDistPurchases ;
_LP0 = _LP0 + (    0.04468116637826 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (   -1.08435727343224 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (   -0.00028375117498 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (   -0.01569409100668 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (    0.09810556470719 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (    1.19606402340833 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =      0.3380565978551 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE_1DR1:


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
I__bin = RULE_1DRF[_IY];
U__bin = RULE_1DRU[_IY];

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
array RULE_2DRF [2] $12 _temporary_ ('1' '0' );
label U__bin = 'Unnormalized Into: _bin' ;
length U__bin $ 12;
*** Unnormalized target values;
array RULE_2DRU[2] $ 12 _temporary_ ('1           '  '0           ' );

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

*** Check Mnt for missing values ;
if missing( Mnt ) then do;
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

*** Check MonthsAsCustomer for missing values ;
if missing( MonthsAsCustomer ) then do;
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

*** Check NumDistPurchases for missing values ;
if missing( NumDistPurchases ) then do;
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
   _P0 = 0.8756097561;
   _P1 = 0.1243902439;
   goto RULE_2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmp1 ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.1560157255964) * _TEMP * _1_0;

***  Effect: AcceptedCmp2 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.45585868445985) * _TEMP * _2_0;

***  Effect: AcceptedCmp3 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.09256541025262) * _TEMP * _3_0;

***  Effect: AcceptedCmp4 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.02746921818988) * _TEMP * _4_0;

***  Effect: AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.31324699318634) * _TEMP * _5_0;

***  Effect: Age ;
_TEMP = Age ;
_LP0 = _LP0 + (   -0.01233910301688 * _TEMP);

***  Effect: Complain ;
_TEMP = 1;
_LP0 = _LP0 + (   -4.78491003199989) * _TEMP * _6_0;

***  Effect: Education ;
_TEMP = 1;
_LP0 = _LP0 + (   -2.09470486754483) * _TEMP * _7_0;
_LP0 = _LP0 + (    8.12871813379221) * _TEMP * _7_1;
_LP0 = _LP0 + (   -2.30296879488845) * _TEMP * _7_2;
_LP0 = _LP0 + (   -1.63396724403952) * _TEMP * _7_3;

***  Effect: Frq ;
_TEMP = Frq ;
_LP0 = _LP0 + (    0.06442984333557 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (   -0.00001376677759 * _TEMP);

***  Effect: Kidhome ;
_TEMP = Kidhome ;
_LP0 = _LP0 + (    0.08875349087295 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.45011480517718) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.15483279258714) * _TEMP * _9_1;
_LP0 = _LP0 + (    -0.2468727722526) * _TEMP * _9_2;
_LP0 = _LP0 + (   -0.28864137282061) * _TEMP * _9_3;

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (    -0.0013080231894 * _TEMP);

***  Effect: MntFishProducts ;
_TEMP = MntFishProducts ;
_LP0 = _LP0 + (    0.00563408454282 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (   -0.00309262350043 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (   -0.00216177411858 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (     0.0014025197451 * _TEMP);

***  Effect: MntSweetProducts ;
_TEMP = MntSweetProducts ;
_LP0 = _LP0 + (    -0.0007597608107 * _TEMP);

***  Effect: MonthsAsCustomer ;
_TEMP = MonthsAsCustomer ;
_LP0 = _LP0 + (    0.00377704914646 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (    0.15620596239343 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (   -0.00896675317907 * _TEMP);

***  Effect: NumDistPurchases ;
_TEMP = NumDistPurchases ;
_LP0 = _LP0 + (   -0.03831045196563 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (    0.09632223979394 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (    0.00013291850521 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (    0.01868482592683 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (   -0.01553167210852 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (   -0.04288376179124 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =     9.22221204098894 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

RULE_2DR1:


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
I__bin = RULE_2DRF[_IY];
U__bin = RULE_2DRU[_IY];

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
