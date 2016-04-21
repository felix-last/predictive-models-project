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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     -0.5676300220312 * S_PC_1  +    -0.30685005298258 * S_PC_10
          +     0.33144193521288 * S_PC_11  +     0.48604920744725 * S_PC_12
          +     -0.3343515108255 * S_PC_13  +    -0.24302039168126 * S_PC_14
          +    -0.04203285565889 * S_PC_15  +    -0.02856252858655 * S_PC_16
          +     0.09507071980044 * S_PC_17  +     0.14101757475609 * S_PC_2
          +     0.10400411611015 * S_PC_3  +    -0.60365946974152 * S_PC_4
          +     0.31951023104888 * S_PC_5  +    -0.19495900124965 * S_PC_6
          +    -0.48623238665166 * S_PC_7  +    -0.48996955886063 * S_PC_8
          +    -0.97734935726015 * S_PC_9  +    -0.15876048047142 *
        S_Year_Birth ;
   H12  =    -0.99538279224418 * S_PC_1  +     0.51080506033577 * S_PC_10
          +     0.11168962840475 * S_PC_11  +     0.73413444278653 * S_PC_12
          +     0.34649210530582 * S_PC_13  +     0.13034463919592 * S_PC_14
          +     0.02557639040503 * S_PC_15  +    -0.53720380377274 * S_PC_16
          +    -0.19967827084831 * S_PC_17  +    -0.20514646129984 * S_PC_2
          +    -0.42918913740416 * S_PC_3  +    -0.26543538246483 * S_PC_4
          +      0.1495484443706 * S_PC_5  +     0.42379412404861 * S_PC_6
          +     0.32760041597661 * S_PC_7  +     0.13337617452846 * S_PC_8
          +    -0.64290758383096 * S_PC_9  +    -0.20356285728529 *
        S_Year_Birth ;
   H13  =     -1.0992657781698 * S_PC_1  +     0.03793804392658 * S_PC_10
          +    -0.87112601660535 * S_PC_11  +     -1.1439898359342 * S_PC_12
          +     0.22341662825535 * S_PC_13  +    -0.37197874887684 * S_PC_14
          +     0.30055781758401 * S_PC_15  +    -0.17155015191444 * S_PC_16
          +     0.27076574762285 * S_PC_17  +     0.19305913228169 * S_PC_2
          +     0.47083300459058 * S_PC_3  +     0.57636430755662 * S_PC_4
          +     0.82541924547951 * S_PC_5  +    -0.08491966977298 * S_PC_6
          +    -0.09636016058219 * S_PC_7  +    -0.05101195455819 * S_PC_8
          +     0.21307405812735 * S_PC_9  +      0.0534282745528 *
        S_Year_Birth ;
   H14  =    -0.28033927792161 * S_PC_1  +     0.59493833246644 * S_PC_10
          +    -0.55137023079334 * S_PC_11  +    -0.22268967168536 * S_PC_12
          +      1.0026813896332 * S_PC_13  +    -0.49387305466998 * S_PC_14
          +     0.49776238649549 * S_PC_15  +     0.40400057556983 * S_PC_16
          +      0.0628446798034 * S_PC_17  +     0.04775469750477 * S_PC_2
          +     0.02336139993366 * S_PC_3  +        0.09524660979 * S_PC_4
          +    -0.13739746994018 * S_PC_5  +    -0.25225809263357 * S_PC_6
          +    -0.06487935155791 * S_PC_7  +     -0.1322322847403 * S_PC_8
          +     -0.0661227677489 * S_PC_9  +    -0.10032058920416 *
        S_Year_Birth ;
   H15  =    -0.34016042462479 * S_PC_1  +     0.37454469773631 * S_PC_10
          +    -0.31300667900751 * S_PC_11  +     0.31246253970838 * S_PC_12
          +    -0.49102295972655 * S_PC_13  +    -0.27712376754168 * S_PC_14
          +     0.32925652536478 * S_PC_15  +    -0.33851777824604 * S_PC_16
          +    -0.06016622868243 * S_PC_17  +    -0.76574085180415 * S_PC_2
          +     0.14959059711886 * S_PC_3  +     0.47992442341836 * S_PC_4
          +     0.27744818014204 * S_PC_5  +     0.23310571667766 * S_PC_6
          +    -0.09801680647028 * S_PC_7  +     -0.0461319547186 * S_PC_8
          +     -0.0317075590465 * S_PC_9  +     0.27146889721572 *
        S_Year_Birth ;
   H16  =     0.15099786043328 * S_PC_1  +    -0.33585886774534 * S_PC_10
          +     0.02812263307623 * S_PC_11  +     0.25744092078462 * S_PC_12
          +    -0.41837967158388 * S_PC_13  +     0.20287189163302 * S_PC_14
          +     0.46866832835833 * S_PC_15  +     -0.0201628559761 * S_PC_16
          +     -0.3978461711908 * S_PC_17  +    -0.15412398115987 * S_PC_2
          +     0.36673708324876 * S_PC_3  +    -0.16017079630267 * S_PC_4
          +    -0.63707926563706 * S_PC_5  +    -0.23300386991746 * S_PC_6
          +    -0.08318886288525 * S_PC_7  +     0.74276602413335 * S_PC_8
          +     0.57103943176061 * S_PC_9  +    -0.16157118451233 *
        S_Year_Birth ;
   H17  =       0.330602325747 * S_PC_1  +     0.33032228152843 * S_PC_10
          +     0.23514119397309 * S_PC_11  +     0.11281430081481 * S_PC_12
          +     0.27922853148429 * S_PC_13  +    -0.13641023322947 * S_PC_14
          +    -0.06930142126701 * S_PC_15  +    -0.49846029120568 * S_PC_16
          +     0.04156973818252 * S_PC_17  +     0.75784769859359 * S_PC_2
          +     0.57034551329104 * S_PC_3  +     0.02940592468812 * S_PC_4
          +      0.2173780102755 * S_PC_5  +    -0.18828488891226 * S_PC_6
          +    -0.29383352025112 * S_PC_7  +     -0.3015683807777 * S_PC_8
          +     0.15263811878728 * S_PC_9  +     0.38096811669812 *
        S_Year_Birth ;
   H11  =     -1.1507836976634 + H11 ;
   H12  =     1.36159575454507 + H12 ;
   H13  =    -0.49113198647068 + H13 ;
   H14  =     0.11036109737384 + H14 ;
   H15  =    -1.52568955736796 + H15 ;
   H16  =     0.70595253219317 + H16 ;
   H17  =     0.56521234643088 + H17 ;
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
   P_DepVar1  =    -1.58967822046735 * H11  +    -2.10329065190661 * H12
          +    -1.90822118522278 * H13  +    -2.16762466284078 * H14
          +      1.7747211286988 * H15  +     0.98046519626065 * H16
          +    -1.90328963637158 * H17 ;
   P_DepVar1  =    -2.21107015515665 + P_DepVar1 ;
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
