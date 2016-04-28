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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

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
*** Writing the Node interval ;
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
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.10164757372038 * S_PC_1  +     0.23564366900821 * S_PC_10
          +     0.03218545477975 * S_PC_11  +    -0.20105633481452 * S_PC_12
          +     0.46218918894091 * S_PC_13  +    -0.29807808914991 * S_PC_14
          +     0.17583796979491 * S_PC_15  +     0.03033544353418 * S_PC_16
          +     0.25021734275353 * S_PC_17  +    -0.24021688140508 * S_PC_2
          +     -0.1102916075826 * S_PC_3  +    -0.00240745238609 * S_PC_4
          +     -0.0274131852155 * S_PC_5  +    -0.19254616122832 * S_PC_6
          +     0.11532321939184 * S_PC_7  +     -0.6677111259933 * S_PC_8
          +    -0.25753224620538 * S_PC_9  +    -0.30186388169486 *
        S_Year_Birth ;
   H1x1_2  =     0.69328570966752 * S_PC_1  +    -0.35284925856721 * S_PC_10
          +     0.02290654324776 * S_PC_11  +     0.00970894937381 * S_PC_12
          +    -0.04741179982085 * S_PC_13  +    -0.20302788277292 * S_PC_14
          +    -0.05864666074321 * S_PC_15  +     0.05995123856812 * S_PC_16
          +     0.23138477322273 * S_PC_17  +    -0.34252755127761 * S_PC_2
          +     0.17382271435334 * S_PC_3  +    -0.01868728319481 * S_PC_4
          +    -0.40174697156367 * S_PC_5  +    -0.06272489483222 * S_PC_6
          +     0.02659607049312 * S_PC_7  +    -0.10881698069286 * S_PC_8
          +     0.15346273425449 * S_PC_9  +    -0.34879716236226 *
        S_Year_Birth ;
   H1x1_3  =     0.93991744730684 * S_PC_1  +     0.21004088081659 * S_PC_10
          +     0.04043531851461 * S_PC_11  +     0.38076091002631 * S_PC_12
          +     0.34034977799818 * S_PC_13  +    -0.04437127519769 * S_PC_14
          +    -0.32171755712003 * S_PC_15  +     -0.2933258304452 * S_PC_16
          +    -0.23861752489561 * S_PC_17  +     0.46352713116162 * S_PC_2
          +    -0.09577439848272 * S_PC_3  +     0.22567854138108 * S_PC_4
          +     0.33161087629213 * S_PC_5  +    -0.34451188357259 * S_PC_6
          +     0.09767167948587 * S_PC_7  +    -0.04416656932503 * S_PC_8
          +    -0.19126765564439 * S_PC_9  +     0.01696566154262 *
        S_Year_Birth ;
   H1x1_4  =    -0.49573102444764 * S_PC_1  +     0.22232925363327 * S_PC_10
          +    -0.35780218268518 * S_PC_11  +    -0.41209217464771 * S_PC_12
          +      0.1179498443288 * S_PC_13  +     0.17628378505051 * S_PC_14
          +     0.21318677923196 * S_PC_15  +     0.07202379004462 * S_PC_16
          +    -0.08037138282193 * S_PC_17  +     0.65976091792431 * S_PC_2
          +    -0.27807281453857 * S_PC_3  +    -0.08689369989391 * S_PC_4
          +     1.00856784829836 * S_PC_5  +    -0.21706066016492 * S_PC_6
          +     0.23716358945002 * S_PC_7  +    -0.09140093918751 * S_PC_8
          +      0.0211162515675 * S_PC_9  +      0.6353422873589 *
        S_Year_Birth ;
   H1x1_5  =     0.02040134912024 * S_PC_1  +     0.05075007592975 * S_PC_10
          +    -0.15645990555913 * S_PC_11  +    -0.01709812234954 * S_PC_12
          +     0.40054996592819 * S_PC_13  +    -0.18950040503056 * S_PC_14
          +     0.06047523781982 * S_PC_15  +    -0.17743373575604 * S_PC_16
          +    -0.19467350400571 * S_PC_17  +     0.89927735899217 * S_PC_2
          +     0.44521412231525 * S_PC_3  +    -0.33298102090281 * S_PC_4
          +     0.05363089428662 * S_PC_5  +     0.03881454959471 * S_PC_6
          +    -0.22983843245132 * S_PC_7  +     0.26424334847901 * S_PC_8
          +    -0.05271169502035 * S_PC_9  +     0.00379146974401 *
        S_Year_Birth ;
   H1x1_6  =    -0.33275570391765 * S_PC_1  +     -0.2596575581091 * S_PC_10
          +      0.4888454490764 * S_PC_11  +     0.22831374108122 * S_PC_12
          +    -0.04376514466691 * S_PC_13  +    -0.13785898130709 * S_PC_14
          +    -0.11680863449762 * S_PC_15  +    -0.07518218015133 * S_PC_16
          +    -0.28918738454724 * S_PC_17  +     0.22007508424835 * S_PC_2
          +      0.4220725647584 * S_PC_3  +    -0.29485122266251 * S_PC_4
          +     0.30806088125759 * S_PC_5  +    -0.68630199360769 * S_PC_6
          +    -0.09428563446862 * S_PC_7  +    -0.54659793803024 * S_PC_8
          +    -0.41839207546201 * S_PC_9  +    -0.26675361273026 *
        S_Year_Birth ;
   H1x1_1  =     0.22559498123533 + H1x1_1 ;
   H1x1_2  =    -1.29065161913632 + H1x1_2 ;
   H1x1_3  =    -0.93756126423055 + H1x1_3 ;
   H1x1_4  =    -0.33996906467692 + H1x1_4 ;
   H1x1_5  =     1.34348361378973 + H1x1_5 ;
   H1x1_6  =     -0.7957714824619 + H1x1_6 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
   H1x1_5  = SIN(H1x1_5 );
   H1x1_6  = SIN(H1x1_6 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
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
   P_DepVar1  =    -3.58923066796587 * H1x1_1  +     2.69392081819043 * H1x1_2
          +    -1.71083444372434 * H1x1_3  +    -2.20995560146016 * H1x1_4
          +    -2.80104378083098 * H1x1_5  +    -2.08178136334122 * H1x1_6 ;
   P_DepVar1  =    -0.72100321751756 + P_DepVar1 ;
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
drop S_:;
