*------------------------------------------------------------*;
* Ensmbl5: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl5: Scoring Code of model 1 of 5;
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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   H1x1_1  =     0.26227897937716 * S_AcceptedCmpTotal
          +     -0.0155758157867 * S_Age  +    -0.20268934440257 * S_Frq
          +    -0.18529976542103 * S_Income  +     0.18038928903961 *
        S_Kidhome  +    -0.28961354349068 * S_Mnt  +    -0.05151010840858 *
        S_MntFishProducts  +    -0.03759341636928 * S_MntFruits
          +     0.01305575717465 * S_MntGoldProds  +     0.24307680778257 *
        S_MntMeatProducts  +    -0.02893363709307 * S_MntSweetProducts
          +    -0.35324697751403 * S_MntWines  +    -0.00781254837323 *
        S_MonthsAsCustomer  +     0.15222992290422 * S_NumCatalogPurchases
          +     0.09708841024031 * S_NumDealsPurchases
          +    -0.29075561032014 * S_NumDistPurchases
          +    -0.14495394259873 * S_NumStorePurchases
          +     0.11890705145732 * S_NumWebPurchases
          +    -0.16954189911344 * S_NumWebVisitsMonth
          +     0.12377939462638 * S_RFMstat  +    -0.05870604523801 *
        S_RMntFrq  +     0.17150719398884 * S_Recency
          +     0.13642607109645 * S_Teenhome ;
   H1x1_2  =     0.26173967942961 * S_AcceptedCmpTotal
          +    -0.00424968908882 * S_Age  +    -0.07102902276221 * S_Frq
          +     0.17373040625452 * S_Income  +    -0.12612693849717 *
        S_Kidhome  +    -0.40114393645566 * S_Mnt  +    -0.06800009910731 *
        S_MntFishProducts  +    -0.06681994193124 * S_MntFruits
          +     0.00602505287702 * S_MntGoldProds  +     0.29533767747106 *
        S_MntMeatProducts  +    -0.06832235425976 * S_MntSweetProducts
          +    -0.44970327281811 * S_MntWines  +    -0.01061648191158 *
        S_MonthsAsCustomer  +      0.3402332775449 * S_NumCatalogPurchases
          +     0.16274478997892 * S_NumDealsPurchases
          +     0.03966958784582 * S_NumDistPurchases
          +    -0.04714110726598 * S_NumStorePurchases
          +    -0.02124229528082 * S_NumWebPurchases
          +     0.29753299776832 * S_NumWebVisitsMonth
          +     0.08114418100212 * S_RFMstat  +     0.39051989081881 *
        S_RMntFrq  +     -0.3340129986623 * S_Recency
          +    -0.11108871458308 * S_Teenhome ;
   H1x1_1  = H1x1_1  +      0.1756873442571 * AcceptedCmp10
          +     0.31180024044306 * AcceptedCmp20  +     0.29619883713337 *
        AcceptedCmp30  +     0.30154500722412 * AcceptedCmp40
          +     0.19297823461379 * AcceptedCmp50  +     -0.2612666063344 *
        Complain0  +    -0.07979877068908 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +      0.0093987850789 * AcceptedCmp10
          +     0.01121417299451 * AcceptedCmp20  +     0.02978720081114 *
        AcceptedCmp30  +     0.03675035164823 * AcceptedCmp40
          +      0.0326403700043 * AcceptedCmp50  +     0.12620299225555 *
        Complain0  +    -0.08132205666396 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.03360721558666 * Education2n_Cycle
          +     0.15032252273168 * EducationBasic  +    -0.00292639237041 *
        EducationGraduation  +     0.00619669837452 * EducationMaster
          +    -0.05037639679806 * Marital_StatusDivorced
          +     0.28781968727878 * Marital_StatusMarried
          +    -0.20382417074384 * Marital_StatusSingle
          +     0.20088888064707 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.12543856607452 * Education2n_Cycle
          +      0.0095562801112 * EducationBasic  +    -0.04438983662274 *
        EducationGraduation  +    -0.06952670554019 * EducationMaster
          +     0.06970969219123 * Marital_StatusDivorced
          +    -0.15787475744986 * Marital_StatusMarried
          +     0.14345344072192 * Marital_StatusSingle
          +    -0.12758942067533 * Marital_StatusTogether ;
   H1x1_1  =     0.90517220350758 + H1x1_1 ;
   H1x1_2  =    -0.60383186342134 + H1x1_2 ;
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
   P_DepVar1  =     -11.151440981908 * H1x1_1  +     16.6040498320868 * H1x1_2
         ;
   P_DepVar1  =     2.38025141404985 + P_DepVar1 ;
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
* Ensmbl5: Scoring Code of model 2 of 5;
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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   H1x1_1  =    -1.01373445510498 * S_AcceptedCmpTotal
          +     0.33447979473871 * S_Age  +    -0.49864038088294 * S_Frq
          +     0.31694253224638 * S_Income  +    -0.88502516255759 *
        S_Kidhome  +    -0.95839165156922 * S_Mnt  +     1.08690890979971 *
        S_MntFishProducts  +     0.21350737967446 * S_MntFruits
          +     0.07347211887091 * S_MntGoldProds  +    -4.25839540508751 *
        S_MntMeatProducts  +    -0.18409636621761 * S_MntSweetProducts
          +     0.92254071667819 * S_MntWines  +     0.17286447654032 *
        S_MonthsAsCustomer  +    -1.64446119745791 * S_NumCatalogPurchases
          +    -1.14704878034134 * S_NumDealsPurchases
          +    -0.17763404274659 * S_NumDistPurchases
          +     0.08894400267969 * S_NumStorePurchases
          +     0.59283747891957 * S_NumWebPurchases
          +     0.85268274682505 * S_NumWebVisitsMonth
          +    -0.43035426151546 * S_RFMstat  +     0.52915289749814 *
        S_RMntFrq  +    -1.22871580072103 * S_Recency
          +    -0.42049179704691 * S_Teenhome ;
   H1x1_2  =    -0.17196520392875 * S_AcceptedCmpTotal
          +     0.09368836975829 * S_Age  +     -0.2079821803313 * S_Frq
          +    -0.59508480939905 * S_Income  +     0.34485068405931 *
        S_Kidhome  +     0.68503953220301 * S_Mnt  +    -0.41832366462675 *
        S_MntFishProducts  +      0.3374808822635 * S_MntFruits
          +     0.41521872138137 * S_MntGoldProds  +     1.55234986522641 *
        S_MntMeatProducts  +     0.17336981388128 * S_MntSweetProducts
          +    -0.03736062165339 * S_MntWines  +     0.20414742233604 *
        S_MonthsAsCustomer  +    -1.29756795361717 * S_NumCatalogPurchases
          +    -0.80841566068716 * S_NumDealsPurchases
          +    -0.17995640033768 * S_NumDistPurchases
          +     0.00713417460936 * S_NumStorePurchases
          +     0.57881024323076 * S_NumWebPurchases
          +    -1.35134224257365 * S_NumWebVisitsMonth
          +     0.63440441349443 * S_RFMstat  +      0.7029589919795 *
        S_RMntFrq  +     1.16978656262499 * S_Recency
          +     0.22916564304766 * S_Teenhome ;
   H1x1_3  =     1.25968793568007 * S_AcceptedCmpTotal
          +     0.16058002256905 * S_Age  +    -1.00283978743671 * S_Frq
          +     0.80202770811665 * S_Income  +     -0.7384690128283 *
        S_Kidhome  +      0.6320116033322 * S_Mnt  +    -0.48862240567237 *
        S_MntFishProducts  +     0.26477442063044 * S_MntFruits
          +       0.434753861356 * S_MntGoldProds  +     3.54637875222405 *
        S_MntMeatProducts  +    -0.09532877173293 * S_MntSweetProducts
          +    -0.60614222423624 * S_MntWines  +     0.06807192728487 *
        S_MonthsAsCustomer  +     0.45280110551612 * S_NumCatalogPurchases
          +     0.57891364118717 * S_NumDealsPurchases
          +    -0.31024556838688 * S_NumDistPurchases
          +    -1.48708542986704 * S_NumStorePurchases
          +    -0.93009875249206 * S_NumWebPurchases
          +     2.01900039122935 * S_NumWebVisitsMonth
          +     0.50006472616383 * S_RFMstat  +    -1.16854599018819 *
        S_RMntFrq  +    -2.30414631760388 * S_Recency
          +    -0.64226055895142 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.90039925512906 * AcceptedCmp10
          +    -0.47386683647261 * AcceptedCmp20  +    -0.71163968851557 *
        AcceptedCmp30  +    -1.10005761198573 * AcceptedCmp40
          +     0.81604940024858 * AcceptedCmp50  +    -0.03266697009221 *
        Complain0  +     0.45877513475435 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.09498245462104 * AcceptedCmp10
          +     -0.5878058848086 * AcceptedCmp20  +     1.08802173663414 *
        AcceptedCmp30  +      0.4681907014168 * AcceptedCmp40
          +    -1.71290692396514 * AcceptedCmp50  +    -0.47229847844337 *
        Complain0  +     0.41790693564846 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.14466250407205 * AcceptedCmp10
          +    -0.05281153450358 * AcceptedCmp20  +     0.30771572513376 *
        AcceptedCmp30  +    -0.25237634767535 * AcceptedCmp40
          +    -2.36680490171638 * AcceptedCmp50  +    -0.12273085838026 *
        Complain0  +     0.40951032893236 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.00834762223325 * Education2n_Cycle
          +    -0.42766880626216 * EducationBasic  +    -0.47517247816239 *
        EducationGraduation  +    -0.68730596079478 * EducationMaster
          +     0.55883606830033 * Marital_StatusDivorced
          +    -0.54530037567066 * Marital_StatusMarried
          +    -0.52994736075753 * Marital_StatusSingle
          +    -0.53882341831078 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.22709215793074 * Education2n_Cycle
          +     0.07643166113928 * EducationBasic  +    -0.97269335071824 *
        EducationGraduation  +     0.31201349236277 * EducationMaster
          +    -1.07368484057033 * Marital_StatusDivorced
          +     2.73313504711262 * Marital_StatusMarried
          +    -2.18530462876058 * Marital_StatusSingle
          +     2.38158278480467 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.04453578767387 * Education2n_Cycle
          +    -0.65383041132508 * EducationBasic  +    -0.17789960866108 *
        EducationGraduation  +    -0.35544166792219 * EducationMaster
          +     0.49993144243043 * Marital_StatusDivorced
          +    -0.38953339116829 * Marital_StatusMarried
          +    -0.10836287319942 * Marital_StatusSingle
          +    -0.42049990939036 * Marital_StatusTogether ;
   H1x1_1  =    -0.67322256806566 + H1x1_1 ;
   H1x1_2  =     1.02621981675321 + H1x1_2 ;
   H1x1_3  =     1.79721701815172 + H1x1_3 ;
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
   P_DepVar1  =    -3.84261611144245 * H1x1_1  +    -7.15065431642895 * H1x1_2
          +       11.29639646928 * H1x1_3  +    -2.12563351481128 * H1x1_4 ;
   P_DepVar1  =    -3.54755955929493 + P_DepVar1 ;
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
* Ensmbl5: Scoring Code of model 3 of 5;
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

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x1_7 = 'Hidden: H2x1_=7' ;

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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   H1x1_1  =     0.63316204656896 * S_AcceptedCmpTotal
          +    -0.24884200883415 * S_Age  +      -0.236584005151 * S_Frq
          +     0.25406117591995 * S_Income  +    -0.56304122955704 *
        S_Kidhome  +    -0.23687782938793 * S_Mnt  +    -0.09770906650074 *
        S_MntFishProducts  +    -0.73487360819716 * S_MntFruits
          +     0.14293909908147 * S_MntGoldProds  +     2.25015000307426 *
        S_MntMeatProducts  +    -0.42178958150661 * S_MntSweetProducts
          +    -2.35340366839307 * S_MntWines  +    -0.02380265380154 *
        S_MonthsAsCustomer  +     1.16509321438746 * S_NumCatalogPurchases
          +     1.17276395296242 * S_NumDealsPurchases
          +     0.26632768295477 * S_NumDistPurchases
          +    -1.26575615903579 * S_NumStorePurchases
          +    -0.95316107557927 * S_NumWebPurchases
          +     1.01828574356487 * S_NumWebVisitsMonth
          +       0.795866263515 * S_RFMstat  +    -0.20490378142832 *
        S_RMntFrq  +    -0.82943281422857 * S_Recency
          +     0.16132418388418 * S_Teenhome ;
   H1x1_2  =    -0.43482920479481 * S_AcceptedCmpTotal
          +     0.53350211221915 * S_Age  +    -0.06797700766223 * S_Frq
          +     0.13771322007949 * S_Income  +     0.87012019559698 *
        S_Kidhome  +     0.06026853274247 * S_Mnt  +    -0.43150595882972 *
        S_MntFishProducts  +    -0.13728591661063 * S_MntFruits
          +     0.35443873962923 * S_MntGoldProds  +     0.28102965401547 *
        S_MntMeatProducts  +     0.52367949052365 * S_MntSweetProducts
          +     0.35553595364078 * S_MntWines  +     0.37892120128383 *
        S_MonthsAsCustomer  +     0.59057645965187 * S_NumCatalogPurchases
          +     1.14485571201233 * S_NumDealsPurchases
          +     0.21414266588987 * S_NumDistPurchases
          +    -0.10530090074297 * S_NumStorePurchases
          +    -0.41712321238458 * S_NumWebPurchases
          +    -0.99760766791108 * S_NumWebVisitsMonth
          +    -0.90203265666387 * S_RFMstat  +    -0.60947922673601 *
        S_RMntFrq  +     1.10040128548883 * S_Recency
          +     0.16728431679949 * S_Teenhome ;
   H1x1_3  =     0.26373486938499 * S_AcceptedCmpTotal
          +    -0.22246756314756 * S_Age  +     0.49537720979115 * S_Frq
          +     1.38815981786544 * S_Income  +    -0.93015968695331 *
        S_Kidhome  +     0.11586216615481 * S_Mnt  +    -0.02105973515345 *
        S_MntFishProducts  +    -0.28078442249811 * S_MntFruits
          +    -0.01763878655129 * S_MntGoldProds  +     0.83934619541231 *
        S_MntMeatProducts  +    -0.23417310915433 * S_MntSweetProducts
          +    -0.29135819585991 * S_MntWines  +    -0.20792872642036 *
        S_MonthsAsCustomer  +     1.05218745810839 * S_NumCatalogPurchases
          +      0.7196418967437 * S_NumDealsPurchases
          +     0.69035286374177 * S_NumDistPurchases
          +     0.38027656631135 * S_NumStorePurchases
          +    -0.18878358997924 * S_NumWebPurchases
          +     1.61962062004798 * S_NumWebVisitsMonth
          +    -0.04575386719745 * S_RFMstat  +     1.16358450490635 *
        S_RMntFrq  +    -2.13821542142822 * S_Recency
          +    -1.28960355207697 * S_Teenhome ;
   H1x1_4  =    -0.34331113295243 * S_AcceptedCmpTotal
          +    -0.39878146063012 * S_Age  +     0.10068367322473 * S_Frq
          +    -0.20171643525685 * S_Income  +    -0.76934260520569 *
        S_Kidhome  +    -0.66782690219397 * S_Mnt  +     0.80905970181803 *
        S_MntFishProducts  +    -0.03688782193215 * S_MntFruits
          +     0.06641568264972 * S_MntGoldProds  +    -3.32390323965822 *
        S_MntMeatProducts  +    -0.05413014598032 * S_MntSweetProducts
          +     1.07708707113306 * S_MntWines  +     0.13185264889978 *
        S_MonthsAsCustomer  +    -0.39476201074171 * S_NumCatalogPurchases
          +    -0.00642902007204 * S_NumDealsPurchases
          +     0.29785069480367 * S_NumDistPurchases
          +    -0.42243322063147 * S_NumStorePurchases
          +     0.54880896338383 * S_NumWebPurchases
          +    -0.12525846016886 * S_NumWebVisitsMonth
          +    -0.31397100953189 * S_RFMstat  +     -0.5192863720509 *
        S_RMntFrq  +     0.10252211581449 * S_Recency
          +     0.44223031313104 * S_Teenhome ;
   H1x1_5  =    -0.89949577087728 * S_AcceptedCmpTotal
          +     -0.5133669560115 * S_Age  +     0.55814120515869 * S_Frq
          +    -0.72790553700689 * S_Income  +     1.13470491167406 *
        S_Kidhome  +     0.42465795563071 * S_Mnt  +     0.22642900369653 *
        S_MntFishProducts  +    -0.10149694753146 * S_MntFruits
          +    -0.05203167914723 * S_MntGoldProds  +    -0.42300460593042 *
        S_MntMeatProducts  +    -0.11178206624825 * S_MntSweetProducts
          +     1.57257994445012 * S_MntWines  +     0.02297554927807 *
        S_MonthsAsCustomer  +    -0.60721423552141 * S_NumCatalogPurchases
          +    -0.48404738328225 * S_NumDealsPurchases
          +    -0.02464180457879 * S_NumDistPurchases
          +     1.17201831082067 * S_NumStorePurchases
          +     0.57453655167516 * S_NumWebPurchases
          +    -1.94417019790248 * S_NumWebVisitsMonth
          +     0.00073301476364 * S_RFMstat  +     0.12295343326875 *
        S_RMntFrq  +      1.6169916658132 * S_Recency
          +     0.09488579305439 * S_Teenhome ;
   H1x1_6  =     0.01224996381937 * S_AcceptedCmpTotal
          +     0.56818460209578 * S_Age  +    -0.50544994791872 * S_Frq
          +    -0.39086889823619 * S_Income  +      0.2278709145292 *
        S_Kidhome  +       0.221310975162 * S_Mnt  +     -0.2208719427117 *
        S_MntFishProducts  +     0.33199116637803 * S_MntFruits
          +    -0.20919304257884 * S_MntGoldProds  +     0.85155045239396 *
        S_MntMeatProducts  +     0.32150401526792 * S_MntSweetProducts
          +     0.24789026157513 * S_MntWines  +    -0.16427340869887 *
        S_MonthsAsCustomer  +    -1.31657293247686 * S_NumCatalogPurchases
          +    -1.49850531967483 * S_NumDealsPurchases
          +    -0.82105466264223 * S_NumDistPurchases
          +     0.29984603642824 * S_NumStorePurchases
          +     0.06557123721611 * S_NumWebPurchases
          +     1.04754749365002 * S_NumWebVisitsMonth
          +     0.18881248406892 * S_RFMstat  +     0.26455728766984 *
        S_RMntFrq  +     0.12396789666359 * S_Recency
          +     0.04001049603668 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     -0.4293641198863 * AcceptedCmp10
          +    -0.02562823362815 * AcceptedCmp20  +     0.16277388616218 *
        AcceptedCmp30  +    -0.38952498475664 * AcceptedCmp40
          +    -0.13756852377245 * AcceptedCmp50  +    -0.11393239206883 *
        Complain0  +    -0.18422159910382 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     -0.6690011671322 * AcceptedCmp10
          +     0.30944418540454 * AcceptedCmp20  +     0.58989055832198 *
        AcceptedCmp30  +    -0.11349554378017 * AcceptedCmp40
          +     0.17747537507545 * AcceptedCmp50  +     0.31141201787728 *
        Complain0  +    -0.14665102087088 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.37718551551154 * AcceptedCmp10
          +    -0.95419836616858 * AcceptedCmp20  +    -1.07782642598822 *
        AcceptedCmp30  +    -0.36181507758379 * AcceptedCmp40
          +    -0.20579221441057 * AcceptedCmp50  +     -0.2862570173476 *
        Complain0  +     0.42095042003574 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +     0.76282838117383 * AcceptedCmp10
          +     0.17657215690894 * AcceptedCmp20  +     0.06936093547655 *
        AcceptedCmp30  +    -0.31222684620157 * AcceptedCmp40
          +     0.35916828202502 * AcceptedCmp50  +     0.15464859425769 *
        Complain0  +    -0.12780871374988 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +      0.0863832283968 * AcceptedCmp10
          +    -0.01478152334234 * AcceptedCmp20  +    -0.25793605794945 *
        AcceptedCmp30  +     0.75328991260718 * AcceptedCmp40
          +     0.43869592545355 * AcceptedCmp50  +    -0.18444801256895 *
        Complain0  +    -0.18540568245616 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +    -0.05476883960444 * AcceptedCmp10
          +    -0.30796660956747 * AcceptedCmp20  +    -0.15332998700386 *
        AcceptedCmp30  +     0.07190305484507 * AcceptedCmp40
          +    -0.19344551087023 * AcceptedCmp50  +    -0.01671794402922 *
        Complain0  +      0.4224003744836 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.06740641383122 * Education2n_Cycle
          +      0.0427985447056 * EducationBasic  +     0.38043688251433 *
        EducationGraduation  +     0.07595631354847 * EducationMaster
          +     0.24583509957712 * Marital_StatusDivorced
          +    -0.22681931588361 * Marital_StatusMarried
          +    -0.12924106229536 * Marital_StatusSingle
          +     -0.2262058185403 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.13120690973481 * Education2n_Cycle
          +     0.37925506295244 * EducationBasic  +     0.31784700588218 *
        EducationGraduation  +     0.23015089246655 * EducationMaster
          +    -0.12585334311068 * Marital_StatusDivorced
          +    -0.20835502467207 * Marital_StatusMarried
          +    -0.13839534449368 * Marital_StatusSingle
          +     0.64317572477668 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.32305785926236 * Education2n_Cycle
          +     0.23464353160373 * EducationBasic  +    -0.73832644067678 *
        EducationGraduation  +    -0.03608560158257 * EducationMaster
          +     0.35106363238113 * Marital_StatusDivorced
          +     -1.3414808583918 * Marital_StatusMarried
          +     1.40835320798486 * Marital_StatusSingle
          +    -1.26805917396788 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.14516593990466 * Education2n_Cycle
          +     0.21457892528906 * EducationBasic  +      0.3693312496431 *
        EducationGraduation  +      0.1746658332011 * EducationMaster
          +     0.48174546958393 * Marital_StatusDivorced
          +    -0.41416978858191 * Marital_StatusMarried
          +    -0.23376801546265 * Marital_StatusSingle
          +    -0.40569257078897 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.00489214718621 * Education2n_Cycle
          +     0.04788059649714 * EducationBasic  +      -0.479003778409 *
        EducationGraduation  +     0.68875064631577 * EducationMaster
          +    -0.67557643774246 * Marital_StatusDivorced
          +     1.63844045917367 * Marital_StatusMarried
          +    -0.70320960247699 * Marital_StatusSingle
          +     1.26350112628909 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.38566123849432 * Education2n_Cycle
          +    -0.48006357411447 * EducationBasic  +     0.06594567975069 *
        EducationGraduation  +    -0.68011360002443 * EducationMaster
          +    -0.11371453086883 * Marital_StatusDivorced
          +    -0.34226997176291 * Marital_StatusMarried
          +    -1.01568676685754 * Marital_StatusSingle
          +    -0.07673228755579 * Marital_StatusTogether ;
   H1x1_1  =    -0.13665586104906 + H1x1_1 ;
   H1x1_2  =    -1.74128345271319 + H1x1_2 ;
   H1x1_3  =    -0.38226400326342 + H1x1_3 ;
   H1x1_4  =    -0.64652756521333 + H1x1_4 ;
   H1x1_5  =     0.89555568414722 + H1x1_5 ;
   H1x1_6  =    -0.28536788363505 + H1x1_6 ;
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
   H1x2_1  =    -0.46863593010465 * S_AcceptedCmpTotal
          +     0.76938995153422 * S_Age  +    -0.10870665325086 * S_Frq
          +    -0.01767709917897 * S_Income  +    -0.06564852978687 *
        S_Kidhome  +     1.53975855599943 * S_Mnt  +     0.14885556549813 *
        S_MntFishProducts  +     -0.3427211596875 * S_MntFruits
          +     1.82311511422571 * S_MntGoldProds  +     1.16814585484266 *
        S_MntMeatProducts  +    -0.03210183211362 * S_MntSweetProducts
          +     0.21048598967441 * S_MntWines  +    -1.43075224286158 *
        S_MonthsAsCustomer  +     0.17264791017938 * S_NumCatalogPurchases
          +    -0.87259051567474 * S_NumDealsPurchases
          +    -0.36454149529139 * S_NumDistPurchases
          +     0.12447759925061 * S_NumStorePurchases
          +    -1.08133487947367 * S_NumWebPurchases
          +    -0.49882157745454 * S_NumWebVisitsMonth
          +    -1.37163643041927 * S_RFMstat  +    -2.02270778627266 *
        S_RMntFrq  +    -0.01174101172444 * S_Recency
          +     1.37307999964517 * S_Teenhome ;
   H1x2_2  =     0.31979674377303 * S_AcceptedCmpTotal
          +    -1.13516841608912 * S_Age  +     1.57640145941914 * S_Frq
          +    -0.58468039509557 * S_Income  +    -1.78015996883174 *
        S_Kidhome  +     0.51311311640127 * S_Mnt  +     0.07011815519915 *
        S_MntFishProducts  +     0.73204832291164 * S_MntFruits
          +     1.50837189353633 * S_MntGoldProds  +     1.39487443576743 *
        S_MntMeatProducts  +      0.6943398196475 * S_MntSweetProducts
          +    -0.36693028595681 * S_MntWines  +     0.86802033237442 *
        S_MonthsAsCustomer  +     0.02384797538091 * S_NumCatalogPurchases
          +     2.23121497416403 * S_NumDealsPurchases
          +    -0.48674842191071 * S_NumDistPurchases
          +     1.77510728607544 * S_NumStorePurchases
          +     0.14647433155436 * S_NumWebPurchases
          +    -0.95892686924419 * S_NumWebVisitsMonth
          +    -0.26496935918704 * S_RFMstat  +     2.48765485222223 *
        S_RMntFrq  +     2.46497777428475 * S_Recency
          +    -0.62872033383484 * S_Teenhome ;
   H1x2_3  =    -0.31142826583944 * S_AcceptedCmpTotal
          +    -1.14828049895929 * S_Age  +    -0.54227584627485 * S_Frq
          +     0.26826674711688 * S_Income  +     0.17643820666347 *
        S_Kidhome  +    -0.12427430981043 * S_Mnt  +     0.18056887427376 *
        S_MntFishProducts  +    -0.63010248821544 * S_MntFruits
          +    -0.81391687529252 * S_MntGoldProds  +    -1.12306166734361 *
        S_MntMeatProducts  +     0.92339010601965 * S_MntSweetProducts
          +    -2.05510990050543 * S_MntWines  +    -2.02060586903244 *
        S_MonthsAsCustomer  +     0.98841836752178 * S_NumCatalogPurchases
          +     0.14338855349611 * S_NumDealsPurchases
          +    -2.21071010829235 * S_NumDistPurchases
          +    -0.21795889348002 * S_NumStorePurchases
          +     1.98825087883535 * S_NumWebPurchases
          +     1.02482442531149 * S_NumWebVisitsMonth
          +    -0.47662143614905 * S_RFMstat  +    -0.17167385440535 *
        S_RMntFrq  +     -1.0288777281766 * S_Recency
          +    -0.10646747275734 * S_Teenhome ;
   H1x2_4  =    -0.40813758620671 * S_AcceptedCmpTotal
          +     0.16751361466296 * S_Age  +     0.61297021391662 * S_Frq
          +     0.17708553296763 * S_Income  +    -0.23498000755537 *
        S_Kidhome  +      0.6863853027948 * S_Mnt  +    -0.43649468589643 *
        S_MntFishProducts  +    -1.03807059787368 * S_MntFruits
          +     0.68988160282803 * S_MntGoldProds  +     1.76714128625705 *
        S_MntMeatProducts  +     1.15458185366826 * S_MntSweetProducts
          +     0.31267521045306 * S_MntWines  +    -3.18562841805634 *
        S_MonthsAsCustomer  +     0.15316473812138 * S_NumCatalogPurchases
          +     0.30041205661012 * S_NumDealsPurchases
          +    -0.63499849986918 * S_NumDistPurchases
          +    -0.34155713433714 * S_NumStorePurchases
          +    -1.14183354933936 * S_NumWebPurchases
          +    -0.42681980262973 * S_NumWebVisitsMonth
          +    -0.18777676484111 * S_RFMstat  +      0.2522570278894 *
        S_RMntFrq  +     1.25852246467612 * S_Recency
          +     0.63333476238969 * S_Teenhome ;
   H1x2_5  =     1.73048436159558 * S_AcceptedCmpTotal
          +     1.91388487556197 * S_Age  +     0.14880026885923 * S_Frq
          +      0.5905347897806 * S_Income  +     1.67048168226736 *
        S_Kidhome  +     0.03869174467752 * S_Mnt  +    -0.71187911364266 *
        S_MntFishProducts  +     0.93023590693473 * S_MntFruits
          +     0.22907372790948 * S_MntGoldProds  +    -1.05941282177437 *
        S_MntMeatProducts  +    -0.73905281508342 * S_MntSweetProducts
          +     0.04429898588386 * S_MntWines  +    -0.47487263648723 *
        S_MonthsAsCustomer  +     0.00382111008361 * S_NumCatalogPurchases
          +    -0.21237915559831 * S_NumDealsPurchases
          +     0.48256923764182 * S_NumDistPurchases
          +    -0.45553093140641 * S_NumStorePurchases
          +      0.5593655963659 * S_NumWebPurchases
          +     0.27943768691188 * S_NumWebVisitsMonth
          +     1.94452735574997 * S_RFMstat  +    -0.89811355261154 *
        S_RMntFrq  +    -1.62796011550484 * S_Recency
          +     0.60487421956906 * S_Teenhome ;
   H1x2_6  =    -0.32010880515459 * S_AcceptedCmpTotal
          +     0.95304983421791 * S_Age  +      -0.316044010281 * S_Frq
          +     1.10925678578158 * S_Income  +     1.28019020117471 *
        S_Kidhome  +     1.02498438668688 * S_Mnt  +     -1.8898236827792 *
        S_MntFishProducts  +     0.96543971612672 * S_MntFruits
          +    -0.21422669977227 * S_MntGoldProds  +     -0.0840639948559 *
        S_MntMeatProducts  +     1.27902687109389 * S_MntSweetProducts
          +    -1.38957846154598 * S_MntWines  +     0.80004372871482 *
        S_MonthsAsCustomer  +    -0.19381123279552 * S_NumCatalogPurchases
          +     2.38967021388062 * S_NumDealsPurchases
          +    -0.97722398866481 * S_NumDistPurchases
          +     1.57612333191312 * S_NumStorePurchases
          +    -0.75968679115983 * S_NumWebPurchases
          +    -0.64207187757251 * S_NumWebVisitsMonth
          +     1.06529999122381 * S_RFMstat  +     0.67095385521555 *
        S_RMntFrq  +     1.71313869798331 * S_Recency
          +     1.39045686636707 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -1.32125124093028 * AcceptedCmp10
          +    -0.61219063588492 * AcceptedCmp20  +     1.20821214973577 *
        AcceptedCmp30  +    -1.13548727550981 * AcceptedCmp40
          +     0.04405769197194 * AcceptedCmp50  +      0.7940658605271 *
        Complain0  +     1.05933486404834 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +     1.56313777120806 * AcceptedCmp10
          +    -1.12997680537456 * AcceptedCmp20  +     1.19262470365504 *
        AcceptedCmp30  +    -0.98995493161689 * AcceptedCmp40
          +      -1.827141957557 * AcceptedCmp50  +    -0.43809188233899 *
        Complain0  +      -0.627000653672 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     1.32174755827017 * AcceptedCmp10
          +     1.00086479754098 * AcceptedCmp20  +      0.4636133487385 *
        AcceptedCmp30  +     1.34878553883758 * AcceptedCmp40
          +    -2.36241584924476 * AcceptedCmp50  +       1.082421071431 *
        Complain0  +    -0.32514144517436 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     0.39556775796131 * AcceptedCmp10
          +     0.06457727211285 * AcceptedCmp20  +    -1.44632749800655 *
        AcceptedCmp30  +     1.20294678514383 * AcceptedCmp40
          +    -0.01594330886358 * AcceptedCmp50  +    -2.06895895180485 *
        Complain0  +    -0.01374012569775 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     1.11945933535638 * AcceptedCmp10
          +     0.26383973979566 * AcceptedCmp20  +    -0.40426240061746 *
        AcceptedCmp30  +     1.46916781894719 * AcceptedCmp40
          +     0.26827715088644 * AcceptedCmp50  +     1.50074465469998 *
        Complain0  +     -1.0626185000486 * HigherEducationBinary0 ;
   H1x2_6  = H1x2_6  +    -0.87625232174239 * AcceptedCmp10
          +     0.72228047975642 * AcceptedCmp20  +     1.34904015028355 *
        AcceptedCmp30  +     1.55639496207852 * AcceptedCmp40
          +    -0.98741935337746 * AcceptedCmp50  +     0.99421811137074 *
        Complain0  +    -1.69180618270074 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.17034446979478 * Education2n_Cycle
          +    -0.75872196172063 * EducationBasic  +     0.44107677662894 *
        EducationGraduation  +      0.1073450284316 * EducationMaster
          +     0.96470902298142 * Marital_StatusDivorced
          +     0.94805959268314 * Marital_StatusMarried
          +     -0.6523948769616 * Marital_StatusSingle
          +     0.07557344719737 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +    -0.42515060901662 * Education2n_Cycle
          +    -1.05213629639837 * EducationBasic  +     0.72603871617959 *
        EducationGraduation  +    -1.34927753306064 * EducationMaster
          +      0.3918249505531 * Marital_StatusDivorced
          +    -0.00968091979586 * Marital_StatusMarried
          +     0.84615379885071 * Marital_StatusSingle
          +     0.34817324570682 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +    -0.31002362860852 * Education2n_Cycle
          +     1.40744525716089 * EducationBasic  +     2.06403096539358 *
        EducationGraduation  +     -0.8672743321499 * EducationMaster
          +     1.14335160313191 * Marital_StatusDivorced
          +     0.50580517192175 * Marital_StatusMarried
          +     0.17264295020921 * Marital_StatusSingle
          +    -0.58193119255736 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.55057637605468 * Education2n_Cycle
          +    -0.73070803276142 * EducationBasic  +     0.40424625808481 *
        EducationGraduation  +     1.95818378342783 * EducationMaster
          +    -0.11238504444225 * Marital_StatusDivorced
          +    -0.81348274043749 * Marital_StatusMarried
          +     0.46075415610001 * Marital_StatusSingle
          +    -0.17552649817722 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.43341125564688 * Education2n_Cycle
          +     2.81958018976644 * EducationBasic  +     0.28773362443315 *
        EducationGraduation  +     0.08396135672504 * EducationMaster
          +    -0.46342068701431 * Marital_StatusDivorced
          +    -0.41667845270204 * Marital_StatusMarried
          +    -0.47166707496281 * Marital_StatusSingle
          +     0.54110155717306 * Marital_StatusTogether ;
   H1x2_6  = H1x2_6  +    -0.27163102711307 * Education2n_Cycle
          +    -0.04052143781957 * EducationBasic  +     0.97902549344774 *
        EducationGraduation  +     0.36656103863186 * EducationMaster
          +    -0.45376613787812 * Marital_StatusDivorced
          +     0.01337046049801 * Marital_StatusMarried
          +    -0.92811489484121 * Marital_StatusSingle
          +     1.52402650450634 * Marital_StatusTogether ;
   H1x2_1  =     0.27200642200874 + H1x2_1 ;
   H1x2_2  =     0.52117161047058 + H1x2_2 ;
   H1x2_3  =    -1.04763461279984 + H1x2_3 ;
   H1x2_4  =     0.10516307959318 + H1x2_4 ;
   H1x2_5  =     1.24237093160919 + H1x2_5 ;
   H1x2_6  =    -0.57977518763852 + H1x2_6 ;
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
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     3.19986933046591 * H1x1_1  +    -0.53665634063887 * H1x1_2
          +     1.71172628690017 * H1x1_3  +    -1.33944402954134 * H1x1_4
          +    -1.93533827156845 * H1x1_5  +    -0.85772802964317 * H1x1_6
          +     0.60984669129006 * H1x1_7 ;
   H2x1_2  =     -2.1883484075031 * H1x1_1  +     0.17578635446135 * H1x1_2
          +    -1.79384950890077 * H1x1_3  +     0.88942614754722 * H1x1_4
          +     0.41077752133457 * H1x1_5  +       0.509832853125 * H1x1_6
          +    -0.28121910805072 * H1x1_7 ;
   H2x1_3  =     0.86281981700921 * H1x1_1  +    -1.15482345233328 * H1x1_2
          +     0.64743938802141 * H1x1_3  +     1.08117298211616 * H1x1_4
          +      -0.363297480437 * H1x1_5  +    -1.58703254226713 * H1x1_6
          +     0.54468402771449 * H1x1_7 ;
   H2x1_4  =    -0.43420906601647 * H1x1_1  +     0.36485369627974 * H1x1_2
          +    -2.42315183886716 * H1x1_3  +     0.22337896770247 * H1x1_4
          +    -0.65684369622605 * H1x1_5  +     0.25211011207532 * H1x1_6
          +     0.16704425645668 * H1x1_7 ;
   H2x1_5  =     0.61083333511105 * H1x1_1  +     1.11038871398931 * H1x1_2
          +      0.4617674661653 * H1x1_3  +    -0.42039958365963 * H1x1_4
          +    -1.37408000010678 * H1x1_5  +     0.03897439094411 * H1x1_6
          +    -0.82592861674077 * H1x1_7 ;
   H2x1_6  =     1.30877201101082 * H1x1_1  +     1.55143256487324 * H1x1_2
          +    -1.20237741381937 * H1x1_3  +       2.394122059946 * H1x1_4
          +     1.83804290225468 * H1x1_5  +     0.83132818010396 * H1x1_6
          +     1.18399340483001 * H1x1_7 ;
   H2x1_1  = H2x1_1  +    -2.41276052972753 * H1x2_1
          +     0.38601054263899 * H1x2_2  +     0.54498789581044 * H1x2_3
          +    -0.55304188445569 * H1x2_4  +     0.29484780749868 * H1x2_5
          +     0.44012580105051 * H1x2_6  +     0.43086375065556 * H1x2_7 ;
   H2x1_2  = H2x1_2  +    -1.03173201511154 * H1x2_1
          +     0.62119574580435 * H1x2_2  +     1.71782745718335 * H1x2_3
          +     0.05391903933014 * H1x2_4  +     1.52443015967438 * H1x2_5
          +     0.22301831343286 * H1x2_6  +     0.66204940430171 * H1x2_7 ;
   H2x1_3  = H2x1_3  +     1.37871502475142 * H1x2_1
          +     0.02099445181492 * H1x2_2  +     0.44720218317742 * H1x2_3
          +    -1.29625929820096 * H1x2_4  +    -1.29169956389384 * H1x2_5
          +    -0.21403739905139 * H1x2_6  +    -0.03075946378871 * H1x2_7 ;
   H2x1_4  = H2x1_4  +     1.94121727472617 * H1x2_1
          +     0.23207290279299 * H1x2_2  +      0.3162872281134 * H1x2_3
          +    -0.40199017937523 * H1x2_4  +     0.69294460110289 * H1x2_5
          +    -1.00758272664059 * H1x2_6  +    -1.41698057960021 * H1x2_7 ;
   H2x1_5  = H2x1_5  +     1.19546023857185 * H1x2_1
          +    -1.00266987736442 * H1x2_2  +     0.71838447032796 * H1x2_3
          +     1.70968347732204 * H1x2_4  +    -0.26894423802892 * H1x2_5
          +    -0.61655519090213 * H1x2_6  +     2.21931491555405 * H1x2_7 ;
   H2x1_6  = H2x1_6  +    -0.48559886762231 * H1x2_1
          +     0.93218274010134 * H1x2_2  +     0.23140948782865 * H1x2_3
          +     0.72139310562219 * H1x2_4  +    -0.11143939877368 * H1x2_5
          +     0.74022211257293 * H1x2_6  +      1.0449314568566 * H1x2_7 ;
   H2x1_1  =     0.42952855003777 + H2x1_1 ;
   H2x1_2  =     1.61752083096638 + H2x1_2 ;
   H2x1_3  =    -0.71617788867723 + H2x1_3 ;
   H2x1_4  =     0.39147546708847 + H2x1_4 ;
   H2x1_5  =    -0.56259054185247 + H2x1_5 ;
   H2x1_6  =     0.31857109159246 + H2x1_6 ;
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
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     25.2027326018714 * H2x1_1  +    -8.05331379419082 * H2x1_2
          +     2.64798805383536 * H2x1_3  +    -4.52736775271107 * H2x1_4
          +     6.71812741736202 * H2x1_5  +    -12.2785047473885 * H2x1_6
          +    -4.41291972336422 * H2x1_7 ;
   P_DepVar1  =     1.22134962002326 + P_DepVar1 ;
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
* Ensmbl5: Scoring Code of model 4 of 5;
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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   H1x1_1  =    -0.26269469382558 * S_AcceptedCmpTotal
          +    -0.06270768091854 * S_Age  +    -0.71225988503068 * S_Frq
          +    -0.19030550341755 * S_Income  +    -0.74001834753219 *
        S_Kidhome  +    -0.80050230513362 * S_Mnt  +    -0.70546855957287 *
        S_MntFishProducts  +    -0.57876563074872 * S_MntFruits
          +    -0.00210300489306 * S_MntGoldProds  +     2.60078237485589 *
        S_MntMeatProducts  +     -0.9886407516441 * S_MntSweetProducts
          +    -2.97488547819955 * S_MntWines  +    -0.61277940059348 *
        S_MonthsAsCustomer  +    -0.00096247683063 * S_NumCatalogPurchases
          +     0.89422627895323 * S_NumDealsPurchases
          +    -0.13304125929765 * S_NumDistPurchases
          +    -1.04568442570811 * S_NumStorePurchases
          +    -0.28677765126751 * S_NumWebPurchases
          +      1.2327638737509 * S_NumWebVisitsMonth
          +     0.67421347247009 * S_RFMstat  +     -0.6166808079836 *
        S_RMntFrq  +    -0.86930969765816 * S_Recency
          +     0.33815651609216 * S_Teenhome ;
   H1x1_2  =     0.55568777293496 * S_AcceptedCmpTotal
          +     0.80213442721076 * S_Age  +     0.34635060456486 * S_Frq
          +    -0.74174636901916 * S_Income  +    -0.01217809906509 *
        S_Kidhome  +     0.26876993353057 * S_Mnt  +     0.04779395124841 *
        S_MntFishProducts  +    -0.48668668697685 * S_MntFruits
          +    -0.53984501210781 * S_MntGoldProds  +     2.66892669248667 *
        S_MntMeatProducts  +     0.48696031818599 * S_MntSweetProducts
          +    -1.59625933837852 * S_MntWines  +     0.06275925418664 *
        S_MonthsAsCustomer  +     0.97240339275782 * S_NumCatalogPurchases
          +     0.04224590196535 * S_NumDealsPurchases
          +     0.76554742700113 * S_NumDistPurchases
          +    -0.49155496870812 * S_NumStorePurchases
          +     0.59606812744403 * S_NumWebPurchases
          +     1.86809286276405 * S_NumWebVisitsMonth
          +    -0.40257502974261 * S_RFMstat  +    -1.46120938073597 *
        S_RMntFrq  +    -2.09222283465666 * S_Recency
          +    -0.29369632363913 * S_Teenhome ;
   H1x1_3  =    -1.40689454675752 * S_AcceptedCmpTotal
          +     0.22713382517751 * S_Age  +     0.51688429566863 * S_Frq
          +    -0.07045670111356 * S_Income  +     1.10344455539307 *
        S_Kidhome  +     0.24846532877416 * S_Mnt  +       0.663861249099 *
        S_MntFishProducts  +     0.91527393572467 * S_MntFruits
          +    -0.30189545909263 * S_MntGoldProds  +    -0.72774030731928 *
        S_MntMeatProducts  +     0.66425565932635 * S_MntSweetProducts
          +     0.55381627079618 * S_MntWines  +      0.6475533846661 *
        S_MonthsAsCustomer  +    -1.28926334887526 * S_NumCatalogPurchases
          +    -0.04866536993486 * S_NumDealsPurchases
          +    -0.53535979020214 * S_NumDistPurchases
          +     2.20634071253676 * S_NumStorePurchases
          +      0.6164564989007 * S_NumWebPurchases
          +    -0.43396314395263 * S_NumWebVisitsMonth
          +     0.05322242552204 * S_RFMstat  +     0.56410623855957 *
        S_RMntFrq  +     2.37293441098349 * S_Recency
          +     1.20608077690677 * S_Teenhome ;
   H1x1_4  =      0.8853369558336 * S_AcceptedCmpTotal
          +    -0.02447538128281 * S_Age  +    -0.42850426895609 * S_Frq
          +     2.31972189756282 * S_Income  +    -1.82782672643583 *
        S_Kidhome  +     -0.0790436830894 * S_Mnt  +     0.24407556387791 *
        S_MntFishProducts  +     0.21000125209328 * S_MntFruits
          +     -0.0538417400508 * S_MntGoldProds  +     0.76422967678518 *
        S_MntMeatProducts  +     0.14352092131967 * S_MntSweetProducts
          +    -0.47732426074136 * S_MntWines  +      0.2881736828404 *
        S_MonthsAsCustomer  +     1.08614742409725 * S_NumCatalogPurchases
          +     1.37461255707863 * S_NumDealsPurchases
          +    -0.17684775000818 * S_NumDistPurchases
          +    -0.62755623855535 * S_NumStorePurchases
          +    -1.46551649022657 * S_NumWebPurchases
          +     3.35784247878638 * S_NumWebVisitsMonth
          +      0.0205421093374 * S_RFMstat  +     0.02151146396087 *
        S_RMntFrq  +    -2.61971612923471 * S_Recency
          +    -1.74888814570254 * S_Teenhome ;
   H1x1_5  =    -1.18321492018094 * S_AcceptedCmpTotal
          +    -0.08221927436186 * S_Age  +    -0.42965792034093 * S_Frq
          +    -0.82515640369651 * S_Income  +     -0.7955159282868 *
        S_Kidhome  +    -0.24623211609742 * S_Mnt  +     1.14929640730402 *
        S_MntFishProducts  +     0.37195406994279 * S_MntFruits
          +    -0.11860313293867 * S_MntGoldProds  +     -5.1642360901608 *
        S_MntMeatProducts  +     0.30315380386519 * S_MntSweetProducts
          +     2.66130913318508 * S_MntWines  +    -0.35226665860471 *
        S_MonthsAsCustomer  +    -1.90883979010829 * S_NumCatalogPurchases
          +    -0.76256677907121 * S_NumDealsPurchases
          +    -0.31591571751692 * S_NumDistPurchases
          +      0.0506832614089 * S_NumStorePurchases
          +      1.4636796923764 * S_NumWebPurchases
          +     0.37743519705036 * S_NumWebVisitsMonth
          +    -0.69857477383618 * S_RFMstat  +    -0.87851464788137 *
        S_RMntFrq  +     0.16854775832723 * S_Recency
          +     0.71697705359003 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.36100598335798 * AcceptedCmp10
          +    -0.80162089620833 * AcceptedCmp20  +    -0.32871385645151 *
        AcceptedCmp30  +     0.06493645215559 * AcceptedCmp40
          +    -0.79430619699627 * AcceptedCmp50  +    -0.55522128705257 *
        Complain0  +    -0.30966226382805 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.55315398954303 * AcceptedCmp10
          +    -0.74882192477453 * AcceptedCmp20  +    -1.00393247543385 *
        AcceptedCmp30  +    -0.99157595784247 * AcceptedCmp40
          +     -1.3196947648703 * AcceptedCmp50  +    -0.00342039619706 *
        Complain0  +     2.02148667926607 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -1.34147425697576 * AcceptedCmp10
          +     0.73907016980814 * AcceptedCmp20  +     0.73398008116032 *
        AcceptedCmp30  +     0.96308137699431 * AcceptedCmp40
          +     0.35561099349684 * AcceptedCmp50  +    -0.31219143781741 *
        Complain0  +     0.90693629583865 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.50580436048114 * AcceptedCmp10
          +    -1.02093523515462 * AcceptedCmp20  +    -0.61029325985231 *
        AcceptedCmp30  +    -0.73402161144066 * AcceptedCmp40
          +      0.1698155397807 * AcceptedCmp50  +    -0.01243044321253 *
        Complain0  +    -0.47467816438005 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +     1.58877963639512 * AcceptedCmp10
          +     0.71974146614964 * AcceptedCmp20  +    -0.38703518473707 *
        AcceptedCmp30  +     0.18491867078918 * AcceptedCmp40
          +     0.72124299050214 * AcceptedCmp50  +    -0.27317285634323 *
        Complain0  +      0.1433377302902 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.29126191890253 * Education2n_Cycle
          +    -0.73322213407659 * EducationBasic  +     0.33134572731882 *
        EducationGraduation  +    -0.37141290775302 * EducationMaster
          +     0.68641668264565 * Marital_StatusDivorced
          +    -0.81586871439732 * Marital_StatusMarried
          +     0.63758920518451 * Marital_StatusSingle
          +    -1.07300023346175 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.43078991783629 * Education2n_Cycle
          +      0.6169213563952 * EducationBasic  +    -0.30246389091319 *
        EducationGraduation  +     -0.4412391934844 * EducationMaster
          +     0.05137560133238 * Marital_StatusDivorced
          +    -2.24401993266209 * Marital_StatusMarried
          +     1.57359386216115 * Marital_StatusSingle
          +    -1.81897019215773 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.59284950139581 * Education2n_Cycle
          +     0.47333255206751 * EducationBasic  +     0.43514421192824 *
        EducationGraduation  +     0.61492669859334 * EducationMaster
          +     -1.0649987815942 * Marital_StatusDivorced
          +     0.76065111692388 * Marital_StatusMarried
          +    -0.21694149754801 * Marital_StatusSingle
          +     1.64182073896148 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.77613125849075 * Education2n_Cycle
          +     0.26238013539868 * EducationBasic  +    -0.05526420132276 *
        EducationGraduation  +     0.04208620358211 * EducationMaster
          +     2.02155453548328 * Marital_StatusDivorced
          +    -2.60190649735306 * Marital_StatusMarried
          +     1.09149388354927 * Marital_StatusSingle
          +    -1.15248770613963 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.03512618332303 * Education2n_Cycle
          +    -0.14907811224838 * EducationBasic  +     0.24885029294709 *
        EducationGraduation  +    -0.60853091001689 * EducationMaster
          +     0.66315970650309 * Marital_StatusDivorced
          +    -1.20476729758152 * Marital_StatusMarried
          +     0.56175027826397 * Marital_StatusSingle
          +    -1.12798745445913 * Marital_StatusTogether ;
   H1x1_1  =      0.8264813299799 + H1x1_1 ;
   H1x1_2  =     1.35924705880418 + H1x1_2 ;
   H1x1_3  =    -0.31074016443189 + H1x1_3 ;
   H1x1_4  =    -1.37395810355475 + H1x1_4 ;
   H1x1_5  =    -0.62889533479826 + H1x1_5 ;
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
   H1x2_1  =     0.56269814727649 * S_AcceptedCmpTotal
          +    -0.56663088753275 * S_Age  +    -0.08799157593784 * S_Frq
          +      0.8158986182256 * S_Income  +     0.25081960997161 *
        S_Kidhome  +    -0.53258140179906 * S_Mnt  +     0.15843644803762 *
        S_MntFishProducts  +    -0.87373368590299 * S_MntFruits
          +     0.02807252984992 * S_MntGoldProds  +     1.41661611364623 *
        S_MntMeatProducts  +     1.22431140889383 * S_MntSweetProducts
          +    -0.25451913627032 * S_MntWines  +     0.13515407201266 *
        S_MonthsAsCustomer  +     1.28583120667445 * S_NumCatalogPurchases
          +     1.50005927423985 * S_NumDealsPurchases
          +      0.5590536933569 * S_NumDistPurchases
          +    -0.61757824339318 * S_NumStorePurchases
          +     0.37259686538158 * S_NumWebPurchases
          +     2.59725437895564 * S_NumWebVisitsMonth
          +     1.61096386499852 * S_RFMstat  +      0.6096177019772 *
        S_RMntFrq  +    -2.38795796980324 * S_Recency
          +    -0.31987414022375 * S_Teenhome ;
   H1x2_2  =    -1.93801069736585 * S_AcceptedCmpTotal
          +     1.10394781020217 * S_Age  +    -0.47335296021798 * S_Frq
          +    -1.34212492602253 * S_Income  +    -1.34380793722996 *
        S_Kidhome  +      0.9110881410704 * S_Mnt  +    -2.21001317666388 *
        S_MntFishProducts  +     0.73821267564247 * S_MntFruits
          +     0.16536006752146 * S_MntGoldProds  +     0.03402222784641 *
        S_MntMeatProducts  +     0.96043668102736 * S_MntSweetProducts
          +    -1.40670343451334 * S_MntWines  +     0.81378739821838 *
        S_MonthsAsCustomer  +    -0.45596935664336 * S_NumCatalogPurchases
          +    -0.09282222088797 * S_NumDealsPurchases
          +     0.10726247938321 * S_NumDistPurchases
          +     -1.1235971458527 * S_NumStorePurchases
          +    -0.78304387839877 * S_NumWebPurchases
          +    -0.44139243179956 * S_NumWebVisitsMonth
          +    -0.00027499457791 * S_RFMstat  +    -0.71480759211982 *
        S_RMntFrq  +     2.19072220135069 * S_Recency
          +    -0.32246312005896 * S_Teenhome ;
   H1x2_3  =    -0.33286965179681 * S_AcceptedCmpTotal
          +     0.25643420238739 * S_Age  +     1.78251276306291 * S_Frq
          +     0.42668628662657 * S_Income  +    -0.44555069154972 *
        S_Kidhome  +     0.99430376599176 * S_Mnt  +     0.37152911215285 *
        S_MntFishProducts  +    -1.00181313725345 * S_MntFruits
          +    -1.88393479121141 * S_MntGoldProds  +    -1.71643056154209 *
        S_MntMeatProducts  +    -0.69325136508245 * S_MntSweetProducts
          +     0.36062578298416 * S_MntWines  +    -1.43361051175418 *
        S_MonthsAsCustomer  +     0.92624996511804 * S_NumCatalogPurchases
          +     0.35349185459988 * S_NumDealsPurchases
          +     0.06853677714859 * S_NumDistPurchases
          +    -1.47546012999338 * S_NumStorePurchases
          +     0.20926435398916 * S_NumWebPurchases
          +    -1.00535683639093 * S_NumWebVisitsMonth
          +     0.39738023685345 * S_RFMstat  +     0.54359550262445 *
        S_RMntFrq  +    -1.59138379954757 * S_Recency
          +    -0.72224029606658 * S_Teenhome ;
   H1x2_4  =     -0.0656876758781 * S_AcceptedCmpTotal
          +    -0.38220805193452 * S_Age  +    -0.62740801625755 * S_Frq
          +     0.62992117571672 * S_Income  +      1.6289723191423 *
        S_Kidhome  +     0.37209535830613 * S_Mnt  +     0.55983487785376 *
        S_MntFishProducts  +    -2.12992009015736 * S_MntFruits
          +    -0.38291517806426 * S_MntGoldProds  +    -1.36584955015054 *
        S_MntMeatProducts  +     0.60790195398286 * S_MntSweetProducts
          +     2.43674403604903 * S_MntWines  +     -0.0680555682506 *
        S_MonthsAsCustomer  +    -0.38141588539042 * S_NumCatalogPurchases
          +      0.3873586120272 * S_NumDealsPurchases
          +     0.25911651157596 * S_NumDistPurchases
          +     1.58922489084287 * S_NumStorePurchases
          +     0.49041797743368 * S_NumWebPurchases
          +     -1.5425586871929 * S_NumWebVisitsMonth
          +    -0.68794085469802 * S_RFMstat  +     1.43555366196783 *
        S_RMntFrq  +     1.03099569333498 * S_Recency
          +    -0.33160793159803 * S_Teenhome ;
   H1x2_5  =      1.1619646008295 * S_AcceptedCmpTotal
          +     -1.1099918698895 * S_Age  +     1.07090049938562 * S_Frq
          +     0.68405730495336 * S_Income  +     0.10310173850527 *
        S_Kidhome  +    -0.20536085581003 * S_Mnt  +    -0.13505440333321 *
        S_MntFishProducts  +      0.7330354505267 * S_MntFruits
          +    -0.09266368133722 * S_MntGoldProds  +     0.11251229112529 *
        S_MntMeatProducts  +     0.93293215365852 * S_MntSweetProducts
          +    -0.30739945619686 * S_MntWines  +     1.60111236559554 *
        S_MonthsAsCustomer  +    -0.55541485540949 * S_NumCatalogPurchases
          +    -0.60830880287865 * S_NumDealsPurchases
          +      0.0745331267194 * S_NumDistPurchases
          +    -1.39472448256952 * S_NumStorePurchases
          +     1.95372179969087 * S_NumWebPurchases
          +    -0.63307356390404 * S_NumWebVisitsMonth
          +    -1.45142676869601 * S_RFMstat  +    -0.89091053567015 *
        S_RMntFrq  +    -0.29197897313114 * S_Recency
          +     0.02610681671236 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.60663534965526 * AcceptedCmp10
          +     0.86940361180064 * AcceptedCmp20  +     1.96097801395475 *
        AcceptedCmp30  +    -0.07604718607607 * AcceptedCmp40
          +    -2.82012437662904 * AcceptedCmp50  +     2.92223307409835 *
        Complain0  +      0.7388639458943 * HigherEducationBinary0 ;
   H1x2_2  = H1x2_2  +    -0.44975979140124 * AcceptedCmp10
          +    -0.14894854897951 * AcceptedCmp20  +     1.05214102326393 *
        AcceptedCmp30  +    -0.24568060312448 * AcceptedCmp40
          +    -0.32148548771167 * AcceptedCmp50  +    -0.06212131202705 *
        Complain0  +    -1.15456299494407 * HigherEducationBinary0 ;
   H1x2_3  = H1x2_3  +     0.05559829595526 * AcceptedCmp10
          +    -0.79357273390501 * AcceptedCmp20  +     1.19638475921939 *
        AcceptedCmp30  +     -0.4185483500346 * AcceptedCmp40
          +     1.62070541716774 * AcceptedCmp50  +     0.42618871432227 *
        Complain0  +    -1.31545071935076 * HigherEducationBinary0 ;
   H1x2_4  = H1x2_4  +     0.79295384489774 * AcceptedCmp10
          +    -1.12840237512106 * AcceptedCmp20  +     1.32129555401653 *
        AcceptedCmp30  +    -0.25952521594596 * AcceptedCmp40
          +     0.80872302488736 * AcceptedCmp50  +     1.00677398871609 *
        Complain0  +    -0.40309387727555 * HigherEducationBinary0 ;
   H1x2_5  = H1x2_5  +     0.27407087260629 * AcceptedCmp10
          +    -1.62993283587806 * AcceptedCmp20  +     -0.7976151702219 *
        AcceptedCmp30  +    -1.43236001965205 * AcceptedCmp40
          +     0.31785497417833 * AcceptedCmp50  +     -0.4935881696628 *
        Complain0  +    -0.90101154412077 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.42532202605687 * Education2n_Cycle
          +     0.05209663685716 * EducationBasic  +     1.32477268007154 *
        EducationGraduation  +    -1.16900224373137 * EducationMaster
          +    -1.33377871643323 * Marital_StatusDivorced
          +    -0.87184228840898 * Marital_StatusMarried
          +     1.41223186340257 * Marital_StatusSingle
          +     0.26542930660962 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.31980851177227 * Education2n_Cycle
          +     1.82629979795037 * EducationBasic  +     0.59482979766527 *
        EducationGraduation  +     0.38341272155343 * EducationMaster
          +    -0.21479890935233 * Marital_StatusDivorced
          +     -0.0025459519579 * Marital_StatusMarried
          +     1.33900491702264 * Marital_StatusSingle
          +     0.31338385402434 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     -1.1277686958847 * Education2n_Cycle
          +    -0.32701971979058 * EducationBasic  +      0.4361680205519 *
        EducationGraduation  +     0.60739269725685 * EducationMaster
          +    -0.38307267471999 * Marital_StatusDivorced
          +     0.97088969451415 * Marital_StatusMarried
          +    -0.28578224473381 * Marital_StatusSingle
          +     0.16178086683874 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +    -1.21481485652985 * Education2n_Cycle
          +    -0.30231261977781 * EducationBasic  +     0.33993210461674 *
        EducationGraduation  +     0.14160673378252 * EducationMaster
          +    -1.42229401093569 * Marital_StatusDivorced
          +      0.7234508382397 * Marital_StatusMarried
          +    -0.29062202974628 * Marital_StatusSingle
          +     1.00102560376832 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.47313927233084 * Education2n_Cycle
          +     0.53675687099431 * EducationBasic  +    -0.75029054398953 *
        EducationGraduation  +     -0.7118631990538 * EducationMaster
          +    -0.99067637207205 * Marital_StatusDivorced
          +    -0.50245902142079 * Marital_StatusMarried
          +     0.54214494533793 * Marital_StatusSingle
          +    -1.90023876403873 * Marital_StatusTogether ;
   H1x2_1  =    -0.76220110175787 + H1x2_1 ;
   H1x2_2  =     0.33238308796509 + H1x2_2 ;
   H1x2_3  =    -1.79229186263718 + H1x2_3 ;
   H1x2_4  =     2.90076107393596 + H1x2_4 ;
   H1x2_5  =    -1.75965576502183 + H1x2_5 ;
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
   H2x1_1  =       1.974359971482 * H1x1_1  +     2.56630185065386 * H1x1_2
          +    -2.09978917716486 * H1x1_3  +      2.5733942680354 * H1x1_4
          +    -3.36902992698085 * H1x1_5  +    -2.45757278280195 * H1x1_6 ;
   H2x1_2  =    -0.31797232371002 * H1x1_1  +     1.40395330167402 * H1x1_2
          +     1.81616324109762 * H1x1_3  +     1.53849589982775 * H1x1_4
          +    -0.63132385856109 * H1x1_5  +    -2.28426391810485 * H1x1_6 ;
   H2x1_3  =    -1.34821716876354 * H1x1_1  +    -1.59136815069547 * H1x1_2
          +     1.51830421093731 * H1x1_3  +     0.25947292816575 * H1x1_4
          +     0.68626537551183 * H1x1_5  +     0.08021226539433 * H1x1_6 ;
   H2x1_4  =     1.81371453071507 * H1x1_1  +     2.86509325576366 * H1x1_2
          +    -2.51923468751378 * H1x1_3  +     3.48823967488449 * H1x1_4
          +    -1.98439811139438 * H1x1_5  +    -1.35359233519863 * H1x1_6 ;
   H2x1_5  =     2.41779243188377 * H1x1_1  +     2.38684872287302 * H1x1_2
          +    -2.38697428830295 * H1x1_3  +     3.64463866412774 * H1x1_4
          +    -6.25925640356471 * H1x1_5  +    -2.41187367604766 * H1x1_6 ;
   H2x1_6  =    -0.72042650045348 * H1x1_1  +      0.1896194130913 * H1x1_2
          +     0.90899894568677 * H1x1_3  +    -1.82868335056689 * H1x1_4
          +     0.25430380699211 * H1x1_5  +     0.21617396847163 * H1x1_6 ;
   H2x1_1  = H2x1_1  +     1.25654059966646 * H1x2_1
          +     1.54802434303135 * H1x2_2  +     -0.8831980397117 * H1x2_3
          +    -0.06778839937099 * H1x2_4  +      0.5440972304381 * H1x2_5
          +      0.2606136576082 * H1x2_6 ;
   H2x1_2  = H2x1_2  +      1.1804478706954 * H1x2_1
          +    -1.54526687654235 * H1x2_2  +    -1.84586479319799 * H1x2_3
          +     1.53060510120437 * H1x2_4  +     1.17038673632413 * H1x2_5
          +    -0.33816948355449 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -0.17829043463382 * H1x2_1
          +    -0.25137506897353 * H1x2_2  +     0.16242586068799 * H1x2_3
          +    -0.09404795949359 * H1x2_4  +    -0.46228597203598 * H1x2_5
          +    -2.05648585275111 * H1x2_6 ;
   H2x1_4  = H2x1_4  +     0.42433995729877 * H1x2_1
          +    -0.48506090180667 * H1x2_2  +    -2.00023889633201 * H1x2_3
          +    -2.18353148884875 * H1x2_4  +      1.8888560029491 * H1x2_5
          +     0.10756694741742 * H1x2_6 ;
   H2x1_5  = H2x1_5  +     1.56363187716685 * H1x2_1
          +    -1.60380055270086 * H1x2_2  +    -0.10253336309679 * H1x2_3
          +    -0.70868484989608 * H1x2_4  +    -1.01428312449496 * H1x2_5
          +    -0.52564497366659 * H1x2_6 ;
   H2x1_6  = H2x1_6  +    -2.54663319607132 * H1x2_1
          +    -0.26971572820094 * H1x2_2  +      0.0632302804701 * H1x2_3
          +     0.24322354570335 * H1x2_4  +     0.66904111988013 * H1x2_5
          +     0.74493468449949 * H1x2_6 ;
   H2x1_1  =    -0.48109096483079 + H2x1_1 ;
   H2x1_2  =     1.80708027085243 + H2x1_2 ;
   H2x1_3  =    -0.46023689639613 + H2x1_3 ;
   H2x1_4  =     0.33871753804401 + H2x1_4 ;
   H2x1_5  =    -0.31584249921712 + H2x1_5 ;
   H2x1_6  =     0.30285416134468 + H2x1_6 ;
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
   P_DepVar1  =     7.89179702798476 * H2x1_1  +    -2.13955806072986 * H2x1_2
          +    -3.88305304025889 * H2x1_3  +     4.07340753853874 * H2x1_4
          +     7.74293596833296 * H2x1_5  +     -3.8939011811129 * H2x1_6 ;
   P_DepVar1  =    -5.20107973804597 + P_DepVar1 ;
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
* Ensmbl5: Scoring Code of model 5 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural3;
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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

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
*** Writing the Node intvl ;
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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 *
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
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.74666931543537 * S_AcceptedCmpTotal  +    -0.26928580042975 *
        S_Age  +     0.03131160696792 * S_Frq  +     0.37966440012262 *
        S_Income  +      0.4880522012865 * S_Kidhome
          +    -0.10642365845458 * S_Mnt  +     0.07021626529074 *
        S_MntFishProducts  +    -0.40502977166003 * S_MntFruits
          +    -0.02349027629347 * S_MntGoldProds  +     1.05528002915119 *
        S_MntMeatProducts  +    -0.12400227624159 * S_MntSweetProducts
          +    -0.97101385029429 * S_MntWines  +     0.09983399059623 *
        S_MonthsAsCustomer  +     0.92029846720585 * S_NumCatalogPurchases
          +     1.28630491068585 * S_NumDealsPurchases
          +     0.12175737778271 * S_NumDistPurchases
          +    -0.62012456448967 * S_NumStorePurchases
          +     -0.6092351519122 * S_NumWebPurchases
          +     1.46336740414795 * S_NumWebVisitsMonth
          +     0.69679756539023 * S_RFMstat  +     0.19882494898547 *
        S_RMntFrq  +    -1.02986329135861 * S_Recency
          +      0.0049755319955 * S_Teenhome ;
   H12  =    -0.91147771903585 * S_AcceptedCmpTotal  +    -0.07240098012329 *
        S_Age  +     0.26286532004526 * S_Frq  +    -0.43462974385984 *
        S_Income  +     0.63026291057347 * S_Kidhome
          +     0.15892598048777 * S_Mnt  +     0.96482485555311 *
        S_MntFishProducts  +    -0.04775061278769 * S_MntFruits
          +    -0.14625524046285 * S_MntGoldProds  +    -1.56223918788692 *
        S_MntMeatProducts  +    -0.51302960479013 * S_MntSweetProducts
          +     0.56413001484415 * S_MntWines  +     0.28344048349537 *
        S_MonthsAsCustomer  +    -0.84830633187723 * S_NumCatalogPurchases
          +    -0.66569109065716 * S_NumDealsPurchases
          +    -0.04991685336251 * S_NumDistPurchases
          +     0.97830186941279 * S_NumStorePurchases
          +     1.01041490205359 * S_NumWebPurchases
          +    -1.32418956036577 * S_NumWebVisitsMonth
          +    -0.11032432808867 * S_RFMstat  +     0.09917599091828 *
        S_RMntFrq  +     1.45035992156192 * S_Recency
          +     0.38289769509688 * S_Teenhome ;
   H13  =    -0.14475824149684 * S_AcceptedCmpTotal  +    -0.16657585718812 *
        S_Age  +    -0.20157354778904 * S_Frq  +    -1.05691184936615 *
        S_Income  +     0.56998894495459 * S_Kidhome
          +     0.18949667873044 * S_Mnt  +    -0.20862370006966 *
        S_MntFishProducts  +      0.1024167951483 * S_MntFruits
          +     0.08478049294226 * S_MntGoldProds  +    -0.39072502110043 *
        S_MntMeatProducts  +     0.28675920068433 * S_MntSweetProducts
          +      0.3076165718478 * S_MntWines  +    -0.24620359701099 *
        S_MonthsAsCustomer  +    -0.59353014518331 * S_NumCatalogPurchases
          +     0.07739967453744 * S_NumDealsPurchases
          +    -0.43729543807168 * S_NumDistPurchases
          +      0.0856627398024 * S_NumStorePurchases
          +     -0.0045478100059 * S_NumWebPurchases
          +    -0.64123054514198 * S_NumWebVisitsMonth
          +     0.10052569590232 * S_RFMstat  +     -0.3728458977342 *
        S_RMntFrq  +     1.48732817876807 * S_Recency
          +     0.85232956367064 * S_Teenhome ;
   H11  = H11  +    -0.62033856363993 * AcceptedCmp10
          +    -0.00989853037258 * AcceptedCmp20  +    -0.77097813133684 *
        AcceptedCmp30  +    -0.31448879986852 * AcceptedCmp40
          +    -0.18015100491326 * AcceptedCmp50  +     0.05706658641547 *
        Complain0  +    -0.50105732309148 * HigherEducationBinary0 ;
   H12  = H12  +     0.18414272565688 * AcceptedCmp10
          +      -0.043654707425 * AcceptedCmp20  +    -0.32394050721443 *
        AcceptedCmp30  +    -0.06950576864476 * AcceptedCmp40
          +     1.12623106550654 * AcceptedCmp50  +     -0.0339705259886 *
        Complain0  +    -0.02110753805765 * HigherEducationBinary0 ;
   H13  = H13  +     0.14110100411707 * AcceptedCmp10
          +     0.64032852332569 * AcceptedCmp20  +     0.50653679176195 *
        AcceptedCmp30  +     0.42616036519805 * AcceptedCmp40
          +     0.07072170981185 * AcceptedCmp50  +     0.29291097359872 *
        Complain0  +    -0.31418317974788 * HigherEducationBinary0 ;
   H11  = H11  +     0.03341889038374 * Education2n_Cycle
          +     0.11423971315431 * EducationBasic  +     0.27817968687951 *
        EducationGraduation  +     -0.0281674058306 * EducationMaster
          +     0.16155355707944 * Marital_StatusDivorced
          +     0.04915644167404 * Marital_StatusMarried
          +    -0.16886350906837 * Marital_StatusSingle
          +    -0.09540299348184 * Marital_StatusTogether ;
   H12  = H12  +    -0.18658767739271 * Education2n_Cycle
          +     0.31497893454838 * EducationBasic  +    -0.02835844728364 *
        EducationGraduation  +     0.03310756432448 * EducationMaster
          +    -0.15094637092036 * Marital_StatusDivorced
          +     0.07664831456886 * Marital_StatusMarried
          +    -0.47693612610813 * Marital_StatusSingle
          +     0.14693691283858 * Marital_StatusTogether ;
   H13  = H13  +      0.0502517318618 * Education2n_Cycle
          +    -0.13621229906896 * EducationBasic  +     0.20624951172738 *
        EducationGraduation  +     0.20173383445657 * EducationMaster
          +    -0.58672623647391 * Marital_StatusDivorced
          +      1.8684271616322 * Marital_StatusMarried
          +    -1.30134837394569 * Marital_StatusSingle
          +     1.11308583986156 * Marital_StatusTogether ;
   H11  =    -1.22504924155195 + H11 ;
   H12  =     0.36945079976002 + H12 ;
   H13  =     1.84114106095878 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     2.49740994012105 * H11  +    -2.95405883837745 * H12
          +    -3.26077127833109 * H13 ;
   P_DepVar1  =    -0.23645507747647 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural3;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural3;
*------------------------------------------------------------*;
drop Neural3_P_DepVar1;
Neural3_P_DepVar1 = P_DepVar1;
drop Neural3_P_DepVar0;
Neural3_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural3;
*------------------------------------------------------------*;
length Neural3_WARN_ $4;
drop Neural3_WARN_;
Neural3_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl5: Average Posteriors of 5 models;
*------------------------------------------------------------*;
P_DepVar1 = (
AutoNeural7_P_DepVar1 +
AutoNeural9_P_DepVar1 +
AutoNeural12_P_DepVar1 +
AutoNeural11_P_DepVar1 +
Neural3_P_DepVar1
)/5;
P_DepVar0 = (
AutoNeural7_P_DepVar0 +
AutoNeural9_P_DepVar0 +
AutoNeural12_P_DepVar0 +
AutoNeural11_P_DepVar0 +
Neural3_P_DepVar0
)/5;
*------------------------------------------------------------*;
* Ensmbl5: Computing Classification Vars;
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
* Ensmbl5: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl5: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL9_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL9_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL9_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL9_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL12_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL12_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL12_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL12_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL11_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL11_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL11_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL11_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
