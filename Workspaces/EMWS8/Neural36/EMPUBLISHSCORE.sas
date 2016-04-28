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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_Recency = 'Standard: Recency' ;

      label Marital_StatusDivorced = 'Dummy: Marital_Status=Divorced' ;

      label Marital_StatusMarried = 'Dummy: Marital_Status=Married' ;

      label Marital_StatusSingle = 'Dummy: Marital_Status=Single' ;

      label Marital_StatusTogether = 'Dummy: Marital_Status=Together' ;

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

*** Generate dummy variables for Marital_Status ;
drop Marital_StatusDivorced Marital_StatusMarried Marital_StatusSingle
        Marital_StatusTogether ;
*** encoding is sparse, initialize to zero;
Marital_StatusDivorced = 0;
Marital_StatusMarried = 0;
Marital_StatusSingle = 0;
Marital_StatusTogether = 0;
if missing( Marital_Status ) then do;
   Marital_StatusDivorced = .;
   Marital_StatusMarried = .;
   Marital_StatusSingle = .;
   Marital_StatusTogether = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm8 $ 8; drop _dm8 ;
   _dm8 = put( Marital_Status , $8. );
   %DMNORMIP( _dm8 )
   _dm_find = 0; drop _dm_find;
   if _dm8 <= 'SINGLE'  then do;
      if _dm8 <= 'MARRIED'  then do;
         if _dm8 = 'DIVORCED'  then do;
            Marital_StatusDivorced = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm8 = 'MARRIED'  then do;
               Marital_StatusMarried = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm8 = 'SINGLE'  then do;
            Marital_StatusSingle = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm8 = 'TOGETHER'  then do;
         Marital_StatusTogether = 1;
         _dm_find = 1;
      end;
      else do;
         if _dm8 = 'WIDOW'  then do;
            Marital_StatusDivorced = -1;
            Marital_StatusMarried = -1;
            Marital_StatusSingle = -1;
            Marital_StatusTogether = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      Marital_StatusDivorced = .;
      Marital_StatusMarried = .;
      Marital_StatusSingle = .;
      Marital_StatusTogether = .;
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
   Mnt ,
   MntMeatProducts ,
   NumCatalogPurchases ,
   NumDealsPurchases ,
   NumWebVisitsMonth ,
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 *
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 *
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 *
        NumWebVisitsMonth ;
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
   H11  =    -0.13927969047531 * S_AcceptedCmpTotal  +    -0.63180331858997 *
        S_Frq  +     0.64218193404925 * S_Mnt  +    -1.09018159995832 *
        S_MntMeatProducts  +     -0.0525140711481 * S_NumCatalogPurchases
          +     0.54227053816028 * S_NumDealsPurchases
          +    -0.72067392363133 * S_NumWebVisitsMonth
          +     1.97836772832458 * S_Recency ;
   H12  =      0.7201127764608 * S_AcceptedCmpTotal  +      -0.249227931932 *
        S_Frq  +     0.09529654212208 * S_Mnt  +     0.71215113531886 *
        S_MntMeatProducts  +     0.42797461401557 * S_NumCatalogPurchases
          +     0.72213774326416 * S_NumDealsPurchases
          +     0.82635861527041 * S_NumWebVisitsMonth
          +    -1.15716240400951 * S_Recency ;
   H13  =    -0.47733798336023 * S_AcceptedCmpTotal  +     1.77772008360582 *
        S_Frq  +     0.74015836577273 * S_Mnt  +    -2.09802242783455 *
        S_MntMeatProducts  +     -2.0604713665217 * S_NumCatalogPurchases
          +    -0.43212551045752 * S_NumDealsPurchases
          +    -0.64430159163369 * S_NumWebVisitsMonth
          +     0.20699064954569 * S_Recency ;
   H14  =    -0.04912516108169 * S_AcceptedCmpTotal  +    -0.39920729213556 *
        S_Frq  +     1.28832230193431 * S_Mnt  +     2.49097094540063 *
        S_MntMeatProducts  +     -0.7345287027769 * S_NumCatalogPurchases
          +    -0.23499091401918 * S_NumDealsPurchases
          +    -0.29217361533329 * S_NumWebVisitsMonth
          +     0.22725296423105 * S_Recency ;
   H15  =    -0.57086204432891 * S_AcceptedCmpTotal  +      0.8778230694935 *
        S_Frq  +     1.15312235467448 * S_Mnt  +    -0.44668500784663 *
        S_MntMeatProducts  +    -0.46898396140615 * S_NumCatalogPurchases
          +      0.5266291220003 * S_NumDealsPurchases
          +    -0.96300834305482 * S_NumWebVisitsMonth
          +     0.68179956103907 * S_Recency ;
   H16  =    -0.50509061578538 * S_AcceptedCmpTotal  +    -0.06382263258739 *
        S_Frq  +    -0.20684681067061 * S_Mnt  +     -0.1723653611643 *
        S_MntMeatProducts  +    -0.55341696140251 * S_NumCatalogPurchases
          +     0.21407658568759 * S_NumDealsPurchases
          +    -0.30230445007862 * S_NumWebVisitsMonth
          +      0.8763809622949 * S_Recency ;
   H17  =    -0.20843198902717 * S_AcceptedCmpTotal  +     1.47593020659154 *
        S_Frq  +      2.2391730772085 * S_Mnt  +    -1.96971925461337 *
        S_MntMeatProducts  +    -1.33493636985909 * S_NumCatalogPurchases
          +    -0.71262860060777 * S_NumDealsPurchases
          +    -0.16003262475714 * S_NumWebVisitsMonth
          +     0.30492086974514 * S_Recency ;
   H11  = H11  +    -0.59867776291698 * Marital_StatusDivorced
          +    -0.77289864882405 * Marital_StatusMarried
          +    -1.04792470584913 * Marital_StatusSingle
          +     1.78644715155531 * Marital_StatusTogether ;
   H12  = H12  +     -0.5766498657478 * Marital_StatusDivorced
          +    -0.58699647015827 * Marital_StatusMarried
          +    -1.45685449315382 * Marital_StatusSingle
          +    -0.57773394015054 * Marital_StatusTogether ;
   H13  = H13  +    -0.53037191026882 * Marital_StatusDivorced
          +    -0.61402763409667 * Marital_StatusMarried
          +    -0.94454892723651 * Marital_StatusSingle
          +    -1.16354372572715 * Marital_StatusTogether ;
   H14  = H14  +    -0.13873258987154 * Marital_StatusDivorced
          +     1.36531646228763 * Marital_StatusMarried
          +     0.56507141025345 * Marital_StatusSingle
          +     1.07733975152905 * Marital_StatusTogether ;
   H15  = H15  +    -1.08382106670561 * Marital_StatusDivorced
          +     0.86517922699299 * Marital_StatusMarried
          +    -0.25270268615277 * Marital_StatusSingle
          +     1.41323475133006 * Marital_StatusTogether ;
   H16  = H16  +     0.68313126007351 * Marital_StatusDivorced
          +     0.84688769440997 * Marital_StatusMarried
          +     -0.9162090616438 * Marital_StatusSingle
          +     0.19067350568292 * Marital_StatusTogether ;
   H17  = H17  +    -0.35311007430456 * Marital_StatusDivorced
          +     0.25385556802402 * Marital_StatusMarried
          +     0.06295540442756 * Marital_StatusSingle
          +     -0.0369190740933 * Marital_StatusTogether ;
   H11  =     0.91888530169708 + H11 ;
   H12  =    -1.87691251344908 + H12 ;
   H13  =     0.67176027494579 + H13 ;
   H14  =     1.36219597555353 + H14 ;
   H15  =    -1.22230644761539 + H15 ;
   H16  =      2.6660042377591 + H16 ;
   H17  =     1.41738058573685 + H17 ;
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
   P_DepVar1  =    -1.56163309380633 * H11  +     2.99475736269426 * H12
          +    -3.38085392764162 * H13  +     2.44315909437251 * H14
          +    -4.58905802620352 * H15  +    -5.85802056442644 * H16
          +    -3.34899990325235 * H17 ;
   P_DepVar1  =     1.13403274907418 + P_DepVar1 ;
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
