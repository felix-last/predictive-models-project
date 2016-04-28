*------------------------------------------------------------*;
* Ensmbl8: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl8: Scoring Code of model 1 of 3;
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
      F_DepVar  $ 12
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   MntGoldProds ,
   MntMeatProducts ,
   MntWines ,
   NumDistPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
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
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H1x1_1  =     0.33555011401553 * S_AcceptedCmpTotal
          +    -3.02490159760157 * S_Frq  +    -0.12761482391665 * S_Income
          +     -9.1169668394273 * S_Mnt  +     0.88214411094174 *
        S_MntGoldProds  +     16.4212241447522 * S_MntMeatProducts
          +     4.65784744010387 * S_MntWines  +     2.75620847659032 *
        S_NumDistPurchases  +     5.10796074430888 * S_RFMstat
          +    -0.15069444442326 * S_RMntFrq  +    -0.36037041233055 *
        S_Recency ;
   H1x1_2  =     -6.2107002884316 * S_AcceptedCmpTotal
          +      5.5991079844098 * S_Frq  +    -1.06506164052399 * S_Income
          +     7.16823320768258 * S_Mnt  +     1.97115223638004 *
        S_MntGoldProds  +     0.02973121977962 * S_MntMeatProducts
          +     3.28931008157038 * S_MntWines  +    -3.02545356699096 *
        S_NumDistPurchases  +    -0.45519831720714 * S_RFMstat
          +     2.14788986039061 * S_RMntFrq  +     7.13033786501062 *
        S_Recency ;
   H1x1_3  =    -0.31707769589072 * S_AcceptedCmpTotal
          +     -0.8436342869652 * S_Frq  +     0.04938014828703 * S_Income
          +     0.41074885451072 * S_Mnt  +    -0.22835264468248 *
        S_MntGoldProds  +     0.04154328332772 * S_MntMeatProducts
          +    -0.63526276335269 * S_MntWines  +     0.16430041832418 *
        S_NumDistPurchases  +    -0.01070081959406 * S_RFMstat
          +    -1.56851833223581 * S_RMntFrq  +     0.62478865123427 *
        S_Recency ;
   H1x1_4  =     0.54144616315359 * S_AcceptedCmpTotal
          +    -2.69605116285758 * S_Frq  +    -0.42453662943397 * S_Income
          +    -0.95657675439363 * S_Mnt  +     0.24420189860131 *
        S_MntGoldProds  +     2.44632795316553 * S_MntMeatProducts
          +     -0.1454644222769 * S_MntWines  +     2.34899307919173 *
        S_NumDistPurchases  +    -0.02462201574723 * S_RFMstat
          +    -2.08470857931815 * S_RMntFrq  +    -0.76249328143214 *
        S_Recency ;
   H1x1_1  = H1x1_1  +     0.00660823494191 * G_Marital_Status0
          +    -0.18825548425502 * G_Marital_Status1 ;
   H1x1_2  = H1x1_2  +    -2.06051657300217 * G_Marital_Status0
          +    -6.25782340834073 * G_Marital_Status1 ;
   H1x1_3  = H1x1_3  +    -0.79419358160841 * G_Marital_Status0
          +     0.34890327415646 * G_Marital_Status1 ;
   H1x1_4  = H1x1_4  +    -0.04651762606699 * G_Marital_Status0
          +     0.31552155976549 * G_Marital_Status1 ;
   H1x1_1  =      9.5912267385355 + H1x1_1 ;
   H1x1_2  =     -17.513407093022 + H1x1_2 ;
   H1x1_3  =     3.77110114695743 + H1x1_3 ;
   H1x1_4  =    -1.34405555452152 + H1x1_4 ;
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
*** Writing the Node DepVar ;
*** *************************;

*** Generate dummy variables for DepVar ;
drop DepVar1 DepVar0 ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   DepVar1 = .;
   DepVar0 = .;
