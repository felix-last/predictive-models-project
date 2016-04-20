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
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.12276912277718 * S_PC_1  +     0.48323850514438 * S_PC_10
          +     0.68031563674255 * S_PC_11  +     -0.3803252551397 * S_PC_12
          +    -0.38883141448506 * S_PC_13  +     0.18297524908557 * S_PC_14
          +    -0.14130961452043 * S_PC_15  +    -0.01389001966875 * S_PC_16
          +    -0.18236634446035 * S_PC_17  +     -0.2869836818767 * S_PC_2
          +    -0.43115379961177 * S_PC_3  +    -0.71689932090568 * S_PC_4
          +     1.74837235940534 * S_PC_5  +    -0.16799274296092 * S_PC_6
          +     0.59141082507893 * S_PC_7  +    -1.65708073078138 * S_PC_8
          +    -0.23653570264035 * S_PC_9  +     0.12716388854733 *
        S_Year_Birth ;
   H12  =     0.10382591217887 * S_PC_1  +     -0.3681549346254 * S_PC_10
          +     0.31589425945342 * S_PC_11  +     0.32372324560356 * S_PC_12
          +    -0.79985272291669 * S_PC_13  +     0.44553334565041 * S_PC_14
          +     -0.2442840506468 * S_PC_15  +     0.18147336438783 * S_PC_16
          +    -0.08934577134937 * S_PC_17  +    -0.42463827789577 * S_PC_2
          +    -0.37633599282137 * S_PC_3  +     0.23736328762468 * S_PC_4
          +     0.11049377724852 * S_PC_5  +     0.07326935846383 * S_PC_6
          +     0.06224514795359 * S_PC_7  +     0.27947754903632 * S_PC_8
          +     0.16450839173977 * S_PC_9  +       0.284448060549 *
        S_Year_Birth ;
   H13  =     0.78763675004794 * S_PC_1  +    -0.81811103774049 * S_PC_10
          +     0.93366477416666 * S_PC_11  +     1.16965846297343 * S_PC_12
          +    -1.42594589484618 * S_PC_13  +     0.37173637046717 * S_PC_14
          +    -0.71607370368062 * S_PC_15  +     0.03799186473187 * S_PC_16
          +    -0.83923420152049 * S_PC_17  +    -0.52658208711619 * S_PC_2
          +    -0.24847306040654 * S_PC_3  +    -0.07003003817677 * S_PC_4
          +    -0.64088623020589 * S_PC_5  +     0.24934462662515 * S_PC_6
          +    -0.63337344204133 * S_PC_7  +    -0.26492590651331 * S_PC_8
          +    -0.00550038877411 * S_PC_9  +    -0.22936134488413 *
        S_Year_Birth ;
   H14  =     1.00262648008486 * S_PC_1  +    -0.41183284890751 * S_PC_10
          +    -0.27894119697683 * S_PC_11  +    -0.61930087944226 * S_PC_12
          +    -0.33836794697515 * S_PC_13  +     0.01146036698973 * S_PC_14
          +    -0.05548117670116 * S_PC_15  +     0.07568024416566 * S_PC_16
          +     0.21649360412624 * S_PC_17  +    -0.24585285326072 * S_PC_2
          +     0.46924501567271 * S_PC_3  +    -0.29506165193626 * S_PC_4
          +     0.02711238555346 * S_PC_5  +    -0.10547210438429 * S_PC_6
          +    -0.03209348447079 * S_PC_7  +    -0.30829392539758 * S_PC_8
          +     0.43363588600606 * S_PC_9  +     0.08556015108733 *
        S_Year_Birth ;
   H11  =    -0.76298530925791 + H11 ;
   H12  =    -0.91929484612991 + H12 ;
   H13  =     1.64705273571047 + H13 ;
   H14  =    -2.24528811970628 + H14 ;
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
   P_DepVar1  =     -2.7735295605065 * H11  +     2.73796705605762 * H12
          +     2.04094779193741 * H13  +     2.95391486555169 * H14 ;
   P_DepVar1  =    -1.83401683391661 + P_DepVar1 ;
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
;
drop S_:;
