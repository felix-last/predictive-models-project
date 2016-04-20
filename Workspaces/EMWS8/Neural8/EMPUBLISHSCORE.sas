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
   H11  =     0.33294813803267 * S_AcceptedCmpTotal  +    -1.24039573879629 *
        S_Frq  +    -0.05312453396461 * S_Income  +    -1.10582794272994 *
        S_Mnt  +    -0.07760643003938 * S_MntGoldProds
          +     1.40615546889198 * S_MntMeatProducts
          +    -0.07607000653866 * S_MntWines  +      1.3974050378538 *
        S_NumDistPurchases  +     0.21523028866532 * S_RFMstat
          +    -0.90250971189164 * S_RMntFrq  +    -0.29921926423225 *
        S_Recency ;
   H12  =    -0.12895365437344 * S_AcceptedCmpTotal  +     -1.3313949600547 *
        S_Frq  +    -1.37899106632441 * S_Income  +    -0.58761109294666 *
        S_Mnt  +     0.35202206207132 * S_MntGoldProds
          +     0.09184646817235 * S_MntMeatProducts
          +     0.13335664554613 * S_MntWines  +     0.61353674232736 *
        S_NumDistPurchases  +     0.35066529273924 * S_RFMstat
          +     0.65664535290196 * S_RMntFrq  +    -0.18186117718946 *
        S_Recency ;
   H13  =     0.37357969261544 * S_AcceptedCmpTotal  +     0.39633284030412 *
        S_Frq  +     0.64644973118257 * S_Income  +    -0.00934866805665 *
        S_Mnt  +     0.34942371005238 * S_MntGoldProds
          +     0.39891627134773 * S_MntMeatProducts
          +    -0.03684678353498 * S_MntWines  +     1.02433172338367 *
        S_NumDistPurchases  +     0.20910974889856 * S_RFMstat
          +     0.07904474603466 * S_RMntFrq  +    -0.30357080495082 *
        S_Recency ;
   H14  =     0.13554328647808 * S_AcceptedCmpTotal  +    -0.07048372524888 *
        S_Frq  +     0.04610079419509 * S_Income  +     0.10924113857251 *
        S_Mnt  +     0.12915488369242 * S_MntGoldProds
          +     0.18610321199349 * S_MntMeatProducts
          +     0.70556343816133 * S_MntWines  +     0.25728143320607 *
        S_NumDistPurchases  +     0.15972524961567 * S_RFMstat
          +     0.01276365258392 * S_RMntFrq  +    -0.66413982659745 *
        S_Recency ;
   H15  =     -1.1420503402904 * S_AcceptedCmpTotal  +     0.71380555863062 *
        S_Frq  +    -0.24803616582173 * S_Income  +     0.13154058420998 *
        S_Mnt  +    -0.42749671288369 * S_MntGoldProds
          +     -1.3154288229161 * S_MntMeatProducts
          +      -0.255711705654 * S_MntWines  +     0.11914899881729 *
        S_NumDistPurchases  +    -0.05982295822576 * S_RFMstat
          +    -0.69679195615668 * S_RMntFrq  +    -0.21391830972623 *
        S_Recency ;
   H16  =     0.00981250946025 * S_AcceptedCmpTotal  +     0.04123504196179 *
        S_Frq  +     0.12222635666431 * S_Income  +     0.29796072335771 *
        S_Mnt  +     0.22410489312536 * S_MntGoldProds
          +    -1.05184346257138 * S_MntMeatProducts
          +     0.19959913357382 * S_MntWines  +    -0.69776033144787 *
        S_NumDistPurchases  +    -0.40844675601616 * S_RFMstat
          +    -0.86567751620087 * S_RMntFrq  +       0.363703677148 *
        S_Recency ;
   H17  =     0.94478838355387 * S_AcceptedCmpTotal  +    -0.70060201854486 *
        S_Frq  +     -0.1828959052644 * S_Income  +    -0.69020858610444 *
        S_Mnt  +    -0.10810625538739 * S_MntGoldProds
          +     0.08623383006102 * S_MntMeatProducts
          +    -0.10662594781542 * S_MntWines  +     0.49956982718189 *
        S_NumDistPurchases  +    -0.52485639325545 * S_RFMstat
          +    -0.21634639560711 * S_RMntFrq  +    -1.54075315391445 *
        S_Recency ;
   H11  = H11  +     0.16164655653565 * G_Marital_Status0
          +     0.08705670063172 * G_Marital_Status1 ;
   H12  = H12  +     0.00173619463191 * G_Marital_Status0
          +    -0.01602297769528 * G_Marital_Status1 ;
   H13  = H13  +    -0.20647507845797 * G_Marital_Status0
          +    -0.14268881423356 * G_Marital_Status1 ;
   H14  = H14  +     0.66515401547718 * G_Marital_Status0
          +     0.13894686879381 * G_Marital_Status1 ;
   H15  = H15  +    -0.10602970955306 * G_Marital_Status0
          +     0.12966863964317 * G_Marital_Status1 ;
   H16  = H16  +     0.25775977539205 * G_Marital_Status0
          +     0.20902791963936 * G_Marital_Status1 ;
   H17  = H17  +     0.54268893569335 * G_Marital_Status0
          +     0.63641124967593 * G_Marital_Status1 ;
   H11  =    -0.89307077259606 + H11 ;
   H12  =    -0.52976269769549 + H12 ;
   H13  =     1.93938724237609 + H13 ;
   H14  =    -2.08624954900209 + H14 ;
   H15  =     1.21926205411217 + H15 ;
   H16  =    -0.82614580546756 + H16 ;
   H17  =     0.88553151374376 + H17 ;
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
   P_DepVar1  =     2.95606472513759 * H11  +     1.89470964296724 * H12
          +     1.54768089051578 * H13  +     1.66736822539449 * H14
          +    -1.78269941197359 * H15  +    -1.37291423165719 * H16
          +      2.0599951000352 * H17 ;
   P_DepVar1  =    -1.26664447892937 + P_DepVar1 ;
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
H17
;
drop S_:;
