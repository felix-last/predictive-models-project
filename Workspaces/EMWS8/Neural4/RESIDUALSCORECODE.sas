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
