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

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

      label H1x3_6 = 'Hidden: H1x3_=6' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x2_3 = 'Hidden: H2x2_=3' ;

      label H2x2_4 = 'Hidden: H2x2_=4' ;

      label H2x2_5 = 'Hidden: H2x2_=5' ;

      label H2x2_6 = 'Hidden: H2x2_=6' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x1_3 = 'Hidden: H3x1_=3' ;

      label H3x1_4 = 'Hidden: H3x1_=4' ;

      label H3x1_5 = 'Hidden: H3x1_=5' ;

      label H3x1_6 = 'Hidden: H3x1_=6' ;

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
   H1x1_1  =    -0.67537728004966 * S_AcceptedCmpTotal
          +     2.81188938311993 * S_Frq  +    -0.48449735677533 * S_Mnt
          +     2.79168320854924 * S_MntMeatProducts
          +    -1.09894266401589 * S_NumCatalogPurchases
          +    -0.32966417347551 * S_NumDealsPurchases
          +    -0.72195034767343 * S_NumWebVisitsMonth
          +     1.26300567591683 * S_Recency ;
   H1x1_2  =    -0.10530102616636 * S_AcceptedCmpTotal
          +    -1.56143940912133 * S_Frq  +    -4.62897774617873 * S_Mnt
          +     9.02469430152189 * S_MntMeatProducts
          +     1.42644521887241 * S_NumCatalogPurchases
          +      0.6475058577302 * S_NumDealsPurchases
          +     0.08123225110233 * S_NumWebVisitsMonth
          +    -0.13437822083345 * S_Recency ;
   H1x1_3  =     0.38623415840156 * S_AcceptedCmpTotal
          +     1.26011321422418 * S_Frq  +     0.93412252767552 * S_Mnt
          +     5.40567027331821 * S_MntMeatProducts
          +     0.21404551755506 * S_NumCatalogPurchases
          +    -3.79184634796332 * S_NumDealsPurchases
          +     0.64355102802571 * S_NumWebVisitsMonth
          +     0.95080943397397 * S_Recency ;
   H1x1_4  =    -2.69419226375129 * S_AcceptedCmpTotal
          +     4.80721116964493 * S_Frq  +     4.56726230244782 * S_Mnt
          +     2.35287601364019 * S_MntMeatProducts
          +    -3.27198648531912 * S_NumCatalogPurchases
          +    -0.16046880718311 * S_NumDealsPurchases
          +     -3.7025327830273 * S_NumWebVisitsMonth
          +     5.47829314370286 * S_Recency ;
   H1x1_5  =     3.75699631118799 * S_AcceptedCmpTotal
          +    -1.60236762300853 * S_Frq  +     0.64007421195882 * S_Mnt
          +     8.39312647460766 * S_MntMeatProducts
          +     3.07026872536137 * S_NumCatalogPurchases
          +     2.03045608124213 * S_NumDealsPurchases
          +     3.86452915398414 * S_NumWebVisitsMonth
          +    -5.45655790704746 * S_Recency ;
   H1x1_1  = H1x1_1  +     0.59959546037733 * Marital_StatusDivorced
          +     0.14979485299347 * Marital_StatusMarried
          +    -0.09166445391312 * Marital_StatusSingle
          +     -0.8898837643688 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.13516192952275 * Marital_StatusDivorced
          +      0.1646484112393 * Marital_StatusMarried
          +     0.01074681811884 * Marital_StatusSingle
          +    -0.38035258327435 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -6.14970888128598 * Marital_StatusDivorced
          +    -0.28313626645981 * Marital_StatusMarried
          +      2.8257446964988 * Marital_StatusSingle
          +     0.44817043395102 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     -5.3794018991977 * Marital_StatusDivorced
          +     3.05775024202559 * Marital_StatusMarried
          +    -0.23539571945671 * Marital_StatusSingle
          +     4.66331490520755 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     1.25174944520682 * Marital_StatusDivorced
          +    -0.48359916542157 * Marital_StatusMarried
          +    -1.64182316823237 * Marital_StatusSingle
          +     1.33430611846768 * Marital_StatusTogether ;
   H1x1_1  =     4.63389499664507 + H1x1_1 ;
   H1x1_2  =     2.11311359057093 + H1x1_2 ;
   H1x1_3  =    -0.62083985205654 + H1x1_3 ;
   H1x1_4  =     3.41081693054871 + H1x1_4 ;
   H1x1_5  =    -9.34543620991542 + H1x1_5 ;
   H1x1_6  = 0; 
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 );
   _SUM_ = 0.; 
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_5  = EXP(H1x1_5  - _MAX_);
   _SUM_ = _SUM_ + H1x1_5 ;
   H1x1_6  = EXP(H1x1_6  - _MAX_);
   _SUM_ = _SUM_ + H1x1_6 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.75154793671381 * S_AcceptedCmpTotal
          +     1.16505569462642 * S_Frq  +     -0.8308540177887 * S_Mnt
          +     0.55999885697493 * S_MntMeatProducts
          +      0.2225207563207 * S_NumCatalogPurchases
          +     -1.0233439835205 * S_NumDealsPurchases
          +    -0.35430585878397 * S_NumWebVisitsMonth
          +    -1.61097128706343 * S_Recency ;
   H1x2_2  =    -2.67887309413165 * S_AcceptedCmpTotal
          +    -1.18932806022128 * S_Frq  +    -0.12550289494399 * S_Mnt
          +    -1.04508919964747 * S_MntMeatProducts
          +     -0.6758665249546 * S_NumCatalogPurchases
          +    -0.24215201937497 * S_NumDealsPurchases
          +    -1.02736823453312 * S_NumWebVisitsMonth
          +    -2.91942343887972 * S_Recency ;
   H1x2_3  =    -1.59525226271453 * S_AcceptedCmpTotal
          +    -3.01360419340124 * S_Frq  +    -2.42130716453762 * S_Mnt
          +    -3.97854305593999 * S_MntMeatProducts
          +    -2.05331728407593 * S_NumCatalogPurchases
          +    -0.48841403720827 * S_NumDealsPurchases
          +     0.25411498590567 * S_NumWebVisitsMonth
          +     2.61356292629829 * S_Recency ;
   H1x2_4  =    -0.23213568401478 * S_AcceptedCmpTotal
          +    -0.21547029102909 * S_Frq  +    -3.71365412498023 * S_Mnt
          +     -0.7071400781557 * S_MntMeatProducts
          +     1.20780208787296 * S_NumCatalogPurchases
          +    -0.58152407834402 * S_NumDealsPurchases
          +     2.15567925539399 * S_NumWebVisitsMonth
          +     0.04520696731554 * S_Recency ;
   H1x2_5  =    -0.77921338806706 * S_AcceptedCmpTotal
          +    -1.01600283852312 * S_Frq  +     0.74495825285389 * S_Mnt
          +    -1.07023271439686 * S_MntMeatProducts
          +     0.31952847185507 * S_NumCatalogPurchases
          +     0.97232557455358 * S_NumDealsPurchases
          +     1.40227284681788 * S_NumWebVisitsMonth
          +    -2.63740913159308 * S_Recency ;
   H1x2_1  = H1x2_1  +     0.27635646709847 * Marital_StatusDivorced
          +    -1.54860787754125 * Marital_StatusMarried
          +     3.07164083530731 * Marital_StatusSingle
          +    -0.82580381126768 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.41647124050716 * Marital_StatusDivorced
          +     1.93404037878036 * Marital_StatusMarried
          +    -1.33159061927866 * Marital_StatusSingle
          +    -1.07762979483959 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     1.18723200575444 * Marital_StatusDivorced
          +    -1.20603561095549 * Marital_StatusMarried
          +     1.40927693179184 * Marital_StatusSingle
          +    -0.49407691558139 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     0.69596798616284 * Marital_StatusDivorced
          +     -0.1442863204197 * Marital_StatusMarried
          +     0.60523055771734 * Marital_StatusSingle
          +     0.73192299984342 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +      0.7891943859827 * Marital_StatusDivorced
          +     0.09024082077945 * Marital_StatusMarried
          +     0.46315219527454 * Marital_StatusSingle
          +    -0.88863370904771 * Marital_StatusTogether ;
   H1x2_1  =    -1.73041096602206 + H1x2_1 ;
   H1x2_2  =     -0.9244515570647 + H1x2_2 ;
   H1x2_3  =     0.42257482856224 + H1x2_3 ;
   H1x2_4  =    -1.17368520710394 + H1x2_4 ;
   H1x2_5  =    -0.96945494530554 + H1x2_5 ;
   H1x2_6  = 0; 
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 );
   _SUM_ = 0.; 
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_5  = EXP(H1x2_5  - _MAX_);
   _SUM_ = _SUM_ + H1x2_5 ;
   H1x2_6  = EXP(H1x2_6  - _MAX_);
   _SUM_ = _SUM_ + H1x2_6 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =     0.60593493975552 * S_AcceptedCmpTotal
          +    -1.29329226371919 * S_Frq  +      0.9015843457146 * S_Mnt
          +    -1.02461177883701 * S_MntMeatProducts
          +     0.58245198640098 * S_NumCatalogPurchases
          +    -0.23780276328844 * S_NumDealsPurchases
          +     1.28202459687231 * S_NumWebVisitsMonth
          +     0.93713351024897 * S_Recency ;
   H1x3_2  =    -1.08797424998886 * S_AcceptedCmpTotal
          +     0.71996006602625 * S_Frq  +     0.26461282542951 * S_Mnt
          +     0.13875330330852 * S_MntMeatProducts
          +    -0.22996544763814 * S_NumCatalogPurchases
          +    -0.36599639965399 * S_NumDealsPurchases
          +     1.99081506581768 * S_NumWebVisitsMonth
          +    -0.27280347287018 * S_Recency ;
   H1x3_3  =     -0.3446411379442 * S_AcceptedCmpTotal
          +    -0.90527024017686 * S_Frq  +    -0.09374789575642 * S_Mnt
          +     0.94472031892058 * S_MntMeatProducts
          +     0.27511909854912 * S_NumCatalogPurchases
          +    -0.55526545857693 * S_NumDealsPurchases
          +    -0.61544688091302 * S_NumWebVisitsMonth
          +     1.92722528696298 * S_Recency ;
   H1x3_4  =     0.14447197723193 * S_AcceptedCmpTotal
          +     0.58502643519667 * S_Frq  +    -0.22179847560956 * S_Mnt
          +     1.61403840093612 * S_MntMeatProducts
          +    -0.34382576245292 * S_NumCatalogPurchases
          +     0.70213159483637 * S_NumDealsPurchases
          +    -0.39731145628175 * S_NumWebVisitsMonth
          +     0.76292573150858 * S_Recency ;
   H1x3_5  =     1.12424583212244 * S_AcceptedCmpTotal
          +     1.23224599851617 * S_Frq  +     0.66506653339362 * S_Mnt
          +    -0.33974847531229 * S_MntMeatProducts
          +     1.74350962571519 * S_NumCatalogPurchases
          +     0.41098583446208 * S_NumDealsPurchases
          +    -0.66305298743409 * S_NumWebVisitsMonth
          +    -1.08660974929691 * S_Recency ;
   H1x3_1  = H1x3_1  +     0.54739694564163 * Marital_StatusDivorced
          +    -0.29510060772746 * Marital_StatusMarried
          +     1.74124353401891 * Marital_StatusSingle
          +     0.09719439743973 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +     0.45031904962773 * Marital_StatusDivorced
          +    -0.61203463567014 * Marital_StatusMarried
          +     1.95705767804118 * Marital_StatusSingle
          +     0.33872926096104 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +     1.36802060586393 * Marital_StatusDivorced
          +      1.7151906515185 * Marital_StatusMarried
          +     0.70376524929742 * Marital_StatusSingle
          +    -1.29423542782048 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +      1.5350754313919 * Marital_StatusDivorced
          +    -1.27088213578872 * Marital_StatusMarried
          +    -0.91253966593459 * Marital_StatusSingle
          +    -1.63570965011409 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +    -1.18462010911271 * Marital_StatusDivorced
          +     -0.5308059771847 * Marital_StatusMarried
          +    -0.11208078645904 * Marital_StatusSingle
          +     0.12123408245196 * Marital_StatusTogether ;
   H1x3_1  =    -0.26014877330113 + H1x3_1 ;
   H1x3_2  =     1.39405484419099 + H1x3_2 ;
   H1x3_3  =       0.062236253986 + H1x3_3 ;
   H1x3_4  =    -1.27980815366792 + H1x3_4 ;
   H1x3_5  =     -1.1798994280447 + H1x3_5 ;
   H1x3_6  = 0; 
   _MAX_ = MAX (H1x3_1 , H1x3_2 , H1x3_3 , H1x3_4 , H1x3_5 , H1x3_6 );
   _SUM_ = 0.; 
   H1x3_1  = EXP(H1x3_1  - _MAX_);
   _SUM_ = _SUM_ + H1x3_1 ;
   H1x3_2  = EXP(H1x3_2  - _MAX_);
   _SUM_ = _SUM_ + H1x3_2 ;
   H1x3_3  = EXP(H1x3_3  - _MAX_);
   _SUM_ = _SUM_ + H1x3_3 ;
   H1x3_4  = EXP(H1x3_4  - _MAX_);
   _SUM_ = _SUM_ + H1x3_4 ;
   H1x3_5  = EXP(H1x3_5  - _MAX_);
   _SUM_ = _SUM_ + H1x3_5 ;
   H1x3_6  = EXP(H1x3_6  - _MAX_);
   _SUM_ = _SUM_ + H1x3_6 ;
   H1x3_1  = H1x3_1  / _SUM_;
   H1x3_2  = H1x3_2  / _SUM_;
   H1x3_3  = H1x3_3  / _SUM_;
   H1x3_4  = H1x3_4  / _SUM_;
   H1x3_5  = H1x3_5  / _SUM_;
   H1x3_6  = H1x3_6  / _SUM_;
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
   H1x3_6  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     3.99029808661292 * H1x1_1  +    -3.83684783950239 * H1x1_2
          +    -2.41319598667027 * H1x1_3  +     2.06742099113284 * H1x1_4
          +    -2.36394302227369 * H1x1_5  +     3.54247817086581 * H1x1_6 ;
   H2x1_2  =     -2.0723583712808 * H1x1_1  +     1.12235090404628 * H1x1_2
          +    -0.03290243005002 * H1x1_3  +    -0.06417927223452 * H1x1_4
          +    -0.34539694059136 * H1x1_5  +    -0.52107667797315 * H1x1_6 ;
   H2x1_3  =     1.49450378696022 * H1x1_1  +      -2.468244574983 * H1x1_2
          +    -0.36343212796601 * H1x1_3  +      1.4169785905238 * H1x1_4
          +    -1.80253819167441 * H1x1_5  +     0.60012496024445 * H1x1_6 ;
   H2x1_4  =     4.08181488615859 * H1x1_1  +    -4.15992879198886 * H1x1_2
          +    -2.19496884111483 * H1x1_3  +     3.11143094120583 * H1x1_4
          +    -3.40405639905396 * H1x1_5  +     2.02399938887542 * H1x1_6 ;
   H2x1_5  =    -2.80696695717904 * H1x1_1  +     3.69857556154733 * H1x1_2
          +     1.61258939701991 * H1x1_3  +    -0.34320433710838 * H1x1_4
          +     2.41467598917752 * H1x1_5  +    -4.36781665394854 * H1x1_6 ;
   H2x1_6  =     1.17835620997236 * H1x1_1  +     1.12816318935432 * H1x1_2
          +     1.70095032323284 * H1x1_3  +     0.81564117008927 * H1x1_4
          +     1.08987549759927 * H1x1_5  +    -0.71801946066256 * H1x1_6 ;
   H2x1_1  = H2x1_1  +     -1.2826842607194 * H1x2_1
          +     2.22412584447126 * H1x2_2  +     0.72628922978475 * H1x2_3
          +    -3.95557982334969 * H1x2_4  +    -2.04105313525341 * H1x2_5
          +     2.04509722582983 * H1x2_6 ;
   H2x1_2  = H2x1_2  +     0.49261020621896 * H1x2_1
          +    -0.93299086546719 * H1x2_2  +     0.26477710017311 * H1x2_3
          +     1.09581866123251 * H1x2_4  +    -0.46857965033394 * H1x2_5
          +    -0.58594558422322 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -0.65407007731655 * H1x2_1
          +     1.01682664175846 * H1x2_2  +     1.17960401469824 * H1x2_3
          +    -0.57751066508002 * H1x2_4  +     0.53760419760268 * H1x2_5
          +     0.11690916040928 * H1x2_6 ;
   H2x1_4  = H2x1_4  +    -1.88745579191294 * H1x2_1
          +     0.08794337871579 * H1x2_2  +     1.00647337881564 * H1x2_3
          +     0.02010547776794 * H1x2_4  +     -0.9674279317507 * H1x2_5
          +     2.96934196494413 * H1x2_6 ;
   H2x1_5  = H2x1_5  +      1.2829064187123 * H1x2_1
          +    -1.00339413616366 * H1x2_2  +     0.80005613751846 * H1x2_3
          +     1.89259049343074 * H1x2_4  +     0.60916287215789 * H1x2_5
          +    -2.39364002282682 * H1x2_6 ;
   H2x1_6  = H2x1_6  +    -0.81495808949076 * H1x2_1
          +    -0.00823496050906 * H1x2_2  +     0.66082398024174 * H1x2_3
          +     1.06065684801326 * H1x2_4  +    -1.16933111622346 * H1x2_5
          +    -0.91996717495653 * H1x2_6 ;
   H2x1_1  = H2x1_1  +     -0.6489804084947 * H1x3_1
          +    -0.44608682782132 * H1x3_2  +    -0.52631519220433 * H1x3_3
          +     0.05973897946073 * H1x3_4  +     0.44587517212447 * H1x3_5
          +     0.53167866343669 * H1x3_6 ;
   H2x1_2  = H2x1_2  +     0.24566122981429 * H1x3_1
          +    -0.41402912962362 * H1x3_2  +      2.0594253556608 * H1x3_3
          +    -0.58320740989612 * H1x3_4  +    -2.08321797810741 * H1x3_5
          +     0.09325988094727 * H1x3_6 ;
   H2x1_3  = H2x1_3  +    -0.30386162033576 * H1x3_1
          +    -0.39149635061779 * H1x3_2  +    -1.24745656988432 * H1x3_3
          +    -0.74308961556897 * H1x3_4  +    -0.52424837897845 * H1x3_5
          +    -0.43722126116548 * H1x3_6 ;
   H2x1_4  = H2x1_4  +    -1.17147905515311 * H1x3_1
          +     0.52572462392428 * H1x3_2  +     0.00378456310616 * H1x3_3
          +    -0.02141108534986 * H1x3_4  +     0.66609276044861 * H1x3_5
          +     1.49998370890459 * H1x3_6 ;
   H2x1_5  = H2x1_5  +     0.91101541301155 * H1x3_1
          +    -1.16594573895683 * H1x3_2  +     0.19997446137786 * H1x3_3
          +    -0.75943200735258 * H1x3_4  +    -1.58620169109633 * H1x3_5
          +    -0.30128378921356 * H1x3_6 ;
   H2x1_6  = H2x1_6  +     1.75854843594447 * H1x3_1
          +     0.30319854862296 * H1x3_2  +    -0.73946432700618 * H1x3_3
          +     1.37468838558857 * H1x3_4  +    -0.00997395846467 * H1x3_5
          +    -0.19152232249307 * H1x3_6 ;
   H2x1_1  =     0.45481579395551 + H2x1_1 ;
   H2x1_2  =    -2.37666191889476 + H2x1_2 ;
   H2x1_3  =    -0.00303747786799 + H2x1_3 ;
   H2x1_4  =     0.00817665450619 + H2x1_4 ;
   H2x1_5  =    -0.26930716006201 + H2x1_5 ;
   H2x1_6  =    -1.62147466604007 + H2x1_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
   H2x1_6  = 1.0 / (1.0 + EXP(MIN( - H2x1_6 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     0.00129497064463 * H1x1_1  +    -1.04968224667608 * H1x1_2
          +    -1.32377424983581 * H1x1_3  +    -0.11361581517247 * H1x1_4
          +    -0.37590426822975 * H1x1_5  +    -1.19299469136178 * H1x1_6 ;
   H2x2_2  =    -1.54715956973408 * H1x1_1  +      0.1149804500896 * H1x1_2
          +    -0.31622478778172 * H1x1_3  +     0.19815372068281 * H1x1_4
          +     1.54570900690762 * H1x1_5  +    -0.23243316190231 * H1x1_6 ;
   H2x2_3  =    -1.69410933303344 * H1x1_1  +    -0.10842772109927 * H1x1_2
          +     0.73648318250282 * H1x1_3  +     0.68553115685533 * H1x1_4
          +    -0.47234449931244 * H1x1_5  +     1.14739016222951 * H1x1_6 ;
   H2x2_4  =     0.36443547307479 * H1x1_1  +     0.49919653848293 * H1x1_2
          +     1.98377926340404 * H1x1_3  +    -0.55638731785874 * H1x1_4
          +     0.51877040984242 * H1x1_5  +     0.69001883670374 * H1x1_6 ;
   H2x2_5  =     0.15664903927836 * H1x1_1  +     0.89801997414549 * H1x1_2
          +     0.04506031069937 * H1x1_3  +      1.4896420490685 * H1x1_4
          +     0.98365163988804 * H1x1_5  +     1.62881757963203 * H1x1_6 ;
   H2x2_6  =    -0.88991913364633 * H1x1_1  +     1.86575129972351 * H1x1_2
          +     0.76328070558448 * H1x1_3  +     0.63606778895588 * H1x1_4
          +    -1.11359575595575 * H1x1_5  +     1.10728303240553 * H1x1_6 ;
   H2x2_1  = H2x2_1  +     -1.7548673730828 * H1x2_1
          +     1.87853034076717 * H1x2_2  +     0.85492889927862 * H1x2_3
          +     2.26726704170325 * H1x2_4  +       0.268534161133 * H1x2_5
          +     1.21824749182936 * H1x2_6 ;
   H2x2_2  = H2x2_2  +    -0.17868178338793 * H1x2_1
          +     1.40599171642169 * H1x2_2  +      1.3483797762751 * H1x2_3
          +    -0.89621237430335 * H1x2_4  +     0.47933617934751 * H1x2_5
          +    -0.70127450180732 * H1x2_6 ;
   H2x2_3  = H2x2_3  +     0.42928211521549 * H1x2_1
          +     0.12704381906566 * H1x2_2  +    -0.80979451254833 * H1x2_3
          +     -0.6754098317508 * H1x2_4  +     1.10456495865489 * H1x2_5
          +      0.1757517587226 * H1x2_6 ;
   H2x2_4  = H2x2_4  +    -1.58081641854024 * H1x2_1
          +     0.41044457304901 * H1x2_2  +      0.1555052899648 * H1x2_3
          +     1.44452911239916 * H1x2_4  +     0.51745105090469 * H1x2_5
          +      0.8693099398328 * H1x2_6 ;
   H2x2_5  = H2x2_5  +     1.04509064360988 * H1x2_1
          +     0.85304412821506 * H1x2_2  +     0.02488996279683 * H1x2_3
          +     0.91802038137174 * H1x2_4  +    -1.81721580205502 * H1x2_5
          +     0.11240659705231 * H1x2_6 ;
   H2x2_6  = H2x2_6  +     0.05653875399544 * H1x2_1
          +     1.39275186399065 * H1x2_2  +     0.15742585211841 * H1x2_3
          +    -0.88823005597082 * H1x2_4  +    -0.29404620644608 * H1x2_5
          +     0.67151326645383 * H1x2_6 ;
   H2x2_1  = H2x2_1  +     -0.3030053902263 * H1x3_1
          +     2.78883241587523 * H1x3_2  +      0.2423564112649 * H1x3_3
          +      0.7361422570599 * H1x3_4  +     1.00815416571126 * H1x3_5
          +    -0.76522554014331 * H1x3_6 ;
   H2x2_2  = H2x2_2  +     0.82248064405342 * H1x3_1
          +    -0.44213525858661 * H1x3_2  +    -0.00950377945068 * H1x3_3
          +    -0.26973050484517 * H1x3_4  +    -1.64864877093803 * H1x3_5
          +     1.79694481340011 * H1x3_6 ;
   H2x2_3  = H2x2_3  +     0.58931676503392 * H1x3_1
          +     -0.3196648688702 * H1x3_2  +    -1.13832101252701 * H1x3_3
          +    -0.03125400478011 * H1x3_4  +    -1.43718277665665 * H1x3_5
          +     0.43346153474351 * H1x3_6 ;
   H2x2_4  = H2x2_4  +    -1.21075206873547 * H1x3_1
          +    -1.44059265356325 * H1x3_2  +    -0.70572923760085 * H1x3_3
          +    -0.50514975818712 * H1x3_4  +    -1.15362557643796 * H1x3_5
          +     0.11633831354046 * H1x3_6 ;
   H2x2_5  = H2x2_5  +     1.62708810169671 * H1x3_1
          +     -0.1172779578507 * H1x3_2  +    -2.68535586251402 * H1x3_3
          +     0.70733149959662 * H1x3_4  +     0.37426620231353 * H1x3_5
          +    -0.51535580022884 * H1x3_6 ;
   H2x2_6  = H2x2_6  +     1.13688712518045 * H1x3_1
          +      0.5035299609214 * H1x3_2  +    -0.37315357246579 * H1x3_3
          +     2.28435302728227 * H1x3_4  +    -0.86692347925858 * H1x3_5
          +     1.02261478089015 * H1x3_6 ;
   H2x2_1  =      2.1294351501339 + H2x2_1 ;
   H2x2_2  =     1.02351873226689 + H2x2_2 ;
   H2x2_3  =    -2.24013423062467 + H2x2_3 ;
   H2x2_4  =    -0.75459686616452 + H2x2_4 ;
   H2x2_5  =    -0.02288525069595 + H2x2_5 ;
   H2x2_6  =     0.85009535412356 + H2x2_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x2_1  = 1.0 / (1.0 + EXP(MIN( - H2x2_1 , _EXP_BAR)));
   H2x2_2  = 1.0 / (1.0 + EXP(MIN( - H2x2_2 , _EXP_BAR)));
   H2x2_3  = 1.0 / (1.0 + EXP(MIN( - H2x2_3 , _EXP_BAR)));
   H2x2_4  = 1.0 / (1.0 + EXP(MIN( - H2x2_4 , _EXP_BAR)));
   H2x2_5  = 1.0 / (1.0 + EXP(MIN( - H2x2_5 , _EXP_BAR)));
   H2x2_6  = 1.0 / (1.0 + EXP(MIN( - H2x2_6 , _EXP_BAR)));
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
   H2x2_3  = .;
   H2x2_4  = .;
   H2x2_5  = .;
   H2x2_6  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     0.47414908117619 * H2x1_1  +    -0.48225593618443 * H2x1_2
          +     -2.1415546083933 * H2x1_3  +      0.1865992678808 * H2x1_4
          +     0.00905592746992 * H2x1_5  +    -0.19906676643855 * H2x1_6 ;
   H3x1_2  =    -1.49254004953978 * H2x1_1  +     0.31026207162707 * H2x1_2
          +     1.32646563211977 * H2x1_3  +    -1.28309969785351 * H2x1_4
          +     0.25756953254945 * H2x1_5  +    -0.76411205087595 * H2x1_6 ;
   H3x1_3  =    -1.92735673513935 * H2x1_1  +    -0.43375763993013 * H2x1_2
          +     0.43682333912422 * H2x1_3  +    -1.82129068789797 * H2x1_4
          +     0.29218264240002 * H2x1_5  +    -1.24122940235749 * H2x1_6 ;
   H3x1_4  =    -1.64752963128738 * H2x1_1  +     0.57434247193535 * H2x1_2
          +    -0.25025779129033 * H2x1_3  +     0.22582895723418 * H2x1_4
          +     1.06280616805567 * H2x1_5  +     1.46523065565448 * H2x1_6 ;
   H3x1_5  =     1.12463631894495 * H2x1_1  +     0.41116194812841 * H2x1_2
          +      0.7487833097767 * H2x1_3  +     1.30777439715556 * H2x1_4
          +    -2.30583381860923 * H2x1_5  +    -0.45051702468841 * H2x1_6 ;
   H3x1_6  =     0.83619385924948 * H2x1_1  +    -1.59549231556809 * H2x1_2
          +     1.90180728278943 * H2x1_3  +     1.56404469490888 * H2x1_4
          +    -0.13088910369985 * H2x1_5  +     0.29690402913896 * H2x1_6 ;
   H3x1_1  = H3x1_1  +    -0.92346745353313 * H2x2_1
          +    -0.03076503207993 * H2x2_2  +    -0.80770265916018 * H2x2_3
          +     2.13033820393108 * H2x2_4  +     1.57799583499821 * H2x2_5
          +    -0.96381430690961 * H2x2_6 ;
   H3x1_2  = H3x1_2  +     -2.8908441376485 * H2x2_1
          +    -0.73955819678817 * H2x2_2  +     0.25644336633912 * H2x2_3
          +    -0.21076687801122 * H2x2_4  +    -0.80525890625048 * H2x2_5
          +    -1.37757472119786 * H2x2_6 ;
   H3x1_3  = H3x1_3  +     1.68560264985255 * H2x2_1
          +    -1.80659127572232 * H2x2_2  +    -0.40798847098834 * H2x2_3
          +    -0.09427467518365 * H2x2_4  +       1.932433481179 * H2x2_5
          +    -1.58203174336227 * H2x2_6 ;
   H3x1_4  = H3x1_4  +    -0.79131921613464 * H2x2_1
          +    -0.94708168667993 * H2x2_2  +     0.95842423067232 * H2x2_3
          +    -1.35896085667273 * H2x2_4  +      0.3130528184907 * H2x2_5
          +     1.21364725785316 * H2x2_6 ;
   H3x1_5  = H3x1_5  +    -1.65282990431545 * H2x2_1
          +     0.41456756806825 * H2x2_2  +    -2.00212916702729 * H2x2_3
          +    -1.19874789923068 * H2x2_4  +     0.20234859862481 * H2x2_5
          +     0.95942799624748 * H2x2_6 ;
   H3x1_6  = H3x1_6  +    -0.52526666332317 * H2x2_1
          +      0.3234256287518 * H2x2_2  +    -0.93766150263141 * H2x2_3
          +    -1.81398789003556 * H2x2_4  +    -0.15539533140563 * H2x2_5
          +     0.23144688198135 * H2x2_6 ;
   H3x1_1  =     0.24609695545564 + H3x1_1 ;
   H3x1_2  =    -0.92728333066333 + H3x1_2 ;
   H3x1_3  =     1.63161482532776 + H3x1_3 ;
   H3x1_4  =     0.39161062590357 + H3x1_4 ;
   H3x1_5  =     0.01171760508297 + H3x1_5 ;
   H3x1_6  =    -0.72522461279376 + H3x1_6 ;
   H3x1_1  = SIN(H3x1_1 );
   H3x1_2  = SIN(H3x1_2 );
   H3x1_3  = SIN(H3x1_3 );
   H3x1_4  = SIN(H3x1_4 );
   H3x1_5  = SIN(H3x1_5 );
   H3x1_6  = SIN(H3x1_6 );
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
   H3x1_3  = .;
   H3x1_4  = .;
   H3x1_5  = .;
   H3x1_6  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =      0.9799962964316 * H3x1_1  +     1.34210953311734 * H3x1_2
          +      2.0189927751579 * H3x1_3  +      1.8409060954552 * H3x1_4
          +    -3.17705772371323 * H3x1_5  +    -2.12623562549552 * H3x1_6 ;
   P_DepVar1  =     1.17636518592867 + P_DepVar1 ;
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
