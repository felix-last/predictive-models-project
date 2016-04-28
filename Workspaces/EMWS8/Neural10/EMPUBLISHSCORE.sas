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

      label S_Age = 'Standard: Age' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Kidhome = 'Standard: Kidhome' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFishProducts = 'Standard: MntFishProducts' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_MonthsAsCustomer = 'Standard: MonthsAsCustomer' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_NumStorePurchases = 'Standard: NumStorePurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label AcceptedCmp10 = 'Dummy: AcceptedCmp1=0' ;

      label AcceptedCmp20 = 'Dummy: AcceptedCmp2=0' ;

      label AcceptedCmp30 = 'Dummy: AcceptedCmp3=0' ;

      label AcceptedCmp40 = 'Dummy: AcceptedCmp4=0' ;

      label AcceptedCmp50 = 'Dummy: AcceptedCmp5=0' ;

      label Complain0 = 'Dummy: Complain=0' ;

      label HigherEducationBinary0 = 'Dummy: HigherEducationBinary=0' ;

      label Education2n_Cycle = 'Dummy: Education=2n Cycle' ;

      label EducationBasic = 'Dummy: Education=Basic' ;

      label EducationGraduation = 'Dummy: Education=Graduation' ;

      label EducationMaster = 'Dummy: Education=Master' ;

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

