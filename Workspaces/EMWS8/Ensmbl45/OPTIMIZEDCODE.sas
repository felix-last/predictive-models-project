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

  Frq=NumStorePurchases+NumWebPurchases+NumCatalogPurchases;
  Mnt=MntFishProducts+MntFruits+MntGoldProds+MntMeatProducts+MntSweetProducts+MntWines;
  RMntFrq=Mnt/Frq;
  RFMstat=(Mnt*Frq)/(Recency+1);
  HigherEducation=1*(upcase(Education) in ("GRADUATION","MASTER","PHD"));
  Age = year(today())-Year_Birth;
  AcceptedCmpTotal=AcceptedCmp1+AcceptedCmp2+AcceptedCmp3+AcceptedCmp4+AcceptedCmp5;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
HigherEducationBinary = HigherEducation;
MonthsAsCustomer = int((today()-Dt_Customer)/12);
NumDistPurchases = NumCatalogPurchases + NumWebPurchases;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural9;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

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
*** Writing the Node interval ;
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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.78941671657664 * S_AcceptedCmpTotal
          +     0.31767378900448 * S_Age  +      -0.450304150539 * S_Frq
          +     0.13641886985589 * S_Income  +    -0.76390352240561 *
        S_Kidhome  +    -0.84654868800943 * S_Mnt  +     0.96945558052651 *
        S_MntFishProducts  +     0.16268958674432 * S_MntFruits
          +     0.02144447788014 * S_MntGoldProds  +    -3.75090210449464 *
        S_MntMeatProducts  +    -0.22086629229442 * S_MntSweetProducts
          +      0.8352178457402 * S_MntWines  +     0.16493907873466 *
        S_MonthsAsCustomer  +    -1.54607390993048 * S_NumCatalogPurchases
          +    -1.12130210731541 * S_NumDealsPurchases
          +    -0.12343505299726 * S_NumDistPurchases
          +     0.11863092868196 * S_NumStorePurchases
          +       0.583917993314 * S_NumWebPurchases
          +     0.75529732848146 * S_NumWebVisitsMonth
          +    -0.49784215446785 * S_RFMstat  +     0.40580477815146 *
        S_RMntFrq  +    -0.95519170979342 * S_Recency
          +    -0.44895196625502 * S_Teenhome ;
   H1x1_2  =    -0.22984864633102 * S_AcceptedCmpTotal
          +     0.08901810463204 * S_Age  +    -0.13007664741542 * S_Frq
          +    -0.64174617524704 * S_Income  +     0.26599968715733 *
        S_Kidhome  +     0.57486260655125 * S_Mnt  +    -0.56033337110694 *
        S_MntFishProducts  +     0.16060716517673 * S_MntFruits
          +      0.4349197289782 * S_MntGoldProds  +     1.41079767517969 *
        S_MntMeatProducts  +      0.0615730534741 * S_MntSweetProducts
          +    -0.09057901886639 * S_MntWines  +     0.20260454891291 *
        S_MonthsAsCustomer  +    -1.17048742280721 * S_NumCatalogPurchases
          +    -0.84113790640734 * S_NumDealsPurchases
          +    -0.10512672747147 * S_NumDistPurchases
          +     0.07268711782494 * S_NumStorePurchases
          +     0.57578331257439 * S_NumWebPurchases
          +    -1.34334433506558 * S_NumWebVisitsMonth
          +     0.50079465494904 * S_RFMstat  +     0.77329849238514 *
        S_RMntFrq  +      1.2759588366983 * S_Recency
          +     0.17722493443222 * S_Teenhome ;
   H1x1_3  =      1.1751297152411 * S_AcceptedCmpTotal
          +     0.14380060376858 * S_Age  +    -0.90459868540245 * S_Frq
          +     0.65570498233801 * S_Income  +    -0.66078213466597 *
        S_Kidhome  +      0.5364727654141 * S_Mnt  +    -0.56452823521458 *
        S_MntFishProducts  +     0.11401811215013 * S_MntFruits
          +     0.42809239636494 * S_MntGoldProds  +     3.28485519579047 *
        S_MntMeatProducts  +    -0.10959477301368 * S_MntSweetProducts
          +     -0.5779524716069 * S_MntWines  +     0.08256957915579 *
        S_MonthsAsCustomer  +     0.48195221766948 * S_NumCatalogPurchases
          +     0.45924983504762 * S_NumDealsPurchases
          +    -0.25508041581692 * S_NumDistPurchases
          +    -1.34901283858526 * S_NumStorePurchases
          +    -0.86388975031663 * S_NumWebPurchases
          +     1.86136110391797 * S_NumWebVisitsMonth
          +     0.39724376701426 * S_RFMstat  +    -1.08648755949459 *
        S_RMntFrq  +    -2.06955456943047 * S_Recency
          +     -0.6524420065858 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.80545309346785 * AcceptedCmp10
          +    -0.33518398776018 * AcceptedCmp20  +    -0.58961939502901 *
        AcceptedCmp30  +    -0.89675052404295 * AcceptedCmp40
          +     0.75506592249683 * AcceptedCmp50  +    -0.07335613460961 *
        Complain0  +     0.34255762261501 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.17834267108797 * AcceptedCmp10
          +    -0.54414628806984 * AcceptedCmp20  +      0.8037591997808 *
        AcceptedCmp30  +     0.37789561997689 * AcceptedCmp40
          +    -1.39910847665731 * AcceptedCmp50  +    -0.44783176263268 *
        Complain0  +     0.36763760090773 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.20323890063703 * AcceptedCmp10
          +    -0.08537895761507 * AcceptedCmp20  +     0.22533818089504 *
        AcceptedCmp30  +    -0.22195995100127 * AcceptedCmp40
          +    -2.01371926977123 * AcceptedCmp50  +    -0.17097719978842 *
        Complain0  +     0.34016905753094 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.03394180683805 * Education2n_Cycle
          +    -0.38224926448988 * EducationBasic  +    -0.42512289883041 *
        EducationGraduation  +    -0.59708578424036 * EducationMaster
          +     0.48853068455666 * Marital_StatusDivorced
          +    -0.54903474026465 * Marital_StatusMarried
          +    -0.34079188373939 * Marital_StatusSingle
          +    -0.64602969938868 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.26170943801998 * Education2n_Cycle
          +     0.06893871459175 * EducationBasic  +    -0.84123174187664 *
        EducationGraduation  +     0.19038549912088 * EducationMaster
          +    -1.03547689902027 * Marital_StatusDivorced
          +     2.42164864610471 * Marital_StatusMarried
          +    -1.95342561304942 * Marital_StatusSingle
          +      2.1397185142046 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.04236694810886 * Education2n_Cycle
          +    -0.57404276980591 * EducationBasic  +     -0.1441989834351 *
        EducationGraduation  +    -0.31867831184924 * EducationMaster
          +      0.4337638747935 * Marital_StatusDivorced
          +    -0.38508657017615 * Marital_StatusMarried
          +     -0.0160269708326 * Marital_StatusSingle
          +    -0.57491004270903 * Marital_StatusTogether ;
   H1x1_1  =    -0.53426188790968 + H1x1_1 ;
   H1x1_2  =     0.98557066823746 + H1x1_2 ;
   H1x1_3  =     1.81937688438175 + H1x1_3 ;
   H1x1_4  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 );
   _SUM_ = 0.;
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -3.43702380277695 * H1x1_1  +    -7.14235896425537 * H1x1_2
          +     10.8296305415538 * H1x1_3  +    -2.20824183229369 * H1x1_4 ;
   P_DepVar1  =    -3.68304614366462 + P_DepVar1 ;
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
* Renaming variables for AutoNeural9;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural9;
*------------------------------------------------------------*;
drop AutoNeural9_P_DepVar1;
AutoNeural9_P_DepVar1 = P_DepVar1;
drop AutoNeural9_P_DepVar0;
AutoNeural9_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural9;
*------------------------------------------------------------*;
length AutoNeural9_WARN_ $4;
drop AutoNeural9_WARN_;
AutoNeural9_WARN_ = _WARN_;
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
* NODE: Meta;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural11;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

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
*** Writing the Node interval ;
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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.16786131610493 * S_AcceptedCmpTotal
          +     0.08150129707008 * S_Age  +    -0.00076335149511 * S_Frq
          +     2.37648351383272 * S_Income  +    -1.63260278456818 *
        S_Kidhome  +     -0.6720941090663 * S_Mnt  +    -0.03176174297509 *
        S_MntFishProducts  +    -0.03796990721617 * S_MntFruits
          +    -0.17020485447842 * S_MntGoldProds  +      0.7709093878281 *
        S_MntMeatProducts  +    -0.26168538456938 * S_MntSweetProducts
          +    -1.36275284328546 * S_MntWines  +    -0.30344694826738 *
        S_MonthsAsCustomer  +     1.68662611500615 * S_NumCatalogPurchases
          +     1.32037113020393 * S_NumDealsPurchases
          +     0.42879249227132 * S_NumDistPurchases
          +    -0.89190172778783 * S_NumStorePurchases
          +    -0.87975442613962 * S_NumWebPurchases
          +     2.98977282825831 * S_NumWebVisitsMonth
          +     0.16388418187981 * S_RFMstat  +     0.63858980984599 *
        S_RMntFrq  +    -2.53833222281652 * S_Recency
          +    -2.72141665283523 * S_Teenhome ;
   H1x1_2  =    -1.16140709294501 * S_AcceptedCmpTotal
          +    -0.87210661607894 * S_Age  +    -0.15365607228782 * S_Frq
          +    -1.14855351318782 * S_Income  +     -0.3792851632462 *
        S_Kidhome  +    -1.20412080219233 * S_Mnt  +     0.98615533034973 *
        S_MntFishProducts  +     0.44541456963703 * S_MntFruits
          +    -0.86465923336111 * S_MntGoldProds  +    -5.15063925950455 *
        S_MntMeatProducts  +     0.54937255903381 * S_MntSweetProducts
          +      1.1566197343428 * S_MntWines  +     1.05956341559861 *
        S_MonthsAsCustomer  +    -1.51353620179805 * S_NumCatalogPurchases
          +    -1.16737670931605 * S_NumDealsPurchases
          +     0.08205195039242 * S_NumDistPurchases
          +    -0.65367044520084 * S_NumStorePurchases
          +     2.39693083674757 * S_NumWebPurchases
          +     0.18432526469897 * S_NumWebVisitsMonth
          +    -0.81660690569703 * S_RFMstat  +      0.2679378370467 *
        S_RMntFrq  +    -0.12214066685673 * S_Recency
          +     1.80138107382539 * S_Teenhome ;
   H1x1_3  =      2.0905555295419 * S_AcceptedCmpTotal
          +    -0.23515107640805 * S_Age  +    -0.34980320997139 * S_Frq
          +     0.96612788543649 * S_Income  +    -0.57035066115881 *
        S_Kidhome  +     0.22762934410578 * S_Mnt  +    -0.52536382903021 *
        S_MntFishProducts  +    -1.18451511831956 * S_MntFruits
          +     0.15600368092559 * S_MntGoldProds  +     2.66964572205551 *
        S_MntMeatProducts  +    -0.66381928008493 * S_MntSweetProducts
          +    -1.34669953562975 * S_MntWines  +     1.35404821514849 *
        S_MonthsAsCustomer  +     1.74839628716461 * S_NumCatalogPurchases
          +     0.76616480025024 * S_NumDealsPurchases
          +     0.42823368706255 * S_NumDistPurchases
          +    -1.16998364854907 * S_NumStorePurchases
          +     -1.0841896541746 * S_NumWebPurchases
          +     2.74837744375079 * S_NumWebVisitsMonth
          +    -0.12893804494501 * S_RFMstat  +    -0.62922223536042 *
        S_RMntFrq  +    -5.13438280616518 * S_Recency
          +    -0.03717013845941 * S_Teenhome ;
   H1x1_4  =     0.00721395593412 * S_AcceptedCmpTotal
          +    -0.01540387767211 * S_Age  +    -0.84860703860633 * S_Frq
          +    -1.02288627805121 * S_Income  +    -1.09101870516967 *
        S_Kidhome  +    -0.49364597366691 * S_Mnt  +    -0.46832600024559 *
        S_MntFishProducts  +     0.18419647776638 * S_MntFruits
          +     0.08548650236624 * S_MntGoldProds  +      3.4353205628246 *
        S_MntMeatProducts  +    -0.34836704949861 * S_MntSweetProducts
          +    -2.43294028965601 * S_MntWines  +       -0.52018014955 *
        S_MonthsAsCustomer  +     0.64700842330282 * S_NumCatalogPurchases
          +     0.78421010501058 * S_NumDealsPurchases
          +     0.01075885160671 * S_NumDistPurchases
          +    -1.99395040717832 * S_NumStorePurchases
          +    -1.02908330834262 * S_NumWebPurchases
          +     2.79163466516477 * S_NumWebVisitsMonth
          +    -0.02537920152644 * S_RFMstat  +    -0.42457000565561 *
        S_RMntFrq  +     -2.0907247135068 * S_Recency
          +     0.74119954026621 * S_Teenhome ;
   H1x1_5  =    -1.61701205426558 * S_AcceptedCmpTotal
          +     0.08257295395479 * S_Age  +    -0.68185680658717 * S_Frq
          +    -1.39465125759406 * S_Income  +    -1.25029109577242 *
        S_Kidhome  +    -1.09090107886966 * S_Mnt  +     1.64350195586938 *
        S_MntFishProducts  +      0.5087421773332 * S_MntFruits
          +      0.4047616469084 * S_MntGoldProds  +    -7.16241250715453 *
        S_MntMeatProducts  +    -0.92562420397097 * S_MntSweetProducts
          +     1.87307481667927 * S_MntWines  +    -0.53417946416471 *
        S_MonthsAsCustomer  +    -1.53123660652072 * S_NumCatalogPurchases
          +    -1.04219068390022 * S_NumDealsPurchases
          +    -0.45770204483973 * S_NumDistPurchases
          +    -0.04941442229195 * S_NumStorePurchases
          +     0.67187353161183 * S_NumWebPurchases
          +     2.01907760553871 * S_NumWebVisitsMonth
          +    -1.68329765100269 * S_RFMstat  +     0.29244142334331 *
        S_RMntFrq  +    -1.12913051410394 * S_Recency
          +     0.43082751824484 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.44646416045725 * AcceptedCmp10
          +    -0.51992887099168 * AcceptedCmp20  +    -1.12974688442196 *
        AcceptedCmp30  +    -0.25247614927616 * AcceptedCmp40
          +     -1.0839587453165 * AcceptedCmp50  +    -0.37542128912082 *
        Complain0  +     0.50509109375746 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     1.41785862418118 * AcceptedCmp10
          +     0.14869386732553 * AcceptedCmp20  +    -0.34292007253529 *
        AcceptedCmp30  +    -0.46450669830265 * AcceptedCmp40
          +    -0.84675597945703 * AcceptedCmp50  +     -0.0664649548734 *
        Complain0  +    -0.45532665777266 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.77549230890552 * AcceptedCmp10
          +    -1.36005205352388 * AcceptedCmp20  +    -0.77268925112364 *
        AcceptedCmp30  +    -1.48651970256564 * AcceptedCmp40
          +    -1.49771960438108 * AcceptedCmp50  +     0.05855673938529 *
        Complain0  +      0.5650947463497 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.67577364181798 * AcceptedCmp10
          +    -0.90920539880387 * AcceptedCmp20  +    -0.10856872028934 *
        AcceptedCmp30  +    -0.17408320421731 * AcceptedCmp40
          +    -0.40718112138881 * AcceptedCmp50  +    -1.15772819875829 *
        Complain0  +    -0.63688652305256 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +      -0.257461635853 * AcceptedCmp10
          +    -0.53931888306725 * AcceptedCmp20  +    -0.18314917937273 *
        AcceptedCmp30  +    -0.63373606551928 * AcceptedCmp40
          +    -0.22117496766649 * AcceptedCmp50  +    -0.96313784449205 *
        Complain0  +    -0.42031825118642 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.61947659516101 * Education2n_Cycle
          +     0.35542867116569 * EducationBasic  +    -0.40115062807285 *
        EducationGraduation  +     0.09596442360106 * EducationMaster
          +     2.58907527032049 * Marital_StatusDivorced
          +    -2.45549008158921 * Marital_StatusMarried
          +     2.56223650840768 * Marital_StatusSingle
          +    -2.57680442835747 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.89996232033524 * Education2n_Cycle
          +     0.51901949778729 * EducationBasic  +     0.48428543845596 *
        EducationGraduation  +     0.29249899969052 * EducationMaster
          +     0.83917299191368 * Marital_StatusDivorced
          +    -0.62624692699191 * Marital_StatusMarried
          +    -0.22585060624911 * Marital_StatusSingle
          +    -1.13600554287291 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.14267095105584 * Education2n_Cycle
          +    -0.02301358792856 * EducationBasic  +     0.52040244367562 *
        EducationGraduation  +     -1.3163356801876 * EducationMaster
          +    -0.65063506696715 * Marital_StatusDivorced
          +    -2.37495865381256 * Marital_StatusMarried
          +    -0.54954654146904 * Marital_StatusSingle
          +    -2.20184943463859 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.07824072331908 * Education2n_Cycle
          +    -0.70728597193571 * EducationBasic  +    -0.08522817414387 *
        EducationGraduation  +     0.07916018399549 * EducationMaster
          +     0.16185824798364 * Marital_StatusDivorced
          +    -0.08142416735136 * Marital_StatusMarried
          +    -0.20392270385969 * Marital_StatusSingle
          +    -0.16702436233017 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.24374540557838 * Education2n_Cycle
          +    -0.69820143786999 * EducationBasic  +    -0.60198982003005 *
        EducationGraduation  +     0.28107355175103 * EducationMaster
          +      -0.516522631078 * Marital_StatusDivorced
          +    -0.61661247789976 * Marital_StatusMarried
          +    -0.99533130308294 * Marital_StatusSingle
          +    -0.36897004084592 * Marital_StatusTogether ;
   H1x1_1  =    -2.48464133714558 + H1x1_1 ;
   H1x1_2  =    -1.27353840480002 + H1x1_2 ;
   H1x1_3  =    -1.74000879961851 + H1x1_3 ;
   H1x1_4  =    -0.38838285632991 + H1x1_4 ;
   H1x1_5  =    -0.14124488553728 + H1x1_5 ;
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
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.48404108721156 * S_AcceptedCmpTotal
          +    -0.27070568741648 * S_Age  +    -0.78729393257177 * S_Frq
          +    -0.22841203379079 * S_Income  +      1.7948359601764 *
        S_Kidhome  +     0.16415271082275 * S_Mnt  +     0.68709045116477 *
        S_MntFishProducts  +     1.40499150479431 * S_MntFruits
          +     1.76690927096327 * S_MntGoldProds  +    -0.47805967324795 *
        S_MntMeatProducts  +    -1.98462171861386 * S_MntSweetProducts
          +     0.17732042205332 * S_MntWines  +    -2.68647979937092 *
        S_MonthsAsCustomer  +     0.66724634672152 * S_NumCatalogPurchases
          +    -0.03801022287706 * S_NumDealsPurchases
          +    -1.50723574966419 * S_NumDistPurchases
          +    -0.21514545448485 * S_NumStorePurchases
          +    -0.50179555233865 * S_NumWebPurchases
          +    -0.68226572560161 * S_NumWebVisitsMonth
          +    -1.16287961930374 * S_RFMstat  +    -0.10835316604382 *
        S_RMntFrq  +     0.78178939203913 * S_Recency
          +     0.99430928489958 * S_Teenhome ;
   H1x2_2  =    -0.36352858735119 * S_AcceptedCmpTotal
          +    -0.57224467079409 * S_Age  +    -1.50170848997829 * S_Frq
          +    -0.38902839025885 * S_Income  +     -1.1798795668612 *
        S_Kidhome  +     -0.1290183198617 * S_Mnt  +     0.76723261406072 *
        S_MntFishProducts  +     -0.2940014517298 * S_MntFruits
          +     1.10823983171432 * S_MntGoldProds  +    -0.31483479967732 *
        S_MntMeatProducts  +     1.52044892546638 * S_MntSweetProducts
          +     0.93667207634948 * S_MntWines  +     1.38654947651763 *
        S_MonthsAsCustomer  +     0.60618457384701 * S_NumCatalogPurchases
          +     0.70551335536975 * S_NumDealsPurchases
          +     0.02824488988803 * S_NumDistPurchases
          +    -0.47958123842808 * S_NumStorePurchases
          +     1.04559003239583 * S_NumWebPurchases
          +    -0.58386087813772 * S_NumWebVisitsMonth
          +     0.30550498646512 * S_RFMstat  +     0.30157778523343 *
        S_RMntFrq  +    -0.05848082255965 * S_Recency
          +     1.93017367885145 * S_Teenhome ;
   H1x2_3  =    -1.42573562358231 * S_AcceptedCmpTotal
          +    -1.32139459670271 * S_Age  +    -0.65089374259133 * S_Frq
          +     0.40762251828155 * S_Income  +     0.07844400105703 *
        S_Kidhome  +     0.50965373569965 * S_Mnt  +     0.16029734923155 *
        S_MntFishProducts  +     0.09920766855666 * S_MntFruits
          +     1.72613699296152 * S_MntGoldProds  +    -0.05634715837952 *
        S_MntMeatProducts  +    -0.46288044931269 * S_MntSweetProducts
          +    -1.56275217321856 * S_MntWines  +     0.47573724745363 *
        S_MonthsAsCustomer  +     0.24362096681468 * S_NumCatalogPurchases
          +    -0.28907339261907 * S_NumDealsPurchases
          +     0.04310505858352 * S_NumDistPurchases
          +    -0.99594604666889 * S_NumStorePurchases
          +    -0.58870940220114 * S_NumWebPurchases
          +     0.84018399925148 * S_NumWebVisitsMonth
          +    -0.19517311010454 * S_RFMstat  +     -0.3463233802461 *
        S_RMntFrq  +    -1.47730936960999 * S_Recency
          +    -0.88597688046705 * S_Teenhome ;
   H1x2_4  =     0.11016580381662 * S_AcceptedCmpTotal
          +     0.30908576425954 * S_Age  +     0.34179480828109 * S_Frq
          +     0.40584056795753 * S_Income  +    -0.45712899846476 *
        S_Kidhome  +     1.12080510316382 * S_Mnt  +     0.48988466623601 *
        S_MntFishProducts  +    -0.33589219598754 * S_MntFruits
          +     0.89305356089927 * S_MntGoldProds  +    -2.00512215642683 *
        S_MntMeatProducts  +     1.10859074670332 * S_MntSweetProducts
          +     -1.0064133988839 * S_MntWines  +      0.7768603559605 *
        S_MonthsAsCustomer  +     0.97922554259242 * S_NumCatalogPurchases
          +     0.52917289878604 * S_NumDealsPurchases
          +     0.30974142545809 * S_NumDistPurchases
          +    -0.36081450643799 * S_NumStorePurchases
          +    -0.28418053386759 * S_NumWebPurchases
          +    -0.80759462497096 * S_NumWebVisitsMonth
          +    -1.12633439579018 * S_RFMstat  +    -0.14662678398603 *
        S_RMntFrq  +    -0.02418118976368 * S_Recency
          +    -0.46548253671298 * S_Teenhome ;
   H1x2_5  =    -0.55551536908819 * S_AcceptedCmpTotal
          +    -0.09163465220674 * S_Age  +    -0.35937602626275 * S_Frq
          +     0.61145646041534 * S_Income  +     0.28920493959955 *
        S_Kidhome  +     0.71661843805688 * S_Mnt  +     0.25254041554237 *
        S_MntFishProducts  +    -0.38704785732563 * S_MntFruits
          +    -0.16912995068939 * S_MntGoldProds  +     0.21440191729631 *
        S_MntMeatProducts  +    -0.49507693220329 * S_MntSweetProducts
          +      0.3153765288287 * S_MntWines  +    -0.15329574285112 *
        S_MonthsAsCustomer  +     1.28722879296429 * S_NumCatalogPurchases
          +    -0.47500053723253 * S_NumDealsPurchases
          +     0.41421086319635 * S_NumDistPurchases
          +     0.69664835428137 * S_NumStorePurchases
          +     0.66359306812968 * S_NumWebPurchases
          +     0.77931462528741 * S_NumWebVisitsMonth
          +     0.05868786291548 * S_RFMstat  +     0.77672802649379 *
        S_RMntFrq  +    -1.91226042675868 * S_Recency
          +     1.79227856637688 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     1.13471289065691 * AcceptedCmp10
          +     0.65974383309652 * AcceptedCmp20  +    -1.87292531678796 *
        AcceptedCmp30  +      -1.353797047409 * AcceptedCmp40
          +     0.20616786486771 * AcceptedCmp50  +    -0.38264326101775 *
        Complain0  +    -0.17807638061615 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.21347348622419 * AcceptedCmp10
          +    -0.25372740217388 * AcceptedCmp20  +     1.86937589112006 *
        AcceptedCmp30  +    -0.04754722838516 * AcceptedCmp40
          +    -0.08078800460742 * AcceptedCmp50  +     1.62387969342769 *
        Complain0  +    -0.78004732229344 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +    -0.02152665189186 * AcceptedCmp10
          +     0.57207081192818 * AcceptedCmp20  +      0.6212177562119 *
        AcceptedCmp30  +    -0.73691462528053 * AcceptedCmp40
          +    -0.35326427815838 * AcceptedCmp50  +     0.14875513793176 *
        Complain0  +    -0.13978395235915 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     0.87315450122595 * AcceptedCmp10
          +      0.7868322457627 * AcceptedCmp20  +    -0.23332719513906 *
        AcceptedCmp30  +    -0.68817918979928 * AcceptedCmp40
          +    -0.57204462412445 * AcceptedCmp50  +    -0.86223238269616 *
        Complain0  +     -0.3126348645458 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     0.29282165496733 * AcceptedCmp10
          +     1.51708756092369 * AcceptedCmp20  +     1.20268215158483 *
        AcceptedCmp30  +     0.30521477351547 * AcceptedCmp40
          +    -0.58691162701837 * AcceptedCmp50  +     0.75641665624817 *
        Complain0  +      0.7018761099345 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.68955031483686 * Education2n_Cycle
          +    -1.63162976419312 * EducationBasic  +     1.58569020932253 *
        EducationGraduation  +     0.89392741557091 * EducationMaster
          +    -1.34742914042312 * Marital_StatusDivorced
          +    -0.75378934918763 * Marital_StatusMarried
          +    -1.85411678929217 * Marital_StatusSingle
          +     0.34579160965376 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.91842441316819 * Education2n_Cycle
          +    -0.10372785737624 * EducationBasic  +     1.79022097342125 *
        EducationGraduation  +      1.4602485898642 * EducationMaster
          +     0.47958659206261 * Marital_StatusDivorced
          +     -0.9665584294045 * Marital_StatusMarried
          +      0.9733784530538 * Marital_StatusSingle
          +     0.19258101270915 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     1.26817216331303 * Education2n_Cycle
          +    -1.60153781162075 * EducationBasic  +    -0.32068567398782 *
        EducationGraduation  +     1.49772418974753 * EducationMaster
          +    -0.56894207908284 * Marital_StatusDivorced
          +    -0.96715106987195 * Marital_StatusMarried
          +     1.18678144721443 * Marital_StatusSingle
          +     1.05940264255347 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +    -1.19824707240276 * Education2n_Cycle
          +     0.43905907692169 * EducationBasic  +    -1.18279972023424 *
        EducationGraduation  +    -2.01250798855133 * EducationMaster
          +     -0.6061959224661 * Marital_StatusDivorced
          +     0.03495844244684 * Marital_StatusMarried
          +    -0.63896361063244 * Marital_StatusSingle
          +     0.74357887057422 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     -0.6530237200396 * Education2n_Cycle
          +     0.90062473169279 * EducationBasic  +    -3.01933913602199 *
        EducationGraduation  +     -0.1598988619204 * EducationMaster
          +     0.82178907301319 * Marital_StatusDivorced
          +     1.69543553114589 * Marital_StatusMarried
          +     -2.1272067363559 * Marital_StatusSingle
          +     0.24274508474634 * Marital_StatusTogether ;
   H1x2_1  =     0.30842509451224 + H1x2_1 ;
   H1x2_2  =     1.79200699407075 + H1x2_2 ;
   H1x2_3  =     0.66706944906809 + H1x2_3 ;
   H1x2_4  =     -0.7356254138015 + H1x2_4 ;
   H1x2_5  =    -0.68066575174095 + H1x2_5 ;
   H1x2_6  = 0;
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 );
   _SUM_ = 0.;
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_5  = EXP(H1x2_5  - _MAX_);
   _SUM_ = _SUM_ + H1x2_5 ;
   H1x2_6  = EXP(H1x2_6  - _MAX_);
   _SUM_ = _SUM_ + H1x2_6 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =      0.7656278374321 * H1x1_1  +     1.18988619460831 * H1x1_2
          +    -0.68458045558713 * H1x1_3  +     0.49093980591245 * H1x1_4
          +    -1.27959429919804 * H1x1_5  +    -1.38760297105319 * H1x1_6 ;
   H2x1_2  =    -1.48941810274544 * H1x1_1  +     1.75443095464294 * H1x1_2
          +    -1.63478694878031 * H1x1_3  +    -0.69296364459258 * H1x1_4
          +     3.14007823471691 * H1x1_5  +     2.71965753640902 * H1x1_6 ;
   H2x1_3  =     1.07426996100463 * H1x1_1  +    -1.76796943416489 * H1x1_2
          +    -0.11946940948224 * H1x1_3  +     1.25457449221991 * H1x1_4
          +     -1.4079980040852 * H1x1_5  +    -0.94725163293394 * H1x1_6 ;
   H2x1_4  =    -0.00078893231548 * H1x1_1  +     0.06396324179717 * H1x1_2
          +    -0.13674165204668 * H1x1_3  +    -0.26576379023249 * H1x1_4
          +     0.44513643867194 * H1x1_5  +     0.66585878141635 * H1x1_6 ;
   H2x1_5  =     -2.8467581879118 * H1x1_1  +     2.94182061339515 * H1x1_2
          +    -3.43021438685063 * H1x1_3  +    -4.00045607730935 * H1x1_4
          +     3.09230566797337 * H1x1_5  +     3.57592566919388 * H1x1_6 ;
   H2x1_6  =    -0.29912975132561 * H1x1_1  +     0.25554634262501 * H1x1_2
          +    -0.62666868576544 * H1x1_3  +     1.54567563696489 * H1x1_4
          +     1.87530466579189 * H1x1_5  +    -0.32006241006585 * H1x1_6 ;
   H2x1_1  = H2x1_1  +    -0.53923803948063 * H1x2_1
          +    -0.14551996067575 * H1x2_2  +     1.15730137448351 * H1x2_3
          +     0.02585401686791 * H1x2_4  +     -0.9274056409194 * H1x2_5
          +    -0.07237646966438 * H1x2_6 ;
   H2x1_2  = H2x1_2  +     -0.1441321293455 * H1x2_1
          +    -0.53271770203833 * H1x2_2  +    -2.80064282115477 * H1x2_3
          +    -1.05759395901612 * H1x2_4  +    -0.55127059339304 * H1x2_5
          +     0.35471332651631 * H1x2_6 ;
   H2x1_3  = H2x1_3  +     -0.5351190580444 * H1x2_1
          +    -0.02107048725988 * H1x2_2  +    -0.83389437376968 * H1x2_3
          +    -0.80183937400902 * H1x2_4  +    -0.66588385104453 * H1x2_5
          +      0.5218140468737 * H1x2_6 ;
   H2x1_4  = H2x1_4  +     1.89050022127485 * H1x2_1
          +     -2.6557601537516 * H1x2_2  +     0.99126360053411 * H1x2_3
          +    -0.44091776054792 * H1x2_4  +    -1.48547403065153 * H1x2_5
          +    -0.67920869444907 * H1x2_6 ;
   H2x1_5  = H2x1_5  +      0.2827883572995 * H1x2_1
          +    -0.68177519072226 * H1x2_2  +    -1.62062483607713 * H1x2_3
          +     0.24454579481466 * H1x2_4  +    -0.07591553404219 * H1x2_5
          +      1.1175989027563 * H1x2_6 ;
   H2x1_6  = H2x1_6  +    -0.00603649892235 * H1x2_1
          +    -1.39053357060307 * H1x2_2  +    -1.34023350990878 * H1x2_3
          +    -0.76811804565852 * H1x2_4  +    -1.40869786147662 * H1x2_5
          +     1.54589390085972 * H1x2_6 ;
   H2x1_1  =     0.47873396703524 + H2x1_1 ;
   H2x1_2  =     -0.0000340630035 + H2x1_2 ;
   H2x1_3  =     0.35556259592214 + H2x1_3 ;
   H2x1_4  =     1.01896219314016 + H2x1_4 ;
   H2x1_5  =     0.72195082860145 + H2x1_5 ;
   H2x1_6  =     0.24171639764515 + H2x1_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
   H2x1_6  = 1.0 / (1.0 + EXP(MIN( - H2x1_6 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     7.13056975005701 * H2x1_1  +    -9.26714696465882 * H2x1_2
          +     9.36351037194964 * H2x1_3  +     2.76582940055979 * H2x1_4
          +    -20.1354182036801 * H2x1_5  +     1.54726164498938 * H2x1_6 ;
   P_DepVar1  =     5.03726079820845 + P_DepVar1 ;
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
* Renaming variables for AutoNeural11;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural11;
*------------------------------------------------------------*;
drop AutoNeural11_P_DepVar1;
AutoNeural11_P_DepVar1 = P_DepVar1;
drop AutoNeural11_P_DepVar0;
AutoNeural11_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural11;
*------------------------------------------------------------*;
length AutoNeural11_WARN_ $4;
drop AutoNeural11_WARN_;
AutoNeural11_WARN_ = _WARN_;
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
* NODE: Meta;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural12;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H1x2_7 = 'Hidden: H1x2_=7' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

      label H1x3_6 = 'Hidden: H1x3_=6' ;

      label H1x3_7 = 'Hidden: H1x3_=7' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x1_7 = 'Hidden: H2x1_=7' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x2_3 = 'Hidden: H2x2_=3' ;

      label H2x2_4 = 'Hidden: H2x2_=4' ;

      label H2x2_5 = 'Hidden: H2x2_=5' ;

      label H2x2_6 = 'Hidden: H2x2_=6' ;

      label H2x2_7 = 'Hidden: H2x2_=7' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x1_3 = 'Hidden: H3x1_=3' ;

      label H3x1_4 = 'Hidden: H3x1_=4' ;

      label H3x1_5 = 'Hidden: H3x1_=5' ;

      label H3x1_6 = 'Hidden: H3x1_=6' ;

      label H3x1_7 = 'Hidden: H3x1_=7' ;

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
*** Writing the Node interval ;
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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -1.22979702388871 * S_AcceptedCmpTotal
          +    -0.43104795266139 * S_Age  +     0.86889278443529 * S_Frq
          +    -1.60769879195759 * S_Income  +     0.50863205564081 *
        S_Kidhome  +     0.63485396330815 * S_Mnt  +     1.54715964931126 *
        S_MntFishProducts  +     0.75185279130369 * S_MntFruits
          +    -0.00997586610757 * S_MntGoldProds  +    -2.37203493907401 *
        S_MntMeatProducts  +     0.38638626403468 * S_MntSweetProducts
          +     2.26121903773395 * S_MntWines  +    -0.59651789183067 *
        S_MonthsAsCustomer  +    -1.52699943820196 * S_NumCatalogPurchases
          +    -1.18466001117424 * S_NumDealsPurchases
          +     -0.1371252133567 * S_NumDistPurchases
          +     1.92719775731123 * S_NumStorePurchases
          +     1.23184249192116 * S_NumWebPurchases
          +    -1.55583843197424 * S_NumWebVisitsMonth
          +    -0.47773207532121 * S_RFMstat  +    -0.35513231558649 *
        S_RMntFrq  +     1.63863392145333 * S_Recency
          +     0.67173275608308 * S_Teenhome ;
   H1x1_2  =    -0.02716121128584 * S_AcceptedCmpTotal
          +     0.11518566588792 * S_Age  +    -0.03446898150571 * S_Frq
          +    -0.19022324523346 * S_Income  +     1.06549395713708 *
        S_Kidhome  +    -0.75490876357951 * S_Mnt  +    -0.25515163712879 *
        S_MntFishProducts  +    -0.33372388118122 * S_MntFruits
          +    -1.35673933518218 * S_MntGoldProds  +    -2.95766948640442 *
        S_MntMeatProducts  +      0.2681792093191 * S_MntSweetProducts
          +     0.68376629766032 * S_MntWines  +     1.19853579057819 *
        S_MonthsAsCustomer  +    -1.27282116370987 * S_NumCatalogPurchases
          +     0.63616523425865 * S_NumDealsPurchases
          +     0.45460056261546 * S_NumDistPurchases
          +    -0.61009999017225 * S_NumStorePurchases
          +     1.85193755731081 * S_NumWebPurchases
          +    -2.47698404964319 * S_NumWebVisitsMonth
          +     -0.6995834208607 * S_RFMstat  +    -0.25646177956568 *
        S_RMntFrq  +     1.07962222419254 * S_Recency
          +     0.63257022999179 * S_Teenhome ;
   H1x1_3  =     2.21390028099752 * S_AcceptedCmpTotal
          +     0.05331556426178 * S_Age  +    -0.65514579137956 * S_Frq
          +     0.64307304324121 * S_Income  +    -0.74572098598993 *
        S_Kidhome  +     0.72146088814601 * S_Mnt  +    -0.35292583888573 *
        S_MntFishProducts  +    -0.60011862194755 * S_MntFruits
          +     0.41187011131735 * S_MntGoldProds  +     6.59297713742725 *
        S_MntMeatProducts  +    -0.24427365286575 * S_MntSweetProducts
          +    -2.72258930476853 * S_MntWines  +     0.14880721485001 *
        S_MonthsAsCustomer  +     1.43710120897606 * S_NumCatalogPurchases
          +      1.8907968580473 * S_NumDealsPurchases
          +     0.01244124801764 * S_NumDistPurchases
          +    -2.34409118104622 * S_NumStorePurchases
          +    -1.80820043087435 * S_NumWebPurchases
          +     2.40219682136039 * S_NumWebVisitsMonth
          +     0.64272295101175 * S_RFMstat  +    -2.37583346151401 *
        S_RMntFrq  +    -2.05893311376628 * S_Recency
          +    -0.09539892763273 * S_Teenhome ;
   H1x1_4  =     0.39967052173479 * S_AcceptedCmpTotal
          +    -0.07923444459672 * S_Age  +     0.62339138041893 * S_Frq
          +     1.61789948058771 * S_Income  +     -1.4543646851274 *
        S_Kidhome  +      0.0674362517919 * S_Mnt  +    -0.01747401903722 *
        S_MntFishProducts  +     0.35122931976599 * S_MntFruits
          +     0.49479569666837 * S_MntGoldProds  +     0.96598079382568 *
        S_MntMeatProducts  +     0.00966238843619 * S_MntSweetProducts
          +    -1.04781861730336 * S_MntWines  +    -0.60232527705864 *
        S_MonthsAsCustomer  +     1.64183850526139 * S_NumCatalogPurchases
          +     0.28209537604198 * S_NumDealsPurchases
          +      0.6450277971767 * S_NumDistPurchases
          +     0.85050092520609 * S_NumStorePurchases
          +    -0.53920307215941 * S_NumWebPurchases
          +     3.01106015100147 * S_NumWebVisitsMonth
          +     0.35454480730832 * S_RFMstat  +     2.44126135489059 *
        S_RMntFrq  +    -3.15497765450512 * S_Recency
          +    -1.52912100940198 * S_Teenhome ;
   H1x1_5  =    -1.36246601888598 * S_AcceptedCmpTotal
          +     0.18494970680372 * S_Age  +    -0.48239316237012 * S_Frq
          +    -0.07754710635082 * S_Income  +    -1.12988783865284 *
        S_Kidhome  +    -0.99389820487435 * S_Mnt  +     0.97730928948588 *
        S_MntFishProducts  +     0.22400827772102 * S_MntFruits
          +     0.74486626223136 * S_MntGoldProds  +    -5.09299340099429 *
        S_MntMeatProducts  +     -0.9293665551505 * S_MntSweetProducts
          +     2.05621056740754 * S_MntWines  +     0.13751326047818 *
        S_MonthsAsCustomer  +    -0.78748700520409 * S_NumCatalogPurchases
          +    -0.36642526324451 * S_NumDealsPurchases
          +     -0.6091014843932 * S_NumDistPurchases
          +    -0.21154626182088 * S_NumStorePurchases
          +    -0.10361347071364 * S_NumWebPurchases
          +     1.36358817627784 * S_NumWebVisitsMonth
          +    -1.12999319551924 * S_RFMstat  +    -0.19491430019245 *
        S_RMntFrq  +    -1.04649498091784 * S_Recency
          +     0.17452738843544 * S_Teenhome ;
   H1x1_6  =    -0.61844696407508 * S_AcceptedCmpTotal
          +    -0.13181297602063 * S_Age  +        0.68456903056 * S_Frq
          +    -0.34991774042788 * S_Income  +     1.46159955002315 *
        S_Kidhome  +     0.21200077233877 * S_Mnt  +    -1.25754094670769 *
        S_MntFishProducts  +    -0.09204195787339 * S_MntFruits
          +     0.30860507694466 * S_MntGoldProds  +     2.47956356836605 *
        S_MntMeatProducts  +     0.40882561010395 * S_MntSweetProducts
          +    -0.31319819026957 * S_MntWines  +    -0.35678594664106 *
        S_MonthsAsCustomer  +     0.01690494248971 * S_NumCatalogPurchases
          +    -0.14868505161718 * S_NumDealsPurchases
          +    -0.08395384711805 * S_NumDistPurchases
          +     0.60525238179245 * S_NumStorePurchases
          +     0.04555100214276 * S_NumWebPurchases
          +    -2.31888436784305 * S_NumWebVisitsMonth
          +     0.04533094777373 * S_RFMstat  +     1.45047684433196 *
        S_RMntFrq  +     3.02439474266744 * S_Recency
          +     1.00458920115313 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     1.44647846478949 * AcceptedCmp10
          +     0.96385529143297 * AcceptedCmp20  +     0.80013060089317 *
        AcceptedCmp30  +     1.84770198014032 * AcceptedCmp40
          +     0.80401446607714 * AcceptedCmp50  +     0.54049538978821 *
        Complain0  +     0.10087163212641 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -1.68777270512099 * AcceptedCmp10
          +     0.54885195015877 * AcceptedCmp20  +    -0.90402264974928 *
        AcceptedCmp30  +    -0.42358682267334 * AcceptedCmp40
          +     0.87016183962004 * AcceptedCmp50  +     0.42082407002478 *
        Complain0  +    -0.37999025234308 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.40437631159129 * AcceptedCmp10
          +      0.0972205308159 * AcceptedCmp20  +     0.81983130325412 *
        AcceptedCmp30  +     0.11521626741585 * AcceptedCmp40
          +    -0.67384158900854 * AcceptedCmp50  +    -0.08888648111628 *
        Complain0  +    -0.12489144574555 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.11861456940351 * AcceptedCmp10
          +    -0.84401831403342 * AcceptedCmp20  +    -0.99900514370547 *
        AcceptedCmp30  +     0.03311277744337 * AcceptedCmp40
          +    -0.89369182681709 * AcceptedCmp50  +    -0.46321923883787 *
        Complain0  +     0.73698890563732 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +     1.36740346673871 * AcceptedCmp10
          +    -0.09307995102939 * AcceptedCmp20  +    -0.99727975675265 *
        AcceptedCmp30  +    -1.64006559974507 * AcceptedCmp40
          +    -0.12164496778613 * AcceptedCmp50  +    -0.20852398947217 *
        Complain0  +    -0.12903157145588 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +    -0.18375336439178 * AcceptedCmp10
          +    -0.61320886099742 * AcceptedCmp20  +     1.46384578641555 *
        AcceptedCmp30  +     1.07211075480456 * AcceptedCmp40
          +      0.1814894663676 * AcceptedCmp50  +     0.61050756961671 *
        Complain0  +     0.18598381049052 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.85219855086228 * Education2n_Cycle
          +     0.72409647993559 * EducationBasic  +    -1.69896726220399 *
        EducationGraduation  +     0.96924197858068 * EducationMaster
          +     -0.7180104021039 * Marital_StatusDivorced
          +      0.5957373170744 * Marital_StatusMarried
          +    -0.86183942803988 * Marital_StatusSingle
          +     0.92994743994713 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.29863788783823 * Education2n_Cycle
          +    -0.03492398661463 * EducationBasic  +     1.96491183828121 *
        EducationGraduation  +    -1.23733321574678 * EducationMaster
          +     0.84772700244021 * Marital_StatusDivorced
          +    -0.37049970188511 * Marital_StatusMarried
          +     1.54291641732063 * Marital_StatusSingle
          +      0.2036514883055 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.21600870420184 * Education2n_Cycle
          +    -0.41247138958506 * EducationBasic  +    -0.04710356650237 *
        EducationGraduation  +     0.02093123351397 * EducationMaster
          +     0.73222548496385 * Marital_StatusDivorced
          +    -0.50102202656102 * Marital_StatusMarried
          +    -0.07207130428422 * Marital_StatusSingle
          +     0.17349558515949 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.26695942691152 * Education2n_Cycle
          +     0.08346486410021 * EducationBasic  +    -1.19880044804188 *
        EducationGraduation  +     0.65366032471107 * EducationMaster
          +     0.25894719464799 * Marital_StatusDivorced
          +    -1.95576501275834 * Marital_StatusMarried
          +     2.65422185276746 * Marital_StatusSingle
          +    -3.75373924980398 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.17586479935526 * Education2n_Cycle
          +    -0.60926722758624 * EducationBasic  +    -0.09613529218096 *
        EducationGraduation  +    -0.28683119112285 * EducationMaster
          +     0.60936191204707 * Marital_StatusDivorced
          +    -0.52190111190458 * Marital_StatusMarried
          +    -0.60982305233136 * Marital_StatusSingle
          +     0.44659686388318 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.16067502362228 * Education2n_Cycle
          +     0.18937855703296 * EducationBasic  +     0.06386817095607 *
        EducationGraduation  +     0.51538853297606 * EducationMaster
          +    -1.44614502228294 * Marital_StatusDivorced
          +      2.9001493892928 * Marital_StatusMarried
          +    -2.60467399972513 * Marital_StatusSingle
          +     2.31815156650258 * Marital_StatusTogether ;
   H1x1_1  =     2.01245018737649 + H1x1_1 ;
   H1x1_2  =    -0.13724223857423 + H1x1_2 ;
   H1x1_3  =     0.82934879006547 + H1x1_3 ;
   H1x1_4  =    -0.21545557935699 + H1x1_4 ;
   H1x1_5  =     0.44835497486542 + H1x1_5 ;
   H1x1_6  =     0.11792774897936 + H1x1_6 ;
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
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -0.51245281628488 * S_AcceptedCmpTotal
          +     0.29586551487242 * S_Age  +     1.34531593814589 * S_Frq
          +     1.40753230099536 * S_Income  +    -1.01979935776675 *
        S_Kidhome  +      1.0655533203194 * S_Mnt  +     0.74171867275429 *
        S_MntFishProducts  +    -0.77881282886264 * S_MntFruits
          +    -0.58546798489474 * S_MntGoldProds  +     0.93410444049208 *
        S_MntMeatProducts  +     1.10536507959221 * S_MntSweetProducts
          +     2.08723894920384 * S_MntWines  +    -0.64437193401661 *
        S_MonthsAsCustomer  +     1.49880648713252 * S_NumCatalogPurchases
          +    -0.46483717253931 * S_NumDealsPurchases
          +    -0.53329008421157 * S_NumDistPurchases
          +      0.2490774300193 * S_NumStorePurchases
          +    -0.82755150673885 * S_NumWebPurchases
          +     0.04007223822389 * S_NumWebVisitsMonth
          +    -0.21044923749124 * S_RFMstat  +     0.27791352512351 *
        S_RMntFrq  +     0.43434806411249 * S_Recency
          +    -1.25974784572932 * S_Teenhome ;
   H1x2_2  =     0.30117516029562 * S_AcceptedCmpTotal
          +     0.16042149118905 * S_Age  +    -2.59350323749407 * S_Frq
          +    -0.29940842910223 * S_Income  +    -0.09168883019219 *
        S_Kidhome  +    -0.39758312303322 * S_Mnt  +     -0.4138816285287 *
        S_MntFishProducts  +        0.18555623351 * S_MntFruits
          +    -0.28024159914959 * S_MntGoldProds  +     1.08084875123781 *
        S_MntMeatProducts  +     0.29032828446632 * S_MntSweetProducts
          +     0.47556687393839 * S_MntWines  +    -0.89795441591329 *
        S_MonthsAsCustomer  +    -0.47081176716106 * S_NumCatalogPurchases
          +     0.75855101382458 * S_NumDealsPurchases
          +     1.61754951768262 * S_NumDistPurchases
          +    -0.48146714929729 * S_NumStorePurchases
          +    -0.76460728035552 * S_NumWebPurchases
          +    -0.71146787112442 * S_NumWebVisitsMonth
          +     0.42381866124588 * S_RFMstat  +     -0.3894818400451 *
        S_RMntFrq  +    -0.01528916550509 * S_Recency
          +     0.38823136254948 * S_Teenhome ;
   H1x2_3  =    -1.28283712556699 * S_AcceptedCmpTotal
          +    -0.62214066983867 * S_Age  +      0.0675653313166 * S_Frq
          +     0.77098495841918 * S_Income  +    -1.36225954388119 *
        S_Kidhome  +      0.0552831076081 * S_Mnt  +    -0.21387512812296 *
        S_MntFishProducts  +    -1.14715718471691 * S_MntFruits
          +    -1.15507787000433 * S_MntGoldProds  +     0.87571107504211 *
        S_MntMeatProducts  +     0.28274178198443 * S_MntSweetProducts
          +     0.23070204507311 * S_MntWines  +    -1.88342889522874 *
        S_MonthsAsCustomer  +    -0.19127945486903 * S_NumCatalogPurchases
          +     0.75255317965748 * S_NumDealsPurchases
          +     1.34900588315783 * S_NumDistPurchases
          +    -0.17717469778048 * S_NumStorePurchases
          +    -0.01560551546553 * S_NumWebPurchases
          +     1.24315988674343 * S_NumWebVisitsMonth
          +     2.23854910235018 * S_RFMstat  +     0.55516131558838 *
        S_RMntFrq  +    -2.01558015490584 * S_Recency
          +     1.34178435587014 * S_Teenhome ;
   H1x2_4  =     1.35706411211536 * S_AcceptedCmpTotal
          +    -0.73374940975123 * S_Age  +     2.10445428870671 * S_Frq
          +    -1.60133766439775 * S_Income  +     0.02861907512789 *
        S_Kidhome  +    -1.61837693250001 * S_Mnt  +       0.209751533263 *
        S_MntFishProducts  +     1.82411973889656 * S_MntFruits
          +     1.12172774431408 * S_MntGoldProds  +     1.09610288046573 *
        S_MntMeatProducts  +    -0.86671874280949 * S_MntSweetProducts
          +    -0.11602638812541 * S_MntWines  +    -0.30074020863435 *
        S_MonthsAsCustomer  +     0.46044258716085 * S_NumCatalogPurchases
          +    -1.71127148178768 * S_NumDealsPurchases
          +    -1.77527355221308 * S_NumDistPurchases
          +    -1.40009594349363 * S_NumStorePurchases
          +    -0.46471012062697 * S_NumWebPurchases
          +     0.04619891083228 * S_NumWebVisitsMonth
          +     0.34715614649891 * S_RFMstat  +    -0.74983051176564 *
        S_RMntFrq  +     0.84880186653433 * S_Recency
          +     0.20218341857265 * S_Teenhome ;
   H1x2_5  =     1.79452363233333 * S_AcceptedCmpTotal
          +     1.70826835028511 * S_Age  +     0.08241717907016 * S_Frq
          +    -1.15275600314196 * S_Income  +     0.87736096074094 *
        S_Kidhome  +     0.90821427722502 * S_Mnt  +    -0.84055732556964 *
        S_MntFishProducts  +    -0.74245639083939 * S_MntFruits
          +     0.00204325095854 * S_MntGoldProds  +     0.37597102500134 *
        S_MntMeatProducts  +     0.28586076288454 * S_MntSweetProducts
          +    -1.38194310174269 * S_MntWines  +     0.10286181254259 *
        S_MonthsAsCustomer  +    -0.82469018226034 * S_NumCatalogPurchases
          +    -0.22204470395056 * S_NumDealsPurchases
          +    -1.74490476011984 * S_NumDistPurchases
          +     1.93538420108324 * S_NumStorePurchases
          +     1.04892631742152 * S_NumWebPurchases
          +     1.50717841566047 * S_NumWebVisitsMonth
          +     0.61249250909375 * S_RFMstat  +    -0.54764212165911 *
        S_RMntFrq  +      1.9918829185386 * S_Recency
          +     0.64908540313947 * S_Teenhome ;
   H1x2_6  =     1.38705263280369 * S_AcceptedCmpTotal
          +    -0.70531523704191 * S_Age  +     0.59125500807205 * S_Frq
          +     0.89549490842249 * S_Income  +     1.07240562425698 *
        S_Kidhome  +    -0.25050185694258 * S_Mnt  +    -0.77552207934024 *
        S_MntFishProducts  +     0.18087757744856 * S_MntFruits
          +    -1.37618517481144 * S_MntGoldProds  +      0.6557488228355 *
        S_MntMeatProducts  +    -1.40834207395949 * S_MntSweetProducts
          +    -0.76196689750388 * S_MntWines  +     0.85144735274506 *
        S_MonthsAsCustomer  +     0.66349954778428 * S_NumCatalogPurchases
          +    -0.94690420785776 * S_NumDealsPurchases
          +     1.87932706342204 * S_NumDistPurchases
          +     0.31232717416487 * S_NumStorePurchases
          +     1.51889492693355 * S_NumWebPurchases
          +     0.04376853689795 * S_NumWebVisitsMonth
          +    -2.53979043374029 * S_RFMstat  +     1.33915580029494 *
        S_RMntFrq  +    -1.21983510008829 * S_Recency
          +     0.36122230024433 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     1.89852147155601 * AcceptedCmp10
          +     0.03501265764204 * AcceptedCmp20  +    -0.45070218241239 *
        AcceptedCmp30  +    -1.27257966336041 * AcceptedCmp40
          +     0.86175125820023 * AcceptedCmp50  +     1.42864024461581 *
        Complain0  +     0.34417315915901 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     0.41672679168374 * AcceptedCmp10
          +     0.10769233314512 * AcceptedCmp20  +     0.42374549876289 *
        AcceptedCmp30  +     0.65697535989046 * AcceptedCmp40
          +     1.49817201460948 * AcceptedCmp50  +     0.46039378640249 *
        Complain0  +     1.34709525059573 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     0.75388522027745 * AcceptedCmp10
          +     2.63069611253058 * AcceptedCmp20  +     0.30907626174766 *
        AcceptedCmp30  +     1.10100873408666 * AcceptedCmp40
          +    -1.08824297693055 * AcceptedCmp50  +     1.05059014395924 *
        Complain0  +     0.67869922391732 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +    -0.22033664091288 * AcceptedCmp10
          +     1.34914301916376 * AcceptedCmp20  +    -0.91465085581504 *
        AcceptedCmp30  +    -0.19686441685837 * AcceptedCmp40
          +     0.10683331864009 * AcceptedCmp50  +    -0.00754824810979 *
        Complain0  +     1.52033864172921 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     0.83049886541915 * AcceptedCmp10
          +    -0.74079162208987 * AcceptedCmp20  +    -0.67792505698297 *
        AcceptedCmp30  +     0.07081190269168 * AcceptedCmp40
          +     0.18720033568684 * AcceptedCmp50  +      2.6531318197812 *
        Complain0  +     0.89741230471087 * HigherEducationBinary0 ;
   H1x2_6  = H1x2_6  +    -0.56781516290501 * AcceptedCmp10
          +    -1.51874938874937 * AcceptedCmp20  +     1.28621778326033 *
        AcceptedCmp30  +    -0.68769482686243 * AcceptedCmp40
          +     0.35592893389946 * AcceptedCmp50  +    -1.30827608061077 *
        Complain0  +     0.32980103195099 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     -1.3799101073197 * Education2n_Cycle
          +     0.02501135207931 * EducationBasic  +     1.13490660748682 *
        EducationGraduation  +    -0.11344307008943 * EducationMaster
          +     0.56030871857835 * Marital_StatusDivorced
          +    -1.22448534379831 * Marital_StatusMarried
          +     0.78141783495855 * Marital_StatusSingle
          +    -1.35807438297575 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -0.29912132201198 * Education2n_Cycle
          +    -0.97227735746604 * EducationBasic  +     1.05541395347718 *
        EducationGraduation  +     0.69607179798453 * EducationMaster
          +    -2.63452071552997 * Marital_StatusDivorced
          +     0.61829054779121 * Marital_StatusMarried
          +    -2.20743370246315 * Marital_StatusSingle
          +     0.56930072654252 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.65046688904352 * Education2n_Cycle
          +     0.03854232912474 * EducationBasic  +     0.59545004622858 *
        EducationGraduation  +    -1.68638824011899 * EducationMaster
          +      -1.454102516731 * Marital_StatusDivorced
          +     0.71488291465759 * Marital_StatusMarried
          +     0.96038830049792 * Marital_StatusSingle
          +    -0.85244216490853 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.37430673318658 * Education2n_Cycle
          +    -0.25373979771478 * EducationBasic  +    -1.65617377693247 *
        EducationGraduation  +    -1.12481097095571 * EducationMaster
          +    -0.01160394891598 * Marital_StatusDivorced
          +    -1.09054636482951 * Marital_StatusMarried
          +      0.7793855479379 * Marital_StatusSingle
          +    -0.40649435490654 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     -0.1016827992735 * Education2n_Cycle
          +     1.07194596228219 * EducationBasic  +    -1.05800808905557 *
        EducationGraduation  +     0.09666597691691 * EducationMaster
          +    -0.73414854875115 * Marital_StatusDivorced
          +     0.46421425621114 * Marital_StatusMarried
          +    -0.54512730625469 * Marital_StatusSingle
          +     0.76568726267448 * Marital_StatusTogether ;
   H1x2_6  = H1x2_6  +    -1.15957084181454 * Education2n_Cycle
          +     0.00847667341235 * EducationBasic  +    -1.58463832529749 *
        EducationGraduation  +     0.56518194582557 * EducationMaster
          +     0.25131188683384 * Marital_StatusDivorced
          +     2.38279806963807 * Marital_StatusMarried
          +     0.28897706448348 * Marital_StatusSingle
          +     0.89118497255856 * Marital_StatusTogether ;
   H1x2_1  =    -1.58113759763481 + H1x2_1 ;
   H1x2_2  =    -1.19307731012977 + H1x2_2 ;
   H1x2_3  =     0.35767811974231 + H1x2_3 ;
   H1x2_4  =    -0.20241610577527 + H1x2_4 ;
   H1x2_5  =     0.30120348602955 + H1x2_5 ;
   H1x2_6  =     1.04145053611779 + H1x2_6 ;
   H1x2_7  = 0;
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 , H1x2_7
         );
   _SUM_ = 0.;
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_5  = EXP(H1x2_5  - _MAX_);
   _SUM_ = _SUM_ + H1x2_5 ;
   H1x2_6  = EXP(H1x2_6  - _MAX_);
   _SUM_ = _SUM_ + H1x2_6 ;
   H1x2_7  = EXP(H1x2_7  - _MAX_);
   _SUM_ = _SUM_ + H1x2_7 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
   H1x2_7  = H1x2_7  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
   H1x2_7  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -0.17891338426869 * S_AcceptedCmpTotal
          +     0.25935021287808 * S_Age  +     -0.4211584261256 * S_Frq
          +    -1.91007620895221 * S_Income  +     0.38954955842314 *
        S_Kidhome  +     0.07674351412771 * S_Mnt  +    -0.00193662324959 *
        S_MntFishProducts  +    -0.05912563364557 * S_MntFruits
          +     0.34447908349796 * S_MntGoldProds  +      1.8146796379351 *
        S_MntMeatProducts  +    -0.28617584915758 * S_MntSweetProducts
          +    -0.25003395507837 * S_MntWines  +     2.70698456342857 *
        S_MonthsAsCustomer  +     0.61560315312621 * S_NumCatalogPurchases
          +     1.11855402225797 * S_NumDealsPurchases
          +     0.39150287442005 * S_NumDistPurchases
          +     0.00160244551627 * S_NumStorePurchases
          +     1.54380043731879 * S_NumWebPurchases
          +      0.6462755347813 * S_NumWebVisitsMonth
          +      0.3712356571744 * S_RFMstat  +     0.31930000498313 *
        S_RMntFrq  +     0.91533450209744 * S_Recency
          +    -1.15144971921837 * S_Teenhome ;
   H1x3_2  =     0.70342217458269 * S_AcceptedCmpTotal
          +     1.00269567168731 * S_Age  +     0.28237778780972 * S_Frq
          +     1.85610950568833 * S_Income  +    -0.88627540559449 *
        S_Kidhome  +      -0.681406495446 * S_Mnt  +    -0.52884566607488 *
        S_MntFishProducts  +    -1.55540056999822 * S_MntFruits
          +    -0.86530238267543 * S_MntGoldProds  +     0.50288889191395 *
        S_MntMeatProducts  +     0.42795025747297 * S_MntSweetProducts
          +     1.65622561769832 * S_MntWines  +    -0.40506757052255 *
        S_MonthsAsCustomer  +    -0.45283667973478 * S_NumCatalogPurchases
          +     0.01911815525287 * S_NumDealsPurchases
          +    -1.07196707915227 * S_NumDistPurchases
          +      0.6452048321682 * S_NumStorePurchases
          +    -0.15818575353955 * S_NumWebPurchases
          +    -0.82586162051382 * S_NumWebVisitsMonth
          +     0.35914598433318 * S_RFMstat  +     0.14754646817335 *
        S_RMntFrq  +     0.23398669008843 * S_Recency
          +      0.1494741245474 * S_Teenhome ;
   H1x3_3  =     0.54929571619315 * S_AcceptedCmpTotal
          +      -0.751329127583 * S_Age  +    -0.94592306727941 * S_Frq
          +    -1.17625421122138 * S_Income  +     0.74760015734698 *
        S_Kidhome  +    -1.31055967085841 * S_Mnt  +     -0.5844789069547 *
        S_MntFishProducts  +     0.29563811382096 * S_MntFruits
          +      2.0486671645084 * S_MntGoldProds  +      0.4596153519541 *
        S_MntMeatProducts  +     0.43182048706593 * S_MntSweetProducts
          +     0.06319773540648 * S_MntWines  +     -0.9320658068644 *
        S_MonthsAsCustomer  +     0.97208201647088 * S_NumCatalogPurchases
          +     1.56893739271853 * S_NumDealsPurchases
          +      0.6745865425238 * S_NumDistPurchases
          +    -0.26848765783548 * S_NumStorePurchases
          +     0.79227081430227 * S_NumWebPurchases
          +     0.83054874267768 * S_NumWebVisitsMonth
          +    -0.28363014203077 * S_RFMstat  +    -0.71879552423951 *
        S_RMntFrq  +     0.80917480816898 * S_Recency
          +    -0.52052715034272 * S_Teenhome ;
   H1x3_4  =     1.71480641781959 * S_AcceptedCmpTotal
          +    -0.98495603767618 * S_Age  +     -0.0459665945886 * S_Frq
          +     1.19396539246615 * S_Income  +     0.51326452746824 *
        S_Kidhome  +    -0.22663230333642 * S_Mnt  +     0.27256846012963 *
        S_MntFishProducts  +    -0.50661455153622 * S_MntFruits
          +     -0.3498057126965 * S_MntGoldProds  +    -2.87000075082987 *
        S_MntMeatProducts  +    -0.09413391100844 * S_MntSweetProducts
          +     1.15010664811376 * S_MntWines  +    -0.48501392658783 *
        S_MonthsAsCustomer  +      0.2688077310392 * S_NumCatalogPurchases
          +    -0.23954856030467 * S_NumDealsPurchases
          +    -1.61914390483829 * S_NumDistPurchases
          +      -1.014570623016 * S_NumStorePurchases
          +    -0.36828642098701 * S_NumWebPurchases
          +    -0.04976922659227 * S_NumWebVisitsMonth
          +     0.87811344320757 * S_RFMstat  +    -1.70999928232532 *
        S_RMntFrq  +    -0.40880481304369 * S_Recency
          +     0.75806578113158 * S_Teenhome ;
   H1x3_5  =    -0.35033091531835 * S_AcceptedCmpTotal
          +    -1.18148775203733 * S_Age  +    -0.17374293038138 * S_Frq
          +    -0.36680516767012 * S_Income  +     0.57186890691757 *
        S_Kidhome  +    -0.02612042491922 * S_Mnt  +     0.84551697375819 *
        S_MntFishProducts  +     0.44255296354709 * S_MntFruits
          +    -1.35259485807243 * S_MntGoldProds  +      0.3377329409199 *
        S_MntMeatProducts  +    -1.06135100840202 * S_MntSweetProducts
          +     0.15771394796649 * S_MntWines  +     1.55754960780486 *
        S_MonthsAsCustomer  +    -0.76896921785988 * S_NumCatalogPurchases
          +     1.00094082424204 * S_NumDealsPurchases
          +      0.2724785290725 * S_NumDistPurchases
          +     0.13170237783486 * S_NumStorePurchases
          +    -1.31447792523743 * S_NumWebPurchases
          +    -0.09121088371438 * S_NumWebVisitsMonth
          +     1.46860488573551 * S_RFMstat  +     0.46491504994651 *
        S_RMntFrq  +      0.6767512513985 * S_Recency
          +    -1.74995034763966 * S_Teenhome ;
   H1x3_6  =     1.05520309715672 * S_AcceptedCmpTotal
          +    -1.05930507843633 * S_Age  +     0.07032294102853 * S_Frq
          +    -0.05932294137503 * S_Income  +    -1.47206442598932 *
        S_Kidhome  +     0.56661112816398 * S_Mnt  +    -0.11340132210258 *
        S_MntFishProducts  +    -0.32177484313741 * S_MntFruits
          +    -0.32378384178804 * S_MntGoldProds  +     0.00540737819175 *
        S_MntMeatProducts  +     0.14834467568566 * S_MntSweetProducts
          +    -0.95841169333668 * S_MntWines  +    -0.62902099823048 *
        S_MonthsAsCustomer  +    -0.67434201898155 * S_NumCatalogPurchases
          +    -0.73198872336344 * S_NumDealsPurchases
          +     0.29368958872361 * S_NumDistPurchases
          +     1.52772046446908 * S_NumStorePurchases
          +    -1.75065469134874 * S_NumWebPurchases
          +      0.0264954621772 * S_NumWebVisitsMonth
          +    -0.88054137065815 * S_RFMstat  +     0.70371760194946 *
        S_RMntFrq  +     1.14219878739476 * S_Recency
          +    -1.15240998118906 * S_Teenhome ;
   H1x3_1  = H1x3_1  +     0.60800466481517 * AcceptedCmp10
          +     0.33187245535701 * AcceptedCmp20  +    -0.13888343551044 *
        AcceptedCmp30  +     0.93663925029857 * AcceptedCmp40
          +     1.09340622621085 * AcceptedCmp50  +    -0.49132743156126 *
        Complain0  +     0.45196197584946 * HigherEducationBinary0 ;
   H1x3_2  = H1x3_2  +     1.40275485940553 * AcceptedCmp10
          +    -0.15035102140746 * AcceptedCmp20  +    -0.53574064147206 *
        AcceptedCmp30  +    -1.67324904853563 * AcceptedCmp40
          +     0.05636486780046 * AcceptedCmp50  +    -0.39032867538703 *
        Complain0  +    -0.74980603736258 * HigherEducationBinary0 ;
   H1x3_3  = H1x3_3  +     0.26722647672682 * AcceptedCmp10
          +      0.6216449242511 * AcceptedCmp20  +     0.76635966126463 *
        AcceptedCmp30  +    -2.48978919706551 * AcceptedCmp40
          +     0.98619070514978 * AcceptedCmp50  +    -0.19244215041297 *
        Complain0  +    -1.19045127506692 * HigherEducationBinary0 ;
   H1x3_4  = H1x3_4  +    -1.73915810074841 * AcceptedCmp10
          +     0.72244354389321 * AcceptedCmp20  +     1.07200246076684 *
        AcceptedCmp30  +     0.24242315318429 * AcceptedCmp40
          +     0.48717202781909 * AcceptedCmp50  +    -1.18600714935645 *
        Complain0  +     -1.0752062632729 * HigherEducationBinary0 ;
   H1x3_5  = H1x3_5  +     1.07972020322696 * AcceptedCmp10
          +     0.38275266830165 * AcceptedCmp20  +     0.45959913551609 *
        AcceptedCmp30  +    -0.30891288234597 * AcceptedCmp40
          +    -0.35568820567134 * AcceptedCmp50  +     -1.8045223309162 *
        Complain0  +    -0.29380313969195 * HigherEducationBinary0 ;
   H1x3_6  = H1x3_6  +    -2.40002597755125 * AcceptedCmp10
          +     0.61725427642794 * AcceptedCmp20  +      1.3438972982524 *
        AcceptedCmp30  +    -0.66766212489049 * AcceptedCmp40
          +     1.10709227053258 * AcceptedCmp50  +    -0.98301865424423 *
        Complain0  +     0.83512874944952 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +    -0.49604077640433 * Education2n_Cycle
          +    -0.60803139475446 * EducationBasic  +     0.39029834300888 *
        EducationGraduation  +     1.49476669226441 * EducationMaster
          +     0.32207432513904 * Marital_StatusDivorced
          +      0.6397913221395 * Marital_StatusMarried
          +    -0.25330032559918 * Marital_StatusSingle
          +      0.6826963146507 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +     0.70727271276171 * Education2n_Cycle
          +    -0.74539861835467 * EducationBasic  +    -1.09813520505203 *
        EducationGraduation  +      0.0913616986494 * EducationMaster
          +     0.79430904713493 * Marital_StatusDivorced
          +     2.54456429102799 * Marital_StatusMarried
          +     0.59410742352499 * Marital_StatusSingle
          +     0.62339810371964 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +     0.41739931776571 * Education2n_Cycle
          +     0.90042318812458 * EducationBasic  +    -0.30863999735161 *
        EducationGraduation  +    -0.07080985966069 * EducationMaster
          +    -0.43081775693595 * Marital_StatusDivorced
          +    -0.78485102174552 * Marital_StatusMarried
          +    -1.56581090110813 * Marital_StatusSingle
          +     1.31552735466691 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +    -1.03450070870223 * Education2n_Cycle
          +     0.12962104594991 * EducationBasic  +    -2.08320982697158 *
        EducationGraduation  +     1.01633562820676 * EducationMaster
          +     0.38226706522151 * Marital_StatusDivorced
          +     0.96666958079914 * Marital_StatusMarried
          +    -0.07771259761555 * Marital_StatusSingle
          +    -0.15667080607342 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +     0.42350784953316 * Education2n_Cycle
          +    -0.47409869250049 * EducationBasic  +     0.22752853959532 *
        EducationGraduation  +     0.05813076059598 * EducationMaster
          +    -0.38325393606947 * Marital_StatusDivorced
          +    -1.43303056163299 * Marital_StatusMarried
          +     0.11571941757387 * Marital_StatusSingle
          +     0.42633042000729 * Marital_StatusTogether ;
   H1x3_6  = H1x3_6  +     1.11214831415741 * Education2n_Cycle
          +      0.8877309144454 * EducationBasic  +     0.87390674413956 *
        EducationGraduation  +     0.90837023676142 * EducationMaster
          +    -0.36491799765765 * Marital_StatusDivorced
          +     0.14142786767503 * Marital_StatusMarried
          +     0.22643970468805 * Marital_StatusSingle
          +     0.74162870756295 * Marital_StatusTogether ;
   H1x3_1  =        0.17121674502 + H1x3_1 ;
   H1x3_2  =    -0.07858073871761 + H1x3_2 ;
   H1x3_3  =     -0.1687483376367 + H1x3_3 ;
   H1x3_4  =     0.92501573900148 + H1x3_4 ;
   H1x3_5  =    -0.04765930254307 + H1x3_5 ;
   H1x3_6  =     0.29532221854366 + H1x3_6 ;
   H1x3_7  = 0;
   _MAX_ = MAX (H1x3_1 , H1x3_2 , H1x3_3 , H1x3_4 , H1x3_5 , H1x3_6 , H1x3_7
         );
   _SUM_ = 0.;
   H1x3_1  = EXP(H1x3_1  - _MAX_);
   _SUM_ = _SUM_ + H1x3_1 ;
   H1x3_2  = EXP(H1x3_2  - _MAX_);
   _SUM_ = _SUM_ + H1x3_2 ;
   H1x3_3  = EXP(H1x3_3  - _MAX_);
   _SUM_ = _SUM_ + H1x3_3 ;
   H1x3_4  = EXP(H1x3_4  - _MAX_);
   _SUM_ = _SUM_ + H1x3_4 ;
   H1x3_5  = EXP(H1x3_5  - _MAX_);
   _SUM_ = _SUM_ + H1x3_5 ;
   H1x3_6  = EXP(H1x3_6  - _MAX_);
   _SUM_ = _SUM_ + H1x3_6 ;
   H1x3_7  = EXP(H1x3_7  - _MAX_);
   _SUM_ = _SUM_ + H1x3_7 ;
   H1x3_1  = H1x3_1  / _SUM_;
   H1x3_2  = H1x3_2  / _SUM_;
   H1x3_3  = H1x3_3  / _SUM_;
   H1x3_4  = H1x3_4  / _SUM_;
   H1x3_5  = H1x3_5  / _SUM_;
   H1x3_6  = H1x3_6  / _SUM_;
   H1x3_7  = H1x3_7  / _SUM_;
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
   H1x3_6  = .;
   H1x3_7  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -0.59397690687549 * H1x1_1  +     0.10790242485513 * H1x1_2
          +     1.34957997338147 * H1x1_3  +     0.98783879769831 * H1x1_4
          +    -1.73131698691915 * H1x1_5  +    -0.04920424431591 * H1x1_6
          +    -0.75229173661277 * H1x1_7 ;
   H2x1_2  =    -0.98729009516736 * H1x1_1  +     0.08491210993613 * H1x1_2
          +     0.08027654554575 * H1x1_3  +     0.06189432860142 * H1x1_4
          +    -1.23526842489276 * H1x1_5  +    -0.17600169070197 * H1x1_6
          +     0.70746372975481 * H1x1_7 ;
   H2x1_3  =    -0.91861478701429 * H1x1_1  +     0.18513565366261 * H1x1_2
          +    -0.18629587955963 * H1x1_3  +     0.76802660507034 * H1x1_4
          +    -0.47979525657638 * H1x1_5  +     0.06968142422923 * H1x1_6
          +     2.18264864713501 * H1x1_7 ;
   H2x1_4  =     1.02774363171853 * H1x1_1  +     1.08006636098136 * H1x1_2
          +    -2.27078540572539 * H1x1_3  +    -0.54968089382258 * H1x1_4
          +     2.11477012099075 * H1x1_5  +     1.91368944483056 * H1x1_6
          +     0.22313799249268 * H1x1_7 ;
   H2x1_5  =    -1.06933000183778 * H1x1_1  +     0.73081558484415 * H1x1_2
          +    -0.78012012951065 * H1x1_3  +     0.81916081920412 * H1x1_4
          +    -1.46358608086032 * H1x1_5  +     1.83492870022704 * H1x1_6
          +     0.75554005406859 * H1x1_7 ;
   H2x1_6  =    -2.28576277725334 * H1x1_1  +    -0.32249555333061 * H1x1_2
          +     3.41388795688866 * H1x1_3  +     3.30305437699117 * H1x1_4
          +    -1.49237136034665 * H1x1_5  +    -1.64329313023006 * H1x1_6
          +     3.08746595768905 * H1x1_7 ;
   H2x1_1  = H2x1_1  +    -2.56424783943845 * H1x2_1
          +    -1.00213973107436 * H1x2_2  +    -0.47445930434013 * H1x2_3
          +    -1.62372689856618 * H1x2_4  +     -1.1856250348479 * H1x2_5
          +     0.04266758405533 * H1x2_6  +    -0.60071538153471 * H1x2_7 ;
   H2x1_2  = H2x1_2  +     0.00935939453146 * H1x2_1
          +     0.55542862749222 * H1x2_2  +     -0.6066128025675 * H1x2_3
          +    -0.53196514301497 * H1x2_4  +    -1.40549473181231 * H1x2_5
          +    -0.08595621526876 * H1x2_6  +    -1.03953618328756 * H1x2_7 ;
   H2x1_3  = H2x1_3  +    -1.41069312035355 * H1x2_1
          +     0.56124490780446 * H1x2_2  +    -0.00472279335297 * H1x2_3
          +    -1.10441771442377 * H1x2_4  +    -0.27090019786185 * H1x2_5
          +    -0.15206855618217 * H1x2_6  +     -1.6035395520507 * H1x2_7 ;
   H2x1_4  = H2x1_4  +    -0.55045399339183 * H1x2_1
          +     0.02477552373088 * H1x2_2  +     0.19400769235958 * H1x2_3
          +    -0.38264537483702 * H1x2_4  +     0.63479720884458 * H1x2_5
          +    -0.60194629301645 * H1x2_6  +    -0.83490097285651 * H1x2_7 ;
   H2x1_5  = H2x1_5  +    -1.03176133074695 * H1x2_1
          +    -0.59926889064506 * H1x2_2  +    -1.07077012847053 * H1x2_3
          +    -1.18998920291096 * H1x2_4  +     0.39150574258439 * H1x2_5
          +     0.05580574741832 * H1x2_6  +    -0.32272109045259 * H1x2_7 ;
   H2x1_6  = H2x1_6  +    -0.61952040538587 * H1x2_1
          +     0.35510185028829 * H1x2_2  +    -0.23901935720129 * H1x2_3
          +     0.31752417497209 * H1x2_4  +    -1.20101515562967 * H1x2_5
          +     0.95004398218762 * H1x2_6  +    -0.60363955740244 * H1x2_7 ;
   H2x1_1  = H2x1_1  +     0.74378922258523 * H1x3_1
          +      0.4693103426831 * H1x3_2  +     0.82071786194731 * H1x3_3
          +     0.46432194238141 * H1x3_4  +    -1.39760250161206 * H1x3_5
          +     0.68725250578779 * H1x3_6  +    -0.98986331205144 * H1x3_7 ;
   H2x1_2  = H2x1_2  +     0.48406734142754 * H1x3_1
          +     1.24032575331626 * H1x3_2  +     0.10072816620895 * H1x3_3
          +     -2.4915795108808 * H1x3_4  +    -1.20085587739472 * H1x3_5
          +     2.57480977795816 * H1x3_6  +    -0.36127801521801 * H1x3_7 ;
   H2x1_3  = H2x1_3  +    -0.29392518978638 * H1x3_1
          +     0.02884163093827 * H1x3_2  +     -0.7595494999576 * H1x3_3
          +     0.32536537321799 * H1x3_4  +    -0.01283695014976 * H1x3_5
          +     0.76895275927405 * H1x3_6  +     -0.2802859993784 * H1x3_7 ;
   H2x1_4  = H2x1_4  +     2.19833784150068 * H1x3_1
          +     0.25528651098746 * H1x3_2  +    -0.72296156297186 * H1x3_3
          +    -0.14360138590872 * H1x3_4  +     0.77657569331577 * H1x3_5
          +    -1.57969278343415 * H1x3_6  +    -0.92288304588247 * H1x3_7 ;
   H2x1_5  = H2x1_5  +     2.11753865409831 * H1x3_1
          +     0.83654766112935 * H1x3_2  +     0.97472534941535 * H1x3_3
          +     1.35030042962655 * H1x3_4  +     1.24680664824079 * H1x3_5
          +     0.19234112612264 * H1x3_6  +    -0.90680244689294 * H1x3_7 ;
   H2x1_6  = H2x1_6  +     2.07923724911848 * H1x3_1
          +     1.62526758922217 * H1x3_2  +    -0.68837627923045 * H1x3_3
          +    -0.21127837456631 * H1x3_4  +    -1.47138526111866 * H1x3_5
          +    -0.52275521204408 * H1x3_6  +    -0.36639952580044 * H1x3_7 ;
   H2x1_1  =    -1.05059672372056 + H2x1_1 ;
   H2x1_2  =    -1.18404209429335 + H2x1_2 ;
   H2x1_3  =    -0.76285494175137 + H2x1_3 ;
   H2x1_4  =     2.22362261707253 + H2x1_4 ;
   H2x1_5  =    -0.98793149966854 + H2x1_5 ;
   H2x1_6  =     1.51370254076672 + H2x1_6 ;
   H2x1_7  = 0;
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 , H2x1_5 , H2x1_6 , H2x1_7
         );
   _SUM_ = 0.;
   H2x1_1  = EXP(H2x1_1  - _MAX_);
   _SUM_ = _SUM_ + H2x1_1 ;
   H2x1_2  = EXP(H2x1_2  - _MAX_);
   _SUM_ = _SUM_ + H2x1_2 ;
   H2x1_3  = EXP(H2x1_3  - _MAX_);
   _SUM_ = _SUM_ + H2x1_3 ;
   H2x1_4  = EXP(H2x1_4  - _MAX_);
   _SUM_ = _SUM_ + H2x1_4 ;
   H2x1_5  = EXP(H2x1_5  - _MAX_);
   _SUM_ = _SUM_ + H2x1_5 ;
   H2x1_6  = EXP(H2x1_6  - _MAX_);
   _SUM_ = _SUM_ + H2x1_6 ;
   H2x1_7  = EXP(H2x1_7  - _MAX_);
   _SUM_ = _SUM_ + H2x1_7 ;
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
   H2x1_5  = H2x1_5  / _SUM_;
   H2x1_6  = H2x1_6  / _SUM_;
   H2x1_7  = H2x1_7  / _SUM_;
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
   H2x1_7  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =    -0.47079896252387 * H1x1_1  +      0.6132734714958 * H1x1_2
          +     1.50300753820512 * H1x1_3  +     -0.1812621169129 * H1x1_4
          +    -0.18531614991208 * H1x1_5  +     -0.2905105845089 * H1x1_6
          +     1.33158539183491 * H1x1_7 ;
   H2x2_2  =    -1.90834701790953 * H1x1_1  +      0.6177658514697 * H1x1_2
          +     0.36465199316418 * H1x1_3  +     0.85911870587838 * H1x1_4
          +     0.02147610114602 * H1x1_5  +     0.32326590534391 * H1x1_6
          +    -1.04241581652278 * H1x1_7 ;
   H2x2_3  =       0.471130277999 * H1x1_1  +     0.96694465336161 * H1x1_2
          +       0.141582035067 * H1x1_3  +     0.53325844993783 * H1x1_4
          +     -0.0659115060565 * H1x1_5  +     0.38141753021852 * H1x1_6
          +    -1.14139437080586 * H1x1_7 ;
   H2x2_4  =     0.97070926632973 * H1x1_1  +    -0.13619191199121 * H1x1_2
          +       0.111155554391 * H1x1_3  +    -0.50119055939436 * H1x1_4
          +     -0.4478264228864 * H1x1_5  +    -0.07373167561096 * H1x1_6
          +    -0.48838853015257 * H1x1_7 ;
   H2x2_5  =    -0.97151785477215 * H1x1_1  +     0.21189203541458 * H1x1_2
          +    -0.19596886882434 * H1x1_3  +      1.3474130560719 * H1x1_4
          +     1.73119417991798 * H1x1_5  +    -0.03726270753922 * H1x1_6
          +    -1.41850405567364 * H1x1_7 ;
   H2x2_6  =     0.64188298957992 * H1x1_1  +     0.87835723870887 * H1x1_2
          +     0.65705195530326 * H1x1_3  +    -1.37039626769544 * H1x1_4
          +    -0.32238737127781 * H1x1_5  +     0.33986547881641 * H1x1_6
          +    -0.39788950643812 * H1x1_7 ;
   H2x2_1  = H2x2_1  +    -0.69934298550944 * H1x2_1
          +    -0.34972890643898 * H1x2_2  +     0.13067071374168 * H1x2_3
          +    -0.35163870866778 * H1x2_4  +     0.68739106758866 * H1x2_5
          +    -0.13482628170329 * H1x2_6  +    -0.03659282127619 * H1x2_7 ;
   H2x2_2  = H2x2_2  +    -0.16537065948373 * H1x2_1
          +     1.88602375412723 * H1x2_2  +     0.00246313998608 * H1x2_3
          +    -0.38678545162214 * H1x2_4  +     1.62314892910576 * H1x2_5
          +     1.14369813266427 * H1x2_6  +    -0.04547589616076 * H1x2_7 ;
   H2x2_3  = H2x2_3  +     0.25040248389011 * H1x2_1
          +    -1.56534319969402 * H1x2_2  +     0.07686150326519 * H1x2_3
          +     -0.9279505919723 * H1x2_4  +    -0.40426942169792 * H1x2_5
          +      0.0625082015929 * H1x2_6  +    -1.06140294711643 * H1x2_7 ;
   H2x2_4  = H2x2_4  +     -0.4384763018657 * H1x2_1
          +    -1.45966734038116 * H1x2_2  +      -2.034771072409 * H1x2_3
          +    -0.09055740067076 * H1x2_4  +     1.51504299287048 * H1x2_5
          +     0.15439799867788 * H1x2_6  +    -1.11828371545771 * H1x2_7 ;
   H2x2_5  = H2x2_5  +     1.25750321874643 * H1x2_1
          +    -0.65639925770112 * H1x2_2  +     -1.7659580690496 * H1x2_3
          +       0.375442412611 * H1x2_4  +     0.00802128415855 * H1x2_5
          +     0.75342656671485 * H1x2_6  +     1.64939805941174 * H1x2_7 ;
   H2x2_6  = H2x2_6  +     1.32293752617916 * H1x2_1
          +     0.48969975153948 * H1x2_2  +    -0.72928783660254 * H1x2_3
          +     0.84727905047749 * H1x2_4  +     0.04670520107938 * H1x2_5
          +     2.02862934142232 * H1x2_6  +    -0.56510756043393 * H1x2_7 ;
   H2x2_1  = H2x2_1  +       1.744725276854 * H1x3_1
          +     0.13060858789431 * H1x3_2  +    -0.96737787454303 * H1x3_3
          +    -0.33966254732699 * H1x3_4  +     2.39360262119688 * H1x3_5
          +     2.58016170780679 * H1x3_6  +    -0.61611732156494 * H1x3_7 ;
   H2x2_2  = H2x2_2  +    -0.81180308935434 * H1x3_1
          +    -1.15566778124471 * H1x3_2  +     0.08550916456261 * H1x3_3
          +     0.54919117407314 * H1x3_4  +     0.18927188150893 * H1x3_5
          +    -0.15464567766004 * H1x3_6  +     0.22152383228096 * H1x3_7 ;
   H2x2_3  = H2x2_3  +    -0.57155391194888 * H1x3_1
          +    -0.80109748621438 * H1x3_2  +     -1.0755749661031 * H1x3_3
          +     1.03082070302539 * H1x3_4  +    -2.00320570042417 * H1x3_5
          +    -1.96298435256616 * H1x3_6  +     1.02097262601001 * H1x3_7 ;
   H2x2_4  = H2x2_4  +     0.24801772968599 * H1x3_1
          +    -2.13175914157416 * H1x3_2  +    -0.52172370749235 * H1x3_3
          +     2.04158456409986 * H1x3_4  +     1.02332318578438 * H1x3_5
          +      -0.428263055638 * H1x3_6  +    -0.10602300040145 * H1x3_7 ;
   H2x2_5  = H2x2_5  +    -1.00177979562809 * H1x3_1
          +    -0.45285333413007 * H1x3_2  +    -0.35882884863392 * H1x3_3
          +     0.23001711273663 * H1x3_4  +     0.77235765656369 * H1x3_5
          +    -0.04383242140243 * H1x3_6  +    -0.25926963615252 * H1x3_7 ;
   H2x2_6  = H2x2_6  +     0.84797826043534 * H1x3_1
          +    -0.46927154831713 * H1x3_2  +    -1.09865845985096 * H1x3_3
          +     0.59699123454307 * H1x3_4  +     1.59564014754161 * H1x3_5
          +     1.33413776227036 * H1x3_6  +     0.33047800872361 * H1x3_7 ;
   H2x2_1  =    -3.05344936388855 + H2x2_1 ;
   H2x2_2  =     0.31382645894355 + H2x2_2 ;
   H2x2_3  =     0.31718668306888 + H2x2_3 ;
   H2x2_4  =    -0.72340666209054 + H2x2_4 ;
   H2x2_5  =    -0.59585228872544 + H2x2_5 ;
   H2x2_6  =    -1.34027540207713 + H2x2_6 ;
   H2x2_7  = 0;
   _MAX_ = MAX (H2x2_1 , H2x2_2 , H2x2_3 , H2x2_4 , H2x2_5 , H2x2_6 , H2x2_7
         );
   _SUM_ = 0.;
   H2x2_1  = EXP(H2x2_1  - _MAX_);
   _SUM_ = _SUM_ + H2x2_1 ;
   H2x2_2  = EXP(H2x2_2  - _MAX_);
   _SUM_ = _SUM_ + H2x2_2 ;
   H2x2_3  = EXP(H2x2_3  - _MAX_);
   _SUM_ = _SUM_ + H2x2_3 ;
   H2x2_4  = EXP(H2x2_4  - _MAX_);
   _SUM_ = _SUM_ + H2x2_4 ;
   H2x2_5  = EXP(H2x2_5  - _MAX_);
   _SUM_ = _SUM_ + H2x2_5 ;
   H2x2_6  = EXP(H2x2_6  - _MAX_);
   _SUM_ = _SUM_ + H2x2_6 ;
   H2x2_7  = EXP(H2x2_7  - _MAX_);
   _SUM_ = _SUM_ + H2x2_7 ;
   H2x2_1  = H2x2_1  / _SUM_;
   H2x2_2  = H2x2_2  / _SUM_;
   H2x2_3  = H2x2_3  / _SUM_;
   H2x2_4  = H2x2_4  / _SUM_;
   H2x2_5  = H2x2_5  / _SUM_;
   H2x2_6  = H2x2_6  / _SUM_;
   H2x2_7  = H2x2_7  / _SUM_;
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
   H2x2_3  = .;
   H2x2_4  = .;
   H2x2_5  = .;
   H2x2_6  = .;
   H2x2_7  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =    -0.39436867680464 * H2x1_1  +    -0.20604911710368 * H2x1_2
          +     0.29458107927185 * H2x1_3  +     0.66102662477481 * H2x1_4
          +     0.62143406345506 * H2x1_5  +     2.63969484891539 * H2x1_6
          +     2.03785323055294 * H2x1_7 ;
   H3x1_2  =     0.14668618790671 * H2x1_1  +     0.53251535375334 * H2x1_2
          +     1.73802487245889 * H2x1_3  +    -0.48818058655944 * H2x1_4
          +     -0.6987810213409 * H2x1_5  +     1.61216865707221 * H2x1_6
          +     0.02086486846601 * H2x1_7 ;
   H3x1_3  =    -1.14054963328594 * H2x1_1  +    -0.75433574423253 * H2x1_2
          +     0.06268113862558 * H2x1_3  +     -0.3981826777811 * H2x1_4
          +    -0.04081627474016 * H2x1_5  +    -0.18547979458266 * H2x1_6
          +     0.40248247309716 * H2x1_7 ;
   H3x1_4  =    -0.41046431364634 * H2x1_1  +     0.53558649664528 * H2x1_2
          +     0.25426413492282 * H2x1_3  +     2.32537388539524 * H2x1_4
          +    -0.95624400041487 * H2x1_5  +     -2.1423043357326 * H2x1_6
          +     0.70189203885946 * H2x1_7 ;
   H3x1_5  =    -0.21139932639331 * H2x1_1  +      0.8853172209881 * H2x1_2
          +    -0.23025284278478 * H2x1_3  +     1.30433450594503 * H2x1_4
          +     1.26145590014333 * H2x1_5  +     0.63126627865104 * H2x1_6
          +    -1.88455429451452 * H2x1_7 ;
   H3x1_6  =     0.99645242104414 * H2x1_1  +    -0.17835964967148 * H2x1_2
          +     0.06539648561603 * H2x1_3  +     0.97412284078325 * H2x1_4
          +     -1.3247680635275 * H2x1_5  +      0.8723025918678 * H2x1_6
          +    -0.04328836172134 * H2x1_7 ;
   H3x1_7  =     2.66887548952929 * H2x1_1  +    -0.86289888310949 * H2x1_2
          +     1.58137421487648 * H2x1_3  +    -1.37105839507635 * H2x1_4
          +    -0.65069986041129 * H2x1_5  +     2.50322156288062 * H2x1_6
          +     0.75157328436087 * H2x1_7 ;
   H3x1_1  = H3x1_1  +     1.55317132694755 * H2x2_1
          +     1.75656976582641 * H2x2_2  +    -1.25361089552085 * H2x2_3
          +    -0.52984461837677 * H2x2_4  +     1.29915117873447 * H2x2_5
          +    -1.03942372926622 * H2x2_6  +     0.13722887717178 * H2x2_7 ;
   H3x1_2  = H3x1_2  +     0.88902418392614 * H2x2_1
          +     1.35198205638356 * H2x2_2  +     1.49845421410078 * H2x2_3
          +    -1.22318137674998 * H2x2_4  +     1.03485654068494 * H2x2_5
          +    -0.88760495649169 * H2x2_6  +    -1.94135868960024 * H2x2_7 ;
   H3x1_3  = H3x1_3  +     -0.5232166311723 * H2x2_1
          +    -0.49154441995792 * H2x2_2  +     1.21222773866672 * H2x2_3
          +     0.88954765096374 * H2x2_4  +     0.32666743913318 * H2x2_5
          +     1.26201705110892 * H2x2_6  +    -2.46564869578322 * H2x2_7 ;
   H3x1_4  = H3x1_4  +     0.93897688204524 * H2x2_1
          +    -0.56396325682963 * H2x2_2  +     0.60312223662348 * H2x2_3
          +     0.05506195666559 * H2x2_4  +    -1.19478701476792 * H2x2_5
          +     1.11111060864544 * H2x2_6  +     0.07602420470068 * H2x2_7 ;
   H3x1_5  = H3x1_5  +    -2.04067007195299 * H2x2_1
          +    -0.24511447740547 * H2x2_2  +      1.1403782608351 * H2x2_3
          +     0.28313253531571 * H2x2_4  +    -0.31001305293935 * H2x2_5
          +     1.43972694265244 * H2x2_6  +     0.27081966717726 * H2x2_7 ;
   H3x1_6  = H3x1_6  +     1.53918759970091 * H2x2_1
          +    -1.36834652818881 * H2x2_2  +    -0.97354088259421 * H2x2_3
          +     0.73052173697294 * H2x2_4  +     1.34716412811946 * H2x2_5
          +     1.66261041249676 * H2x2_6  +    -0.99719318696356 * H2x2_7 ;
   H3x1_7  = H3x1_7  +     1.11994694673604 * H2x2_1
          +     -1.6803356528873 * H2x2_2  +    -0.12962793678977 * H2x2_3
          +    -0.71896094589725 * H2x2_4  +     0.46037684620833 * H2x2_5
          +     0.25911483872618 * H2x2_6  +     1.00876479730932 * H2x2_7 ;
   H3x1_1  =     1.52228889950912 + H3x1_1 ;
   H3x1_2  =    -0.46625781761332 + H3x1_2 ;
   H3x1_3  =     0.11008388635615 + H3x1_3 ;
   H3x1_4  =    -0.38333236869719 + H3x1_4 ;
   H3x1_5  =    -1.36620648378402 + H3x1_5 ;
   H3x1_6  =     0.41780608126276 + H3x1_6 ;
   H3x1_7  =    -0.69490040783623 + H3x1_7 ;
   H3x1_1  = SIN(H3x1_1 );
   H3x1_2  = SIN(H3x1_2 );
   H3x1_3  = SIN(H3x1_3 );
   H3x1_4  = SIN(H3x1_4 );
   H3x1_5  = SIN(H3x1_5 );
   H3x1_6  = SIN(H3x1_6 );
   H3x1_7  = SIN(H3x1_7 );
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
   H3x1_3  = .;
   H3x1_4  = .;
   H3x1_5  = .;
   H3x1_6  = .;
   H3x1_7  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -2.07102874283902 * H3x1_1  +     2.04799607124649 * H3x1_2
          +    -0.05444449856749 * H3x1_3  +    -3.76440287030853 * H3x1_4
          +    -0.62776678498994 * H3x1_5  +    -1.00383135301243 * H3x1_6
          +     2.26027843968818 * H3x1_7 ;
   P_DepVar1  =     0.51137297979162 + P_DepVar1 ;
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
* Renaming variables for AutoNeural12;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural12;
*------------------------------------------------------------*;
drop AutoNeural12_P_DepVar1;
AutoNeural12_P_DepVar1 = P_DepVar1;
drop AutoNeural12_P_DepVar0;
AutoNeural12_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural12;
*------------------------------------------------------------*;
length AutoNeural12_WARN_ $4;
drop AutoNeural12_WARN_;
AutoNeural12_WARN_ = _WARN_;
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
* NODE: Meta;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural7;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

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
*** Writing the Node interval ;
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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.27051750628107 * S_AcceptedCmpTotal
          +    -0.01552488999587 * S_Age  +    -0.19918933236131 * S_Frq
          +    -0.18053367989037 * S_Income  +     0.17934470816975 *
        S_Kidhome  +    -0.27914859130186 * S_Mnt  +    -0.05331142159606 *
        S_MntFishProducts  +    -0.03730503814111 * S_MntFruits
          +     0.01217897476566 * S_MntGoldProds  +       0.241005967683 *
        S_MntMeatProducts  +    -0.02873172523867 * S_MntSweetProducts
          +    -0.35773732926132 * S_MntWines  +    -0.00800625524539 *
        S_MonthsAsCustomer  +     0.14253720708201 * S_NumCatalogPurchases
          +     0.09634439105648 * S_NumDealsPurchases
          +     -0.2727389064287 * S_NumDistPurchases
          +    -0.14179871978162 * S_NumStorePurchases
          +     0.11008049559527 * S_NumWebPurchases
          +    -0.16791463027749 * S_NumWebVisitsMonth
          +     0.12827091331546 * S_RFMstat  +    -0.05819422771336 *
        S_RMntFrq  +     0.17192522504917 * S_Recency
          +     0.13379709932247 * S_Teenhome ;
   H1x1_2  =      0.2625003002792 * S_AcceptedCmpTotal
          +    -0.00409648963127 * S_Age  +    -0.08422560024107 * S_Frq
          +      0.1678148652095 * S_Income  +      -0.122580580609 *
        S_Kidhome  +    -0.41368311141801 * S_Mnt  +     -0.0649787838725 *
        S_MntFishProducts  +    -0.06363287766971 * S_MntFruits
          +     0.00810850196464 * S_MntGoldProds  +      0.2984971941271 *
        S_MntMeatProducts  +     -0.0651075315757 * S_MntSweetProducts
          +    -0.42717799596572 * S_MntWines  +    -0.00945771129633 *
        S_MonthsAsCustomer  +     0.33346839008681 * S_NumCatalogPurchases
          +     0.15835936877168 * S_NumDealsPurchases
          +     0.04229992769587 * S_NumDistPurchases
          +    -0.04051362547639 * S_NumStorePurchases
          +    -0.01791546488406 * S_NumWebPurchases
          +     0.28833008597045 * S_NumWebVisitsMonth
          +     0.08007709098478 * S_RFMstat  +     0.37677948418886 *
        S_RMntFrq  +    -0.32542265112765 * S_Recency
          +    -0.10763248273834 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.17927888078386 * AcceptedCmp10
          +       0.309097592234 * AcceptedCmp20  +     0.30005706470617 *
        AcceptedCmp30  +     0.30534843193785 * AcceptedCmp40
          +     0.19575142296602 * AcceptedCmp50  +    -0.26930325741881 *
        Complain0  +    -0.07193220591551 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.01282806481889 * AcceptedCmp10
          +     0.01542710847454 * AcceptedCmp20  +     0.03576476827309 *
        AcceptedCmp30  +     0.04230610697529 * AcceptedCmp40
          +     0.03405078302469 * AcceptedCmp50  +     0.13002166919554 *
        Complain0  +    -0.08203696285033 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.04471063478028 * Education2n_Cycle
          +     0.15571809437849 * EducationBasic  +    -0.00113978624206 *
        EducationGraduation  +     0.00750750981266 * EducationMaster
          +     -0.0504367274898 * Marital_StatusDivorced
          +     0.28345714390306 * Marital_StatusMarried
          +     -0.2012923780435 * Marital_StatusSingle
          +     0.20022167903492 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.12691361812265 * Education2n_Cycle
          +       0.003205191831 * EducationBasic  +    -0.04323354449955 *
        EducationGraduation  +    -0.06699429239126 * EducationMaster
          +     0.06828937261262 * Marital_StatusDivorced
          +     -0.1520862543536 * Marital_StatusMarried
          +      0.1392808464716 * Marital_StatusSingle
          +    -0.12406922875482 * Marital_StatusTogether ;
   H1x1_1  =     0.89722634972069 + H1x1_1 ;
   H1x1_2  =     -0.5979471913364 + H1x1_2 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     -11.533020189097 * H1x1_1  +     17.2320065402955 * H1x1_2
         ;
   P_DepVar1  =     2.37722840752042 + P_DepVar1 ;
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
* Renaming variables for AutoNeural7;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural7;
*------------------------------------------------------------*;
drop AutoNeural7_P_DepVar1;
AutoNeural7_P_DepVar1 = P_DepVar1;
drop AutoNeural7_P_DepVar0;
AutoNeural7_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural7;
*------------------------------------------------------------*;
length AutoNeural7_WARN_ $4;
drop AutoNeural7_WARN_;
AutoNeural7_WARN_ = _WARN_;
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
* NODE: Meta;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural10;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

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
*** Writing the Node interval ;
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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     -2.0588471958351 * S_AcceptedCmpTotal
          +     0.38628980389456 * S_Age  +     -0.8545617733777 * S_Frq
          +    -1.37557200210661 * S_Income  +     1.58583945545125 *
        S_Kidhome  +    -1.49250871593186 * S_Mnt  +    -2.02986091068301 *
        S_MntFishProducts  +     0.28845511703412 * S_MntFruits
          +    -0.62495372005095 * S_MntGoldProds  +     3.22144698444712 *
        S_MntMeatProducts  +    -2.67158036653801 * S_MntSweetProducts
          +    -4.30837863985493 * S_MntWines  +     0.39603200162704 *
        S_MonthsAsCustomer  +      1.8259166147951 * S_NumCatalogPurchases
          +      3.4758215776031 * S_NumDealsPurchases
          +     0.17094021755289 * S_NumDistPurchases
          +    -2.72090095694641 * S_NumStorePurchases
          +    -0.31877935826328 * S_NumWebPurchases
          +    -2.03399974412918 * S_NumWebVisitsMonth
          +     2.74309130038659 * S_RFMstat  +    -0.74941844935268 *
        S_RMntFrq  +     0.29064555076615 * S_Recency
          +    -0.57040700827247 * S_Teenhome ;
   H1x1_2  =     -0.5995699177824 * S_AcceptedCmpTotal
          +    -1.17769485933608 * S_Age  +     0.95998296288295 * S_Frq
          +     -2.2343179478513 * S_Income  +     3.17436638275163 *
        S_Kidhome  +     0.46987648124346 * S_Mnt  +     0.07213935656698 *
        S_MntFishProducts  +    -1.38055808108069 * S_MntFruits
          +     0.62140960451545 * S_MntGoldProds  +     -1.9000500396873 *
        S_MntMeatProducts  +    -0.35707372583597 * S_MntSweetProducts
          +     1.99720917743483 * S_MntWines  +     0.89245096364062 *
        S_MonthsAsCustomer  +    -0.61497875715928 * S_NumCatalogPurchases
          +    -1.21013804197082 * S_NumDealsPurchases
          +     0.59974279122188 * S_NumDistPurchases
          +     1.92425710681156 * S_NumStorePurchases
          +     1.02413182452324 * S_NumWebPurchases
          +    -3.63276285340174 * S_NumWebVisitsMonth
          +     0.33919100670479 * S_RFMstat  +     0.84767315208026 *
        S_RMntFrq  +     3.87352563099005 * S_Recency
          +     2.74174964084917 * S_Teenhome ;
   H1x1_3  =    -2.27029708882419 * S_AcceptedCmpTotal
          +     0.57558817521081 * S_Age  +     0.03666022895146 * S_Frq
          +    -0.43764949843184 * S_Income  +     0.05202039236868 *
        S_Kidhome  +    -0.17515517773197 * S_Mnt  +      2.1454579331563 *
        S_MntFishProducts  +     -0.0544472234117 * S_MntFruits
          +    -0.24751372889101 * S_MntGoldProds  +    -7.95986512066472 *
        S_MntMeatProducts  +    -0.42258869313323 * S_MntSweetProducts
          +      4.6542173574208 * S_MntWines  +     0.27973663838423 *
        S_MonthsAsCustomer  +    -0.92923468464154 * S_NumCatalogPurchases
          +      0.4928343071801 * S_NumDealsPurchases
          +     -0.0196677325409 * S_NumDistPurchases
          +     0.44395828164873 * S_NumStorePurchases
          +     0.86947051591224 * S_NumWebPurchases
          +    -0.96787241206077 * S_NumWebVisitsMonth
          +     -0.9429396337834 * S_RFMstat  +    -1.69298966254302 *
        S_RMntFrq  +     0.24582117217188 * S_Recency
          +    -1.08471509540368 * S_Teenhome ;
   H1x1_4  =     0.54181596412096 * S_AcceptedCmpTotal
          +    -1.19331526818752 * S_Age  +     0.79853759822324 * S_Frq
          +     0.73370928178794 * S_Income  +     0.38661834479377 *
        S_Kidhome  +      0.3442876988888 * S_Mnt  +    -0.58769739655035 *
        S_MntFishProducts  +     -0.8703586573687 * S_MntFruits
          +    -0.06073044217122 * S_MntGoldProds  +     1.06031608775663 *
        S_MntMeatProducts  +      0.1600438561366 * S_MntSweetProducts
          +    -0.10937637342015 * S_MntWines  +     0.44423445817796 *
        S_MonthsAsCustomer  +     2.20653376632749 * S_NumCatalogPurchases
          +     1.10280977051932 * S_NumDealsPurchases
          +     0.99310057404036 * S_NumDistPurchases
          +    -0.05647459609331 * S_NumStorePurchases
          +    -0.89852483938631 * S_NumWebPurchases
          +     2.63022480227445 * S_NumWebVisitsMonth
          +      0.0081819695781 * S_RFMstat  +     1.19338523211724 *
        S_RMntFrq  +    -4.46436997560659 * S_Recency
          +    -2.03251171372039 * S_Teenhome ;
   H1x1_5  =    -1.03227948250072 * S_AcceptedCmpTotal
          +     0.25510562405413 * S_Age  +     0.11938172756061 * S_Frq
          +    -0.88855927472898 * S_Income  +    -0.98732962014399 *
        S_Kidhome  +     0.57537935682752 * S_Mnt  +     0.07702692666996 *
        S_MntFishProducts  +     0.69541223905843 * S_MntFruits
          +    -0.26720187465927 * S_MntGoldProds  +    -0.03938241662919 *
        S_MntMeatProducts  +     1.08781093588885 * S_MntSweetProducts
          +     1.16253823123182 * S_MntWines  +    -1.60607722651025 *
        S_MonthsAsCustomer  +    -1.69043794225498 * S_NumCatalogPurchases
          +    -2.62220616180571 * S_NumDealsPurchases
          +    -0.51737930835331 * S_NumDistPurchases
          +     0.88655783158133 * S_NumStorePurchases
          +     0.35132468809969 * S_NumWebPurchases
          +     -1.6320869675862 * S_NumWebVisitsMonth
          +     0.33776958473405 * S_RFMstat  +    -0.42290181425075 *
        S_RMntFrq  +     1.06226028677401 * S_Recency
          +     1.11855899514962 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.53637737817097 * AcceptedCmp10
          +    -1.85405146733588 * AcceptedCmp20  +    -1.47621046566649 *
        AcceptedCmp30  +    -1.37767318086242 * AcceptedCmp40
          +    -0.96348396070145 * AcceptedCmp50  +    -1.30976546088379 *
        Complain0  +    -0.54848314184314 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.18445380584184 * AcceptedCmp10
          +    -0.69257274561716 * AcceptedCmp20  +     0.17226038285159 *
        AcceptedCmp30  +    -1.06145995435722 * AcceptedCmp40
          +     1.23459262841144 * AcceptedCmp50  +    -0.14674063302587 *
        Complain0  +    -1.08422405648698 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.81272808689375 * AcceptedCmp10
          +    -0.37057950605918 * AcceptedCmp20  +    -1.75364708883985 *
        AcceptedCmp30  +     -1.9879502333289 * AcceptedCmp40
          +     2.82649108460951 * AcceptedCmp50  +    -0.14219031901768 *
        Complain0  +     -0.5514346363694 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -1.12354567881562 * AcceptedCmp10
          +    -1.64564861831306 * AcceptedCmp20  +    -1.84950171464501 *
        AcceptedCmp30  +    -2.60581164673686 * AcceptedCmp40
          +    -0.53568003317161 * AcceptedCmp50  +    -0.13929928866767 *
        Complain0  +     1.18053116626218 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +     -0.3006993305802 * AcceptedCmp10
          +    -0.67101949915278 * AcceptedCmp20  +     0.48950637221178 *
        AcceptedCmp30  +     0.25937105093078 * AcceptedCmp40
          +       0.650714225549 * AcceptedCmp50  +    -0.53543482850089 *
        Complain0  +     0.62014708316206 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.78710932360637 * Education2n_Cycle
          +    -0.34656604802235 * EducationBasic  +     0.11820082193221 *
        EducationGraduation  +     1.42539292513854 * EducationMaster
          +     0.34809919741136 * Marital_StatusDivorced
          +    -0.26594093535929 * Marital_StatusMarried
          +     0.70249715999987 * Marital_StatusSingle
          +    -0.45710525283449 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -1.00496261512915 * Education2n_Cycle
          +     0.66783492956492 * EducationBasic  +     0.91185122922538 *
        EducationGraduation  +    -0.28204692640004 * EducationMaster
          +    -0.20448765627193 * Marital_StatusDivorced
          +     1.73231344674733 * Marital_StatusMarried
          +    -0.70956480480373 * Marital_StatusSingle
          +      1.0926428215879 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.06222681334412 * Education2n_Cycle
          +    -0.00009122618999 * EducationBasic  +    -0.07444046529217 *
        EducationGraduation  +     1.01284161768787 * EducationMaster
          +     0.30333818684353 * Marital_StatusDivorced
          +    -1.44603535988199 * Marital_StatusMarried
          +     0.48409598426383 * Marital_StatusSingle
          +    -1.14528682521622 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.92316818310935 * Education2n_Cycle
          +     0.93590924020503 * EducationBasic  +     0.36762108040277 *
        EducationGraduation  +    -1.17735200022013 * EducationMaster
          +     -1.5342907846297 * Marital_StatusDivorced
          +    -1.79544684592172 * Marital_StatusMarried
          +     0.65604313645117 * Marital_StatusSingle
          +    -2.08172869142628 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.56328800945753 * Education2n_Cycle
          +    -0.06918346311418 * EducationBasic  +     -1.5176897786776 *
        EducationGraduation  +     0.09618331198762 * EducationMaster
          +    -3.97940893560267 * Marital_StatusDivorced
          +      3.5880254142663 * Marital_StatusMarried
          +     -2.9897737730927 * Marital_StatusSingle
          +     3.75098376776525 * Marital_StatusTogether ;
   H1x1_1  =    -2.89135496095875 + H1x1_1 ;
   H1x1_2  =     0.39943637099295 + H1x1_2 ;
   H1x1_3  =    -1.08093114818147 + H1x1_3 ;
   H1x1_4  =    -3.29426643182948 + H1x1_4 ;
   H1x1_5  =    -1.76822552726746 + H1x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     1.01981866144831 * S_AcceptedCmpTotal
          +    -1.47346125364319 * S_Age  +    -0.08669650492194 * S_Frq
          +    -0.51585471637562 * S_Income  +     1.40711190452923 *
        S_Kidhome  +    -0.21341957199148 * S_Mnt  +    -0.31211158173505 *
        S_MntFishProducts  +    -0.77126486046129 * S_MntFruits
          +     -0.4503905849175 * S_MntGoldProds  +     1.01090165857015 *
        S_MntMeatProducts  +    -0.05554268249583 * S_MntSweetProducts
          +     2.72203992871966 * S_MntWines  +    -0.46212144021719 *
        S_MonthsAsCustomer  +    -0.10495120677935 * S_NumCatalogPurchases
          +     0.07279889333775 * S_NumDealsPurchases
          +     0.07542203992452 * S_NumDistPurchases
          +     0.16296239303342 * S_NumStorePurchases
          +     1.59193921229231 * S_NumWebPurchases
          +    -0.35227839362603 * S_NumWebVisitsMonth
          +      1.3224105019117 * S_RFMstat  +    -0.77035988511057 *
        S_RMntFrq  +     0.43315770276588 * S_Recency
          +     0.43447147039235 * S_Teenhome ;
   H1x2_2  =    -0.07629675162821 * S_AcceptedCmpTotal
          +     0.81684969971216 * S_Age  +     0.52870818801428 * S_Frq
          +     0.15358022485378 * S_Income  +    -0.64458879887927 *
        S_Kidhome  +    -2.12225648421746 * S_Mnt  +     1.05240671673302 *
        S_MntFishProducts  +    -0.89595336397918 * S_MntFruits
          +    -0.28950558043577 * S_MntGoldProds  +     0.30996043499478 *
        S_MntMeatProducts  +     1.27676485470274 * S_MntSweetProducts
          +    -1.30045112439384 * S_MntWines  +     1.36110971826862 *
        S_MonthsAsCustomer  +     -0.1778244163518 * S_NumCatalogPurchases
          +    -0.37456959251084 * S_NumDealsPurchases
          +    -1.15252469975668 * S_NumDistPurchases
          +    -1.39822501888899 * S_NumStorePurchases
          +    -0.32777847360723 * S_NumWebPurchases
          +     0.84026499832926 * S_NumWebVisitsMonth
          +    -1.47180193258497 * S_RFMstat  +     0.18801983980439 *
        S_RMntFrq  +     1.21016626691186 * S_Recency
          +    -0.82943594788748 * S_Teenhome ;
   H1x2_3  =    -0.06736000283511 * S_AcceptedCmpTotal
          +    -0.47270148030219 * S_Age  +      1.1959707178877 * S_Frq
          +    -1.40081626653738 * S_Income  +     0.35085595025526 *
        S_Kidhome  +    -0.43652344252181 * S_Mnt  +     1.12197802721591 *
        S_MntFishProducts  +     1.27079634537799 * S_MntFruits
          +    -0.03023683680758 * S_MntGoldProds  +     0.51289568088141 *
        S_MntMeatProducts  +     1.12894900622408 * S_MntSweetProducts
          +    -0.66940205871871 * S_MntWines  +    -1.57211003055303 *
        S_MonthsAsCustomer  +     1.47778465205569 * S_NumCatalogPurchases
          +     1.14090099538367 * S_NumDealsPurchases
          +     -0.2600155774492 * S_NumDistPurchases
          +     1.31362002392113 * S_NumStorePurchases
          +     1.31465307763555 * S_NumWebPurchases
          +    -0.18041623858351 * S_NumWebVisitsMonth
          +    -0.12685084546738 * S_RFMstat  +     0.43500462904027 *
        S_RMntFrq  +    -0.81910738140729 * S_Recency
          +    -0.61936793661609 * S_Teenhome ;
   H1x2_4  =    -0.31415783692162 * S_AcceptedCmpTotal
          +     0.11061423227332 * S_Age  +    -0.65722939551233 * S_Frq
          +     -0.9063192568986 * S_Income  +      0.4013752851291 *
        S_Kidhome  +    -1.06795963585271 * S_Mnt  +     0.24969441019479 *
        S_MntFishProducts  +    -0.63550038240549 * S_MntFruits
          +     1.04454010114015 * S_MntGoldProds  +     0.89912571026653 *
        S_MntMeatProducts  +    -1.92356868621234 * S_MntSweetProducts
          +     -1.8642245725538 * S_MntWines  +     0.13416556054779 *
        S_MonthsAsCustomer  +    -1.01272407075887 * S_NumCatalogPurchases
          +     1.06486073796679 * S_NumDealsPurchases
          +    -0.04890191247577 * S_NumDistPurchases
          +     0.86871320720698 * S_NumStorePurchases
          +     0.03183587281884 * S_NumWebPurchases
          +     -0.4863802923315 * S_NumWebVisitsMonth
          +    -1.38034657666878 * S_RFMstat  +    -0.73640242597195 *
        S_RMntFrq  +     0.17186861211542 * S_Recency
          +    -0.39595339111048 * S_Teenhome ;
   H1x2_5  =     1.68315669988315 * S_AcceptedCmpTotal
          +    -1.67467335764173 * S_Age  +     1.29921539173109 * S_Frq
          +    -0.52305600367899 * S_Income  +     1.06261291858944 *
        S_Kidhome  +     1.77049882170904 * S_Mnt  +    -0.27692609509601 *
        S_MntFishProducts  +    -1.23166107817727 * S_MntFruits
          +    -2.21476398466362 * S_MntGoldProds  +     1.02542528622621 *
        S_MntMeatProducts  +     1.04913114036094 * S_MntSweetProducts
          +     0.30606520702636 * S_MntWines  +    -1.15158074964406 *
        S_MonthsAsCustomer  +     0.77918810586275 * S_NumCatalogPurchases
          +    -0.01160267590349 * S_NumDealsPurchases
          +    -0.92773075463083 * S_NumDistPurchases
          +    -0.83326680533995 * S_NumStorePurchases
          +    -1.16991058954473 * S_NumWebPurchases
          +    -2.07771165573723 * S_NumWebVisitsMonth
          +     0.59832456826177 * S_RFMstat  +     0.08151078945291 *
        S_RMntFrq  +     0.80165981122986 * S_Recency
          +     1.41798811088435 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.16600737981926 * AcceptedCmp10
          +     1.41264623988567 * AcceptedCmp20  +      1.0446306999234 *
        AcceptedCmp30  +    -1.00688604631169 * AcceptedCmp40
          +     0.64523782235527 * AcceptedCmp50  +    -1.76623980391232 *
        Complain0  +     1.64644530449125 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -0.39493094663506 * AcceptedCmp10
          +    -0.99095404154277 * AcceptedCmp20  +    -0.81166937096774 *
        AcceptedCmp30  +     0.14520361414777 * AcceptedCmp40
          +    -1.54302055254785 * AcceptedCmp50  +    -0.60600550413714 *
        Complain0  +    -3.04730224174859 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +      1.8650016934441 * AcceptedCmp10
          +     0.85335394099291 * AcceptedCmp20  +     0.47327521312159 *
        AcceptedCmp30  +    -2.64862753506152 * AcceptedCmp40
          +     0.65827168680229 * AcceptedCmp50  +     0.45516433167059 *
        Complain0  +    -0.62891111222764 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +    -0.31781332022679 * AcceptedCmp10
          +    -0.35773084257089 * AcceptedCmp20  +      0.0486072265688 *
        AcceptedCmp30  +     1.50494203860483 * AcceptedCmp40
          +     0.00499691981651 * AcceptedCmp50  +    -0.29977032190776 *
        Complain0  +     0.76473087756218 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     -0.4639041544815 * AcceptedCmp10
          +    -1.28977231764453 * AcceptedCmp20  +    -0.03597660273531 *
        AcceptedCmp30  +     0.17848986397338 * AcceptedCmp40
          +     0.06649914015182 * AcceptedCmp50  +    -0.95633404051563 *
        Complain0  +    -0.62555630659121 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -1.75926153465974 * Education2n_Cycle
          +     0.96255168005018 * EducationBasic  +     -1.2029563052774 *
        EducationGraduation  +    -0.22397098444024 * EducationMaster
          +    -0.10361472385198 * Marital_StatusDivorced
          +     0.05574820877885 * Marital_StatusMarried
          +     0.13130988205279 * Marital_StatusSingle
          +    -1.51165564425323 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     1.73281005101474 * Education2n_Cycle
          +    -0.51397811328576 * EducationBasic  +     1.64296402934617 *
        EducationGraduation  +     1.44983505587452 * EducationMaster
          +      0.0059353523794 * Marital_StatusDivorced
          +    -0.59379435051653 * Marital_StatusMarried
          +    -1.93587108708999 * Marital_StatusSingle
          +     2.02868236823401 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.11852280587389 * Education2n_Cycle
          +    -0.87963137637159 * EducationBasic  +      0.3212539101977 *
        EducationGraduation  +     0.16497026569775 * EducationMaster
          +    -0.74333797840386 * Marital_StatusDivorced
          +    -0.93061135117658 * Marital_StatusMarried
          +     1.04024182655844 * Marital_StatusSingle
          +     0.58313569749679 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     -1.2170050337036 * Education2n_Cycle
          +    -0.83332588435502 * EducationBasic  +     0.43242117148542 *
        EducationGraduation  +     1.71196178631559 * EducationMaster
          +    -3.01050675344463 * Marital_StatusDivorced
          +      0.1638723582239 * Marital_StatusMarried
          +     0.94548468360304 * Marital_StatusSingle
          +    -0.67333048623615 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +    -0.66774344191467 * Education2n_Cycle
          +     0.75591270317285 * EducationBasic  +    -0.29337325355435 *
        EducationGraduation  +     0.57450456442662 * EducationMaster
          +    -1.37013926274158 * Marital_StatusDivorced
          +    -0.34168970042779 * Marital_StatusMarried
          +     0.63383683543962 * Marital_StatusSingle
          +     0.75118887766443 * Marital_StatusTogether ;
   H1x2_1  =    -1.05245414685459 + H1x2_1 ;
   H1x2_2  =    -2.03581716915326 + H1x2_2 ;
   H1x2_3  =    -0.95118365599668 + H1x2_3 ;
   H1x2_4  =    -1.36171328515396 + H1x2_4 ;
   H1x2_5  =    -0.09438724866767 + H1x2_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
   H1x2_5  = 1.0 / (1.0 + EXP(MIN( - H1x2_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -3.66869890196477 * H1x1_1  +     3.66276995899936 * H1x1_2
          +      4.9852243803889 * H1x1_3  +    -3.40922134517979 * H1x1_4
          +     2.26435924995065 * H1x1_5 ;
   H2x1_2  =     1.35296027814603 * H1x1_1  +     0.16236277762099 * H1x1_2
          +      0.4094634018093 * H1x1_3  +    -1.05233334297087 * H1x1_4
          +    -0.51735435825901 * H1x1_5 ;
   H2x1_3  =    -3.57467050540101 * H1x1_1  +     1.96738498758928 * H1x1_2
          +      3.1519435691133 * H1x1_3  +    -2.73180541318793 * H1x1_4
          +     2.53621803266955 * H1x1_5 ;
   H2x1_4  =    -1.77897865469649 * H1x1_1  +    -0.34371813002239 * H1x1_2
          +     0.97655076671381 * H1x1_3  +    -0.53022688394362 * H1x1_4
          +     1.78452647837415 * H1x1_5 ;
   H2x1_5  =    -2.37976522756638 * H1x1_1  +     2.07473947277607 * H1x1_2
          +      3.6114905073808 * H1x1_3  +    -4.57668209905758 * H1x1_4
          +     2.97931581645784 * H1x1_5 ;
   H2x1_1  = H2x1_1  +      0.5090021095213 * H1x2_1
          +    -0.99996599039586 * H1x2_2  +     0.09317756017156 * H1x2_3
          +     0.07646136890595 * H1x2_4  +    -0.86729455140311 * H1x2_5 ;
   H2x1_2  = H2x1_2  +     0.54458122713319 * H1x2_1
          +    -1.01527351866283 * H1x2_2  +    -1.05264779960249 * H1x2_3
          +     2.00891057398994 * H1x2_4  +     0.23877185330348 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     0.45936122831356 * H1x2_1
          +    -0.78158455560098 * H1x2_2  +    -0.93755507764598 * H1x2_3
          +    -0.41290092050446 * H1x2_4  +    -1.08076286104858 * H1x2_5 ;
   H2x1_4  = H2x1_4  +     0.95365620475779 * H1x2_1
          +    -0.84100294393078 * H1x2_2  +     0.70463413466954 * H1x2_3
          +     1.80542761219637 * H1x2_4  +     0.45881360213194 * H1x2_5 ;
   H2x1_5  = H2x1_5  +     0.59629215620441 * H1x2_1
          +    -0.66300910076078 * H1x2_2  +     0.53748646350811 * H1x2_3
          +     0.40402787748621 * H1x2_4  +    -0.68066387330661 * H1x2_5 ;
   H2x1_1  =    -1.36901208947371 + H2x1_1 ;
   H2x1_2  =     1.02513270875023 + H2x1_2 ;
   H2x1_3  =     0.21017025934674 + H2x1_3 ;
   H2x1_4  =    -1.15214364807652 + H2x1_4 ;
   H2x1_5  =    -1.32590257108023 + H2x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -9.23664553457504 * H2x1_1  +     1.34611690798114 * H2x1_2
          +    -6.67077102946651 * H2x1_3  +    -1.67245227685142 * H2x1_4
          +    -7.67053346287177 * H2x1_5 ;
   P_DepVar1  =      3.4145227149582 + P_DepVar1 ;
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
* Renaming variables for AutoNeural10;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural10;
*------------------------------------------------------------*;
drop AutoNeural10_P_DepVar1;
AutoNeural10_P_DepVar1 = P_DepVar1;
drop AutoNeural10_P_DepVar0;
AutoNeural10_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural10;
*------------------------------------------------------------*;
length AutoNeural10_WARN_ $4;
drop AutoNeural10_WARN_;
AutoNeural10_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl45;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl45: Average Posteriors of 5 models;
*------------------------------------------------------------*;
P_DepVar1 = (
AutoNeural9_P_DepVar1 +
AutoNeural11_P_DepVar1 +
AutoNeural12_P_DepVar1 +
AutoNeural7_P_DepVar1 +
AutoNeural10_P_DepVar1
)/5;
P_DepVar0 = (
AutoNeural9_P_DepVar0 +
AutoNeural11_P_DepVar0 +
AutoNeural12_P_DepVar0 +
AutoNeural7_P_DepVar0 +
AutoNeural10_P_DepVar0
)/5;
*------------------------------------------------------------*;
* Ensmbl45: Computing Classification Vars;
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
* Ensmbl45: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl45: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL9_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL9_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL9_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL9_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL11_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL11_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL11_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL11_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL12_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL12_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL12_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL12_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL10_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL10_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL10_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL10_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
