*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Filtering;
* TYPE: MODIFY;
* NODE: Filter;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural34;
*------------------------------------------------------------*;
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
* Renaming variables for Neural34;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural34;
*------------------------------------------------------------*;
drop Neural34_P_DepVar1;
Neural34_P_DepVar1 = P_DepVar1;
drop Neural34_P_DepVar0;
Neural34_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural34;
*------------------------------------------------------------*;
length Neural34_WARN_ $4;
drop Neural34_WARN_;
Neural34_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Filtering;
* TYPE: MODIFY;
* NODE: Filter;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural46;
*------------------------------------------------------------*;
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
   H1x1_1  =    -0.14779241211238 * S_Income  +     0.12406923960108 *
        S_Kidhome  +     0.07566108150758 * S_MntFishProducts
          +     0.04223936357442 * S_MntFruits  +    -0.01414396912246 *
        S_MntGoldProds  +    -0.43631543928923 * S_MntMeatProducts
          +      0.0311909552218 * S_MntSweetProducts
          +      0.1593908004139 * S_MntWines  +    -0.16331402526215 *
        S_NumCatalogPurchases  +    -0.08123579404919 * S_NumDealsPurchases
          +     0.12294876865087 * S_NumStorePurchases
          +     0.11602382379314 * S_NumWebPurchases
          +    -0.23519567542635 * S_NumWebVisitsMonth
          +     0.27617232496223 * S_Recency  +     0.06912944740739 *
        S_Teenhome ;
   H1x1_2  =    -0.13491153011654 * S_Income  +     0.14656938917448 *
        S_Kidhome  +     0.04457005191996 * S_MntFishProducts
          +     0.00771761834647 * S_MntFruits  +    -0.11830651019438 *
        S_MntGoldProds  +     0.06464771115751 * S_MntMeatProducts
          +     0.00133400054994 * S_MntSweetProducts
          +    -0.63837598558931 * S_MntWines  +     0.09668222160749 *
        S_NumCatalogPurchases  +     0.23530173987642 * S_NumDealsPurchases
          +    -0.49595472235036 * S_NumStorePurchases
          +    -0.24747548015204 * S_NumWebPurchases
          +     0.12326047694811 * S_NumWebVisitsMonth
          +    -0.04929000435218 * S_Recency  +     0.00568113597531 *
        S_Teenhome ;
   H1x1_3  =     0.13062973754666 * S_Income  +    -0.15311279667585 *
        S_Kidhome  +      0.0854652628099 * S_MntFishProducts
          +     0.02260695043189 * S_MntFruits  +    -0.06427354034325 *
        S_MntGoldProds  +    -0.51556004816788 * S_MntMeatProducts
          +    -0.03908755288099 * S_MntSweetProducts
          +    -0.24983513168561 * S_MntWines  +     0.11583370343483 *
        S_NumCatalogPurchases  +     0.05060583856766 * S_NumDealsPurchases
          +    -0.20634630081435 * S_NumStorePurchases
          +    -0.06734935798888 * S_NumWebPurchases
          +     0.32288250215418 * S_NumWebVisitsMonth
          +    -0.32978147839937 * S_Recency  +    -0.07420334428475 *
        S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.14311220987159 * AcceptedCmp10
          +     0.25596748420576 * AcceptedCmp20  +     0.13199169114019 *
        AcceptedCmp30  +     0.14111066281846 * AcceptedCmp40
          +     0.16136804502708 * AcceptedCmp50  +     0.06340055511955 *
        Complain0 ;
   H1x1_2  = H1x1_2  +     0.07692946904386 * AcceptedCmp10
          +     0.10129736414747 * AcceptedCmp20  +    -0.08526063108983 *
        AcceptedCmp30  +     0.00391518443243 * AcceptedCmp40
          +    -0.11013908503956 * AcceptedCmp50  +     0.03814032229209 *
        Complain0 ;
   H1x1_3  = H1x1_3  +    -0.02206432573422 * AcceptedCmp10
          +     0.22410311196864 * AcceptedCmp20  +    -0.19387020375313 *
        AcceptedCmp30  +    -0.12058647992586 * AcceptedCmp40
          +    -0.09809197464918 * AcceptedCmp50  +    -0.09604584189983 *
        Complain0 ;
   H1x1_1  = H1x1_1  +    -0.00017476927899 * Education2n_Cycle
          +    -0.15306731287208 * EducationBasic  +     0.04951359729631 *
        EducationGraduation  +     0.07475697967073 * EducationMaster
          +    -0.04265434587882 * Marital_StatusDivorced
          +     0.17114014094758 * Marital_StatusMarried
          +     -0.1537035921296 * Marital_StatusSingle
          +     0.15023718360478 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.10391719023548 * Education2n_Cycle
          +    -0.71597921887555 * EducationBasic  +     0.38732833028427 *
        EducationGraduation  +     0.04507684017588 * EducationMaster
          +     0.25534272809394 * Marital_StatusDivorced
          +     0.20034903346804 * Marital_StatusMarried
          +    -0.38348393943797 * Marital_StatusSingle
          +     0.15254304652439 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.06104667656786 * Education2n_Cycle
          +     -0.0935234366994 * EducationBasic  +     0.09446977823229 *
        EducationGraduation  +    -0.11683780234266 * EducationMaster
          +      0.1988416043876 * Marital_StatusDivorced
          +    -0.21663959478684 * Marital_StatusMarried
          +     0.06591480171547 * Marital_StatusSingle
          +    -0.17108581516048 * Marital_StatusTogether ;
   H1x1_1  =     0.12085771569539 + H1x1_1 ;
   H1x1_2  =     1.88026862462696 + H1x1_2 ;
   H1x1_3  =    -1.66768306479405 + H1x1_3 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -105.465737701328 * H1x1_1  +    -25.9919910307682 * H1x1_2
          +    -60.7557666068018 * H1x1_3 ;
   P_DepVar1  =     17.0796398396243 + P_DepVar1 ;
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
* Renaming variables for AutoNeural46;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural46;
*------------------------------------------------------------*;
drop AutoNeural46_P_DepVar1;
AutoNeural46_P_DepVar1 = P_DepVar1;
drop AutoNeural46_P_DepVar0;
AutoNeural46_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural46;
*------------------------------------------------------------*;
length AutoNeural46_WARN_ $4;
drop AutoNeural46_WARN_;
AutoNeural46_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Filtering;
* TYPE: MODIFY;
* NODE: Filter;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural42;
*------------------------------------------------------------*;
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
* Renaming variables for AutoNeural42;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural42;
*------------------------------------------------------------*;
drop AutoNeural42_P_DepVar1;
AutoNeural42_P_DepVar1 = P_DepVar1;
drop AutoNeural42_P_DepVar0;
AutoNeural42_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural42;
*------------------------------------------------------------*;
length AutoNeural42_WARN_ $4;
drop AutoNeural42_WARN_;
AutoNeural42_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Filtering;
* TYPE: MODIFY;
* NODE: Filter;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural47;
*------------------------------------------------------------*;
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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

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
* Renaming variables for AutoNeural47;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural47;
*------------------------------------------------------------*;
drop AutoNeural47_P_DepVar1;
AutoNeural47_P_DepVar1 = P_DepVar1;
drop AutoNeural47_P_DepVar0;
AutoNeural47_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural47;
*------------------------------------------------------------*;
length AutoNeural47_WARN_ $4;
drop AutoNeural47_WARN_;
AutoNeural47_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Filtering;
* TYPE: MODIFY;
* NODE: Filter;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE4;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural30;
*------------------------------------------------------------*;
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

      label H17 = 'Hidden: H1=7' ;

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
* Renaming variables for Neural30;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural30;
*------------------------------------------------------------*;
drop Neural30_P_DepVar1;
Neural30_P_DepVar1 = P_DepVar1;
drop Neural30_P_DepVar0;
Neural30_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural30;
*------------------------------------------------------------*;
length Neural30_WARN_ $4;
drop Neural30_WARN_;
Neural30_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl21;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl21: Average Posteriors of 5 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural34_P_DepVar1 +
AutoNeural46_P_DepVar1 +
AutoNeural42_P_DepVar1 +
AutoNeural47_P_DepVar1 +
Neural30_P_DepVar1
)/5;
P_DepVar0 = (
Neural34_P_DepVar0 +
AutoNeural46_P_DepVar0 +
AutoNeural42_P_DepVar0 +
AutoNeural47_P_DepVar0 +
Neural30_P_DepVar0
)/5;
*------------------------------------------------------------*;
* Ensmbl21: Computing Classification Vars;
*------------------------------------------------------------*;
length I_DepVar $32;
label I_DepVar = 'Into: DepVar';
length _format $200;
drop _format;
_format= ' ';
_p_= 0;
drop _p_;
if P_DepVar1 > _p_ then do;
_p_= P_DepVar1;
_format= '1';
end;
if P_DepVar0 > _p_ then do;
_p_= P_DepVar0;
_format= '0';
end;
%DMNORMCP(_format,I_DepVar);
*------------------------------------------------------------*;
* Ensmbl21: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl21: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL34_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL34_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL34_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL34_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL46_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL46_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL46_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL46_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL42_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL42_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL42_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL42_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL47_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL47_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL47_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL47_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL30_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL30_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL30_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL30_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