end;
else do;
   if F_DepVar = '0'  then do;
      DepVar1 = 0;
      DepVar0 = 1;
   end;
   else if F_DepVar = '1'  then do;
      DepVar1 = 1;
      DepVar0 = 0;
   end;
   else do;
      DepVar1 = .;
      DepVar0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     17.1648278730429 * H1x1_1  +    -5.41550544466459 * H1x1_2
          +     -11.071053129929 * H1x1_3  +      10.744209891392 * H1x1_4 ;
   P_DepVar1  =    -12.0079203309727 + P_DepVar1 ;
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
*** *****************************;
*** Writing the Residuals  of the Node DepVar ;
*** ******************************;
IF MISSING( DepVar1 ) THEN R_DepVar1  = . ;
ELSE R_DepVar1  = DepVar1  - P_DepVar1 ;
IF MISSING( DepVar0 ) THEN R_DepVar0  = . ;
ELSE R_DepVar0  = DepVar0  - P_DepVar0 ;
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
* Ensmbl8: Scoring Code of model 2 of 3;
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
      F_DepVar  $ 12
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

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

      label H1x4_1 = 'Hidden: H1x4_=1' ;

      label H1x4_2 = 'Hidden: H1x4_=2' ;

      label H1x4_3 = 'Hidden: H1x4_=3' ;

      label H1x4_4 = 'Hidden: H1x4_=4' ;

      label H1x4_5 = 'Hidden: H1x4_=5' ;

      label H1x4_6 = 'Hidden: H1x4_=6' ;

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

      label H2x3_1 = 'Hidden: H2x3_=1' ;

      label H2x3_2 = 'Hidden: H2x3_=2' ;

      label H2x3_3 = 'Hidden: H2x3_=3' ;

      label H2x3_4 = 'Hidden: H2x3_=4' ;

      label H2x3_5 = 'Hidden: H2x3_=5' ;

      label H2x3_6 = 'Hidden: H2x3_=6' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x1_3 = 'Hidden: H3x1_=3' ;

      label H3x1_4 = 'Hidden: H3x1_=4' ;

      label H3x1_5 = 'Hidden: H3x1_=5' ;

      label H3x1_6 = 'Hidden: H3x1_=6' ;

      label H3x2_1 = 'Hidden: H3x2_=1' ;

      label H3x2_2 = 'Hidden: H3x2_=2' ;

      label H3x2_3 = 'Hidden: H3x2_=3' ;

      label H3x2_4 = 'Hidden: H3x2_=4' ;

      label H3x2_5 = 'Hidden: H3x2_=5' ;

      label H3x2_6 = 'Hidden: H3x2_=6' ;

      label H4x1_1 = 'Hidden: H4x1_=1' ;

      label H4x1_2 = 'Hidden: H4x1_=2' ;

      label H4x1_3 = 'Hidden: H4x1_=3' ;

      label H4x1_4 = 'Hidden: H4x1_=4' ;

      label H4x1_5 = 'Hidden: H4x1_=5' ;

      label H4x1_6 = 'Hidden: H4x1_=6' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   MntGoldProds ,
   MntMeatProducts ,
   MntWines ,
   NumDistPurchases ,
   RFMstat ,
   RMntFrq ,
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
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
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
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H1x1_1  =     3.15417213555791 * S_AcceptedCmpTotal
          +    -2.48200966202064 * S_Frq  +     1.79801309624052 * S_Income
          +    -1.96453924225923 * S_Mnt  +    -0.73447750078211 *
        S_MntGoldProds  +    -1.52540613833145 * S_MntMeatProducts
          +    -2.34651136428537 * S_MntWines  +     1.78713249203795 *
        S_NumDistPurchases  +    -1.89877446252459 * S_RFMstat
          +     0.40523847190984 * S_RMntFrq  +    -5.00157954960261 *
        S_Recency ;
   H1x1_2  =     -0.4296332791258 * S_AcceptedCmpTotal
          +     1.69454720747031 * S_Frq  +     0.65291994437462 * S_Income
          +     4.94289741649285 * S_Mnt  +    -0.74724168333375 *
        S_MntGoldProds  +    -4.37885511745275 * S_MntMeatProducts
          +    -0.79918604028406 * S_MntWines  +    -2.55554908870931 *
        S_NumDistPurchases  +      -0.357509020401 * S_RFMstat
          +     2.81206015252461 * S_RMntFrq  +       0.376849190211 *
        S_Recency ;
   H1x1_3  =     0.22275326994217 * S_AcceptedCmpTotal
          +     1.30327962429821 * S_Frq  +     8.11675617892245 * S_Income
          +     1.26763916951276 * S_Mnt  +     -0.2686825897259 *
        S_MntGoldProds  +    -1.42114074651211 * S_MntMeatProducts
          +    -1.76821642666458 * S_MntWines  +    -1.91323522505912 *
        S_NumDistPurchases  +    -0.12369288380556 * S_RFMstat
          +     -0.5961110037328 * S_RMntFrq  +     1.45489277444882 *
        S_Recency ;
   H1x1_4  =     0.65694888778783 * S_AcceptedCmpTotal
          +    -2.46645772884275 * S_Frq  +     2.56090496460471 * S_Income
          +     1.47469720902355 * S_Mnt  +    -0.23044042020952 *
        S_MntGoldProds  +     1.09436190473143 * S_MntMeatProducts
          +    -0.07872477007968 * S_MntWines  +     2.35913880285028 *
        S_NumDistPurchases  +     0.36553596420262 * S_RFMstat
          +    -1.52014700293876 * S_RMntFrq  +    -1.62001903467763 *
        S_Recency ;
   H1x1_5  =    -0.06045586654134 * S_AcceptedCmpTotal
          +    -1.51896554067022 * S_Frq  +    -0.77690899609172 * S_Income
          +    -3.83443076797312 * S_Mnt  +    -0.49066287190692 *
        S_MntGoldProds  +     7.74304126889741 * S_MntMeatProducts
          +     0.97717560040665 * S_MntWines  +     2.55833904797689 *
        S_NumDistPurchases  +     3.33552253786577 * S_RFMstat
          +     2.15128325510301 * S_RMntFrq  +     0.51475149451235 *
        S_Recency ;
   H1x1_6  =    -2.00102225492393 * S_AcceptedCmpTotal
          +    -0.55313430858805 * S_Frq  +    -2.80039880440251 * S_Income
          +    -0.52613628819852 * S_Mnt  +    -1.25580169134654 *
        S_MntGoldProds  +    -1.44511464402737 * S_MntMeatProducts
          +    -0.66744558284147 * S_MntWines  +     3.15612301024597 *
        S_NumDistPurchases  +    -0.57805918326136 * S_RFMstat
          +     0.13349014037678 * S_RMntFrq  +    -1.97053621157132 *
        S_Recency ;
   H1x1_1  = H1x1_1  +     1.38825657874217 * G_Marital_Status0
          +     0.90195662603521 * G_Marital_Status1 ;
   H1x1_2  = H1x1_2  +     0.88138395159348 * G_Marital_Status0
          +    -0.49019446056296 * G_Marital_Status1 ;
   H1x1_3  = H1x1_3  +     0.30990330359421 * G_Marital_Status0
          +     1.10544938214372 * G_Marital_Status1 ;
   H1x1_4  = H1x1_4  +     1.70251598227875 * G_Marital_Status0
          +     0.87683669160259 * G_Marital_Status1 ;
   H1x1_5  = H1x1_5  +    -0.14678805736317 * G_Marital_Status0
          +    -0.13246180955576 * G_Marital_Status1 ;
   H1x1_6  = H1x1_6  +     -0.6511155024316 * G_Marital_Status0
          +     0.24707257141342 * G_Marital_Status1 ;
   H1x1_1  =     4.82277728923766 + H1x1_1 ;
   H1x1_2  =     2.49777705822347 + H1x1_2 ;
   H1x1_3  =    -0.93289135595041 + H1x1_3 ;
   H1x1_4  =    -7.80421802944398 + H1x1_4 ;
   H1x1_5  =     6.46115064589724 + H1x1_5 ;
   H1x1_6  =     3.21096596966888 + H1x1_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
   H1x1_6  = 1.0 / (1.0 + EXP(MIN( - H1x1_6 , _EXP_BAR)));
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
   H1x2_1  =    -0.30711239275958 * S_AcceptedCmpTotal
          +    -1.45395291114633 * S_Frq  +     0.87594950917085 * S_Income
          +    -0.72639274085105 * S_Mnt  +    -2.47797355837112 *
        S_MntGoldProds  +     0.68384082088335 * S_MntMeatProducts
          +     0.65600644755641 * S_MntWines  +      0.8163360453447 *
        S_NumDistPurchases  +    -1.09587924440912 * S_RFMstat
          +     1.48347762248449 * S_RMntFrq  +      0.2335216261547 *
        S_Recency ;
   H1x2_2  =     2.57777770372275 * S_AcceptedCmpTotal
          +    -0.08699050003337 * S_Frq  +      0.9048262025585 * S_Income
          +     0.80716409242733 * S_Mnt  +     0.92862088643502 *
        S_MntGoldProds  +     1.28722996014956 * S_MntMeatProducts
          +    -0.78107065942411 * S_MntWines  +     2.29787925805392 *
        S_NumDistPurchases  +     -0.7095984076797 * S_RFMstat
          +    -0.75276407747323 * S_RMntFrq  +    -2.14859674388241 *
        S_Recency ;
   H1x2_3  =    -0.19225474668372 * S_AcceptedCmpTotal
          +     -0.5399776824486 * S_Frq  +    -0.33342356858106 * S_Income
          +      0.4662552460972 * S_Mnt  +    -0.83897697999245 *
        S_MntGoldProds  +    -1.02069791829975 * S_MntMeatProducts
          +    -0.77568646594215 * S_MntWines  +    -2.64172584610703 *
        S_NumDistPurchases  +     1.22587043380457 * S_RFMstat
          +    -1.22124295004478 * S_RMntFrq  +     0.72727673065668 *
        S_Recency ;
   H1x2_4  =     1.07963833884217 * S_AcceptedCmpTotal
          +    -1.30033554705908 * S_Frq  +     0.80740030463615 * S_Income
          +    -1.73808129607223 * S_Mnt  +     1.21346647777818 *
        S_MntGoldProds  +     0.69007605858806 * S_MntMeatProducts
          +     0.31548401471349 * S_MntWines  +    -0.45355998387313 *
        S_NumDistPurchases  +     1.13504256910361 * S_RFMstat
          +    -0.45561637629388 * S_RMntFrq  +    -1.42094697023704 *
        S_Recency ;
   H1x2_5  =     0.30163018627699 * S_AcceptedCmpTotal
          +    -0.73947459722676 * S_Frq  +      0.3117229426353 * S_Income
          +     1.78189396082002 * S_Mnt  +    -1.51478593904163 *
        S_MntGoldProds  +    -1.30328540691967 * S_MntMeatProducts
          +     0.48947220852953 * S_MntWines  +     0.25380878841531 *
        S_NumDistPurchases  +    -0.09429027402746 * S_RFMstat
          +     2.79720421337828 * S_RMntFrq  +    -0.08024855242737 *
        S_Recency ;
   H1x2_6  =    -0.05006047355159 * S_AcceptedCmpTotal
          +     0.01838632143297 * S_Frq  +    -1.04892137940395 * S_Income
          +    -0.33949418476309 * S_Mnt  +     1.27820886482898 *
        S_MntGoldProds  +      0.1541042926193 * S_MntMeatProducts
          +    -0.30996391960135 * S_MntWines  +     0.69532310497927 *
        S_NumDistPurchases  +    -0.51247610421467 * S_RFMstat
          +    -0.87640728095011 * S_RMntFrq  +     1.79661996586627 *
        S_Recency ;
   H1x2_1  = H1x2_1  +    -1.52372947412233 * G_Marital_Status0
          +     0.61190614442174 * G_Marital_Status1 ;
   H1x2_2  = H1x2_2  +     -0.2899112326334 * G_Marital_Status0
          +    -0.43943770039245 * G_Marital_Status1 ;
   H1x2_3  = H1x2_3  +    -1.30447843367338 * G_Marital_Status0
          +     0.36969296112687 * G_Marital_Status1 ;
   H1x2_4  = H1x2_4  +     1.06192432928756 * G_Marital_Status0
          +    -0.48897798100871 * G_Marital_Status1 ;
   H1x2_5  = H1x2_5  +     1.24023950705702 * G_Marital_Status0
          +     -0.0768652239427 * G_Marital_Status1 ;
   H1x2_6  = H1x2_6  +    -0.79854804689099 * G_Marital_Status0
          +    -0.58590001312977 * G_Marital_Status1 ;
   H1x2_1  =    -1.24057312487712 + H1x2_1 ;
   H1x2_2  =    -0.68291139361923 + H1x2_2 ;
   H1x2_3  =     1.06420344729961 + H1x2_3 ;
   H1x2_4  =    -2.69713708678823 + H1x2_4 ;
   H1x2_5  =    -0.12447063994137 + H1x2_5 ;
   H1x2_6  =     -1.0719988986801 + H1x2_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
   H1x2_5  = 1.0 / (1.0 + EXP(MIN( - H1x2_5 , _EXP_BAR)));
   H1x2_6  = 1.0 / (1.0 + EXP(MIN( - H1x2_6 , _EXP_BAR)));
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
   H1x3_1  =     0.58141896766328 * S_AcceptedCmpTotal
          +     0.88835106317195 * S_Frq  +     1.03397412242189 * S_Income
          +    -0.19511498332885 * S_Mnt  +     0.79222351582255 *
        S_MntGoldProds  +     1.84666352042484 * S_MntMeatProducts
          +     0.26439819900146 * S_MntWines  +    -0.49316136014272 *
        S_NumDistPurchases  +    -1.53931690693652 * S_RFMstat
          +     0.66163259224518 * S_RMntFrq  +    -0.05038100966606 *
        S_Recency ;
   H1x3_2  =    -0.66965742898236 * S_AcceptedCmpTotal
          +     0.11439761295336 * S_Frq  +      0.4311111590428 * S_Income
          +     0.56419594384106 * S_Mnt  +    -2.58586026844722 *
        S_MntGoldProds  +     0.84843617907069 * S_MntMeatProducts
          +    -0.40949465894409 * S_MntWines  +    -1.12254199224924 *
        S_NumDistPurchases  +    -1.73672932018459 * S_RFMstat
          +     0.60800652848154 * S_RMntFrq  +     0.90023461529092 *
        S_Recency ;
   H1x3_3  =     0.64116254904887 * S_AcceptedCmpTotal
          +     0.36521168161033 * S_Frq  +    -1.65592742965949 * S_Income
          +    -1.13010637801203 * S_Mnt  +     1.18435160743823 *
        S_MntGoldProds  +     0.61014939723339 * S_MntMeatProducts
          +     0.57967362971329 * S_MntWines  +    -0.00705774722842 *
        S_NumDistPurchases  +    -0.09732595050305 * S_RFMstat
          +    -1.58268748567816 * S_RMntFrq  +    -1.00117301133743 *
        S_Recency ;
   H1x3_4  =    -2.38943135123073 * S_AcceptedCmpTotal
          +     0.50616478854457 * S_Frq  +     1.68985840818789 * S_Income
          +    -0.51011802824515 * S_Mnt  +     1.25167622017055 *
        S_MntGoldProds  +    -0.78430871718616 * S_MntMeatProducts
          +     0.97685472578698 * S_MntWines  +    -0.66992601103029 *
        S_NumDistPurchases  +    -0.28545877583545 * S_RFMstat
          +     0.52712575990538 * S_RMntFrq  +     1.51096273676103 *
        S_Recency ;
   H1x3_5  =     0.27293739636898 * S_AcceptedCmpTotal
          +     0.44515009768765 * S_Frq  +     -0.4521347788574 * S_Income
          +     0.43943223859703 * S_Mnt  +     1.17781847894182 *
        S_MntGoldProds  +    -0.67700757595581 * S_MntMeatProducts
          +    -1.46437355846341 * S_MntWines  +    -0.09365592083561 *
        S_NumDistPurchases  +     0.94926901433762 * S_RFMstat
          +     2.40216905424957 * S_RMntFrq  +     0.65859109347516 *
        S_Recency ;
   H1x3_6  =     0.79944121174459 * S_AcceptedCmpTotal
          +     0.19594924011495 * S_Frq  +     1.07233338144708 * S_Income
          +    -0.39577530492174 * S_Mnt  +    -0.18122578134776 *
        S_MntGoldProds  +    -0.26451891721245 * S_MntMeatProducts
          +    -0.86856724355925 * S_MntWines  +    -1.81909916765471 *
        S_NumDistPurchases  +     1.03983663011092 * S_RFMstat
          +    -0.86768378180894 * S_RMntFrq  +     0.40747604583851 *
        S_Recency ;
   H1x3_1  = H1x3_1  +    -1.44819834546359 * G_Marital_Status0
          +     2.03049158937708 * G_Marital_Status1 ;
   H1x3_2  = H1x3_2  +     0.32142977922032 * G_Marital_Status0
          +     0.95456795317325 * G_Marital_Status1 ;
   H1x3_3  = H1x3_3  +    -0.05546140673943 * G_Marital_Status0
          +    -0.64267205173982 * G_Marital_Status1 ;
   H1x3_4  = H1x3_4  +     0.67758459902812 * G_Marital_Status0
          +    -0.13878277097624 * G_Marital_Status1 ;
   H1x3_5  = H1x3_5  +      0.2080585980069 * G_Marital_Status0
          +     0.39530416624983 * G_Marital_Status1 ;
   H1x3_6  = H1x3_6  +    -0.56268194068278 * G_Marital_Status0
          +    -1.38939757582535 * G_Marital_Status1 ;
   H1x3_1  =    -0.02110450300917 + H1x3_1 ;
   H1x3_2  =     0.68400964836412 + H1x3_2 ;
   H1x3_3  =     1.27295692924548 + H1x3_3 ;
   H1x3_4  =     0.57759340173339 + H1x3_4 ;
   H1x3_5  =     0.68658947855937 + H1x3_5 ;
   H1x3_6  =     0.96960260915788 + H1x3_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
   H1x3_2  = 1.0 / (1.0 + EXP(MIN( - H1x3_2 , _EXP_BAR)));
   H1x3_3  = 1.0 / (1.0 + EXP(MIN( - H1x3_3 , _EXP_BAR)));
   H1x3_4  = 1.0 / (1.0 + EXP(MIN( - H1x3_4 , _EXP_BAR)));
   H1x3_5  = 1.0 / (1.0 + EXP(MIN( - H1x3_5 , _EXP_BAR)));
   H1x3_6  = 1.0 / (1.0 + EXP(MIN( - H1x3_6 , _EXP_BAR)));
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
*** Writing the Node H1x4_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x4_1  =     1.13261766886471 * S_AcceptedCmpTotal
          +     0.78824304763496 * S_Frq  +    -1.86817100110189 * S_Income
          +    -1.58760227599089 * S_Mnt  +     -1.1330886213304 *
        S_MntGoldProds  +     0.82082069255126 * S_MntMeatProducts
          +    -0.34149449572975 * S_MntWines  +     0.45944109671738 *
        S_NumDistPurchases  +     2.00910621486809 * S_RFMstat
          +     -1.8305685414059 * S_RMntFrq  +     1.46038466341548 *
        S_Recency ;
   H1x4_2  =    -0.63266188932348 * S_AcceptedCmpTotal
          +    -0.01183486383209 * S_Frq  +    -1.07560568030024 * S_Income
          +    -1.30988288899902 * S_Mnt  +     2.15841401397408 *
        S_MntGoldProds  +    -1.27808965763357 * S_MntMeatProducts
          +     2.04886920467378 * S_MntWines  +     0.09322121012781 *
        S_NumDistPurchases  +    -0.37050311259862 * S_RFMstat
          +     0.68085578996214 * S_RMntFrq  +     1.48508197039719 *
        S_Recency ;
   H1x4_3  =    -0.53647455024397 * S_AcceptedCmpTotal
          +     0.24459727005497 * S_Frq  +     0.30319155437277 * S_Income
          +     0.25206471395865 * S_Mnt  +     0.43917953957135 *
        S_MntGoldProds  +    -0.10933570154764 * S_MntMeatProducts
          +    -0.04059236687792 * S_MntWines  +     0.35677739352706 *
        S_NumDistPurchases  +     1.38086899403811 * S_RFMstat
          +    -0.32751457592661 * S_RMntFrq  +    -0.15926282047245 *
        S_Recency ;
   H1x4_4  =     0.24225159923716 * S_AcceptedCmpTotal
          +    -0.83397540163538 * S_Frq  +     0.65454415304883 * S_Income
          +     -2.1008417113285 * S_Mnt  +     1.46444392612369 *
        S_MntGoldProds  +     1.98843066844745 * S_MntMeatProducts
          +    -0.31310064337061 * S_MntWines  +     0.56236194506314 *
        S_NumDistPurchases  +    -0.20512833160409 * S_RFMstat
          +    -0.20631901696385 * S_RMntFrq  +    -0.01945293751142 *
        S_Recency ;
   H1x4_5  =     -0.2800504242999 * S_AcceptedCmpTotal
          +     0.11767474732461 * S_Frq  +    -1.78109558633383 * S_Income
          +    -0.83275451396797 * S_Mnt  +     0.13772739876237 *
        S_MntGoldProds  +    -0.00084509726748 * S_MntMeatProducts
          +     0.92081955236291 * S_MntWines  +    -0.84663906140096 *
        S_NumDistPurchases  +     1.07425261538134 * S_RFMstat
          +    -0.27830850445101 * S_RMntFrq  +     0.74380794599056 *
        S_Recency ;
   H1x4_6  =     -1.1119291723593 * S_AcceptedCmpTotal
          +     0.56304851350844 * S_Frq  +     0.73567113537541 * S_Income
          +    -3.12306246450604 * S_Mnt  +    -0.91316403938439 *
        S_MntGoldProds  +    -2.69628755197256 * S_MntMeatProducts
          +     0.85746867824621 * S_MntWines  +    -0.36724035406906 *
        S_NumDistPurchases  +     0.28568968295985 * S_RFMstat
          +    -0.93954323577146 * S_RMntFrq  +     0.85268992665591 *
        S_Recency ;
   H1x4_1  = H1x4_1  +    -0.41637670428316 * G_Marital_Status0
          +     1.82577173192743 * G_Marital_Status1 ;
   H1x4_2  = H1x4_2  +     1.30084682846119 * G_Marital_Status0
          +     1.86494194086223 * G_Marital_Status1 ;
   H1x4_3  = H1x4_3  +    -2.51039247492524 * G_Marital_Status0
          +    -0.78535196846115 * G_Marital_Status1 ;
   H1x4_4  = H1x4_4  +    -1.66536345681649 * G_Marital_Status0
          +    -1.13643623224979 * G_Marital_Status1 ;
   H1x4_5  = H1x4_5  +     0.34381083459151 * G_Marital_Status0
          +    -0.50611098994468 * G_Marital_Status1 ;
   H1x4_6  = H1x4_6  +    -0.50144547845039 * G_Marital_Status0
          +     1.05855030017376 * G_Marital_Status1 ;
   H1x4_1  =     0.23907181959326 + H1x4_1 ;
   H1x4_2  =    -1.57201194785995 + H1x4_2 ;
   H1x4_3  =     2.06322674265618 + H1x4_3 ;
   H1x4_4  =     1.01469021578807 + H1x4_4 ;
   H1x4_5  =     1.07767489348013 + H1x4_5 ;
   H1x4_6  =     0.04477742816865 + H1x4_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x4_1  = 1.0 / (1.0 + EXP(MIN( - H1x4_1 , _EXP_BAR)));
   H1x4_2  = 1.0 / (1.0 + EXP(MIN( - H1x4_2 , _EXP_BAR)));
   H1x4_3  = 1.0 / (1.0 + EXP(MIN( - H1x4_3 , _EXP_BAR)));
   H1x4_4  = 1.0 / (1.0 + EXP(MIN( - H1x4_4 , _EXP_BAR)));
   H1x4_5  = 1.0 / (1.0 + EXP(MIN( - H1x4_5 , _EXP_BAR)));
   H1x4_6  = 1.0 / (1.0 + EXP(MIN( - H1x4_6 , _EXP_BAR)));
