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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

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
   H1x1_1  =      1.2726802048269 * S_AcceptedCmpTotal
          +    -0.02889982967357 * S_Age  +    -0.26165770909003 * S_Frq
          +     0.19140564299867 * S_Income  +     0.30244335152969 * 
        S_Kidhome  +    -0.03391217967468 * S_Mnt  +    -0.99943007809307 * 
        S_MntFishProducts  +    -0.04374917285968 * S_MntFruits
          +    -0.13546758294455 * S_MntGoldProds  +     3.59922243619013 * 
        S_MntMeatProducts  +    -0.10424531322566 * S_MntSweetProducts
          +    -1.98884071414703 * S_MntWines  +     0.05310540691138 * 
        S_MonthsAsCustomer  +     0.58072892654416 * S_NumCatalogPurchases
          +     0.30381426454211 * S_NumDealsPurchases
          +     0.39966076372974 * S_NumDistPurchases
          +    -0.58875986801139 * S_NumStorePurchases
          +    -0.78850031558536 * S_NumWebPurchases
          +     0.35182997415921 * S_NumWebVisitsMonth
          +     1.51048129701176 * S_RFMstat  +     1.13354085492775 * 
        S_RMntFrq  +     -0.2185811652116 * S_Recency
          +     0.01153374704027 * S_Teenhome ;
   H1x1_2  =     0.18093166280015 * S_AcceptedCmpTotal
          +    -0.00677564787839 * S_Age  +    -0.21510325598577 * S_Frq
          +     0.26314356814214 * S_Income  +    -0.30016454601651 * 
        S_Kidhome  +     -0.1410547608427 * S_Mnt  +    -0.04272369939478 * 
        S_MntFishProducts  +    -0.05622578678457 * S_MntFruits
          +     0.04457230545618 * S_MntGoldProds  +     0.40709024692944 * 
        S_MntMeatProducts  +    -0.02989090770621 * S_MntSweetProducts
          +    -0.18818656503765 * S_MntWines  +    -0.06237311646922 * 
        S_MonthsAsCustomer  +     0.39737856936198 * S_NumCatalogPurchases
          +     0.33734772994048 * S_NumDealsPurchases
          +     0.06152222921422 * S_NumDistPurchases
          +    -0.32068333792942 * S_NumStorePurchases
          +    -0.26971366415104 * S_NumWebPurchases
          +     0.57693239481071 * S_NumWebVisitsMonth
          +     0.01161324864777 * S_RFMstat  +     0.00311083015445 * 
        S_RMntFrq  +    -0.67669007299893 * S_Recency
          +     -0.2298426154616 * S_Teenhome ;
   H1x1_3  =    -0.09356212420726 * S_AcceptedCmpTotal
          +    -0.01904617704654 * S_Age  +    -0.15700206132472 * S_Frq
          +    -0.58483226627076 * S_Income  +     0.30001673574917 * 
        S_Kidhome  +    -0.19921492301896 * S_Mnt  +    -0.00125986769238 * 
        S_MntFishProducts  +     0.10195959942937 * S_MntFruits
          +      0.0069592628978 * S_MntGoldProds  +     0.03606436199308 * 
        S_MntMeatProducts  +     0.11259135359155 * S_MntSweetProducts
          +     0.05408818612126 * S_MntWines  +    -0.14024859528104 * 
        S_MonthsAsCustomer  +    -0.14071929240584 * S_NumCatalogPurchases
          +     0.22142792900578 * S_NumDealsPurchases
          +     -0.0291983445755 * S_NumDistPurchases
          +     -0.1997372957954 * S_NumStorePurchases
          +    -0.01286201468794 * S_NumWebPurchases
          +    -0.35208468552742 * S_NumWebVisitsMonth
          +     0.02982651364231 * S_RFMstat  +      0.0228316921695 * 
        S_RMntFrq  +      0.3930877517629 * S_Recency
          +     0.28989829670594 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.03659432989123 * AcceptedCmp10
          +    -0.12552546530316 * AcceptedCmp20  +     0.57200428680255 * 
        AcceptedCmp30  +      0.4327465126256 * AcceptedCmp40
          +    -1.24484170256212 * AcceptedCmp50  +     0.21604379838869 * 
        Complain0  +    -0.14986629245585 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.13542589174402 * AcceptedCmp10
          +    -0.19116289400292 * AcceptedCmp20  +    -0.10302282473135 * 
        AcceptedCmp30  +    -0.08705955845916 * AcceptedCmp40
          +    -0.17435407626698 * AcceptedCmp50  +    -0.09781790399225 * 
        Complain0  +     0.02006296587353 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.08917557424765 * AcceptedCmp10
          +    -0.00944366858806 * AcceptedCmp20  +     0.30527409248576 * 
        AcceptedCmp30  +     0.26823019920335 * AcceptedCmp40
          +    -0.02131660897576 * AcceptedCmp50  +    -0.16243659451446 * 
        Complain0  +    -0.28227689084686 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.12998959528304 * Education2n_Cycle
          +     0.48334684246109 * EducationBasic  +    -0.07156918649895 * 
        EducationGraduation  +    -0.21017720550072 * EducationMaster
          +    -0.22358326722482 * Marital_StatusDivorced
          +     0.09394210085787 * Marital_StatusMarried
          +    -0.10381546554982 * Marital_StatusSingle
          +     0.05935260608375 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.02955854298839 * Education2n_Cycle
          +    -0.13472200519398 * EducationBasic  +     0.01930622297518 * 
        EducationGraduation  +    -0.00188262361226 * EducationMaster
          +     0.16606212232833 * Marital_StatusDivorced
          +    -0.33252488631677 * Marital_StatusMarried
          +     0.26735237322144 * Marital_StatusSingle
          +    -0.37056611493683 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.29085314695378 * Education2n_Cycle
          +     -0.2177077392676 * EducationBasic  +    -0.12975750226767 * 
        EducationGraduation  +     0.12920694427876 * EducationMaster
          +    -0.30275479651076 * Marital_StatusDivorced
          +     0.50273719874035 * Marital_StatusMarried
          +    -0.39588303956293 * Marital_StatusSingle
          +     0.42028863850572 * Marital_StatusTogether ;
   H1x1_1  =     1.91295924572895 + H1x1_1 ;
   H1x1_2  =    -1.21245226681055 + H1x1_2 ;
   H1x1_3  =    -0.01609140135594 + H1x1_3 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = EXP(MIN(-0.5 * H1x1_1 **2, _EXP_BAR));
   H1x1_2  = EXP(MIN(-0.5 * H1x1_2 **2, _EXP_BAR));
   H1x1_3  = EXP(MIN(-0.5 * H1x1_3 **2, _EXP_BAR));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.73632716677259 * S_AcceptedCmpTotal
          +     -1.3452480925823 * S_Age  +    -0.77564767519981 * S_Frq
          +    -0.06163854052357 * S_Income  +     1.82428003860444 * 
        S_Kidhome  +       0.661412748756 * S_Mnt  +      1.8826488743919 * 
        S_MntFishProducts  +    -0.21815276926728 * S_MntFruits
          +     1.06597641654862 * S_MntGoldProds  +     0.13887400045643 * 
        S_MntMeatProducts  +    -0.62827157985225 * S_MntSweetProducts
          +     1.70742231056065 * S_MntWines  +     0.52403167020638 * 
        S_MonthsAsCustomer  +    -2.99889150929209 * S_NumCatalogPurchases
          +    -2.59470529821377 * S_NumDealsPurchases
          +      0.7668756449818 * S_NumDistPurchases
          +     0.61064641547208 * S_NumStorePurchases
          +    -0.87106335660846 * S_NumWebPurchases
          +      0.1188879348197 * S_NumWebVisitsMonth
          +     0.89319669432194 * S_RFMstat  +       -0.45272285967 * 
        S_RMntFrq  +     -0.7210740986075 * S_Recency
          +      0.7032117485114 * S_Teenhome ;
   H1x2_2  =      0.5405970783297 * S_AcceptedCmpTotal
          +     0.34103648596436 * S_Age  +    -1.00413619660059 * S_Frq
          +     0.40958797602392 * S_Income  +    -0.94731216445533 * 
        S_Kidhome  +    -0.17755265939769 * S_Mnt  +    -0.88926202859892 * 
        S_MntFishProducts  +      0.6791087530674 * S_MntFruits
          +     1.10836805118307 * S_MntGoldProds  +    -0.29462180872033 * 
        S_MntMeatProducts  +     2.21935054370304 * S_MntSweetProducts
          +     1.41379847080743 * S_MntWines  +    -0.66077297246309 * 
        S_MonthsAsCustomer  +     0.91491641336561 * S_NumCatalogPurchases
          +    -0.41834528691349 * S_NumDealsPurchases
          +    -0.07802605490227 * S_NumDistPurchases
          +    -0.62261476153139 * S_NumStorePurchases
          +    -0.84011953180231 * S_NumWebPurchases
          +     0.95169092183885 * S_NumWebVisitsMonth
          +      0.4036735448902 * S_RFMstat  +     0.44620057959954 * 
        S_RMntFrq  +    -0.54980566705324 * S_Recency
          +    -0.48914926560129 * S_Teenhome ;
   H1x2_3  =    -0.10056833202616 * S_AcceptedCmpTotal
          +    -3.35021911955911 * S_Age  +    -0.47433508394475 * S_Frq
          +      0.2642483252057 * S_Income  +     0.20666167536737 * 
        S_Kidhome  +    -1.63711887449192 * S_Mnt  +    -0.02078521278323 * 
        S_MntFishProducts  +    -0.13356020799092 * S_MntFruits
          +     0.03199170913357 * S_MntGoldProds  +     0.35859745927921 * 
        S_MntMeatProducts  +     1.28933517907056 * S_MntSweetProducts
          +    -0.45266889039243 * S_MntWines  +    -0.03980312418999 * 
        S_MonthsAsCustomer  +     0.11407065408619 * S_NumCatalogPurchases
          +     1.50811278700924 * S_NumDealsPurchases
          +    -0.40025710583484 * S_NumDistPurchases
          +     0.16539197954198 * S_NumStorePurchases
          +    -1.50803186935431 * S_NumWebPurchases
          +    -0.35788712697704 * S_NumWebVisitsMonth
          +    -2.06761773527847 * S_RFMstat  +    -0.00353259675109 * 
        S_RMntFrq  +      0.4364156603095 * S_Recency
          +    -0.44689366494665 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     1.19862785990255 * AcceptedCmp10
          +    -0.56777088839338 * AcceptedCmp20  +    -0.20982687937883 * 
        AcceptedCmp30  +     0.23051157512105 * AcceptedCmp40
          +    -1.16625535461103 * AcceptedCmp50  +    -0.03987377830172 * 
        Complain0  +    -1.17553145310278 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -1.37553391657098 * AcceptedCmp10
          +    -0.49489986415129 * AcceptedCmp20  +     0.84075258232812 * 
        AcceptedCmp30  +     0.31883526052436 * AcceptedCmp40
          +    -0.41245383847025 * AcceptedCmp50  +     0.75603245683628 * 
        Complain0  +    -2.07732119239317 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     0.94876862525586 * AcceptedCmp10
          +     0.79245605062261 * AcceptedCmp20  +     1.18614024465163 * 
        AcceptedCmp30  +    -0.24348380736895 * AcceptedCmp40
          +     0.63374252730038 * AcceptedCmp50  +     0.36777527794452 * 
        Complain0  +    -0.07746344015306 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     1.73012058377195 * Education2n_Cycle
          +     2.12295803973544 * EducationBasic  +     0.36945596974292 * 
        EducationGraduation  +    -1.22675967760612 * EducationMaster
          +    -0.48199299977856 * Marital_StatusDivorced
          +    -1.61546983135535 * Marital_StatusMarried
          +     1.25890289649165 * Marital_StatusSingle
          +    -0.35805098686637 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -1.04319773106255 * Education2n_Cycle
          +    -1.20017517243416 * EducationBasic  +    -0.21851017334559 * 
        EducationGraduation  +     0.54918303984069 * EducationMaster
          +    -0.69719138781358 * Marital_StatusDivorced
          +     0.26964883367384 * Marital_StatusMarried
          +      0.4656663467381 * Marital_StatusSingle
          +    -0.38324848670979 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.26572249637491 * Education2n_Cycle
          +     1.36865822272368 * EducationBasic  +     0.26769702437041 * 
        EducationGraduation  +    -0.57748542336591 * EducationMaster
          +     1.40407968804704 * Marital_StatusDivorced
          +    -1.35468203106214 * Marital_StatusMarried
          +      1.0644996414042 * Marital_StatusSingle
          +    -0.68198832748724 * Marital_StatusTogether ;
   H1x2_1  =     1.72650566457008 + H1x2_1 ;
   H1x2_2  =     -1.0113179577999 + H1x2_2 ;
   H1x2_3  =     0.14003924400021 + H1x2_3 ;
   H1x2_1  = SIN(H1x2_1 );
   H1x2_2  = SIN(H1x2_2 );
   H1x2_3  = SIN(H1x2_3 );
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
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
   P_DepVar1  =    -7.62079794803554 * H1x1_1  +     13.7007341613959 * H1x1_2
          +    -6.77882452096978 * H1x1_3 ;
   P_DepVar1  = P_DepVar1  +    -0.44850093089338 * H1x2_1
          +    -1.24228597291063 * H1x2_2  +     1.00075465600952 * H1x2_3 ;
   P_DepVar1  =    -2.26198805619545 + P_DepVar1 ;
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
