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
* NODE: AutoNeural6;
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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =    -0.00800383076247 * S_AcceptedCmpTotal
          +     0.02761302021586 * S_Age  +     0.10595191274027 * S_Frq
          +    -0.15720275096991 * S_Income  +     0.14522420813528 *
        S_Kidhome  +    -0.14485367197729 * S_Mnt  +     0.10029542464177 *
        S_MntFishProducts  +      0.0126489883955 * S_MntFruits
          +    -0.01721251339827 * S_MntGoldProds  +    -0.69008250574088 *
        S_MntMeatProducts  +     0.01018204164797 * S_MntSweetProducts
          +     0.22039448854688 * S_MntWines  +     0.01531819489128 *
        S_MonthsAsCustomer  +    -0.23161250514854 * S_NumCatalogPurchases
          +    -0.20127545393212 * S_NumDealsPurchases
          +     0.04506333103933 * S_NumDistPurchases
          +     0.35249458492371 * S_NumStorePurchases
          +     0.25004284340707 * S_NumWebPurchases
          +    -0.53727251220752 * S_NumWebVisitsMonth
          +    -0.05439428653958 * S_RFMstat  +     0.36751560031492 *
        S_RMntFrq  +      0.5373510847225 * S_Recency
          +     0.08757258535387 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.21204360154837 * AcceptedCmp10
          +     0.20766091429217 * AcceptedCmp20  +     0.20201307074488 *
        AcceptedCmp30  +     0.26898383850722 * AcceptedCmp40
          +     0.55154220854739 * AcceptedCmp50  +     0.13147328871299 *
        Complain0  +    -0.02797177954188 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.00959805163736 * Education2n_Cycle
          +     0.37192717803938 * EducationBasic  +    -0.10342362068485 *
        EducationGraduation  +    -0.13377682721092 * EducationMaster
          +    -0.19452359839974 * Marital_StatusDivorced
          +     0.32327870805716 * Marital_StatusMarried
          +    -0.20770545592268 * Marital_StatusSingle
          +     0.35618773017298 * Marital_StatusTogether ;
   H1x1_1  =     0.87012150629431 + H1x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = EXP(MIN(-0.5 * H1x1_1 **2, _EXP_BAR));
END;
ELSE DO;
   H1x1_1  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.92357456692651 * S_AcceptedCmpTotal
          +    -0.00516549264504 * S_Age  +    -1.03043789382359 * S_Frq
          +     0.78555631441048 * S_Income  +    -1.36329797235747 *
        S_Kidhome  +    -0.77229288487872 * S_Mnt  +     1.27281095482218 *
        S_MntFishProducts  +     0.04568599055132 * S_MntFruits
          +    -0.13434867195633 * S_MntGoldProds  +    -1.95682488683295 *
        S_MntMeatProducts  +     -0.0253141337078 * S_MntSweetProducts
          +     0.67857436596482 * S_MntWines  +    -0.07247572940845 *
        S_MonthsAsCustomer  +    -1.02814758425435 * S_NumCatalogPurchases
          +    -0.02120959778153 * S_NumDealsPurchases
          +     1.49013956394863 * S_NumDistPurchases
          +    -0.96806240220463 * S_NumStorePurchases
          +    -1.68330472453558 * S_NumWebPurchases
          +     3.42976128164256 * S_NumWebVisitsMonth
          +    -0.38912520446503 * S_RFMstat  +    -2.57487899031042 *
        S_RMntFrq  +    -3.14923215912621 * S_Recency
          +    -0.67635091810974 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.18835638765595 * AcceptedCmp10
          +     1.28752081945681 * AcceptedCmp20  +     -0.5515893923669 *
        AcceptedCmp30  +    -0.82440763600043 * AcceptedCmp40
          +     1.94503109075872 * AcceptedCmp50  +    -0.75977722298402 *
        Complain0  +    -1.11349075129464 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     1.79843117215153 * Education2n_Cycle
          +    -1.50428649925314 * EducationBasic  +    -0.32238897768725 *
        EducationGraduation  +    -0.16909007224958 * EducationMaster
          +      1.9815992681602 * Marital_StatusDivorced
          +    -3.07893181570848 * Marital_StatusMarried
          +     1.72965298244219 * Marital_StatusSingle
          +    -3.17208781997524 * Marital_StatusTogether ;
   H1x2_1  =     0.54729406730223 + H1x2_1 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x2_1  < _REC_EPS AND H1x2_1  > - _REC_EPS THEN
   H1x2_1  = H1x2_1  * H1x2_1 ;
   ELSE H1x2_1  = _REC_EPS ;
END;
ELSE DO;
   H1x2_1  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.90092602642364 * S_AcceptedCmpTotal
          +    -0.16291307307626 * S_Age  +    -0.40132431666712 * S_Frq
          +    -0.77251140598484 * S_Income  +     0.02215214313934 *
        S_Kidhome  +     0.13123074182657 * S_Mnt  +    -0.43664076061176 *
        S_MntFishProducts  +    -1.64192761266072 * S_MntFruits
          +    -1.54189230184745 * S_MntGoldProds  +     -0.4138869968665 *
        S_MntMeatProducts  +      0.5773885392047 * S_MntSweetProducts
          +     1.45077769194851 * S_MntWines  +      0.5855746168529 *
        S_MonthsAsCustomer  +     0.10198319985004 * S_NumCatalogPurchases
          +     -0.5334151509863 * S_NumDealsPurchases
          +     0.40600458912114 * S_NumDistPurchases
          +    -0.30674653528261 * S_NumStorePurchases
          +     0.10785037433743 * S_NumWebPurchases
          +     0.99701680073452 * S_NumWebVisitsMonth
          +    -0.25371895811899 * S_RFMstat  +     2.19406614746442 *
        S_RMntFrq  +      1.0786726340694 * S_Recency
          +     0.64406049150007 * S_Teenhome ;
   H1x3_1  = H1x3_1  +    -0.58424742605644 * AcceptedCmp10
          +     -0.7436165858459 * AcceptedCmp20  +    -0.33959137246457 *
        AcceptedCmp30  +     0.42726020731333 * AcceptedCmp40
          +     2.23707409189181 * AcceptedCmp50  +     0.98135772482722 *
        Complain0  +    -0.85818399669867 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +    -0.89540752048995 * Education2n_Cycle
          +     1.29513448243349 * EducationBasic  +    -1.47068621785539 *
        EducationGraduation  +    -1.63362973413899 * EducationMaster
          +    -0.72494401881341 * Marital_StatusDivorced
          +    -0.82332231639631 * Marital_StatusMarried
          +     -0.8863559011195 * Marital_StatusSingle
          +     0.97129982315045 * Marital_StatusTogether ;
   H1x3_1  =     0.55234573720932 + H1x3_1 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x3_1  < _REC_EPS AND H1x3_1  > - _REC_EPS THEN
   H1x3_1  = H1x3_1  * H1x3_1 ;
   ELSE H1x3_1  = _REC_EPS ;
END;
ELSE DO;
   H1x3_1  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     35.4482526843154 * H1x1_1 ;
   P_DepVar1  = P_DepVar1  +    -0.08810161142704 * H1x2_1 ;
   P_DepVar1  = P_DepVar1  +     0.02248060710303 * H1x3_1 ;
   P_DepVar1  =    -6.23004657634651 + P_DepVar1 ;
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
H1x1_1
H1x2_1
H1x3_1
;
drop S_:;
* Renaming variables for AutoNeural6;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural6;
*------------------------------------------------------------*;
drop AutoNeural6_P_DepVar1;
AutoNeural6_P_DepVar1 = P_DepVar1;
drop AutoNeural6_P_DepVar0;
AutoNeural6_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural6;
*------------------------------------------------------------*;
length AutoNeural6_I_DepVar $32;
drop AutoNeural6_I_DepVar;
AutoNeural6_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural6;
*------------------------------------------------------------*;
length AutoNeural6_WARN_ $4;
drop AutoNeural6_WARN_;
AutoNeural6_WARN_ = _WARN_;
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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =     0.26454269681311 * S_AcceptedCmpTotal
          +    -0.01281904987956 * S_Age  +    -0.19309516267581 * S_Frq
          +    -0.19077579202378 * S_Income  +      0.1806651018562 *
        S_Kidhome  +    -0.31002612826472 * S_Mnt  +    -0.05901796512011 *
        S_MntFishProducts  +    -0.03760930101165 * S_MntFruits
          +     0.01720900715043 * S_MntGoldProds  +     0.21472292961422 *
        S_MntMeatProducts  +    -0.02880706568684 * S_MntSweetProducts
          +    -0.37993583170844 * S_MntWines  +    -0.00848444156361 *
        S_MonthsAsCustomer  +     0.15939611818942 * S_NumCatalogPurchases
          +     0.08390531145773 * S_NumDealsPurchases
          +    -0.29505970645775 * S_NumDistPurchases
          +    -0.13820571170194 * S_NumStorePurchases
          +     0.11468011313368 * S_NumWebPurchases
          +    -0.18421241371843 * S_NumWebVisitsMonth
          +     0.11564064971509 * S_RFMstat  +    -0.02223928001432 *
        S_RMntFrq  +     0.18022777532589 * S_Recency
          +     0.14654831145379 * S_Teenhome ;
   H1x1_2  =     0.27055972468014 * S_AcceptedCmpTotal
          +      0.0025862891193 * S_Age  +    -0.07147307366817 * S_Frq
          +      0.1883776136263 * S_Income  +    -0.12712510891181 *
        S_Kidhome  +    -0.42099927948686 * S_Mnt  +    -0.07047631817862 *
        S_MntFishProducts  +    -0.06658475152878 * S_MntFruits
          +     0.01943025682869 * S_MntGoldProds  +     0.29481794109465 *
        S_MntMeatProducts  +    -0.06573502094591 * S_MntSweetProducts
          +    -0.46266722725002 * S_MntWines  +    -0.00472333181469 *
        S_MonthsAsCustomer  +     0.35081452017576 * S_NumCatalogPurchases
          +     0.18009076035363 * S_NumDealsPurchases
          +     0.03853861006587 * S_NumDistPurchases
          +    -0.05118063952874 * S_NumStorePurchases
          +    -0.03282286120473 * S_NumWebPurchases
          +     0.31160900419026 * S_NumWebVisitsMonth
          +     0.08027884378429 * S_RFMstat  +     0.39057239541393 *
        S_RMntFrq  +    -0.34796767111274 * S_Recency
          +    -0.12099758522271 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.12539246465239 * AcceptedCmp10
          +     0.38473652869745 * AcceptedCmp20  +     0.29820983391886 *
        AcceptedCmp30  +     0.29085092779792 * AcceptedCmp40
          +     0.18918195914981 * AcceptedCmp50  +    -0.26812516781697 *
        Complain0  +    -0.08804110897148 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.02312897825565 * AcceptedCmp10
          +     0.03909481703523 * AcceptedCmp20  +     0.02531081539721 *
        AcceptedCmp30  +     0.03109641300151 * AcceptedCmp40
          +     0.01985718189621 * AcceptedCmp50  +     0.13425456375085 *
        Complain0  +    -0.08222486590117 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.01975862863669 * Education2n_Cycle
          +     0.14654730697956 * EducationBasic  +    -0.00459515646452 *
        EducationGraduation  +     0.01586948449127 * EducationMaster
          +    -0.04750981393889 * Marital_StatusDivorced
          +     0.28216925676677 * Marital_StatusMarried
          +    -0.20757827413964 * Marital_StatusSingle
          +     0.22622509024122 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.12009608969049 * Education2n_Cycle
          +     0.01793460710056 * EducationBasic  +    -0.04257710051346 *
        EducationGraduation  +    -0.06975725710115 * EducationMaster
          +     0.05981919620577 * Marital_StatusDivorced
          +    -0.17161573846062 * Marital_StatusMarried
          +     0.15869440681091 * Marital_StatusSingle
          +    -0.13282372850158 * Marital_StatusTogether ;
   H1x1_1  =     0.87962277715971 + H1x1_1 ;
   H1x1_2  =    -0.62570339696782 + H1x1_2 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =      0.1719390672121 * S_AcceptedCmpTotal
          +     0.23586839288361 * S_Age  +    -1.85384134180372 * S_Frq
          +    -0.43561758063577 * S_Income  +     -2.5581498901473 *
        S_Kidhome  +      1.7031888248428 * S_Mnt  +     0.84982621124736 *
        S_MntFishProducts  +     0.25990173458485 * S_MntFruits
          +    -2.80730469703961 * S_MntGoldProds  +     0.64923500711702 *
        S_MntMeatProducts  +     0.27458645458502 * S_MntSweetProducts
          +    -0.47723589182372 * S_MntWines  +    -0.66777488145507 *
        S_MonthsAsCustomer  +    -0.46364414558282 * S_NumCatalogPurchases
          +     0.00741910846933 * S_NumDealsPurchases
          +       1.334289252268 * S_NumDistPurchases
          +    -0.29851567180932 * S_NumStorePurchases
          +    -0.52115313259666 * S_NumWebPurchases
          +     0.93907168501909 * S_NumWebVisitsMonth
          +    -0.26126881318451 * S_RFMstat  +     -1.3003763542929 *
        S_RMntFrq  +    -0.12807368149309 * S_Recency
          +    -0.21296116974623 * S_Teenhome ;
   H1x2_2  =     0.30897763700303 * S_AcceptedCmpTotal
          +    -0.77727886396317 * S_Age  +    -0.79298582494973 * S_Frq
          +    -1.73199353738093 * S_Income  +     1.12984956989288 *
        S_Kidhome  +    -1.36701096993984 * S_Mnt  +    -0.21063950702424 *
        S_MntFishProducts  +    -0.20027336686257 * S_MntFruits
          +    -0.06955810418489 * S_MntGoldProds  +     0.16672767423533 *
        S_MntMeatProducts  +    -1.56675269740541 * S_MntSweetProducts
          +     1.85366479127485 * S_MntWines  +    -0.58178621903094 *
        S_MonthsAsCustomer  +     1.31024619253935 * S_NumCatalogPurchases
          +     1.60427001186844 * S_NumDealsPurchases
          +    -0.18447618033353 * S_NumDistPurchases
          +    -1.29966073003539 * S_NumStorePurchases
          +    -1.12373457341536 * S_NumWebPurchases
          +     1.46099221440494 * S_NumWebVisitsMonth
          +     0.17795038564406 * S_RFMstat  +    -0.82372068140832 *
        S_RMntFrq  +      0.4480370534729 * S_Recency
          +     0.19272737691538 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     -0.6569942252053 * AcceptedCmp10
          +    -0.89152555599538 * AcceptedCmp20  +     1.00488730476017 *
        AcceptedCmp30  +     0.34286042692068 * AcceptedCmp40
          +    -1.19198820362508 * AcceptedCmp50  +    -0.86571531914686 *
        Complain0  +     0.14303136037365 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.79481763784518 * AcceptedCmp10
          +    -2.85912280013336 * AcceptedCmp20  +     0.16890012708431 *
        AcceptedCmp30  +     0.94639083182751 * AcceptedCmp40
          +    -0.62141828005946 * AcceptedCmp50  +    -0.39098882491277 *
        Complain0  +     0.85700787946581 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +      0.0737054452993 * Education2n_Cycle
          +       0.362372261752 * EducationBasic  +      -1.485941295677 *
        EducationGraduation  +    -0.81257694655594 * EducationMaster
          +     0.59819559998538 * Marital_StatusDivorced
          +     0.92957772553633 * Marital_StatusMarried
          +    -1.11796266958894 * Marital_StatusSingle
          +     -2.0576132087002 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -1.10016528859962 * Education2n_Cycle
          +    -1.46816646165468 * EducationBasic  +    -0.11241499152788 *
        EducationGraduation  +    -0.65110715251273 * EducationMaster
          +      1.0870909562212 * Marital_StatusDivorced
          +     1.50333961797515 * Marital_StatusMarried
          +    -1.41407780765932 * Marital_StatusSingle
          +    -0.52528072358697 * Marital_StatusTogether ;
   H1x2_1  =     1.46376024534028 + H1x2_1 ;
   H1x2_2  =    -0.21341526379366 + H1x2_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = EXP(MIN(-0.5 * H1x2_1 **2, _EXP_BAR));
   H1x2_2  = EXP(MIN(-0.5 * H1x2_2 **2, _EXP_BAR));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.29299707972123 * S_AcceptedCmpTotal
          +     1.39797329466471 * S_Age  +    -2.02673480388837 * S_Frq
          +    -1.09682777516542 * S_Income  +    -1.22241109888643 *
        S_Kidhome  +    -1.35766076466324 * S_Mnt  +    -2.90812690982576 *
        S_MntFishProducts  +    -0.48174923069843 * S_MntFruits
          +     1.57335575145195 * S_MntGoldProds  +    -0.55248873552176 *
        S_MntMeatProducts  +     0.54536808091745 * S_MntSweetProducts
          +    -0.41516162035296 * S_MntWines  +     0.07715050596116 *
        S_MonthsAsCustomer  +    -2.18785324142159 * S_NumCatalogPurchases
          +     -1.1174504455343 * S_NumDealsPurchases
          +    -0.18561253113498 * S_NumDistPurchases
          +    -0.35231054612792 * S_NumStorePurchases
          +      0.9249490354172 * S_NumWebPurchases
          +    -0.79868535147175 * S_NumWebVisitsMonth
          +    -0.17158151681124 * S_RFMstat  +     -0.9870286843901 *
        S_RMntFrq  +     0.62439123699986 * S_Recency
          +    -0.45845377794308 * S_Teenhome ;
   H1x3_2  =    -1.07483179793421 * S_AcceptedCmpTotal
          +     1.03558600048684 * S_Age  +     1.11497695424161 * S_Frq
          +     0.27297296926116 * S_Income  +     0.77036019999023 *
        S_Kidhome  +     0.02567848304605 * S_Mnt  +     0.38661977628442 *
        S_MntFishProducts  +    -0.36751750771945 * S_MntFruits
          +     0.93924107558212 * S_MntGoldProds  +     0.93046859422523 *
        S_MntMeatProducts  +    -0.46124679979068 * S_MntSweetProducts
          +    -0.45348234529786 * S_MntWines  +     1.60057890623864 *
        S_MonthsAsCustomer  +    -1.74657448073162 * S_NumCatalogPurchases
          +     1.05434863590054 * S_NumDealsPurchases
          +    -0.73255174632068 * S_NumDistPurchases
          +     0.53949953455044 * S_NumStorePurchases
          +    -0.61709467816649 * S_NumWebPurchases
          +     1.36235282484348 * S_NumWebVisitsMonth
          +     -0.0352720913953 * S_RFMstat  +     0.14001475375682 *
        S_RMntFrq  +    -0.24276831608869 * S_Recency
          +     0.09762798365722 * S_Teenhome ;
   H1x3_1  = H1x3_1  +    -0.94208577947628 * AcceptedCmp10
          +     -0.5233017415423 * AcceptedCmp20  +    -0.76900164563331 *
        AcceptedCmp30  +    -0.79512141055877 * AcceptedCmp40
          +     0.20126599116957 * AcceptedCmp50  +    -0.43046555689873 *
        Complain0  +     0.31565229685815 * HigherEducationBinary0 ;
   H1x3_2  = H1x3_2  +    -1.24961064002454 * AcceptedCmp10
          +    -0.89859693224833 * AcceptedCmp20  +     1.15884958881232 *
        AcceptedCmp30  +     0.38250389164472 * AcceptedCmp40
          +     0.47123004358879 * AcceptedCmp50  +     -2.1232679844098 *
        Complain0  +     0.97226091069674 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +    -0.07500306665919 * Education2n_Cycle
          +     0.04122924311058 * EducationBasic  +    -0.49410102102951 *
        EducationGraduation  +    -0.45477734340809 * EducationMaster
          +     0.22253248036322 * Marital_StatusDivorced
          +    -1.72455332745001 * Marital_StatusMarried
          +     0.57787272107232 * Marital_StatusSingle
          +     0.16267074825086 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +    -0.21560233542581 * Education2n_Cycle
          +    -0.36476815429069 * EducationBasic  +     1.63334881201349 *
        EducationGraduation  +    -1.12620982139344 * EducationMaster
          +     0.14637124403046 * Marital_StatusDivorced
          +     0.18905186437528 * Marital_StatusMarried
          +     0.00511958458521 * Marital_StatusSingle
          +      -0.915980703129 * Marital_StatusTogether ;
   H1x3_1  =     0.54853846322055 + H1x3_1 ;
   H1x3_2  =     1.36395858099198 + H1x3_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = EXP(MIN(H1x3_1 , _EXP_BAR));
   H1x3_2  = EXP(MIN(H1x3_2 , _EXP_BAR));
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -10.6892993503201 * H1x1_1  +     16.2938756734008 * H1x1_2
         ;
   P_DepVar1  = P_DepVar1  +      1.2332183930826 * H1x2_1
          +    -0.85206858106106 * H1x2_2 ;
   P_DepVar1  = P_DepVar1  +    -0.00087126688031 * H1x3_1
          +    -0.00025812675645 * H1x3_2 ;
   P_DepVar1  =     2.20710379818135 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x2_1
