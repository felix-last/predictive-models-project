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
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Kidhome = 'Standard: Kidhome' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFishProducts = 'Standard: MntFishProducts' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_NumStorePurchases = 'Standard: NumStorePurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label AcceptedCmp10 = 'Dummy: AcceptedCmp1=0' ;

      label AcceptedCmp20 = 'Dummy: AcceptedCmp2=0' ;

      label AcceptedCmp30 = 'Dummy: AcceptedCmp3=0' ;

      label AcceptedCmp40 = 'Dummy: AcceptedCmp4=0' ;

      label AcceptedCmp50 = 'Dummy: AcceptedCmp5=0' ;

      label Complain0 = 'Dummy: Complain=0' ;

      label HigherEducationBinary0 = 'Dummy: HigherEducationBinary=0' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label H17 = 'Hidden: H1=7' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for AcceptedCmp1 ;
drop AcceptedCmp10 ;
if missing( AcceptedCmp1 ) then do;
   AcceptedCmp10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp1 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp10 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp10 = -1;
   end;
   else do;
      AcceptedCmp10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp2 ;
drop AcceptedCmp20 ;
if missing( AcceptedCmp2 ) then do;
   AcceptedCmp20 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp2 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp20 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp20 = -1;
   end;
   else do;
      AcceptedCmp20 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp3 ;
drop AcceptedCmp30 ;
if missing( AcceptedCmp3 ) then do;
   AcceptedCmp30 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp3 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp30 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp30 = -1;
   end;
   else do;
      AcceptedCmp30 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp4 ;
drop AcceptedCmp40 ;
if missing( AcceptedCmp4 ) then do;
   AcceptedCmp40 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp4 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp40 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp40 = -1;
   end;
   else do;
      AcceptedCmp40 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp5 ;
drop AcceptedCmp50 ;
if missing( AcceptedCmp5 ) then do;
   AcceptedCmp50 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp5 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp50 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp50 = -1;
   end;
   else do;
      AcceptedCmp50 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Complain ;
drop Complain0 ;
if missing( Complain ) then do;
   Complain0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Complain , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      Complain0 = 1;
   end;
   else if _dm12 = '1'  then do;
      Complain0 = -1;
   end;
   else do;
      Complain0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for HigherEducationBinary ;
