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

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -3.92905088817122 * S_AcceptedCmpTotal
          +    -4.76567955922662 * S_Frq  +    -3.20305851407308 * S_Income
          +     10.4290156082038 * S_Mnt  +     2.82139196372317 * 
        S_MntGoldProds  +    -4.54749029525518 * S_MntMeatProducts
          +    -12.1201262560598 * S_NumCatalogPurchases
          +    -7.64265449386917 * S_NumDealsPurchases
          +     -0.8154661733691 * S_NumWebVisitsMonth
          +    -7.34275682075933 * S_RFMstat  +     3.14025498790893 * 
        S_Recency  +     3.79010135100643 * S_Teenhome
          +    -1.18831354068466 * S_Year_Birth ;
   H1x1_2  =    -4.72019183577823 * S_AcceptedCmpTotal
          +     5.14902294151494 * S_Frq  +     -2.7967028726716 * S_Income
          +     7.90170532262596 * S_Mnt  +    -0.27896242131344 * 
        S_MntGoldProds  +    -6.13177486713562 * S_MntMeatProducts
          +    -5.64377068696071 * S_NumCatalogPurchases
          +       1.315880732417 * S_NumDealsPurchases
          +    -7.12689902819995 * S_NumWebVisitsMonth
          +     -0.1333171344564 * S_RFMstat  +     8.57178329047956 * 
        S_Recency  +     2.42655161118896 * S_Teenhome
          +     0.41845495922131 * S_Year_Birth ;
   H1x1_3  =    -3.47660178529996 * S_AcceptedCmpTotal
          +     6.36750571377116 * S_Frq  +    -3.65638554203354 * S_Income
          +     5.03085244876136 * S_Mnt  +    -1.53184712146016 * 
        S_MntGoldProds  +    -11.4803326240536 * S_MntMeatProducts
          +    -7.71653347900468 * S_NumCatalogPurchases
          +    -2.29382480020793 * S_NumDealsPurchases
          +    -3.92350308032578 * S_NumWebVisitsMonth
          +      0.1666173174602 * S_RFMstat  +      5.5545699438819 * 
        S_Recency  +     1.88830044274756 * S_Teenhome
          +     0.36177301880441 * S_Year_Birth ;
   H1x1_4  =     3.46597508500309 * S_AcceptedCmpTotal
          +    -3.55913679518365 * S_Frq  +     -3.8279864380535 * S_Income
          +     4.37031319397754 * S_Mnt  +     0.25558899887189 * 
        S_MntGoldProds  +     1.30937005137526 * S_MntMeatProducts
          +     0.50178849511862 * S_NumCatalogPurchases
          +     3.33915340676542 * S_NumDealsPurchases
          +     2.99171363234904 * S_NumWebVisitsMonth
          +    -1.10860117011224 * S_RFMstat  +     -5.2144291963152 * 
        S_Recency  +     1.84778865722952 * S_Teenhome
          +     1.48264084751626 * S_Year_Birth ;
   H1x1_5  =    -3.28077802512331 * S_AcceptedCmpTotal
          +     3.26112701694144 * S_Frq  +    -3.51257256391539 * S_Income
          +     -13.277904245629 * S_Mnt  +    -0.08185099069039 * 
        S_MntGoldProds  +      2.6349809613264 * S_MntMeatProducts
          +    -5.23430097842472 * S_NumCatalogPurchases
          +    -1.25644862473488 * S_NumDealsPurchases
          +     -3.0943337340276 * S_NumWebVisitsMonth
          +     0.96429102250453 * S_RFMstat  +     4.60373013139143 * 
        S_Recency  +     1.52557456336148 * S_Teenhome
          +     0.00287578113165 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     1.77432710413329 * Marital_StatusDivorced
          +     5.12496303990022 * Marital_StatusMarried
          +    -7.61364369696186 * Marital_StatusSingle
          +     2.78937374370395 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -5.49070434381597 * Marital_StatusDivorced
          +     7.65332274940308 * Marital_StatusMarried
          +    -5.13332947688313 * Marital_StatusSingle
          +     8.25159601985572 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     1.57910552070948 * Marital_StatusDivorced
          +     7.95162959069432 * Marital_StatusMarried
          +    -6.10797604390061 * Marital_StatusSingle
          +     2.98577039618027 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     3.65411081783958 * Marital_StatusDivorced
          +     5.45977621823616 * Marital_StatusMarried
          +    -10.3527985391218 * Marital_StatusSingle
          +     4.66094015963389 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     1.57864743151562 * Marital_StatusDivorced
          +     8.15909630638185 * Marital_StatusMarried
          +    -5.88497367282032 * Marital_StatusSingle
          +     3.05474303626666 * Marital_StatusTogether ;
   H1x1_1  =    -1.55078746609233 + H1x1_1 ;
   H1x1_2  =     5.40474806112383 + H1x1_2 ;
   H1x1_3  =     11.2733164995662 + H1x1_3 ;
   H1x1_4  =    -7.78487963966384 + H1x1_4 ;
   H1x1_5  =      3.8784406873535 + H1x1_5 ;
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
   H1x2_1  =     0.07453146398445 * S_AcceptedCmpTotal
          +     0.17438368465616 * S_Frq  +     0.97121905855093 * S_Income
          +    -0.15757686261675 * S_Mnt  +     0.28678754855648 * 
        S_MntGoldProds  +     2.03999655184815 * S_MntMeatProducts
          +      0.8747576336553 * S_NumCatalogPurchases
          +    -0.23551985234916 * S_NumDealsPurchases
          +     0.83901499225112 * S_NumWebVisitsMonth
          +     -0.7643570473353 * S_RFMstat  +      0.0823609346051 * 
        S_Recency  +    -0.38340703993831 * S_Teenhome
          +     1.16037573405943 * S_Year_Birth ;
   H1x2_2  =      -2.285017059996 * S_AcceptedCmpTotal
          +    -0.29646095672581 * S_Frq  +     -3.5024410668082 * S_Income
          +    -2.12091528193185 * S_Mnt  +    -1.48506012188621 * 
        S_MntGoldProds  +    -1.38316375865608 * S_MntMeatProducts
          +    -0.99107054453387 * S_NumCatalogPurchases
          +    -0.68379823410573 * S_NumDealsPurchases
          +    -1.67939872609259 * S_NumWebVisitsMonth
          +     0.49106697429539 * S_RFMstat  +    -0.01117108974211 * 
        S_Recency  +    -1.65033346710833 * S_Teenhome
          +    -1.03897054098621 * S_Year_Birth ;
   H1x2_3  =      2.9562672276462 * S_AcceptedCmpTotal
          +    -0.19531439441895 * S_Frq  +      0.3125078734463 * S_Income
          +     -1.6099267525002 * S_Mnt  +    -0.36573328507463 * 
        S_MntGoldProds  +     -0.3392853565114 * S_MntMeatProducts
          +      1.4506330104932 * S_NumCatalogPurchases
          +     0.20085283861849 * S_NumDealsPurchases
          +     2.37974383924154 * S_NumWebVisitsMonth
          +     -0.1106906484364 * S_RFMstat  +    -3.36701384866793 * 
        S_Recency  +     0.60726269989058 * S_Teenhome
          +     0.51474814816173 * S_Year_Birth ;
   H1x2_4  =    -3.19375607611292 * S_AcceptedCmpTotal
          +    -1.28391627024222 * S_Frq  +     1.20886875907222 * S_Income
          +     0.33241907162962 * S_Mnt  +     0.81131852742978 * 
        S_MntGoldProds  +     0.66955477854362 * S_MntMeatProducts
          +    -0.79952426911069 * S_NumCatalogPurchases
          +    -0.70571099772216 * S_NumDealsPurchases
          +    -0.32158728049114 * S_NumWebVisitsMonth
          +    -0.83126265863782 * S_RFMstat  +     1.49830148501327 * 
        S_Recency  +     2.29389047813725 * S_Teenhome
          +     0.04615513391624 * S_Year_Birth ;
   H1x2_5  =     -0.6002425930451 * S_AcceptedCmpTotal
          +    -0.86762771301251 * S_Frq  +    -0.57793933969656 * S_Income
          +     0.41975808190408 * S_Mnt  +    -0.13242897225011 * 
        S_MntGoldProds  +    -1.44402585881872 * S_MntMeatProducts
          +    -0.41491605544255 * S_NumCatalogPurchases
          +     0.49374983047507 * S_NumDealsPurchases
          +    -1.38692718220359 * S_NumWebVisitsMonth
          +    -0.07580803465143 * S_RFMstat  +      0.4152505934779 * 
        S_Recency  +     1.29605991841828 * S_Teenhome
          +     2.17160180088465 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +     0.77674448865903 * Marital_StatusDivorced
          +    -1.29227303709115 * Marital_StatusMarried
          +     0.71446782242025 * Marital_StatusSingle
          +     0.55295867102727 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     -0.1845223373129 * Marital_StatusDivorced
          +      2.0815223604364 * Marital_StatusMarried
          +     0.79462013188709 * Marital_StatusSingle
          +     0.20668835346022 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +    -1.02774258915556 * Marital_StatusDivorced
          +     0.44769683627357 * Marital_StatusMarried
          +     1.09957357551209 * Marital_StatusSingle
          +     0.98246644516303 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +     1.02578628033933 * Marital_StatusDivorced
          +    -0.71096069683657 * Marital_StatusMarried
          +    -0.46849808497503 * Marital_StatusSingle
          +    -0.50186472808298 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.83514340443964 * Marital_StatusDivorced
          +     0.21000014809177 * Marital_StatusMarried
          +    -1.05959388759825 * Marital_StatusSingle
          +     -0.8202251717493 * Marital_StatusTogether ;
   H1x2_1  =     0.66244588339698 + H1x2_1 ;
   H1x2_2  =     0.36306484617725 + H1x2_2 ;
   H1x2_3  =     0.00299288434405 + H1x2_3 ;
   H1x2_4  =     0.32206403734945 + H1x2_4 ;
   H1x2_5  =     0.48514364636978 + H1x2_5 ;
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
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     5.34062678932931 * H1x1_1  +     7.71604112891627 * H1x1_2
          +     7.54377937186103 * H1x1_3  +    -5.90943850663966 * H1x1_4
          +    -6.06522890475814 * H1x1_5  +    -7.94470945127082 * H1x1_6 ;
   H2x1_2  =      1.1479485803131 * H1x1_1  +      1.4482835893576 * H1x1_2
          +    -0.15220644394866 * H1x1_3  +    -1.30000676790854 * H1x1_4
          +    -0.49333138568117 * H1x1_5  +    -1.96124154717115 * H1x1_6 ;
   H2x1_3  =     2.12915623251937 * H1x1_1  +     4.39530013559682 * H1x1_2
          +     3.38050961443392 * H1x1_3  +    -5.12182301645649 * H1x1_4
          +    -3.74697079524831 * H1x1_5  +    -5.26174801543685 * H1x1_6 ;
   H2x1_4  =     0.54854810712303 * H1x1_1  +      1.6486650469525 * H1x1_2
          +     1.84563084742932 * H1x1_3  +    -2.43710509923951 * H1x1_4
          +     0.03038093596976 * H1x1_5  +    -1.34566786751269 * H1x1_6 ;
   H2x1_5  =     0.89845480530178 * H1x1_1  +     3.19967829294268 * H1x1_2
          +     3.58592569542093 * H1x1_3  +    -3.76417733693485 * H1x1_4
          +     -4.1568039640005 * H1x1_5  +    -4.42895004794637 * H1x1_6 ;
   H2x1_1  = H2x1_1  +     0.44545310705069 * H1x2_1
          +     2.72471946580982 * H1x2_2  +    -1.42856846603531 * H1x2_3
          +     0.25357521888082 * H1x2_4  +    -1.25902268741411 * H1x2_5
          +    -1.70956044020454 * H1x2_6 ;
   H2x1_2  = H2x1_2  +      0.9465771639497 * H1x2_1
          +    -0.41110969777104 * H1x2_2  +    -0.92834816798625 * H1x2_3
          +     -1.7337755087443 * H1x2_4  +     -1.2522448489667 * H1x2_5
          +    -0.90111756793979 * H1x2_6 ;
   H2x1_3  = H2x1_3  +    -0.22355080983787 * H1x2_1
          +    -0.18918346120545 * H1x2_2  +    -1.50592518382263 * H1x2_3
          +    -1.00672320426732 * H1x2_4  +    -1.09510249463921 * H1x2_5
          +     0.83089577154267 * H1x2_6 ;
   H2x1_4  = H2x1_4  +    -0.74505363577487 * H1x2_1
          +     0.41544439689687 * H1x2_2  +    -0.11467073820729 * H1x2_3
          +    -2.16913690278917 * H1x2_4  +     1.07667011067144 * H1x2_5
          +    -0.21291665093094 * H1x2_6 ;
   H2x1_5  = H2x1_5  +    -0.22639397151159 * H1x2_1
          +     0.59976504799464 * H1x2_2  +    -1.19497833953318 * H1x2_3
          +     0.40681132265012 * H1x2_4  +    -1.18142813082248 * H1x2_5
          +     0.28627108561279 * H1x2_6 ;
   H2x1_1  =     0.80837297417824 + H2x1_1 ;
   H2x1_2  =    -3.15918654233626 + H2x1_2 ;
   H2x1_3  =     -1.1148455701308 + H2x1_3 ;
   H2x1_4  =    -2.43637271773179 + H2x1_4 ;
   H2x1_5  =     -1.5068240097035 + H2x1_5 ;
   H2x1_6  = 0; 
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 , H2x1_5 , H2x1_6 );
   _SUM_ = 0.; 
   H2x1_1  = EXP(H2x1_1  - _MAX_);
   _SUM_ = _SUM_ + H2x1_1 ;
   H2x1_2  = EXP(H2x1_2  - _MAX_);
   _SUM_ = _SUM_ + H2x1_2 ;
   H2x1_3  = EXP(H2x1_3  - _MAX_);
   _SUM_ = _SUM_ + H2x1_3 ;
   H2x1_4  = EXP(H2x1_4  - _MAX_);
   _SUM_ = _SUM_ + H2x1_4 ;
   H2x1_5  = EXP(H2x1_5  - _MAX_);
   _SUM_ = _SUM_ + H2x1_5 ;
   H2x1_6  = EXP(H2x1_6  - _MAX_);
   _SUM_ = _SUM_ + H2x1_6 ;
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
   H2x1_5  = H2x1_5  / _SUM_;
   H2x1_6  = H2x1_6  / _SUM_;
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
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -14.9408685199347 * H2x1_1  +     1.48309430635242 * H2x1_2
          +     -4.3496216751271 * H2x1_3  +     0.01239249943556 * H2x1_4
          +    -6.27169756239783 * H2x1_5  +     2.70843493957574 * H2x1_6 ;
   P_DepVar1  =     5.67267561171469 + P_DepVar1 ;
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
