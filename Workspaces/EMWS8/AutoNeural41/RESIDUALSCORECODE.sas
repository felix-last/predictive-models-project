***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
      F_DepVar  $ 12
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for Marital_Status ;
drop Marital_StatusDivorced Marital_StatusMarried Marital_StatusSingle 
        Marital_StatusTogether ;
*** encoding is sparse, initialize to zero;
Marital_StatusDivorced = 0;
Marital_StatusMarried = 0;
Marital_StatusSingle = 0;
Marital_StatusTogether = 0;
if missing( Marital_Status ) then do;
   Marital_StatusDivorced = .;
   Marital_StatusMarried = .;
   Marital_StatusSingle = .;
   Marital_StatusTogether = .;
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
            Marital_StatusDivorced = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               Marital_StatusMarried = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            Marital_StatusSingle = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         Marital_StatusTogether = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            Marital_StatusDivorced = -1;
            Marital_StatusMarried = -1;
            Marital_StatusSingle = -1;
            Marital_StatusTogether = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      Marital_StatusDivorced = .;
      Marital_StatusMarried = .;
      Marital_StatusSingle = .;
      Marital_StatusTogether = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal , 
   Frq , 
   Income , 
   Mnt , 
   MntGoldProds , 
   MntMeatProducts , 
   NumCatalogPurchases , 
   NumDealsPurchases , 
   NumWebVisitsMonth , 
   RFMstat , 
   Recency , 
   Teenhome , 
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 * 
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   IF MISSING( Teenhome ) THEN S_Teenhome  = . ;
   ELSE S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * 
        Year_Birth ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.27619305633764 * S_AcceptedCmpTotal
          +    -0.11236902682497 * S_Frq  +     0.02547336321659 * S_Income
          +     1.22594163788316 * S_Mnt  +    -0.13304067437519 * 
        S_MntGoldProds  +    -0.25318386797622 * S_MntMeatProducts
          +     0.18813452089487 * S_NumCatalogPurchases
          +     0.07572009513796 * S_NumDealsPurchases
          +     0.26290613719398 * S_NumWebVisitsMonth
          +    -0.07407700105008 * S_RFMstat  +    -0.42371914006256 * 
        S_Recency  +    -0.08184869022013 * S_Teenhome
          +     0.01152140021328 * S_Year_Birth ;
   H1x1_2  =     0.10663705781144 * S_AcceptedCmpTotal
          +     -1.0540282734074 * S_Frq  +    -0.11987114679821 * S_Income
          +     0.64876951297444 * S_Mnt  +     0.19900484060335 * 
        S_MntGoldProds  +     0.97085619241432 * S_MntMeatProducts
          +      0.3860900431806 * S_NumCatalogPurchases
          +    -0.05602869666287 * S_NumDealsPurchases
          +     0.25751125196672 * S_NumWebVisitsMonth
          +     0.02624606311455 * S_RFMstat  +    -0.13483172331925 * 
        S_Recency  +     0.00740928227007 * S_Teenhome
          +     0.00743631640493 * S_Year_Birth ;
   H1x1_3  =     0.25721067351974 * S_AcceptedCmpTotal
          +    -0.86907357751772 * S_Frq  +    -0.08157123692791 * S_Income
          +     0.01248777269658 * S_Mnt  +     0.05157436079695 * 
        S_MntGoldProds  +     0.77615263309304 * S_MntMeatProducts
          +     0.20017136343834 * S_NumCatalogPurchases
          +      0.4177949842415 * S_NumDealsPurchases
          +     0.12267139708832 * S_NumWebVisitsMonth
          +    -0.04813980569775 * S_RFMstat  +    -0.35935125476541 * 
        S_Recency  +    -0.04165775695782 * S_Teenhome
          +    -0.02142572027654 * S_Year_Birth ;
   H1x1_4  =    -0.14554708768829 * S_AcceptedCmpTotal
          +     -0.0597172306674 * S_Frq  +    -0.28285875178634 * S_Income
          +     1.04591505007314 * S_Mnt  +     0.00461806901547 * 
        S_MntGoldProds  +    -0.61862352433469 * S_MntMeatProducts
          +    -0.41475045310519 * S_NumCatalogPurchases
          +     0.05270183882345 * S_NumDealsPurchases
          +     -0.3411138782759 * S_NumWebVisitsMonth
          +    -0.06158026374803 * S_RFMstat  +     0.33899005947536 * 
        S_Recency  +     0.09131411279492 * S_Teenhome
          +    -0.00935201223775 * S_Year_Birth ;
   H1x1_5  =     0.19976617457438 * S_AcceptedCmpTotal
          +    -0.47746743016353 * S_Frq  +     0.16855808605754 * S_Income
          +    -0.87114248882356 * S_Mnt  +     0.16259754490995 * 
        S_MntGoldProds  +     0.11590070773645 * S_MntMeatProducts
          +     0.28201604995327 * S_NumCatalogPurchases
          +     -0.0106712941301 * S_NumDealsPurchases
          +     0.44937825968958 * S_NumWebVisitsMonth
          +     0.00709750447129 * S_RFMstat  +    -0.47138460185175 * 
        S_Recency  +    -0.07776231003236 * S_Teenhome
          +    -0.02330056365233 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +    -0.29133741090287 * Marital_StatusDivorced
          +     -0.2248578245828 * Marital_StatusMarried
          +     0.07509958702397 * Marital_StatusSingle
          +    -0.12991422082545 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     -1.1074732716993 * Marital_StatusDivorced
          +     0.45662921783631 * Marital_StatusMarried
          +     -0.7587900494362 * Marital_StatusSingle
          +     0.91918379082777 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.00289956415432 * Marital_StatusDivorced
          +     0.48232640763102 * Marital_StatusMarried
          +    -0.26767355443511 * Marital_StatusSingle
          +     0.26207298280723 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.33422568214247 * Marital_StatusDivorced
          +       0.692510056964 * Marital_StatusMarried
          +    -0.62467969689335 * Marital_StatusSingle
          +     0.57377256791387 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.08963617061236 * Marital_StatusDivorced
          +    -0.12414433690654 * Marital_StatusMarried
          +     0.01287765001755 * Marital_StatusSingle
          +    -0.08087882377532 * Marital_StatusTogether ;
   H1x1_1  =    -1.91971008925725 + H1x1_1 ;
   H1x1_2  =     0.32368735038167 + H1x1_2 ;
   H1x1_3  =    -1.01494899635831 + H1x1_3 ;
   H1x1_4  =     0.37995275511318 + H1x1_4 ;
   H1x1_5  =     0.85001953980369 + H1x1_5 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
   H1x1_5  = SIN(H1x1_5 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;

*** Generate dummy variables for DepVar ;
drop DepVar1 DepVar0 ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   DepVar1 = .;
   DepVar0 = .;
end;
else do;
   if F_DepVar = '0'  then do;
      DepVar1 = 0;
      DepVar0 = 1;
   end;
   else if F_DepVar = '1'  then do;
      DepVar1 = 1;
      DepVar0 = 0;
   end;
   else do;
      DepVar1 = .;
      DepVar0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     70.1947351743048 * H1x1_1  +     37.5347968698288 * H1x1_2
          +     63.5093925909107 * H1x1_3  +    -88.4297436279603 * H1x1_4
          +     56.9032773964405 * H1x1_5 ;
   P_DepVar1  =     22.2427233048176 + P_DepVar1 ;
   P_DepVar0  = 0; 
   _MAX_ = MAX (P_DepVar1 , P_DepVar0 );
   _SUM_ = 0.; 
   P_DepVar1  = EXP(P_DepVar1  - _MAX_);
   _SUM_ = _SUM_ + P_DepVar1 ;
   P_DepVar0  = EXP(P_DepVar0  - _MAX_);
   _SUM_ = _SUM_ + P_DepVar0 ;
   P_DepVar1  = P_DepVar1  / _SUM_;
   P_DepVar0  = P_DepVar0  / _SUM_;
END;
ELSE DO;
   P_DepVar1  = .;
   P_DepVar0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_DepVar1  =     0.15122156697556;
   P_DepVar0  =     0.84877843302443;
END;
*** *****************************;
*** Writing the Residuals  of the Node DepVar ;
*** ******************************;
IF MISSING( DepVar1 ) THEN R_DepVar1  = . ;
ELSE R_DepVar1  = DepVar1  - P_DepVar1 ;
IF MISSING( DepVar0 ) THEN R_DepVar0  = . ;
ELSE R_DepVar0  = DepVar0  - P_DepVar0 ;
*** *************************;
*** Writing the I_DepVar  AND U_DepVar ;
*** *************************;
_MAXP_ = P_DepVar1 ;
I_DepVar  = "1           " ;
U_DepVar  =                    1;
IF( _MAXP_ LT P_DepVar0  ) THEN DO; 
   _MAXP_ = P_DepVar0 ;
   I_DepVar  = "0           " ;
   U_DepVar  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
