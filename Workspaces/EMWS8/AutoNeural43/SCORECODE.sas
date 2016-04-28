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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

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
   H1x1_1  =       0.346744797535 * S_Income  +     1.31363556955711 * 
        S_Kidhome  +    -0.79208756741143 * S_MntFishProducts
          +     0.68527811841342 * S_MntFruits  +     0.24664684629472 * 
        S_MntGoldProds  +     0.85215044326148 * S_MntMeatProducts
          +    -0.05146617403327 * S_MntSweetProducts
          +     0.70199486255944 * S_MntWines  +    -1.00450471229357 * 
        S_NumCatalogPurchases  +     0.20437829426231 * S_NumDealsPurchases
          +     0.62863110938217 * S_NumStorePurchases
          +    -0.38696149667878 * S_NumWebPurchases
          +    -0.64969312889347 * S_NumWebVisitsMonth
          +      1.3506790879911 * S_Recency  +    -0.14927581282921 * 
        S_Teenhome ;
   H1x1_2  =    -0.31812547665326 * S_Income  +    -0.44650104709618 * 
        S_Kidhome  +     0.57229440722364 * S_MntFishProducts
          +     0.43482820937164 * S_MntFruits  +     -0.2031067703009 * 
        S_MntGoldProds  +    -4.22959784007598 * S_MntMeatProducts
          +     -0.2837867994991 * S_MntSweetProducts
          +     0.53009243544309 * S_MntWines  +    -0.69827694726429 * 
        S_NumCatalogPurchases  +    -0.21825886946472 * S_NumDealsPurchases
          +    -0.54369381190341 * S_NumStorePurchases
          +     0.67406669261545 * S_NumWebPurchases
          +     0.33996696883368 * S_NumWebVisitsMonth
          +    -0.25785000158296 * S_Recency  +     0.29059204886836 * 
        S_Teenhome ;
   H1x1_3  =    -0.95497484937763 * S_Income  +     0.69843675975299 * 
        S_Kidhome  +    -0.16297234253648 * S_MntFishProducts
          +    -0.79520871513787 * S_MntFruits  +    -0.29823724505093 * 
        S_MntGoldProds  +    -0.15152860134108 * S_MntMeatProducts
          +    -0.03465749764322 * S_MntSweetProducts
          +     0.53127184040091 * S_MntWines  +     0.59135593751067 * 
        S_NumCatalogPurchases  +     0.32132594137215 * S_NumDealsPurchases
          +      0.4404265130137 * S_NumStorePurchases
          +     0.34042541893429 * S_NumWebPurchases
          +    -1.21549916758761 * S_NumWebVisitsMonth
          +       1.154070329153 * S_Recency  +     0.48728201337678 * 
        S_Teenhome ;
   H1x1_4  =    -1.18770065121934 * S_Income  +      0.3073609740511 * 
        S_Kidhome  +     0.10352863720245 * S_MntFishProducts
          +      0.2833318237712 * S_MntFruits  +     0.03154921247745 * 
        S_MntGoldProds  +    -0.21591651561727 * S_MntMeatProducts
          +    -0.00464679492565 * S_MntSweetProducts
          +     0.91421960675715 * S_MntWines  +    -1.26836416129835 * 
        S_NumCatalogPurchases  +    -0.70058095897782 * S_NumDealsPurchases
          +     1.15839307615364 * S_NumStorePurchases
          +     0.62831972126136 * S_NumWebPurchases
          +    -1.61962107597882 * S_NumWebVisitsMonth
          +     1.12858496707441 * S_Recency  +     0.54281989992336 * 
        S_Teenhome ;
   H1x1_5  =     0.05044786678162 * S_Income  +    -0.28010558310581 * 
        S_Kidhome  +    -0.27691656261205 * S_MntFishProducts
          +    -0.39089831210828 * S_MntFruits  +    -0.08178998049926 * 
        S_MntGoldProds  +     1.72104172406534 * S_MntMeatProducts
          +    -0.31125451894603 * S_MntSweetProducts
          +    -2.29170137059747 * S_MntWines  +     0.63730065528433 * 
        S_NumCatalogPurchases  +     0.88249434950066 * S_NumDealsPurchases
          +    -1.44151914398807 * S_NumStorePurchases
          +     -0.5455286038748 * S_NumWebPurchases
          +     0.92543573664002 * S_NumWebVisitsMonth
          +    -0.94895006705107 * S_Recency  +     0.12419848895477 * 
        S_Teenhome ;
   H1x1_6  =      1.0379959912095 * S_Income  +    -0.86527104445929 * 
        S_Kidhome  +    -0.34569179888564 * S_MntFishProducts
          +    -0.00109367242014 * S_MntFruits  +      0.1491727982835 * 
        S_MntGoldProds  +     1.59142102470118 * S_MntMeatProducts
          +    -0.44310159680843 * S_MntSweetProducts
          +    -0.12978244847526 * S_MntWines  +     1.25298974430925 * 
        S_NumCatalogPurchases  +      0.8343138844265 * S_NumDealsPurchases
          +    -0.06648303760561 * S_NumStorePurchases
          +    -0.65122349287903 * S_NumWebPurchases
          +     1.83555427093429 * S_NumWebVisitsMonth
          +    -2.44265045013513 * S_Recency  +    -0.96168611481099 * 
        S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.04697238730506 * AcceptedCmp10
          +     0.17124574303968 * AcceptedCmp20  +     0.24668651391243 * 
        AcceptedCmp30  +    -0.17661157809394 * AcceptedCmp40
          +    -0.07986471073966 * AcceptedCmp50  +     0.39456441776971 * 
        Complain0 ;
   H1x1_2  = H1x1_2  +     0.82032499204552 * AcceptedCmp10
          +     0.34058590721793 * AcceptedCmp20  +    -0.05139100187265 * 
        AcceptedCmp30  +     0.03047923325443 * AcceptedCmp40
          +     0.00472330466661 * AcceptedCmp50  +     0.17230692332464 * 
        Complain0 ;
   H1x1_3  = H1x1_3  +     0.28530146043163 * AcceptedCmp10
          +     0.42287366771085 * AcceptedCmp20  +     0.47373508298281 * 
        AcceptedCmp30  +     0.55866504005454 * AcceptedCmp40
          +     0.82267729772563 * AcceptedCmp50  +     0.19702533550506 * 
        Complain0 ;
   H1x1_4  = H1x1_4  +     0.52781659896891 * AcceptedCmp10
          +     0.42920365778433 * AcceptedCmp20  +     1.17620912558163 * 
        AcceptedCmp30  +     0.60548467992927 * AcceptedCmp40
          +     0.94474163621099 * AcceptedCmp50  +    -0.78069672963693 * 
        Complain0 ;
   H1x1_5  = H1x1_5  +    -0.57412668124255 * AcceptedCmp10
          +    -0.47940329920743 * AcceptedCmp20  +    -0.32110813917426 * 
        AcceptedCmp30  +    -0.61486082641451 * AcceptedCmp40
          +    -0.69974277642424 * AcceptedCmp50  +     0.11676881614828 * 
        Complain0 ;
   H1x1_6  = H1x1_6  +    -0.84071985342593 * AcceptedCmp10
          +    -0.93448636634819 * AcceptedCmp20  +    -1.08375331325128 * 
        AcceptedCmp30  +    -1.17713256753961 * AcceptedCmp40
          +    -1.19701619371219 * AcceptedCmp50  +     0.43593081503911 * 
        Complain0 ;
   H1x1_1  = H1x1_1  +     0.16696814950674 * Education2n_Cycle
          +    -0.44548398836024 * EducationBasic  +    -0.13816962229813 * 
        EducationGraduation  +     0.15082660839612 * EducationMaster
          +    -0.86711066227375 * Marital_StatusDivorced
          +     0.40837974583757 * Marital_StatusMarried
          +    -0.36026722115525 * Marital_StatusSingle
          +     0.79004200065113 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.16842509296504 * Education2n_Cycle
          +    -0.37448080566378 * EducationBasic  +     0.48861368388392 * 
        EducationGraduation  +    -0.52159546239433 * EducationMaster
          +     0.32215787204894 * Marital_StatusDivorced
          +    -0.56445035445224 * Marital_StatusMarried
          +    -0.19089062631475 * Marital_StatusSingle
          +    -0.05879603306331 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.60123226656743 * Education2n_Cycle
          +     0.60422871475083 * EducationBasic  +     1.03135359524948 * 
        EducationGraduation  +     0.08569631133746 * EducationMaster
          +      0.0333599428728 * Marital_StatusDivorced
          +      0.2536992094527 * Marital_StatusMarried
          +     0.28814962122223 * Marital_StatusSingle
          +    -0.07291720333163 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.31817779304591 * Education2n_Cycle
          +     0.41715850822951 * EducationBasic  +    -1.42142934931707 * 
        EducationGraduation  +     0.67447448653035 * EducationMaster
          +    -0.47992692297474 * Marital_StatusDivorced
          +     1.37810632485566 * Marital_StatusMarried
          +    -1.37561982457408 * Marital_StatusSingle
          +     1.44711275454438 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.09777346458802 * Education2n_Cycle
          +    -0.45960393039978 * EducationBasic  +     0.51146196412307 * 
        EducationGraduation  +    -0.24819773072524 * EducationMaster
          +     0.19162417091995 * Marital_StatusDivorced
          +    -0.36068364824761 * Marital_StatusMarried
          +    -0.12710669526743 * Marital_StatusSingle
          +    -0.01019314244777 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.36097201590287 * Education2n_Cycle
          +     0.58682328743356 * EducationBasic  +    -0.70502301542305 * 
        EducationGraduation  +    -0.64274217783062 * EducationMaster
          +     0.23760271729717 * Marital_StatusDivorced
          +    -1.21454188572959 * Marital_StatusMarried
          +     1.24284947007232 * Marital_StatusSingle
          +    -1.39754167839201 * Marital_StatusTogether ;
   H1x1_1  =    -0.37160255114665 + H1x1_1 ;
   H1x1_2  =    -0.79024897923326 + H1x1_2 ;
   H1x1_3  =    -1.07478535022413 + H1x1_3 ;
   H1x1_4  =    -0.83827859036654 + H1x1_4 ;
   H1x1_5  =      1.0917082111499 + H1x1_5 ;
   H1x1_6  =     1.09202728340056 + H1x1_6 ;
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
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -9.47780447141489 * H1x1_1  +    -8.06096671462069 * H1x1_2
          +    -4.21167567173811 * H1x1_3  +     -37.599240879379 * H1x1_4
          +     25.0531533838083 * H1x1_5  +     29.1428275636369 * H1x1_6
          +     4.90157629063847 * H1x1_7 ;
   P_DepVar1  =    -1.97718258496285 + P_DepVar1 ;
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
