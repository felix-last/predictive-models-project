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
   H11  =     0.38540057734726 * S_PC_1  +    -0.43279453099596 * S_PC_10
          +     0.59920506067633 * S_PC_11  +     0.48682242130264 * S_PC_12
          +    -1.08699816133264 * S_PC_13  +     0.53744402592188 * S_PC_14
          +    -0.48691779739696 * S_PC_15  +      0.1451667676912 * S_PC_16
          +    -0.18650180951922 * S_PC_17  +    -0.25138739339948 * S_PC_2
          +    -0.46370648806799 * S_PC_3  +     0.12330133579362 * S_PC_4
          +    -0.04856622507452 * S_PC_5  +     0.11419647439533 * S_PC_6
          +     0.31123941806644 * S_PC_7  +     0.34505865042606 * S_PC_8
          +     0.26460680138987 * S_PC_9  +     0.26341199844406 * 
        S_Year_Birth ;
   H12  =     0.40687324472096 * S_PC_1  +      0.1276016200478 * S_PC_10
          +     0.02447385286653 * S_PC_11  +     0.14792924282834 * S_PC_12
          +    -0.34908855710684 * S_PC_13  +     0.02963069560741 * S_PC_14
          +     0.37626439148462 * S_PC_15  +     0.56033000528649 * S_PC_16
          +    -0.55088490053836 * S_PC_17  +     -0.3322155548583 * S_PC_2
          +    -0.02606666149303 * S_PC_3  +    -0.30668742927556 * S_PC_4
          +    -0.07231771082496 * S_PC_5  +    -0.22889814669629 * S_PC_6
          +     0.10728585083792 * S_PC_7  +     0.03501184370062 * S_PC_8
          +    -0.03615073442528 * S_PC_9  +    -0.10870162717056 * 
        S_Year_Birth ;
   H13  =    -0.33318211865559 * S_PC_1  +    -0.22286884176504 * S_PC_10
          +    -0.24682716658778 * S_PC_11  +    -0.01163728763928 * S_PC_12
          +     -0.3454456718463 * S_PC_13  +     0.73829435479942 * S_PC_14
          +     -0.0990081836407 * S_PC_15  +     0.23161347911742 * S_PC_16
          +     0.07564769050949 * S_PC_17  +    -1.04244198590504 * S_PC_2
          +    -0.25844197601783 * S_PC_3  +     0.47152373003238 * S_PC_4
          +    -0.19259781937509 * S_PC_5  +     0.00078589875849 * S_PC_6
          +     -0.0888806128036 * S_PC_7  +     0.26564757892785 * S_PC_8
          +     0.00956258863309 * S_PC_9  +    -0.41142005522589 * 
        S_Year_Birth ;
   H14  =    -0.01410480224419 * S_PC_1  +     0.23581611886737 * S_PC_10
          +    -0.54508192527959 * S_PC_11  +    -0.59388368211378 * S_PC_12
          +     0.56351374615403 * S_PC_13  +     0.22919203465721 * S_PC_14
          +    -0.07283089782334 * S_PC_15  +    -0.02491533703095 * S_PC_16
          +     0.46708752546199 * S_PC_17  +     0.27437505233669 * S_PC_2
          +    -0.22391635521238 * S_PC_3  +     0.40520551507185 * S_PC_4
          +     0.40102783403095 * S_PC_5  +     -0.1949097882652 * S_PC_6
          +     0.29494008634339 * S_PC_7  +    -0.20895351116474 * S_PC_8
          +    -0.08435641721926 * S_PC_9  +    -0.04482587880914 * 
        S_Year_Birth ;
   H15  =     0.80399628556177 * S_PC_1  +    -0.38115756514784 * S_PC_10
          +    -0.16836635895264 * S_PC_11  +    -0.49700220301883 * S_PC_12
          +    -0.15419701300407 * S_PC_13  +    -0.12262605462744 * S_PC_14
          +     0.05055464593811 * S_PC_15  +    -0.08029669705648 * S_PC_16
          +     0.34596061551155 * S_PC_17  +     -0.4853190843731 * S_PC_2
          +     0.34643598338729 * S_PC_3  +     0.35149689283798 * S_PC_4
          +    -0.51092356339588 * S_PC_5  +    -0.19503486634854 * S_PC_6
          +    -0.46872319403931 * S_PC_7  +    -0.19832664785317 * S_PC_8
          +     0.46629992385752 * S_PC_9  +     0.14919176659144 * 
        S_Year_Birth ;
   H16  =     0.70004906077419 * S_PC_1  +    -0.46566023468255 * S_PC_10
          +    -0.58036944108267 * S_PC_11  +    -0.28859914628773 * S_PC_12
          +     0.03246147791321 * S_PC_13  +    -0.15481919967001 * S_PC_14
          +     0.16704288888396 * S_PC_15  +     0.02640713196493 * S_PC_16
          +     0.14521434182645 * S_PC_17  +     0.24973656239109 * S_PC_2
          +     0.60652552593628 * S_PC_3  +    -0.39443886486824 * S_PC_4
          +     -0.0298254056298 * S_PC_5  +     0.12271810717246 * S_PC_6
          +    -0.05803269423954 * S_PC_7  +     0.61770305466274 * S_PC_8
          +     0.46041035686688 * S_PC_9  +    -0.16207215047224 * 
        S_Year_Birth ;
   H11  =    -0.90636151424262 + H11 ;
   H12  =     0.98573157514204 + H12 ;
   H13  =     -1.6752760530043 + H13 ;
   H14  =    -1.56754819037661 + H14 ;
   H15  =    -1.33852536109645 + H15 ;
   H16  =    -1.58885672585511 + H16 ;
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
   P_DepVar1  =     2.33532267522445 * H11  +     0.43128954284481 * H12
          +     1.21301237342546 * H13  +    -1.14394517252631 * H14
          +      1.2623603421152 * H15  +     1.41221284776522 * H16 ;
   P_DepVar1  =    -0.84619267276197 + P_DepVar1 ;
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
