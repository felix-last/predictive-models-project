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

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

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
*** Writing the Node intvl ;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.40839920245437 * S_AcceptedCmpTotal  +    -0.80301052154323 * 
        S_Frq  +     0.19839975683497 * S_Income  +    -0.71099382445924 * 
        S_Mnt  +    -0.15644638799226 * S_MntGoldProds
          +    -0.05910355740416 * S_MntMeatProducts
          +     0.23095157103241 * S_MntWines  +     0.67840217585411 * 
        S_NumDistPurchases  +     0.12536920827324 * S_RFMstat
          +    -0.27246125863137 * S_RMntFrq  +    -1.02114645988925 * 
        S_Recency ;
   H12  =    -0.09503041118006 * S_AcceptedCmpTotal  +     0.74672296647411 * 
        S_Frq  +     1.82688988564051 * S_Income  +    -0.06831964209279 * 
        S_Mnt  +    -0.13330887266177 * S_MntGoldProds
          +     0.09400377526937 * S_MntMeatProducts
          +    -0.53358910675611 * S_MntWines  +     0.13886503925085 * 
        S_NumDistPurchases  +     0.02243224025219 * S_RFMstat
          +    -0.03110171961938 * S_RMntFrq  +     0.39055670382948 * 
        S_Recency ;
   H13  =    -0.07144509122078 * S_AcceptedCmpTotal  +     0.65325962599673 * 
        S_Frq  +     0.03169199805286 * S_Income  +     0.53573115818994 * 
        S_Mnt  +     0.13372718478424 * S_MntGoldProds
          +    -1.62740823190029 * S_MntMeatProducts
          +     0.15642273844597 * S_MntWines  +    -0.78908066213044 * 
        S_NumDistPurchases  +     -0.4365555360753 * S_RFMstat
          +    -0.63552932650743 * S_RMntFrq  +     0.17699292292485 * 
        S_Recency ;
   H14  =     0.03098188354318 * S_AcceptedCmpTotal  +    -0.04737735825642 * 
        S_Frq  +     0.30967861276694 * S_Income  +    -0.03786683388502 * 
        S_Mnt  +     0.25532115520236 * S_MntGoldProds
          +      0.3965117290354 * S_MntMeatProducts
          +     0.36188945634536 * S_MntWines  +    -0.24664355133344 * 
        S_NumDistPurchases  +     0.15627885374544 * S_RFMstat
          +    -0.10763737759383 * S_RMntFrq  +     -0.4091862538023 * 
        S_Recency ;
   H15  =     0.27467896926965 * S_AcceptedCmpTotal  +    -1.33897347254907 * 
        S_Frq  +    -0.08574739739253 * S_Income  +    -0.68536026344277 * 
        S_Mnt  +     0.08729572232071 * S_MntGoldProds
          +     1.44231431118379 * S_MntMeatProducts
          +    -0.09322237385561 * S_MntWines  +      1.5568901785563 * 
        S_NumDistPurchases  +     0.06237505409693 * S_RFMstat
          +    -1.04636887800306 * S_RMntFrq  +    -0.38411527089703 * 
        S_Recency ;
   H16  =    -0.89143353938241 * S_AcceptedCmpTotal  +     0.45211708970504 * 
        S_Frq  +    -0.44897699945178 * S_Income  +    -0.32314426452158 * 
        S_Mnt  +    -0.32329530597419 * S_MntGoldProds
          +    -0.44244305964257 * S_MntMeatProducts
          +    -0.04171589876809 * S_MntWines  +     0.42122451368745 * 
        S_NumDistPurchases  +    -0.15802898075961 * S_RFMstat
          +    -0.40329155853226 * S_RMntFrq  +    -0.65176917675454 * 
        S_Recency ;
   H11  = H11  +     0.01448447530274 * G_Marital_Status0
          +     0.42194179998625 * G_Marital_Status1 ;
   H12  = H12  +     0.12689198218881 * G_Marital_Status0
          +     0.13222809503301 * G_Marital_Status1 ;
   H13  = H13  +     0.02279524261833 * G_Marital_Status0
          +     0.22562672580832 * G_Marital_Status1 ;
   H14  = H14  +     1.11856448462308 * G_Marital_Status0
          +     0.27730078918446 * G_Marital_Status1 ;
   H15  = H15  +    -0.04694745686684 * G_Marital_Status0
          +     0.25879365732348 * G_Marital_Status1 ;
   H16  = H16  +    -0.22835702249634 * G_Marital_Status0
          +     0.18090765090711 * G_Marital_Status1 ;
   H11  =     1.23863858658783 + H11 ;
   H12  =    -0.12218156586843 + H12 ;
   H13  =    -1.28170837349164 + H13 ;
   H14  =    -2.07579206307318 + H14 ;
   H15  =    -0.99934113480463 + H15 ;
   H16  =     1.30250382782737 + H16 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     3.62046962800706 * H11  +      -1.860875673098 * H12
          +    -3.65105027155196 * H13  +     2.14381074770309 * H14
          +     3.35729012959095 * H15  +    -2.46245459087361 * H16 ;
   P_DepVar1  =    -2.50510283018473 + P_DepVar1 ;
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
