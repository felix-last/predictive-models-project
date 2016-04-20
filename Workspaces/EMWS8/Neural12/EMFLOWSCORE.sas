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
   H11  =    -0.50754467864853 * S_PC_1  +     -0.0096262574398 * S_PC_10
          +     0.14323564519461 * S_PC_11  +     0.41688732719144 * S_PC_12
          +    -0.23105960395492 * S_PC_13  +    -0.13983457141569 * S_PC_14
          +    -0.09058252871003 * S_PC_15  +     0.13317372705745 * S_PC_16
          +    -0.06281696709893 * S_PC_17  +     0.13346779435623 * S_PC_2
          +     0.19827524013856 * S_PC_3  +    -0.49078002762886 * S_PC_4
          +     0.28666139703857 * S_PC_5  +    -0.10378052990351 * S_PC_6
          +     -0.1968548602707 * S_PC_7  +    -0.45560761696887 * S_PC_8
          +     -0.8114558504722 * S_PC_9  +    -0.09343131455845 *
        S_Year_Birth ;
   H12  =    -0.81573558098063 * S_PC_1  +     0.24773437846044 * S_PC_10
          +     0.13533997706716 * S_PC_11  +     0.75544268766517 * S_PC_12
          +     0.17183445519664 * S_PC_13  +      0.1777896181105 * S_PC_14
          +     0.05706870679047 * S_PC_15  +    -0.46807694963409 * S_PC_16
          +    -0.25190451727153 * S_PC_17  +    -0.08258276412231 * S_PC_2
          +    -0.36441875817422 * S_PC_3  +    -0.39012839645629 * S_PC_4
          +     0.04722996979342 * S_PC_5  +     0.43416394096325 * S_PC_6
          +     0.19725231550558 * S_PC_7  +     0.21295253069805 * S_PC_8
          +    -0.60545100325243 * S_PC_9  +    -0.15355095095987 *
        S_Year_Birth ;
   H13  =    -0.93981943955208 * S_PC_1  +    -0.11850321613711 * S_PC_10
          +    -0.74225741575618 * S_PC_11  +    -0.81034258744012 * S_PC_12
          +     0.21537464928397 * S_PC_13  +    -0.26677965640501 * S_PC_14
          +     0.30177037009096 * S_PC_15  +    -0.26947681668456 * S_PC_16
          +     0.23123019737325 * S_PC_17  +     0.15751211794885 * S_PC_2
          +     0.33175469761366 * S_PC_3  +     0.39514352786101 * S_PC_4
          +      0.7139227368597 * S_PC_5  +      0.0167014877178 * S_PC_6
          +    -0.07449310891132 * S_PC_7  +    -0.05509910154765 * S_PC_8
          +     0.16873655257606 * S_PC_9  +     0.00245043420593 *
        S_Year_Birth ;
   H14  =    -0.12693194472066 * S_PC_1  +     0.60796576749185 * S_PC_10
          +    -0.34420896979597 * S_PC_11  +    -0.23537095833674 * S_PC_12
          +     0.89540868522943 * S_PC_13  +      -0.510842523862 * S_PC_14
          +     0.48567760328151 * S_PC_15  +     0.37897489203761 * S_PC_16
          +     0.05946905584596 * S_PC_17  +     0.14804032191862 * S_PC_2
          +     0.03156879517121 * S_PC_3  +     0.20866387553468 * S_PC_4
          +    -0.11678944684508 * S_PC_5  +    -0.28222346677273 * S_PC_6
          +    -0.07076603764251 * S_PC_7  +    -0.08885981193922 * S_PC_8
          +    -0.17344366575651 * S_PC_9  +    -0.10422043273594 *
        S_Year_Birth ;
   H15  =    -0.18818846792217 * S_PC_1  +     0.15980122155848 * S_PC_10
          +    -0.29415615035488 * S_PC_11  +     0.22673434231766 * S_PC_12
          +     -0.4367544144709 * S_PC_13  +    -0.27215638165388 * S_PC_14
          +     0.21516860661944 * S_PC_15  +    -0.33073452493248 * S_PC_16
          +    -0.12566064186043 * S_PC_17  +    -0.66303106656578 * S_PC_2
          +     0.15398704463012 * S_PC_3  +     0.45620897750328 * S_PC_4
          +     0.21146328236808 * S_PC_5  +     0.09789059959814 * S_PC_6
          +    -0.12207231873189 * S_PC_7  +    -0.02692016155566 * S_PC_8
          +     0.00827837096636 * S_PC_9  +     0.24843752055347 *
        S_Year_Birth ;
   H16  =     0.17834519341997 * S_PC_1  +    -0.32824376267138 * S_PC_10
          +     0.02772071370421 * S_PC_11  +      0.3134819415225 * S_PC_12
          +    -0.34724682137837 * S_PC_13  +     0.19598007494228 * S_PC_14
          +     0.31968916312556 * S_PC_15  +    -0.03617557970689 * S_PC_16
          +    -0.32507715963836 * S_PC_17  +    -0.05923539655778 * S_PC_2
          +     0.36180293380006 * S_PC_3  +    -0.00711502811187 * S_PC_4
          +     -0.4202174009875 * S_PC_5  +    -0.20731677826254 * S_PC_6
          +     -0.0412241308518 * S_PC_7  +     0.64326432309663 * S_PC_8
          +     0.42325597812682 * S_PC_9  +     0.06066746722872 *
        S_Year_Birth ;
   H17  =     0.06122966741514 * S_PC_1  +     0.32630558798132 * S_PC_10
          +     0.08830070784719 * S_PC_11  +    -0.09169481140616 * S_PC_12
          +      0.3549320678826 * S_PC_13  +    -0.21931123167669 * S_PC_14
          +    -0.18036776149727 * S_PC_15  +    -0.49613822738605 * S_PC_16
          +     0.04573861907833 * S_PC_17  +     0.52087249472311 * S_PC_2
          +     0.37349952917867 * S_PC_3  +    -0.00417038828693 * S_PC_4
          +     0.31654515840261 * S_PC_5  +    -0.14807890224435 * S_PC_6
          +    -0.27409057895757 * S_PC_7  +    -0.29271037818625 * S_PC_8
          +     0.14973034409075 * S_PC_9  +     0.30703675352745 *
        S_Year_Birth ;
   H11  =    -0.90910910494332 + H11 ;
   H12  =     1.11114331269115 + H12 ;
   H13  =    -0.39557973491761 + H13 ;
   H14  =     0.11097638588139 + H14 ;
   H15  =    -1.45152011393762 + H15 ;
   H16  =     0.80027129172396 + H16 ;
   H17  =     0.54203925713353 + H17 ;
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
   P_DepVar1  =    -1.36227730329636 * H11  +    -1.56591009171383 * H12
          +    -1.51595469939043 * H13  +    -2.11517380958242 * H14
          +     1.49134383210948 * H15  +     0.83564080974417 * H16
          +    -1.81961134224285 * H17 ;
   P_DepVar1  =    -2.25483055601613 + P_DepVar1 ;
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
H16
H17
;
drop S_:;
