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
   H11  =      0.2142022960337 * S_PC_1  +     0.45958481274618 * S_PC_10
          +     0.69707764460073 * S_PC_11  +    -0.28731584859801 * S_PC_12
          +    -0.36950107897164 * S_PC_13  +     0.18809798735641 * S_PC_14
          +     -0.2130015500898 * S_PC_15  +      0.0071701964964 * S_PC_16
          +    -0.16484342463114 * S_PC_17  +    -0.45239110771446 * S_PC_2
          +    -0.46983508200606 * S_PC_3  +    -0.66796376673143 * S_PC_4
          +     1.74809683790662 * S_PC_5  +    -0.13522760990537 * S_PC_6
          +     0.55932520504169 * S_PC_7  +     -1.6522575410041 * S_PC_8
          +    -0.27156327412277 * S_PC_9  +     0.13502580420273 * 
        S_Year_Birth ;
   H12  =     0.11812229131662 * S_PC_1  +    -0.30871683896859 * S_PC_10
          +     0.27201131036585 * S_PC_11  +     0.30251258127641 * S_PC_12
          +    -0.67346016770754 * S_PC_13  +     0.37176061574683 * S_PC_14
          +    -0.23991822296987 * S_PC_15  +     0.16688456482026 * S_PC_16
          +    -0.07997426604796 * S_PC_17  +    -0.37489008231683 * S_PC_2
          +    -0.31917168095976 * S_PC_3  +      0.1852305444751 * S_PC_4
          +     0.12292563944212 * S_PC_5  +       0.040943627574 * S_PC_6
          +     0.06243182785513 * S_PC_7  +      0.2576666765474 * S_PC_8
          +     0.14669869508947 * S_PC_9  +     0.25287680510356 * 
        S_Year_Birth ;
   H13  =     0.64343224615395 * S_PC_1  +    -0.70988675774855 * S_PC_10
          +     0.88271581211552 * S_PC_11  +     0.96991990033944 * S_PC_12
          +    -1.17246354807186 * S_PC_13  +     0.46319326792627 * S_PC_14
          +    -0.68647913740539 * S_PC_15  +    -0.01341897678398 * S_PC_16
          +    -0.77351032460481 * S_PC_17  +    -0.57723175268209 * S_PC_2
          +    -0.11732850831905 * S_PC_3  +    -0.04783645844047 * S_PC_4
          +    -0.64916508516345 * S_PC_5  +     0.29343176558715 * S_PC_6
          +    -0.54745345702111 * S_PC_7  +    -0.21360252466545 * S_PC_8
          +    -0.12601782119443 * S_PC_9  +    -0.23396269663696 * 
        S_Year_Birth ;
   H14  =      1.0341215312277 * S_PC_1  +    -0.39415731025938 * S_PC_10
          +    -0.32060014638152 * S_PC_11  +    -0.61669234969925 * S_PC_12
          +    -0.31179815348792 * S_PC_13  +    -0.00798094231062 * S_PC_14
          +    -0.02653679285646 * S_PC_15  +     0.07670313502809 * S_PC_16
          +     0.21136382302776 * S_PC_17  +    -0.22154119624002 * S_PC_2
          +     0.47642619465816 * S_PC_3  +    -0.31672307688174 * S_PC_4
          +     0.05874501739573 * S_PC_5  +    -0.05897167931726 * S_PC_6
          +    -0.09671465231304 * S_PC_7  +    -0.31597714355748 * S_PC_8
          +     0.43891531065352 * S_PC_9  +     0.09716703238388 * 
        S_Year_Birth ;
   H11  =    -0.54498134015293 + H11 ;
   H12  =    -0.74199857282203 + H12 ;
   H13  =     1.38839834700907 + H13 ;
   H14  =     -2.2533612485392 + H14 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -2.60708041357943 * H11  +     3.00483048817261 * H12
          +     1.87856416825462 * H13  +      2.8062260938905 * H14 ;
   P_DepVar1  =    -1.50175498849739 + P_DepVar1 ;
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