H1x2_2
H1x3_1
H1x3_2
;
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
* Renaming Into variables for AutoNeural7;
*------------------------------------------------------------*;
length AutoNeural7_I_DepVar $32;
drop AutoNeural7_I_DepVar;
AutoNeural7_I_DepVar = I_DepVar;
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
* NODE: AutoNeural8;
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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =      1.2726802048269 * S_AcceptedCmpTotal
          +    -0.02889982967357 * S_Age  +    -0.26165770909003 * S_Frq
          +     0.19140564299867 * S_Income  +     0.30244335152969 *
        S_Kidhome  +    -0.03391217967468 * S_Mnt  +    -0.99943007809307 *
        S_MntFishProducts  +    -0.04374917285968 * S_MntFruits
          +    -0.13546758294455 * S_MntGoldProds  +     3.59922243619013 *
        S_MntMeatProducts  +    -0.10424531322566 * S_MntSweetProducts
          +    -1.98884071414703 * S_MntWines  +     0.05310540691138 *
        S_MonthsAsCustomer  +     0.58072892654416 * S_NumCatalogPurchases
          +     0.30381426454211 * S_NumDealsPurchases
          +     0.39966076372974 * S_NumDistPurchases
          +    -0.58875986801139 * S_NumStorePurchases
          +    -0.78850031558536 * S_NumWebPurchases
          +     0.35182997415921 * S_NumWebVisitsMonth
          +     1.51048129701176 * S_RFMstat  +     1.13354085492775 *
        S_RMntFrq  +     -0.2185811652116 * S_Recency
          +     0.01153374704027 * S_Teenhome ;
   H1x1_2  =     0.18093166280015 * S_AcceptedCmpTotal
          +    -0.00677564787839 * S_Age  +    -0.21510325598577 * S_Frq
          +     0.26314356814214 * S_Income  +    -0.30016454601651 *
        S_Kidhome  +     -0.1410547608427 * S_Mnt  +    -0.04272369939478 *
        S_MntFishProducts  +    -0.05622578678457 * S_MntFruits
          +     0.04457230545618 * S_MntGoldProds  +     0.40709024692944 *
        S_MntMeatProducts  +    -0.02989090770621 * S_MntSweetProducts
          +    -0.18818656503765 * S_MntWines  +    -0.06237311646922 *
        S_MonthsAsCustomer  +     0.39737856936198 * S_NumCatalogPurchases
          +     0.33734772994048 * S_NumDealsPurchases
          +     0.06152222921422 * S_NumDistPurchases
          +    -0.32068333792942 * S_NumStorePurchases
          +    -0.26971366415104 * S_NumWebPurchases
          +     0.57693239481071 * S_NumWebVisitsMonth
          +     0.01161324864777 * S_RFMstat  +     0.00311083015445 *
        S_RMntFrq  +    -0.67669007299893 * S_Recency
          +     -0.2298426154616 * S_Teenhome ;
   H1x1_3  =    -0.09356212420726 * S_AcceptedCmpTotal
          +    -0.01904617704654 * S_Age  +    -0.15700206132472 * S_Frq
          +    -0.58483226627076 * S_Income  +     0.30001673574917 *
        S_Kidhome  +    -0.19921492301896 * S_Mnt  +    -0.00125986769238 *
        S_MntFishProducts  +     0.10195959942937 * S_MntFruits
          +      0.0069592628978 * S_MntGoldProds  +     0.03606436199308 *
        S_MntMeatProducts  +     0.11259135359155 * S_MntSweetProducts
          +     0.05408818612126 * S_MntWines  +    -0.14024859528104 *
        S_MonthsAsCustomer  +    -0.14071929240584 * S_NumCatalogPurchases
          +     0.22142792900578 * S_NumDealsPurchases
          +     -0.0291983445755 * S_NumDistPurchases
          +     -0.1997372957954 * S_NumStorePurchases
          +    -0.01286201468794 * S_NumWebPurchases
          +    -0.35208468552742 * S_NumWebVisitsMonth
          +     0.02982651364231 * S_RFMstat  +      0.0228316921695 *
        S_RMntFrq  +      0.3930877517629 * S_Recency
          +     0.28989829670594 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.03659432989123 * AcceptedCmp10
          +    -0.12552546530316 * AcceptedCmp20  +     0.57200428680255 *
        AcceptedCmp30  +      0.4327465126256 * AcceptedCmp40
          +    -1.24484170256212 * AcceptedCmp50  +     0.21604379838869 *
        Complain0  +    -0.14986629245585 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.13542589174402 * AcceptedCmp10
          +    -0.19116289400292 * AcceptedCmp20  +    -0.10302282473135 *
        AcceptedCmp30  +    -0.08705955845916 * AcceptedCmp40
          +    -0.17435407626698 * AcceptedCmp50  +    -0.09781790399225 *
        Complain0  +     0.02006296587353 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.08917557424765 * AcceptedCmp10
          +    -0.00944366858806 * AcceptedCmp20  +     0.30527409248576 *
        AcceptedCmp30  +     0.26823019920335 * AcceptedCmp40
          +    -0.02131660897576 * AcceptedCmp50  +    -0.16243659451446 *
        Complain0  +    -0.28227689084686 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.12998959528304 * Education2n_Cycle
          +     0.48334684246109 * EducationBasic  +    -0.07156918649895 *
        EducationGraduation  +    -0.21017720550072 * EducationMaster
          +    -0.22358326722482 * Marital_StatusDivorced
          +     0.09394210085787 * Marital_StatusMarried
          +    -0.10381546554982 * Marital_StatusSingle
          +     0.05935260608375 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.02955854298839 * Education2n_Cycle
          +    -0.13472200519398 * EducationBasic  +     0.01930622297518 *
        EducationGraduation  +    -0.00188262361226 * EducationMaster
          +     0.16606212232833 * Marital_StatusDivorced
          +    -0.33252488631677 * Marital_StatusMarried
          +     0.26735237322144 * Marital_StatusSingle
          +    -0.37056611493683 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.29085314695378 * Education2n_Cycle
          +     -0.2177077392676 * EducationBasic  +    -0.12975750226767 *
        EducationGraduation  +     0.12920694427876 * EducationMaster
          +    -0.30275479651076 * Marital_StatusDivorced
          +     0.50273719874035 * Marital_StatusMarried
          +    -0.39588303956293 * Marital_StatusSingle
          +     0.42028863850572 * Marital_StatusTogether ;
   H1x1_1  =     1.91295924572895 + H1x1_1 ;
   H1x1_2  =    -1.21245226681055 + H1x1_2 ;
   H1x1_3  =    -0.01609140135594 + H1x1_3 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = EXP(MIN(-0.5 * H1x1_1 **2, _EXP_BAR));
   H1x1_2  = EXP(MIN(-0.5 * H1x1_2 **2, _EXP_BAR));
   H1x1_3  = EXP(MIN(-0.5 * H1x1_3 **2, _EXP_BAR));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.73632716677259 * S_AcceptedCmpTotal
          +     -1.3452480925823 * S_Age  +    -0.77564767519981 * S_Frq
          +    -0.06163854052357 * S_Income  +     1.82428003860444 *
        S_Kidhome  +       0.661412748756 * S_Mnt  +      1.8826488743919 *
        S_MntFishProducts  +    -0.21815276926728 * S_MntFruits
          +     1.06597641654862 * S_MntGoldProds  +     0.13887400045643 *
        S_MntMeatProducts  +    -0.62827157985225 * S_MntSweetProducts
          +     1.70742231056065 * S_MntWines  +     0.52403167020638 *
        S_MonthsAsCustomer  +    -2.99889150929209 * S_NumCatalogPurchases
          +    -2.59470529821377 * S_NumDealsPurchases
          +      0.7668756449818 * S_NumDistPurchases
          +     0.61064641547208 * S_NumStorePurchases
          +    -0.87106335660846 * S_NumWebPurchases
          +      0.1188879348197 * S_NumWebVisitsMonth
          +     0.89319669432194 * S_RFMstat  +       -0.45272285967 *
        S_RMntFrq  +     -0.7210740986075 * S_Recency
          +      0.7032117485114 * S_Teenhome ;
   H1x2_2  =      0.5405970783297 * S_AcceptedCmpTotal
          +     0.34103648596436 * S_Age  +    -1.00413619660059 * S_Frq
          +     0.40958797602392 * S_Income  +    -0.94731216445533 *
        S_Kidhome  +    -0.17755265939769 * S_Mnt  +    -0.88926202859892 *
        S_MntFishProducts  +      0.6791087530674 * S_MntFruits
          +     1.10836805118307 * S_MntGoldProds  +    -0.29462180872033 *
        S_MntMeatProducts  +     2.21935054370304 * S_MntSweetProducts
          +     1.41379847080743 * S_MntWines  +    -0.66077297246309 *
        S_MonthsAsCustomer  +     0.91491641336561 * S_NumCatalogPurchases
          +    -0.41834528691349 * S_NumDealsPurchases
          +    -0.07802605490227 * S_NumDistPurchases
          +    -0.62261476153139 * S_NumStorePurchases
          +    -0.84011953180231 * S_NumWebPurchases
          +     0.95169092183885 * S_NumWebVisitsMonth
          +      0.4036735448902 * S_RFMstat  +     0.44620057959954 *
        S_RMntFrq  +    -0.54980566705324 * S_Recency
          +    -0.48914926560129 * S_Teenhome ;
   H1x2_3  =    -0.10056833202616 * S_AcceptedCmpTotal
          +    -3.35021911955911 * S_Age  +    -0.47433508394475 * S_Frq
          +      0.2642483252057 * S_Income  +     0.20666167536737 *
        S_Kidhome  +    -1.63711887449192 * S_Mnt  +    -0.02078521278323 *
        S_MntFishProducts  +    -0.13356020799092 * S_MntFruits
          +     0.03199170913357 * S_MntGoldProds  +     0.35859745927921 *
        S_MntMeatProducts  +     1.28933517907056 * S_MntSweetProducts
          +    -0.45266889039243 * S_MntWines  +    -0.03980312418999 *
        S_MonthsAsCustomer  +     0.11407065408619 * S_NumCatalogPurchases
          +     1.50811278700924 * S_NumDealsPurchases
          +    -0.40025710583484 * S_NumDistPurchases
          +     0.16539197954198 * S_NumStorePurchases
          +    -1.50803186935431 * S_NumWebPurchases
          +    -0.35788712697704 * S_NumWebVisitsMonth
          +    -2.06761773527847 * S_RFMstat  +    -0.00353259675109 *
        S_RMntFrq  +      0.4364156603095 * S_Recency
          +    -0.44689366494665 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     1.19862785990255 * AcceptedCmp10
          +    -0.56777088839338 * AcceptedCmp20  +    -0.20982687937883 *
        AcceptedCmp30  +     0.23051157512105 * AcceptedCmp40
          +    -1.16625535461103 * AcceptedCmp50  +    -0.03987377830172 *
        Complain0  +    -1.17553145310278 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -1.37553391657098 * AcceptedCmp10
          +    -0.49489986415129 * AcceptedCmp20  +     0.84075258232812 *
        AcceptedCmp30  +     0.31883526052436 * AcceptedCmp40
          +    -0.41245383847025 * AcceptedCmp50  +     0.75603245683628 *
        Complain0  +    -2.07732119239317 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     0.94876862525586 * AcceptedCmp10
          +     0.79245605062261 * AcceptedCmp20  +     1.18614024465163 *
        AcceptedCmp30  +    -0.24348380736895 * AcceptedCmp40
          +     0.63374252730038 * AcceptedCmp50  +     0.36777527794452 *
        Complain0  +    -0.07746344015306 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     1.73012058377195 * Education2n_Cycle
          +     2.12295803973544 * EducationBasic  +     0.36945596974292 *
        EducationGraduation  +    -1.22675967760612 * EducationMaster
          +    -0.48199299977856 * Marital_StatusDivorced
          +    -1.61546983135535 * Marital_StatusMarried
          +     1.25890289649165 * Marital_StatusSingle
          +    -0.35805098686637 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -1.04319773106255 * Education2n_Cycle
          +    -1.20017517243416 * EducationBasic  +    -0.21851017334559 *
        EducationGraduation  +     0.54918303984069 * EducationMaster
          +    -0.69719138781358 * Marital_StatusDivorced
          +     0.26964883367384 * Marital_StatusMarried
          +      0.4656663467381 * Marital_StatusSingle
          +    -0.38324848670979 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.26572249637491 * Education2n_Cycle
          +     1.36865822272368 * EducationBasic  +     0.26769702437041 *
        EducationGraduation  +    -0.57748542336591 * EducationMaster
          +     1.40407968804704 * Marital_StatusDivorced
          +    -1.35468203106214 * Marital_StatusMarried
          +      1.0644996414042 * Marital_StatusSingle
          +    -0.68198832748724 * Marital_StatusTogether ;
   H1x2_1  =     1.72650566457008 + H1x2_1 ;
   H1x2_2  =     -1.0113179577999 + H1x2_2 ;
   H1x2_3  =     0.14003924400021 + H1x2_3 ;
   H1x2_1  = SIN(H1x2_1 );
   H1x2_2  = SIN(H1x2_2 );
   H1x2_3  = SIN(H1x2_3 );
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -7.62079794803554 * H1x1_1  +     13.7007341613959 * H1x1_2
          +    -6.77882452096978 * H1x1_3 ;
   P_DepVar1  = P_DepVar1  +    -0.44850093089338 * H1x2_1
          +    -1.24228597291063 * H1x2_2  +     1.00075465600952 * H1x2_3 ;
   P_DepVar1  =    -2.26198805619545 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x2_1
