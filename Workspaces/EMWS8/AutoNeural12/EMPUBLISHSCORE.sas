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

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H1x2_7 = 'Hidden: H1x2_=7' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x1_7 = 'Hidden: H2x1_=7' ;

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
   H1x1_1  =     0.63316204656896 * S_AcceptedCmpTotal
          +    -0.24884200883415 * S_Age  +      -0.236584005151 * S_Frq
          +     0.25406117591995 * S_Income  +    -0.56304122955704 *
        S_Kidhome  +    -0.23687782938793 * S_Mnt  +    -0.09770906650074 *
        S_MntFishProducts  +    -0.73487360819716 * S_MntFruits
          +     0.14293909908147 * S_MntGoldProds  +     2.25015000307426 *
        S_MntMeatProducts  +    -0.42178958150661 * S_MntSweetProducts
          +    -2.35340366839307 * S_MntWines  +    -0.02380265380154 *
        S_MonthsAsCustomer  +     1.16509321438746 * S_NumCatalogPurchases
          +     1.17276395296242 * S_NumDealsPurchases
          +     0.26632768295477 * S_NumDistPurchases
          +    -1.26575615903579 * S_NumStorePurchases
          +    -0.95316107557927 * S_NumWebPurchases
          +     1.01828574356487 * S_NumWebVisitsMonth
          +       0.795866263515 * S_RFMstat  +    -0.20490378142832 *
        S_RMntFrq  +    -0.82943281422857 * S_Recency
          +     0.16132418388418 * S_Teenhome ;
   H1x1_2  =    -0.43482920479481 * S_AcceptedCmpTotal
          +     0.53350211221915 * S_Age  +    -0.06797700766223 * S_Frq
          +     0.13771322007949 * S_Income  +     0.87012019559698 *
        S_Kidhome  +     0.06026853274247 * S_Mnt  +    -0.43150595882972 *
        S_MntFishProducts  +    -0.13728591661063 * S_MntFruits
          +     0.35443873962923 * S_MntGoldProds  +     0.28102965401547 *
        S_MntMeatProducts  +     0.52367949052365 * S_MntSweetProducts
          +     0.35553595364078 * S_MntWines  +     0.37892120128383 *
        S_MonthsAsCustomer  +     0.59057645965187 * S_NumCatalogPurchases
          +     1.14485571201233 * S_NumDealsPurchases
          +     0.21414266588987 * S_NumDistPurchases
          +    -0.10530090074297 * S_NumStorePurchases
          +    -0.41712321238458 * S_NumWebPurchases
          +    -0.99760766791108 * S_NumWebVisitsMonth
          +    -0.90203265666387 * S_RFMstat  +    -0.60947922673601 *
        S_RMntFrq  +     1.10040128548883 * S_Recency
          +     0.16728431679949 * S_Teenhome ;
   H1x1_3  =     0.26373486938499 * S_AcceptedCmpTotal
          +    -0.22246756314756 * S_Age  +     0.49537720979115 * S_Frq
          +     1.38815981786544 * S_Income  +    -0.93015968695331 *
        S_Kidhome  +     0.11586216615481 * S_Mnt  +    -0.02105973515345 *
        S_MntFishProducts  +    -0.28078442249811 * S_MntFruits
          +    -0.01763878655129 * S_MntGoldProds  +     0.83934619541231 *
        S_MntMeatProducts  +    -0.23417310915433 * S_MntSweetProducts
          +    -0.29135819585991 * S_MntWines  +    -0.20792872642036 *
        S_MonthsAsCustomer  +     1.05218745810839 * S_NumCatalogPurchases
          +      0.7196418967437 * S_NumDealsPurchases
          +     0.69035286374177 * S_NumDistPurchases
          +     0.38027656631135 * S_NumStorePurchases
          +    -0.18878358997924 * S_NumWebPurchases
          +     1.61962062004798 * S_NumWebVisitsMonth
          +    -0.04575386719745 * S_RFMstat  +     1.16358450490635 *
        S_RMntFrq  +    -2.13821542142822 * S_Recency
          +    -1.28960355207697 * S_Teenhome ;
   H1x1_4  =    -0.34331113295243 * S_AcceptedCmpTotal
          +    -0.39878146063012 * S_Age  +     0.10068367322473 * S_Frq
          +    -0.20171643525685 * S_Income  +    -0.76934260520569 *
        S_Kidhome  +    -0.66782690219397 * S_Mnt  +     0.80905970181803 *
        S_MntFishProducts  +    -0.03688782193215 * S_MntFruits
          +     0.06641568264972 * S_MntGoldProds  +    -3.32390323965822 *
        S_MntMeatProducts  +    -0.05413014598032 * S_MntSweetProducts
          +     1.07708707113306 * S_MntWines  +     0.13185264889978 *
        S_MonthsAsCustomer  +    -0.39476201074171 * S_NumCatalogPurchases
          +    -0.00642902007204 * S_NumDealsPurchases
          +     0.29785069480367 * S_NumDistPurchases
          +    -0.42243322063147 * S_NumStorePurchases
          +     0.54880896338383 * S_NumWebPurchases
          +    -0.12525846016886 * S_NumWebVisitsMonth
          +    -0.31397100953189 * S_RFMstat  +     -0.5192863720509 *
        S_RMntFrq  +     0.10252211581449 * S_Recency
          +     0.44223031313104 * S_Teenhome ;
   H1x1_5  =    -0.89949577087728 * S_AcceptedCmpTotal
          +     -0.5133669560115 * S_Age  +     0.55814120515869 * S_Frq
          +    -0.72790553700689 * S_Income  +     1.13470491167406 *
        S_Kidhome  +     0.42465795563071 * S_Mnt  +     0.22642900369653 *
        S_MntFishProducts  +    -0.10149694753146 * S_MntFruits
          +    -0.05203167914723 * S_MntGoldProds  +    -0.42300460593042 *
        S_MntMeatProducts  +    -0.11178206624825 * S_MntSweetProducts
          +     1.57257994445012 * S_MntWines  +     0.02297554927807 *
        S_MonthsAsCustomer  +    -0.60721423552141 * S_NumCatalogPurchases
          +    -0.48404738328225 * S_NumDealsPurchases
          +    -0.02464180457879 * S_NumDistPurchases
          +     1.17201831082067 * S_NumStorePurchases
          +     0.57453655167516 * S_NumWebPurchases
          +    -1.94417019790248 * S_NumWebVisitsMonth
          +     0.00073301476364 * S_RFMstat  +     0.12295343326875 *
        S_RMntFrq  +      1.6169916658132 * S_Recency
          +     0.09488579305439 * S_Teenhome ;
   H1x1_6  =     0.01224996381937 * S_AcceptedCmpTotal
          +     0.56818460209578 * S_Age  +    -0.50544994791872 * S_Frq
          +    -0.39086889823619 * S_Income  +      0.2278709145292 *
        S_Kidhome  +       0.221310975162 * S_Mnt  +     -0.2208719427117 *
        S_MntFishProducts  +     0.33199116637803 * S_MntFruits
          +    -0.20919304257884 * S_MntGoldProds  +     0.85155045239396 *
        S_MntMeatProducts  +     0.32150401526792 * S_MntSweetProducts
          +     0.24789026157513 * S_MntWines  +    -0.16427340869887 *
        S_MonthsAsCustomer  +    -1.31657293247686 * S_NumCatalogPurchases
          +    -1.49850531967483 * S_NumDealsPurchases
          +    -0.82105466264223 * S_NumDistPurchases
          +     0.29984603642824 * S_NumStorePurchases
          +     0.06557123721611 * S_NumWebPurchases
          +     1.04754749365002 * S_NumWebVisitsMonth
          +     0.18881248406892 * S_RFMstat  +     0.26455728766984 *
        S_RMntFrq  +     0.12396789666359 * S_Recency
          +     0.04001049603668 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     -0.4293641198863 * AcceptedCmp10
          +    -0.02562823362815 * AcceptedCmp20  +     0.16277388616218 *
        AcceptedCmp30  +    -0.38952498475664 * AcceptedCmp40
          +    -0.13756852377245 * AcceptedCmp50  +    -0.11393239206883 *
        Complain0  +    -0.18422159910382 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     -0.6690011671322 * AcceptedCmp10
          +     0.30944418540454 * AcceptedCmp20  +     0.58989055832198 *
        AcceptedCmp30  +    -0.11349554378017 * AcceptedCmp40
          +     0.17747537507545 * AcceptedCmp50  +     0.31141201787728 *
        Complain0  +    -0.14665102087088 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.37718551551154 * AcceptedCmp10
          +    -0.95419836616858 * AcceptedCmp20  +    -1.07782642598822 *
        AcceptedCmp30  +    -0.36181507758379 * AcceptedCmp40
          +    -0.20579221441057 * AcceptedCmp50  +     -0.2862570173476 *
        Complain0  +     0.42095042003574 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +     0.76282838117383 * AcceptedCmp10
          +     0.17657215690894 * AcceptedCmp20  +     0.06936093547655 *
        AcceptedCmp30  +    -0.31222684620157 * AcceptedCmp40
          +     0.35916828202502 * AcceptedCmp50  +     0.15464859425769 *
        Complain0  +    -0.12780871374988 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +      0.0863832283968 * AcceptedCmp10
          +    -0.01478152334234 * AcceptedCmp20  +    -0.25793605794945 *
        AcceptedCmp30  +     0.75328991260718 * AcceptedCmp40
          +     0.43869592545355 * AcceptedCmp50  +    -0.18444801256895 *
        Complain0  +    -0.18540568245616 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +    -0.05476883960444 * AcceptedCmp10
          +    -0.30796660956747 * AcceptedCmp20  +    -0.15332998700386 *
        AcceptedCmp30  +     0.07190305484507 * AcceptedCmp40
          +    -0.19344551087023 * AcceptedCmp50  +    -0.01671794402922 *
        Complain0  +      0.4224003744836 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.06740641383122 * Education2n_Cycle
          +      0.0427985447056 * EducationBasic  +     0.38043688251433 *
        EducationGraduation  +     0.07595631354847 * EducationMaster
          +     0.24583509957712 * Marital_StatusDivorced
          +    -0.22681931588361 * Marital_StatusMarried
          +    -0.12924106229536 * Marital_StatusSingle
          +     -0.2262058185403 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.13120690973481 * Education2n_Cycle
          +     0.37925506295244 * EducationBasic  +     0.31784700588218 *
        EducationGraduation  +     0.23015089246655 * EducationMaster
          +    -0.12585334311068 * Marital_StatusDivorced
          +    -0.20835502467207 * Marital_StatusMarried
          +    -0.13839534449368 * Marital_StatusSingle
          +     0.64317572477668 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.32305785926236 * Education2n_Cycle
          +     0.23464353160373 * EducationBasic  +    -0.73832644067678 *
        EducationGraduation  +    -0.03608560158257 * EducationMaster
          +     0.35106363238113 * Marital_StatusDivorced
          +     -1.3414808583918 * Marital_StatusMarried
          +     1.40835320798486 * Marital_StatusSingle
          +    -1.26805917396788 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.14516593990466 * Education2n_Cycle
          +     0.21457892528906 * EducationBasic  +      0.3693312496431 *
        EducationGraduation  +      0.1746658332011 * EducationMaster
          +     0.48174546958393 * Marital_StatusDivorced
          +    -0.41416978858191 * Marital_StatusMarried
          +    -0.23376801546265 * Marital_StatusSingle
          +    -0.40569257078897 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.00489214718621 * Education2n_Cycle
          +     0.04788059649714 * EducationBasic  +      -0.479003778409 *
        EducationGraduation  +     0.68875064631577 * EducationMaster
          +    -0.67557643774246 * Marital_StatusDivorced
          +     1.63844045917367 * Marital_StatusMarried
          +    -0.70320960247699 * Marital_StatusSingle
          +     1.26350112628909 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.38566123849432 * Education2n_Cycle
          +    -0.48006357411447 * EducationBasic  +     0.06594567975069 *
        EducationGraduation  +    -0.68011360002443 * EducationMaster
          +    -0.11371453086883 * Marital_StatusDivorced
          +    -0.34226997176291 * Marital_StatusMarried
          +    -1.01568676685754 * Marital_StatusSingle
          +    -0.07673228755579 * Marital_StatusTogether ;
   H1x1_1  =    -0.13665586104906 + H1x1_1 ;
   H1x1_2  =    -1.74128345271319 + H1x1_2 ;
   H1x1_3  =    -0.38226400326342 + H1x1_3 ;
   H1x1_4  =    -0.64652756521333 + H1x1_4 ;
   H1x1_5  =     0.89555568414722 + H1x1_5 ;
   H1x1_6  =    -0.28536788363505 + H1x1_6 ;
   H1x1_7  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 , H1x1_7
         );
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
   H1x1_7  = EXP(H1x1_7  - _MAX_);
   _SUM_ = _SUM_ + H1x1_7 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
   H1x1_7  = H1x1_7  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
   H1x1_7  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -0.46863593010465 * S_AcceptedCmpTotal
          +     0.76938995153422 * S_Age  +    -0.10870665325086 * S_Frq
          +    -0.01767709917897 * S_Income  +    -0.06564852978687 *
        S_Kidhome  +     1.53975855599943 * S_Mnt  +     0.14885556549813 *
        S_MntFishProducts  +     -0.3427211596875 * S_MntFruits
          +     1.82311511422571 * S_MntGoldProds  +     1.16814585484266 *
        S_MntMeatProducts  +    -0.03210183211362 * S_MntSweetProducts
          +     0.21048598967441 * S_MntWines  +    -1.43075224286158 *
        S_MonthsAsCustomer  +     0.17264791017938 * S_NumCatalogPurchases
          +    -0.87259051567474 * S_NumDealsPurchases
          +    -0.36454149529139 * S_NumDistPurchases
          +     0.12447759925061 * S_NumStorePurchases
          +    -1.08133487947367 * S_NumWebPurchases
          +    -0.49882157745454 * S_NumWebVisitsMonth
          +    -1.37163643041927 * S_RFMstat  +    -2.02270778627266 *
        S_RMntFrq  +    -0.01174101172444 * S_Recency
          +     1.37307999964517 * S_Teenhome ;
   H1x2_2  =     0.31979674377303 * S_AcceptedCmpTotal
          +    -1.13516841608912 * S_Age  +     1.57640145941914 * S_Frq
          +    -0.58468039509557 * S_Income  +    -1.78015996883174 *
        S_Kidhome  +     0.51311311640127 * S_Mnt  +     0.07011815519915 *
        S_MntFishProducts  +     0.73204832291164 * S_MntFruits
          +     1.50837189353633 * S_MntGoldProds  +     1.39487443576743 *
        S_MntMeatProducts  +      0.6943398196475 * S_MntSweetProducts
          +    -0.36693028595681 * S_MntWines  +     0.86802033237442 *
        S_MonthsAsCustomer  +     0.02384797538091 * S_NumCatalogPurchases
          +     2.23121497416403 * S_NumDealsPurchases
          +    -0.48674842191071 * S_NumDistPurchases
          +     1.77510728607544 * S_NumStorePurchases
          +     0.14647433155436 * S_NumWebPurchases
          +    -0.95892686924419 * S_NumWebVisitsMonth
          +    -0.26496935918704 * S_RFMstat  +     2.48765485222223 *
        S_RMntFrq  +     2.46497777428475 * S_Recency
          +    -0.62872033383484 * S_Teenhome ;
   H1x2_3  =    -0.31142826583944 * S_AcceptedCmpTotal
          +    -1.14828049895929 * S_Age  +    -0.54227584627485 * S_Frq
          +     0.26826674711688 * S_Income  +     0.17643820666347 *
        S_Kidhome  +    -0.12427430981043 * S_Mnt  +     0.18056887427376 *
        S_MntFishProducts  +    -0.63010248821544 * S_MntFruits
          +    -0.81391687529252 * S_MntGoldProds  +    -1.12306166734361 *
        S_MntMeatProducts  +     0.92339010601965 * S_MntSweetProducts
          +    -2.05510990050543 * S_MntWines  +    -2.02060586903244 *
        S_MonthsAsCustomer  +     0.98841836752178 * S_NumCatalogPurchases
          +     0.14338855349611 * S_NumDealsPurchases
          +    -2.21071010829235 * S_NumDistPurchases
          +    -0.21795889348002 * S_NumStorePurchases
          +     1.98825087883535 * S_NumWebPurchases
          +     1.02482442531149 * S_NumWebVisitsMonth
          +    -0.47662143614905 * S_RFMstat  +    -0.17167385440535 *
        S_RMntFrq  +     -1.0288777281766 * S_Recency
          +    -0.10646747275734 * S_Teenhome ;
   H1x2_4  =    -0.40813758620671 * S_AcceptedCmpTotal
          +     0.16751361466296 * S_Age  +     0.61297021391662 * S_Frq
          +     0.17708553296763 * S_Income  +    -0.23498000755537 *
        S_Kidhome  +      0.6863853027948 * S_Mnt  +    -0.43649468589643 *
        S_MntFishProducts  +    -1.03807059787368 * S_MntFruits
          +     0.68988160282803 * S_MntGoldProds  +     1.76714128625705 *
        S_MntMeatProducts  +     1.15458185366826 * S_MntSweetProducts
          +     0.31267521045306 * S_MntWines  +    -3.18562841805634 *
        S_MonthsAsCustomer  +     0.15316473812138 * S_NumCatalogPurchases
          +     0.30041205661012 * S_NumDealsPurchases
          +    -0.63499849986918 * S_NumDistPurchases
          +    -0.34155713433714 * S_NumStorePurchases
          +    -1.14183354933936 * S_NumWebPurchases
          +    -0.42681980262973 * S_NumWebVisitsMonth
          +    -0.18777676484111 * S_RFMstat  +      0.2522570278894 *
        S_RMntFrq  +     1.25852246467612 * S_Recency
          +     0.63333476238969 * S_Teenhome ;
   H1x2_5  =     1.73048436159558 * S_AcceptedCmpTotal
          +     1.91388487556197 * S_Age  +     0.14880026885923 * S_Frq
          +      0.5905347897806 * S_Income  +     1.67048168226736 *
        S_Kidhome  +     0.03869174467752 * S_Mnt  +    -0.71187911364266 *
        S_MntFishProducts  +     0.93023590693473 * S_MntFruits
          +     0.22907372790948 * S_MntGoldProds  +    -1.05941282177437 *
        S_MntMeatProducts  +    -0.73905281508342 * S_MntSweetProducts
          +     0.04429898588386 * S_MntWines  +    -0.47487263648723 *
        S_MonthsAsCustomer  +     0.00382111008361 * S_NumCatalogPurchases
          +    -0.21237915559831 * S_NumDealsPurchases
          +     0.48256923764182 * S_NumDistPurchases
          +    -0.45553093140641 * S_NumStorePurchases
          +      0.5593655963659 * S_NumWebPurchases
          +     0.27943768691188 * S_NumWebVisitsMonth
          +     1.94452735574997 * S_RFMstat  +    -0.89811355261154 *
        S_RMntFrq  +    -1.62796011550484 * S_Recency
          +     0.60487421956906 * S_Teenhome ;
   H1x2_6  =    -0.32010880515459 * S_AcceptedCmpTotal
          +     0.95304983421791 * S_Age  +      -0.316044010281 * S_Frq
          +     1.10925678578158 * S_Income  +     1.28019020117471 *
        S_Kidhome  +     1.02498438668688 * S_Mnt  +     -1.8898236827792 *
        S_MntFishProducts  +     0.96543971612672 * S_MntFruits
          +    -0.21422669977227 * S_MntGoldProds  +     -0.0840639948559 *
        S_MntMeatProducts  +     1.27902687109389 * S_MntSweetProducts
          +    -1.38957846154598 * S_MntWines  +     0.80004372871482 *
        S_MonthsAsCustomer  +    -0.19381123279552 * S_NumCatalogPurchases
          +     2.38967021388062 * S_NumDealsPurchases
          +    -0.97722398866481 * S_NumDistPurchases
          +     1.57612333191312 * S_NumStorePurchases
          +    -0.75968679115983 * S_NumWebPurchases
          +    -0.64207187757251 * S_NumWebVisitsMonth
          +     1.06529999122381 * S_RFMstat  +     0.67095385521555 *
        S_RMntFrq  +     1.71313869798331 * S_Recency
          +     1.39045686636707 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -1.32125124093028 * AcceptedCmp10
          +    -0.61219063588492 * AcceptedCmp20  +     1.20821214973577 *
        AcceptedCmp30  +    -1.13548727550981 * AcceptedCmp40
          +     0.04405769197194 * AcceptedCmp50  +      0.7940658605271 *
        Complain0  +     1.05933486404834 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.56313777120806 * AcceptedCmp10
          +    -1.12997680537456 * AcceptedCmp20  +     1.19262470365504 *
        AcceptedCmp30  +    -0.98995493161689 * AcceptedCmp40
          +      -1.827141957557 * AcceptedCmp50  +    -0.43809188233899 *
        Complain0  +      -0.627000653672 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     1.32174755827017 * AcceptedCmp10
          +     1.00086479754098 * AcceptedCmp20  +      0.4636133487385 *
        AcceptedCmp30  +     1.34878553883758 * AcceptedCmp40
          +    -2.36241584924476 * AcceptedCmp50  +       1.082421071431 *
        Complain0  +    -0.32514144517436 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     0.39556775796131 * AcceptedCmp10
          +     0.06457727211285 * AcceptedCmp20  +    -1.44632749800655 *
        AcceptedCmp30  +     1.20294678514383 * AcceptedCmp40
          +    -0.01594330886358 * AcceptedCmp50  +    -2.06895895180485 *
        Complain0  +    -0.01374012569775 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     1.11945933535638 * AcceptedCmp10
          +     0.26383973979566 * AcceptedCmp20  +    -0.40426240061746 *
        AcceptedCmp30  +     1.46916781894719 * AcceptedCmp40
          +     0.26827715088644 * AcceptedCmp50  +     1.50074465469998 *
        Complain0  +     -1.0626185000486 * HigherEducationBinary0 ;
   H1x2_6  = H1x2_6  +    -0.87625232174239 * AcceptedCmp10
          +     0.72228047975642 * AcceptedCmp20  +     1.34904015028355 *
        AcceptedCmp30  +     1.55639496207852 * AcceptedCmp40
          +    -0.98741935337746 * AcceptedCmp50  +     0.99421811137074 *
        Complain0  +    -1.69180618270074 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.17034446979478 * Education2n_Cycle
          +    -0.75872196172063 * EducationBasic  +     0.44107677662894 *
        EducationGraduation  +      0.1073450284316 * EducationMaster
          +     0.96470902298142 * Marital_StatusDivorced
          +     0.94805959268314 * Marital_StatusMarried
          +     -0.6523948769616 * Marital_StatusSingle
          +     0.07557344719737 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -0.42515060901662 * Education2n_Cycle
          +    -1.05213629639837 * EducationBasic  +     0.72603871617959 *
        EducationGraduation  +    -1.34927753306064 * EducationMaster
          +      0.3918249505531 * Marital_StatusDivorced
          +    -0.00968091979586 * Marital_StatusMarried
          +     0.84615379885071 * Marital_StatusSingle
          +     0.34817324570682 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +    -0.31002362860852 * Education2n_Cycle
          +     1.40744525716089 * EducationBasic  +     2.06403096539358 *
        EducationGraduation  +     -0.8672743321499 * EducationMaster
          +     1.14335160313191 * Marital_StatusDivorced
          +     0.50580517192175 * Marital_StatusMarried
          +     0.17264295020921 * Marital_StatusSingle
          +    -0.58193119255736 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.55057637605468 * Education2n_Cycle
          +    -0.73070803276142 * EducationBasic  +     0.40424625808481 *
        EducationGraduation  +     1.95818378342783 * EducationMaster
          +    -0.11238504444225 * Marital_StatusDivorced
          +    -0.81348274043749 * Marital_StatusMarried
          +     0.46075415610001 * Marital_StatusSingle
          +    -0.17552649817722 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.43341125564688 * Education2n_Cycle
          +     2.81958018976644 * EducationBasic  +     0.28773362443315 *
        EducationGraduation  +     0.08396135672504 * EducationMaster
          +    -0.46342068701431 * Marital_StatusDivorced
          +    -0.41667845270204 * Marital_StatusMarried
          +    -0.47166707496281 * Marital_StatusSingle
          +     0.54110155717306 * Marital_StatusTogether ;
   H1x2_6  = H1x2_6  +    -0.27163102711307 * Education2n_Cycle
          +    -0.04052143781957 * EducationBasic  +     0.97902549344774 *
        EducationGraduation  +     0.36656103863186 * EducationMaster
          +    -0.45376613787812 * Marital_StatusDivorced
          +     0.01337046049801 * Marital_StatusMarried
          +    -0.92811489484121 * Marital_StatusSingle
          +     1.52402650450634 * Marital_StatusTogether ;
   H1x2_1  =     0.27200642200874 + H1x2_1 ;
   H1x2_2  =     0.52117161047058 + H1x2_2 ;
   H1x2_3  =    -1.04763461279984 + H1x2_3 ;
   H1x2_4  =     0.10516307959318 + H1x2_4 ;
   H1x2_5  =     1.24237093160919 + H1x2_5 ;
   H1x2_6  =    -0.57977518763852 + H1x2_6 ;
   H1x2_7  = 0;
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 , H1x2_7
         );
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
   H1x2_7  = EXP(H1x2_7  - _MAX_);
   _SUM_ = _SUM_ + H1x2_7 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
   H1x2_7  = H1x2_7  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
   H1x2_7  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     3.19986933046591 * H1x1_1  +    -0.53665634063887 * H1x1_2
          +     1.71172628690017 * H1x1_3  +    -1.33944402954134 * H1x1_4
          +    -1.93533827156845 * H1x1_5  +    -0.85772802964317 * H1x1_6
          +     0.60984669129006 * H1x1_7 ;
   H2x1_2  =     -2.1883484075031 * H1x1_1  +     0.17578635446135 * H1x1_2
          +    -1.79384950890077 * H1x1_3  +     0.88942614754722 * H1x1_4
          +     0.41077752133457 * H1x1_5  +       0.509832853125 * H1x1_6
          +    -0.28121910805072 * H1x1_7 ;
   H2x1_3  =     0.86281981700921 * H1x1_1  +    -1.15482345233328 * H1x1_2
          +     0.64743938802141 * H1x1_3  +     1.08117298211616 * H1x1_4
          +      -0.363297480437 * H1x1_5  +    -1.58703254226713 * H1x1_6
          +     0.54468402771449 * H1x1_7 ;
   H2x1_4  =    -0.43420906601647 * H1x1_1  +     0.36485369627974 * H1x1_2
          +    -2.42315183886716 * H1x1_3  +     0.22337896770247 * H1x1_4
          +    -0.65684369622605 * H1x1_5  +     0.25211011207532 * H1x1_6
          +     0.16704425645668 * H1x1_7 ;
   H2x1_5  =     0.61083333511105 * H1x1_1  +     1.11038871398931 * H1x1_2
          +      0.4617674661653 * H1x1_3  +    -0.42039958365963 * H1x1_4
          +    -1.37408000010678 * H1x1_5  +     0.03897439094411 * H1x1_6
          +    -0.82592861674077 * H1x1_7 ;
   H2x1_6  =     1.30877201101082 * H1x1_1  +     1.55143256487324 * H1x1_2
          +    -1.20237741381937 * H1x1_3  +       2.394122059946 * H1x1_4
          +     1.83804290225468 * H1x1_5  +     0.83132818010396 * H1x1_6
          +     1.18399340483001 * H1x1_7 ;
   H2x1_1  = H2x1_1  +    -2.41276052972753 * H1x2_1
          +     0.38601054263899 * H1x2_2  +     0.54498789581044 * H1x2_3
          +    -0.55304188445569 * H1x2_4  +     0.29484780749868 * H1x2_5
          +     0.44012580105051 * H1x2_6  +     0.43086375065556 * H1x2_7 ;
   H2x1_2  = H2x1_2  +    -1.03173201511154 * H1x2_1
          +     0.62119574580435 * H1x2_2  +     1.71782745718335 * H1x2_3
          +     0.05391903933014 * H1x2_4  +     1.52443015967438 * H1x2_5
          +     0.22301831343286 * H1x2_6  +     0.66204940430171 * H1x2_7 ;
   H2x1_3  = H2x1_3  +     1.37871502475142 * H1x2_1
          +     0.02099445181492 * H1x2_2  +     0.44720218317742 * H1x2_3
          +    -1.29625929820096 * H1x2_4  +    -1.29169956389384 * H1x2_5
          +    -0.21403739905139 * H1x2_6  +    -0.03075946378871 * H1x2_7 ;
   H2x1_4  = H2x1_4  +     1.94121727472617 * H1x2_1
          +     0.23207290279299 * H1x2_2  +      0.3162872281134 * H1x2_3
          +    -0.40199017937523 * H1x2_4  +     0.69294460110289 * H1x2_5
          +    -1.00758272664059 * H1x2_6  +    -1.41698057960021 * H1x2_7 ;
   H2x1_5  = H2x1_5  +     1.19546023857185 * H1x2_1
          +    -1.00266987736442 * H1x2_2  +     0.71838447032796 * H1x2_3
          +     1.70968347732204 * H1x2_4  +    -0.26894423802892 * H1x2_5
          +    -0.61655519090213 * H1x2_6  +     2.21931491555405 * H1x2_7 ;
   H2x1_6  = H2x1_6  +    -0.48559886762231 * H1x2_1
          +     0.93218274010134 * H1x2_2  +     0.23140948782865 * H1x2_3
          +     0.72139310562219 * H1x2_4  +    -0.11143939877368 * H1x2_5
          +     0.74022211257293 * H1x2_6  +      1.0449314568566 * H1x2_7 ;
   H2x1_1  =     0.42952855003777 + H2x1_1 ;
   H2x1_2  =     1.61752083096638 + H2x1_2 ;
   H2x1_3  =    -0.71617788867723 + H2x1_3 ;
   H2x1_4  =     0.39147546708847 + H2x1_4 ;
   H2x1_5  =    -0.56259054185247 + H2x1_5 ;
   H2x1_6  =     0.31857109159246 + H2x1_6 ;
   H2x1_7  = 0;
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 , H2x1_5 , H2x1_6 , H2x1_7
         );
   _SUM_ = 0.;
   H2x1_1  = EXP(H2x1_1  - _MAX_);
   _SUM_ = _SUM_ + H2x1_1 ;
   H2x1_2  = EXP(H2x1_2  - _MAX_);
   _SUM_ = _SUM_ + H2x1_2 ;
   H2x1_3  = EXP(H2x1_3  - _MAX_);
   _SUM_ = _SUM_ + H2x1_3 ;
   H2x1_4  = EXP(H2x1_4  - _MAX_);
   _SUM_ = _SUM_ + H2x1_4 ;
   H2x1_5  = EXP(H2x1_5  - _MAX_);
   _SUM_ = _SUM_ + H2x1_5 ;
   H2x1_6  = EXP(H2x1_6  - _MAX_);
   _SUM_ = _SUM_ + H2x1_6 ;
   H2x1_7  = EXP(H2x1_7  - _MAX_);
   _SUM_ = _SUM_ + H2x1_7 ;
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
   H2x1_5  = H2x1_5  / _SUM_;
   H2x1_6  = H2x1_6  / _SUM_;
   H2x1_7  = H2x1_7  / _SUM_;
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
   H2x1_7  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     25.2027326018714 * H2x1_1  +    -8.05331379419082 * H2x1_2
          +     2.64798805383536 * H2x1_3  +    -4.52736775271107 * H2x1_4
          +     6.71812741736202 * H2x1_5  +    -12.2785047473885 * H2x1_6
          +    -4.41291972336422 * H2x1_7 ;
   P_DepVar1  =     1.22134962002326 + P_DepVar1 ;
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
drop S_:;
