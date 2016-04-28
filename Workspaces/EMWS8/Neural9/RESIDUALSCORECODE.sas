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

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   H11  =     0.17501563716249 * S_AcceptedCmpTotal  +    -0.36554114449053 * 
        S_Age  +    -0.38580134783102 * S_Frq  +    -0.21908382657217 * 
        S_Income  +    -0.07407502089271 * S_Kidhome
          +     0.12840196100631 * S_Mnt  +     0.03929964535457 * 
        S_MntFishProducts  +    -0.07747223779114 * S_MntFruits
          +     0.06367041786619 * S_MntGoldProds  +     0.97858536127159 * 
        S_MntMeatProducts  +     -0.2631541253916 * S_MntSweetProducts
          +    -0.21009967468315 * S_MntWines  +     0.01772965748746 * 
        S_MonthsAsCustomer  +     0.43689279156654 * S_NumCatalogPurchases
          +     0.85324794786604 * S_NumDealsPurchases
          +     0.23632583007911 * S_NumDistPurchases
          +    -0.63089078988761 * S_NumStorePurchases
          +    -0.92352748602374 * S_NumWebPurchases
          +     0.90081938176641 * S_NumWebVisitsMonth
          +     0.42330049584845 * S_RFMstat  +     0.02105180951094 * 
        S_RMntFrq  +    -0.84474450609256 * S_Recency
          +     0.18914162652023 * S_Teenhome ;
   H12  =     0.55034639645204 * S_AcceptedCmpTotal  +     0.09306745130673 * 
        S_Age  +    -0.38144414546432 * S_Frq  +     0.39346487803525 * 
        S_Income  +    -0.46092998969912 * S_Kidhome
          +    -0.21419775022567 * S_Mnt  +     -0.1419038030075 * 
        S_MntFishProducts  +    -0.15086475751383 * S_MntFruits
          +    -0.10895314995081 * S_MntGoldProds  +     0.54340688178323 * 
        S_MntMeatProducts  +     0.02370277071375 * S_MntSweetProducts
          +    -0.36083928148144 * S_MntWines  +    -0.09471203372244 * 
        S_MonthsAsCustomer  +     0.35874170593009 * S_NumCatalogPurchases
          +     0.19685325076814 * S_NumDealsPurchases
          +     -0.0145000015739 * S_NumDistPurchases
          +     -0.5790386407956 * S_NumStorePurchases
          +    -0.36258404984745 * S_NumWebPurchases
          +     0.85107574614775 * S_NumWebVisitsMonth
          +     0.00898383307287 * S_RFMstat  +    -0.09672451639577 * 
        S_RMntFrq  +     -0.7907561263466 * S_Recency
          +    -0.34901055038946 * S_Teenhome ;
   H13  =     0.06080099463512 * S_AcceptedCmpTotal  +    -0.35825472239366 * 
        S_Age  +    -0.01087502010135 * S_Frq  +    -0.29478705368425 * 
        S_Income  +    -0.03273972934545 * S_Kidhome
          +    -0.13622677356361 * S_Mnt  +     0.18060273292985 * 
        S_MntFishProducts  +     0.11972433239232 * S_MntFruits
          +    -0.03986660643959 * S_MntGoldProds  +     0.15555612346447 * 
        S_MntMeatProducts  +      0.4343662861634 * S_MntSweetProducts
          +     0.03013514085559 * S_MntWines  +     0.05644710625745 * 
        S_MonthsAsCustomer  +     -0.2306050975257 * S_NumCatalogPurchases
          +    -0.17268337796364 * S_NumDealsPurchases
          +    -0.23588860225052 * S_NumDistPurchases
          +     0.41380073293559 * S_NumStorePurchases
          +    -0.28143763726207 * S_NumWebPurchases
          +    -0.30914618130297 * S_NumWebVisitsMonth
          +     -0.4714998087492 * S_RFMstat  +    -0.00966743749996 * 
        S_RMntFrq  +     0.81671444530655 * S_Recency
          +    -0.05979541602822 * S_Teenhome ;
   H14  =     0.02236165555251 * S_AcceptedCmpTotal  +     0.05878714073281 * 
        S_Age  +      0.0220418507559 * S_Frq  +    -0.46976280127461 * 
        S_Income  +    -0.06518326597517 * S_Kidhome
          +     0.01561710446128 * S_Mnt  +    -0.19888119617767 * 
        S_MntFishProducts  +    -0.11099637502315 * S_MntFruits
          +     -0.1633241343451 * S_MntGoldProds  +    -0.65560791277244 * 
        S_MntMeatProducts  +     0.08426248977242 * S_MntSweetProducts
          +     0.40538193250283 * S_MntWines  +     0.29709872876156 * 
        S_MonthsAsCustomer  +    -0.64274287388323 * S_NumCatalogPurchases
          +    -0.46119515763011 * S_NumDealsPurchases
          +     0.16268822540635 * S_NumDistPurchases
          +     0.21653483412929 * S_NumStorePurchases
          +     0.46040401497854 * S_NumWebPurchases
          +     -0.7361096668674 * S_NumWebVisitsMonth
          +     0.21120270259957 * S_RFMstat  +    -0.01820419721495 * 
        S_RMntFrq  +     0.80628261349293 * S_Recency
          +     0.30269385840066 * S_Teenhome ;
   H15  =    -0.12213750739956 * S_AcceptedCmpTotal  +     0.11214050296975 * 
        S_Age  +    -0.30158163448762 * S_Frq  +    -0.65785861830444 * 
        S_Income  +     0.55328239552566 * S_Kidhome
          +    -0.10286828951896 * S_Mnt  +     0.02737244457507 * 
        S_MntFishProducts  +     0.06403371753368 * S_MntFruits
          +     0.03413466437505 * S_MntGoldProds  +    -0.54204197569301 * 
        S_MntMeatProducts  +     0.05510302269208 * S_MntSweetProducts
          +     0.19331185653379 * S_MntWines  +    -0.11275583865898 * 
        S_MonthsAsCustomer  +    -0.61166489373672 * S_NumCatalogPurchases
          +     0.05502131610199 * S_NumDealsPurchases
          +    -0.03756550292536 * S_NumDistPurchases
          +    -0.03538043876599 * S_NumStorePurchases
          +     -0.0907757250737 * S_NumWebPurchases
          +    -0.70112968521759 * S_NumWebVisitsMonth
          +    -0.14412513555959 * S_RFMstat  +     0.21884375840225 * 
        S_RMntFrq  +     0.94295210651466 * S_Recency
          +     0.35991330606304 * S_Teenhome ;
   H16  =    -0.36726728824296 * S_AcceptedCmpTotal  +     0.07460925934352 * 
        S_Age  +    -0.43562110547346 * S_Frq  +    -0.43221933529838 * 
        S_Income  +    -0.52750514886673 * S_Kidhome
          +    -0.26421661734492 * S_Mnt  +     0.14907990887311 * 
        S_MntFishProducts  +     0.04789588439327 * S_MntFruits
          +    -0.20961586241585 * S_MntGoldProds  +    -0.20758519587985 * 
        S_MntMeatProducts  +    -0.19867933143984 * S_MntSweetProducts
          +    -0.06534193060612 * S_MntWines  +    -0.23871571634661 * 
        S_MonthsAsCustomer  +    -0.53206950950203 * S_NumCatalogPurchases
          +    -0.50827570715861 * S_NumDealsPurchases
          +    -0.47409547329081 * S_NumDistPurchases
          +     0.18399962481918 * S_NumStorePurchases
          +     0.02681212324713 * S_NumWebPurchases
          +    -0.20824959103725 * S_NumWebVisitsMonth
          +    -0.06029410016837 * S_RFMstat  +    -0.10536519478033 * 
        S_RMntFrq  +     0.04705531474734 * S_Recency
          +    -0.11408993340011 * S_Teenhome ;
   H11  = H11  +    -0.77677369001519 * AcceptedCmp10
          +    -0.37032394781671 * AcceptedCmp20  +    -0.38832722412387 * 
        AcceptedCmp30  +    -0.55638306754435 * AcceptedCmp40
          +    -0.38440791029959 * AcceptedCmp50  +    -0.16406106118114 * 
        Complain0  +     0.13745408429927 * HigherEducationBinary0 ;
   H12  = H12  +    -0.05148686413458 * AcceptedCmp10
          +     0.05180152789051 * AcceptedCmp20  +    -0.19662622794776 * 
        AcceptedCmp30  +     -0.1585553643874 * AcceptedCmp40
          +    -0.27247887239746 * AcceptedCmp50  +     0.04624249285151 * 
        Complain0  +     0.00785440028495 * HigherEducationBinary0 ;
   H13  = H13  +     0.21037041808208 * AcceptedCmp10
          +     0.06300544912729 * AcceptedCmp20  +      0.2031627989618 * 
        AcceptedCmp30  +    -0.16684085233007 * AcceptedCmp40
          +      0.0625549638503 * AcceptedCmp50  +     0.08211834732664 * 
        Complain0  +     0.41790682924235 * HigherEducationBinary0 ;
   H14  = H14  +    -0.22633896297555 * AcceptedCmp10
          +     0.08566230730475 * AcceptedCmp20  +     0.22438004167873 * 
        AcceptedCmp30  +    -0.34844091963496 * AcceptedCmp40
          +      0.2256378657623 * AcceptedCmp50  +    -0.04877442051049 * 
        Complain0  +     0.06991776072868 * HigherEducationBinary0 ;
   H15  = H15  +     0.41157678374445 * AcceptedCmp10
          +     0.54458379988837 * AcceptedCmp20  +     0.36562464175733 * 
        AcceptedCmp30  +     0.42967664754272 * AcceptedCmp40
          +     0.29503069209148 * AcceptedCmp50  +     0.22816514842206 * 
        Complain0  +    -0.21688291139263 * HigherEducationBinary0 ;
   H16  = H16  +     0.19407195798819 * AcceptedCmp10
          +     0.04247364390054 * AcceptedCmp20  +     0.08274248135062 * 
        AcceptedCmp30  +    -0.03914341230116 * AcceptedCmp40
          +     0.21624329471544 * AcceptedCmp50  +     0.10868032675538 * 
        Complain0  +     0.53913868676285 * HigherEducationBinary0 ;
   H11  = H11  +    -0.10818997830847 * Education2n_Cycle
          +    -0.06250860766324 * EducationBasic  +       0.082321310702 * 
        EducationGraduation  +     0.02690714866809 * EducationMaster
          +      0.1401475547652 * Marital_StatusDivorced
          +     0.09801106519846 * Marital_StatusMarried
          +    -0.26003432053167 * Marital_StatusSingle
          +     0.01618123849583 * Marital_StatusTogether ;
   H12  = H12  +     0.03962548410357 * Education2n_Cycle
          +    -0.26452735705222 * EducationBasic  +     0.20050085174927 * 
        EducationGraduation  +     -0.0582668884993 * EducationMaster
          +     0.33965651292585 * Marital_StatusDivorced
          +    -0.51738607463653 * Marital_StatusMarried
          +     0.57209809625866 * Marital_StatusSingle
          +    -0.44546779779432 * Marital_StatusTogether ;
   H13  = H13  +     0.01128025797292 * Education2n_Cycle
          +      0.2331829736493 * EducationBasic  +    -0.21365797510985 * 
        EducationGraduation  +     -0.0762564849741 * EducationMaster
          +     -0.0712692029901 * Marital_StatusDivorced
          +      0.2989539150548 * Marital_StatusMarried
          +    -0.07088797938783 * Marital_StatusSingle
          +     0.16185370186238 * Marital_StatusTogether ;
   H14  = H14  +     -0.2070379700286 * Education2n_Cycle
          +    -0.01037898928967 * EducationBasic  +     0.15025928327392 * 
        EducationGraduation  +    -0.01705681126182 * EducationMaster
          +    -0.06075465978816 * Marital_StatusDivorced
          +     0.23328087967095 * Marital_StatusMarried
          +    -0.34401062494093 * Marital_StatusSingle
          +     0.53078479431088 * Marital_StatusTogether ;
   H15  = H15  +     0.02459175230987 * Education2n_Cycle
          +     -0.4108033280498 * EducationBasic  +     0.20104265551967 * 
        EducationGraduation  +     0.36213037498234 * EducationMaster
          +    -0.07312045395545 * Marital_StatusDivorced
          +     1.08247738273721 * Marital_StatusMarried
          +    -0.68676298741916 * Marital_StatusSingle
          +     0.62203169255788 * Marital_StatusTogether ;
   H16  = H16  +    -0.18585334310939 * Education2n_Cycle
          +    -0.23205958818402 * EducationBasic  +    -0.13603377834078 * 
        EducationGraduation  +    -0.11419275271029 * EducationMaster
          +    -0.20451618892357 * Marital_StatusDivorced
          +    -0.41145969312049 * Marital_StatusMarried
          +     0.44568613045702 * Marital_StatusSingle
          +    -0.24768465153678 * Marital_StatusTogether ;
   H11  =    -0.04019762461382 + H11 ;
   H12  =     0.36549512230095 + H12 ;
   H13  =    -1.38204627706606 + H13 ;
   H14  =     1.38298399879632 + H14 ;
   H15  =     0.90313152481164 + H15 ;
   H16  =     -2.1000519329276 + H16 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
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
   P_DepVar1  =     1.88165923386255 * H11  +     2.52776524502163 * H12
          +    -1.77389131292532 * H13  +    -1.81244588070617 * H14
          +    -2.95309978013668 * H15  +    -2.05211179893121 * H16 ;
   P_DepVar1  =    -2.12016790420361 + P_DepVar1 ;
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
