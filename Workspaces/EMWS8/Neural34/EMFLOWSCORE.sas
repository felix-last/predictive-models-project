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
   H11  =    -0.81572379016921 * S_Income  +    -0.07670946585348 * S_Kidhome
          +     0.24367603598167 * S_MntFishProducts
          +     0.19692980127348 * S_MntFruits  +    -0.03926738185333 *
        S_MntGoldProds  +    -0.20900804333353 * S_MntMeatProducts
          +     0.34054806441484 * S_MntSweetProducts
          +     0.65956211369383 * S_MntWines  +    -0.95375334578522 *
        S_NumCatalogPurchases  +    -0.73124740368567 * S_NumDealsPurchases
          +     0.98942946974575 * S_NumStorePurchases
          +     0.89701206630103 * S_NumWebPurchases
          +    -1.22878611472154 * S_NumWebVisitsMonth
          +     1.44981870978354 * S_Recency  +     0.47533125686411 *
        S_Teenhome ;
   H12  =    -0.18875145195495 * S_Income  +     0.42230998482453 * S_Kidhome
          +     0.16683404689723 * S_MntFishProducts
          +     0.32072658929401 * S_MntFruits  +    -0.12341748032201 *
        S_MntGoldProds  +    -1.56478754527255 * S_MntMeatProducts
          +     0.20389084548968 * S_MntSweetProducts
          +     0.95592931625509 * S_MntWines  +    -0.69996817353755 *
        S_NumCatalogPurchases  +    -0.92709806328697 * S_NumDealsPurchases
          +     1.27164659640366 * S_NumStorePurchases
          +     1.02122194207802 * S_NumWebPurchases
          +     -1.5111033436803 * S_NumWebVisitsMonth
          +     1.63712814901544 * S_Recency  +     0.14205116840572 *
        S_Teenhome ;
   H13  =     1.02798705354163 * S_Income  +    -0.94411708781921 * S_Kidhome
          +    -0.03345077166544 * S_MntFishProducts
          +     0.00038440809349 * S_MntFruits  +    -0.05068379715712 *
        S_MntGoldProds  +     1.00464705307582 * S_MntMeatProducts
          +    -0.11948662500951 * S_MntSweetProducts
          +    -0.52438819731252 * S_MntWines  +     0.98586904866769 *
        S_NumCatalogPurchases  +     0.09015295226839 * S_NumDealsPurchases
          +     0.22401914357376 * S_NumStorePurchases
          +     0.04219877865976 * S_NumWebPurchases
          +     1.21753334166036 * S_NumWebVisitsMonth
          +    -1.33712212110081 * S_Recency  +    -0.47582856683655 *
        S_Teenhome ;
   H14  =     0.91431429848834 * S_Income  +    -1.16289676557574 * S_Kidhome
          +     0.31175257038578 * S_MntFishProducts
          +     0.08080436076271 * S_MntFruits  +     0.15252288175851 *
        S_MntGoldProds  +     0.21603546207654 * S_MntMeatProducts
          +      0.0927253053382 * S_MntSweetProducts
          +     0.05865323888304 * S_MntWines  +    -0.23426953728277 *
        S_NumCatalogPurchases  +    -0.46451908614085 * S_NumDealsPurchases
          +    -0.12667606349662 * S_NumStorePurchases
          +     0.30148374518724 * S_NumWebPurchases
          +     0.48934229701658 * S_NumWebVisitsMonth
          +    -0.83754390793251 * S_Recency  +     -0.4576645462819 *
        S_Teenhome ;
   H15  =    -0.58161501095664 * S_Income  +     -1.0333658128614 * S_Kidhome
          +     0.42646725119177 * S_MntFishProducts
          +     -0.3264621401658 * S_MntFruits  +    -0.74616728524532 *
        S_MntGoldProds  +    -0.97572068716712 * S_MntMeatProducts
          +    -0.01493605582616 * S_MntSweetProducts
          +      0.0311636632685 * S_MntWines  +    -1.68599903767191 *
        S_NumCatalogPurchases  +    -1.25052648798307 * S_NumDealsPurchases
          +     0.54256744091258 * S_NumStorePurchases
          +     0.43065931458468 * S_NumWebPurchases
          +      0.5935561420466 * S_NumWebVisitsMonth
          +    -0.45183418369624 * S_Recency  +     0.19260512629844 *
        S_Teenhome ;
   H11  = H11  +     0.61503950219838 * AcceptedCmp10
          +     0.02945207091619 * AcceptedCmp20  +     0.99151950769472 *
        AcceptedCmp30  +     1.08987060401718 * AcceptedCmp40
          +     0.45427753773024 * AcceptedCmp50  +    -1.03533951966815 *
        Complain0 ;
   H12  = H12  +     0.83823476190401 * AcceptedCmp10
          +      1.0793719601418 * AcceptedCmp20  +     0.68538854946581 *
        AcceptedCmp30  +     1.00297565893339 * AcceptedCmp40
          +     0.24586379991786 * AcceptedCmp50  +     0.15471251255301 *
        Complain0 ;
   H13  = H13  +    -0.41486094438907 * AcceptedCmp10
          +    -0.76586628449839 * AcceptedCmp20  +    -0.59695459523693 *
        AcceptedCmp30  +    -0.30262159911837 * AcceptedCmp40
          +    -0.61141171124182 * AcceptedCmp50  +    -0.01086235188835 *
        Complain0 ;
   H14  = H14  +    -0.09662858884082 * AcceptedCmp10
          +    -0.48515652524171 * AcceptedCmp20  +    -0.37421451374399 *
        AcceptedCmp30  +    -0.52889523891817 * AcceptedCmp40
          +    -0.73518448275357 * AcceptedCmp50  +    -0.36065830718672 *
        Complain0 ;
   H15  = H15  +      0.2985143092641 * AcceptedCmp10
          +    -0.06881934778393 * AcceptedCmp20  +    -0.02609197044604 *
        AcceptedCmp30  +    -0.79105657447885 * AcceptedCmp40
          +    -0.02286855144948 * AcceptedCmp50  +     0.02884650192784 *
        Complain0 ;
   H11  = H11  +    -0.41169946146301 * Education2n_Cycle
          +      0.8448273504441 * EducationBasic  +    -1.02497956377347 *
        EducationGraduation  +     0.43998321745211 * EducationMaster
          +    -0.85912688909911 * Marital_StatusDivorced
          +     0.81561401465875 * Marital_StatusMarried
          +    -0.58324403081542 * Marital_StatusSingle
          +      0.9348017085106 * Marital_StatusTogether ;
   H12  = H12  +     0.22828129841893 * Education2n_Cycle
          +     0.47579227804033 * EducationBasic  +    -0.18165301263195 *
        EducationGraduation  +    -0.16143431016405 * EducationMaster
          +    -0.34784695867287 * Marital_StatusDivorced
          +    -0.18194022182247 * Marital_StatusMarried
          +    -0.10633185904164 * Marital_StatusSingle
          +     0.13136125361628 * Marital_StatusTogether ;
   H13  = H13  +     0.38705901043652 * Education2n_Cycle
          +     0.19703188370189 * EducationBasic  +    -0.48062640599976 *
        EducationGraduation  +     -0.3646621736273 * EducationMaster
          +     0.61058752124466 * Marital_StatusDivorced
          +    -1.38793808025141 * Marital_StatusMarried
          +     1.10060737810944 * Marital_StatusSingle
          +    -1.21250219018366 * Marital_StatusTogether ;
   H14  = H14  +    -0.20576658115662 * Education2n_Cycle
          +    -0.09185472034614 * EducationBasic  +    -0.43674210064447 *
        EducationGraduation  +    -0.18154054746298 * EducationMaster
          +     0.11973800573581 * Marital_StatusDivorced
          +      -0.294635257911 * Marital_StatusMarried
          +    -0.05399659601172 * Marital_StatusSingle
          +     0.34207780606239 * Marital_StatusTogether ;
   H15  = H15  +    -0.05553093684862 * Education2n_Cycle
          +    -0.12898006732329 * EducationBasic  +    -0.16064118923518 *
        EducationGraduation  +     -0.6431539624694 * EducationMaster
          +     0.42838191659864 * Marital_StatusDivorced
          +    -0.09150349181363 * Marital_StatusMarried
          +    -0.33520164145276 * Marital_StatusSingle
          +    -0.15253738713197 * Marital_StatusTogether ;
   H11  =     -1.5079478405973 + H11 ;
   H12  =     0.03014958331993 + H12 ;
   H13  =    -1.78098671165572 + H13 ;
   H14  =     0.22179429743277 + H14 ;
   H15  =    -2.06602107857898 + H15 ;
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
   P_DepVar1  =    -4.55666337815854 * H11  +    -4.04792544554995 * H12
          +     4.56148127429284 * H13  +     2.36841344452371 * H14
          +    -3.07371010011749 * H15 ;
   P_DepVar1  =    -0.83283406236136 + P_DepVar1 ;
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
;
drop S_:;
