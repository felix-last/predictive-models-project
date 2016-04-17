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

      label S_Kidhome = 'Standard: Kidhome' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFishProducts = 'Standard: MntFishProducts' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_NumStorePurchases = 'Standard: NumStorePurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label AcceptedCmp10 = 'Dummy: AcceptedCmp1=0' ;

      label AcceptedCmp20 = 'Dummy: AcceptedCmp2=0' ;

      label AcceptedCmp30 = 'Dummy: AcceptedCmp3=0' ;

      label AcceptedCmp40 = 'Dummy: AcceptedCmp4=0' ;

      label AcceptedCmp50 = 'Dummy: AcceptedCmp5=0' ;

      label Complain0 = 'Dummy: Complain=0' ;

      label HigherEducationBinary0 = 'Dummy: HigherEducationBinary=0' ;

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
   Kidhome , 
   Mnt , 
   MntFishProducts , 
   MntFruits , 
   MntGoldProds , 
   MntMeatProducts , 
   MntSweetProducts , 
   MntWines , 
   NumCatalogPurchases , 
   NumDealsPurchases , 
   NumDistPurchases , 
   NumStorePurchases , 
   NumWebPurchases , 
   NumWebVisitsMonth , 
   RFMstat , 
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
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
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
   H11  =    -0.31336975179768 * S_AcceptedCmpTotal  +     0.55217606948262 * 
        S_Kidhome  +     0.30934248519275 * S_Mnt  +     0.21704081651602 * 
        S_MntFishProducts  +      0.0286842970037 * S_MntFruits
          +     -0.0428936614026 * S_MntGoldProds  +     0.04106839234795 * 
        S_MntMeatProducts  +     -0.2219223463878 * S_MntSweetProducts
          +     0.07714161131062 * S_MntWines  +    -0.47043004421243 * 
        S_NumCatalogPurchases  +    -0.34552756945236 * S_NumDealsPurchases
          +    -0.08565162229542 * S_NumDistPurchases
          +      0.2498966077742 * S_NumStorePurchases
          +    -0.03810974523517 * S_NumWebPurchases
          +     0.50983692369041 * S_NumWebVisitsMonth
          +     0.08815778320903 * S_RFMstat  +     0.09119895780804 * 
        S_Recency  +     0.13511958264343 * S_Teenhome ;
   H12  =    -0.24937709830237 * S_AcceptedCmpTotal  +    -0.24749428309219 * 
        S_Kidhome  +    -0.12930178120586 * S_Mnt  +     0.13546025995573 * 
        S_MntFishProducts  +     0.28360186554431 * S_MntFruits
          +    -0.05241802314535 * S_MntGoldProds  +    -0.66941662270923 * 
        S_MntMeatProducts  +     0.15336628351126 * S_MntSweetProducts
          +      0.4032078630799 * S_MntWines  +    -0.56890394617047 * 
        S_NumCatalogPurchases  +    -0.64950384504567 * S_NumDealsPurchases
          +     0.23154666595931 * S_NumDistPurchases
          +     0.54534387610808 * S_NumStorePurchases
          +     0.41139490970672 * S_NumWebPurchases
          +    -0.55413387763351 * S_NumWebVisitsMonth
          +    -0.26075003734578 * S_RFMstat  +     0.49052010543197 * 
        S_Recency  +     -0.0404801860777 * S_Teenhome ;
   H13  =     0.21315421089843 * S_AcceptedCmpTotal  +    -0.40934954273162 * 
        S_Kidhome  +    -0.14257980270562 * S_Mnt  +    -0.02326723710858 * 
        S_MntFishProducts  +     0.03093571619826 * S_MntFruits
          +    -0.09540637054036 * S_MntGoldProds  +       0.216562837751 * 
        S_MntMeatProducts  +    -0.06578520743957 * S_MntSweetProducts
          +    -0.45983147514787 * S_MntWines  +     0.28991677967619 * 
        S_NumCatalogPurchases  +     -0.0581811780876 * S_NumDealsPurchases
          +     0.05120135471729 * S_NumDistPurchases
          +    -0.26556926910649 * S_NumStorePurchases
          +    -0.44351155109785 * S_NumWebPurchases
          +     0.88609841670248 * S_NumWebVisitsMonth
          +    -0.05355058809893 * S_RFMstat  +    -0.73370046845716 * 
        S_Recency  +    -0.20220070524982 * S_Teenhome ;
   H14  =     0.39698224199543 * S_AcceptedCmpTotal  +    -0.20120366596375 * 
        S_Kidhome  +      0.3167228298887 * S_Mnt  +     0.01157053818495 * 
        S_MntFishProducts  +    -0.01328592356982 * S_MntFruits
          +     0.00886948034365 * S_MntGoldProds  +     1.21666314524043 * 
        S_MntMeatProducts  +    -0.09283019720022 * S_MntSweetProducts
          +    -0.09586722258183 * S_MntWines  +    -0.01785512232978 * 
        S_NumCatalogPurchases  +    -0.21291958246407 * S_NumDealsPurchases
          +     0.39404855135103 * S_NumDistPurchases
          +    -0.07248752877179 * S_NumStorePurchases
          +    -0.10123700375349 * S_NumWebPurchases
          +     0.42450276314027 * S_NumWebVisitsMonth
          +     0.24279716857154 * S_RFMstat  +    -0.58955338934321 * 
        S_Recency  +    -0.30629869350731 * S_Teenhome ;
   H15  =     0.30758619083232 * S_AcceptedCmpTotal  +     -0.0124289721914 * 
        S_Kidhome  +    -0.05376010749039 * S_Mnt  +    -0.00466013129163 * 
        S_MntFishProducts  +     -0.0128351925647 * S_MntFruits
          +       0.418369814853 * S_MntGoldProds  +    -0.44302877451838 * 
        S_MntMeatProducts  +     0.10514229364725 * S_MntSweetProducts
          +     0.34164846881132 * S_MntWines  +    -0.02137843790281 * 
        S_NumCatalogPurchases  +     -0.0656649517507 * S_NumDealsPurchases
          +     0.27175946433967 * S_NumDistPurchases
          +     0.16942067472984 * S_NumStorePurchases
          +     0.16250565660711 * S_NumWebPurchases
          +    -0.20203561703211 * S_NumWebVisitsMonth
          +     0.14491189794214 * S_RFMstat  +    -0.22675112064568 * 
        S_Recency  +      0.1811664309815 * S_Teenhome ;
   H11  = H11  +    -0.26538416697651 * AcceptedCmp10
          +    -0.28983118331232 * AcceptedCmp20  +    -0.32322818178704 * 
        AcceptedCmp30  +    -0.03993661807643 * AcceptedCmp40
          +     0.06994002730973 * AcceptedCmp50  +    -0.07716774247605 * 
        Complain0  +      0.2585392734779 * HigherEducationBinary0 ;
   H12  = H12  +     0.26018307810736 * AcceptedCmp10
          +     0.04049534355706 * AcceptedCmp20  +     0.11270892132762 * 
        AcceptedCmp30  +     0.11221187249984 * AcceptedCmp40
          +     0.17472976197603 * AcceptedCmp50  +     0.15606486866287 * 
        Complain0  +     0.08065554959159 * HigherEducationBinary0 ;
   H13  = H13  +     0.02279534546007 * AcceptedCmp10
          +    -0.27459928968957 * AcceptedCmp20  +    -0.15207279864055 * 
        AcceptedCmp30  +    -0.07324517817975 * AcceptedCmp40
          +     -0.4186492052078 * AcceptedCmp50  +     0.22766105161511 * 
        Complain0  +    -0.00716085865509 * HigherEducationBinary0 ;
   H14  = H14  +    -0.30447666177293 * AcceptedCmp10
          +     0.07907637737546 * AcceptedCmp20  +    -0.01358906665622 * 
        AcceptedCmp30  +     0.04426640297686 * AcceptedCmp40
          +     0.00911097068478 * AcceptedCmp50  +    -0.10112384137038 * 
        Complain0  +     0.05359674201133 * HigherEducationBinary0 ;
   H15  = H15  +    -0.31560065228661 * AcceptedCmp10
          +     0.17796753054999 * AcceptedCmp20  +    -0.30736861931223 * 
        AcceptedCmp30  +    -0.26334867599652 * AcceptedCmp40
          +    -0.19775668628356 * AcceptedCmp50  +     0.09156081270418 * 
        Complain0  +     0.16300151411284 * HigherEducationBinary0 ;
   H11  = H11  +     0.17457297183466 * Marital_StatusDivorced
          +    -0.18709572120712 * Marital_StatusMarried
          +    -0.17856903026629 * Marital_StatusSingle
          +     0.13783214631264 * Marital_StatusTogether ;
   H12  = H12  +    -0.00304373365465 * Marital_StatusDivorced
          +    -0.16741351681675 * Marital_StatusMarried
          +      0.0768369461222 * Marital_StatusSingle
          +    -0.24741602840563 * Marital_StatusTogether ;
   H13  = H13  +     0.30534805329266 * Marital_StatusDivorced
          +    -0.85130030031409 * Marital_StatusMarried
          +     0.57365531089483 * Marital_StatusSingle
          +    -0.94902600797801 * Marital_StatusTogether ;
   H14  = H14  +     0.13923025215159 * Marital_StatusDivorced
          +    -0.10273688858818 * Marital_StatusMarried
          +     0.37267011958223 * Marital_StatusSingle
          +    -0.03704936024152 * Marital_StatusTogether ;
   H15  = H15  +     -0.1497917828097 * Marital_StatusDivorced
          +    -0.12309472866952 * Marital_StatusMarried
          +      0.0895004316905 * Marital_StatusSingle
          +    -0.06693333133964 * Marital_StatusTogether ;
   H11  =    -0.25731444426672 + H11 ;
   H12  =     0.87003179402118 + H12 ;
   H13  =     0.90055724527443 + H13 ;
   H14  =    -0.88878585940926 + H14 ;
   H15  =    -1.06135597773699 + H15 ;
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
   P_DepVar1  =    -2.23627327600133 * H11  +    -5.23001272777429 * H12
          +     3.61561162996052 * H13  +     4.27940030557467 * H14
          +     0.95777699944459 * H15 ;
   P_DepVar1  =    -1.37696256001086 + P_DepVar1 ;
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