H1x2_2
H1x2_3
;
drop S_:;
* Renaming variables for AutoNeural8;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural8;
*------------------------------------------------------------*;
drop AutoNeural8_P_DepVar1;
AutoNeural8_P_DepVar1 = P_DepVar1;
drop AutoNeural8_P_DepVar0;
AutoNeural8_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural8;
*------------------------------------------------------------*;
length AutoNeural8_I_DepVar $32;
drop AutoNeural8_I_DepVar;
AutoNeural8_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural8;
*------------------------------------------------------------*;
length AutoNeural8_WARN_ $4;
drop AutoNeural8_WARN_;
AutoNeural8_WARN_ = _WARN_;
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

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =     -1.5235159368138 * S_AcceptedCmpTotal
          +     0.13941271308016 * S_Age  +    -0.84765157270503 * S_Frq
          +    -0.89386555046676 * S_Income  +     1.62709236629244 *
        S_Kidhome  +    -1.21416429819342 * S_Mnt  +    -1.95640488965637 *
        S_MntFishProducts  +    -0.08621024993404 * S_MntFruits
          +    -0.38536990009586 * S_MntGoldProds  +     3.12553097304637 *
        S_MntMeatProducts  +    -2.50680711036653 * S_MntSweetProducts
          +    -3.77770073626477 * S_MntWines  +     0.39118206604766 *
        S_MonthsAsCustomer  +     1.80485993754239 * S_NumCatalogPurchases
          +     3.21215425524619 * S_NumDealsPurchases
          +     0.08695198777156 * S_NumDistPurchases
          +    -2.58697971128295 * S_NumStorePurchases
          +    -0.44431924796059 * S_NumWebPurchases
          +     -1.4492698984921 * S_NumWebVisitsMonth
          +     2.16652214648037 * S_RFMstat  +    -0.48027961131639 *
        S_RMntFrq  +    -0.27206877070748 * S_Recency
          +    -0.34774852853763 * S_Teenhome ;
   H1x1_2  =     -0.5665707820209 * S_AcceptedCmpTotal
          +    -1.33582859121223 * S_Age  +     0.90483024742522 * S_Frq
          +    -2.00588558815165 * S_Income  +      3.0373198083895 *
        S_Kidhome  +      0.4356905004225 * S_Mnt  +     0.19619626354366 *
        S_MntFishProducts  +    -1.09111340184132 * S_MntFruits
          +     0.36844676336289 * S_MntGoldProds  +    -2.23832561375429 *
        S_MntMeatProducts  +    -0.18280081530069 * S_MntSweetProducts
          +     2.11599309139107 * S_MntWines  +     0.68147940490709 *
        S_MonthsAsCustomer  +    -0.73940648599397 * S_NumCatalogPurchases
          +    -0.83844506398484 * S_NumDealsPurchases
          +     0.60831936516804 * S_NumDistPurchases
          +     1.79084087761626 * S_NumStorePurchases
          +     1.17119196356453 * S_NumWebPurchases
          +    -3.63586683518718 * S_NumWebVisitsMonth
          +     0.60521990735996 * S_RFMstat  +     0.56036381019221 *
        S_RMntFrq  +     3.84599118896159 * S_Recency
          +     2.42091939246471 * S_Teenhome ;
   H1x1_3  =    -2.34864034635966 * S_AcceptedCmpTotal
          +     0.38417502023066 * S_Age  +     0.18241442054661 * S_Frq
          +    -0.36643054878492 * S_Income  +    -0.01464967964014 *
        S_Kidhome  +     0.13084033882631 * S_Mnt  +     1.43066752801424 *
        S_MntFishProducts  +     0.30678881611098 * S_MntFruits
          +    -0.35038082288662 * S_MntGoldProds  +    -6.79650673935808 *
        S_MntMeatProducts  +    -0.35154740308081 * S_MntSweetProducts
          +     4.53406963590593 * S_MntWines  +     0.35082802515055 *
        S_MonthsAsCustomer  +    -1.62489937965567 * S_NumCatalogPurchases
          +    -0.31484031572628 * S_NumDealsPurchases
          +    -0.18273941035679 * S_NumDistPurchases
          +     0.99501789733882 * S_NumStorePurchases
          +     1.32014078829379 * S_NumWebPurchases
          +    -1.34393498450215 * S_NumWebVisitsMonth
          +    -0.93549119966022 * S_RFMstat  +    -1.74825390192193 *
        S_RMntFrq  +     0.84406941726743 * S_Recency
          +     -0.5004540381333 * S_Teenhome ;
   H1x1_4  =     0.46772023050431 * S_AcceptedCmpTotal
          +    -0.64609651992636 * S_Age  +     0.65433283816167 * S_Frq
          +     0.97922442633265 * S_Income  +    -0.37705204232056 *
        S_Kidhome  +     0.00937752600299 * S_Mnt  +     -0.6082843846013 *
        S_MntFishProducts  +     -0.6227107898918 * S_MntFruits
          +      0.0291421224006 * S_MntGoldProds  +     1.09748402313736 *
        S_MntMeatProducts  +     0.00604619863622 * S_MntSweetProducts
          +    -0.74684537570529 * S_MntWines  +    -0.00266569003481 *
        S_MonthsAsCustomer  +     2.01081657735872 * S_NumCatalogPurchases
          +     1.19658719134196 * S_NumDealsPurchases
          +     0.87478204472986 * S_NumDistPurchases
          +    -0.20635856288784 * S_NumStorePurchases
          +    -0.89927356974242 * S_NumWebPurchases
          +     2.92285244132576 * S_NumWebVisitsMonth
          +    -0.10913907245142 * S_RFMstat  +     1.64233441899256 *
        S_RMntFrq  +    -3.64945971202322 * S_Recency
          +    -1.78841346993558 * S_Teenhome ;
   H1x1_5  =    -1.22491918863941 * S_AcceptedCmpTotal
          +     0.16201659993217 * S_Age  +     0.17189537824457 * S_Frq
          +    -0.87922900323563 * S_Income  +    -0.79268410231108 *
        S_Kidhome  +     0.62793961676074 * S_Mnt  +     0.20877761882787 *
        S_MntFishProducts  +     0.99367872286661 * S_MntFruits
          +     -0.4347564565882 * S_MntGoldProds  +    -0.16203279329295 *
        S_MntMeatProducts  +     0.81409215344356 * S_MntSweetProducts
          +     1.33482971563984 * S_MntWines  +    -1.17441882196058 *
        S_MonthsAsCustomer  +    -1.72330829533107 * S_NumCatalogPurchases
          +       -2.32617124568 * S_NumDealsPurchases
          +    -0.56589187730672 * S_NumDistPurchases
          +     1.07062299863482 * S_NumStorePurchases
          +     0.30077273739578 * S_NumWebPurchases
          +    -1.67745421915317 * S_NumWebVisitsMonth
          +      0.0530074713265 * S_RFMstat  +    -0.55969729655382 *
        S_RMntFrq  +     1.32196704233234 * S_Recency
          +     1.05470622089613 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.19875423759582 * AcceptedCmp10
          +    -1.84163905120352 * AcceptedCmp20  +    -1.63149345314696 *
        AcceptedCmp30  +    -1.52652349127913 * AcceptedCmp40
          +    -0.97663634905647 * AcceptedCmp50  +    -0.94352222509088 *
        Complain0  +    -0.63297203617355 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +      0.0505791781839 * AcceptedCmp10
          +    -0.19407965320143 * AcceptedCmp20  +     0.35537657271506 *
        AcceptedCmp30  +    -0.84577216347728 * AcceptedCmp40
          +     1.73085566880686 * AcceptedCmp50  +     0.05800586053869 *
        Complain0  +    -0.62505561129469 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.54825581966403 * AcceptedCmp10
          +     -0.0966204838125 * AcceptedCmp20  +    -1.31707923763053 *
        AcceptedCmp30  +    -1.21021077486757 * AcceptedCmp40
          +     3.29102250037389 * AcceptedCmp50  +    -0.16383687725206 *
        Complain0  +     0.00651446514934 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -1.18573650260336 * AcceptedCmp10
          +    -1.73968979068234 * AcceptedCmp20  +    -1.31277698137778 *
        AcceptedCmp30  +    -1.74346538593922 * AcceptedCmp40
          +    -0.72543919818299 * AcceptedCmp50  +    -0.06328353200384 *
        Complain0  +     0.74828735398796 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.19622185523754 * AcceptedCmp10
          +     -0.4643498903813 * AcceptedCmp20  +     0.69293644934542 *
        AcceptedCmp30  +     0.23077838801355 * AcceptedCmp40
          +     0.53061813608476 * AcceptedCmp50  +    -0.56870999936869 *
        Complain0  +      0.5917990310858 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     1.01422000032629 * Education2n_Cycle
          +    -0.77619298826287 * EducationBasic  +     0.35633748974614 *
        EducationGraduation  +     0.98491516107588 * EducationMaster
          +    -0.27797737429678 * Marital_StatusDivorced
          +    -0.08137635862327 * Marital_StatusMarried
          +     0.06275411820495 * Marital_StatusSingle
          +    -0.19979743343415 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.66224206017124 * Education2n_Cycle
          +     0.80729589186486 * EducationBasic  +     0.75931615755998 *
        EducationGraduation  +    -0.05470462753112 * EducationMaster
          +     0.05151426841441 * Marital_StatusDivorced
          +     1.19165082030442 * Marital_StatusMarried
          +    -1.08257080662611 * Marital_StatusSingle
          +     0.13534863375625 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.20065577451105 * Education2n_Cycle
          +    -0.14205714608311 * EducationBasic  +    -0.07077711368393 *
        EducationGraduation  +     0.40262329710793 * EducationMaster
          +      0.0238206459022 * Marital_StatusDivorced
          +     -0.4653244204261 * Marital_StatusMarried
          +     0.13051613619882 * Marital_StatusSingle
          +    -0.35951366919755 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     -0.8555672630555 * Education2n_Cycle
          +     0.58439980233621 * EducationBasic  +     0.04784356342853 *
        EducationGraduation  +    -0.79764992264249 * EducationMaster
          +     -0.7449356409222 * Marital_StatusDivorced
          +    -1.46604673521535 * Marital_StatusMarried
          +     0.74484771688818 * Marital_StatusSingle
          +    -1.91273009779071 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.45561096683674 * Education2n_Cycle
          +    -0.08389156101858 * EducationBasic  +    -1.24281299616343 *
        EducationGraduation  +    -0.00999807517226 * EducationMaster
          +    -3.68044980584423 * Marital_StatusDivorced
          +     3.14587407902338 * Marital_StatusMarried
          +    -2.66118132753024 * Marital_StatusSingle
          +     3.50991640149914 * Marital_StatusTogether ;
   H1x1_1  =    -2.87464368543529 + H1x1_1 ;
   H1x1_2  =     0.69745433976458 + H1x1_2 ;
   H1x1_3  =    -0.71895677211617 + H1x1_3 ;
   H1x1_4  =    -3.07619671976178 + H1x1_4 ;
   H1x1_5  =    -1.74345318000473 + H1x1_5 ;
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
   H1x2_1  =     0.02206354442682 * S_AcceptedCmpTotal
          +    -1.34753268833642 * S_Age  +    -2.08377331969695 * S_Frq
          +    -1.39854535380539 * S_Income  +     2.13620611759545 *
        S_Kidhome  +    -1.50515365217324 * S_Mnt  +     0.85499321862984 *
        S_MntFishProducts  +    -1.17732452790345 * S_MntFruits
          +     1.52355640622249 * S_MntGoldProds  +     1.31854239360457 *
        S_MntMeatProducts  +    -0.03265851293389 * S_MntSweetProducts
          +     2.18666242847435 * S_MntWines  +     0.08246249957908 *
        S_MonthsAsCustomer  +    -1.06901902236609 * S_NumCatalogPurchases
          +     0.89261880438741 * S_NumDealsPurchases
          +    -1.61647413199892 * S_NumDistPurchases
          +    -0.56304669045195 * S_NumStorePurchases
          +      0.7766837080945 * S_NumWebPurchases
          +     -2.2953497398902 * S_NumWebVisitsMonth
          +    -3.34547809243199 * S_RFMstat  +     0.07311937799261 *
        S_RMntFrq  +     -0.5786489917247 * S_Recency
          +    -1.06532056361117 * S_Teenhome ;
   H1x2_2  =      0.0341880757331 * S_AcceptedCmpTotal
          +     0.72034771315738 * S_Age  +     0.64155966340389 * S_Frq
          +    -1.06570008729492 * S_Income  +    -1.84532938869849 *
        S_Kidhome  +     0.94433555965982 * S_Mnt  +     1.23831916074831 *
        S_MntFishProducts  +     1.33415870886475 * S_MntFruits
          +    -0.51253922893993 * S_MntGoldProds  +     0.02241594009025 *
        S_MntMeatProducts  +     -1.2811169586741 * S_MntSweetProducts
          +     1.96686773881953 * S_MntWines  +     1.44655944802715 *
        S_MonthsAsCustomer  +    -1.18627316384798 * S_NumCatalogPurchases
          +     1.02431289724643 * S_NumDealsPurchases
          +    -0.90960173637405 * S_NumDistPurchases
          +     1.24283490404772 * S_NumStorePurchases
          +     1.23072413154592 * S_NumWebPurchases
          +    -0.21533378473931 * S_NumWebVisitsMonth
          +     1.26438704884008 * S_RFMstat  +      0.0014042871018 *
        S_RMntFrq  +     0.32357651423135 * S_Recency
          +    -0.49834512433407 * S_Teenhome ;
   H1x2_3  =    -0.57066024275015 * S_AcceptedCmpTotal
          +     0.16615358153136 * S_Age  +    -0.60017461612499 * S_Frq
          +    -0.21195793925019 * S_Income  +    -0.36049126996499 *
        S_Kidhome  +     0.97458542661118 * S_Mnt  +     0.62279162661518 *
        S_MntFishProducts  +    -0.44715765367363 * S_MntFruits
          +     0.91519163455361 * S_MntGoldProds  +     1.07312113398768 *
        S_MntMeatProducts  +    -1.61967017526055 * S_MntSweetProducts
          +    -1.88327677412185 * S_MntWines  +    -1.67067768979245 *
        S_MonthsAsCustomer  +    -0.64725516463464 * S_NumCatalogPurchases
          +    -0.26249596122198 * S_NumDealsPurchases
          +    -0.63328519804758 * S_NumDistPurchases
          +    -0.88467503575886 * S_NumStorePurchases
          +    -0.83120537310738 * S_NumWebPurchases
          +     1.40072282351719 * S_NumWebVisitsMonth
          +     1.42591300760984 * S_RFMstat  +     1.93593865100837 *
        S_RMntFrq  +     -1.2794275536508 * S_Recency
          +    -0.78582664529339 * S_Teenhome ;
   H1x2_4  =     0.70159995537759 * S_AcceptedCmpTotal
          +    -0.70199351793792 * S_Age  +     1.63573967285806 * S_Frq
          +     -0.1930098634567 * S_Income  +    -0.43173926207337 *
        S_Kidhome  +    -0.45239271926178 * S_Mnt  +    -0.14139816383874 *
        S_MntFishProducts  +    -0.70568635660703 * S_MntFruits
          +     1.68796268038024 * S_MntGoldProds  +     0.80481626355934 *
        S_MntMeatProducts  +     0.29831384975096 * S_MntSweetProducts
          +    -0.50792336172825 * S_MntWines  +     0.80425149159678 *
        S_MonthsAsCustomer  +    -2.26171302044375 * S_NumCatalogPurchases
          +     1.30167361451945 * S_NumDealsPurchases
          +     1.45457613716235 * S_NumDistPurchases
          +    -0.40226463685252 * S_NumStorePurchases
          +     0.36369161683572 * S_NumWebPurchases
          +    -2.65684851610403 * S_NumWebVisitsMonth
          +    -1.14810413235545 * S_RFMstat  +       1.291857215261 *
        S_RMntFrq  +     1.36572595403825 * S_Recency
          +    -0.54958418574963 * S_Teenhome ;
   H1x2_5  =    -1.00456225444665 * S_AcceptedCmpTotal
          +     0.19033874303798 * S_Age  +    -0.62578451616415 * S_Frq
          +    -0.96647190269426 * S_Income  +     1.77002676974464 *
        S_Kidhome  +    -0.53816249322166 * S_Mnt  +     0.21322270253871 *
        S_MntFishProducts  +     0.84210241961105 * S_MntFruits
          +     0.44153678515007 * S_MntGoldProds  +    -0.23120999196747 *
        S_MntMeatProducts  +     0.62950730283125 * S_MntSweetProducts
          +    -0.64043011108056 * S_MntWines  +    -2.74922907599662 *
        S_MonthsAsCustomer  +     0.67939322758717 * S_NumCatalogPurchases
          +    -0.54572162665338 * S_NumDealsPurchases
          +      0.9607390449318 * S_NumDistPurchases
          +    -0.03259470545754 * S_NumStorePurchases
          +     0.19202241423412 * S_NumWebPurchases
          +     0.61085831658456 * S_NumWebVisitsMonth
          +    -0.08582160429243 * S_RFMstat  +     1.73862452808565 *
        S_RMntFrq  +    -0.01216476188714 * S_Recency
          +     -0.3304403270473 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     0.83453601566539 * AcceptedCmp10
          +     0.59109136511077 * AcceptedCmp20  +     -0.9669340701943 *
        AcceptedCmp30  +    -2.31468262956126 * AcceptedCmp40
          +    -0.76277791850069 * AcceptedCmp50  +     0.30895289981412 *
        Complain0  +       0.147233855837 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     0.42789425545567 * AcceptedCmp10
          +     0.08505833889085 * AcceptedCmp20  +    -1.15112188313855 *
        AcceptedCmp30  +    -1.24362486486214 * AcceptedCmp40
          +     0.04131419116048 * AcceptedCmp50  +    -0.45255799355317 *
        Complain0  +    -0.32616423192953 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +    -0.03136360497649 * AcceptedCmp10
          +     0.33867713207886 * AcceptedCmp20  +     0.05809342990544 *
        AcceptedCmp30  +    -0.06416815079894 * AcceptedCmp40
          +     1.14617960682421 * AcceptedCmp50  +    -0.82461320336041 *
        Complain0  +     0.58944444655621 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +    -1.12705500616438 * AcceptedCmp10
          +      0.0487863004734 * AcceptedCmp20  +     1.30229008593765 *
        AcceptedCmp30  +      0.1726718549662 * AcceptedCmp40
          +     0.68443569845295 * AcceptedCmp50  +     2.39733248962228 *
        Complain0  +      -0.620937291929 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     1.42400460803453 * AcceptedCmp10
          +    -1.22361480936625 * AcceptedCmp20  +     1.31090186367202 *
        AcceptedCmp30  +    -1.40343404818254 * AcceptedCmp40
          +    -0.57377230862494 * AcceptedCmp50  +     0.58622740778295 *
        Complain0  +    -0.83222074319962 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +     1.56508379719546 * Education2n_Cycle
          +     0.52302987210661 * EducationBasic  +     -0.0570045326497 *
        EducationGraduation  +    -0.01838790774804 * EducationMaster
          +    -2.32430245081383 * Marital_StatusDivorced
          +    -0.09815511356796 * Marital_StatusMarried
          +     0.13075504294551 * Marital_StatusSingle
          +     -0.0278875765201 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -0.85592920992847 * Education2n_Cycle
          +     0.93272618259957 * EducationBasic  +     0.48987674771079 *
        EducationGraduation  +    -1.12454002820451 * EducationMaster
          +    -0.65574603869224 * Marital_StatusDivorced
          +     1.54672472575294 * Marital_StatusMarried
          +    -1.59817602340208 * Marital_StatusSingle
          +     1.94381954546813 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.37093371596523 * Education2n_Cycle
          +    -2.05531065359129 * EducationBasic  +     1.16090743585078 *
        EducationGraduation  +     0.87547303889444 * EducationMaster
          +    -0.50911604604781 * Marital_StatusDivorced
          +     0.30403066135719 * Marital_StatusMarried
          +      0.1026950879545 * Marital_StatusSingle
          +     0.01000166524405 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     1.28509086202466 * Education2n_Cycle
          +     0.07860157688162 * EducationBasic  +     0.24607672351689 *
        EducationGraduation  +    -0.06009602645566 * EducationMaster
          +     1.07371507133318 * Marital_StatusDivorced
          +    -0.07097334129051 * Marital_StatusMarried
          +    -0.48339718568621 * Marital_StatusSingle
          +    -0.08900780355835 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +    -1.08109633810919 * Education2n_Cycle
          +    -0.54966585100103 * EducationBasic  +      0.5388683065169 *
        EducationGraduation  +     0.46960055830119 * EducationMaster
          +     1.04342893515504 * Marital_StatusDivorced
          +     1.16171312085032 * Marital_StatusMarried
          +    -0.30201646939913 * Marital_StatusSingle
          +     1.84122645884771 * Marital_StatusTogether ;
   H1x2_1  =     1.56970796025332 + H1x2_1 ;
   H1x2_2  =    -0.11766478836824 + H1x2_2 ;
   H1x2_3  =    -2.78218653641036 + H1x2_3 ;
   H1x2_4  =     0.51979515224467 + H1x2_4 ;
   H1x2_5  =     -0.4635890987824 + H1x2_5 ;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.04411772880581 * S_AcceptedCmpTotal
          +    -1.62725197326682 * S_Age  +    -1.99668213406033 * S_Frq
          +     -1.2265241921112 * S_Income  +     1.99702869958035 *
        S_Kidhome  +    -1.46762539068512 * S_Mnt  +     0.97784534044189 *
        S_MntFishProducts  +    -1.07945265688497 * S_MntFruits
          +     2.09306294956674 * S_MntGoldProds  +     1.46219664114361 *
        S_MntMeatProducts  +     0.10961158671991 * S_MntSweetProducts
          +     2.03040669273977 * S_MntWines  +     0.16536646017211 *
        S_MonthsAsCustomer  +    -0.88077951545076 * S_NumCatalogPurchases
          +     1.32256781010645 * S_NumDealsPurchases
          +    -1.43015438973619 * S_NumDistPurchases
          +    -0.63489289584421 * S_NumStorePurchases
          +     0.90508699686841 * S_NumWebPurchases
          +    -2.24234858061014 * S_NumWebVisitsMonth
          +     -2.9988027991146 * S_RFMstat  +     0.35987461993699 *
        S_RMntFrq  +    -1.09317668626142 * S_Recency
          +    -1.09925349438658 * S_Teenhome ;
   H1x3_2  =     0.10522923391314 * S_AcceptedCmpTotal
          +     0.68417479453112 * S_Age  +     0.46966162186743 * S_Frq
          +    -1.21537535753115 * S_Income  +    -1.87423294109672 *
        S_Kidhome  +     0.76913864731495 * S_Mnt  +     1.08535778796502 *
        S_MntFishProducts  +     1.27743864099826 * S_MntFruits
          +     -0.3186089651882 * S_MntGoldProds  +    -0.00224333051647 *
        S_MntMeatProducts  +    -1.28169616734092 * S_MntSweetProducts
          +     1.67350500234032 * S_MntWines  +     1.09584504562467 *
        S_MonthsAsCustomer  +    -1.45467876727494 * S_NumCatalogPurchases
          +     0.85965187264096 * S_NumDealsPurchases
          +    -1.15239933286756 * S_NumDistPurchases
          +     1.20800889102387 * S_NumStorePurchases
          +     1.08790389130242 * S_NumWebPurchases
          +    -0.13665551161149 * S_NumWebVisitsMonth
          +     1.02103499612659 * S_RFMstat  +    -0.12980097143044 *
        S_RMntFrq  +     0.65854311654256 * S_Recency
          +    -0.60999209572192 * S_Teenhome ;
   H1x3_3  =    -0.72575004293074 * S_AcceptedCmpTotal
          +     0.34932839743259 * S_Age  +     -0.2673460618328 * S_Frq
          +     0.25743187687481 * S_Income  +    -0.02172890929346 *
        S_Kidhome  +     1.21785656626837 * S_Mnt  +     0.37454359336223 *
        S_MntFishProducts  +    -0.32600053706408 * S_MntFruits
          +     0.57807148940534 * S_MntGoldProds  +     1.14736546512366 *
        S_MntMeatProducts  +    -1.41517082393978 * S_MntSweetProducts
          +    -1.44899595080061 * S_MntWines  +    -1.45520867126531 *
        S_MonthsAsCustomer  +    -0.33372174099196 * S_NumCatalogPurchases
          +     -0.5767607129654 * S_NumDealsPurchases
          +     -0.2643921429796 * S_NumDistPurchases
          +    -0.67417489911206 * S_NumStorePurchases
          +    -0.51423877684891 * S_NumWebPurchases
          +     1.40328299605176 * S_NumWebVisitsMonth
          +     1.35588787174957 * S_RFMstat  +     1.98416436137119 *
        S_RMntFrq  +     -0.8447362450681 * S_Recency
          +    -1.04372961736437 * S_Teenhome ;
   H1x3_4  =     0.05745684959388 * S_AcceptedCmpTotal
          +    -0.71077680161454 * S_Age  +      1.4854566142375 * S_Frq
          +    -0.32870416928843 * S_Income  +    -0.24944295149087 *
        S_Kidhome  +     -0.8312409740431 * S_Mnt  +    -0.09638646505384 *
        S_MntFishProducts  +    -0.86550491354678 * S_MntFruits
          +     1.46902858697296 * S_MntGoldProds  +      0.3661164136841 *
        S_MntMeatProducts  +     0.43108270077708 * S_MntSweetProducts
          +    -0.87140466249616 * S_MntWines  +     0.17511224898094 *
        S_MonthsAsCustomer  +    -2.66256923117027 * S_NumCatalogPurchases
          +      1.2821617657076 * S_NumDealsPurchases
          +     1.26584115202735 * S_NumDistPurchases
          +    -0.46597664211833 * S_NumStorePurchases
          +     0.45652363472866 * S_NumWebPurchases
          +    -2.66296112021252 * S_NumWebVisitsMonth
          +    -0.86670667018974 * S_RFMstat  +     0.60866041131732 *
        S_RMntFrq  +     1.31886754707923 * S_Recency
          +    -0.09949653139413 * S_Teenhome ;
   H1x3_5  =    -0.66850525418144 * S_AcceptedCmpTotal
          +     0.14331320698516 * S_Age  +    -0.82708146094779 * S_Frq
          +    -0.95718847240937 * S_Income  +     1.37375648833049 *
        S_Kidhome  +    -0.48314397401233 * S_Mnt  +     0.07047324834759 *
        S_MntFishProducts  +     0.86114312801139 * S_MntFruits
          +     0.54573348379533 * S_MntGoldProds  +    -0.05966372249273 *
        S_MntMeatProducts  +     0.47275063848217 * S_MntSweetProducts
          +    -0.62962007155261 * S_MntWines  +    -2.38081462831488 *
        S_MonthsAsCustomer  +     0.56594272689824 * S_NumCatalogPurchases
          +    -0.85162564171681 * S_NumDealsPurchases
          +     0.64631099667221 * S_NumDistPurchases
          +    -0.03081963858636 * S_NumStorePurchases
          +    -0.24124717624664 * S_NumWebPurchases
          +     0.56425980772372 * S_NumWebVisitsMonth
          +    -0.32254616624678 * S_RFMstat  +     1.84875225899832 *
        S_RMntFrq  +     0.08133312388911 * S_Recency
          +    -0.19004451996479 * S_Teenhome ;
   H1x3_1  = H1x3_1  +     1.03487942320068 * AcceptedCmp10
          +     0.77723443135875 * AcceptedCmp20  +    -1.04686858569959 *
        AcceptedCmp30  +    -1.87852311800194 * AcceptedCmp40
          +    -0.69838759011672 * AcceptedCmp50  +     0.50242045854463 *
        Complain0  +    -0.13339808164255 * HigherEducationBinary0 ;
   H1x3_2  = H1x3_2  +     0.39887299789564 * AcceptedCmp10
          +     0.12293700562648 * AcceptedCmp20  +    -1.41656670681309 *
        AcceptedCmp30  +    -1.04607557362847 * AcceptedCmp40
          +     0.02824649030864 * AcceptedCmp50  +    -0.46581865837196 *
        Complain0  +    -0.45913631308543 * HigherEducationBinary0 ;
   H1x3_3  = H1x3_3  +     0.20672868292414 * AcceptedCmp10
          +     0.52082182457868 * AcceptedCmp20  +     0.54911826263592 *
        AcceptedCmp30  +    -0.02400616289922 * AcceptedCmp40
          +     1.22209744911863 * AcceptedCmp50  +    -0.68243413694538 *
        Complain0  +     0.15620895311704 * HigherEducationBinary0 ;
   H1x3_4  = H1x3_4  +    -0.88269820758187 * AcceptedCmp10
          +    -0.19276892535938 * AcceptedCmp20  +     1.26789056018511 *
        AcceptedCmp30  +     0.04396979158385 * AcceptedCmp40
          +     0.54194186871284 * AcceptedCmp50  +     2.07766091697967 *
        Complain0  +    -0.43514178858246 * HigherEducationBinary0 ;
   H1x3_5  = H1x3_5  +     1.04303179873707 * AcceptedCmp10
          +    -1.29742389809739 * AcceptedCmp20  +     1.21708533617895 *
        AcceptedCmp30  +    -1.47807634614974 * AcceptedCmp40
          +     -0.7694244559597 * AcceptedCmp50  +     0.51798162453723 *
        Complain0  +    -0.95513113905832 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +     1.27822716215014 * Education2n_Cycle
          +     0.45900505383383 * EducationBasic  +    -0.35822992758656 *
        EducationGraduation  +     0.05949934527868 * EducationMaster
          +    -2.49973437075558 * Marital_StatusDivorced
          +    -0.18076948182574 * Marital_StatusMarried
          +     0.13498525495231 * Marital_StatusSingle
          +    -0.02365465636052 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +    -1.14981446246051 * Education2n_Cycle
          +     0.68006996858541 * EducationBasic  +    -0.06493857044709 *
        EducationGraduation  +    -1.22462805502453 * EducationMaster
          +       -0.59463732835 * Marital_StatusDivorced
          +     1.37741332427598 * Marital_StatusMarried
          +     -1.5833455713231 * Marital_StatusSingle
          +     1.79205360628448 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +     0.17779609626753 * Education2n_Cycle
          +    -2.22704675950779 * EducationBasic  +     1.30292325944162 *
        EducationGraduation  +     0.68083131423474 * EducationMaster
          +    -0.44569556289443 * Marital_StatusDivorced
          +     0.29918053103557 * Marital_StatusMarried
          +    -0.10337314064224 * Marital_StatusSingle
          +     0.04054221993299 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +     1.16412985277542 * Education2n_Cycle
          +     0.18806330813344 * EducationBasic  +     0.00212145829045 *
        EducationGraduation  +     0.00087354662697 * EducationMaster
          +     1.13881957277462 * Marital_StatusDivorced
          +    -0.35849807146313 * Marital_StatusMarried
          +    -0.22168731316885 * Marital_StatusSingle
          +    -0.22672306263461 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +    -1.25195599938207 * Education2n_Cycle
          +    -0.60946428681789 * EducationBasic  +     0.39993500009227 *
        EducationGraduation  +     0.43730905987249 * EducationMaster
          +     1.10774969923269 * Marital_StatusDivorced
          +     1.08409594073043 * Marital_StatusMarried
          +    -0.33145048007894 * Marital_StatusSingle
          +     1.68703837664761 * Marital_StatusTogether ;
   H1x3_1  =     1.76093149538288 + H1x3_1 ;
   H1x3_2  =    -0.11243980195421 + H1x3_2 ;
   H1x3_3  =    -2.59474781862449 + H1x3_3 ;
   H1x3_4  =     0.25376473610258 + H1x3_4 ;
   H1x3_5  =    -0.54808648261397 + H1x3_5 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x3_1  < _REC_EPS AND H1x3_1  > - _REC_EPS THEN
   H1x3_1  = H1x3_1  * H1x3_1 ;
   ELSE H1x3_1  = _REC_EPS ;
   IF H1x3_2  < _REC_EPS AND H1x3_2  > - _REC_EPS THEN
   H1x3_2  = H1x3_2  * H1x3_2 ;
   ELSE H1x3_2  = _REC_EPS ;
   IF H1x3_3  < _REC_EPS AND H1x3_3  > - _REC_EPS THEN
   H1x3_3  = H1x3_3  * H1x3_3 ;
   ELSE H1x3_3  = _REC_EPS ;
   IF H1x3_4  < _REC_EPS AND H1x3_4  > - _REC_EPS THEN
   H1x3_4  = H1x3_4  * H1x3_4 ;
   ELSE H1x3_4  = _REC_EPS ;
   IF H1x3_5  < _REC_EPS AND H1x3_5  > - _REC_EPS THEN
   H1x3_5  = H1x3_5  * H1x3_5 ;
   ELSE H1x3_5  = _REC_EPS ;
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     12.3694111963696 * H1x1_1  +     -9.1014019341077 * H1x1_2
          +    -14.9093780045901 * H1x1_3  +     25.4505756686259 * H1x1_4
          +    -13.3798044908382 * H1x1_5 ;
   P_DepVar1  = P_DepVar1  +     -0.2373753683635 * H1x2_1
          +    -0.03661175538589 * H1x2_2  +     0.29534813812803 * H1x2_3
          +     0.11908166898588 * H1x2_4  +      -0.241544638637 * H1x2_5 ;
   P_DepVar1  = P_DepVar1  +    -0.00276620815201 * H1x3_1
          +     0.00487849269566 * H1x3_2  +     0.01323887261394 * H1x3_3
          +     -0.0271389925801 * H1x3_4  +     0.00026595473892 * H1x3_5 ;
   P_DepVar1  =      4.0541137239843 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x1_4
