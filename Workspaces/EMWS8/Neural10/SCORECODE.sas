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

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label H17 = 'Hidden: H1=7' ;

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
   H11  =    -0.57767711260067 * S_AcceptedCmpTotal  +    -0.24565202115681 * 
        S_Age  +     0.28237167938814 * S_Frq  +    -0.14233074057941 * 
        S_Income  +    -0.48552270697514 * S_Kidhome
          +     0.01742868253924 * S_Mnt  +     0.40285078623388 * 
        S_MntFishProducts  +    -0.05908477313283 * S_MntFruits
          +    -0.22243233697782 * S_MntGoldProds  +    -1.17693779318926 * 
        S_MntMeatProducts  +     0.01461501397476 * S_MntSweetProducts
          +     0.39575970251622 * S_MntWines  +     0.09444807481214 * 
        S_MonthsAsCustomer  +    -0.53872641456476 * S_NumCatalogPurchases
          +    -0.23083265836869 * S_NumDealsPurchases
          +     0.18257445063797 * S_NumDistPurchases
          +     0.38040778765927 * S_NumStorePurchases
          +     0.25798779223068 * S_NumWebPurchases
          +    -0.11407865954525 * S_NumWebVisitsMonth
          +    -0.27830792997478 * S_RFMstat  +    -0.16107125268737 * 
        S_RMntFrq  +     0.39037056980062 * S_Recency
          +     0.40608185739512 * S_Teenhome ;
   H12  =    -0.34424851582147 * S_AcceptedCmpTotal  +     0.13660525926359 * 
        S_Age  +     0.23405883754868 * S_Frq  +    -0.13337059355005 * 
        S_Income  +     0.23694585796773 * S_Kidhome
          +      0.4901632038269 * S_Mnt  +     0.05999578465889 * 
        S_MntFishProducts  +     0.03082414442522 * S_MntFruits
          +    -0.24918186130548 * S_MntGoldProds  +    -0.88501518933423 * 
        S_MntMeatProducts  +     0.12858064823466 * S_MntSweetProducts
          +     0.64920006983604 * S_MntWines  +     0.24344238362884 * 
        S_MonthsAsCustomer  +    -0.13156200891896 * S_NumCatalogPurchases
          +    -0.07783411363525 * S_NumDealsPurchases
          +     0.41281579441285 * S_NumDistPurchases
          +     0.22243606867939 * S_NumStorePurchases
          +     0.27174952755013 * S_NumWebPurchases
          +    -0.60083819502794 * S_NumWebVisitsMonth
          +    -0.13817336671298 * S_RFMstat  +      0.3324108445191 * 
        S_RMntFrq  +     0.36081297418321 * S_Recency
          +     0.22032899481074 * S_Teenhome ;
   H13  =    -0.62755413066471 * S_AcceptedCmpTotal  +    -0.10259881548923 * 
        S_Age  +     0.04904692713298 * S_Frq  +    -0.23224576059777 * 
        S_Income  +     0.20802765248799 * S_Kidhome
          +    -0.15268411625244 * S_Mnt  +    -0.48987569059027 * 
        S_MntFishProducts  +    -0.14244239893529 * S_MntFruits
          +     0.10351032202518 * S_MntGoldProds  +     0.32573653231071 * 
        S_MntMeatProducts  +     -0.3175031724236 * S_MntSweetProducts
          +     0.03692571780893 * S_MntWines  +     0.04373598871023 * 
        S_MonthsAsCustomer  +     0.02008637671067 * S_NumCatalogPurchases
          +     0.09455783738093 * S_NumDealsPurchases
          +    -0.06039304909585 * S_NumDistPurchases
          +    -0.10306611685636 * S_NumStorePurchases
          +    -0.00323837049664 * S_NumWebPurchases
          +    -0.02899441658685 * S_NumWebVisitsMonth
          +    -0.19007543493775 * S_RFMstat  +     -0.0760616923089 * 
        S_RMntFrq  +    -0.10387156664208 * S_Recency
          +     0.07932105576904 * S_Teenhome ;
   H14  =     0.59804906125706 * S_AcceptedCmpTotal  +       0.048025485549 * 
        S_Age  +      0.2385514201746 * S_Frq  +     0.08479106864241 * 
        S_Income  +     0.26381864865425 * S_Kidhome
          +     0.28889342773086 * S_Mnt  +    -0.21694370369651 * 
        S_MntFishProducts  +    -0.01726780576394 * S_MntFruits
          +    -0.03596803527884 * S_MntGoldProds  +     2.02178262606311 * 
        S_MntMeatProducts  +     0.28631958927098 * S_MntSweetProducts
          +    -0.70527934035036 * S_MntWines  +      0.0067588579357 * 
        S_MonthsAsCustomer  +     1.79201675789091 * S_NumCatalogPurchases
          +      0.8306613243419 * S_NumDealsPurchases
          +     0.31439474207278 * S_NumDistPurchases
          +    -0.62131474975756 * S_NumStorePurchases
          +    -1.04845843654047 * S_NumWebPurchases
          +     0.13255915506164 * S_NumWebVisitsMonth
          +     0.37283745370069 * S_RFMstat  +    -0.00709301508027 * 
        S_RMntFrq  +    -0.38407240508995 * S_Recency
          +    -0.01872338760754 * S_Teenhome ;
   H15  =     0.52947177432466 * S_AcceptedCmpTotal  +    -0.03040503223875 * 
        S_Age  +    -0.18793482590486 * S_Frq  +      0.6935756549022 * 
        S_Income  +    -0.71599192201946 * S_Kidhome
          +     0.07961196010588 * S_Mnt  +     0.08170851848499 * 
        S_MntFishProducts  +    -0.09701911126913 * S_MntFruits
          +    -0.10391699524462 * S_MntGoldProds  +     0.90380593073375 * 
        S_MntMeatProducts  +    -0.04455643318364 * S_MntSweetProducts
          +    -0.40964982046114 * S_MntWines  +     0.01724114428235 * 
        S_MonthsAsCustomer  +     0.68455913387131 * S_NumCatalogPurchases
          +     0.63537278643623 * S_NumDealsPurchases
          +     0.00410348485264 * S_NumDistPurchases
          +    -0.78287523583925 * S_NumStorePurchases
          +    -0.73614491225189 * S_NumWebPurchases
          +      1.5997596522354 * S_NumWebVisitsMonth
          +     0.06183649633006 * S_RFMstat  +    -0.50480588353928 * 
        S_RMntFrq  +    -1.33062648259706 * S_Recency
          +    -0.30553409454465 * S_Teenhome ;
   H16  =    -0.14433986599972 * S_AcceptedCmpTotal  +     0.33628191767642 * 
        S_Age  +     0.24327822994895 * S_Frq  +      0.2593103121451 * 
        S_Income  +    -0.23853377939411 * S_Kidhome
          +     0.01602761388094 * S_Mnt  +    -0.02328787783663 * 
        S_MntFishProducts  +     0.00968922234423 * S_MntFruits
          +     0.11007108230683 * S_MntGoldProds  +    -0.08340432424598 * 
        S_MntMeatProducts  +    -0.15484304103951 * S_MntSweetProducts
          +    -0.29018175577267 * S_MntWines  +      0.1806827453054 * 
        S_MonthsAsCustomer  +     0.22550821879825 * S_NumCatalogPurchases
          +    -0.30899603957269 * S_NumDealsPurchases
          +     0.11839581082877 * S_NumDistPurchases
          +     0.20149797391098 * S_NumStorePurchases
          +      0.1616654107491 * S_NumWebPurchases
          +    -0.19271225686551 * S_NumWebVisitsMonth
          +    -0.21711023135071 * S_RFMstat  +    -0.09549242746094 * 
        S_RMntFrq  +     0.01047910170627 * S_Recency
          +     -0.3020815550654 * S_Teenhome ;
   H17  =     0.16650809883276 * S_AcceptedCmpTotal  +    -0.11521097834811 * 
        S_Age  +     0.03152846916741 * S_Frq  +     0.40983774195025 * 
        S_Income  +    -0.48650790963695 * S_Kidhome
          +        0.11225072991 * S_Mnt  +    -0.28542831709139 * 
        S_MntFishProducts  +    -0.08029856004002 * S_MntFruits
          +     0.10583838856319 * S_MntGoldProds  +     -0.0290614813393 * 
        S_MntMeatProducts  +    -0.01096619652537 * S_MntSweetProducts
          +     0.04262480980522 * S_MntWines  +    -0.11669432787059 * 
        S_MonthsAsCustomer  +     0.33955671970437 * S_NumCatalogPurchases
          +    -0.18889005468777 * S_NumDealsPurchases
          +     0.17240918361456 * S_NumDistPurchases
          +     0.11704610685994 * S_NumStorePurchases
          +     0.23031393640508 * S_NumWebPurchases
          +     0.66002859819524 * S_NumWebVisitsMonth
          +     0.10481676703972 * S_RFMstat  +     0.11650152002645 * 
        S_RMntFrq  +    -1.13361206334881 * S_Recency
          +    -0.49528314963169 * S_Teenhome ;
   H11  = H11  +     0.13446791078699 * AcceptedCmp10
          +     0.04429639307375 * AcceptedCmp20  +    -0.13028621637792 * 
        AcceptedCmp30  +    -0.11510727830726 * AcceptedCmp40
          +     0.07003922045545 * AcceptedCmp50  +    -0.27409707884649 * 
        Complain0  +    -0.02797941377984 * HigherEducationBinary0 ;
   H12  = H12  +     0.01887281842523 * AcceptedCmp10
          +     0.17827111339959 * AcceptedCmp20  +      0.3834139334955 * 
        AcceptedCmp30  +    -0.35411645339173 * AcceptedCmp40
          +      0.3826012381491 * AcceptedCmp50  +    -0.04061443041339 * 
        Complain0  +    -0.39126131137052 * HigherEducationBinary0 ;
   H13  = H13  +    -0.22268259643926 * AcceptedCmp10
          +     0.06118190510274 * AcceptedCmp20  +    -0.03457087111822 * 
        AcceptedCmp30  +    -0.25288986318995 * AcceptedCmp40
          +    -0.04364508506974 * AcceptedCmp50  +     0.04941913394343 * 
        Complain0  +    -0.02882050630994 * HigherEducationBinary0 ;
   H14  = H14  +    -0.32915676878874 * AcceptedCmp10
          +    -0.10336607872934 * AcceptedCmp20  +      0.1864520200397 * 
        AcceptedCmp30  +      0.2697012880513 * AcceptedCmp40
          +    -0.09721530691585 * AcceptedCmp50  +     0.08632814308981 * 
        Complain0  +    -0.04468927647522 * HigherEducationBinary0 ;
   H15  = H15  +    -0.25850522391607 * AcceptedCmp10
          +    -0.17803227567502 * AcceptedCmp20  +     -0.1568149803523 * 
        AcceptedCmp30  +    -0.36395079518876 * AcceptedCmp40
          +    -0.34483131403759 * AcceptedCmp50  +     0.01555003563174 * 
        Complain0  +    -0.28594415027284 * HigherEducationBinary0 ;
   H16  = H16  +     0.01397091810403 * AcceptedCmp10
          +      0.0463641834644 * AcceptedCmp20  +    -0.03977784328807 * 
        AcceptedCmp30  +     -0.0160913549772 * AcceptedCmp40
          +    -0.07333292395504 * AcceptedCmp50  +    -0.06469674138589 * 
        Complain0  +     0.23688207596397 * HigherEducationBinary0 ;
   H17  = H17  +     0.01442797851067 * AcceptedCmp10
          +    -0.17701474731803 * AcceptedCmp20  +    -0.28388805248716 * 
        AcceptedCmp30  +    -0.27327948779158 * AcceptedCmp40
          +    -0.13168193470011 * AcceptedCmp50  +    -0.14127010572854 * 
        Complain0  +     0.33010560570117 * HigherEducationBinary0 ;
   H11  = H11  +     0.06224136252276 * Education2n_Cycle
          +     0.29245093750846 * EducationBasic  +     0.31778509227349 * 
        EducationGraduation  +     0.02842294928395 * EducationMaster
          +     0.43452164349556 * Marital_StatusDivorced
          +    -0.46042593279944 * Marital_StatusMarried
          +     0.45533323427801 * Marital_StatusSingle
          +    -0.35509352048115 * Marital_StatusTogether ;
   H12  = H12  +    -0.15299990287677 * Education2n_Cycle
          +     0.02656890344215 * EducationBasic  +    -0.05706986878494 * 
        EducationGraduation  +     0.29768497071806 * EducationMaster
          +     0.11002244687305 * Marital_StatusDivorced
          +     0.52424349905683 * Marital_StatusMarried
          +     -0.3969250366321 * Marital_StatusSingle
          +     0.61408135981641 * Marital_StatusTogether ;
   H13  = H13  +     0.07276942595416 * Education2n_Cycle
          +      0.2275172950841 * EducationBasic  +     -0.0976909406084 * 
        EducationGraduation  +     0.19833004850974 * EducationMaster
          +    -0.05300704180744 * Marital_StatusDivorced
          +     0.07805487103106 * Marital_StatusMarried
          +     0.20033339442958 * Marital_StatusSingle
          +     0.21842395296443 * Marital_StatusTogether ;
   H14  = H14  +    -0.17400384354577 * Education2n_Cycle
          +     0.11225346861296 * EducationBasic  +     -0.0442458725683 * 
        EducationGraduation  +     0.29409181424889 * EducationMaster
          +    -0.42379596543146 * Marital_StatusDivorced
          +     0.66738351478416 * Marital_StatusMarried
          +    -0.37324277578462 * Marital_StatusSingle
          +     0.69171114809758 * Marital_StatusTogether ;
   H15  = H15  +     0.14908434818686 * Education2n_Cycle
          +    -0.26880623082589 * EducationBasic  +     0.32861255886248 * 
        EducationGraduation  +    -0.20061683006464 * EducationMaster
          +     0.88761025578489 * Marital_StatusDivorced
          +    -0.85905539883385 * Marital_StatusMarried
          +     0.73467737758558 * Marital_StatusSingle
          +    -0.96025981753604 * Marital_StatusTogether ;
   H16  = H16  +     0.06300683576162 * Education2n_Cycle
          +    -0.33042090710562 * EducationBasic  +    -0.11648771701926 * 
        EducationGraduation  +    -0.12214773396989 * EducationMaster
          +    -0.11980818075461 * Marital_StatusDivorced
          +    -0.16572953052582 * Marital_StatusMarried
          +     0.34617421331983 * Marital_StatusSingle
          +    -0.11159044098264 * Marital_StatusTogether ;
   H17  = H17  +     0.01575681216702 * Education2n_Cycle
          +    -0.21038330244472 * EducationBasic  +    -0.13079470098556 * 
        EducationGraduation  +    -0.08509814368676 * EducationMaster
          +     0.14874886057777 * Marital_StatusDivorced
          +     -1.0463076915992 * Marital_StatusMarried
          +     0.72937563672763 * Marital_StatusSingle
          +    -0.65508763277891 * Marital_StatusTogether ;
   H11  =     0.01708225019201 + H11 ;
   H12  =    -0.57231824569332 + H12 ;
   H13  =    -1.03595775479654 + H13 ;
   H14  =     0.85578219568815 + H14 ;
   H15  =    -0.42875367789614 + H15 ;
   H16  =     -1.7731593212448 + H16 ;
   H17  =    -1.61118674590008 + H17 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -1.64435097572782 * H11  +    -1.62763570310445 * H12
          +     0.35714449519239 * H13  +     3.29820395171258 * H14
          +     3.62007777753694 * H15  +     0.58503229487751 * H16
          +     2.19267705077374 * H17 ;
   P_DepVar1  =    -2.18043832074058 + P_DepVar1 ;
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
