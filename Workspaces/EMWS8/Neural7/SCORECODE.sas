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
   H11  =     0.13594465912127 * S_AcceptedCmpTotal  +    -0.04369874222877 * 
        S_Age  +     -0.0222974124172 * S_Frq  +    -0.11043551468483 * 
        S_Income  +    -0.32248758927071 * S_Kidhome
          +      0.0776161679259 * S_Mnt  +    -0.08725654580836 * 
        S_MntFishProducts  +     0.14236031403157 * S_MntFruits
          +    -0.48581570899412 * S_MntGoldProds  +     0.03414406983139 * 
        S_MntMeatProducts  +    -0.23271736394479 * S_MntSweetProducts
          +     0.43105893695077 * S_MntWines  +     0.31123874593742 * 
        S_MonthsAsCustomer  +    -0.19669815006873 * S_NumCatalogPurchases
          +    -0.68207513361313 * S_NumDealsPurchases
          +    -0.37964850256921 * S_NumDistPurchases
          +     0.36066480603854 * S_NumStorePurchases
          +     0.25966011307033 * S_NumWebPurchases
          +    -0.03958464718959 * S_NumWebVisitsMonth
          +    -0.12441133162569 * S_RFMstat  +     0.05838942731159 * 
        S_RMntFrq  +      0.2807801943237 * S_Recency
          +    -0.10186253847778 * S_Teenhome ;
   H12  =     0.03443433887324 * S_AcceptedCmpTotal  +    -0.33034112884719 * 
        S_Age  +    -0.29426561048486 * S_Frq  +      0.1259913339118 * 
        S_Income  +    -0.01525271628925 * S_Kidhome
          +     0.12125196820394 * S_Mnt  +     0.27499561817138 * 
        S_MntFishProducts  +     0.02702998039497 * S_MntFruits
          +     0.19117237676118 * S_MntGoldProds  +     0.14988798454777 * 
        S_MntMeatProducts  +    -0.12004881951738 * S_MntSweetProducts
          +     0.21492388287889 * S_MntWines  +    -0.32645982553718 * 
        S_MonthsAsCustomer  +     0.33162536777041 * S_NumCatalogPurchases
          +    -0.05060212016961 * S_NumDealsPurchases
          +    -0.14809619066524 * S_NumDistPurchases
          +    -0.02428798408125 * S_NumStorePurchases
          +     0.05554695337353 * S_NumWebPurchases
          +     -0.3347797414912 * S_NumWebVisitsMonth
          +    -0.08694305340873 * S_RFMstat  +    -0.34566171030649 * 
        S_RMntFrq  +     0.34878481829389 * S_Recency
          +     0.10894516705031 * S_Teenhome ;
   H13  =     0.00370096998686 * S_AcceptedCmpTotal  +    -0.51953611125691 * 
        S_Age  +     0.17877016433586 * S_Frq  +     0.06789251642015 * 
        S_Income  +    -0.05479760920776 * S_Kidhome
          +    -0.03872422009017 * S_Mnt  +    -0.14541111406951 * 
        S_MntFishProducts  +     0.02855123883129 * S_MntFruits
          +     0.25306699654279 * S_MntGoldProds  +     0.08795222920616 * 
        S_MntMeatProducts  +    -0.02903225924096 * S_MntSweetProducts
          +     0.15553330295402 * S_MntWines  +     0.02888022983016 * 
        S_MonthsAsCustomer  +    -0.17290950123626 * S_NumCatalogPurchases
          +     0.18029447475323 * S_NumDealsPurchases
          +     0.05934542805435 * S_NumDistPurchases
          +     0.11232970412862 * S_NumStorePurchases
          +    -0.10916601726159 * S_NumWebPurchases
          +    -0.01910812243665 * S_NumWebVisitsMonth
          +    -0.21344753217364 * S_RFMstat  +      0.1645823437477 * 
        S_RMntFrq  +    -0.40799689263706 * S_Recency
          +     0.02511588992095 * S_Teenhome ;
   H14  =    -0.61829421083246 * S_AcceptedCmpTotal  +    -0.16873052249719 * 
        S_Age  +     0.13439351408573 * S_Frq  +    -0.50103344614666 * 
        S_Income  +     0.31726096463976 * S_Kidhome
          +    -0.15181042208759 * S_Mnt  +     0.31922880035738 * 
        S_MntFishProducts  +     0.09386333655585 * S_MntFruits
          +    -0.12620631685892 * S_MntGoldProds  +    -0.92555808639473 * 
        S_MntMeatProducts  +    -0.15556710025124 * S_MntSweetProducts
          +     0.59625872106317 * S_MntWines  +    -0.14105032907988 * 
        S_MonthsAsCustomer  +    -0.27105883046781 * S_NumCatalogPurchases
          +    -0.05889648319294 * S_NumDealsPurchases
          +     0.04297768152043 * S_NumDistPurchases
          +     0.08289772168464 * S_NumStorePurchases
          +     0.02925451736459 * S_NumWebPurchases
          +    -0.34806744064693 * S_NumWebVisitsMonth
          +    -0.10075155542626 * S_RFMstat  +    -0.54230386384017 * 
        S_RMntFrq  +     0.54567939140523 * S_Recency
          +     0.75126712310981 * S_Teenhome ;
   H15  =     0.47250221965687 * S_AcceptedCmpTotal  +    -0.07487325745499 * 
        S_Age  +      0.0382122049104 * S_Frq  +     0.55347292090838 * 
        S_Income  +     -0.1831746721838 * S_Kidhome
          +    -0.12974904479016 * S_Mnt  +    -0.03773564357475 * 
        S_MntFishProducts  +    -0.08740721632052 * S_MntFruits
          +    -0.10157053454184 * S_MntGoldProds  +     0.52457296443385 * 
        S_MntMeatProducts  +    -0.13287009184486 * S_MntSweetProducts
          +    -0.37745748357546 * S_MntWines  +    -0.04143657431262 * 
        S_MonthsAsCustomer  +     0.67758682109997 * S_NumCatalogPurchases
          +     0.46814119938755 * S_NumDealsPurchases
          +     0.03182241038425 * S_NumDistPurchases
          +    -0.51911846047007 * S_NumStorePurchases
          +    -0.53954754105242 * S_NumWebPurchases
          +     1.07208473057077 * S_NumWebVisitsMonth
          +     0.12556098363101 * S_RFMstat  +    -0.05748040855256 * 
        S_RMntFrq  +    -0.95916513053649 * S_Recency
          +    -0.24142268692108 * S_Teenhome ;
   H11  = H11  +      0.0203211213932 * AcceptedCmp10
          +    -0.24671835063904 * AcceptedCmp20  +    -0.16470646765907 * 
        AcceptedCmp30  +     -0.4099897223583 * AcceptedCmp40
          +    -0.11336081432536 * AcceptedCmp50  +    -0.42649732753042 * 
        Complain0  +     -0.0416551568273 * HigherEducationBinary0 ;
   H12  = H12  +     0.02213559506685 * AcceptedCmp10
          +      0.0220571091041 * AcceptedCmp20  +     0.17399856069521 * 
        AcceptedCmp30  +    -0.18257604858416 * AcceptedCmp40
          +    -0.18091572749617 * AcceptedCmp50  +     0.05174557804497 * 
        Complain0  +    -0.05809342634244 * HigherEducationBinary0 ;
   H13  = H13  +     0.18240929240485 * AcceptedCmp10
          +     0.08046156423197 * AcceptedCmp20  +    -0.09196288275429 * 
        AcceptedCmp30  +     0.22693642674212 * AcceptedCmp40
          +    -0.22127877339648 * AcceptedCmp50  +     0.22787694199297 * 
        Complain0  +    -0.20447728360836 * HigherEducationBinary0 ;
   H14  = H14  +     0.15760334306304 * AcceptedCmp10
          +     0.25177195217647 * AcceptedCmp20  +     0.58646837477387 * 
        AcceptedCmp30  +     0.35808865186096 * AcceptedCmp40
          +     0.24279152213079 * AcceptedCmp50  +    -0.03682926397711 * 
        Complain0  +    -0.42398917474831 * HigherEducationBinary0 ;
   H15  = H15  +    -0.09968006776007 * AcceptedCmp10
          +     0.09022158834293 * AcceptedCmp20  +    -0.10842101964798 * 
        AcceptedCmp30  +    -0.13099813140438 * AcceptedCmp40
          +    -0.22167423223515 * AcceptedCmp50  +    -0.04428927537039 * 
        Complain0  +    -0.26182339546076 * HigherEducationBinary0 ;
   H11  = H11  +    -0.01959847584448 * Education2n_Cycle
          +    -0.23759194699722 * EducationBasic  +    -0.09694759635569 * 
        EducationGraduation  +     0.16905118469563 * EducationMaster
          +     0.09920310143649 * Marital_StatusDivorced
          +    -0.03469710828426 * Marital_StatusMarried
          +     0.04524816569771 * Marital_StatusSingle
          +    -0.00616333143464 * Marital_StatusTogether ;
   H12  = H12  +     0.05721184485318 * Education2n_Cycle
          +    -0.04983755787599 * EducationBasic  +    -0.05003868555341 * 
        EducationGraduation  +     0.14755035027548 * EducationMaster
          +     0.15544361606364 * Marital_StatusDivorced
          +    -0.04549024479337 * Marital_StatusMarried
          +    -0.22192209058914 * Marital_StatusSingle
          +     0.27320991984549 * Marital_StatusTogether ;
   H13  = H13  +     0.00075033011137 * Education2n_Cycle
          +    -0.11503072939964 * EducationBasic  +     -0.4136153442156 * 
        EducationGraduation  +    -0.10472711185558 * EducationMaster
          +     0.06080683366118 * Marital_StatusDivorced
          +    -0.29971612034722 * Marital_StatusMarried
          +    -0.28960939443613 * Marital_StatusSingle
          +     0.03465872178588 * Marital_StatusTogether ;
   H14  = H14  +      0.0962498664542 * Education2n_Cycle
          +     0.07755075978175 * EducationBasic  +     0.06918862821828 * 
        EducationGraduation  +    -0.19451337075589 * EducationMaster
          +    -0.27877133922419 * Marital_StatusDivorced
          +     0.25867038797563 * Marital_StatusMarried
          +    -0.17854477297284 * Marital_StatusSingle
          +     0.35391632150142 * Marital_StatusTogether ;
   H15  = H15  +     0.17326731400139 * Education2n_Cycle
          +    -0.09586091586548 * EducationBasic  +     0.08664696951776 * 
        EducationGraduation  +    -0.05191600320717 * EducationMaster
          +     0.30169513410559 * Marital_StatusDivorced
          +    -0.33752566748869 * Marital_StatusMarried
          +     0.43876556032036 * Marital_StatusSingle
          +    -0.37953091676086 * Marital_StatusTogether ;
   H11  =     1.66971140546954 + H11 ;
   H12  =    -2.00390550356371 + H12 ;
   H13  =    -1.90761416182049 + H13 ;
   H14  =     0.27067485542842 + H14 ;
   H15  =       -0.78426510761 + H15 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -0.93198210671128 * H11  +    -0.73339280381433 * H12
          +     0.55985350295663 * H13  +    -2.31937062548345 * H14
          +     3.74909670300365 * H15 ;
   P_DepVar1  =    -1.27659529547813 + P_DepVar1 ;
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
