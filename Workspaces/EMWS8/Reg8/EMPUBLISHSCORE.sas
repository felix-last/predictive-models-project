*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG8DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG8DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check AcceptedCmpTotal for missing values ;
if missing( AcceptedCmpTotal ) then do;
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

*** Check Mnt for missing values ;
if missing( Mnt ) then do;
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

*** Check NumCatalogPurchases for missing values ;
if missing( NumCatalogPurchases ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check NumWebPurchases for missing values ;
if missing( NumWebPurchases ) then do;
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

*** Generate dummy variables for G_Marital_Status ;
drop _1_0 _1_1 ;
if missing( G_Marital_Status ) then do;
   _1_0 = .;
   _1_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = -1;
      _1_1 = -1;
   end;
   else if _dm12 = '0'  then do;
      _1_0 = 1;
      _1_1 = 0;
   end;
   else if _dm12 = '1'  then do;
      _1_0 = 0;
      _1_1 = 1;
   end;
   else do;
      _1_0 = .;
      _1_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG8DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmpTotal ;
_TEMP = AcceptedCmpTotal ;
_LP0 = _LP0 + (    1.30282761826006 * _TEMP);

***  Effect: Frq ;
_TEMP = Frq ;
_LP0 = _LP0 + (   -0.12461246583448 * _TEMP);

***  Effect: G_Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (    0.35055822679312) * _TEMP * _1_0;
_LP0 = _LP0 + (    0.06578421633721) * _TEMP * _1_1;

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (   -0.00001965833893 * _TEMP);

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (   -0.00237919371816 * _TEMP);

***  Effect: MntFruits ;
_TEMP = MntFruits ;
_LP0 = _LP0 + (   -0.00490441121869 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (     0.0027445180197 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (    0.00427794030308 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (    0.38768279900123 * _TEMP);

***  Effect: NumWebPurchases ;
_TEMP = NumWebPurchases ;
_LP0 = _LP0 + (    0.21939343331463 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (    0.00011370233217 * _TEMP);

***  Effect: RMntFrq ;
_TEMP = RMntFrq ;
_LP0 = _LP0 + (    0.02046669609103 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (   -0.03547597645545 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((    0.18495497784379) + _LP0);
_P1 = 1.0 - _P0;

REG8DR1:


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
I_DepVar = REG8DRF[_IY];
U_DepVar = REG8DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
