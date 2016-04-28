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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.66162415407107 * S_PC_1  +    -0.41766308568497 * S_PC_10
          +     0.44716155726684 * S_PC_11  +     0.51882451748254 * S_PC_12
          +    -1.34027194120483 * S_PC_13  +     0.44167412235656 * S_PC_14
          +    -0.53028738685237 * S_PC_15  +     0.27562098694114 * S_PC_16
          +    -0.06818955880859 * S_PC_17  +    -0.04345289092052 * S_PC_2
          +    -0.43706082404622 * S_PC_3  +     0.01676067813068 * S_PC_4
          +    -0.28127929682521 * S_PC_5  +    -0.29846073286585 * S_PC_6
          +    -0.03499642701132 * S_PC_7  +     0.15229243815145 * S_PC_8
          +     0.18530157772282 * S_PC_9  +     0.73017449579728 *
        S_Year_Birth ;
   H12  =     0.64597977704217 * S_PC_1  +    -0.23821744991134 * S_PC_10
          +    -0.14632606678812 * S_PC_11  +     -0.2642046964713 * S_PC_12
          +    -0.16132504913978 * S_PC_13  +    -0.01926596440034 * S_PC_14
          +     0.02011273330816 * S_PC_15  +     0.04329735456053 * S_PC_16
          +     0.10020893774507 * S_PC_17  +    -0.22659427061067 * S_PC_2
          +     0.26918226646558 * S_PC_3  +    -0.15805153820258 * S_PC_4
          +    -0.01318382613484 * S_PC_5  +     0.00207126308167 * S_PC_6
          +    -0.02015277359299 * S_PC_7  +    -0.09265573996803 * S_PC_8
          +     0.23125247113744 * S_PC_9  +    -0.07574909545113 *
        S_Year_Birth ;
   H13  =    -0.78518075666801 * S_PC_1  +    -0.13651032443592 * S_PC_10
          +     0.18814513480757 * S_PC_11  +     0.20574038612337 * S_PC_12
          +    -0.13848955692195 * S_PC_13  +     0.33983166896863 * S_PC_14
          +     0.00067982783371 * S_PC_15  +    -0.04362239065819 * S_PC_16
          +    -0.29971068993151 * S_PC_17  +    -0.64512941056708 * S_PC_2
          +    -0.42925249333906 * S_PC_3  +     0.58020341068864 * S_PC_4
          +    -0.20361504709271 * S_PC_5  +     0.91204972953983 * S_PC_6
          +     0.14118665494483 * S_PC_7  +     0.51813003035978 * S_PC_8
          +     0.08227061949238 * S_PC_9  +     -0.3793843971308 *
        S_Year_Birth ;
   H11  =    -0.71192629005572 + H11 ;
   H12  =    -1.21495096628713 + H12 ;
   H13  =     -1.0262160199904 + H13 ;
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
   P_DepVar1  =     1.97211912500641 * H11  +     3.85901238295283 * H12
          +     2.28455259493407 * H13 ;
   P_DepVar1  =     0.85003990401463 + P_DepVar1 ;
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
;
drop S_:;