END;
ELSE DO;
   H1x4_1  = .;
   H1x4_2  = .;
   H1x4_3  = .;
   H1x4_4  = .;
   H1x4_5  = .;
   H1x4_6  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     1.57657363240028 * H1x1_1  +    -0.37699618626432 * H1x1_2
          +    -0.60919993629457 * H1x1_3  +     2.97257779188857 * H1x1_4
          +     4.47740938165819 * H1x1_5  +    -0.85059681057218 * H1x1_6 ;
   H2x1_2  =     0.58245150995434 * H1x1_1  +     1.31825599717827 * H1x1_2
          +    -0.46604129874265 * H1x1_3  +    -1.57880778011961 * H1x1_4
          +      0.1296024356855 * H1x1_5  +    -0.32310175742174 * H1x1_6 ;
   H2x1_3  =     0.08762368266386 * H1x1_1  +     -2.1587359786783 * H1x1_2
          +     0.53603825884818 * H1x1_3  +    -0.24087329015868 * H1x1_4
          +     0.03296173080719 * H1x1_5  +     0.01697480121243 * H1x1_6 ;
   H2x1_4  =    -0.11182680657167 * H1x1_1  +     0.78238566788271 * H1x1_2
          +    -0.32984662645651 * H1x1_3  +    -0.48952564803009 * H1x1_4
          +    -1.99607614008712 * H1x1_5  +     0.10016209874446 * H1x1_6 ;
   H2x1_5  =     -1.2498866108229 * H1x1_1  +      3.2369796406078 * H1x1_2
          +      2.8181066223344 * H1x1_3  +    -3.11752751718664 * H1x1_4
          +    -0.69294382105442 * H1x1_5  +     1.50580112761945 * H1x1_6 ;
   H2x1_1  = H2x1_1  +     1.23510627062479 * H1x2_1
          +     0.24021661687189 * H1x2_2  +    -1.56696654026909 * H1x2_3
          +     1.87814576627429 * H1x2_4  +     0.77581978719058 * H1x2_5
          +    -0.36964326956968 * H1x2_6 ;
   H2x1_2  = H2x1_2  +     0.92347023180909 * H1x2_1
          +    -0.58884204034707 * H1x2_2  +     0.32527960762166 * H1x2_3
          +    -2.67192710315835 * H1x2_4  +     1.11142627890507 * H1x2_5
          +     -0.0675747785188 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -0.92500735470206 * H1x2_1
          +     0.02449601034461 * H1x2_2  +    -0.75716713196308 * H1x2_3
          +     0.16672538074212 * H1x2_4  +    -1.03440004099384 * H1x2_5
          +     0.20622228187831 * H1x2_6 ;
   H2x1_4  = H2x1_4  +     1.25485096748114 * H1x2_1
          +     -0.2345670529973 * H1x2_2  +     1.00007865183196 * H1x2_3
          +    -0.19520365006597 * H1x2_4  +     0.15141232788955 * H1x2_5
          +     0.99704195296742 * H1x2_6 ;
   H2x1_5  = H2x1_5  +    -0.65666404502833 * H1x2_1
          +     2.28944563427288 * H1x2_2  +    -0.53344610521696 * H1x2_3
          +      -0.793597979143 * H1x2_4  +     -0.5657184003534 * H1x2_5
          +     0.52117926766363 * H1x2_6 ;
   H2x1_1  = H2x1_1  +    -0.22872297219456 * H1x3_1
          +     0.44130997341488 * H1x3_2  +     0.85543947016407 * H1x3_3
          +      0.9172319436964 * H1x3_4  +    -0.63323674278101 * H1x3_5
          +       0.010792162082 * H1x3_6 ;
   H2x1_2  = H2x1_2  +    -0.47961853683007 * H1x3_1
          +     0.67283234118014 * H1x3_2  +    -0.12148381681871 * H1x3_3
          +     0.11539127068604 * H1x3_4  +     0.71547134269459 * H1x3_5
          +     0.31051080747621 * H1x3_6 ;
   H2x1_3  = H2x1_3  +     0.84914297140244 * H1x3_1
          +     0.52803158023536 * H1x3_2  +    -1.39949725219783 * H1x3_3
          +     0.69603350257472 * H1x3_4  +    -0.99298091528215 * H1x3_5
          +      0.4901677948096 * H1x3_6 ;
   H2x1_4  = H2x1_4  +     1.25437670540229 * H1x3_1
          +     0.10767112672867 * H1x3_2  +     -2.4886577317349 * H1x3_3
          +    -1.19999974192227 * H1x3_4  +     2.65195856746166 * H1x3_5
          +    -0.35850032269696 * H1x3_6 ;
   H2x1_5  = H2x1_5  +    -0.18873569038601 * H1x3_1
          +    -0.05695497456875 * H1x3_2  +    -1.09169714101723 * H1x3_3
          +     0.66962829232535 * H1x3_4  +     0.68262583745167 * H1x3_5
          +     0.91538472149247 * H1x3_6 ;
   H2x1_1  = H2x1_1  +    -0.77701371575001 * H1x4_1
          +    -1.54239140939922 * H1x4_2  +    -0.26570372401877 * H1x4_3
          +     0.00097824237229 * H1x4_4  +     0.57921309289721 * H1x4_5
          +     1.46692133055956 * H1x4_6 ;
   H2x1_2  = H2x1_2  +     0.96564519202767 * H1x4_1
          +    -0.06466152110331 * H1x4_2  +    -0.66659637249467 * H1x4_3
          +     0.59673973270306 * H1x4_4  +     2.45492273841581 * H1x4_5
          +     -0.4804481967354 * H1x4_6 ;
   H2x1_3  = H2x1_3  +     0.75339074826799 * H1x4_1
          +     1.26373188682879 * H1x4_2  +     0.49419374749947 * H1x4_3
          +     1.26541916145956 * H1x4_4  +     0.10039190806961 * H1x4_5
          +    -0.79556185531974 * H1x4_6 ;
   H2x1_4  = H2x1_4  +    -0.28271287281925 * H1x4_1
          +      2.1208193298333 * H1x4_2  +    -0.65223420232343 * H1x4_3
          +     0.02666229497558 * H1x4_4  +     0.72865787458027 * H1x4_5
          +    -0.22377472142722 * H1x4_6 ;
   H2x1_5  = H2x1_5  +    -0.84067714042271 * H1x4_1
          +    -1.59141777016956 * H1x4_2  +     0.46077797807782 * H1x4_3
          +    -0.07031579794448 * H1x4_4  +     0.83754013895307 * H1x4_5
          +     0.49805259687865 * H1x4_6 ;
   H2x1_1  =     1.86496757154162 + H2x1_1 ;
   H2x1_2  =     0.46453634696909 + H2x1_2 ;
   H2x1_3  =     0.36165501609225 + H2x1_3 ;
   H2x1_4  =    -0.91790753889181 + H2x1_4 ;
   H2x1_5  =     2.82445131106489 + H2x1_5 ;
   H2x1_6  = 0;
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 , H2x1_5 , H2x1_6 );
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
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
   H2x1_5  = H2x1_5  / _SUM_;
   H2x1_6  = H2x1_6  / _SUM_;
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
   H2x2_1  =     0.06037434087051 * H1x1_1  +     2.10312669809986 * H1x1_2
          +     0.25966374544266 * H1x1_3  +     -0.4604625015482 * H1x1_4
          +    -0.04852853005798 * H1x1_5  +     1.73108900683337 * H1x1_6 ;
   H2x2_2  =    -1.98874787809729 * H1x1_1  +    -0.90575568783349 * H1x1_2
          +     2.19451885005981 * H1x1_3  +     0.86127175797091 * H1x1_4
          +     0.88302785384691 * H1x1_5  +     1.44831802939799 * H1x1_6 ;
   H2x2_3  =     0.99020573159855 * H1x1_1  +    -0.25509107111568 * H1x1_2
          +    -0.88380027397433 * H1x1_3  +     2.61444810707966 * H1x1_4
          +     1.12768553693881 * H1x1_5  +    -1.33423515707253 * H1x1_6 ;
   H2x2_4  =    -0.48971657670431 * H1x1_1  +    -2.03924441101145 * H1x1_2
          +    -0.44598954940675 * H1x1_3  +    -0.38296699607675 * H1x1_4
          +    -0.46829791763961 * H1x1_5  +     0.57571476480191 * H1x1_6 ;
   H2x2_5  =     1.15324249951205 * H1x1_1  +    -0.30656607959814 * H1x1_2
          +    -0.26327906953925 * H1x1_3  +    -0.30055126052518 * H1x1_4
          +     1.20108560127357 * H1x1_5  +    -2.01222927536337 * H1x1_6 ;
   H2x2_1  = H2x2_1  +     0.67714997403987 * H1x2_1
          +     0.58512699375084 * H1x2_2  +     0.82352577521669 * H1x2_3
          +    -0.10235751124142 * H1x2_4  +     0.33612939980192 * H1x2_5
          +    -0.86707973977777 * H1x2_6 ;
   H2x2_2  = H2x2_2  +     0.54358612690033 * H1x2_1
          +     0.85147893022911 * H1x2_2  +     0.19383313272548 * H1x2_3
          +     0.54163359333706 * H1x2_4  +    -0.12377705517298 * H1x2_5
          +     0.34775419906833 * H1x2_6 ;
   H2x2_3  = H2x2_3  +    -0.93107945276808 * H1x2_1
          +     0.68475936175775 * H1x2_2  +    -0.23180217492353 * H1x2_3
          +     0.62637113173904 * H1x2_4  +      -0.494489282403 * H1x2_5
          +    -0.92757761378206 * H1x2_6 ;
   H2x2_4  = H2x2_4  +    -0.04592275767761 * H1x2_1
          +    -0.46728046145973 * H1x2_2  +    -0.84120395772864 * H1x2_3
          +     0.15719249141893 * H1x2_4  +    -0.46514309972577 * H1x2_5
          +     1.22882033880531 * H1x2_6 ;
   H2x2_5  = H2x2_5  +     1.84159049843244 * H1x2_1
          +     0.10275783758743 * H1x2_2  +    -1.43072878385761 * H1x2_3
          +     0.55082995966416 * H1x2_4  +      0.6610129464186 * H1x2_5
          +     1.13665339513142 * H1x2_6 ;
   H2x2_1  = H2x2_1  +    -1.51032464504011 * H1x3_1
          +    -0.09256867451899 * H1x3_2  +     0.32445533867689 * H1x3_3
          +     0.05761597623645 * H1x3_4  +    -0.76755137543453 * H1x3_5
          +    -0.84355541605354 * H1x3_6 ;
   H2x2_2  = H2x2_2  +     0.10183122181912 * H1x3_1
          +    -0.30112412370797 * H1x3_2  +     0.67666605377075 * H1x3_3
          +    -0.05362728717558 * H1x3_4  +    -0.02087908172702 * H1x3_5
          +    -0.14832407235293 * H1x3_6 ;
   H2x2_3  = H2x2_3  +     1.70579601255161 * H1x3_1
          +     -0.4658368752668 * H1x3_2  +    -0.54573113497487 * H1x3_3
          +     1.13279034034213 * H1x3_4  +     1.23714589942258 * H1x3_5
          +     0.41209753590668 * H1x3_6 ;
   H2x2_4  = H2x2_4  +     0.21012073552633 * H1x3_1
          +      -1.607803967771 * H1x3_2  +     0.02641742148684 * H1x3_3
          +      -0.919177834124 * H1x3_4  +    -0.46658991803838 * H1x3_5
          +     0.05356295771962 * H1x3_6 ;
   H2x2_5  = H2x2_5  +     -1.1424376096243 * H1x3_1
          +    -0.47941730936597 * H1x3_2  +    -1.44857674506057 * H1x3_3
          +     -2.0300913051093 * H1x3_4  +    -0.12476620160938 * H1x3_5
          +      1.3865980084186 * H1x3_6 ;
   H2x2_1  = H2x2_1  +    -0.80277778579719 * H1x4_1
          +     0.89356845434924 * H1x4_2  +     1.34679856015636 * H1x4_3
          +    -0.75666255425893 * H1x4_4  +    -0.76982332990737 * H1x4_5
          +     0.16602366912489 * H1x4_6 ;
   H2x2_2  = H2x2_2  +    -1.23815292104545 * H1x4_1
          +     0.15726093177842 * H1x4_2  +     0.11603212859646 * H1x4_3
          +     0.38287343591011 * H1x4_4  +    -0.51333663927664 * H1x4_5
          +     -0.9577144624714 * H1x4_6 ;
   H2x2_3  = H2x2_3  +    -0.68480171858681 * H1x4_1
          +    -0.64475211431817 * H1x4_2  +     0.54382770716837 * H1x4_3
          +     0.07586519798399 * H1x4_4  +      -0.158352646931 * H1x4_5
          +    -0.86962851115528 * H1x4_6 ;
   H2x2_4  = H2x2_4  +     1.08721247219364 * H1x4_1
          +    -0.00199447585891 * H1x4_2  +    -0.84066724442019 * H1x4_3
          +     0.28532638217608 * H1x4_4  +    -1.14779513957631 * H1x4_5
          +     2.01216139921959 * H1x4_6 ;
   H2x2_5  = H2x2_5  +    -0.82582817846967 * H1x4_1
          +    -1.09057773595959 * H1x4_2  +     -0.2490905553905 * H1x4_3
          +     0.93092377717594 * H1x4_4  +     0.02946641402494 * H1x4_5
          +    -0.19026348436175 * H1x4_6 ;
   H2x2_1  =      0.4280804812723 + H2x2_1 ;
   H2x2_2  =    -1.09169904475569 + H2x2_2 ;
   H2x2_3  =      1.1980619484542 + H2x2_3 ;
   H2x2_4  =    -0.69756677248934 + H2x2_4 ;
   H2x2_5  =    -1.87910212660657 + H2x2_5 ;
   H2x2_6  = 0;
   _MAX_ = MAX (H2x2_1 , H2x2_2 , H2x2_3 , H2x2_4 , H2x2_5 , H2x2_6 );
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
   H2x2_1  = H2x2_1  / _SUM_;
   H2x2_2  = H2x2_2  / _SUM_;
   H2x2_3  = H2x2_3  / _SUM_;
   H2x2_4  = H2x2_4  / _SUM_;
   H2x2_5  = H2x2_5  / _SUM_;
   H2x2_6  = H2x2_6  / _SUM_;
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
*** Writing the Node H2x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x3_1  =     0.51206365204428 * H1x1_1  +    -1.75446248490807 * H1x1_2
          +     0.22956544269482 * H1x1_3  +     0.91651437630074 * H1x1_4
          +    -0.88731743590726 * H1x1_5  +     0.75959028005652 * H1x1_6 ;
   H2x3_2  =    -0.45196055100748 * H1x1_1  +    -0.30516535345407 * H1x1_2
          +    -0.95535662641329 * H1x1_3  +     0.98793241812876 * H1x1_4
          +    -2.26205386368521 * H1x1_5  +    -0.79989554227284 * H1x1_6 ;
   H2x3_3  =     1.75400558713364 * H1x1_1  +     0.36065784285286 * H1x1_2
          +    -0.26047606287884 * H1x1_3  +    -0.92639558885443 * H1x1_4
          +     1.89978202395282 * H1x1_5  +     1.46105111567983 * H1x1_6 ;
   H2x3_4  =     -1.0609986914691 * H1x1_1  +     1.03588259392678 * H1x1_2
          +     0.18751061078347 * H1x1_3  +     1.45467172411852 * H1x1_4
          +     0.80970691110797 * H1x1_5  +    -0.03142746343877 * H1x1_6 ;
   H2x3_5  =     0.68514959739435 * H1x1_1  +    -0.85703618516825 * H1x1_2
          +    -1.42641478008517 * H1x1_3  +     0.69128253039497 * H1x1_4
          +    -0.41103428804251 * H1x1_5  +     2.29818718782262 * H1x1_6 ;
   H2x3_1  = H2x3_1  +    -1.02124610786304 * H1x2_1
          +    -0.70086367508924 * H1x2_2  +     1.44543746222048 * H1x2_3
          +      0.0077115223216 * H1x2_4  +    -1.13603676440953 * H1x2_5
          +    -0.39006326539815 * H1x2_6 ;
   H2x3_2  = H2x3_2  +     0.58504868182178 * H1x2_1
          +    -2.53394647771808 * H1x2_2  +    -0.46920351111552 * H1x2_3
          +    -0.13298739365164 * H1x2_4  +    -0.72916785042807 * H1x2_5
          +     0.87575796008942 * H1x2_6 ;
   H2x3_3  = H2x3_3  +      -0.403068394175 * H1x2_1
          +     2.20341156440175 * H1x2_2  +     0.18637166393472 * H1x2_3
          +    -0.49818124689746 * H1x2_4  +    -0.57482220863202 * H1x2_5
          +    -0.99288712489296 * H1x2_6 ;
   H2x3_4  = H2x3_4  +    -0.08255075671356 * H1x2_1
          +     0.12417859340249 * H1x2_2  +     0.38623860203678 * H1x2_3
          +     1.30375188803419 * H1x2_4  +     0.06113655765155 * H1x2_5
          +     2.18684373678918 * H1x2_6 ;
   H2x3_5  = H2x3_5  +     0.02445507420447 * H1x2_1
          +     -1.1429834255353 * H1x2_2  +     1.15057813366971 * H1x2_3
          +     -0.7929157351984 * H1x2_4  +      0.4343084860458 * H1x2_5
          +      0.0384736341173 * H1x2_6 ;
   H2x3_1  = H2x3_1  +     0.37764572590016 * H1x3_1
          +     1.48191356825225 * H1x3_2  +    -0.26603273466393 * H1x3_3
          +    -1.29507822568105 * H1x3_4  +     1.84557717124725 * H1x3_5
          +    -0.65863037608331 * H1x3_6 ;
   H2x3_2  = H2x3_2  +    -3.49060338051306 * H1x3_1
          +      1.3541565382925 * H1x3_2  +    -0.38315198954693 * H1x3_3
          +    -2.08846010475603 * H1x3_4  +    -0.03268324043605 * H1x3_5
          +     -0.2732767866426 * H1x3_6 ;
   H2x3_3  = H2x3_3  +    -1.02108681113274 * H1x3_1
          +     1.11670732797487 * H1x3_2  +    -2.83817066251645 * H1x3_3
          +     2.91943649605743 * H1x3_4  +    -1.58666117886546 * H1x3_5
          +     0.95358246629929 * H1x3_6 ;
   H2x3_4  = H2x3_4  +    -0.28934138457604 * H1x3_1
          +     -0.1627562650927 * H1x3_2  +     1.76496399430623 * H1x3_3
          +     2.05776756058594 * H1x3_4  +    -0.96994650178001 * H1x3_5
          +    -1.50364154763084 * H1x3_6 ;
   H2x3_5  = H2x3_5  +    -0.73016276992619 * H1x3_1
          +    -1.48258849718818 * H1x3_2  +    -0.47908044807419 * H1x3_3
          +      0.5957671579209 * H1x3_4  +     0.06707833713085 * H1x3_5
          +      0.3673818114501 * H1x3_6 ;
   H2x3_1  = H2x3_1  +     1.64939881299916 * H1x4_1
          +     0.29057047745206 * H1x4_2  +     -1.2430356696985 * H1x4_3
          +     1.38895822896909 * H1x4_4  +     0.32263395713709 * H1x4_5
          +      -0.876005602164 * H1x4_6 ;
   H2x3_2  = H2x3_2  +    -0.59279077758901 * H1x4_1
          +     0.47534983861589 * H1x4_2  +     1.50522851379751 * H1x4_3
          +    -0.52074826438565 * H1x4_4  +    -0.13959571645898 * H1x4_5
          +     0.51236653129509 * H1x4_6 ;
   H2x3_3  = H2x3_3  +       0.170929264521 * H1x4_1
          +    -1.09768862147461 * H1x4_2  +    -1.22166369035864 * H1x4_3
          +    -0.43496041372082 * H1x4_4  +     0.86983484014566 * H1x4_5
          +     0.14855508666868 * H1x4_6 ;
   H2x3_4  = H2x3_4  +    -0.26703118340308 * H1x4_1
          +     0.58353167926887 * H1x4_2  +     1.39169479141155 * H1x4_3
          +     -0.7893707969296 * H1x4_4  +     0.89521873365477 * H1x4_5
          +     1.60853840268286 * H1x4_6 ;
   H2x3_5  = H2x3_5  +    -0.29353449181426 * H1x4_1
          +     0.02697197445995 * H1x4_2  +     0.04454970336296 * H1x4_3
          +    -0.17322488506489 * H1x4_4  +    -1.52564540234935 * H1x4_5
          +      0.6650692994568 * H1x4_6 ;
   H2x3_1  =    -0.44046998911725 + H2x3_1 ;
   H2x3_2  =     1.44590821330163 + H2x3_2 ;
   H2x3_3  =    -0.02671947857742 + H2x3_3 ;
   H2x3_4  =     2.16876314488082 + H2x3_4 ;
   H2x3_5  =    -1.06855161267989 + H2x3_5 ;
   H2x3_6  = 0;
   _MAX_ = MAX (H2x3_1 , H2x3_2 , H2x3_3 , H2x3_4 , H2x3_5 , H2x3_6 );
   _SUM_ = 0.;
   H2x3_1  = EXP(H2x3_1  - _MAX_);
   _SUM_ = _SUM_ + H2x3_1 ;
   H2x3_2  = EXP(H2x3_2  - _MAX_);
   _SUM_ = _SUM_ + H2x3_2 ;
   H2x3_3  = EXP(H2x3_3  - _MAX_);
   _SUM_ = _SUM_ + H2x3_3 ;
   H2x3_4  = EXP(H2x3_4  - _MAX_);
   _SUM_ = _SUM_ + H2x3_4 ;
   H2x3_5  = EXP(H2x3_5  - _MAX_);
   _SUM_ = _SUM_ + H2x3_5 ;
   H2x3_6  = EXP(H2x3_6  - _MAX_);
   _SUM_ = _SUM_ + H2x3_6 ;
   H2x3_1  = H2x3_1  / _SUM_;
   H2x3_2  = H2x3_2  / _SUM_;
   H2x3_3  = H2x3_3  / _SUM_;
   H2x3_4  = H2x3_4  / _SUM_;
   H2x3_5  = H2x3_5  / _SUM_;
   H2x3_6  = H2x3_6  / _SUM_;
