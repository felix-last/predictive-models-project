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
   H11  =    -0.50937067326512 * S_AcceptedCmpTotal  +     0.59153604997173 * 
        S_Frq  +     0.35109708191283 * S_Mnt  +    -0.54183123684873 * 
        S_MntMeatProducts  +    -0.50968421326068 * S_NumCatalogPurchases
          +    -0.19046126117019 * S_NumDealsPurchases
          +    -0.51033119597715 * S_NumWebVisitsMonth
          +     0.81837864997249 * S_Recency ;
   H12  =     0.02025228046339 * S_AcceptedCmpTotal  +     0.99930163787509 * 
        S_Frq  +     1.71070447604488 * S_Mnt  +     0.00262288180651 * 
        S_MntMeatProducts  +    -0.26040107336488 * S_NumCatalogPurchases
          +     1.79245188553632 * S_NumDealsPurchases
          +     0.26061762777338 * S_NumWebVisitsMonth
          +     0.08976701277133 * S_Recency ;
   H13  =       0.104381332746 * S_AcceptedCmpTotal  +    -1.51764539772771 * 
        S_Frq  +     0.93148616742855 * S_Mnt  +     2.93767108708116 * 
        S_MntMeatProducts  +     0.79051284359814 * S_NumCatalogPurchases
          +     0.49339750797451 * S_NumDealsPurchases
          +    -0.25657630888957 * S_NumWebVisitsMonth
          +    -0.02783592802322 * S_Recency ;
   H14  =     0.54135833698612 * S_AcceptedCmpTotal  +     1.35730431022222 * 
        S_Frq  +     0.77200942468842 * S_Mnt  +    -1.51698500454254 * 
        S_MntMeatProducts  +    -0.62605649177998 * S_NumCatalogPurchases
          +    -0.20841011025614 * S_NumDealsPurchases
          +    -0.95976462163535 * S_NumWebVisitsMonth
          +    -0.85153512604579 * S_Recency ;
   H15  =     0.45598292592982 * S_AcceptedCmpTotal  +     0.62149856604856 * 
        S_Frq  +    -0.19094507833451 * S_Mnt  +     0.31024365368678 * 
        S_MntMeatProducts  +     0.43336537836455 * S_NumCatalogPurchases
          +    -0.79330545518211 * S_NumDealsPurchases
          +     0.31692653945914 * S_NumWebVisitsMonth
          +    -0.82721510615104 * S_Recency ;
   H11  = H11  +    -0.25100863467838 * Marital_StatusDivorced
          +     0.15562142019257 * Marital_StatusMarried
          +    -0.11924929825992 * Marital_StatusSingle
          +     0.19445161712576 * Marital_StatusTogether ;
   H12  = H12  +     0.58193215591516 * Marital_StatusDivorced
          +     0.27485963958922 * Marital_StatusMarried
          +    -0.46136322561544 * Marital_StatusSingle
          +     1.17785849262888 * Marital_StatusTogether ;
   H13  = H13  +    -0.55576156297846 * Marital_StatusDivorced
          +     0.18663773247842 * Marital_StatusMarried
          +    -0.14692184711639 * Marital_StatusSingle
          +     0.40795003682635 * Marital_StatusTogether ;
   H14  = H14  +    -1.70154958647134 * Marital_StatusDivorced
          +     -0.0143065674831 * Marital_StatusMarried
          +     0.13491720981006 * Marital_StatusSingle
          +     0.65058537454476 * Marital_StatusTogether ;
   H15  = H15  +    -0.57735977480465 * Marital_StatusDivorced
          +    -1.18521635425485 * Marital_StatusMarried
          +     1.27858890561049 * Marital_StatusSingle
          +    -0.68308863502606 * Marital_StatusTogether ;
   H11  =     0.91898399777449 + H11 ;
   H12  =    -0.65172531168643 + H12 ;
   H13  =     2.21950020718323 + H13 ;
   H14  =     0.94167989308741 + H14 ;
   H15  =    -2.75049414690283 + H15 ;
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
   P_DepVar1  =    -7.73278760171706 * H11  +    -1.81420899061277 * H12
          +      7.8974780725891 * H13  +    -2.47430312661533 * H14
          +       3.637554312671 * H15 ;
   P_DepVar1  =    -2.27177312353398 + P_DepVar1 ;
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
