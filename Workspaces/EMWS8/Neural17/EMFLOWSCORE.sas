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

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

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
   H11  =     0.47325245705958 * S_PC_1  +    -0.32671142398967 * S_PC_10
          +     0.57615604162363 * S_PC_11  +     0.48317613203035 * S_PC_12
          +    -1.05930077532746 * S_PC_13  +      0.5007465821401 * S_PC_14
          +    -0.41547054463424 * S_PC_15  +     0.11424432442491 * S_PC_16
          +    -0.18725136577655 * S_PC_17  +    -0.20911601322263 * S_PC_2
          +    -0.49196475041965 * S_PC_3  +     0.14740529866596 * S_PC_4
          +    -0.03165374814882 * S_PC_5  +     0.09311598667036 * S_PC_6
          +     0.30417718065062 * S_PC_7  +     0.32373700790503 * S_PC_8
          +     0.28212613081564 * S_PC_9  +     0.38601735765022 *
        S_Year_Birth ;
   H12  =      0.3985278956759 * S_PC_1  +     0.27103948298477 * S_PC_10
          +     0.01165110369557 * S_PC_11  +     0.21404029328035 * S_PC_12
          +    -0.27042984265444 * S_PC_13  +     0.04657202774732 * S_PC_14
          +     0.36682212283702 * S_PC_15  +     0.58999310845876 * S_PC_16
          +    -0.63185338323755 * S_PC_17  +    -0.47445887654202 * S_PC_2
          +     0.05620683889662 * S_PC_3  +    -0.27699101353178 * S_PC_4
          +    -0.13567281097834 * S_PC_5  +    -0.18272982323213 * S_PC_6
          +     0.20610837478777 * S_PC_7  +     0.10320859948764 * S_PC_8
          +     0.12065281442441 * S_PC_9  +     -0.0605809550752 *
        S_Year_Birth ;
   H13  =    -0.77180379369522 * S_PC_1  +    -0.09323855070306 * S_PC_10
          +    -0.23585334471306 * S_PC_11  +     0.04781156320899 * S_PC_12
          +     -0.3700858361991 * S_PC_13  +     0.85937640415965 * S_PC_14
          +    -0.06138271078998 * S_PC_15  +      0.1938030316727 * S_PC_16
          +     0.07804776520336 * S_PC_17  +    -1.09437999462919 * S_PC_2
          +    -0.41042427670929 * S_PC_3  +     0.41399292129101 * S_PC_4
          +    -0.15565409173322 * S_PC_5  +     0.17868269952098 * S_PC_6
          +    -0.02576921888753 * S_PC_7  +     0.38854380533175 * S_PC_8
          +    -0.07735504596308 * S_PC_9  +    -0.35295170383727 *
        S_Year_Birth ;
   H14  =     0.04368609067765 * S_PC_1  +     0.37976440519635 * S_PC_10
          +    -0.69771643809086 * S_PC_11  +    -0.71232608576467 * S_PC_12
          +     0.79608037977429 * S_PC_13  +     0.16506021136243 * S_PC_14
          +     -0.0039906388458 * S_PC_15  +    -0.11495714358476 * S_PC_16
          +     0.52938088883283 * S_PC_17  +     0.33511180051287 * S_PC_2
          +    -0.12564500455882 * S_PC_3  +     0.41012234993818 * S_PC_4
          +     0.48470626278461 * S_PC_5  +    -0.24151100494349 * S_PC_6
          +      0.3467371231118 * S_PC_7  +    -0.18816547856508 * S_PC_8
          +    -0.18662279057133 * S_PC_9  +    -0.00309017760375 *
        S_Year_Birth ;
   H15  =     0.91853423521641 * S_PC_1  +    -0.48239932050051 * S_PC_10
          +    -0.24272827898405 * S_PC_11  +    -0.71536663613851 * S_PC_12
          +     -0.1314182451163 * S_PC_13  +    -0.11795982814623 * S_PC_14
          +     0.00161755426146 * S_PC_15  +     0.04899139354401 * S_PC_16
          +     0.53464493570325 * S_PC_17  +    -0.47531778464622 * S_PC_2
          +     0.41378563773052 * S_PC_3  +       0.387319318796 * S_PC_4
          +    -0.73158261568046 * S_PC_5  +    -0.14612596243075 * S_PC_6
          +    -0.48284476016458 * S_PC_7  +    -0.41782202704696 * S_PC_8
          +     0.49641564645767 * S_PC_9  +     0.06250518871044 *
        S_Year_Birth ;
   H16  =     0.70819105687391 * S_PC_1  +    -0.48513931652328 * S_PC_10
          +    -0.72348482492828 * S_PC_11  +    -0.28919233666817 * S_PC_12
          +     0.03554690029559 * S_PC_13  +    -0.18335863094816 * S_PC_14
          +     0.04948435041765 * S_PC_15  +      0.0232442481254 * S_PC_16
          +     0.09612244556808 * S_PC_17  +     0.24278682258458 * S_PC_2
          +     0.66667876657747 * S_PC_3  +    -0.42590544872659 * S_PC_4
          +     0.01277961498761 * S_PC_5  +      0.1340903514811 * S_PC_6
          +    -0.12551702696581 * S_PC_7  +     0.67711554270472 * S_PC_8
          +     0.59807247520609 * S_PC_9  +    -0.24911534258655 *
        S_Year_Birth ;
   H11  =    -0.95564978319691 + H11 ;
   H12  =     0.98269674890534 + H12 ;
   H13  =    -1.65400569197651 + H13 ;
   H14  =    -1.58663025393249 + H14 ;
   H15  =    -1.48054935824057 + H15 ;
   H16  =    -2.01558271631483 + H16 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
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
   P_DepVar1  =     2.43727835295856 * H11  +     0.59490358065993 * H12
          +     1.32848776996251 * H13  +    -1.54926506480899 * H14
          +     1.54357123271319 * H15  +     1.82788795118491 * H16 ;
   P_DepVar1  =    -0.73131741718223 + P_DepVar1 ;
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
H14
H15
H16
;
drop S_:;