END;
ELSE DO;
   H2x3_1  = .;
   H2x3_2  = .;
   H2x3_3  = .;
   H2x3_4  = .;
   H2x3_5  = .;
   H2x3_6  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     0.14821897068309 * H2x1_1  +     0.10105634438409 * H2x1_2
          +     0.69826499371673 * H2x1_3  +     1.65127139539807 * H2x1_4
          +     1.34699293376382 * H2x1_5  +     0.62066324264653 * H2x1_6 ;
   H3x1_2  =     -0.6760189094281 * H2x1_1  +     0.85348791240011 * H2x1_2
          +    -0.07663386217946 * H2x1_3  +     2.15467384269703 * H2x1_4
          +    -0.50699529916446 * H2x1_5  +     1.70699964755049 * H2x1_6 ;
   H3x1_3  =    -0.94311365048828 * H2x1_1  +    -0.69829528108975 * H2x1_2
          +    -0.34747616168009 * H2x1_3  +     2.32941170908743 * H2x1_4
          +     3.71768144878584 * H2x1_5  +    -0.60932405988373 * H2x1_6 ;
   H3x1_4  =     1.69107510526388 * H2x1_1  +    -1.40350955348413 * H2x1_2
          +    -0.47901844016365 * H2x1_3  +      0.3540542650553 * H2x1_4
          +    -1.56597514252687 * H2x1_5  +    -0.04997148078498 * H2x1_6 ;
   H3x1_5  =    -0.23167181678539 * H2x1_1  +    -0.65942738658946 * H2x1_2
          +    -0.83280103611578 * H2x1_3  +    -1.03301865685228 * H2x1_4
          +      1.3401316289209 * H2x1_5  +    -1.98639459325872 * H2x1_6 ;
   H3x1_1  = H3x1_1  +    -1.96226306174896 * H2x2_1
          +     1.03065434267907 * H2x2_2  +    -0.02977552697407 * H2x2_3
          +    -2.15633683205343 * H2x2_4  +    -0.16172049876123 * H2x2_5
          +     2.04617275364668 * H2x2_6 ;
   H3x1_2  = H3x1_2  +     0.98825486325651 * H2x2_1
          +    -0.45791784632486 * H2x2_2  +     -0.1004093258308 * H2x2_3
          +     -0.9411693729369 * H2x2_4  +     -0.2302105458948 * H2x2_5
          +    -0.37660795680674 * H2x2_6 ;
   H3x1_3  = H3x1_3  +    -0.01929245635771 * H2x2_1
          +     0.59176660505983 * H2x2_2  +     0.85345798669405 * H2x2_3
          +    -0.29251716908915 * H2x2_4  +     0.62774918208489 * H2x2_5
          +    -0.43453791992382 * H2x2_6 ;
   H3x1_4  = H3x1_4  +    -0.93313067901041 * H2x2_1
          +     0.79407052404273 * H2x2_2  +     1.63518575530242 * H2x2_3
          +     1.19368615452563 * H2x2_4  +     0.43365061793519 * H2x2_5
          +    -3.30381142208727 * H2x2_6 ;
   H3x1_5  = H3x1_5  +      0.2721747886066 * H2x2_1
          +     0.29405186941774 * H2x2_2  +    -0.96425253045194 * H2x2_3
          +    -0.34879018216113 * H2x2_4  +    -1.15330072605073 * H2x2_5
          +    -0.34019675397366 * H2x2_6 ;
   H3x1_1  = H3x1_1  +     0.99938924001809 * H2x3_1
          +    -0.28559857879809 * H2x3_2  +    -0.44648183712004 * H2x3_3
          +    -0.23199698060307 * H2x3_4  +    -0.64346521755351 * H2x3_5
          +     0.59340663088806 * H2x3_6 ;
   H3x1_2  = H3x1_2  +     1.61767718200144 * H2x3_1
          +     0.59417860044733 * H2x3_2  +      1.9323992067722 * H2x3_3
          +    -1.38224816012152 * H2x3_4  +    -2.04529937075447 * H2x3_5
          +     0.67050797164115 * H2x3_6 ;
   H3x1_3  = H3x1_3  +    -0.69807909205706 * H2x3_1
          +    -0.57895843216341 * H2x3_2  +    -0.16766418785512 * H2x3_3
          +     0.40654327615846 * H2x3_4  +    -1.86698682195337 * H2x3_5
          +    -0.51274988768251 * H2x3_6 ;
   H3x1_4  = H3x1_4  +     0.48560830435522 * H2x3_1
          +     -2.8037598804912 * H2x3_2  +    -0.30231415756008 * H2x3_3
          +     2.41159952574381 * H2x3_4  +     0.62877424154604 * H2x3_5
          +    -0.73773727947747 * H2x3_6 ;
   H3x1_5  = H3x1_5  +    -0.87089276878422 * H2x3_1
          +    -0.78003140915024 * H2x3_2  +    -1.46975503560585 * H2x3_3
          +     1.87460778751879 * H2x3_4  +    -0.09219359612439 * H2x3_5
          +    -1.07137645697526 * H2x3_6 ;
   H3x1_1  =    -0.24118737469276 + H3x1_1 ;
   H3x1_2  =     0.26844205496356 + H3x1_2 ;
   H3x1_3  =      1.6092325807607 + H3x1_3 ;
   H3x1_4  =     0.55904829903808 + H3x1_4 ;
   H3x1_5  =     1.39880629138148 + H3x1_5 ;
   H3x1_6  = 0;
   _MAX_ = MAX (H3x1_1 , H3x1_2 , H3x1_3 , H3x1_4 , H3x1_5 , H3x1_6 );
   _SUM_ = 0.;
   H3x1_1  = EXP(H3x1_1  - _MAX_);
   _SUM_ = _SUM_ + H3x1_1 ;
   H3x1_2  = EXP(H3x1_2  - _MAX_);
   _SUM_ = _SUM_ + H3x1_2 ;
   H3x1_3  = EXP(H3x1_3  - _MAX_);
   _SUM_ = _SUM_ + H3x1_3 ;
   H3x1_4  = EXP(H3x1_4  - _MAX_);
   _SUM_ = _SUM_ + H3x1_4 ;
   H3x1_5  = EXP(H3x1_5  - _MAX_);
   _SUM_ = _SUM_ + H3x1_5 ;
   H3x1_6  = EXP(H3x1_6  - _MAX_);
   _SUM_ = _SUM_ + H3x1_6 ;
   H3x1_1  = H3x1_1  / _SUM_;
   H3x1_2  = H3x1_2  / _SUM_;
   H3x1_3  = H3x1_3  / _SUM_;
   H3x1_4  = H3x1_4  / _SUM_;
   H3x1_5  = H3x1_5  / _SUM_;
   H3x1_6  = H3x1_6  / _SUM_;
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
*** Writing the Node H3x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x2_1  =     0.13469056275633 * H2x1_1  +    -1.31570873196603 * H2x1_2
          +    -0.83004507775706 * H2x1_3  +     1.14954585467995 * H2x1_4
          +     0.01234753333089 * H2x1_5  +     0.50683843245151 * H2x1_6 ;
   H3x2_2  =     2.58620633866114 * H2x1_1  +     0.37629863890202 * H2x1_2
          +     0.34169762900278 * H2x1_3  +     1.24247313002596 * H2x1_4
          +     -0.1965463932822 * H2x1_5  +    -0.00458488228083 * H2x1_6 ;
   H3x2_3  =    -2.01883694738218 * H2x1_1  +     0.83782353926562 * H2x1_2
          +    -1.95119268200972 * H2x1_3  +    -1.04826190833003 * H2x1_4
          +     1.66733023346498 * H2x1_5  +     0.23483419363088 * H2x1_6 ;
   H3x2_4  =     0.40678642111393 * H2x1_1  +    -0.10557612663286 * H2x1_2
          +    -0.34694532874387 * H2x1_3  +     -1.6967916788772 * H2x1_4
          +     0.24026556349373 * H2x1_5  +    -0.69393637888423 * H2x1_6 ;
   H3x2_5  =    -1.48304630985783 * H2x1_1  +     0.87426655970556 * H2x1_2
          +    -0.49899516599841 * H2x1_3  +    -1.94880978312007 * H2x1_4
          +    -2.45275015055877 * H2x1_5  +    -0.03264500335093 * H2x1_6 ;
   H3x2_1  = H3x2_1  +    -0.40915299509566 * H2x2_1
          +     1.45952180668254 * H2x2_2  +     0.42420517277224 * H2x2_3
          +    -0.79379446044158 * H2x2_4  +     0.73614212418439 * H2x2_5
          +     -0.6527392657117 * H2x2_6 ;
   H3x2_2  = H3x2_2  +    -1.62752321860626 * H2x2_1
          +    -0.04689831325067 * H2x2_2  +    -2.87951125721119 * H2x2_3
          +    -0.36181303609331 * H2x2_4  +     0.55999175715209 * H2x2_5
          +    -0.40911363767301 * H2x2_6 ;
   H3x2_3  = H3x2_3  +     0.50766404641726 * H2x2_1
          +     0.02747397544049 * H2x2_2  +    -1.35626517144826 * H2x2_3
          +     0.23390260329386 * H2x2_4  +     -0.5025118845527 * H2x2_5
          +    -1.14035867434772 * H2x2_6 ;
   H3x2_4  = H3x2_4  +     0.64958154360038 * H2x2_1
          +     1.68671947742627 * H2x2_2  +    -0.42417215632785 * H2x2_3
          +    -0.39675884102374 * H2x2_4  +     1.98354732887496 * H2x2_5
          +    -1.32783167695801 * H2x2_6 ;
   H3x2_5  = H3x2_5  +     1.92075053147101 * H2x2_1
          +     1.22293096034837 * H2x2_2  +    -0.74039853818796 * H2x2_3
          +    -0.25033258903105 * H2x2_4  +     0.63358340091733 * H2x2_5
          +     0.17488501957475 * H2x2_6 ;
   H3x2_1  = H3x2_1  +     0.88292932547634 * H2x3_1
          +    -0.27631908402136 * H2x3_2  +     0.93133699792762 * H2x3_3
          +     1.18769264917434 * H2x3_4  +    -0.88901652244884 * H2x3_5
          +    -0.17544617255869 * H2x3_6 ;
   H3x2_2  = H3x2_2  +     0.71538502917742 * H2x3_1
          +    -0.76848695288598 * H2x3_2  +     1.24503864708272 * H2x3_3
          +    -0.93962158881999 * H2x3_4  +    -0.43383001812557 * H2x3_5
          +     1.14672043219259 * H2x3_6 ;
   H3x2_3  = H3x2_3  +    -0.39933331346344 * H2x3_1
          +      0.0019862182661 * H2x3_2  +    -0.60479718136768 * H2x3_3
          +      1.3818804125218 * H2x3_4  +     0.13498986352108 * H2x3_5
          +     1.02889511152823 * H2x3_6 ;
   H3x2_4  = H3x2_4  +    -1.24198502624302 * H2x3_1
          +    -0.09061963757116 * H2x3_2  +    -0.70229381972412 * H2x3_3
          +    -1.43988785716026 * H2x3_4  +     0.45188902401215 * H2x3_5
          +     0.10073869982371 * H2x3_6 ;
   H3x2_5  = H3x2_5  +     0.13815223958312 * H2x3_1
          +     0.38392032129472 * H2x3_2  +    -0.08374178846724 * H2x3_3
          +     0.39613433726611 * H2x3_4  +     1.64049322745471 * H2x3_5
          +     0.97496084656174 * H2x3_6 ;
   H3x2_1  =    -0.72845954974251 + H3x2_1 ;
   H3x2_2  =     0.59148824718722 + H3x2_2 ;
   H3x2_3  =     1.28031731320103 + H3x2_3 ;
   H3x2_4  =    -0.11427038364635 + H3x2_4 ;
   H3x2_5  =    -0.28699725292326 + H3x2_5 ;
   H3x2_6  = 0;
   _MAX_ = MAX (H3x2_1 , H3x2_2 , H3x2_3 , H3x2_4 , H3x2_5 , H3x2_6 );
   _SUM_ = 0.;
   H3x2_1  = EXP(H3x2_1  - _MAX_);
   _SUM_ = _SUM_ + H3x2_1 ;
   H3x2_2  = EXP(H3x2_2  - _MAX_);
   _SUM_ = _SUM_ + H3x2_2 ;
   H3x2_3  = EXP(H3x2_3  - _MAX_);
   _SUM_ = _SUM_ + H3x2_3 ;
   H3x2_4  = EXP(H3x2_4  - _MAX_);
   _SUM_ = _SUM_ + H3x2_4 ;
   H3x2_5  = EXP(H3x2_5  - _MAX_);
   _SUM_ = _SUM_ + H3x2_5 ;
   H3x2_6  = EXP(H3x2_6  - _MAX_);
   _SUM_ = _SUM_ + H3x2_6 ;
   H3x2_1  = H3x2_1  / _SUM_;
   H3x2_2  = H3x2_2  / _SUM_;
   H3x2_3  = H3x2_3  / _SUM_;
   H3x2_4  = H3x2_4  / _SUM_;
   H3x2_5  = H3x2_5  / _SUM_;
   H3x2_6  = H3x2_6  / _SUM_;
