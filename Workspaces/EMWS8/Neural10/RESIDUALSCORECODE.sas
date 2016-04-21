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
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     -0.5578105652985 * S_AcceptedCmpTotal  +    -0.23241971580203 * 
        S_Age  +     0.28102175129839 * S_Frq  +    -0.14177438746231 * 
        S_Income  +    -0.45967008908227 * S_Kidhome
          +     0.02794787691339 * S_Mnt  +     0.39828117417224 * 
        S_MntFishProducts  +    -0.05411429665612 * S_MntFruits
          +     -0.2217613503816 * S_MntGoldProds  +    -1.14707919351018 * 
        S_MntMeatProducts  +     0.02010309795345 * S_MntSweetProducts
          +     0.39487005596698 * S_MntWines  +     0.08057978219112 * 
        S_MonthsAsCustomer  +    -0.52508994350253 * S_NumCatalogPurchases
          +    -0.23353175442713 * S_NumDealsPurchases
          +     0.18635522192442 * S_NumDistPurchases
          +     0.37209457890956 * S_NumStorePurchases
          +     0.25018232304823 * S_NumWebPurchases
          +    -0.12167684141831 * S_NumWebVisitsMonth
          +    -0.26994136429184 * S_RFMstat  +    -0.15457821756538 * 
        S_RMntFrq  +      0.3771094487511 * S_Recency
          +      0.3944445531753 * S_Teenhome ;
   H12  =    -0.33593118949604 * S_AcceptedCmpTotal  +     0.13223006727754 * 
        S_Age  +     0.22535213074211 * S_Frq  +    -0.12962185963332 * 
        S_Income  +     0.23329613045589 * S_Kidhome
          +     0.49569557196329 * S_Mnt  +     0.06134353482875 * 
        S_MntFishProducts  +     0.04198696278324 * S_MntFruits
          +    -0.23606182835876 * S_MntGoldProds  +    -0.86703877719801 * 
        S_MntMeatProducts  +     0.13899494079616 * S_MntSweetProducts
          +     0.64295088795338 * S_MntWines  +     0.23885718884975 * 
        S_MonthsAsCustomer  +    -0.13805721887365 * S_NumCatalogPurchases
          +    -0.09699498622435 * S_NumDealsPurchases
          +     0.40364070798795 * S_NumDistPurchases
          +      0.2162579072164 * S_NumStorePurchases
          +     0.26248410135079 * S_NumWebPurchases
          +    -0.59275827872509 * S_NumWebVisitsMonth
          +    -0.14095167046806 * S_RFMstat  +     0.33659399551436 * 
        S_RMntFrq  +     0.34734104517337 * S_Recency
          +     0.20490660913172 * S_Teenhome ;
   H13  =    -0.62678716035049 * S_AcceptedCmpTotal  +    -0.10291990746359 * 
        S_Age  +     0.05177116030679 * S_Frq  +    -0.22841348118599 * 
        S_Income  +     0.20139862021528 * S_Kidhome
          +    -0.14983527202624 * S_Mnt  +    -0.48769617499769 * 
        S_MntFishProducts  +    -0.14107770157183 * S_MntFruits
          +     0.10521088971296 * S_MntGoldProds  +     0.32521316479212 * 
        S_MntMeatProducts  +    -0.31623965627102 * S_MntSweetProducts
          +     0.04140559575505 * S_MntWines  +     0.04461152334998 * 
        S_MonthsAsCustomer  +     0.02235616550218 * S_NumCatalogPurchases
          +     0.09066191700879 * S_NumDealsPurchases
          +    -0.05769000978222 * S_NumDistPurchases
          +    -0.10089591692167 * S_NumStorePurchases
          +    -0.00088654116561 * S_NumWebPurchases
          +    -0.03166195000043 * S_NumWebVisitsMonth
          +    -0.19039498348905 * S_RFMstat  +    -0.07321662360003 * 
        S_RMntFrq  +    -0.10121013357627 * S_Recency
          +     0.07832397278234 * S_Teenhome ;
   H14  =     0.58751331473911 * S_AcceptedCmpTotal  +     0.04644967312033 * 
        S_Age  +      0.2396819202713 * S_Frq  +     0.09956520306725 * 
        S_Income  +      0.2502648333687 * S_Kidhome
          +     0.28121314160041 * S_Mnt  +    -0.20485047973809 * 
        S_MntFishProducts  +    -0.01460488281711 * S_MntFruits
          +    -0.03288844720922 * S_MntGoldProds  +     1.97837236467115 * 
        S_MntMeatProducts  +     0.28301480917504 * S_MntSweetProducts
          +     -0.6936431037386 * S_MntWines  +    -0.00532955644826 * 
        S_MonthsAsCustomer  +     1.76299586599682 * S_NumCatalogPurchases
          +     0.83424444661619 * S_NumDealsPurchases
          +     0.31333214543205 * S_NumDistPurchases
          +    -0.61732647242019 * S_NumStorePurchases
          +    -1.01955156895052 * S_NumWebPurchases
          +     0.13017609997428 * S_NumWebVisitsMonth
          +     0.35931716325651 * S_RFMstat  +    -0.00463731332856 * 
        S_RMntFrq  +    -0.38584375735163 * S_Recency
          +    -0.00542085930429 * S_Teenhome ;
   H15  =     0.53146760457913 * S_AcceptedCmpTotal  +    -0.03810411031475 * 
        S_Age  +    -0.18043958502932 * S_Frq  +     0.69595178597879 * 
        S_Income  +    -0.70952256145726 * S_Kidhome
          +     0.07336443095717 * S_Mnt  +     0.07813855224934 * 
        S_MntFishProducts  +    -0.09796868776705 * S_MntFruits
          +     -0.1026096257543 * S_MntGoldProds  +     0.90002400845078 * 
        S_MntMeatProducts  +    -0.05163420076554 * S_MntSweetProducts
          +    -0.41703750500589 * S_MntWines  +     0.01638041414141 * 
        S_MonthsAsCustomer  +      0.6832201856142 * S_NumCatalogPurchases
          +     0.63522682456102 * S_NumDealsPurchases
          +      0.0043057429215 * S_NumDistPurchases
          +    -0.76667751707574 * S_NumStorePurchases
          +    -0.73436881033241 * S_NumWebPurchases
          +     1.59331554601341 * S_NumWebVisitsMonth
          +     0.05617601605625 * S_RFMstat  +    -0.49130520428583 * 
        S_RMntFrq  +    -1.32582830247063 * S_Recency
          +     -0.3056726615596 * S_Teenhome ;
   H16  =    -0.14553823909316 * S_AcceptedCmpTotal  +     0.33407048981453 * 
        S_Age  +     0.23734269837078 * S_Frq  +     0.25406469036176 * 
        S_Income  +    -0.23632967504194 * S_Kidhome
          +      0.0179055062616 * S_Mnt  +    -0.02279077829807 * 
        S_MntFishProducts  +     0.01454079994702 * S_MntFruits
          +     0.11034379787627 * S_MntGoldProds  +    -0.08132325963546 * 
        S_MntMeatProducts  +    -0.15375043677096 * S_MntSweetProducts
          +    -0.28898229890805 * S_MntWines  +     0.18829471441599 * 
        S_MonthsAsCustomer  +     0.22198357500123 * S_NumCatalogPurchases
          +     -0.3032858959477 * S_NumDealsPurchases
          +     0.11343979556999 * S_NumDistPurchases
          +     0.19545021266061 * S_NumStorePurchases
          +      0.1566777684546 * S_NumWebPurchases
          +    -0.19390757759484 * S_NumWebVisitsMonth
          +    -0.21685141921823 * S_RFMstat  +    -0.08968120165679 * 
        S_RMntFrq  +     0.01331408958685 * S_Recency
          +    -0.29851875139164 * S_Teenhome ;
   H17  =     0.17466919198464 * S_AcceptedCmpTotal  +     -0.1121028079984 * 
        S_Age  +     0.02716231756399 * S_Frq  +     0.41157809710764 * 
        S_Income  +    -0.47847362741737 * S_Kidhome
          +     0.12197279598903 * S_Mnt  +    -0.28291208980103 * 
        S_MntFishProducts  +    -0.06478996635951 * S_MntFruits
          +     0.10519382804535 * S_MntGoldProds  +    -0.02084816137226 * 
        S_MntMeatProducts  +     0.00302745742685 * S_MntSweetProducts
          +     0.05093107260089 * S_MntWines  +    -0.11279856455812 * 
        S_MonthsAsCustomer  +     0.33888951696726 * S_NumCatalogPurchases
          +    -0.17510289915098 * S_NumDealsPurchases
          +     0.16952490494417 * S_NumDistPurchases
          +     0.11152117614204 * S_NumStorePurchases
          +     0.22594341376741 * S_NumWebPurchases
          +     0.64523546369354 * S_NumWebVisitsMonth
          +     0.10568501117555 * S_RFMstat  +     0.12784241795943 * 
        S_RMntFrq  +    -1.11651429004489 * S_Recency
          +    -0.48880952880502 * S_Teenhome ;
   H11  = H11  +     0.13977383212072 * AcceptedCmp10
          +     0.05060031718137 * AcceptedCmp20  +     -0.1285183348614 * 
        AcceptedCmp30  +    -0.10484468193603 * AcceptedCmp40
          +     0.05917719975803 * AcceptedCmp50  +    -0.26316725467429 * 
        Complain0  +    -0.01895470174434 * HigherEducationBinary0 ;
   H12  = H12  +     0.02037307448825 * AcceptedCmp10
          +     0.17835601132169 * AcceptedCmp20  +     0.38550714429243 * 
        AcceptedCmp30  +    -0.33756721331432 * AcceptedCmp40
          +     0.37598437397044 * AcceptedCmp50  +    -0.03377310181099 * 
        Complain0  +    -0.39065832156758 * HigherEducationBinary0 ;
   H13  = H13  +    -0.22454004936394 * AcceptedCmp10
          +     0.05941661323841 * AcceptedCmp20  +    -0.03592458555508 * 
        AcceptedCmp30  +    -0.25474371327449 * AcceptedCmp40
          +     -0.0455897206132 * AcceptedCmp50  +     0.04740536844263 * 
        Complain0  +    -0.02878944582567 * HigherEducationBinary0 ;
   H14  = H14  +     -0.3260094757606 * AcceptedCmp10
          +    -0.11375214865976 * AcceptedCmp20  +     0.17394162217532 * 
        AcceptedCmp30  +     0.25649528618828 * AcceptedCmp40
          +    -0.09775926020035 * AcceptedCmp50  +     0.07605735003987 * 
        Complain0  +    -0.03961404091649 * HigherEducationBinary0 ;
   H15  = H15  +    -0.25690837852364 * AcceptedCmp10
          +    -0.17111872756246 * AcceptedCmp20  +    -0.15594117886178 * 
        AcceptedCmp30  +    -0.35871566761504 * AcceptedCmp40
          +    -0.33301494609865 * AcceptedCmp50  +     0.02032122936961 * 
        Complain0  +    -0.28127713754103 * HigherEducationBinary0 ;
   H16  = H16  +     0.01304767072646 * AcceptedCmp10
          +     0.04542970824889 * AcceptedCmp20  +    -0.04086132015641 * 
        AcceptedCmp30  +    -0.01583924109084 * AcceptedCmp40
          +    -0.06928082094172 * AcceptedCmp50  +    -0.06496287745005 * 
        Complain0  +     0.23477563976328 * HigherEducationBinary0 ;
   H17  = H17  +     0.01615921378096 * AcceptedCmp10
          +    -0.15677614259446 * AcceptedCmp20  +    -0.26690848255992 * 
        AcceptedCmp30  +    -0.26633430402858 * AcceptedCmp40
          +     -0.1321548166386 * AcceptedCmp50  +    -0.12983847017281 * 
        Complain0  +     0.32518892495397 * HigherEducationBinary0 ;
   H11  = H11  +     0.05829614347592 * Education2n_Cycle
          +     0.28826698233517 * EducationBasic  +     0.30092045123127 * 
        EducationGraduation  +     0.01956517058574 * EducationMaster
          +     0.42319965972117 * Marital_StatusDivorced
          +    -0.45015157317991 * Marital_StatusMarried
          +     0.43076106925345 * Marital_StatusSingle
          +    -0.34625245410408 * Marital_StatusTogether ;
   H12  = H12  +    -0.15246834223268 * Education2n_Cycle
          +     0.02248997563033 * EducationBasic  +    -0.05434884503392 * 
        EducationGraduation  +     0.28747604127576 * EducationMaster
          +     0.11384347873072 * Marital_StatusDivorced
          +     0.51442453272823 * Marital_StatusMarried
          +    -0.38966058028661 * Marital_StatusSingle
          +     0.59654659814606 * Marital_StatusTogether ;
   H13  = H13  +     0.07291520243057 * Education2n_Cycle
          +     0.22798022739243 * EducationBasic  +    -0.09714428862174 * 
        EducationGraduation  +     0.19910048440114 * EducationMaster
          +    -0.05213342781535 * Marital_StatusDivorced
          +     0.07520352092928 * Marital_StatusMarried
          +     0.20175107471623 * Marital_StatusSingle
          +     0.21785232690504 * Marital_StatusTogether ;
   H14  = H14  +    -0.16241733679628 * Education2n_Cycle
          +     0.10611998985678 * EducationBasic  +    -0.03570492688548 * 
        EducationGraduation  +     0.29010545079762 * EducationMaster
          +    -0.40635592200933 * Marital_StatusDivorced
          +     0.64772941459031 * Marital_StatusMarried
          +    -0.36402842056603 * Marital_StatusSingle
          +     0.66760594472194 * Marital_StatusTogether ;
   H15  = H15  +      0.1484080088272 * Education2n_Cycle
          +    -0.26484833011693 * EducationBasic  +     0.32372570227867 * 
        EducationGraduation  +    -0.19830450172452 * EducationMaster
          +     0.87932592764844 * Marital_StatusDivorced
          +    -0.85946473083734 * Marital_StatusMarried
          +     0.74505733668545 * Marital_StatusSingle
          +    -0.94561469309103 * Marital_StatusTogether ;
   H16  = H16  +     0.06060112302425 * Education2n_Cycle
          +    -0.33181717926405 * EducationBasic  +    -0.11727908170163 * 
        EducationGraduation  +    -0.12441264886812 * EducationMaster
          +    -0.11861748280641 * Marital_StatusDivorced
          +    -0.15869097739395 * Marital_StatusMarried
          +     0.34415019828259 * Marital_StatusSingle
          +    -0.10748203749958 * Marital_StatusTogether ;
   H17  = H17  +      0.0204719144571 * Education2n_Cycle
          +    -0.21500190587821 * EducationBasic  +    -0.12457774765815 * 
        EducationGraduation  +    -0.08824349470153 * EducationMaster
          +     0.14995740697816 * Marital_StatusDivorced
          +    -1.01788822114068 * Marital_StatusMarried
          +     0.70532758126153 * Marital_StatusSingle
          +    -0.63335960879305 * Marital_StatusTogether ;
   H11  =     0.02607332365548 + H11 ;
   H12  =    -0.56666577494928 + H12 ;
   H13  =    -1.03772915602166 + H13 ;
   H14  =     0.84490585692811 + H14 ;
   H15  =     -0.4221012604846 + H15 ;
   H16  =     -1.7732139312938 + H16 ;
   H17  =    -1.59831075827511 + H17 ;
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
   P_DepVar1  =      -1.605577695663 * H11  +    -1.61358647892122 * H12
          +     0.34401900767527 * H13  +     3.24181562332148 * H14
          +     3.59380365492102 * H15  +     0.56941587287347 * H16
          +     2.13310046968058 * H17 ;
   P_DepVar1  =    -2.17258746401986 + P_DepVar1 ;
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
