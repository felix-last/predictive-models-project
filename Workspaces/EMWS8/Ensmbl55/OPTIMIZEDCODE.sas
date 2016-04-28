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
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural37;
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
   H1x1_1  =     0.09570386434261 * S_AcceptedCmpTotal
          +    -3.36239324145969 * S_Frq  +     2.37222713457405 * S_Mnt
          +     6.08901143667375 * S_MntMeatProducts
          +     2.21464286693249 * S_NumCatalogPurchases
          +     0.88693497635794 * S_NumDealsPurchases
          +    -0.16352347343851 * S_NumWebVisitsMonth
          +     0.02048426810982 * S_Recency ;
   H1x1_1  = H1x1_1  +    -0.48159393292731 * Marital_StatusDivorced
          +     0.97693281807676 * Marital_StatusMarried
          +    -0.47353913752833 * Marital_StatusSingle
          +     0.72993998289048 * Marital_StatusTogether ;
   H1x1_1  =     4.98331351913225 + H1x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     12.9267769403169 * H1x1_1 ;
   P_DepVar1  =    -15.3575436578276 + P_DepVar1 ;
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
* Renaming variables for AutoNeural37;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural37;
*------------------------------------------------------------*;
drop AutoNeural37_P_DepVar1;
AutoNeural37_P_DepVar1 = P_DepVar1;
drop AutoNeural37_P_DepVar0;
AutoNeural37_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural37;
*------------------------------------------------------------*;
length AutoNeural37_WARN_ $4;
drop AutoNeural37_WARN_;
AutoNeural37_WARN_ = _WARN_;
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
* NODE: Meta3;
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
* NODE: Meta3;
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
* NODE: Meta3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural40;
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

      label H1x1_4 = 'Hidden: H1x1_=4' ;

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
   H1x1_1  =    -0.05302855298398 * S_AcceptedCmpTotal
          +    -0.09205648080047 * S_Frq  +    -0.89621344379521 * S_Mnt
          +      0.2338265945616 * S_MntMeatProducts
          +     0.01564313414142 * S_NumCatalogPurchases
          +    -0.07464304384577 * S_NumDealsPurchases
          +    -0.08299095200051 * S_NumWebVisitsMonth
          +     0.13978973311119 * S_Recency ;
   H1x1_2  =    -0.03911055677138 * S_AcceptedCmpTotal
          +     0.07733855489079 * S_Frq  +      0.2563411171282 * S_Mnt
          +     -0.3893643428589 * S_MntMeatProducts
          +    -0.11487225011852 * S_NumCatalogPurchases
          +       0.001237145136 * S_NumDealsPurchases
          +    -0.04234500703321 * S_NumWebVisitsMonth
          +     0.05116348108415 * S_Recency ;
   H1x1_3  =     0.05186380835835 * S_AcceptedCmpTotal
          +    -0.12505141082202 * S_Frq  +    -0.25371307325653 * S_Mnt
          +    -0.27963474874984 * S_MntMeatProducts
          +     0.01939450840376 * S_NumCatalogPurchases
          +    -0.03907394757592 * S_NumDealsPurchases
          +     0.06752842740103 * S_NumWebVisitsMonth
          +    -0.08457426712542 * S_Recency ;
   H1x1_4  =     0.27532181874726 * S_AcceptedCmpTotal
          +    -0.87263022737986 * S_Frq  +    -0.69004923627526 * S_Mnt
          +     0.09842717305515 * S_MntMeatProducts
          +     0.48040050668836 * S_NumCatalogPurchases
          +     0.55911507039756 * S_NumDealsPurchases
          +     0.35441361757916 * S_NumWebVisitsMonth
          +    -0.43753517932111 * S_Recency ;
   H1x1_1  = H1x1_1  +     0.23871713366711 * Marital_StatusDivorced
          +     0.13423943689575 * Marital_StatusMarried
          +    -0.01496857872487 * Marital_StatusSingle
          +     0.09065620914015 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.01884888861908 * Marital_StatusDivorced
          +     0.03005244373637 * Marital_StatusMarried
          +    -0.06891231360799 * Marital_StatusSingle
          +     0.03916911436548 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.13813252013441 * Marital_StatusDivorced
          +     0.01694145364157 * Marital_StatusMarried
          +    -0.05183794192194 * Marital_StatusSingle
          +     0.03543146366331 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.02708459807651 * Marital_StatusDivorced
          +     0.44185773223966 * Marital_StatusMarried
          +     -0.6351733171702 * Marital_StatusSingle
          +     0.63280583005707 * Marital_StatusTogether ;
   H1x1_1  =    -1.91705514496288 + H1x1_1 ;
   H1x1_2  =      0.5215405194232 + H1x1_2 ;
   H1x1_3  =     1.20502195447806 + H1x1_3 ;
   H1x1_4  =    -1.53366644544584 + H1x1_4 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
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
   P_DepVar1  =     39.2787940172339 * H1x1_1  +    -104.671380650004 * H1x1_2
          +      81.489126537237 * H1x1_3  +     9.55747882149012 * H1x1_4 ;
   P_DepVar1  =      5.5599052732327 + P_DepVar1 ;
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
* Renaming variables for AutoNeural40;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural40;
*------------------------------------------------------------*;
drop AutoNeural40_P_DepVar1;
AutoNeural40_P_DepVar1 = P_DepVar1;
drop AutoNeural40_P_DepVar0;
AutoNeural40_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural40;
*------------------------------------------------------------*;
length AutoNeural40_WARN_ $4;
drop AutoNeural40_WARN_;
AutoNeural40_WARN_ = _WARN_;
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
* NODE: Meta3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural34;
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
   H1x1_1  =    -1.54500197834221 * S_AcceptedCmpTotal
          +     2.13269624676531 * S_Frq  +     0.91018334305327 * S_Mnt
          +    -1.92258561684999 * S_MntMeatProducts
          +     -1.7098915194593 * S_NumCatalogPurchases
          +    -0.73092398706652 * S_NumDealsPurchases
          +    -1.52371325097768 * S_NumWebVisitsMonth
          +     2.59712285696981 * S_Recency ;
   H1x1_2  =    -0.62469573898784 * S_AcceptedCmpTotal
          +    -3.01294208996145 * S_Frq  +    -4.18014732340271 * S_Mnt
          +     3.63686708458831 * S_MntMeatProducts
          +     0.32632650897658 * S_NumCatalogPurchases
          +     1.27820262549135 * S_NumDealsPurchases
          +    -0.18941034658667 * S_NumWebVisitsMonth
          +     1.34455705644101 * S_Recency ;
   H1x1_3  =    -1.66686655426537 * S_AcceptedCmpTotal
          +     1.67787744859875 * S_Frq  +     1.97664267386501 * S_Mnt
          +    -0.10252809999866 * S_MntMeatProducts
          +    -2.01730745054613 * S_NumCatalogPurchases
          +     0.36276273056202 * S_NumDealsPurchases
          +    -2.03441379397145 * S_NumWebVisitsMonth
          +     2.93250821506079 * S_Recency ;
   H1x1_4  =     0.78243113686776 * S_AcceptedCmpTotal
          +    -1.82663131535617 * S_Frq  +      0.2881963502664 * S_Mnt
          +     8.03567059273376 * S_MntMeatProducts
          +     2.16664649845379 * S_NumCatalogPurchases
          +     0.84009978401032 * S_NumDealsPurchases
          +     0.11354933533503 * S_NumWebVisitsMonth
          +    -1.07901935721913 * S_Recency ;
   H1x1_5  =       0.520662992966 * S_AcceptedCmpTotal
          +     2.30709719298221 * S_Frq  +    -1.24685702053791 * S_Mnt
          +     1.87107978843927 * S_MntMeatProducts
          +    -0.31123291719979 * S_NumCatalogPurchases
          +    -2.80886037303887 * S_NumDealsPurchases
          +     0.08829426076164 * S_NumWebVisitsMonth
          +     0.01139960588609 * S_Recency ;
   H1x1_1  = H1x1_1  +    -0.51004374170231 * Marital_StatusDivorced
          +     0.50838467240268 * Marital_StatusMarried
          +    -0.57765911295879 * Marital_StatusSingle
          +    -0.24222335065155 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.83738211384182 * Marital_StatusDivorced
          +     0.03531168852657 * Marital_StatusMarried
          +    -0.34417109081648 * Marital_StatusSingle
          +    -0.31315325265885 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -3.70783313474848 * Marital_StatusDivorced
          +      1.9516301625913 * Marital_StatusMarried
          +    -0.24904237582097 * Marital_StatusSingle
          +     1.51668241109596 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.27676175212593 * Marital_StatusDivorced
          +     0.06718550412505 * Marital_StatusMarried
          +    -0.16735434131197 * Marital_StatusSingle
          +     1.06963270761532 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -1.40244452255328 * Marital_StatusDivorced
          +    -1.79498797741807 * Marital_StatusMarried
          +     2.86341746904333 * Marital_StatusSingle
          +    -2.44061593695879 * Marital_StatusTogether ;
   H1x1_1  =     3.20180148936403 + H1x1_1 ;
   H1x1_2  =    -3.03978470440687 + H1x1_2 ;
   H1x1_3  =    -3.39567988555284 + H1x1_3 ;
   H1x1_4  =     4.55938081817653 + H1x1_4 ;
   H1x1_5  =     -6.4669834535491 + H1x1_5 ;
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
   H1x2_1  =    -0.57846605291128 * S_AcceptedCmpTotal
          +     0.46127801191304 * S_Frq  +    -0.14450302472938 * S_Mnt
          +    -0.19914740985847 * S_MntMeatProducts
          +    -0.96920717464092 * S_NumCatalogPurchases
          +    -1.68508588177508 * S_NumDealsPurchases
          +     -0.9404284924488 * S_NumWebVisitsMonth
          +     1.67147332768508 * S_Recency ;
   H1x2_2  =      1.0459354572297 * S_AcceptedCmpTotal
          +     2.82350241064269 * S_Frq  +     0.87895410649025 * S_Mnt
          +    -1.60286606361912 * S_MntMeatProducts
          +    -0.05010796315816 * S_NumCatalogPurchases
          +      1.1380574488234 * S_NumDealsPurchases
          +     0.25426721345204 * S_NumWebVisitsMonth
          +    -2.73625285283256 * S_Recency ;
   H1x2_3  =     1.05785663081938 * S_AcceptedCmpTotal
          +     0.04036906636666 * S_Frq  +     1.87139195780258 * S_Mnt
          +     2.58979830897092 * S_MntMeatProducts
          +      1.2569773545009 * S_NumCatalogPurchases
          +     0.21119951191653 * S_NumDealsPurchases
          +    -0.40993456334326 * S_NumWebVisitsMonth
          +    -0.07518138333775 * S_Recency ;
   H1x2_4  =    -1.65169602183442 * S_AcceptedCmpTotal
          +     0.11259843816571 * S_Frq  +     -0.4909263110452 * S_Mnt
          +     1.58324428521578 * S_MntMeatProducts
          +    -0.64140579988939 * S_NumCatalogPurchases
          +    -0.07557073365385 * S_NumDealsPurchases
          +     0.27159109297915 * S_NumWebVisitsMonth
          +    -2.60734864081732 * S_Recency ;
   H1x2_5  =     -0.0537738178774 * S_AcceptedCmpTotal
          +     0.77977253685316 * S_Frq  +      0.8350835949372 * S_Mnt
          +     0.02133290318048 * S_MntMeatProducts
          +    -0.37682732019302 * S_NumCatalogPurchases
          +     2.57483962426003 * S_NumDealsPurchases
          +    -0.76651867011773 * S_NumWebVisitsMonth
          +     1.79269108990868 * S_Recency ;
   H1x2_1  = H1x2_1  +     -0.6785006078361 * Marital_StatusDivorced
          +     1.00798219323102 * Marital_StatusMarried
          +     -1.3878630687005 * Marital_StatusSingle
          +     0.38993646858937 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     2.09014978919778 * Marital_StatusDivorced
          +    -0.99149540204741 * Marital_StatusMarried
          +    -0.22772928542301 * Marital_StatusSingle
          +     2.92746205796719 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     -0.9762988536771 * Marital_StatusDivorced
          +     1.54170826840021 * Marital_StatusMarried
          +    -0.09937587953829 * Marital_StatusSingle
          +     0.56302999728519 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.25720612100596 * Marital_StatusDivorced
          +    -0.48775794259019 * Marital_StatusMarried
          +     0.87075561905397 * Marital_StatusSingle
          +     0.04810416118778 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.43415973497838 * Marital_StatusDivorced
          +     0.01260332236695 * Marital_StatusMarried
          +     1.18815076116703 * Marital_StatusSingle
          +     0.48437203261339 * Marital_StatusTogether ;
   H1x2_1  =     0.59373524039937 + H1x2_1 ;
   H1x2_2  =    -0.71387492444638 + H1x2_2 ;
   H1x2_3  =    -0.87122218589138 + H1x2_3 ;
   H1x2_4  =    -0.13330305074809 + H1x2_4 ;
   H1x2_5  =    -0.21968490365757 + H1x2_5 ;
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
   H2x1_1  =     1.45129577556868 * H1x1_1  +     -3.2081674830022 * H1x1_2
          +     3.42026207686484 * H1x1_3  +    -3.72024251386054 * H1x1_4
          +    -2.30130940015795 * H1x1_5 ;
   H2x1_2  =    -4.02910663646154 * H1x1_1  +    -1.36266586214201 * H1x1_2
          +     -2.6741103337432 * H1x1_3  +     3.30152436221712 * H1x1_4
          +     4.60157490246583 * H1x1_5 ;
   H2x1_3  =    -2.71265022944259 * H1x1_1  +     3.25833541933639 * H1x1_2
          +    -4.27328627935531 * H1x1_3  +     3.44552729303863 * H1x1_4
          +     1.98222057652994 * H1x1_5 ;
   H2x1_4  =     2.28893869996771 * H1x1_1  +    -1.88060597031882 * H1x1_2
          +     2.73897702163351 * H1x1_3  +    -1.93112188328204 * H1x1_4
          +    -2.14551123022514 * H1x1_5 ;
   H2x1_5  =     0.17403378809357 * H1x1_1  +     0.03207619288442 * H1x1_2
          +     0.88058789634283 * H1x1_3  +    -2.03707509730247 * H1x1_4
          +    -0.16844881046516 * H1x1_5 ;
   H2x1_1  = H2x1_1  +    -0.42620560083346 * H1x2_1
          +     2.61300451668579 * H1x2_2  +    -1.08729872311941 * H1x2_3
          +     0.36500562232913 * H1x2_4  +     0.78657990168531 * H1x2_5 ;
   H2x1_2  = H2x1_2  +     -3.3095282858933 * H1x2_1
          +    -1.16629762992585 * H1x2_2  +     0.33128267734744 * H1x2_3
          +     0.07369118606842 * H1x2_4  +      0.6553035374014 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     0.51835290812588 * H1x2_1
          +    -0.73350588958096 * H1x2_2  +     1.41475754999036 * H1x2_3
          +     0.14918618308538 * H1x2_4  +    -1.73283355686834 * H1x2_5 ;
   H2x1_4  = H2x1_4  +     0.98984363206925 * H1x2_1
          +     2.36687848114553 * H1x2_2  +     0.03777540439167 * H1x2_3
          +    -0.73252777784956 * H1x2_4  +    -0.04184890910757 * H1x2_5 ;
   H2x1_5  = H2x1_5  +    -2.05979445476877 * H1x2_1
          +     0.19598137322499 * H1x2_2  +    -1.96096261338489 * H1x2_3
          +    -1.87993721108869 * H1x2_4  +     1.19567303848292 * H1x2_5 ;
   H2x1_1  =     1.99856910799552 + H2x1_1 ;
   H2x1_2  =    -0.68335198868759 + H2x1_2 ;
   H2x1_3  =    -1.47801222552286 + H2x1_3 ;
   H2x1_4  =    -0.64885772031774 + H2x1_4 ;
   H2x1_5  =     1.36680339876645 + H2x1_5 ;
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
   P_DepVar1  =    -8.53264166014568 * H2x1_1  +     9.59119828234132 * H2x1_2
          +     8.22466103889512 * H2x1_3  +    -7.77899855684839 * H2x1_4
          +    -2.21335603990809 * H2x1_5 ;
   P_DepVar1  =     0.50239586442602 + P_DepVar1 ;
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
* Renaming variables for AutoNeural34;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural34;
*------------------------------------------------------------*;
drop AutoNeural34_P_DepVar1;
AutoNeural34_P_DepVar1 = P_DepVar1;
drop AutoNeural34_P_DepVar0;
AutoNeural34_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural34;
*------------------------------------------------------------*;
length AutoNeural34_WARN_ $4;
drop AutoNeural34_WARN_;
AutoNeural34_WARN_ = _WARN_;
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
* NODE: Meta3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural35;
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

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

      label H1x3_6 = 'Hidden: H1x3_=6' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x2_3 = 'Hidden: H2x2_=3' ;

      label H2x2_4 = 'Hidden: H2x2_=4' ;

      label H2x2_5 = 'Hidden: H2x2_=5' ;

      label H2x2_6 = 'Hidden: H2x2_=6' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x1_3 = 'Hidden: H3x1_=3' ;

      label H3x1_4 = 'Hidden: H3x1_=4' ;

      label H3x1_5 = 'Hidden: H3x1_=5' ;

      label H3x1_6 = 'Hidden: H3x1_=6' ;

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
   H1x1_1  =    -0.67537728004966 * S_AcceptedCmpTotal
          +     2.81188938311993 * S_Frq  +    -0.48449735677533 * S_Mnt
          +     2.79168320854924 * S_MntMeatProducts
          +    -1.09894266401589 * S_NumCatalogPurchases
          +    -0.32966417347551 * S_NumDealsPurchases
          +    -0.72195034767343 * S_NumWebVisitsMonth
          +     1.26300567591683 * S_Recency ;
   H1x1_2  =    -0.10530102616636 * S_AcceptedCmpTotal
          +    -1.56143940912133 * S_Frq  +    -4.62897774617873 * S_Mnt
          +     9.02469430152189 * S_MntMeatProducts
          +     1.42644521887241 * S_NumCatalogPurchases
          +      0.6475058577302 * S_NumDealsPurchases
          +     0.08123225110233 * S_NumWebVisitsMonth
          +    -0.13437822083345 * S_Recency ;
   H1x1_3  =     0.38623415840156 * S_AcceptedCmpTotal
          +     1.26011321422418 * S_Frq  +     0.93412252767552 * S_Mnt
          +     5.40567027331821 * S_MntMeatProducts
          +     0.21404551755506 * S_NumCatalogPurchases
          +    -3.79184634796332 * S_NumDealsPurchases
          +     0.64355102802571 * S_NumWebVisitsMonth
          +     0.95080943397397 * S_Recency ;
   H1x1_4  =    -2.69419226375129 * S_AcceptedCmpTotal
          +     4.80721116964493 * S_Frq  +     4.56726230244782 * S_Mnt
          +     2.35287601364019 * S_MntMeatProducts
          +    -3.27198648531912 * S_NumCatalogPurchases
          +    -0.16046880718311 * S_NumDealsPurchases
          +     -3.7025327830273 * S_NumWebVisitsMonth
          +     5.47829314370286 * S_Recency ;
   H1x1_5  =     3.75699631118799 * S_AcceptedCmpTotal
          +    -1.60236762300853 * S_Frq  +     0.64007421195882 * S_Mnt
          +     8.39312647460766 * S_MntMeatProducts
          +     3.07026872536137 * S_NumCatalogPurchases
          +     2.03045608124213 * S_NumDealsPurchases
          +     3.86452915398414 * S_NumWebVisitsMonth
          +    -5.45655790704746 * S_Recency ;
   H1x1_1  = H1x1_1  +     0.59959546037733 * Marital_StatusDivorced
          +     0.14979485299347 * Marital_StatusMarried
          +    -0.09166445391312 * Marital_StatusSingle
          +     -0.8898837643688 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.13516192952275 * Marital_StatusDivorced
          +      0.1646484112393 * Marital_StatusMarried
          +     0.01074681811884 * Marital_StatusSingle
          +    -0.38035258327435 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -6.14970888128598 * Marital_StatusDivorced
          +    -0.28313626645981 * Marital_StatusMarried
          +      2.8257446964988 * Marital_StatusSingle
          +     0.44817043395102 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     -5.3794018991977 * Marital_StatusDivorced
          +     3.05775024202559 * Marital_StatusMarried
          +    -0.23539571945671 * Marital_StatusSingle
          +     4.66331490520755 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     1.25174944520682 * Marital_StatusDivorced
          +    -0.48359916542157 * Marital_StatusMarried
          +    -1.64182316823237 * Marital_StatusSingle
          +     1.33430611846768 * Marital_StatusTogether ;
   H1x1_1  =     4.63389499664507 + H1x1_1 ;
   H1x1_2  =     2.11311359057093 + H1x1_2 ;
   H1x1_3  =    -0.62083985205654 + H1x1_3 ;
   H1x1_4  =     3.41081693054871 + H1x1_4 ;
   H1x1_5  =    -9.34543620991542 + H1x1_5 ;
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
   H1x2_1  =     0.75154793671381 * S_AcceptedCmpTotal
          +     1.16505569462642 * S_Frq  +     -0.8308540177887 * S_Mnt
          +     0.55999885697493 * S_MntMeatProducts
          +      0.2225207563207 * S_NumCatalogPurchases
          +     -1.0233439835205 * S_NumDealsPurchases
          +    -0.35430585878397 * S_NumWebVisitsMonth
          +    -1.61097128706343 * S_Recency ;
   H1x2_2  =    -2.67887309413165 * S_AcceptedCmpTotal
          +    -1.18932806022128 * S_Frq  +    -0.12550289494399 * S_Mnt
          +    -1.04508919964747 * S_MntMeatProducts
          +     -0.6758665249546 * S_NumCatalogPurchases
          +    -0.24215201937497 * S_NumDealsPurchases
          +    -1.02736823453312 * S_NumWebVisitsMonth
          +    -2.91942343887972 * S_Recency ;
   H1x2_3  =    -1.59525226271453 * S_AcceptedCmpTotal
          +    -3.01360419340124 * S_Frq  +    -2.42130716453762 * S_Mnt
          +    -3.97854305593999 * S_MntMeatProducts
          +    -2.05331728407593 * S_NumCatalogPurchases
          +    -0.48841403720827 * S_NumDealsPurchases
          +     0.25411498590567 * S_NumWebVisitsMonth
          +     2.61356292629829 * S_Recency ;
   H1x2_4  =    -0.23213568401478 * S_AcceptedCmpTotal
          +    -0.21547029102909 * S_Frq  +    -3.71365412498023 * S_Mnt
          +     -0.7071400781557 * S_MntMeatProducts
          +     1.20780208787296 * S_NumCatalogPurchases
          +    -0.58152407834402 * S_NumDealsPurchases
          +     2.15567925539399 * S_NumWebVisitsMonth
          +     0.04520696731554 * S_Recency ;
   H1x2_5  =    -0.77921338806706 * S_AcceptedCmpTotal
          +    -1.01600283852312 * S_Frq  +     0.74495825285389 * S_Mnt
          +    -1.07023271439686 * S_MntMeatProducts
          +     0.31952847185507 * S_NumCatalogPurchases
          +     0.97232557455358 * S_NumDealsPurchases
          +     1.40227284681788 * S_NumWebVisitsMonth
          +    -2.63740913159308 * S_Recency ;
   H1x2_1  = H1x2_1  +     0.27635646709847 * Marital_StatusDivorced
          +    -1.54860787754125 * Marital_StatusMarried
          +     3.07164083530731 * Marital_StatusSingle
          +    -0.82580381126768 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.41647124050716 * Marital_StatusDivorced
          +     1.93404037878036 * Marital_StatusMarried
          +    -1.33159061927866 * Marital_StatusSingle
          +    -1.07762979483959 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     1.18723200575444 * Marital_StatusDivorced
          +    -1.20603561095549 * Marital_StatusMarried
          +     1.40927693179184 * Marital_StatusSingle
          +    -0.49407691558139 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.69596798616284 * Marital_StatusDivorced
          +     -0.1442863204197 * Marital_StatusMarried
          +     0.60523055771734 * Marital_StatusSingle
          +     0.73192299984342 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +      0.7891943859827 * Marital_StatusDivorced
          +     0.09024082077945 * Marital_StatusMarried
          +     0.46315219527454 * Marital_StatusSingle
          +    -0.88863370904771 * Marital_StatusTogether ;
   H1x2_1  =    -1.73041096602206 + H1x2_1 ;
   H1x2_2  =     -0.9244515570647 + H1x2_2 ;
   H1x2_3  =     0.42257482856224 + H1x2_3 ;
   H1x2_4  =    -1.17368520710394 + H1x2_4 ;
   H1x2_5  =    -0.96945494530554 + H1x2_5 ;
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
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.60593493975552 * S_AcceptedCmpTotal
          +    -1.29329226371919 * S_Frq  +      0.9015843457146 * S_Mnt
          +    -1.02461177883701 * S_MntMeatProducts
          +     0.58245198640098 * S_NumCatalogPurchases
          +    -0.23780276328844 * S_NumDealsPurchases
          +     1.28202459687231 * S_NumWebVisitsMonth
          +     0.93713351024897 * S_Recency ;
   H1x3_2  =    -1.08797424998886 * S_AcceptedCmpTotal
          +     0.71996006602625 * S_Frq  +     0.26461282542951 * S_Mnt
          +     0.13875330330852 * S_MntMeatProducts
          +    -0.22996544763814 * S_NumCatalogPurchases
          +    -0.36599639965399 * S_NumDealsPurchases
          +     1.99081506581768 * S_NumWebVisitsMonth
          +    -0.27280347287018 * S_Recency ;
   H1x3_3  =     -0.3446411379442 * S_AcceptedCmpTotal
          +    -0.90527024017686 * S_Frq  +    -0.09374789575642 * S_Mnt
          +     0.94472031892058 * S_MntMeatProducts
          +     0.27511909854912 * S_NumCatalogPurchases
          +    -0.55526545857693 * S_NumDealsPurchases
          +    -0.61544688091302 * S_NumWebVisitsMonth
          +     1.92722528696298 * S_Recency ;
   H1x3_4  =     0.14447197723193 * S_AcceptedCmpTotal
          +     0.58502643519667 * S_Frq  +    -0.22179847560956 * S_Mnt
          +     1.61403840093612 * S_MntMeatProducts
          +    -0.34382576245292 * S_NumCatalogPurchases
          +     0.70213159483637 * S_NumDealsPurchases
          +    -0.39731145628175 * S_NumWebVisitsMonth
          +     0.76292573150858 * S_Recency ;
   H1x3_5  =     1.12424583212244 * S_AcceptedCmpTotal
          +     1.23224599851617 * S_Frq  +     0.66506653339362 * S_Mnt
          +    -0.33974847531229 * S_MntMeatProducts
          +     1.74350962571519 * S_NumCatalogPurchases
          +     0.41098583446208 * S_NumDealsPurchases
          +    -0.66305298743409 * S_NumWebVisitsMonth
          +    -1.08660974929691 * S_Recency ;
   H1x3_1  = H1x3_1  +     0.54739694564163 * Marital_StatusDivorced
          +    -0.29510060772746 * Marital_StatusMarried
          +     1.74124353401891 * Marital_StatusSingle
          +     0.09719439743973 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +     0.45031904962773 * Marital_StatusDivorced
          +    -0.61203463567014 * Marital_StatusMarried
          +     1.95705767804118 * Marital_StatusSingle
          +     0.33872926096104 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +     1.36802060586393 * Marital_StatusDivorced
          +      1.7151906515185 * Marital_StatusMarried
          +     0.70376524929742 * Marital_StatusSingle
          +    -1.29423542782048 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +      1.5350754313919 * Marital_StatusDivorced
          +    -1.27088213578872 * Marital_StatusMarried
          +    -0.91253966593459 * Marital_StatusSingle
          +    -1.63570965011409 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +    -1.18462010911271 * Marital_StatusDivorced
          +     -0.5308059771847 * Marital_StatusMarried
          +    -0.11208078645904 * Marital_StatusSingle
          +     0.12123408245196 * Marital_StatusTogether ;
   H1x3_1  =    -0.26014877330113 + H1x3_1 ;
   H1x3_2  =     1.39405484419099 + H1x3_2 ;
   H1x3_3  =       0.062236253986 + H1x3_3 ;
   H1x3_4  =    -1.27980815366792 + H1x3_4 ;
   H1x3_5  =     -1.1798994280447 + H1x3_5 ;
   H1x3_6  = 0;
   _MAX_ = MAX (H1x3_1 , H1x3_2 , H1x3_3 , H1x3_4 , H1x3_5 , H1x3_6 );
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
   H1x3_1  = H1x3_1  / _SUM_;
   H1x3_2  = H1x3_2  / _SUM_;
   H1x3_3  = H1x3_3  / _SUM_;
   H1x3_4  = H1x3_4  / _SUM_;
   H1x3_5  = H1x3_5  / _SUM_;
   H1x3_6  = H1x3_6  / _SUM_;
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
   H1x3_6  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     3.99029808661292 * H1x1_1  +    -3.83684783950239 * H1x1_2
          +    -2.41319598667027 * H1x1_3  +     2.06742099113284 * H1x1_4
          +    -2.36394302227369 * H1x1_5  +     3.54247817086581 * H1x1_6 ;
   H2x1_2  =     -2.0723583712808 * H1x1_1  +     1.12235090404628 * H1x1_2
          +    -0.03290243005002 * H1x1_3  +    -0.06417927223452 * H1x1_4
          +    -0.34539694059136 * H1x1_5  +    -0.52107667797315 * H1x1_6 ;
   H2x1_3  =     1.49450378696022 * H1x1_1  +      -2.468244574983 * H1x1_2
          +    -0.36343212796601 * H1x1_3  +      1.4169785905238 * H1x1_4
          +    -1.80253819167441 * H1x1_5  +     0.60012496024445 * H1x1_6 ;
   H2x1_4  =     4.08181488615859 * H1x1_1  +    -4.15992879198886 * H1x1_2
          +    -2.19496884111483 * H1x1_3  +     3.11143094120583 * H1x1_4
          +    -3.40405639905396 * H1x1_5  +     2.02399938887542 * H1x1_6 ;
   H2x1_5  =    -2.80696695717904 * H1x1_1  +     3.69857556154733 * H1x1_2
          +     1.61258939701991 * H1x1_3  +    -0.34320433710838 * H1x1_4
          +     2.41467598917752 * H1x1_5  +    -4.36781665394854 * H1x1_6 ;
   H2x1_6  =     1.17835620997236 * H1x1_1  +     1.12816318935432 * H1x1_2
          +     1.70095032323284 * H1x1_3  +     0.81564117008927 * H1x1_4
          +     1.08987549759927 * H1x1_5  +    -0.71801946066256 * H1x1_6 ;
   H2x1_1  = H2x1_1  +     -1.2826842607194 * H1x2_1
          +     2.22412584447126 * H1x2_2  +     0.72628922978475 * H1x2_3
          +    -3.95557982334969 * H1x2_4  +    -2.04105313525341 * H1x2_5
          +     2.04509722582983 * H1x2_6 ;
   H2x1_2  = H2x1_2  +     0.49261020621896 * H1x2_1
          +    -0.93299086546719 * H1x2_2  +     0.26477710017311 * H1x2_3
          +     1.09581866123251 * H1x2_4  +    -0.46857965033394 * H1x2_5
          +    -0.58594558422322 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -0.65407007731655 * H1x2_1
          +     1.01682664175846 * H1x2_2  +     1.17960401469824 * H1x2_3
          +    -0.57751066508002 * H1x2_4  +     0.53760419760268 * H1x2_5
          +     0.11690916040928 * H1x2_6 ;
   H2x1_4  = H2x1_4  +    -1.88745579191294 * H1x2_1
          +     0.08794337871579 * H1x2_2  +     1.00647337881564 * H1x2_3
          +     0.02010547776794 * H1x2_4  +     -0.9674279317507 * H1x2_5
          +     2.96934196494413 * H1x2_6 ;
   H2x1_5  = H2x1_5  +      1.2829064187123 * H1x2_1
          +    -1.00339413616366 * H1x2_2  +     0.80005613751846 * H1x2_3
          +     1.89259049343074 * H1x2_4  +     0.60916287215789 * H1x2_5
          +    -2.39364002282682 * H1x2_6 ;
   H2x1_6  = H2x1_6  +    -0.81495808949076 * H1x2_1
          +    -0.00823496050906 * H1x2_2  +     0.66082398024174 * H1x2_3
          +     1.06065684801326 * H1x2_4  +    -1.16933111622346 * H1x2_5
          +    -0.91996717495653 * H1x2_6 ;
   H2x1_1  = H2x1_1  +     -0.6489804084947 * H1x3_1
          +    -0.44608682782132 * H1x3_2  +    -0.52631519220433 * H1x3_3
          +     0.05973897946073 * H1x3_4  +     0.44587517212447 * H1x3_5
          +     0.53167866343669 * H1x3_6 ;
   H2x1_2  = H2x1_2  +     0.24566122981429 * H1x3_1
          +    -0.41402912962362 * H1x3_2  +      2.0594253556608 * H1x3_3
          +    -0.58320740989612 * H1x3_4  +    -2.08321797810741 * H1x3_5
          +     0.09325988094727 * H1x3_6 ;
   H2x1_3  = H2x1_3  +    -0.30386162033576 * H1x3_1
          +    -0.39149635061779 * H1x3_2  +    -1.24745656988432 * H1x3_3
          +    -0.74308961556897 * H1x3_4  +    -0.52424837897845 * H1x3_5
          +    -0.43722126116548 * H1x3_6 ;
   H2x1_4  = H2x1_4  +    -1.17147905515311 * H1x3_1
          +     0.52572462392428 * H1x3_2  +     0.00378456310616 * H1x3_3
          +    -0.02141108534986 * H1x3_4  +     0.66609276044861 * H1x3_5
          +     1.49998370890459 * H1x3_6 ;
   H2x1_5  = H2x1_5  +     0.91101541301155 * H1x3_1
          +    -1.16594573895683 * H1x3_2  +     0.19997446137786 * H1x3_3
          +    -0.75943200735258 * H1x3_4  +    -1.58620169109633 * H1x3_5
          +    -0.30128378921356 * H1x3_6 ;
   H2x1_6  = H2x1_6  +     1.75854843594447 * H1x3_1
          +     0.30319854862296 * H1x3_2  +    -0.73946432700618 * H1x3_3
          +     1.37468838558857 * H1x3_4  +    -0.00997395846467 * H1x3_5
          +    -0.19152232249307 * H1x3_6 ;
   H2x1_1  =     0.45481579395551 + H2x1_1 ;
   H2x1_2  =    -2.37666191889476 + H2x1_2 ;
   H2x1_3  =    -0.00303747786799 + H2x1_3 ;
   H2x1_4  =     0.00817665450619 + H2x1_4 ;
   H2x1_5  =    -0.26930716006201 + H2x1_5 ;
   H2x1_6  =    -1.62147466604007 + H2x1_6 ;
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
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     0.00129497064463 * H1x1_1  +    -1.04968224667608 * H1x1_2
          +    -1.32377424983581 * H1x1_3  +    -0.11361581517247 * H1x1_4
          +    -0.37590426822975 * H1x1_5  +    -1.19299469136178 * H1x1_6 ;
   H2x2_2  =    -1.54715956973408 * H1x1_1  +      0.1149804500896 * H1x1_2
          +    -0.31622478778172 * H1x1_3  +     0.19815372068281 * H1x1_4
          +     1.54570900690762 * H1x1_5  +    -0.23243316190231 * H1x1_6 ;
   H2x2_3  =    -1.69410933303344 * H1x1_1  +    -0.10842772109927 * H1x1_2
          +     0.73648318250282 * H1x1_3  +     0.68553115685533 * H1x1_4
          +    -0.47234449931244 * H1x1_5  +     1.14739016222951 * H1x1_6 ;
   H2x2_4  =     0.36443547307479 * H1x1_1  +     0.49919653848293 * H1x1_2
          +     1.98377926340404 * H1x1_3  +    -0.55638731785874 * H1x1_4
          +     0.51877040984242 * H1x1_5  +     0.69001883670374 * H1x1_6 ;
   H2x2_5  =     0.15664903927836 * H1x1_1  +     0.89801997414549 * H1x1_2
          +     0.04506031069937 * H1x1_3  +      1.4896420490685 * H1x1_4
          +     0.98365163988804 * H1x1_5  +     1.62881757963203 * H1x1_6 ;
   H2x2_6  =    -0.88991913364633 * H1x1_1  +     1.86575129972351 * H1x1_2
          +     0.76328070558448 * H1x1_3  +     0.63606778895588 * H1x1_4
          +    -1.11359575595575 * H1x1_5  +     1.10728303240553 * H1x1_6 ;
   H2x2_1  = H2x2_1  +     -1.7548673730828 * H1x2_1
          +     1.87853034076717 * H1x2_2  +     0.85492889927862 * H1x2_3
          +     2.26726704170325 * H1x2_4  +       0.268534161133 * H1x2_5
          +     1.21824749182936 * H1x2_6 ;
   H2x2_2  = H2x2_2  +    -0.17868178338793 * H1x2_1
          +     1.40599171642169 * H1x2_2  +      1.3483797762751 * H1x2_3
          +    -0.89621237430335 * H1x2_4  +     0.47933617934751 * H1x2_5
          +    -0.70127450180732 * H1x2_6 ;
   H2x2_3  = H2x2_3  +     0.42928211521549 * H1x2_1
          +     0.12704381906566 * H1x2_2  +    -0.80979451254833 * H1x2_3
          +     -0.6754098317508 * H1x2_4  +     1.10456495865489 * H1x2_5
          +      0.1757517587226 * H1x2_6 ;
   H2x2_4  = H2x2_4  +    -1.58081641854024 * H1x2_1
          +     0.41044457304901 * H1x2_2  +      0.1555052899648 * H1x2_3
          +     1.44452911239916 * H1x2_4  +     0.51745105090469 * H1x2_5
          +      0.8693099398328 * H1x2_6 ;
   H2x2_5  = H2x2_5  +     1.04509064360988 * H1x2_1
          +     0.85304412821506 * H1x2_2  +     0.02488996279683 * H1x2_3
          +     0.91802038137174 * H1x2_4  +    -1.81721580205502 * H1x2_5
          +     0.11240659705231 * H1x2_6 ;
   H2x2_6  = H2x2_6  +     0.05653875399544 * H1x2_1
          +     1.39275186399065 * H1x2_2  +     0.15742585211841 * H1x2_3
          +    -0.88823005597082 * H1x2_4  +    -0.29404620644608 * H1x2_5
          +     0.67151326645383 * H1x2_6 ;
   H2x2_1  = H2x2_1  +     -0.3030053902263 * H1x3_1
          +     2.78883241587523 * H1x3_2  +      0.2423564112649 * H1x3_3
          +      0.7361422570599 * H1x3_4  +     1.00815416571126 * H1x3_5
          +    -0.76522554014331 * H1x3_6 ;
   H2x2_2  = H2x2_2  +     0.82248064405342 * H1x3_1
          +    -0.44213525858661 * H1x3_2  +    -0.00950377945068 * H1x3_3
          +    -0.26973050484517 * H1x3_4  +    -1.64864877093803 * H1x3_5
          +     1.79694481340011 * H1x3_6 ;
   H2x2_3  = H2x2_3  +     0.58931676503392 * H1x3_1
          +     -0.3196648688702 * H1x3_2  +    -1.13832101252701 * H1x3_3
          +    -0.03125400478011 * H1x3_4  +    -1.43718277665665 * H1x3_5
          +     0.43346153474351 * H1x3_6 ;
   H2x2_4  = H2x2_4  +    -1.21075206873547 * H1x3_1
          +    -1.44059265356325 * H1x3_2  +    -0.70572923760085 * H1x3_3
          +    -0.50514975818712 * H1x3_4  +    -1.15362557643796 * H1x3_5
          +     0.11633831354046 * H1x3_6 ;
   H2x2_5  = H2x2_5  +     1.62708810169671 * H1x3_1
          +     -0.1172779578507 * H1x3_2  +    -2.68535586251402 * H1x3_3
          +     0.70733149959662 * H1x3_4  +     0.37426620231353 * H1x3_5
          +    -0.51535580022884 * H1x3_6 ;
   H2x2_6  = H2x2_6  +     1.13688712518045 * H1x3_1
          +      0.5035299609214 * H1x3_2  +    -0.37315357246579 * H1x3_3
          +     2.28435302728227 * H1x3_4  +    -0.86692347925858 * H1x3_5
          +     1.02261478089015 * H1x3_6 ;
   H2x2_1  =      2.1294351501339 + H2x2_1 ;
   H2x2_2  =     1.02351873226689 + H2x2_2 ;
   H2x2_3  =    -2.24013423062467 + H2x2_3 ;
   H2x2_4  =    -0.75459686616452 + H2x2_4 ;
   H2x2_5  =    -0.02288525069595 + H2x2_5 ;
   H2x2_6  =     0.85009535412356 + H2x2_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x2_1  = 1.0 / (1.0 + EXP(MIN( - H2x2_1 , _EXP_BAR)));
   H2x2_2  = 1.0 / (1.0 + EXP(MIN( - H2x2_2 , _EXP_BAR)));
   H2x2_3  = 1.0 / (1.0 + EXP(MIN( - H2x2_3 , _EXP_BAR)));
   H2x2_4  = 1.0 / (1.0 + EXP(MIN( - H2x2_4 , _EXP_BAR)));
   H2x2_5  = 1.0 / (1.0 + EXP(MIN( - H2x2_5 , _EXP_BAR)));
   H2x2_6  = 1.0 / (1.0 + EXP(MIN( - H2x2_6 , _EXP_BAR)));
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
   H2x2_3  = .;
   H2x2_4  = .;
   H2x2_5  = .;
   H2x2_6  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     0.47414908117619 * H2x1_1  +    -0.48225593618443 * H2x1_2
          +     -2.1415546083933 * H2x1_3  +      0.1865992678808 * H2x1_4
          +     0.00905592746992 * H2x1_5  +    -0.19906676643855 * H2x1_6 ;
   H3x1_2  =    -1.49254004953978 * H2x1_1  +     0.31026207162707 * H2x1_2
          +     1.32646563211977 * H2x1_3  +    -1.28309969785351 * H2x1_4
          +     0.25756953254945 * H2x1_5  +    -0.76411205087595 * H2x1_6 ;
   H3x1_3  =    -1.92735673513935 * H2x1_1  +    -0.43375763993013 * H2x1_2
          +     0.43682333912422 * H2x1_3  +    -1.82129068789797 * H2x1_4
          +     0.29218264240002 * H2x1_5  +    -1.24122940235749 * H2x1_6 ;
   H3x1_4  =    -1.64752963128738 * H2x1_1  +     0.57434247193535 * H2x1_2
          +    -0.25025779129033 * H2x1_3  +     0.22582895723418 * H2x1_4
          +     1.06280616805567 * H2x1_5  +     1.46523065565448 * H2x1_6 ;
   H3x1_5  =     1.12463631894495 * H2x1_1  +     0.41116194812841 * H2x1_2
          +      0.7487833097767 * H2x1_3  +     1.30777439715556 * H2x1_4
          +    -2.30583381860923 * H2x1_5  +    -0.45051702468841 * H2x1_6 ;
   H3x1_6  =     0.83619385924948 * H2x1_1  +    -1.59549231556809 * H2x1_2
          +     1.90180728278943 * H2x1_3  +     1.56404469490888 * H2x1_4
          +    -0.13088910369985 * H2x1_5  +     0.29690402913896 * H2x1_6 ;
   H3x1_1  = H3x1_1  +    -0.92346745353313 * H2x2_1
          +    -0.03076503207993 * H2x2_2  +    -0.80770265916018 * H2x2_3
          +     2.13033820393108 * H2x2_4  +     1.57799583499821 * H2x2_5
          +    -0.96381430690961 * H2x2_6 ;
   H3x1_2  = H3x1_2  +     -2.8908441376485 * H2x2_1
          +    -0.73955819678817 * H2x2_2  +     0.25644336633912 * H2x2_3
          +    -0.21076687801122 * H2x2_4  +    -0.80525890625048 * H2x2_5
          +    -1.37757472119786 * H2x2_6 ;
   H3x1_3  = H3x1_3  +     1.68560264985255 * H2x2_1
          +    -1.80659127572232 * H2x2_2  +    -0.40798847098834 * H2x2_3
          +    -0.09427467518365 * H2x2_4  +       1.932433481179 * H2x2_5
          +    -1.58203174336227 * H2x2_6 ;
   H3x1_4  = H3x1_4  +    -0.79131921613464 * H2x2_1
          +    -0.94708168667993 * H2x2_2  +     0.95842423067232 * H2x2_3
          +    -1.35896085667273 * H2x2_4  +      0.3130528184907 * H2x2_5
          +     1.21364725785316 * H2x2_6 ;
   H3x1_5  = H3x1_5  +    -1.65282990431545 * H2x2_1
          +     0.41456756806825 * H2x2_2  +    -2.00212916702729 * H2x2_3
          +    -1.19874789923068 * H2x2_4  +     0.20234859862481 * H2x2_5
          +     0.95942799624748 * H2x2_6 ;
   H3x1_6  = H3x1_6  +    -0.52526666332317 * H2x2_1
          +      0.3234256287518 * H2x2_2  +    -0.93766150263141 * H2x2_3
          +    -1.81398789003556 * H2x2_4  +    -0.15539533140563 * H2x2_5
          +     0.23144688198135 * H2x2_6 ;
   H3x1_1  =     0.24609695545564 + H3x1_1 ;
   H3x1_2  =    -0.92728333066333 + H3x1_2 ;
   H3x1_3  =     1.63161482532776 + H3x1_3 ;
   H3x1_4  =     0.39161062590357 + H3x1_4 ;
   H3x1_5  =     0.01171760508297 + H3x1_5 ;
   H3x1_6  =    -0.72522461279376 + H3x1_6 ;
   H3x1_1  = SIN(H3x1_1 );
   H3x1_2  = SIN(H3x1_2 );
   H3x1_3  = SIN(H3x1_3 );
   H3x1_4  = SIN(H3x1_4 );
   H3x1_5  = SIN(H3x1_5 );
   H3x1_6  = SIN(H3x1_6 );
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
   H3x1_3  = .;
   H3x1_4  = .;
   H3x1_5  = .;
   H3x1_6  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =      0.9799962964316 * H3x1_1  +     1.34210953311734 * H3x1_2
          +      2.0189927751579 * H3x1_3  +      1.8409060954552 * H3x1_4
          +    -3.17705772371323 * H3x1_5  +    -2.12623562549552 * H3x1_6 ;
   P_DepVar1  =     1.17636518592867 + P_DepVar1 ;
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
* Renaming variables for AutoNeural35;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural35;
*------------------------------------------------------------*;
drop AutoNeural35_P_DepVar1;
AutoNeural35_P_DepVar1 = P_DepVar1;
drop AutoNeural35_P_DepVar0;
AutoNeural35_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural35;
*------------------------------------------------------------*;
length AutoNeural35_WARN_ $4;
drop AutoNeural35_WARN_;
AutoNeural35_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl55;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl55: Maximum Posteriors of 6 models;
*------------------------------------------------------------*;
_psum = 0;
drop _psum _premainder;
P_DepVar1 = max(
AutoNeural37_P_DepVar1 ,
AutoNeural38_P_DepVar1 ,
AutoNeural39_P_DepVar1 ,
AutoNeural40_P_DepVar1 ,
AutoNeural34_P_DepVar1 ,
AutoNeural35_P_DepVar1
);
_premainder =1 - _psum;
if P_DepVar1 > _premainder then do;
P_DepVar1 = _premainder;
end;
_psum + P_DepVar1;
P_DepVar0 = max(
AutoNeural37_P_DepVar0 ,
AutoNeural38_P_DepVar0 ,
AutoNeural39_P_DepVar0 ,
AutoNeural40_P_DepVar0 ,
AutoNeural34_P_DepVar0 ,
AutoNeural35_P_DepVar0
);
_premainder =1 - _psum;
if P_DepVar0 > _premainder then do;
P_DepVar0 = _premainder;
end;
_psum + P_DepVar0;
*------------------------------------------------------------*;
* Ensmbl55: Computing Classification Vars;
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
* Ensmbl55: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl55: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL37_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL37_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL37_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL37_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL38_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL38_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL38_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL38_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL39_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL39_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL39_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL39_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL40_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL40_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL40_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL40_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL34_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL34_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL34_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL34_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL35_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL35_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL35_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL35_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
