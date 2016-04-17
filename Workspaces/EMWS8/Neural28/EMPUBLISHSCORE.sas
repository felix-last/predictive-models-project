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
   H11  =     0.82631693872377 * S_AcceptedCmpTotal  +    -0.72798667283699 *
        S_Frq  +     0.15911649036122 * S_Income  +    -0.60456350734571 *
        S_Mnt  +    -0.74377544096034 * S_MntFruits  +    -0.12263914971644 *
        S_MntGoldProds  +     0.17677796203072 * S_MntMeatProducts
          +    -0.50748691839629 * S_MntSweetProducts
          +     0.64296516693494 * S_NumCatalogPurchases
          +     1.28350004565407 * S_NumWebPurchases
          +     0.21030868312225 * S_RFMstat  +    -0.39695828920844 *
        S_RMntFrq  +    -0.89895080438896 * S_Recency ;
   H12  =     0.11667862669372 * S_AcceptedCmpTotal  +    -1.01106011934145 *
        S_Frq  +    -0.17716076384549 * S_Income  +    -0.24293226300477 *
        S_Mnt  +     -0.0787175302374 * S_MntFruits  +     0.00532047873906 *
        S_MntGoldProds  +     1.29466535738179 * S_MntMeatProducts
          +     0.17384010941361 * S_MntSweetProducts
          +     0.92948439877935 * S_NumCatalogPurchases
          +     0.22516927332959 * S_NumWebPurchases
          +     0.05028067999269 * S_RFMstat  +     0.78999743446302 *
        S_RMntFrq  +    -0.20939117765596 * S_Recency ;
   H13  =     0.04357769443186 * S_AcceptedCmpTotal  +     0.15406703269953 *
        S_Frq  +     0.30195133876726 * S_Income  +     0.28819360890276 *
        S_Mnt  +     0.09892781576641 * S_MntFruits  +     0.49225212949739 *
        S_MntGoldProds  +     0.29770764897396 * S_MntMeatProducts
          +     -0.2000873376449 * S_MntSweetProducts
          +     0.12566784354514 * S_NumCatalogPurchases
          +     0.02104112723179 * S_NumWebPurchases
          +    -0.43415514019088 * S_RFMstat  +    -0.17022294749993 *
        S_RMntFrq  +     0.30357171575981 * S_Recency ;
   H14  =     0.89017550554492 * S_AcceptedCmpTotal  +    -1.24866436391906 *
        S_Frq  +    -0.83458596455814 * S_Income  +    -0.66942952173326 *
        S_Mnt  +    -0.22543485387319 * S_MntFruits  +    -0.10688181972933 *
        S_MntGoldProds  +     0.85050982143614 * S_MntMeatProducts
          +     0.12117759215087 * S_MntSweetProducts
          +     0.80203773582494 * S_NumCatalogPurchases
          +     0.17374160185958 * S_NumWebPurchases
          +    -0.12855081884938 * S_RFMstat  +     0.45921570261849 *
        S_RMntFrq  +    -1.09092321008268 * S_Recency ;
   H15  =    -0.68386094226468 * S_AcceptedCmpTotal  +    -0.44368664779237 *
        S_Frq  +    -0.63118593216016 * S_Income  +     -0.8549673235883 *
        S_Mnt  +     -0.4174049500068 * S_MntFruits  +    -0.02221537411568 *
        S_MntGoldProds  +      0.0634004340553 * S_MntMeatProducts
          +      0.2989820991785 * S_MntSweetProducts
          +     0.04398783976739 * S_NumCatalogPurchases
          +     0.40368640676572 * S_NumWebPurchases
          +    -0.50987577368598 * S_RFMstat  +    -0.24616064467414 *
        S_RMntFrq  +    -0.01932947962302 * S_Recency ;
   H16  =    -0.69633356297868 * S_AcceptedCmpTotal  +     0.25580106272723 *
        S_Frq  +    -0.15941056497212 * S_Income  +     1.01091236070049 *
        S_Mnt  +    -0.16421220259024 * S_MntFruits  +    -0.28158219367628 *
        S_MntGoldProds  +    -0.80473865500071 * S_MntMeatProducts
          +     0.10950268819222 * S_MntSweetProducts
          +    -0.59025524598908 * S_NumCatalogPurchases
          +    -0.02069421817896 * S_NumWebPurchases
          +     -0.3615429826151 * S_RFMstat  +    -0.41611769964424 *
        S_RMntFrq  +     0.96940490611968 * S_Recency ;
   H11  = H11  +        0.45545922927 * G_Marital_Status0
          +     0.12818067118838 * G_Marital_Status1 ;
   H12  = H12  +    -0.20371081343188 * G_Marital_Status0
          +      0.0869800653918 * G_Marital_Status1 ;
   H13  = H13  +    -0.33845151454936 * G_Marital_Status0
          +    -0.43733288680739 * G_Marital_Status1 ;
   H14  = H14  +     0.11759980770855 * G_Marital_Status0
          +    -0.01680808105992 * G_Marital_Status1 ;
   H15  = H15  +    -0.20605143700963 * G_Marital_Status0
          +     0.04987739539035 * G_Marital_Status1 ;
   H16  = H16  +    -0.99478088512585 * G_Marital_Status0
          +    -0.35983290751115 * G_Marital_Status1 ;
   H11  =    -0.72044866217862 + H11 ;
   H12  =     0.73797915336977 + H12 ;
   H13  =     0.82989235994379 + H13 ;
   H14  =    -0.48103007102008 + H14 ;
   H15  =     -0.4352791778041 + H15 ;
   H16  =      2.7027355184778 + H16 ;
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
   P_DepVar1  =     1.53646139060035 * H11  +     1.98227889313385 * H12
          +     0.69366657666187 * H13  +      1.4458071195477 * H14
          +     0.81229467076169 * H15  +     -2.4762533950508 * H16 ;
   P_DepVar1  =    -0.95559108382775 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
H16
;
drop S_:;
