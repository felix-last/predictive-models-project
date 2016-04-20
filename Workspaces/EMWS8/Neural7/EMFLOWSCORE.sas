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
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.49268542152723 * S_AcceptedCmpTotal  +     -0.0481397514569 *
        S_Age  +    -0.30437636824683 * S_Frq  +    -1.15179334457144 *
        S_Income  +     0.52341833722719 * S_Kidhome
          +    -0.21261714885662 * S_Mnt  +    -0.10196325382831 *
        S_MntFishProducts  +     0.18788251887399 * S_MntFruits
          +     0.07877248271808 * S_MntGoldProds  +     -0.3554186123772 *
        S_MntMeatProducts  +     0.26810834903306 * S_MntSweetProducts
          +      0.7572736068799 * S_MntWines  +    -0.11619352540399 *
        S_MonthsAsCustomer  +    -0.46080176244829 * S_NumCatalogPurchases
          +    -0.07601319156416 * S_NumDealsPurchases
          +    -0.37691059923172 * S_NumDistPurchases
          +     0.14479416923691 * S_NumStorePurchases
          +     0.22886116861382 * S_NumWebPurchases
          +    -1.05452266604504 * S_NumWebVisitsMonth
          +     0.11426625648846 * S_RFMstat  +    -0.46845377036873 *
        S_RMntFrq  +     1.39805990084367 * S_Recency
          +     0.91325795567367 * S_Teenhome ;
   H12  =     0.48640474281615 * S_AcceptedCmpTotal  +     0.03168788563965 *
        S_Age  +    -0.02802128226737 * S_Frq  +     0.52993214073901 *
        S_Income  +     0.24958351789577 * S_Kidhome
          +     0.25221072579725 * S_Mnt  +    -0.54431466149526 *
        S_MntFishProducts  +    -0.09969634201392 * S_MntFruits
          +     0.22251888175317 * S_MntGoldProds  +     2.21720479300716 *
        S_MntMeatProducts  +     0.08411214394291 * S_MntSweetProducts
          +    -0.83482542959891 * S_MntWines  +     0.06928323386075 *
        S_MonthsAsCustomer  +     1.61603076533547 * S_NumCatalogPurchases
          +     0.79919814392328 * S_NumDealsPurchases
          +     0.30394718497487 * S_NumDistPurchases
          +      -0.727130739278 * S_NumStorePurchases
          +    -0.92337052372179 * S_NumWebPurchases
          +     0.22125703025242 * S_NumWebVisitsMonth
          +     0.51615035692083 * S_RFMstat  +     0.09759485646525 *
        S_RMntFrq  +    -0.21632393786918 * S_Recency
          +    -0.09817720742254 * S_Teenhome ;
   H13  =    -0.14277955421105 * S_AcceptedCmpTotal  +     0.01891543541262 *
        S_Age  +    -0.09449326498218 * S_Frq  +    -0.03060296052615 *
        S_Income  +    -0.02210730279852 * S_Kidhome
          +     0.15705631910101 * S_Mnt  +     0.08573647183827 *
        S_MntFishProducts  +    -0.07727594473101 * S_MntFruits
          +     0.10800565745981 * S_MntGoldProds  +     0.16136844354024 *
        S_MntMeatProducts  +    -0.27592138838926 * S_MntSweetProducts
          +    -0.28884862043521 * S_MntWines  +    -0.26221449264568 *
        S_MonthsAsCustomer  +    -0.12893818317268 * S_NumCatalogPurchases
          +    -0.07260787713046 * S_NumDealsPurchases
          +    -0.11357594278299 * S_NumDistPurchases
          +    -0.12187788759653 * S_NumStorePurchases
          +    -0.12854188822638 * S_NumWebPurchases
          +     0.19328484993193 * S_NumWebVisitsMonth
          +     0.29126701299369 * S_RFMstat  +       0.295572030551 *
        S_RMntFrq  +    -0.17474693596234 * S_Recency
          +    -0.15767296223747 * S_Teenhome ;
   H14  =     0.02882140654096 * S_AcceptedCmpTotal  +     0.22754549790851 *
        S_Age  +     0.62237954814905 * S_Frq  +     0.32094678094502 *
        S_Income  +     -0.5159289111115 * S_Kidhome
          +    -0.06660708376246 * S_Mnt  +     0.23505454155784 *
        S_MntFishProducts  +     -0.1751094914934 * S_MntFruits
          +     0.28529181082906 * S_MntGoldProds  +    -0.86064239437512 *
        S_MntMeatProducts  +    -0.11869244038768 * S_MntSweetProducts
          +     0.54178192135459 * S_MntWines  +     0.01320164526542 *
        S_MonthsAsCustomer  +     -0.8775343676818 * S_NumCatalogPurchases
          +    -0.76643907891635 * S_NumDealsPurchases
          +     0.28173289049322 * S_NumDistPurchases
          +     0.65522454520442 * S_NumStorePurchases
          +     0.68112901460293 * S_NumWebPurchases
          +    -0.49101731268641 * S_NumWebVisitsMonth
          +    -0.19434806570231 * S_RFMstat  +    -0.00086194515061 *
        S_RMntFrq  +     0.47432332222746 * S_Recency
          +    -0.05016870847242 * S_Teenhome ;
   H15  =    -0.53993167927046 * S_AcceptedCmpTotal  +    -0.01376485869661 *
        S_Age  +     0.13417021721762 * S_Frq  +    -0.46098316120524 *
        S_Income  +     0.79883165437194 * S_Kidhome
          +    -0.08868062204795 * S_Mnt  +     0.27921118443695 *
        S_MntFishProducts  +     0.07333408727108 * S_MntFruits
          +    -0.12699517331566 * S_MntGoldProds  +    -0.83076183794341 *
        S_MntMeatProducts  +     0.07046050445165 * S_MntSweetProducts
          +     0.39887580122915 * S_MntWines  +     0.22266979348172 *
        S_MonthsAsCustomer  +    -0.63148593968536 * S_NumCatalogPurchases
          +    -0.54240596184474 * S_NumDealsPurchases
          +     0.07214067132859 * S_NumDistPurchases
          +     0.63136920851698 * S_NumStorePurchases
          +     0.67036298761526 * S_NumWebPurchases
          +     -1.5590147163003 * S_NumWebVisitsMonth
          +    -0.14672746638498 * S_RFMstat  +     0.45614757001513 *
        S_RMntFrq  +     1.43166375146019 * S_Recency
          +     0.33608033306213 * S_Teenhome ;
   H11  = H11  +     0.00378267229722 * AcceptedCmp10
          +     0.35869089787338 * AcceptedCmp20  +     0.34289379925327 *
        AcceptedCmp30  +     0.52644241458012 * AcceptedCmp40
          +    -0.13608418232323 * AcceptedCmp50  +      0.0959964311844 *
        Complain0  +    -0.33986310453812 * HigherEducationBinary0 ;
   H12  = H12  +    -0.20844623079893 * AcceptedCmp10
          +      0.2510523434536 * AcceptedCmp20  +     0.23001544402014 *
        AcceptedCmp30  +     0.31575100635625 * AcceptedCmp40
          +    -0.27770609908664 * AcceptedCmp50  +     0.23396693724368 *
        Complain0  +    -0.14587691179074 * HigherEducationBinary0 ;
   H13  = H13  +    -0.01749375115567 * AcceptedCmp10
          +     0.03272810660889 * AcceptedCmp20  +     0.05919744501073 *
        AcceptedCmp30  +    -0.05281709288559 * AcceptedCmp40
          +     0.17878522964245 * AcceptedCmp50  +    -0.15875476707826 *
        Complain0  +     0.12807090869788 * HigherEducationBinary0 ;
   H14  = H14  +     0.09851664636541 * AcceptedCmp10
          +     0.31377564249189 * AcceptedCmp20  +     0.52269532116349 *
        AcceptedCmp30  +     0.02591777861146 * AcceptedCmp40
          +     0.32944924737684 * AcceptedCmp50  +     0.47187246513641 *
        Complain0  +     0.20705632210077 * HigherEducationBinary0 ;
   H15  = H15  +     0.25267160740134 * AcceptedCmp10
          +     0.37928521134817 * AcceptedCmp20  +     0.14104403552359 *
        AcceptedCmp30  +     0.11544762492946 * AcceptedCmp40
          +     0.50603978517673 * AcceptedCmp50  +    -0.00034162341159 *
        Complain0  +    -0.00425270701284 * HigherEducationBinary0 ;
   H11  = H11  +     0.21764897070728 * Education2n_Cycle
          +    -0.08901311303506 * EducationBasic  +      0.0272878010337 *
        EducationGraduation  +     0.05103320060897 * EducationMaster
          +    -0.43880138896132 * Marital_StatusDivorced
          +     1.07801970957052 * Marital_StatusMarried
          +    -1.01564319756795 * Marital_StatusSingle
          +     1.06803078970545 * Marital_StatusTogether ;
   H12  = H12  +     0.20450416319293 * Education2n_Cycle
          +    -0.09602008725654 * EducationBasic  +     0.01841737017681 *
        EducationGraduation  +     0.06732737733154 * EducationMaster
          +    -0.26753605060913 * Marital_StatusDivorced
          +     0.38107608670301 * Marital_StatusMarried
          +     -0.1436641790467 * Marital_StatusSingle
          +     0.51604025961093 * Marital_StatusTogether ;
   H13  = H13  +     0.06208521737633 * Education2n_Cycle
          +    -0.33631443686566 * EducationBasic  +     0.16608152113657 *
        EducationGraduation  +     0.12802026359779 * EducationMaster
          +    -0.08001329849816 * Marital_StatusDivorced
          +      0.0371075570789 * Marital_StatusMarried
          +     0.00370467546319 * Marital_StatusSingle
          +    -0.00676233309382 * Marital_StatusTogether ;
   H14  = H14  +     0.23121044223136 * Education2n_Cycle
          +     0.20063897603031 * EducationBasic  +    -0.03690411024016 *
        EducationGraduation  +    -0.05893576310907 * EducationMaster
          +     0.13587543683769 * Marital_StatusDivorced
          +    -0.45903453868087 * Marital_StatusMarried
          +      0.3498299821692 * Marital_StatusSingle
          +    -0.24987552246214 * Marital_StatusTogether ;
   H15  = H15  +    -0.25453618071143 * Education2n_Cycle
          +     0.10531942203707 * EducationBasic  +    -0.11067812258079 *
        EducationGraduation  +     0.22861584696672 * EducationMaster
          +    -0.23512394203797 * Marital_StatusDivorced
          +       0.710701930681 * Marital_StatusMarried
          +    -0.56116525410203 * Marital_StatusSingle
          +     0.87274230285244 * Marital_StatusTogether ;
   H11  =     1.97354382834855 + H11 ;
   H12  =     0.19040674177137 + H12 ;
   H13  =    -2.95812486901971 + H13 ;
   H14  =     0.68206105329025 + H14 ;
   H15  =    -0.15880184648294 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
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
   P_DepVar1  =    -3.25756779032103 * H11  +     3.11613473869222 * H12
          +     0.05860782492357 * H13  +    -2.24562119342825 * H14
          +    -3.55426417229617 * H15 ;
   P_DepVar1  =    -1.11502795304759 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
;
drop S_:;
