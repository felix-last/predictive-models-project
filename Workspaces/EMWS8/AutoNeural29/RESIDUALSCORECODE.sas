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

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

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
   H1x1_1  =    -1.99300782242957 * S_AcceptedCmpTotal
          +     2.12004224248217 * S_Frq  +     3.86828667262904 * S_Income
          +     2.77648198770608 * S_Mnt  +    -2.27326773671069 * 
        S_MntGoldProds  +    -0.27399687657599 * S_MntMeatProducts
          +     2.26137957922507 * S_MntWines  +     0.14135280902221 * 
        S_NumDistPurchases  +     1.12048709605553 * S_RFMstat
          +     0.99315934409036 * S_RMntFrq  +     1.21818826467727 * 
        S_Recency ;
   H1x1_2  =    -0.46080527925139 * S_AcceptedCmpTotal
          +     1.22986184660358 * S_Frq  +     1.25416218398238 * S_Income
          +      0.7698101051046 * S_Mnt  +    -0.24851515302824 * 
        S_MntGoldProds  +    -1.02206883329868 * S_MntMeatProducts
          +    -2.60436726665032 * S_MntWines  +     1.42856046102253 * 
        S_NumDistPurchases  +     0.23036228891547 * S_RFMstat
          +    -0.44196680894425 * S_RMntFrq  +     1.47726327092789 * 
        S_Recency ;
   H1x1_3  =    -2.72041257472943 * S_AcceptedCmpTotal
          +     2.18007007875237 * S_Frq  +    -3.41389425682735 * S_Income
          +     1.22111404132155 * S_Mnt  +     0.13965132551243 * 
        S_MntGoldProds  +    -1.44679609979492 * S_MntMeatProducts
          +     1.32449625366546 * S_MntWines  +     0.71474658567846 * 
        S_NumDistPurchases  +    -1.11377169665392 * S_RFMstat
          +    -0.23272811318878 * S_RMntFrq  +     3.38352057173892 * 
        S_Recency ;
   H1x1_4  =    -0.53914082027029 * S_AcceptedCmpTotal
          +     3.52541527909413 * S_Frq  +     0.47386294116539 * S_Income
          +     1.74856835081997 * S_Mnt  +    -0.31608698854628 * 
        S_MntGoldProds  +    -4.08585161438784 * S_MntMeatProducts
          +     1.11934057687184 * S_MntWines  +    -4.23069217087257 * 
        S_NumDistPurchases  +    -0.45058242594518 * S_RFMstat
          +     2.24526854282726 * S_RMntFrq  +     0.46541621801996 * 
        S_Recency ;
   H1x1_5  =     0.16652182962256 * S_AcceptedCmpTotal
          +    -2.34082830868767 * S_Frq  +     0.06017749299853 * S_Income
          +    -3.61434433922311 * S_Mnt  +    -0.15794212009402 * 
        S_MntGoldProds  +     5.32833368617196 * S_MntMeatProducts
          +     1.70496933504273 * S_MntWines  +     2.85445845094536 * 
        S_NumDistPurchases  +     1.88219523605925 * S_RFMstat
          +     0.75869801637089 * S_RMntFrq  +     0.08064297106734 * 
        S_Recency ;
   H1x1_6  =     1.97422379745385 * S_AcceptedCmpTotal
          +    -0.18806921540808 * S_Frq  +    -1.45393613178942 * S_Income
          +    -1.71382589206496 * S_Mnt  +    -0.86398659373382 * 
        S_MntGoldProds  +    -0.55933907393534 * S_MntMeatProducts
          +    -2.04088833388184 * S_MntWines  +     1.33825297425801 * 
        S_NumDistPurchases  +    -1.84916943620006 * S_RFMstat
          +     1.10268410707441 * S_RMntFrq  +    -3.24538880603902 * 
        S_Recency ;
   H1x1_7  =    -0.04334303258083 * S_AcceptedCmpTotal
          +      1.2911623736286 * S_Frq  +    -2.28992194197276 * S_Income
          +    -0.46322849796029 * S_Mnt  +    -0.61987255353555 * 
        S_MntGoldProds  +    -0.70448430141235 * S_MntMeatProducts
          +    -2.07867791807129 * S_MntWines  +    -1.36577325340948 * 
        S_NumDistPurchases  +    -1.20867908080733 * S_RFMstat
          +     1.13377434281641 * S_RMntFrq  +     0.49995615625441 * 
        S_Recency ;
   H1x1_1  = H1x1_1  +     -1.7035629341514 * G_Marital_Status0
          +    -0.88839271772433 * G_Marital_Status1 ;
   H1x1_2  = H1x1_2  +     0.47234648810132 * G_Marital_Status0
          +     0.49781009278812 * G_Marital_Status1 ;
   H1x1_3  = H1x1_3  +     0.04803102756566 * G_Marital_Status0
          +     3.45859276392218 * G_Marital_Status1 ;
   H1x1_4  = H1x1_4  +    -0.00794915276466 * G_Marital_Status0
          +    -0.88877093101914 * G_Marital_Status1 ;
   H1x1_5  = H1x1_5  +     0.17344052282277 * G_Marital_Status0
          +     0.07512544812374 * G_Marital_Status1 ;
   H1x1_6  = H1x1_6  +     0.69797087079749 * G_Marital_Status0
          +     1.99160337429042 * G_Marital_Status1 ;
   H1x1_7  = H1x1_7  +    -1.90814013352903 * G_Marital_Status0
          +    -0.58260071621307 * G_Marital_Status1 ;
   H1x1_1  =      0.4509613443627 + H1x1_1 ;
   H1x1_2  =     3.28102437302443 + H1x1_2 ;
   H1x1_3  =    -0.59732076258377 + H1x1_3 ;
   H1x1_4  =     3.04302174126598 + H1x1_4 ;
   H1x1_5  =     4.11173403634453 + H1x1_5 ;
   H1x1_6  =     4.51964221881808 + H1x1_6 ;
   H1x1_7  =     7.27061205819069 + H1x1_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
   H1x1_6  = 1.0 / (1.0 + EXP(MIN( - H1x1_6 , _EXP_BAR)));
   H1x1_7  = 1.0 / (1.0 + EXP(MIN( - H1x1_7 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
   H1x1_7  = .;
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
   P_DepVar1  =    -3.49358340904307 * H1x1_1  +    -5.28251662728987 * H1x1_2
          +    -4.11876057817011 * H1x1_3  +    -7.73777326204979 * H1x1_4
          +     12.8932497890238 * H1x1_5  +     6.88694832857203 * H1x1_6
          +    -8.47048075234366 * H1x1_7 ;
   P_DepVar1  =     1.65092540834245 + P_DepVar1 ;
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
