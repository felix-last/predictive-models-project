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
   H11  =      0.4572037399939 * S_PC_1  +    -0.33924067655378 * S_PC_10
          +     0.57141385115112 * S_PC_11  +     0.48487316549189 * S_PC_12
          +    -1.05031657956537 * S_PC_13  +         0.5266100628 * S_PC_14
          +    -0.40664215599546 * S_PC_15  +     0.12584985353518 * S_PC_16
          +    -0.18726079041205 * S_PC_17  +    -0.21051549627173 * S_PC_2
          +    -0.50083883209613 * S_PC_3  +     0.15037036519111 * S_PC_4
          +    -0.06091340223564 * S_PC_5  +     0.12052144993899 * S_PC_6
          +       0.332356321128 * S_PC_7  +     0.31706599410802 * S_PC_8
          +     0.27650701530647 * S_PC_9  +     0.36756441254936 * 
        S_Year_Birth ;
   H12  =     0.39344846914742 * S_PC_1  +     0.23972559280802 * S_PC_10
          +     0.01471125669581 * S_PC_11  +     0.20856923684903 * S_PC_12
          +    -0.29177209177854 * S_PC_13  +     0.03707095215892 * S_PC_14
          +     0.38334701775474 * S_PC_15  +      0.5863505707375 * S_PC_16
          +    -0.62562899968641 * S_PC_17  +    -0.44298666943655 * S_PC_2
          +        0.04346878824 * S_PC_3  +     -0.2694267850657 * S_PC_4
          +    -0.12543247097847 * S_PC_5  +     -0.1896504822101 * S_PC_6
          +     0.18228845542316 * S_PC_7  +     0.09948287582483 * S_PC_8
          +     0.08527418828587 * S_PC_9  +    -0.07133810194976 * 
        S_Year_Birth ;
   H13  =    -0.73548355547467 * S_PC_1  +    -0.10402810694097 * S_PC_10
          +    -0.23530243081797 * S_PC_11  +     0.05157777911367 * S_PC_12
          +    -0.37308967195093 * S_PC_13  +     0.84460260270185 * S_PC_14
          +    -0.06322469233111 * S_PC_15  +     0.19066414060707 * S_PC_16
          +     0.06331857444725 * S_PC_17  +    -1.07880141314119 * S_PC_2
          +    -0.40445464921802 * S_PC_3  +     0.42151508961402 * S_PC_4
          +    -0.15204543817335 * S_PC_5  +     0.18602427623316 * S_PC_6
          +    -0.04709706814842 * S_PC_7  +     0.36586874220739 * S_PC_8
          +    -0.06991289454926 * S_PC_9  +    -0.36834643959125 * 
        S_Year_Birth ;
   H14  =     0.03645017761422 * S_PC_1  +     0.35836366205085 * S_PC_10
          +    -0.67037688965042 * S_PC_11  +    -0.69506985454419 * S_PC_12
          +     0.75476319829716 * S_PC_13  +     0.17842794890744 * S_PC_14
          +    -0.02555345712531 * S_PC_15  +    -0.09809436799607 * S_PC_16
          +     0.53989601368165 * S_PC_17  +     0.34066718426356 * S_PC_2
          +    -0.13975214313923 * S_PC_3  +     0.39764818364136 * S_PC_4
          +     0.48005328630412 * S_PC_5  +    -0.24963672499963 * S_PC_6
          +     0.33581189577795 * S_PC_7  +    -0.20453271114584 * S_PC_8
          +    -0.18026723512126 * S_PC_9  +    -0.01794612569398 * 
        S_Year_Birth ;
   H15  =     0.87819286617219 * S_PC_1  +    -0.45680333333833 * S_PC_10
          +    -0.19222569004196 * S_PC_11  +    -0.69150047873875 * S_PC_12
          +    -0.15732640647119 * S_PC_13  +     -0.1113321891333 * S_PC_14
          +     0.02739308651489 * S_PC_15  +     0.03470872151577 * S_PC_16
          +     0.52347238904566 * S_PC_17  +    -0.48104910756428 * S_PC_2
          +     0.39717000994127 * S_PC_3  +     0.40508698052766 * S_PC_4
          +    -0.70416241168868 * S_PC_5  +    -0.15695961262575 * S_PC_6
          +    -0.50463412391796 * S_PC_7  +    -0.42242933925107 * S_PC_8
          +     0.48601170602465 * S_PC_9  +     0.05218649760104 * 
        S_Year_Birth ;
   H16  =     0.71314442719152 * S_PC_1  +    -0.48254803601996 * S_PC_10
          +     -0.7055040284859 * S_PC_11  +    -0.28771421134443 * S_PC_12
          +     0.03904298770718 * S_PC_13  +    -0.19570881459626 * S_PC_14
          +     0.06318106643827 * S_PC_15  +     0.02221515221124 * S_PC_16
          +     0.08250149766469 * S_PC_17  +     0.24785323093961 * S_PC_2
          +     0.67272562474514 * S_PC_3  +    -0.40883740914753 * S_PC_4
          +     0.01526133771642 * S_PC_5  +     0.13815654365502 * S_PC_6
          +    -0.13763305233903 * S_PC_7  +     0.65046077839767 * S_PC_8
          +     0.59590047615822 * S_PC_9  +    -0.23180740400042 * 
        S_Year_Birth ;
   H11  =    -0.96567698220965 + H11 ;
   H12  =     0.98497546600771 + H12 ;
   H13  =    -1.66780990072659 + H13 ;
   H14  =    -1.58958109115035 + H14 ;
   H15  =     -1.4698438300852 + H15 ;
   H16  =    -1.96875059181844 + H16 ;
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
   P_DepVar1  =     2.39531584340828 * H11  +      0.5615033898018 * H12
          +     1.33226164827793 * H13  +    -1.50665895392278 * H14
          +     1.50663887827851 * H15  +      1.7690093184365 * H16 ;
   P_DepVar1  =    -0.73096588852494 + P_DepVar1 ;
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
