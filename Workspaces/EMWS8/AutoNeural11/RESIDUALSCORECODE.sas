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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.26269469382558 * S_AcceptedCmpTotal
          +    -0.06270768091854 * S_Age  +    -0.71225988503068 * S_Frq
          +    -0.19030550341755 * S_Income  +    -0.74001834753219 * 
        S_Kidhome  +    -0.80050230513362 * S_Mnt  +    -0.70546855957287 * 
        S_MntFishProducts  +    -0.57876563074872 * S_MntFruits
          +    -0.00210300489306 * S_MntGoldProds  +     2.60078237485589 * 
        S_MntMeatProducts  +     -0.9886407516441 * S_MntSweetProducts
          +    -2.97488547819955 * S_MntWines  +    -0.61277940059348 * 
        S_MonthsAsCustomer  +    -0.00096247683063 * S_NumCatalogPurchases
          +     0.89422627895323 * S_NumDealsPurchases
          +    -0.13304125929765 * S_NumDistPurchases
          +    -1.04568442570811 * S_NumStorePurchases
          +    -0.28677765126751 * S_NumWebPurchases
          +      1.2327638737509 * S_NumWebVisitsMonth
          +     0.67421347247009 * S_RFMstat  +     -0.6166808079836 * 
        S_RMntFrq  +    -0.86930969765816 * S_Recency
          +     0.33815651609216 * S_Teenhome ;
   H1x1_2  =     0.55568777293496 * S_AcceptedCmpTotal
          +     0.80213442721076 * S_Age  +     0.34635060456486 * S_Frq
          +    -0.74174636901916 * S_Income  +    -0.01217809906509 * 
        S_Kidhome  +     0.26876993353057 * S_Mnt  +     0.04779395124841 * 
        S_MntFishProducts  +    -0.48668668697685 * S_MntFruits
          +    -0.53984501210781 * S_MntGoldProds  +     2.66892669248667 * 
        S_MntMeatProducts  +     0.48696031818599 * S_MntSweetProducts
          +    -1.59625933837852 * S_MntWines  +     0.06275925418664 * 
        S_MonthsAsCustomer  +     0.97240339275782 * S_NumCatalogPurchases
          +     0.04224590196535 * S_NumDealsPurchases
          +     0.76554742700113 * S_NumDistPurchases
          +    -0.49155496870812 * S_NumStorePurchases
          +     0.59606812744403 * S_NumWebPurchases
          +     1.86809286276405 * S_NumWebVisitsMonth
          +    -0.40257502974261 * S_RFMstat  +    -1.46120938073597 * 
        S_RMntFrq  +    -2.09222283465666 * S_Recency
          +    -0.29369632363913 * S_Teenhome ;
   H1x1_3  =    -1.40689454675752 * S_AcceptedCmpTotal
          +     0.22713382517751 * S_Age  +     0.51688429566863 * S_Frq
          +    -0.07045670111356 * S_Income  +     1.10344455539307 * 
        S_Kidhome  +     0.24846532877416 * S_Mnt  +       0.663861249099 * 
        S_MntFishProducts  +     0.91527393572467 * S_MntFruits
          +    -0.30189545909263 * S_MntGoldProds  +    -0.72774030731928 * 
        S_MntMeatProducts  +     0.66425565932635 * S_MntSweetProducts
          +     0.55381627079618 * S_MntWines  +      0.6475533846661 * 
        S_MonthsAsCustomer  +    -1.28926334887526 * S_NumCatalogPurchases
          +    -0.04866536993486 * S_NumDealsPurchases
          +    -0.53535979020214 * S_NumDistPurchases
          +     2.20634071253676 * S_NumStorePurchases
          +      0.6164564989007 * S_NumWebPurchases
          +    -0.43396314395263 * S_NumWebVisitsMonth
          +     0.05322242552204 * S_RFMstat  +     0.56410623855957 * 
        S_RMntFrq  +     2.37293441098349 * S_Recency
          +     1.20608077690677 * S_Teenhome ;
   H1x1_4  =      0.8853369558336 * S_AcceptedCmpTotal
          +    -0.02447538128281 * S_Age  +    -0.42850426895609 * S_Frq
          +     2.31972189756282 * S_Income  +    -1.82782672643583 * 
        S_Kidhome  +     -0.0790436830894 * S_Mnt  +     0.24407556387791 * 
        S_MntFishProducts  +     0.21000125209328 * S_MntFruits
          +     -0.0538417400508 * S_MntGoldProds  +     0.76422967678518 * 
        S_MntMeatProducts  +     0.14352092131967 * S_MntSweetProducts
          +    -0.47732426074136 * S_MntWines  +      0.2881736828404 * 
        S_MonthsAsCustomer  +     1.08614742409725 * S_NumCatalogPurchases
          +     1.37461255707863 * S_NumDealsPurchases
          +    -0.17684775000818 * S_NumDistPurchases
          +    -0.62755623855535 * S_NumStorePurchases
          +    -1.46551649022657 * S_NumWebPurchases
          +     3.35784247878638 * S_NumWebVisitsMonth
          +      0.0205421093374 * S_RFMstat  +     0.02151146396087 * 
        S_RMntFrq  +    -2.61971612923471 * S_Recency
          +    -1.74888814570254 * S_Teenhome ;
   H1x1_5  =    -1.18321492018094 * S_AcceptedCmpTotal
          +    -0.08221927436186 * S_Age  +    -0.42965792034093 * S_Frq
          +    -0.82515640369651 * S_Income  +     -0.7955159282868 * 
        S_Kidhome  +    -0.24623211609742 * S_Mnt  +     1.14929640730402 * 
        S_MntFishProducts  +     0.37195406994279 * S_MntFruits
          +    -0.11860313293867 * S_MntGoldProds  +     -5.1642360901608 * 
        S_MntMeatProducts  +     0.30315380386519 * S_MntSweetProducts
          +     2.66130913318508 * S_MntWines  +    -0.35226665860471 * 
        S_MonthsAsCustomer  +    -1.90883979010829 * S_NumCatalogPurchases
          +    -0.76256677907121 * S_NumDealsPurchases
          +    -0.31591571751692 * S_NumDistPurchases
          +      0.0506832614089 * S_NumStorePurchases
          +      1.4636796923764 * S_NumWebPurchases
          +     0.37743519705036 * S_NumWebVisitsMonth
          +    -0.69857477383618 * S_RFMstat  +    -0.87851464788137 * 
        S_RMntFrq  +     0.16854775832723 * S_Recency
          +     0.71697705359003 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.36100598335798 * AcceptedCmp10
          +    -0.80162089620833 * AcceptedCmp20  +    -0.32871385645151 * 
        AcceptedCmp30  +     0.06493645215559 * AcceptedCmp40
          +    -0.79430619699627 * AcceptedCmp50  +    -0.55522128705257 * 
        Complain0  +    -0.30966226382805 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.55315398954303 * AcceptedCmp10
          +    -0.74882192477453 * AcceptedCmp20  +    -1.00393247543385 * 
        AcceptedCmp30  +    -0.99157595784247 * AcceptedCmp40
          +     -1.3196947648703 * AcceptedCmp50  +    -0.00342039619706 * 
        Complain0  +     2.02148667926607 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -1.34147425697576 * AcceptedCmp10
          +     0.73907016980814 * AcceptedCmp20  +     0.73398008116032 * 
        AcceptedCmp30  +     0.96308137699431 * AcceptedCmp40
          +     0.35561099349684 * AcceptedCmp50  +    -0.31219143781741 * 
        Complain0  +     0.90693629583865 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.50580436048114 * AcceptedCmp10
          +    -1.02093523515462 * AcceptedCmp20  +    -0.61029325985231 * 
        AcceptedCmp30  +    -0.73402161144066 * AcceptedCmp40
          +      0.1698155397807 * AcceptedCmp50  +    -0.01243044321253 * 
        Complain0  +    -0.47467816438005 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +     1.58877963639512 * AcceptedCmp10
          +     0.71974146614964 * AcceptedCmp20  +    -0.38703518473707 * 
        AcceptedCmp30  +     0.18491867078918 * AcceptedCmp40
          +     0.72124299050214 * AcceptedCmp50  +    -0.27317285634323 * 
        Complain0  +      0.1433377302902 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.29126191890253 * Education2n_Cycle
          +    -0.73322213407659 * EducationBasic  +     0.33134572731882 * 
        EducationGraduation  +    -0.37141290775302 * EducationMaster
          +     0.68641668264565 * Marital_StatusDivorced
          +    -0.81586871439732 * Marital_StatusMarried
          +     0.63758920518451 * Marital_StatusSingle
          +    -1.07300023346175 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.43078991783629 * Education2n_Cycle
          +      0.6169213563952 * EducationBasic  +    -0.30246389091319 * 
        EducationGraduation  +     -0.4412391934844 * EducationMaster
          +     0.05137560133238 * Marital_StatusDivorced
          +    -2.24401993266209 * Marital_StatusMarried
          +     1.57359386216115 * Marital_StatusSingle
          +    -1.81897019215773 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.59284950139581 * Education2n_Cycle
          +     0.47333255206751 * EducationBasic  +     0.43514421192824 * 
        EducationGraduation  +     0.61492669859334 * EducationMaster
          +     -1.0649987815942 * Marital_StatusDivorced
          +     0.76065111692388 * Marital_StatusMarried
          +    -0.21694149754801 * Marital_StatusSingle
          +     1.64182073896148 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.77613125849075 * Education2n_Cycle
          +     0.26238013539868 * EducationBasic  +    -0.05526420132276 * 
        EducationGraduation  +     0.04208620358211 * EducationMaster
          +     2.02155453548328 * Marital_StatusDivorced
          +    -2.60190649735306 * Marital_StatusMarried
          +     1.09149388354927 * Marital_StatusSingle
          +    -1.15248770613963 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.03512618332303 * Education2n_Cycle
          +    -0.14907811224838 * EducationBasic  +     0.24885029294709 * 
        EducationGraduation  +    -0.60853091001689 * EducationMaster
          +     0.66315970650309 * Marital_StatusDivorced
          +    -1.20476729758152 * Marital_StatusMarried
          +     0.56175027826397 * Marital_StatusSingle
          +    -1.12798745445913 * Marital_StatusTogether ;
   H1x1_1  =      0.8264813299799 + H1x1_1 ;
   H1x1_2  =     1.35924705880418 + H1x1_2 ;
   H1x1_3  =    -0.31074016443189 + H1x1_3 ;
   H1x1_4  =    -1.37395810355475 + H1x1_4 ;
   H1x1_5  =    -0.62889533479826 + H1x1_5 ;
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
   H1x2_1  =     0.56269814727649 * S_AcceptedCmpTotal
          +    -0.56663088753275 * S_Age  +    -0.08799157593784 * S_Frq
          +      0.8158986182256 * S_Income  +     0.25081960997161 * 
        S_Kidhome  +    -0.53258140179906 * S_Mnt  +     0.15843644803762 * 
        S_MntFishProducts  +    -0.87373368590299 * S_MntFruits
          +     0.02807252984992 * S_MntGoldProds  +     1.41661611364623 * 
        S_MntMeatProducts  +     1.22431140889383 * S_MntSweetProducts
          +    -0.25451913627032 * S_MntWines  +     0.13515407201266 * 
        S_MonthsAsCustomer  +     1.28583120667445 * S_NumCatalogPurchases
          +     1.50005927423985 * S_NumDealsPurchases
          +      0.5590536933569 * S_NumDistPurchases
          +    -0.61757824339318 * S_NumStorePurchases
          +     0.37259686538158 * S_NumWebPurchases
          +     2.59725437895564 * S_NumWebVisitsMonth
          +     1.61096386499852 * S_RFMstat  +      0.6096177019772 * 
        S_RMntFrq  +    -2.38795796980324 * S_Recency
          +    -0.31987414022375 * S_Teenhome ;
   H1x2_2  =    -1.93801069736585 * S_AcceptedCmpTotal
          +     1.10394781020217 * S_Age  +    -0.47335296021798 * S_Frq
          +    -1.34212492602253 * S_Income  +    -1.34380793722996 * 
        S_Kidhome  +      0.9110881410704 * S_Mnt  +    -2.21001317666388 * 
        S_MntFishProducts  +     0.73821267564247 * S_MntFruits
          +     0.16536006752146 * S_MntGoldProds  +     0.03402222784641 * 
        S_MntMeatProducts  +     0.96043668102736 * S_MntSweetProducts
          +    -1.40670343451334 * S_MntWines  +     0.81378739821838 * 
        S_MonthsAsCustomer  +    -0.45596935664336 * S_NumCatalogPurchases
          +    -0.09282222088797 * S_NumDealsPurchases
          +     0.10726247938321 * S_NumDistPurchases
          +     -1.1235971458527 * S_NumStorePurchases
          +    -0.78304387839877 * S_NumWebPurchases
          +    -0.44139243179956 * S_NumWebVisitsMonth
          +    -0.00027499457791 * S_RFMstat  +    -0.71480759211982 * 
        S_RMntFrq  +     2.19072220135069 * S_Recency
          +    -0.32246312005896 * S_Teenhome ;
   H1x2_3  =    -0.33286965179681 * S_AcceptedCmpTotal
          +     0.25643420238739 * S_Age  +     1.78251276306291 * S_Frq
          +     0.42668628662657 * S_Income  +    -0.44555069154972 * 
        S_Kidhome  +     0.99430376599176 * S_Mnt  +     0.37152911215285 * 
        S_MntFishProducts  +    -1.00181313725345 * S_MntFruits
          +    -1.88393479121141 * S_MntGoldProds  +    -1.71643056154209 * 
        S_MntMeatProducts  +    -0.69325136508245 * S_MntSweetProducts
          +     0.36062578298416 * S_MntWines  +    -1.43361051175418 * 
        S_MonthsAsCustomer  +     0.92624996511804 * S_NumCatalogPurchases
          +     0.35349185459988 * S_NumDealsPurchases
          +     0.06853677714859 * S_NumDistPurchases
          +    -1.47546012999338 * S_NumStorePurchases
          +     0.20926435398916 * S_NumWebPurchases
          +    -1.00535683639093 * S_NumWebVisitsMonth
          +     0.39738023685345 * S_RFMstat  +     0.54359550262445 * 
        S_RMntFrq  +    -1.59138379954757 * S_Recency
          +    -0.72224029606658 * S_Teenhome ;
   H1x2_4  =     -0.0656876758781 * S_AcceptedCmpTotal
          +    -0.38220805193452 * S_Age  +    -0.62740801625755 * S_Frq
          +     0.62992117571672 * S_Income  +      1.6289723191423 * 
        S_Kidhome  +     0.37209535830613 * S_Mnt  +     0.55983487785376 * 
        S_MntFishProducts  +    -2.12992009015736 * S_MntFruits
          +    -0.38291517806426 * S_MntGoldProds  +    -1.36584955015054 * 
        S_MntMeatProducts  +     0.60790195398286 * S_MntSweetProducts
          +     2.43674403604903 * S_MntWines  +     -0.0680555682506 * 
        S_MonthsAsCustomer  +    -0.38141588539042 * S_NumCatalogPurchases
          +      0.3873586120272 * S_NumDealsPurchases
          +     0.25911651157596 * S_NumDistPurchases
          +     1.58922489084287 * S_NumStorePurchases
          +     0.49041797743368 * S_NumWebPurchases
          +     -1.5425586871929 * S_NumWebVisitsMonth
          +    -0.68794085469802 * S_RFMstat  +     1.43555366196783 * 
        S_RMntFrq  +     1.03099569333498 * S_Recency
          +    -0.33160793159803 * S_Teenhome ;
   H1x2_5  =      1.1619646008295 * S_AcceptedCmpTotal
          +     -1.1099918698895 * S_Age  +     1.07090049938562 * S_Frq
          +     0.68405730495336 * S_Income  +     0.10310173850527 * 
        S_Kidhome  +    -0.20536085581003 * S_Mnt  +    -0.13505440333321 * 
        S_MntFishProducts  +      0.7330354505267 * S_MntFruits
          +    -0.09266368133722 * S_MntGoldProds  +     0.11251229112529 * 
        S_MntMeatProducts  +     0.93293215365852 * S_MntSweetProducts
          +    -0.30739945619686 * S_MntWines  +     1.60111236559554 * 
        S_MonthsAsCustomer  +    -0.55541485540949 * S_NumCatalogPurchases
          +    -0.60830880287865 * S_NumDealsPurchases
          +      0.0745331267194 * S_NumDistPurchases
          +    -1.39472448256952 * S_NumStorePurchases
          +     1.95372179969087 * S_NumWebPurchases
          +    -0.63307356390404 * S_NumWebVisitsMonth
          +    -1.45142676869601 * S_RFMstat  +    -0.89091053567015 * 
        S_RMntFrq  +    -0.29197897313114 * S_Recency
          +     0.02610681671236 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.60663534965526 * AcceptedCmp10
          +     0.86940361180064 * AcceptedCmp20  +     1.96097801395475 * 
        AcceptedCmp30  +    -0.07604718607607 * AcceptedCmp40
          +    -2.82012437662904 * AcceptedCmp50  +     2.92223307409835 * 
        Complain0  +      0.7388639458943 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -0.44975979140124 * AcceptedCmp10
          +    -0.14894854897951 * AcceptedCmp20  +     1.05214102326393 * 
        AcceptedCmp30  +    -0.24568060312448 * AcceptedCmp40
          +    -0.32148548771167 * AcceptedCmp50  +    -0.06212131202705 * 
        Complain0  +    -1.15456299494407 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     0.05559829595526 * AcceptedCmp10
          +    -0.79357273390501 * AcceptedCmp20  +     1.19638475921939 * 
        AcceptedCmp30  +     -0.4185483500346 * AcceptedCmp40
          +     1.62070541716774 * AcceptedCmp50  +     0.42618871432227 * 
        Complain0  +    -1.31545071935076 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     0.79295384489774 * AcceptedCmp10
          +    -1.12840237512106 * AcceptedCmp20  +     1.32129555401653 * 
        AcceptedCmp30  +    -0.25952521594596 * AcceptedCmp40
          +     0.80872302488736 * AcceptedCmp50  +     1.00677398871609 * 
        Complain0  +    -0.40309387727555 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     0.27407087260629 * AcceptedCmp10
          +    -1.62993283587806 * AcceptedCmp20  +     -0.7976151702219 * 
        AcceptedCmp30  +    -1.43236001965205 * AcceptedCmp40
          +     0.31785497417833 * AcceptedCmp50  +     -0.4935881696628 * 
        Complain0  +    -0.90101154412077 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.42532202605687 * Education2n_Cycle
          +     0.05209663685716 * EducationBasic  +     1.32477268007154 * 
        EducationGraduation  +    -1.16900224373137 * EducationMaster
          +    -1.33377871643323 * Marital_StatusDivorced
          +    -0.87184228840898 * Marital_StatusMarried
          +     1.41223186340257 * Marital_StatusSingle
          +     0.26542930660962 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.31980851177227 * Education2n_Cycle
          +     1.82629979795037 * EducationBasic  +     0.59482979766527 * 
        EducationGraduation  +     0.38341272155343 * EducationMaster
          +    -0.21479890935233 * Marital_StatusDivorced
          +     -0.0025459519579 * Marital_StatusMarried
          +     1.33900491702264 * Marital_StatusSingle
          +     0.31338385402434 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     -1.1277686958847 * Education2n_Cycle
          +    -0.32701971979058 * EducationBasic  +      0.4361680205519 * 
        EducationGraduation  +     0.60739269725685 * EducationMaster
          +    -0.38307267471999 * Marital_StatusDivorced
          +     0.97088969451415 * Marital_StatusMarried
          +    -0.28578224473381 * Marital_StatusSingle
          +     0.16178086683874 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +    -1.21481485652985 * Education2n_Cycle
          +    -0.30231261977781 * EducationBasic  +     0.33993210461674 * 
        EducationGraduation  +     0.14160673378252 * EducationMaster
          +    -1.42229401093569 * Marital_StatusDivorced
          +      0.7234508382397 * Marital_StatusMarried
          +    -0.29062202974628 * Marital_StatusSingle
          +     1.00102560376832 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.47313927233084 * Education2n_Cycle
          +     0.53675687099431 * EducationBasic  +    -0.75029054398953 * 
        EducationGraduation  +     -0.7118631990538 * EducationMaster
          +    -0.99067637207205 * Marital_StatusDivorced
          +    -0.50245902142079 * Marital_StatusMarried
          +     0.54214494533793 * Marital_StatusSingle
          +    -1.90023876403873 * Marital_StatusTogether ;
   H1x2_1  =    -0.76220110175787 + H1x2_1 ;
   H1x2_2  =     0.33238308796509 + H1x2_2 ;
   H1x2_3  =    -1.79229186263718 + H1x2_3 ;
   H1x2_4  =     2.90076107393596 + H1x2_4 ;
   H1x2_5  =    -1.75965576502183 + H1x2_5 ;
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
   H2x1_1  =       1.974359971482 * H1x1_1  +     2.56630185065386 * H1x1_2
          +    -2.09978917716486 * H1x1_3  +      2.5733942680354 * H1x1_4
          +    -3.36902992698085 * H1x1_5  +    -2.45757278280195 * H1x1_6 ;
   H2x1_2  =    -0.31797232371002 * H1x1_1  +     1.40395330167402 * H1x1_2
          +     1.81616324109762 * H1x1_3  +     1.53849589982775 * H1x1_4
          +    -0.63132385856109 * H1x1_5  +    -2.28426391810485 * H1x1_6 ;
   H2x1_3  =    -1.34821716876354 * H1x1_1  +    -1.59136815069547 * H1x1_2
          +     1.51830421093731 * H1x1_3  +     0.25947292816575 * H1x1_4
          +     0.68626537551183 * H1x1_5  +     0.08021226539433 * H1x1_6 ;
   H2x1_4  =     1.81371453071507 * H1x1_1  +     2.86509325576366 * H1x1_2
          +    -2.51923468751378 * H1x1_3  +     3.48823967488449 * H1x1_4
          +    -1.98439811139438 * H1x1_5  +    -1.35359233519863 * H1x1_6 ;
   H2x1_5  =     2.41779243188377 * H1x1_1  +     2.38684872287302 * H1x1_2
          +    -2.38697428830295 * H1x1_3  +     3.64463866412774 * H1x1_4
          +    -6.25925640356471 * H1x1_5  +    -2.41187367604766 * H1x1_6 ;
   H2x1_6  =    -0.72042650045348 * H1x1_1  +      0.1896194130913 * H1x1_2
          +     0.90899894568677 * H1x1_3  +    -1.82868335056689 * H1x1_4
          +     0.25430380699211 * H1x1_5  +     0.21617396847163 * H1x1_6 ;
   H2x1_1  = H2x1_1  +     1.25654059966646 * H1x2_1
          +     1.54802434303135 * H1x2_2  +     -0.8831980397117 * H1x2_3
          +    -0.06778839937099 * H1x2_4  +      0.5440972304381 * H1x2_5
          +      0.2606136576082 * H1x2_6 ;
   H2x1_2  = H2x1_2  +      1.1804478706954 * H1x2_1
          +    -1.54526687654235 * H1x2_2  +    -1.84586479319799 * H1x2_3
          +     1.53060510120437 * H1x2_4  +     1.17038673632413 * H1x2_5
          +    -0.33816948355449 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -0.17829043463382 * H1x2_1
          +    -0.25137506897353 * H1x2_2  +     0.16242586068799 * H1x2_3
          +    -0.09404795949359 * H1x2_4  +    -0.46228597203598 * H1x2_5
          +    -2.05648585275111 * H1x2_6 ;
   H2x1_4  = H2x1_4  +     0.42433995729877 * H1x2_1
          +    -0.48506090180667 * H1x2_2  +    -2.00023889633201 * H1x2_3
          +    -2.18353148884875 * H1x2_4  +      1.8888560029491 * H1x2_5
          +     0.10756694741742 * H1x2_6 ;
   H2x1_5  = H2x1_5  +     1.56363187716685 * H1x2_1
          +    -1.60380055270086 * H1x2_2  +    -0.10253336309679 * H1x2_3
          +    -0.70868484989608 * H1x2_4  +    -1.01428312449496 * H1x2_5
          +    -0.52564497366659 * H1x2_6 ;
   H2x1_6  = H2x1_6  +    -2.54663319607132 * H1x2_1
          +    -0.26971572820094 * H1x2_2  +      0.0632302804701 * H1x2_3
          +     0.24322354570335 * H1x2_4  +     0.66904111988013 * H1x2_5
          +     0.74493468449949 * H1x2_6 ;
   H2x1_1  =    -0.48109096483079 + H2x1_1 ;
   H2x1_2  =     1.80708027085243 + H2x1_2 ;
   H2x1_3  =    -0.46023689639613 + H2x1_3 ;
   H2x1_4  =     0.33871753804401 + H2x1_4 ;
   H2x1_5  =    -0.31584249921712 + H2x1_5 ;
   H2x1_6  =     0.30285416134468 + H2x1_6 ;
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
   P_DepVar1  =     7.89179702798476 * H2x1_1  +    -2.13955806072986 * H2x1_2
          +    -3.88305304025889 * H2x1_3  +     4.07340753853874 * H2x1_4
          +     7.74293596833296 * H2x1_5  +     -3.8939011811129 * H2x1_6 ;
   P_DepVar1  =    -5.20107973804597 + P_DepVar1 ;
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
