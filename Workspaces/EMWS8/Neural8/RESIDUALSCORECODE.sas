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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label H17 = 'Hidden: H1=7' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal , 
   Mnt , 
   MntMeatProducts , 
   NumCatalogPurchases , 
   RFMstat , 
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 * 
        NumCatalogPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.26517495321118 * S_AcceptedCmpTotal  +    -0.87413825198876 * 
        S_Mnt  +     5.04044337479394 * S_MntMeatProducts
          +     0.73338587137623 * S_NumCatalogPurchases
          +     1.75847953793442 * S_RFMstat  +    -0.20116057418843 * 
        S_Recency ;
   H12  =    -0.29419263200782 * S_AcceptedCmpTotal  +     0.13220940274202 * 
        S_Mnt  +    -1.04971607430808 * S_MntMeatProducts
          +      0.6935189671617 * S_NumCatalogPurchases
          +     0.36816983288974 * S_RFMstat  +    -0.00643331274093 * 
        S_Recency ;
   H13  =     0.13829897408873 * S_AcceptedCmpTotal  +    -2.23121471987064 * 
        S_Mnt  +     0.62841690349858 * S_MntMeatProducts
          +     0.29630592582375 * S_NumCatalogPurchases
          +     0.64308296429787 * S_RFMstat  +     0.59591409485522 * 
        S_Recency ;
   H14  =    -3.95384198121982 * S_AcceptedCmpTotal  +     2.01854341617621 * 
        S_Mnt  +     2.79950511807496 * S_MntMeatProducts
          +    -2.17483369150477 * S_NumCatalogPurchases
          +     0.45727826044187 * S_RFMstat  +    -3.04663085487194 * 
        S_Recency ;
   H15  =     -0.0515719302773 * S_AcceptedCmpTotal  +    -1.87581836231223 * 
        S_Mnt  +      2.2761907205026 * S_MntMeatProducts
          +    -1.72538913893407 * S_NumCatalogPurchases
          +     -0.3123592120938 * S_RFMstat  +     1.58063513304145 * 
        S_Recency ;
   H16  =     0.29634579301776 * S_AcceptedCmpTotal  +    -0.70611444699748 * 
        S_Mnt  +     0.18537198194998 * S_MntMeatProducts
          +     0.10728494982101 * S_NumCatalogPurchases
          +     0.25847373125288 * S_RFMstat  +    -0.10825431765799 * 
        S_Recency ;
   H17  =     0.42494872289576 * S_AcceptedCmpTotal  +     2.86832982257419 * 
        S_Mnt  +    -1.29224109729356 * S_MntMeatProducts
          +    -1.97575805984161 * S_NumCatalogPurchases
          +      1.1851910683945 * S_RFMstat  +     0.14034943341983 * 
        S_Recency ;
   H11  =     4.10698399107728 + H11 ;
   H12  =    -0.85937202501212 + H12 ;
   H13  =     1.76913863070128 + H13 ;
   H14  =    -0.83369559754745 + H14 ;
   H15  =     5.14916643261102 + H15 ;
   H16  =    -0.07308651583377 + H16 ;
   H17  =     0.67214048080922 + H17 ;
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
   P_DepVar1  =     3.48539232013053 * H11  +    -3.36283315259488 * H12
          +    -3.73944893696602 * H13  +     0.66404245877611 * H14
          +    -1.98199539124105 * H15  +     8.06594226275618 * H16
          +    -2.04910263577918 * H17 ;
   P_DepVar1  =    -2.26663057425607 + P_DepVar1 ;
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
