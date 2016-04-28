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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

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
   H1x1_1  =     0.95463807935638 * S_Income  +     -0.0812123000279 *
        S_Kidhome  +    -1.17242250965796 * S_MntFishProducts
          +    -0.39894096707412 * S_MntFruits  +     0.48282664436672 *
        S_MntGoldProds  +       7.765847453582 * S_MntMeatProducts
          +    -0.44570165516063 * S_MntSweetProducts
          +    -1.40872100231855 * S_MntWines  +     1.40783708957732 *
        S_NumCatalogPurchases  +     1.49155573260533 * S_NumDealsPurchases
          +    -1.76291210288234 * S_NumStorePurchases
          +    -2.02392782824649 * S_NumWebPurchases
          +     1.28490910676992 * S_NumWebVisitsMonth
          +    -1.30767557862851 * S_Recency  +    -0.59235237740193 *
        S_Teenhome ;
   H1x1_2  =    -0.44691945203456 * S_Income  +     0.39379891740392 *
        S_Kidhome  +     0.02372129308662 * S_MntFishProducts
          +     0.20627554813879 * S_MntFruits  +     0.34760356004051 *
        S_MntGoldProds  +    -0.95672595976635 * S_MntMeatProducts
          +     0.29239311560831 * S_MntSweetProducts
          +     1.16929881835698 * S_MntWines  +    -1.00380099933966 *
        S_NumCatalogPurchases  +     0.13934722329916 * S_NumDealsPurchases
          +     0.94246962588327 * S_NumStorePurchases
          +      0.9680353780544 * S_NumWebPurchases
          +    -2.21882487627334 * S_NumWebVisitsMonth
          +     2.11904606383155 * S_Recency  +      0.6539185986418 *
        S_Teenhome ;
   H1x1_1  = H1x1_1  +    -3.59113827146831 * AcceptedCmp10
          +    -0.49569953193794 * AcceptedCmp20  +    -0.52167719336095 *
        AcceptedCmp30  +    -0.86715095433046 * AcceptedCmp40
          +    -5.62926111624877 * AcceptedCmp50  +     0.11096869316425 *
        Complain0 ;
   H1x1_2  = H1x1_2  +     0.46033758530017 * AcceptedCmp10
          +     0.35006796696269 * AcceptedCmp20  +     0.97811071409034 *
        AcceptedCmp30  +     0.99898386731466 * AcceptedCmp40
          +     1.09004749757455 * AcceptedCmp50  +    -0.37828411200383 *
        Complain0 ;
   H1x1_1  = H1x1_1  +    -0.19002184370931 * Education2n_Cycle
          +      0.4572325462076 * EducationBasic  +     0.18712226653295 *
        EducationGraduation  +     0.44122744485667 * EducationMaster
          +    -0.37907342816265 * Marital_StatusDivorced
          +     0.12610640291685 * Marital_StatusMarried
          +     0.51984913420219 * Marital_StatusSingle
          +     0.07401117310472 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.33166298059049 * Education2n_Cycle
          +     1.29947160945083 * EducationBasic  +    -0.61327168479974 *
        EducationGraduation  +    -0.26642525612671 * EducationMaster
          +    -1.03351623479699 * Marital_StatusDivorced
          +     1.44541386522162 * Marital_StatusMarried
          +    -1.03636573521294 * Marital_StatusSingle
          +     1.72091885709893 * Marital_StatusTogether ;
   H1x1_1  =     10.1449432133402 + H1x1_1 ;
   H1x1_2  =    -2.11517502439063 + H1x1_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     -0.8682144724836 * S_Income  +      2.3024809346762 *
        S_Kidhome  +     0.64624727466292 * S_MntFishProducts
          +    -0.09660410291886 * S_MntFruits  +    -1.79562837605117 *
        S_MntGoldProds  +      0.1276827318716 * S_MntMeatProducts
          +    -0.56491281055157 * S_MntSweetProducts
          +     0.93663442469929 * S_MntWines  +    -0.00899150883311 *
        S_NumCatalogPurchases  +    -1.22662917925595 * S_NumDealsPurchases
          +    -0.90340706582786 * S_NumStorePurchases
          +    -1.91501626179453 * S_NumWebPurchases
          +     0.10121028558369 * S_NumWebVisitsMonth
          +     1.60735726265156 * S_Recency  +     0.23538323190125 *
        S_Teenhome ;
   H1x2_2  =    -1.09261687432274 * S_Income  +     1.20111535021385 *
        S_Kidhome  +    -1.69538442721283 * S_MntFishProducts
          +    -0.70987820940317 * S_MntFruits  +    -1.60645342742617 *
        S_MntGoldProds  +    -0.30176111780721 * S_MntMeatProducts
          +    -0.23001625322332 * S_MntSweetProducts
          +    -0.14467043598448 * S_MntWines  +     0.41886993157522 *
        S_NumCatalogPurchases  +     1.96896752447653 * S_NumDealsPurchases
          +    -2.13716920911877 * S_NumStorePurchases
          +    -0.33508808117738 * S_NumWebPurchases
          +     -2.0809737926136 * S_NumWebVisitsMonth
          +     1.03175786727839 * S_Recency  +      0.7367575698643 *
        S_Teenhome ;
   H1x2_1  = H1x2_1  +     1.58943051578323 * AcceptedCmp10
          +     0.09118005069971 * AcceptedCmp20  +     1.19759908387569 *
        AcceptedCmp30  +     0.89598378494479 * AcceptedCmp40
          +     0.46816867379718 * AcceptedCmp50  +     1.86944333764097 *
        Complain0 ;
   H1x2_2  = H1x2_2  +    -0.08862601564048 * AcceptedCmp10
          +    -3.30636530499001 * AcceptedCmp20  +     0.15596560905391 *
        AcceptedCmp30  +     0.09538395772421 * AcceptedCmp40
          +     0.55380047577072 * AcceptedCmp50  +    -1.45096025939708 *
        Complain0 ;
   H1x2_1  = H1x2_1  +     -0.8656532372301 * Education2n_Cycle
          +     1.21189313523907 * EducationBasic  +     1.51417472534213 *
        EducationGraduation  +     0.48964474451872 * EducationMaster
          +     1.22462877499103 * Marital_StatusDivorced
          +     0.55976057621985 * Marital_StatusMarried
          +     -0.3198252517086 * Marital_StatusSingle
          +     0.23778601487144 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.58231562363597 * Education2n_Cycle
          +    -0.76544661145643 * EducationBasic  +     -0.6650405134602 *
        EducationGraduation  +    -1.59533016160829 * EducationMaster
          +     0.32730811728353 * Marital_StatusDivorced
          +     1.61519773132998 * Marital_StatusMarried
          +    -1.42728303824254 * Marital_StatusSingle
          +     1.39334432128351 * Marital_StatusTogether ;
   H1x2_1  =     1.49479859857755 + H1x2_1 ;
   H1x2_2  =     -0.6918737847278 + H1x2_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     1.67705445310922 * H1x1_1  +     -1.4133773927734 * H1x1_2 ;
   H2x1_2  =    -2.14069220527729 * H1x1_1  +     2.80569007785887 * H1x1_2 ;
   H2x1_1  = H2x1_1  +    -0.57216138417153 * H1x2_1
          +     1.42286315059473 * H1x2_2 ;
   H2x1_2  = H2x1_2  +     1.62250993087733 * H1x2_1
          +     0.34104856545583 * H1x2_2 ;
   H2x1_1  =    -3.48786428904302 + H2x1_1 ;
   H2x1_2  =    -0.43119827941199 + H2x1_2 ;
   H2x1_1  = SIN(H2x1_1 );
   H2x1_2  = SIN(H2x1_2 );
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -9.14009115080293 * H2x1_1  +    -5.28591504747655 * H2x1_2
         ;
   P_DepVar1  =    -3.08988807073218 + P_DepVar1 ;
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
