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
   H11  =     -0.0913777931029 * S_AcceptedCmpTotal  +     0.60888959215918 * 
        S_Frq  +    -0.24839207108705 * S_Income  +     0.12904699470351 * 
        S_Mnt  +     0.54811037634684 * S_MntFruits  +    -0.08131311507182 * 
        S_MntGoldProds  +    -1.97616589442941 * S_MntMeatProducts
          +     0.82261116064356 * S_MntSweetProducts
          +    -1.55909661993581 * S_NumCatalogPurchases
          +    -0.16340954706378 * S_NumWebPurchases
          +    -1.23424537997161 * S_RFMstat  +    -0.80043433144556 * 
        S_RMntFrq  +     0.30674447000925 * S_Recency ;
   H12  =     0.66910867066957 * S_AcceptedCmpTotal  +    -0.81073730531351 * 
        S_Frq  +    -0.92904249004165 * S_Income  +    -0.71459542981691 * 
        S_Mnt  +    -0.40393540462056 * S_MntFruits  +    -0.20281878016562 * 
        S_MntGoldProds  +     0.17444715052802 * S_MntMeatProducts
          +     0.16618230229073 * S_MntSweetProducts
          +     0.80060397308165 * S_NumCatalogPurchases
          +     0.55840526773277 * S_NumWebPurchases
          +    -0.09080307227601 * S_RFMstat  +     0.05982566462633 * 
        S_RMntFrq  +    -0.42099196648583 * S_Recency ;
   H13  =    -0.15105936730245 * S_AcceptedCmpTotal  +     1.16357039711749 * 
        S_Frq  +     0.22437164680037 * S_Income  +     1.43365592130923 * 
        S_Mnt  +    -0.14312453132189 * S_MntFruits  +    -0.31473112363001 * 
        S_MntGoldProds  +    -2.13920511789248 * S_MntMeatProducts
          +    -0.17184538549757 * S_MntSweetProducts
          +    -0.69381764338971 * S_NumCatalogPurchases
          +    -1.00049208220128 * S_NumWebPurchases
          +    -0.12191208845807 * S_RFMstat  +     1.62722348145663 * 
        S_RMntFrq  +     0.22384852404779 * S_Recency ;
   H14  =    -0.30303374230593 * S_AcceptedCmpTotal  +    -0.62477404644887 * 
        S_Frq  +    -0.43520735188047 * S_Income  +     0.05599198595582 * 
        S_Mnt  +     0.00600099391846 * S_MntFruits  +    -0.09476560363866 * 
        S_MntGoldProds  +    -0.00009188415985 * S_MntMeatProducts
          +     0.23752183521653 * S_MntSweetProducts
          +    -0.28855285082926 * S_NumCatalogPurchases
          +     0.22915352115856 * S_NumWebPurchases
          +    -0.11884330592736 * S_RFMstat  +    -0.64276224884242 * 
        S_RMntFrq  +     0.92099032026404 * S_Recency ;
   H15  =     0.69494967673266 * S_AcceptedCmpTotal  +    -1.38070782248656 * 
        S_Frq  +    -0.32839057322808 * S_Income  +    -0.08175715513223 * 
        S_Mnt  +    -0.20002754133592 * S_MntFruits  +    -0.11045646973193 * 
        S_MntGoldProds  +     -0.0204672560747 * S_MntMeatProducts
          +     0.02112120768705 * S_MntSweetProducts
          +     0.56037303009349 * S_NumCatalogPurchases
          +     0.16645734799944 * S_NumWebPurchases
          +    -0.08683405137098 * S_RFMstat  +     0.67174291855061 * 
        S_RMntFrq  +    -0.73931649005757 * S_Recency ;
   H11  = H11  +    -0.06672320657697 * G_Marital_Status0
          +     0.26608073179469 * G_Marital_Status1 ;
   H12  = H12  +    -0.50978529257766 * G_Marital_Status0
          +    -0.79456480121636 * G_Marital_Status1 ;
   H13  = H13  +     0.10010493470347 * G_Marital_Status0
          +    -0.36513536279898 * G_Marital_Status1 ;
   H14  = H14  +    -0.69765939438555 * G_Marital_Status0
          +    -0.11679147660596 * G_Marital_Status1 ;
   H15  = H15  +     0.53791694284218 * G_Marital_Status0
          +      0.4394922352118 * G_Marital_Status1 ;
   H11  =    -2.24311986759404 + H11 ;
   H12  =    -0.72214357959265 + H12 ;
   H13  =     0.67332529871332 + H13 ;
   H14  =      3.2917179565774 + H14 ;
   H15  =     0.60464077032534 + H15 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -3.62613662430208 * H11  +     1.55068674489409 * H12
          +    -3.01839961891379 * H13  +    -4.27170883586144 * H14
          +     2.62887939759638 * H15 ;
   P_DepVar1  =    -1.19158347943696 + P_DepVar1 ;
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
