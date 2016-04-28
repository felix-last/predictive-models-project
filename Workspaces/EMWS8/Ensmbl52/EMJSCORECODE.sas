*------------------------------------------------------------*;
* Ensmbl52: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 1 of 7;
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
* TOOL: Variable selection Class;
* TYPE: EXPLORE;
* NODE: Varsel;
*------------------------------------------------------------*;
******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";



****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural30;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -10.2196367325197 * S_AcceptedCmpTotal
          +     73.8468810244622 * S_Mnt  +    -37.1568918433377 *
        S_MntMeatProducts  +    -6.41798758194194 * S_NumCatalogPurchases
          +     8.70227685660232 * S_RFMstat  +      6.0315592275084 *
        S_Recency ;
   H1x1_1  =     13.2334413528619 + H1x1_1 ;
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
   P_DepVar1  =    -2.47422582638078 * H1x1_1 ;
   P_DepVar1  =    -1.87932369728474 + P_DepVar1 ;
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
* Renaming variables for AutoNeural30;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural30;
*------------------------------------------------------------*;
drop AutoNeural30_P_DepVar1;
AutoNeural30_P_DepVar1 = P_DepVar1;
drop AutoNeural30_P_DepVar0;
AutoNeural30_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural30;
*------------------------------------------------------------*;
length AutoNeural30_WARN_ $4;
drop AutoNeural30_WARN_;
AutoNeural30_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 2 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural31;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.88877074263455 * S_AcceptedCmpTotal
          +     -6.8647547731997 * S_Mnt  +     3.38470731995645 *
        S_MntMeatProducts  +     0.45686791470898 * S_NumCatalogPurchases
          +    -0.12981013682039 * S_RFMstat  +    -0.01175498343834 *
        S_Recency ;
   H1x1_2  =    -0.11003981472254 * S_AcceptedCmpTotal
          +    -0.85647328083992 * S_Mnt  +     10.0358306583456 *
        S_MntMeatProducts  +     1.92503432752831 * S_NumCatalogPurchases
          +     0.92971820927182 * S_RFMstat  +    -0.12489463268487 *
        S_Recency ;
   H1x1_1  =    -2.35812752137322 + H1x1_1 ;
   H1x1_2  =     8.68969383477576 + H1x1_2 ;
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
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     6.72682466184772 * H1x1_1  +     8.11139972991132 * H1x1_2
         ;
   P_DepVar1  =    -12.3654701108229 + P_DepVar1 ;
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
* Renaming variables for AutoNeural31;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural31;
*------------------------------------------------------------*;
drop AutoNeural31_P_DepVar1;
AutoNeural31_P_DepVar1 = P_DepVar1;
drop AutoNeural31_P_DepVar0;
AutoNeural31_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural31;
*------------------------------------------------------------*;
length AutoNeural31_WARN_ $4;
drop AutoNeural31_WARN_;
AutoNeural31_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 3 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural32;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.14955504394548 * S_AcceptedCmpTotal
          +    -1.51573020728474 * S_Mnt  +      0.4607268669617 *
        S_MntMeatProducts  +     -0.3334944156024 * S_NumCatalogPurchases
          +     0.09267374022355 * S_RFMstat  +     0.47606901130176 *
        S_Recency ;
   H1x1_2  =      0.2468028004293 * S_AcceptedCmpTotal
          +    -0.77717776485086 * S_Mnt  +     7.40002044896531 *
        S_MntMeatProducts  +     1.60897655452635 * S_NumCatalogPurchases
          +     0.67552122628568 * S_RFMstat  +    -0.32443547406066 *
        S_Recency ;
   H1x1_3  =     6.59800324692585 * S_AcceptedCmpTotal
          +    -28.0912205253849 * S_Mnt  +     13.5059679211684 *
        S_MntMeatProducts  +     5.32084702602181 * S_NumCatalogPurchases
          +    -1.75455080633468 * S_RFMstat  +    -3.56741217768456 *
        S_Recency ;
   H1x1_1  =     2.30670471730853 + H1x1_1 ;
   H1x1_2  =     6.72353576768002 + H1x1_2 ;
   H1x1_3  =    -10.2093918588588 + H1x1_3 ;
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
   P_DepVar1  =    -13.8690336647034 * H1x1_1  +     12.3879569416654 * H1x1_2
          +     2.67685271681444 * H1x1_3 ;
   P_DepVar1  =    -2.88709627935044 + P_DepVar1 ;
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
* Renaming variables for AutoNeural32;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural32;
*------------------------------------------------------------*;
drop AutoNeural32_P_DepVar1;
AutoNeural32_P_DepVar1 = P_DepVar1;
drop AutoNeural32_P_DepVar0;
AutoNeural32_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural32;
*------------------------------------------------------------*;
length AutoNeural32_WARN_ $4;
drop AutoNeural32_WARN_;
AutoNeural32_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 4 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural33;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.21234921669572 * S_AcceptedCmpTotal
          +     0.01945817648377 * S_Mnt  +     0.10373621819131 *
        S_MntMeatProducts  +     0.14724080002257 * S_NumCatalogPurchases
          +     0.01465421656969 * S_RFMstat  +    -0.37839603073195 *
        S_Recency ;
   H1x1_2  =      1.6456490248475 * S_AcceptedCmpTotal
          +    -4.36126689821345 * S_Mnt  +    -5.34341350667797 *
        S_MntMeatProducts  +    -0.50775340376834 * S_NumCatalogPurchases
          +    -3.77547933008523 * S_RFMstat  +    -0.35687395481612 *
        S_Recency ;
   H1x1_3  =     2.25495773414966 * S_AcceptedCmpTotal
          +     -11.006968240108 * S_Mnt  +     5.29014268166876 *
        S_MntMeatProducts  +     1.38527755695319 * S_NumCatalogPurchases
          +    -0.25229120510632 * S_RFMstat  +    -0.96545690161812 *
        S_Recency ;
   H1x1_1  =    -1.44629643725438 + H1x1_1 ;
   H1x1_2  =    -8.96045510766511 + H1x1_2 ;
   H1x1_3  =    -3.43663513496723 + H1x1_3 ;
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
   P_DepVar1  =     15.9155817268417 * H1x1_1  +    -26.1877719603903 * H1x1_2
          +     3.03900855168824 * H1x1_3  +    -8.12584282800012 * H1x1_4 ;
   P_DepVar1  =    -0.43873072735423 + P_DepVar1 ;
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
* Renaming variables for AutoNeural33;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural33;
*------------------------------------------------------------*;
drop AutoNeural33_P_DepVar1;
AutoNeural33_P_DepVar1 = P_DepVar1;
drop AutoNeural33_P_DepVar0;
AutoNeural33_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural33;
*------------------------------------------------------------*;
length AutoNeural33_WARN_ $4;
drop AutoNeural33_WARN_;
AutoNeural33_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 5 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural27;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

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

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.20171954292418 * S_AcceptedCmpTotal
          +     0.29079116229788 * S_Mnt  +     0.23711535602944 *
        S_MntMeatProducts  +     0.42529081995564 * S_NumCatalogPurchases
          +     0.18062808343642 * S_RFMstat  +    -0.63318995037874 *
        S_Recency ;
   H1x1_2  =    -1.98920342874828 * S_AcceptedCmpTotal
          +      10.493361229847 * S_Mnt  +    -5.26684519238396 *
        S_MntMeatProducts  +     -1.3815052580097 * S_NumCatalogPurchases
          +     0.33275103937215 * S_RFMstat  +     0.91614898624506 *
        S_Recency ;
   H1x1_3  =     0.73206551950569 * S_AcceptedCmpTotal
          +    -1.01976407347302 * S_Mnt  +    -1.13350661445888 *
        S_MntMeatProducts  +    -0.07125936639892 * S_NumCatalogPurchases
          +    -0.39616853923675 * S_RFMstat  +    -0.82914022268456 *
        S_Recency ;
   H1x1_4  =    -0.34492981088566 * S_AcceptedCmpTotal
          +     1.21190291017614 * S_Mnt  +    -8.17509176920502 *
        S_MntMeatProducts  +    -1.48783679196456 * S_NumCatalogPurchases
          +     -0.9509465201423 * S_RFMstat  +     0.48054774355638 *
        S_Recency ;
   H1x1_5  =    -1.52519083391934 * S_AcceptedCmpTotal
          +    -3.64608769152407 * S_Mnt  +    -6.52923883290239 *
        S_MntMeatProducts  +      2.7900190963798 * S_NumCatalogPurchases
          +     4.27091451171932 * S_RFMstat  +     2.19744854544492 *
        S_Recency ;
   H1x1_1  =    -3.14760700594037 + H1x1_1 ;
   H1x1_2  =     3.74367981551949 + H1x1_2 ;
   H1x1_3  =     0.87862388051597 + H1x1_3 ;
   H1x1_4  =    -7.01266539803621 + H1x1_4 ;
   H1x1_5  =     4.82694309436143 + H1x1_5 ;
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
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     15.5046788281633 * H1x1_1  +    -4.66397711541227 * H1x1_2
          +     4.82395074522384 * H1x1_3  +    -12.9633946998053 * H1x1_4
          +    -2.45163227816589 * H1x1_5 ;
   P_DepVar1  =    -0.48464899477516 + P_DepVar1 ;
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
* Renaming variables for AutoNeural27;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural27;
*------------------------------------------------------------*;
drop AutoNeural27_P_DepVar1;
AutoNeural27_P_DepVar1 = P_DepVar1;
drop AutoNeural27_P_DepVar0;
AutoNeural27_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural27;
*------------------------------------------------------------*;
length AutoNeural27_WARN_ $4;
drop AutoNeural27_WARN_;
AutoNeural27_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 6 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural28;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

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

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     2.10717134491045 * S_AcceptedCmpTotal
          +    -10.9799187882689 * S_Mnt  +     3.17619086363109 *
        S_MntMeatProducts  +     0.58522050540174 * S_NumCatalogPurchases
          +     0.10457500953086 * S_RFMstat  +    -0.59708195840656 *
        S_Recency ;
   H1x1_2  =    -1.09600222674288 * S_AcceptedCmpTotal
          +    -2.75188573882189 * S_Mnt  +     2.38829776780629 *
        S_MntMeatProducts  +     2.37290115499231 * S_NumCatalogPurchases
          +    -1.67864747205449 * S_RFMstat  +    -1.87700204299542 *
        S_Recency ;
   H1x1_3  =     0.24593136036671 * S_AcceptedCmpTotal
          +     0.98275447305236 * S_Mnt  +     1.52686649163215 *
        S_MntMeatProducts  +     1.08491172792697 * S_NumCatalogPurchases
          +    -6.31220731697864 * S_RFMstat  +    -2.08472878456829 *
        S_Recency ;
   H1x1_4  =     1.35296744918554 * S_AcceptedCmpTotal
          +    -3.58727753695297 * S_Mnt  +    -6.35187991517409 *
        S_MntMeatProducts  +    -1.41725838894141 * S_NumCatalogPurchases
          +     -2.5174617752956 * S_RFMstat  +     0.27284317719271 *
        S_Recency ;
   H1x1_5  =     1.41560412529603 * S_AcceptedCmpTotal
          +     2.25142479190183 * S_Mnt  +      0.2775616702254 *
        S_MntMeatProducts  +     -0.4118907005017 * S_NumCatalogPurchases
          +     0.38803464834347 * S_RFMstat  +    -0.81750268679565 *
        S_Recency ;
   H1x1_1  =    -1.94381314805925 + H1x1_1 ;
   H1x1_2  =     -1.4831757685406 + H1x1_2 ;
   H1x1_3  =    -0.53539803191548 + H1x1_3 ;
   H1x1_4  =    -5.07257058520645 + H1x1_4 ;
   H1x1_5  =    -3.95581011117601 + H1x1_5 ;
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
   H1x2_1  =    -1.55686119998165 * S_AcceptedCmpTotal
          +    -0.26111571781978 * S_Mnt  +    -1.44938218805988 *
        S_MntMeatProducts  +     0.04086123541942 * S_NumCatalogPurchases
          +    -0.80214702507913 * S_RFMstat  +     0.70413979175849 *
        S_Recency ;
   H1x2_2  =    -1.89013114756444 * S_AcceptedCmpTotal
          +     2.02645277032883 * S_Mnt  +     0.33300450318575 *
        S_MntMeatProducts  +    -3.49523435320164 * S_NumCatalogPurchases
          +    -0.54366042810185 * S_RFMstat  +    -0.96821243793862 *
        S_Recency ;
   H1x2_3  =    -0.37493223935971 * S_AcceptedCmpTotal
          +     0.44222577344261 * S_Mnt  +    -2.29203252552751 *
        S_MntMeatProducts  +    -2.51799836083289 * S_NumCatalogPurchases
          +     0.79676408136588 * S_RFMstat  +    -1.33777715205059 *
        S_Recency ;
   H1x2_4  =     0.61023216239118 * S_AcceptedCmpTotal
          +     -1.2504451910923 * S_Mnt  +     1.08805550572067 *
        S_MntMeatProducts  +     0.42462128634087 * S_NumCatalogPurchases
          +     0.47301106041065 * S_RFMstat  +    -2.61753144043135 *
        S_Recency ;
   H1x2_5  =    -1.41618915627784 * S_AcceptedCmpTotal
          +    -1.13785141950187 * S_Mnt  +    -1.73667107974481 *
        S_MntMeatProducts  +      3.1366199093076 * S_NumCatalogPurchases
          +    -1.94563130199796 * S_RFMstat  +       2.512838942818 *
        S_Recency ;
   H1x2_1  =     0.73112846873387 + H1x2_1 ;
   H1x2_2  =    -0.66717106615524 + H1x2_2 ;
   H1x2_3  =      2.7125530739338 + H1x2_3 ;
   H1x2_4  =    -1.39079027168122 + H1x2_4 ;
   H1x2_5  =     -1.5266283403396 + H1x2_5 ;
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
   H1x3_1  =     1.55893522013734 * S_AcceptedCmpTotal
          +    -1.16802167955541 * S_Mnt  +    -1.60360119780136 *
        S_MntMeatProducts  +     0.47774394371528 * S_NumCatalogPurchases
          +      -0.530718682766 * S_RFMstat  +    -2.44187650282709 *
        S_Recency ;
   H1x3_2  =     1.06465525219753 * S_AcceptedCmpTotal
          +    -4.15619528335918 * S_Mnt  +     1.95067813512976 *
        S_MntMeatProducts  +    -2.07670102753791 * S_NumCatalogPurchases
          +     0.49910286851075 * S_RFMstat  +     0.93996026298479 *
        S_Recency ;
   H1x3_3  =    -0.29105397796174 * S_AcceptedCmpTotal
          +     2.11159454800566 * S_Mnt  +     1.67840031691295 *
        S_MntMeatProducts  +    -2.40711178902336 * S_NumCatalogPurchases
          +    -1.13747844076384 * S_RFMstat  +    -0.88756656082469 *
        S_Recency ;
   H1x3_4  =    -1.15703505358845 * S_AcceptedCmpTotal
          +     0.30100889287849 * S_Mnt  +     0.55319963517684 *
        S_MntMeatProducts  +    -0.02272785613118 * S_NumCatalogPurchases
          +     0.43699534320691 * S_RFMstat  +     2.22910491450126 *
        S_Recency ;
   H1x3_5  =    -0.42268650148557 * S_AcceptedCmpTotal
          +    -2.38416083526034 * S_Mnt  +     2.41579845516974 *
        S_MntMeatProducts  +     0.60973384003689 * S_NumCatalogPurchases
          +    -1.12415629345715 * S_RFMstat  +    -0.59274912531616 *
        S_Recency ;
   H1x3_1  =     0.20894643335542 + H1x3_1 ;
   H1x3_2  =     2.19187718990043 + H1x3_2 ;
   H1x3_3  =    -0.63127842492526 + H1x3_3 ;
   H1x3_4  =     0.25735048029686 + H1x3_4 ;
   H1x3_5  =     0.02632857468412 + H1x3_5 ;
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
   H2x1_1  =    -1.91284328958208 * H1x1_1  +     1.01368252878712 * H1x1_2
          +     0.88385633780482 * H1x1_3  +     0.77249497316744 * H1x1_4
          +    -1.68467525644522 * H1x1_5  +     0.22872788371043 * H1x1_6 ;
   H2x1_2  =    -0.08913678495622 * H1x1_1  +    -0.95704614273187 * H1x1_2
          +    -1.13959611313765 * H1x1_3  +    -0.83269840840553 * H1x1_4
          +    -1.34839441082903 * H1x1_5  +      1.4617930846853 * H1x1_6 ;
   H2x1_3  =     1.19406467163652 * H1x1_1  +     1.10561638775412 * H1x1_2
          +     3.50091937687106 * H1x1_3  +     -0.7408464567923 * H1x1_4
          +     1.07741096211456 * H1x1_5  +     -1.0098240718302 * H1x1_6 ;
   H2x1_4  =    -3.50840251474163 * H1x1_1  +    -0.53688540920235 * H1x1_2
          +    -2.44435438360824 * H1x1_3  +     4.64213676100195 * H1x1_4
          +     0.36171420259161 * H1x1_5  +     0.11106499550345 * H1x1_6 ;
   H2x1_5  =    -0.92126735850423 * H1x1_1  +    -0.50015259068425 * H1x1_2
          +    -2.75013936022633 * H1x1_3  +     1.29804156504555 * H1x1_4
          +    -2.88854985509185 * H1x1_5  +     3.51037817476003 * H1x1_6 ;
   H2x1_6  =      2.7601365695399 * H1x1_1  +     0.60343333315883 * H1x1_2
          +    -4.84088835213795 * H1x1_3  +     0.04677091451384 * H1x1_4
          +     1.99119511166544 * H1x1_5  +    -1.84413878989067 * H1x1_6 ;
   H2x1_1  = H2x1_1  +    -0.55299168308518 * H1x2_1
          +    -0.70728759829892 * H1x2_2  +     0.02028723479846 * H1x2_3
          +      2.1534144925678 * H1x2_4  +    -0.60181736829464 * H1x2_5
          +    -0.96627475596267 * H1x2_6 ;
   H2x1_2  = H2x1_2  +     1.02776882707138 * H1x2_1
          +    -0.26186544699712 * H1x2_2  +    -0.59804813597981 * H1x2_3
          +     0.13683572328121 * H1x2_4  +     -0.4527430044725 * H1x2_5
          +     0.09804477894859 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -1.37372644240513 * H1x2_1
          +    -1.41411080054855 * H1x2_2  +    -0.85635388175337 * H1x2_3
          +     1.78033736245689 * H1x2_4  +    -0.32277639652206 * H1x2_5
          +    -0.10095907241792 * H1x2_6 ;
   H2x1_4  = H2x1_4  +     0.38975073179429 * H1x2_1
          +      1.7999626274739 * H1x2_2  +    -0.54595798920563 * H1x2_3
          +    -2.87794569741229 * H1x2_4  +     2.24407851876424 * H1x2_5
          +    -0.78007016861264 * H1x2_6 ;
   H2x1_5  = H2x1_5  +     1.68407538128685 * H1x2_1
          +     2.69111816059998 * H1x2_2  +     0.12927675826764 * H1x2_3
          +     -1.7263485913587 * H1x2_4  +    -2.15741343790643 * H1x2_5
          +     1.95855676074934 * H1x2_6 ;
   H2x1_6  = H2x1_6  +     0.31146846941645 * H1x2_1
          +     0.33682375646593 * H1x2_2  +      1.6527641940739 * H1x2_3
          +    -0.96403239328063 * H1x2_4  +    -1.11790253982232 * H1x2_5
          +     -1.4251132059225 * H1x2_6 ;
   H2x1_1  = H2x1_1  +     0.47301275142195 * H1x3_1
          +    -1.23391488243925 * H1x3_2  +    -1.81348351496647 * H1x3_3
          +    -0.66473016828009 * H1x3_4  +     1.27670685567846 * H1x3_5
          +     0.38481934719452 * H1x3_6 ;
   H2x1_2  = H2x1_2  +     0.35549808536734 * H1x3_1
          +     0.36201179536458 * H1x3_2  +     1.04726425834791 * H1x3_3
          +    -1.08276187248251 * H1x3_4  +     0.74248193765521 * H1x3_5
          +     1.87596859340821 * H1x3_6 ;
   H2x1_3  = H2x1_3  +    -0.36667720681998 * H1x3_1
          +      0.5256210995417 * H1x3_2  +    -0.44860423311788 * H1x3_3
          +    -0.20913840911463 * H1x3_4  +    -0.76258888517092 * H1x3_5
          +     0.20457555210609 * H1x3_6 ;
   H2x1_4  = H2x1_4  +     -0.5052323966606 * H1x3_1
          +     0.57348008947054 * H1x3_2  +     0.36313882476736 * H1x3_3
          +     2.54509537428676 * H1x3_4  +    -1.40462445002153 * H1x3_5
          +     1.76488988390401 * H1x3_6 ;
   H2x1_5  = H2x1_5  +     -0.4555917406867 * H1x3_1
          +     0.52745581365834 * H1x3_2  +    -0.82303556180885 * H1x3_3
          +    -0.78981386250305 * H1x3_4  +     0.09307958113664 * H1x3_5
          +     1.63202351822216 * H1x3_6 ;
   H2x1_6  = H2x1_6  +    -0.57563015009902 * H1x3_1
          +     2.47575184377805 * H1x3_2  +    -0.91958118957044 * H1x3_3
          +    -1.67916721690516 * H1x3_4  +     0.69514147486102 * H1x3_5
          +    -0.75070900812889 * H1x3_6 ;
   H2x1_1  =     0.44089803005479 + H2x1_1 ;
   H2x1_2  =     0.84182794358826 + H2x1_2 ;
   H2x1_3  =     0.09803371201388 + H2x1_3 ;
   H2x1_4  =      -0.624591248343 + H2x1_4 ;
   H2x1_5  =      0.7596943675806 + H2x1_5 ;
   H2x1_6  =     1.86613856151687 + H2x1_6 ;
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
   H2x2_1  =    -0.67599100831955 * H1x1_1  +     0.24077189312828 * H1x1_2
          +      0.2000763543409 * H1x1_3  +    -1.82199808794926 * H1x1_4
          +    -0.63614429983717 * H1x1_5  +     0.35027369588915 * H1x1_6 ;
   H2x2_2  =    -2.86273409671688 * H1x1_1  +    -1.17210014090039 * H1x1_2
          +     2.79815832312648 * H1x1_3  +     0.46361776813305 * H1x1_4
          +      0.0798677597958 * H1x1_5  +    -0.75991454790943 * H1x1_6 ;
   H2x2_3  =     -0.6739829418862 * H1x1_1  +    -2.31169428380278 * H1x1_2
          +     2.10300119718615 * H1x1_3  +    -0.00742357063683 * H1x1_4
          +    -1.51041651747244 * H1x1_5  +    -0.17010696636548 * H1x1_6 ;
   H2x2_4  =    -1.50678102953218 * H1x1_1  +    -0.89959733379076 * H1x1_2
          +     1.08933879000366 * H1x1_3  +      0.4160027440208 * H1x1_4
          +     0.96602358671281 * H1x1_5  +     2.49695921665153 * H1x1_6 ;
   H2x2_5  =      0.7197781324018 * H1x1_1  +     0.65156339723506 * H1x1_2
          +     1.10688522196469 * H1x1_3  +    -0.18317373714845 * H1x1_4
          +    -0.41607265841802 * H1x1_5  +    -1.97247962280317 * H1x1_6 ;
   H2x2_6  =     0.54986188496659 * H1x1_1  +    -1.79839449870258 * H1x1_2
          +    -1.15036560870119 * H1x1_3  +     1.47969678061941 * H1x1_4
          +     0.10597867235187 * H1x1_5  +     0.90300533681641 * H1x1_6 ;
   H2x2_1  = H2x2_1  +    -0.21000305943834 * H1x2_1
          +    -0.32875528993365 * H1x2_2  +    -2.01191741391886 * H1x2_3
          +     0.25433844143017 * H1x2_4  +    -0.22353514971516 * H1x2_5
          +    -1.39994531215362 * H1x2_6 ;
   H2x2_2  = H2x2_2  +     0.97984435202354 * H1x2_1
          +    -0.32249690006833 * H1x2_2  +    -1.39997315416199 * H1x2_3
          +     -2.7808281862933 * H1x2_4  +    -0.16292745421241 * H1x2_5
          +    -0.40444669273525 * H1x2_6 ;
   H2x2_3  = H2x2_3  +      1.7332207906399 * H1x2_1
          +     0.48772690844604 * H1x2_2  +    -0.03702571322482 * H1x2_3
          +    -0.04073364631727 * H1x2_4  +    -0.91191013457442 * H1x2_5
          +    -2.38736049861996 * H1x2_6 ;
   H2x2_4  = H2x2_4  +    -0.06792429668775 * H1x2_1
          +    -3.07222522712126 * H1x2_2  +     0.01320929156379 * H1x2_3
          +     0.84459091213222 * H1x2_4  +    -0.95949143247045 * H1x2_5
          +     0.02632878191094 * H1x2_6 ;
   H2x2_5  = H2x2_5  +     0.13831659235384 * H1x2_1
          +    -1.75598160312232 * H1x2_2  +     0.17047671926062 * H1x2_3
          +    -0.45409084878331 * H1x2_4  +    -1.17540122389603 * H1x2_5
          +     0.79706245066425 * H1x2_6 ;
   H2x2_6  = H2x2_6  +     1.74450762507234 * H1x2_1
          +    -0.18999736448811 * H1x2_2  +    -0.82200918268165 * H1x2_3
          +      1.8752098314092 * H1x2_4  +    -0.55366925571085 * H1x2_5
          +     1.96032751350518 * H1x2_6 ;
   H2x2_1  = H2x2_1  +     1.05088385328525 * H1x3_1
          +    -1.18748050069472 * H1x3_2  +     0.33686598960541 * H1x3_3
          +     0.60467968457853 * H1x3_4  +     0.44997942659683 * H1x3_5
          +     0.86372067144364 * H1x3_6 ;
   H2x2_2  = H2x2_2  +     0.54489966189284 * H1x3_1
          +     0.63828892530684 * H1x3_2  +     1.36576672067523 * H1x3_3
          +    -0.93080386349548 * H1x3_4  +    -0.53645684858865 * H1x3_5
          +     0.80254310887989 * H1x3_6 ;
   H2x2_3  = H2x2_3  +    -0.43326705547287 * H1x3_1
          +     1.62130917530395 * H1x3_2  +     -1.9569471371487 * H1x3_3
          +    -0.16690355216427 * H1x3_4  +     0.76588074497881 * H1x3_5
          +    -0.80961698509146 * H1x3_6 ;
   H2x2_4  = H2x2_4  +     0.14186336769381 * H1x3_1
          +    -0.40313769302155 * H1x3_2  +     0.32907477170578 * H1x3_3
          +    -0.09559287343495 * H1x3_4  +     1.23870853269954 * H1x3_5
          +    -1.29909553454934 * H1x3_6 ;
   H2x2_5  = H2x2_5  +    -0.23962567636847 * H1x3_1
          +    -0.40709618711343 * H1x3_2  +    -1.68479406479753 * H1x3_3
          +     0.70815879664382 * H1x3_4  +    -0.08013794063462 * H1x3_5
          +      0.3854653698129 * H1x3_6 ;
   H2x2_6  = H2x2_6  +     0.30227974563111 * H1x3_1
          +    -0.74687752968448 * H1x3_2  +     1.36415251312446 * H1x3_3
          +     1.81088044806083 * H1x3_4  +     1.05534281539066 * H1x3_5
          +    -0.43429796112944 * H1x3_6 ;
   H2x2_1  =     0.63184708368306 + H2x2_1 ;
   H2x2_2  =     0.84907350596357 + H2x2_2 ;
   H2x2_3  =    -0.73809203587584 + H2x2_3 ;
   H2x2_4  =    -0.43815853180498 + H2x2_4 ;
   H2x2_5  =     0.21738444698009 + H2x2_5 ;
   H2x2_6  =     0.35336989078545 + H2x2_6 ;
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
   H3x1_1  =     0.88232318111379 * H2x1_1  +     0.33230222316203 * H2x1_2
          +     1.74392107555271 * H2x1_3  +    -1.04185063882146 * H2x1_4
          +    -0.63105511848819 * H2x1_5  +    -1.05088304858423 * H2x1_6 ;
   H3x1_2  =     1.11736284857762 * H2x1_1  +     1.90660007278783 * H2x1_2
          +    -0.38007206174956 * H2x1_3  +     0.37265047043174 * H2x1_4
          +     2.27208664894129 * H2x1_5  +     0.87150445612099 * H2x1_6 ;
   H3x1_3  =    -1.47841270668706 * H2x1_1  +    -1.28441896803313 * H2x1_2
          +     1.95549364222924 * H2x1_3  +    -2.50484940312791 * H2x1_4
          +    -2.84934238039874 * H2x1_5  +     2.18013446750751 * H2x1_6 ;
   H3x1_4  =     1.91981096223784 * H2x1_1  +     2.50981387206546 * H2x1_2
          +     1.52848474440169 * H2x1_3  +    -1.77653121606781 * H2x1_4
          +    -1.17059017641066 * H2x1_5  +     0.08630071934474 * H2x1_6 ;
   H3x1_5  =    -0.90689901549977 * H2x1_1  +    -0.28920884601352 * H2x1_2
          +     0.19367561691053 * H2x1_3  +    -1.64382922054024 * H2x1_4
          +    -1.27645531071461 * H2x1_5  +     2.78368081292476 * H2x1_6 ;
   H3x1_6  =     1.79097710546589 * H2x1_1  +     0.62195006841522 * H2x1_2
          +     0.38238495192417 * H2x1_3  +     0.38117337455775 * H2x1_4
          +     0.31232345193628 * H2x1_5  +     1.64288571863932 * H2x1_6 ;
   H3x1_1  = H3x1_1  +    -0.29610176935088 * H2x2_1
          +    -0.05687019870114 * H2x2_2  +     0.19276816813006 * H2x2_3
          +    -0.02919428123272 * H2x2_4  +     -0.1225189756077 * H2x2_5
          +     0.35216486042215 * H2x2_6 ;
   H3x1_2  = H3x1_2  +    -0.65560935360323 * H2x2_1
          +     1.14492037534385 * H2x2_2  +    -0.73840836071645 * H2x2_3
          +      1.3947576688638 * H2x2_4  +    -0.01317619212955 * H2x2_5
          +    -0.91648595761636 * H2x2_6 ;
   H3x1_3  = H3x1_3  +    -0.53127332055291 * H2x2_1
          +     0.36262088215518 * H2x2_2  +     2.77585954813321 * H2x2_3
          +     1.38261906942485 * H2x2_4  +    -0.22635906489825 * H2x2_5
          +    -2.11281855575499 * H2x2_6 ;
   H3x1_4  = H3x1_4  +     0.10255243516649 * H2x2_1
          +    -0.19237607982949 * H2x2_2  +    -0.39440266749795 * H2x2_3
          +     0.62091379272854 * H2x2_4  +    -0.71121773171613 * H2x2_5
          +     0.57305821692201 * H2x2_6 ;
   H3x1_5  = H3x1_5  +     1.38760232745985 * H2x2_1
          +    -0.67366859881604 * H2x2_2  +     0.73667853659073 * H2x2_3
          +     0.48338791573814 * H2x2_4  +    -1.86204960161547 * H2x2_5
          +     2.06401699674057 * H2x2_6 ;
   H3x1_6  = H3x1_6  +     1.58403061991045 * H2x2_1
          +    -1.98415138001436 * H2x2_2  +    -2.65270828558486 * H2x2_3
          +     0.24663962279095 * H2x2_4  +    -0.13610124747178 * H2x2_5
          +     0.08850124295188 * H2x2_6 ;
   H3x1_1  =    -0.38359896864958 + H3x1_1 ;
   H3x1_2  =     0.71155840570573 + H3x1_2 ;
   H3x1_3  =     0.51799749231142 + H3x1_3 ;
   H3x1_4  =     0.67952932286733 + H3x1_4 ;
   H3x1_5  =    -0.81394067979603 + H3x1_5 ;
   H3x1_6  =    -0.01596290366203 + H3x1_6 ;
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
   P_DepVar1  =     0.28094469007064 * H3x1_1  +     4.40543517205109 * H3x1_2
          +     4.58780022403482 * H3x1_3  +    -1.49344393871597 * H3x1_4
          +     3.15120047821915 * H3x1_5  +    -1.83744247169269 * H3x1_6 ;
   P_DepVar1  =     -2.1680951408523 + P_DepVar1 ;
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
* Renaming variables for AutoNeural28;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural28;
*------------------------------------------------------------*;
drop AutoNeural28_P_DepVar1;
AutoNeural28_P_DepVar1 = P_DepVar1;
drop AutoNeural28_P_DepVar0;
AutoNeural28_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural28;
*------------------------------------------------------------*;
length AutoNeural28_WARN_ $4;
drop AutoNeural28_WARN_;
AutoNeural28_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Scoring Code of model 7 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural29;
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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   RFMstat ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     1.05169539250812 * S_AcceptedCmpTotal
          +    -1.01535799807127 * S_Mnt  +     0.90249216466184 *
        S_MntMeatProducts  +     0.55600820704456 * S_NumCatalogPurchases
          +     0.11616609536854 * S_RFMstat  +    -1.16391829324819 *
        S_Recency ;
   P_DepVar1  =    -2.23938090727264 + P_DepVar1 ;
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
* Renaming variables for AutoNeural29;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural29;
*------------------------------------------------------------*;
drop AutoNeural29_P_DepVar1;
AutoNeural29_P_DepVar1 = P_DepVar1;
drop AutoNeural29_P_DepVar0;
AutoNeural29_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural29;
*------------------------------------------------------------*;
length AutoNeural29_WARN_ $4;
drop AutoNeural29_WARN_;
AutoNeural29_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl52: Maximum Posteriors of 7 models;
*------------------------------------------------------------*;
_psum = 0;
drop _psum _premainder;
P_DepVar1 = max(
AutoNeural30_P_DepVar1 ,
AutoNeural31_P_DepVar1 ,
AutoNeural32_P_DepVar1 ,
AutoNeural33_P_DepVar1 ,
AutoNeural27_P_DepVar1 ,
AutoNeural28_P_DepVar1 ,
AutoNeural29_P_DepVar1
);
_premainder =1 - _psum;
if P_DepVar1 > _premainder then do;
P_DepVar1 = _premainder;
end;
_psum + P_DepVar1;
P_DepVar0 = max(
AutoNeural30_P_DepVar0 ,
AutoNeural31_P_DepVar0 ,
AutoNeural32_P_DepVar0 ,
AutoNeural33_P_DepVar0 ,
AutoNeural27_P_DepVar0 ,
AutoNeural28_P_DepVar0 ,
AutoNeural29_P_DepVar0
);
_premainder =1 - _psum;
if P_DepVar0 > _premainder then do;
P_DepVar0 = _premainder;
end;
_psum + P_DepVar0;
*------------------------------------------------------------*;
* Ensmbl52: Computing Classification Vars;
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
* Ensmbl52: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl52: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL30_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL30_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL30_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL30_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL31_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL31_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL31_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL31_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL32_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL32_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL32_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL32_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL33_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL33_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL33_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL33_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL27_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL27_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL27_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL27_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL28_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL28_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL28_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL28_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL29_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL29_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL29_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL29_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
