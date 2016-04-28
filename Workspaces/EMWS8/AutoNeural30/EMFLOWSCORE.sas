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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x4_1 = 'Hidden: H1x4_=1' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x3_1 = 'Hidden: H2x3_=1' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x2_1 = 'Hidden: H3x2_=1' ;

      label H4x1_1 = 'Hidden: H4x1_=1' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   H1x1_1  =     0.04025840082513 * S_AcceptedCmpTotal
          +     0.06318752729093 * S_Frq  +    -1.29545791179409 * S_Income
          +    -7.11030940481191 * S_Mnt  +     0.43390451556969 *
        S_MntGoldProds  +     1.69733563869673 * S_MntMeatProducts
          +     0.48225589030087 * S_MntWines  +     2.50429846731068 *
        S_NumDistPurchases  +     0.19831933540707 * S_RFMstat
          +     0.96752741277283 * S_RMntFrq  +    -0.27394913723816 *
        S_Recency ;
   H1x1_1  = H1x1_1  +    -0.13186660711464 * G_Marital_Status0
          +     0.76507926337086 * G_Marital_Status1 ;
   H1x1_1  =    -2.07751077372903 + H1x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.04623108287373 * S_AcceptedCmpTotal
          +     0.51673349328259 * S_Frq  +    -0.55409697473564 * S_Income
          +    -1.80152141029664 * S_Mnt  +    -0.01192709316085 *
        S_MntGoldProds  +    -1.08887322486716 * S_MntMeatProducts
          +    -0.54592829528894 * S_MntWines  +     0.87903819952137 *
        S_NumDistPurchases  +     0.15549845875066 * S_RFMstat
          +     0.64330086736687 * S_RMntFrq  +    -0.34615492895156 *
        S_Recency ;
   H1x2_1  = H1x2_1  +     0.04272112278258 * G_Marital_Status0
          +     0.52128005949051 * G_Marital_Status1 ;
   H1x2_1  =    -1.26211132425318 + H1x2_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -0.31931196892076 * S_AcceptedCmpTotal
          +     0.88013014607652 * S_Frq  +       2.380671405121 * S_Income
          +    -1.76438631408259 * S_Mnt  +    -0.88002382547081 *
        S_MntGoldProds  +     3.22143288077158 * S_MntMeatProducts
          +    -1.46872497431142 * S_MntWines  +     4.48983574481035 *
        S_NumDistPurchases  +     1.49229101598701 * S_RFMstat
          +     0.86000773065844 * S_RMntFrq  +     0.41345680894813 *
        S_Recency ;
   H1x3_1  = H1x3_1  +     0.24244728138592 * G_Marital_Status0
          +     0.68199092237732 * G_Marital_Status1 ;
   H1x3_1  =      0.8344057531016 + H1x3_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x3_1  = .;
END;
*** *************************;
*** Writing the Node H1x4_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x4_1  =    -0.13659878639954 * S_AcceptedCmpTotal
          +     0.45428559765776 * S_Frq  +    -0.42693519984843 * S_Income
          +      1.1792020785091 * S_Mnt  +     0.71939074066077 *
        S_MntGoldProds  +    -0.72620231508443 * S_MntMeatProducts
          +    -0.32426637270285 * S_MntWines  +    -0.38988807626314 *
        S_NumDistPurchases  +    -3.02140616024044 * S_RFMstat
          +     -0.8223455835322 * S_RMntFrq  +     0.94450643717764 *
        S_Recency ;
   H1x4_1  = H1x4_1  +    -0.12208204500004 * G_Marital_Status0
          +    -0.36246978080124 * G_Marital_Status1 ;
   H1x4_1  =    -0.95371898342722 + H1x4_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x4_1  = 1.0 / (1.0 + EXP(MIN( - H1x4_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x4_1  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -5.17307699680657 * H1x1_1 ;
   H2x1_1  = H2x1_1  +     5.68206219040914 * H1x2_1 ;
   H2x1_1  = H2x1_1  +      0.0671760867147 * H1x3_1 ;
   H2x1_1  = H2x1_1  +     1.77797879568099 * H1x4_1 ;
   H2x1_1  =    -1.18533244144823 + H2x1_1 ;
   H2x1_1  = SIN(H2x1_1 );
END;
ELSE DO;
   H2x1_1  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =    -0.10427732572046 * H1x1_1 ;
   H2x2_1  = H2x2_1  +    -2.43600502591825 * H1x2_1 ;
   H2x2_1  = H2x2_1  +    -2.36291758854448 * H1x3_1 ;
   H2x2_1  = H2x2_1  +    -0.21725276506237 * H1x4_1 ;
   H2x2_1  =     -1.6479184469931 + H2x2_1 ;
   H2x2_1  = SIN(H2x2_1 );
END;
ELSE DO;
   H2x2_1  = .;
END;
*** *************************;
*** Writing the Node H2x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x3_1  =    -2.55881911263862 * H1x1_1 ;
   H2x3_1  = H2x3_1  +    -1.36800479963026 * H1x2_1 ;
   H2x3_1  = H2x3_1  +     2.49318998831913 * H1x3_1 ;
   H2x3_1  = H2x3_1  +     -0.2723650813761 * H1x4_1 ;
   H2x3_1  =    -2.02002422056859 + H2x3_1 ;
   H2x3_1  = SIN(H2x3_1 );
END;
ELSE DO;
   H2x3_1  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =    -5.17928987039105 * H2x1_1 ;
   H3x1_1  = H3x1_1  +    -4.99188815628878 * H2x2_1 ;
   H3x1_1  = H3x1_1  +    -1.59478766396441 * H2x3_1 ;
   H3x1_1  =    -1.17125580012514 + H3x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H3x1_1  = 1.0 / (1.0 + EXP(MIN( - H3x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H3x1_1  = .;
END;
*** *************************;
*** Writing the Node H3x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x2_1  =       2.158894329803 * H2x1_1 ;
   H3x2_1  = H3x2_1  +    -2.32757193457059 * H2x2_1 ;
   H3x2_1  = H3x2_1  +    -6.00752921212942 * H2x3_1 ;
   H3x2_1  =    -0.08802993131411 + H3x2_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H3x2_1  = 1.0 / (1.0 + EXP(MIN( - H3x2_1 , _EXP_BAR)));
END;
ELSE DO;
   H3x2_1  = .;
END;
*** *************************;
*** Writing the Node H4x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H4x1_1  =      7.3411593355967 * H3x1_1 ;
   H4x1_1  = H4x1_1  +    -3.06647078805944 * H3x2_1 ;
   H4x1_1  =    -1.39824841795123 + H4x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H4x1_1  = 1.0 / (1.0 + EXP(MIN( - H4x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H4x1_1  = .;
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
   P_DepVar1  =     9.74622448352833 * H4x1_1 ;
   P_DepVar1  =    -7.88591846838259 + P_DepVar1 ;
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
drop S_:;
