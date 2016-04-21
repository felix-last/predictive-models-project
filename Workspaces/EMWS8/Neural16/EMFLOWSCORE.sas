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
   H11  =     0.68853093447805 * S_PC_1  +    -0.09785920988283 * S_PC_10
          +      0.2262793582311 * S_PC_11  +     0.42419074975693 * S_PC_12
          +    -0.54317932872036 * S_PC_13  +     0.53519140067144 * S_PC_14
          +     -0.1744270307344 * S_PC_15  +     0.18241008555072 * S_PC_16
          +    -0.25060854902398 * S_PC_17  +    -0.25611405781684 * S_PC_2
          +    -0.00673065558238 * S_PC_3  +     0.09320597300518 * S_PC_4
          +    -0.33203252569739 * S_PC_5  +     0.00590705460674 * S_PC_6
          +     0.06208675544437 * S_PC_7  +     0.33116857183597 * S_PC_8
          +     0.51908545428588 * S_PC_9  +     0.48276727358582 *
        S_Year_Birth ;
   H12  =     -0.0070856196308 * S_PC_1  +    -0.18611152691043 * S_PC_10
          +     0.22534257578583 * S_PC_11  +     0.33020451143395 * S_PC_12
          +    -0.24237020186597 * S_PC_13  +     0.10222438754058 * S_PC_14
          +      0.0802825515844 * S_PC_15  +    -0.03133698522933 * S_PC_16
          +     0.49736449030833 * S_PC_17  +     0.02917890141067 * S_PC_2
          +    -0.22205362046804 * S_PC_3  +    -0.13304083494845 * S_PC_4
          +    -0.21899822137746 * S_PC_5  +      0.3085123234701 * S_PC_6
          +     0.27342786456998 * S_PC_7  +      0.5031708850414 * S_PC_8
          +     0.01033471788288 * S_PC_9  +     0.03378228698717 *
        S_Year_Birth ;
   H13  =     -0.3421890003062 * S_PC_1  +     0.61136704886339 * S_PC_10
          +    -0.40153427369952 * S_PC_11  +    -0.33462028191119 * S_PC_12
          +     0.90217520388187 * S_PC_13  +    -0.33102298102444 * S_PC_14
          +     0.44286773830646 * S_PC_15  +     -0.1743340863053 * S_PC_16
          +     0.33888590637073 * S_PC_17  +     0.30033175969591 * S_PC_2
          +    -0.06198456990062 * S_PC_3  +     0.15206104869693 * S_PC_4
          +     0.19687028324531 * S_PC_5  +    -0.14869138924001 * S_PC_6
          +     0.23507525658256 * S_PC_7  +     0.01699882178668 * S_PC_8
          +     0.15026892128111 * S_PC_9  +     0.18169263767525 *
        S_Year_Birth ;
   H14  =    -0.89374260994687 * S_PC_1  +     0.01863540801984 * S_PC_10
          +     0.18088063260308 * S_PC_11  +      0.2353606921317 * S_PC_12
          +    -0.32363539668716 * S_PC_13  +     0.27108196537367 * S_PC_14
          +     0.06388106840059 * S_PC_15  +     0.05316247489981 * S_PC_16
          +    -0.16157724090976 * S_PC_17  +    -0.75647334309377 * S_PC_2
          +    -0.68065535863554 * S_PC_3  +     0.92989247031513 * S_PC_4
          +    -0.24569733058495 * S_PC_5  +    -0.37834002395712 * S_PC_6
          +     0.33331169771304 * S_PC_7  +     0.63251953048222 * S_PC_8
          +     0.25962175141496 * S_PC_9  +     -0.1729707105916 *
        S_Year_Birth ;
   H15  =     1.01217214844086 * S_PC_1  +    -0.35814334623573 * S_PC_10
          +    -0.29760011496376 * S_PC_11  +    -0.49659019896438 * S_PC_12
          +    -0.33762765910786 * S_PC_13  +    -0.09661228531408 * S_PC_14
          +     0.03016943976546 * S_PC_15  +     0.03847356369148 * S_PC_16
          +     0.23068042546991 * S_PC_17  +    -0.18214607129888 * S_PC_2
          +      0.2948848371398 * S_PC_3  +    -0.21096950783847 * S_PC_4
          +     -0.0076338973148 * S_PC_5  +      0.1810467647118 * S_PC_6
          +    -0.02747507656548 * S_PC_7  +    -0.12412383565914 * S_PC_8
          +     0.38941553651228 * S_PC_9  +    -0.01702181419661 *
        S_Year_Birth ;
   H11  =    -0.57247481264101 + H11 ;
   H12  =    -1.06998164899914 + H12 ;
   H13  =    -0.62403822966094 + H13 ;
   H14  =    -0.98843273802183 + H14 ;
   H15  =    -1.85576808009036 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
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
   P_DepVar1  =     1.25623874740517 * H11  +      0.3331047690966 * H12
          +    -2.49839030053881 * H13  +     1.87210386082699 * H14
          +     2.90192651429203 * H15 ;
   P_DepVar1  =    -1.10300629264999 + P_DepVar1 ;
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
;
drop S_:;
