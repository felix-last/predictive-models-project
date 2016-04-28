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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

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
   H1x1_1  =     0.43680201227507 * S_PC_1  +     -6.2790158097825 * S_PC_10
          +    -0.85163775862488 * S_PC_11  +    -0.47925818483654 * S_PC_12
          +     0.53949631368636 * S_PC_13  +    -1.02786919322634 * S_PC_14
          +     1.05380889262599 * S_PC_15  +     0.42199683608767 * S_PC_16
          +    -0.71911349630558 * S_PC_17  +     1.49052849216329 * S_PC_2
          +     2.01791864422989 * S_PC_3  +     0.50251490560603 * S_PC_4
          +     2.37547414637231 * S_PC_5  +    -12.9780560511029 * S_PC_6
          +     3.16615596569995 * S_PC_7  +    -0.95122743907623 * S_PC_8
          +     0.60588801007045 * S_PC_9  +    -1.68407195457659 *
        S_Year_Birth ;
   H1x1_2  =     1.63884455838679 * S_PC_1  +     1.55805646615441 * S_PC_10
          +       0.871527478556 * S_PC_11  +    -1.86644786352904 * S_PC_12
          +     0.41262512952967 * S_PC_13  +    -0.22890984418147 * S_PC_14
          +    -0.48543757796659 * S_PC_15  +     0.45387364017022 * S_PC_16
          +     0.56687737066004 * S_PC_17  +    -4.72959850328856 * S_PC_2
          +    -3.28098421689064 * S_PC_3  +     2.18992266997339 * S_PC_4
          +     1.40182849048979 * S_PC_5  +     -0.0909042963425 * S_PC_6
          +     1.04679329187044 * S_PC_7  +    -6.82015390191902 * S_PC_8
          +    -1.56263590917838 * S_PC_9  +     0.77238679717726 *
        S_Year_Birth ;
   H1x1_1  =     4.05028790797153 + H1x1_1 ;
   H1x1_2  =     1.11077500443451 + H1x1_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.49133572641194 * S_PC_1  +    -3.63139547485729 * S_PC_10
          +    -2.85339070710028 * S_PC_11  +     0.77282036887084 * S_PC_12
          +    -0.66851763433834 * S_PC_13  +    -3.91056372100105 * S_PC_14
          +     1.87346503010337 * S_PC_15  +    -0.07558934876683 * S_PC_16
          +     0.42787488264488 * S_PC_17  +    -2.88492824877701 * S_PC_2
          +    -0.31661887817892 * S_PC_3  +     2.91913215925162 * S_PC_4
          +    -2.71227883848425 * S_PC_5  +     1.38175958071778 * S_PC_6
          +     2.36276963584368 * S_PC_7  +     1.22943836582433 * S_PC_8
          +    -1.27876292661165 * S_PC_9  +    -1.37310011899913 *
        S_Year_Birth ;
   H1x2_2  =     1.13194891980772 * S_PC_1  +       1.200296031517 * S_PC_10
          +      1.9424285056754 * S_PC_11  +    -0.72512252212605 * S_PC_12
          +     0.42487518228862 * S_PC_13  +    -0.51909348949551 * S_PC_14
          +     0.46199702179315 * S_PC_15  +     1.55734866191972 * S_PC_16
          +    -0.24286430970891 * S_PC_17  +     0.23604119250321 * S_PC_2
          +    -0.48848660893775 * S_PC_3  +    -1.13412105084126 * S_PC_4
          +     2.75507735274993 * S_PC_5  +    -0.17128767064677 * S_PC_6
          +    -1.57104436529298 * S_PC_7  +    -0.46913090608696 * S_PC_8
          +     2.07900112911328 * S_PC_9  +     0.03363552766376 *
        S_Year_Birth ;
   H1x2_1  =    -0.43155049224367 + H1x2_1 ;
   H1x2_2  =    -2.78257059016385 + H1x2_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -0.58628901827172 * H1x1_1  +    -0.38264717664894 * H1x1_2 ;
   H2x1_2  =     3.34114365917939 * H1x1_1  +     5.29708430378954 * H1x1_2 ;
   H2x1_1  = H2x1_1  +      2.5805656289524 * H1x2_1
          +    -1.49998755966571 * H1x2_2 ;
   H2x1_2  = H2x1_2  +    -1.69181018760832 * H1x2_1
          +    -2.07716568009834 * H1x2_2 ;
   H2x1_1  =    -0.33385262176294 + H2x1_1 ;
   H2x1_2  =     -2.8869129511929 + H2x1_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
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
   P_DepVar1  =     3.04524518437786 * H2x1_1  +     -10.199120548994 * H2x1_2
         ;
   P_DepVar1  =       0.762279546697 + P_DepVar1 ;
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
