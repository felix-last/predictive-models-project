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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

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
   H1x1_1  =     -0.6712927499227 * S_Income  +     0.52481056075303 * 
        S_Kidhome  +     -2.3662268017216 * S_MntFishProducts
          +    -1.70194161526543 * S_MntFruits  +    -0.12195276696714 * 
        S_MntGoldProds  +     5.02051235731232 * S_MntMeatProducts
          +    -2.37073629008864 * S_MntSweetProducts
          +    -7.49792253647533 * S_MntWines  +     1.93063890722455 * 
        S_NumCatalogPurchases  +     1.44821336448113 * S_NumDealsPurchases
          +    -1.29021742502316 * S_NumStorePurchases
          +    -0.00949168969466 * S_NumWebPurchases
          +    -0.32248137192321 * S_NumWebVisitsMonth
          +    -0.55879173873733 * S_Recency  +    -0.22439654268554 * 
        S_Teenhome ;
   H1x1_2  =    -1.63837717417638 * S_Income  +     1.01712005677207 * 
        S_Kidhome  +    -0.11452425716086 * S_MntFishProducts
          +    -0.08273769039219 * S_MntFruits  +    -0.47045422182093 * 
        S_MntGoldProds  +    -0.64593629987888 * S_MntMeatProducts
          +     0.41126087093412 * S_MntSweetProducts
          +    -0.00653581981542 * S_MntWines  +    -1.62534004647483 * 
        S_NumCatalogPurchases  +    -0.74740978232431 * S_NumDealsPurchases
          +      0.2319226227964 * S_NumStorePurchases
          +     0.31190969795517 * S_NumWebPurchases
          +      -1.987305550542 * S_NumWebVisitsMonth
          +     2.46312593342153 * S_Recency  +     1.89469486725188 * 
        S_Teenhome ;
   H1x1_3  =    -0.78523773312865 * S_Income  +    -1.40266608040579 * 
        S_Kidhome  +     0.01206304735425 * S_MntFishProducts
          +    -0.50371384095637 * S_MntFruits  +    -0.93176870066879 * 
        S_MntGoldProds  +    -0.53990224542491 * S_MntMeatProducts
          +    -0.73991431726966 * S_MntSweetProducts
          +    -0.21227505043037 * S_MntWines  +     0.42667885020643 * 
        S_NumCatalogPurchases  +    -0.34821401096287 * S_NumDealsPurchases
          +    -2.50826402419251 * S_NumStorePurchases
          +    -0.30764477738015 * S_NumWebPurchases
          +     1.21240794582671 * S_NumWebVisitsMonth
          +    -2.22374004865256 * S_Recency  +    -0.07389156638234 * 
        S_Teenhome ;
   H1x1_4  =     1.52339017953874 * S_Income  +     -0.0800472387091 * 
        S_Kidhome  +    -0.81466158613596 * S_MntFishProducts
          +    -1.56740792821078 * S_MntFruits  +    -0.44251282056636 * 
        S_MntGoldProds  +     4.21345569180051 * S_MntMeatProducts
          +     1.07674028011002 * S_MntSweetProducts
          +    -4.16668334099034 * S_MntWines  +     2.33183855256347 * 
        S_NumCatalogPurchases  +     1.55678471765653 * S_NumDealsPurchases
          +    -0.47776935727231 * S_NumStorePurchases
          +     -0.5890810666834 * S_NumWebPurchases
          +      1.3845716796855 * S_NumWebVisitsMonth
          +    -0.37826249433224 * S_Recency  +    -0.32813220931783 * 
        S_Teenhome ;
   H1x1_1  = H1x1_1  +     -1.8652801761626 * AcceptedCmp10
          +    -2.15838385124109 * AcceptedCmp20  +    -0.32281263106473 * 
        AcceptedCmp30  +    -0.52751972284584 * AcceptedCmp40
          +    -0.16576520159698 * AcceptedCmp50  +      0.0798586391257 * 
        Complain0 ;
   H1x1_2  = H1x1_2  +     1.18847829749899 * AcceptedCmp10
          +     2.28872916962314 * AcceptedCmp20  +      0.7666362501062 * 
        AcceptedCmp30  +     0.63272382969915 * AcceptedCmp40
          +     1.03410667663543 * AcceptedCmp50  +    -0.44709535985633 * 
        Complain0 ;
   H1x1_3  = H1x1_3  +    -0.30260316693677 * AcceptedCmp10
          +     1.37858034146365 * AcceptedCmp20  +    -1.95638038137808 * 
        AcceptedCmp30  +     -2.1581101738114 * AcceptedCmp40
          +    -1.72040670376675 * AcceptedCmp50  +     2.82913230380101 * 
        Complain0 ;
   H1x1_4  = H1x1_4  +     0.37463576870294 * AcceptedCmp10
          +     -1.1935629973001 * AcceptedCmp20  +     -0.0357513820165 * 
        AcceptedCmp30  +    -0.34228453024248 * AcceptedCmp40
          +     0.08692364147086 * AcceptedCmp50  +     0.01804293030366 * 
        Complain0 ;
   H1x1_1  = H1x1_1  +     0.10559298643668 * Education2n_Cycle
          +     -0.5051689695544 * EducationBasic  +     0.07434632730326 * 
        EducationGraduation  +     0.68592368666749 * EducationMaster
          +     0.38999748028122 * Marital_StatusDivorced
          +     0.44180844463279 * Marital_StatusMarried
          +     0.63824884669155 * Marital_StatusSingle
          +    -0.26198648898013 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.38077564253123 * Education2n_Cycle
          +    -1.71516234680597 * EducationBasic  +      0.9305914926408 * 
        EducationGraduation  +    -0.48500520310542 * EducationMaster
          +    -0.95537871859519 * Marital_StatusDivorced
          +     2.55061153921286 * Marital_StatusMarried
          +    -1.78007154396711 * Marital_StatusSingle
          +     1.47779717106964 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.26877104077313 * Education2n_Cycle
          +    -1.51047207681049 * EducationBasic  +     1.00818590807055 * 
        EducationGraduation  +    -2.08836171183474 * EducationMaster
          +     1.29930912124343 * Marital_StatusDivorced
          +    -1.63037830924789 * Marital_StatusMarried
          +     0.19040732776086 * Marital_StatusSingle
          +     -3.9038060950259 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.59574708300703 * Education2n_Cycle
          +    -0.19936070861543 * EducationBasic  +     0.82683145042233 * 
        EducationGraduation  +    -0.24015931152788 * EducationMaster
          +     -0.3129003025095 * Marital_StatusDivorced
          +     0.00843550425239 * Marital_StatusMarried
          +    -0.20416436114776 * Marital_StatusSingle
          +     1.08624823622502 * Marital_StatusTogether ;
   H1x1_1  =    -2.66745806568988 + H1x1_1 ;
   H1x1_2  =     1.39870734752375 + H1x1_2 ;
   H1x1_3  =     3.90802178606462 + H1x1_3 ;
   H1x1_4  =    -1.61490323089776 + H1x1_4 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.40035517192793 * S_Income  +     1.50961149935512 * 
        S_Kidhome  +    -0.71749794576247 * S_MntFishProducts
          +    -0.80539813415293 * S_MntFruits  +    -0.11190500470397 * 
        S_MntGoldProds  +    -1.00287277559415 * S_MntMeatProducts
          +    -0.90866858123806 * S_MntSweetProducts
          +     0.48761861591898 * S_MntWines  +    -0.00278053699018 * 
        S_NumCatalogPurchases  +     1.76527380505645 * S_NumDealsPurchases
          +     1.45805686107789 * S_NumStorePurchases
          +     1.48794767642409 * S_NumWebPurchases
          +    -1.24357395997191 * S_NumWebVisitsMonth
          +     2.73747730751211 * S_Recency  +    -0.74105180435611 * 
        S_Teenhome ;
   H1x2_2  =    -2.30368761501045 * S_Income  +     0.82837234680306 * 
        S_Kidhome  +    -0.57801225504203 * S_MntFishProducts
          +    -0.53882153761332 * S_MntFruits  +    -0.06305202172404 * 
        S_MntGoldProds  +    -0.83741138145577 * S_MntMeatProducts
          +     1.05010358762976 * S_MntSweetProducts
          +     -0.8308916879344 * S_MntWines  +     0.00135039846616 * 
        S_NumCatalogPurchases  +     -0.1426130520252 * S_NumDealsPurchases
          +    -2.04318529474165 * S_NumStorePurchases
          +     1.64478964728594 * S_NumWebPurchases
          +    -0.74790322980646 * S_NumWebVisitsMonth
          +     0.44846346006135 * S_Recency  +    -1.17558204887145 * 
        S_Teenhome ;
   H1x2_3  =     1.07803134847301 * S_Income  +     1.10001550023539 * 
        S_Kidhome  +      2.1312863754193 * S_MntFishProducts
          +    -0.41841353908141 * S_MntFruits  +    -0.28009599678539 * 
        S_MntGoldProds  +    -0.57516542648625 * S_MntMeatProducts
          +     0.39974532423377 * S_MntSweetProducts
          +    -1.03786923973351 * S_MntWines  +    -0.21873654141419 * 
        S_NumCatalogPurchases  +    -0.12545360575656 * S_NumDealsPurchases
          +     0.70805557348415 * S_NumStorePurchases
          +     2.40362900277228 * S_NumWebPurchases
          +    -0.84521247676043 * S_NumWebVisitsMonth
          +     4.38953216910793 * S_Recency  +     1.39159599477449 * 
        S_Teenhome ;
   H1x2_4  =      1.5904518722284 * S_Income  +     0.14957259343911 * 
        S_Kidhome  +     1.71856101884761 * S_MntFishProducts
          +     0.97544338421034 * S_MntFruits  +     1.16387775609385 * 
        S_MntGoldProds  +    -0.43463910907731 * S_MntMeatProducts
          +     1.67907268159197 * S_MntSweetProducts
          +    -0.67372438764914 * S_MntWines  +     0.34705529867224 * 
        S_NumCatalogPurchases  +     1.55570260456887 * S_NumDealsPurchases
          +      0.0818178054474 * S_NumStorePurchases
          +     0.21533198164279 * S_NumWebPurchases
          +     2.13590425604302 * S_NumWebVisitsMonth
          +    -2.07481510631659 * S_Recency  +    -0.82288425478762 * 
        S_Teenhome ;
   H1x2_1  = H1x2_1  +    -1.62231361085618 * AcceptedCmp10
          +     0.93841494775887 * AcceptedCmp20  +      0.1734706863831 * 
        AcceptedCmp30  +     0.16475784850175 * AcceptedCmp40
          +     0.65486951368163 * AcceptedCmp50  +      1.6226382489877 * 
        Complain0 ;
   H1x2_2  = H1x2_2  +     0.93875540013493 * AcceptedCmp10
          +     2.69754413059384 * AcceptedCmp20  +    -0.30913025234768 * 
        AcceptedCmp30  +    -0.00924007964301 * AcceptedCmp40
          +     -0.7359545134435 * AcceptedCmp50  +    -0.44748157506074 * 
        Complain0 ;
   H1x2_3  = H1x2_3  +      0.4023712256607 * AcceptedCmp10
          +    -0.46100225887196 * AcceptedCmp20  +    -0.11545325868036 * 
        AcceptedCmp30  +     1.81326302523772 * AcceptedCmp40
          +     1.57642234573579 * AcceptedCmp50  +    -0.52645724664984 * 
        Complain0 ;
   H1x2_4  = H1x2_4  +    -1.08307715440234 * AcceptedCmp10
          +     0.10309372709877 * AcceptedCmp20  +    -1.18814330876811 * 
        AcceptedCmp30  +    -1.69102202926075 * AcceptedCmp40
          +     0.10465943889984 * AcceptedCmp50  +    -0.96523771648083 * 
        Complain0 ;
   H1x2_1  = H1x2_1  +     0.57966380694999 * Education2n_Cycle
          +     1.09807543038463 * EducationBasic  +     0.56896005764417 * 
        EducationGraduation  +     0.78238700450794 * EducationMaster
          +     0.09735596304222 * Marital_StatusDivorced
          +    -0.41892050812825 * Marital_StatusMarried
          +    -1.42753782654911 * Marital_StatusSingle
          +     2.12640980869845 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     1.23142964464278 * Education2n_Cycle
          +    -0.57685007681361 * EducationBasic  +     0.95565027871272 * 
        EducationGraduation  +     1.03407121736627 * EducationMaster
          +    -0.32415267410507 * Marital_StatusDivorced
          +     0.49045578856782 * Marital_StatusMarried
          +    -1.95612005933176 * Marital_StatusSingle
          +    -0.09380239900044 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +    -0.59991828858437 * Education2n_Cycle
          +     0.16738017494874 * EducationBasic  +     1.11954020630495 * 
        EducationGraduation  +    -1.26111004544108 * EducationMaster
          +    -1.25715350788627 * Marital_StatusDivorced
          +     0.74269511935299 * Marital_StatusMarried
          +    -0.27394822792771 * Marital_StatusSingle
          +     0.32120400150108 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.73858886461182 * Education2n_Cycle
          +     1.18482398810163 * EducationBasic  +     0.31912715416105 * 
        EducationGraduation  +     -0.7403940659871 * EducationMaster
          +    -1.42754006114782 * Marital_StatusDivorced
          +    -0.13979120103654 * Marital_StatusMarried
          +    -1.66244370644258 * Marital_StatusSingle
          +     1.29295770867497 * Marital_StatusTogether ;
   H1x2_1  =     0.02486753071365 + H1x2_1 ;
   H1x2_2  =     1.30157602008517 + H1x2_2 ;
   H1x2_3  =    -0.71765289173772 + H1x2_3 ;
   H1x2_4  =    -0.28206267191961 + H1x2_4 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -1.34021567967914 * H1x1_1  +    -0.82210150819056 * H1x1_2
          +      0.2051584088577 * H1x1_3  +    -0.14877251454609 * H1x1_4 ;
   H2x1_2  =     5.90283136076368 * H1x1_1  +    -7.93891997601848 * H1x1_2
          +     6.88352608350263 * H1x1_3  +     4.96968417177752 * H1x1_4 ;
   H2x1_3  =    -0.35820258372371 * H1x1_1  +      3.0004195561827 * H1x1_2
          +    -2.45737828305901 * H1x1_3  +     -3.3701635035096 * H1x1_4 ;
   H2x1_4  =    -2.21298094667436 * H1x1_1  +     0.26414252140039 * H1x1_2
          +     1.09094365218549 * H1x1_3  +     1.52196888791164 * H1x1_4 ;
   H2x1_1  = H2x1_1  +    -0.84246838752596 * H1x2_1
          +     0.53874594317309 * H1x2_2  +     0.47956597308168 * H1x2_3
          +    -0.93255463077914 * H1x2_4 ;
   H2x1_2  = H2x1_2  +     -1.9223116287684 * H1x2_1
          +    -2.37377206970433 * H1x2_2  +    -0.73887953722708 * H1x2_3
          +     2.71044044080254 * H1x2_4 ;
   H2x1_3  = H2x1_3  +     0.53173546674544 * H1x2_1
          +     1.48831638926533 * H1x2_2  +     2.89231339277069 * H1x2_3
          +    -2.75774116509863 * H1x2_4 ;
   H2x1_4  = H2x1_4  +     1.42086435786687 * H1x2_1
          +     0.41116169758796 * H1x2_2  +    -1.89087404607062 * H1x2_3
          +     1.62153254823704 * H1x2_4 ;
   H2x1_1  =    -1.75788455741829 + H2x1_1 ;
   H2x1_2  =    -1.23949015246826 + H2x1_2 ;
   H2x1_3  =     0.22552341308337 + H2x1_3 ;
   H2x1_4  =    -0.29261642916715 + H2x1_4 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
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
   P_DepVar1  =    -0.01128614443737 * H2x1_1  +     20.5485882709782 * H2x1_2
          +    -12.1833710389136 * H2x1_3  +     -2.9534639226061 * H2x1_4 ;
   P_DepVar1  =     1.18328906065521 + P_DepVar1 ;
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