END;
ELSE DO;
   H3x2_1  = .;
   H3x2_2  = .;
   H3x2_3  = .;
   H3x2_4  = .;
   H3x2_5  = .;
   H3x2_6  = .;
END;
*** *************************;
*** Writing the Node H4x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H4x1_1  =     0.10986960182278 * H3x1_1  +    -0.10835805909937 * H3x1_2
          +     1.78643376838566 * H3x1_3  +    -0.00067995179919 * H3x1_4
          +     2.04711620528782 * H3x1_5  +    -0.66853997603718 * H3x1_6 ;
   H4x1_2  =    -0.17187141657369 * H3x1_1  +    -1.56897037747293 * H3x1_2
          +    -1.38330818097338 * H3x1_3  +     3.94629669251083 * H3x1_4
          +    -0.57201557221624 * H3x1_5  +     0.99276034828548 * H3x1_6 ;
   H4x1_3  =      1.5223304212488 * H3x1_1  +    -0.33490912702371 * H3x1_2
          +    -0.30324493540575 * H3x1_3  +    -1.23990036921669 * H3x1_4
          +     0.77489370055267 * H3x1_5  +    -0.38609823936674 * H3x1_6 ;
   H4x1_4  =    -0.75234452297837 * H3x1_1  +      1.1117782900703 * H3x1_2
          +      1.0171911341496 * H3x1_3  +     2.31462824862723 * H3x1_4
          +     1.05562639649812 * H3x1_5  +    -0.80603399686936 * H3x1_6 ;
   H4x1_5  =    -0.35441774309359 * H3x1_1  +     0.37408435161205 * H3x1_2
          +    -0.79287886005891 * H3x1_3  +    -0.89695291885453 * H3x1_4
          +     0.46220429367054 * H3x1_5  +    -1.56166867584216 * H3x1_6 ;
   H4x1_1  = H4x1_1  +    -1.12622282402713 * H3x2_1
          +     2.43865739917959 * H3x2_2  +     1.62534005409988 * H3x2_3
          +     0.83506165677151 * H3x2_4  +    -0.15894659563972 * H3x2_5
          +     0.77216806897502 * H3x2_6 ;
   H4x1_2  = H4x1_2  +     0.96736353410956 * H3x2_1
          +      1.6250281874285 * H3x2_2  +    -0.81418318229631 * H3x2_3
          +     0.35282111325987 * H3x2_4  +     0.11187473980261 * H3x2_5
          +     0.73971378600397 * H3x2_6 ;
   H4x1_3  = H4x1_3  +    -0.30588247178582 * H3x2_1
          +     0.22302184288326 * H3x2_2  +    -0.15797620108073 * H3x2_3
          +     1.18515955770896 * H3x2_4  +     0.43359240886537 * H3x2_5
          +     0.90907054011344 * H3x2_6 ;
   H4x1_4  = H4x1_4  +    -0.26678025657796 * H3x2_1
          +    -0.23171152283695 * H3x2_2  +    -0.72882061581264 * H3x2_3
          +     0.68597418643333 * H3x2_4  +      0.6559090638639 * H3x2_5
          +     0.95412028439169 * H3x2_6 ;
   H4x1_5  = H4x1_5  +    -0.77875602324955 * H3x2_1
          +     -1.5646810153964 * H3x2_2  +    -0.53157591270506 * H3x2_3
          +    -0.27917864191674 * H3x2_4  +    -1.10966192483404 * H3x2_5
          +     -0.0058627670025 * H3x2_6 ;
   H4x1_1  =     0.87937070574208 + H4x1_1 ;
   H4x1_2  =     0.75203729660648 + H4x1_2 ;
   H4x1_3  =     1.14889100908291 + H4x1_3 ;
   H4x1_4  =    -1.71383624276913 + H4x1_4 ;
   H4x1_5  =     0.22194774900585 + H4x1_5 ;
   H4x1_6  = 0;
   _MAX_ = MAX (H4x1_1 , H4x1_2 , H4x1_3 , H4x1_4 , H4x1_5 , H4x1_6 );
   _SUM_ = 0.;
   H4x1_1  = EXP(H4x1_1  - _MAX_);
   _SUM_ = _SUM_ + H4x1_1 ;
   H4x1_2  = EXP(H4x1_2  - _MAX_);
   _SUM_ = _SUM_ + H4x1_2 ;
   H4x1_3  = EXP(H4x1_3  - _MAX_);
   _SUM_ = _SUM_ + H4x1_3 ;
   H4x1_4  = EXP(H4x1_4  - _MAX_);
   _SUM_ = _SUM_ + H4x1_4 ;
   H4x1_5  = EXP(H4x1_5  - _MAX_);
   _SUM_ = _SUM_ + H4x1_5 ;
   H4x1_6  = EXP(H4x1_6  - _MAX_);
   _SUM_ = _SUM_ + H4x1_6 ;
   H4x1_1  = H4x1_1  / _SUM_;
   H4x1_2  = H4x1_2  / _SUM_;
   H4x1_3  = H4x1_3  / _SUM_;
   H4x1_4  = H4x1_4  / _SUM_;
   H4x1_5  = H4x1_5  / _SUM_;
   H4x1_6  = H4x1_6  / _SUM_;
