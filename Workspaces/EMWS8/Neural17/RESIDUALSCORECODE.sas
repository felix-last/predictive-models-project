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

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

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
   PC_18 , 
   PC_19 , 
   PC_2 , 
   PC_20 , 
   PC_3 , 
   PC_4 , 
   PC_5 , 
   PC_6 , 
   PC_7 , 
   PC_8 , 
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.80198391473189 * S_PC_1  +     0.07708508420536 * S_PC_10
          +     -0.5948998693841 * S_PC_11  +    -0.30258026092996 * S_PC_12
          +     0.62978702534845 * S_PC_13  +    -0.18440367078326 * S_PC_14
          +     0.03609752993847 * S_PC_15  +     -0.0158699190811 * S_PC_16
          +     0.08479109608464 * S_PC_17  +     0.22074179293199 * S_PC_18
          +     0.05587168708953 * S_PC_19  +    -0.52582185578693 * S_PC_2
          +     -0.1704911233661 * S_PC_20  +     0.18407674284966 * S_PC_3
          +    -0.16074562523243 * S_PC_4  +     0.25965461789084 * S_PC_5
          +     0.02193795171249 * S_PC_6  +    -0.43234039683813 * S_PC_7
          +     0.11315161819822 * S_PC_8  +     0.33948270631366 * S_PC_9 ;
   H12  =     0.32630640539486 * S_PC_1  +    -0.18827402438513 * S_PC_10
          +    -0.23087928007265 * S_PC_11  +     0.03493530555871 * S_PC_12
          +     0.12051812703396 * S_PC_13  +      0.0513581513656 * S_PC_14
          +    -0.49135083322755 * S_PC_15  +    -0.23424715443797 * S_PC_16
          +     0.03914512655981 * S_PC_17  +    -0.53824791847252 * S_PC_18
          +     0.30776644946853 * S_PC_19  +     0.13349406224181 * S_PC_2
          +    -0.11394672965484 * S_PC_20  +      -0.173025831095 * S_PC_3
          +      0.0596702766945 * S_PC_4  +      0.0198642679923 * S_PC_5
          +     0.33517478651526 * S_PC_6  +     0.34391129030453 * S_PC_7
          +       0.244214398189 * S_PC_8  +     0.20060837127761 * S_PC_9 ;
   H13  =    -0.50165061292441 * S_PC_1  +    -0.04906900800182 * S_PC_10
          +      0.2094735190825 * S_PC_11  +    -1.09134317241624 * S_PC_12
          +    -0.45730759613847 * S_PC_13  +     0.27941725761496 * S_PC_14
          +     0.39576395537005 * S_PC_15  +    -0.27911526586632 * S_PC_16
          +    -0.21488175741829 * S_PC_17  +     0.04692577002415 * S_PC_18
          +     0.16955029139987 * S_PC_19  +     0.37415150489766 * S_PC_2
          +    -0.21450975788851 * S_PC_20  +     0.28599965341518 * S_PC_3
          +     0.21163742091763 * S_PC_4  +    -0.40005683564553 * S_PC_5
          +    -0.05087785160495 * S_PC_6  +    -0.01506065828513 * S_PC_7
          +    -0.21982278245544 * S_PC_8  +    -0.19279076886166 * S_PC_9 ;
   H14  =     0.07127535568688 * S_PC_1  +     0.04611331763825 * S_PC_10
          +     0.30931344665073 * S_PC_11  +     0.26225413082664 * S_PC_12
          +    -0.42058323229822 * S_PC_13  +     0.22290902292145 * S_PC_14
          +     0.25358975917078 * S_PC_15  +     0.16235345145156 * S_PC_16
          +    -0.28224656420819 * S_PC_17  +     0.01421979977613 * S_PC_18
          +     0.01504451054749 * S_PC_19  +     0.06056237599599 * S_PC_2
          +     0.68543710616544 * S_PC_20  +      0.5351426365446 * S_PC_3
          +    -0.00979328654574 * S_PC_4  +    -0.19733418333457 * S_PC_5
          +    -0.22080181434332 * S_PC_6  +    -0.39667071628489 * S_PC_7
          +     0.26455382261102 * S_PC_8  +    -0.26576561054478 * S_PC_9 ;
   H15  =    -0.24815516431503 * S_PC_1  +    -0.10488618962533 * S_PC_10
          +    -0.29131882794665 * S_PC_11  +     0.55447570979721 * S_PC_12
          +    -0.04345251268852 * S_PC_13  +    -0.12556631023208 * S_PC_14
          +     0.16535314218308 * S_PC_15  +    -0.17910412775688 * S_PC_16
          +     0.23546805975312 * S_PC_17  +     0.36973241986018 * S_PC_18
          +     0.28497024353409 * S_PC_19  +     -0.2501385107508 * S_PC_2
          +     0.41677435218436 * S_PC_20  +    -0.89705657018228 * S_PC_3
          +     0.30997351641103 * S_PC_4  +    -0.04224204786498 * S_PC_5
          +     0.54565474283324 * S_PC_6  +    -0.07367244349298 * S_PC_7
          +     0.32727083699484 * S_PC_8  +    -0.40586165138302 * S_PC_9 ;
   H16  =    -0.65598956024437 * S_PC_1  +    -0.29182482640965 * S_PC_10
          +     0.19411602647874 * S_PC_11  +     0.22341860288984 * S_PC_12
          +    -0.33859608620455 * S_PC_13  +     0.01609680413712 * S_PC_14
          +       0.170007335229 * S_PC_15  +    -0.34059153042813 * S_PC_16
          +    -0.10031509001666 * S_PC_17  +    -0.33458438180878 * S_PC_18
          +    -0.03535656535892 * S_PC_19  +     0.20787229159824 * S_PC_2
          +      0.2089782140284 * S_PC_20  +    -0.21127272477202 * S_PC_3
          +     0.03521507209015 * S_PC_4  +    -0.01489261680876 * S_PC_5
          +     0.09893921399038 * S_PC_6  +     0.06253881181252 * S_PC_7
          +      0.2145737460009 * S_PC_8  +    -0.33000997858307 * S_PC_9 ;
   H11  =    -1.88928698286099 + H11 ;
   H12  =     0.99057628162191 + H12 ;
   H13  =     0.52726938869037 + H13 ;
   H14  =    -1.75324864668186 + H14 ;
   H15  =    -1.19252503712806 + H15 ;
   H16  =     1.49362478421754 + H16 ;
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
   P_DepVar1  =     1.45836605819469 * H11  +     0.65365187848768 * H12
          +    -2.26897139479857 * H13  +    -0.68822008048768 * H14
          +     1.01238980542398 * H15  +    -0.64752035127218 * H16 ;
   P_DepVar1  =     -1.3294475026486 + P_DepVar1 ;
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
