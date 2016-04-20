*------------------------------------------------------------*;
* Ensmbl44: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl44: Scoring Code of model 1 of 3;
*------------------------------------------------------------*;
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


length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(AcceptedCmp1,BEST.);
length _FILTERNORM1  $32;
drop _FILTERNORM1 ;
%dmnormcp(_FILTERFMT1,_FILTERNORM1);


length _FILTERFMT2  $200;
drop _FILTERFMT2 ;
_FILTERFMT2= put(AcceptedCmp2,BEST.);
length _FILTERNORM2  $32;
drop _FILTERNORM2 ;
%dmnormcp(_FILTERFMT2,_FILTERNORM2);


length _FILTERFMT3  $200;
drop _FILTERFMT3 ;
_FILTERFMT3= put(AcceptedCmp3,BEST.);
length _FILTERNORM3  $32;
drop _FILTERNORM3 ;
%dmnormcp(_FILTERFMT3,_FILTERNORM3);


length _FILTERFMT4  $200;
drop _FILTERFMT4 ;
_FILTERFMT4= put(AcceptedCmp4,BEST.);
length _FILTERNORM4  $32;
drop _FILTERNORM4 ;
%dmnormcp(_FILTERFMT4,_FILTERNORM4);


length _FILTERFMT5  $200;
drop _FILTERFMT5 ;
_FILTERFMT5= put(AcceptedCmp5,BEST.);
length _FILTERNORM5  $32;
drop _FILTERNORM5 ;
%dmnormcp(_FILTERFMT5,_FILTERNORM5);


length _FILTERFMT6  $200;
drop _FILTERFMT6 ;
_FILTERFMT6= put(Complain,BEST.);
length _FILTERNORM6  $32;
drop _FILTERNORM6 ;
%dmnormcp(_FILTERFMT6,_FILTERNORM6);


length _FILTERFMT7  $200;
drop _FILTERFMT7 ;
_FILTERFMT7= put(Education,$10.0);
length _FILTERNORM7  $32;
drop _FILTERNORM7 ;
%dmnormcp(_FILTERFMT7,_FILTERNORM7);


length _FILTERFMT8  $200;
drop _FILTERFMT8 ;
_FILTERFMT8= put(Marital_Status,$8.0);
length _FILTERNORM8  $32;
drop _FILTERNORM8 ;
%dmnormcp(_FILTERFMT8,_FILTERNORM8);
if
_FILTERNORM1 not in ( '.')
 and
_FILTERNORM2 not in ( '.')
 and
_FILTERNORM3 not in ( '.')
 and
_FILTERNORM4 not in ( '.')
 and
_FILTERNORM5 not in ( '.')
 and
_FILTERNORM6 not in ( '.')
 and
_FILTERNORM7 not in ( ' ')
 and
_FILTERNORM8 not in ( ' ')
and
( Dt_Customer ne .)
and ( Income ne . and (Income<=107000))
and ( Kidhome ne .)
and ( MntFishProducts ne .)
and ( MntFruits ne .)
and ( MntGoldProds ne .)
and ( MntMeatProducts ne . and (MntMeatProducts<=964))
and ( MntSweetProducts ne .)
and ( MntWines ne .)
and ( NumCatalogPurchases ne . and (NumCatalogPurchases<=14))
and ( NumDealsPurchases ne . and (NumDealsPurchases<=10.5))
and ( NumStorePurchases ne .)
and ( NumWebPurchases ne .)
and ( NumWebVisitsMonth ne . and (NumWebVisitsMonth<=13.42))
and ( Recency ne .)
and ( Teenhome ne .)
and ( Year_Birth ne .)
then do;
if M_FILTER eq . then M_FILTER = 0;
else M_FILTER = M_FILTER + 0;
end;
else M_FILTER = 1;
label M_FILTER = 'Filtered Indicator';
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
*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;
MonthsAsCustomer =int((today()-Dt_Customer)/12) ;
HigherEducationBinary =HigherEducation ;
NumDistPurchases =NumCatalogPurchases + NumWebPurchases ;
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
* Ensmbl44: Scoring Code of model 2 of 3;
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
* Ensmbl44: Scoring Code of model 3 of 3;
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
* Ensmbl44: Voting to produce predicted target;
*------------------------------------------------------------*;
array Ensmbl44_post{2} _temporary_;
array Ensmbl44_count{2} _temporary_;
array Ensmbl44_level{2} $32 _temporary_ (
"1"
"0"
);
do i=1 to 2;
Ensmbl44_post{i} = 0;
Ensmbl44_count{i} = 0;
end;
if AutoNeural9_I_DepVar = Ensmbl44_level{1} then do;
Ensmbl44_count{1} + 1;
Ensmbl44_post{1}=Ensmbl44_post{1}+ AutoNeural9_P_DepVar1;
end;
if AutoNeural11_I_DepVar = Ensmbl44_level{1} then do;
Ensmbl44_count{1} + 1;
Ensmbl44_post{1}=Ensmbl44_post{1}+ AutoNeural11_P_DepVar1;
end;
if AutoNeural12_I_DepVar = Ensmbl44_level{1} then do;
Ensmbl44_count{1} + 1;
Ensmbl44_post{1}=Ensmbl44_post{1}+ AutoNeural12_P_DepVar1;
end;
if AutoNeural9_I_DepVar = Ensmbl44_level{2} then do;
Ensmbl44_count{2} + 1;
Ensmbl44_post{2}=Ensmbl44_post{2}+ AutoNeural9_P_DepVar0;
end;
if AutoNeural11_I_DepVar = Ensmbl44_level{2} then do;
Ensmbl44_count{2} + 1;
Ensmbl44_post{2}=Ensmbl44_post{2}+ AutoNeural11_P_DepVar0;
end;
if AutoNeural12_I_DepVar = Ensmbl44_level{2} then do;
Ensmbl44_count{2} + 1;
Ensmbl44_post{2}=Ensmbl44_post{2}+ AutoNeural12_P_DepVar0;
end;
*------------------------------------------------------------*;
* Ensmbl44: Determine Into Variable;
*------------------------------------------------------------*;
length I_DepVar $32;
drop i vote_count vote_post;
vote_count = max(
Ensmbl44_count{1} ,
Ensmbl44_count{2}
);
do i=1 to 2;
if Ensmbl44_count{i}=vote_count and Ensmbl44_post{i}>vote_post then do;
I_DepVar = Ensmbl44_level{i};
vote_post = Ensmbl44_count{i};
end;
end;
*------------------------------------------------------------*;
* Ensmbl44: Compute posterior vars using models predicting the chosen level;
*------------------------------------------------------------*;
P_DepVar1 = 0;
P_DepVar0 = 0;
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
* Ensmbl44: Averaging posterior;
P_DepVar1 = P_DepVar1/vote_count;
P_DepVar0 = P_DepVar0/vote_count;
*------------------------------------------------------------*;
* Ensmbl44: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl44: Computing _WARN_ Variable;
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
