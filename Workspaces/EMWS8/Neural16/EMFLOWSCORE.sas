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
   H11  =    -0.87985529033799 * S_PC_1  +      0.4152785354231 * S_PC_10
          +     0.16304061845821 * S_PC_11  +    -1.08952456253231 * S_PC_12
          +    -0.16499878790638 * S_PC_13  +     0.19700943516303 * S_PC_14
          +     0.53442619963231 * S_PC_15  +      0.0815645407254 * S_PC_16
          +   6.1455055097511E-6 * S_PC_17  +     0.07812797264138 * S_PC_18
          +     0.26452881915421 * S_PC_19  +     0.30583304789004 * S_PC_2
          +    -0.32419603128176 * S_PC_20  +     -0.0833314603569 * S_PC_3
          +     0.04262550204266 * S_PC_4  +    -0.21735745688106 * S_PC_5
          +      0.1348067968051 * S_PC_6  +     0.40300328062441 * S_PC_7
          +     0.07220012227881 * S_PC_8  +     0.02207129291614 * S_PC_9 ;
   H12  =    -0.06239839954804 * S_PC_1  +    -0.09366838465157 * S_PC_10
          +     0.21674055039123 * S_PC_11  +    -0.68919872418019 * S_PC_12
          +    -0.51637010014787 * S_PC_13  +     0.43448520498453 * S_PC_14
          +     0.37791340490797 * S_PC_15  +    -0.19605244792313 * S_PC_16
          +    -0.49183394762114 * S_PC_17  +    -0.06749843982042 * S_PC_18
          +    -0.15677101252688 * S_PC_19  +     0.21931506187758 * S_PC_2
          +    -0.03591136499868 * S_PC_20  +      0.5255916432353 * S_PC_3
          +     0.15627761072467 * S_PC_4  +    -0.32262529596664 * S_PC_5
          +    -0.24589578477619 * S_PC_6  +    -0.28063301975163 * S_PC_7
          +    -0.31136287591008 * S_PC_8  +    -0.35176991649543 * S_PC_9 ;
   H13  =     0.37052892991841 * S_PC_1  +      0.1687438946533 * S_PC_10
          +       0.068099816462 * S_PC_11  +     0.22987344695229 * S_PC_12
          +    -0.22902963201428 * S_PC_13  +     0.22080646380864 * S_PC_14
          +     0.37164255702642 * S_PC_15  +    -0.15731845659531 * S_PC_16
          +     0.29873092498289 * S_PC_17  +      0.1741334918859 * S_PC_18
          +    -0.47273307030547 * S_PC_19  +     -0.4922299619117 * S_PC_2
          +     0.22022101683962 * S_PC_20  +    -0.18421049528395 * S_PC_3
          +    -0.28181283254668 * S_PC_4  +      0.3762263284981 * S_PC_5
          +      0.1007429976165 * S_PC_6  +     0.06044830530293 * S_PC_7
          +     0.01172087969661 * S_PC_8  +     0.09245378584311 * S_PC_9 ;
   H14  =     0.90297640290994 * S_PC_1  +     0.13041948161047 * S_PC_10
          +    -0.77535837019772 * S_PC_11  +     -0.4424107690377 * S_PC_12
          +      0.5346610917079 * S_PC_13  +     -0.0701245027896 * S_PC_14
          +    -0.00018660615555 * S_PC_15  +     0.05343050394459 * S_PC_16
          +    -0.42739884380956 * S_PC_17  +     0.14491285182751 * S_PC_18
          +     0.02196339681148 * S_PC_19  +    -0.37840184707797 * S_PC_2
          +    -0.26449974044339 * S_PC_20  +      0.0580160083302 * S_PC_3
          +     0.17275625837165 * S_PC_4  +     0.23728001728638 * S_PC_5
          +    -0.25336545677081 * S_PC_6  +    -0.11879047198835 * S_PC_7
          +     0.06848057468918 * S_PC_8  +     0.17053256761161 * S_PC_9 ;
   H15  =      0.3319456803623 * S_PC_1  +    -0.25135311361426 * S_PC_10
          +     0.09574430997605 * S_PC_11  +    -0.36351435720739 * S_PC_12
          +     0.01726694741167 * S_PC_13  +    -0.20185311900782 * S_PC_14
          +    -0.10881397718959 * S_PC_15  +    -0.11026903256573 * S_PC_16
          +    -0.21891970158533 * S_PC_17  +     0.27773436101815 * S_PC_18
          +    -0.12362685539569 * S_PC_19  +     0.63984488191459 * S_PC_2
          +     -0.2844463126829 * S_PC_20  +     0.35355643835888 * S_PC_3
          +    -0.16184446366215 * S_PC_4  +     0.09427477587857 * S_PC_5
          +    -0.17568709507984 * S_PC_6  +     0.12650152831378 * S_PC_7
          +    -0.10817882174405 * S_PC_8  +     0.33635078131267 * S_PC_9 ;
   H11  =    -0.63710174373913 + H11 ;
   H12  =      0.8457781571662 + H12 ;
   H13  =     0.28261520959472 + H13 ;
   H14  =    -1.04295478102168 + H14 ;
   H15  =      0.8730078251022 + H15 ;
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
   P_DepVar1  =    -1.62512633780867 * H11  +    -2.22884014235958 * H12
          +     0.56589376280567 * H13  +     1.68131825229002 * H14
          +    -0.46219982424784 * H15 ;
   P_DepVar1  =    -1.78280840151976 + P_DepVar1 ;
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
H15
;
drop S_:;
