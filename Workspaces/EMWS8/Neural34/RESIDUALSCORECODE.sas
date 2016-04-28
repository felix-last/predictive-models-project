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

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   Income , 
   Mnt , 
   MntGoldProds , 
   MntMeatProducts , 
   NumCatalogPurchases , 
   NumDealsPurchases , 
   NumWebVisitsMonth , 
   RFMstat , 
   Recency , 
   Teenhome , 
   Year_Birth   ) THEN DO;
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
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 * 
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
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
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   IF MISSING( Teenhome ) THEN S_Teenhome  = . ;
   ELSE S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * 
        Year_Birth ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.39113138187571 * S_AcceptedCmpTotal  +    -0.61540725344485 * 
        S_Frq  +    -0.39640720965637 * S_Income  +    -0.29779259024925 * 
        S_Mnt  +     0.09159537668687 * S_MntGoldProds
          +     0.66968861823847 * S_MntMeatProducts
          +     0.43410284729103 * S_NumCatalogPurchases
          +     0.38169769247512 * S_NumDealsPurchases
          +     0.42568124883788 * S_NumWebVisitsMonth
          +       0.117680996215 * S_RFMstat  +    -0.81755740196945 * 
        S_Recency  +     0.34714100236873 * S_Teenhome
          +     0.39595885220917 * S_Year_Birth ;
   H12  =    -0.17603311184545 * S_AcceptedCmpTotal  +    -1.87448667460975 * 
        S_Frq  +    -0.13770783826558 * S_Income  +    -0.07794509574546 * 
        S_Mnt  +     -0.0367231623133 * S_MntGoldProds
          +     0.43468157063779 * S_MntMeatProducts
          +     1.22287851495207 * S_NumCatalogPurchases
          +     1.34810668047823 * S_NumDealsPurchases
          +     0.29744386797792 * S_NumWebVisitsMonth
          +     0.24598010228595 * S_RFMstat  +     0.45054459604149 * 
        S_Recency  +    -0.31884355104334 * S_Teenhome
          +    -0.49374494273323 * S_Year_Birth ;
   H13  =    -0.35894234681627 * S_AcceptedCmpTotal  +     2.22535530920485 * 
        S_Frq  +    -0.60759993740885 * S_Income  +    -0.19127405324439 * 
        S_Mnt  +     0.13903548885363 * S_MntGoldProds
          +    -3.08800901663199 * S_MntMeatProducts
          +    -1.19043292478827 * S_NumCatalogPurchases
          +    -0.37179794210537 * S_NumDealsPurchases
          +     0.03624847445355 * S_NumWebVisitsMonth
          +    -0.62521514183331 * S_RFMstat  +     0.01074839631068 * 
        S_Recency  +     0.08240530440608 * S_Teenhome
          +    -0.04154769345168 * S_Year_Birth ;
   H14  =     0.72612390853906 * S_AcceptedCmpTotal  +    -1.03331426863575 * 
        S_Frq  +     0.44630396705527 * S_Income  +    -1.29648064151656 * 
        S_Mnt  +     0.20190465471738 * S_MntGoldProds
          +     0.78481425439956 * S_MntMeatProducts
          +      0.6107688367092 * S_NumCatalogPurchases
          +    -0.39308332306764 * S_NumDealsPurchases
          +     1.13986700740733 * S_NumWebVisitsMonth
          +    -0.10095149614189 * S_RFMstat  +    -1.23708147180809 * 
        S_Recency  +    -0.40344648497219 * S_Teenhome
          +    -0.21455944295735 * S_Year_Birth ;
   H15  =    -0.52000103453301 * S_AcceptedCmpTotal  +    -0.14144790393123 * 
        S_Frq  +    -0.47209445285116 * S_Income  +     0.51267592710475 * 
        S_Mnt  +     0.07876708495313 * S_MntGoldProds
          +    -0.61914125284805 * S_MntMeatProducts
          +    -0.54746366292992 * S_NumCatalogPurchases
          +     0.25925395549236 * S_NumDealsPurchases
          +    -0.60979686139101 * S_NumWebVisitsMonth
          +     0.08166171339337 * S_RFMstat  +     0.96981534293427 * 
        S_Recency  +     0.36245179070453 * S_Teenhome
          +    -0.09267442906112 * S_Year_Birth ;
   H11  = H11  +     0.01565392034595 * Marital_StatusDivorced
          +     0.22493072364483 * Marital_StatusMarried
          +    -0.34177799020181 * Marital_StatusSingle
          +    -0.04779249269081 * Marital_StatusTogether ;
   H12  = H12  +     0.58482172427767 * Marital_StatusDivorced
          +     0.05031503177659 * Marital_StatusMarried
          +     0.28039335778718 * Marital_StatusSingle
          +     0.00709736205513 * Marital_StatusTogether ;
   H13  = H13  +     0.35081594367456 * Marital_StatusDivorced
          +    -0.24395984745809 * Marital_StatusMarried
          +     0.22708224780413 * Marital_StatusSingle
          +    -0.34334833500124 * Marital_StatusTogether ;
   H14  = H14  +     0.85482961039457 * Marital_StatusDivorced
          +    -1.06411172500365 * Marital_StatusMarried
          +     0.57554615813234 * Marital_StatusSingle
          +    -0.91141797290702 * Marital_StatusTogether ;
   H15  = H15  +      0.2197825206844 * Marital_StatusDivorced
          +     0.66663600919341 * Marital_StatusMarried
          +    -0.69696969089357 * Marital_StatusSingle
          +     0.48232861459141 * Marital_StatusTogether ;
   H11  =    -1.58463812409211 + H11 ;
   H12  =    -0.59413927784841 + H12 ;
   H13  =    -1.40790569062078 + H13 ;
   H14  =     -0.2073181654495 + H14 ;
   H15  =     1.99108524971007 + H15 ;
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
   P_DepVar1  =     3.73071630847853 * H11  +     2.94025483165613 * H12
          +    -3.96191932636925 * H13  +     3.36339025105162 * H14
          +    -4.82596427081675 * H15 ;
   P_DepVar1  =     0.43428060622858 + P_DepVar1 ;
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
