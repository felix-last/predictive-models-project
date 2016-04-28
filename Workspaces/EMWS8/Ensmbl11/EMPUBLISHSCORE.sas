*------------------------------------------------------------*;
* Ensmbl11: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl11: Scoring Code of model 1 of 3;
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
* NODE: Meta3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural40;
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

      label S_Frq = 'Standard: Frq' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_Recency = 'Standard: Recency' ;

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
   Frq ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumWebVisitsMonth ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.50937067326512 * S_AcceptedCmpTotal  +     0.59153604997173 *
        S_Frq  +     0.35109708191283 * S_Mnt  +    -0.54183123684873 *
        S_MntMeatProducts  +    -0.50968421326068 * S_NumCatalogPurchases
          +    -0.19046126117019 * S_NumDealsPurchases
          +    -0.51033119597715 * S_NumWebVisitsMonth
          +     0.81837864997249 * S_Recency ;
   H12  =     0.02025228046339 * S_AcceptedCmpTotal  +     0.99930163787509 *
        S_Frq  +     1.71070447604488 * S_Mnt  +     0.00262288180651 *
        S_MntMeatProducts  +    -0.26040107336488 * S_NumCatalogPurchases
          +     1.79245188553632 * S_NumDealsPurchases
          +     0.26061762777338 * S_NumWebVisitsMonth
          +     0.08976701277133 * S_Recency ;
   H13  =       0.104381332746 * S_AcceptedCmpTotal  +    -1.51764539772771 *
        S_Frq  +     0.93148616742855 * S_Mnt  +     2.93767108708116 *
        S_MntMeatProducts  +     0.79051284359814 * S_NumCatalogPurchases
          +     0.49339750797451 * S_NumDealsPurchases
          +    -0.25657630888957 * S_NumWebVisitsMonth
          +    -0.02783592802322 * S_Recency ;
   H14  =     0.54135833698612 * S_AcceptedCmpTotal  +     1.35730431022222 *
        S_Frq  +     0.77200942468842 * S_Mnt  +    -1.51698500454254 *
        S_MntMeatProducts  +    -0.62605649177998 * S_NumCatalogPurchases
          +    -0.20841011025614 * S_NumDealsPurchases
          +    -0.95976462163535 * S_NumWebVisitsMonth
          +    -0.85153512604579 * S_Recency ;
   H15  =     0.45598292592982 * S_AcceptedCmpTotal  +     0.62149856604856 *
        S_Frq  +    -0.19094507833451 * S_Mnt  +     0.31024365368678 *
        S_MntMeatProducts  +     0.43336537836455 * S_NumCatalogPurchases
          +    -0.79330545518211 * S_NumDealsPurchases
          +     0.31692653945914 * S_NumWebVisitsMonth
          +    -0.82721510615104 * S_Recency ;
   H11  = H11  +    -0.25100863467838 * Marital_StatusDivorced
          +     0.15562142019257 * Marital_StatusMarried
          +    -0.11924929825992 * Marital_StatusSingle
          +     0.19445161712576 * Marital_StatusTogether ;
   H12  = H12  +     0.58193215591516 * Marital_StatusDivorced
          +     0.27485963958922 * Marital_StatusMarried
          +    -0.46136322561544 * Marital_StatusSingle
          +     1.17785849262888 * Marital_StatusTogether ;
   H13  = H13  +    -0.55576156297846 * Marital_StatusDivorced
          +     0.18663773247842 * Marital_StatusMarried
          +    -0.14692184711639 * Marital_StatusSingle
          +     0.40795003682635 * Marital_StatusTogether ;
   H14  = H14  +    -1.70154958647134 * Marital_StatusDivorced
          +     -0.0143065674831 * Marital_StatusMarried
          +     0.13491720981006 * Marital_StatusSingle
          +     0.65058537454476 * Marital_StatusTogether ;
   H15  = H15  +    -0.57735977480465 * Marital_StatusDivorced
          +    -1.18521635425485 * Marital_StatusMarried
          +     1.27858890561049 * Marital_StatusSingle
          +    -0.68308863502606 * Marital_StatusTogether ;
   H11  =     0.91898399777449 + H11 ;
   H12  =    -0.65172531168643 + H12 ;
   H13  =     2.21950020718323 + H13 ;
   H14  =     0.94167989308741 + H14 ;
   H15  =    -2.75049414690283 + H15 ;
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
   P_DepVar1  =    -7.73278760171706 * H11  +    -1.81420899061277 * H12
          +      7.8974780725891 * H13  +    -2.47430312661533 * H14
          +       3.637554312671 * H15 ;
   P_DepVar1  =    -2.27177312353398 + P_DepVar1 ;
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
* Renaming variables for Neural40;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural40;
*------------------------------------------------------------*;
drop Neural40_P_DepVar1;
Neural40_P_DepVar1 = P_DepVar1;
drop Neural40_P_DepVar0;
Neural40_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural40;
*------------------------------------------------------------*;
length Neural40_WARN_ $4;
drop Neural40_WARN_;
Neural40_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl11: Scoring Code of model 2 of 3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural38;
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

      label S_Frq = 'Standard: Frq' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_Recency = 'Standard: Recency' ;

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

      label H1x4_1 = 'Hidden: H1x4_=1' ;

      label H1x4_2 = 'Hidden: H1x4_=2' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x3_1 = 'Hidden: H2x3_=1' ;

      label H2x3_2 = 'Hidden: H2x3_=2' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x2_1 = 'Hidden: H3x2_=1' ;

      label H3x2_2 = 'Hidden: H3x2_=2' ;

      label H4x1_1 = 'Hidden: H4x1_=1' ;

      label H4x1_2 = 'Hidden: H4x1_=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

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
   Frq ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumWebVisitsMonth ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.03317833435323 * S_AcceptedCmpTotal
          +    -0.66859164215955 * S_Frq  +     1.04503858219375 * S_Mnt
          +     3.02405267314398 * S_MntMeatProducts
          +     0.25422172488707 * S_NumCatalogPurchases
          +     0.25977266371328 * S_NumDealsPurchases
          +    -0.26865365728773 * S_NumWebVisitsMonth
          +     0.09531087154516 * S_Recency ;
   H1x1_2  =    -0.69087988352897 * S_AcceptedCmpTotal
          +    -0.11955753576733 * S_Frq  +     0.84152651412075 * S_Mnt
          +    -0.64419071408502 * S_MntMeatProducts
          +    -0.49060224303044 * S_NumCatalogPurchases
          +    -0.04840762943457 * S_NumDealsPurchases
          +     -0.7656247386051 * S_NumWebVisitsMonth
          +     1.13086655489449 * S_Recency ;
   H1x1_1  = H1x1_1  +    -0.53136707555877 * Marital_StatusDivorced
          +    -0.05888536499281 * Marital_StatusMarried
          +    -0.22627441829205 * Marital_StatusSingle
          +     0.52348719245564 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.85322837962298 * Marital_StatusDivorced
          +     0.82536605771339 * Marital_StatusMarried
          +    -0.97196770004098 * Marital_StatusSingle
          +      1.2063947269032 * Marital_StatusTogether ;
   H1x1_1  =     3.30547913450619 + H1x1_1 ;
   H1x1_2  =     1.08446512287712 + H1x1_2 ;
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
   H1x2_1  =     0.52271766494525 * S_AcceptedCmpTotal
          +     0.57611155332907 * S_Frq  +     2.82792468297238 * S_Mnt
          +    -1.52187144029368 * S_MntMeatProducts
          +    -0.17233011764417 * S_NumCatalogPurchases
          +     0.08681674245114 * S_NumDealsPurchases
          +     0.13308256651831 * S_NumWebVisitsMonth
          +    -0.88526514420045 * S_Recency ;
   H1x2_2  =      0.4222520789746 * S_AcceptedCmpTotal
          +    -3.13381438735416 * S_Frq  +    -0.34909843441486 * S_Mnt
          +     0.66187267823731 * S_MntMeatProducts
          +     1.52530454111654 * S_NumCatalogPurchases
          +     0.73982889008686 * S_NumDealsPurchases
          +     1.03760708665776 * S_NumWebVisitsMonth
          +    -1.31685207844927 * S_Recency ;
   H1x2_1  = H1x2_1  +    -0.40921432838161 * Marital_StatusDivorced
          +    -0.57121500191985 * Marital_StatusMarried
          +     0.00575301863466 * Marital_StatusSingle
          +     0.58606212168272 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.05193612372383 * Marital_StatusDivorced
          +     0.68382990555761 * Marital_StatusMarried
          +    -0.40241665873988 * Marital_StatusSingle
          +     0.66274709598028 * Marital_StatusTogether ;
   H1x2_1  =     1.66256790999222 + H1x2_1 ;
   H1x2_2  =    -2.71135276190381 + H1x2_2 ;
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
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -1.36813165661884 * S_AcceptedCmpTotal
          +    -0.29960918468261 * S_Frq  +    -0.65204315831074 * S_Mnt
          +    -2.40830591527574 * S_MntMeatProducts
          +    -0.89296864866675 * S_NumCatalogPurchases
          +     1.79889409325514 * S_NumDealsPurchases
          +    -0.33765715793031 * S_NumWebVisitsMonth
          +    -0.63474704455434 * S_Recency ;
   H1x3_2  =    -0.20409738779324 * S_AcceptedCmpTotal
          +     1.49919916163823 * S_Frq  +     -0.9415605932144 * S_Mnt
          +     0.04224245417831 * S_MntMeatProducts
          +     0.25836861794607 * S_NumCatalogPurchases
          +     2.47909264202917 * S_NumDealsPurchases
          +     0.14790226792406 * S_NumWebVisitsMonth
          +     0.40870786833591 * S_Recency ;
   H1x3_1  = H1x3_1  +     0.20928850420446 * Marital_StatusDivorced
          +     0.39103795234666 * Marital_StatusMarried
          +    -0.52822284221545 * Marital_StatusSingle
          +    -1.86494928221959 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +     1.62005786474378 * Marital_StatusDivorced
          +       1.975579060233 * Marital_StatusMarried
          +     0.15028521746762 * Marital_StatusSingle
          +     0.92005975380984 * Marital_StatusTogether ;
   H1x3_1  =     0.89242262747745 + H1x3_1 ;
   H1x3_2  =     0.65972128608947 + H1x3_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
   H1x3_2  = 1.0 / (1.0 + EXP(MIN( - H1x3_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
END;
*** *************************;
*** Writing the Node H1x4_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x4_1  =    -1.56857036994838 * S_AcceptedCmpTotal
          +    -0.01709393019065 * S_Frq  +    -0.41130381419631 * S_Mnt
          +     0.16060225059391 * S_MntMeatProducts
          +     1.53093292630033 * S_NumCatalogPurchases
          +     0.39573641806699 * S_NumDealsPurchases
          +    -0.95387142126649 * S_NumWebVisitsMonth
          +     0.58661969978382 * S_Recency ;
   H1x4_2  =     0.40365014181339 * S_AcceptedCmpTotal
          +     0.25758137147094 * S_Frq  +     1.96878849657351 * S_Mnt
          +     0.71628478327205 * S_MntMeatProducts
          +     0.15890352363556 * S_NumCatalogPurchases
          +    -1.12928875468011 * S_NumDealsPurchases
          +    -0.30108145274307 * S_NumWebVisitsMonth
          +     0.28810419317266 * S_Recency ;
   H1x4_1  = H1x4_1  +     0.71809860803817 * Marital_StatusDivorced
          +     0.91966160839643 * Marital_StatusMarried
          +    -0.63411090570397 * Marital_StatusSingle
          +    -0.54635673224032 * Marital_StatusTogether ;
   H1x4_2  = H1x4_2  +    -0.82559954633474 * Marital_StatusDivorced
          +     0.77230489026504 * Marital_StatusMarried
          +     0.20456495503812 * Marital_StatusSingle
          +    -0.94791841887496 * Marital_StatusTogether ;
   H1x4_1  =    -0.74278734869781 + H1x4_1 ;
   H1x4_2  =     1.36386007305279 + H1x4_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x4_1  = 1.0 / (1.0 + EXP(MIN( - H1x4_1 , _EXP_BAR)));
   H1x4_2  = 1.0 / (1.0 + EXP(MIN( - H1x4_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x4_1  = .;
   H1x4_2  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     6.70671434954254 * H1x1_1  +    -3.26026761915622 * H1x1_2 ;
   H2x1_2  =     9.50930943961048 * H1x1_1  +     -38.665886357082 * H1x1_2 ;
   H2x1_1  = H2x1_1  +    -2.93089545861469 * H1x2_1
          +     1.56101538169797 * H1x2_2 ;
   H2x1_2  = H2x1_2  +    -0.71350117244702 * H1x2_1
          +    -3.81025846953023 * H1x2_2 ;
   H2x1_1  = H2x1_1  +    -0.33624313911685 * H1x3_1
          +     -0.2506302302983 * H1x3_2 ;
   H2x1_2  = H2x1_2  +    -0.95434767487254 * H1x3_1
          +    -0.10638654133666 * H1x3_2 ;
   H2x1_1  = H2x1_1  +    -0.27261326347944 * H1x4_1
          +     0.15687682287669 * H1x4_2 ;
   H2x1_2  = H2x1_2  +     0.43717724195408 * H1x4_1
          +     0.97600288948907 * H1x4_2 ;
   H2x1_1  =    -1.76465776305701 + H2x1_1 ;
   H2x1_2  =     2.45505067378694 + H2x1_2 ;
   H2x1_1  = SIN(H2x1_1 );
   H2x1_2  = SIN(H2x1_2 );
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     0.44221000188212 * H1x1_1  +    -0.09410411660626 * H1x1_2 ;
   H2x2_2  =    -0.62041237832472 * H1x1_1  +    -1.70568019769479 * H1x1_2 ;
   H2x2_1  = H2x2_1  +     0.86476170574504 * H1x2_1
          +    -2.36042697137738 * H1x2_2 ;
   H2x2_2  = H2x2_2  +     0.44483356408795 * H1x2_1
          +    -1.66254033339836 * H1x2_2 ;
   H2x2_1  = H2x2_1  +     2.16429199725142 * H1x3_1
          +     1.43296701176218 * H1x3_2 ;
   H2x2_2  = H2x2_2  +     -2.3086904824016 * H1x3_1
          +    -2.17810690370253 * H1x3_2 ;
   H2x2_1  = H2x2_1  +     0.00588994713052 * H1x4_1
          +     0.12676819806376 * H1x4_2 ;
   H2x2_2  = H2x2_2  +     0.82027256992322 * H1x4_1
          +    -0.52732352975227 * H1x4_2 ;
   H2x2_1  =     0.47389009262422 + H2x2_1 ;
   H2x2_2  =     -0.8122008316452 + H2x2_2 ;
   H2x2_1  = SIN(H2x2_1 );
   H2x2_2  = SIN(H2x2_2 );
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
END;
*** *************************;
*** Writing the Node H2x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x3_1  =    -0.28493649489231 * H1x1_1  +     0.46324227997344 * H1x1_2 ;
   H2x3_2  =     0.41015874548881 * H1x1_1  +    -0.05146341955765 * H1x1_2 ;
   H2x3_1  = H2x3_1  +    -1.00349052905386 * H1x2_1
          +     0.64290952668224 * H1x2_2 ;
   H2x3_2  = H2x3_2  +     0.48935572509195 * H1x2_1
          +     0.64476371718125 * H1x2_2 ;
   H2x3_1  = H2x3_1  +    -1.11988665905516 * H1x3_1
          +    -0.34805105626026 * H1x3_2 ;
   H2x3_2  = H2x3_2  +     0.32493988416634 * H1x3_1
          +     0.32809540262065 * H1x3_2 ;
   H2x3_1  = H2x3_1  +     0.47764131040964 * H1x4_1
          +    -1.36976442655344 * H1x4_2 ;
   H2x3_2  = H2x3_2  +     -0.3421580983005 * H1x4_1
          +     0.47926475944446 * H1x4_2 ;
   H2x3_1  =     0.90815431460142 + H2x3_1 ;
   H2x3_2  =    -1.77185533764538 + H2x3_2 ;
   H2x3_1  = SIN(H2x3_1 );
   H2x3_2  = SIN(H2x3_2 );
END;
ELSE DO;
   H2x3_1  = .;
   H2x3_2  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     4.31939811374229 * H2x1_1  +      -0.700351897347 * H2x1_2 ;
   H3x1_1  = H3x1_1  +     2.40750918668175 * H2x2_1
          +    -1.54042325930374 * H2x2_2 ;
   H3x1_1  = H3x1_1  +     1.46738265989804 * H2x3_1
          +     0.20077963052939 * H2x3_2 ;
   H3x1_1  =    -0.09840116412671 + H3x1_1 ;
   H3x1_2  = 0;
   _MAX_ = MAX (H3x1_1 , H3x1_2 );
   _SUM_ = 0.;
   H3x1_1  = EXP(H3x1_1  - _MAX_);
   _SUM_ = _SUM_ + H3x1_1 ;
   H3x1_2  = EXP(H3x1_2  - _MAX_);
   _SUM_ = _SUM_ + H3x1_2 ;
   H3x1_1  = H3x1_1  / _SUM_;
   H3x1_2  = H3x1_2  / _SUM_;
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
END;
*** *************************;
*** Writing the Node H3x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x2_1  =    -1.46965147800397 * H2x1_1  +    -0.15489723855448 * H2x1_2 ;
   H3x2_1  = H3x2_1  +     0.91269334410481 * H2x2_1
          +     -0.0392976578726 * H2x2_2 ;
   H3x2_1  = H3x2_1  +    -1.07273740820729 * H2x3_1
          +    -1.32572907075931 * H2x3_2 ;
   H3x2_1  =     0.58690615295837 + H3x2_1 ;
   H3x2_2  = 0;
   _MAX_ = MAX (H3x2_1 , H3x2_2 );
   _SUM_ = 0.;
   H3x2_1  = EXP(H3x2_1  - _MAX_);
   _SUM_ = _SUM_ + H3x2_1 ;
   H3x2_2  = EXP(H3x2_2  - _MAX_);
   _SUM_ = _SUM_ + H3x2_2 ;
   H3x2_1  = H3x2_1  / _SUM_;
   H3x2_2  = H3x2_2  / _SUM_;
END;
ELSE DO;
   H3x2_1  = .;
   H3x2_2  = .;
END;
*** *************************;
*** Writing the Node H4x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H4x1_1  =     2.98683826857579 * H3x1_1  +     -3.7943130439002 * H3x1_2 ;
   H4x1_1  = H4x1_1  +     -0.1130856885584 * H3x2_1
          +     0.90223250703174 * H3x2_2 ;
   H4x1_1  =     0.34321706022332 + H4x1_1 ;
   H4x1_2  = 0;
   _MAX_ = MAX (H4x1_1 , H4x1_2 );
   _SUM_ = 0.;
   H4x1_1  = EXP(H4x1_1  - _MAX_);
   _SUM_ = _SUM_ + H4x1_1 ;
   H4x1_2  = EXP(H4x1_2  - _MAX_);
   _SUM_ = _SUM_ + H4x1_2 ;
   H4x1_1  = H4x1_1  / _SUM_;
   H4x1_2  = H4x1_2  / _SUM_;
END;
ELSE DO;
   H4x1_1  = .;
   H4x1_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     4.36647161522328 * H4x1_1  +    -5.83126986959915 * H4x1_2
         ;
   P_DepVar1  =    -4.21364937441824 + P_DepVar1 ;
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
* Renaming variables for AutoNeural38;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural38;
*------------------------------------------------------------*;
drop AutoNeural38_P_DepVar1;
AutoNeural38_P_DepVar1 = P_DepVar1;
drop AutoNeural38_P_DepVar0;
AutoNeural38_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural38;
*------------------------------------------------------------*;
length AutoNeural38_WARN_ $4;
drop AutoNeural38_WARN_;
AutoNeural38_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl11: Scoring Code of model 3 of 3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural39;
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

      label S_Frq = 'Standard: Frq' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_Recency = 'Standard: Recency' ;

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
   Frq ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumWebVisitsMonth ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.80144597199591 * S_AcceptedCmpTotal
          +    -0.14504406751843 * S_Frq  +    -0.94059273072385 * S_Mnt
          +     0.02561809182055 * S_MntMeatProducts
          +     -0.1793288912734 * S_NumCatalogPurchases
          +    -0.37563080213093 * S_NumDealsPurchases
          +    -0.48858578777845 * S_NumWebVisitsMonth
          +     1.20680693155412 * S_Recency ;
   H1x1_2  =    -0.07420266838621 * S_AcceptedCmpTotal
          +    -0.45831074090349 * S_Frq  +     0.54967451479719 * S_Mnt
          +     1.94302986779634 * S_MntMeatProducts
          +      0.2669037763846 * S_NumCatalogPurchases
          +     0.29313104233947 * S_NumDealsPurchases
          +    -0.30591479309812 * S_NumWebVisitsMonth
          +     0.25821520617291 * S_Recency ;
   H1x1_3  =    -0.12066404689072 * S_AcceptedCmpTotal
          +     0.68455759852245 * S_Frq  +     1.21976572320843 * S_Mnt
          +    -0.76055629383789 * S_MntMeatProducts
          +    -0.40114802991127 * S_NumCatalogPurchases
          +    -1.12215966034372 * S_NumDealsPurchases
          +    -0.30978133586417 * S_NumWebVisitsMonth
          +     0.20549481777473 * S_Recency ;
   H1x1_1  = H1x1_1  +     0.27293780318455 * Marital_StatusDivorced
          +     0.20445663414925 * Marital_StatusMarried
          +     0.16369117386202 * Marital_StatusSingle
          +     0.24678692955726 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.36629769700975 * Marital_StatusDivorced
          +     0.09645374599508 * Marital_StatusMarried
          +     -0.0816282741981 * Marital_StatusSingle
          +       0.097160394807 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     1.07910879572923 * Marital_StatusDivorced
          +     -3.9031880089591 * Marital_StatusMarried
          +      1.6995748309328 * Marital_StatusSingle
          +    -0.60356952072267 * Marital_StatusTogether ;
   H1x1_1  =     4.12951833926199 + H1x1_1 ;
   H1x1_2  =      2.8051459955517 + H1x1_2 ;
   H1x1_3  =    -4.02151507937085 + H1x1_3 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
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
   P_DepVar1  =    -49.7324855017185 * H1x1_1  +     60.9087770313173 * H1x1_2
          +     44.7070762374356 * H1x1_3 ;
   P_DepVar1  =    -18.5106107755559 + P_DepVar1 ;
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
* Renaming variables for AutoNeural39;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural39;
*------------------------------------------------------------*;
drop AutoNeural39_P_DepVar1;
AutoNeural39_P_DepVar1 = P_DepVar1;
drop AutoNeural39_P_DepVar0;
AutoNeural39_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural39;
*------------------------------------------------------------*;
length AutoNeural39_WARN_ $4;
drop AutoNeural39_WARN_;
AutoNeural39_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl11: Average Posteriors of 3 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural40_P_DepVar1 +
AutoNeural38_P_DepVar1 +
AutoNeural39_P_DepVar1
)/3;
P_DepVar0 = (
Neural40_P_DepVar0 +
AutoNeural38_P_DepVar0 +
AutoNeural39_P_DepVar0
)/3;
*------------------------------------------------------------*;
* Ensmbl11: Computing Classification Vars;
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
* Ensmbl11: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl11: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL40_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL40_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL40_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL40_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL38_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL38_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL38_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL38_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL39_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL39_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL39_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL39_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
