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
*** Writing the Node interval ;
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.61752831165943 * S_Income  +    -0.31903138173339 * 
        S_Kidhome  +     1.07644564135555 * S_MntFishProducts
          +     0.65454839379318 * S_MntFruits  +    -0.14959507038031 * 
        S_MntGoldProds  +    -5.93493457217182 * S_MntMeatProducts
          +     0.13203247258141 * S_MntSweetProducts
          +     2.56195281130506 * S_MntWines  +    -1.36884424558249 * 
        S_NumCatalogPurchases  +    -0.86876556455629 * S_NumDealsPurchases
          +     1.48881174203434 * S_NumStorePurchases
          +     2.06403591844726 * S_NumWebPurchases
          +    -0.09535558759694 * S_NumWebVisitsMonth
          +    -0.05978552253526 * S_Recency  +     0.15007435747359 * 
        S_Teenhome ;
   H1x1_2  =     0.26608479656795 * S_Income  +    -1.19991366958494 * 
        S_Kidhome  +    -0.06930701896636 * S_MntFishProducts
          +    -0.24491476793503 * S_MntFruits  +     0.61341878614078 * 
        S_MntGoldProds  +     1.20573081926043 * S_MntMeatProducts
          +      0.3852767951223 * S_MntSweetProducts
          +     1.08228250264945 * S_MntWines  +     0.60642303652873 * 
        S_NumCatalogPurchases  +     0.15318179926318 * S_NumDealsPurchases
          +     0.87686526091024 * S_NumStorePurchases
          +     0.48807967312664 * S_NumWebPurchases
          +     2.42770807785792 * S_NumWebVisitsMonth
          +      -2.239057176324 * S_Recency  +    -0.38694456406673 * 
        S_Teenhome ;
   H1x1_3  =     2.14026785899485 * S_Income  +     0.71085813088393 * 
        S_Kidhome  +    -0.12119457643873 * S_MntFishProducts
          +     0.52522197349122 * S_MntFruits  +     0.44706934196977 * 
        S_MntGoldProds  +     1.26484530402043 * S_MntMeatProducts
          +      0.4461192743946 * S_MntSweetProducts
          +     0.68849791421776 * S_MntWines  +     0.73332275156447 * 
        S_NumCatalogPurchases  +     0.25950906585502 * S_NumDealsPurchases
          +     1.26831094932108 * S_NumStorePurchases
          +     0.50819627174451 * S_NumWebPurchases
          +      0.5463426309003 * S_NumWebVisitsMonth
          +    -1.45156203280121 * S_Recency  +    -0.99155600458731 * 
        S_Teenhome ;
   H1x1_4  =     0.28134858392415 * S_Income  +     1.57838616473011 * 
        S_Kidhome  +     0.01685933792865 * S_MntFishProducts
          +     0.64818795957189 * S_MntFruits  +     0.44053765721056 * 
        S_MntGoldProds  +     -0.0350414210023 * S_MntMeatProducts
          +     0.73630834236265 * S_MntSweetProducts
          +     2.20164313777354 * S_MntWines  +    -0.71244138939707 * 
        S_NumCatalogPurchases  +    -0.05218003711946 * S_NumDealsPurchases
          +     2.08815797619397 * S_NumStorePurchases
          +     1.47250122683369 * S_NumWebPurchases
          +    -1.95745344341946 * S_NumWebVisitsMonth
          +     1.52461902721397 * S_Recency  +     0.07114080397665 * 
        S_Teenhome ;
   H1x1_5  =     0.06299419029838 * S_Income  +    -0.25263043424438 * 
        S_Kidhome  +    -0.72407836360298 * S_MntFishProducts
          +     0.46240377706589 * S_MntFruits  +    -0.31168917499552 * 
        S_MntGoldProds  +     3.17795585534164 * S_MntMeatProducts
          +    -0.23438993753342 * S_MntSweetProducts
          +     -2.0392497753494 * S_MntWines  +      1.0094456692298 * 
        S_NumCatalogPurchases  +     1.21992922429388 * S_NumDealsPurchases
          +    -0.49697408067153 * S_NumStorePurchases
          +     0.41091736049576 * S_NumWebPurchases
          +     1.61180593172142 * S_NumWebVisitsMonth
          +    -2.15417652342106 * S_Recency  +    -0.30863432234672 * 
        S_Teenhome ;
   H1x1_1  = H1x1_1  +     1.15191639869453 * AcceptedCmp10
          +      0.0367982148477 * AcceptedCmp20  +      0.3258650789605 * 
        AcceptedCmp30  +      0.2580514232707 * AcceptedCmp40
          +     0.63958723501202 * AcceptedCmp50  +    -0.32640656229888 * 
        Complain0 ;
   H1x1_2  = H1x1_2  +    -1.74950558446111 * AcceptedCmp10
          +    -0.90356166498734 * AcceptedCmp20  +    -1.23130580993933 * 
        AcceptedCmp30  +     -1.4169795699816 * AcceptedCmp40
          +    -1.78889837976364 * AcceptedCmp50  +      1.4788954382262 * 
        Complain0 ;
   H1x1_3  = H1x1_3  +     0.19640584758608 * AcceptedCmp10
          +    -0.02812292141076 * AcceptedCmp20  +     0.18411950002405 * 
        AcceptedCmp30  +     0.14654389018041 * AcceptedCmp40
          +    -0.73289230090736 * AcceptedCmp50  +    -0.18955862978745 * 
        Complain0 ;
   H1x1_4  = H1x1_4  +     0.60930619563149 * AcceptedCmp10
          +     0.56372104821368 * AcceptedCmp20  +     1.23124531565034 * 
        AcceptedCmp30  +     1.16511385622377 * AcceptedCmp40
          +     0.83299036807857 * AcceptedCmp50  +    -0.87889366207671 * 
        Complain0 ;
   H1x1_5  = H1x1_5  +    -1.02627214772402 * AcceptedCmp10
          +    -0.35326081554996 * AcceptedCmp20  +    -0.45229632523083 * 
        AcceptedCmp30  +    -0.88576020203346 * AcceptedCmp40
          +    -0.25524770878943 * AcceptedCmp50  +    -0.58775156249673 * 
        Complain0 ;
   H1x1_1  = H1x1_1  +    -0.20048115002767 * Education2n_Cycle
          +     0.10477823552379 * EducationBasic  +    -0.09122776507376 * 
        EducationGraduation  +    -0.01483389086199 * EducationMaster
          +    -0.14951932081311 * Marital_StatusDivorced
          +     0.08343648358981 * Marital_StatusMarried
          +    -0.52143432598374 * Marital_StatusSingle
          +    -0.17799942229122 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.06492224317117 * Education2n_Cycle
          +     0.50630082280639 * EducationBasic  +    -0.32521089553297 * 
        EducationGraduation  +    -0.38968023972702 * EducationMaster
          +    -0.34495973695408 * Marital_StatusDivorced
          +    -0.30910829853532 * Marital_StatusMarried
          +     0.14431404541055 * Marital_StatusSingle
          +    -0.62673029935295 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.41266521248037 * Education2n_Cycle
          +    -0.11192325989817 * EducationBasic  +    -0.96742524784448 * 
        EducationGraduation  +     0.05582780345024 * EducationMaster
          +     0.81191732290197 * Marital_StatusDivorced
          +    -2.53108753227171 * Marital_StatusMarried
          +     2.21769123178832 * Marital_StatusSingle
          +    -0.90613443546426 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.08882031994616 * Education2n_Cycle
          +     0.59640481500702 * EducationBasic  +    -0.75285942189639 * 
        EducationGraduation  +     0.52527957409681 * EducationMaster
          +    -1.26246836163545 * Marital_StatusDivorced
          +     0.73147045162506 * Marital_StatusMarried
          +     0.04252836823306 * Marital_StatusSingle
          +     1.44915119635375 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.24370046099656 * Education2n_Cycle
          +     0.03233873053213 * EducationBasic  +      0.1375198926931 * 
        EducationGraduation  +      0.0979905405754 * EducationMaster
          +    -0.25571808514992 * Marital_StatusDivorced
          +     0.20684027342845 * Marital_StatusMarried
          +    -0.36983627747986 * Marital_StatusSingle
          +    -0.08239173696723 * Marital_StatusTogether ;
   H1x1_1  =    -0.01788649837565 + H1x1_1 ;
   H1x1_2  =     1.77562113267961 + H1x1_2 ;
   H1x1_3  =    -1.36483909507433 + H1x1_3 ;
   H1x1_4  =    -0.17103473926556 + H1x1_4 ;
   H1x1_5  =     0.17065963901812 + H1x1_5 ;
   H1x1_6  = 0; 
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 );
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
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
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
   P_DepVar1  =    -12.4855028874976 * H1x1_1  +     8.50519000347347 * H1x1_2
          +     3.84994997572101 * H1x1_3  +    -12.5610415895663 * H1x1_4
          +     17.4993211655408 * H1x1_5  +     0.14986282100716 * H1x1_6 ;
   P_DepVar1  =     3.23272740278636 + P_DepVar1 ;
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
