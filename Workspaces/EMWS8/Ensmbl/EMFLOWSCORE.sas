*------------------------------------------------------------*;
* Ensmbl: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl: Scoring Code of model 1 of 6;
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

  RMntFrq=Mnt/Frq;

  HigherEducation=1*(upcase(Gender) in ("GRADUATION","MASTER","PHD"));

   Age = year(today())-Year_Birth;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;
RMntFrq_Exmpl2 =Mnt / Frq ;
Age_Exmpl2 =year(today())-Year_Birth ;
MonthsAsCustomer =int((today()-Dt_Customer)/12) ;
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
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REGDRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REGDRU[2]  _TEMPORARY_ (1 0);

*** Generate dummy variables for DepVar ;
drop _Y ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   _Y = .;
end;
else do;
   if F_DepVar = '0'  then do;
      _Y = 1;
   end;
   else if F_DepVar = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

drop _DM_BAD;
_DM_BAD=0;

*** Check Clothes for missing values ;
if missing( Clothes ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check Mnt for missing values ;
if missing( Mnt ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for Dependents ;
drop _1_0 ;
if missing( Dependents ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Dependents , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      _1_0 = -1;
   end;
   else if _dm12 = '0'  then do;
      _1_0 = 1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.0698957695;
   _P1 = 0.9301042305;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: Clothes ;
_TEMP = Clothes ;
_LP0 = _LP0 + (     0.0253441915771 * _TEMP);

***  Effect: Dependents ;
_TEMP = 1;
_LP0 = _LP0 + (    0.34053973691862) * _TEMP * _1_0;

***  Effect: Mnt ;
_TEMP = Mnt ;
_LP0 = _LP0 + (     0.0024610059763 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -6.95725510695235 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REGDR1:

*** Residuals;
if (_Y = .) then do;
   R_DepVar1 = .;
   R_DepVar0 = .;
end;
else do;
    label R_DepVar1 = 'Residual: DepVar=1' ;
    label R_DepVar0 = 'Residual: DepVar=0' ;
   R_DepVar1 = - _P0;
   R_DepVar0 = - _P1;
   select( _Y );
      when (0)  R_DepVar1 = R_DepVar1 + 1;
      when (1)  R_DepVar0 = R_DepVar0 + 1;
   end;
end;

*** Posterior Probabilities and Predicted Level;
label P_DepVar1 = 'Predicted: DepVar=1' ;
label P_DepVar0 = 'Predicted: DepVar=0' ;
P_DepVar1 = _P0;
_MAXP = _P0;
_IY = 1;
P_DepVar0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_DepVar = REGDRF[_IY];
U_DepVar = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
* Renaming variables for Reg;
*------------------------------------------------------------*;
* Renaming Posterior variables for Reg;
*------------------------------------------------------------*;
drop Reg_P_DepVar1;
Reg_P_DepVar1 = P_DepVar1;
drop Reg_P_DepVar0;
Reg_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Reg;
*------------------------------------------------------------*;
length Reg_WARN_ $4;
drop Reg_WARN_;
Reg_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl: Scoring Code of model 2 of 6;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Decision Tree;
* TYPE: MODEL;
* NODE: Tree;
*------------------------------------------------------------*;
****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_DepVar  $   12;
LENGTH I_DepVar  $   12;
LENGTH _WARN_  $    4;

******              LABELS FOR NEW VARIABLES              ******;
LABEL _NODE_  = 'Node' ;
LABEL _LEAF_  = 'Leaf' ;
LABEL P_DepVar0  = 'Predicted: DepVar=0' ;
LABEL P_DepVar1  = 'Predicted: DepVar=1' ;
LABEL Q_DepVar0  = 'Unadjusted P: DepVar=0' ;
LABEL Q_DepVar1  = 'Unadjusted P: DepVar=1' ;
LABEL V_DepVar0  = 'Validated: DepVar=0' ;
LABEL V_DepVar1  = 'Validated: DepVar=1' ;
LABEL R_DepVar0  = 'Residual: DepVar=0' ;
LABEL R_DepVar1  = 'Residual: DepVar=1' ;
LABEL F_DepVar  = 'From: DepVar' ;
LABEL I_DepVar  = 'Into: DepVar' ;
LABEL U_DepVar  = 'Unnormalized Into: DepVar' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( DepVar , BEST.);
 %DMNORMCP( _ARBFMT_12, F_DepVar );

******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(Mnt ) AND
               1603.16 <= Mnt  THEN DO;
  IF  NOT MISSING(Mnt ) AND
                 2348.84 <= Mnt  THEN DO;
    IF  NOT MISSING(HouseKeeping ) AND
      HouseKeeping  <                  3.5 THEN DO;
      _NODE_  =                   10;
      _LEAF_  =                    3;
      P_DepVar0  =               0.0625;
      P_DepVar1  =               0.9375;
      Q_DepVar0  =               0.0625;
      Q_DepVar1  =               0.9375;
      V_DepVar0  =                    0;
      V_DepVar1  =                    1;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(Rcn ) AND
        Rcn  <                 61.5 THEN DO;
        _NODE_  =                   14;
        _LEAF_  =                    4;
        P_DepVar0  =                    1;
        P_DepVar1  =                    0;
        Q_DepVar0  =                    1;
        Q_DepVar1  =                    0;
        V_DepVar0  =     0.66666666666666;
        V_DepVar1  =     0.33333333333333;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   15;
        _LEAF_  =                    5;
        P_DepVar0  =                 0.25;
        P_DepVar1  =                 0.75;
        Q_DepVar0  =                 0.25;
        Q_DepVar1  =                 0.75;
        V_DepVar0  =                    0;
        V_DepVar1  =                    1;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      END;
    END;
  ELSE DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
    P_DepVar0  =     0.67272727272727;
    P_DepVar1  =     0.32727272727272;
    Q_DepVar0  =     0.67272727272727;
    Q_DepVar1  =     0.32727272727272;
    V_DepVar0  =     0.73239436619718;
    V_DepVar1  =     0.26760563380281;
    I_DepVar  = '0' ;
    U_DepVar  =                    0;
    END;
  END;
ELSE DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_DepVar0  =     0.97487787857641;
  P_DepVar1  =     0.02512212142358;
  Q_DepVar0  =     0.97487787857641;
  Q_DepVar1  =     0.02512212142358;
  V_DepVar0  =     0.96290322580645;
  V_DepVar1  =     0.03709677419354;
  I_DepVar  = '0' ;
  U_DepVar  =                    0;
  END;

*****  RESIDUALS R_ *************;
IF  F_DepVar  NE '0'
AND F_DepVar  NE '1'  THEN DO;
        R_DepVar0  = .;
        R_DepVar1  = .;
 END;
 ELSE DO;
       R_DepVar0  =  -P_DepVar0 ;
       R_DepVar1  =  -P_DepVar1 ;
       SELECT( F_DepVar  );
          WHEN( '0'  ) R_DepVar0  = R_DepVar0  +1;
          WHEN( '1'  ) R_DepVar1  = R_DepVar1  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
drop _LEAF_;
* Renaming variables for Tree;
*------------------------------------------------------------*;
* Renaming Posterior variables for Tree;
*------------------------------------------------------------*;
drop Tree_P_DepVar1;
Tree_P_DepVar1 = P_DepVar1;
drop Tree_P_DepVar0;
Tree_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Tree;
*------------------------------------------------------------*;
length Tree_WARN_ $4;
drop Tree_WARN_;
Tree_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl: Scoring Code of model 3 of 6;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural4;
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
      label S_CatPurchase = 'Standard: CatPurchase' ;

      label S_Clothes = 'Standard: Clothes' ;

      label S_HouseKeeping = 'Standard: HouseKeeping' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_Rcn = 'Standard: Rcn' ;

      label S_Recomendation = 'Standard: Recomendation' ;

      label S_SmallAppliances = 'Standard: SmallAppliances' ;

      label S_Toys = 'Standard: Toys' ;

      label Dependents0 = 'Dummy: Dependents=0' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Dependents ;
drop Dependents0 ;
if missing( Dependents ) then do;
   Dependents0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Dependents , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      Dependents0 = -1;
   end;
   else if _dm12 = '0'  then do;
      Dependents0 = 1;
   end;
   else do;
      Dependents0 = .;
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
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Marital_Status , $12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= 'SINGLE'  then do;
      if _dm12 <= 'MARRIED'  then do;
         if _dm12 = 'DIVORCED'  then do;
            Marital_StatusDivorced = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = 'MARRIED'  then do;
               Marital_StatusMarried = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = 'SINGLE'  then do;
            Marital_StatusSingle = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = 'TOGETHER'  then do;
         Marital_StatusTogether = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = 'WIDOW'  then do;
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
   CatPurchase ,
   Clothes ,
   HouseKeeping ,
   Mnt ,
   Rcn ,
   Recomendation ,
   SmallAppliances ,
   Toys   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 * CatPurchase
         ;
   S_Clothes  =     -2.3113689693832 +     0.04437092805094 * Clothes ;
   S_HouseKeeping  =    -0.93443662367683 +     0.14435178378641 *
        HouseKeeping ;
   S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
   S_Recomendation  =    -3.46611377322712 +     0.87281636006383 *
        Recomendation ;
   S_SmallAppliances  =    -2.26667909624218 +     0.07979093963203 *
        SmallAppliances ;
   S_Toys  =    -0.95465683239199 +     0.14741955061838 * Toys ;
END;
ELSE DO;
   IF MISSING( CatPurchase ) THEN S_CatPurchase  = . ;
   ELSE S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 *
        CatPurchase ;
   IF MISSING( Clothes ) THEN S_Clothes  = . ;
   ELSE S_Clothes  =     -2.3113689693832 +     0.04437092805094 * Clothes ;
   IF MISSING( HouseKeeping ) THEN S_HouseKeeping  = . ;
   ELSE S_HouseKeeping  =    -0.93443662367683 +     0.14435178378641 *
        HouseKeeping ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   IF MISSING( Rcn ) THEN S_Rcn  = . ;
   ELSE S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
   IF MISSING( Recomendation ) THEN S_Recomendation  = . ;
   ELSE S_Recomendation  =    -3.46611377322712 +     0.87281636006383 *
        Recomendation ;
   IF MISSING( SmallAppliances ) THEN S_SmallAppliances  = . ;
   ELSE S_SmallAppliances  =    -2.26667909624218 +     0.07979093963203 *
        SmallAppliances ;
   IF MISSING( Toys ) THEN S_Toys  = . ;
   ELSE S_Toys  =    -0.95465683239199 +     0.14741955061838 * Toys ;
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
   H11  =     0.18572089848779 * S_CatPurchase  +    -0.26953903486764 *
        S_Clothes  +    -0.02030295218421 * S_HouseKeeping
          +     1.08282121245277 * S_Mnt  +    -0.25979965691276 * S_Rcn
          +     0.44490450701167 * S_Recomendation  +    -0.18814459861569 *
        S_SmallAppliances  +    -0.57570060208594 * S_Toys ;
   H12  =     -0.1212047048021 * S_CatPurchase  +     0.03771814544073 *
        S_Clothes  +     0.22749663542082 * S_HouseKeeping
          +    -0.42820959164873 * S_Mnt  +    -0.22990299119502 * S_Rcn
          +     0.85815096072726 * S_Recomendation  +     0.16022542529137 *
        S_SmallAppliances  +     0.99582116161525 * S_Toys ;
   H13  =    -0.03553873112819 * S_CatPurchase  +    -0.24003602324706 *
        S_Clothes  +    -0.48669532029485 * S_HouseKeeping
          +    -0.71218636535185 * S_Mnt  +    -0.40733206469229 * S_Rcn
          +    -1.57550536212406 * S_Recomendation  +     1.02753075123485 *
        S_SmallAppliances  +    -0.79856850159513 * S_Toys ;
   H14  =     -0.1093738896086 * S_CatPurchase  +    -0.06188655408119 *
        S_Clothes  +    -0.00093570200416 * S_HouseKeeping
          +     0.11100048256774 * S_Mnt  +    -0.37622324155686 * S_Rcn
          +     0.50802903345962 * S_Recomendation  +     0.41685389000421 *
        S_SmallAppliances  +     0.83184191874791 * S_Toys ;
   H11  = H11  +    -0.66206282016358 * Dependents0 ;
   H12  = H12  +    -0.24444127124166 * Dependents0 ;
   H13  = H13  +    -0.37480402525632 * Dependents0 ;
   H14  = H14  +    -0.11939949675789 * Dependents0 ;
   H11  = H11  +    -0.80758384966677 * Marital_StatusDivorced
          +    -0.06693131813453 * Marital_StatusMarried
          +    -0.92114950564283 * Marital_StatusSingle
          +    -0.94999025392943 * Marital_StatusTogether ;
   H12  = H12  +    -0.55082238118134 * Marital_StatusDivorced
          +    -0.39264750361037 * Marital_StatusMarried
          +    -0.04929662569186 * Marital_StatusSingle
          +    -0.18326524551436 * Marital_StatusTogether ;
   H13  = H13  +      0.2383985287543 * Marital_StatusDivorced
          +     0.15238070583594 * Marital_StatusMarried
          +    -1.01845303219882 * Marital_StatusSingle
          +    -0.65103090338266 * Marital_StatusTogether ;
   H14  = H14  +     -0.7889761584294 * Marital_StatusDivorced
          +    -0.90543530513378 * Marital_StatusMarried
          +    -0.55957748287302 * Marital_StatusSingle
          +    -0.51011088773334 * Marital_StatusTogether ;
   H11  =     0.90043822488498 + H11 ;
   H12  =     0.52046684122025 + H12 ;
   H13  =     1.11009535618234 + H13 ;
   H14  =    -0.16327244022428 + H14 ;
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
   P_DepVar1  =     2.71475758170388 * H11  +     -3.7186442929168 * H12
          +    -1.61910718920192 * H13  +     2.85370720429597 * H14 ;
   P_DepVar1  =    -4.18186032474238 + P_DepVar1 ;
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
   P_DepVar1  =     0.06989576946658;
   P_DepVar0  =     0.93010423053341;
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
;
drop S_:;
* Renaming variables for Neural4;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural4;
*------------------------------------------------------------*;
drop Neural4_P_DepVar1;
Neural4_P_DepVar1 = P_DepVar1;
drop Neural4_P_DepVar0;
Neural4_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural4;
*------------------------------------------------------------*;
length Neural4_WARN_ $4;
drop Neural4_WARN_;
Neural4_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl: Scoring Code of model 4 of 6;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural;
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
      label S_CatPurchase = 'Standard: CatPurchase' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_Rcn = 'Standard: Rcn' ;

      label H11 = 'Hidden: H1=1' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   CatPurchase ,
   Mnt ,
   Rcn   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 * CatPurchase
         ;
   S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
END;
ELSE DO;
   IF MISSING( CatPurchase ) THEN S_CatPurchase  = . ;
   ELSE S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 *
        CatPurchase ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   IF MISSING( Rcn ) THEN S_Rcn  = . ;
   ELSE S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.00251126576044 * S_CatPurchase  +    -0.17845289496434 * S_Mnt
          +     0.00668372035014 * S_Rcn ;
   H11  =    -0.34768310047089 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
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
   P_DepVar1  =    -13.0478716516493 * H11 ;
   P_DepVar1  =    -8.34715529052741 + P_DepVar1 ;
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
   P_DepVar1  =     0.06989576946658;
   P_DepVar0  =     0.93010423053341;
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
;
* Renaming variables for Neural;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural;
*------------------------------------------------------------*;
drop Neural_P_DepVar1;
Neural_P_DepVar1 = P_DepVar1;
drop Neural_P_DepVar0;
Neural_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural;
*------------------------------------------------------------*;
length Neural_WARN_ $4;
drop Neural_WARN_;
Neural_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl: Scoring Code of model 5 of 6;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural2;
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
      label S_CatPurchase = 'Standard: CatPurchase' ;

      label S_Clothes = 'Standard: Clothes' ;

      label S_HouseKeeping = 'Standard: HouseKeeping' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_Rcn = 'Standard: Rcn' ;

      label S_Recomendation = 'Standard: Recomendation' ;

      label S_SmallAppliances = 'Standard: SmallAppliances' ;

      label S_Toys = 'Standard: Toys' ;

      label Dependents0 = 'Dummy: Dependents=0' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Dependents ;
drop Dependents0 ;
if missing( Dependents ) then do;
   Dependents0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Dependents , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      Dependents0 = -1;
   end;
   else if _dm12 = '0'  then do;
      Dependents0 = 1;
   end;
   else do;
      Dependents0 = .;
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
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Marital_Status , $12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= 'SINGLE'  then do;
      if _dm12 <= 'MARRIED'  then do;
         if _dm12 = 'DIVORCED'  then do;
            Marital_StatusDivorced = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = 'MARRIED'  then do;
               Marital_StatusMarried = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = 'SINGLE'  then do;
            Marital_StatusSingle = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = 'TOGETHER'  then do;
         Marital_StatusTogether = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = 'WIDOW'  then do;
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
   CatPurchase ,
   Clothes ,
   HouseKeeping ,
   Mnt ,
   Rcn ,
   Recomendation ,
   SmallAppliances ,
   Toys   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 * CatPurchase
         ;
   S_Clothes  =     -2.3113689693832 +     0.04437092805094 * Clothes ;
   S_HouseKeeping  =    -0.93443662367683 +     0.14435178378641 *
        HouseKeeping ;
   S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
   S_Recomendation  =    -3.46611377322712 +     0.87281636006383 *
        Recomendation ;
   S_SmallAppliances  =    -2.26667909624218 +     0.07979093963203 *
        SmallAppliances ;
   S_Toys  =    -0.95465683239199 +     0.14741955061838 * Toys ;
END;
ELSE DO;
   IF MISSING( CatPurchase ) THEN S_CatPurchase  = . ;
   ELSE S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 *
        CatPurchase ;
   IF MISSING( Clothes ) THEN S_Clothes  = . ;
   ELSE S_Clothes  =     -2.3113689693832 +     0.04437092805094 * Clothes ;
   IF MISSING( HouseKeeping ) THEN S_HouseKeeping  = . ;
   ELSE S_HouseKeeping  =    -0.93443662367683 +     0.14435178378641 *
        HouseKeeping ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   IF MISSING( Rcn ) THEN S_Rcn  = . ;
   ELSE S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
   IF MISSING( Recomendation ) THEN S_Recomendation  = . ;
   ELSE S_Recomendation  =    -3.46611377322712 +     0.87281636006383 *
        Recomendation ;
   IF MISSING( SmallAppliances ) THEN S_SmallAppliances  = . ;
   ELSE S_SmallAppliances  =    -2.26667909624218 +     0.07979093963203 *
        SmallAppliances ;
   IF MISSING( Toys ) THEN S_Toys  = . ;
   ELSE S_Toys  =    -0.95465683239199 +     0.14741955061838 * Toys ;
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
   H11  =    -0.05999403216612 * S_CatPurchase  +     0.20339967513114 *
        S_Clothes  +     0.09326695971817 * S_HouseKeeping
          +    -0.51678544057999 * S_Mnt  +     0.08508367153612 * S_Rcn
          +    -0.14498151001559 * S_Recomendation  +     0.16426718825798 *
        S_SmallAppliances  +     0.20091741252493 * S_Toys ;
   H12  =     0.04795506765456 * S_CatPurchase  +    -1.30367114290262 *
        S_Clothes  +    -0.11383893219009 * S_HouseKeeping
          +    -0.77732809295663 * S_Mnt  +    -0.46299682774209 * S_Rcn
          +     1.43133973003849 * S_Recomendation  +    -0.09497105212399 *
        S_SmallAppliances  +    -0.27361583975836 * S_Toys ;
   H11  = H11  +     0.22723981741034 * Dependents0 ;
   H12  = H12  +     -1.8471250409398 * Dependents0 ;
   H11  = H11  +     0.24093835560783 * Marital_StatusDivorced
          +     0.22265991505819 * Marital_StatusMarried
          +     0.24181821231198 * Marital_StatusSingle
          +     0.17651606004301 * Marital_StatusTogether ;
   H12  = H12  +    -0.98070438980573 * Marital_StatusDivorced
          +    -0.50968691742973 * Marital_StatusMarried
          +    -0.18946185010446 * Marital_StatusSingle
          +    -1.07423169325063 * Marital_StatusTogether ;
   H11  =     0.12139891831216 + H11 ;
   H12  =    -0.51485627332394 + H12 ;
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
   P_DepVar1  =    -3.97099617500929 * H11  +    -1.57799405981122 * H12 ;
   P_DepVar1  =    -4.16634326661461 + P_DepVar1 ;
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
   P_DepVar1  =     0.06989576946658;
   P_DepVar0  =     0.93010423053341;
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
;
drop S_:;
* Renaming variables for Neural2;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural2;
*------------------------------------------------------------*;
drop Neural2_P_DepVar1;
Neural2_P_DepVar1 = P_DepVar1;
drop Neural2_P_DepVar0;
Neural2_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural2;
*------------------------------------------------------------*;
length Neural2_WARN_ $4;
drop Neural2_WARN_;
Neural2_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl: Scoring Code of model 6 of 6;
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
      F_DepVar  $ 12
;
      label S_CatPurchase = 'Standard: CatPurchase' ;

      label S_Clothes = 'Standard: Clothes' ;

      label S_HouseKeeping = 'Standard: HouseKeeping' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_Rcn = 'Standard: Rcn' ;

      label S_Recomendation = 'Standard: Recomendation' ;

      label S_SmallAppliances = 'Standard: SmallAppliances' ;

      label S_Toys = 'Standard: Toys' ;

      label Dependents0 = 'Dummy: Dependents=0' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Dependents ;
drop Dependents0 ;
if missing( Dependents ) then do;
   Dependents0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Dependents , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      Dependents0 = -1;
   end;
   else if _dm12 = '0'  then do;
      Dependents0 = 1;
   end;
   else do;
      Dependents0 = .;
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
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Marital_Status , $12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= 'SINGLE'  then do;
      if _dm12 <= 'MARRIED'  then do;
         if _dm12 = 'DIVORCED'  then do;
            Marital_StatusDivorced = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = 'MARRIED'  then do;
               Marital_StatusMarried = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = 'SINGLE'  then do;
            Marital_StatusSingle = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = 'TOGETHER'  then do;
         Marital_StatusTogether = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = 'WIDOW'  then do;
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
   CatPurchase ,
   Clothes ,
   HouseKeeping ,
   Mnt ,
   Rcn ,
   Recomendation ,
   SmallAppliances ,
   Toys   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 * CatPurchase
         ;
   S_Clothes  =     -2.3113689693832 +     0.04437092805094 * Clothes ;
   S_HouseKeeping  =    -0.93443662367683 +     0.14435178378641 *
        HouseKeeping ;
   S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
   S_Recomendation  =    -3.46611377322712 +     0.87281636006383 *
        Recomendation ;
   S_SmallAppliances  =    -2.26667909624218 +     0.07979093963203 *
        SmallAppliances ;
   S_Toys  =    -0.95465683239199 +     0.14741955061838 * Toys ;
END;
ELSE DO;
   IF MISSING( CatPurchase ) THEN S_CatPurchase  = . ;
   ELSE S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 *
        CatPurchase ;
   IF MISSING( Clothes ) THEN S_Clothes  = . ;
   ELSE S_Clothes  =     -2.3113689693832 +     0.04437092805094 * Clothes ;
   IF MISSING( HouseKeeping ) THEN S_HouseKeeping  = . ;
   ELSE S_HouseKeeping  =    -0.93443662367683 +     0.14435178378641 *
        HouseKeeping ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   IF MISSING( Rcn ) THEN S_Rcn  = . ;
   ELSE S_Rcn  =    -0.88409352592792 +      0.0137435215813 * Rcn ;
   IF MISSING( Recomendation ) THEN S_Recomendation  = . ;
   ELSE S_Recomendation  =    -3.46611377322712 +     0.87281636006383 *
        Recomendation ;
   IF MISSING( SmallAppliances ) THEN S_SmallAppliances  = . ;
   ELSE S_SmallAppliances  =    -2.26667909624218 +     0.07979093963203 *
        SmallAppliances ;
   IF MISSING( Toys ) THEN S_Toys  = . ;
   ELSE S_Toys  =    -0.95465683239199 +     0.14741955061838 * Toys ;
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
   H11  =    -0.05999403216612 * S_CatPurchase  +     0.20339967513114 *
        S_Clothes  +     0.09326695971817 * S_HouseKeeping
          +    -0.51678544057999 * S_Mnt  +     0.08508367153612 * S_Rcn
          +    -0.14498151001559 * S_Recomendation  +     0.16426718825798 *
        S_SmallAppliances  +     0.20091741252493 * S_Toys ;
   H12  =     0.04795506765456 * S_CatPurchase  +    -1.30367114290262 *
        S_Clothes  +    -0.11383893219009 * S_HouseKeeping
          +    -0.77732809295663 * S_Mnt  +    -0.46299682774209 * S_Rcn
          +     1.43133973003849 * S_Recomendation  +    -0.09497105212399 *
        S_SmallAppliances  +    -0.27361583975836 * S_Toys ;
   H11  = H11  +     0.22723981741034 * Dependents0 ;
   H12  = H12  +     -1.8471250409398 * Dependents0 ;
   H11  = H11  +     0.24093835560783 * Marital_StatusDivorced
          +     0.22265991505819 * Marital_StatusMarried
          +     0.24181821231198 * Marital_StatusSingle
          +     0.17651606004301 * Marital_StatusTogether ;
   H12  = H12  +    -0.98070438980573 * Marital_StatusDivorced
          +    -0.50968691742973 * Marital_StatusMarried
          +    -0.18946185010446 * Marital_StatusSingle
          +    -1.07423169325063 * Marital_StatusTogether ;
   H11  =     0.12139891831216 + H11 ;
   H12  =    -0.51485627332394 + H12 ;
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
   P_DepVar1  =    -3.97099617500929 * H11  +    -1.57799405981122 * H12 ;
   P_DepVar1  =    -4.16634326661461 + P_DepVar1 ;
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
   P_DepVar1  =     0.06989576946658;
   P_DepVar0  =     0.93010423053341;
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
* Ensmbl: Average Posteriors of 6 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Reg_P_DepVar1 +
Tree_P_DepVar1 +
Neural4_P_DepVar1 +
Neural_P_DepVar1 +
Neural2_P_DepVar1 +
Neural3_P_DepVar1
)/6;
P_DepVar0 = (
Reg_P_DepVar0 +
Tree_P_DepVar0 +
Neural4_P_DepVar0 +
Neural_P_DepVar0 +
Neural2_P_DepVar0 +
Neural3_P_DepVar0
)/6;
*------------------------------------------------------------*;
* Ensmbl: Computing Classification Vars;
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
* Ensmbl: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(REG_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(TREE_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(TREE_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(TREE_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(TREE_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL4_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL4_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL4_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL4_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl: Computing Residual Vars;
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
