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

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x2_3 = 'Hidden: H2x2_=3' ;

      label H2x2_4 = 'Hidden: H2x2_=4' ;

      label H2x2_5 = 'Hidden: H2x2_=5' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x1_3 = 'Hidden: H3x1_=3' ;

      label H3x1_4 = 'Hidden: H3x1_=4' ;

      label H3x1_5 = 'Hidden: H3x1_=5' ;

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
   H1x1_1  =     -1.6780441789215 * S_AcceptedCmpTotal
          +     0.45385980917029 * S_Age  +    -0.71899650455913 * S_Frq
          +    -1.93679506571805 * S_Income  +     1.56925991391051 * 
        S_Kidhome  +    -1.47175189232318 * S_Mnt  +    -2.23220260217222 * 
        S_MntFishProducts  +    -0.27017202076253 * S_MntFruits
          +    -0.33562096740259 * S_MntGoldProds  +     3.61472960640287 * 
        S_MntMeatProducts  +    -2.85576251647297 * S_MntSweetProducts
          +     -4.4467685903527 * S_MntWines  +     0.38963757858628 * 
        S_MonthsAsCustomer  +     1.66666181194027 * S_NumCatalogPurchases
          +     3.45371614080196 * S_NumDealsPurchases
          +     0.19118374544537 * S_NumDistPurchases
          +    -2.45138001446793 * S_NumStorePurchases
          +    -0.11424280244155 * S_NumWebPurchases
          +    -2.31770357716565 * S_NumWebVisitsMonth
          +     2.81643889601936 * S_RFMstat  +    -1.04896006701534 * 
        S_RMntFrq  +     0.26870809438679 * S_Recency
          +    -0.26422448158811 * S_Teenhome ;
   H1x1_2  =    -0.85648293000641 * S_AcceptedCmpTotal
          +    -1.65647402725291 * S_Age  +     1.01151947076788 * S_Frq
          +    -2.30217634682957 * S_Income  +     3.64198249916211 * 
        S_Kidhome  +     0.20767518788666 * S_Mnt  +     0.16841756532554 * 
        S_MntFishProducts  +      -1.068506425921 * S_MntFruits
          +     0.58318801939162 * S_MntGoldProds  +    -2.31777049056548 * 
        S_MntMeatProducts  +     0.23759430399811 * S_MntSweetProducts
          +      1.6840332285232 * S_MntWines  +     1.02971381781013 * 
        S_MonthsAsCustomer  +    -0.67962580165124 * S_NumCatalogPurchases
          +    -1.28390925647659 * S_NumDealsPurchases
          +     0.82669177239926 * S_NumDistPurchases
          +     1.71678585204511 * S_NumStorePurchases
          +     1.49226295608046 * S_NumWebPurchases
          +     -4.0105103018388 * S_NumWebVisitsMonth
          +     0.59909792991084 * S_RFMstat  +     1.07820515361554 * 
        S_RMntFrq  +     4.74241121363086 * S_Recency
          +     3.02084642655958 * S_Teenhome ;
   H1x1_3  =    -2.68802949086986 * S_AcceptedCmpTotal
          +     0.32408799976195 * S_Age  +     0.22616656573012 * S_Frq
          +     -0.4811040196236 * S_Income  +     0.01554228937278 * 
        S_Kidhome  +    -0.00131538598753 * S_Mnt  +     1.89942488016409 * 
        S_MntFishProducts  +     0.56303548397494 * S_MntFruits
          +    -0.15594598286956 * S_MntGoldProds  +    -7.89542322794989 * 
        S_MntMeatProducts  +    -0.27122492647076 * S_MntSweetProducts
          +     4.85572438492582 * S_MntWines  +     0.12362243863555 * 
        S_MonthsAsCustomer  +    -1.47960473675934 * S_NumCatalogPurchases
          +     0.22958626391725 * S_NumDealsPurchases
          +    -0.02046515813996 * S_NumDistPurchases
          +      0.8618502050837 * S_NumStorePurchases
          +     1.45175370326009 * S_NumWebPurchases
          +    -0.86122442436156 * S_NumWebVisitsMonth
          +    -0.99643351802143 * S_RFMstat  +    -1.65762265567389 * 
        S_RMntFrq  +    -0.08202178452839 * S_Recency
          +    -0.62066116666102 * S_Teenhome ;
   H1x1_4  =     0.45192233004895 * S_AcceptedCmpTotal
          +    -0.94676544762121 * S_Age  +     0.73809341266988 * S_Frq
          +     0.72277799278136 * S_Income  +    -0.12970804152173 * 
        S_Kidhome  +     0.01052564540044 * S_Mnt  +    -0.48321452967118 * 
        S_MntFishProducts  +    -0.41471448831942 * S_MntFruits
          +     0.04381334765674 * S_MntGoldProds  +     0.92594151100538 * 
        S_MntMeatProducts  +     0.29845970530397 * S_MntSweetProducts
          +    -0.71535779454556 * S_MntWines  +     0.00059837351168 * 
        S_MonthsAsCustomer  +     2.23353511013288 * S_NumCatalogPurchases
          +     1.25310034610344 * S_NumDealsPurchases
          +     0.92141098602176 * S_NumDistPurchases
          +    -0.08806509391473 * S_NumStorePurchases
          +     -1.0533787624668 * S_NumWebPurchases
          +     3.07050739830585 * S_NumWebVisitsMonth
          +    -0.05671059637078 * S_RFMstat  +     1.73621676609839 * 
        S_RMntFrq  +     -3.8741602707981 * S_Recency
          +    -2.06796290973426 * S_Teenhome ;
   H1x1_5  =    -1.36121985595495 * S_AcceptedCmpTotal
          +     0.05422070059006 * S_Age  +     0.27495083329116 * S_Frq
          +     -0.9677209394449 * S_Income  +    -1.13619168708067 * 
        S_Kidhome  +     0.62918569209141 * S_Mnt  +     0.37160756976122 * 
        S_MntFishProducts  +     0.88680401337821 * S_MntFruits
          +    -0.36100921959604 * S_MntGoldProds  +    -0.35574990334834 * 
        S_MntMeatProducts  +     0.82389188555236 * S_MntSweetProducts
          +     1.43496434553922 * S_MntWines  +    -1.46335376005851 * 
        S_MonthsAsCustomer  +    -1.84942841156411 * S_NumCatalogPurchases
          +    -1.68259553608287 * S_NumDealsPurchases
          +    -0.53835572290445 * S_NumDistPurchases
          +     1.25833922835446 * S_NumStorePurchases
          +     0.48300830623998 * S_NumWebPurchases
          +    -2.20119275236582 * S_NumWebVisitsMonth
          +     -0.2397284702987 * S_RFMstat  +    -0.71924218175088 * 
        S_RMntFrq  +     0.35692712879409 * S_Recency
          +     0.77122286526706 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.07301304241545 * AcceptedCmp10
          +    -1.95730125129608 * AcceptedCmp20  +    -1.38342161079442 * 
        AcceptedCmp30  +    -1.49080889719345 * AcceptedCmp40
          +    -1.07381857035964 * AcceptedCmp50  +    -1.39161532835475 * 
        Complain0  +    -0.48833832833721 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.38934062747222 * AcceptedCmp10
          +    -0.32259780417284 * AcceptedCmp20  +     0.51602852076334 * 
        AcceptedCmp30  +    -0.70838948180655 * AcceptedCmp40
          +     1.29066052659113 * AcceptedCmp50  +      0.1004848714971 * 
        Complain0  +    -0.73386392383925 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.34219997086576 * AcceptedCmp10
          +    -0.12311182470953 * AcceptedCmp20  +     -2.0600710888874 * 
        AcceptedCmp30  +      -1.904294485826 * AcceptedCmp40
          +     3.36424449872952 * AcceptedCmp50  +    -0.25078238709812 * 
        Complain0  +    -0.08077684854733 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -1.12501407155309 * AcceptedCmp10
          +    -1.58866249671355 * AcceptedCmp20  +    -1.72881548820716 * 
        AcceptedCmp30  +      -2.214698125839 * AcceptedCmp40
          +    -0.62635613939269 * AcceptedCmp50  +      0.0150779868394 * 
        Complain0  +     1.03338023365724 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.26508589111781 * AcceptedCmp10
          +    -0.40912292690255 * AcceptedCmp20  +     0.75389762391096 * 
        AcceptedCmp30  +     0.41336953757691 * AcceptedCmp40
          +     0.15346623431804 * AcceptedCmp50  +    -0.57037201584293 * 
        Complain0  +     0.77009921064044 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +      1.0009305049246 * Education2n_Cycle
          +     -0.4613305087931 * EducationBasic  +      0.3758596828746 * 
        EducationGraduation  +     1.25189584055994 * EducationMaster
          +     0.26230568150721 * Marital_StatusDivorced
          +     0.27563523967756 * Marital_StatusMarried
          +     0.54464481618478 * Marital_StatusSingle
          +    -0.59728882722473 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.67268966683928 * Education2n_Cycle
          +     1.13837889947773 * EducationBasic  +     1.04211010190617 * 
        EducationGraduation  +     0.29772013614284 * EducationMaster
          +    -0.06750661313108 * Marital_StatusDivorced
          +     1.48628445854207 * Marital_StatusMarried
          +    -0.52197797291165 * Marital_StatusSingle
          +     0.26825188905773 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.15872794306716 * Education2n_Cycle
          +     -0.2621450786439 * EducationBasic  +      -0.141563901063 * 
        EducationGraduation  +     0.45665087056809 * EducationMaster
          +     0.03219453957597 * Marital_StatusDivorced
          +    -0.73835008216677 * Marital_StatusMarried
          +     0.11212575818086 * Marital_StatusSingle
          +    -0.43478073380625 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.76014837933596 * Education2n_Cycle
          +     0.81014096036717 * EducationBasic  +     0.41200440507889 * 
        EducationGraduation  +    -1.00228990059701 * EducationMaster
          +    -0.95055539413405 * Marital_StatusDivorced
          +    -1.65922419336067 * Marital_StatusMarried
          +     0.78727538125107 * Marital_StatusSingle
          +    -2.04820355088009 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.28767104655135 * Education2n_Cycle
          +     0.23294407135706 * EducationBasic  +    -1.19680108607997 * 
        EducationGraduation  +     0.46710355433642 * EducationMaster
          +     -4.1747415035634 * Marital_StatusDivorced
          +     3.61194282451968 * Marital_StatusMarried
          +     -3.2800495365546 * Marital_StatusSingle
          +     4.03496183640024 * Marital_StatusTogether ;
   H1x1_1  =    -2.93438581065873 + H1x1_1 ;
   H1x1_2  =     0.62443347607569 + H1x1_2 ;
   H1x1_3  =    -1.18755793198513 + H1x1_3 ;
   H1x1_4  =    -3.21278432238831 + H1x1_4 ;
   H1x1_5  =    -1.81875492018044 + H1x1_5 ;
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
   H1x2_1  =    -0.54874145972704 * S_AcceptedCmpTotal
          +    -1.96729802286214 * S_Age  +     0.48476252791598 * S_Frq
          +    -0.22341551246937 * S_Income  +      0.5578096957255 * 
        S_Kidhome  +     0.02626802496223 * S_Mnt  +     0.45412544568839 * 
        S_MntFishProducts  +     1.01144979259918 * S_MntFruits
          +     0.10684155186482 * S_MntGoldProds  +    -0.28941930881694 * 
        S_MntMeatProducts  +    -1.28044699620063 * S_MntSweetProducts
          +     0.01381215802108 * S_MntWines  +    -0.10048261914477 * 
        S_MonthsAsCustomer  +     2.77259931235269 * S_NumCatalogPurchases
          +     1.29727972396867 * S_NumDealsPurchases
          +     -0.4796144286007 * S_NumDistPurchases
          +     0.88365985808591 * S_NumStorePurchases
          +     0.68522096892804 * S_NumWebPurchases
          +     0.54931043107798 * S_NumWebVisitsMonth
          +     0.54113568533807 * S_RFMstat  +    -1.25421061779043 * 
        S_RMntFrq  +     2.35704770144328 * S_Recency
          +     0.71039073076168 * S_Teenhome ;
   H1x2_2  =    -0.87761654715429 * S_AcceptedCmpTotal
          +     0.35157201280883 * S_Age  +    -0.52499399345006 * S_Frq
          +    -0.18535763866989 * S_Income  +    -2.37902660986953 * 
        S_Kidhome  +     0.91895423997679 * S_Mnt  +     0.25609945459048 * 
        S_MntFishProducts  +    -0.81235755934506 * S_MntFruits
          +     0.52120923975997 * S_MntGoldProds  +    -0.44372337811583 * 
        S_MntMeatProducts  +     0.44948834045992 * S_MntSweetProducts
          +     -1.0932771504262 * S_MntWines  +     0.50602262267579 * 
        S_MonthsAsCustomer  +     1.56553203254999 * S_NumCatalogPurchases
          +     0.26997834581422 * S_NumDealsPurchases
          +      1.4974894627406 * S_NumDistPurchases
          +     0.20577850505638 * S_NumStorePurchases
          +     0.67578530037026 * S_NumWebPurchases
          +     1.48893165613941 * S_NumWebVisitsMonth
          +     0.13287732996796 * S_RFMstat  +     0.56918286957798 * 
        S_RMntFrq  +    -1.40718347701522 * S_Recency
          +    -1.45355422903931 * S_Teenhome ;
   H1x2_3  =    -0.04229252175967 * S_AcceptedCmpTotal
          +    -0.15725101559927 * S_Age  +      2.0258984610186 * S_Frq
          +     0.68410444381038 * S_Income  +     0.69019962444573 * 
        S_Kidhome  +    -0.34233922017925 * S_Mnt  +     1.55352897772997 * 
        S_MntFishProducts  +    -0.76176236164027 * S_MntFruits
          +    -1.16754517357962 * S_MntGoldProds  +     1.24350326644835 * 
        S_MntMeatProducts  +    -0.81282451423383 * S_MntSweetProducts
          +      0.7172672745995 * S_MntWines  +     1.13255065624057 * 
        S_MonthsAsCustomer  +    -0.07781573365472 * S_NumCatalogPurchases
          +    -0.75474919633886 * S_NumDealsPurchases
          +     2.21872386475638 * S_NumDistPurchases
          +    -0.36191460108989 * S_NumStorePurchases
          +     0.03160010932412 * S_NumWebPurchases
          +     0.00984650739909 * S_NumWebVisitsMonth
          +     0.89037882953417 * S_RFMstat  +    -1.05136047825247 * 
        S_RMntFrq  +     0.97890474913417 * S_Recency
          +     1.27657797009328 * S_Teenhome ;
   H1x2_4  =    -1.09473986244398 * S_AcceptedCmpTotal
          +     0.02292759635423 * S_Age  +     -1.7109267909752 * S_Frq
          +    -1.43383040360225 * S_Income  +    -1.57934610129188 * 
        S_Kidhome  +      0.1051214240099 * S_Mnt  +     0.97936539268931 * 
        S_MntFishProducts  +    -0.59583313648658 * S_MntFruits
          +     1.51886505753921 * S_MntGoldProds  +    -0.32475169924002 * 
        S_MntMeatProducts  +     2.41110603237098 * S_MntSweetProducts
          +    -0.31356867592074 * S_MntWines  +    -0.46746195334785 * 
        S_MonthsAsCustomer  +      1.2175994058873 * S_NumCatalogPurchases
          +    -1.12057357865269 * S_NumDealsPurchases
          +    -0.70841760614521 * S_NumDistPurchases
          +    -1.39174816270404 * S_NumStorePurchases
          +    -1.62343249380806 * S_NumWebPurchases
          +    -0.73097954508465 * S_NumWebVisitsMonth
          +    -3.00146168388145 * S_RFMstat  +     0.52793752800199 * 
        S_RMntFrq  +    -1.13585643618227 * S_Recency
          +    -0.84809590269062 * S_Teenhome ;
   H1x2_5  =    -0.76941479017685 * S_AcceptedCmpTotal
          +    -0.80197055800099 * S_Age  +    -0.33523741625948 * S_Frq
          +     0.67386262421365 * S_Income  +     1.52003240833706 * 
        S_Kidhome  +     0.14459028288037 * S_Mnt  +     0.39874528164598 * 
        S_MntFishProducts  +    -1.59397070226712 * S_MntFruits
          +     0.78518859165099 * S_MntGoldProds  +     0.48003679676647 * 
        S_MntMeatProducts  +    -0.17657709565986 * S_MntSweetProducts
          +    -0.79155200251992 * S_MntWines  +     0.27335896970236 * 
        S_MonthsAsCustomer  +     1.70502645622852 * S_NumCatalogPurchases
          +     0.66880481485557 * S_NumDealsPurchases
          +     0.69540174544859 * S_NumDistPurchases
          +     1.68246546921736 * S_NumStorePurchases
          +     1.85958176898295 * S_NumWebPurchases
          +    -0.23815810306565 * S_NumWebVisitsMonth
          +    -1.93291997626659 * S_RFMstat  +     0.44532152898673 * 
        S_RMntFrq  +    -2.12360922264332 * S_Recency
          +     0.99915338747458 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.34162163066653 * AcceptedCmp10
          +    -1.63962075993761 * AcceptedCmp20  +    -0.15621537766672 * 
        AcceptedCmp30  +      -0.732967936338 * AcceptedCmp40
          +    -0.89574320220152 * AcceptedCmp50  +    -1.65404732277767 * 
        Complain0  +     0.39810242344925 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.20749893379181 * AcceptedCmp10
          +     0.74035850461127 * AcceptedCmp20  +    -0.57598323268755 * 
        AcceptedCmp30  +      0.2507562576407 * AcceptedCmp40
          +    -1.65954337863227 * AcceptedCmp50  +    -0.36715622527216 * 
        Complain0  +    -0.80760857638242 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +      0.1125551214626 * AcceptedCmp10
          +      0.9256532360503 * AcceptedCmp20  +    -0.66171851987996 * 
        AcceptedCmp30  +     1.38941609616943 * AcceptedCmp40
          +    -0.12600029950267 * AcceptedCmp50  +     1.77872255302987 * 
        Complain0  +     0.92261637863861 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     1.15541901435911 * AcceptedCmp10
          +     0.29649422640031 * AcceptedCmp20  +     0.39809722545141 * 
        AcceptedCmp30  +    -0.33350815656019 * AcceptedCmp40
          +    -0.67932033799188 * AcceptedCmp50  +     0.37378775543802 * 
        Complain0  +    -0.42273281355142 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     0.42070748083274 * AcceptedCmp10
          +     0.35338291913326 * AcceptedCmp20  +    -0.47257467834599 * 
        AcceptedCmp30  +     1.53611423156071 * AcceptedCmp40
          +    -1.33360798584085 * AcceptedCmp50  +    -1.44352278404761 * 
        Complain0  +    -0.33674466205114 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     0.60843711339598 * Education2n_Cycle
          +     -0.2612316425128 * EducationBasic  +     0.53215140077355 * 
        EducationGraduation  +     0.32623787352656 * EducationMaster
          +      0.2766977476799 * Marital_StatusDivorced
          +     0.99585126449473 * Marital_StatusMarried
          +    -0.71244490682808 * Marital_StatusSingle
          +     0.05234471555621 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -1.37916273373311 * Education2n_Cycle
          +     0.16982792088728 * EducationBasic  +     0.00814910507718 * 
        EducationGraduation  +     0.47239961039918 * EducationMaster
          +     0.04724779113048 * Marital_StatusDivorced
          +    -0.80186231440666 * Marital_StatusMarried
          +    -0.02226793584171 * Marital_StatusSingle
          +     1.15827064756189 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +    -0.24428291102209 * Education2n_Cycle
          +    -0.11697967041189 * EducationBasic  +    -1.11774839931933 * 
        EducationGraduation  +     0.41284540548646 * EducationMaster
          +     0.28206835683721 * Marital_StatusDivorced
          +     0.46500886756532 * Marital_StatusMarried
          +     0.35327545255503 * Marital_StatusSingle
          +     0.58394650567036 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +    -0.41547462236128 * Education2n_Cycle
          +     1.13629818238321 * EducationBasic  +     0.25034344652006 * 
        EducationGraduation  +    -0.29812527209479 * EducationMaster
          +     1.22291788006392 * Marital_StatusDivorced
          +    -2.27040720272432 * Marital_StatusMarried
          +     1.13606780043773 * Marital_StatusSingle
          +    -1.07606142589696 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     1.12913918872999 * Education2n_Cycle
          +     1.23833680718071 * EducationBasic  +     1.02294394812757 * 
        EducationGraduation  +      0.4909097120378 * EducationMaster
          +     -0.3999800759199 * Marital_StatusDivorced
          +    -0.40978271635345 * Marital_StatusMarried
          +    -0.55524279444227 * Marital_StatusSingle
          +    -0.84395633194091 * Marital_StatusTogether ;
   H1x2_1  =    -0.65400470626386 + H1x2_1 ;
   H1x2_2  =    -0.07530883721979 + H1x2_2 ;
   H1x2_3  =      -0.290996947172 + H1x2_3 ;
   H1x2_4  =    -0.89461283774487 + H1x2_4 ;
   H1x2_5  =    -0.37171981998051 + H1x2_5 ;
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
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.02034446400728 * S_AcceptedCmpTotal
          +    -0.93561297099295 * S_Age  +     0.49066734733476 * S_Frq
          +    -1.34856771280634 * S_Income  +     1.35662384709137 * 
        S_Kidhome  +    -0.02206222240953 * S_Mnt  +     0.42162640035912 * 
        S_MntFishProducts  +      1.4724867503467 * S_MntFruits
          +    -0.51460401528507 * S_MntGoldProds  +       0.958125893994 * 
        S_MntMeatProducts  +     0.57113865733502 * S_MntSweetProducts
          +    -1.00744287646761 * S_MntWines  +     0.17043433169038 * 
        S_MonthsAsCustomer  +     1.69277828985001 * S_NumCatalogPurchases
          +     0.15783958682465 * S_NumDealsPurchases
          +     1.52124708558457 * S_NumDistPurchases
          +     -1.3804418313581 * S_NumStorePurchases
          +    -1.29570111649272 * S_NumWebPurchases
          +    -0.64280706056547 * S_NumWebVisitsMonth
          +    -1.20774016698707 * S_RFMstat  +    -0.44623204790714 * 
        S_RMntFrq  +    -0.06726660535826 * S_Recency
          +    -0.73266660753354 * S_Teenhome ;
   H1x3_2  =     0.05576327437156 * S_AcceptedCmpTotal
          +    -0.09670418926268 * S_Age  +     0.70499031549942 * S_Frq
          +     0.26184897891893 * S_Income  +    -1.14390972062773 * 
        S_Kidhome  +     -0.0692794596346 * S_Mnt  +     0.38520399298269 * 
        S_MntFishProducts  +     0.23416686193508 * S_MntFruits
          +     0.54961704765881 * S_MntGoldProds  +     1.00350256670809 * 
        S_MntMeatProducts  +    -0.03432942277526 * S_MntSweetProducts
          +    -0.79877133727616 * S_MntWines  +    -2.29194848128805 * 
        S_MonthsAsCustomer  +    -0.38950356087292 * S_NumCatalogPurchases
          +     0.12337111358286 * S_NumDealsPurchases
          +     -2.3848926094027 * S_NumDistPurchases
          +    -1.20666646996433 * S_NumStorePurchases
          +     0.89549302881365 * S_NumWebPurchases
          +     0.95359042569947 * S_NumWebVisitsMonth
          +    -0.41458051201542 * S_RFMstat  +    -2.05830783255089 * 
        S_RMntFrq  +     0.17682790616815 * S_Recency
          +     0.20329199183726 * S_Teenhome ;
   H1x3_3  =     0.56145399373835 * S_AcceptedCmpTotal
          +     -0.0607922137813 * S_Age  +    -0.72333515266618 * S_Frq
          +     1.00319702869592 * S_Income  +    -0.98265416539823 * 
        S_Kidhome  +      0.0683081611036 * S_Mnt  +     0.53609800817402 * 
        S_MntFishProducts  +     2.04360526983241 * S_MntFruits
          +    -0.71698041504305 * S_MntGoldProds  +     -0.0344399486348 * 
        S_MntMeatProducts  +     0.33812230317499 * S_MntSweetProducts
          +     1.06616289880664 * S_MntWines  +     0.61567483782422 * 
        S_MonthsAsCustomer  +      0.1468959674594 * S_NumCatalogPurchases
          +    -1.05383642674948 * S_NumDealsPurchases
          +     1.71861984509369 * S_NumDistPurchases
          +     1.47595181536047 * S_NumStorePurchases
          +    -1.64165005491178 * S_NumWebPurchases
          +    -2.35130004742828 * S_NumWebVisitsMonth
          +      1.0733561716985 * S_RFMstat  +     1.11931629246452 * 
        S_RMntFrq  +    -1.27356615687944 * S_Recency
          +     0.38980214209917 * S_Teenhome ;
   H1x3_4  =    -1.87202109167616 * S_AcceptedCmpTotal
          +     0.55536174675106 * S_Age  +     1.30133566520787 * S_Frq
          +     1.18618986686496 * S_Income  +      0.7889264950743 * 
        S_Kidhome  +     0.52573653297629 * S_Mnt  +    -0.46151505202831 * 
        S_MntFishProducts  +     0.87196199131075 * S_MntFruits
          +    -1.42881514301194 * S_MntGoldProds  +     0.75395204572369 * 
        S_MntMeatProducts  +    -1.86940235435459 * S_MntSweetProducts
          +    -0.16531589560603 * S_MntWines  +     0.80429494629006 * 
        S_MonthsAsCustomer  +     2.07324775707635 * S_NumCatalogPurchases
          +     0.13347794794222 * S_NumDealsPurchases
          +     0.30533639886561 * S_NumDistPurchases
          +     1.63892955540526 * S_NumStorePurchases
          +     0.43734586516446 * S_NumWebPurchases
          +     1.79260779802864 * S_NumWebVisitsMonth
          +     2.03019700767877 * S_RFMstat  +    -0.36302320348133 * 
        S_RMntFrq  +    -0.32271271703746 * S_Recency
          +     1.03191552613762 * S_Teenhome ;
   H1x3_5  =     0.20857223520727 * S_AcceptedCmpTotal
          +    -0.20096771162452 * S_Age  +     0.34962532991985 * S_Frq
          +     1.37548654455856 * S_Income  +     1.56421861140197 * 
        S_Kidhome  +    -1.14534324749928 * S_Mnt  +     1.19456381083083 * 
        S_MntFishProducts  +     0.66027175430916 * S_MntFruits
          +    -0.93198171949009 * S_MntGoldProds  +    -0.72464830253528 * 
        S_MntMeatProducts  +     1.02487566206095 * S_MntSweetProducts
          +     1.05601020947303 * S_MntWines  +     2.31580499448269 * 
        S_MonthsAsCustomer  +    -0.72019418879499 * S_NumCatalogPurchases
          +     1.64209094349557 * S_NumDealsPurchases
          +    -0.38876870460627 * S_NumDistPurchases
          +    -0.48559309584971 * S_NumStorePurchases
          +     0.21254626353218 * S_NumWebPurchases
          +    -0.71484448532542 * S_NumWebVisitsMonth
          +     0.02349535084994 * S_RFMstat  +    -0.16176132186427 * 
        S_RMntFrq  +     0.44893411588775 * S_Recency
          +      0.2652212690846 * S_Teenhome ;
   H1x3_1  = H1x3_1  +    -1.35842958516566 * AcceptedCmp10
          +     0.34594436457216 * AcceptedCmp20  +      0.3640777110552 * 
        AcceptedCmp30  +    -2.65231594293215 * AcceptedCmp40
          +    -0.32594395344101 * AcceptedCmp50  +    -0.20731631969028 * 
        Complain0  +    -0.37562812451995 * HigherEducationBinary0 ;
   H1x3_2  = H1x3_2  +    -0.29516697471591 * AcceptedCmp10
          +     0.12160626453607 * AcceptedCmp20  +    -0.19673071668839 * 
        AcceptedCmp30  +      0.9679629348873 * AcceptedCmp40
          +     0.27607865991675 * AcceptedCmp50  +     0.34210605810889 * 
        Complain0  +    -0.91955372970801 * HigherEducationBinary0 ;
   H1x3_3  = H1x3_3  +    -0.64048354977116 * AcceptedCmp10
          +     0.71632378156708 * AcceptedCmp20  +     1.49620826236085 * 
        AcceptedCmp30  +    -0.41927727863342 * AcceptedCmp40
          +    -0.74518887123144 * AcceptedCmp50  +     -0.5653895859863 * 
        Complain0  +     0.49026807979832 * HigherEducationBinary0 ;
   H1x3_4  = H1x3_4  +    -0.39456977652419 * AcceptedCmp10
          +    -0.35607374401334 * AcceptedCmp20  +     0.25403314478809 * 
        AcceptedCmp30  +    -1.26365534513909 * AcceptedCmp40
          +    -0.93574993035227 * AcceptedCmp50  +    -0.01475423275475 * 
        Complain0  +     0.99152563511102 * HigherEducationBinary0 ;
   H1x3_5  = H1x3_5  +    -1.26373480748972 * AcceptedCmp10
          +     0.14485593883591 * AcceptedCmp20  +     -0.0764980824216 * 
        AcceptedCmp30  +    -1.03297576023738 * AcceptedCmp40
          +    -1.10199278454673 * AcceptedCmp50  +     0.92040879426753 * 
        Complain0  +     0.19845951543481 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +     0.21888802927361 * Education2n_Cycle
          +    -1.88729117459232 * EducationBasic  +    -0.23163049582765 * 
        EducationGraduation  +     0.46887304015863 * EducationMaster
          +     1.33953173091973 * Marital_StatusDivorced
          +    -0.26253208073262 * Marital_StatusMarried
          +    -0.00960552682431 * Marital_StatusSingle
          +     1.02851334153667 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +     2.36701652448958 * Education2n_Cycle
          +     0.64894060487321 * EducationBasic  +     -1.2851019467738 * 
        EducationGraduation  +     1.05325310300372 * EducationMaster
          +     1.43150850334311 * Marital_StatusDivorced
          +    -0.69239127844934 * Marital_StatusMarried
          +     2.08477562471559 * Marital_StatusSingle
          +    -1.55945531486837 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +    -0.07588279976612 * Education2n_Cycle
          +    -1.60804492005984 * EducationBasic  +     0.15348594453976 * 
        EducationGraduation  +     1.80436924796338 * EducationMaster
          +     1.08387556786168 * Marital_StatusDivorced
          +      1.0283506000217 * Marital_StatusMarried
          +    -0.87069431107983 * Marital_StatusSingle
          +    -0.04455113729262 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +    -0.24072826180906 * Education2n_Cycle
          +     0.56372511932643 * EducationBasic  +    -1.72914870390939 * 
        EducationGraduation  +    -1.53859265107051 * EducationMaster
          +      -1.347780188307 * Marital_StatusDivorced
          +    -0.53911983240372 * Marital_StatusMarried
          +     0.22083074159185 * Marital_StatusSingle
          +     0.46023807391468 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +    -0.72917301249658 * Education2n_Cycle
          +     0.78780526232794 * EducationBasic  +     0.22244378874589 * 
        EducationGraduation  +      1.6087631135774 * EducationMaster
          +     1.46582538311384 * Marital_StatusDivorced
          +     0.05256161016002 * Marital_StatusMarried
          +    -1.21402967626877 * Marital_StatusSingle
          +     0.88645860928281 * Marital_StatusTogether ;
   H1x3_1  =     0.88456831875399 + H1x3_1 ;
   H1x3_2  =    -0.97118571845853 + H1x3_2 ;
   H1x3_3  =    -0.79264210370105 + H1x3_3 ;
   H1x3_4  =     0.02838267530757 + H1x3_4 ;
   H1x3_5  =      0.6575544901332 + H1x3_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
   H1x3_2  = 1.0 / (1.0 + EXP(MIN( - H1x3_2 , _EXP_BAR)));
   H1x3_3  = 1.0 / (1.0 + EXP(MIN( - H1x3_3 , _EXP_BAR)));
   H1x3_4  = 1.0 / (1.0 + EXP(MIN( - H1x3_4 , _EXP_BAR)));
   H1x3_5  = 1.0 / (1.0 + EXP(MIN( - H1x3_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -0.87888588976745 * H1x1_1  +     2.90335871970001 * H1x1_2
          +     3.56892082037266 * H1x1_3  +    -2.73992780705083 * H1x1_4
          +     1.85087845133324 * H1x1_5 ;
   H2x1_2  =    -0.58574259841126 * H1x1_1  +    -0.21734849016798 * H1x1_2
          +    -0.25911074181081 * H1x1_3  +    -0.42608313525243 * H1x1_4
          +      0.0572264965726 * H1x1_5 ;
   H2x1_3  =     -3.4245103090892 * H1x1_1  +     2.39148442791109 * H1x1_2
          +     2.40633993926864 * H1x1_3  +    -0.39116314741561 * H1x1_4
          +     1.55940137045446 * H1x1_5 ;
   H2x1_4  =     4.40552826823228 * H1x1_1  +    -2.22667369285426 * H1x1_2
          +    -4.36956996992936 * H1x1_3  +     5.07833758885145 * H1x1_4
          +    -3.71745000855391 * H1x1_5 ;
   H2x1_1  = H2x1_1  +     2.57417055243767 * H1x2_1
          +     0.83648749576123 * H1x2_2  +     0.89390090173338 * H1x2_3
          +     0.64981014833304 * H1x2_4  +    -0.52148329192172 * H1x2_5 ;
   H2x1_2  = H2x1_2  +      0.0180888989385 * H1x2_1
          +    -0.80823823488019 * H1x2_2  +    -0.28763491232907 * H1x2_3
          +     0.25846928082637 * H1x2_4  +    -0.90191452174928 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     1.14009879940491 * H1x2_1
          +    -0.40787680915084 * H1x2_2  +     0.07284828777988 * H1x2_3
          +     0.36049016529857 * H1x2_4  +    -1.18138631855392 * H1x2_5 ;
   H2x1_4  = H2x1_4  +     -0.1178430666715 * H1x2_1
          +     2.09065650924536 * H1x2_2  +     1.04148055725421 * H1x2_3
          +     0.02606984862898 * H1x2_4  +     0.31973150706209 * H1x2_5 ;
   H2x1_1  = H2x1_1  +     0.37589541636702 * H1x3_1
          +    -1.02452495514201 * H1x3_2  +     0.44765211805329 * H1x3_3
          +    -1.35647342372032 * H1x3_4  +     -0.6490399229487 * H1x3_5 ;
   H2x1_2  = H2x1_2  +      -1.910747593267 * H1x3_1
          +     1.91313714874593 * H1x3_2  +     0.89010950185557 * H1x3_3
          +     1.16258612173237 * H1x3_4  +     0.67062728470341 * H1x3_5 ;
   H2x1_3  = H2x1_3  +    -0.61933600446437 * H1x3_1
          +     1.71790550668732 * H1x3_2  +     0.54214423164791 * H1x3_3
          +     1.23934237110052 * H1x3_4  +     -0.5426823885329 * H1x3_5 ;
   H2x1_4  = H2x1_4  +     0.63501991890118 * H1x3_1
          +     0.52608732282548 * H1x3_2  +     1.05849455171994 * H1x3_3
          +    -0.10988994454917 * H1x3_4  +     -0.4296682351699 * H1x3_5 ;
   H2x1_1  =     1.65760855975376 + H2x1_1 ;
   H2x1_2  =    -1.48092067999918 + H2x1_2 ;
   H2x1_3  =     0.34293203475136 + H2x1_3 ;
   H2x1_4  =     2.26730807690838 + H2x1_4 ;
   H2x1_5  = 0; 
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 , H2x1_5 );
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
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
   H2x1_5  = H2x1_5  / _SUM_;
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     0.35487648363729 * H1x1_1  +    -1.23352844324567 * H1x1_2
          +      0.4867158313468 * H1x1_3  +    -1.47292809903753 * H1x1_4
          +    -1.00833023262854 * H1x1_5 ;
   H2x2_2  =     1.32087363094324 * H1x1_1  +     0.82502983555141 * H1x1_2
          +    -0.68621854188154 * H1x1_3  +     1.98219533394448 * H1x1_4
          +     0.24099626891211 * H1x1_5 ;
   H2x2_3  =     1.19516705715854 * H1x1_1  +    -0.20476587977538 * H1x1_2
          +    -2.69435199012833 * H1x1_3  +      1.1085509496662 * H1x1_4
          +    -0.95845782501191 * H1x1_5 ;
   H2x2_4  =     0.80435775915951 * H1x1_1  +     1.81751702761299 * H1x1_2
          +     0.07722876002556 * H1x1_3  +    -0.41957373993392 * H1x1_4
          +    -1.39341356039439 * H1x1_5 ;
   H2x2_1  = H2x2_1  +     0.84230993439042 * H1x2_1
          +      1.4931541058726 * H1x2_2  +     0.29113033361443 * H1x2_3
          +     0.58117372781043 * H1x2_4  +     0.21183820652904 * H1x2_5 ;
   H2x2_2  = H2x2_2  +     0.27560928585641 * H1x2_1
          +     1.00352880610395 * H1x2_2  +     1.86342723621296 * H1x2_3
          +     0.68698974361713 * H1x2_4  +     1.62443344475228 * H1x2_5 ;
   H2x2_3  = H2x2_3  +     0.59362453125998 * H1x2_1
          +     2.21434215943762 * H1x2_2  +     0.00697391860503 * H1x2_3
          +     0.52298455671378 * H1x2_4  +    -1.36319907473823 * H1x2_5 ;
   H2x2_4  = H2x2_4  +     0.87949581153547 * H1x2_1
          +     0.52867495476492 * H1x2_2  +    -0.30823702050003 * H1x2_3
          +     1.30732992472712 * H1x2_4  +    -0.93335113891701 * H1x2_5 ;
   H2x2_1  = H2x2_1  +    -0.18546949662618 * H1x3_1
          +     0.12449215628678 * H1x3_2  +    -0.06904718348363 * H1x3_3
          +     1.64236464165721 * H1x3_4  +      0.6073731959408 * H1x3_5 ;
   H2x2_2  = H2x2_2  +    -0.65604349417832 * H1x3_1
          +    -0.36719791640957 * H1x3_2  +     0.13320126120657 * H1x3_3
          +     0.18159276955134 * H1x3_4  +     2.58327741985853 * H1x3_5 ;
   H2x2_3  = H2x2_3  +     0.91638163706166 * H1x3_1
          +    -0.47067218080648 * H1x3_2  +    -1.48968450897101 * H1x3_3
          +     1.31187282169231 * H1x3_4  +     -0.2874693423684 * H1x3_5 ;
   H2x2_4  = H2x2_4  +     0.53560065193109 * H1x3_1
          +    -1.15405943087628 * H1x3_2  +     0.12331054856276 * H1x3_3
          +     -1.4665768024733 * H1x3_4  +    -0.08015819920106 * H1x3_5 ;
   H2x2_1  =     1.14294113680807 + H2x2_1 ;
   H2x2_2  =     0.23029998902452 + H2x2_2 ;
   H2x2_3  =     0.09214575938404 + H2x2_3 ;
   H2x2_4  =    -1.18247593420886 + H2x2_4 ;
   H2x2_5  = 0; 
   _MAX_ = MAX (H2x2_1 , H2x2_2 , H2x2_3 , H2x2_4 , H2x2_5 );
   _SUM_ = 0.; 
   H2x2_1  = EXP(H2x2_1  - _MAX_);
   _SUM_ = _SUM_ + H2x2_1 ;
   H2x2_2  = EXP(H2x2_2  - _MAX_);
   _SUM_ = _SUM_ + H2x2_2 ;
   H2x2_3  = EXP(H2x2_3  - _MAX_);
   _SUM_ = _SUM_ + H2x2_3 ;
   H2x2_4  = EXP(H2x2_4  - _MAX_);
   _SUM_ = _SUM_ + H2x2_4 ;
   H2x2_5  = EXP(H2x2_5  - _MAX_);
   _SUM_ = _SUM_ + H2x2_5 ;
   H2x2_1  = H2x2_1  / _SUM_;
   H2x2_2  = H2x2_2  / _SUM_;
   H2x2_3  = H2x2_3  / _SUM_;
   H2x2_4  = H2x2_4  / _SUM_;
   H2x2_5  = H2x2_5  / _SUM_;
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
   H2x2_3  = .;
   H2x2_4  = .;
   H2x2_5  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     0.38781845364667 * H2x1_1  +    -1.29333236344932 * H2x1_2
          +    -0.39452648844304 * H2x1_3  +    -1.74269898056816 * H2x1_4
          +     0.80663208970159 * H2x1_5 ;
   H3x1_2  =     3.42138045838852 * H2x1_1  +    -2.53755815247586 * H2x1_2
          +     1.21718290783021 * H2x1_3  +    -5.59742312960418 * H2x1_4
          +     0.93331767575635 * H2x1_5 ;
   H3x1_3  =      0.3066875685513 * H2x1_1  +     0.06212172151661 * H2x1_2
          +     0.54975837436313 * H2x1_3  +    -2.01758242649336 * H2x1_4
          +     -1.5405169528484 * H2x1_5 ;
   H3x1_4  =     0.75238654454663 * H2x1_1  +      0.8605688517794 * H2x1_2
          +    -1.18675726977521 * H2x1_3  +    -0.23106123144614 * H2x1_4
          +    -0.26022301590207 * H2x1_5 ;
   H3x1_1  = H3x1_1  +     -1.9857802180333 * H2x2_1
          +    -1.83746541265988 * H2x2_2  +    -0.19991218509663 * H2x2_3
          +    -1.16358880876987 * H2x2_4  +     0.72072728861384 * H2x2_5 ;
   H3x1_2  = H3x1_2  +     0.96937540396367 * H2x2_1
          +    -0.36649624165623 * H2x2_2  +     0.89618563330616 * H2x2_3
          +    -0.84224721075989 * H2x2_4  +     0.43309698013395 * H2x2_5 ;
   H3x1_3  = H3x1_3  +    -0.90225214765586 * H2x2_1
          +     0.02136319386846 * H2x2_2  +    -0.46868394918483 * H2x2_3
          +     0.56005845701528 * H2x2_4  +     -1.2510120440755 * H2x2_5 ;
   H3x1_4  = H3x1_4  +    -0.50993520854009 * H2x2_1
          +    -2.07093806498525 * H2x2_2  +      0.4129198676448 * H2x2_3
          +     0.26049404756746 * H2x2_4  +     2.51376895456424 * H2x2_5 ;
   H3x1_1  =    -0.83299285935592 + H3x1_1 ;
   H3x1_2  =     1.30330978853872 + H3x1_2 ;
   H3x1_3  =    -2.12788819064089 + H3x1_3 ;
   H3x1_4  =    -2.20240058017016 + H3x1_4 ;
   H3x1_5  = 0; 
   _MAX_ = MAX (H3x1_1 , H3x1_2 , H3x1_3 , H3x1_4 , H3x1_5 );
   _SUM_ = 0.; 
   H3x1_1  = EXP(H3x1_1  - _MAX_);
   _SUM_ = _SUM_ + H3x1_1 ;
   H3x1_2  = EXP(H3x1_2  - _MAX_);
   _SUM_ = _SUM_ + H3x1_2 ;
   H3x1_3  = EXP(H3x1_3  - _MAX_);
   _SUM_ = _SUM_ + H3x1_3 ;
   H3x1_4  = EXP(H3x1_4  - _MAX_);
   _SUM_ = _SUM_ + H3x1_4 ;
   H3x1_5  = EXP(H3x1_5  - _MAX_);
   _SUM_ = _SUM_ + H3x1_5 ;
   H3x1_1  = H3x1_1  / _SUM_;
   H3x1_2  = H3x1_2  / _SUM_;
   H3x1_3  = H3x1_3  / _SUM_;
   H3x1_4  = H3x1_4  / _SUM_;
   H3x1_5  = H3x1_5  / _SUM_;
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
   H3x1_3  = .;
   H3x1_4  = .;
   H3x1_5  = .;
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
   P_DepVar1  =     0.02793808059597 * H3x1_1  +    -8.41365271594755 * H3x1_2
          +    -0.18933524733979 * H3x1_3  +     1.61020422729446 * H3x1_4
          +     7.51494112828021 * H3x1_5 ;
   P_DepVar1  =     0.83962115399384 + P_DepVar1 ;
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
