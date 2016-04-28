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
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     -0.4611267706725 * S_AcceptedCmpTotal  +    -0.03135819632098 * 
        S_Age  +    -0.30366906159302 * S_Frq  +     -1.0896518705652 * 
        S_Income  +     0.50191873087949 * S_Kidhome
          +    -0.22454834572835 * S_Mnt  +    -0.08132783969135 * 
        S_MntFishProducts  +     0.18091348168563 * S_MntFruits
          +      0.1206414119267 * S_MntGoldProds  +    -0.38348507223091 * 
        S_MntMeatProducts  +     0.23623216821119 * S_MntSweetProducts
          +     0.74896857211855 * S_MntWines  +    -0.13103056622678 * 
        S_MonthsAsCustomer  +     -0.4616385026407 * S_NumCatalogPurchases
          +    -0.03703645172372 * S_NumDealsPurchases
          +     -0.3781640498832 * S_NumDistPurchases
          +     0.14812154206798 * S_NumStorePurchases
          +     0.22754171286544 * S_NumWebPurchases
          +    -1.01348286653777 * S_NumWebVisitsMonth
          +     0.07715574227035 * S_RFMstat  +    -0.43134762214138 * 
        S_RMntFrq  +     1.33749071525761 * S_Recency
          +     0.86538968368564 * S_Teenhome ;
   H12  =     0.47248837099612 * S_AcceptedCmpTotal  +     0.01897911067425 * 
        S_Age  +    -0.02691815128876 * S_Frq  +     0.51255280094022 * 
        S_Income  +     0.25364266949291 * S_Kidhome
          +     0.24441421770863 * S_Mnt  +    -0.48796543815175 * 
        S_MntFishProducts  +    -0.10444909087337 * S_MntFruits
          +     0.21019085222397 * S_MntGoldProds  +     2.10701090246422 * 
        S_MntMeatProducts  +     0.06253346879553 * S_MntSweetProducts
          +    -0.78263952320855 * S_MntWines  +     0.05393663504594 * 
        S_MonthsAsCustomer  +     1.54209847351209 * S_NumCatalogPurchases
          +     0.76062985171333 * S_NumDealsPurchases
          +     0.29839088731799 * S_NumDistPurchases
          +    -0.71685043776808 * S_NumStorePurchases
          +    -0.85474520231851 * S_NumWebPurchases
          +     0.23379299914756 * S_NumWebVisitsMonth
          +     0.50469330142002 * S_RFMstat  +     0.09439704541405 * 
        S_RMntFrq  +    -0.24621690651213 * S_Recency
          +    -0.13222842327362 * S_Teenhome ;
   H13  =    -0.14275113403197 * S_AcceptedCmpTotal  +     0.01958810253253 * 
        S_Age  +    -0.09418597975822 * S_Frq  +    -0.02956386251821 * 
        S_Income  +    -0.02285297686405 * S_Kidhome
          +     0.15839216667554 * S_Mnt  +     0.08700170175819 * 
        S_MntFishProducts  +     -0.0767563646304 * S_MntFruits
          +     0.10882057261381 * S_MntGoldProds  +     0.16312048765873 * 
        S_MntMeatProducts  +    -0.27579388152034 * S_MntSweetProducts
          +     -0.2879840869863 * S_MntWines  +    -0.26171218004829 * 
        S_MonthsAsCustomer  +    -0.12775700590383 * S_NumCatalogPurchases
          +    -0.07237669224225 * S_NumDealsPurchases
          +    -0.11298415184558 * S_NumDistPurchases
          +    -0.12203864709502 * S_NumStorePurchases
          +    -0.12875265081419 * S_NumWebPurchases
          +      0.1921682206211 * S_NumWebVisitsMonth
          +     0.29197029916809 * S_RFMstat  +     0.29754900510773 * 
        S_RMntFrq  +    -0.17494889724404 * S_Recency
          +    -0.15772288162284 * S_Teenhome ;
   H14  =      0.0493643441529 * S_AcceptedCmpTotal  +     0.18205048930251 * 
        S_Age  +     0.60193178595646 * S_Frq  +      0.2725454470695 * 
        S_Income  +    -0.47921010598472 * S_Kidhome
          +    -0.07462486421773 * S_Mnt  +     0.21015347509966 * 
        S_MntFishProducts  +     -0.1681096977953 * S_MntFruits
          +      0.2924751501557 * S_MntGoldProds  +    -0.79386110897546 * 
        S_MntMeatProducts  +    -0.10417418439249 * S_MntSweetProducts
          +     0.48559592701401 * S_MntWines  +     0.01075198956144 * 
        S_MonthsAsCustomer  +    -0.87073526419969 * S_NumCatalogPurchases
          +    -0.72359493007226 * S_NumDealsPurchases
          +     0.27754034055345 * S_NumDistPurchases
          +     0.61618208477183 * S_NumStorePurchases
          +     0.66653683994733 * S_NumWebPurchases
          +    -0.49344407777415 * S_NumWebVisitsMonth
          +    -0.14804738193077 * S_RFMstat  +     0.00396158062595 * 
        S_RMntFrq  +     0.43364501993606 * S_Recency
          +     -0.0681921128224 * S_Teenhome ;
   H15  =    -0.55208353638948 * S_AcceptedCmpTotal  +    -0.01940097476759 * 
        S_Age  +     0.15003502368826 * S_Frq  +    -0.43881144276083 * 
        S_Income  +     0.76615830505261 * S_Kidhome
          +    -0.07742510048625 * S_Mnt  +     0.26709389972935 * 
        S_MntFishProducts  +     0.09368897981628 * S_MntFruits
          +    -0.11861511893072 * S_MntGoldProds  +    -0.81590418418896 * 
        S_MntMeatProducts  +     0.06996109986636 * S_MntSweetProducts
          +     0.40767730238528 * S_MntWines  +      0.1632279481094 * 
        S_MonthsAsCustomer  +    -0.61747099347926 * S_NumCatalogPurchases
          +    -0.52295714645329 * S_NumDealsPurchases
          +     0.07695083595057 * S_NumDistPurchases
          +     0.65945972665323 * S_NumStorePurchases
          +     0.66396850117046 * S_NumWebPurchases
          +    -1.46335896307809 * S_NumWebVisitsMonth
          +    -0.11277969090388 * S_RFMstat  +     0.42830172643506 * 
        S_RMntFrq  +      1.3823399803888 * S_Recency
          +     0.29213288404788 * S_Teenhome ;
   H11  = H11  +      0.0211375882582 * AcceptedCmp10
          +     0.36153251888959 * AcceptedCmp20  +     0.29028536922811 * 
        AcceptedCmp30  +     0.47361018721816 * AcceptedCmp40
          +    -0.12917566531505 * AcceptedCmp50  +     0.11325476820885 * 
        Complain0  +    -0.33425460231361 * HigherEducationBinary0 ;
   H12  = H12  +    -0.19805005980822 * AcceptedCmp10
          +     0.22959549723744 * AcceptedCmp20  +     0.20729806627157 * 
        AcceptedCmp30  +     0.29373195797969 * AcceptedCmp40
          +      -0.296932172781 * AcceptedCmp50  +     0.22111437116337 * 
        Complain0  +     -0.1602515219453 * HigherEducationBinary0 ;
   H13  = H13  +    -0.01713557475613 * AcceptedCmp10
          +     0.03304538198765 * AcceptedCmp20  +     0.05935212842848 * 
        AcceptedCmp30  +    -0.05257537931719 * AcceptedCmp40
          +     0.17907986838024 * AcceptedCmp50  +    -0.15842298641503 * 
        Complain0  +     0.12739019712102 * HigherEducationBinary0 ;
   H14  = H14  +      0.0739954097271 * AcceptedCmp10
          +     0.29867453146173 * AcceptedCmp20  +     0.50169386838604 * 
        AcceptedCmp30  +     0.01333087677387 * AcceptedCmp40
          +     0.33512585801404 * AcceptedCmp50  +     0.47682124069088 * 
        Complain0  +     0.19148151967029 * HigherEducationBinary0 ;
   H15  = H15  +     0.24921890257242 * AcceptedCmp10
          +     0.35498350791969 * AcceptedCmp20  +     0.17654937714675 * 
        AcceptedCmp30  +       0.099332194064 * AcceptedCmp40
          +     0.46771441530728 * AcceptedCmp50  +     0.00918314283855 * 
        Complain0  +     0.01161498909777 * HigherEducationBinary0 ;
   H11  = H11  +     0.19665790999009 * Education2n_Cycle
          +    -0.07591816791708 * EducationBasic  +    -0.00516402220717 * 
        EducationGraduation  +     0.06669595434527 * EducationMaster
          +    -0.41881578509022 * Marital_StatusDivorced
          +     1.00880665345443 * Marital_StatusMarried
          +    -0.96555745454287 * Marital_StatusSingle
          +     1.00169448778065 * Marital_StatusTogether ;
   H12  = H12  +     0.15476399527067 * Education2n_Cycle
          +    -0.11788812113226 * EducationBasic  +    -0.00909690969063 * 
        EducationGraduation  +     0.01074780014741 * EducationMaster
          +    -0.23149133047263 * Marital_StatusDivorced
          +      0.3691532082892 * Marital_StatusMarried
          +    -0.14001784801977 * Marital_StatusSingle
          +     0.48600022281821 * Marital_StatusTogether ;
   H13  = H13  +     0.06203490938766 * Education2n_Cycle
          +    -0.33625775695449 * EducationBasic  +     0.16669314466563 * 
        EducationGraduation  +     0.12818882958857 * EducationMaster
          +    -0.07975173215473 * Marital_StatusDivorced
          +     0.03705565112724 * Marital_StatusMarried
          +     0.00390826557659 * Marital_StatusSingle
          +    -0.00677830788498 * Marital_StatusTogether ;
   H14  = H14  +     0.25130576396852 * Education2n_Cycle
          +     0.19804478170759 * EducationBasic  +     0.00361009925734 * 
        EducationGraduation  +    -0.05143982464711 * EducationMaster
          +     0.12999365916175 * Marital_StatusDivorced
          +    -0.41139703442463 * Marital_StatusMarried
          +     0.32062563519547 * Marital_StatusSingle
          +    -0.22614211294703 * Marital_StatusTogether ;
   H15  = H15  +    -0.23331665268372 * Education2n_Cycle
          +     0.09548521875797 * EducationBasic  +    -0.12136955104785 * 
        EducationGraduation  +     0.24014695282974 * EducationMaster
          +    -0.21790982782725 * Marital_StatusDivorced
          +     0.67484506628327 * Marital_StatusMarried
          +    -0.54382531470746 * Marital_StatusSingle
          +     0.86857726780466 * Marital_StatusTogether ;
   H11  =     1.96528090164906 + H11 ;
   H12  =     0.16900600996262 + H12 ;
   H13  =    -2.95780383767979 + H13 ;
   H14  =     0.67290123809145 + H14 ;
   H15  =     -0.1731870881282 + H15 ;
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
   P_DepVar1  =    -3.09408788529977 * H11  +     3.07585753148491 * H12
          +     0.07983236380088 * H13  +    -2.15092125023472 * H14
          +    -3.44354379774997 * H15 ;
   P_DepVar1  =    -1.13954755447035 + P_DepVar1 ;
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
