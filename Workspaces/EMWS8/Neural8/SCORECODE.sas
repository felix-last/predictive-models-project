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

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

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

      label H17 = 'Hidden: H1=7' ;

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
   MntFruits , 
   MntGoldProds , 
   MntMeatProducts , 
   MntSweetProducts , 
   NumCatalogPurchases , 
   NumWebPurchases , 
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
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 * 
        NumCatalogPurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 * 
        NumWebPurchases ;
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
   IF MISSING( MntFruits ) THEN S_MntFruits  = . ;
   ELSE S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits
         ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   IF MISSING( MntSweetProducts ) THEN S_MntSweetProducts  = . ;
   ELSE S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 * 
        NumWebPurchases ;
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
   H11  =     0.00179298802892 * S_AcceptedCmpTotal  +     0.01784009275608 * 
        S_Frq  +     0.69409617936033 * S_Income  +    -0.28641816886809 * 
        S_Mnt  +     0.21745721720131 * S_MntFruits  +    -0.38924339437831 * 
        S_MntGoldProds  +     0.48302006424722 * S_MntMeatProducts
          +     0.32217287817742 * S_MntSweetProducts
          +     0.37317765763795 * S_NumCatalogPurchases
          +     0.31712152035565 * S_NumWebPurchases
          +    -0.00101711956377 * S_RFMstat  +    -0.50814709993968 * 
        S_RMntFrq  +     -0.2674878177058 * S_Recency ;
   H12  =    -0.13522102699695 * S_AcceptedCmpTotal  +     0.62468738576113 * 
        S_Frq  +     0.33525631913577 * S_Income  +     0.49596519260867 * 
        S_Mnt  +    -0.07840703709606 * S_MntFruits  +    -0.13407863606593 * 
        S_MntGoldProds  +     0.07892036440987 * S_MntMeatProducts
          +    -0.19345300638771 * S_MntSweetProducts
          +     0.37926806634405 * S_NumCatalogPurchases
          +     0.17926711405358 * S_NumWebPurchases
          +    -0.56247478537915 * S_RFMstat  +    -0.83222377723575 * 
        S_RMntFrq  +     0.06152905340066 * S_Recency ;
   H13  =     0.52085707566671 * S_AcceptedCmpTotal  +    -0.43119445779869 * 
        S_Frq  +    -0.38451776725994 * S_Income  +    -0.43893571865073 * 
        S_Mnt  +    -0.18147736658896 * S_MntFruits  +    -0.02759924916073 * 
        S_MntGoldProds  +     0.41710329802839 * S_MntMeatProducts
          +    -0.11238728777733 * S_MntSweetProducts
          +     0.39955878063516 * S_NumCatalogPurchases
          +     0.37701883017309 * S_NumWebPurchases
          +    -0.03011513977353 * S_RFMstat  +     0.05558894855861 * 
        S_RMntFrq  +    -0.53097904952065 * S_Recency ;
   H14  =     0.01011198652387 * S_AcceptedCmpTotal  +     0.50914419302954 * 
        S_Frq  +     0.36935051571942 * S_Income  +    -0.14541266632981 * 
        S_Mnt  +     0.70809835135242 * S_MntFruits  +     0.17636828127553 * 
        S_MntGoldProds  +    -0.39065133922684 * S_MntMeatProducts
          +      0.2693109494597 * S_MntSweetProducts
          +      0.1081864929712 * S_NumCatalogPurchases
          +     0.04463189601793 * S_NumWebPurchases
          +     0.17598396305598 * S_RFMstat  +    -0.26428585222285 * 
        S_RMntFrq  +    -0.35066600356743 * S_Recency ;
   H15  =     0.25974646459449 * S_AcceptedCmpTotal  +    -0.01084764302849 * 
        S_Frq  +    -0.25453296848623 * S_Income  +    -0.24485320547361 * 
        S_Mnt  +      0.3523119885561 * S_MntFruits  +    -0.23948230282173 * 
        S_MntGoldProds  +    -0.61077291955379 * S_MntMeatProducts
          +     0.69250340520766 * S_MntSweetProducts
          +    -0.92476508978686 * S_NumCatalogPurchases
          +    -0.85062812213631 * S_NumWebPurchases
          +    -0.13668170504261 * S_RFMstat  +    -0.39159958659757 * 
        S_RMntFrq  +     0.31541831647045 * S_Recency ;
   H16  =     0.30881424897223 * S_AcceptedCmpTotal  +      0.2794364053658 * 
        S_Frq  +    -0.13255692208785 * S_Income  +      0.1084623497397 * 
        S_Mnt  +    -0.21377822064675 * S_MntFruits  +     0.66167304100171 * 
        S_MntGoldProds  +    -0.18059030828344 * S_MntMeatProducts
          +      0.1342841887454 * S_MntSweetProducts
          +    -0.35353451726224 * S_NumCatalogPurchases
          +     0.19726071632213 * S_NumWebPurchases
          +    -0.67773182477521 * S_RFMstat  +    -0.05559124023026 * 
        S_RMntFrq  +     0.29135046009186 * S_Recency ;
   H17  =    -0.56474657283939 * S_AcceptedCmpTotal  +     0.49714469636668 * 
        S_Frq  +     0.38873911121939 * S_Income  +     0.18672296356038 * 
        S_Mnt  +    -0.12290033905766 * S_MntFruits  +    -0.55117454621073 * 
        S_MntGoldProds  +    -0.34157249684624 * S_MntMeatProducts
          +    -0.03878223698579 * S_MntSweetProducts
          +    -0.44318159654535 * S_NumCatalogPurchases
          +     0.28629379958053 * S_NumWebPurchases
          +    -0.33628587814816 * S_RFMstat  +     0.01539005969109 * 
        S_RMntFrq  +      0.4669281349511 * S_Recency ;
   H11  = H11  +     0.54366812821853 * G_Marital_Status0
          +    -0.24270884269566 * G_Marital_Status1 ;
   H12  = H12  +     0.12201873252315 * G_Marital_Status0
          +      0.2708540168877 * G_Marital_Status1 ;
   H13  = H13  +     0.21773390953206 * G_Marital_Status0
          +      0.1849184915243 * G_Marital_Status1 ;
   H14  = H14  +     0.42359989920789 * G_Marital_Status0
          +     -0.0427682060318 * G_Marital_Status1 ;
   H15  = H15  +     0.39852794737212 * G_Marital_Status0
          +      0.4834959104522 * G_Marital_Status1 ;
   H16  = H16  +     0.34117172602716 * G_Marital_Status0
          +     0.01719507366738 * G_Marital_Status1 ;
   H17  = H17  +    -0.48271020073977 * G_Marital_Status0
          +    -0.38643265086902 * G_Marital_Status1 ;
   H11  =    -1.92887755316705 + H11 ;
   H12  =     1.10580453552439 + H12 ;
   H13  =     -0.0396459221076 + H13 ;
   H14  =    -0.24030684440152 + H14 ;
   H15  =    -1.57024900687106 + H15 ;
   H16  =    -0.33224481657704 + H16 ;
   H17  =     1.22710614099789 + H17 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     1.21462455419854 * H11  +    -0.32480789724651 * H12
          +     2.96475008226038 * H13  +     -0.7919726093423 * H14
          +    -2.29353966226595 * H15  +     -0.7223088500433 * H16
          +    -2.44182031584859 * H17 ;
   P_DepVar1  =    -1.63832895249218 + P_DepVar1 ;
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
