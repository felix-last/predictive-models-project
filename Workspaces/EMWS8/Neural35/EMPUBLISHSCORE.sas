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
      label S_Income = 'Standard: Income' ;

      label S_Kidhome = 'Standard: Kidhome' ;

      label S_MntFishProducts = 'Standard: MntFishProducts' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumStorePurchases = 'Standard: NumStorePurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label AcceptedCmp10 = 'Dummy: AcceptedCmp1=0' ;

      label AcceptedCmp20 = 'Dummy: AcceptedCmp2=0' ;

      label AcceptedCmp30 = 'Dummy: AcceptedCmp3=0' ;

      label AcceptedCmp40 = 'Dummy: AcceptedCmp4=0' ;

      label AcceptedCmp50 = 'Dummy: AcceptedCmp5=0' ;

      label Complain0 = 'Dummy: Complain=0' ;

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
   Income ,
   Kidhome ,
   MntFishProducts ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   MntWines ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumStorePurchases ,
   NumWebPurchases ,
   NumWebVisitsMonth ,
   Recency ,
   Teenhome   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
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
   S_NumStorePurchases  =    -1.81825213465822 +     0.30716078899015 *
        NumStorePurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
ELSE DO;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Kidhome ) THEN S_Kidhome  = . ;
   ELSE S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
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
   IF MISSING( NumStorePurchases ) THEN S_NumStorePurchases  = . ;
   ELSE S_NumStorePurchases  =    -1.81825213465822 +     0.30716078899015 *
        NumStorePurchases ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
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
   H11  =     0.87660114046125 * S_Income  +     -0.7994451897827 * S_Kidhome
          +    -0.08967295716195 * S_MntFishProducts
          +     0.03184635437516 * S_MntFruits  +    -0.13860895575438 *
        S_MntGoldProds  +     0.55790460748169 * S_MntMeatProducts
          +    -0.02806094557115 * S_MntSweetProducts
          +    -0.14537763592724 * S_MntWines  +     0.76891266523847 *
        S_NumCatalogPurchases  +     0.16842007461305 * S_NumDealsPurchases
          +     0.25137876058262 * S_NumStorePurchases
          +    -0.07865442401292 * S_NumWebPurchases
          +     1.03197398967259 * S_NumWebVisitsMonth
          +    -1.26907156503759 * S_Recency  +    -0.76016893316351 *
        S_Teenhome ;
   H12  =     0.37295000114468 * S_Income  +    -0.12834211496575 * S_Kidhome
          +     0.19312392388912 * S_MntFishProducts
          +      0.1561688289137 * S_MntFruits  +     0.04004810938796 *
        S_MntGoldProds  +     0.32599201739588 * S_MntMeatProducts
          +       0.204174263605 * S_MntSweetProducts
          +    -0.11560784817014 * S_MntWines  +     0.12255073568725 *
        S_NumCatalogPurchases  +    -0.05543734180218 * S_NumDealsPurchases
          +     0.07747830335769 * S_NumStorePurchases
          +     0.07960837555191 * S_NumWebPurchases
          +     0.02351602389122 * S_NumWebVisitsMonth
          +     -0.2840853952427 * S_Recency  +    -0.47421627761687 *
        S_Teenhome ;
   H13  =    -0.33428925248315 * S_Income  +    -0.03845622730742 * S_Kidhome
          +     0.18733919794636 * S_MntFishProducts
          +     0.45907982190052 * S_MntFruits  +    -0.48776616433719 *
        S_MntGoldProds  +    -0.41340481007204 * S_MntMeatProducts
          +     0.42514606159239 * S_MntSweetProducts
          +     0.20038001368787 * S_MntWines  +    -1.21708501803782 *
        S_NumCatalogPurchases  +    -1.06820061274533 * S_NumDealsPurchases
          +     0.36582106462789 * S_NumStorePurchases
          +     0.04244777020435 * S_NumWebPurchases
          +    -0.24296342902503 * S_NumWebVisitsMonth
          +     0.27451716762947 * S_Recency  +     0.13110477325277 *
        S_Teenhome ;
   H14  =    -0.70493412542585 * S_Income  +     0.41202796606799 * S_Kidhome
          +     0.05986489897572 * S_MntFishProducts
          +    -0.05040531715469 * S_MntFruits  +       0.051068387592 *
        S_MntGoldProds  +    -0.13581881662481 * S_MntMeatProducts
          +    -0.05513370461072 * S_MntSweetProducts
          +     0.77472084468819 * S_MntWines  +    -0.03211788969126 *
        S_NumCatalogPurchases  +    -0.24097486430988 * S_NumDealsPurchases
          +     0.64364674828841 * S_NumStorePurchases
          +     0.15084748708424 * S_NumWebPurchases
          +    -0.94144998356377 * S_NumWebVisitsMonth
          +     1.16778338364599 * S_Recency  +     0.32089861635238 *
        S_Teenhome ;
   H15  =    -0.15703510827879 * S_Income  +    -0.30977841002562 * S_Kidhome
          +    -0.14543196273578 * S_MntFishProducts
          +     0.32223695896711 * S_MntFruits  +    -0.31846203211698 *
        S_MntGoldProds  +     -1.4125160823105 * S_MntMeatProducts
          +     0.49374793444169 * S_MntSweetProducts
          +     0.39699716010219 * S_MntWines  +    -0.88140331687645 *
        S_NumCatalogPurchases  +    -0.87657222813687 * S_NumDealsPurchases
          +     1.23754786782746 * S_NumStorePurchases
          +     1.11316667348511 * S_NumWebPurchases
          +    -1.08592446439781 * S_NumWebVisitsMonth
          +     0.66958517589542 * S_Recency  +     0.06799032788481 *
        S_Teenhome ;
   H16  =    -0.10360901553583 * S_Income  +     0.39257497240865 * S_Kidhome
          +     0.29549884005341 * S_MntFishProducts
          +     0.04922491353914 * S_MntFruits  +     -0.1412659458221 *
        S_MntGoldProds  +    -0.12361454534126 * S_MntMeatProducts
          +    -0.11909215986981 * S_MntSweetProducts
          +     0.11430484977092 * S_MntWines  +    -0.66235553839539 *
        S_NumCatalogPurchases  +     0.17261763180198 * S_NumDealsPurchases
          +     0.30109334594548 * S_NumStorePurchases
          +     0.01985762767489 * S_NumWebPurchases
          +     0.44965133281333 * S_NumWebVisitsMonth
          +     0.32338634259192 * S_Recency  +    -0.04032956941805 *
        S_Teenhome ;
   H11  = H11  +    -0.23026310289024 * AcceptedCmp10
          +    -0.82550012364234 * AcceptedCmp20  +    -0.67764228269441 *
        AcceptedCmp30  +    -0.51547666117685 * AcceptedCmp40
          +    -0.36424958084824 * AcceptedCmp50  +       0.119862855783 *
        Complain0 ;
   H12  = H12  +     0.02722288857426 * AcceptedCmp10
          +      0.1236576068539 * AcceptedCmp20  +    -0.31265425960737 *
        AcceptedCmp30  +    -0.25076565034266 * AcceptedCmp40
          +    -0.20158659730872 * AcceptedCmp50  +    -0.43687103612629 *
        Complain0 ;
   H13  = H13  +     0.21852176280571 * AcceptedCmp10
          +     0.01727991436107 * AcceptedCmp20  +     0.19303261094625 *
        AcceptedCmp30  +    -0.65492191560509 * AcceptedCmp40
          +    -0.09636750660684 * AcceptedCmp50  +     0.07579128571046 *
        Complain0 ;
   H14  = H14  +     0.20819294353855 * AcceptedCmp10
          +      0.5159102831901 * AcceptedCmp20  +     0.55295587458643 *
        AcceptedCmp30  +     0.80682431419623 * AcceptedCmp40
          +     0.74007057798158 * AcceptedCmp50  +     -0.4573052390807 *
        Complain0 ;
   H15  = H15  +     1.26330939420524 * AcceptedCmp10
          +     0.29494505935793 * AcceptedCmp20  +     0.25561322032419 *
        AcceptedCmp30  +     0.50102236777897 * AcceptedCmp40
          +     0.20696267245027 * AcceptedCmp50  +    -0.00849145233901 *
        Complain0 ;
   H16  = H16  +     0.03638428330381 * AcceptedCmp10
          +     0.27994215452657 * AcceptedCmp20  +    -0.03861840445025 *
        AcceptedCmp30  +      0.3398057347433 * AcceptedCmp40
          +    -0.00738335957724 * AcceptedCmp50  +      0.0447804375799 *
        Complain0 ;
   H11  = H11  +     0.27482405283962 * Education2n_Cycle
          +     0.11084012456612 * EducationBasic  +    -0.23835071987159 *
        EducationGraduation  +    -0.10167082180552 * EducationMaster
          +     0.51015833145636 * Marital_StatusDivorced
          +     -1.1653662063616 * Marital_StatusMarried
          +     1.19396547750441 * Marital_StatusSingle
          +    -0.99605751789992 * Marital_StatusTogether ;
   H12  = H12  +    -0.05268347704739 * Education2n_Cycle
          +     0.19362065968028 * EducationBasic  +    -0.26784257195414 *
        EducationGraduation  +     0.16650577465959 * EducationMaster
          +     0.09154288513995 * Marital_StatusDivorced
          +     0.06725684628382 * Marital_StatusMarried
          +     0.11327659191494 * Marital_StatusSingle
          +     0.01793778876811 * Marital_StatusTogether ;
   H13  = H13  +     -0.1027084329077 * Education2n_Cycle
          +    -0.01342449140757 * EducationBasic  +    -0.35627920427273 *
        EducationGraduation  +    -0.05554656531793 * EducationMaster
          +     0.37591653615852 * Marital_StatusDivorced
          +    -0.05024236790132 * Marital_StatusMarried
          +    -0.28317154997144 * Marital_StatusSingle
          +    -0.19247490223101 * Marital_StatusTogether ;
   H14  = H14  +     -0.4162491480577 * Education2n_Cycle
          +     0.38075572764074 * EducationBasic  +    -0.28169469529121 *
        EducationGraduation  +       0.638986138084 * EducationMaster
          +    -0.44885292450558 * Marital_StatusDivorced
          +     0.78958791519299 * Marital_StatusMarried
          +    -0.09688714431356 * Marital_StatusSingle
          +     0.84239030196202 * Marital_StatusTogether ;
   H15  = H15  +     0.33126657974568 * Education2n_Cycle
          +     0.44539039262703 * EducationBasic  +    -0.09154902903865 *
        EducationGraduation  +    -0.26400363440725 * EducationMaster
          +    -0.30801073895989 * Marital_StatusDivorced
          +     -0.1285150749223 * Marital_StatusMarried
          +     0.06775542164414 * Marital_StatusSingle
          +    -0.13032366945766 * Marital_StatusTogether ;
   H16  = H16  +     0.02030175222681 * Education2n_Cycle
          +    -0.19579401096879 * EducationBasic  +      0.2070703930869 *
        EducationGraduation  +    -0.40706983167068 * EducationMaster
          +     0.22193599090368 * Marital_StatusDivorced
          +    -0.54544672042168 * Marital_StatusMarried
          +    -0.02237436019864 * Marital_StatusSingle
          +    -0.21979468164854 * Marital_StatusTogether ;
   H11  =    -1.24550293901788 + H11 ;
   H12  =     0.36762263942809 + H12 ;
   H13  =     0.07010867577103 + H13 ;
   H14  =    -1.94014549272156 + H14 ;
   H15  =     0.17666656180153 + H15 ;
   H16  =    -1.64626406576709 + H16 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     4.21126046696691 * H11  +      0.6565061288056 * H12
          +    -1.92484011508628 * H13  +    -3.74020722142387 * H14
          +    -3.27353026762143 * H15  +     -1.2596922869974 * H16 ;
   P_DepVar1  =    -1.36806658950323 + P_DepVar1 ;
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
H16
;
drop S_:;
