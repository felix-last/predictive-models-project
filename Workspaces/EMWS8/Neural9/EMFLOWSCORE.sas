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
   H11  =     0.13561897368917 * S_AcceptedCmpTotal  +    -0.32772545836794 *
        S_Age  +    -0.38398034861903 * S_Frq  +    -0.26977539373888 *
        S_Income  +    -0.14142658616971 * S_Kidhome
          +      0.0989055198532 * S_Mnt  +    -0.02522005306968 *
        S_MntFishProducts  +    -0.12344455762016 * S_MntFruits
          +     0.06422500584481 * S_MntGoldProds  +     1.06758158504307 *
        S_MntMeatProducts  +    -0.23902734890811 * S_MntSweetProducts
          +    -0.30623759563522 * S_MntWines  +    -0.00016362973479 *
        S_MonthsAsCustomer  +     0.55545319032721 * S_NumCatalogPurchases
          +     0.96837841774168 * S_NumDealsPurchases
          +      0.2846105381881 * S_NumDistPurchases
          +    -0.69514041792943 * S_NumStorePurchases
          +    -0.96425407351749 * S_NumWebPurchases
          +     0.79545449599683 * S_NumWebVisitsMonth
          +     0.49367889229155 * S_RFMstat  +     -0.0709743399293 *
        S_RMntFrq  +    -0.86057075960565 * S_Recency
          +     0.14939396415431 * S_Teenhome ;
   H12  =     0.62153817830372 * S_AcceptedCmpTotal  +     0.11000838320023 *
        S_Age  +    -0.43905714814627 * S_Frq  +      0.4627921513743 *
        S_Income  +    -0.55432195959203 * S_Kidhome
          +    -0.20868947702573 * S_Mnt  +    -0.04791610917449 *
        S_MntFishProducts  +    -0.18250759820717 * S_MntFruits
          +    -0.04325930692478 * S_MntGoldProds  +     0.58323535101492 *
        S_MntMeatProducts  +     0.04921270742083 * S_MntSweetProducts
          +    -0.39974265327363 * S_MntWines  +    -0.05607601548004 *
        S_MonthsAsCustomer  +      0.3012811961076 * S_NumCatalogPurchases
          +      0.2190184330724 * S_NumDealsPurchases
          +    -0.01682909442896 * S_NumDistPurchases
          +    -0.70244951048552 * S_NumStorePurchases
          +     -0.3057457659316 * S_NumWebPurchases
          +     0.95928538762715 * S_NumWebVisitsMonth
          +     0.05894343416718 * S_RFMstat  +    -0.10056410044429 *
        S_RMntFrq  +     -0.8406665241206 * S_Recency
          +    -0.35297412201687 * S_Teenhome ;
   H13  =     0.06733651290741 * S_AcceptedCmpTotal  +    -0.40242244330352 *
        S_Age  +     0.00779419067769 * S_Frq  +    -0.39275723422465 *
        S_Income  +    -0.06354861159882 * S_Kidhome
          +     -0.0526962194301 * S_Mnt  +     0.22795791930382 *
        S_MntFishProducts  +       0.155952558453 * S_MntFruits
          +    -0.05338294725533 * S_MntGoldProds  +     0.27696958404211 *
        S_MntMeatProducts  +     0.45382327602276 * S_MntSweetProducts
          +     0.08944669240843 * S_MntWines  +     0.05073400334181 *
        S_MonthsAsCustomer  +    -0.21502812614453 * S_NumCatalogPurchases
          +    -0.21394230159696 * S_NumDealsPurchases
          +    -0.23833771124663 * S_NumDistPurchases
          +     0.45832031017813 * S_NumStorePurchases
          +    -0.30226952040179 * S_NumWebPurchases
          +    -0.29796387184481 * S_NumWebVisitsMonth
          +    -0.47457772771567 * S_RFMstat  +     0.02623437469504 *
        S_RMntFrq  +     0.87067423045258 * S_Recency
          +    -0.04579179879137 * S_Teenhome ;
   H14  =      0.0100821240579 * S_AcceptedCmpTotal  +     0.06650171037949 *
        S_Age  +     0.07437437345976 * S_Frq  +    -0.60858783914323 *
        S_Income  +    -0.04839586846715 * S_Kidhome
          +      0.0498689835853 * S_Mnt  +    -0.19232042751963 *
        S_MntFishProducts  +     -0.0934621532732 * S_MntFruits
          +    -0.23123184317801 * S_MntGoldProds  +    -0.73001093719713 *
        S_MntMeatProducts  +    -0.00941386350496 * S_MntSweetProducts
          +     0.53093647457485 * S_MntWines  +     0.25999444904416 *
        S_MonthsAsCustomer  +    -0.64356932247243 * S_NumCatalogPurchases
          +    -0.43749647771198 * S_NumDealsPurchases
          +     0.21263473847472 * S_NumDistPurchases
          +     0.26102168039141 * S_NumStorePurchases
          +     0.54921725943657 * S_NumWebPurchases
          +    -0.75685843498122 * S_NumWebVisitsMonth
          +     0.27936321897064 * S_RFMstat  +    -0.02993148267083 *
        S_RMntFrq  +     0.80536256822347 * S_Recency
          +     0.29599728227233 * S_Teenhome ;
   H15  =    -0.08671490381299 * S_AcceptedCmpTotal  +     0.06582961248691 *
        S_Age  +    -0.31028674605164 * S_Frq  +    -0.75498700429145 *
        S_Income  +     0.71499527198653 * S_Kidhome
          +    -0.09511483339215 * S_Mnt  +     0.12995766208562 *
        S_MntFishProducts  +     0.03365861966415 * S_MntFruits
          +     0.10989750322838 * S_MntGoldProds  +     -0.5915075857888 *
        S_MntMeatProducts  +     0.06560450377445 * S_MntSweetProducts
          +     0.21362770075701 * S_MntWines  +    -0.09939364366816 *
        S_MonthsAsCustomer  +    -0.61410179474601 * S_NumCatalogPurchases
          +     0.09436067776126 * S_NumDealsPurchases
          +    -0.02824201859641 * S_NumDistPurchases
          +    -0.06770433780564 * S_NumStorePurchases
          +    -0.07177620319715 * S_NumWebPurchases
          +    -0.75589979685266 * S_NumWebVisitsMonth
          +    -0.03604464190626 * S_RFMstat  +     0.17925089667944 *
        S_RMntFrq  +     0.94408788011429 * S_Recency
          +     0.41530214227619 * S_Teenhome ;
   H16  =    -0.39917411634723 * S_AcceptedCmpTotal  +     0.03925725158826 *
        S_Age  +    -0.41370994963942 * S_Frq  +    -0.42480967809347 *
        S_Income  +    -0.63474522042341 * S_Kidhome
          +    -0.26213982180471 * S_Mnt  +     0.18685818695791 *
        S_MntFishProducts  +     0.04605858526078 * S_MntFruits
          +    -0.16330204827669 * S_MntGoldProds  +    -0.29864450244187 *
        S_MntMeatProducts  +     -0.1818801035467 * S_MntSweetProducts
          +    -0.01848203970119 * S_MntWines  +    -0.38039400989409 *
        S_MonthsAsCustomer  +     -0.7050267965821 * S_NumCatalogPurchases
          +    -0.51154511343396 * S_NumDealsPurchases
          +    -0.52422915823572 * S_NumDistPurchases
          +     0.30305498422357 * S_NumStorePurchases
          +     0.12197321559338 * S_NumWebPurchases
          +    -0.10520335422769 * S_NumWebVisitsMonth
          +    -0.08455403770298 * S_RFMstat  +     -0.0746666450533 *
        S_RMntFrq  +    -0.01666787115039 * S_Recency
          +     -0.0878584797536 * S_Teenhome ;
   H11  = H11  +    -0.90961987146896 * AcceptedCmp10
          +    -0.43883226747411 * AcceptedCmp20  +    -0.33111359726838 *
        AcceptedCmp30  +    -0.56836514169806 * AcceptedCmp40
          +    -0.35293284248651 * AcceptedCmp50  +    -0.21637194677498 *
        Complain0  +     0.04763871212094 * HigherEducationBinary0 ;
   H12  = H12  +     -0.1030990687939 * AcceptedCmp10
          +     0.00122242086508 * AcceptedCmp20  +    -0.20164062706951 *
        AcceptedCmp30  +    -0.18080173131042 * AcceptedCmp40
          +    -0.29605640354834 * AcceptedCmp50  +     0.05316734050672 *
        Complain0  +     0.03310322649598 * HigherEducationBinary0 ;
   H13  = H13  +     0.19903845466874 * AcceptedCmp10
          +     0.05770332479555 * AcceptedCmp20  +     0.18259425424285 *
        AcceptedCmp30  +     -0.1972581314722 * AcceptedCmp40
          +     0.07810166818705 * AcceptedCmp50  +      0.0588314244014 *
        Complain0  +     0.52386444165611 * HigherEducationBinary0 ;
   H14  = H14  +    -0.25712989150916 * AcceptedCmp10
          +     0.10002773433896 * AcceptedCmp20  +     0.22713279091354 *
        AcceptedCmp30  +     -0.3908577443881 * AcceptedCmp40
          +     0.26942267903717 * AcceptedCmp50  +    -0.06022694623669 *
        Complain0  +     0.05521579061999 * HigherEducationBinary0 ;
   H15  = H15  +     0.38919159206493 * AcceptedCmp10
          +     0.58837620734384 * AcceptedCmp20  +     0.43219005719576 *
        AcceptedCmp30  +     0.44013713415724 * AcceptedCmp40
          +     0.21616210575893 * AcceptedCmp50  +     0.22563135687374 *
        Complain0  +    -0.26680262675523 * HigherEducationBinary0 ;
   H16  = H16  +     0.20851064493691 * AcceptedCmp10
          +     0.04947084224566 * AcceptedCmp20  +     0.13383157945653 *
        AcceptedCmp30  +    -0.04649385360034 * AcceptedCmp40
          +     0.22456192437835 * AcceptedCmp50  +     0.09861465204268 *
        Complain0  +     0.52759393238257 * HigherEducationBinary0 ;
   H11  = H11  +    -0.17149044990916 * Education2n_Cycle
          +    -0.10901150601282 * EducationBasic  +     0.08956382506778 *
        EducationGraduation  +    -0.02263887301789 * EducationMaster
          +     0.10234616400375 * Marital_StatusDivorced
          +     0.27961650739075 * Marital_StatusMarried
          +    -0.40239488723767 * Marital_StatusSingle
          +     0.08313574864343 * Marital_StatusTogether ;
   H12  = H12  +     0.05425155386264 * Education2n_Cycle
          +    -0.29410781678759 * EducationBasic  +     0.23986214400803 *
        EducationGraduation  +    -0.14831422332134 * EducationMaster
          +     0.46385792428023 * Marital_StatusDivorced
          +    -0.62344590646391 * Marital_StatusMarried
          +     0.61767209252062 * Marital_StatusSingle
          +    -0.48335726597768 * Marital_StatusTogether ;
   H13  = H13  +     0.02436261022421 * Education2n_Cycle
          +     0.25859718044561 * EducationBasic  +    -0.27291277319608 *
        EducationGraduation  +    -0.08922741430112 * EducationMaster
          +    -0.07839612590836 * Marital_StatusDivorced
          +     0.35316864062221 * Marital_StatusMarried
          +    -0.10730136429834 * Marital_StatusSingle
          +     0.17593603209099 * Marital_StatusTogether ;
   H14  = H14  +    -0.24964520343799 * Education2n_Cycle
          +    -0.01893498177516 * EducationBasic  +     0.15063494078927 *
        EducationGraduation  +     -0.0741586921665 * EducationMaster
          +    -0.09942175269886 * Marital_StatusDivorced
          +     0.24385460865335 * Marital_StatusMarried
          +    -0.33658955096296 * Marital_StatusSingle
          +     0.56050963700382 * Marital_StatusTogether ;
   H15  = H15  +     0.01382474147934 * Education2n_Cycle
          +    -0.45490268571245 * EducationBasic  +     0.16592751946825 *
        EducationGraduation  +     0.37352174719748 * EducationMaster
          +    -0.08047852561096 * Marital_StatusDivorced
          +     1.16485862694561 * Marital_StatusMarried
          +    -0.94140251178566 * Marital_StatusSingle
          +     0.70332254595446 * Marital_StatusTogether ;
   H16  = H16  +    -0.23552122269934 * Education2n_Cycle
          +    -0.24160689278663 * EducationBasic  +    -0.15570122212206 *
        EducationGraduation  +    -0.17067956037934 * EducationMaster
          +    -0.16621963893391 * Marital_StatusDivorced
          +    -0.44542186297324 * Marital_StatusMarried
          +     0.42176133228308 * Marital_StatusSingle
          +     -0.3191529098756 * Marital_StatusTogether ;
   H11  =    -0.08072695414295 + H11 ;
   H12  =     0.35226882164117 + H12 ;
   H13  =    -1.39195207519632 + H13 ;
   H14  =     1.37641938752783 + H14 ;
   H15  =     0.91842694601067 + H15 ;
   H16  =     -2.0930022603803 + H16 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
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
   P_DepVar1  =     2.03370101048476 * H11  +     2.66531855617884 * H12
          +    -1.85942573260565 * H13  +    -1.90574749832357 * H14
          +    -3.11388767967909 * H15  +    -2.20829136620638 * H16 ;
   P_DepVar1  =    -2.07329738382548 + P_DepVar1 ;
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
H16
;
drop S_:;
