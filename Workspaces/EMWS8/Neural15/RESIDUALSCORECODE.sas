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

      label H14 = 'Hidden: H1=4' ;

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
   H11  =     0.46869680071829 * S_PC_1  +     0.53515767845021 * S_PC_10
          +     0.91332134879585 * S_PC_11  +    -0.56549380766669 * S_PC_12
          +    -0.47439134786924 * S_PC_13  +     0.15706747636881 * S_PC_14
          +    -0.28121143620248 * S_PC_15  +     -0.0660630641321 * S_PC_16
          +    -0.16936399393449 * S_PC_17  +    -0.69766306821055 * S_PC_2
          +    -0.61273247065427 * S_PC_3  +    -0.65421711112506 * S_PC_4
          +      1.8885310176882 * S_PC_5  +    -0.14678899976605 * S_PC_6
          +     0.81361432077057 * S_PC_7  +    -2.23765638170408 * S_PC_8
          +    -0.33522612975501 * S_PC_9  +     0.29777310391692 * 
        S_Year_Birth ;
   H12  =     0.25019246202603 * S_PC_1  +    -0.30132926594914 * S_PC_10
          +     0.26623921153752 * S_PC_11  +     0.25927452133438 * S_PC_12
          +    -0.70972225295583 * S_PC_13  +     0.35153331784932 * S_PC_14
          +    -0.18518300487726 * S_PC_15  +     0.15976527110357 * S_PC_16
          +    -0.10232312091379 * S_PC_17  +     -0.3658127360462 * S_PC_2
          +    -0.32891504317723 * S_PC_3  +     0.21036562324713 * S_PC_4
          +     0.10489569651468 * S_PC_5  +    -0.03965052645582 * S_PC_6
          +     0.06588275037854 * S_PC_7  +     0.21368149742997 * S_PC_8
          +     0.16575991499598 * S_PC_9  +     0.37678142817356 * 
        S_Year_Birth ;
   H13  =     0.56598278715964 * S_PC_1  +     -0.6560131519929 * S_PC_10
          +     0.86276673043983 * S_PC_11  +     0.93659160239074 * S_PC_12
          +    -1.05127453906738 * S_PC_13  +     0.52450101291782 * S_PC_14
          +     -0.7200559717032 * S_PC_15  +    -0.05498035311125 * S_PC_16
          +    -0.70645259409595 * S_PC_17  +      -0.622311716538 * S_PC_2
          +      -0.018691247623 * S_PC_3  +    -0.08650926014452 * S_PC_4
          +    -0.55234613902769 * S_PC_5  +     0.36877773908022 * S_PC_6
          +    -0.42943894582997 * S_PC_7  +    -0.18854707726599 * S_PC_8
          +    -0.03989102982446 * S_PC_9  +    -0.08146217707249 * 
        S_Year_Birth ;
   H14  =     1.00641864527646 * S_PC_1  +    -0.41346599515815 * S_PC_10
          +    -0.34661992582662 * S_PC_11  +    -0.67272292331443 * S_PC_12
          +    -0.33569738775899 * S_PC_13  +    -0.02890913575241 * S_PC_14
          +     -0.0605515198529 * S_PC_15  +     0.03571249559281 * S_PC_16
          +      0.2847703627343 * S_PC_17  +    -0.16271629589908 * S_PC_2
          +     0.52964147468074 * S_PC_3  +    -0.33068934270513 * S_PC_4
          +     0.07238724351739 * S_PC_5  +    -0.03272511854832 * S_PC_6
          +    -0.07339911070876 * S_PC_7  +    -0.29046574671064 * S_PC_8
          +     0.47930932535214 * S_PC_9  +      0.0318506115502 * 
        S_Year_Birth ;
   H11  =     -0.5804626060578 + H11 ;
   H12  =     -0.8310908205064 + H12 ;
   H13  =      1.2672691450253 + H13 ;
   H14  =    -2.34195905920109 + H14 ;
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
   P_DepVar1  =    -2.78636512087722 * H11  +     2.96232206155343 * H12
          +     2.04650520917727 * H13  +     2.72577868801108 * H14 ;
   P_DepVar1  =    -1.61492090748328 + P_DepVar1 ;
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
