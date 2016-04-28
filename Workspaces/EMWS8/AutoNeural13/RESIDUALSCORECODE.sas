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
   H1x1_1  =    -0.32594323715507 * S_PC_1  +     0.35601244497616 * S_PC_10
          +     0.23551037194578 * S_PC_11  +     0.36329343976958 * S_PC_12
          +     0.18625241284147 * S_PC_13  +    -0.26738645821727 * S_PC_14
          +    -0.11334514198957 * S_PC_15  +    -0.13541776549359 * S_PC_16
          +     0.01536562915516 * S_PC_17  +    -0.37475909603056 * S_PC_2
          +    -0.39525354848961 * S_PC_3  +     0.23407225580273 * S_PC_4
          +     0.14886448532502 * S_PC_5  +    -0.07500687735169 * S_PC_6
          +     0.29657240921985 * S_PC_7  +    -0.41074019492767 * S_PC_8
          +    -0.46585918851858 * S_PC_9  +    -0.03775321190087 * 
        S_Year_Birth ;
   H1x1_2  =      0.2295203400892 * S_PC_1  +    -0.33102630465707 * S_PC_10
          +      0.3982295545742 * S_PC_11  +     0.20462619478042 * S_PC_12
          +    -0.68487726222023 * S_PC_13  +     0.37650172545509 * S_PC_14
          +    -0.27887735958753 * S_PC_15  +    -0.02581469991742 * S_PC_16
          +    -0.28205659737284 * S_PC_17  +    -0.10182055063415 * S_PC_2
          +     0.12812251643176 * S_PC_3  +    -0.23066282129667 * S_PC_4
          +     0.07541284680186 * S_PC_5  +     0.24012121689661 * S_PC_6
          +     0.13842613504509 * S_PC_7  +     0.05569302549963 * S_PC_8
          +     0.21283858437275 * S_PC_9  +    -0.07763224593416 * 
        S_Year_Birth ;
   H1x1_3  =    -0.81897893610437 * S_PC_1  +     0.17086737000156 * S_PC_10
          +    -0.41456412659338 * S_PC_11  +    -0.10210116836733 * S_PC_12
          +    -0.01781792809366 * S_PC_13  +     0.87937511104362 * S_PC_14
          +     0.11363426216873 * S_PC_15  +     0.15473733315317 * S_PC_16
          +    -0.25728762971414 * S_PC_17  +     0.14902434266152 * S_PC_2
          +    -0.54672153901076 * S_PC_3  +     0.68025560498171 * S_PC_4
          +     0.38503442452439 * S_PC_5  +     0.12957351960793 * S_PC_6
          +    -0.55840202311292 * S_PC_7  +    -0.04966795126386 * S_PC_8
          +    -0.18806551125208 * S_PC_9  +     1.14929153435805 * 
        S_Year_Birth ;
   H1x1_4  =    -0.14487980505225 * S_PC_1  +     0.17192203332047 * S_PC_10
          +     0.03195160273321 * S_PC_11  +    -0.08689400274427 * S_PC_12
          +     0.38089132351821 * S_PC_13  +     -0.0266430724512 * S_PC_14
          +     0.04400113177839 * S_PC_15  +    -0.11330745510845 * S_PC_16
          +    -0.02017896419464 * S_PC_17  +      0.3275023839513 * S_PC_2
          +     0.12820167568493 * S_PC_3  +    -0.21125497799085 * S_PC_4
          +     0.24494493836545 * S_PC_5  +    -0.05439626774834 * S_PC_6
          +    -0.00677402946214 * S_PC_7  +    -0.14431119046299 * S_PC_8
          +    -0.05606535418296 * S_PC_9  +    -0.10392063931961 * 
        S_Year_Birth ;
   H1x1_5  =     0.46644634016117 * S_PC_1  +     0.24966722326697 * S_PC_10
          +    -0.50204053155973 * S_PC_11  +    -0.16163921287329 * S_PC_12
          +     -0.2117873065953 * S_PC_13  +     0.00321866119698 * S_PC_14
          +      0.0699390312895 * S_PC_15  +     0.04948301682548 * S_PC_16
          +      0.3193284933053 * S_PC_17  +     0.83054970008779 * S_PC_2
          +       0.926899452502 * S_PC_3  +    -0.65951796203459 * S_PC_4
          +    -0.04590479970431 * S_PC_5  +    -0.34410773240721 * S_PC_6
          +    -0.57666665311988 * S_PC_7  +     0.13200105511652 * S_PC_8
          +     0.22557835400272 * S_PC_9  +     0.37883228433977 * 
        S_Year_Birth ;
   H1x1_1  =    -1.47213938689482 + H1x1_1 ;
   H1x1_2  =     0.04468453740373 + H1x1_2 ;
   H1x1_3  =     1.02710140676845 + H1x1_3 ;
   H1x1_4  =     0.72012823118527 + H1x1_4 ;
   H1x1_5  =      0.2940192888358 + H1x1_5 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
   H1x1_5  = SIN(H1x1_5 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
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
   P_DepVar1  =      2.8481167326349 * H1x1_1  +     2.49835781491849 * H1x1_2
          +    -1.58189403173494 * H1x1_3  +    -3.82498978068274 * H1x1_4
          +     -1.3633590212543 * H1x1_5 ;
   P_DepVar1  =     0.71854967580477 + P_DepVar1 ;
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
