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
   H11  =     0.36818999915967 * S_AcceptedCmpTotal  +    -0.32408492568683 *
        S_Frq  +     0.26618853780944 * S_Income  +    -0.36642923239435 *
        S_Mnt  +     0.02869918805213 * S_MntGoldProds
          +      0.5764056033267 * S_MntMeatProducts
          +     0.28944243382913 * S_MntWines  +     0.66256470379204 *
        S_NumDistPurchases  +      0.0485500069575 * S_RFMstat
          +    -0.04002436035106 * S_RMntFrq  +    -0.66847972845367 *
        S_Recency ;
   H12  =    -0.46002100133008 * S_AcceptedCmpTotal  +    -1.04911103577658 *
        S_Frq  +    -1.60588169295391 * S_Income  +    -0.21451414022927 *
        S_Mnt  +     1.04050718623814 * S_MntGoldProds
          +      0.5452732097143 * S_MntMeatProducts
          +      0.7768479094041 * S_MntWines  +    -0.96869093556162 *
        S_NumDistPurchases  +     0.05788162730485 * S_RFMstat
          +     -0.2163092854208 * S_RMntFrq  +    -0.36679237964697 *
        S_Recency ;
   H13  =    -0.33764095452191 * S_AcceptedCmpTotal  +     0.62587436768629 *
        S_Frq  +    -0.15737192909006 * S_Income  +     1.29242787259286 *
        S_Mnt  +    -0.03945943496089 * S_MntGoldProds
          +     -0.9040019705776 * S_MntMeatProducts
          +     -0.5821231276136 * S_MntWines  +    -0.65592315374651 *
        S_NumDistPurchases  +      0.0374377458843 * S_RFMstat
          +    -0.49593973491818 * S_RMntFrq  +     0.36876094021551 *
        S_Recency ;
   H14  =     0.05718944662905 * S_AcceptedCmpTotal  +    -0.39281685140452 *
        S_Frq  +    -0.82737815057286 * S_Income  +    -1.16866060861567 *
        S_Mnt  +    -0.11326307526581 * S_MntGoldProds
          +     1.04227983605332 * S_MntMeatProducts
          +    -1.00642343793892 * S_MntWines  +     1.38852750995076 *
        S_NumDistPurchases  +     0.00836697541419 * S_RFMstat
          +    -0.09717761983291 * S_RMntFrq  +    -0.00929531662146 *
        S_Recency ;
   H15  =    -0.96184318583957 * S_AcceptedCmpTotal  +      0.4451990898536 *
        S_Frq  +    -0.21928305337089 * S_Income  +     0.79452164100328 *
        S_Mnt  +     0.06206219037073 * S_MntGoldProds
          +     0.23454153115636 * S_MntMeatProducts
          +     0.19107624776056 * S_MntWines  +     0.07324250201974 *
        S_NumDistPurchases  +    -0.36889587124555 * S_RFMstat
          +     0.11664291027363 * S_RMntFrq  +     0.62117853933635 *
        S_Recency ;
   H11  = H11  +     0.40650029940003 * G_Marital_Status0
          +    -0.03689005168758 * G_Marital_Status1 ;
   H12  = H12  +     0.68056692028925 * G_Marital_Status0
          +     0.12445131361373 * G_Marital_Status1 ;
   H13  = H13  +    -0.10388173588834 * G_Marital_Status0
          +     0.14567687521953 * G_Marital_Status1 ;
   H14  = H14  +    -0.32184280270007 * G_Marital_Status0
          +     0.48017665139683 * G_Marital_Status1 ;
   H15  = H15  +    -0.55279472089433 * G_Marital_Status0
          +    -0.61571213294128 * G_Marital_Status1 ;
   H11  =    -2.29158741731878 + H11 ;
   H12  =     0.77169669702403 + H12 ;
   H13  =    -0.33884334850071 + H13 ;
   H14  =    -0.68456652615091 + H14 ;
   H15  =    -2.08269941889355 + H15 ;
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
   P_DepVar1  =      3.8750512140027 * H11  +     1.39816182952025 * H12
          +    -5.40860917226626 * H13  +      2.0293529122836 * H14
          +    -1.46910412369056 * H15 ;
   P_DepVar1  =    -2.09975800032061 + P_DepVar1 ;
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
;
drop S_:;
