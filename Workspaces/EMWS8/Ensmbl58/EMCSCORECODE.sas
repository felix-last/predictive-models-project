*------------------------------------------------------------*;
* Ensmbl58: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl58: Scoring Code of model 1 of 7;
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
* Ensmbl58: Scoring Code of model 2 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural43;
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
drop S_:;
* Renaming variables for AutoNeural43;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural43;
*------------------------------------------------------------*;
drop AutoNeural43_P_DepVar1;
AutoNeural43_P_DepVar1 = P_DepVar1;
drop AutoNeural43_P_DepVar0;
AutoNeural43_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural43;
*------------------------------------------------------------*;
length AutoNeural43_WARN_ $4;
drop AutoNeural43_WARN_;
AutoNeural43_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl58: Scoring Code of model 3 of 7;
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
* Ensmbl58: Scoring Code of model 4 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural41;
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
   H1x1_1  =     0.00788029676844 * S_Income  +    -0.91535527861933 *
        S_Kidhome  +    -0.25225116407302 * S_MntFishProducts
          +    -0.18797076337897 * S_MntFruits  +    -0.44902183906131 *
        S_MntGoldProds  +      2.2767772850691 * S_MntMeatProducts
          +     -0.2030617183738 * S_MntSweetProducts
          +    -3.00492674390268 * S_MntWines  +     0.79341578039366 *
        S_NumCatalogPurchases  +     0.87204448909716 * S_NumDealsPurchases
          +    -2.67074303965293 * S_NumStorePurchases
          +    -0.84694619593676 * S_NumWebPurchases
          +     1.78464945757548 * S_NumWebVisitsMonth
          +    -1.79669645209961 * S_Recency  +     0.12484193160086 *
        S_Teenhome ;
   H1x1_2  =     0.89056482755935 * S_Income  +    -1.26858223800375 *
        S_Kidhome  +    -0.21524958568885 * S_MntFishProducts
          +     0.09518715448323 * S_MntFruits  +    -0.19863573935492 *
        S_MntGoldProds  +     1.18841616001527 * S_MntMeatProducts
          +    -0.48853587268985 * S_MntSweetProducts
          +      -0.414993830248 * S_MntWines  +     1.47883555237605 *
        S_NumCatalogPurchases  +     0.83644109170588 * S_NumDealsPurchases
          +    -1.10593499185395 * S_NumStorePurchases
          +     -1.3003228821842 * S_NumWebPurchases
          +     2.87047131261901 * S_NumWebVisitsMonth
          +    -3.10727941128136 * S_Recency  +     -1.2351049603093 *
        S_Teenhome ;
   H1x1_3  =    -0.59621293188677 * S_Income  +    -0.98204600423622 *
        S_Kidhome  +     0.82413780234399 * S_MntFishProducts
          +     0.39739163071946 * S_MntFruits  +    -0.49042553659196 *
        S_MntGoldProds  +    -4.39932579909415 * S_MntMeatProducts
          +    -0.27795094909244 * S_MntSweetProducts
          +     0.24963500961568 * S_MntWines  +     -0.5239489331422 *
        S_NumCatalogPurchases  +    -0.90657315438752 * S_NumDealsPurchases
          +    -0.41332499072246 * S_NumStorePurchases
          +     0.76626053410817 * S_NumWebPurchases
          +     0.81795211037296 * S_NumWebVisitsMonth
          +    -0.50876365872417 * S_Recency  +     0.41668164622243 *
        S_Teenhome ;
   H1x1_4  =     0.96283488963096 * S_Income  +    -0.87986849758504 *
        S_Kidhome  +     -0.1136919534185 * S_MntFishProducts
          +    -0.29232436238858 * S_MntFruits  +      0.1837511707412 *
        S_MntGoldProds  +     0.70727712145719 * S_MntMeatProducts
          +    -0.08285620819867 * S_MntSweetProducts
          +    -2.34391341405204 * S_MntWines  +     1.28790868462455 *
        S_NumCatalogPurchases  +    -0.66448120419076 * S_NumDealsPurchases
          +    -0.17691098721908 * S_NumStorePurchases
          +     0.46246892093576 * S_NumWebPurchases
          +     2.06272832836908 * S_NumWebVisitsMonth
          +    -2.20357897947054 * S_Recency  +    -0.21370157733704 *
        S_Teenhome ;
   H1x1_1  = H1x1_1  +    -1.11882466050741 * AcceptedCmp10
          +    -0.02672648348788 * AcceptedCmp20  +     -0.9935054015775 *
        AcceptedCmp30  +    -0.40619950578221 * AcceptedCmp40
          +     0.75861408836828 * AcceptedCmp50  +    -0.08119659353213 *
        Complain0 ;
   H1x1_2  = H1x1_2  +    -1.19874175712489 * AcceptedCmp10
          +    -1.39569753392124 * AcceptedCmp20  +    -1.40792768449965 *
        AcceptedCmp30  +    -1.33621370186337 * AcceptedCmp40
          +    -1.28850585600497 * AcceptedCmp50  +     1.54913459648682 *
        Complain0 ;
   H1x1_3  = H1x1_3  +      0.8900995500275 * AcceptedCmp10
          +     0.63129973315749 * AcceptedCmp20  +    -0.31513199468014 *
        AcceptedCmp30  +     0.36000457467611 * AcceptedCmp40
          +     0.62901278737039 * AcceptedCmp50  +     0.13436691399472 *
        Complain0 ;
   H1x1_4  = H1x1_4  +     -0.4761315940218 * AcceptedCmp10
          +     0.04116528443754 * AcceptedCmp20  +    -1.31248665137501 *
        AcceptedCmp30  +    -1.13922224536841 * AcceptedCmp40
          +    -1.71240975292363 * AcceptedCmp50  +     0.98794736218555 *
        Complain0 ;
   H1x1_1  = H1x1_1  +    -0.19427690904448 * Education2n_Cycle
          +    -0.78361431701943 * EducationBasic  +     0.70012279609726 *
        EducationGraduation  +    -0.51132563359945 * EducationMaster
          +     1.59526812226707 * Marital_StatusDivorced
          +    -0.74331656724296 * Marital_StatusMarried
          +     0.74316614019998 * Marital_StatusSingle
          +    -1.36761487171479 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.76077191404637 * Education2n_Cycle
          +    -0.22680587409979 * EducationBasic  +     0.19812025591093 *
        EducationGraduation  +     0.07596142730184 * EducationMaster
          +     0.94291322065497 * Marital_StatusDivorced
          +    -1.64331597630127 * Marital_StatusMarried
          +     2.21526196736604 * Marital_StatusSingle
          +    -1.52687548646297 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.22328003539059 * Education2n_Cycle
          +    -0.56253476355283 * EducationBasic  +     0.43074608752346 *
        EducationGraduation  +    -0.59791003195469 * EducationMaster
          +     1.63906979191221 * Marital_StatusDivorced
          +    -1.00497354965718 * Marital_StatusMarried
          +     0.70485207953497 * Marital_StatusSingle
          +    -1.55917756143873 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.85325476712793 * Education2n_Cycle
          +    -0.10167049440435 * EducationBasic  +     0.11808465181014 *
        EducationGraduation  +     -0.1847363034021 * EducationMaster
          +     0.75038128420756 * Marital_StatusDivorced
          +    -1.93055855198469 * Marital_StatusMarried
          +     0.73816798380254 * Marital_StatusSingle
          +    -1.77103687011169 * Marital_StatusTogether ;
   H1x1_1  =    -0.97292943558748 + H1x1_1 ;
   H1x1_2  =      -0.767474595653 + H1x1_2 ;
   H1x1_3  =    -1.54289542125346 + H1x1_3 ;
   H1x1_4  =     0.11531219453063 + H1x1_4 ;
   H1x1_5  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 );
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
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     4.87259918787296 * H1x1_1  +     21.0865386977957 * H1x1_2
          +    -8.49666483029666 * H1x1_3  +     4.50140461489884 * H1x1_4
          +    -19.2888668755466 * H1x1_5 ;
   P_DepVar1  =     0.94995870883169 + P_DepVar1 ;
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
* Renaming variables for AutoNeural41;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural41;
*------------------------------------------------------------*;
drop AutoNeural41_P_DepVar1;
AutoNeural41_P_DepVar1 = P_DepVar1;
drop AutoNeural41_P_DepVar0;
AutoNeural41_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural41;
*------------------------------------------------------------*;
length AutoNeural41_WARN_ $4;
drop AutoNeural41_WARN_;
AutoNeural41_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl58: Scoring Code of model 5 of 7;
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
* Ensmbl58: Scoring Code of model 6 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural45;
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
* Renaming variables for AutoNeural45;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural45;
*------------------------------------------------------------*;
drop AutoNeural45_P_DepVar1;
AutoNeural45_P_DepVar1 = P_DepVar1;
drop AutoNeural45_P_DepVar0;
AutoNeural45_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural45;
*------------------------------------------------------------*;
length AutoNeural45_WARN_ $4;
drop AutoNeural45_WARN_;
AutoNeural45_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl58: Scoring Code of model 7 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural44;
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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

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
   H1x1_1  =     0.60821559277699 * S_Income  +     0.78245878520575 *
        S_Kidhome  +     3.02629225919456 * S_MntFishProducts
          +     1.44208452883494 * S_MntFruits  +     -0.8161710906244 *
        S_MntGoldProds  +    -5.65479728306763 * S_MntMeatProducts
          +     2.41993296129914 * S_MntSweetProducts
          +     16.1416936305202 * S_MntWines  +    -0.30170648366369 *
        S_NumCatalogPurchases  +    -4.40539425596446 * S_NumDealsPurchases
          +     7.59231492380468 * S_NumStorePurchases
          +    -0.47095655313121 * S_NumWebPurchases
          +     2.65669932372712 * S_NumWebVisitsMonth
          +     0.92605434462951 * S_Recency  +     0.27595278529362 *
        S_Teenhome ;
   H1x1_1  = H1x1_1  +     2.22617132301519 * AcceptedCmp10
          +     2.97389891933054 * AcceptedCmp20  +    -0.25852677589668 *
        AcceptedCmp30  +     0.29740935303964 * AcceptedCmp40
          +     6.80320564322924 * AcceptedCmp50  +     2.19745012825493 *
        Complain0 ;
   H1x1_1  = H1x1_1  +     2.55205464559227 * Education2n_Cycle
          +    -0.98577713200024 * EducationBasic  +     1.74619403557996 *
        EducationGraduation  +    -3.89600865490994 * EducationMaster
          +     0.44728218776544 * Marital_StatusDivorced
          +    -1.62458831276183 * Marital_StatusMarried
          +    -0.42858616367237 * Marital_StatusSingle
          +    -0.29553796445711 * Marital_StatusTogether ;
   H1x1_1  =     3.59078196202385 + H1x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -0.99188645731967 * S_Income  +    -0.76771098590807 *
        S_Kidhome  +      0.8287505285538 * S_MntFishProducts
          +     0.45999682434351 * S_MntFruits  +      0.4293543408639 *
        S_MntGoldProds  +    -9.07723801877759 * S_MntMeatProducts
          +    -1.37098390846164 * S_MntSweetProducts
          +    -0.51776810310879 * S_MntWines  +    -1.37476010659628 *
        S_NumCatalogPurchases  +    -1.10451572937532 * S_NumDealsPurchases
          +     0.58246769316602 * S_NumStorePurchases
          +     2.72780243156581 * S_NumWebPurchases
          +    -1.73896446530763 * S_NumWebVisitsMonth
          +      0.7638963348072 * S_Recency  +     0.26979377997458 *
        S_Teenhome ;
   H1x2_1  = H1x2_1  +     2.43014219686416 * AcceptedCmp10
          +    -4.74345515374868 * AcceptedCmp20  +     0.62579233621413 *
        AcceptedCmp30  +     0.64637471234006 * AcceptedCmp40
          +     1.70767935570268 * AcceptedCmp50  +    -0.94631514600478 *
        Complain0 ;
   H1x2_1  = H1x2_1  +    -0.98761508407831 * Education2n_Cycle
          +     0.88643388278508 * EducationBasic  +    -0.83878459420096 *
        EducationGraduation  +     1.01072132252596 * EducationMaster
          +     0.08221095774854 * Marital_StatusDivorced
          +    -0.13062113450086 * Marital_StatusMarried
          +      0.1912119500185 * Marital_StatusSingle
          +     -0.3728209764276 * Marital_StatusTogether ;
   H1x2_1  =    -3.03275566330542 + H1x2_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -1.55963738420881 * S_Income  +     0.71964926339388 *
        S_Kidhome  +    -0.47208108972067 * S_MntFishProducts
          +      0.6450894987393 * S_MntFruits  +     0.06261669147127 *
        S_MntGoldProds  +     0.14975522509881 * S_MntMeatProducts
          +     -0.4771357321143 * S_MntSweetProducts
          +     0.66709116843422 * S_MntWines  +     0.90111404700817 *
        S_NumCatalogPurchases  +     0.17723895187345 * S_NumDealsPurchases
          +     0.38755002642582 * S_NumStorePurchases
          +     0.65178643881164 * S_NumWebPurchases
          +    -0.83170832622452 * S_NumWebVisitsMonth
          +     2.65115346957983 * S_Recency  +     1.27228948382376 *
        S_Teenhome ;
   H1x3_1  = H1x3_1  +     0.29816272417051 * AcceptedCmp10
          +    -0.71154376870988 * AcceptedCmp20  +    -0.39513051704909 *
        AcceptedCmp30  +     1.19068615672558 * AcceptedCmp40
          +     -1.9640044684445 * AcceptedCmp50  +    -0.09395110959453 *
        Complain0 ;
   H1x3_1  = H1x3_1  +    -0.43809514270646 * Education2n_Cycle
          +     0.27926697891252 * EducationBasic  +     1.12178568429269 *
        EducationGraduation  +      0.9696976240987 * EducationMaster
          +    -0.13574340372484 * Marital_StatusDivorced
          +     1.26001446384238 * Marital_StatusMarried
          +    -0.16294618258246 * Marital_StatusSingle
          +    -0.31789534786196 * Marital_StatusTogether ;
   H1x3_1  =     0.67537485509128 + H1x3_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x3_1  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     1.66176856703373 * H1x1_1 ;
   H2x1_1  = H2x1_1  +     2.22197952592224 * H1x2_1 ;
   H2x1_1  = H2x1_1  +     1.05148827727504 * H1x3_1 ;
   H2x1_1  =    -1.97152028826028 + H2x1_1 ;
   H2x1_1  = SIN(H2x1_1 );