END;
ELSE DO;
   H4x1_1  = .;
   H4x1_2  = .;
   H4x1_3  = .;
   H4x1_4  = .;
   H4x1_5  = .;
   H4x1_6  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;

*** Generate dummy variables for DepVar ;
drop DepVar1 DepVar0 ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   DepVar1 = .;
   DepVar0 = .;
end;
else do;
   if F_DepVar = '0'  then do;
      DepVar1 = 0;
      DepVar0 = 1;
   end;
   else if F_DepVar = '1'  then do;
      DepVar1 = 1;
      DepVar0 = 0;
   end;
   else do;
      DepVar1 = .;
      DepVar0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -5.30721919155126 * H4x1_1  +     10.4301477552223 * H4x1_2
          +    -3.40676330075486 * H4x1_3  +     0.07452634039202 * H4x1_4
          +    -2.90585821687293 * H4x1_5  +    -2.63321710569292 * H4x1_6 ;
   P_DepVar1  =    -2.93956196427421 + P_DepVar1 ;
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
*** *****************************;
*** Writing the Residuals  of the Node DepVar ;
*** ******************************;
IF MISSING( DepVar1 ) THEN R_DepVar1  = . ;
ELSE R_DepVar1  = DepVar1  - P_DepVar1 ;
IF MISSING( DepVar0 ) THEN R_DepVar0  = . ;
ELSE R_DepVar0  = DepVar0  - P_DepVar0 ;
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
* Ensmbl8: Scoring Code of model 3 of 3;
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
      F_DepVar  $ 12
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

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

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   MntGoldProds ,
   MntMeatProducts ,
   MntWines ,
   NumDistPurchases ,
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
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
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
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
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
   H11  =     0.40839920245437 * S_AcceptedCmpTotal  +    -0.80301052154323 *
        S_Frq  +     0.19839975683497 * S_Income  +    -0.71099382445924 *
        S_Mnt  +    -0.15644638799226 * S_MntGoldProds
          +    -0.05910355740416 * S_MntMeatProducts
          +     0.23095157103241 * S_MntWines  +     0.67840217585411 *
        S_NumDistPurchases  +     0.12536920827324 * S_RFMstat
          +    -0.27246125863137 * S_RMntFrq  +    -1.02114645988925 *
        S_Recency ;
   H12  =    -0.09503041118006 * S_AcceptedCmpTotal  +     0.74672296647411 *
        S_Frq  +     1.82688988564051 * S_Income  +    -0.06831964209279 *
        S_Mnt  +    -0.13330887266177 * S_MntGoldProds
          +     0.09400377526937 * S_MntMeatProducts
          +    -0.53358910675611 * S_MntWines  +     0.13886503925085 *
        S_NumDistPurchases  +     0.02243224025219 * S_RFMstat
          +    -0.03110171961938 * S_RMntFrq  +     0.39055670382948 *
        S_Recency ;
   H13  =    -0.07144509122078 * S_AcceptedCmpTotal  +     0.65325962599673 *
        S_Frq  +     0.03169199805286 * S_Income  +     0.53573115818994 *
        S_Mnt  +     0.13372718478424 * S_MntGoldProds
          +    -1.62740823190029 * S_MntMeatProducts
          +     0.15642273844597 * S_MntWines  +    -0.78908066213044 *
        S_NumDistPurchases  +     -0.4365555360753 * S_RFMstat
          +    -0.63552932650743 * S_RMntFrq  +     0.17699292292485 *
        S_Recency ;
   H14  =     0.03098188354318 * S_AcceptedCmpTotal  +    -0.04737735825642 *
        S_Frq  +     0.30967861276694 * S_Income  +    -0.03786683388502 *
        S_Mnt  +     0.25532115520236 * S_MntGoldProds
          +      0.3965117290354 * S_MntMeatProducts
          +     0.36188945634536 * S_MntWines  +    -0.24664355133344 *
        S_NumDistPurchases  +     0.15627885374544 * S_RFMstat
          +    -0.10763737759383 * S_RMntFrq  +     -0.4091862538023 *
        S_Recency ;
   H15  =     0.27467896926965 * S_AcceptedCmpTotal  +    -1.33897347254907 *
        S_Frq  +    -0.08574739739253 * S_Income  +    -0.68536026344277 *
        S_Mnt  +     0.08729572232071 * S_MntGoldProds
          +     1.44231431118379 * S_MntMeatProducts
          +    -0.09322237385561 * S_MntWines  +      1.5568901785563 *
        S_NumDistPurchases  +     0.06237505409693 * S_RFMstat
          +    -1.04636887800306 * S_RMntFrq  +    -0.38411527089703 *
        S_Recency ;
   H16  =    -0.89143353938241 * S_AcceptedCmpTotal  +     0.45211708970504 *
        S_Frq  +    -0.44897699945178 * S_Income  +    -0.32314426452158 *
        S_Mnt  +    -0.32329530597419 * S_MntGoldProds
          +    -0.44244305964257 * S_MntMeatProducts
          +    -0.04171589876809 * S_MntWines  +     0.42122451368745 *
        S_NumDistPurchases  +    -0.15802898075961 * S_RFMstat
          +    -0.40329155853226 * S_RMntFrq  +    -0.65176917675454 *
        S_Recency ;
   H11  = H11  +     0.01448447530274 * G_Marital_Status0
          +     0.42194179998625 * G_Marital_Status1 ;
   H12  = H12  +     0.12689198218881 * G_Marital_Status0
          +     0.13222809503301 * G_Marital_Status1 ;
   H13  = H13  +     0.02279524261833 * G_Marital_Status0
          +     0.22562672580832 * G_Marital_Status1 ;
   H14  = H14  +     1.11856448462308 * G_Marital_Status0
          +     0.27730078918446 * G_Marital_Status1 ;
   H15  = H15  +    -0.04694745686684 * G_Marital_Status0
          +     0.25879365732348 * G_Marital_Status1 ;
   H16  = H16  +    -0.22835702249634 * G_Marital_Status0
          +     0.18090765090711 * G_Marital_Status1 ;
   H11  =     1.23863858658783 + H11 ;
   H12  =    -0.12218156586843 + H12 ;
   H13  =    -1.28170837349164 + H13 ;
   H14  =    -2.07579206307318 + H14 ;
   H15  =    -0.99934113480463 + H15 ;
   H16  =     1.30250382782737 + H16 ;
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

