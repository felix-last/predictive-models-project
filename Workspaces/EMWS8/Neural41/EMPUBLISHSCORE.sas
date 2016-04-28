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
   H11  =    -0.41170995389365 * S_AcceptedCmpTotal  +     0.95675776354898 *
        S_Frq  +     0.79241767524066 * S_Mnt  +    -1.11291951115769 *
        S_MntMeatProducts  +    -0.81016243357955 * S_NumCatalogPurchases
          +    -0.06020302160033 * S_NumDealsPurchases
          +    -0.72187271327886 * S_NumWebVisitsMonth
          +     0.63072705601805 * S_Recency ;
   H12  =     0.16845165387856 * S_AcceptedCmpTotal  +     0.13952140472368 *
        S_Frq  +    -0.49680297454001 * S_Mnt  +     0.20077884768409 *
        S_MntMeatProducts  +    -0.26509457206436 * S_NumCatalogPurchases
          +     0.44023370306786 * S_NumDealsPurchases
          +     0.14437092902564 * S_NumWebVisitsMonth
          +     0.29830280717193 * S_Recency ;
   H13  =     0.17736973005738 * S_AcceptedCmpTotal  +    -1.27691889541485 *
        S_Frq  +     0.76151337613405 * S_Mnt  +     2.91913897431534 *
        S_MntMeatProducts  +     0.91968924804036 * S_NumCatalogPurchases
          +     0.36494720404815 * S_NumDealsPurchases
          +     0.03877838723538 * S_NumWebVisitsMonth
          +    -0.07783339271235 * S_Recency ;
   H14  =     0.06585247678486 * S_AcceptedCmpTotal  +     2.38872321291933 *
        S_Frq  +     0.55261122983069 * S_Mnt  +    -0.92412810336036 *
        S_MntMeatProducts  +    -0.85761594899144 * S_NumCatalogPurchases
          +    -0.87171784420951 * S_NumDealsPurchases
          +     0.27077171192055 * S_NumWebVisitsMonth
          +     0.44529508014227 * S_Recency ;
   H15  =     0.79261864023919 * S_AcceptedCmpTotal  +     0.22408033839661 *
        S_Frq  +     0.41205750844428 * S_Mnt  +    -0.05167252147978 *
        S_MntMeatProducts  +     0.52437372576463 * S_NumCatalogPurchases
          +    -0.02694744085713 * S_NumDealsPurchases
          +     0.42930866809604 * S_NumWebVisitsMonth
          +    -1.23356204218313 * S_Recency ;
   H16  =     0.07557739377714 * S_AcceptedCmpTotal  +     0.06732498402011 *
        S_Frq  +     1.00949697256114 * S_Mnt  +     0.18190372979158 *
        S_MntMeatProducts  +    -0.20994714743436 * S_NumCatalogPurchases
          +     1.91827561352967 * S_NumDealsPurchases
          +    -0.65112089304736 * S_NumWebVisitsMonth
          +     0.94688864667779 * S_Recency ;
   H11  = H11  +    -0.41944609131662 * Marital_StatusDivorced
          +     0.19571272479408 * Marital_StatusMarried
          +    -0.16061908960963 * Marital_StatusSingle
          +     0.01147019501849 * Marital_StatusTogether ;
   H12  = H12  +    -0.70326037460175 * Marital_StatusDivorced
          +    -0.64968872046859 * Marital_StatusMarried
          +     1.81995301340231 * Marital_StatusSingle
          +    -1.25679526739636 * Marital_StatusTogether ;
   H13  = H13  +    -0.50413590013638 * Marital_StatusDivorced
          +     0.19296467458933 * Marital_StatusMarried
          +     -0.2295693568996 * Marital_StatusSingle
          +     0.51095451752525 * Marital_StatusTogether ;
   H14  = H14  +    -0.93810483419419 * Marital_StatusDivorced
          +    -0.12318541826308 * Marital_StatusMarried
          +    -0.02882902763243 * Marital_StatusSingle
          +      0.9552700390789 * Marital_StatusTogether ;
   H15  = H15  +    -0.16315275571793 * Marital_StatusDivorced
          +    -0.65544681605691 * Marital_StatusMarried
          +     0.31269236164873 * Marital_StatusSingle
          +    -0.37135201633747 * Marital_StatusTogether ;
   H16  = H16  +    -0.47177568566677 * Marital_StatusDivorced
          +     0.12269709457787 * Marital_StatusMarried
          +     0.37106402586008 * Marital_StatusSingle
          +     0.07580816063395 * Marital_StatusTogether ;
   H11  =     0.87814553506559 + H11 ;
   H12  =     1.18416285607678 + H12 ;
   H13  =     1.86220379911993 + H13 ;
   H14  =     1.79999645343103 + H14 ;
   H15  =    -2.95745585057281 + H15 ;
   H16  =    -0.63040593626724 + H16 ;
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
   P_DepVar1  =    -5.78936073221603 * H11  +     3.14966455677413 * H12
          +     7.03853349374163 * H13  +    -2.45391654583749 * H14
          +     4.80213644089029 * H15  +    -1.60369759544804 * H16 ;
   P_DepVar1  =    -1.95361942474066 + P_DepVar1 ;
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
