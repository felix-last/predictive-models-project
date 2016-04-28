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
   H11  =    -0.72488278382149 * S_AcceptedCmpTotal  +    -0.08876410529608 * 
        S_Age  +     0.17754731745808 * S_Frq  +    -1.23662359142973 * 
        S_Income  +     0.07820904288043 * S_Kidhome
          +     0.09164194039404 * S_Mnt  +     0.00169726430295 * 
        S_MntFishProducts  +     0.08787980644898 * S_MntFruits
          +     -0.0420056461204 * S_MntGoldProds  +    -0.81054492991264 * 
        S_MntMeatProducts  +     0.26453743798812 * S_MntSweetProducts
          +     0.87316917599734 * S_MntWines  +     -0.1156870103679 * 
        S_MonthsAsCustomer  +    -0.89585916703653 * S_NumCatalogPurchases
          +    -0.44226169338822 * S_NumDealsPurchases
          +     0.10904937358153 * S_NumDistPurchases
          +     0.85965494396899 * S_NumStorePurchases
          +     0.96874262276823 * S_NumWebPurchases
          +    -1.65059126031172 * S_NumWebVisitsMonth
          +    -0.23020354942632 * S_RFMstat  +      0.4911559239905 * 
        S_RMntFrq  +     1.26381685754541 * S_Recency
          +     0.57424541808437 * S_Teenhome ;
   H12  =    -0.06242833364988 * S_AcceptedCmpTotal  +     0.17162996069984 * 
        S_Age  +     0.23397947005047 * S_Frq  +     0.03838049824533 * 
        S_Income  +     0.49350393223739 * S_Kidhome
          +     0.08493308955856 * S_Mnt  +     0.06641355586315 * 
        S_MntFishProducts  +     0.13796996882884 * S_MntFruits
          +     0.29997327116644 * S_MntGoldProds  +     0.15434247119193 * 
        S_MntMeatProducts  +     0.11282870587489 * S_MntSweetProducts
          +   -8.265968493305E-6 * S_MntWines  +     0.50847138279991 * 
        S_MonthsAsCustomer  +    -0.36453629467324 * S_NumCatalogPurchases
          +     0.06978864254959 * S_NumDealsPurchases
          +    -0.12599065703384 * S_NumDistPurchases
          +      0.2144247508744 * S_NumStorePurchases
          +    -0.02658304825149 * S_NumWebPurchases
          +     0.19921493609147 * S_NumWebVisitsMonth
          +    -0.00068400425323 * S_RFMstat  +     0.12958872503477 * 
        S_RMntFrq  +     0.22604179472269 * S_Recency
          +    -0.00024748416541 * S_Teenhome ;
   H13  =    -0.14904002464294 * S_AcceptedCmpTotal  +      0.0196407171011 * 
        S_Age  +    -0.38130761092647 * S_Frq  +    -0.25514550161418 * 
        S_Income  +    -0.54955591901458 * S_Kidhome
          +    -0.20064604720551 * S_Mnt  +    -0.01120159869349 * 
        S_MntFishProducts  +    -0.28438340072693 * S_MntFruits
          +      -0.401775646063 * S_MntGoldProds  +    -0.14664321081034 * 
        S_MntMeatProducts  +     0.09485876734388 * S_MntSweetProducts
          +     0.11019033056419 * S_MntWines  +    -0.11590485042345 * 
        S_MonthsAsCustomer  +    -0.41095899807576 * S_NumCatalogPurchases
          +    -0.80287489735524 * S_NumDealsPurchases
          +    -0.44815413969261 * S_NumDistPurchases
          +     0.01081559808314 * S_NumStorePurchases
          +    -0.27447334038648 * S_NumWebPurchases
          +      0.1182881539804 * S_NumWebVisitsMonth
          +    -0.31607576702749 * S_RFMstat  +     0.02351098110071 * 
        S_RMntFrq  +    -0.05679667432729 * S_Recency
          +    -0.35363001486382 * S_Teenhome ;
   H14  =     0.36193112751246 * S_AcceptedCmpTotal  +    -0.09713774522438 * 
        S_Age  +    -0.34167413708614 * S_Frq  +    -0.31867444373143 * 
        S_Income  +     0.01946696600265 * S_Kidhome
          +     0.42765015920152 * S_Mnt  +    -0.40290796700834 * 
        S_MntFishProducts  +    -0.10716764177415 * S_MntFruits
          +     0.15797682916287 * S_MntGoldProds  +      1.3190145500044 * 
        S_MntMeatProducts  +     0.36757292603754 * S_MntSweetProducts
          +    -0.13810540469151 * S_MntWines  +    -0.06721864190223 * 
        S_MonthsAsCustomer  +     0.61424075957518 * S_NumCatalogPurchases
          +     0.43311138877196 * S_NumDealsPurchases
          +     0.18502408909322 * S_NumDistPurchases
          +    -0.24252633187618 * S_NumStorePurchases
          +      -0.336642179836 * S_NumWebPurchases
          +     0.81771723742428 * S_NumWebVisitsMonth
          +    -0.05424233789327 * S_RFMstat  +     0.11603798180639 * 
        S_RMntFrq  +      -1.497745460265 * S_Recency
          +    -0.16644420630578 * S_Teenhome ;
   H11  = H11  +     0.07313834221819 * AcceptedCmp10
          +     0.32717092230961 * AcceptedCmp20  +     0.48102262014799 * 
        AcceptedCmp30  +     0.17547408877472 * AcceptedCmp40
          +     0.25746983749355 * AcceptedCmp50  +    -0.28773497540647 * 
        Complain0  +    -0.18629685324982 * HigherEducationBinary0 ;
   H12  = H12  +    -0.17623954696104 * AcceptedCmp10
          +     0.09694493862829 * AcceptedCmp20  +     0.11024646409489 * 
        AcceptedCmp30  +     0.13769886685196 * AcceptedCmp40
          +    -0.14277658423319 * AcceptedCmp50  +     0.07414319423679 * 
        Complain0  +    -0.05210282033436 * HigherEducationBinary0 ;
   H13  = H13  +     0.00232895100278 * AcceptedCmp10
          +    -0.17245793714966 * AcceptedCmp20  +     0.22300285586606 * 
        AcceptedCmp30  +     0.02667629114587 * AcceptedCmp40
          +    -0.08909727736989 * AcceptedCmp50  +     0.33169373470586 * 
        Complain0  +     0.30446475173693 * HigherEducationBinary0 ;
   H14  = H14  +    -0.47820584762363 * AcceptedCmp10
          +     0.03654006761759 * AcceptedCmp20  +    -0.20965167013319 * 
        AcceptedCmp30  +    -0.13396151443119 * AcceptedCmp40
          +    -1.12947244187955 * AcceptedCmp50  +     0.01007973582648 * 
        Complain0  +    -0.22975952148681 * HigherEducationBinary0 ;
   H11  = H11  +    -0.45165482916552 * Education2n_Cycle
          +     0.67730616273788 * EducationBasic  +    -0.51516495083024 * 
        EducationGraduation  +     0.43154054999649 * EducationMaster
          +    -0.91598027963019 * Marital_StatusDivorced
          +     0.99081987547846 * Marital_StatusMarried
          +    -1.39858900243332 * Marital_StatusSingle
          +       1.347741143103 * Marital_StatusTogether ;
   H12  = H12  +    -0.00189420846473 * Education2n_Cycle
          +    -0.20493655640888 * EducationBasic  +     0.02037300537072 * 
        EducationGraduation  +     0.01942778395804 * EducationMaster
          +     0.04148596239454 * Marital_StatusDivorced
          +     0.13700464357088 * Marital_StatusMarried
          +     0.26244943889586 * Marital_StatusSingle
          +    -0.01959556613989 * Marital_StatusTogether ;
   H13  = H13  +    -0.08424648072756 * Education2n_Cycle
          +    -0.03519553916539 * EducationBasic  +    -0.14733534752496 * 
        EducationGraduation  +    -0.13923731176653 * EducationMaster
          +     0.21225188119775 * Marital_StatusDivorced
          +    -0.78447428711532 * Marital_StatusMarried
          +     0.40081668287631 * Marital_StatusSingle
          +    -0.47768802901346 * Marital_StatusTogether ;
   H14  = H14  +    -0.13077789963596 * Education2n_Cycle
          +    -0.04224059272723 * EducationBasic  +    -0.26064134779202 * 
        EducationGraduation  +     0.26637203274122 * EducationMaster
          +    -0.35332505424842 * Marital_StatusDivorced
          +    -0.23139833132219 * Marital_StatusMarried
          +    -0.06980598315267 * Marital_StatusSingle
          +     0.08689807740885 * Marital_StatusTogether ;
   H11  =    -0.03502284610962 + H11 ;
   H12  =    -1.33013445020225 + H12 ;
   H13  =    -1.70772581209165 + H13 ;
   H14  =    -0.77238092213725 + H14 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -4.10527116293157 * H11  +    -0.50563319025675 * H12
          +    -1.37794943679966 * H13  +     3.57492661052202 * H14 ;
   P_DepVar1  =     -2.7093416265681 + P_DepVar1 ;
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