*** Generate dummy variables for DepVar ;
drop DepVar1 DepVar0 ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   DepVar1 = .;
   DepVar0 = .;
end;
else do;
   if F_DepVar = '0'  then do;
      DepVar1 = 0;
      DepVar0 = 1;
   end;
   else if F_DepVar = '1'  then do;
      DepVar1 = 1;
      DepVar0 = 0;
   end;
   else do;
      DepVar1 = .;
      DepVar0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     3.62046962800706 * H11  +      -1.860875673098 * H12
          +    -3.65105027155196 * H13  +     2.14381074770309 * H14
          +     3.35729012959095 * H15  +    -2.46245459087361 * H16 ;
   P_DepVar1  =    -2.50510283018473 + P_DepVar1 ;
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
*** *****************************;
*** Writing the Residuals  of the Node DepVar ;
*** ******************************;
IF MISSING( DepVar1 ) THEN R_DepVar1  = . ;
ELSE R_DepVar1  = DepVar1  - P_DepVar1 ;
IF MISSING( DepVar0 ) THEN R_DepVar0  = . ;
ELSE R_DepVar0  = DepVar0  - P_DepVar0 ;
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
* Ensmbl8: Average Posteriors of 3 models;
*------------------------------------------------------------*;
P_DepVar1 = (
AutoNeural33_P_DepVar1 +
AutoNeural28_P_DepVar1 +
Neural28_P_DepVar1
)/3;
P_DepVar0 = (
AutoNeural33_P_DepVar0 +
AutoNeural28_P_DepVar0 +
Neural28_P_DepVar0
)/3;
*------------------------------------------------------------*;
* Ensmbl8: Computing Classification Vars;
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
* Ensmbl8: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl8: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL33_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL33_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL33_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL33_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL28_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL28_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL28_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL28_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL28_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL28_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL28_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL28_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl8: Computing Residual Vars;
*------------------------------------------------------------*;
if
F_DepVar NE '1'
AND F_DepVar NE '0'
then do;
R_DepVar1 = .;
R_DepVar0 = .;
end;
else do;
R_DepVar1 = -P_DepVar1;
R_DepVar0 = -P_DepVar0;
SELECT(F_DepVar);
WHEN('1') R_DepVar1 = R_DepVar1 +1;
WHEN('0') R_DepVar0 = R_DepVar0 +1;
OTHERWISE;
END;
END;
