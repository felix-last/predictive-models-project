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

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

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
   H1x1_1  =    -0.18981728384316 * S_AcceptedCmpTotal
          +     2.44575265018132 * S_Frq  +    -0.33258639871365 * S_Income
          +    -1.51282513201415 * S_Mnt  +     0.06017420606179 * 
        S_MntGoldProds  +    -0.55274425550395 * S_MntMeatProducts
          +     0.91858869924573 * S_MntWines  +    -1.95905223495165 * 
        S_NumDistPurchases  +     -0.2637023845598 * S_RFMstat
          +     1.23283591446263 * S_RMntFrq  +    -0.07916044614039 * 
        S_Recency ;
   H1x1_2  =    -0.68309764555121 * S_AcceptedCmpTotal
          +     0.14669436656758 * S_Frq  +     0.02315218376279 * S_Income
          +    -4.21583355142014 * S_Mnt  +     0.19199314585125 * 
        S_MntGoldProds  +     2.55483645032568 * S_MntMeatProducts
          +     0.82054382378306 * S_MntWines  +     0.29968014910707 * 
        S_NumDistPurchases  +     0.60687719454304 * S_RFMstat
          +     0.83498030971653 * S_RMntFrq  +     0.50801279856495 * 
        S_Recency ;
   H1x1_3  =     0.08829866742968 * S_AcceptedCmpTotal
          +    -0.02323769496851 * S_Frq  +    -0.99617629114101 * S_Income
          +    -4.64282306384023 * S_Mnt  +     0.04308696038528 * 
        S_MntGoldProds  +     2.31863620360623 * S_MntMeatProducts
          +     0.16587338267425 * S_MntWines  +     1.02973533097984 * 
        S_NumDistPurchases  +     0.20343196580651 * S_RFMstat
          +     0.94726928092138 * S_RMntFrq  +     0.03712585159749 * 
        S_Recency ;
   H1x1_4  =     0.10061099283455 * S_AcceptedCmpTotal
          +     1.72752905329456 * S_Frq  +    -0.50472344084228 * S_Income
          +     1.07329017540495 * S_Mnt  +    -0.44517902573644 * 
        S_MntGoldProds  +    -1.57417593135497 * S_MntMeatProducts
          +    -0.75359748699668 * S_MntWines  +    -1.09387259425684 * 
        S_NumDistPurchases  +    -0.81518874000435 * S_RFMstat
          +     0.23368643717628 * S_RMntFrq  +    -0.30240544347672 * 
        S_Recency ;
   H1x1_5  =    -0.22817314877708 * S_AcceptedCmpTotal
          +     0.28118539965414 * S_Frq  +     0.04846488460495 * S_Income
          +     0.60106863054811 * S_Mnt  +    -0.06162179557217 * 
        S_MntGoldProds  +    -0.39180490439507 * S_MntMeatProducts
          +    -0.21017068084579 * S_MntWines  +    -0.32161828113396 * 
        S_NumDistPurchases  +    -0.03465088483344 * S_RFMstat
          +    -0.03147262277696 * S_RMntFrq  +     0.34128240879899 * 
        S_Recency ;
   H1x1_1  = H1x1_1  +     0.15249883445815 * G_Marital_Status0
          +    -0.18818735950093 * G_Marital_Status1 ;
   H1x1_2  = H1x1_2  +     1.59824663671134 * G_Marital_Status0
          +     1.96669325047054 * G_Marital_Status1 ;
   H1x1_3  = H1x1_3  +    -0.31220761109652 * G_Marital_Status0
          +     0.52212878383819 * G_Marital_Status1 ;
   H1x1_4  = H1x1_4  +    -1.92906338619158 * G_Marital_Status0
          +    -1.25145208260948 * G_Marital_Status1 ;
   H1x1_5  = H1x1_5  +    -0.18067263072436 * G_Marital_Status0
          +    -0.07780771416761 * G_Marital_Status1 ;
   H1x1_1  =     1.46324697396327 + H1x1_1 ;
   H1x1_2  =     1.36794472927517 + H1x1_2 ;
   H1x1_3  =    -0.57612320445046 + H1x1_3 ;
   H1x1_4  =    -1.53805674056235 + H1x1_4 ;
   H1x1_5  =     0.35787040000513 + H1x1_5 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
   H1x1_5  = SIN(H1x1_5 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
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
   P_DepVar1  =    -2.75625949468408 * H1x1_1  +    -2.04123594690263 * H1x1_2
          +     2.55595542456674 * H1x1_3  +     2.41628841604103 * H1x1_4
          +      -11.39673341305 * H1x1_5 ;
   P_DepVar1  =     0.62420945009508 + P_DepVar1 ;
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
