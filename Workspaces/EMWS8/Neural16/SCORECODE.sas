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
   H11  =     0.63485798320112 * S_PC_1  +    -0.10477176269948 * S_PC_10
          +     0.26184752074824 * S_PC_11  +     0.23906845584659 * S_PC_12
          +    -0.51362798675812 * S_PC_13  +     0.53649831892278 * S_PC_14
          +    -0.16550965082885 * S_PC_15  +     0.08963779199746 * S_PC_16
          +    -0.22854664969932 * S_PC_17  +     -0.2718375422761 * S_PC_2
          +    -0.10520565981952 * S_PC_3  +     0.14464520775348 * S_PC_4
          +    -0.36340428430683 * S_PC_5  +     0.08841175439911 * S_PC_6
          +     0.12382023838606 * S_PC_7  +     0.40356220098507 * S_PC_8
          +     0.50262016790679 * S_PC_9  +     0.41239597569241 * 
        S_Year_Birth ;
   H12  =    -0.03170129209823 * S_PC_1  +    -0.19329486349068 * S_PC_10
          +     0.24083128784168 * S_PC_11  +     0.28756274404764 * S_PC_12
          +    -0.25849881854532 * S_PC_13  +     0.12499850440002 * S_PC_14
          +     0.07646986108238 * S_PC_15  +    -0.01146226791749 * S_PC_16
          +     0.49313465756008 * S_PC_17  +     0.03756325026606 * S_PC_2
          +    -0.22130956851974 * S_PC_3  +    -0.15038689409236 * S_PC_4
          +     -0.1936231522874 * S_PC_5  +     0.30908287695375 * S_PC_6
          +     0.28242803528842 * S_PC_7  +     0.49201488080614 * S_PC_8
          +     0.01990940708468 * S_PC_9  +     0.02254382253892 * 
        S_Year_Birth ;
   H13  =    -0.33736159716995 * S_PC_1  +     0.62554367173021 * S_PC_10
          +    -0.34831070805463 * S_PC_11  +    -0.36922498575096 * S_PC_12
          +     0.94983800400642 * S_PC_13  +    -0.35859278290552 * S_PC_14
          +     0.44501576629992 * S_PC_15  +    -0.17494995053533 * S_PC_16
          +     0.30840870792191 * S_PC_17  +      0.3232437418424 * S_PC_2
          +     -0.0934348840848 * S_PC_3  +     0.14641006967036 * S_PC_4
          +      0.2004739086116 * S_PC_5  +    -0.14647803303742 * S_PC_6
          +     0.19072771899527 * S_PC_7  +     0.02891642169532 * S_PC_8
          +     0.12514276138392 * S_PC_9  +     0.15230898502359 * 
        S_Year_Birth ;
   H14  =    -0.86649119228703 * S_PC_1  +     0.13942745565709 * S_PC_10
          +     0.19051326714567 * S_PC_11  +      0.2590968446418 * S_PC_12
          +    -0.28068845804298 * S_PC_13  +     0.27304925444222 * S_PC_14
          +     0.10185343419254 * S_PC_15  +     0.06866641525222 * S_PC_16
          +     -0.1485934835166 * S_PC_17  +    -0.76032508397066 * S_PC_2
          +    -0.62162055889812 * S_PC_3  +     0.95603112187736 * S_PC_4
          +    -0.25924553394194 * S_PC_5  +    -0.37934023964572 * S_PC_6
          +     0.30742207990733 * S_PC_7  +     0.55939149551964 * S_PC_8
          +     0.23942030839495 * S_PC_9  +    -0.08485647236628 * 
        S_Year_Birth ;
   H15  =     1.02458774592717 * S_PC_1  +    -0.37954747209518 * S_PC_10
          +    -0.28184467032484 * S_PC_11  +    -0.41558464107982 * S_PC_12
          +    -0.29715733091874 * S_PC_13  +    -0.11729409586297 * S_PC_14
          +     0.05111693019056 * S_PC_15  +     0.01776303221562 * S_PC_16
          +     0.22309194254283 * S_PC_17  +    -0.19092216040796 * S_PC_2
          +      0.2996018073758 * S_PC_3  +     -0.1914691441837 * S_PC_4
          +     0.02659052050719 * S_PC_5  +     0.20194936538427 * S_PC_6
          +    -0.04560428499129 * S_PC_7  +     -0.1138247006838 * S_PC_8
          +     0.38441462800294 * S_PC_9  +    -0.03543454432849 * 
        S_Year_Birth ;
   H11  =    -0.57205266427164 + H11 ;
   H12  =    -1.05797297317597 + H12 ;
   H13  =    -0.52645850486448 + H13 ;
   H14  =    -0.98990475299524 + H14 ;
   H15  =     -1.7862898917182 + H15 ;
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
   P_DepVar1  =     1.21721053417712 * H11  +     0.25895256464462 * H12
          +    -2.48608235736238 * H13  +      1.7837986557289 * H14
          +     2.84991482748509 * H15 ;
   P_DepVar1  =    -1.11076420927493 + P_DepVar1 ;
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
