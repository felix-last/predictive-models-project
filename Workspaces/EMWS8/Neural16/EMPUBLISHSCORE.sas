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

      label H15 = 'Hidden: H1=5' ;

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
   H11  =     0.64917498634892 * S_PC_1  +    -0.11542518686923 * S_PC_10
          +     0.24789006281492 * S_PC_11  +     0.29029859048219 * S_PC_12
          +    -0.55860346522398 * S_PC_13  +     0.54359630746099 * S_PC_14
          +    -0.19601034247455 * S_PC_15  +     0.10789324573687 * S_PC_16
          +    -0.23559438156009 * S_PC_17  +    -0.26112594215329 * S_PC_2
          +    -0.05861616774393 * S_PC_3  +     0.13176125146685 * S_PC_4
          +    -0.32389209403293 * S_PC_5  +     0.06668081446802 * S_PC_6
          +     0.10687794315293 * S_PC_7  +     0.36804397754071 * S_PC_8
          +      0.5318152129643 * S_PC_9  +     0.46123908390889 *
        S_Year_Birth ;
   H12  =    -0.01801213626812 * S_PC_1  +     -0.2043873131352 * S_PC_10
          +     0.22634530500659 * S_PC_11  +      0.3082120092065 * S_PC_12
          +    -0.24845701925273 * S_PC_13  +     0.10913661031841 * S_PC_14
          +     0.07872049610669 * S_PC_15  +    -0.01772186757041 * S_PC_16
          +     0.50309876372506 * S_PC_17  +      0.0334286731814 * S_PC_2
          +    -0.22577856013151 * S_PC_3  +    -0.14899658751542 * S_PC_4
          +    -0.20131940000977 * S_PC_5  +     0.30905670035888 * S_PC_6
          +     0.27760266803506 * S_PC_7  +     0.49508176088642 * S_PC_8
          +     0.02416700614161 * S_PC_9  +     0.01961564164037 *
        S_Year_Birth ;
   H13  =    -0.32462544631852 * S_PC_1  +     0.60993570444644 * S_PC_10
          +     -0.3652943408382 * S_PC_11  +     -0.3514775281027 * S_PC_12
          +     0.91822527281221 * S_PC_13  +    -0.32876201496528 * S_PC_14
          +     0.45513294250288 * S_PC_15  +    -0.18540211347927 * S_PC_16
          +     0.29366041990964 * S_PC_17  +     0.33764635211366 * S_PC_2
          +    -0.09097395445066 * S_PC_3  +     0.13719908951988 * S_PC_4
          +     0.22703460715896 * S_PC_5  +      -0.170019235519 * S_PC_6
          +     0.21135981208747 * S_PC_7  +     0.03503879697227 * S_PC_8
          +     0.12751213936223 * S_PC_9  +     0.14125995298539 *
        S_Year_Birth ;
   H14  =    -0.88644905388941 * S_PC_1  +     0.11946463876825 * S_PC_10
          +     0.20700553386505 * S_PC_11  +     0.24426124990122 * S_PC_12
          +    -0.29204136607957 * S_PC_13  +     0.29253451421205 * S_PC_14
          +     0.09583889495069 * S_PC_15  +     0.08393526308586 * S_PC_16
          +     -0.1382524970935 * S_PC_17  +    -0.77151881971786 * S_PC_2
          +    -0.63302889267132 * S_PC_3  +     0.98515158315972 * S_PC_4
          +    -0.26847098635021 * S_PC_5  +    -0.37537538399943 * S_PC_6
          +     0.28730733138223 * S_PC_7  +     0.60783744480259 * S_PC_8
          +     0.26786199050734 * S_PC_9  +    -0.12348475922953 *
        S_Year_Birth ;
   H15  =     1.04025741702379 * S_PC_1  +    -0.37094641060303 * S_PC_10
          +    -0.28614666270019 * S_PC_11  +    -0.42824232140855 * S_PC_12
          +     -0.3133983107983 * S_PC_13  +    -0.11984699072712 * S_PC_14
          +     0.03677712851734 * S_PC_15  +      0.0269831970411 * S_PC_16
          +     0.24557112569993 * S_PC_17  +    -0.18797666621001 * S_PC_2
          +     0.29958293056896 * S_PC_3  +    -0.22470684397488 * S_PC_4
          +     0.04580208795813 * S_PC_5  +     0.19624354198997 * S_PC_6
          +    -0.01223221841943 * S_PC_7  +    -0.12295109489073 * S_PC_8
          +     0.39210110562341 * S_PC_9  +    -0.04264256894107 *
        S_Year_Birth ;
   H11  =    -0.58201165596022 + H11 ;
   H12  =    -1.05981403552709 + H12 ;
   H13  =    -0.58494097725461 + H13 ;
   H14  =    -0.98625097571698 + H14 ;
   H15  =    -1.85258286090269 + H15 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     1.22863049133923 * H11  +     0.28699946905127 * H12
          +    -2.51725413522976 * H13  +     1.82433485707779 * H14
          +     2.87826463194671 * H15 ;
   P_DepVar1  =     -1.1116551400942 + P_DepVar1 ;
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
H15
;
drop S_:;
