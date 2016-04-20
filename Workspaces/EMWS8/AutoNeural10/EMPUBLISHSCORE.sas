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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

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
   H1x1_1  =     -1.5235159368138 * S_AcceptedCmpTotal
          +     0.13941271308016 * S_Age  +    -0.84765157270503 * S_Frq
          +    -0.89386555046676 * S_Income  +     1.62709236629244 *
        S_Kidhome  +    -1.21416429819342 * S_Mnt  +    -1.95640488965637 *
        S_MntFishProducts  +    -0.08621024993404 * S_MntFruits
          +    -0.38536990009586 * S_MntGoldProds  +     3.12553097304637 *
        S_MntMeatProducts  +    -2.50680711036653 * S_MntSweetProducts
          +    -3.77770073626477 * S_MntWines  +     0.39118206604766 *
        S_MonthsAsCustomer  +     1.80485993754239 * S_NumCatalogPurchases
          +     3.21215425524619 * S_NumDealsPurchases
          +     0.08695198777156 * S_NumDistPurchases
          +    -2.58697971128295 * S_NumStorePurchases
          +    -0.44431924796059 * S_NumWebPurchases
          +     -1.4492698984921 * S_NumWebVisitsMonth
          +     2.16652214648037 * S_RFMstat  +    -0.48027961131639 *
        S_RMntFrq  +    -0.27206877070748 * S_Recency
          +    -0.34774852853763 * S_Teenhome ;
   H1x1_2  =     -0.5665707820209 * S_AcceptedCmpTotal
          +    -1.33582859121223 * S_Age  +     0.90483024742522 * S_Frq
          +    -2.00588558815165 * S_Income  +      3.0373198083895 *
        S_Kidhome  +      0.4356905004225 * S_Mnt  +     0.19619626354366 *
        S_MntFishProducts  +    -1.09111340184132 * S_MntFruits
          +     0.36844676336289 * S_MntGoldProds  +    -2.23832561375429 *
        S_MntMeatProducts  +    -0.18280081530069 * S_MntSweetProducts
          +     2.11599309139107 * S_MntWines  +     0.68147940490709 *
        S_MonthsAsCustomer  +    -0.73940648599397 * S_NumCatalogPurchases
          +    -0.83844506398484 * S_NumDealsPurchases
          +     0.60831936516804 * S_NumDistPurchases
          +     1.79084087761626 * S_NumStorePurchases
          +     1.17119196356453 * S_NumWebPurchases
          +    -3.63586683518718 * S_NumWebVisitsMonth
          +     0.60521990735996 * S_RFMstat  +     0.56036381019221 *
        S_RMntFrq  +     3.84599118896159 * S_Recency
          +     2.42091939246471 * S_Teenhome ;
   H1x1_3  =    -2.34864034635966 * S_AcceptedCmpTotal
          +     0.38417502023066 * S_Age  +     0.18241442054661 * S_Frq
          +    -0.36643054878492 * S_Income  +    -0.01464967964014 *
        S_Kidhome  +     0.13084033882631 * S_Mnt  +     1.43066752801424 *
        S_MntFishProducts  +     0.30678881611098 * S_MntFruits
          +    -0.35038082288662 * S_MntGoldProds  +    -6.79650673935808 *
        S_MntMeatProducts  +    -0.35154740308081 * S_MntSweetProducts
          +     4.53406963590593 * S_MntWines  +     0.35082802515055 *
        S_MonthsAsCustomer  +    -1.62489937965567 * S_NumCatalogPurchases
          +    -0.31484031572628 * S_NumDealsPurchases
          +    -0.18273941035679 * S_NumDistPurchases
          +     0.99501789733882 * S_NumStorePurchases
          +     1.32014078829379 * S_NumWebPurchases
          +    -1.34393498450215 * S_NumWebVisitsMonth
          +    -0.93549119966022 * S_RFMstat  +    -1.74825390192193 *
        S_RMntFrq  +     0.84406941726743 * S_Recency
          +     -0.5004540381333 * S_Teenhome ;
   H1x1_4  =     0.46772023050431 * S_AcceptedCmpTotal
          +    -0.64609651992636 * S_Age  +     0.65433283816167 * S_Frq
          +     0.97922442633265 * S_Income  +    -0.37705204232056 *
        S_Kidhome  +     0.00937752600299 * S_Mnt  +     -0.6082843846013 *
        S_MntFishProducts  +     -0.6227107898918 * S_MntFruits
          +      0.0291421224006 * S_MntGoldProds  +     1.09748402313736 *
        S_MntMeatProducts  +     0.00604619863622 * S_MntSweetProducts
          +    -0.74684537570529 * S_MntWines  +    -0.00266569003481 *
        S_MonthsAsCustomer  +     2.01081657735872 * S_NumCatalogPurchases
          +     1.19658719134196 * S_NumDealsPurchases
          +     0.87478204472986 * S_NumDistPurchases
          +    -0.20635856288784 * S_NumStorePurchases
          +    -0.89927356974242 * S_NumWebPurchases
          +     2.92285244132576 * S_NumWebVisitsMonth
          +    -0.10913907245142 * S_RFMstat  +     1.64233441899256 *
        S_RMntFrq  +    -3.64945971202322 * S_Recency
          +    -1.78841346993558 * S_Teenhome ;
   H1x1_5  =    -1.22491918863941 * S_AcceptedCmpTotal
          +     0.16201659993217 * S_Age  +     0.17189537824457 * S_Frq
          +    -0.87922900323563 * S_Income  +    -0.79268410231108 *
        S_Kidhome  +     0.62793961676074 * S_Mnt  +     0.20877761882787 *
        S_MntFishProducts  +     0.99367872286661 * S_MntFruits
          +     -0.4347564565882 * S_MntGoldProds  +    -0.16203279329295 *
        S_MntMeatProducts  +     0.81409215344356 * S_MntSweetProducts
          +     1.33482971563984 * S_MntWines  +    -1.17441882196058 *
        S_MonthsAsCustomer  +    -1.72330829533107 * S_NumCatalogPurchases
          +       -2.32617124568 * S_NumDealsPurchases
          +    -0.56589187730672 * S_NumDistPurchases
          +     1.07062299863482 * S_NumStorePurchases
          +     0.30077273739578 * S_NumWebPurchases
          +    -1.67745421915317 * S_NumWebVisitsMonth
          +      0.0530074713265 * S_RFMstat  +    -0.55969729655382 *
        S_RMntFrq  +     1.32196704233234 * S_Recency
          +     1.05470622089613 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.19875423759582 * AcceptedCmp10
          +    -1.84163905120352 * AcceptedCmp20  +    -1.63149345314696 *
        AcceptedCmp30  +    -1.52652349127913 * AcceptedCmp40
          +    -0.97663634905647 * AcceptedCmp50  +    -0.94352222509088 *
        Complain0  +    -0.63297203617355 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +      0.0505791781839 * AcceptedCmp10
          +    -0.19407965320143 * AcceptedCmp20  +     0.35537657271506 *
        AcceptedCmp30  +    -0.84577216347728 * AcceptedCmp40
          +     1.73085566880686 * AcceptedCmp50  +     0.05800586053869 *
        Complain0  +    -0.62505561129469 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.54825581966403 * AcceptedCmp10
          +     -0.0966204838125 * AcceptedCmp20  +    -1.31707923763053 *
        AcceptedCmp30  +    -1.21021077486757 * AcceptedCmp40
          +     3.29102250037389 * AcceptedCmp50  +    -0.16383687725206 *
        Complain0  +     0.00651446514934 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -1.18573650260336 * AcceptedCmp10
          +    -1.73968979068234 * AcceptedCmp20  +    -1.31277698137778 *
        AcceptedCmp30  +    -1.74346538593922 * AcceptedCmp40
          +    -0.72543919818299 * AcceptedCmp50  +    -0.06328353200384 *
        Complain0  +     0.74828735398796 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.19622185523754 * AcceptedCmp10
          +     -0.4643498903813 * AcceptedCmp20  +     0.69293644934542 *
        AcceptedCmp30  +     0.23077838801355 * AcceptedCmp40
          +     0.53061813608476 * AcceptedCmp50  +    -0.56870999936869 *
        Complain0  +      0.5917990310858 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     1.01422000032629 * Education2n_Cycle
          +    -0.77619298826287 * EducationBasic  +     0.35633748974614 *
        EducationGraduation  +     0.98491516107588 * EducationMaster
          +    -0.27797737429678 * Marital_StatusDivorced
          +    -0.08137635862327 * Marital_StatusMarried
          +     0.06275411820495 * Marital_StatusSingle
          +    -0.19979743343415 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.66224206017124 * Education2n_Cycle
          +     0.80729589186486 * EducationBasic  +     0.75931615755998 *
        EducationGraduation  +    -0.05470462753112 * EducationMaster
          +     0.05151426841441 * Marital_StatusDivorced
          +     1.19165082030442 * Marital_StatusMarried
          +    -1.08257080662611 * Marital_StatusSingle
          +     0.13534863375625 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.20065577451105 * Education2n_Cycle
          +    -0.14205714608311 * EducationBasic  +    -0.07077711368393 *
        EducationGraduation  +     0.40262329710793 * EducationMaster
          +      0.0238206459022 * Marital_StatusDivorced
          +     -0.4653244204261 * Marital_StatusMarried
          +     0.13051613619882 * Marital_StatusSingle
          +    -0.35951366919755 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     -0.8555672630555 * Education2n_Cycle
          +     0.58439980233621 * EducationBasic  +     0.04784356342853 *
        EducationGraduation  +    -0.79764992264249 * EducationMaster
          +     -0.7449356409222 * Marital_StatusDivorced
          +    -1.46604673521535 * Marital_StatusMarried
          +     0.74484771688818 * Marital_StatusSingle
          +    -1.91273009779071 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.45561096683674 * Education2n_Cycle
          +    -0.08389156101858 * EducationBasic  +    -1.24281299616343 *
        EducationGraduation  +    -0.00999807517226 * EducationMaster
          +    -3.68044980584423 * Marital_StatusDivorced
          +     3.14587407902338 * Marital_StatusMarried
          +    -2.66118132753024 * Marital_StatusSingle
          +     3.50991640149914 * Marital_StatusTogether ;
   H1x1_1  =    -2.87464368543529 + H1x1_1 ;
   H1x1_2  =     0.69745433976458 + H1x1_2 ;
   H1x1_3  =    -0.71895677211617 + H1x1_3 ;
   H1x1_4  =    -3.07619671976178 + H1x1_4 ;
   H1x1_5  =    -1.74345318000473 + H1x1_5 ;
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
   H1x2_1  =     0.02206354442682 * S_AcceptedCmpTotal
          +    -1.34753268833642 * S_Age  +    -2.08377331969695 * S_Frq
          +    -1.39854535380539 * S_Income  +     2.13620611759545 *
        S_Kidhome  +    -1.50515365217324 * S_Mnt  +     0.85499321862984 *
        S_MntFishProducts  +    -1.17732452790345 * S_MntFruits
          +     1.52355640622249 * S_MntGoldProds  +     1.31854239360457 *
        S_MntMeatProducts  +    -0.03265851293389 * S_MntSweetProducts
          +     2.18666242847435 * S_MntWines  +     0.08246249957908 *
        S_MonthsAsCustomer  +    -1.06901902236609 * S_NumCatalogPurchases
          +     0.89261880438741 * S_NumDealsPurchases
          +    -1.61647413199892 * S_NumDistPurchases
          +    -0.56304669045195 * S_NumStorePurchases
          +      0.7766837080945 * S_NumWebPurchases
          +     -2.2953497398902 * S_NumWebVisitsMonth
          +    -3.34547809243199 * S_RFMstat  +     0.07311937799261 *
        S_RMntFrq  +     -0.5786489917247 * S_Recency
          +    -1.06532056361117 * S_Teenhome ;
   H1x2_2  =      0.0341880757331 * S_AcceptedCmpTotal
          +     0.72034771315738 * S_Age  +     0.64155966340389 * S_Frq
          +    -1.06570008729492 * S_Income  +    -1.84532938869849 *
        S_Kidhome  +     0.94433555965982 * S_Mnt  +     1.23831916074831 *
        S_MntFishProducts  +     1.33415870886475 * S_MntFruits
          +    -0.51253922893993 * S_MntGoldProds  +     0.02241594009025 *
        S_MntMeatProducts  +     -1.2811169586741 * S_MntSweetProducts
          +     1.96686773881953 * S_MntWines  +     1.44655944802715 *
        S_MonthsAsCustomer  +    -1.18627316384798 * S_NumCatalogPurchases
          +     1.02431289724643 * S_NumDealsPurchases
          +    -0.90960173637405 * S_NumDistPurchases
          +     1.24283490404772 * S_NumStorePurchases
          +     1.23072413154592 * S_NumWebPurchases
          +    -0.21533378473931 * S_NumWebVisitsMonth
          +     1.26438704884008 * S_RFMstat  +      0.0014042871018 *
        S_RMntFrq  +     0.32357651423135 * S_Recency
          +    -0.49834512433407 * S_Teenhome ;
   H1x2_3  =    -0.57066024275015 * S_AcceptedCmpTotal
          +     0.16615358153136 * S_Age  +    -0.60017461612499 * S_Frq
          +    -0.21195793925019 * S_Income  +    -0.36049126996499 *
        S_Kidhome  +     0.97458542661118 * S_Mnt  +     0.62279162661518 *
        S_MntFishProducts  +    -0.44715765367363 * S_MntFruits
          +     0.91519163455361 * S_MntGoldProds  +     1.07312113398768 *
        S_MntMeatProducts  +    -1.61967017526055 * S_MntSweetProducts
          +    -1.88327677412185 * S_MntWines  +    -1.67067768979245 *
        S_MonthsAsCustomer  +    -0.64725516463464 * S_NumCatalogPurchases
          +    -0.26249596122198 * S_NumDealsPurchases
          +    -0.63328519804758 * S_NumDistPurchases
          +    -0.88467503575886 * S_NumStorePurchases
          +    -0.83120537310738 * S_NumWebPurchases
          +     1.40072282351719 * S_NumWebVisitsMonth
          +     1.42591300760984 * S_RFMstat  +     1.93593865100837 *
        S_RMntFrq  +     -1.2794275536508 * S_Recency
          +    -0.78582664529339 * S_Teenhome ;
   H1x2_4  =     0.70159995537759 * S_AcceptedCmpTotal
          +    -0.70199351793792 * S_Age  +     1.63573967285806 * S_Frq
          +     -0.1930098634567 * S_Income  +    -0.43173926207337 *
        S_Kidhome  +    -0.45239271926178 * S_Mnt  +    -0.14139816383874 *
        S_MntFishProducts  +    -0.70568635660703 * S_MntFruits
          +     1.68796268038024 * S_MntGoldProds  +     0.80481626355934 *
        S_MntMeatProducts  +     0.29831384975096 * S_MntSweetProducts
          +    -0.50792336172825 * S_MntWines  +     0.80425149159678 *
        S_MonthsAsCustomer  +    -2.26171302044375 * S_NumCatalogPurchases
          +     1.30167361451945 * S_NumDealsPurchases
          +     1.45457613716235 * S_NumDistPurchases
          +    -0.40226463685252 * S_NumStorePurchases
          +     0.36369161683572 * S_NumWebPurchases
          +    -2.65684851610403 * S_NumWebVisitsMonth
          +    -1.14810413235545 * S_RFMstat  +       1.291857215261 *
        S_RMntFrq  +     1.36572595403825 * S_Recency
          +    -0.54958418574963 * S_Teenhome ;
   H1x2_5  =    -1.00456225444665 * S_AcceptedCmpTotal
          +     0.19033874303798 * S_Age  +    -0.62578451616415 * S_Frq
          +    -0.96647190269426 * S_Income  +     1.77002676974464 *
        S_Kidhome  +    -0.53816249322166 * S_Mnt  +     0.21322270253871 *
        S_MntFishProducts  +     0.84210241961105 * S_MntFruits
          +     0.44153678515007 * S_MntGoldProds  +    -0.23120999196747 *
        S_MntMeatProducts  +     0.62950730283125 * S_MntSweetProducts
          +    -0.64043011108056 * S_MntWines  +    -2.74922907599662 *
        S_MonthsAsCustomer  +     0.67939322758717 * S_NumCatalogPurchases
          +    -0.54572162665338 * S_NumDealsPurchases
          +      0.9607390449318 * S_NumDistPurchases
          +    -0.03259470545754 * S_NumStorePurchases
          +     0.19202241423412 * S_NumWebPurchases
          +     0.61085831658456 * S_NumWebVisitsMonth
          +    -0.08582160429243 * S_RFMstat  +     1.73862452808565 *
        S_RMntFrq  +    -0.01216476188714 * S_Recency
          +     -0.3304403270473 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     0.83453601566539 * AcceptedCmp10
          +     0.59109136511077 * AcceptedCmp20  +     -0.9669340701943 *
        AcceptedCmp30  +    -2.31468262956126 * AcceptedCmp40
          +    -0.76277791850069 * AcceptedCmp50  +     0.30895289981412 *
        Complain0  +       0.147233855837 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     0.42789425545567 * AcceptedCmp10
          +     0.08505833889085 * AcceptedCmp20  +    -1.15112188313855 *
        AcceptedCmp30  +    -1.24362486486214 * AcceptedCmp40
          +     0.04131419116048 * AcceptedCmp50  +    -0.45255799355317 *
        Complain0  +    -0.32616423192953 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +    -0.03136360497649 * AcceptedCmp10
          +     0.33867713207886 * AcceptedCmp20  +     0.05809342990544 *
        AcceptedCmp30  +    -0.06416815079894 * AcceptedCmp40
          +     1.14617960682421 * AcceptedCmp50  +    -0.82461320336041 *
        Complain0  +     0.58944444655621 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +    -1.12705500616438 * AcceptedCmp10
          +      0.0487863004734 * AcceptedCmp20  +     1.30229008593765 *
        AcceptedCmp30  +      0.1726718549662 * AcceptedCmp40
          +     0.68443569845295 * AcceptedCmp50  +     2.39733248962228 *
        Complain0  +      -0.620937291929 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     1.42400460803453 * AcceptedCmp10
          +    -1.22361480936625 * AcceptedCmp20  +     1.31090186367202 *
        AcceptedCmp30  +    -1.40343404818254 * AcceptedCmp40
          +    -0.57377230862494 * AcceptedCmp50  +     0.58622740778295 *
        Complain0  +    -0.83222074319962 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     1.56508379719546 * Education2n_Cycle
          +     0.52302987210661 * EducationBasic  +     -0.0570045326497 *
        EducationGraduation  +    -0.01838790774804 * EducationMaster
          +    -2.32430245081383 * Marital_StatusDivorced
          +    -0.09815511356796 * Marital_StatusMarried
          +     0.13075504294551 * Marital_StatusSingle
          +     -0.0278875765201 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -0.85592920992847 * Education2n_Cycle
          +     0.93272618259957 * EducationBasic  +     0.48987674771079 *
        EducationGraduation  +    -1.12454002820451 * EducationMaster
          +    -0.65574603869224 * Marital_StatusDivorced
          +     1.54672472575294 * Marital_StatusMarried
          +    -1.59817602340208 * Marital_StatusSingle
          +     1.94381954546813 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.37093371596523 * Education2n_Cycle
          +    -2.05531065359129 * EducationBasic  +     1.16090743585078 *
        EducationGraduation  +     0.87547303889444 * EducationMaster
          +    -0.50911604604781 * Marital_StatusDivorced
          +     0.30403066135719 * Marital_StatusMarried
          +      0.1026950879545 * Marital_StatusSingle
          +     0.01000166524405 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     1.28509086202466 * Education2n_Cycle
          +     0.07860157688162 * EducationBasic  +     0.24607672351689 *
        EducationGraduation  +    -0.06009602645566 * EducationMaster
          +     1.07371507133318 * Marital_StatusDivorced
          +    -0.07097334129051 * Marital_StatusMarried
          +    -0.48339718568621 * Marital_StatusSingle
          +    -0.08900780355835 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +    -1.08109633810919 * Education2n_Cycle
          +    -0.54966585100103 * EducationBasic  +      0.5388683065169 *
        EducationGraduation  +     0.46960055830119 * EducationMaster
          +     1.04342893515504 * Marital_StatusDivorced
          +     1.16171312085032 * Marital_StatusMarried
          +    -0.30201646939913 * Marital_StatusSingle
          +     1.84122645884771 * Marital_StatusTogether ;
   H1x2_1  =     1.56970796025332 + H1x2_1 ;
   H1x2_2  =    -0.11766478836824 + H1x2_2 ;
   H1x2_3  =    -2.78218653641036 + H1x2_3 ;
   H1x2_4  =     0.51979515224467 + H1x2_4 ;
   H1x2_5  =     -0.4635890987824 + H1x2_5 ;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.04411772880581 * S_AcceptedCmpTotal
          +    -1.62725197326682 * S_Age  +    -1.99668213406033 * S_Frq
          +     -1.2265241921112 * S_Income  +     1.99702869958035 *
        S_Kidhome  +    -1.46762539068512 * S_Mnt  +     0.97784534044189 *
        S_MntFishProducts  +    -1.07945265688497 * S_MntFruits
          +     2.09306294956674 * S_MntGoldProds  +     1.46219664114361 *
        S_MntMeatProducts  +     0.10961158671991 * S_MntSweetProducts
          +     2.03040669273977 * S_MntWines  +     0.16536646017211 *
        S_MonthsAsCustomer  +    -0.88077951545076 * S_NumCatalogPurchases
          +     1.32256781010645 * S_NumDealsPurchases
          +    -1.43015438973619 * S_NumDistPurchases
          +    -0.63489289584421 * S_NumStorePurchases
          +     0.90508699686841 * S_NumWebPurchases
          +    -2.24234858061014 * S_NumWebVisitsMonth
          +     -2.9988027991146 * S_RFMstat  +     0.35987461993699 *
        S_RMntFrq  +    -1.09317668626142 * S_Recency
          +    -1.09925349438658 * S_Teenhome ;
   H1x3_2  =     0.10522923391314 * S_AcceptedCmpTotal
          +     0.68417479453112 * S_Age  +     0.46966162186743 * S_Frq
          +    -1.21537535753115 * S_Income  +    -1.87423294109672 *
        S_Kidhome  +     0.76913864731495 * S_Mnt  +     1.08535778796502 *
        S_MntFishProducts  +     1.27743864099826 * S_MntFruits
          +     -0.3186089651882 * S_MntGoldProds  +    -0.00224333051647 *
        S_MntMeatProducts  +    -1.28169616734092 * S_MntSweetProducts
          +     1.67350500234032 * S_MntWines  +     1.09584504562467 *
        S_MonthsAsCustomer  +    -1.45467876727494 * S_NumCatalogPurchases
          +     0.85965187264096 * S_NumDealsPurchases
          +    -1.15239933286756 * S_NumDistPurchases
          +     1.20800889102387 * S_NumStorePurchases
          +     1.08790389130242 * S_NumWebPurchases
          +    -0.13665551161149 * S_NumWebVisitsMonth
          +     1.02103499612659 * S_RFMstat  +    -0.12980097143044 *
        S_RMntFrq  +     0.65854311654256 * S_Recency
          +    -0.60999209572192 * S_Teenhome ;
   H1x3_3  =    -0.72575004293074 * S_AcceptedCmpTotal
          +     0.34932839743259 * S_Age  +     -0.2673460618328 * S_Frq
          +     0.25743187687481 * S_Income  +    -0.02172890929346 *
        S_Kidhome  +     1.21785656626837 * S_Mnt  +     0.37454359336223 *
        S_MntFishProducts  +    -0.32600053706408 * S_MntFruits
          +     0.57807148940534 * S_MntGoldProds  +     1.14736546512366 *
        S_MntMeatProducts  +    -1.41517082393978 * S_MntSweetProducts
          +    -1.44899595080061 * S_MntWines  +    -1.45520867126531 *
        S_MonthsAsCustomer  +    -0.33372174099196 * S_NumCatalogPurchases
          +     -0.5767607129654 * S_NumDealsPurchases
          +     -0.2643921429796 * S_NumDistPurchases
          +    -0.67417489911206 * S_NumStorePurchases
          +    -0.51423877684891 * S_NumWebPurchases
          +     1.40328299605176 * S_NumWebVisitsMonth
          +     1.35588787174957 * S_RFMstat  +     1.98416436137119 *
        S_RMntFrq  +     -0.8447362450681 * S_Recency
          +    -1.04372961736437 * S_Teenhome ;
   H1x3_4  =     0.05745684959388 * S_AcceptedCmpTotal
          +    -0.71077680161454 * S_Age  +      1.4854566142375 * S_Frq
          +    -0.32870416928843 * S_Income  +    -0.24944295149087 *
        S_Kidhome  +     -0.8312409740431 * S_Mnt  +    -0.09638646505384 *
        S_MntFishProducts  +    -0.86550491354678 * S_MntFruits
          +     1.46902858697296 * S_MntGoldProds  +      0.3661164136841 *
        S_MntMeatProducts  +     0.43108270077708 * S_MntSweetProducts
          +    -0.87140466249616 * S_MntWines  +     0.17511224898094 *
        S_MonthsAsCustomer  +    -2.66256923117027 * S_NumCatalogPurchases
          +      1.2821617657076 * S_NumDealsPurchases
          +     1.26584115202735 * S_NumDistPurchases
          +    -0.46597664211833 * S_NumStorePurchases
          +     0.45652363472866 * S_NumWebPurchases
          +    -2.66296112021252 * S_NumWebVisitsMonth
          +    -0.86670667018974 * S_RFMstat  +     0.60866041131732 *
        S_RMntFrq  +     1.31886754707923 * S_Recency
          +    -0.09949653139413 * S_Teenhome ;
   H1x3_5  =    -0.66850525418144 * S_AcceptedCmpTotal
          +     0.14331320698516 * S_Age  +    -0.82708146094779 * S_Frq
          +    -0.95718847240937 * S_Income  +     1.37375648833049 *
        S_Kidhome  +    -0.48314397401233 * S_Mnt  +     0.07047324834759 *
        S_MntFishProducts  +     0.86114312801139 * S_MntFruits
          +     0.54573348379533 * S_MntGoldProds  +    -0.05966372249273 *
        S_MntMeatProducts  +     0.47275063848217 * S_MntSweetProducts
          +    -0.62962007155261 * S_MntWines  +    -2.38081462831488 *
        S_MonthsAsCustomer  +     0.56594272689824 * S_NumCatalogPurchases
          +    -0.85162564171681 * S_NumDealsPurchases
          +     0.64631099667221 * S_NumDistPurchases
          +    -0.03081963858636 * S_NumStorePurchases
          +    -0.24124717624664 * S_NumWebPurchases
          +     0.56425980772372 * S_NumWebVisitsMonth
          +    -0.32254616624678 * S_RFMstat  +     1.84875225899832 *
        S_RMntFrq  +     0.08133312388911 * S_Recency
          +    -0.19004451996479 * S_Teenhome ;
   H1x3_1  = H1x3_1  +     1.03487942320068 * AcceptedCmp10
          +     0.77723443135875 * AcceptedCmp20  +    -1.04686858569959 *
        AcceptedCmp30  +    -1.87852311800194 * AcceptedCmp40
          +    -0.69838759011672 * AcceptedCmp50  +     0.50242045854463 *
        Complain0  +    -0.13339808164255 * HigherEducationBinary0 ;
   H1x3_2  = H1x3_2  +     0.39887299789564 * AcceptedCmp10
          +     0.12293700562648 * AcceptedCmp20  +    -1.41656670681309 *
        AcceptedCmp30  +    -1.04607557362847 * AcceptedCmp40
          +     0.02824649030864 * AcceptedCmp50  +    -0.46581865837196 *
        Complain0  +    -0.45913631308543 * HigherEducationBinary0 ;
   H1x3_3  = H1x3_3  +     0.20672868292414 * AcceptedCmp10
          +     0.52082182457868 * AcceptedCmp20  +     0.54911826263592 *
        AcceptedCmp30  +    -0.02400616289922 * AcceptedCmp40
          +     1.22209744911863 * AcceptedCmp50  +    -0.68243413694538 *
        Complain0  +     0.15620895311704 * HigherEducationBinary0 ;
   H1x3_4  = H1x3_4  +    -0.88269820758187 * AcceptedCmp10
          +    -0.19276892535938 * AcceptedCmp20  +     1.26789056018511 *
        AcceptedCmp30  +     0.04396979158385 * AcceptedCmp40
          +     0.54194186871284 * AcceptedCmp50  +     2.07766091697967 *
        Complain0  +    -0.43514178858246 * HigherEducationBinary0 ;
   H1x3_5  = H1x3_5  +     1.04303179873707 * AcceptedCmp10
          +    -1.29742389809739 * AcceptedCmp20  +     1.21708533617895 *
        AcceptedCmp30  +    -1.47807634614974 * AcceptedCmp40
          +     -0.7694244559597 * AcceptedCmp50  +     0.51798162453723 *
        Complain0  +    -0.95513113905832 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +     1.27822716215014 * Education2n_Cycle
          +     0.45900505383383 * EducationBasic  +    -0.35822992758656 *
        EducationGraduation  +     0.05949934527868 * EducationMaster
          +    -2.49973437075558 * Marital_StatusDivorced
          +    -0.18076948182574 * Marital_StatusMarried
          +     0.13498525495231 * Marital_StatusSingle
          +    -0.02365465636052 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +    -1.14981446246051 * Education2n_Cycle
          +     0.68006996858541 * EducationBasic  +    -0.06493857044709 *
        EducationGraduation  +    -1.22462805502453 * EducationMaster
          +       -0.59463732835 * Marital_StatusDivorced
          +     1.37741332427598 * Marital_StatusMarried
          +     -1.5833455713231 * Marital_StatusSingle
          +     1.79205360628448 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +     0.17779609626753 * Education2n_Cycle
          +    -2.22704675950779 * EducationBasic  +     1.30292325944162 *
        EducationGraduation  +     0.68083131423474 * EducationMaster
          +    -0.44569556289443 * Marital_StatusDivorced
          +     0.29918053103557 * Marital_StatusMarried
          +    -0.10337314064224 * Marital_StatusSingle
          +     0.04054221993299 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +     1.16412985277542 * Education2n_Cycle
          +     0.18806330813344 * EducationBasic  +     0.00212145829045 *
        EducationGraduation  +     0.00087354662697 * EducationMaster
          +     1.13881957277462 * Marital_StatusDivorced
          +    -0.35849807146313 * Marital_StatusMarried
          +    -0.22168731316885 * Marital_StatusSingle
          +    -0.22672306263461 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +    -1.25195599938207 * Education2n_Cycle
          +    -0.60946428681789 * EducationBasic  +     0.39993500009227 *
        EducationGraduation  +     0.43730905987249 * EducationMaster
          +     1.10774969923269 * Marital_StatusDivorced
          +     1.08409594073043 * Marital_StatusMarried
          +    -0.33145048007894 * Marital_StatusSingle
          +     1.68703837664761 * Marital_StatusTogether ;
   H1x3_1  =     1.76093149538288 + H1x3_1 ;
   H1x3_2  =    -0.11243980195421 + H1x3_2 ;
   H1x3_3  =    -2.59474781862449 + H1x3_3 ;
   H1x3_4  =     0.25376473610258 + H1x3_4 ;
   H1x3_5  =    -0.54808648261397 + H1x3_5 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x3_1  < _REC_EPS AND H1x3_1  > - _REC_EPS THEN
   H1x3_1  = H1x3_1  * H1x3_1 ;
   ELSE H1x3_1  = _REC_EPS ;
   IF H1x3_2  < _REC_EPS AND H1x3_2  > - _REC_EPS THEN
   H1x3_2  = H1x3_2  * H1x3_2 ;
   ELSE H1x3_2  = _REC_EPS ;
   IF H1x3_3  < _REC_EPS AND H1x3_3  > - _REC_EPS THEN
   H1x3_3  = H1x3_3  * H1x3_3 ;
   ELSE H1x3_3  = _REC_EPS ;
   IF H1x3_4  < _REC_EPS AND H1x3_4  > - _REC_EPS THEN
   H1x3_4  = H1x3_4  * H1x3_4 ;
   ELSE H1x3_4  = _REC_EPS ;
   IF H1x3_5  < _REC_EPS AND H1x3_5  > - _REC_EPS THEN
   H1x3_5  = H1x3_5  * H1x3_5 ;
   ELSE H1x3_5  = _REC_EPS ;
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     12.3694111963696 * H1x1_1  +     -9.1014019341077 * H1x1_2
          +    -14.9093780045901 * H1x1_3  +     25.4505756686259 * H1x1_4
          +    -13.3798044908382 * H1x1_5 ;
   P_DepVar1  = P_DepVar1  +     -0.2373753683635 * H1x2_1
          +    -0.03661175538589 * H1x2_2  +     0.29534813812803 * H1x2_3
          +     0.11908166898588 * H1x2_4  +      -0.241544638637 * H1x2_5 ;
   P_DepVar1  = P_DepVar1  +    -0.00276620815201 * H1x3_1
          +     0.00487849269566 * H1x3_2  +     0.01323887261394 * H1x3_3
          +     -0.0271389925801 * H1x3_4  +     0.00026595473892 * H1x3_5 ;
   P_DepVar1  =      4.0541137239843 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x1_4
H1x1_5
H1x2_1
H1x2_2
H1x2_3
H1x2_4
H1x2_5
H1x3_1
H1x3_2
H1x3_3
H1x3_4
H1x3_5
;
drop S_:;
