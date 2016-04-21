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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

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
   H1x1_1  =     -2.0588471958351 * S_AcceptedCmpTotal
          +     0.38628980389456 * S_Age  +     -0.8545617733777 * S_Frq
          +    -1.37557200210661 * S_Income  +     1.58583945545125 *
        S_Kidhome  +    -1.49250871593186 * S_Mnt  +    -2.02986091068301 *
        S_MntFishProducts  +     0.28845511703412 * S_MntFruits
          +    -0.62495372005095 * S_MntGoldProds  +     3.22144698444712 *
        S_MntMeatProducts  +    -2.67158036653801 * S_MntSweetProducts
          +    -4.30837863985493 * S_MntWines  +     0.39603200162704 *
        S_MonthsAsCustomer  +      1.8259166147951 * S_NumCatalogPurchases
          +      3.4758215776031 * S_NumDealsPurchases
          +     0.17094021755289 * S_NumDistPurchases
          +    -2.72090095694641 * S_NumStorePurchases
          +    -0.31877935826328 * S_NumWebPurchases
          +    -2.03399974412918 * S_NumWebVisitsMonth
          +     2.74309130038659 * S_RFMstat  +    -0.74941844935268 *
        S_RMntFrq  +     0.29064555076615 * S_Recency
          +    -0.57040700827247 * S_Teenhome ;
   H1x1_2  =     -0.5995699177824 * S_AcceptedCmpTotal
          +    -1.17769485933608 * S_Age  +     0.95998296288295 * S_Frq
          +     -2.2343179478513 * S_Income  +     3.17436638275163 *
        S_Kidhome  +     0.46987648124346 * S_Mnt  +     0.07213935656698 *
        S_MntFishProducts  +    -1.38055808108069 * S_MntFruits
          +     0.62140960451545 * S_MntGoldProds  +     -1.9000500396873 *
        S_MntMeatProducts  +    -0.35707372583597 * S_MntSweetProducts
          +     1.99720917743483 * S_MntWines  +     0.89245096364062 *
        S_MonthsAsCustomer  +    -0.61497875715928 * S_NumCatalogPurchases
          +    -1.21013804197082 * S_NumDealsPurchases
          +     0.59974279122188 * S_NumDistPurchases
          +     1.92425710681156 * S_NumStorePurchases
          +     1.02413182452324 * S_NumWebPurchases
          +    -3.63276285340174 * S_NumWebVisitsMonth
          +     0.33919100670479 * S_RFMstat  +     0.84767315208026 *
        S_RMntFrq  +     3.87352563099005 * S_Recency
          +     2.74174964084917 * S_Teenhome ;
   H1x1_3  =    -2.27029708882419 * S_AcceptedCmpTotal
          +     0.57558817521081 * S_Age  +     0.03666022895146 * S_Frq
          +    -0.43764949843184 * S_Income  +     0.05202039236868 *
        S_Kidhome  +    -0.17515517773197 * S_Mnt  +      2.1454579331563 *
        S_MntFishProducts  +     -0.0544472234117 * S_MntFruits
          +    -0.24751372889101 * S_MntGoldProds  +    -7.95986512066472 *
        S_MntMeatProducts  +    -0.42258869313323 * S_MntSweetProducts
          +      4.6542173574208 * S_MntWines  +     0.27973663838423 *
        S_MonthsAsCustomer  +    -0.92923468464154 * S_NumCatalogPurchases
          +      0.4928343071801 * S_NumDealsPurchases
          +     -0.0196677325409 * S_NumDistPurchases
          +     0.44395828164873 * S_NumStorePurchases
          +     0.86947051591224 * S_NumWebPurchases
          +    -0.96787241206077 * S_NumWebVisitsMonth
          +     -0.9429396337834 * S_RFMstat  +    -1.69298966254302 *
        S_RMntFrq  +     0.24582117217188 * S_Recency
          +    -1.08471509540368 * S_Teenhome ;
   H1x1_4  =     0.54181596412096 * S_AcceptedCmpTotal
          +    -1.19331526818752 * S_Age  +     0.79853759822324 * S_Frq
          +     0.73370928178794 * S_Income  +     0.38661834479377 *
        S_Kidhome  +      0.3442876988888 * S_Mnt  +    -0.58769739655035 *
        S_MntFishProducts  +     -0.8703586573687 * S_MntFruits
          +    -0.06073044217122 * S_MntGoldProds  +     1.06031608775663 *
        S_MntMeatProducts  +      0.1600438561366 * S_MntSweetProducts
          +    -0.10937637342015 * S_MntWines  +     0.44423445817796 *
        S_MonthsAsCustomer  +     2.20653376632749 * S_NumCatalogPurchases
          +     1.10280977051932 * S_NumDealsPurchases
          +     0.99310057404036 * S_NumDistPurchases
          +    -0.05647459609331 * S_NumStorePurchases
          +    -0.89852483938631 * S_NumWebPurchases
          +     2.63022480227445 * S_NumWebVisitsMonth
          +      0.0081819695781 * S_RFMstat  +     1.19338523211724 *
        S_RMntFrq  +    -4.46436997560659 * S_Recency
          +    -2.03251171372039 * S_Teenhome ;
   H1x1_5  =    -1.03227948250072 * S_AcceptedCmpTotal
          +     0.25510562405413 * S_Age  +     0.11938172756061 * S_Frq
          +    -0.88855927472898 * S_Income  +    -0.98732962014399 *
        S_Kidhome  +     0.57537935682752 * S_Mnt  +     0.07702692666996 *
        S_MntFishProducts  +     0.69541223905843 * S_MntFruits
          +    -0.26720187465927 * S_MntGoldProds  +    -0.03938241662919 *
        S_MntMeatProducts  +     1.08781093588885 * S_MntSweetProducts
          +     1.16253823123182 * S_MntWines  +    -1.60607722651025 *
        S_MonthsAsCustomer  +    -1.69043794225498 * S_NumCatalogPurchases
          +    -2.62220616180571 * S_NumDealsPurchases
          +    -0.51737930835331 * S_NumDistPurchases
          +     0.88655783158133 * S_NumStorePurchases
          +     0.35132468809969 * S_NumWebPurchases
          +     -1.6320869675862 * S_NumWebVisitsMonth
          +     0.33776958473405 * S_RFMstat  +    -0.42290181425075 *
        S_RMntFrq  +     1.06226028677401 * S_Recency
          +     1.11855899514962 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.53637737817097 * AcceptedCmp10
          +    -1.85405146733588 * AcceptedCmp20  +    -1.47621046566649 *
        AcceptedCmp30  +    -1.37767318086242 * AcceptedCmp40
          +    -0.96348396070145 * AcceptedCmp50  +    -1.30976546088379 *
        Complain0  +    -0.54848314184314 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.18445380584184 * AcceptedCmp10
          +    -0.69257274561716 * AcceptedCmp20  +     0.17226038285159 *
        AcceptedCmp30  +    -1.06145995435722 * AcceptedCmp40
          +     1.23459262841144 * AcceptedCmp50  +    -0.14674063302587 *
        Complain0  +    -1.08422405648698 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.81272808689375 * AcceptedCmp10
          +    -0.37057950605918 * AcceptedCmp20  +    -1.75364708883985 *
        AcceptedCmp30  +     -1.9879502333289 * AcceptedCmp40
          +     2.82649108460951 * AcceptedCmp50  +    -0.14219031901768 *
        Complain0  +     -0.5514346363694 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -1.12354567881562 * AcceptedCmp10
          +    -1.64564861831306 * AcceptedCmp20  +    -1.84950171464501 *
        AcceptedCmp30  +    -2.60581164673686 * AcceptedCmp40
          +    -0.53568003317161 * AcceptedCmp50  +    -0.13929928866767 *
        Complain0  +     1.18053116626218 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +     -0.3006993305802 * AcceptedCmp10
          +    -0.67101949915278 * AcceptedCmp20  +     0.48950637221178 *
        AcceptedCmp30  +     0.25937105093078 * AcceptedCmp40
          +       0.650714225549 * AcceptedCmp50  +    -0.53543482850089 *
        Complain0  +     0.62014708316206 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.78710932360637 * Education2n_Cycle
          +    -0.34656604802235 * EducationBasic  +     0.11820082193221 *
        EducationGraduation  +     1.42539292513854 * EducationMaster
          +     0.34809919741136 * Marital_StatusDivorced
          +    -0.26594093535929 * Marital_StatusMarried
          +     0.70249715999987 * Marital_StatusSingle
          +    -0.45710525283449 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -1.00496261512915 * Education2n_Cycle
          +     0.66783492956492 * EducationBasic  +     0.91185122922538 *
        EducationGraduation  +    -0.28204692640004 * EducationMaster
          +    -0.20448765627193 * Marital_StatusDivorced
          +     1.73231344674733 * Marital_StatusMarried
          +    -0.70956480480373 * Marital_StatusSingle
          +      1.0926428215879 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.06222681334412 * Education2n_Cycle
          +    -0.00009122618999 * EducationBasic  +    -0.07444046529217 *
        EducationGraduation  +     1.01284161768787 * EducationMaster
          +     0.30333818684353 * Marital_StatusDivorced
          +    -1.44603535988199 * Marital_StatusMarried
          +     0.48409598426383 * Marital_StatusSingle
          +    -1.14528682521622 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.92316818310935 * Education2n_Cycle
          +     0.93590924020503 * EducationBasic  +     0.36762108040277 *
        EducationGraduation  +    -1.17735200022013 * EducationMaster
          +     -1.5342907846297 * Marital_StatusDivorced
          +    -1.79544684592172 * Marital_StatusMarried
          +     0.65604313645117 * Marital_StatusSingle
          +    -2.08172869142628 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.56328800945753 * Education2n_Cycle
          +    -0.06918346311418 * EducationBasic  +     -1.5176897786776 *
        EducationGraduation  +     0.09618331198762 * EducationMaster
          +    -3.97940893560267 * Marital_StatusDivorced
          +      3.5880254142663 * Marital_StatusMarried
          +     -2.9897737730927 * Marital_StatusSingle
          +     3.75098376776525 * Marital_StatusTogether ;
   H1x1_1  =    -2.89135496095875 + H1x1_1 ;
   H1x1_2  =     0.39943637099295 + H1x1_2 ;
   H1x1_3  =    -1.08093114818147 + H1x1_3 ;
   H1x1_4  =    -3.29426643182948 + H1x1_4 ;
   H1x1_5  =    -1.76822552726746 + H1x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     1.01981866144831 * S_AcceptedCmpTotal
          +    -1.47346125364319 * S_Age  +    -0.08669650492194 * S_Frq
          +    -0.51585471637562 * S_Income  +     1.40711190452923 *
        S_Kidhome  +    -0.21341957199148 * S_Mnt  +    -0.31211158173505 *
        S_MntFishProducts  +    -0.77126486046129 * S_MntFruits
          +     -0.4503905849175 * S_MntGoldProds  +     1.01090165857015 *
        S_MntMeatProducts  +    -0.05554268249583 * S_MntSweetProducts
          +     2.72203992871966 * S_MntWines  +    -0.46212144021719 *
        S_MonthsAsCustomer  +    -0.10495120677935 * S_NumCatalogPurchases
          +     0.07279889333775 * S_NumDealsPurchases
          +     0.07542203992452 * S_NumDistPurchases
          +     0.16296239303342 * S_NumStorePurchases
          +     1.59193921229231 * S_NumWebPurchases
          +    -0.35227839362603 * S_NumWebVisitsMonth
          +      1.3224105019117 * S_RFMstat  +    -0.77035988511057 *
        S_RMntFrq  +     0.43315770276588 * S_Recency
          +     0.43447147039235 * S_Teenhome ;
   H1x2_2  =    -0.07629675162821 * S_AcceptedCmpTotal
          +     0.81684969971216 * S_Age  +     0.52870818801428 * S_Frq
          +     0.15358022485378 * S_Income  +    -0.64458879887927 *
        S_Kidhome  +    -2.12225648421746 * S_Mnt  +     1.05240671673302 *
        S_MntFishProducts  +    -0.89595336397918 * S_MntFruits
          +    -0.28950558043577 * S_MntGoldProds  +     0.30996043499478 *
        S_MntMeatProducts  +     1.27676485470274 * S_MntSweetProducts
          +    -1.30045112439384 * S_MntWines  +     1.36110971826862 *
        S_MonthsAsCustomer  +     -0.1778244163518 * S_NumCatalogPurchases
          +    -0.37456959251084 * S_NumDealsPurchases
          +    -1.15252469975668 * S_NumDistPurchases
          +    -1.39822501888899 * S_NumStorePurchases
          +    -0.32777847360723 * S_NumWebPurchases
          +     0.84026499832926 * S_NumWebVisitsMonth
          +    -1.47180193258497 * S_RFMstat  +     0.18801983980439 *
        S_RMntFrq  +     1.21016626691186 * S_Recency
          +    -0.82943594788748 * S_Teenhome ;
   H1x2_3  =    -0.06736000283511 * S_AcceptedCmpTotal
          +    -0.47270148030219 * S_Age  +      1.1959707178877 * S_Frq
          +    -1.40081626653738 * S_Income  +     0.35085595025526 *
        S_Kidhome  +    -0.43652344252181 * S_Mnt  +     1.12197802721591 *
        S_MntFishProducts  +     1.27079634537799 * S_MntFruits
          +    -0.03023683680758 * S_MntGoldProds  +     0.51289568088141 *
        S_MntMeatProducts  +     1.12894900622408 * S_MntSweetProducts
          +    -0.66940205871871 * S_MntWines  +    -1.57211003055303 *
        S_MonthsAsCustomer  +     1.47778465205569 * S_NumCatalogPurchases
          +     1.14090099538367 * S_NumDealsPurchases
          +     -0.2600155774492 * S_NumDistPurchases
          +     1.31362002392113 * S_NumStorePurchases
          +     1.31465307763555 * S_NumWebPurchases
          +    -0.18041623858351 * S_NumWebVisitsMonth
          +    -0.12685084546738 * S_RFMstat  +     0.43500462904027 *
        S_RMntFrq  +    -0.81910738140729 * S_Recency
          +    -0.61936793661609 * S_Teenhome ;
   H1x2_4  =    -0.31415783692162 * S_AcceptedCmpTotal
          +     0.11061423227332 * S_Age  +    -0.65722939551233 * S_Frq
          +     -0.9063192568986 * S_Income  +      0.4013752851291 *
        S_Kidhome  +    -1.06795963585271 * S_Mnt  +     0.24969441019479 *
        S_MntFishProducts  +    -0.63550038240549 * S_MntFruits
          +     1.04454010114015 * S_MntGoldProds  +     0.89912571026653 *
        S_MntMeatProducts  +    -1.92356868621234 * S_MntSweetProducts
          +     -1.8642245725538 * S_MntWines  +     0.13416556054779 *
        S_MonthsAsCustomer  +    -1.01272407075887 * S_NumCatalogPurchases
          +     1.06486073796679 * S_NumDealsPurchases
          +    -0.04890191247577 * S_NumDistPurchases
          +     0.86871320720698 * S_NumStorePurchases
          +     0.03183587281884 * S_NumWebPurchases
          +     -0.4863802923315 * S_NumWebVisitsMonth
          +    -1.38034657666878 * S_RFMstat  +    -0.73640242597195 *
        S_RMntFrq  +     0.17186861211542 * S_Recency
          +    -0.39595339111048 * S_Teenhome ;
   H1x2_5  =     1.68315669988315 * S_AcceptedCmpTotal
          +    -1.67467335764173 * S_Age  +     1.29921539173109 * S_Frq
          +    -0.52305600367899 * S_Income  +     1.06261291858944 *
        S_Kidhome  +     1.77049882170904 * S_Mnt  +    -0.27692609509601 *
        S_MntFishProducts  +    -1.23166107817727 * S_MntFruits
          +    -2.21476398466362 * S_MntGoldProds  +     1.02542528622621 *
        S_MntMeatProducts  +     1.04913114036094 * S_MntSweetProducts
          +     0.30606520702636 * S_MntWines  +    -1.15158074964406 *
        S_MonthsAsCustomer  +     0.77918810586275 * S_NumCatalogPurchases
          +    -0.01160267590349 * S_NumDealsPurchases
          +    -0.92773075463083 * S_NumDistPurchases
          +    -0.83326680533995 * S_NumStorePurchases
          +    -1.16991058954473 * S_NumWebPurchases
          +    -2.07771165573723 * S_NumWebVisitsMonth
          +     0.59832456826177 * S_RFMstat  +     0.08151078945291 *
        S_RMntFrq  +     0.80165981122986 * S_Recency
          +     1.41798811088435 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.16600737981926 * AcceptedCmp10
          +     1.41264623988567 * AcceptedCmp20  +      1.0446306999234 *
        AcceptedCmp30  +    -1.00688604631169 * AcceptedCmp40
          +     0.64523782235527 * AcceptedCmp50  +    -1.76623980391232 *
        Complain0  +     1.64644530449125 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -0.39493094663506 * AcceptedCmp10
          +    -0.99095404154277 * AcceptedCmp20  +    -0.81166937096774 *
        AcceptedCmp30  +     0.14520361414777 * AcceptedCmp40
          +    -1.54302055254785 * AcceptedCmp50  +    -0.60600550413714 *
        Complain0  +    -3.04730224174859 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +      1.8650016934441 * AcceptedCmp10
          +     0.85335394099291 * AcceptedCmp20  +     0.47327521312159 *
        AcceptedCmp30  +    -2.64862753506152 * AcceptedCmp40
          +     0.65827168680229 * AcceptedCmp50  +     0.45516433167059 *
        Complain0  +    -0.62891111222764 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +    -0.31781332022679 * AcceptedCmp10
          +    -0.35773084257089 * AcceptedCmp20  +      0.0486072265688 *
        AcceptedCmp30  +     1.50494203860483 * AcceptedCmp40
          +     0.00499691981651 * AcceptedCmp50  +    -0.29977032190776 *
        Complain0  +     0.76473087756218 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     -0.4639041544815 * AcceptedCmp10
          +    -1.28977231764453 * AcceptedCmp20  +    -0.03597660273531 *
        AcceptedCmp30  +     0.17848986397338 * AcceptedCmp40
          +     0.06649914015182 * AcceptedCmp50  +    -0.95633404051563 *
        Complain0  +    -0.62555630659121 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -1.75926153465974 * Education2n_Cycle
          +     0.96255168005018 * EducationBasic  +     -1.2029563052774 *
        EducationGraduation  +    -0.22397098444024 * EducationMaster
          +    -0.10361472385198 * Marital_StatusDivorced
          +     0.05574820877885 * Marital_StatusMarried
          +     0.13130988205279 * Marital_StatusSingle
          +    -1.51165564425323 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     1.73281005101474 * Education2n_Cycle
          +    -0.51397811328576 * EducationBasic  +     1.64296402934617 *
        EducationGraduation  +     1.44983505587452 * EducationMaster
          +      0.0059353523794 * Marital_StatusDivorced
          +    -0.59379435051653 * Marital_StatusMarried
          +    -1.93587108708999 * Marital_StatusSingle
          +     2.02868236823401 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.11852280587389 * Education2n_Cycle
          +    -0.87963137637159 * EducationBasic  +      0.3212539101977 *
        EducationGraduation  +     0.16497026569775 * EducationMaster
          +    -0.74333797840386 * Marital_StatusDivorced
          +    -0.93061135117658 * Marital_StatusMarried
          +     1.04024182655844 * Marital_StatusSingle
          +     0.58313569749679 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     -1.2170050337036 * Education2n_Cycle
          +    -0.83332588435502 * EducationBasic  +     0.43242117148542 *
        EducationGraduation  +     1.71196178631559 * EducationMaster
          +    -3.01050675344463 * Marital_StatusDivorced
          +      0.1638723582239 * Marital_StatusMarried
          +     0.94548468360304 * Marital_StatusSingle
          +    -0.67333048623615 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +    -0.66774344191467 * Education2n_Cycle
          +     0.75591270317285 * EducationBasic  +    -0.29337325355435 *
        EducationGraduation  +     0.57450456442662 * EducationMaster
          +    -1.37013926274158 * Marital_StatusDivorced
          +    -0.34168970042779 * Marital_StatusMarried
          +     0.63383683543962 * Marital_StatusSingle
          +     0.75118887766443 * Marital_StatusTogether ;
   H1x2_1  =    -1.05245414685459 + H1x2_1 ;
   H1x2_2  =    -2.03581716915326 + H1x2_2 ;
   H1x2_3  =    -0.95118365599668 + H1x2_3 ;
   H1x2_4  =    -1.36171328515396 + H1x2_4 ;
   H1x2_5  =    -0.09438724866767 + H1x2_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
   H1x2_5  = 1.0 / (1.0 + EXP(MIN( - H1x2_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -3.66869890196477 * H1x1_1  +     3.66276995899936 * H1x1_2
          +      4.9852243803889 * H1x1_3  +    -3.40922134517979 * H1x1_4
          +     2.26435924995065 * H1x1_5 ;
   H2x1_2  =     1.35296027814603 * H1x1_1  +     0.16236277762099 * H1x1_2
          +      0.4094634018093 * H1x1_3  +    -1.05233334297087 * H1x1_4
          +    -0.51735435825901 * H1x1_5 ;
   H2x1_3  =    -3.57467050540101 * H1x1_1  +     1.96738498758928 * H1x1_2
          +      3.1519435691133 * H1x1_3  +    -2.73180541318793 * H1x1_4
          +     2.53621803266955 * H1x1_5 ;
   H2x1_4  =    -1.77897865469649 * H1x1_1  +    -0.34371813002239 * H1x1_2
          +     0.97655076671381 * H1x1_3  +    -0.53022688394362 * H1x1_4
          +     1.78452647837415 * H1x1_5 ;
   H2x1_5  =    -2.37976522756638 * H1x1_1  +     2.07473947277607 * H1x1_2
          +      3.6114905073808 * H1x1_3  +    -4.57668209905758 * H1x1_4
          +     2.97931581645784 * H1x1_5 ;
   H2x1_1  = H2x1_1  +      0.5090021095213 * H1x2_1
          +    -0.99996599039586 * H1x2_2  +     0.09317756017156 * H1x2_3
          +     0.07646136890595 * H1x2_4  +    -0.86729455140311 * H1x2_5 ;
   H2x1_2  = H2x1_2  +     0.54458122713319 * H1x2_1
          +    -1.01527351866283 * H1x2_2  +    -1.05264779960249 * H1x2_3
          +     2.00891057398994 * H1x2_4  +     0.23877185330348 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     0.45936122831356 * H1x2_1
          +    -0.78158455560098 * H1x2_2  +    -0.93755507764598 * H1x2_3
          +    -0.41290092050446 * H1x2_4  +    -1.08076286104858 * H1x2_5 ;
   H2x1_4  = H2x1_4  +     0.95365620475779 * H1x2_1
          +    -0.84100294393078 * H1x2_2  +     0.70463413466954 * H1x2_3
          +     1.80542761219637 * H1x2_4  +     0.45881360213194 * H1x2_5 ;
   H2x1_5  = H2x1_5  +     0.59629215620441 * H1x2_1
          +    -0.66300910076078 * H1x2_2  +     0.53748646350811 * H1x2_3
          +     0.40402787748621 * H1x2_4  +    -0.68066387330661 * H1x2_5 ;
   H2x1_1  =    -1.36901208947371 + H2x1_1 ;
   H2x1_2  =     1.02513270875023 + H2x1_2 ;
   H2x1_3  =     0.21017025934674 + H2x1_3 ;
   H2x1_4  =    -1.15214364807652 + H2x1_4 ;
   H2x1_5  =    -1.32590257108023 + H2x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
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
   P_DepVar1  =    -9.23664553457504 * H2x1_1  +     1.34611690798114 * H2x1_2
          +    -6.67077102946651 * H2x1_3  +    -1.67245227685142 * H2x1_4
          +    -7.67053346287177 * H2x1_5 ;
   P_DepVar1  =      3.4145227149582 + P_DepVar1 ;
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
drop S_:;