H1x1_5
H1x2_1
H1x2_2
H1x2_3
H1x2_4
H1x2_5
H1x3_1
H1x3_2
H1x3_3
H1x3_4
H1x3_5
;
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
* Renaming Into variables for AutoNeural10;
*------------------------------------------------------------*;
length AutoNeural10_I_DepVar $32;
drop AutoNeural10_I_DepVar;
AutoNeural10_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural10;
*------------------------------------------------------------*;
length AutoNeural10_WARN_ $4;
drop AutoNeural10_WARN_;
AutoNeural10_WARN_ = _WARN_;
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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =     -0.7790327388408 * S_AcceptedCmpTotal
          +     0.32193739579856 * S_Age  +    -0.43875684835169 * S_Frq
          +     0.13013240455049 * S_Income  +    -0.74127716462976 *
        S_Kidhome  +    -0.86416600561474 * S_Mnt  +     0.94819226754442 *
        S_MntFishProducts  +     0.15895119408799 * S_MntFruits
          +     0.03658391935071 * S_MntGoldProds  +    -3.75052142292398 *
        S_MntMeatProducts  +    -0.22192220883538 * S_MntSweetProducts
          +     0.80534656860633 * S_MntWines  +     0.16144794241259 *
        S_MonthsAsCustomer  +    -1.53040364803625 * S_NumCatalogPurchases
          +    -1.09856598010056 * S_NumDealsPurchases
          +    -0.10571850472514 * S_NumDistPurchases
          +     0.11898210654227 * S_NumStorePurchases
          +      0.5984912060231 * S_NumWebPurchases
          +     0.78592531126942 * S_NumWebVisitsMonth
          +    -0.50004686386273 * S_RFMstat  +     0.40804018151571 *
        S_RMntFrq  +    -0.94753260620308 * S_Recency
          +    -0.49604118088328 * S_Teenhome ;
   H1x1_2  =    -0.22226926295489 * S_AcceptedCmpTotal
          +     0.08523894206962 * S_Age  +    -0.13010378102207 * S_Frq
          +    -0.61810906923536 * S_Income  +     0.26583917928045 *
        S_Kidhome  +     0.57213479787981 * S_Mnt  +    -0.58077613046442 *
        S_MntFishProducts  +      0.1530301493776 * S_MntFruits
          +      0.4586167382631 * S_MntGoldProds  +     1.40179051129147 *
        S_MntMeatProducts  +      0.0231413770297 * S_MntSweetProducts
          +    -0.08483682112771 * S_MntWines  +     0.22891006905064 *
        S_MonthsAsCustomer  +    -1.21866617917435 * S_NumCatalogPurchases
          +    -0.84042044250624 * S_NumDealsPurchases
          +    -0.10246261015488 * S_NumDistPurchases
          +     0.06886149708824 * S_NumStorePurchases
          +     0.63156910388199 * S_NumWebPurchases
          +    -1.33032061845311 * S_NumWebVisitsMonth
          +     0.51240040684649 * S_RFMstat  +     0.77604047421115 *
        S_RMntFrq  +     1.27964260226958 * S_Recency
          +     0.12022076571016 * S_Teenhome ;
   H1x1_3  =     1.19879097976404 * S_AcceptedCmpTotal
          +     0.14973951999399 * S_Age  +    -0.90630756390399 * S_Frq
          +     0.64934241358682 * S_Income  +    -0.66249532206724 *
        S_Kidhome  +     0.54195490560813 * S_Mnt  +    -0.58497380565417 *
        S_MntFishProducts  +     0.12409202833851 * S_MntFruits
          +     0.44480061346561 * S_MntGoldProds  +     3.27513201048136 *
        S_MntMeatProducts  +     -0.1256493054184 * S_MntSweetProducts
          +    -0.56080685022301 * S_MntWines  +     0.08633469383177 *
        S_MonthsAsCustomer  +     0.45482673505107 * S_NumCatalogPurchases
          +     0.45393712455366 * S_NumDealsPurchases
          +    -0.25292198053552 * S_NumDistPurchases
          +    -1.35582215064749 * S_NumStorePurchases
          +    -0.83132202302639 * S_NumWebPurchases
          +     1.87116225272678 * S_NumWebVisitsMonth
          +     0.39564162951481 * S_RFMstat  +    -1.08810221295144 *
        S_RMntFrq  +    -2.07407859514648 * S_Recency
          +     -0.6849099475723 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.81075414854045 * AcceptedCmp10
          +    -0.33403710427327 * AcceptedCmp20  +    -0.62242387435975 *
        AcceptedCmp30  +    -0.89439410552439 * AcceptedCmp40
          +     0.77335976756467 * AcceptedCmp50  +    -0.08825784612626 *
        Complain0  +      0.3404395194267 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.16741179709566 * AcceptedCmp10
          +    -0.53751033948061 * AcceptedCmp20  +     0.80285496945068 *
        AcceptedCmp30  +     0.39379279966091 * AcceptedCmp40
          +    -1.40366799083237 * AcceptedCmp50  +     -0.4265482924132 *
        Complain0  +     0.37272103593422 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.19417657656326 * AcceptedCmp10
          +    -0.06547746897317 * AcceptedCmp20  +     0.21980739904513 *
        AcceptedCmp30  +    -0.19452210052301 * AcceptedCmp40
          +    -2.02403282278574 * AcceptedCmp50  +    -0.18250261144524 *
        Complain0  +     0.34168103813312 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.03956789621002 * Education2n_Cycle
          +    -0.38372374638888 * EducationBasic  +     -0.4178927802606 *
        EducationGraduation  +    -0.61278625923288 * EducationMaster
          +      0.4695898100094 * Marital_StatusDivorced
          +    -0.52137742289262 * Marital_StatusMarried
          +    -0.32382086914936 * Marital_StatusSingle
          +    -0.66163012672344 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.25832319223886 * Education2n_Cycle
          +     0.05602860720141 * EducationBasic  +    -0.86282852488383 *
        EducationGraduation  +     0.18916317018059 * EducationMaster
          +    -1.04858218653238 * Marital_StatusDivorced
          +     2.41098335093061 * Marital_StatusMarried
          +    -1.94696044861334 * Marital_StatusSingle
          +     2.16021514856437 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.05351872242069 * Education2n_Cycle
          +    -0.56850783552841 * EducationBasic  +    -0.14880907057098 *
        EducationGraduation  +    -0.32850851013319 * EducationMaster
          +     0.42964114177062 * Marital_StatusDivorced
          +    -0.38607635605816 * Marital_StatusMarried
          +    -0.02157405407852 * Marital_StatusSingle
          +    -0.59995619744527 * Marital_StatusTogether ;
   H1x1_1  =    -0.53239337390307 + H1x1_1 ;
   H1x1_2  =     0.99428677123948 + H1x1_2 ;
   H1x1_3  =       1.835877082844 + H1x1_3 ;
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
   P_DepVar1  =    -3.41904253756965 * H1x1_1  +    -7.11204151517034 * H1x1_2
          +     10.7909509395818 * H1x1_3  +    -2.20432578352426 * H1x1_4 ;
   P_DepVar1  =    -3.66951098257489 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x1_4
