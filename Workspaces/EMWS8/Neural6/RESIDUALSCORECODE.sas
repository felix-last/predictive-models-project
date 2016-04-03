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

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_RMntFrq_Exmpl2 = 'Standard: RMntFrq_Exmpl2' ;

      label S_Recomendation = 'Standard: Recomendation' ;

      label G_Education0 = 'Dummy: G_Education=0' ;

      label G_Education1 = 'Dummy: G_Education=1' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label G_Marital_Status2 = 'Dummy: G_Marital_Status=2' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for G_Education ;
drop G_Education0 G_Education1 ;
if missing( G_Education ) then do;
   G_Education0 = .;
   G_Education1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Education , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Education0 = -1;
      G_Education1 = -1;
   end;
   else if _dm12 = '1'  then do;
      G_Education0 = 0;
      G_Education1 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_Education0 = 1;
      G_Education1 = 0;
   end;
   else do;
      G_Education0 = .;
      G_Education1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 G_Marital_Status2 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   G_Marital_Status2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 0;
      G_Marital_Status2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
      G_Marital_Status2 = -1;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
      G_Marital_Status2 = 0;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
      G_Marital_Status2 = 0;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
      G_Marital_Status2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   CatPurchase , 
   Frq , 
   Income , 
   Mnt , 
   RMntFrq_Exmpl2 , 
   Recomendation   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 * CatPurchase
         ;
   S_Frq  =    -1.82502911267462 +     0.09007239636797 * Frq ;
   S_Income  =    -2.63433937820015 +     0.00003528796161 * Income ;
   S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   S_RMntFrq_Exmpl2  =    -1.44858342808669 +     0.05925088238452 * 
        RMntFrq_Exmpl2 ;
   S_Recomendation  =    -3.46611377322712 +     0.87281636006383 * 
        Recomendation ;
END;
ELSE DO;
   IF MISSING( CatPurchase ) THEN S_CatPurchase  = . ;
   ELSE S_CatPurchase  =    -3.17624192684474 +     0.05492769453828 * 
        CatPurchase ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =    -1.82502911267462 +     0.09007239636797 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.63433937820015 +     0.00003528796161 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =     -0.9789629518701 +     0.00146441725342 * Mnt ;
   IF MISSING( RMntFrq_Exmpl2 ) THEN S_RMntFrq_Exmpl2  = . ;
   ELSE S_RMntFrq_Exmpl2  =    -1.44858342808669 +     0.05925088238452 * 
        RMntFrq_Exmpl2 ;
   IF MISSING( Recomendation ) THEN S_Recomendation  = . ;
   ELSE S_Recomendation  =    -3.46611377322712 +     0.87281636006383 * 
        Recomendation ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -3.11560279145094 * S_CatPurchase  +    -2.98746437818575 * S_Frq
          +    -3.18166954013426 * S_Income  +     2.06131459525333 * S_Mnt
          +    -0.60691351685759 * S_RMntFrq_Exmpl2  +     -1.8953924671976 * 
        S_Recomendation ;
   H12  =        0.20567294398 * S_CatPurchase  +     0.68140438555215 * S_Frq
          +     0.25414713104295 * S_Income  +    -0.24200124374579 * S_Mnt
          +    -0.28877851221069 * S_RMntFrq_Exmpl2  +     0.06595475445787 * 
        S_Recomendation ;
   H13  =     1.85459275018905 * S_CatPurchase  +    -0.20122942207126 * S_Frq
          +     3.25484715317542 * S_Income  +     1.90804142554281 * S_Mnt
          +     4.33709602868161 * S_RMntFrq_Exmpl2  +    -1.38461020724642 * 
        S_Recomendation ;
   H11  = H11  +     0.80285063041667 * G_Education0
          +     0.85648290810406 * G_Education1  +     3.53182703250341 * 
        G_Marital_Status0  +     -4.8880482805563 * G_Marital_Status1
          +    -1.61176366658641 * G_Marital_Status2 ;
   H12  = H12  +     0.00046445188866 * G_Education0
          +      0.0020518728321 * G_Education1  +     0.07055369307704 * 
        G_Marital_Status0  +     0.05945850400586 * G_Marital_Status1
          +     0.00511807054093 * G_Marital_Status2 ;
   H13  = H13  +     1.00785565186553 * G_Education0
          +     0.22682328873964 * G_Education1  +     0.23316846763935 * 
        G_Marital_Status0  +     1.58222741921609 * G_Marital_Status1
          +     0.42777325831913 * G_Marital_Status2 ;
   H11  =    -0.72250231964496 + H11 ;
   H12  =    -0.43449149632867 + H12 ;
   H13  =     0.21053714247565 + H13 ;
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
   P_DepVar1  =     2.39994341984673 * H11  +     4.50843119675702 * H12
          +     3.86718762236728 * H13 ;
   P_DepVar1  =    -4.31618221958636 + P_DepVar1 ;
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
