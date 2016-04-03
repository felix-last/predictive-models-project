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
* J CODE;
* DATASTEP SCORECODE for EMCODE4;
* IS NOT SUPPORTED FOR CONVERSION;
*------------------------------------------------------------*;
CALL ExternalCode294();
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

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

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
