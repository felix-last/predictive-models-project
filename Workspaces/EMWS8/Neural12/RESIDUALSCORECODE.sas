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

      label H17 = 'Hidden: H1=7' ;

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
   H11  =    -0.57635658190396 * S_PC_1  +    -0.31351012201247 * S_PC_10
          +     0.35554236871072 * S_PC_11  +     0.46825529128996 * S_PC_12
          +    -0.37534513422477 * S_PC_13  +    -0.27110906744409 * S_PC_14
          +    -0.03970223918992 * S_PC_15  +    -0.00368328213623 * S_PC_16
          +     0.08494552733159 * S_PC_17  +     0.14575286148432 * S_PC_2
          +     0.10708586704976 * S_PC_3  +    -0.57137094863252 * S_PC_4
          +     0.33654954830967 * S_PC_5  +    -0.19099897947761 * S_PC_6
          +    -0.54884274488614 * S_PC_7  +    -0.53626765517945 * S_PC_8
          +    -0.95844798051607 * S_PC_9  +    -0.15346954705487 * 
        S_Year_Birth ;
   H12  =    -0.99754140868259 * S_PC_1  +     0.48432033889368 * S_PC_10
          +     0.13485378897804 * S_PC_11  +     0.70654387154986 * S_PC_12
          +     0.31535013010443 * S_PC_13  +     0.13352150372021 * S_PC_14
          +     0.02266953346702 * S_PC_15  +     -0.4891980125355 * S_PC_16
          +    -0.19919312353832 * S_PC_17  +    -0.19402007559395 * S_PC_2
          +    -0.44787100056646 * S_PC_3  +    -0.34998796930312 * S_PC_4
          +     0.18268054629551 * S_PC_5  +     0.39959406390493 * S_PC_6
          +     0.29629443914547 * S_PC_7  +     0.11287954527851 * S_PC_8
          +    -0.64839515869454 * S_PC_9  +    -0.19380600849554 * 
        S_Year_Birth ;
   H13  =     -1.0823067374947 * S_PC_1  +     0.03757671255421 * S_PC_10
          +    -0.88553156949014 * S_PC_11  +    -1.14340212735558 * S_PC_12
          +     0.21740954678016 * S_PC_13  +     -0.3725711948052 * S_PC_14
          +     0.31479165759956 * S_PC_15  +    -0.12010822665038 * S_PC_16
          +     0.25822787581675 * S_PC_17  +     0.20473449568327 * S_PC_2
          +     0.42895056545479 * S_PC_3  +     0.58129578141832 * S_PC_4
          +     0.81812143004044 * S_PC_5  +    -0.08541579592673 * S_PC_6
          +    -0.08298404993106 * S_PC_7  +    -0.06771155681427 * S_PC_8
          +     0.23336761981714 * S_PC_9  +      0.0401091765443 * 
        S_Year_Birth ;
   H14  =    -0.31646532994072 * S_PC_1  +     0.62489375771545 * S_PC_10
          +    -0.53010968080053 * S_PC_11  +    -0.23968869971937 * S_PC_12
          +     1.03461385619659 * S_PC_13  +    -0.46882027028342 * S_PC_14
          +     0.46734491267632 * S_PC_15  +     0.39229663491061 * S_PC_16
          +     0.08012897742232 * S_PC_17  +     0.04675555594631 * S_PC_2
          +     0.00464369091888 * S_PC_3  +     0.09395424337114 * S_PC_4
          +    -0.13384452448773 * S_PC_5  +    -0.25307416163671 * S_PC_6
          +    -0.02506188916405 * S_PC_7  +     -0.1509186430772 * S_PC_8
          +    -0.04892999983232 * S_PC_9  +    -0.13112409612727 * 
        S_Year_Birth ;
   H15  =    -0.36792335928443 * S_PC_1  +     0.37715022064516 * S_PC_10
          +    -0.34263128406455 * S_PC_11  +     0.30201456615476 * S_PC_12
          +    -0.45934658855136 * S_PC_13  +    -0.26533309504931 * S_PC_14
          +     0.36238053824316 * S_PC_15  +    -0.31713865718922 * S_PC_16
          +     -0.0765828768821 * S_PC_17  +    -0.77974070972324 * S_PC_2
          +     0.12886823717699 * S_PC_3  +     0.45610079035114 * S_PC_4
          +      0.2567880548249 * S_PC_5  +     0.23940714475233 * S_PC_6
          +    -0.06293859719329 * S_PC_7  +    -0.05522982795714 * S_PC_8
          +    -0.03013010516899 * S_PC_9  +     0.27486484306687 * 
        S_Year_Birth ;
   H16  =     0.13975575860529 * S_PC_1  +    -0.35575487248938 * S_PC_10
          +     0.02983601640638 * S_PC_11  +     0.26434219975941 * S_PC_12
          +    -0.40948666727232 * S_PC_13  +     0.20186769345139 * S_PC_14
          +     0.45170616775352 * S_PC_15  +     0.00258771853777 * S_PC_16
          +    -0.40888320799045 * S_PC_17  +    -0.18037761561331 * S_PC_2
          +     0.37721304589753 * S_PC_3  +    -0.19118634307032 * S_PC_4
          +    -0.63151251587428 * S_PC_5  +    -0.23281740347406 * S_PC_6
          +     -0.0828679380821 * S_PC_7  +     0.76178109678759 * S_PC_8
          +     0.57258725782556 * S_PC_9  +    -0.15432480762964 * 
        S_Year_Birth ;
   H17  =     0.31605900784266 * S_PC_1  +     0.34833374230803 * S_PC_10
          +     0.23320656792555 * S_PC_11  +     0.16099686297534 * S_PC_12
          +     0.27657165659696 * S_PC_13  +    -0.16386328713702 * S_PC_14
          +    -0.07457567503477 * S_PC_15  +    -0.48573025440334 * S_PC_16
          +      0.0321218057153 * S_PC_17  +     0.75395393692804 * S_PC_2
          +     0.58102263323057 * S_PC_3  +     0.03732139018296 * S_PC_4
          +     0.21321560935535 * S_PC_5  +    -0.17682802646605 * S_PC_6
          +    -0.25681275271584 * S_PC_7  +    -0.26821028181474 * S_PC_8
          +     0.15279812226638 * S_PC_9  +     0.37146205771289 * 
        S_Year_Birth ;
   H11  =    -1.16794994414366 + H11 ;
   H12  =     1.34950067589415 + H12 ;
   H13  =    -0.44254911274099 + H13 ;
   H14  =     0.15367849524818 + H14 ;
   H15  =    -1.51939092158903 + H15 ;
   H16  =      0.6953452432569 + H16 ;
   H17  =     0.58084316489966 + H17 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
   H17  = TANH(H17 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
   H17  = .;
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
   P_DepVar1  =    -1.61984691421844 * H11  +    -2.05503974494971 * H12
          +    -1.93074257008285 * H13  +    -2.19463525441367 * H14
          +     1.77553865420261 * H15  +     1.01400297881478 * H16
          +     -1.9246974233586 * H17 ;
   P_DepVar1  =    -2.20781421095695 + P_DepVar1 ;
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