;
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
* Renaming Into variables for AutoNeural9;
*------------------------------------------------------------*;
length AutoNeural9_I_DepVar $32;
drop AutoNeural9_I_DepVar;
AutoNeural9_I_DepVar = I_DepVar;
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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =     0.08465472857554 * S_AcceptedCmpTotal
          +     0.23104131534618 * S_Age  +     0.27646175976509 * S_Frq
          +     0.45938840681203 * S_Income  +     0.09814900830666 *
        S_Kidhome  +     0.23249430277518 * S_Mnt  +    -0.51905493105122 *
        S_MntFishProducts  +    -0.07604226481078 * S_MntFruits
          +     0.10100393832157 * S_MntGoldProds  +     1.56159221713858 *
        S_MntMeatProducts  +     0.12166799382268 * S_MntSweetProducts
          +    -0.63388816790524 * S_MntWines  +     0.00878303775585 *
        S_MonthsAsCustomer  +     0.01990411233136 * S_NumCatalogPurchases
          +     0.19770934886328 * S_NumDealsPurchases
          +      0.0515215988111 * S_NumDistPurchases
          +    -0.34569346346089 * S_NumStorePurchases
          +    -0.27122293596124 * S_NumWebPurchases
          +    -0.17061565609755 * S_NumWebVisitsMonth
          +      0.1271178187502 * S_RFMstat  +     0.38306508975954 *
        S_RMntFrq  +     0.05823588653853 * S_Recency
          +    -0.03760117378617 * S_Teenhome ;
   H1x1_2  =     0.16564144258189 * S_AcceptedCmpTotal
          +    -0.18930338067433 * S_Age  +    -0.23013558761757 * S_Frq
          +     -0.1347135122598 * S_Income  +     0.04776498811407 *
        S_Kidhome  +    -0.14940302068852 * S_Mnt  +    -0.13108691405604 *
        S_MntFishProducts  +    -0.02561341150704 * S_MntFruits
          +    -0.02022222891948 * S_MntGoldProds  +     0.80867688993093 *
        S_MntMeatProducts  +    -0.08374488783635 * S_MntSweetProducts
          +     -0.6719369441832 * S_MntWines  +    -0.14760035685198 *
        S_MonthsAsCustomer  +      0.4007376271331 * S_NumCatalogPurchases
          +     0.54308887602031 * S_NumDealsPurchases
          +    -0.22507315320192 * S_NumDistPurchases
          +    -0.79861387328361 * S_NumStorePurchases
          +    -0.45467494002747 * S_NumWebPurchases
          +      0.2119048824613 * S_NumWebVisitsMonth
          +     0.30167662748678 * S_RFMstat  +     0.10712110659027 *
        S_RMntFrq  +    -0.03061918029089 * S_Recency
          +    -0.06096313113607 * S_Teenhome ;
   H1x1_3  =     0.02674875562898 * S_AcceptedCmpTotal
          +    -0.19731891748843 * S_Age  +    -0.00753784701259 * S_Frq
          +    -0.31764694608254 * S_Income  +     0.49525183733398 *
        S_Kidhome  +     0.24623619243686 * S_Mnt  +     0.25904859702044 *
        S_MntFishProducts  +     0.26153358982994 * S_MntFruits
          +    -0.07223707213485 * S_MntGoldProds  +    -0.15192960471493 *
        S_MntMeatProducts  +     0.08241128624385 * S_MntSweetProducts
          +     0.62479763709054 * S_MntWines  +     0.03593742779349 *
        S_MonthsAsCustomer  +     0.00825730323418 * S_NumCatalogPurchases
          +     -0.0771083149302 * S_NumDealsPurchases
          +     0.03403621221162 * S_NumDistPurchases
          +     0.61303946422025 * S_NumStorePurchases
          +     0.27126793634053 * S_NumWebPurchases
          +     -0.9769688424222 * S_NumWebVisitsMonth
          +     0.08832170040425 * S_RFMstat  +     0.13241491054212 *
        S_RMntFrq  +     0.94872655811163 * S_Recency
          +     0.22002222738147 * S_Teenhome ;
   H1x1_4  =     0.46328587348713 * S_AcceptedCmpTotal
          +      -0.306946385792 * S_Age  +    -0.24247964225191 * S_Frq
          +    -0.42968609314513 * S_Income  +    -0.08934431746158 *
        S_Kidhome  +     0.15972194979558 * S_Mnt  +    -0.22174909818279 *
        S_MntFishProducts  +    -0.23755215058744 * S_MntFruits
          +      -0.124789433808 * S_MntGoldProds  +     0.50040173514144 *
        S_MntMeatProducts  +     0.02850063230459 * S_MntSweetProducts
          +     0.13427582671876 * S_MntWines  +     0.25569886862761 *
        S_MonthsAsCustomer  +     0.34004201732149 * S_NumCatalogPurchases
          +     0.29894603062327 * S_NumDealsPurchases
          +     0.07614620530875 * S_NumDistPurchases
          +     0.15402335009896 * S_NumStorePurchases
          +     0.10615749096863 * S_NumWebPurchases
          +     0.41962286816879 * S_NumWebVisitsMonth
          +     0.00203630873093 * S_RFMstat  +     0.04736976805951 *
        S_RMntFrq  +    -0.84751074132422 * S_Recency
          +      0.2189023557249 * S_Teenhome ;
   H1x1_5  =    -0.32353341757368 * S_AcceptedCmpTotal
          +     0.03233494925748 * S_Age  +    -0.21296093282526 * S_Frq
          +    -0.33919081075007 * S_Income  +     0.08771362671573 *
        S_Kidhome  +    -0.10797068838726 * S_Mnt  +    -0.19736358637985 *
        S_MntFishProducts  +    -0.19679917231132 * S_MntFruits
          +     0.07502386205588 * S_MntGoldProds  +    -0.50948750987247 *
        S_MntMeatProducts  +     0.00413757018488 * S_MntSweetProducts
          +      0.0788538305785 * S_MntWines  +    -0.02917052455021 *
        S_MonthsAsCustomer  +    -0.53933514609821 * S_NumCatalogPurchases
          +     0.14392502416642 * S_NumDealsPurchases
          +    -0.10026304978633 * S_NumDistPurchases
          +     -0.0588453022746 * S_NumStorePurchases
          +     0.24799398610395 * S_NumWebPurchases
          +    -0.52695548549717 * S_NumWebVisitsMonth
          +     0.01855620452049 * S_RFMstat  +    -0.00189170766477 *
        S_RMntFrq  +     0.51841177421912 * S_Recency
          +     0.31491299720207 * S_Teenhome ;
   H1x1_6  =     -0.2113594539647 * S_AcceptedCmpTotal
          +     -0.1052829531896 * S_Age  +     0.30802959734964 * S_Frq
          +    -0.03112570586685 * S_Income  +     0.19129661263247 *
        S_Kidhome  +     0.00533736622639 * S_Mnt  +    -0.06112703732925 *
        S_MntFishProducts  +    -0.15875686512247 * S_MntFruits
          +    -0.08040179272112 * S_MntGoldProds  +    -0.14462087536907 *
        S_MntMeatProducts  +     0.21353582706121 * S_MntSweetProducts
          +    -0.30180630737612 * S_MntWines  +    -0.11825033043182 *
        S_MonthsAsCustomer  +     -0.2917393256645 * S_NumCatalogPurchases
          +     0.08149600854964 * S_NumDealsPurchases
          +     0.16873541613513 * S_NumDistPurchases
          +    -0.20437343413446 * S_NumStorePurchases
          +     -0.1671107527288 * S_NumWebPurchases
          +     0.03677043100993 * S_NumWebVisitsMonth
          +      0.0240516540488 * S_RFMstat  +     0.06155030856383 *
        S_RMntFrq  +    -0.28802122451372 * S_Recency
          +     0.06998878697307 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.33641509021082 * AcceptedCmp10
          +     0.03092292109435 * AcceptedCmp20  +    -0.23551187181907 *
        AcceptedCmp30  +    -0.06694400005185 * AcceptedCmp40
          +    -0.14203506237074 * AcceptedCmp50  +    -0.25866390496966 *
        Complain0  +     0.19505921178308 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.09937599707203 * AcceptedCmp10
          +     0.03831208573575 * AcceptedCmp20  +     0.39683693019758 *
        AcceptedCmp30  +     0.37006277175295 * AcceptedCmp40
          +     0.21293419476895 * AcceptedCmp50  +     0.15528568367473 *
        Complain0  +    -0.30210013299822 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.29891621770856 * AcceptedCmp10
          +     0.64938384482014 * AcceptedCmp20  +     0.44997242602142 *
        AcceptedCmp30  +       0.479093722666 * AcceptedCmp40
          +     0.50957180373919 * AcceptedCmp50  +     0.27833535432461 *
        Complain0  +    -0.20383534906723 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.26872515586946 * AcceptedCmp10
          +    -0.24299337381911 * AcceptedCmp20  +    -0.01147155911926 *
        AcceptedCmp30  +     -0.3056041277894 * AcceptedCmp40
          +    -0.05496409609003 * AcceptedCmp50  +     0.07858238173893 *
        Complain0  +     0.05721550070076 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.14067626649899 * AcceptedCmp10
          +    -0.30627802828357 * AcceptedCmp20  +     0.05057942365592 *
        AcceptedCmp30  +    -0.10378506600459 * AcceptedCmp40
          +     0.07479232390108 * AcceptedCmp50  +     0.07252750671496 *
        Complain0  +     0.11114854035831 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +    -0.25806332334976 * AcceptedCmp10
          +     0.03944021903138 * AcceptedCmp20  +    -0.08792206887119 *
        AcceptedCmp30  +    -0.24631282865199 * AcceptedCmp40
          +    -0.06123991538969 * AcceptedCmp50  +    -0.03114784375357 *
        Complain0  +    -0.25204544481193 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +      0.2972170984261 * Education2n_Cycle
          +     0.01651368568996 * EducationBasic  +     -0.1186055936649 *
        EducationGraduation  +      0.0228208538951 * EducationMaster
          +    -0.31045295887604 * Marital_StatusDivorced
          +    -0.01109401001539 * Marital_StatusMarried
          +     0.01325135981025 * Marital_StatusSingle
          +     0.16609357475978 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.07095220065018 * Education2n_Cycle
          +    -0.23491732567608 * EducationBasic  +     0.20187086452315 *
        EducationGraduation  +     0.07524128723108 * EducationMaster
          +     0.02275101861599 * Marital_StatusDivorced
          +     0.20271548664903 * Marital_StatusMarried
          +    -0.12132069210718 * Marital_StatusSingle
          +     0.00085090729385 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.02268297689573 * Education2n_Cycle
          +     0.06359770535369 * EducationBasic  +     -0.1194001280088 *
        EducationGraduation  +     0.17299848976308 * EducationMaster
          +     -0.4992959703281 * Marital_StatusDivorced
          +     0.62071659624138 * Marital_StatusMarried
          +    -0.21776202274494 * Marital_StatusSingle
          +     0.54712874598141 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.17773353520266 * Education2n_Cycle
          +     0.17998728120628 * EducationBasic  +    -0.00324602612825 *
        EducationGraduation  +    -0.22448876765089 * EducationMaster
          +     0.05626212670587 * Marital_StatusDivorced
          +     0.14353891364597 * Marital_StatusMarried
          +    -0.29006765622997 * Marital_StatusSingle
          +     0.05503638282535 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.06634316870499 * Education2n_Cycle
          +    -0.36153880127411 * EducationBasic  +     0.23023144658635 *
        EducationGraduation  +    -0.06568730318683 * EducationMaster
          +    -0.21206913700604 * Marital_StatusDivorced
          +     0.58790643614629 * Marital_StatusMarried
          +    -0.65995982578062 * Marital_StatusSingle
          +     0.49642503732428 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.16504024096118 * Education2n_Cycle
          +     0.11925867171875 * EducationBasic  +    -0.04213907014732 *
        EducationGraduation  +    -0.21389968555475 * EducationMaster
          +    -0.05047370516008 * Marital_StatusDivorced
          +    -0.23139090963669 * Marital_StatusMarried
          +     0.04816197463249 * Marital_StatusSingle
          +     0.04977890114896 * Marital_StatusTogether ;
   H1x1_1  =    -1.90576647346127 + H1x1_1 ;
   H1x1_2  =     0.32295787429294 + H1x1_2 ;
   H1x1_3  =     0.75117643107919 + H1x1_3 ;
   H1x1_4  =      1.2336762751587 + H1x1_4 ;
   H1x1_5  =    -0.97062317465491 + H1x1_5 ;
   H1x1_6  =    -1.15756803634408 + H1x1_6 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x1_1  < _REC_EPS AND H1x1_1  > - _REC_EPS THEN
   H1x1_1  = H1x1_1  * H1x1_1 ;
   ELSE H1x1_1  = _REC_EPS ;
   IF H1x1_2  < _REC_EPS AND H1x1_2  > - _REC_EPS THEN
   H1x1_2  = H1x1_2  * H1x1_2 ;
   ELSE H1x1_2  = _REC_EPS ;
   IF H1x1_3  < _REC_EPS AND H1x1_3  > - _REC_EPS THEN
   H1x1_3  = H1x1_3  * H1x1_3 ;
   ELSE H1x1_3  = _REC_EPS ;
   IF H1x1_4  < _REC_EPS AND H1x1_4  > - _REC_EPS THEN
   H1x1_4  = H1x1_4  * H1x1_4 ;
   ELSE H1x1_4  = _REC_EPS ;
   IF H1x1_5  < _REC_EPS AND H1x1_5  > - _REC_EPS THEN
   H1x1_5  = H1x1_5  * H1x1_5 ;
   ELSE H1x1_5  = _REC_EPS ;
   IF H1x1_6  < _REC_EPS AND H1x1_6  > - _REC_EPS THEN
   H1x1_6  = H1x1_6  * H1x1_6 ;
   ELSE H1x1_6  = _REC_EPS ;
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
   P_DepVar1  =    -0.99830813428318 * H1x1_1  +     1.33495006526712 * H1x1_2
          +    -1.37942150026657 * H1x1_3  +     1.22714974922576 * H1x1_4
          +     1.73375794385595 * H1x1_5  +     -0.0100306049679 * H1x1_6 ;
   P_DepVar1  =    -1.90393999986167 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x1_4
