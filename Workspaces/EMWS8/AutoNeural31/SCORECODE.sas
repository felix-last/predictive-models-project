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
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal , 
   Frq , 
   Income , 
   Mnt , 
   MntGoldProds , 
   MntMeatProducts , 
   MntWines , 
   NumDistPurchases , 
   RFMstat , 
   RMntFrq , 
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 * 
        NumDistPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 * 
        NumDistPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.03659823017812 * S_AcceptedCmpTotal
          +    -1.19763341876145 * S_Frq  +     0.81238202822952 * S_Income
          +     1.88011676145119 * S_Mnt  +     0.17620967209108 * 
        S_MntGoldProds  +    -0.01645582313184 * S_MntMeatProducts
          +     0.51002049519212 * S_MntWines  +     0.25222197723244 * 
        S_NumDistPurchases  +     0.28056722928561 * S_RFMstat
          +    -1.12243193103334 * S_RMntFrq  +    -0.37511560424314 * 
        S_Recency ;
   H1x1_2  =     0.18983412995843 * S_AcceptedCmpTotal
          +    -0.36018162246349 * S_Frq  +     0.01068760327542 * S_Income
          +    -0.89719147415619 * S_Mnt  +     0.11241727599926 * 
        S_MntGoldProds  +     0.64236815353055 * S_MntMeatProducts
          +     0.36278145113777 * S_MntWines  +     0.34466813565445 * 
        S_NumDistPurchases  +     0.05359534034679 * S_RFMstat
          +     0.02704700607418 * S_RMntFrq  +     -0.3718472688023 * 
        S_Recency ;
   H1x1_1  = H1x1_1  +     0.40642305557546 * G_Marital_Status0
          +     -0.0248646279252 * G_Marital_Status1 ;
   H1x1_2  = H1x1_2  +     0.16115803721995 * G_Marital_Status0
          +     0.05904755469144 * G_Marital_Status1 ;
   H1x1_1  =     0.33463349044957 + H1x1_1 ;
   H1x1_2  =    -3.62976809107266 + H1x1_2 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -0.36010169192455 * S_AcceptedCmpTotal
          +    -0.59887603386433 * S_Frq  +     0.50990837522658 * S_Income
          +    -1.11866059151852 * S_Mnt  +     0.36285188228582 * 
        S_MntGoldProds  +     1.22856170475832 * S_MntMeatProducts
          +     1.46123404932164 * S_MntWines  +    -0.01510122045686 * 
        S_NumDistPurchases  +     0.53310564732407 * S_RFMstat
          +    -0.40691094193511 * S_RMntFrq  +     0.45756644061361 * 
        S_Recency ;
   H1x2_2  =    -0.17932261343465 * S_AcceptedCmpTotal
          +     1.20080978426162 * S_Frq  +     0.18118647708641 * S_Income
          +     0.31901116297924 * S_Mnt  +     0.02135897416621 * 
        S_MntGoldProds  +    -1.12534829348468 * S_MntMeatProducts
          +     0.57649851666461 * S_MntWines  +    -1.46542585484816 * 
        S_NumDistPurchases  +    -0.20960777623629 * S_RFMstat
          +      0.6962031545587 * S_RMntFrq  +     0.00840421006739 * 
        S_Recency ;
   H1x2_1  = H1x2_1  +    -0.05195034052296 * G_Marital_Status0
          +     -0.2774675863976 * G_Marital_Status1 ;
   H1x2_2  = H1x2_2  +     0.01901604294952 * G_Marital_Status0
          +      -0.277144006775 * G_Marital_Status1 ;
   H1x2_1  =     1.53233871423223 + H1x2_1 ;
   H1x2_2  =     1.35238678006556 + H1x2_2 ;
   H1x2_1  = SIN(H1x2_1 );
   H1x2_2  = SIN(H1x2_2 );
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     1.63523210720409 * S_AcceptedCmpTotal
          +     0.41751349520438 * S_Frq  +    -0.87449723255309 * S_Income
          +    -0.47825070320724 * S_Mnt  +     0.76630810205636 * 
        S_MntGoldProds  +    -0.35835365889925 * S_MntMeatProducts
          +    -1.27333688175297 * S_MntWines  +    -1.52770581313638 * 
        S_NumDistPurchases  +     0.86851574498866 * S_RFMstat
          +     0.84614746872207 * S_RMntFrq  +    -1.64268632744477 * 
        S_Recency ;
   H1x3_2  =    -0.18638529120439 * S_AcceptedCmpTotal
          +     0.76011175462816 * S_Frq  +     0.58495336465132 * S_Income
          +     0.65856698208574 * S_Mnt  +     0.68781212622472 * 
        S_MntGoldProds  +    -1.09375532907934 * S_MntMeatProducts
          +     1.39481639500189 * S_MntWines  +     0.26914802103737 * 
        S_NumDistPurchases  +    -2.20511156805519 * S_RFMstat
          +     1.66705142994155 * S_RMntFrq  +    -0.36249885315985 * 
        S_Recency ;
   H1x3_1  = H1x3_1  +     -0.2579393569494 * G_Marital_Status0
          +    -1.04614665932456 * G_Marital_Status1 ;
   H1x3_2  = H1x3_2  +    -1.03096078089306 * G_Marital_Status0
          +    -0.71974289565489 * G_Marital_Status1 ;
   H1x3_1  =    -0.91456189694636 + H1x3_1 ;
   H1x3_2  =    -0.51701043559885 + H1x3_2 ;
   H1x3_1  = SIN(H1x3_1 );
   H1x3_2  = SIN(H1x3_2 );
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     1.47132066677712 * H1x1_1  +      1.2723487532385 * H1x1_2 ;
   H2x1_2  =     1.58711243971308 * H1x1_1  +      6.5189759089623 * H1x1_2 ;
   H2x1_1  = H2x1_1  +     1.30878911727231 * H1x2_1
          +     2.19496661698373 * H1x2_2 ;
   H2x1_2  = H2x1_2  +    -3.82744270061369 * H1x2_1
          +      1.3090956402929 * H1x2_2 ;
   H2x1_1  = H2x1_1  +    -0.97307968271784 * H1x3_1
          +     0.17025511053322 * H1x3_2 ;
   H2x1_2  = H2x1_2  +    -0.00685159977192 * H1x3_1
          +     0.53377830648041 * H1x3_2 ;
   H2x1_1  =    -2.88828567261654 + H2x1_1 ;
   H2x1_2  =    -0.63666932052712 + H2x1_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     -0.1591646734645 * H1x1_1  +     2.50898584287812 * H1x1_2 ;
   H2x2_2  =    -1.04022138862095 * H1x1_1  +     -3.2120641538371 * H1x1_2 ;
   H2x2_1  = H2x2_1  +     0.95364577994168 * H1x2_1
          +     0.39917449615996 * H1x2_2 ;
   H2x2_2  = H2x2_2  +     0.34367752685876 * H1x2_1
          +    -0.43345610313251 * H1x2_2 ;
   H2x2_1  = H2x2_1  +    -0.21053791455319 * H1x3_1
          +     1.30320774323126 * H1x3_2 ;
   H2x2_2  = H2x2_2  +    -0.56776778702573 * H1x3_1
          +     0.23307461428861 * H1x3_2 ;
   H2x2_1  =    -0.57800274966727 + H2x2_1 ;
   H2x2_2  =     -0.3490585254981 + H2x2_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x2_1  = 1.0 / (1.0 + EXP(MIN( - H2x2_1 , _EXP_BAR)));
   H2x2_2  = 1.0 / (1.0 + EXP(MIN( - H2x2_2 , _EXP_BAR)));
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     2.93892662286754 * H2x1_1  +     4.69530667636314 * H2x1_2 ;
   H3x1_1  = H3x1_1  +     0.63147427004529 * H2x2_1
          +    -3.38971951524722 * H2x2_2 ;
   H3x1_1  =    -2.10378320265168 + H3x1_1 ;
   H3x1_2  = 0; 
   _MAX_ = MAX (H3x1_1 , H3x1_2 );
   _SUM_ = 0.; 
   H3x1_1  = EXP(H3x1_1  - _MAX_);
   _SUM_ = _SUM_ + H3x1_1 ;
   H3x1_2  = EXP(H3x1_2  - _MAX_);
   _SUM_ = _SUM_ + H3x1_2 ;
   H3x1_1  = H3x1_1  / _SUM_;
   H3x1_2  = H3x1_2  / _SUM_;
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -8.80200545202031 * H3x1_1  +    -0.19646708431763 * H3x1_2
         ;
   P_DepVar1  =     3.75158164611687 + P_DepVar1 ;
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