drop HigherEducationBinary0 ;
if missing( HigherEducationBinary ) then do;
   HigherEducationBinary0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( HigherEducationBinary , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      HigherEducationBinary0 = -1;
   end;
   else if _dm12 = '0'  then do;
      HigherEducationBinary0 = 1;
   end;
   else do;
      HigherEducationBinary0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

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
   Kidhome , 
   Mnt , 
   MntFishProducts , 
   MntFruits , 
   MntGoldProds , 
   MntMeatProducts , 
   MntSweetProducts , 
   MntWines , 
   NumCatalogPurchases , 
   NumDealsPurchases , 
   NumDistPurchases , 
   NumStorePurchases , 
   NumWebPurchases , 
   NumWebVisitsMonth , 
   RFMstat , 
   Recency , 
   Teenhome   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFishProducts  =    -0.69884925989448 +     0.01914942799914 * 
        MntFishProducts ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 * 
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 * 
        NumDistPurchases ;
   S_NumStorePurchases  =    -1.81825213465822 +     0.30716078899015 * 
        NumStorePurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 * 
        NumWebPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   IF MISSING( Kidhome ) THEN S_Kidhome  = . ;
   ELSE S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntFishProducts ) THEN S_MntFishProducts  = . ;
   ELSE S_MntFishProducts  =    -0.69884925989448 +     0.01914942799914 * 
        MntFishProducts ;
   IF MISSING( MntFruits ) THEN S_MntFruits  = . ;
   ELSE S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits
         ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   IF MISSING( MntSweetProducts ) THEN S_MntSweetProducts  = . ;
   ELSE S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 * 
        NumDistPurchases ;
   IF MISSING( NumStorePurchases ) THEN S_NumStorePurchases  = . ;
   ELSE S_NumStorePurchases  =    -1.81825213465822 +     0.30716078899015 * 
        NumStorePurchases ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 * 
        NumWebPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   IF MISSING( Teenhome ) THEN S_Teenhome  = . ;
   ELSE S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.05593591984236 * S_AcceptedCmpTotal  +    -0.15222591404968 * 
        S_Kidhome  +    -0.14333543557998 * S_Mnt  +    -0.15248110960637 * 
        S_MntFishProducts  +     0.21423389210826 * S_MntFruits
          +     0.27583997827488 * S_MntGoldProds  +     0.33906941857334 * 
        S_MntMeatProducts  +    -0.18189684051157 * S_MntSweetProducts
          +    -0.14699487046336 * S_MntWines  +     0.12279108001012 * 
        S_NumCatalogPurchases  +    -0.13784967978035 * S_NumDealsPurchases
          +     0.31907604696327 * S_NumDistPurchases
          +    -0.02337643350225 * S_NumStorePurchases
          +    -0.03710870748613 * S_NumWebPurchases
          +    -0.09050794174833 * S_NumWebVisitsMonth
          +    -0.03038236905639 * S_RFMstat  +     -0.1425750250249 * 
        S_Recency  +     0.28728724059371 * S_Teenhome ;
   H12  =     0.02658934126333 * S_AcceptedCmpTotal  +     0.00729222523123 * 
        S_Kidhome  +    -0.16054040072952 * S_Mnt  +     0.21368744829668 * 
        S_MntFishProducts  +    -0.38567748679786 * S_MntFruits
          +     0.01538770837896 * S_MntGoldProds  +     0.26799837156516 * 
        S_MntMeatProducts  +    -0.03227992228949 * S_MntSweetProducts
          +    -0.05332837299227 * S_MntWines  +    -0.59456078768767 * 
        S_NumCatalogPurchases  +    -0.30459286527334 * S_NumDealsPurchases
          +     0.09101667200647 * S_NumDistPurchases
          +     0.15756950151025 * S_NumStorePurchases
          +    -0.25413468685639 * S_NumWebPurchases
          +     0.05860616268336 * S_NumWebVisitsMonth
          +     0.15733068754241 * S_RFMstat  +    -0.45821943962804 * 
        S_Recency  +    -0.27642512764036 * S_Teenhome ;
   H13  =     0.16918999382902 * S_AcceptedCmpTotal  +     -0.4012305600884 * 
        S_Kidhome  +     0.26493497259127 * S_Mnt  +     0.04728975645729 * 
        S_MntFishProducts  +      0.0315247200365 * S_MntFruits
          +    -0.04096342555085 * S_MntGoldProds  +     0.56434077264537 * 
        S_MntMeatProducts  +    -0.09161669649727 * S_MntSweetProducts
          +    -0.39043511079678 * S_MntWines  +     0.54393711558115 * 
        S_NumCatalogPurchases  +    -0.01184328299667 * S_NumDealsPurchases
          +      0.3986742546267 * S_NumDistPurchases
          +     0.01771277995324 * S_NumStorePurchases
          +    -0.01959916713409 * S_NumWebPurchases
          +     0.60679036120713 * S_NumWebVisitsMonth
          +     0.08435948584344 * S_RFMstat  +    -0.95524595397707 * 
        S_Recency  +    -0.25065878895323 * S_Teenhome ;
   H14  =    -0.16659499847061 * S_AcceptedCmpTotal  +     0.02357084658349 * 
        S_Kidhome  +     0.05388140126658 * S_Mnt  +    -0.05810927736046 * 
        S_MntFishProducts  +    -0.15826458235953 * S_MntFruits
          +    -0.41850090574896 * S_MntGoldProds  +    -0.26401541533988 * 
        S_MntMeatProducts  +     0.04480310739087 * S_MntSweetProducts
          +      0.1225741493226 * S_MntWines  +    -0.56748657856846 * 
        S_NumCatalogPurchases  +    -0.69394311075706 * S_NumDealsPurchases
          +    -0.56367315288861 * S_NumDistPurchases
          +     0.22181323985263 * S_NumStorePurchases
          +    -0.06232830057869 * S_NumWebPurchases
          +    -0.16027390604517 * S_NumWebVisitsMonth
          +    -0.09981217676274 * S_RFMstat  +    -0.04262244153265 * 
        S_Recency  +    -0.17321366891816 * S_Teenhome ;
   H15  =    -0.03881766208476 * S_AcceptedCmpTotal  +      0.3555777614453 * 
        S_Kidhome  +     0.15023474562078 * S_Mnt  +    -0.28470673338867 * 
        S_MntFishProducts  +    -0.16436807986852 * S_MntFruits
          +     0.15942617624256 * S_MntGoldProds  +     1.26624544782503 * 
        S_MntMeatProducts  +      0.0500748594942 * S_MntSweetProducts
          +      0.1213695191802 * S_MntWines  +     1.23017810696609 * 
        S_NumCatalogPurchases  +     0.26589246063072 * S_NumDealsPurchases
          +      0.2955712939881 * S_NumDistPurchases
          +     -0.5433445349483 * S_NumStorePurchases
          +    -0.59265227511161 * S_NumWebPurchases
          +     0.00366326444932 * S_NumWebVisitsMonth
          +     0.25124432206112 * S_RFMstat  +    -0.08596429987285 * 
        S_Recency  +    -0.19264562465751 * S_Teenhome ;
   H16  =      0.4256391916459 * S_AcceptedCmpTotal  +    -0.14933442450857 * 
        S_Kidhome  +     0.11321190053106 * S_Mnt  +    -0.08228540664731 * 
        S_MntFishProducts  +    -0.44605772880289 * S_MntFruits
          +     0.02398042304084 * S_MntGoldProds  +     1.02247698844519 * 
        S_MntMeatProducts  +    -0.29299854989186 * S_MntSweetProducts
          +    -0.55069644292933 * S_MntWines  +      0.6692377268179 * 
        S_NumCatalogPurchases  +     0.70282032902203 * S_NumDealsPurchases
          +    -0.42166207183939 * S_NumDistPurchases
          +    -0.74339843972857 * S_NumStorePurchases
          +    -0.61598427613968 * S_NumWebPurchases
          +     0.88769400454452 * S_NumWebVisitsMonth
          +     0.45864975080775 * S_RFMstat  +    -1.00498331113421 * 
        S_Recency  +    -0.06157944188263 * S_Teenhome ;
   H17  =     0.63900672999082 * S_AcceptedCmpTotal  +    -0.30964832179168 * 
        S_Kidhome  +    -0.32513653413684 * S_Mnt  +    -0.24581000667509 * 
        S_MntFishProducts  +     0.02617694172605 * S_MntFruits
          +     0.00781760579393 * S_MntGoldProds  +     0.29104948109042 * 
        S_MntMeatProducts  +    -0.02316001924491 * S_MntSweetProducts
          +    -0.36691071804931 * S_MntWines  +     0.32387184925622 * 
        S_NumCatalogPurchases  +    -0.02259558698489 * S_NumDealsPurchases
          +    -0.05302323558282 * S_NumDistPurchases
          +    -0.61057201236183 * S_NumStorePurchases
          +    -0.43675839485699 * S_NumWebPurchases
          +      0.9068485509802 * S_NumWebVisitsMonth
          +    -0.10589439992168 * S_RFMstat  +    -1.04488846978483 * 
        S_Recency  +    -0.22850227275517 * S_Teenhome ;
   H11  = H11  +     0.18111603256896 * AcceptedCmp10
          +     0.22509521803356 * AcceptedCmp20  +    -0.04654046313147 * 
        AcceptedCmp30  +      0.3384111516657 * AcceptedCmp40
          +     0.32627827523963 * AcceptedCmp50  +    -0.01568279175973 * 
        Complain0  +    -0.55252517176272 * HigherEducationBinary0 ;
   H12  = H12  +     0.11443639158645 * AcceptedCmp10
          +    -0.07848565251064 * AcceptedCmp20  +     0.12149050142183 * 
        AcceptedCmp30  +     0.16124218246786 * AcceptedCmp40
          +     0.08002037216673 * AcceptedCmp50  +     0.19507760774174 * 
        Complain0  +     0.11914737027935 * HigherEducationBinary0 ;
   H13  = H13  +    -0.10931311385786 * AcceptedCmp10
          +    -0.35789040073328 * AcceptedCmp20  +    -0.38944306116716 * 
        AcceptedCmp30  +    -0.40889901167624 * AcceptedCmp40
          +    -0.24329354019242 * AcceptedCmp50  +    -0.35456353492115 * 
        Complain0  +     0.13555715311919 * HigherEducationBinary0 ;
   H14  = H14  +      0.2188684433023 * AcceptedCmp10
          +    -0.29615454952167 * AcceptedCmp20  +    -0.22271127437354 * 
        AcceptedCmp30  +     0.20823945988265 * AcceptedCmp40
          +    -0.21625430481282 * AcceptedCmp50  +    -0.18295367581943 * 
        Complain0  +     0.46325732026927 * HigherEducationBinary0 ;
   H15  = H15  +     0.30998447993837 * AcceptedCmp10
          +     0.12767836835052 * AcceptedCmp20  +    -0.06080337916302 * 
        AcceptedCmp30  +     0.01251586968598 * AcceptedCmp40
          +    -0.23770263910732 * AcceptedCmp50  +     0.25109546472381 * 
        Complain0  +    -0.02175844243112 * HigherEducationBinary0 ;
   H16  = H16  +    -0.62091932539163 * AcceptedCmp10
          +    -0.51271562673252 * AcceptedCmp20  +    -0.11342469632318 * 
        AcceptedCmp30  +    -0.16507397007692 * AcceptedCmp40
          +    -0.30784693811801 * AcceptedCmp50  +    -0.25537137844726 * 
        Complain0  +    -0.10971155214877 * HigherEducationBinary0 ;
   H17  = H17  +    -0.05412380892781 * AcceptedCmp10
          +    -0.01109263229825 * AcceptedCmp20  +     -0.2110615452485 * 
        AcceptedCmp30  +     0.00965424319008 * AcceptedCmp40
          +     -0.4258810591025 * AcceptedCmp50  +     0.27308424287361 * 
        Complain0  +      0.0268240614027 * HigherEducationBinary0 ;
   H11  = H11  +    -0.33757847459033 * Marital_StatusDivorced
          +     0.00302217414126 * Marital_StatusMarried
          +      0.2152123397616 * Marital_StatusSingle
          +    -0.13520964902373 * Marital_StatusTogether ;
   H12  = H12  +     0.00194872690496 * Marital_StatusDivorced
          +     0.03439335682344 * Marital_StatusMarried
          +     0.05021548127829 * Marital_StatusSingle
          +    -0.21404927960644 * Marital_StatusTogether ;
   H13  = H13  +     0.48013325378484 * Marital_StatusDivorced
          +    -0.98905242808423 * Marital_StatusMarried
          +     0.71786420090726 * Marital_StatusSingle
          +    -0.99548524974998 * Marital_StatusTogether ;
   H14  = H14  +    -0.10242951736314 * Marital_StatusDivorced
          +       0.050581701391 * Marital_StatusMarried
          +     0.02970444912382 * Marital_StatusSingle
          +    -0.31932441367684 * Marital_StatusTogether ;
   H15  = H15  +    -0.15638584915255 * Marital_StatusDivorced
          +     0.24057441973108 * Marital_StatusMarried
          +    -0.25555699216503 * Marital_StatusSingle
          +     0.42413452422729 * Marital_StatusTogether ;
   H16  = H16  +     0.21905536295614 * Marital_StatusDivorced
          +     0.05764012832482 * Marital_StatusMarried
          +     0.09900502198755 * Marital_StatusSingle
          +    -0.29296987558734 * Marital_StatusTogether ;
   H17  = H17  +    -0.10338488336034 * Marital_StatusDivorced
          +    -0.91005475926987 * Marital_StatusMarried
          +     0.69014529167411 * Marital_StatusSingle
          +    -0.54713111008177 * Marital_StatusTogether ;
   H11  =     0.41764308857177 + H11 ;
   H12  =     0.52419261709948 + H12 ;
   H13  =    -0.81831247743605 + H13 ;
   H14  =    -0.81516752423378 + H14 ;
   H15  =     0.07454870495209 + H15 ;
   H16  =    -0.59819903707625 + H16 ;
   H17  =     0.67503972430369 + H17 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
   H17  = TANH(H17 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
   H17  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -0.00227674838385 * H11  +     0.58155599175904 * H12
          +     2.88143779402566 * H13  +    -1.63691423838644 * H14
          +     2.39141643331858 * H15  +     3.17879887277365 * H16
          +     2.23901808700024 * H17 ;
   P_DepVar1  =     -1.5295367762329 + P_DepVar1 ;
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
