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

      label H1x1_6 = 'Hidden: H1x1_=6' ;

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
   H1x1_1  =     0.08465472857554 * S_AcceptedCmpTotal
          +     0.23104131534618 * S_Age  +     0.27646175976509 * S_Frq
          +     0.45938840681203 * S_Income  +     0.09814900830666 *
        S_Kidhome  +     0.23249430277518 * S_Mnt  +    -0.51905493105122 *
        S_MntFishProducts  +    -0.07604226481078 * S_MntFruits
          +     0.10100393832157 * S_MntGoldProds  +     1.56159221713858 *
        S_MntMeatProducts  +     0.12166799382268 * S_MntSweetProducts
          +    -0.63388816790524 * S_MntWines  +     0.00878303775585 *
        S_MonthsAsCustomer  +     0.01990411233136 * S_NumCatalogPurchases
          +     0.19770934886328 * S_NumDealsPurchases
          +      0.0515215988111 * S_NumDistPurchases
          +    -0.34569346346089 * S_NumStorePurchases
          +    -0.27122293596124 * S_NumWebPurchases
          +    -0.17061565609755 * S_NumWebVisitsMonth
          +      0.1271178187502 * S_RFMstat  +     0.38306508975954 *
        S_RMntFrq  +     0.05823588653853 * S_Recency
          +    -0.03760117378617 * S_Teenhome ;
   H1x1_2  =     0.16564144258189 * S_AcceptedCmpTotal
          +    -0.18930338067433 * S_Age  +    -0.23013558761757 * S_Frq
          +     -0.1347135122598 * S_Income  +     0.04776498811407 *
        S_Kidhome  +    -0.14940302068852 * S_Mnt  +    -0.13108691405604 *
        S_MntFishProducts  +    -0.02561341150704 * S_MntFruits
          +    -0.02022222891948 * S_MntGoldProds  +     0.80867688993093 *
        S_MntMeatProducts  +    -0.08374488783635 * S_MntSweetProducts
          +     -0.6719369441832 * S_MntWines  +    -0.14760035685198 *
        S_MonthsAsCustomer  +      0.4007376271331 * S_NumCatalogPurchases
          +     0.54308887602031 * S_NumDealsPurchases
          +    -0.22507315320192 * S_NumDistPurchases
          +    -0.79861387328361 * S_NumStorePurchases
          +    -0.45467494002747 * S_NumWebPurchases
          +      0.2119048824613 * S_NumWebVisitsMonth
          +     0.30167662748678 * S_RFMstat  +     0.10712110659027 *
        S_RMntFrq  +    -0.03061918029089 * S_Recency
          +    -0.06096313113607 * S_Teenhome ;
   H1x1_3  =     0.02674875562898 * S_AcceptedCmpTotal
          +    -0.19731891748843 * S_Age  +    -0.00753784701259 * S_Frq
          +    -0.31764694608254 * S_Income  +     0.49525183733398 *
        S_Kidhome  +     0.24623619243686 * S_Mnt  +     0.25904859702044 *
        S_MntFishProducts  +     0.26153358982994 * S_MntFruits
          +    -0.07223707213485 * S_MntGoldProds  +    -0.15192960471493 *
        S_MntMeatProducts  +     0.08241128624385 * S_MntSweetProducts
          +     0.62479763709054 * S_MntWines  +     0.03593742779349 *
        S_MonthsAsCustomer  +     0.00825730323418 * S_NumCatalogPurchases
          +     -0.0771083149302 * S_NumDealsPurchases
          +     0.03403621221162 * S_NumDistPurchases
          +     0.61303946422025 * S_NumStorePurchases
          +     0.27126793634053 * S_NumWebPurchases
          +     -0.9769688424222 * S_NumWebVisitsMonth
          +     0.08832170040425 * S_RFMstat  +     0.13241491054212 *
        S_RMntFrq  +     0.94872655811163 * S_Recency
          +     0.22002222738147 * S_Teenhome ;
   H1x1_4  =     0.46328587348713 * S_AcceptedCmpTotal
          +      -0.306946385792 * S_Age  +    -0.24247964225191 * S_Frq
          +    -0.42968609314513 * S_Income  +    -0.08934431746158 *
        S_Kidhome  +     0.15972194979558 * S_Mnt  +    -0.22174909818279 *
        S_MntFishProducts  +    -0.23755215058744 * S_MntFruits
          +      -0.124789433808 * S_MntGoldProds  +     0.50040173514144 *
        S_MntMeatProducts  +     0.02850063230459 * S_MntSweetProducts
          +     0.13427582671876 * S_MntWines  +     0.25569886862761 *
        S_MonthsAsCustomer  +     0.34004201732149 * S_NumCatalogPurchases
          +     0.29894603062327 * S_NumDealsPurchases
          +     0.07614620530875 * S_NumDistPurchases
          +     0.15402335009896 * S_NumStorePurchases
          +     0.10615749096863 * S_NumWebPurchases
          +     0.41962286816879 * S_NumWebVisitsMonth
          +     0.00203630873093 * S_RFMstat  +     0.04736976805951 *
        S_RMntFrq  +    -0.84751074132422 * S_Recency
          +      0.2189023557249 * S_Teenhome ;
   H1x1_5  =    -0.32353341757368 * S_AcceptedCmpTotal
          +     0.03233494925748 * S_Age  +    -0.21296093282526 * S_Frq
          +    -0.33919081075007 * S_Income  +     0.08771362671573 *
        S_Kidhome  +    -0.10797068838726 * S_Mnt  +    -0.19736358637985 *
        S_MntFishProducts  +    -0.19679917231132 * S_MntFruits
          +     0.07502386205588 * S_MntGoldProds  +    -0.50948750987247 *
        S_MntMeatProducts  +     0.00413757018488 * S_MntSweetProducts
          +      0.0788538305785 * S_MntWines  +    -0.02917052455021 *
        S_MonthsAsCustomer  +    -0.53933514609821 * S_NumCatalogPurchases
          +     0.14392502416642 * S_NumDealsPurchases
          +    -0.10026304978633 * S_NumDistPurchases
          +     -0.0588453022746 * S_NumStorePurchases
          +     0.24799398610395 * S_NumWebPurchases
          +    -0.52695548549717 * S_NumWebVisitsMonth
          +     0.01855620452049 * S_RFMstat  +    -0.00189170766477 *
        S_RMntFrq  +     0.51841177421912 * S_Recency
          +     0.31491299720207 * S_Teenhome ;
   H1x1_6  =     -0.2113594539647 * S_AcceptedCmpTotal
          +     -0.1052829531896 * S_Age  +     0.30802959734964 * S_Frq
          +    -0.03112570586685 * S_Income  +     0.19129661263247 *
        S_Kidhome  +     0.00533736622639 * S_Mnt  +    -0.06112703732925 *
        S_MntFishProducts  +    -0.15875686512247 * S_MntFruits
          +    -0.08040179272112 * S_MntGoldProds  +    -0.14462087536907 *
        S_MntMeatProducts  +     0.21353582706121 * S_MntSweetProducts
          +    -0.30180630737612 * S_MntWines  +    -0.11825033043182 *
        S_MonthsAsCustomer  +     -0.2917393256645 * S_NumCatalogPurchases
          +     0.08149600854964 * S_NumDealsPurchases
          +     0.16873541613513 * S_NumDistPurchases
          +    -0.20437343413446 * S_NumStorePurchases
          +     -0.1671107527288 * S_NumWebPurchases
          +     0.03677043100993 * S_NumWebVisitsMonth
          +      0.0240516540488 * S_RFMstat  +     0.06155030856383 *
        S_RMntFrq  +    -0.28802122451372 * S_Recency
          +     0.06998878697307 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.33641509021082 * AcceptedCmp10
          +     0.03092292109435 * AcceptedCmp20  +    -0.23551187181907 *
        AcceptedCmp30  +    -0.06694400005185 * AcceptedCmp40
          +    -0.14203506237074 * AcceptedCmp50  +    -0.25866390496966 *
        Complain0  +     0.19505921178308 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.09937599707203 * AcceptedCmp10
          +     0.03831208573575 * AcceptedCmp20  +     0.39683693019758 *
        AcceptedCmp30  +     0.37006277175295 * AcceptedCmp40
          +     0.21293419476895 * AcceptedCmp50  +     0.15528568367473 *
        Complain0  +    -0.30210013299822 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.29891621770856 * AcceptedCmp10
          +     0.64938384482014 * AcceptedCmp20  +     0.44997242602142 *
        AcceptedCmp30  +       0.479093722666 * AcceptedCmp40
          +     0.50957180373919 * AcceptedCmp50  +     0.27833535432461 *
        Complain0  +    -0.20383534906723 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.26872515586946 * AcceptedCmp10
          +    -0.24299337381911 * AcceptedCmp20  +    -0.01147155911926 *
        AcceptedCmp30  +     -0.3056041277894 * AcceptedCmp40
          +    -0.05496409609003 * AcceptedCmp50  +     0.07858238173893 *
        Complain0  +     0.05721550070076 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.14067626649899 * AcceptedCmp10
          +    -0.30627802828357 * AcceptedCmp20  +     0.05057942365592 *
        AcceptedCmp30  +    -0.10378506600459 * AcceptedCmp40
          +     0.07479232390108 * AcceptedCmp50  +     0.07252750671496 *
        Complain0  +     0.11114854035831 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +    -0.25806332334976 * AcceptedCmp10
          +     0.03944021903138 * AcceptedCmp20  +    -0.08792206887119 *
        AcceptedCmp30  +    -0.24631282865199 * AcceptedCmp40
          +    -0.06123991538969 * AcceptedCmp50  +    -0.03114784375357 *
        Complain0  +    -0.25204544481193 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +      0.2972170984261 * Education2n_Cycle
          +     0.01651368568996 * EducationBasic  +     -0.1186055936649 *
        EducationGraduation  +      0.0228208538951 * EducationMaster
          +    -0.31045295887604 * Marital_StatusDivorced
          +    -0.01109401001539 * Marital_StatusMarried
          +     0.01325135981025 * Marital_StatusSingle
          +     0.16609357475978 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.07095220065018 * Education2n_Cycle
          +    -0.23491732567608 * EducationBasic  +     0.20187086452315 *
        EducationGraduation  +     0.07524128723108 * EducationMaster
          +     0.02275101861599 * Marital_StatusDivorced
          +     0.20271548664903 * Marital_StatusMarried
          +    -0.12132069210718 * Marital_StatusSingle
          +     0.00085090729385 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.02268297689573 * Education2n_Cycle
          +     0.06359770535369 * EducationBasic  +     -0.1194001280088 *
        EducationGraduation  +     0.17299848976308 * EducationMaster
          +     -0.4992959703281 * Marital_StatusDivorced
          +     0.62071659624138 * Marital_StatusMarried
          +    -0.21776202274494 * Marital_StatusSingle
          +     0.54712874598141 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.17773353520266 * Education2n_Cycle
          +     0.17998728120628 * EducationBasic  +    -0.00324602612825 *
        EducationGraduation  +    -0.22448876765089 * EducationMaster
          +     0.05626212670587 * Marital_StatusDivorced
          +     0.14353891364597 * Marital_StatusMarried
          +    -0.29006765622997 * Marital_StatusSingle
          +     0.05503638282535 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.06634316870499 * Education2n_Cycle
          +    -0.36153880127411 * EducationBasic  +     0.23023144658635 *
        EducationGraduation  +    -0.06568730318683 * EducationMaster
          +    -0.21206913700604 * Marital_StatusDivorced
          +     0.58790643614629 * Marital_StatusMarried
          +    -0.65995982578062 * Marital_StatusSingle
          +     0.49642503732428 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.16504024096118 * Education2n_Cycle
          +     0.11925867171875 * EducationBasic  +    -0.04213907014732 *
        EducationGraduation  +    -0.21389968555475 * EducationMaster
          +    -0.05047370516008 * Marital_StatusDivorced
          +    -0.23139090963669 * Marital_StatusMarried
          +     0.04816197463249 * Marital_StatusSingle
          +     0.04977890114896 * Marital_StatusTogether ;
   H1x1_1  =    -1.90576647346127 + H1x1_1 ;
   H1x1_2  =     0.32295787429294 + H1x1_2 ;
   H1x1_3  =     0.75117643107919 + H1x1_3 ;
   H1x1_4  =      1.2336762751587 + H1x1_4 ;
   H1x1_5  =    -0.97062317465491 + H1x1_5 ;
   H1x1_6  =    -1.15756803634408 + H1x1_6 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x1_1  < _REC_EPS AND H1x1_1  > - _REC_EPS THEN
   H1x1_1  = H1x1_1  * H1x1_1 ;
   ELSE H1x1_1  = _REC_EPS ;
   IF H1x1_2  < _REC_EPS AND H1x1_2  > - _REC_EPS THEN
   H1x1_2  = H1x1_2  * H1x1_2 ;
   ELSE H1x1_2  = _REC_EPS ;
   IF H1x1_3  < _REC_EPS AND H1x1_3  > - _REC_EPS THEN
   H1x1_3  = H1x1_3  * H1x1_3 ;
   ELSE H1x1_3  = _REC_EPS ;
   IF H1x1_4  < _REC_EPS AND H1x1_4  > - _REC_EPS THEN
   H1x1_4  = H1x1_4  * H1x1_4 ;
   ELSE H1x1_4  = _REC_EPS ;
   IF H1x1_5  < _REC_EPS AND H1x1_5  > - _REC_EPS THEN
   H1x1_5  = H1x1_5  * H1x1_5 ;
   ELSE H1x1_5  = _REC_EPS ;
   IF H1x1_6  < _REC_EPS AND H1x1_6  > - _REC_EPS THEN
   H1x1_6  = H1x1_6  * H1x1_6 ;
   ELSE H1x1_6  = _REC_EPS ;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
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
   P_DepVar1  =    -0.99830813428318 * H1x1_1  +     1.33495006526712 * H1x1_2
          +    -1.37942150026657 * H1x1_3  +     1.22714974922576 * H1x1_4
          +     1.73375794385595 * H1x1_5  +     -0.0100306049679 * H1x1_6 ;
   P_DepVar1  =    -1.90393999986167 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x1_4
H1x1_5
H1x1_6
;
drop S_:;
