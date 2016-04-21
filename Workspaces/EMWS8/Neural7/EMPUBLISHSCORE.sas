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
   H11  =     -0.4861272258755 * S_AcceptedCmpTotal  +    -0.05189637306711 *
        S_Age  +    -0.30315098258233 * S_Frq  +    -1.10363388640565 *
        S_Income  +     0.49482308043138 * S_Kidhome
          +    -0.21806866463657 * S_Mnt  +    -0.07009712511746 *
        S_MntFishProducts  +     0.18128886998186 * S_MntFruits
          +     0.08667708198542 * S_MntGoldProds  +    -0.34562904453263 *
        S_MntMeatProducts  +     0.24207000188265 * S_MntSweetProducts
          +     0.73913803788025 * S_MntWines  +    -0.12494500176265 *
        S_MonthsAsCustomer  +    -0.45211334823309 * S_NumCatalogPurchases
          +    -0.06511788072827 * S_NumDealsPurchases
          +    -0.38159596394204 * S_NumDistPurchases
          +     0.15411219967595 * S_NumStorePurchases
          +     0.21139765335417 * S_NumWebPurchases
          +    -1.04359200301033 * S_NumWebVisitsMonth
          +      0.1090284887692 * S_RFMstat  +    -0.44883493072151 *
        S_RMntFrq  +     1.34562786069569 * S_Recency
          +     0.89460449958447 * S_Teenhome ;
   H12  =     0.49470690944633 * S_AcceptedCmpTotal  +      0.0261154901688 *
        S_Age  +    -0.04461338015446 * S_Frq  +     0.49903480336525 *
        S_Income  +     0.23698260075506 * S_Kidhome
          +     0.24476004659493 * S_Mnt  +    -0.49492355746365 *
        S_MntFishProducts  +    -0.09271328974329 * S_MntFruits
          +     0.20870223796971 * S_MntGoldProds  +     2.14489337337229 *
        S_MntMeatProducts  +     0.05836783904648 * S_MntSweetProducts
          +    -0.80559423936695 * S_MntWines  +     0.05650618948417 *
        S_MonthsAsCustomer  +     1.52325923960607 * S_NumCatalogPurchases
          +     0.75951783049608 * S_NumDealsPurchases
          +     0.27731850886303 * S_NumDistPurchases
          +    -0.72597847158122 * S_NumStorePurchases
          +    -0.87186594418005 * S_NumWebPurchases
          +     0.22778956336256 * S_NumWebVisitsMonth
          +     0.52707843426664 * S_RFMstat  +     0.08310736513647 *
        S_RMntFrq  +    -0.24127828094269 * S_Recency
          +    -0.09777624700028 * S_Teenhome ;
   H13  =    -0.14339467136572 * S_AcceptedCmpTotal  +     0.01822297952084 *
        S_Age  +    -0.09520130583725 * S_Frq  +    -0.03136906489645 *
        S_Income  +    -0.02135707281355 * S_Kidhome
          +       0.155894017168 * S_Mnt  +     0.08475472787843 *
        S_MntFishProducts  +    -0.07789908506466 * S_MntFruits
          +     0.10660062798043 * S_MntGoldProds  +     0.16015984966551 *
        S_MntMeatProducts  +    -0.27612516960004 * S_MntSweetProducts
          +     -0.2896840938935 * S_MntWines  +    -0.26254012296363 *
        S_MonthsAsCustomer  +    -0.12998608904182 * S_NumCatalogPurchases
          +    -0.07354863705565 * S_NumDealsPurchases
          +    -0.11447983414298 * S_NumDistPurchases
          +    -0.12215729534897 * S_NumStorePurchases
          +    -0.12902195457851 * S_NumWebPurchases
          +     0.19434933394862 * S_NumWebVisitsMonth
          +     0.28975506236609 * S_RFMstat  +     0.29422521951226 *
        S_RMntFrq  +    -0.17552894408192 * S_Recency
          +     -0.1580830073017 * S_Teenhome ;
   H14  =     0.02093644707827 * S_AcceptedCmpTotal  +     0.20395783918661 *
        S_Age  +     0.59442731897797 * S_Frq  +     0.29119798252337 *
        S_Income  +    -0.45406848052616 * S_Kidhome
          +    -0.07771670260258 * S_Mnt  +     0.22748787488449 *
        S_MntFishProducts  +    -0.17850998839546 * S_MntFruits
          +     0.26951758688823 * S_MntGoldProds  +    -0.79968061180107 *
        S_MntMeatProducts  +     -0.1140667580899 * S_MntSweetProducts
          +      0.4869411024289 * S_MntWines  +    -0.01712813082958 *
        S_MonthsAsCustomer  +    -0.84487773781523 * S_NumCatalogPurchases
          +     -0.7419997885817 * S_NumDealsPurchases
          +     0.27831770188348 * S_NumDistPurchases
          +     0.59857930354045 * S_NumStorePurchases
          +     0.64048264413595 * S_NumWebPurchases
          +    -0.50793007710291 * S_NumWebVisitsMonth
          +    -0.14149333808405 * S_RFMstat  +     0.01746285773092 *
        S_RMntFrq  +     0.40903481897501 * S_Recency
          +    -0.09082840454575 * S_Teenhome ;
   H15  =    -0.54395842220188 * S_AcceptedCmpTotal  +    -0.00659873517805 *
        S_Age  +     0.13328067508696 * S_Frq  +    -0.40683362094427 *
        S_Income  +     0.78347324989919 * S_Kidhome
          +    -0.08815491299054 * S_Mnt  +     0.24650131354859 *
        S_MntFishProducts  +     0.08184618135481 * S_MntFruits
          +    -0.12412058422094 * S_MntGoldProds  +    -0.82851470750716 *
        S_MntMeatProducts  +     0.04998663129465 * S_MntSweetProducts
          +     0.40431404211888 * S_MntWines  +     0.20441979242265 *
        S_MonthsAsCustomer  +    -0.59560487920908 * S_NumCatalogPurchases
          +    -0.51611441201596 * S_NumDealsPurchases
          +     0.08384183916368 * S_NumDistPurchases
          +     0.61287235664869 * S_NumStorePurchases
          +      0.6529111332187 * S_NumWebPurchases
          +    -1.46254898694754 * S_NumWebVisitsMonth
          +    -0.12654274035522 * S_RFMstat  +     0.44674987490347 *
        S_RMntFrq  +     1.38435640479916 * S_Recency
          +     0.33296597278129 * S_Teenhome ;
   H11  = H11  +    -0.00998851481276 * AcceptedCmp10
          +     0.32921116293054 * AcceptedCmp20  +     0.31125214601572 *
        AcceptedCmp30  +     0.49394812035071 * AcceptedCmp40
          +    -0.13967719688623 * AcceptedCmp50  +     0.10069638637668 *
        Complain0  +    -0.33122877949584 * HigherEducationBinary0 ;
   H12  = H12  +    -0.19856686646083 * AcceptedCmp10
          +     0.23310696712955 * AcceptedCmp20  +     0.20346336135422 *
        AcceptedCmp30  +     0.30256624409423 * AcceptedCmp40
          +    -0.29335754278392 * AcceptedCmp50  +     0.21323212558806 *
        Complain0  +    -0.13556600599489 * HigherEducationBinary0 ;
   H13  = H13  +    -0.01722105367877 * AcceptedCmp10
          +     0.03291794356955 * AcceptedCmp20  +     0.05944626529099 *
        AcceptedCmp30  +    -0.05221243291111 * AcceptedCmp40
          +     0.17912917985939 * AcceptedCmp50  +    -0.15861965360776 *
        Complain0  +     0.12900426780961 * HigherEducationBinary0 ;
   H14  = H14  +     0.06387950776559 * AcceptedCmp10
          +      0.2872534864949 * AcceptedCmp20  +     0.51726192943362 *
        AcceptedCmp30  +     0.00602188882249 * AcceptedCmp40
          +     0.32401593400636 * AcceptedCmp50  +     0.46704484165073 *
        Complain0  +     0.18433576051792 * HigherEducationBinary0 ;
   H15  = H15  +      0.2705244136245 * AcceptedCmp10
          +     0.37082512037556 * AcceptedCmp20  +     0.13484905564511 *
        AcceptedCmp30  +      0.0945945695678 * AcceptedCmp40
          +     0.49264779479372 * AcceptedCmp50  +     0.02840120006931 *
        Complain0  +     0.01012130065838 * HigherEducationBinary0 ;
   H11  = H11  +     0.19487730016213 * Education2n_Cycle
          +    -0.07970756533219 * EducationBasic  +    -0.00249127525942 *
        EducationGraduation  +     0.05566108043576 * EducationMaster
          +    -0.44050788959765 * Marital_StatusDivorced
          +     1.05705004944669 * Marital_StatusMarried
          +    -0.96451435752717 * Marital_StatusSingle
          +     1.00265132362409 * Marital_StatusTogether ;
   H12  = H12  +     0.19745100530679 * Education2n_Cycle
          +    -0.10079088668307 * EducationBasic  +     0.02404299835038 *
        EducationGraduation  +      0.0340690439206 * EducationMaster
          +    -0.21967258137916 * Marital_StatusDivorced
          +     0.37571162461413 * Marital_StatusMarried
          +    -0.14215095739521 * Marital_StatusSingle
          +     0.46670526265514 * Marital_StatusTogether ;
   H13  = H13  +      0.0623691087211 * Education2n_Cycle
          +    -0.33655773682797 * EducationBasic  +     0.16528476523732 *
        EducationGraduation  +     0.12766333771333 * EducationMaster
          +     -0.0802366153164 * Marital_StatusDivorced
          +     0.03786873526752 * Marital_StatusMarried
          +     0.00312869012906 * Marital_StatusSingle
          +    -0.00653511004071 * Marital_StatusTogether ;
   H14  = H14  +     0.23561684440206 * Education2n_Cycle
          +     0.19772542317614 * EducationBasic  +    -0.01658765862665 *
        EducationGraduation  +    -0.04275711813742 * EducationMaster
          +      0.1354388000076 * Marital_StatusDivorced
          +    -0.39881989621029 * Marital_StatusMarried
          +     0.31082414702417 * Marital_StatusSingle
          +    -0.23211065362686 * Marital_StatusTogether ;
   H15  = H15  +    -0.23088632938738 * Education2n_Cycle
          +     0.08999420370752 * EducationBasic  +    -0.11102395071934 *
        EducationGraduation  +     0.22556288381362 * EducationMaster
          +    -0.21036089859855 * Marital_StatusDivorced
          +     0.68363662719948 * Marital_StatusMarried
          +    -0.52766746827942 * Marital_StatusSingle
          +     0.85776128537024 * Marital_StatusTogether ;
   H11  =     1.95018025194886 + H11 ;
   H12  =     0.17843928986556 + H12 ;
   H13  =    -2.95793338914875 + H13 ;
   H14  =     0.65864057076307 + H14 ;
   H15  =    -0.16712892170551 + H15 ;
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
   P_DepVar1  =     -3.1843124920179 * H11  +     3.14684332137523 * H12
          +     0.05566824550862 * H13  +    -2.15942017561302 * H14
          +    -3.42546418986096 * H15 ;
   P_DepVar1  =    -1.09960037898167 + P_DepVar1 ;
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
H11
H12
H13
H14
H15
;
drop S_:;