END;
ELSE DO;
   H2x1_1  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     0.45033423451322 * H1x1_1 ;
   H2x2_1  = H2x2_1  +     2.46855103154551 * H1x2_1 ;
   H2x2_1  = H2x2_1  +    -0.77837055555012 * H1x3_1 ;
   H2x2_1  =     -0.9821313826813 + H2x2_1 ;
   H2x2_1  = SIN(H2x2_1 );
END;
ELSE DO;
   H2x2_1  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =    -4.89394761736069 * H2x1_1 ;
   H3x1_1  = H3x1_1  +    -3.02496799626931 * H2x2_1 ;
   H3x1_1  =    -2.03654026915424 + H3x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H3x1_1  = 1.0 / (1.0 + EXP(MIN( - H3x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H3x1_1  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =      11.443408553765 * H3x1_1 ;
   P_DepVar1  =     0.39570054021751 + P_DepVar1 ;
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
* Renaming variables for AutoNeural44;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural44;
*------------------------------------------------------------*;
drop AutoNeural44_P_DepVar1;
AutoNeural44_P_DepVar1 = P_DepVar1;
drop AutoNeural44_P_DepVar0;
AutoNeural44_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural44;
*------------------------------------------------------------*;
length AutoNeural44_WARN_ $4;
drop AutoNeural44_WARN_;
AutoNeural44_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl58: Maximum Posteriors of 7 models;
*------------------------------------------------------------*;
_psum = 0;
drop _psum _premainder;
P_DepVar1 = max(
AutoNeural46_P_DepVar1 ,
AutoNeural43_P_DepVar1 ,
AutoNeural42_P_DepVar1 ,
AutoNeural41_P_DepVar1 ,
AutoNeural47_P_DepVar1 ,
AutoNeural45_P_DepVar1 ,
AutoNeural44_P_DepVar1
);
_premainder =1 - _psum;
if P_DepVar1 > _premainder then do;
P_DepVar1 = _premainder;
end;
_psum + P_DepVar1;
P_DepVar0 = max(
AutoNeural46_P_DepVar0 ,
AutoNeural43_P_DepVar0 ,
AutoNeural42_P_DepVar0 ,
AutoNeural41_P_DepVar0 ,
AutoNeural47_P_DepVar0 ,
AutoNeural45_P_DepVar0 ,
AutoNeural44_P_DepVar0
);
_premainder =1 - _psum;
if P_DepVar0 > _premainder then do;
P_DepVar0 = _premainder;
end;
_psum + P_DepVar0;
*------------------------------------------------------------*;
* Ensmbl58: Computing Classification Vars;
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
* Ensmbl58: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl58: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL46_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL46_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL46_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL46_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL43_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL43_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL43_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL43_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL42_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL42_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL42_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL42_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL41_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL41_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL41_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL41_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL47_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL47_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL47_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL47_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL45_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL45_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL45_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL45_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL44_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL44_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL44_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL44_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
