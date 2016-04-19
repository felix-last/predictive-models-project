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
   H11  =    -0.55342153424625 * S_PC_1  +    -0.29323467331544 * S_PC_10
          +     0.33965172324926 * S_PC_11  +     0.49000556060396 * S_PC_12
          +    -0.34110824735492 * S_PC_13  +    -0.24287054403528 * S_PC_14
          +    -0.02501080366447 * S_PC_15  +    -0.02679419599111 * S_PC_16
          +     0.09844374274586 * S_PC_17  +     0.13878811412798 * S_PC_2
          +     0.10801571799328 * S_PC_3  +    -0.58531553567813 * S_PC_4
          +     0.31533819069473 * S_PC_5  +    -0.19214671008198 * S_PC_6
          +    -0.51179938713553 * S_PC_7  +    -0.50670206584236 * S_PC_8
          +    -0.97231420794389 * S_PC_9  +    -0.16137966362464 *
        S_Year_Birth ;
   H12  =    -0.99502274940017 * S_PC_1  +     0.49237671874688 * S_PC_10
          +     0.12210745945974 * S_PC_11  +     0.72021579354775 * S_PC_12
          +      0.3393754550733 * S_PC_13  +     0.13986168240251 * S_PC_14
          +     0.04811901065181 * S_PC_15  +    -0.53520625287765 * S_PC_16
          +    -0.19673918666042 * S_PC_17  +     -0.2054947890231 * S_PC_2
          +    -0.43750641244546 * S_PC_3  +    -0.30212148993997 * S_PC_4
          +     0.15193420944594 * S_PC_5  +     0.41173144589147 * S_PC_6
          +     0.30810633295335 * S_PC_7  +     0.12469809630723 * S_PC_8
          +    -0.64078531647299 * S_PC_9  +    -0.19774667470024 *
        S_Year_Birth ;
   H13  =    -1.08978244664773 * S_PC_1  +     0.03100578006881 * S_PC_10
          +    -0.86965903394255 * S_PC_11  +    -1.12965112824775 * S_PC_12
          +     0.22635891501443 * S_PC_13  +      -0.370668142629 * S_PC_14
          +     0.30597502081665 * S_PC_15  +    -0.15658987227197 * S_PC_16
          +      0.2668499246416 * S_PC_17  +     0.19436681461642 * S_PC_2
          +     0.44869442712318 * S_PC_3  +     0.57307437095431 * S_PC_4
          +     0.80776612713283 * S_PC_5  +    -0.08822515374977 * S_PC_6
          +    -0.09284418945373 * S_PC_7  +    -0.06028855495338 * S_PC_8
          +     0.21586614421723 * S_PC_9  +     0.04888429457745 *
        S_Year_Birth ;
   H14  =    -0.28593618538042 * S_PC_1  +     0.59937027421068 * S_PC_10
          +    -0.55184433419032 * S_PC_11  +     -0.2301871208647 * S_PC_12
          +     1.01178018574556 * S_PC_13  +    -0.48252128489132 * S_PC_14
          +     0.48647706305442 * S_PC_15  +     0.38826674709309 * S_PC_16
          +     0.06640068764932 * S_PC_17  +      0.0476622971963 * S_PC_2
          +     0.02272352093671 * S_PC_3  +     0.10081179767275 * S_PC_4
          +    -0.13769487622721 * S_PC_5  +    -0.24922377953623 * S_PC_6
          +    -0.05671479273459 * S_PC_7  +    -0.13408005038028 * S_PC_8
          +    -0.06327123090628 * S_PC_9  +    -0.10370487024911 *
        S_Year_Birth ;
   H15  =    -0.33708904537859 * S_PC_1  +     0.37424167610601 * S_PC_10
          +    -0.31135313745496 * S_PC_11  +     0.30453947982614 * S_PC_12
          +    -0.49544019618096 * S_PC_13  +    -0.26793473780514 * S_PC_14
          +     0.33164121549835 * S_PC_15  +    -0.31758743327631 * S_PC_16
          +    -0.05779041880921 * S_PC_17  +    -0.76996955995367 * S_PC_2
          +     0.13746794831625 * S_PC_3  +     0.46608112761099 * S_PC_4
          +     0.27002996418456 * S_PC_5  +     0.23180249614069 * S_PC_6
          +    -0.08059651309604 * S_PC_7  +    -0.03561134620766 * S_PC_8
          +    -0.03059416422876 * S_PC_9  +     0.26625248867973 *
        S_Year_Birth ;
   H16  =     0.15017999188962 * S_PC_1  +    -0.33783019008081 * S_PC_10
          +     0.03105737534224 * S_PC_11  +     0.26111468755191 * S_PC_12
          +    -0.41128593451888 * S_PC_13  +     0.20048648875339 * S_PC_14
          +     0.45863219433154 * S_PC_15  +    -0.01258422577707 * S_PC_16
          +    -0.40610693500982 * S_PC_17  +    -0.15850867686128 * S_PC_2
          +     0.36950881975001 * S_PC_3  +    -0.17134002892283 * S_PC_4
          +      -0.628869137697 * S_PC_5  +    -0.23379385585096 * S_PC_6
          +    -0.08458064547675 * S_PC_7  +     0.74760782214014 * S_PC_8
          +     0.56234207099634 * S_PC_9  +    -0.14984712441736 *
        S_Year_Birth ;
   H17  =     0.30849857328204 * S_PC_1  +     0.33064134865883 * S_PC_10
          +     0.23827611784637 * S_PC_11  +     0.13303512224297 * S_PC_12
          +     0.28560416047256 * S_PC_13  +    -0.15117991713253 * S_PC_14
          +    -0.08257856642011 * S_PC_15  +    -0.50665244726973 * S_PC_16
          +      0.0274411962906 * S_PC_17  +     0.74919575098467 * S_PC_2
          +     0.57348166343361 * S_PC_3  +     0.03517396803125 * S_PC_4
          +     0.21522947410365 * S_PC_5  +    -0.17904742140357 * S_PC_6
          +    -0.28202941925014 * S_PC_7  +    -0.28392079981156 * S_PC_8
          +     0.15375921681792 * S_PC_9  +     0.37391488433781 *
        S_Year_Birth ;
   H11  =     -1.1594247768044 + H11 ;
   H12  =     1.34180472342355 + H12 ;
   H13  =     -0.4765158697282 + H13 ;
   H14  =     0.12408462982581 + H14 ;
   H15  =    -1.51733223495167 + H15 ;
   H16  =     0.70412113613226 + H16 ;
   H17  =     0.56926526451324 + H17 ;
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
   P_DepVar1  =    -1.58910967945868 * H11  +    -2.05915787974985 * H12
          +     -1.9012823868264 * H13  +    -2.18074438153672 * H14
          +     1.75831238575242 * H15  +     0.98715125973424 * H16
          +    -1.91091089802337 * H17 ;
   P_DepVar1  =     -2.2147071267261 + P_DepVar1 ;
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
