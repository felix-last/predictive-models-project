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
   H11  =    -0.19743350968758 * S_PC_1  +     0.30445645806298 * S_PC_10
          +    -0.29319213945098 * S_PC_11  +    -0.25119278206844 * S_PC_12
          +     0.58266759398859 * S_PC_13  +    -0.27174585445956 * S_PC_14
          +     0.22659187495583 * S_PC_15  +      0.0345118108645 * S_PC_16
          +     0.12263049485603 * S_PC_17  +     0.19964403857859 * S_PC_2
          +     0.15954583818685 * S_PC_3  +     -0.2857245627066 * S_PC_4
          +     0.06098551342127 * S_PC_5  +    -0.08058581454455 * S_PC_6
          +     0.03452248935562 * S_PC_7  +    -0.14856891517951 * S_PC_8
          +    -0.23636852409867 * S_PC_9  +    -0.19324045106995 * 
        S_Year_Birth ;
   H12  =     1.14358504176708 * S_PC_1  +    -0.36192369706387 * S_PC_10
          +    -0.43744112108977 * S_PC_11  +    -0.71275370600445 * S_PC_12
          +    -0.34045125272447 * S_PC_13  +    -0.15036565546979 * S_PC_14
          +     0.09646564503434 * S_PC_15  +      0.0305829416967 * S_PC_16
          +     0.24019272351574 * S_PC_17  +      -0.293912312459 * S_PC_2
          +     0.56149100357954 * S_PC_3  +    -0.49607477801031 * S_PC_4
          +     0.06419630336205 * S_PC_5  +    -0.04699602508661 * S_PC_6
          +    -0.21664449801506 * S_PC_7  +    -0.22336257677766 * S_PC_8
          +       0.454170642483 * S_PC_9  +     0.00592873995939 * 
        S_Year_Birth ;
   H13  =    -0.22672349443199 * S_PC_1  +     -0.2582497841995 * S_PC_10
          +    -0.17326402021021 * S_PC_11  +     0.30935515268934 * S_PC_12
          +    -0.24201742001607 * S_PC_13  +     0.54976933292529 * S_PC_14
          +     0.10932488301679 * S_PC_15  +     0.96661941192331 * S_PC_16
          +    -0.08469518132767 * S_PC_17  +    -0.81412040243848 * S_PC_2
          +    -0.25637624627426 * S_PC_3  +    -0.17164857394469 * S_PC_4
          +     -0.9026842943155 * S_PC_5  +     0.05018319109787 * S_PC_6
          +     0.88423272215876 * S_PC_7  +     0.43376749549251 * S_PC_8
          +     -0.1720661342962 * S_PC_9  +    -0.75152134262635 * 
        S_Year_Birth ;
   H11  =      0.3458013028559 + H11 ;
   H12  =    -2.55079965313883 + H12 ;
   H13  =    -1.09335829129594 + H13 ;
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
   P_DepVar1  =     -3.3783400757259 * H11  +     2.62212015591933 * H12
          +     1.35325151350957 * H13 ;
   P_DepVar1  =     0.02395615191895 + P_DepVar1 ;
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
