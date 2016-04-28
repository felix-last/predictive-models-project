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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H1x2_7 = 'Hidden: H1x2_=7' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H1x3_2 = 'Hidden: H1x3_=2' ;

      label H1x3_3 = 'Hidden: H1x3_=3' ;

      label H1x3_4 = 'Hidden: H1x3_=4' ;

      label H1x3_5 = 'Hidden: H1x3_=5' ;

      label H1x3_6 = 'Hidden: H1x3_=6' ;

      label H1x3_7 = 'Hidden: H1x3_=7' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x1_7 = 'Hidden: H2x1_=7' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H2x2_2 = 'Hidden: H2x2_=2' ;

      label H2x2_3 = 'Hidden: H2x2_=3' ;

      label H2x2_4 = 'Hidden: H2x2_=4' ;

      label H2x2_5 = 'Hidden: H2x2_=5' ;

      label H2x2_6 = 'Hidden: H2x2_=6' ;

      label H2x2_7 = 'Hidden: H2x2_=7' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

      label H3x1_2 = 'Hidden: H3x1_=2' ;

      label H3x1_3 = 'Hidden: H3x1_=3' ;

      label H3x1_4 = 'Hidden: H3x1_=4' ;

      label H3x1_5 = 'Hidden: H3x1_=5' ;

      label H3x1_6 = 'Hidden: H3x1_=6' ;

      label H3x1_7 = 'Hidden: H3x1_=7' ;

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
   H1x1_1  =    -0.29618919413806 * S_AcceptedCmpTotal
          +     0.65621237028757 * S_Frq  +     0.03418945976327 * S_Income
          +     1.44880456678399 * S_Mnt  +     0.74166093949552 *
        S_MntGoldProds  +     1.02706876663519 * S_MntMeatProducts
          +    -0.82528424139262 * S_NumCatalogPurchases
          +      0.5929046965244 * S_NumDealsPurchases
          +    -0.52362488197384 * S_NumWebVisitsMonth
          +     0.37882892269923 * S_RFMstat  +     2.12340115344155 *
        S_Recency  +    -0.83670225777249 * S_Teenhome
          +     0.53976656905831 * S_Year_Birth ;
   H1x1_2  =     0.29962396390652 * S_AcceptedCmpTotal
          +     -2.5902198016826 * S_Frq  +    -0.18776639473475 * S_Income
          +    -2.77524252217737 * S_Mnt  +     0.96018065616836 *
        S_MntGoldProds  +     3.16907172523474 * S_MntMeatProducts
          +    -0.60117742307807 * S_NumCatalogPurchases
          +     1.09806082321711 * S_NumDealsPurchases
          +     1.26617704720444 * S_NumWebVisitsMonth
          +     1.08444062320284 * S_RFMstat  +     1.05523311776937 *
        S_Recency  +     -0.2630764341314 * S_Teenhome
          +    -0.42373178164016 * S_Year_Birth ;
   H1x1_3  =     2.31041583450369 * S_AcceptedCmpTotal
          +    -1.96810851023784 * S_Frq  +     0.93795839333407 * S_Income
          +    -1.55337331547216 * S_Mnt  +     1.13417428979776 *
        S_MntGoldProds  +     3.70573651287077 * S_MntMeatProducts
          +     1.63075268570383 * S_NumCatalogPurchases
          +     0.62057902628545 * S_NumDealsPurchases
          +     1.85944172136218 * S_NumWebVisitsMonth
          +     0.51474936656536 * S_RFMstat  +    -2.17922024885571 *
        S_Recency  +    -0.78663308544854 * S_Teenhome
          +    -0.08719031066365 * S_Year_Birth ;
   H1x1_4  =     -0.0390409024382 * S_AcceptedCmpTotal
          +     2.11606776858073 * S_Frq  +     -0.3817450995856 * S_Income
          +     0.40531492299483 * S_Mnt  +     0.54341985868017 *
        S_MntGoldProds  +    -5.50809183295151 * S_MntMeatProducts
          +    -2.59032878085972 * S_NumCatalogPurchases
          +    -0.44146008176644 * S_NumDealsPurchases
          +     1.16377649939583 * S_NumWebVisitsMonth
          +    -0.40950445519308 * S_RFMstat  +     1.44701615363875 *
        S_Recency  +    -0.44721505258044 * S_Teenhome
          +    -0.53780522701747 * S_Year_Birth ;
   H1x1_5  =    -0.96249689474011 * S_AcceptedCmpTotal
          +     1.18171571446591 * S_Frq  +     0.15643078933994 * S_Income
          +      1.1855275327594 * S_Mnt  +    -0.31882188338593 *
        S_MntGoldProds  +    -0.17799046807331 * S_MntMeatProducts
          +    -2.88423926492169 * S_NumCatalogPurchases
          +     0.76448279454687 * S_NumDealsPurchases
          +     0.63782718366339 * S_NumWebVisitsMonth
          +    -1.52311206450608 * S_RFMstat  +     2.66138322599513 *
        S_Recency  +     0.19809045233143 * S_Teenhome
          +    -0.11944673598308 * S_Year_Birth ;
   H1x1_6  =     1.48018319811202 * S_AcceptedCmpTotal
          +    -2.35201132061873 * S_Frq  +     1.49549206730687 * S_Income
          +    -0.92311571755706 * S_Mnt  +    -0.17036386789536 *
        S_MntGoldProds  +     2.42959371021324 * S_MntMeatProducts
          +     1.71243370379543 * S_NumCatalogPurchases
          +     1.59034024362028 * S_NumDealsPurchases
          +     2.43090724707282 * S_NumWebVisitsMonth
          +    -1.84934930083177 * S_RFMstat  +    -1.10219728762745 *
        S_Recency  +    -1.20398234836557 * S_Teenhome
          +    -0.04071326663204 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +    -1.53952272056325 * Marital_StatusDivorced
          +     1.90782989914192 * Marital_StatusMarried
          +    -1.16189886119693 * Marital_StatusSingle
          +     1.42717413956591 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.65814869063598 * Marital_StatusDivorced
          +     0.30468777490799 * Marital_StatusMarried
          +     0.61978761938746 * Marital_StatusSingle
          +    -0.78873321292122 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +      0.1292120736254 * Marital_StatusDivorced
          +    -1.73477859605124 * Marital_StatusMarried
          +     1.32595981126289 * Marital_StatusSingle
          +    -1.40161784211243 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.20617554754163 * Marital_StatusDivorced
          +     0.06077392213964 * Marital_StatusMarried
          +     0.21115279121703 * Marital_StatusSingle
          +    -0.61340758151821 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.69141266071894 * Marital_StatusDivorced
          +    -0.24067068377767 * Marital_StatusMarried
          +      0.2728964145401 * Marital_StatusSingle
          +    -0.61614895252648 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +    -0.81455860225062 * Marital_StatusDivorced
          +    -0.15640287278595 * Marital_StatusMarried
          +     0.54159395450762 * Marital_StatusSingle
          +    -0.43264862434738 * Marital_StatusTogether ;
   H1x1_1  =    -0.36385036888345 + H1x1_1 ;
   H1x1_2  =     0.02663558500629 + H1x1_2 ;
   H1x1_3  =    -3.50526409213811 + H1x1_3 ;
   H1x1_4  =     0.63048769294892 + H1x1_4 ;
   H1x1_5  =     1.21111796976731 + H1x1_5 ;
   H1x1_6  =    -1.76174187739611 + H1x1_6 ;
   H1x1_7  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 , H1x1_7
         );
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
   H1x1_7  = EXP(H1x1_7  - _MAX_);
   _SUM_ = _SUM_ + H1x1_7 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
   H1x1_7  = H1x1_7  / _SUM_;
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
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =     0.51589041180152 * S_AcceptedCmpTotal
          +     -0.6498311499195 * S_Frq  +    -1.08182644925044 * S_Income
          +    -1.19064228379044 * S_Mnt  +    -1.27287496888491 *
        S_MntGoldProds  +    -1.33897837883991 * S_MntMeatProducts
          +     0.14209124492657 * S_NumCatalogPurchases
          +    -1.31625106509803 * S_NumDealsPurchases
          +     2.35745588368331 * S_NumWebVisitsMonth
          +    -1.28657356976181 * S_RFMstat  +     0.25408650330935 *
        S_Recency  +     1.23527100408525 * S_Teenhome
          +    -1.87183507669176 * S_Year_Birth ;
   H1x2_2  =    -1.23424462482032 * S_AcceptedCmpTotal
          +     1.46358102529667 * S_Frq  +     1.75790517593121 * S_Income
          +      -0.424881586919 * S_Mnt  +     -0.9331242135447 *
        S_MntGoldProds  +     0.54942904780681 * S_MntMeatProducts
          +     1.18605040958794 * S_NumCatalogPurchases
          +    -0.89798157472835 * S_NumDealsPurchases
          +    -0.09236646871049 * S_NumWebVisitsMonth
          +    -1.29341547638046 * S_RFMstat  +     1.66853355984342 *
        S_Recency  +    -0.50770218335102 * S_Teenhome
          +    -1.07353749220663 * S_Year_Birth ;
   H1x2_3  =     0.77624009560593 * S_AcceptedCmpTotal
          +    -0.52739784343536 * S_Frq  +     0.03893675518591 * S_Income
          +     2.17484611279249 * S_Mnt  +    -0.17952459801341 *
        S_MntGoldProds  +     0.34588410829653 * S_MntMeatProducts
          +    -1.53424308314822 * S_NumCatalogPurchases
          +    -0.80590323269981 * S_NumDealsPurchases
          +    -1.40104490662303 * S_NumWebVisitsMonth
          +     1.66586308350968 * S_RFMstat  +    -0.47553614859646 *
        S_Recency  +     0.96086280467056 * S_Teenhome
          +    -1.77672596886127 * S_Year_Birth ;
   H1x2_4  =     0.58137966699652 * S_AcceptedCmpTotal
          +      1.4040418295752 * S_Frq  +    -0.24832517883948 * S_Income
          +    -0.61141424736299 * S_Mnt  +     0.20471254162898 *
        S_MntGoldProds  +     0.44314427658514 * S_MntMeatProducts
          +    -1.25862219948587 * S_NumCatalogPurchases
          +     1.95015982914109 * S_NumDealsPurchases
          +     0.64320281589594 * S_NumWebVisitsMonth
          +     0.79165027029588 * S_RFMstat  +     0.66988554846863 *
        S_Recency  +    -0.00184949563812 * S_Teenhome
          +    -0.90548552271817 * S_Year_Birth ;
   H1x2_5  =      0.5931660751286 * S_AcceptedCmpTotal
          +     0.58645753040534 * S_Frq  +     1.15236353289832 * S_Income
          +     0.33853280493921 * S_Mnt  +    -0.34695797092699 *
        S_MntGoldProds  +     2.24596975589576 * S_MntMeatProducts
          +     0.30573893169917 * S_NumCatalogPurchases
          +     0.93169788380491 * S_NumDealsPurchases
          +     0.04516037232248 * S_NumWebVisitsMonth
          +     0.56461660789519 * S_RFMstat  +    -0.73850030816559 *
        S_Recency  +      0.1429120113072 * S_Teenhome
          +     0.57728849891114 * S_Year_Birth ;
   H1x2_6  =    -0.61564457275113 * S_AcceptedCmpTotal
          +     0.25558411574917 * S_Frq  +      0.1079727446126 * S_Income
          +    -1.20360633098467 * S_Mnt  +     1.72797334940475 *
        S_MntGoldProds  +    -1.65210775934619 * S_MntMeatProducts
          +      0.2704422632168 * S_NumCatalogPurchases
          +      2.3389342094366 * S_NumDealsPurchases
          +     0.01076302858809 * S_NumWebVisitsMonth
          +    -2.36764292681458 * S_RFMstat  +     1.10196533018748 *
        S_Recency  +     0.68455094392125 * S_Teenhome
          +     1.22292273319927 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +    -2.04566893512123 * Marital_StatusDivorced
          +      0.8255833782513 * Marital_StatusMarried
          +    -0.48959165020896 * Marital_StatusSingle
          +     2.83781371812098 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.67000557197818 * Marital_StatusDivorced
          +    -0.36405013930464 * Marital_StatusMarried
          +    -0.11895921007246 * Marital_StatusSingle
          +    -0.94713834966834 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +     0.26597574107473 * Marital_StatusDivorced
          +    -1.38902793752658 * Marital_StatusMarried
          +     0.47104623132568 * Marital_StatusSingle
          +    -0.55354712799424 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +    -1.69625977318234 * Marital_StatusDivorced
          +     0.03793816986941 * Marital_StatusMarried
          +     0.32286910605532 * Marital_StatusSingle
          +    -1.44817209305758 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.19745523338489 * Marital_StatusDivorced
          +    -0.60013237897988 * Marital_StatusMarried
          +    -1.54090744803073 * Marital_StatusSingle
          +    -2.24346446510302 * Marital_StatusTogether ;
   H1x2_6  = H1x2_6  +     0.47464108124928 * Marital_StatusDivorced
          +     2.39490119482132 * Marital_StatusMarried
          +     0.73080073298893 * Marital_StatusSingle
          +    -0.62296432915598 * Marital_StatusTogether ;
   H1x2_1  =     1.03099135229255 + H1x2_1 ;
   H1x2_2  =     -0.9436150278938 + H1x2_2 ;
   H1x2_3  =    -0.17327523864686 + H1x2_3 ;
   H1x2_4  =     0.30103807123555 + H1x2_4 ;
   H1x2_5  =    -2.06815743640812 + H1x2_5 ;
   H1x2_6  =     1.90356790294644 + H1x2_6 ;
   H1x2_7  = 0;
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 , H1x2_7
         );
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
   H1x2_7  = EXP(H1x2_7  - _MAX_);
   _SUM_ = _SUM_ + H1x2_7 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
   H1x2_7  = H1x2_7  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
   H1x2_7  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -0.02577999703823 * S_AcceptedCmpTotal
          +     1.15166430232754 * S_Frq  +     0.14876168620543 * S_Income
          +    -0.18380736633059 * S_Mnt  +     0.50048252433262 *
        S_MntGoldProds  +    -0.33191625929347 * S_MntMeatProducts
          +     2.25334156596167 * S_NumCatalogPurchases
          +     1.11206221926547 * S_NumDealsPurchases
          +    -0.86546062057987 * S_NumWebVisitsMonth
          +    -0.98321051175326 * S_RFMstat  +     1.25274008829299 *
        S_Recency  +    -1.57916593034924 * S_Teenhome
          +    -2.06345344469395 * S_Year_Birth ;
   H1x3_2  =    -1.17329843303132 * S_AcceptedCmpTotal
          +     1.78916673039241 * S_Frq  +    -0.84674133842717 * S_Income
          +     0.28484675606294 * S_Mnt  +     0.63187019772354 *
        S_MntGoldProds  +    -0.96245535082151 * S_MntMeatProducts
          +    -0.72830662589886 * S_NumCatalogPurchases
          +    -1.43194640925705 * S_NumDealsPurchases
          +     0.27875145672985 * S_NumWebVisitsMonth
          +    -2.03430995128807 * S_RFMstat  +    -0.52413738058555 *
        S_Recency  +    -1.01056905981073 * S_Teenhome
          +     0.00830584207402 * S_Year_Birth ;
   H1x3_3  =    -1.51193899177395 * S_AcceptedCmpTotal
          +    -1.18260896990859 * S_Frq  +    -0.95243122164169 * S_Income
          +    -0.18792820239336 * S_Mnt  +    -0.06982279743147 *
        S_MntGoldProds  +    -1.14763783870634 * S_MntMeatProducts
          +    -0.29577972728188 * S_NumCatalogPurchases
          +    -0.09204036503823 * S_NumDealsPurchases
          +     1.09127760712522 * S_NumWebVisitsMonth
          +     0.67251355869104 * S_RFMstat  +     0.02406054275944 *
        S_Recency  +    -1.61269837976842 * S_Teenhome
          +     1.49645524045306 * S_Year_Birth ;
   H1x3_4  =      0.0300271349218 * S_AcceptedCmpTotal
          +     0.92676949944979 * S_Frq  +    -0.43729227407729 * S_Income
          +     0.20149694045928 * S_Mnt  +    -0.72339995493149 *
        S_MntGoldProds  +     0.79792093415572 * S_MntMeatProducts
          +     0.74771164805463 * S_NumCatalogPurchases
          +     1.48674373289951 * S_NumDealsPurchases
          +    -0.43724934700095 * S_NumWebVisitsMonth
          +    -0.83295997374079 * S_RFMstat  +    -0.78737099754706 *
        S_Recency  +      1.5969237416548 * S_Teenhome
          +     -0.1539761100948 * S_Year_Birth ;
   H1x3_5  =     0.10850479066736 * S_AcceptedCmpTotal
          +    -0.69523987336905 * S_Frq  +    -1.03313846128362 * S_Income
          +     0.25026080496919 * S_Mnt  +    -0.97357883151863 *
        S_MntGoldProds  +    -0.61754054300662 * S_MntMeatProducts
          +     0.32607897654777 * S_NumCatalogPurchases
          +    -0.05989936582211 * S_NumDealsPurchases
          +     -0.8863628882594 * S_NumWebVisitsMonth
          +      1.1124532739734 * S_RFMstat  +    -0.38719199193265 *
        S_Recency  +      1.1633098880037 * S_Teenhome
          +    -1.12745203473451 * S_Year_Birth ;
   H1x3_6  =    -0.11588080697234 * S_AcceptedCmpTotal
          +     0.62360534366171 * S_Frq  +     0.05171263107667 * S_Income
          +    -2.09517372359855 * S_Mnt  +     1.82275072298905 *
        S_MntGoldProds  +    -0.20222711303443 * S_MntMeatProducts
          +    -0.32855091358254 * S_NumCatalogPurchases
          +    -0.04262624947945 * S_NumDealsPurchases
          +     0.34844893542429 * S_NumWebVisitsMonth
          +     1.02395415516187 * S_RFMstat  +     0.72163010188304 *
        S_Recency  +     0.25374922499465 * S_Teenhome
          +    -0.26482823596248 * S_Year_Birth ;
   H1x3_1  = H1x3_1  +     0.22579923464903 * Marital_StatusDivorced
          +    -1.19357131519861 * Marital_StatusMarried
          +     1.01104838285626 * Marital_StatusSingle
          +    -1.80955917142309 * Marital_StatusTogether ;
   H1x3_2  = H1x3_2  +    -0.94571479472535 * Marital_StatusDivorced
          +     0.41518199668826 * Marital_StatusMarried
          +     1.03267293059069 * Marital_StatusSingle
          +    -0.66743874470855 * Marital_StatusTogether ;
   H1x3_3  = H1x3_3  +    -0.15213926695809 * Marital_StatusDivorced
          +     0.56306179671807 * Marital_StatusMarried
          +    -1.20896369649342 * Marital_StatusSingle
          +      0.2381860290523 * Marital_StatusTogether ;
   H1x3_4  = H1x3_4  +      1.0736711015636 * Marital_StatusDivorced
          +    -2.56951757071166 * Marital_StatusMarried
          +     0.89024254219017 * Marital_StatusSingle
          +    -1.38303524163943 * Marital_StatusTogether ;
   H1x3_5  = H1x3_5  +     2.33108578518176 * Marital_StatusDivorced
          +    -0.82560993254767 * Marital_StatusMarried
          +     0.67892086377875 * Marital_StatusSingle
          +    -0.99872502550085 * Marital_StatusTogether ;
   H1x3_6  = H1x3_6  +    -1.46724646572707 * Marital_StatusDivorced
          +     1.62783448403167 * Marital_StatusMarried
          +     0.73020544049082 * Marital_StatusSingle
          +    -0.22473120319236 * Marital_StatusTogether ;
   H1x3_1  =     0.67900930500511 + H1x3_1 ;
   H1x3_2  =     1.40060666199115 + H1x3_2 ;
   H1x3_3  =     0.29463847527526 + H1x3_3 ;
   H1x3_4  =    -0.04357875847579 + H1x3_4 ;
   H1x3_5  =      0.8612643972197 + H1x3_5 ;
   H1x3_6  =    -1.88380703730164 + H1x3_6 ;
   H1x3_7  = 0;
   _MAX_ = MAX (H1x3_1 , H1x3_2 , H1x3_3 , H1x3_4 , H1x3_5 , H1x3_6 , H1x3_7
         );
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
   H1x3_7  = EXP(H1x3_7  - _MAX_);
   _SUM_ = _SUM_ + H1x3_7 ;
   H1x3_1  = H1x3_1  / _SUM_;
   H1x3_2  = H1x3_2  / _SUM_;
   H1x3_3  = H1x3_3  / _SUM_;
   H1x3_4  = H1x3_4  / _SUM_;
   H1x3_5  = H1x3_5  / _SUM_;
   H1x3_6  = H1x3_6  / _SUM_;
   H1x3_7  = H1x3_7  / _SUM_;