H1x1_5
H1x1_6
;
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
* Renaming Into variables for AutoNeural11;
*------------------------------------------------------------*;
length AutoNeural11_I_DepVar $32;
drop AutoNeural11_I_DepVar;
AutoNeural11_I_DepVar = I_DepVar;
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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 *
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
   H1x1_1  =    -0.08478534961354 * S_AcceptedCmpTotal
          +     0.21528166003219 * S_Age  +    -0.16079737422774 * S_Frq
          +     0.04922044955183 * S_Income  +     0.06245849112135 *
        S_Kidhome  +    -0.12820970008154 * S_Mnt  +    -0.00676959308959 *
        S_MntFishProducts  +    -0.20367403957375 * S_MntFruits
          +    -0.06459558558968 * S_MntGoldProds  +     0.01557669100416 *
        S_MntMeatProducts  +    -0.16342003924117 * S_MntSweetProducts
          +     0.34676276369853 * S_MntWines  +    -0.08454570225616 *
        S_MonthsAsCustomer  +    -0.00318885387905 * S_NumCatalogPurchases
          +      0.1112677116841 * S_NumDealsPurchases
          +     0.01563584187072 * S_NumDistPurchases
          +     0.19193969522995 * S_NumStorePurchases
          +      0.3133556199984 * S_NumWebPurchases
          +    -0.21884874785716 * S_NumWebVisitsMonth
          +     0.08478875792216 * S_RFMstat  +     0.05964414665285 *
        S_RMntFrq  +    -0.12595000497726 * S_Recency
          +     -0.1238719414537 * S_Teenhome ;
   H1x1_2  =     0.20807487357943 * S_AcceptedCmpTotal
          +    -0.27223051908987 * S_Age  +     0.28649391533674 * S_Frq
          +     0.46493719675068 * S_Income  +     0.10180542910079 *
        S_Kidhome  +    -0.19573056673819 * S_Mnt  +    -0.05332725327514 *
        S_MntFishProducts  +    -0.28610692329433 * S_MntFruits
          +    -0.13417237194849 * S_MntGoldProds  +     0.45697707494335 *
        S_MntMeatProducts  +    -0.28280545785477 * S_MntSweetProducts
          +    -0.13234920069688 * S_MntWines  +     -0.2710938018651 *
        S_MonthsAsCustomer  +     0.31174284041905 * S_NumCatalogPurchases
          +     0.30225032753275 * S_NumDealsPurchases
          +     0.33833359923595 * S_NumDistPurchases
          +    -0.20255599575849 * S_NumStorePurchases
          +    -0.12040071168942 * S_NumWebPurchases
          +    -0.12407090307061 * S_NumWebVisitsMonth
          +    -0.05688936259515 * S_RFMstat  +     0.15514736649245 *
        S_RMntFrq  +     0.00838555462657 * S_Recency
          +     0.04609426861136 * S_Teenhome ;
   H1x1_3  =    -0.30541463116928 * S_AcceptedCmpTotal
          +    -0.01746117216025 * S_Age  +    -0.44156473334329 * S_Frq
          +    -0.51952426304193 * S_Income  +     0.20419921255777 *
        S_Kidhome  +    -0.18174316707953 * S_Mnt  +    -0.03813675536406 *
        S_MntFishProducts  +     -0.0959023413712 * S_MntFruits
          +     0.12724081783278 * S_MntGoldProds  +    -0.07639148541426 *
        S_MntMeatProducts  +     -0.0797214413833 * S_MntSweetProducts
          +    -0.57705931875808 * S_MntWines  +    -0.12638551201991 *
        S_MonthsAsCustomer  +    -0.21854676704549 * S_NumCatalogPurchases
          +     0.16792903091627 * S_NumDealsPurchases
          +    -0.37408945626745 * S_NumDistPurchases
          +    -0.18067262995566 * S_NumStorePurchases
          +     0.21192146789881 * S_NumWebPurchases
          +    -0.23547702310669 * S_NumWebVisitsMonth
          +    -0.02272089758813 * S_RFMstat  +    -0.16409330281075 *
        S_RMntFrq  +     0.45021846112946 * S_Recency
          +     0.32988735727394 * S_Teenhome ;
   H1x1_4  =     0.05205198916717 * S_AcceptedCmpTotal
          +     0.25568653619739 * S_Age  +    -0.31037252146959 * S_Frq
          +     0.42636025358982 * S_Income  +    -0.24453708980866 *
        S_Kidhome  +    -0.07832530945892 * S_Mnt  +    -0.48332124476182 *
        S_MntFishProducts  +    -0.13932879119138 * S_MntFruits
          +      0.1984121566988 * S_MntGoldProds  +     1.14965897015972 *
        S_MntMeatProducts  +     0.07027485457428 * S_MntSweetProducts
          +    -0.56598097754046 * S_MntWines  +     0.07317190938075 *
        S_MonthsAsCustomer  +       0.075756987983 * S_NumCatalogPurchases
          +     0.29407429399136 * S_NumDealsPurchases
          +     0.01610745252195 * S_NumDistPurchases
          +    -0.17767939085628 * S_NumStorePurchases
          +    -0.15168958538637 * S_NumWebPurchases
          +     0.17433622143988 * S_NumWebVisitsMonth
          +     0.11635602973993 * S_RFMstat  +     0.32632751843433 *
        S_RMntFrq  +    -0.24758483374458 * S_Recency
          +    -0.31468291567479 * S_Teenhome ;
   H1x1_5  =    -0.59657492903543 * S_AcceptedCmpTotal
          +     0.23513672763458 * S_Age  +    -0.14882104210954 * S_Frq
          +    -0.07762660201035 * S_Income  +     0.01424651904783 *
        S_Kidhome  +     0.18748607813081 * S_Mnt  +     0.11088464897095 *
        S_MntFishProducts  +    -0.10064450211557 * S_MntFruits
          +     0.11161391354421 * S_MntGoldProds  +    -1.36345407290644 *
        S_MntMeatProducts  +     0.04868729717044 * S_MntSweetProducts
          +     0.80284342329654 * S_MntWines  +     -0.0179539622492 *
        S_MonthsAsCustomer  +    -0.60051908798715 * S_NumCatalogPurchases
          +    -0.37976451362108 * S_NumDealsPurchases
          +    -0.17027731520801 * S_NumDistPurchases
          +     0.59849493667087 * S_NumStorePurchases
          +     0.65481480560301 * S_NumWebPurchases
          +    -0.68253224576609 * S_NumWebVisitsMonth
          +    -0.16723490165629 * S_RFMstat  +    -0.10533797887644 *
        S_RMntFrq  +     0.81382723915873 * S_Recency
          +     0.06049401205856 * S_Teenhome ;
   H1x1_6  =    -0.07547841798202 * S_AcceptedCmpTotal
          +     0.22445278254589 * S_Age  +    -0.26357481075143 * S_Frq
          +     0.06894154144261 * S_Income  +     0.20713236126681 *
        S_Kidhome  +    -0.14103612934526 * S_Mnt  +     0.36334508557452 *
        S_MntFishProducts  +    -0.20862425337296 * S_MntFruits
          +    -0.29089690099273 * S_MntGoldProds  +     0.11336893090527 *
        S_MntMeatProducts  +    -0.13547374281924 * S_MntSweetProducts
          +     0.02228828195539 * S_MntWines  +    -0.19257650420334 *
        S_MonthsAsCustomer  +      0.1365526319824 * S_NumCatalogPurchases
          +    -0.07686699131623 * S_NumDealsPurchases
          +    -0.07220460738926 * S_NumDistPurchases
          +    -0.06554027468389 * S_NumStorePurchases
          +     0.10422838158001 * S_NumWebPurchases
          +    -0.03858550147892 * S_NumWebVisitsMonth
          +    -0.06397448441373 * S_RFMstat  +     0.21747838287147 *
        S_RMntFrq  +     0.24839313159913 * S_Recency
          +    -0.06317317698653 * S_Teenhome ;
   H1x1_7  =    -0.08604903695444 * S_AcceptedCmpTotal
          +    -0.14807437541992 * S_Age  +     0.01466157584549 * S_Frq
          +    -0.09883966180507 * S_Income  +     0.51992566778352 *
        S_Kidhome  +     0.29795006703636 * S_Mnt  +    -0.08922020500011 *
        S_MntFishProducts  +     0.19836834402079 * S_MntFruits
          +    -0.11292241468378 * S_MntGoldProds  +       0.584464452194 *
        S_MntMeatProducts  +     0.22625326024073 * S_MntSweetProducts
          +     0.24074129944382 * S_MntWines  +     0.13538906557527 *
        S_MonthsAsCustomer  +    -0.01228250248922 * S_NumCatalogPurchases
          +    -0.07920122387563 * S_NumDealsPurchases
          +      0.3649244061347 * S_NumDistPurchases
          +     0.36475853688403 * S_NumStorePurchases
          +     0.02153991404063 * S_NumWebPurchases
          +    -0.94080669139388 * S_NumWebVisitsMonth
          +     0.24853677977494 * S_RFMstat  +     0.37015183933951 *
        S_RMntFrq  +      0.6724157721663 * S_Recency
          +      0.1615471643866 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.04431608362128 * AcceptedCmp10
          +       0.145592087795 * AcceptedCmp20  +    -0.18972867139938 *
        AcceptedCmp30  +     0.11297731320888 * AcceptedCmp40
          +     0.15203974410995 * AcceptedCmp50  +     0.05130421316428 *
        Complain0  +     0.33576036450343 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.05495742609855 * AcceptedCmp10
          +    -0.08873650760176 * AcceptedCmp20  +    -0.16380549867313 *
        AcceptedCmp30  +    -0.24495261884932 * AcceptedCmp40
          +    -0.22199506896148 * AcceptedCmp50  +       0.149484615172 *
        Complain0  +     0.01091791142552 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.03473702421341 * AcceptedCmp10
          +    -0.11226718065217 * AcceptedCmp20  +     0.19024579384296 *
        AcceptedCmp30  +     0.15478548865598 * AcceptedCmp40
          +     0.15222823671897 * AcceptedCmp50  +     0.07713012834947 *
        Complain0  +    -0.18741708707661 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.25622127302429 * AcceptedCmp10
          +    -0.39059103518073 * AcceptedCmp20  +    -0.29716603631807 *
        AcceptedCmp30  +    -0.20875694971526 * AcceptedCmp40
          +    -0.35128787139073 * AcceptedCmp50  +    -0.28848733462386 *
        Complain0  +      0.4276503747649 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.06574875851088 * AcceptedCmp10
          +    -0.27375195259265 * AcceptedCmp20  +     -0.2740681662293 *
        AcceptedCmp30  +    -0.14697156898736 * AcceptedCmp40
          +     0.17684649468835 * AcceptedCmp50  +    -0.09979172944646 *
        Complain0  +     0.38986664202197 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +     0.08696678529441 * AcceptedCmp10
          +     0.09467543942215 * AcceptedCmp20  +     0.04586779705477 *
        AcceptedCmp30  +    -0.12591921836379 * AcceptedCmp40
          +     0.20150138392895 * AcceptedCmp50  +     0.27764282700214 *
        Complain0  +     0.13985738522066 * HigherEducationBinary0 ;
   H1x1_7  = H1x1_7  +    -0.10455069401218 * AcceptedCmp10
          +      0.1311831941372 * AcceptedCmp20  +     0.17844209104604 *
        AcceptedCmp30  +     0.19406707592815 * AcceptedCmp40
          +    -0.00068155012319 * AcceptedCmp50  +     0.13245364846536 *
        Complain0  +    -0.05165256160872 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.28967939808759 * Education2n_Cycle
          +    -0.15795056374781 * EducationBasic  +    -0.00649803471307 *
        EducationGraduation  +     0.19520715924532 * EducationMaster
          +     0.07744097241553 * Marital_StatusDivorced
          +     -0.0247463100385 * Marital_StatusMarried
          +     0.05804915234573 * Marital_StatusSingle
          +    -0.08320125047871 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.12524444422085 * Education2n_Cycle
          +    -0.30278286924729 * EducationBasic  +     0.37480827366421 *
        EducationGraduation  +     0.34209136290694 * EducationMaster
          +     0.01390668926269 * Marital_StatusDivorced
          +     0.01136282152074 * Marital_StatusMarried
          +     0.12450246418789 * Marital_StatusSingle
          +     -0.1576148519872 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.14589041643593 * Education2n_Cycle
          +    -0.15691118816463 * EducationBasic  +      0.1993616073183 *
        EducationGraduation  +     0.02862010255145 * EducationMaster
          +    -0.19133456931879 * Marital_StatusDivorced
          +     0.56263566654996 * Marital_StatusMarried
          +    -0.42172822038882 * Marital_StatusSingle
          +     0.42023140643292 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.10038585978656 * Education2n_Cycle
          +    -0.11388609002984 * EducationBasic  +    -0.14980553500983 *
        EducationGraduation  +    -0.07646595330369 * EducationMaster
          +    -0.19871205065609 * Marital_StatusDivorced
          +    -0.14730795681603 * Marital_StatusMarried
          +     0.05055432510362 * Marital_StatusSingle
          +     0.06558965292395 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +      0.0015835307855 * Education2n_Cycle
          +    -0.22658746797638 * EducationBasic  +    -0.03445982386977 *
        EducationGraduation  +     0.11375378192685 * EducationMaster
          +    -0.35623807358995 * Marital_StatusDivorced
          +     0.30324726283965 * Marital_StatusMarried
          +    -0.18561093467927 * Marital_StatusSingle
          +       0.395424582152 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +    -0.23751822587858 * Education2n_Cycle
          +    -0.01687300040825 * EducationBasic  +     0.23236967703011 *
        EducationGraduation  +      0.0725289831541 * EducationMaster
          +     0.11581014663368 * Marital_StatusDivorced
          +    -0.31070638037659 * Marital_StatusMarried
          +     0.17131747253949 * Marital_StatusSingle
          +    -0.19314955966476 * Marital_StatusTogether ;
   H1x1_7  = H1x1_7  +     0.00103693282479 * Education2n_Cycle
          +     0.12608909598752 * EducationBasic  +     -0.2366673091666 *
        EducationGraduation  +     0.24413217290922 * EducationMaster
          +    -0.42450599871892 * Marital_StatusDivorced
          +     0.48162905075885 * Marital_StatusMarried
          +    -0.26618507749283 * Marital_StatusSingle
          +     0.38053668740338 * Marital_StatusTogether ;
   H1x1_1  =     0.12149136705075 + H1x1_1 ;
   H1x1_2  =    -0.97489696657001 + H1x1_2 ;
   H1x1_3  =    -0.70605220802968 + H1x1_3 ;
   H1x1_4  =    -1.07783206982379 + H1x1_4 ;
   H1x1_5  =    -1.00400706261511 + H1x1_5 ;
   H1x1_6  =     0.22600488314839 + H1x1_6 ;
   H1x1_7  =     1.55642446968077 + H1x1_7 ;
   _EPS = SQRT(CONSTANT('MACEPS')) ;
   _REC_EPS = 1/_EPS ;
   DROP _REC_EPS _EPS ;
   IF H1x1_1  < _REC_EPS AND H1x1_1  > - _REC_EPS THEN
   H1x1_1  = H1x1_1  * H1x1_1 ;
   ELSE H1x1_1  = _REC_EPS ;
   IF H1x1_2  < _REC_EPS AND H1x1_2  > - _REC_EPS THEN
   H1x1_2  = H1x1_2  * H1x1_2 ;
   ELSE H1x1_2  = _REC_EPS ;
   IF H1x1_3  < _REC_EPS AND H1x1_3  > - _REC_EPS THEN
   H1x1_3  = H1x1_3  * H1x1_3 ;
   ELSE H1x1_3  = _REC_EPS ;
   IF H1x1_4  < _REC_EPS AND H1x1_4  > - _REC_EPS THEN
   H1x1_4  = H1x1_4  * H1x1_4 ;
   ELSE H1x1_4  = _REC_EPS ;
   IF H1x1_5  < _REC_EPS AND H1x1_5  > - _REC_EPS THEN
   H1x1_5  = H1x1_5  * H1x1_5 ;
   ELSE H1x1_5  = _REC_EPS ;
   IF H1x1_6  < _REC_EPS AND H1x1_6  > - _REC_EPS THEN
   H1x1_6  = H1x1_6  * H1x1_6 ;
   ELSE H1x1_6  = _REC_EPS ;
   IF H1x1_7  < _REC_EPS AND H1x1_7  > - _REC_EPS THEN
   H1x1_7  = H1x1_7  * H1x1_7 ;
   ELSE H1x1_7  = _REC_EPS ;
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
   H1x2_1  =    -1.36226288448745 * S_AcceptedCmpTotal
          +     -1.3328616352886 * S_Age  +     1.25346137866034 * S_Frq
          +    -1.21746243786295 * S_Income  +     2.83911738158074 *
        S_Kidhome  +    -0.60784009102409 * S_Mnt  +     1.57752173634223 *
        S_MntFishProducts  +    -0.26776567401075 * S_MntFruits
          +     1.09584731081081 * S_MntGoldProds  +     1.22333044103532 *
        S_MntMeatProducts  +     0.42827942745016 * S_MntSweetProducts
          +     0.67813472792448 * S_MntWines  +     0.56816492004798 *
        S_MonthsAsCustomer  +     0.58113470399079 * S_NumCatalogPurchases
          +     1.96719021971894 * S_NumDealsPurchases
          +    -0.44535354794671 * S_NumDistPurchases
          +    -0.54827762736866 * S_NumStorePurchases
          +     1.02703310241897 * S_NumWebPurchases
          +    -0.12526997502601 * S_NumWebVisitsMonth
          +    -0.55803926383776 * S_RFMstat  +     0.01819380776809 *
        S_RMntFrq  +       0.651688575044 * S_Recency
          +     1.58682398186611 * S_Teenhome ;
   H1x2_2  =    -0.38064507857029 * S_AcceptedCmpTotal
          +    -0.49661801158351 * S_Age  +    -0.89589399799916 * S_Frq
          +     -0.0121499288597 * S_Income  +    -0.48023022827846 *
        S_Kidhome  +     -0.5183846206029 * S_Mnt  +    -3.13913899012334 *
        S_MntFishProducts  +    -2.07291335687615 * S_MntFruits
          +     0.51019753905662 * S_MntGoldProds  +     0.11458666377917 *
        S_MntMeatProducts  +     -1.8499241966205 * S_MntSweetProducts
          +     0.23160544044172 * S_MntWines  +    -0.48210626907943 *
        S_MonthsAsCustomer  +     0.15500845227752 * S_NumCatalogPurchases
          +     1.34659447971131 * S_NumDealsPurchases
          +    -0.51624251310423 * S_NumDistPurchases
          +      -1.283121574848 * S_NumStorePurchases
          +    -1.83517806228926 * S_NumWebPurchases
          +     0.51321339475285 * S_NumWebVisitsMonth
          +    -1.86431704283342 * S_RFMstat  +    -1.52065204326569 *
        S_RMntFrq  +    -0.33186055095462 * S_Recency
          +    -0.49524729407054 * S_Teenhome ;
   H1x2_3  =    -0.75774003934728 * S_AcceptedCmpTotal
          +    -0.85312030825337 * S_Age  +    -0.01726294458221 * S_Frq
          +     0.58598267983786 * S_Income  +     1.30497766805554 *
        S_Kidhome  +    -0.84214135491022 * S_Mnt  +     0.55305862453787 *
        S_MntFishProducts  +      0.6488663613899 * S_MntFruits
          +    -0.83189439197558 * S_MntGoldProds  +    -0.07500050412653 *
        S_MntMeatProducts  +    -0.06401928810253 * S_MntSweetProducts
          +      0.5940135658334 * S_MntWines  +    -0.04573352455984 *
        S_MonthsAsCustomer  +    -1.53610650634069 * S_NumCatalogPurchases
          +     0.67492297345004 * S_NumDealsPurchases
          +    -0.40437875375926 * S_NumDistPurchases
          +     0.36322603681545 * S_NumStorePurchases
          +    -1.15315070635524 * S_NumWebPurchases
          +     1.20707272201156 * S_NumWebVisitsMonth
          +     0.12192566357285 * S_RFMstat  +    -0.46711219170047 *
        S_RMntFrq  +     1.89703582493259 * S_Recency
          +     1.07511942237188 * S_Teenhome ;
   H1x2_4  =     0.62123819069495 * S_AcceptedCmpTotal
          +     0.03399237520702 * S_Age  +    -0.01971421795338 * S_Frq
          +    -0.54728266919056 * S_Income  +     -0.4634195771237 *
        S_Kidhome  +    -1.19055247712911 * S_Mnt  +      1.4307770729159 *
        S_MntFishProducts  +    -0.83895281276374 * S_MntFruits
          +    -0.48578798244317 * S_MntGoldProds  +     -0.2846617807101 *
        S_MntMeatProducts  +     0.70721686533987 * S_MntSweetProducts
          +     1.32824513551741 * S_MntWines  +    -0.62654342755965 *
        S_MonthsAsCustomer  +    -0.97245161056543 * S_NumCatalogPurchases
          +    -0.41427983342148 * S_NumDealsPurchases
          +    -0.22714305629205 * S_NumDistPurchases
          +    -0.78763182048862 * S_NumStorePurchases
          +    -0.26669253451501 * S_NumWebPurchases
          +    -0.79601078616342 * S_NumWebVisitsMonth
          +    -0.03863278696502 * S_RFMstat  +     0.95011556103056 *
        S_RMntFrq  +     0.57184629262878 * S_Recency
          +    -0.21560478702461 * S_Teenhome ;
   H1x2_5  =     1.47906557745075 * S_AcceptedCmpTotal
          +    -0.31060566334198 * S_Age  +     0.56472424389718 * S_Frq
          +     2.16541682726249 * S_Income  +    -0.34119803841059 *
        S_Kidhome  +    -0.53783050542796 * S_Mnt  +     0.54954821448236 *
        S_MntFishProducts  +    -0.48449918837838 * S_MntFruits
          +     0.29783052620672 * S_MntGoldProds  +    -0.15068954343013 *
        S_MntMeatProducts  +     0.12733251381761 * S_MntSweetProducts
          +    -2.46709166794296 * S_MntWines  +     -1.2011286508879 *
        S_MonthsAsCustomer  +    -0.88194814936932 * S_NumCatalogPurchases
          +      0.7697882092212 * S_NumDealsPurchases
          +     0.51864835453056 * S_NumDistPurchases
          +    -1.18320366630444 * S_NumStorePurchases
          +     -0.6608394639529 * S_NumWebPurchases
          +    -0.03948137707769 * S_NumWebVisitsMonth
          +     1.01076462488608 * S_RFMstat  +    -0.91562280329354 *
        S_RMntFrq  +    -1.07576669501238 * S_Recency
          +     -0.5946628412106 * S_Teenhome ;
   H1x2_6  =     0.42130900994246 * S_AcceptedCmpTotal
          +     1.64256522546546 * S_Age  +    -0.31822237495441 * S_Frq
          +     0.39698710846967 * S_Income  +    -1.30075584525681 *
        S_Kidhome  +    -1.74733472316294 * S_Mnt  +    -1.04423575539078 *
        S_MntFishProducts  +     0.28025913700744 * S_MntFruits
          +     0.92062413073229 * S_MntGoldProds  +     0.38487452173084 *
        S_MntMeatProducts  +     2.15808673418264 * S_MntSweetProducts
          +     -0.5364274323591 * S_MntWines  +     0.64447858852609 *
        S_MonthsAsCustomer  +     0.33683873873337 * S_NumCatalogPurchases
          +     1.45707983202269 * S_NumDealsPurchases
          +     0.83341887728641 * S_NumDistPurchases
          +    -0.36664450469423 * S_NumStorePurchases
          +     0.63911579043339 * S_NumWebPurchases
          +     0.67144790303554 * S_NumWebVisitsMonth
          +    -0.22124390112376 * S_RFMstat  +     1.72222071547971 *
        S_RMntFrq  +    -0.02323382627271 * S_Recency
          +    -0.09494567508522 * S_Teenhome ;
   H1x2_7  =      0.0903330772553 * S_AcceptedCmpTotal
          +     0.13217959089196 * S_Age  +     0.93600629225871 * S_Frq
          +     1.23765169211392 * S_Income  +     1.27732984858098 *
        S_Kidhome  +     1.54889765360944 * S_Mnt  +     0.84618173514761 *
        S_MntFishProducts  +    -0.32044356786958 * S_MntFruits
          +    -0.26357995597029 * S_MntGoldProds  +     0.53649229087334 *
        S_MntMeatProducts  +     1.46955866272889 * S_MntSweetProducts
          +    -0.34260315437319 * S_MntWines  +    -1.70693604004836 *
        S_MonthsAsCustomer  +     -0.4612555130737 * S_NumCatalogPurchases
          +     0.68491896063662 * S_NumDealsPurchases
          +      0.5386312048592 * S_NumDistPurchases
          +     1.28108942503912 * S_NumStorePurchases
          +    -0.88282270505969 * S_NumWebPurchases
          +    -0.66670958211416 * S_NumWebVisitsMonth
          +     0.94315921733739 * S_RFMstat  +     0.70533705858561 *
        S_RMntFrq  +     0.23896687873405 * S_Recency
          +     0.66289635918858 * S_Teenhome ;
   H1x2_1  = H1x2_1  +     0.22958861848016 * AcceptedCmp10
          +    -1.11069938765475 * AcceptedCmp20  +     1.18563222829069 *
        AcceptedCmp30  +    -0.97028253571173 * AcceptedCmp40
          +     0.60850082670391 * AcceptedCmp50  +     0.31163990605418 *
        Complain0  +     1.10957053966326 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -0.99409862826118 * AcceptedCmp10
          +    -0.76360093699992 * AcceptedCmp20  +     0.82772534103696 *
        AcceptedCmp30  +     1.74232000787449 * AcceptedCmp40
          +    -1.37356239255127 * AcceptedCmp50  +      0.0919811154199 *
        Complain0  +    -0.00220513515877 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +    -0.21003647134105 * AcceptedCmp10
          +    -0.08930317176477 * AcceptedCmp20  +    -0.39109673162041 *
        AcceptedCmp30  +     1.14094450038946 * AcceptedCmp40
          +     1.26041997788848 * AcceptedCmp50  +    -0.10972130900569 *
        Complain0  +    -0.99352598480407 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     2.02630284432093 * AcceptedCmp10
          +    -2.50721904229276 * AcceptedCmp20  +    -1.31026450397446 *
        AcceptedCmp30  +    -0.83440880266914 * AcceptedCmp40
          +     -0.0570899805015 * AcceptedCmp50  +    -0.55525351434733 *
        Complain0  +     0.27306601694081 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +    -0.18595284227194 * AcceptedCmp10
          +    -1.55973916517392 * AcceptedCmp20  +    -3.81563768970049 *
        AcceptedCmp30  +    -0.09331430915239 * AcceptedCmp40
          +     0.76128118177142 * AcceptedCmp50  +    -0.17283107047755 *
        Complain0  +    -1.01028562804392 * HigherEducationBinary0 ;
   H1x2_6  = H1x2_6  +    -1.21475169836565 * AcceptedCmp10
          +     0.28748729216575 * AcceptedCmp20  +     1.15908030413172 *
        AcceptedCmp30  +    -0.05889528676549 * AcceptedCmp40
          +    -0.41661363625562 * AcceptedCmp50  +    -0.77939130028952 *
        Complain0  +     2.19510865765326 * HigherEducationBinary0 ;
   H1x2_7  = H1x2_7  +     0.87360423179644 * AcceptedCmp10
          +    -0.47867594186426 * AcceptedCmp20  +    -0.30325818223392 *
        AcceptedCmp30  +    -0.96085556588297 * AcceptedCmp40
          +    -0.19693158209969 * AcceptedCmp50  +    -0.73731792634553 *
        Complain0  +    -1.10021678806679 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -1.17876013389516 * Education2n_Cycle
          +    -0.35670434275624 * EducationBasic  +    -0.12456502068616 *
        EducationGraduation  +     -1.0620373133508 * EducationMaster
          +    -3.97961426831865 * Marital_StatusDivorced
          +     0.00932639813867 * Marital_StatusMarried
          +     1.29310186574718 * Marital_StatusSingle
          +     1.60940802221114 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.58497813059595 * Education2n_Cycle
          +     0.98038586431321 * EducationBasic  +    -0.20442806724521 *
        EducationGraduation  +     0.64973046142001 * EducationMaster
          +    -0.30358516578188 * Marital_StatusDivorced
          +    -0.96176709360703 * Marital_StatusMarried
          +     1.26977690921649 * Marital_StatusSingle
          +     -0.6681544336237 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.42123479646947 * Education2n_Cycle
          +     0.22705854674045 * EducationBasic  +     0.34794003687348 *
        EducationGraduation  +     0.18356390207843 * EducationMaster
          +     0.55272671490757 * Marital_StatusDivorced
          +      0.1499239288334 * Marital_StatusMarried
          +    -0.46840941760604 * Marital_StatusSingle
          +     0.93706218273755 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.85035585831723 * Education2n_Cycle
          +    -0.70680576286167 * EducationBasic  +    -0.24487676912938 *
        EducationGraduation  +    -0.33030970028481 * EducationMaster
          +      -1.240735370138 * Marital_StatusDivorced
          +    -1.20089294883599 * Marital_StatusMarried
          +     0.57492674426149 * Marital_StatusSingle
          +     1.44189292990255 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +    -0.62461434654579 * Education2n_Cycle
          +    -0.34090423965869 * EducationBasic  +    -0.82493401834396 *
        EducationGraduation  +    -1.09423426649553 * EducationMaster
          +     1.05435442049802 * Marital_StatusDivorced
          +      0.3571256349717 * Marital_StatusMarried
          +    -0.44741267266578 * Marital_StatusSingle
          +     0.02948931507994 * Marital_StatusTogether ;
   H1x2_6  = H1x2_6  +     0.09620501635178 * Education2n_Cycle
          +    -0.54617424401993 * EducationBasic  +    -0.43305038404558 *
        EducationGraduation  +     0.05453229059502 * EducationMaster
          +     2.06026721980778 * Marital_StatusDivorced
          +    -0.49583258645166 * Marital_StatusMarried
          +    -1.14824900824474 * Marital_StatusSingle
          +     0.57690093967839 * Marital_StatusTogether ;
   H1x2_7  = H1x2_7  +    -0.31251046777442 * Education2n_Cycle
          +    -1.69272922870259 * EducationBasic  +    -0.08682253496961 *
        EducationGraduation  +     0.58241644186309 * EducationMaster
          +     -1.1890908607447 * Marital_StatusDivorced
          +    -0.46668809907123 * Marital_StatusMarried
          +     1.20342564763422 * Marital_StatusSingle
          +    -1.75740662969578 * Marital_StatusTogether ;
   H1x2_1  =    -0.14973719401763 + H1x2_1 ;
   H1x2_2  =    -0.56259582407931 + H1x2_2 ;
   H1x2_3  =     0.42132483186492 + H1x2_3 ;
   H1x2_4  =      1.1996209421335 + H1x2_4 ;
   H1x2_5  =     0.95827018478011 + H1x2_5 ;
   H1x2_6  =     1.88844492435344 + H1x2_6 ;
   H1x2_7  =     0.77184516675485 + H1x2_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = EXP(MIN(H1x2_1 , _EXP_BAR));
   H1x2_2  = EXP(MIN(H1x2_2 , _EXP_BAR));
   H1x2_3  = EXP(MIN(H1x2_3 , _EXP_BAR));
   H1x2_4  = EXP(MIN(H1x2_4 , _EXP_BAR));
   H1x2_5  = EXP(MIN(H1x2_5 , _EXP_BAR));
   H1x2_6  = EXP(MIN(H1x2_6 , _EXP_BAR));
   H1x2_7  = EXP(MIN(H1x2_7 , _EXP_BAR));
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
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     0.10431866610268 * H1x1_1  +    -0.48100701431081 * H1x1_2
          +      1.1561061025832 * H1x1_3  +    -1.23928879501664 * H1x1_4
          +     1.22057275321508 * H1x1_5  +     0.21972347471711 * H1x1_6
          +    -0.98998788335495 * H1x1_7 ;
   P_DepVar1  = P_DepVar1  + -4.9985478923183E-10 * H1x2_1
          +   2.7724573038604E-6 * H1x2_2  +  -3.3263781208921E-6 * H1x2_3
          +     1.90169432265E-8 * H1x2_4  +  -9.7460294571708E-9 * H1x2_5
          +  -2.0885179583168E-6 * H1x2_6  +    3.038660449943E-8 * H1x2_7 ;
   P_DepVar1  =    -2.34500119066237 + P_DepVar1 ;
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
H1x1_1
H1x1_2
H1x1_3
H1x1_4
H1x1_5
H1x1_6
H1x1_7
H1x2_1
H1x2_2
H1x2_3
H1x2_4
H1x2_5
H1x2_6
H1x2_7
;
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
* Renaming Into variables for AutoNeural12;
*------------------------------------------------------------*;
length AutoNeural12_I_DepVar $32;
drop AutoNeural12_I_DepVar;
AutoNeural12_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural12;
*------------------------------------------------------------*;
length AutoNeural12_WARN_ $4;
drop AutoNeural12_WARN_;
AutoNeural12_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl38;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl38: Voting to produce predicted target;
*------------------------------------------------------------*;
array Ensmbl38_post{2} _temporary_;
array Ensmbl38_count{2} _temporary_;
array Ensmbl38_level{2} $32 _temporary_ (
"1"
"0"
);
do i=1 to 2;
Ensmbl38_post{i} = 0;
Ensmbl38_count{i} = 0;
end;
if AutoNeural6_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural6_P_DepVar1;
end;
if AutoNeural7_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural7_P_DepVar1;
end;
if AutoNeural8_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural8_P_DepVar1;
end;
if AutoNeural10_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural10_P_DepVar1;
end;
if AutoNeural9_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural9_P_DepVar1;
end;
if AutoNeural11_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural11_P_DepVar1;
end;
if AutoNeural12_I_DepVar = Ensmbl38_level{1} then do;
Ensmbl38_count{1} + 1;
Ensmbl38_post{1}=Ensmbl38_post{1}+ AutoNeural12_P_DepVar1;
end;
if AutoNeural6_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural6_P_DepVar0;
end;
if AutoNeural7_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural7_P_DepVar0;
end;
if AutoNeural8_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural8_P_DepVar0;
end;
if AutoNeural10_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural10_P_DepVar0;
end;
if AutoNeural9_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural9_P_DepVar0;
end;
if AutoNeural11_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural11_P_DepVar0;
end;
if AutoNeural12_I_DepVar = Ensmbl38_level{2} then do;
Ensmbl38_count{2} + 1;
Ensmbl38_post{2}=Ensmbl38_post{2}+ AutoNeural12_P_DepVar0;
end;
*------------------------------------------------------------*;
* Ensmbl38: Determine Into Variable;
*------------------------------------------------------------*;
length I_DepVar $32;
drop i vote_count vote_post;
vote_count = max(
Ensmbl38_count{1} ,
Ensmbl38_count{2}
);
do i=1 to 2;
if Ensmbl38_count{i}=vote_count and Ensmbl38_post{i}>vote_post then do;
I_DepVar = Ensmbl38_level{i};
vote_post = Ensmbl38_count{i};
end;
end;
*------------------------------------------------------------*;
* Ensmbl38: Compute posterior vars using models predicting the chosen level;
*------------------------------------------------------------*;
P_DepVar1 = 0;
P_DepVar0 = 0;
if I_DepVar = AutoNeural6_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural6_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural6_P_DepVar0;
end;
if I_DepVar = AutoNeural7_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural7_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural7_P_DepVar0;
end;
if I_DepVar = AutoNeural8_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural8_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural8_P_DepVar0;
end;
if I_DepVar = AutoNeural10_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural10_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural10_P_DepVar0;
end;
if I_DepVar = AutoNeural9_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural9_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural9_P_DepVar0;
end;
if I_DepVar = AutoNeural11_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural11_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural11_P_DepVar0;
end;
if I_DepVar = AutoNeural12_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural12_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural12_P_DepVar0;
end;
* Ensmbl38: Averaging posterior;
P_DepVar1 = P_DepVar1/vote_count;
P_DepVar0 = P_DepVar0/vote_count;
*------------------------------------------------------------*;
* Ensmbl38: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl38: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL6_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL6_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL6_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL6_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL8_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL8_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL8_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL8_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL10_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL10_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL10_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL10_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
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
