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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label H17 = 'Hidden: H1=7' ;

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
   H11  =    -0.59781928082243 * S_Income  +     0.49830142312288 * S_Kidhome
          +    -0.00045024466632 * S_MntFishProducts
          +    -0.22421712710333 * S_MntFruits  +    -0.19010144853469 *
        S_MntGoldProds  +    -0.53373773623953 * S_MntMeatProducts
          +     0.17506402203495 * S_MntSweetProducts
          +    -0.28551398649672 * S_MntWines  +       0.019870944777 *
        S_NumCatalogPurchases  +     0.03537776181533 * S_NumDealsPurchases
          +     0.05580468715403 * S_NumStorePurchases
          +    -0.29131611132704 * S_NumWebPurchases
          +    -0.40690084025802 * S_NumWebVisitsMonth
          +     0.48640195058901 * S_Recency  +     0.31820890239661 *
        S_Teenhome ;
   H12  =    -0.41871753512335 * S_Income  +      0.6025072461821 * S_Kidhome
          +    -0.03132724937716 * S_MntFishProducts
          +     0.19114182835046 * S_MntFruits  +     0.13483463809539 *
        S_MntGoldProds  +    -0.63593603749443 * S_MntMeatProducts
          +    -0.07569302401223 * S_MntSweetProducts
          +     0.67050112032753 * S_MntWines  +    -0.23159243932208 *
        S_NumCatalogPurchases  +    -0.07183698407409 * S_NumDealsPurchases
          +     0.54619681114623 * S_NumStorePurchases
          +     0.44325129671249 * S_NumWebPurchases
          +    -1.25054401670605 * S_NumWebVisitsMonth
          +      1.2376290916151 * S_Recency  +     0.43747371517287 *
        S_Teenhome ;
   H13  =      0.0713579189325 * S_Income  +    -0.05759612462349 * S_Kidhome
          +     0.07631777381832 * S_MntFishProducts
          +    -0.00387785552441 * S_MntFruits  +    -0.21868916314192 *
        S_MntGoldProds  +       0.072623883197 * S_MntMeatProducts
          +     0.12637946833766 * S_MntSweetProducts
          +    -0.37981663841124 * S_MntWines  +    -0.89958525403162 *
        S_NumCatalogPurchases  +    -0.17471885937598 * S_NumDealsPurchases
          +     0.15845618359126 * S_NumStorePurchases
          +    -0.33296932705082 * S_NumWebPurchases
          +      0.0260072296349 * S_NumWebVisitsMonth
          +     0.02544749712977 * S_Recency  +    -0.17381561661022 *
        S_Teenhome ;
   H14  =    -0.47498613710851 * S_Income  +     0.09339198401437 * S_Kidhome
          +    -0.13642352619174 * S_MntFishProducts
          +     0.27167245582117 * S_MntFruits  +    -0.00579747559996 *
        S_MntGoldProds  +     0.31591387319577 * S_MntMeatProducts
          +     0.14125815807238 * S_MntSweetProducts
          +     0.07862916790983 * S_MntWines  +    -0.58905358997534 *
        S_NumCatalogPurchases  +     -0.5574069633995 * S_NumDealsPurchases
          +     0.19718828261526 * S_NumStorePurchases
          +    -0.24156925391919 * S_NumWebPurchases
          +    -0.25711078938749 * S_NumWebVisitsMonth
          +     0.38883063223812 * S_Recency  +     -0.2396731334184 *
        S_Teenhome ;
   H15  =     0.24624924979609 * S_Income  +    -0.37052106312109 * S_Kidhome
          +     0.13579628643404 * S_MntFishProducts
          +    -0.05263868911164 * S_MntFruits  +    -0.01504675049991 *
        S_MntGoldProds  +     -0.4202277804998 * S_MntMeatProducts
          +    -0.01039299374426 * S_MntSweetProducts
          +     0.71197420459135 * S_MntWines  +    -0.35973505575029 *
        S_NumCatalogPurchases  +     -0.4415445481482 * S_NumDealsPurchases
          +     0.58897740652611 * S_NumStorePurchases
          +     0.24564485851062 * S_NumWebPurchases
          +    -0.13976320243555 * S_NumWebVisitsMonth
          +      0.1199367613063 * S_Recency  +    -0.15283161418313 *
        S_Teenhome ;
   H16  =     0.23493799758749 * S_Income  +     0.07038278079069 * S_Kidhome
          +    -0.45448768538367 * S_MntFishProducts
          +     0.02622380709004 * S_MntFruits  +     0.14726698184115 *
        S_MntGoldProds  +     0.65760183569767 * S_MntMeatProducts
          +    -0.16936256277023 * S_MntSweetProducts
          +    -0.40647066866305 * S_MntWines  +     0.99645493491726 *
        S_NumCatalogPurchases  +     0.65587239961358 * S_NumDealsPurchases
          +    -0.22309716855774 * S_NumStorePurchases
          +    -0.61204529910842 * S_NumWebPurchases
          +     0.43742228867615 * S_NumWebVisitsMonth
          +    -0.56099034256092 * S_Recency  +     -0.2445351671148 *
        S_Teenhome ;
   H17  =    -0.00107702057163 * S_Income  +     0.25116135719972 * S_Kidhome
          +    -0.04540308470858 * S_MntFishProducts
          +        0.21487241577 * S_MntFruits  +    -0.12914913547414 *
        S_MntGoldProds  +    -0.04149021191395 * S_MntMeatProducts
          +     0.02853521979141 * S_MntSweetProducts
          +     -0.2435805887418 * S_MntWines  +    -0.04509621661407 *
        S_NumCatalogPurchases  +    -0.26492036720429 * S_NumDealsPurchases
          +     -0.3299561248944 * S_NumStorePurchases
          +    -0.09806597448224 * S_NumWebPurchases
          +      0.0427056351245 * S_NumWebVisitsMonth
          +     0.03953235628202 * S_Recency  +    -0.11317308767713 *
        S_Teenhome ;
   H11  = H11  +     0.50033674561531 * AcceptedCmp10
          +    -0.02275693117286 * AcceptedCmp20  +     0.31338891533156 *
        AcceptedCmp30  +      0.3901248845706 * AcceptedCmp40
          +     0.44314358358111 * AcceptedCmp50  +    -0.20444060864498 *
        Complain0 ;
   H12  = H12  +     0.30103938822692 * AcceptedCmp10
          +     0.54298746723422 * AcceptedCmp20  +     0.50401040035525 *
        AcceptedCmp30  +     0.43447710825306 * AcceptedCmp40
          +     0.60794421030027 * AcceptedCmp50  +    -0.28114274461319 *
        Complain0 ;
   H13  = H13  +     -0.1890212967757 * AcceptedCmp10
          +    -0.11487406996391 * AcceptedCmp20  +    -0.22740618754863 *
        AcceptedCmp30  +      0.2354510231918 * AcceptedCmp40
          +    -0.14327434649067 * AcceptedCmp50  +    -0.17839080850556 *
        Complain0 ;
   H14  = H14  +    -0.28194187416219 * AcceptedCmp10
          +     0.11732089254624 * AcceptedCmp20  +     0.34964075536156 *
        AcceptedCmp30  +     0.05772396286169 * AcceptedCmp40
          +    -0.08671748651826 * AcceptedCmp50  +      0.0629540108407 *
        Complain0 ;
   H15  = H15  +    -0.01058257322803 * AcceptedCmp10
          +     0.26755355732587 * AcceptedCmp20  +     0.40856661734724 *
        AcceptedCmp30  +     0.02977117354989 * AcceptedCmp40
          +       0.073655049734 * AcceptedCmp50  +     0.25562048226555 *
        Complain0 ;
   H16  = H16  +    -0.65590117532084 * AcceptedCmp10
          +    -0.31314161223579 * AcceptedCmp20  +    -0.18863165264573 *
        AcceptedCmp30  +    -0.18832338914237 * AcceptedCmp40
          +    -0.53765749471786 * AcceptedCmp50  +     0.17409401877513 *
        Complain0 ;
   H17  = H17  +    -0.42253231673718 * AcceptedCmp10
          +    -0.40954345229557 * AcceptedCmp20  +    -0.30577523080786 *
        AcceptedCmp30  +    -0.22396670899437 * AcceptedCmp40
          +     0.05757251451004 * AcceptedCmp50  +     0.07813950542487 *
        Complain0 ;
   H11  = H11  +    -0.14483542022901 * Education2n_Cycle
          +     0.32176647745332 * EducationBasic  +     0.00900796305072 *
        EducationGraduation  +    -0.00243484910123 * EducationMaster
          +    -0.22074132229211 * Marital_StatusDivorced
          +     0.70282742634901 * Marital_StatusMarried
          +     -0.5926244797961 * Marital_StatusSingle
          +     0.21342221410999 * Marital_StatusTogether ;
   H12  = H12  +    -0.10242932200247 * Education2n_Cycle
          +     0.34937926721317 * EducationBasic  +    -0.20395479511872 *
        EducationGraduation  +     0.31210327899339 * EducationMaster
          +    -0.46376392175295 * Marital_StatusDivorced
          +       0.589453579718 * Marital_StatusMarried
          +    -0.45342174978481 * Marital_StatusSingle
          +     0.70517120763557 * Marital_StatusTogether ;
   H13  = H13  +     0.24858755570324 * Education2n_Cycle
          +     0.07360039359386 * EducationBasic  +    -0.42563056620078 *
        EducationGraduation  +    -0.25970840250323 * EducationMaster
          +     0.26981972015482 * Marital_StatusDivorced
          +    -0.01707364864139 * Marital_StatusMarried
          +     0.38646060840009 * Marital_StatusSingle
          +     0.19694047086013 * Marital_StatusTogether ;
   H14  = H14  +     0.22577522124265 * Education2n_Cycle
          +     0.04183136697557 * EducationBasic  +    -0.27725331198825 *
        EducationGraduation  +     0.15709188532123 * EducationMaster
          +    -0.01933675094701 * Marital_StatusDivorced
          +     0.52969577969434 * Marital_StatusMarried
          +      -0.348697714569 * Marital_StatusSingle
          +      0.5020342481888 * Marital_StatusTogether ;
   H15  = H15  +     0.04488332711225 * Education2n_Cycle
          +     0.01911097443907 * EducationBasic  +    -0.11699443624996 *
        EducationGraduation  +    -0.07291393566738 * EducationMaster
          +    -0.04665146013984 * Marital_StatusDivorced
          +      -0.586219175167 * Marital_StatusMarried
          +     0.55713543417712 * Marital_StatusSingle
          +    -0.42208959885332 * Marital_StatusTogether ;
   H16  = H16  +     0.09174117861154 * Education2n_Cycle
          +     -0.1378945860659 * EducationBasic  +     -0.0728635369665 *
        EducationGraduation  +     0.29860714824438 * EducationMaster
          +    -0.05632171154347 * Marital_StatusDivorced
          +     0.03215547861665 * Marital_StatusMarried
          +     0.16870781172538 * Marital_StatusSingle
          +    -0.04883314322676 * Marital_StatusTogether ;
   H17  = H17  +    -0.00343694558117 * Education2n_Cycle
          +     0.32636427598227 * EducationBasic  +     0.16259654486833 *
        EducationGraduation  +    -0.00424229454859 * EducationMaster
          +    -0.21765415159355 * Marital_StatusDivorced
          +     -0.0542857922075 * Marital_StatusMarried
          +     0.20679907454933 * Marital_StatusSingle
          +     0.14976519710725 * Marital_StatusTogether ;
   H11  =     0.92977078759503 + H11 ;
   H12  =    -0.97970409253156 + H12 ;
   H13  =     -0.5001144792196 + H13 ;
   H14  =    -0.90715840862541 + H14 ;
   H15  =     0.87046153389036 + H15 ;
   H16  =     0.49066122767086 + H16 ;
   H17  =    -1.05949763460293 + H17 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
   H17  = TANH(H17 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
   H17  = .;
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
   P_DepVar1  =    -2.32998401250848 * H11  +     -3.2074078511991 * H12
          +    -0.69549988605443 * H13  +    -1.74950789108762 * H14
          +    -1.74013772071344 * H15  +     2.65306089869015 * H16
          +     0.03700459000906 * H17 ;
   P_DepVar1  =    -1.51229898726716 + P_DepVar1 ;
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
H17
;
drop S_:;
