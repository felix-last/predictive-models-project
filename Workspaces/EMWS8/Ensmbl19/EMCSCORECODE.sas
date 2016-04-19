*------------------------------------------------------------*;
* Ensmbl19: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl19: Scoring Code of model 1 of 5;
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


/*----G_Marital_Status begin----*/
length _NORM8 $ 8;
_NORM8 = put( Marital_Status , $8. );
%DMNORMIP( _NORM8 )
drop _NORM8;
select(_NORM8);
  when("DIVORCED" ) G_Marital_Status = 1;
  when("MARRIED " ) G_Marital_Status = 2;
  when("SINGLE  " ) G_Marital_Status = 0;
  when("TOGETHER" ) G_Marital_Status = 2;
  when("WIDOW   " ) G_Marital_Status = 0;
  otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Marital_Status="Grouped Levels for Marital_Status";
/*----G_Marital_Status end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural24;
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

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
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
   Income ,
   Mnt ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   NumCatalogPurchases ,
   NumWebPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 *
        MntSweetProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
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
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =    -0.23012961341552 * S_AcceptedCmpTotal  +     0.46196798170863 *
        S_Frq  +     0.10792957007496 * S_Income  +     0.01598495816724 *
        S_Mnt  +     0.04110199082094 * S_MntFruits  +    -0.03861520815517 *
        S_MntGoldProds  +    -0.21282606264093 * S_MntMeatProducts
          +     0.01715600461602 * S_MntSweetProducts
          +    -0.23329547812839 * S_NumCatalogPurchases
          +    -0.11507537772092 * S_NumWebPurchases
          +    -0.03410149182919 * S_RFMstat  +     0.14966504694497 *
        S_RMntFrq  +     0.28566269847001 * S_Recency ;
   H12  =     0.05540254918167 * S_AcceptedCmpTotal  +     1.29235531722682 *
        S_Frq  +     0.06366828093255 * S_Income  +    -0.26947825948002 *
        S_Mnt  +     0.21714508305015 * S_MntFruits  +     0.26812345284438 *
        S_MntGoldProds  +    -4.04479521582802 * S_MntMeatProducts
          +     0.04792709763034 * S_MntSweetProducts
          +    -1.08549455020763 * S_NumCatalogPurchases
          +    -0.48337305556946 * S_NumWebPurchases
          +    -0.22222278831599 * S_RFMstat  +    -0.23407358569927 *
        S_RMntFrq  +    -0.01186280761112 * S_Recency ;
   H11  = H11  +    -0.14627707216264 * G_Marital_Status0
          +    -0.05689581037738 * G_Marital_Status1 ;
   H12  = H12  +     0.20389328110579 * G_Marital_Status0
          +     0.12863423712687 * G_Marital_Status1 ;
   H11  =     0.26937694072834 + H11 ;
   H12  =    -3.07173299704836 + H12 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -8.61120981649634 * H11  +    -5.72570140806215 * H12 ;
   P_DepVar1  =    -4.82159913495753 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural24;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural24;
*------------------------------------------------------------*;
drop Neural24_P_DepVar1;
Neural24_P_DepVar1 = P_DepVar1;
drop Neural24_P_DepVar0;
Neural24_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural24;
*------------------------------------------------------------*;
length Neural24_WARN_ $4;
drop Neural24_WARN_;
Neural24_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl19: Scoring Code of model 2 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural26;
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

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
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
   Income ,
   Mnt ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   NumCatalogPurchases ,
   NumWebPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 *
        MntSweetProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
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
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =    -1.12938466101576 * S_AcceptedCmpTotal  +     0.61534183742192 *
        S_Frq  +     0.21605471415782 * S_Income  +     1.00718645972599 *
        S_Mnt  +    -0.04712823237951 * S_MntFruits  +    -0.07929121432621 *
        S_MntGoldProds  +    -0.41982161110641 * S_MntMeatProducts
          +     0.30688676656325 * S_MntSweetProducts
          +    -0.31936466951531 * S_NumCatalogPurchases
          +    -0.40503981142414 * S_NumWebPurchases
          +    -0.00368867286865 * S_RFMstat  +     0.37807775340916 *
        S_RMntFrq  +     0.94794577395963 * S_Recency ;
   H12  =    -0.12113443728514 * S_AcceptedCmpTotal  +     0.93537745252849 *
        S_Frq  +    -0.09891671631341 * S_Income  +     1.99038480756089 *
        S_Mnt  +     0.17709370706747 * S_MntFruits  +    -0.26193027989873 *
        S_MntGoldProds  +    -1.32538448369411 * S_MntMeatProducts
          +    -0.57511617685848 * S_MntSweetProducts
          +    -0.80584166120088 * S_NumCatalogPurchases
          +    -0.46226595005401 * S_NumWebPurchases
          +     0.10198567130706 * S_RFMstat  +     0.21276308472657 *
        S_RMntFrq  +     0.20830913301712 * S_Recency ;
   H13  =    -0.26642267115951 * S_AcceptedCmpTotal  +    -0.93821950754639 *
        S_Frq  +     0.01733680104129 * S_Income  +    -0.34674569831914 *
        S_Mnt  +    -0.13141804104196 * S_MntFruits  +    -0.08208570095055 *
        S_MntGoldProds  +     0.33076491610846 * S_MntMeatProducts
          +     0.13151485846279 * S_MntSweetProducts
          +    -0.12544664418198 * S_NumCatalogPurchases
          +     0.31794108898576 * S_NumWebPurchases
          +    -0.09733881043326 * S_RFMstat  +    -0.55416616488207 *
        S_RMntFrq  +      0.6850072112056 * S_Recency ;
   H14  =    -0.26331970415451 * S_AcceptedCmpTotal  +     0.91045762420144 *
        S_Frq  +     0.47866760167028 * S_Income  +     1.96822454637646 *
        S_Mnt  +     0.37467695392633 * S_MntFruits  +     0.35024846355131 *
        S_MntGoldProds  +    -1.12912963812687 * S_MntMeatProducts
          +     0.55003060492603 * S_MntSweetProducts
          +    -0.81895769875154 * S_NumCatalogPurchases
          +    -0.73905791041531 * S_NumWebPurchases
          +    -0.05892830686928 * S_RFMstat  +    -2.20288127458579 *
        S_RMntFrq  +     0.31097790354738 * S_Recency ;
   H11  = H11  +    -0.15769833524163 * G_Marital_Status0
          +    -0.63616832118402 * G_Marital_Status1 ;
   H12  = H12  +    -0.02031957824974 * G_Marital_Status0
          +    -0.05261414754191 * G_Marital_Status1 ;
   H13  = H13  +    -0.66558713728702 * G_Marital_Status0
          +    -0.01155707859856 * G_Marital_Status1 ;
   H14  = H14  +     0.12565386008933 * G_Marital_Status0
          +     0.07125401506996 * G_Marital_Status1 ;
   H11  =    -0.47940901026517 + H11 ;
   H12  =     0.72706446657517 + H12 ;
   H13  =     2.64976292189629 + H13 ;
   H14  =     0.18030319416595 + H14 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -2.16840231556862 * H11  +    -2.67201260012597 * H12
          +    -4.82460682607153 * H13  +    -2.93480893396507 * H14 ;
   P_DepVar1  =     1.13227729187339 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural26;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural26;
*------------------------------------------------------------*;
drop Neural26_P_DepVar1;
Neural26_P_DepVar1 = P_DepVar1;
drop Neural26_P_DepVar0;
Neural26_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural26;
*------------------------------------------------------------*;
length Neural26_WARN_ $4;
drop Neural26_WARN_;
Neural26_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl19: Scoring Code of model 3 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural27;
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

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

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

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
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
   Income ,
   Mnt ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   NumCatalogPurchases ,
   NumWebPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 *
        MntSweetProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
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
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =     -0.0913777931029 * S_AcceptedCmpTotal  +     0.60888959215918 *
        S_Frq  +    -0.24839207108705 * S_Income  +     0.12904699470351 *
        S_Mnt  +     0.54811037634684 * S_MntFruits  +    -0.08131311507182 *
        S_MntGoldProds  +    -1.97616589442941 * S_MntMeatProducts
          +     0.82261116064356 * S_MntSweetProducts
          +    -1.55909661993581 * S_NumCatalogPurchases
          +    -0.16340954706378 * S_NumWebPurchases
          +    -1.23424537997161 * S_RFMstat  +    -0.80043433144556 *
        S_RMntFrq  +     0.30674447000925 * S_Recency ;
   H12  =     0.66910867066957 * S_AcceptedCmpTotal  +    -0.81073730531351 *
        S_Frq  +    -0.92904249004165 * S_Income  +    -0.71459542981691 *
        S_Mnt  +    -0.40393540462056 * S_MntFruits  +    -0.20281878016562 *
        S_MntGoldProds  +     0.17444715052802 * S_MntMeatProducts
          +     0.16618230229073 * S_MntSweetProducts
          +     0.80060397308165 * S_NumCatalogPurchases
          +     0.55840526773277 * S_NumWebPurchases
          +    -0.09080307227601 * S_RFMstat  +     0.05982566462633 *
        S_RMntFrq  +    -0.42099196648583 * S_Recency ;
   H13  =    -0.15105936730245 * S_AcceptedCmpTotal  +     1.16357039711749 *
        S_Frq  +     0.22437164680037 * S_Income  +     1.43365592130923 *
        S_Mnt  +    -0.14312453132189 * S_MntFruits  +    -0.31473112363001 *
        S_MntGoldProds  +    -2.13920511789248 * S_MntMeatProducts
          +    -0.17184538549757 * S_MntSweetProducts
          +    -0.69381764338971 * S_NumCatalogPurchases
          +    -1.00049208220128 * S_NumWebPurchases
          +    -0.12191208845807 * S_RFMstat  +     1.62722348145663 *
        S_RMntFrq  +     0.22384852404779 * S_Recency ;
   H14  =    -0.30303374230593 * S_AcceptedCmpTotal  +    -0.62477404644887 *
        S_Frq  +    -0.43520735188047 * S_Income  +     0.05599198595582 *
        S_Mnt  +     0.00600099391846 * S_MntFruits  +    -0.09476560363866 *
        S_MntGoldProds  +    -0.00009188415985 * S_MntMeatProducts
          +     0.23752183521653 * S_MntSweetProducts
          +    -0.28855285082926 * S_NumCatalogPurchases
          +     0.22915352115856 * S_NumWebPurchases
          +    -0.11884330592736 * S_RFMstat  +    -0.64276224884242 *
        S_RMntFrq  +     0.92099032026404 * S_Recency ;
   H15  =     0.69494967673266 * S_AcceptedCmpTotal  +    -1.38070782248656 *
        S_Frq  +    -0.32839057322808 * S_Income  +    -0.08175715513223 *
        S_Mnt  +    -0.20002754133592 * S_MntFruits  +    -0.11045646973193 *
        S_MntGoldProds  +     -0.0204672560747 * S_MntMeatProducts
          +     0.02112120768705 * S_MntSweetProducts
          +     0.56037303009349 * S_NumCatalogPurchases
          +     0.16645734799944 * S_NumWebPurchases
          +    -0.08683405137098 * S_RFMstat  +     0.67174291855061 *
        S_RMntFrq  +    -0.73931649005757 * S_Recency ;
   H11  = H11  +    -0.06672320657697 * G_Marital_Status0
          +     0.26608073179469 * G_Marital_Status1 ;
   H12  = H12  +    -0.50978529257766 * G_Marital_Status0
          +    -0.79456480121636 * G_Marital_Status1 ;
   H13  = H13  +     0.10010493470347 * G_Marital_Status0
          +    -0.36513536279898 * G_Marital_Status1 ;
   H14  = H14  +    -0.69765939438555 * G_Marital_Status0
          +    -0.11679147660596 * G_Marital_Status1 ;
   H15  = H15  +     0.53791694284218 * G_Marital_Status0
          +      0.4394922352118 * G_Marital_Status1 ;
   H11  =    -2.24311986759404 + H11 ;
   H12  =    -0.72214357959265 + H12 ;
   H13  =     0.67332529871332 + H13 ;
   H14  =      3.2917179565774 + H14 ;
   H15  =     0.60464077032534 + H15 ;
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
   P_DepVar1  =    -3.62613662430208 * H11  +     1.55068674489409 * H12
          +    -3.01839961891379 * H13  +    -4.27170883586144 * H14
          +     2.62887939759638 * H15 ;
   P_DepVar1  =    -1.19158347943696 + P_DepVar1 ;
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
* Renaming variables for Neural27;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural27;
*------------------------------------------------------------*;
drop Neural27_P_DepVar1;
Neural27_P_DepVar1 = P_DepVar1;
drop Neural27_P_DepVar0;
Neural27_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural27;
*------------------------------------------------------------*;
length Neural27_WARN_ $4;
drop Neural27_WARN_;
Neural27_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl19: Scoring Code of model 4 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural28;
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

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
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
   Income ,
   Mnt ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   NumCatalogPurchases ,
   NumWebPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 *
        MntSweetProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
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
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =     0.82631693872377 * S_AcceptedCmpTotal  +    -0.72798667283699 *
        S_Frq  +     0.15911649036122 * S_Income  +    -0.60456350734571 *
        S_Mnt  +    -0.74377544096034 * S_MntFruits  +    -0.12263914971644 *
        S_MntGoldProds  +     0.17677796203072 * S_MntMeatProducts
          +    -0.50748691839629 * S_MntSweetProducts
          +     0.64296516693494 * S_NumCatalogPurchases
          +     1.28350004565407 * S_NumWebPurchases
          +     0.21030868312225 * S_RFMstat  +    -0.39695828920844 *
        S_RMntFrq  +    -0.89895080438896 * S_Recency ;
   H12  =     0.11667862669372 * S_AcceptedCmpTotal  +    -1.01106011934145 *
        S_Frq  +    -0.17716076384549 * S_Income  +    -0.24293226300477 *
        S_Mnt  +     -0.0787175302374 * S_MntFruits  +     0.00532047873906 *
        S_MntGoldProds  +     1.29466535738179 * S_MntMeatProducts
          +     0.17384010941361 * S_MntSweetProducts
          +     0.92948439877935 * S_NumCatalogPurchases
          +     0.22516927332959 * S_NumWebPurchases
          +     0.05028067999269 * S_RFMstat  +     0.78999743446302 *
        S_RMntFrq  +    -0.20939117765596 * S_Recency ;
   H13  =     0.04357769443186 * S_AcceptedCmpTotal  +     0.15406703269953 *
        S_Frq  +     0.30195133876726 * S_Income  +     0.28819360890276 *
        S_Mnt  +     0.09892781576641 * S_MntFruits  +     0.49225212949739 *
        S_MntGoldProds  +     0.29770764897396 * S_MntMeatProducts
          +     -0.2000873376449 * S_MntSweetProducts
          +     0.12566784354514 * S_NumCatalogPurchases
          +     0.02104112723179 * S_NumWebPurchases
          +    -0.43415514019088 * S_RFMstat  +    -0.17022294749993 *
        S_RMntFrq  +     0.30357171575981 * S_Recency ;
   H14  =     0.89017550554492 * S_AcceptedCmpTotal  +    -1.24866436391906 *
        S_Frq  +    -0.83458596455814 * S_Income  +    -0.66942952173326 *
        S_Mnt  +    -0.22543485387319 * S_MntFruits  +    -0.10688181972933 *
        S_MntGoldProds  +     0.85050982143614 * S_MntMeatProducts
          +     0.12117759215087 * S_MntSweetProducts
          +     0.80203773582494 * S_NumCatalogPurchases
          +     0.17374160185958 * S_NumWebPurchases
          +    -0.12855081884938 * S_RFMstat  +     0.45921570261849 *
        S_RMntFrq  +    -1.09092321008268 * S_Recency ;
   H15  =    -0.68386094226468 * S_AcceptedCmpTotal  +    -0.44368664779237 *
        S_Frq  +    -0.63118593216016 * S_Income  +     -0.8549673235883 *
        S_Mnt  +     -0.4174049500068 * S_MntFruits  +    -0.02221537411568 *
        S_MntGoldProds  +      0.0634004340553 * S_MntMeatProducts
          +      0.2989820991785 * S_MntSweetProducts
          +     0.04398783976739 * S_NumCatalogPurchases
          +     0.40368640676572 * S_NumWebPurchases
          +    -0.50987577368598 * S_RFMstat  +    -0.24616064467414 *
        S_RMntFrq  +    -0.01932947962302 * S_Recency ;
   H16  =    -0.69633356297868 * S_AcceptedCmpTotal  +     0.25580106272723 *
        S_Frq  +    -0.15941056497212 * S_Income  +     1.01091236070049 *
        S_Mnt  +    -0.16421220259024 * S_MntFruits  +    -0.28158219367628 *
        S_MntGoldProds  +    -0.80473865500071 * S_MntMeatProducts
          +     0.10950268819222 * S_MntSweetProducts
          +    -0.59025524598908 * S_NumCatalogPurchases
          +    -0.02069421817896 * S_NumWebPurchases
          +     -0.3615429826151 * S_RFMstat  +    -0.41611769964424 *
        S_RMntFrq  +     0.96940490611968 * S_Recency ;
   H11  = H11  +        0.45545922927 * G_Marital_Status0
          +     0.12818067118838 * G_Marital_Status1 ;
   H12  = H12  +    -0.20371081343188 * G_Marital_Status0
          +      0.0869800653918 * G_Marital_Status1 ;
   H13  = H13  +    -0.33845151454936 * G_Marital_Status0
          +    -0.43733288680739 * G_Marital_Status1 ;
   H14  = H14  +     0.11759980770855 * G_Marital_Status0
          +    -0.01680808105992 * G_Marital_Status1 ;
   H15  = H15  +    -0.20605143700963 * G_Marital_Status0
          +     0.04987739539035 * G_Marital_Status1 ;
   H16  = H16  +    -0.99478088512585 * G_Marital_Status0
          +    -0.35983290751115 * G_Marital_Status1 ;
   H11  =    -0.72044866217862 + H11 ;
   H12  =     0.73797915336977 + H12 ;
   H13  =     0.82989235994379 + H13 ;
   H14  =    -0.48103007102008 + H14 ;
   H15  =     -0.4352791778041 + H15 ;
   H16  =      2.7027355184778 + H16 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     1.53646139060035 * H11  +     1.98227889313385 * H12
          +     0.69366657666187 * H13  +      1.4458071195477 * H14
          +     0.81229467076169 * H15  +     -2.4762533950508 * H16 ;
   P_DepVar1  =    -0.95559108382775 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural28;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural28;
*------------------------------------------------------------*;
drop Neural28_P_DepVar1;
Neural28_P_DepVar1 = P_DepVar1;
drop Neural28_P_DepVar0;
Neural28_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural28;
*------------------------------------------------------------*;
length Neural28_WARN_ $4;
drop Neural28_WARN_;
Neural28_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl19: Scoring Code of model 5 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural8;
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

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

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

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
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
   Income ,
   Mnt ,
   MntFruits ,
   MntGoldProds ,
   MntMeatProducts ,
   MntSweetProducts ,
   NumCatalogPurchases ,
   NumWebPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 *
        MntSweetProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
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
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 *
        NumWebPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =     0.00179298802892 * S_AcceptedCmpTotal  +     0.01784009275608 *
        S_Frq  +     0.69409617936033 * S_Income  +    -0.28641816886809 *
        S_Mnt  +     0.21745721720131 * S_MntFruits  +    -0.38924339437831 *
        S_MntGoldProds  +     0.48302006424722 * S_MntMeatProducts
          +     0.32217287817742 * S_MntSweetProducts
          +     0.37317765763795 * S_NumCatalogPurchases
          +     0.31712152035565 * S_NumWebPurchases
          +    -0.00101711956377 * S_RFMstat  +    -0.50814709993968 *
        S_RMntFrq  +     -0.2674878177058 * S_Recency ;
   H12  =    -0.13522102699695 * S_AcceptedCmpTotal  +     0.62468738576113 *
        S_Frq  +     0.33525631913577 * S_Income  +     0.49596519260867 *
        S_Mnt  +    -0.07840703709606 * S_MntFruits  +    -0.13407863606593 *
        S_MntGoldProds  +     0.07892036440987 * S_MntMeatProducts
          +    -0.19345300638771 * S_MntSweetProducts
          +     0.37926806634405 * S_NumCatalogPurchases
          +     0.17926711405358 * S_NumWebPurchases
          +    -0.56247478537915 * S_RFMstat  +    -0.83222377723575 *
        S_RMntFrq  +     0.06152905340066 * S_Recency ;
   H13  =     0.52085707566671 * S_AcceptedCmpTotal  +    -0.43119445779869 *
        S_Frq  +    -0.38451776725994 * S_Income  +    -0.43893571865073 *
        S_Mnt  +    -0.18147736658896 * S_MntFruits  +    -0.02759924916073 *
        S_MntGoldProds  +     0.41710329802839 * S_MntMeatProducts
          +    -0.11238728777733 * S_MntSweetProducts
          +     0.39955878063516 * S_NumCatalogPurchases
          +     0.37701883017309 * S_NumWebPurchases
          +    -0.03011513977353 * S_RFMstat  +     0.05558894855861 *
        S_RMntFrq  +    -0.53097904952065 * S_Recency ;
   H14  =     0.01011198652387 * S_AcceptedCmpTotal  +     0.50914419302954 *
        S_Frq  +     0.36935051571942 * S_Income  +    -0.14541266632981 *
        S_Mnt  +     0.70809835135242 * S_MntFruits  +     0.17636828127553 *
        S_MntGoldProds  +    -0.39065133922684 * S_MntMeatProducts
          +      0.2693109494597 * S_MntSweetProducts
          +      0.1081864929712 * S_NumCatalogPurchases
          +     0.04463189601793 * S_NumWebPurchases
          +     0.17598396305598 * S_RFMstat  +    -0.26428585222285 *
        S_RMntFrq  +    -0.35066600356743 * S_Recency ;
   H15  =     0.25974646459449 * S_AcceptedCmpTotal  +    -0.01084764302849 *
        S_Frq  +    -0.25453296848623 * S_Income  +    -0.24485320547361 *
        S_Mnt  +      0.3523119885561 * S_MntFruits  +    -0.23948230282173 *
        S_MntGoldProds  +    -0.61077291955379 * S_MntMeatProducts
          +     0.69250340520766 * S_MntSweetProducts
          +    -0.92476508978686 * S_NumCatalogPurchases
          +    -0.85062812213631 * S_NumWebPurchases
          +    -0.13668170504261 * S_RFMstat  +    -0.39159958659757 *
        S_RMntFrq  +     0.31541831647045 * S_Recency ;
   H16  =     0.30881424897223 * S_AcceptedCmpTotal  +      0.2794364053658 *
        S_Frq  +    -0.13255692208785 * S_Income  +      0.1084623497397 *
        S_Mnt  +    -0.21377822064675 * S_MntFruits  +     0.66167304100171 *
        S_MntGoldProds  +    -0.18059030828344 * S_MntMeatProducts
          +      0.1342841887454 * S_MntSweetProducts
          +    -0.35353451726224 * S_NumCatalogPurchases
          +     0.19726071632213 * S_NumWebPurchases
          +    -0.67773182477521 * S_RFMstat  +    -0.05559124023026 *
        S_RMntFrq  +     0.29135046009186 * S_Recency ;
   H17  =    -0.56474657283939 * S_AcceptedCmpTotal  +     0.49714469636668 *
        S_Frq  +     0.38873911121939 * S_Income  +     0.18672296356038 *
        S_Mnt  +    -0.12290033905766 * S_MntFruits  +    -0.55117454621073 *
        S_MntGoldProds  +    -0.34157249684624 * S_MntMeatProducts
          +    -0.03878223698579 * S_MntSweetProducts
          +    -0.44318159654535 * S_NumCatalogPurchases
          +     0.28629379958053 * S_NumWebPurchases
          +    -0.33628587814816 * S_RFMstat  +     0.01539005969109 *
        S_RMntFrq  +      0.4669281349511 * S_Recency ;
   H11  = H11  +     0.54366812821853 * G_Marital_Status0
          +    -0.24270884269566 * G_Marital_Status1 ;
   H12  = H12  +     0.12201873252315 * G_Marital_Status0
          +      0.2708540168877 * G_Marital_Status1 ;
   H13  = H13  +     0.21773390953206 * G_Marital_Status0
          +      0.1849184915243 * G_Marital_Status1 ;
   H14  = H14  +     0.42359989920789 * G_Marital_Status0
          +     -0.0427682060318 * G_Marital_Status1 ;
   H15  = H15  +     0.39852794737212 * G_Marital_Status0
          +      0.4834959104522 * G_Marital_Status1 ;
   H16  = H16  +     0.34117172602716 * G_Marital_Status0
          +     0.01719507366738 * G_Marital_Status1 ;
   H17  = H17  +    -0.48271020073977 * G_Marital_Status0
          +    -0.38643265086902 * G_Marital_Status1 ;
   H11  =    -1.92887755316705 + H11 ;
   H12  =     1.10580453552439 + H12 ;
   H13  =     -0.0396459221076 + H13 ;
   H14  =    -0.24030684440152 + H14 ;
   H15  =    -1.57024900687106 + H15 ;
   H16  =    -0.33224481657704 + H16 ;
   H17  =     1.22710614099789 + H17 ;
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
   P_DepVar1  =     1.21462455419854 * H11  +    -0.32480789724651 * H12
          +     2.96475008226038 * H13  +     -0.7919726093423 * H14
          +    -2.29353966226595 * H15  +     -0.7223088500433 * H16
          +    -2.44182031584859 * H17 ;
   P_DepVar1  =    -1.63832895249218 + P_DepVar1 ;
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
* Renaming variables for Neural8;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural8;
*------------------------------------------------------------*;
drop Neural8_P_DepVar1;
Neural8_P_DepVar1 = P_DepVar1;
drop Neural8_P_DepVar0;
Neural8_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural8;
*------------------------------------------------------------*;
length Neural8_WARN_ $4;
drop Neural8_WARN_;
Neural8_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl19: Average Posteriors of 5 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural24_P_DepVar1 +
Neural26_P_DepVar1 +
Neural27_P_DepVar1 +
Neural28_P_DepVar1 +
Neural8_P_DepVar1
)/5;
P_DepVar0 = (
Neural24_P_DepVar0 +
Neural26_P_DepVar0 +
Neural27_P_DepVar0 +
Neural28_P_DepVar0 +
Neural8_P_DepVar0
)/5;
*------------------------------------------------------------*;
* Ensmbl19: Computing Classification Vars;
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
* Ensmbl19: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl19: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL24_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL24_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL24_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL24_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL26_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL26_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL26_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL26_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL27_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL27_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL27_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL27_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL28_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL28_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL28_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL28_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL8_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL8_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL8_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL8_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
