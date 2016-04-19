*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG5DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG5DRU[2]  _TEMPORARY_ (1 0);

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
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG5DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: AcceptedCmpTotal ;
_TEMP = AcceptedCmpTotal ;
_LP0 = _LP0 + (    1.62720428342499 * _TEMP);

***  Effect: Frq ;
_TEMP = Frq ;
_LP0 = _LP0 + (   -0.22971333675933 * _TEMP);

***  Effect: Income ;
_TEMP = Income ;
_LP0 = _LP0 + (    0.00003533282438 * _TEMP);

***  Effect: Marital_Status ;
_TEMP = 1;
_LP0 = _LP0 + (    0.08642160195218) * _TEMP * _9_0;
_LP0 = _LP0 + (   -0.51421240544522) * _TEMP * _9_1;
_LP0 = _LP0 + (    0.43839945966755) * _TEMP * _9_2;
_LP0 = _LP0 + (   -0.51854020296844) * _TEMP * _9_3;

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (   -0.00223385655154 * _TEMP);

***  Effect: MntGoldProds ;
_TEMP = MntGoldProds ;
_LP0 = _LP0 + (    0.00401106095636 * _TEMP);

***  Effect: MntMeatProducts ;
_TEMP = MntMeatProducts ;
_LP0 = _LP0 + (    0.00703004991808 * _TEMP);

***  Effect: NumCatalogPurchases ;
_TEMP = NumCatalogPurchases ;
_LP0 = _LP0 + (    0.62141049405048 * _TEMP);

***  Effect: NumDealsPurchases ;
_TEMP = NumDealsPurchases ;
_LP0 = _LP0 + (    0.39538473396078 * _TEMP);

***  Effect: NumWebVisitsMonth ;
_TEMP = NumWebVisitsMonth ;
_LP0 = _LP0 + (    0.54283993308937 * _TEMP);

***  Effect: RFMstat ;
_TEMP = RFMstat ;
_LP0 = _LP0 + (    0.00014928266997 * _TEMP);

***  Effect: Recency ;
_TEMP = Recency ;
_LP0 = _LP0 + (   -0.05097670253272 * _TEMP);

***  Effect: Teenhome ;
_TEMP = Teenhome ;
_LP0 = _LP0 + (   -0.68537073085327 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -4.59636694921951) + _LP0);
_P1 = 1.0 - _P0;

REG5DR1:


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
I_DepVar = REG5DRF[_IY];
U_DepVar = REG5DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
