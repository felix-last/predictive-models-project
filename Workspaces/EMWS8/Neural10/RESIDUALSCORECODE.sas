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

      label H17 = 'Hidden: H1=7' ;

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
   S_MonthsAsCustomer  =    -4.92768414840297 +     0.05901745637787 * 
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
   ELSE S_MonthsAsCustomer  =    -4.92768414840297 +     0.05901745637787 * 
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
   H11  =    -0.52904974622826 * S_AcceptedCmpTotal  +    -0.20085204286633 * 
        S_Age  +     0.27263192457895 * S_Frq  +    -0.13124051139098 * 
        S_Income  +    -0.43070069114587 * S_Kidhome
          +     0.04042751562548 * S_Mnt  +     0.38295925040888 * 
        S_MntFishProducts  +    -0.04727298094677 * S_MntFruits
          +     -0.2266349260857 * S_MntGoldProds  +    -1.08008074034622 * 
        S_MntMeatProducts  +     0.03054296802806 * S_MntSweetProducts
          +     0.37563940714811 * S_MntWines  +     0.06275745445744 * 
        S_MonthsAsCustomer  +    -0.52327978028254 * S_NumCatalogPurchases
          +    -0.21858146166244 * S_NumDealsPurchases
          +     0.18409991080913 * S_NumDistPurchases
          +     0.35683163455594 * S_NumStorePurchases
          +     0.24429183714976 * S_NumWebPurchases
          +     -0.1263739191616 * S_NumWebVisitsMonth
          +    -0.25263656216606 * S_RFMstat  +    -0.14210230656146 * 
        S_RMntFrq  +      0.3452503815146 * S_Recency
          +     0.39191700774485 * S_Teenhome ;
   H12  =    -0.33531070327107 * S_AcceptedCmpTotal  +     0.13834284885787 * 
        S_Age  +     0.21191150830062 * S_Frq  +    -0.12928809774631 * 
        S_Income  +     0.24623934031778 * S_Kidhome
          +     0.47729973765863 * S_Mnt  +     0.02575407384014 * 
        S_MntFishProducts  +     0.04190479040514 * S_MntFruits
          +    -0.23088098149594 * S_MntGoldProds  +    -0.82239191276327 * 
        S_MntMeatProducts  +     0.13371979061174 * S_MntSweetProducts
          +     0.58743684755748 * S_MntWines  +     0.20341302032996 * 
        S_MonthsAsCustomer  +    -0.17695216321883 * S_NumCatalogPurchases
          +    -0.08125614129909 * S_NumDealsPurchases
          +     0.38003696656333 * S_NumDistPurchases
          +     0.22006494588298 * S_NumStorePurchases
          +     0.26217639358993 * S_NumWebPurchases
          +    -0.56905781005459 * S_NumWebVisitsMonth
          +    -0.13322776297975 * S_RFMstat  +     0.30014052185362 * 
        S_RMntFrq  +     0.33060213336674 * S_Recency
          +     0.23323216528048 * S_Teenhome ;
   H13  =    -0.62352511085341 * S_AcceptedCmpTotal  +    -0.10549202596489 * 
        S_Age  +     0.05953282210685 * S_Frq  +    -0.21981583872173 * 
        S_Income  +     0.18597632724783 * S_Kidhome
          +    -0.14155072883483 * S_Mnt  +    -0.48144143185181 * 
        S_MntFishProducts  +    -0.13673430260224 * S_MntFruits
          +     0.11219170806382 * S_MntGoldProds  +     0.32321105875036 * 
        S_MntMeatProducts  +    -0.31138776324434 * S_MntSweetProducts
          +      0.0542661634927 * S_MntWines  +     0.04695198015025 * 
        S_MonthsAsCustomer  +     0.02894984069652 * S_NumCatalogPurchases
          +     0.08121213946217 * S_NumDealsPurchases
          +    -0.04963282234139 * S_NumDistPurchases
          +    -0.09521586837775 * S_NumStorePurchases
          +     0.00630626523742 * S_NumWebPurchases
          +    -0.03891587920939 * S_NumWebVisitsMonth
          +    -0.19177541069142 * S_RFMstat  +    -0.06514218596343 * 
        S_RMntFrq  +    -0.09135545756466 * S_Recency
          +      0.0734076165534 * S_Teenhome ;
   H14  =     0.56336598514797 * S_AcceptedCmpTotal  +     0.01592059294406 * 
        S_Age  +      0.2311888901482 * S_Frq  +      0.1259439937434 * 
        S_Income  +     0.25356767518099 * S_Kidhome
          +      0.2503736815042 * S_Mnt  +    -0.18728261744667 * 
        S_MntFishProducts  +    -0.00224513484971 * S_MntFruits
          +    -0.03512046714564 * S_MntGoldProds  +     1.85911419211818 * 
        S_MntMeatProducts  +     0.27013231005995 * S_MntSweetProducts
          +    -0.67506389769578 * S_MntWines  +     0.00739074848154 * 
        S_MonthsAsCustomer  +     1.68736779543695 * S_NumCatalogPurchases
          +     0.83749876944877 * S_NumDealsPurchases
          +     0.29636537008068 * S_NumDistPurchases
          +    -0.61202052257506 * S_NumStorePurchases
          +    -0.96921731415369 * S_NumWebPurchases
          +     0.10056455703323 * S_NumWebVisitsMonth
          +     0.31239399742734 * S_RFMstat  +    -0.00768176891356 * 
        S_RMntFrq  +    -0.36934667860476 * S_Recency
          +    -0.01407913120571 * S_Teenhome ;
   H15  =     0.53899189431072 * S_AcceptedCmpTotal  +    -0.02149258783783 * 
        S_Age  +    -0.17934707082289 * S_Frq  +     0.68550165336551 * 
        S_Income  +    -0.66239517276633 * S_Kidhome
          +     0.05458774654031 * S_Mnt  +     0.04764733798509 * 
        S_MntFishProducts  +     -0.0991733005642 * S_MntFruits
          +    -0.10679427479927 * S_MntGoldProds  +     0.87627582401159 * 
        S_MntMeatProducts  +    -0.05714601619366 * S_MntSweetProducts
          +    -0.42917375241394 * S_MntWines  +    -0.00264308606557 * 
        S_MonthsAsCustomer  +       0.662405922892 * S_NumCatalogPurchases
          +     0.63122884753912 * S_NumDealsPurchases
          +     0.00285388491049 * S_NumDistPurchases
          +    -0.76222252593182 * S_NumStorePurchases
          +    -0.71485070772733 * S_NumWebPurchases
          +     1.59020450778179 * S_NumWebVisitsMonth
          +     0.05337807789806 * S_RFMstat  +    -0.44355440632461 * 
        S_RMntFrq  +    -1.32400243058807 * S_Recency
          +    -0.29635849268914 * S_Teenhome ;
   H16  =    -0.14331331777313 * S_AcceptedCmpTotal  +       0.326569466151 * 
        S_Age  +     0.21732309554124 * S_Frq  +     0.23097635949917 * 
        S_Income  +    -0.22662005590555 * S_Kidhome
          +     0.01964147118737 * S_Mnt  +    -0.03143791536828 * 
        S_MntFishProducts  +     0.02737445722412 * S_MntFruits
          +     0.11059205146763 * S_MntGoldProds  +    -0.08436826969721 * 
        S_MntMeatProducts  +      -0.148582368111 * S_MntSweetProducts
          +    -0.28478577108463 * S_MntWines  +     0.20162256683377 * 
        S_MonthsAsCustomer  +     0.20640237241268 * S_NumCatalogPurchases
          +    -0.28143084367284 * S_NumDealsPurchases
          +     0.09640746756361 * S_NumDistPurchases
          +      0.1754994442449 * S_NumStorePurchases
          +     0.14321475617403 * S_NumWebPurchases
          +     -0.1908048876137 * S_NumWebVisitsMonth
          +    -0.21951647431328 * S_RFMstat  +    -0.07602978491607 * 
        S_RMntFrq  +     0.02280616139018 * S_Recency
          +    -0.28295848950411 * S_Teenhome ;
   H17  =     0.18370302299854 * S_AcceptedCmpTotal  +    -0.09232025426951 * 
        S_Age  +     0.01688986476064 * S_Frq  +     0.40684920957133 * 
        S_Income  +    -0.45643247613458 * S_Kidhome
          +     0.13044714407259 * S_Mnt  +    -0.27140663796303 * 
        S_MntFishProducts  +     -0.0437857904473 * S_MntFruits
          +     0.09407739192941 * S_MntGoldProds  +    -0.02422597123766 * 
        S_MntMeatProducts  +     0.02947846512042 * S_MntSweetProducts
          +     0.06248788510568 * S_MntWines  +    -0.09330232042055 * 
        S_MonthsAsCustomer  +     0.33149769704548 * S_NumCatalogPurchases
          +    -0.14623073736275 * S_NumDealsPurchases
          +      0.1591142102614 * S_NumDistPurchases
          +     0.10364624011419 * S_NumStorePurchases
          +     0.21545343951201 * S_NumWebPurchases
          +     0.61096997379603 * S_NumWebVisitsMonth
          +     0.10919719280364 * S_RFMstat  +     0.13467793881271 * 
        S_RMntFrq  +    -1.05615926539796 * S_Recency
          +    -0.46191152095723 * S_Teenhome ;
   H11  = H11  +     0.14669521207274 * AcceptedCmp10
          +     0.05688242299477 * AcceptedCmp20  +    -0.11541836067088 * 
        AcceptedCmp30  +    -0.09531487990179 * AcceptedCmp40
          +     0.03436086529019 * AcceptedCmp50  +    -0.25037209640985 * 
        Complain0  +    -0.01220476871917 * HigherEducationBinary0 ;
   H12  = H12  +     0.00308183800269 * AcceptedCmp10
          +     0.15117897721859 * AcceptedCmp20  +     0.38978626739284 * 
        AcceptedCmp30  +    -0.34510242965707 * AcceptedCmp40
          +     0.34476185415358 * AcceptedCmp50  +     -0.0471191058463 * 
        Complain0  +    -0.35479552944875 * HigherEducationBinary0 ;
   H13  = H13  +    -0.23075329493142 * AcceptedCmp10
          +     0.05372430688076 * AcceptedCmp20  +    -0.04133305832004 * 
        AcceptedCmp30  +    -0.26034389808875 * AcceptedCmp40
          +    -0.05202595947121 * AcceptedCmp50  +     0.04096250305323 * 
        Complain0  +     -0.0263055703884 * HigherEducationBinary0 ;
   H14  = H14  +    -0.30215996271638 * AcceptedCmp10
          +    -0.13069612609583 * AcceptedCmp20  +     0.12488001880335 * 
        AcceptedCmp30  +     0.24159090886491 * AcceptedCmp40
          +    -0.08339247170749 * AcceptedCmp50  +     0.06197061431371 * 
        Complain0  +    -0.02864684261279 * HigherEducationBinary0 ;
   H15  = H15  +    -0.24231601484314 * AcceptedCmp10
          +    -0.15783436385069 * AcceptedCmp20  +      -0.165123406448 * 
        AcceptedCmp30  +     -0.3461179061711 * AcceptedCmp40
          +    -0.30496192781021 * AcceptedCmp50  +     0.03253519247022 * 
        Complain0  +     -0.2564790261773 * HigherEducationBinary0 ;
   H16  = H16  +     0.00566559307299 * AcceptedCmp10
          +      0.0400978993045 * AcceptedCmp20  +    -0.04851680976127 * 
        AcceptedCmp30  +    -0.01898973094389 * AcceptedCmp40
          +    -0.06157043443006 * AcceptedCmp50  +    -0.06854763648385 * 
        Complain0  +       0.231458542974 * HigherEducationBinary0 ;
   H17  = H17  +     0.00742278673712 * AcceptedCmp10
          +    -0.13192500326249 * AcceptedCmp20  +    -0.24131013943598 * 
        AcceptedCmp30  +    -0.25857782968649 * AcceptedCmp40
          +    -0.13787093911938 * AcceptedCmp50  +    -0.12068746341015 * 
        Complain0  +     0.32673931939454 * HigherEducationBinary0 ;
   H11  = H11  +     0.05243340575835 * Education2n_Cycle
          +      0.2858024846941 * EducationBasic  +     0.29283586600213 * 
        EducationGraduation  +     0.00389495660452 * EducationMaster
          +     0.39856598367829 * Marital_StatusDivorced
          +    -0.45922754552461 * Marital_StatusMarried
          +     0.41270195301891 * Marital_StatusSingle
          +     -0.3347569949443 * Marital_StatusTogether ;
   H12  = H12  +     -0.1439126887147 * Education2n_Cycle
          +     0.01375267748784 * EducationBasic  +     -0.0685054608094 * 
        EducationGraduation  +      0.2609956614651 * EducationMaster
          +     0.12002180366932 * Marital_StatusDivorced
          +     0.50693056076018 * Marital_StatusMarried
          +    -0.40828651697464 * Marital_StatusSingle
          +     0.56470794856864 * Marital_StatusTogether ;
   H13  = H13  +     0.07270351166078 * Education2n_Cycle
          +      0.2300721709066 * EducationBasic  +     -0.0970787196329 * 
        EducationGraduation  +     0.20017847825938 * EducationMaster
          +    -0.05075621283629 * Marital_StatusDivorced
          +     0.06731276969307 * Marital_StatusMarried
          +     0.20458391966582 * Marital_StatusSingle
          +     0.21684345970572 * Marital_StatusTogether ;
   H14  = H14  +    -0.13092252219357 * Education2n_Cycle
          +     0.09676029686792 * EducationBasic  +    -0.01011537602592 * 
        EducationGraduation  +     0.28829384238085 * EducationMaster
          +    -0.37925185401218 * Marital_StatusDivorced
          +     0.62971134740586 * Marital_StatusMarried
          +    -0.36562351730859 * Marital_StatusSingle
          +     0.60975879843489 * Marital_StatusTogether ;
   H15  = H15  +     0.14853068375135 * Education2n_Cycle
          +    -0.26227404762566 * EducationBasic  +     0.28447825800836 * 
        EducationGraduation  +    -0.18997526501932 * EducationMaster
          +     0.84382044664305 * Marital_StatusDivorced
          +    -0.84062627203871 * Marital_StatusMarried
          +     0.74100406031127 * Marital_StatusSingle
          +    -0.89212407744137 * Marital_StatusTogether ;
   H16  = H16  +     0.05307544081323 * Education2n_Cycle
          +     -0.3363359320385 * EducationBasic  +    -0.12190951749416 * 
        EducationGraduation  +    -0.13296903086061 * EducationMaster
          +     -0.1195105091383 * Marital_StatusDivorced
          +    -0.13486422945269 * Marital_StatusMarried
          +     0.33592403429156 * Marital_StatusSingle
          +    -0.09546680831082 * Marital_StatusTogether ;
   H17  = H17  +     0.03357678121775 * Education2n_Cycle
          +    -0.22726086970399 * EducationBasic  +    -0.11782756185529 * 
        EducationGraduation  +    -0.09885314861537 * EducationMaster
          +     0.14792293029589 * Marital_StatusDivorced
          +    -0.96003393582564 * Marital_StatusMarried
          +     0.64637652355384 * Marital_StatusSingle
          +    -0.58916183983394 * Marital_StatusTogether ;
   H11  =      0.0373794432192 + H11 ;
   H12  =     -0.5845216209459 + H12 ;
   H13  =    -1.04344126813006 + H13 ;
   H14  =     0.82776882532161 + H14 ;
   H15  =    -0.40623724255035 + H15 ;
   H16  =    -1.77614778612014 + H16 ;
   H17  =    -1.58554944042482 + H17 ;
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
   P_DepVar1  =    -1.53970344507045 * H11  +    -1.52046732791776 * H12
          +      0.3207833789301 * H13  +     3.10068524893786 * H14
          +     3.52160869913468 * H15  +     0.53642243400965 * H16
          +      2.0380168893605 * H17 ;
   P_DepVar1  =    -2.17260158358189 + P_DepVar1 ;
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
