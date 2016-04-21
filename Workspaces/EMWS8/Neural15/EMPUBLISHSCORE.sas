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

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.21916437094975 * S_PC_1  +     0.46895145057244 * S_PC_10
          +     0.69761531323014 * S_PC_11  +    -0.30533094236753 * S_PC_12
          +    -0.36327982586722 * S_PC_13  +     0.19077464191003 * S_PC_14
          +    -0.21149083974554 * S_PC_15  +     0.01556863915224 * S_PC_16
          +    -0.16565778772884 * S_PC_17  +    -0.47244513640232 * S_PC_2
          +    -0.48362143582746 * S_PC_3  +     -0.6605280181533 * S_PC_4
          +     1.75291826116994 * S_PC_5  +    -0.14058141705537 * S_PC_6
          +     0.57374810834101 * S_PC_7  +    -1.68225303594881 * S_PC_8
          +    -0.28316700480518 * S_PC_9  +     0.13982759935686 *
        S_Year_Birth ;
   H12  =     0.12101363568223 * S_PC_1  +    -0.31241856262881 * S_PC_10
          +     0.27517795843322 * S_PC_11  +     0.30784385281478 * S_PC_12
          +    -0.68118348953077 * S_PC_13  +     0.38168910932118 * S_PC_14
          +    -0.24780681116297 * S_PC_15  +     0.17546547375236 * S_PC_16
          +    -0.07928517707643 * S_PC_17  +    -0.38048211293088 * S_PC_2
          +    -0.32652116779986 * S_PC_3  +      0.1905705021635 * S_PC_4
          +     0.12972604290011 * S_PC_5  +      0.0372364587024 * S_PC_6
          +     0.05952907527719 * S_PC_7  +     0.26219877622748 * S_PC_8
          +     0.14791742323382 * S_PC_9  +     0.26135521159879 *
        S_Year_Birth ;
   H13  =     0.64533167919436 * S_PC_1  +    -0.72127290093209 * S_PC_10
          +     0.89051319575822 * S_PC_11  +     0.97129300386918 * S_PC_12
          +    -1.18593762568769 * S_PC_13  +     0.47068229576395 * S_PC_14
          +    -0.69039875931197 * S_PC_15  +    -0.00791179223736 * S_PC_16
          +    -0.78504365089536 * S_PC_17  +    -0.59206299847209 * S_PC_2
          +    -0.12379110893706 * S_PC_3  +    -0.05437594004394 * S_PC_4
          +    -0.65391054090833 * S_PC_5  +      0.2995761236398 * S_PC_6
          +    -0.55231380268006 * S_PC_7  +    -0.21239257615541 * S_PC_8
          +    -0.11441544666014 * S_PC_9  +    -0.23347547419068 *
        S_Year_Birth ;
   H14  =      1.0360241934974 * S_PC_1  +    -0.39202225240717 * S_PC_10
          +    -0.32200625669175 * S_PC_11  +    -0.61609290980998 * S_PC_12
          +    -0.31436369432897 * S_PC_13  +    -0.00486117515969 * S_PC_14
          +    -0.02713823284007 * S_PC_15  +      0.0791834118799 * S_PC_16
          +     0.20897685763318 * S_PC_17  +    -0.22176247499996 * S_PC_2
          +      0.4739224953207 * S_PC_3  +     -0.3176011848773 * S_PC_4
          +     0.05774699044917 * S_PC_5  +    -0.05726336170428 * S_PC_6
          +     -0.0914058382418 * S_PC_7  +    -0.31886775814838 * S_PC_8
          +     0.43994345953404 * S_PC_9  +     0.10106394892699 *
        S_Year_Birth ;
   H11  =    -0.55123213858302 + H11 ;
   H12  =    -0.75869313709114 + H12 ;
   H13  =     1.40273224689344 + H13 ;
   H14  =    -2.25765100137563 + H14 ;
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
   P_DepVar1  =    -2.64261520585079 * H11  +     2.97929850273952 * H12
          +      1.9009978796506 * H13  +      2.8189101465563 * H14 ;
   P_DepVar1  =     -1.5309097146626 + P_DepVar1 ;
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
