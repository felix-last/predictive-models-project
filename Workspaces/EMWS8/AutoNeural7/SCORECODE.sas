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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 * 
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 * 
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
   H1x1_1  =     0.26454269681311 * S_AcceptedCmpTotal
          +    -0.01281904987956 * S_Age  +    -0.19309516267581 * S_Frq
          +    -0.19077579202378 * S_Income  +      0.1806651018562 * 
        S_Kidhome  +    -0.31002612826472 * S_Mnt  +    -0.05901796512011 * 
        S_MntFishProducts  +    -0.03760930101165 * S_MntFruits
          +     0.01720900715043 * S_MntGoldProds  +     0.21472292961422 * 
        S_MntMeatProducts  +    -0.02880706568684 * S_MntSweetProducts
          +    -0.37993583170844 * S_MntWines  +    -0.00848444156361 * 
        S_MonthsAsCustomer  +     0.15939611818942 * S_NumCatalogPurchases
          +     0.08390531145773 * S_NumDealsPurchases
          +    -0.29505970645775 * S_NumDistPurchases
          +    -0.13820571170194 * S_NumStorePurchases
          +     0.11468011313368 * S_NumWebPurchases
          +    -0.18421241371843 * S_NumWebVisitsMonth
          +     0.11564064971509 * S_RFMstat  +    -0.02223928001432 * 
        S_RMntFrq  +     0.18022777532589 * S_Recency
          +     0.14654831145379 * S_Teenhome ;
   H1x1_2  =     0.27055972468014 * S_AcceptedCmpTotal
          +      0.0025862891193 * S_Age  +    -0.07147307366817 * S_Frq
          +      0.1883776136263 * S_Income  +    -0.12712510891181 * 
        S_Kidhome  +    -0.42099927948686 * S_Mnt  +    -0.07047631817862 * 
        S_MntFishProducts  +    -0.06658475152878 * S_MntFruits
          +     0.01943025682869 * S_MntGoldProds  +     0.29481794109465 * 
        S_MntMeatProducts  +    -0.06573502094591 * S_MntSweetProducts
          +    -0.46266722725002 * S_MntWines  +    -0.00472333181469 * 
        S_MonthsAsCustomer  +     0.35081452017576 * S_NumCatalogPurchases
          +     0.18009076035363 * S_NumDealsPurchases
          +     0.03853861006587 * S_NumDistPurchases
          +    -0.05118063952874 * S_NumStorePurchases
          +    -0.03282286120473 * S_NumWebPurchases
          +     0.31160900419026 * S_NumWebVisitsMonth
          +     0.08027884378429 * S_RFMstat  +     0.39057239541393 * 
        S_RMntFrq  +    -0.34796767111274 * S_Recency
          +    -0.12099758522271 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.12539246465239 * AcceptedCmp10
          +     0.38473652869745 * AcceptedCmp20  +     0.29820983391886 * 
        AcceptedCmp30  +     0.29085092779792 * AcceptedCmp40
          +     0.18918195914981 * AcceptedCmp50  +    -0.26812516781697 * 
        Complain0  +    -0.08804110897148 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.02312897825565 * AcceptedCmp10
          +     0.03909481703523 * AcceptedCmp20  +     0.02531081539721 * 
        AcceptedCmp30  +     0.03109641300151 * AcceptedCmp40
          +     0.01985718189621 * AcceptedCmp50  +     0.13425456375085 * 
        Complain0  +    -0.08222486590117 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.01975862863669 * Education2n_Cycle
          +     0.14654730697956 * EducationBasic  +    -0.00459515646452 * 
        EducationGraduation  +     0.01586948449127 * EducationMaster
          +    -0.04750981393889 * Marital_StatusDivorced
          +     0.28216925676677 * Marital_StatusMarried
          +    -0.20757827413964 * Marital_StatusSingle
          +     0.22622509024122 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.12009608969049 * Education2n_Cycle
          +     0.01793460710056 * EducationBasic  +    -0.04257710051346 * 
        EducationGraduation  +    -0.06975725710115 * EducationMaster
          +     0.05981919620577 * Marital_StatusDivorced
          +    -0.17161573846062 * Marital_StatusMarried
          +     0.15869440681091 * Marital_StatusSingle
          +    -0.13282372850158 * Marital_StatusTogether ;
   H1x1_1  =     0.87962277715971 + H1x1_1 ;
   H1x1_2  =    -0.62570339696782 + H1x1_2 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =      0.1719390672121 * S_AcceptedCmpTotal
          +     0.23586839288361 * S_Age  +    -1.85384134180372 * S_Frq
          +    -0.43561758063577 * S_Income  +     -2.5581498901473 * 
        S_Kidhome  +      1.7031888248428 * S_Mnt  +     0.84982621124736 * 
        S_MntFishProducts  +     0.25990173458485 * S_MntFruits
          +    -2.80730469703961 * S_MntGoldProds  +     0.64923500711702 * 
        S_MntMeatProducts  +     0.27458645458502 * S_MntSweetProducts
          +    -0.47723589182372 * S_MntWines  +    -0.66777488145507 * 
        S_MonthsAsCustomer  +    -0.46364414558282 * S_NumCatalogPurchases
          +     0.00741910846933 * S_NumDealsPurchases
          +       1.334289252268 * S_NumDistPurchases
          +    -0.29851567180932 * S_NumStorePurchases
          +    -0.52115313259666 * S_NumWebPurchases
          +     0.93907168501909 * S_NumWebVisitsMonth
          +    -0.26126881318451 * S_RFMstat  +     -1.3003763542929 * 
        S_RMntFrq  +    -0.12807368149309 * S_Recency
          +    -0.21296116974623 * S_Teenhome ;
   H1x2_2  =     0.30897763700303 * S_AcceptedCmpTotal
          +    -0.77727886396317 * S_Age  +    -0.79298582494973 * S_Frq
          +    -1.73199353738093 * S_Income  +     1.12984956989288 * 
        S_Kidhome  +    -1.36701096993984 * S_Mnt  +    -0.21063950702424 * 
        S_MntFishProducts  +    -0.20027336686257 * S_MntFruits
          +    -0.06955810418489 * S_MntGoldProds  +     0.16672767423533 * 
        S_MntMeatProducts  +    -1.56675269740541 * S_MntSweetProducts
          +     1.85366479127485 * S_MntWines  +    -0.58178621903094 * 
        S_MonthsAsCustomer  +     1.31024619253935 * S_NumCatalogPurchases
          +     1.60427001186844 * S_NumDealsPurchases
          +    -0.18447618033353 * S_NumDistPurchases
          +    -1.29966073003539 * S_NumStorePurchases
          +    -1.12373457341536 * S_NumWebPurchases
          +     1.46099221440494 * S_NumWebVisitsMonth
          +     0.17795038564406 * S_RFMstat  +    -0.82372068140832 * 
        S_RMntFrq  +      0.4480370534729 * S_Recency
          +     0.19272737691538 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     -0.6569942252053 * AcceptedCmp10
          +    -0.89152555599538 * AcceptedCmp20  +     1.00488730476017 * 
        AcceptedCmp30  +     0.34286042692068 * AcceptedCmp40
          +    -1.19198820362508 * AcceptedCmp50  +    -0.86571531914686 * 
        Complain0  +     0.14303136037365 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.79481763784518 * AcceptedCmp10
          +    -2.85912280013336 * AcceptedCmp20  +     0.16890012708431 * 
        AcceptedCmp30  +     0.94639083182751 * AcceptedCmp40
          +    -0.62141828005946 * AcceptedCmp50  +    -0.39098882491277 * 
        Complain0  +     0.85700787946581 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +      0.0737054452993 * Education2n_Cycle
          +       0.362372261752 * EducationBasic  +      -1.485941295677 * 
        EducationGraduation  +    -0.81257694655594 * EducationMaster
          +     0.59819559998538 * Marital_StatusDivorced
          +     0.92957772553633 * Marital_StatusMarried
          +    -1.11796266958894 * Marital_StatusSingle
          +     -2.0576132087002 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -1.10016528859962 * Education2n_Cycle
          +    -1.46816646165468 * EducationBasic  +    -0.11241499152788 * 
        EducationGraduation  +    -0.65110715251273 * EducationMaster
          +      1.0870909562212 * Marital_StatusDivorced
          +     1.50333961797515 * Marital_StatusMarried
          +    -1.41407780765932 * Marital_StatusSingle
          +    -0.52528072358697 * Marital_StatusTogether ;
   H1x2_1  =     1.46376024534028 + H1x2_1 ;
   H1x2_2  =    -0.21341526379366 + H1x2_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = EXP(MIN(-0.5 * H1x2_1 **2, _EXP_BAR));
   H1x2_2  = EXP(MIN(-0.5 * H1x2_2 **2, _EXP_BAR));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.29299707972123 * S_AcceptedCmpTotal
          +     1.39797329466471 * S_Age  +    -2.02673480388837 * S_Frq
          +    -1.09682777516542 * S_Income  +    -1.22241109888643 * 
        S_Kidhome  +    -1.35766076466324 * S_Mnt  +    -2.90812690982576 * 
        S_MntFishProducts  +    -0.48174923069843 * S_MntFruits
          +     1.57335575145195 * S_MntGoldProds  +    -0.55248873552176 * 
        S_MntMeatProducts  +     0.54536808091745 * S_MntSweetProducts
          +    -0.41516162035296 * S_MntWines  +     0.07715050596116 * 
        S_MonthsAsCustomer  +    -2.18785324142159 * S_NumCatalogPurchases
          +     -1.1174504455343 * S_NumDealsPurchases
          +    -0.18561253113498 * S_NumDistPurchases
          +    -0.35231054612792 * S_NumStorePurchases
          +      0.9249490354172 * S_NumWebPurchases
          +    -0.79868535147175 * S_NumWebVisitsMonth
          +    -0.17158151681124 * S_RFMstat  +     -0.9870286843901 * 
        S_RMntFrq  +     0.62439123699986 * S_Recency
          +    -0.45845377794308 * S_Teenhome ;
   H1x3_2  =    -1.07483179793421 * S_AcceptedCmpTotal
          +     1.03558600048684 * S_Age  +     1.11497695424161 * S_Frq
          +     0.27297296926116 * S_Income  +     0.77036019999023 * 
        S_Kidhome  +     0.02567848304605 * S_Mnt  +     0.38661977628442 * 
        S_MntFishProducts  +    -0.36751750771945 * S_MntFruits
          +     0.93924107558212 * S_MntGoldProds  +     0.93046859422523 * 
        S_MntMeatProducts  +    -0.46124679979068 * S_MntSweetProducts
          +    -0.45348234529786 * S_MntWines  +     1.60057890623864 * 
        S_MonthsAsCustomer  +    -1.74657448073162 * S_NumCatalogPurchases
          +     1.05434863590054 * S_NumDealsPurchases
          +    -0.73255174632068 * S_NumDistPurchases
          +     0.53949953455044 * S_NumStorePurchases
          +    -0.61709467816649 * S_NumWebPurchases
          +     1.36235282484348 * S_NumWebVisitsMonth
          +     -0.0352720913953 * S_RFMstat  +     0.14001475375682 * 
        S_RMntFrq  +    -0.24276831608869 * S_Recency
          +     0.09762798365722 * S_Teenhome ;
   H1x3_1  = H1x3_1  +    -0.94208577947628 * AcceptedCmp10
          +     -0.5233017415423 * AcceptedCmp20  +    -0.76900164563331 * 
        AcceptedCmp30  +    -0.79512141055877 * AcceptedCmp40
          +     0.20126599116957 * AcceptedCmp50  +    -0.43046555689873 * 
        Complain0  +     0.31565229685815 * HigherEducationBinary0 ;
   H1x3_2  = H1x3_2  +    -1.24961064002454 * AcceptedCmp10
          +    -0.89859693224833 * AcceptedCmp20  +     1.15884958881232 * 
        AcceptedCmp30  +     0.38250389164472 * AcceptedCmp40
          +     0.47123004358879 * AcceptedCmp50  +     -2.1232679844098 * 
        Complain0  +     0.97226091069674 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +    -0.07500306665919 * Education2n_Cycle
          +     0.04122924311058 * EducationBasic  +    -0.49410102102951 * 
        EducationGraduation  +    -0.45477734340809 * EducationMaster
          +     0.22253248036322 * Marital_StatusDivorced
          +    -1.72455332745001 * Marital_StatusMarried
          +     0.57787272107232 * Marital_StatusSingle
          +     0.16267074825086 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +    -0.21560233542581 * Education2n_Cycle
          +    -0.36476815429069 * EducationBasic  +     1.63334881201349 * 
        EducationGraduation  +    -1.12620982139344 * EducationMaster
          +     0.14637124403046 * Marital_StatusDivorced
          +     0.18905186437528 * Marital_StatusMarried
          +     0.00511958458521 * Marital_StatusSingle
          +      -0.915980703129 * Marital_StatusTogether ;
   H1x3_1  =     0.54853846322055 + H1x3_1 ;
   H1x3_2  =     1.36395858099198 + H1x3_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = EXP(MIN(H1x3_1 , _EXP_BAR));
   H1x3_2  = EXP(MIN(H1x3_2 , _EXP_BAR));
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -10.6892993503201 * H1x1_1  +     16.2938756734008 * H1x1_2
         ;
   P_DepVar1  = P_DepVar1  +      1.2332183930826 * H1x2_1
          +    -0.85206858106106 * H1x2_2 ;
   P_DepVar1  = P_DepVar1  +    -0.00087126688031 * H1x3_1
          +    -0.00025812675645 * H1x3_2 ;
   P_DepVar1  =     2.20710379818135 + P_DepVar1 ;
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
