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

      label H1x1_7 = 'Hidden: H1x1_=7' ;

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
   H1x1_1  =    -2.58508868488235 * S_PC_1  +     1.20007982706189 * S_PC_10
          +    -0.55565639779815 * S_PC_11  +     0.42317882296086 * S_PC_12
          +    -0.39102984690832 * S_PC_13  +     1.05246495427875 * S_PC_14
          +    -0.58858040806579 * S_PC_15  +     0.16812135442896 * S_PC_16
          +    -1.30829654451836 * S_PC_17  +    -2.61122952105175 * S_PC_2
          +    -1.57692647141984 * S_PC_3  +    -0.31590297708381 * S_PC_4
          +       0.489265046162 * S_PC_5  +    -1.38472485127924 * S_PC_6
          +    -0.01563533914193 * S_PC_7  +     -0.6220319651245 * S_PC_8
          +    -0.94386327209471 * S_PC_9  +     0.31441338384554 * 
        S_Year_Birth ;
   H1x1_2  =     0.88777260450227 * S_PC_1  +     -1.5367639113177 * S_PC_10
          +     1.56830295981223 * S_PC_11  +     0.99729222277828 * S_PC_12
          +    -3.16964209677897 * S_PC_13  +     2.61234813943117 * S_PC_14
          +    -2.07656542974589 * S_PC_15  +    -0.17130313863934 * S_PC_16
          +    -1.77044440944524 * S_PC_17  +     -0.2326644061385 * S_PC_2
          +    -0.50943100620403 * S_PC_3  +     -0.3771206330134 * S_PC_4
          +     0.32903380119716 * S_PC_5  +     0.23500282354372 * S_PC_6
          +     0.58321759475834 * S_PC_7  +     0.45713287668241 * S_PC_8
          +     0.88501117322549 * S_PC_9  +     0.68863619416424 * 
        S_Year_Birth ;
   H1x1_3  =     2.99334493741188 * S_PC_1  +    -0.44820958746633 * S_PC_10
          +    -1.81438443050646 * S_PC_11  +    -1.04708024487716 * S_PC_12
          +     0.36182350856973 * S_PC_13  +    -0.99795057503429 * S_PC_14
          +    -0.02306764030001 * S_PC_15  +    -0.00603151951721 * S_PC_16
          +     0.23899250295769 * S_PC_17  +    -0.63426905864888 * S_PC_2
          +      0.5135153086796 * S_PC_3  +    -1.92061969649311 * S_PC_4
          +     2.09424768438312 * S_PC_5  +    -0.37281390402835 * S_PC_6
          +    -0.21099687178729 * S_PC_7  +    -0.94566915175486 * S_PC_8
          +     1.46507718843169 * S_PC_9  +     0.06013448238612 * 
        S_Year_Birth ;
   H1x1_4  =     1.48987731423111 * S_PC_1  +    -1.85153148919211 * S_PC_10
          +     -0.3389631560558 * S_PC_11  +    -0.12094342653401 * S_PC_12
          +     2.05415609819201 * S_PC_13  +    -1.30754774387893 * S_PC_14
          +     0.34915072276302 * S_PC_15  +     0.02455144958584 * S_PC_16
          +     0.38662422903481 * S_PC_17  +     1.43658486127495 * S_PC_2
          +     1.92483521589652 * S_PC_3  +    -0.93439620595414 * S_PC_4
          +    -0.77664128208153 * S_PC_5  +    -1.45726475701533 * S_PC_6
          +     0.66785571790949 * S_PC_7  +     -1.1372136165809 * S_PC_8
          +    -0.02398295407417 * S_PC_9  +    -1.36554091812833 * 
        S_Year_Birth ;
   H1x1_5  =     1.13575402726629 * S_PC_1  +     0.67756826691669 * S_PC_10
          +     3.09231877746483 * S_PC_11  +     0.56222338879196 * S_PC_12
          +     -0.4403693524401 * S_PC_13  +     0.01110919443997 * S_PC_14
          +    -0.52868244078885 * S_PC_15  +     -1.9766891325667 * S_PC_16
          +    -1.05639309934463 * S_PC_17  +    -0.38843367864894 * S_PC_2
          +    -0.05728416413602 * S_PC_3  +    -3.35395833599874 * S_PC_4
          +     2.51080150023951 * S_PC_5  +     0.43960143741785 * S_PC_6
          +      0.3591018924288 * S_PC_7  +     -0.7654535838821 * S_PC_8
          +    -1.84832829530688 * S_PC_9  +    -0.95742566630573 * 
        S_Year_Birth ;
   H1x1_6  =     3.38937489297591 * S_PC_1  +     0.94282490059107 * S_PC_10
          +    -0.53657045226494 * S_PC_11  +     0.30588002409044 * S_PC_12
          +     2.11431823492509 * S_PC_13  +     0.80354979489665 * S_PC_14
          +    -1.39191827031951 * S_PC_15  +    -2.35881541761373 * S_PC_16
          +    -0.50612708923609 * S_PC_17  +     3.22648821227008 * S_PC_2
          +    -0.95208596310227 * S_PC_3  +     1.47823552386659 * S_PC_4
          +       0.805694341473 * S_PC_5  +     0.50622170985074 * S_PC_6
          +     0.27100305891282 * S_PC_7  +    -0.61070899906227 * S_PC_8
          +     0.41488115968405 * S_PC_9  +     0.21679617310735 * 
        S_Year_Birth ;
   H1x1_7  =     1.24857319335592 * S_PC_1  +    -1.54585129542958 * S_PC_10
          +     0.20374990912286 * S_PC_11  +     0.67651255064544 * S_PC_12
          +    -0.08934011035185 * S_PC_13  +     0.17928775158548 * S_PC_14
          +    -0.58728512459532 * S_PC_15  +    -0.25865188138967 * S_PC_16
          +     0.03670265464573 * S_PC_17  +    -1.99195066147747 * S_PC_2
          +    -0.39069389727288 * S_PC_3  +     2.07633421509856 * S_PC_4
          +     -3.6389806439859 * S_PC_5  +     0.16416743850622 * S_PC_6
          +    -0.88404145577722 * S_PC_7  +     0.26579739303631 * S_PC_8
          +    -0.60630749755757 * S_PC_9  +    -0.48806868744766 * 
        S_Year_Birth ;
   H1x1_1  =     3.04814503173639 + H1x1_1 ;
   H1x1_2  =     0.84692088384215 + H1x1_2 ;
   H1x1_3  =     -4.4673681519001 + H1x1_3 ;
   H1x1_4  =     3.86809032308226 + H1x1_4 ;
   H1x1_5  =    -2.92592869915112 + H1x1_5 ;
   H1x1_6  =    -2.81049837671073 + H1x1_6 ;
   H1x1_7  =     1.32306129907914 + H1x1_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
   H1x1_6  = 1.0 / (1.0 + EXP(MIN( - H1x1_6 , _EXP_BAR)));
   H1x1_7  = 1.0 / (1.0 + EXP(MIN( - H1x1_7 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
   H1x1_7  = .;
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
   P_DepVar1  =    -3.64327321711916 * H1x1_1  +     5.38823627761681 * H1x1_2
          +     5.52777341732681 * H1x1_3  +    -5.13480555699473 * H1x1_4
          +    -6.08116192343294 * H1x1_5  +    -4.72257685787279 * H1x1_6
          +     10.0081185533487 * H1x1_7 ;
   P_DepVar1  =     -4.2842153593235 + P_DepVar1 ;
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