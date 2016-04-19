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
   S_PC_1  = -3.6488918403387E-15 +     0.29892759566822 * PC_1 ;
   S_PC_10  = -6.1105909646702E-15 +     0.82174055927533 * PC_10 ;
   S_PC_11  =  5.5953279603159E-15 +       0.856249156402 * PC_11 ;
   S_PC_12  = -4.1145821078075E-15 +     0.88806609097186 * PC_12 ;
   S_PC_13  =  1.4849812030115E-15 +     0.89678852922943 * PC_13 ;
   S_PC_14  = -6.2973928075572E-15 +     0.90339751679168 * PC_14 ;
   S_PC_15  = -5.8948982757007E-16 +     0.92999222699092 * PC_15 ;
   S_PC_16  = -2.5957971712491E-15 +      0.9511809992322 * PC_16 ;
   S_PC_17  =  3.6303451348395E-15 +     0.99884839954107 * PC_17 ;
   S_PC_2  =  6.4135165190946E-15 +     0.54372947518581 * PC_2 ;
   S_PC_3  =  2.2514555608207E-15 +     0.55367420195889 * PC_3 ;
   S_PC_4  = -3.8797382198993E-15 +     0.63693509045378 * PC_4 ;
   S_PC_5  = -4.8238591945923E-15 +      0.6666904967587 * PC_5 ;
   S_PC_6  =  1.5849559140428E-15 +     0.70534780307004 * PC_6 ;
   S_PC_7  =  3.1562291763867E-16 +     0.74930538239816 * PC_7 ;
   S_PC_8  = -2.4599196832342E-15 +     0.77164443961071 * PC_8 ;
   S_PC_9  = -4.1449869562181E-15 +      0.8081978480865 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6488918403387E-15 +     0.29892759566822 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.1105909646702E-15 +     0.82174055927533 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.5953279603159E-15 +       0.856249156402 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1145821078075E-15 +     0.88806609097186 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4849812030115E-15 +     0.89678852922943 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2973928075572E-15 +     0.90339751679168 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.8948982757007E-16 +     0.92999222699092 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.5957971712491E-15 +      0.9511809992322 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.6303451348395E-15 +     0.99884839954107 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4135165190946E-15 +     0.54372947518581 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2514555608207E-15 +     0.55367420195889 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.8797382198993E-15 +     0.63693509045378 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.8238591945923E-15 +      0.6666904967587 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5849559140428E-15 +     0.70534780307004 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.1562291763867E-16 +     0.74930538239816 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4599196832342E-15 +     0.77164443961071 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1449869562181E-15 +      0.8081978480865 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * 
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.53288365215883 * S_PC_1  +    -0.08501802527388 * S_PC_10
          +     0.24294632091272 * S_PC_11  +     0.08564368899296 * S_PC_12
          +    -0.53035830408083 * S_PC_13  +      0.5121391020649 * S_PC_14
          +    -0.23443462397451 * S_PC_15  +     0.12589911049936 * S_PC_16
          +    -0.16239710130802 * S_PC_17  +    -0.32581426758909 * S_PC_2
          +    -0.20464216366267 * S_PC_3  +     0.22276947045479 * S_PC_4
          +    -0.35154873877133 * S_PC_5  +     0.10083593662047 * S_PC_6
          +     0.15800533701906 * S_PC_7  +     0.50548257072689 * S_PC_8
          +     0.39514364275998 * S_PC_9  +     0.32515045755807 * 
        S_Year_Birth ;
   H12  =      -0.043853655425 * S_PC_1  +    -0.19061724013711 * S_PC_10
          +     0.26459557006509 * S_PC_11  +      0.2593207707985 * S_PC_12
          +    -0.26786865073847 * S_PC_13  +     0.13899553547117 * S_PC_14
          +     0.07350772183608 * S_PC_15  +     0.00796758440415 * S_PC_16
          +     0.48180384116801 * S_PC_17  +     0.07267308309752 * S_PC_2
          +    -0.20689007049594 * S_PC_3  +    -0.17050866522825 * S_PC_4
          +    -0.14946225165934 * S_PC_5  +     0.30652242877121 * S_PC_6
          +     0.28357405053753 * S_PC_7  +     0.46480336446244 * S_PC_8
          +     0.01609583032462 * S_PC_9  +     0.00173398137223 * 
        S_Year_Birth ;
   H13  =    -0.36172085298258 * S_PC_1  +     0.66454780959691 * S_PC_10
          +    -0.27424530083647 * S_PC_11  +    -0.34999384973279 * S_PC_12
          +     0.96571997824994 * S_PC_13  +    -0.36525616159781 * S_PC_14
          +     0.46903433790652 * S_PC_15  +    -0.13367107580258 * S_PC_16
          +     0.33228828632054 * S_PC_17  +     0.28683205801308 * S_PC_2
          +     0.00962623192071 * S_PC_3  +     0.15618263559078 * S_PC_4
          +     0.24047625456325 * S_PC_5  +    -0.16784430119656 * S_PC_6
          +     0.12766842516835 * S_PC_7  +     0.02728867423451 * S_PC_8
          +    -0.01057162381608 * S_PC_9  +     0.15356656474238 * 
        S_Year_Birth ;
   H14  =    -0.77762173235679 * S_PC_1  +     0.20311836899828 * S_PC_10
          +     0.12507847019416 * S_PC_11  +     0.32850760820196 * S_PC_12
          +     -0.1850635096084 * S_PC_13  +     0.20783488029059 * S_PC_14
          +     0.03207086028489 * S_PC_15  +     0.06842826028734 * S_PC_16
          +    -0.13846289457178 * S_PC_17  +    -0.61658925214495 * S_PC_2
          +    -0.54111347434373 * S_PC_3  +      0.8995010772565 * S_PC_4
          +      -0.158174904418 * S_PC_5  +    -0.36746497451964 * S_PC_6
          +     0.32851201705378 * S_PC_7  +     0.49799179152659 * S_PC_8
          +     0.23615619563106 * S_PC_9  +     0.03393148113156 * 
        S_Year_Birth ;
   H15  =     0.90554749997523 * S_PC_1  +     -0.3290576311032 * S_PC_10
          +    -0.21593329857816 * S_PC_11  +    -0.34649204173026 * S_PC_12
          +    -0.20990183909634 * S_PC_13  +    -0.17079973355312 * S_PC_14
          +     0.14391061023113 * S_PC_15  +     0.03643832628016 * S_PC_16
          +     0.30965019234785 * S_PC_17  +     -0.2157740573946 * S_PC_2
          +     0.36116182108773 * S_PC_3  +    -0.24039625990695 * S_PC_4
          +     0.04132169245218 * S_PC_5  +     0.21230339433421 * S_PC_6
          +    -0.07744976205828 * S_PC_7  +    -0.17745981465076 * S_PC_8
          +      0.3436289305111 * S_PC_9  +    -0.03436733240154 * 
        S_Year_Birth ;
   H11  =    -0.58643762144681 + H11 ;
   H12  =    -1.05096976253293 + H12 ;
   H13  =    -0.45250942632339 + H13 ;
   H14  =    -1.05415585264877 + H14 ;
   H15  =     -1.6599474552435 + H15 ;
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
   P_DepVar1  =     1.26475679673828 * H11  +     0.18488626431834 * H12
          +    -2.54175886922293 * H13  +      1.5651604630991 * H14
          +     2.65835020050467 * H15 ;
   P_DepVar1  =    -1.12065382757581 + P_DepVar1 ;
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
