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

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

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
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -2.9091149997299E-15 +     0.33258410789275 * PC_1 ;
   S_PC_10  =  9.4139881630002E-16 +     0.95642096229329 * PC_10 ;
   S_PC_11  = -4.8568716302667E-15 +     0.98515792632482 * PC_11 ;
   S_PC_12  =  -1.544801809949E-15 +     1.01713929497733 * PC_12 ;
   S_PC_13  = -8.2211417768132E-16 +     1.04295917669268 * PC_13 ;
   S_PC_14  =  3.1036726720486E-17 +     1.08045626609849 * PC_14 ;
   S_PC_15  =  -1.066033180354E-15 +     1.17432651465789 * PC_15 ;
   S_PC_16  = -1.0358103285074E-15 +     1.22100880890388 * PC_16 ;
   S_PC_17  =  -2.462156936438E-15 +     1.32547591624883 * PC_17 ;
   S_PC_18  = -4.8466570909833E-16 +     1.38536800877319 * PC_18 ;
   S_PC_19  =  -7.134749074506E-15 +     1.46181079715479 * PC_19 ;
   S_PC_2  =  6.9336706238808E-16 +     0.49377461893848 * PC_2 ;
   S_PC_20  =  -1.676677278498E-15 +     1.91794072839992 * PC_20 ;
   S_PC_3  =  1.6042377095594E-15 +     0.69825320789627 * PC_3 ;
   S_PC_4  = -6.0650204234062E-15 +     0.71190873926042 * PC_4 ;
   S_PC_5  =  1.3855154199771E-15 +     0.82566321395447 * PC_5 ;
   S_PC_6  = -6.2176933434597E-15 +     0.84875049848914 * PC_6 ;
   S_PC_7  = -3.5067709325792E-15 +     0.85820298471078 * PC_7 ;
   S_PC_8  = -3.0988852821524E-15 +     0.90019129209771 * PC_8 ;
   S_PC_9  = -1.9153640988538E-15 +     0.93038569552474 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -2.9091149997299E-15 +     0.33258410789275 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  =  9.4139881630002E-16 +     0.95642096229329 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  = -4.8568716302667E-15 +     0.98515792632482 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -1.544801809949E-15 +     1.01713929497733 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  = -8.2211417768132E-16 +     1.04295917669268 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  =  3.1036726720486E-17 +     1.08045626609849 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  -1.066033180354E-15 +     1.17432651465789 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -1.0358103285074E-15 +     1.22100880890388 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  -2.462156936438E-15 +     1.32547591624883 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  = -4.8466570909833E-16 +     1.38536800877319 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  -7.134749074506E-15 +     1.46181079715479 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.9336706238808E-16 +     0.49377461893848 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  =  -1.676677278498E-15 +     1.91794072839992 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  1.6042377095594E-15 +     0.69825320789627 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -6.0650204234062E-15 +     0.71190873926042 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  1.3855154199771E-15 +     0.82566321395447 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  = -6.2176933434597E-15 +     0.84875049848914 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  = -3.5067709325792E-15 +     0.85820298471078 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -3.0988852821524E-15 +     0.90019129209771 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -1.9153640988538E-15 +     0.93038569552474 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.99306900214106 * S_PC_1  +     -0.0513831833596 * S_PC_10
          +     -0.0716512988168 * S_PC_11  +     0.27258581041106 * S_PC_12
          +     0.78565780600643 * S_PC_13  +     0.69541013361208 * S_PC_14
          +     -0.0244517543293 * S_PC_15  +      0.4277432899897 * S_PC_16
          +     0.05688645411725 * S_PC_17  +     0.23351220124053 * S_PC_18
          +    -0.56189160596739 * S_PC_19  +     0.41269896776602 * S_PC_2
          +       0.019242998432 * S_PC_20  +     -0.1542660437783 * S_PC_3
          +    -0.18723069351383 * S_PC_4  +    -0.10544727421904 * S_PC_5
          +     0.51365839780343 * S_PC_6  +     0.16877670147239 * S_PC_7
          +     0.37455122829671 * S_PC_8  +    -0.23621037343678 * S_PC_9 ;
   H12  =    -1.54255895740992 * S_PC_1  +    -0.01713925211396 * S_PC_10
          +    -0.09013631634862 * S_PC_11  +     0.32132516606218 * S_PC_12
          +    -0.02582588438199 * S_PC_13  +    -0.95355761446917 * S_PC_14
          +     0.08461342849405 * S_PC_15  +     0.23335763993129 * S_PC_16
          +    -0.07089172219834 * S_PC_17  +     -0.7498148628123 * S_PC_18
          +     0.05832506847588 * S_PC_19  +     1.02201002495551 * S_PC_2
          +     0.74375784598799 * S_PC_20  +     0.93091182344245 * S_PC_3
          +     0.40183151116666 * S_PC_4  +    -0.16149844257096 * S_PC_5
          +     -0.3421558559102 * S_PC_6  +     0.06185440351233 * S_PC_7
          +    -0.54416142882545 * S_PC_8  +     0.19545165586575 * S_PC_9 ;
   H13  =      0.7696492369308 * S_PC_1  +     0.10183239415264 * S_PC_10
          +    -0.97131946292477 * S_PC_11  +     0.77441832298683 * S_PC_12
          +     0.91494452782266 * S_PC_13  +    -0.05082084785156 * S_PC_14
          +     0.11089819038182 * S_PC_15  +     0.11551801566191 * S_PC_16
          +     0.31282223007587 * S_PC_17  +    -0.11514270181576 * S_PC_18
          +    -0.28546630271105 * S_PC_19  +     0.78720113359122 * S_PC_2
          +    -0.19179498789121 * S_PC_20  +      0.7953092188774 * S_PC_3
          +    -0.65601840591794 * S_PC_4  +    -0.09055628743895 * S_PC_5
          +     0.17362794049055 * S_PC_6  +     0.61739715974005 * S_PC_7
          +    -0.10866994727207 * S_PC_8  +    -0.31414229902981 * S_PC_9 ;
   H11  =     0.60586583906357 + H11 ;
   H12  =      1.2525277592628 + H12 ;
   H13  =    -1.89630099193719 + H13 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -2.61833479523352 * H11  +    -2.22364976391319 * H12
          +     2.80212192737867 * H13 ;
   P_DepVar1  =    -2.41153326657964 + P_DepVar1 ;
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
H13
;
drop S_:;
