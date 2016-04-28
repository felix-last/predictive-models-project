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
   H1x1_1  =      1.3507655650527 * S_AcceptedCmpTotal
          +    -1.10614122240879 * S_Frq  +     1.75303764660855 * S_Income
          +    -3.36358487853209 * S_Mnt  +     0.66482370197508 * 
        S_MntGoldProds  +     2.20380795880989 * S_MntMeatProducts
          +     0.96941096546276 * S_NumCatalogPurchases
          +    -0.78169009272221 * S_NumDealsPurchases
          +     2.46694552614806 * S_NumWebVisitsMonth
          +    -0.70379796230966 * S_RFMstat  +    -2.91060571548081 * 
        S_Recency  +    -1.09760548427625 * S_Teenhome
          +    -0.04996948842393 * S_Year_Birth ;
   H1x1_2  =    -0.31908942522077 * S_AcceptedCmpTotal
          +     3.74791296051726 * S_Frq  +     2.24284839751303 * S_Income
          +    -1.78405040388815 * S_Mnt  +      0.8742942749026 * 
        S_MntGoldProds  +    -0.14368654003355 * S_MntMeatProducts
          +    -2.01779739147185 * S_NumCatalogPurchases
          +     -2.6507470301089 * S_NumDealsPurchases
          +     0.43757499676531 * S_NumWebVisitsMonth
          +    -1.37847156147455 * S_RFMstat  +    -0.69576523519337 * 
        S_Recency  +    -0.45321912120397 * S_Teenhome
          +     0.52676912620048 * S_Year_Birth ;
   H1x1_3  =     2.41023196591392 * S_AcceptedCmpTotal
          +    -2.36084733932675 * S_Frq  +     1.24213632619464 * S_Income
          +    -1.85110475917758 * S_Mnt  +    -0.28004157450889 * 
        S_MntGoldProds  +     2.40469717841771 * S_MntMeatProducts
          +      3.9474982958259 * S_NumCatalogPurchases
          +       0.376468804707 * S_NumDealsPurchases
          +     3.31501013882439 * S_NumWebVisitsMonth
          +     0.11559780336909 * S_RFMstat  +    -4.25267693921008 * 
        S_Recency  +    -1.57729700618019 * S_Teenhome
          +      0.1824973506119 * S_Year_Birth ;
   H1x1_4  =     -0.2757766975278 * S_AcceptedCmpTotal
          +     3.82725387338192 * S_Frq  +      -0.761164420496 * S_Income
          +    -1.14207863171921 * S_Mnt  +     -0.1745335405903 * 
        S_MntGoldProds  +    -5.79657274001258 * S_MntMeatProducts
          +    -1.47064436222345 * S_NumCatalogPurchases
          +    -0.47773085529503 * S_NumDealsPurchases
          +     0.20028656323595 * S_NumWebVisitsMonth
          +    -0.18383173425255 * S_RFMstat  +     0.10522454853137 * 
        S_Recency  +    -0.11530372179295 * S_Teenhome
          +    -0.34167488644648 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     1.48263364530339 * Marital_StatusDivorced
          +    -1.68634246986018 * Marital_StatusMarried
          +     0.61674763327859 * Marital_StatusSingle
          +    -1.26649958570453 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     1.03937964147637 * Marital_StatusDivorced
          +    -0.63821523628652 * Marital_StatusMarried
          +    -1.40431603473643 * Marital_StatusSingle
          +    -0.20849152262706 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.00632006555267 * Marital_StatusDivorced
          +    -2.86773035723606 * Marital_StatusMarried
          +     2.52900517550184 * Marital_StatusSingle
          +    -3.34343954102751 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.05620673245628 * Marital_StatusDivorced
          +    -0.89880425714459 * Marital_StatusMarried
          +     0.97652284934456 * Marital_StatusSingle
          +    -0.83414241747679 * Marital_StatusTogether ;
   H1x1_1  =    -0.73505942586437 + H1x1_1 ;
   H1x1_2  =     2.97401194500651 + H1x1_2 ;
   H1x1_3  =    -7.86049995366383 + H1x1_3 ;
   H1x1_4  =    -3.77808914097545 + H1x1_4 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     17.1091261255058 * H1x1_1  +    -15.4649724088409 * H1x1_2
          +     14.2519883476498 * H1x1_3  +    -25.0940711325771 * H1x1_4 ;
   P_DepVar1  =     -0.7898064443713 + P_DepVar1 ;
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