*** Generate dummy variables for Education ;
drop Education2n_Cycle EducationBasic EducationGraduation EducationMaster ;
*** encoding is sparse, initialize to zero;
Education2n_Cycle = 0;
EducationBasic = 0;
EducationGraduation = 0;
EducationMaster = 0;
if missing( Education ) then do;
   Education2n_Cycle = .;
   EducationBasic = .;
   EducationGraduation = .;
   EducationMaster = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Education , $10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'GRADUATION'  then do;
      EducationGraduation = 1;
   end;
   else if _dm10 = 'PHD'  then do;
      Education2n_Cycle = -1;
      EducationBasic = -1;
      EducationGraduation = -1;
      EducationMaster = -1;
   end;
   else if _dm10 = 'MASTER'  then do;
      EducationMaster = 1;
   end;
   else if _dm10 = '2N CYCLE'  then do;
      Education2n_Cycle = 1;
   end;
   else if _dm10 = 'BASIC'  then do;
      EducationBasic = 1;
   end;
   else do;
      Education2n_Cycle = .;
      EducationBasic = .;
      EducationGraduation = .;
      EducationMaster = .;
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
   Age ,
   Frq ,
   Income ,
   Kidhome ,
   Mnt ,
   MntFishProducts ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   MntWines ,
   MonthsAsCustomer ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumDistPurchases ,
   NumStorePurchases ,
   NumWebPurchases ,
   NumWebVisitsMonth ,
   RFMstat ,
   RMntFrq ,
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
   S_Age  =    -3.91319138389466 +     0.08289609202857 * Age ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
        MonthsAsCustomer ;
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
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Age ) THEN S_Age  = . ;
   ELSE S_Age  =    -3.91319138389466 +     0.08289609202857 * Age ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
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
   IF MISSING( MonthsAsCustomer ) THEN S_MonthsAsCustomer  = . ;
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
        MonthsAsCustomer ;
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
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =    -0.56509996505673 * S_AcceptedCmpTotal  +    -0.23063823697229 *
        S_Age  +     0.27537956875262 * S_Frq  +    -0.13998299759696 *
        S_Income  +    -0.48272554811946 * S_Kidhome
          +     0.02078968845252 * S_Mnt  +     0.39778286292195 *
        S_MntFishProducts  +    -0.05943228184406 * S_MntFruits
          +    -0.22076005674037 * S_MntGoldProds  +    -1.15470073662687 *
        S_MntMeatProducts  +     0.01689175327079 * S_MntSweetProducts
          +     0.38794071873445 * S_MntWines  +      0.0790144986614 *
        S_MonthsAsCustomer  +     -0.5385547715034 * S_NumCatalogPurchases
          +    -0.21965892172232 * S_NumDealsPurchases
          +     0.18147972034868 * S_NumDistPurchases
          +     0.36657814181657 * S_NumStorePurchases
          +      0.2558783559717 * S_NumWebPurchases
          +    -0.12008925196796 * S_NumWebVisitsMonth
          +     -0.2801394750033 * S_RFMstat  +    -0.15606351466959 *
        S_RMntFrq  +     0.37914209292496 * S_Recency
          +     0.40705261237123 * S_Teenhome ;
   H12  =    -0.33633432608107 * S_AcceptedCmpTotal  +     0.16353547895993 *
        S_Age  +     0.24085016715236 * S_Frq  +    -0.12216338707901 *
        S_Income  +     0.24387947620062 * S_Kidhome
          +     0.49145996867369 * S_Mnt  +      0.0578610487644 *
        S_MntFishProducts  +     0.02621200334488 * S_MntFruits
          +    -0.22909633857209 * S_MntGoldProds  +    -0.86136295830946 *
        S_MntMeatProducts  +     0.11908088548047 * S_MntSweetProducts
          +     0.63547632412982 * S_MntWines  +      0.2259508551947 *
        S_MonthsAsCustomer  +    -0.13471041074588 * S_NumCatalogPurchases
          +    -0.05257082874614 * S_NumDealsPurchases
          +     0.41456571712035 * S_NumDistPurchases
          +     0.23489798619427 * S_NumStorePurchases
          +     0.27816946712153 * S_NumWebPurchases
          +    -0.60321927125997 * S_NumWebVisitsMonth
          +    -0.13771604724576 * S_RFMstat  +     0.32661912615265 *
        S_RMntFrq  +     0.37992942536792 * S_Recency
          +     0.23123529364349 * S_Teenhome ;
   H13  =    -0.62677142457909 * S_AcceptedCmpTotal  +    -0.10225199885389 *
        S_Age  +     0.05375482280846 * S_Frq  +     -0.2276300280575 *
        S_Income  +     0.20262487803684 * S_Kidhome
          +    -0.14876269646837 * S_Mnt  +     -0.4868127566475 *
        S_MntFishProducts  +    -0.14012815992673 * S_MntFruits
          +     0.10460152409631 * S_MntGoldProds  +     0.32637815775717 *
        S_MntMeatProducts  +    -0.31544850569482 * S_MntSweetProducts
          +     0.04232116862038 * S_MntWines  +     0.04384330908855 *
        S_MonthsAsCustomer  +       0.024361263039 * S_NumCatalogPurchases
          +      0.0913099268589 * S_NumDealsPurchases
          +    -0.05574305289625 * S_NumDistPurchases
          +    -0.09928560475828 * S_NumStorePurchases
          +     0.00041482984053 * S_NumWebPurchases
          +    -0.03314322750163 * S_NumWebVisitsMonth
          +    -0.18963089491876 * S_RFMstat  +    -0.07289922796134 *
        S_RMntFrq  +     -0.0998656801694 * S_Recency
          +     0.07805710264311 * S_Teenhome ;
   H14  =     0.58578346547732 * S_AcceptedCmpTotal  +     0.04716075363777 *
        S_Age  +     0.23789426503274 * S_Frq  +     0.09306785885014 *
        S_Income  +     0.26225843602768 * S_Kidhome
          +     0.28381069432619 * S_Mnt  +    -0.20750545498741 *
        S_MntFishProducts  +     -0.0153624448098 * S_MntFruits
          +    -0.02656939541352 * S_MntGoldProds  +     1.97911440218059 *
        S_MntMeatProducts  +     0.28353571629196 * S_MntSweetProducts
          +    -0.69002907264222 * S_MntWines  +    -0.01673377005001 *
        S_MonthsAsCustomer  +     1.76601520216011 * S_NumCatalogPurchases
          +     0.83559002761395 * S_NumDealsPurchases
          +     0.30813434559451 * S_NumDistPurchases
          +    -0.61391039002598 * S_NumStorePurchases
          +    -1.03190502679863 * S_NumWebPurchases
          +     0.13374464245621 * S_NumWebVisitsMonth
          +     0.34844972128972 * S_RFMstat  +     0.00077632967209 *
        S_RMntFrq  +    -0.37521605306084 * S_Recency
          +    -0.00142295377819 * S_Teenhome ;
   H15  =      0.5305297970665 * S_AcceptedCmpTotal  +    -0.02853929527052 *
        S_Age  +    -0.17491582531678 * S_Frq  +     0.67721722139265 *
        S_Income  +      -0.692179901076 * S_Kidhome
          +      0.0753885945685 * S_Mnt  +     0.07509531201013 *
        S_MntFishProducts  +    -0.09558593671631 * S_MntFruits
          +     -0.1010519397785 * S_MntGoldProds  +     0.90842125479786 *
        S_MntMeatProducts  +    -0.05268487318554 * S_MntSweetProducts
          +    -0.41869343587904 * S_MntWines  +     0.00774546781662 *
        S_MonthsAsCustomer  +     0.69118571360022 * S_NumCatalogPurchases
          +     0.65604427948051 * S_NumDealsPurchases
          +     0.01430165674945 * S_NumDistPurchases
          +    -0.76865963932685 * S_NumStorePurchases
          +    -0.72521754496401 * S_NumWebPurchases
          +     1.59453686210397 * S_NumWebVisitsMonth
          +     0.07015818288598 * S_RFMstat  +    -0.48678185627279 *
        S_RMntFrq  +    -1.32992957279361 * S_Recency
          +    -0.30389277845474 * S_Teenhome ;
   H16  =    -0.14461357872357 * S_AcceptedCmpTotal  +     0.33306933698178 *
        S_Age  +     0.23947139684336 * S_Frq  +     0.25400354895308 *
        S_Income  +    -0.23602869688727 * S_Kidhome
          +     0.01762051414513 * S_Mnt  +    -0.02278009971118 *
        S_MntFishProducts  +      0.0138100640729 * S_MntFruits
          +     0.10885605658644 * S_MntGoldProds  +    -0.08129497127342 *
        S_MntMeatProducts  +    -0.15226579430345 * S_MntSweetProducts
          +    -0.28936878643978 * S_MntWines  +     0.18699471527536 *
        S_MonthsAsCustomer  +     0.22218904316421 * S_NumCatalogPurchases
          +    -0.30337362777997 * S_NumDealsPurchases
          +     0.11551482249746 * S_NumDistPurchases
          +     0.19719845223838 * S_NumStorePurchases
          +     0.16011319337206 * S_NumWebPurchases
          +    -0.19222801416081 * S_NumWebVisitsMonth
          +    -0.21560223408993 * S_RFMstat  +    -0.09112530580192 *
        S_RMntFrq  +     0.01056840325776 * S_Recency
          +      -0.297834752682 * S_Teenhome ;
   H17  =     0.15982134979751 * S_AcceptedCmpTotal  +    -0.10107478816004 *
        S_Age  +     0.02027525505315 * S_Frq  +     0.41229842787905 *
        S_Income  +    -0.47270881977809 * S_Kidhome
          +     0.12024996830569 * S_Mnt  +    -0.28295608579685 *
        S_MntFishProducts  +    -0.07163379649201 * S_MntFruits
          +     0.09552477346527 * S_MntGoldProds  +    -0.01286236006652 *
        S_MntMeatProducts  +     0.00943538063039 * S_MntSweetProducts
          +     0.04434518979611 * S_MntWines  +     -0.1176196348599 *
        S_MonthsAsCustomer  +      0.3393965598874 * S_NumCatalogPurchases
          +    -0.16806813676368 * S_NumDealsPurchases
          +      0.1680540538046 * S_NumDistPurchases
          +     0.09845423109173 * S_NumStorePurchases
          +     0.22281606853536 * S_NumWebPurchases
          +       0.650769024744 * S_NumWebVisitsMonth
          +     0.09481237306076 * S_RFMstat  +     0.13733671608882 *
        S_RMntFrq  +    -1.11177537596499 * S_Recency
          +     -0.4787522037445 * S_Teenhome ;
   H11  = H11  +     0.13366172993941 * AcceptedCmp10
          +     0.05223132673306 * AcceptedCmp20  +    -0.12431756055238 *
        AcceptedCmp30  +    -0.11023452429442 * AcceptedCmp40
          +     0.07032238409995 * AcceptedCmp50  +    -0.26682806608348 *
        Complain0  +    -0.02499813030323 * HigherEducationBinary0 ;
   H12  = H12  +     0.00554245438596 * AcceptedCmp10
          +     0.15839567066461 * AcceptedCmp20  +     0.37076825865406 *
        AcceptedCmp30  +    -0.35554633579904 * AcceptedCmp40
          +     0.37072771407119 * AcceptedCmp50  +    -0.05194089161987 *
        Complain0  +    -0.37225966683728 * HigherEducationBinary0 ;
   H13  = H13  +    -0.22559016468364 * AcceptedCmp10
          +     0.05833377673707 * AcceptedCmp20  +    -0.03636700985548 *
        AcceptedCmp30  +    -0.25569759811115 * AcceptedCmp40
          +    -0.04684336742413 * AcceptedCmp50  +     0.04628503093017 *
        Complain0  +     -0.0274690420199 * HigherEducationBinary0 ;
   H14  = H14  +    -0.32760772054296 * AcceptedCmp10
          +      -0.115974524782 * AcceptedCmp20  +     0.17243389922886 *
        AcceptedCmp30  +      0.2619520865817 * AcceptedCmp40
          +    -0.10340137441821 * AcceptedCmp50  +     0.07381382988108 *
        Complain0  +    -0.02819765040354 * HigherEducationBinary0 ;
   H15  = H15  +    -0.26084605443779 * AcceptedCmp10
          +    -0.16387661015452 * AcceptedCmp20  +    -0.16566201323403 *
        AcceptedCmp30  +    -0.35263428487299 * AcceptedCmp40
          +    -0.32839719627655 * AcceptedCmp50  +     0.02360464331322 *
        Complain0  +    -0.27283273238131 * HigherEducationBinary0 ;
   H16  = H16  +     0.01304183242542 * AcceptedCmp10
          +     0.04566997893346 * AcceptedCmp20  +    -0.04050514571317 *
        AcceptedCmp30  +    -0.01620566973366 * AcceptedCmp40
          +    -0.07167046817245 * AcceptedCmp50  +    -0.06511918231577 *
        Complain0  +     0.23270681066978 * HigherEducationBinary0 ;
   H17  = H17  +     0.01260470527699 * AcceptedCmp10
          +    -0.16882003264299 * AcceptedCmp20  +    -0.27439169721218 *
        AcceptedCmp30  +    -0.26741927505062 * AcceptedCmp40
          +    -0.13327257255598 * AcceptedCmp50  +     -0.1392453082395 *
        Complain0  +     0.31998419104809 * HigherEducationBinary0 ;
   H11  = H11  +     0.06102738975935 * Education2n_Cycle
          +     0.28943057977991 * EducationBasic  +     0.30966749770345 *
        EducationGraduation  +     0.02445863067232 * EducationMaster
          +     0.42984001630756 * Marital_StatusDivorced
          +     -0.4660144877239 * Marital_StatusMarried
          +     0.44888148801285 * Marital_StatusSingle
          +    -0.35337765969826 * Marital_StatusTogether ;
   H12  = H12  +    -0.14873776047169 * Education2n_Cycle
          +     0.02114476645887 * EducationBasic  +    -0.06983582232977 *
        EducationGraduation  +     0.28773168978233 * EducationMaster
          +     0.10758942571981 * Marital_StatusDivorced
          +     0.51795960036213 * Marital_StatusMarried
          +    -0.40242992087783 * Marital_StatusSingle
          +     0.59638712724774 * Marital_StatusTogether ;
   H13  = H13  +     0.07261326268026 * Education2n_Cycle
          +     0.22828601903683 * EducationBasic  +    -0.09808260614396 *
        EducationGraduation  +      0.1986661885803 * EducationMaster
          +    -0.05264595890678 * Marital_StatusDivorced
          +     0.07468414180829 * Marital_StatusMarried
          +     0.20145352309024 * Marital_StatusSingle
          +     0.21800692249317 * Marital_StatusTogether ;
   H14  = H14  +    -0.16591436756181 * Education2n_Cycle
          +     0.10944605668626 * EducationBasic  +    -0.04736510771915 *
        EducationGraduation  +     0.28768591072195 * EducationMaster
          +    -0.41440932029593 * Marital_StatusDivorced
          +     0.65630698363184 * Marital_StatusMarried
          +    -0.37277384861759 * Marital_StatusSingle
          +     0.66742239790358 * Marital_StatusTogether ;
   H15  = H15  +     0.14874986561786 * Education2n_Cycle
          +    -0.26075650045962 * EducationBasic  +     0.31386399943318 *
        EducationGraduation  +    -0.19252087246622 * EducationMaster
          +     0.86284304352233 * Marital_StatusDivorced
          +    -0.85716490342524 * Marital_StatusMarried
          +     0.74516572826411 * Marital_StatusSingle
          +    -0.94596838391348 * Marital_StatusTogether ;
   H16  = H16  +     0.05955306560033 * Education2n_Cycle
          +    -0.33179362702455 * EducationBasic  +    -0.11577784652643 *
        EducationGraduation  +    -0.12481149416801 * EducationMaster
          +    -0.11928801837478 * Marital_StatusDivorced
          +    -0.15909233409421 * Marital_StatusMarried
          +     0.34325131781601 * Marital_StatusSingle
          +    -0.10826134118683 * Marital_StatusTogether ;
   H17  = H17  +      0.0153077476724 * Education2n_Cycle
          +    -0.21261765604905 * EducationBasic  +    -0.12217248919773 *
        EducationGraduation  +    -0.08573366282988 * EducationMaster
          +     0.15109481730803 * Marital_StatusDivorced
          +    -1.01578758379559 * Marital_StatusMarried
          +     0.70421923836193 * Marital_StatusSingle
          +    -0.63730370729331 * Marital_StatusTogether ;
   H11  =     0.02509750258391 + H11 ;
   H12  =    -0.58342149790654 + H12 ;
   H13  =    -1.03881761031374 + H13 ;
   H14  =     0.84311700438452 + H14 ;
   H15  =    -0.42140887324666 + H15 ;
   H16  =    -1.77342637643401 + H16 ;
   H17  =    -1.60862695180721 + H17 ;
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
   P_DepVar1  =    -1.59177479560764 * H11  +    -1.61754897134463 * H12
          +     0.34365500815599 * H13  +     3.22562781339883 * H14
          +     3.60138310710336 * H15  +     0.57380881905142 * H16
          +     2.14937033273881 * H17 ;
   P_DepVar1  =      -2.174490498324 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
H16
H17
;
drop S_:;
