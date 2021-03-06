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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x4_1 = 'Hidden: H1x4_=1' ;

      label H1x4_2 = 'Hidden: H1x4_=2' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x3_1 = 'Hidden: H2x3_=1' ;

      label H2x3_2 = 'Hidden: H2x3_=2' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x2_1 = 'Hidden: H3x2_=1' ;

      label H3x2_2 = 'Hidden: H3x2_=2' ;

      label H4x1_1 = 'Hidden: H4x1_=1' ;

      label H4x1_2 = 'Hidden: H4x1_=2' ;

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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.03317833435323 * S_AcceptedCmpTotal
          +    -0.66859164215955 * S_Frq  +     1.04503858219375 * S_Mnt
          +     3.02405267314398 * S_MntMeatProducts
          +     0.25422172488707 * S_NumCatalogPurchases
          +     0.25977266371328 * S_NumDealsPurchases
          +    -0.26865365728773 * S_NumWebVisitsMonth
          +     0.09531087154516 * S_Recency ;
   H1x1_2  =    -0.69087988352897 * S_AcceptedCmpTotal
          +    -0.11955753576733 * S_Frq  +     0.84152651412075 * S_Mnt
          +    -0.64419071408502 * S_MntMeatProducts
          +    -0.49060224303044 * S_NumCatalogPurchases
          +    -0.04840762943457 * S_NumDealsPurchases
          +     -0.7656247386051 * S_NumWebVisitsMonth
          +     1.13086655489449 * S_Recency ;
   H1x1_1  = H1x1_1  +    -0.53136707555877 * Marital_StatusDivorced
          +    -0.05888536499281 * Marital_StatusMarried
          +    -0.22627441829205 * Marital_StatusSingle
          +     0.52348719245564 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.85322837962298 * Marital_StatusDivorced
          +     0.82536605771339 * Marital_StatusMarried
          +    -0.97196770004098 * Marital_StatusSingle
          +      1.2063947269032 * Marital_StatusTogether ;
   H1x1_1  =     3.30547913450619 + H1x1_1 ;
   H1x1_2  =     1.08446512287712 + H1x1_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.52271766494525 * S_AcceptedCmpTotal
          +     0.57611155332907 * S_Frq  +     2.82792468297238 * S_Mnt
          +    -1.52187144029368 * S_MntMeatProducts
          +    -0.17233011764417 * S_NumCatalogPurchases
          +     0.08681674245114 * S_NumDealsPurchases
          +     0.13308256651831 * S_NumWebVisitsMonth
          +    -0.88526514420045 * S_Recency ;
   H1x2_2  =      0.4222520789746 * S_AcceptedCmpTotal
          +    -3.13381438735416 * S_Frq  +    -0.34909843441486 * S_Mnt
          +     0.66187267823731 * S_MntMeatProducts
          +     1.52530454111654 * S_NumCatalogPurchases
          +     0.73982889008686 * S_NumDealsPurchases
          +     1.03760708665776 * S_NumWebVisitsMonth
          +    -1.31685207844927 * S_Recency ;
   H1x2_1  = H1x2_1  +    -0.40921432838161 * Marital_StatusDivorced
          +    -0.57121500191985 * Marital_StatusMarried
          +     0.00575301863466 * Marital_StatusSingle
          +     0.58606212168272 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.05193612372383 * Marital_StatusDivorced
          +     0.68382990555761 * Marital_StatusMarried
          +    -0.40241665873988 * Marital_StatusSingle
          +     0.66274709598028 * Marital_StatusTogether ;
   H1x2_1  =     1.66256790999222 + H1x2_1 ;
   H1x2_2  =    -2.71135276190381 + H1x2_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -1.36813165661884 * S_AcceptedCmpTotal
          +    -0.29960918468261 * S_Frq  +    -0.65204315831074 * S_Mnt
          +    -2.40830591527574 * S_MntMeatProducts
          +    -0.89296864866675 * S_NumCatalogPurchases
          +     1.79889409325514 * S_NumDealsPurchases
          +    -0.33765715793031 * S_NumWebVisitsMonth
          +    -0.63474704455434 * S_Recency ;
   H1x3_2  =    -0.20409738779324 * S_AcceptedCmpTotal
          +     1.49919916163823 * S_Frq  +     -0.9415605932144 * S_Mnt
          +     0.04224245417831 * S_MntMeatProducts
          +     0.25836861794607 * S_NumCatalogPurchases
          +     2.47909264202917 * S_NumDealsPurchases
          +     0.14790226792406 * S_NumWebVisitsMonth
          +     0.40870786833591 * S_Recency ;
   H1x3_1  = H1x3_1  +     0.20928850420446 * Marital_StatusDivorced
          +     0.39103795234666 * Marital_StatusMarried
          +    -0.52822284221545 * Marital_StatusSingle
          +    -1.86494928221959 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +     1.62005786474378 * Marital_StatusDivorced
          +       1.975579060233 * Marital_StatusMarried
          +     0.15028521746762 * Marital_StatusSingle
          +     0.92005975380984 * Marital_StatusTogether ;
   H1x3_1  =     0.89242262747745 + H1x3_1 ;
   H1x3_2  =     0.65972128608947 + H1x3_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
   H1x3_2  = 1.0 / (1.0 + EXP(MIN( - H1x3_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
END;
*** *************************;
*** Writing the Node H1x4_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x4_1  =    -1.56857036994838 * S_AcceptedCmpTotal
          +    -0.01709393019065 * S_Frq  +    -0.41130381419631 * S_Mnt
          +     0.16060225059391 * S_MntMeatProducts
          +     1.53093292630033 * S_NumCatalogPurchases
          +     0.39573641806699 * S_NumDealsPurchases
          +    -0.95387142126649 * S_NumWebVisitsMonth
          +     0.58661969978382 * S_Recency ;
   H1x4_2  =     0.40365014181339 * S_AcceptedCmpTotal
          +     0.25758137147094 * S_Frq  +     1.96878849657351 * S_Mnt
          +     0.71628478327205 * S_MntMeatProducts
          +     0.15890352363556 * S_NumCatalogPurchases
          +    -1.12928875468011 * S_NumDealsPurchases
          +    -0.30108145274307 * S_NumWebVisitsMonth
          +     0.28810419317266 * S_Recency ;
   H1x4_1  = H1x4_1  +     0.71809860803817 * Marital_StatusDivorced
          +     0.91966160839643 * Marital_StatusMarried
          +    -0.63411090570397 * Marital_StatusSingle
          +    -0.54635673224032 * Marital_StatusTogether ;
   H1x4_2  = H1x4_2  +    -0.82559954633474 * Marital_StatusDivorced
          +     0.77230489026504 * Marital_StatusMarried
          +     0.20456495503812 * Marital_StatusSingle
          +    -0.94791841887496 * Marital_StatusTogether ;
   H1x4_1  =    -0.74278734869781 + H1x4_1 ;
   H1x4_2  =     1.36386007305279 + H1x4_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x4_1  = 1.0 / (1.0 + EXP(MIN( - H1x4_1 , _EXP_BAR)));
   H1x4_2  = 1.0 / (1.0 + EXP(MIN( - H1x4_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x4_1  = .;
   H1x4_2  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     6.70671434954254 * H1x1_1  +    -3.26026761915622 * H1x1_2 ;
   H2x1_2  =     9.50930943961048 * H1x1_1  +     -38.665886357082 * H1x1_2 ;
   H2x1_1  = H2x1_1  +    -2.93089545861469 * H1x2_1
          +     1.56101538169797 * H1x2_2 ;
   H2x1_2  = H2x1_2  +    -0.71350117244702 * H1x2_1
          +    -3.81025846953023 * H1x2_2 ;
   H2x1_1  = H2x1_1  +    -0.33624313911685 * H1x3_1
          +     -0.2506302302983 * H1x3_2 ;
   H2x1_2  = H2x1_2  +    -0.95434767487254 * H1x3_1
          +    -0.10638654133666 * H1x3_2 ;
   H2x1_1  = H2x1_1  +    -0.27261326347944 * H1x4_1
          +     0.15687682287669 * H1x4_2 ;
   H2x1_2  = H2x1_2  +     0.43717724195408 * H1x4_1
          +     0.97600288948907 * H1x4_2 ;
   H2x1_1  =    -1.76465776305701 + H2x1_1 ;
   H2x1_2  =     2.45505067378694 + H2x1_2 ;
   H2x1_1  = SIN(H2x1_1 );
   H2x1_2  = SIN(H2x1_2 );
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     0.44221000188212 * H1x1_1  +    -0.09410411660626 * H1x1_2 ;
   H2x2_2  =    -0.62041237832472 * H1x1_1  +    -1.70568019769479 * H1x1_2 ;
   H2x2_1  = H2x2_1  +     0.86476170574504 * H1x2_1
          +    -2.36042697137738 * H1x2_2 ;
   H2x2_2  = H2x2_2  +     0.44483356408795 * H1x2_1
          +    -1.66254033339836 * H1x2_2 ;
   H2x2_1  = H2x2_1  +     2.16429199725142 * H1x3_1
          +     1.43296701176218 * H1x3_2 ;
   H2x2_2  = H2x2_2  +     -2.3086904824016 * H1x3_1
          +    -2.17810690370253 * H1x3_2 ;
   H2x2_1  = H2x2_1  +     0.00588994713052 * H1x4_1
          +     0.12676819806376 * H1x4_2 ;
   H2x2_2  = H2x2_2  +     0.82027256992322 * H1x4_1
          +    -0.52732352975227 * H1x4_2 ;
   H2x2_1  =     0.47389009262422 + H2x2_1 ;
   H2x2_2  =     -0.8122008316452 + H2x2_2 ;
   H2x2_1  = SIN(H2x2_1 );
   H2x2_2  = SIN(H2x2_2 );
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
END;
*** *************************;
*** Writing the Node H2x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x3_1  =    -0.28493649489231 * H1x1_1  +     0.46324227997344 * H1x1_2 ;
   H2x3_2  =     0.41015874548881 * H1x1_1  +    -0.05146341955765 * H1x1_2 ;
   H2x3_1  = H2x3_1  +    -1.00349052905386 * H1x2_1
          +     0.64290952668224 * H1x2_2 ;
   H2x3_2  = H2x3_2  +     0.48935572509195 * H1x2_1
          +     0.64476371718125 * H1x2_2 ;
   H2x3_1  = H2x3_1  +    -1.11988665905516 * H1x3_1
          +    -0.34805105626026 * H1x3_2 ;
   H2x3_2  = H2x3_2  +     0.32493988416634 * H1x3_1
          +     0.32809540262065 * H1x3_2 ;
   H2x3_1  = H2x3_1  +     0.47764131040964 * H1x4_1
          +    -1.36976442655344 * H1x4_2 ;
   H2x3_2  = H2x3_2  +     -0.3421580983005 * H1x4_1
          +     0.47926475944446 * H1x4_2 ;
   H2x3_1  =     0.90815431460142 + H2x3_1 ;
   H2x3_2  =    -1.77185533764538 + H2x3_2 ;
   H2x3_1  = SIN(H2x3_1 );
   H2x3_2  = SIN(H2x3_2 );
END;
ELSE DO;
   H2x3_1  = .;
   H2x3_2  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     4.31939811374229 * H2x1_1  +      -0.700351897347 * H2x1_2 ;
   H3x1_1  = H3x1_1  +     2.40750918668175 * H2x2_1
          +    -1.54042325930374 * H2x2_2 ;
   H3x1_1  = H3x1_1  +     1.46738265989804 * H2x3_1
          +     0.20077963052939 * H2x3_2 ;
   H3x1_1  =    -0.09840116412671 + H3x1_1 ;
   H3x1_2  = 0; 
   _MAX_ = MAX (H3x1_1 , H3x1_2 );
   _SUM_ = 0.; 
   H3x1_1  = EXP(H3x1_1  - _MAX_);
   _SUM_ = _SUM_ + H3x1_1 ;
   H3x1_2  = EXP(H3x1_2  - _MAX_);
   _SUM_ = _SUM_ + H3x1_2 ;
   H3x1_1  = H3x1_1  / _SUM_;
   H3x1_2  = H3x1_2  / _SUM_;
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
END;
*** *************************;
*** Writing the Node H3x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x2_1  =    -1.46965147800397 * H2x1_1  +    -0.15489723855448 * H2x1_2 ;
   H3x2_1  = H3x2_1  +     0.91269334410481 * H2x2_1
          +     -0.0392976578726 * H2x2_2 ;
   H3x2_1  = H3x2_1  +    -1.07273740820729 * H2x3_1
          +    -1.32572907075931 * H2x3_2 ;
   H3x2_1  =     0.58690615295837 + H3x2_1 ;
   H3x2_2  = 0; 
   _MAX_ = MAX (H3x2_1 , H3x2_2 );
   _SUM_ = 0.; 
   H3x2_1  = EXP(H3x2_1  - _MAX_);
   _SUM_ = _SUM_ + H3x2_1 ;
   H3x2_2  = EXP(H3x2_2  - _MAX_);
   _SUM_ = _SUM_ + H3x2_2 ;
   H3x2_1  = H3x2_1  / _SUM_;
   H3x2_2  = H3x2_2  / _SUM_;
END;
ELSE DO;
   H3x2_1  = .;
   H3x2_2  = .;
END;
*** *************************;
*** Writing the Node H4x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H4x1_1  =     2.98683826857579 * H3x1_1  +     -3.7943130439002 * H3x1_2 ;
   H4x1_1  = H4x1_1  +     -0.1130856885584 * H3x2_1
          +     0.90223250703174 * H3x2_2 ;
   H4x1_1  =     0.34321706022332 + H4x1_1 ;
   H4x1_2  = 0; 
   _MAX_ = MAX (H4x1_1 , H4x1_2 );
   _SUM_ = 0.; 
   H4x1_1  = EXP(H4x1_1  - _MAX_);
   _SUM_ = _SUM_ + H4x1_1 ;
   H4x1_2  = EXP(H4x1_2  - _MAX_);
   _SUM_ = _SUM_ + H4x1_2 ;
   H4x1_1  = H4x1_1  / _SUM_;
   H4x1_2  = H4x1_2  / _SUM_;
END;
ELSE DO;
   H4x1_1  = .;
   H4x1_2  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     4.36647161522328 * H4x1_1  +    -5.83126986959915 * H4x1_2
         ;
   P_DepVar1  =    -4.21364937441824 + P_DepVar1 ;
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