END;
ELSE DO;
   H1x3_1  = .;
   H1x3_2  = .;
   H1x3_3  = .;
   H1x3_4  = .;
   H1x3_5  = .;
   H1x3_6  = .;
   H1x3_7  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -0.95656178134917 * H1x1_1  +     1.37796748135739 * H1x1_2
          +     1.78756036673938 * H1x1_3  +     -0.8439546201475 * H1x1_4
          +    -1.03166099242293 * H1x1_5  +     0.52943703441707 * H1x1_6
          +     0.59795148287931 * H1x1_7 ;
   H2x1_2  =     1.91190798936382 * H1x1_1  +      -0.175949167006 * H1x1_2
          +    -0.20010954623703 * H1x1_3  +    -1.12168184279533 * H1x1_4
          +     0.35517508917627 * H1x1_5  +    -0.45519619936571 * H1x1_6
          +     1.08432924744886 * H1x1_7 ;
   H2x1_3  =    -0.27236838695598 * H1x1_1  +     2.63546136140352 * H1x1_2
          +     1.80045649255758 * H1x1_3  +    -2.98830892061373 * H1x1_4
          +    -2.46045881589621 * H1x1_5  +     3.22396803549708 * H1x1_6
          +    -2.34667330067152 * H1x1_7 ;
   H2x1_4  =    -3.13210205675036 * H1x1_1  +     3.91450403558871 * H1x1_2
          +       4.933279615521 * H1x1_3  +    -2.59282514986249 * H1x1_4
          +    -2.03653671740081 * H1x1_5  +       4.064405082461 * H1x1_6
          +    -2.60526325926954 * H1x1_7 ;
   H2x1_5  =    -0.63232084982839 * H1x1_1  +     0.33718773947492 * H1x1_2
          +     1.29296448887546 * H1x1_3  +     1.12889621039023 * H1x1_4
          +     2.18934908118237 * H1x1_5  +     0.87862098785892 * H1x1_6
          +     0.91832061749569 * H1x1_7 ;
   H2x1_6  =     1.81043244413035 * H1x1_1  +      1.4777958998418 * H1x1_2
          +     2.53190667102186 * H1x1_3  +      0.4670787906688 * H1x1_4
          +    -0.00303664790933 * H1x1_5  +     0.21078497178324 * H1x1_6
          +     0.34792900678934 * H1x1_7 ;
   H2x1_7  =      2.7297431384039 * H1x1_1  +    -1.30829815853208 * H1x1_2
          +    -0.74317234707744 * H1x1_3  +     0.02621795882884 * H1x1_4
          +     1.92641283593631 * H1x1_5  +     0.32006968332264 * H1x1_6
          +     0.87129000431049 * H1x1_7 ;
   H2x1_1  = H2x1_1  +     -2.1938127062121 * H1x2_1
          +     0.21780666650637 * H1x2_2  +    -0.59195589593425 * H1x2_3
          +     0.38436245185742 * H1x2_4  +     0.62573807049092 * H1x2_5
          +    -0.61319348011502 * H1x2_6  +     0.47203210338015 * H1x2_7 ;
   H2x1_2  = H2x1_2  +    -0.26087177829438 * H1x2_1
          +      1.5809361009025 * H1x2_2  +     1.48270435958935 * H1x2_3
          +    -0.08943866833208 * H1x2_4  +     1.06601866330059 * H1x2_5
          +     0.65908674086625 * H1x2_6  +    -0.41138217409507 * H1x2_7 ;
   H2x1_3  = H2x1_3  +     0.38416253176813 * H1x2_1
          +    -0.18005172775158 * H1x2_2  +    -0.64477973121074 * H1x2_3
          +    -0.89326621554735 * H1x2_4  +     2.10808351608759 * H1x2_5
          +    -0.79701502540522 * H1x2_6  +     0.12564972289045 * H1x2_7 ;
   H2x1_4  = H2x1_4  +     0.45607666975085 * H1x2_1
          +     0.66281103175614 * H1x2_2  +     -2.2042052849244 * H1x2_3
          +    -0.88338513539567 * H1x2_4  +      0.8444719755129 * H1x2_5
          +    -1.34699546034909 * H1x2_6  +    -0.92256004986079 * H1x2_7 ;
   H2x1_5  = H2x1_5  +    -1.36966827041497 * H1x2_1
          +    -0.50899589190563 * H1x2_2  +    -1.06117764109728 * H1x2_3
          +    -0.15325014700397 * H1x2_4  +     0.77845029985607 * H1x2_5
          +     0.15661838238861 * H1x2_6  +    -1.46533717081069 * H1x2_7 ;
   H2x1_6  = H2x1_6  +    -1.39055542164691 * H1x2_1
          +    -0.58359991825266 * H1x2_2  +     1.77147289208184 * H1x2_3
          +    -0.35342441714416 * H1x2_4  +     0.33680205236698 * H1x2_5
          +    -0.30165800401137 * H1x2_6  +    -1.49792110543314 * H1x2_7 ;
   H2x1_7  = H2x1_7  +     0.20334369322498 * H1x2_1
          +    -0.56117684469389 * H1x2_2  +     1.27451151893116 * H1x2_3
          +    -0.39759641471947 * H1x2_4  +    -0.48424888739695 * H1x2_5
          +      0.5776601194378 * H1x2_6  +    -0.11343742791086 * H1x2_7 ;
   H2x1_1  = H2x1_1  +    -0.06990804266869 * H1x3_1
          +     1.59179747886577 * H1x3_2  +     -0.3658160611529 * H1x3_3
          +    -0.16177521959465 * H1x3_4  +     0.23353693967535 * H1x3_5
          +     0.96164596504173 * H1x3_6  +    -0.49996390114171 * H1x3_7 ;
   H2x1_2  = H2x1_2  +    -1.34775541988885 * H1x3_1
          +    -0.94185062200477 * H1x3_2  +     2.40002799790884 * H1x3_3
          +      1.3228491036493 * H1x3_4  +    -2.27212522601702 * H1x3_5
          +     0.22676652176348 * H1x3_6  +     0.96810343094913 * H1x3_7 ;
   H2x1_3  = H2x1_3  +    -0.68382731119741 * H1x3_1
          +    -0.90388882694092 * H1x3_2  +     0.51668393396039 * H1x3_3
          +     0.45716345972756 * H1x3_4  +    -0.49320936872992 * H1x3_5
          +     0.11919896076076 * H1x3_6  +    -0.14288859595709 * H1x3_7 ;
   H2x1_4  = H2x1_4  +    -0.68614915242276 * H1x3_1
          +     0.55556081003484 * H1x3_2  +     0.26058803548386 * H1x3_3
          +     0.44653924204999 * H1x3_4  +    -0.97704608173388 * H1x3_5
          +    -0.04291306465274 * H1x3_6  +    -0.70203538063923 * H1x3_7 ;
   H2x1_5  = H2x1_5  +     0.58123765973845 * H1x3_1
          +     0.48842685419846 * H1x3_2  +     1.59951720976688 * H1x3_3
          +     0.39804915100427 * H1x3_4  +    -0.47629764750379 * H1x3_5
          +    -1.56133001160202 * H1x3_6  +     1.12232825939123 * H1x3_7 ;
   H2x1_6  = H2x1_6  +    -0.35903530664944 * H1x3_1
          +    -1.21870303791063 * H1x3_2  +     -0.0358958118983 * H1x3_3
          +     1.71577031345204 * H1x3_4  +    -0.29111463093854 * H1x3_5
          +    -1.77383444462785 * H1x3_6  +    -0.93379473274206 * H1x3_7 ;
   H2x1_7  = H2x1_7  +     0.79356954272121 * H1x3_1
          +    -2.23344635077437 * H1x3_2  +     0.01459894574902 * H1x3_3
          +    -1.76556734796059 * H1x3_4  +     0.55679401249834 * H1x3_5
          +    -0.00867866380584 * H1x3_6  +     1.61311341603142 * H1x3_7 ;
   H2x1_1  =     0.45495097945606 + H2x1_1 ;
   H2x1_2  =    -0.00150409200191 + H2x1_2 ;
   H2x1_3  =     0.06766385008662 + H2x1_3 ;
   H2x1_4  =    -0.15767488957433 + H2x1_4 ;
   H2x1_5  =     3.00862692955968 + H2x1_5 ;
   H2x1_6  =     1.46151036473661 + H2x1_6 ;
   H2x1_7  =    -1.14350195577506 + H2x1_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
   H2x1_6  = 1.0 / (1.0 + EXP(MIN( - H2x1_6 , _EXP_BAR)));
   H2x1_7  = 1.0 / (1.0 + EXP(MIN( - H2x1_7 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
   H2x1_7  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     -0.6098073780758 * H1x1_1  +    -0.36212005078054 * H1x1_2
          +     0.06355695656592 * H1x1_3  +     0.42978415336514 * H1x1_4
          +     1.73171637681701 * H1x1_5  +    -0.19499247120261 * H1x1_6
          +     0.74015079276747 * H1x1_7 ;
   H2x2_2  =     0.94291268086892 * H1x1_1  +    -0.57821086705904 * H1x1_2
          +     1.78126629448091 * H1x1_3  +    -1.19267460568433 * H1x1_4
          +    -0.23111688249081 * H1x1_5  +     0.48499259969431 * H1x1_6
          +    -1.56999349458897 * H1x1_7 ;
   H2x2_3  =    -0.83943846185187 * H1x1_1  +     0.07494097035466 * H1x1_2
          +    -0.22510824455886 * H1x1_3  +     0.73702100581613 * H1x1_4
          +     0.84717434356729 * H1x1_5  +      1.1890648131813 * H1x1_6
          +    -0.69985750736721 * H1x1_7 ;
   H2x2_4  =     1.34186573490327 * H1x1_1  +     0.10476556384336 * H1x1_2
          +    -0.07073923857851 * H1x1_3  +     0.49865386241422 * H1x1_4
          +     1.20386613863792 * H1x1_5  +     0.13033316874168 * H1x1_6
          +     0.36095712511699 * H1x1_7 ;
   H2x2_5  =     0.18683850895928 * H1x1_1  +     0.14087720385762 * H1x1_2
          +     0.39026989292984 * H1x1_3  +     0.40839626117338 * H1x1_4
          +     0.17816964710989 * H1x1_5  +     0.64340089705428 * H1x1_6
          +    -1.27363167094111 * H1x1_7 ;
   H2x2_6  =     0.67895838050616 * H1x1_1  +     0.23794862788395 * H1x1_2
          +     1.47625698143483 * H1x1_3  +    -0.78874578699705 * H1x1_4
          +     0.11576168045678 * H1x1_5  +     0.44470888441177 * H1x1_6
          +     1.87629961612594 * H1x1_7 ;
   H2x2_7  =     0.68721855914482 * H1x1_1  +    -0.49548906059129 * H1x1_2
          +    -0.95479435424814 * H1x1_3  +    -0.39636357013457 * H1x1_4
          +     1.05784760554335 * H1x1_5  +     0.55302681608178 * H1x1_6
          +     0.46646041474723 * H1x1_7 ;
   H2x2_1  = H2x2_1  +    -0.27434389803517 * H1x2_1
          +    -0.02074671287693 * H1x2_2  +    -1.51155778758517 * H1x2_3
          +    -1.19011584420542 * H1x2_4  +     -0.8540083688408 * H1x2_5
          +    -0.51772310023527 * H1x2_6  +     -0.0192399267251 * H1x2_7 ;
   H2x2_2  = H2x2_2  +      -1.312525087163 * H1x2_1
          +     1.19175487774401 * H1x2_2  +    -1.10903746388023 * H1x2_3
          +      0.2627511726941 * H1x2_4  +    -1.49474705736936 * H1x2_5
          +     0.79354329450131 * H1x2_6  +    -0.48676510074213 * H1x2_7 ;
   H2x2_3  = H2x2_3  +     0.36715282986404 * H1x2_1
          +    -1.54691354420052 * H1x2_2  +     0.58334429972967 * H1x2_3
          +     3.32026929025218 * H1x2_4  +     0.08578287392048 * H1x2_5
          +     0.66591130534429 * H1x2_6  +     0.57559013181145 * H1x2_7 ;
   H2x2_4  = H2x2_4  +     1.28239253398808 * H1x2_1
          +     0.06662925242621 * H1x2_2  +     0.49967984015316 * H1x2_3
          +     0.65508978056742 * H1x2_4  +    -0.28141359636508 * H1x2_5
          +    -0.11787887977724 * H1x2_6  +     -0.6607325871171 * H1x2_7 ;
   H2x2_5  = H2x2_5  +    -0.49511046906315 * H1x2_1
          +    -1.88759923025868 * H1x2_2  +    -0.99578805432186 * H1x2_3
          +     0.47300607025135 * H1x2_4  +     0.73725488149784 * H1x2_5
          +     0.56107930260304 * H1x2_6  +     -0.6618265083723 * H1x2_7 ;
   H2x2_6  = H2x2_6  +    -0.56511063846684 * H1x2_1
          +      0.1682036403191 * H1x2_2  +     -0.7835100270482 * H1x2_3
          +    -0.05926261017522 * H1x2_4  +     0.28303530518131 * H1x2_5
          +     1.57291802723543 * H1x2_6  +    -1.59403373749444 * H1x2_7 ;
   H2x2_7  = H2x2_7  +    -1.06397759700592 * H1x2_1
          +    -0.21206214531111 * H1x2_2  +     1.52697813698804 * H1x2_3
          +    -0.03132126915438 * H1x2_4  +     0.11910805580916 * H1x2_5
          +     1.03394382602734 * H1x2_6  +    -0.28139834412941 * H1x2_7 ;
   H2x2_1  = H2x2_1  +    -1.18028681022903 * H1x3_1
          +    -0.56354962807969 * H1x3_2  +    -0.32071823564038 * H1x3_3
          +    -1.14868021494554 * H1x3_4  +     0.50491385711883 * H1x3_5
          +      0.3595638799915 * H1x3_6  +    -1.04253859844314 * H1x3_7 ;
   H2x2_2  = H2x2_2  +     1.10237781244945 * H1x3_1
          +     1.08171284637926 * H1x3_2  +     0.51153068676713 * H1x3_3
          +     -0.0106772728333 * H1x3_4  +     0.21777593557961 * H1x3_5
          +     0.10772516691825 * H1x3_6  +    -0.91346091248416 * H1x3_7 ;
   H2x2_3  = H2x2_3  +    -0.71132206215234 * H1x3_1
          +     0.60006902706544 * H1x3_2  +      -0.471170925786 * H1x3_3
          +     0.07477379311969 * H1x3_4  +    -0.34034195429991 * H1x3_5
          +     1.63429052967629 * H1x3_6  +     0.13697740143754 * H1x3_7 ;
   H2x2_4  = H2x2_4  +     0.76338339806809 * H1x3_1
          +     0.34600443003632 * H1x3_2  +    -0.60707577837208 * H1x3_3
          +     1.37001034857478 * H1x3_4  +    -1.24749521510775 * H1x3_5
          +    -1.45784349983015 * H1x3_6  +     0.12879195100917 * H1x3_7 ;
   H2x2_5  = H2x2_5  +    -2.33392280718246 * H1x3_1
          +    -0.48123076018945 * H1x3_2  +    -0.76638732765894 * H1x3_3
          +    -1.76560846551209 * H1x3_4  +     1.62249911960883 * H1x3_5
          +    -0.31271093507345 * H1x3_6  +    -0.34748800562391 * H1x3_7 ;
   H2x2_6  = H2x2_6  +     0.53202536648562 * H1x3_1
          +     0.36605088046069 * H1x3_2  +     -1.7626773020241 * H1x3_3
          +     0.14681062331369 * H1x3_4  +     0.10699108516053 * H1x3_5
          +     2.24609371442936 * H1x3_6  +    -0.59076884674419 * H1x3_7 ;
   H2x2_7  = H2x2_7  +    -0.05290923023086 * H1x3_1
          +    -0.30472796298249 * H1x3_2  +     1.89100111779461 * H1x3_3
          +     0.51110284119421 * H1x3_4  +     -0.2014479939412 * H1x3_5
          +     1.02507111515379 * H1x3_6  +    -0.63211120065975 * H1x3_7 ;
   H2x2_1  =    -2.15023760884419 + H2x2_1 ;
   H2x2_2  =    -1.03542203438136 + H2x2_2 ;
   H2x2_3  =    -1.03202542428687 + H2x2_3 ;
   H2x2_4  =     0.79380822765375 + H2x2_4 ;
   H2x2_5  =    -0.37637686056399 + H2x2_5 ;
   H2x2_6  =    -0.12032383488066 + H2x2_6 ;
   H2x2_7  =     0.84544057856735 + H2x2_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x2_1  = 1.0 / (1.0 + EXP(MIN( - H2x2_1 , _EXP_BAR)));
   H2x2_2  = 1.0 / (1.0 + EXP(MIN( - H2x2_2 , _EXP_BAR)));
   H2x2_3  = 1.0 / (1.0 + EXP(MIN( - H2x2_3 , _EXP_BAR)));
   H2x2_4  = 1.0 / (1.0 + EXP(MIN( - H2x2_4 , _EXP_BAR)));
   H2x2_5  = 1.0 / (1.0 + EXP(MIN( - H2x2_5 , _EXP_BAR)));
   H2x2_6  = 1.0 / (1.0 + EXP(MIN( - H2x2_6 , _EXP_BAR)));
   H2x2_7  = 1.0 / (1.0 + EXP(MIN( - H2x2_7 , _EXP_BAR)));
END;
ELSE DO;
   H2x2_1  = .;
   H2x2_2  = .;
   H2x2_3  = .;
   H2x2_4  = .;
   H2x2_5  = .;
   H2x2_6  = .;
   H2x2_7  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =    -0.90634182479211 * H2x1_1  +    -0.09135307681655 * H2x1_2
          +     -1.1697186659188 * H2x1_3  +    -1.58089509972168 * H2x1_4
          +    -0.36298075828987 * H2x1_5  +     -0.1512750341775 * H2x1_6
          +    -0.95333639415651 * H2x1_7 ;
   H3x1_2  =     0.55686365647701 * H2x1_1  +      1.5696753982442 * H2x1_2
          +    -0.32250855602992 * H2x1_3  +     0.19455668370146 * H2x1_4
          +     0.44351097086868 * H2x1_5  +     0.27358852097745 * H2x1_6
          +      0.4281879736941 * H2x1_7 ;
   H3x1_3  =     0.12633341645489 * H2x1_1  +    -0.66899185238366 * H2x1_2
          +    -2.56536949854372 * H2x1_3  +    -1.44702955697377 * H2x1_4
          +    -2.12726548877297 * H2x1_5  +     0.98860110338896 * H2x1_6
          +    -1.81290069415788 * H2x1_7 ;
   H3x1_4  =     -1.5244883189849 * H2x1_1  +     -0.8795974458787 * H2x1_2
          +    -0.90961705850703 * H2x1_3  +    -0.41256891447907 * H2x1_4
          +    -1.55913982799805 * H2x1_5  +     -0.9171280329681 * H2x1_6
          +    -0.70506147827449 * H2x1_7 ;
   H3x1_5  =     0.35217616707387 * H2x1_1  +    -1.16700891298034 * H2x1_2
          +      0.5371834401358 * H2x1_3  +     2.90147333104132 * H2x1_4
          +     0.77800792666349 * H2x1_5  +     0.78250225671691 * H2x1_6
          +    -0.59091463760785 * H2x1_7 ;
   H3x1_6  =    -0.44929632444778 * H2x1_1  +    -0.78833736143978 * H2x1_2
          +    -2.25458905584756 * H2x1_3  +    -1.94571232358746 * H2x1_4
          +     1.80055450278469 * H2x1_5  +     1.56927477052283 * H2x1_6
          +     0.56206783006188 * H2x1_7 ;
   H3x1_1  = H3x1_1  +    -1.50414812258238 * H2x2_1
          +     2.71183535634521 * H2x2_2  +     0.92780495410356 * H2x2_3
          +     1.94819401410825 * H2x2_4  +     0.85505273909828 * H2x2_5
          +    -0.66540689026991 * H2x2_6  +    -0.32749055872531 * H2x2_7 ;
   H3x1_2  = H3x1_2  +     0.55540470737424 * H2x2_1
          +    -1.17598972209898 * H2x2_2  +    -0.16619065810258 * H2x2_3
          +    -0.58955298520043 * H2x2_4  +     1.04029871696373 * H2x2_5
          +    -0.71430896416332 * H2x2_6  +    -1.57031773170963 * H2x2_7 ;
   H3x1_3  = H3x1_3  +    -1.83796456414338 * H2x2_1
          +     1.49146311784803 * H2x2_2  +     0.05550989818961 * H2x2_3
          +    -0.08016006878981 * H2x2_4  +    -1.41328284571945 * H2x2_5
          +    -0.58920642563444 * H2x2_6  +     1.30950353008631 * H2x2_7 ;
   H3x1_4  = H3x1_4  +     0.91384399854626 * H2x2_1
          +     -0.0377841204978 * H2x2_2  +     0.67274196472005 * H2x2_3
          +     0.76900504900432 * H2x2_4  +     0.71823373480501 * H2x2_5
          +    -0.04199535362683 * H2x2_6  +    -0.23501610033448 * H2x2_7 ;
   H3x1_5  = H3x1_5  +    -0.06769558303335 * H2x2_1
          +    -0.95662890382057 * H2x2_2  +    -0.56314830579562 * H2x2_3
          +    -0.17355939108245 * H2x2_4  +     0.49684441057813 * H2x2_5
          +    -0.27220440010331 * H2x2_6  +     1.13747855812864 * H2x2_7 ;
   H3x1_6  = H3x1_6  +    -0.58306849781773 * H2x2_1
          +    -1.96921645645113 * H2x2_2  +     0.09529919260054 * H2x2_3
          +     1.84321935581989 * H2x2_4  +     1.90621049776113 * H2x2_5
          +     0.22735961476244 * H2x2_6  +      1.7681869270915 * H2x2_7 ;
   H3x1_1  =     0.84072071725045 + H3x1_1 ;
   H3x1_2  =    -0.84331420680493 + H3x1_2 ;
   H3x1_3  =    -1.15131491327763 + H3x1_3 ;
   H3x1_4  =    -0.56905094914727 + H3x1_4 ;
   H3x1_5  =     1.29747074025762 + H3x1_5 ;
   H3x1_6  =     1.70771922783336 + H3x1_6 ;
   H3x1_7  = 0;
   _MAX_ = MAX (H3x1_1 , H3x1_2 , H3x1_3 , H3x1_4 , H3x1_5 , H3x1_6 , H3x1_7
         );
   _SUM_ = 0.;
   H3x1_1  = EXP(H3x1_1  - _MAX_);
   _SUM_ = _SUM_ + H3x1_1 ;
   H3x1_2  = EXP(H3x1_2  - _MAX_);
   _SUM_ = _SUM_ + H3x1_2 ;
   H3x1_3  = EXP(H3x1_3  - _MAX_);
   _SUM_ = _SUM_ + H3x1_3 ;
   H3x1_4  = EXP(H3x1_4  - _MAX_);
   _SUM_ = _SUM_ + H3x1_4 ;
   H3x1_5  = EXP(H3x1_5  - _MAX_);
   _SUM_ = _SUM_ + H3x1_5 ;
   H3x1_6  = EXP(H3x1_6  - _MAX_);
   _SUM_ = _SUM_ + H3x1_6 ;
   H3x1_7  = EXP(H3x1_7  - _MAX_);
   _SUM_ = _SUM_ + H3x1_7 ;
   H3x1_1  = H3x1_1  / _SUM_;
   H3x1_2  = H3x1_2  / _SUM_;
   H3x1_3  = H3x1_3  / _SUM_;
   H3x1_4  = H3x1_4  / _SUM_;
   H3x1_5  = H3x1_5  / _SUM_;
   H3x1_6  = H3x1_6  / _SUM_;
   H3x1_7  = H3x1_7  / _SUM_;
END;
ELSE DO;
   H3x1_1  = .;
   H3x1_2  = .;
   H3x1_3  = .;
   H3x1_4  = .;
   H3x1_5  = .;
   H3x1_6  = .;
   H3x1_7  = .;
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
   P_DepVar1  =    -10.5125772193731 * H3x1_1  +     0.35682915649078 * H3x1_2
          +    -0.04349805114958 * H3x1_3  +    -0.04491244667008 * H3x1_4
          +     34.5477259369591 * H3x1_5  +    -16.5063579573423 * H3x1_6
          +     0.83421675743806 * H3x1_7 ;
   P_DepVar1  =     6.85864742009761 + P_DepVar1 ;
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
drop S_:;
