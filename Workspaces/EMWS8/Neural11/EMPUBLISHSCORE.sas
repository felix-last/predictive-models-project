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
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.11291389797984 * S_PC_1  +     0.00989452135404 * S_PC_10
          +    -0.08782782041825 * S_PC_11  +     0.12896858955031 * S_PC_12
          +     0.10852552259949 * S_PC_13  +    -0.05459013239627 * S_PC_14
          +    -0.06188895597388 * S_PC_15  +     0.02191855220919 * S_PC_16
          +      0.0406908878643 * S_PC_17  +      0.0210719986739 * S_PC_18
          +    -0.00097087095304 * S_PC_19  +    -0.09397655088279 * S_PC_2
          +     0.02419420716907 * S_PC_20  +    -0.07217172638111 * S_PC_3
          +    -0.01064095728398 * S_PC_4  +     0.08089909058248 * S_PC_5
          +     0.02668988972907 * S_PC_6  +     0.00136326079552 * S_PC_7
          +     0.05125338899143 * S_PC_8  +     0.05004904495619 * S_PC_9 ;
   H11  =     0.43168893994775 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     12.2601604533939 * H11 ;
   P_DepVar1  =    -7.90048847586824 + P_DepVar1 ;
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
