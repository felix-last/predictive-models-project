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

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

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
   S_PC_1  = -3.6488918403387E-15 +     0.29892759566822 * PC_1 ;
   S_PC_10  = -6.1105909646702E-15 +     0.82174055927533 * PC_10 ;
   S_PC_11  =  5.5953279603159E-15 +       0.856249156402 * PC_11 ;
   S_PC_12  = -4.1145821078075E-15 +     0.88806609097186 * PC_12 ;
   S_PC_13  =  1.4849812030115E-15 +     0.89678852922943 * PC_13 ;
   S_PC_14  = -6.2973928075572E-15 +     0.90339751679168 * PC_14 ;
   S_PC_15  = -5.8948982757007E-16 +     0.92999222699092 * PC_15 ;
   S_PC_16  = -2.5957971712491E-15 +      0.9511809992322 * PC_16 ;
   S_PC_17  =  3.6303451348395E-15 +     0.99884839954107 * PC_17 ;
   S_PC_2  =  6.4135165190946E-15 +     0.54372947518581 * PC_2 ;
   S_PC_3  =  2.2514555608207E-15 +     0.55367420195889 * PC_3 ;
   S_PC_4  = -3.8797382198993E-15 +     0.63693509045378 * PC_4 ;
   S_PC_5  = -4.8238591945923E-15 +      0.6666904967587 * PC_5 ;
   S_PC_6  =  1.5849559140428E-15 +     0.70534780307004 * PC_6 ;
   S_PC_7  =  3.1562291763867E-16 +     0.74930538239816 * PC_7 ;
   S_PC_8  = -2.4599196832342E-15 +     0.77164443961071 * PC_8 ;
   S_PC_9  = -4.1449869562181E-15 +      0.8081978480865 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6488918403387E-15 +     0.29892759566822 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.1105909646702E-15 +     0.82174055927533 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.5953279603159E-15 +       0.856249156402 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1145821078075E-15 +     0.88806609097186 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4849812030115E-15 +     0.89678852922943 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2973928075572E-15 +     0.90339751679168 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.8948982757007E-16 +     0.92999222699092 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.5957971712491E-15 +      0.9511809992322 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.6303451348395E-15 +     0.99884839954107 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4135165190946E-15 +     0.54372947518581 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2514555608207E-15 +     0.55367420195889 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.8797382198993E-15 +     0.63693509045378 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.8238591945923E-15 +      0.6666904967587 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5849559140428E-15 +     0.70534780307004 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.1562291763867E-16 +     0.74930538239816 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4599196832342E-15 +     0.77164443961071 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1449869562181E-15 +      0.8081978480865 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.10522500657273 * S_PC_1  +     0.09096573158531 * S_PC_10
          +    -0.03499340047101 * S_PC_11  +    -0.02154646847275 * S_PC_12
          +     0.14267743709601 * S_PC_13  +    -0.05921128717719 * S_PC_14
          +     0.03912274316982 * S_PC_15  +    -0.03096569248972 * S_PC_16
          +     0.01908651067352 * S_PC_17  +     0.09933417368367 * S_PC_2
          +     0.02064402121592 * S_PC_3  +    -0.02543300464446 * S_PC_4
          +     0.06123490685161 * S_PC_5  +     -0.0286817861828 * S_PC_6
          +    -0.01806073106772 * S_PC_7  +    -0.04768430946936 * S_PC_8
          +    -0.06386532208159 * S_PC_9  +    -0.00602159272673 *
        S_Year_Birth ;
   H11  =    -0.86046397050555 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -22.9233051266101 * H11 ;
   P_DepVar1  =    -18.8228116776068 + P_DepVar1 ;
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
;
drop S_:;
