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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

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
*** Writing the Node interval ;
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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 * 
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 * 
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.16786131610493 * S_AcceptedCmpTotal
          +     0.08150129707008 * S_Age  +    -0.00076335149511 * S_Frq
          +     2.37648351383272 * S_Income  +    -1.63260278456818 * 
        S_Kidhome  +     -0.6720941090663 * S_Mnt  +    -0.03176174297509 * 
        S_MntFishProducts  +    -0.03796990721617 * S_MntFruits
          +    -0.17020485447842 * S_MntGoldProds  +      0.7709093878281 * 
        S_MntMeatProducts  +    -0.26168538456938 * S_MntSweetProducts
          +    -1.36275284328546 * S_MntWines  +    -0.30344694826738 * 
        S_MonthsAsCustomer  +     1.68662611500615 * S_NumCatalogPurchases
          +     1.32037113020393 * S_NumDealsPurchases
          +     0.42879249227132 * S_NumDistPurchases
          +    -0.89190172778783 * S_NumStorePurchases
          +    -0.87975442613962 * S_NumWebPurchases
          +     2.98977282825831 * S_NumWebVisitsMonth
          +     0.16388418187981 * S_RFMstat  +     0.63858980984599 * 
        S_RMntFrq  +    -2.53833222281652 * S_Recency
          +    -2.72141665283523 * S_Teenhome ;
   H1x1_2  =    -1.16140709294501 * S_AcceptedCmpTotal
          +    -0.87210661607894 * S_Age  +    -0.15365607228782 * S_Frq
          +    -1.14855351318782 * S_Income  +     -0.3792851632462 * 
        S_Kidhome  +    -1.20412080219233 * S_Mnt  +     0.98615533034973 * 
        S_MntFishProducts  +     0.44541456963703 * S_MntFruits
          +    -0.86465923336111 * S_MntGoldProds  +    -5.15063925950455 * 
        S_MntMeatProducts  +     0.54937255903381 * S_MntSweetProducts
          +      1.1566197343428 * S_MntWines  +     1.05956341559861 * 
        S_MonthsAsCustomer  +    -1.51353620179805 * S_NumCatalogPurchases
          +    -1.16737670931605 * S_NumDealsPurchases
          +     0.08205195039242 * S_NumDistPurchases
          +    -0.65367044520084 * S_NumStorePurchases
          +     2.39693083674757 * S_NumWebPurchases
          +     0.18432526469897 * S_NumWebVisitsMonth
          +    -0.81660690569703 * S_RFMstat  +      0.2679378370467 * 
        S_RMntFrq  +    -0.12214066685673 * S_Recency
          +     1.80138107382539 * S_Teenhome ;
   H1x1_3  =      2.0905555295419 * S_AcceptedCmpTotal
          +    -0.23515107640805 * S_Age  +    -0.34980320997139 * S_Frq
          +     0.96612788543649 * S_Income  +    -0.57035066115881 * 
        S_Kidhome  +     0.22762934410578 * S_Mnt  +    -0.52536382903021 * 
        S_MntFishProducts  +    -1.18451511831956 * S_MntFruits
          +     0.15600368092559 * S_MntGoldProds  +     2.66964572205551 * 
        S_MntMeatProducts  +    -0.66381928008493 * S_MntSweetProducts
          +    -1.34669953562975 * S_MntWines  +     1.35404821514849 * 
        S_MonthsAsCustomer  +     1.74839628716461 * S_NumCatalogPurchases
          +     0.76616480025024 * S_NumDealsPurchases
          +     0.42823368706255 * S_NumDistPurchases
          +    -1.16998364854907 * S_NumStorePurchases
          +     -1.0841896541746 * S_NumWebPurchases
          +     2.74837744375079 * S_NumWebVisitsMonth
          +    -0.12893804494501 * S_RFMstat  +    -0.62922223536042 * 
        S_RMntFrq  +    -5.13438280616518 * S_Recency
          +    -0.03717013845941 * S_Teenhome ;
   H1x1_4  =     0.00721395593412 * S_AcceptedCmpTotal
          +    -0.01540387767211 * S_Age  +    -0.84860703860633 * S_Frq
          +    -1.02288627805121 * S_Income  +    -1.09101870516967 * 
        S_Kidhome  +    -0.49364597366691 * S_Mnt  +    -0.46832600024559 * 
        S_MntFishProducts  +     0.18419647776638 * S_MntFruits
          +     0.08548650236624 * S_MntGoldProds  +      3.4353205628246 * 
        S_MntMeatProducts  +    -0.34836704949861 * S_MntSweetProducts
          +    -2.43294028965601 * S_MntWines  +       -0.52018014955 * 
        S_MonthsAsCustomer  +     0.64700842330282 * S_NumCatalogPurchases
          +     0.78421010501058 * S_NumDealsPurchases
          +     0.01075885160671 * S_NumDistPurchases
          +    -1.99395040717832 * S_NumStorePurchases
          +    -1.02908330834262 * S_NumWebPurchases
          +     2.79163466516477 * S_NumWebVisitsMonth
          +    -0.02537920152644 * S_RFMstat  +    -0.42457000565561 * 
        S_RMntFrq  +     -2.0907247135068 * S_Recency
          +     0.74119954026621 * S_Teenhome ;
   H1x1_5  =    -1.61701205426558 * S_AcceptedCmpTotal
          +     0.08257295395479 * S_Age  +    -0.68185680658717 * S_Frq
          +    -1.39465125759406 * S_Income  +    -1.25029109577242 * 
        S_Kidhome  +    -1.09090107886966 * S_Mnt  +     1.64350195586938 * 
        S_MntFishProducts  +      0.5087421773332 * S_MntFruits
          +      0.4047616469084 * S_MntGoldProds  +    -7.16241250715453 * 
        S_MntMeatProducts  +    -0.92562420397097 * S_MntSweetProducts
          +     1.87307481667927 * S_MntWines  +    -0.53417946416471 * 
        S_MonthsAsCustomer  +    -1.53123660652072 * S_NumCatalogPurchases
          +    -1.04219068390022 * S_NumDealsPurchases
          +    -0.45770204483973 * S_NumDistPurchases
          +    -0.04941442229195 * S_NumStorePurchases
          +     0.67187353161183 * S_NumWebPurchases
          +     2.01907760553871 * S_NumWebVisitsMonth
          +    -1.68329765100269 * S_RFMstat  +     0.29244142334331 * 
        S_RMntFrq  +    -1.12913051410394 * S_Recency
          +     0.43082751824484 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.44646416045725 * AcceptedCmp10
          +    -0.51992887099168 * AcceptedCmp20  +    -1.12974688442196 * 
        AcceptedCmp30  +    -0.25247614927616 * AcceptedCmp40
          +     -1.0839587453165 * AcceptedCmp50  +    -0.37542128912082 * 
        Complain0  +     0.50509109375746 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     1.41785862418118 * AcceptedCmp10
          +     0.14869386732553 * AcceptedCmp20  +    -0.34292007253529 * 
        AcceptedCmp30  +    -0.46450669830265 * AcceptedCmp40
          +    -0.84675597945703 * AcceptedCmp50  +     -0.0664649548734 * 
        Complain0  +    -0.45532665777266 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.77549230890552 * AcceptedCmp10
          +    -1.36005205352388 * AcceptedCmp20  +    -0.77268925112364 * 
        AcceptedCmp30  +    -1.48651970256564 * AcceptedCmp40
          +    -1.49771960438108 * AcceptedCmp50  +     0.05855673938529 * 
        Complain0  +      0.5650947463497 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.67577364181798 * AcceptedCmp10
          +    -0.90920539880387 * AcceptedCmp20  +    -0.10856872028934 * 
        AcceptedCmp30  +    -0.17408320421731 * AcceptedCmp40
          +    -0.40718112138881 * AcceptedCmp50  +    -1.15772819875829 * 
        Complain0  +    -0.63688652305256 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +      -0.257461635853 * AcceptedCmp10
          +    -0.53931888306725 * AcceptedCmp20  +    -0.18314917937273 * 
        AcceptedCmp30  +    -0.63373606551928 * AcceptedCmp40
          +    -0.22117496766649 * AcceptedCmp50  +    -0.96313784449205 * 
        Complain0  +    -0.42031825118642 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.61947659516101 * Education2n_Cycle
          +     0.35542867116569 * EducationBasic  +    -0.40115062807285 * 
        EducationGraduation  +     0.09596442360106 * EducationMaster
          +     2.58907527032049 * Marital_StatusDivorced
          +    -2.45549008158921 * Marital_StatusMarried
          +     2.56223650840768 * Marital_StatusSingle
          +    -2.57680442835747 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.89996232033524 * Education2n_Cycle
          +     0.51901949778729 * EducationBasic  +     0.48428543845596 * 
        EducationGraduation  +     0.29249899969052 * EducationMaster
          +     0.83917299191368 * Marital_StatusDivorced
          +    -0.62624692699191 * Marital_StatusMarried
          +    -0.22585060624911 * Marital_StatusSingle
          +    -1.13600554287291 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.14267095105584 * Education2n_Cycle
          +    -0.02301358792856 * EducationBasic  +     0.52040244367562 * 
        EducationGraduation  +     -1.3163356801876 * EducationMaster
          +    -0.65063506696715 * Marital_StatusDivorced
          +    -2.37495865381256 * Marital_StatusMarried
          +    -0.54954654146904 * Marital_StatusSingle
          +    -2.20184943463859 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.07824072331908 * Education2n_Cycle
          +    -0.70728597193571 * EducationBasic  +    -0.08522817414387 * 
        EducationGraduation  +     0.07916018399549 * EducationMaster
          +     0.16185824798364 * Marital_StatusDivorced
          +    -0.08142416735136 * Marital_StatusMarried
          +    -0.20392270385969 * Marital_StatusSingle
          +    -0.16702436233017 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.24374540557838 * Education2n_Cycle
          +    -0.69820143786999 * EducationBasic  +    -0.60198982003005 * 
        EducationGraduation  +     0.28107355175103 * EducationMaster
          +      -0.516522631078 * Marital_StatusDivorced
          +    -0.61661247789976 * Marital_StatusMarried
          +    -0.99533130308294 * Marital_StatusSingle
          +    -0.36897004084592 * Marital_StatusTogether ;
   H1x1_1  =    -2.48464133714558 + H1x1_1 ;
   H1x1_2  =    -1.27353840480002 + H1x1_2 ;
   H1x1_3  =    -1.74000879961851 + H1x1_3 ;
   H1x1_4  =    -0.38838285632991 + H1x1_4 ;
   H1x1_5  =    -0.14124488553728 + H1x1_5 ;
   H1x1_6  = 0; 
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 );
   _SUM_ = 0.; 
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_5  = EXP(H1x1_5  - _MAX_);
   _SUM_ = _SUM_ + H1x1_5 ;
   H1x1_6  = EXP(H1x1_6  - _MAX_);
   _SUM_ = _SUM_ + H1x1_6 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.48404108721156 * S_AcceptedCmpTotal
          +    -0.27070568741648 * S_Age  +    -0.78729393257177 * S_Frq
          +    -0.22841203379079 * S_Income  +      1.7948359601764 * 
        S_Kidhome  +     0.16415271082275 * S_Mnt  +     0.68709045116477 * 
        S_MntFishProducts  +     1.40499150479431 * S_MntFruits
          +     1.76690927096327 * S_MntGoldProds  +    -0.47805967324795 * 
        S_MntMeatProducts  +    -1.98462171861386 * S_MntSweetProducts
          +     0.17732042205332 * S_MntWines  +    -2.68647979937092 * 
        S_MonthsAsCustomer  +     0.66724634672152 * S_NumCatalogPurchases
          +    -0.03801022287706 * S_NumDealsPurchases
          +    -1.50723574966419 * S_NumDistPurchases
          +    -0.21514545448485 * S_NumStorePurchases
          +    -0.50179555233865 * S_NumWebPurchases
          +    -0.68226572560161 * S_NumWebVisitsMonth
          +    -1.16287961930374 * S_RFMstat  +    -0.10835316604382 * 
        S_RMntFrq  +     0.78178939203913 * S_Recency
          +     0.99430928489958 * S_Teenhome ;
   H1x2_2  =    -0.36352858735119 * S_AcceptedCmpTotal
          +    -0.57224467079409 * S_Age  +    -1.50170848997829 * S_Frq
          +    -0.38902839025885 * S_Income  +     -1.1798795668612 * 
        S_Kidhome  +     -0.1290183198617 * S_Mnt  +     0.76723261406072 * 
        S_MntFishProducts  +     -0.2940014517298 * S_MntFruits
          +     1.10823983171432 * S_MntGoldProds  +    -0.31483479967732 * 
        S_MntMeatProducts  +     1.52044892546638 * S_MntSweetProducts
          +     0.93667207634948 * S_MntWines  +     1.38654947651763 * 
        S_MonthsAsCustomer  +     0.60618457384701 * S_NumCatalogPurchases
          +     0.70551335536975 * S_NumDealsPurchases
          +     0.02824488988803 * S_NumDistPurchases
          +    -0.47958123842808 * S_NumStorePurchases
          +     1.04559003239583 * S_NumWebPurchases
          +    -0.58386087813772 * S_NumWebVisitsMonth
          +     0.30550498646512 * S_RFMstat  +     0.30157778523343 * 
        S_RMntFrq  +    -0.05848082255965 * S_Recency
          +     1.93017367885145 * S_Teenhome ;
   H1x2_3  =    -1.42573562358231 * S_AcceptedCmpTotal
          +    -1.32139459670271 * S_Age  +    -0.65089374259133 * S_Frq
          +     0.40762251828155 * S_Income  +     0.07844400105703 * 
        S_Kidhome  +     0.50965373569965 * S_Mnt  +     0.16029734923155 * 
        S_MntFishProducts  +     0.09920766855666 * S_MntFruits
          +     1.72613699296152 * S_MntGoldProds  +    -0.05634715837952 * 
        S_MntMeatProducts  +    -0.46288044931269 * S_MntSweetProducts
          +    -1.56275217321856 * S_MntWines  +     0.47573724745363 * 
        S_MonthsAsCustomer  +     0.24362096681468 * S_NumCatalogPurchases
          +    -0.28907339261907 * S_NumDealsPurchases
          +     0.04310505858352 * S_NumDistPurchases
          +    -0.99594604666889 * S_NumStorePurchases
          +    -0.58870940220114 * S_NumWebPurchases
          +     0.84018399925148 * S_NumWebVisitsMonth
          +    -0.19517311010454 * S_RFMstat  +     -0.3463233802461 * 
        S_RMntFrq  +    -1.47730936960999 * S_Recency
          +    -0.88597688046705 * S_Teenhome ;
   H1x2_4  =     0.11016580381662 * S_AcceptedCmpTotal
          +     0.30908576425954 * S_Age  +     0.34179480828109 * S_Frq
          +     0.40584056795753 * S_Income  +    -0.45712899846476 * 
        S_Kidhome  +     1.12080510316382 * S_Mnt  +     0.48988466623601 * 
        S_MntFishProducts  +    -0.33589219598754 * S_MntFruits
          +     0.89305356089927 * S_MntGoldProds  +    -2.00512215642683 * 
        S_MntMeatProducts  +     1.10859074670332 * S_MntSweetProducts
          +     -1.0064133988839 * S_MntWines  +      0.7768603559605 * 
        S_MonthsAsCustomer  +     0.97922554259242 * S_NumCatalogPurchases
          +     0.52917289878604 * S_NumDealsPurchases
          +     0.30974142545809 * S_NumDistPurchases
          +    -0.36081450643799 * S_NumStorePurchases
          +    -0.28418053386759 * S_NumWebPurchases
          +    -0.80759462497096 * S_NumWebVisitsMonth
          +    -1.12633439579018 * S_RFMstat  +    -0.14662678398603 * 
        S_RMntFrq  +    -0.02418118976368 * S_Recency
          +    -0.46548253671298 * S_Teenhome ;
   H1x2_5  =    -0.55551536908819 * S_AcceptedCmpTotal
          +    -0.09163465220674 * S_Age  +    -0.35937602626275 * S_Frq
          +     0.61145646041534 * S_Income  +     0.28920493959955 * 
        S_Kidhome  +     0.71661843805688 * S_Mnt  +     0.25254041554237 * 
        S_MntFishProducts  +    -0.38704785732563 * S_MntFruits
          +    -0.16912995068939 * S_MntGoldProds  +     0.21440191729631 * 
        S_MntMeatProducts  +    -0.49507693220329 * S_MntSweetProducts
          +      0.3153765288287 * S_MntWines  +    -0.15329574285112 * 
        S_MonthsAsCustomer  +     1.28722879296429 * S_NumCatalogPurchases
          +    -0.47500053723253 * S_NumDealsPurchases
          +     0.41421086319635 * S_NumDistPurchases
          +     0.69664835428137 * S_NumStorePurchases
          +     0.66359306812968 * S_NumWebPurchases
          +     0.77931462528741 * S_NumWebVisitsMonth
          +     0.05868786291548 * S_RFMstat  +     0.77672802649379 * 
        S_RMntFrq  +    -1.91226042675868 * S_Recency
          +     1.79227856637688 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     1.13471289065691 * AcceptedCmp10
          +     0.65974383309652 * AcceptedCmp20  +    -1.87292531678796 * 
        AcceptedCmp30  +      -1.353797047409 * AcceptedCmp40
          +     0.20616786486771 * AcceptedCmp50  +    -0.38264326101775 * 
        Complain0  +    -0.17807638061615 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.21347348622419 * AcceptedCmp10
          +    -0.25372740217388 * AcceptedCmp20  +     1.86937589112006 * 
        AcceptedCmp30  +    -0.04754722838516 * AcceptedCmp40
          +    -0.08078800460742 * AcceptedCmp50  +     1.62387969342769 * 
        Complain0  +    -0.78004732229344 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +    -0.02152665189186 * AcceptedCmp10
          +     0.57207081192818 * AcceptedCmp20  +      0.6212177562119 * 
        AcceptedCmp30  +    -0.73691462528053 * AcceptedCmp40
          +    -0.35326427815838 * AcceptedCmp50  +     0.14875513793176 * 
        Complain0  +    -0.13978395235915 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     0.87315450122595 * AcceptedCmp10
          +      0.7868322457627 * AcceptedCmp20  +    -0.23332719513906 * 
        AcceptedCmp30  +    -0.68817918979928 * AcceptedCmp40
          +    -0.57204462412445 * AcceptedCmp50  +    -0.86223238269616 * 
        Complain0  +     -0.3126348645458 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     0.29282165496733 * AcceptedCmp10
          +     1.51708756092369 * AcceptedCmp20  +     1.20268215158483 * 
        AcceptedCmp30  +     0.30521477351547 * AcceptedCmp40
          +    -0.58691162701837 * AcceptedCmp50  +     0.75641665624817 * 
        Complain0  +      0.7018761099345 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.68955031483686 * Education2n_Cycle
          +    -1.63162976419312 * EducationBasic  +     1.58569020932253 * 
        EducationGraduation  +     0.89392741557091 * EducationMaster
          +    -1.34742914042312 * Marital_StatusDivorced
          +    -0.75378934918763 * Marital_StatusMarried
          +    -1.85411678929217 * Marital_StatusSingle
          +     0.34579160965376 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.91842441316819 * Education2n_Cycle
          +    -0.10372785737624 * EducationBasic  +     1.79022097342125 * 
        EducationGraduation  +      1.4602485898642 * EducationMaster
          +     0.47958659206261 * Marital_StatusDivorced
          +     -0.9665584294045 * Marital_StatusMarried
          +      0.9733784530538 * Marital_StatusSingle
          +     0.19258101270915 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     1.26817216331303 * Education2n_Cycle
          +    -1.60153781162075 * EducationBasic  +    -0.32068567398782 * 
        EducationGraduation  +     1.49772418974753 * EducationMaster
          +    -0.56894207908284 * Marital_StatusDivorced
          +    -0.96715106987195 * Marital_StatusMarried
          +     1.18678144721443 * Marital_StatusSingle
          +     1.05940264255347 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +    -1.19824707240276 * Education2n_Cycle
          +     0.43905907692169 * EducationBasic  +    -1.18279972023424 * 
        EducationGraduation  +    -2.01250798855133 * EducationMaster
          +     -0.6061959224661 * Marital_StatusDivorced
          +     0.03495844244684 * Marital_StatusMarried
          +    -0.63896361063244 * Marital_StatusSingle
          +     0.74357887057422 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     -0.6530237200396 * Education2n_Cycle
          +     0.90062473169279 * EducationBasic  +    -3.01933913602199 * 
        EducationGraduation  +     -0.1598988619204 * EducationMaster
          +     0.82178907301319 * Marital_StatusDivorced
          +     1.69543553114589 * Marital_StatusMarried
          +     -2.1272067363559 * Marital_StatusSingle
          +     0.24274508474634 * Marital_StatusTogether ;
   H1x2_1  =     0.30842509451224 + H1x2_1 ;
   H1x2_2  =     1.79200699407075 + H1x2_2 ;
   H1x2_3  =     0.66706944906809 + H1x2_3 ;
   H1x2_4  =     -0.7356254138015 + H1x2_4 ;
   H1x2_5  =    -0.68066575174095 + H1x2_5 ;
   H1x2_6  = 0; 
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 );
   _SUM_ = 0.; 
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_5  = EXP(H1x2_5  - _MAX_);
   _SUM_ = _SUM_ + H1x2_5 ;
   H1x2_6  = EXP(H1x2_6  - _MAX_);
   _SUM_ = _SUM_ + H1x2_6 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =      0.7656278374321 * H1x1_1  +     1.18988619460831 * H1x1_2
          +    -0.68458045558713 * H1x1_3  +     0.49093980591245 * H1x1_4
          +    -1.27959429919804 * H1x1_5  +    -1.38760297105319 * H1x1_6 ;
   H2x1_2  =    -1.48941810274544 * H1x1_1  +     1.75443095464294 * H1x1_2
          +    -1.63478694878031 * H1x1_3  +    -0.69296364459258 * H1x1_4
          +     3.14007823471691 * H1x1_5  +     2.71965753640902 * H1x1_6 ;
   H2x1_3  =     1.07426996100463 * H1x1_1  +    -1.76796943416489 * H1x1_2
          +    -0.11946940948224 * H1x1_3  +     1.25457449221991 * H1x1_4
          +     -1.4079980040852 * H1x1_5  +    -0.94725163293394 * H1x1_6 ;
   H2x1_4  =    -0.00078893231548 * H1x1_1  +     0.06396324179717 * H1x1_2
          +    -0.13674165204668 * H1x1_3  +    -0.26576379023249 * H1x1_4
          +     0.44513643867194 * H1x1_5  +     0.66585878141635 * H1x1_6 ;
   H2x1_5  =     -2.8467581879118 * H1x1_1  +     2.94182061339515 * H1x1_2
          +    -3.43021438685063 * H1x1_3  +    -4.00045607730935 * H1x1_4
          +     3.09230566797337 * H1x1_5  +     3.57592566919388 * H1x1_6 ;
   H2x1_6  =    -0.29912975132561 * H1x1_1  +     0.25554634262501 * H1x1_2
          +    -0.62666868576544 * H1x1_3  +     1.54567563696489 * H1x1_4
          +     1.87530466579189 * H1x1_5  +    -0.32006241006585 * H1x1_6 ;
   H2x1_1  = H2x1_1  +    -0.53923803948063 * H1x2_1
          +    -0.14551996067575 * H1x2_2  +     1.15730137448351 * H1x2_3
          +     0.02585401686791 * H1x2_4  +     -0.9274056409194 * H1x2_5
          +    -0.07237646966438 * H1x2_6 ;
   H2x1_2  = H2x1_2  +     -0.1441321293455 * H1x2_1
          +    -0.53271770203833 * H1x2_2  +    -2.80064282115477 * H1x2_3
          +    -1.05759395901612 * H1x2_4  +    -0.55127059339304 * H1x2_5
          +     0.35471332651631 * H1x2_6 ;
   H2x1_3  = H2x1_3  +     -0.5351190580444 * H1x2_1
          +    -0.02107048725988 * H1x2_2  +    -0.83389437376968 * H1x2_3
          +    -0.80183937400902 * H1x2_4  +    -0.66588385104453 * H1x2_5
          +      0.5218140468737 * H1x2_6 ;
   H2x1_4  = H2x1_4  +     1.89050022127485 * H1x2_1
          +     -2.6557601537516 * H1x2_2  +     0.99126360053411 * H1x2_3
          +    -0.44091776054792 * H1x2_4  +    -1.48547403065153 * H1x2_5
          +    -0.67920869444907 * H1x2_6 ;
   H2x1_5  = H2x1_5  +      0.2827883572995 * H1x2_1
          +    -0.68177519072226 * H1x2_2  +    -1.62062483607713 * H1x2_3
          +     0.24454579481466 * H1x2_4  +    -0.07591553404219 * H1x2_5
          +      1.1175989027563 * H1x2_6 ;
   H2x1_6  = H2x1_6  +    -0.00603649892235 * H1x2_1
          +    -1.39053357060307 * H1x2_2  +    -1.34023350990878 * H1x2_3
          +    -0.76811804565852 * H1x2_4  +    -1.40869786147662 * H1x2_5
          +     1.54589390085972 * H1x2_6 ;
   H2x1_1  =     0.47873396703524 + H2x1_1 ;
   H2x1_2  =     -0.0000340630035 + H2x1_2 ;
   H2x1_3  =     0.35556259592214 + H2x1_3 ;
   H2x1_4  =     1.01896219314016 + H2x1_4 ;
   H2x1_5  =     0.72195082860145 + H2x1_5 ;
   H2x1_6  =     0.24171639764515 + H2x1_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
   H2x1_6  = 1.0 / (1.0 + EXP(MIN( - H2x1_6 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     7.13056975005701 * H2x1_1  +    -9.26714696465882 * H2x1_2
          +     9.36351037194964 * H2x1_3  +     2.76582940055979 * H2x1_4
          +    -20.1354182036801 * H2x1_5  +     1.54726164498938 * H2x1_6 ;
   P_DepVar1  =     5.03726079820845 + P_DepVar1 ;
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
