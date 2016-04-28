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
   H11  =      0.5448177358872 * S_AcceptedCmpTotal  +    -0.56918032958607 * 
        S_Frq  +     0.21060618200218 * S_Income  +    -0.40246310954349 * 
        S_Mnt  +    -0.18690574082736 * S_MntGoldProds
          +     0.83028677347709 * S_MntMeatProducts
          +     0.56366676093724 * S_NumCatalogPurchases
          +     0.63662278307649 * S_NumDealsPurchases
          +     0.45030521898264 * S_NumWebVisitsMonth
          +     0.23005584857727 * S_RFMstat  +    -0.64234820627061 * 
        S_Recency  +     0.00774462163198 * S_Teenhome
          +     0.03680161242347 * S_Year_Birth ;
   H12  =     0.66298961317118 * S_AcceptedCmpTotal  +      -0.935153223999 * 
        S_Frq  +     0.41449292848187 * S_Income  +    -1.26694271574069 * 
        S_Mnt  +     0.18765833055879 * S_MntGoldProds
          +       0.802198131853 * S_MntMeatProducts
          +     0.80699693779953 * S_NumCatalogPurchases
          +    -0.32111921080627 * S_NumDealsPurchases
          +     1.05495977150176 * S_NumWebVisitsMonth
          +    -0.03067071763188 * S_RFMstat  +    -1.14158068786273 * 
        S_Recency  +     -0.3863391299289 * S_Teenhome
          +    -0.01515301188334 * S_Year_Birth ;
   H13  =    -0.20258357169781 * S_AcceptedCmpTotal  +    -0.01927951320398 * 
        S_Frq  +     0.04768604929306 * S_Income  +     0.30271184148932 * 
        S_Mnt  +    -0.24825280571811 * S_MntGoldProds
          +     0.56634068580527 * S_MntMeatProducts
          +    -0.06012432168804 * S_NumCatalogPurchases
          +     0.00616163066885 * S_NumDealsPurchases
          +    -0.28643715149767 * S_NumWebVisitsMonth
          +    -0.21657284982294 * S_RFMstat  +    -0.11323681460779 * 
        S_Recency  +    -0.05360047278594 * S_Teenhome
          +     -0.3574952891844 * S_Year_Birth ;
   H14  =    -0.01671557172552 * S_AcceptedCmpTotal  +     0.14126480109635 * 
        S_Frq  +    -0.16542260420764 * S_Income  +    -0.02938555904655 * 
        S_Mnt  +    -0.09628993953297 * S_MntGoldProds
          +     0.29490772106233 * S_MntMeatProducts
          +    -0.37973658516518 * S_NumCatalogPurchases
          +     0.08377613406035 * S_NumDealsPurchases
          +    -0.17242298863338 * S_NumWebVisitsMonth
          +     0.24623716603984 * S_RFMstat  +     0.27333937644041 * 
        S_Recency  +    -0.00972098456963 * S_Teenhome
          +      0.0278167406933 * S_Year_Birth ;
   H15  =     0.26338443874493 * S_AcceptedCmpTotal  +    -1.05933447721817 * 
        S_Frq  +     0.15944073710657 * S_Income  +    -0.08201141214939 * 
        S_Mnt  +     0.21740350334003 * S_MntGoldProds
          +     1.25414895016379 * S_MntMeatProducts
          +     1.38122748809658 * S_NumCatalogPurchases
          +     0.28983101492886 * S_NumDealsPurchases
          +     0.34016977363062 * S_NumWebVisitsMonth
          +    -0.07539662108021 * S_RFMstat  +    -0.48223583966095 * 
        S_Recency  +    -0.21769282483378 * S_Teenhome
          +    -0.03637501600986 * S_Year_Birth ;
   H16  =    -0.02235292240802 * S_AcceptedCmpTotal  +     0.05344170585354 * 
        S_Frq  +    -0.16059837639399 * S_Income  +     -0.2016987951784 * 
        S_Mnt  +     0.10489473589715 * S_MntGoldProds
          +    -0.24223453001761 * S_MntMeatProducts
          +     0.08658296964034 * S_NumCatalogPurchases
          +    -0.12912434217806 * S_NumDealsPurchases
          +     0.20103807385888 * S_NumWebVisitsMonth
          +     0.26367670266536 * S_RFMstat  +    -0.44098166476515 * 
        S_Recency  +    -0.46051939225222 * S_Teenhome
          +    -0.03446671446496 * S_Year_Birth ;
   H17  =    -0.33265903592033 * S_AcceptedCmpTotal  +      0.8252218937614 * 
        S_Frq  +     0.41954791536781 * S_Income  +     0.46211299623005 * 
        S_Mnt  +     0.01356150389301 * S_MntGoldProds
          +    -0.44066080788477 * S_MntMeatProducts
          +    -0.50262630360787 * S_NumCatalogPurchases
          +    -0.76106916776546 * S_NumDealsPurchases
          +     -0.1148740911192 * S_NumWebVisitsMonth
          +    -0.07226607709062 * S_RFMstat  +       0.057209463183 * 
        S_Recency  +    -0.46203013614528 * S_Teenhome
          +    -0.19513280423468 * S_Year_Birth ;
   H11  = H11  +    -0.25061450597172 * Marital_StatusDivorced
          +    -0.04190107680763 * Marital_StatusMarried
          +     0.60475477366656 * Marital_StatusSingle
          +    -0.23249465504861 * Marital_StatusTogether ;
   H12  = H12  +     0.44175341112836 * Marital_StatusDivorced
          +    -1.07400114292035 * Marital_StatusMarried
          +     0.68928831262407 * Marital_StatusSingle
          +    -0.77691960068409 * Marital_StatusTogether ;
   H13  = H13  +     0.06946121372082 * Marital_StatusDivorced
          +    -0.20121339725415 * Marital_StatusMarried
          +     0.11417921391157 * Marital_StatusSingle
          +     0.09230572943508 * Marital_StatusTogether ;
   H14  = H14  +    -0.23294461421366 * Marital_StatusDivorced
          +    -0.17406326256113 * Marital_StatusMarried
          +    -0.23720358325215 * Marital_StatusSingle
          +    -0.43999719513424 * Marital_StatusTogether ;
   H15  = H15  +    -0.02489582646664 * Marital_StatusDivorced
          +     0.09754614002146 * Marital_StatusMarried
          +    -0.13004651836918 * Marital_StatusSingle
          +     0.26863820003928 * Marital_StatusTogether ;
   H16  = H16  +    -0.03288546792064 * Marital_StatusDivorced
          +     0.33991066094948 * Marital_StatusMarried
          +     0.16726714912168 * Marital_StatusSingle
          +    -0.25665070086096 * Marital_StatusTogether ;
   H17  = H17  +     0.10942200598558 * Marital_StatusDivorced
          +    -0.70406010688765 * Marital_StatusMarried
          +     0.77355395614085 * Marital_StatusSingle
          +    -0.37671922953654 * Marital_StatusTogether ;
   H11  =    -1.10989436564707 + H11 ;
   H12  =    -0.21288050694071 + H12 ;
   H13  =     0.48811938879702 + H13 ;
   H14  =    -1.71523073897191 + H14 ;
   H15  =    -0.04554136165237 + H15 ;
   H16  =    -2.78464164526225 + H16 ;
   H17  =     1.73418398166308 + H17 ;
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
   P_DepVar1  =     1.99078165508498 * H11  +     3.59667555265579 * H12
          +     0.22520578396696 * H13  +     0.07999056432817 * H14
          +     2.73336314915489 * H15  +     0.11536142898008 * H16
          +    -1.90380424208785 * H17 ;
   P_DepVar1  =    -1.65978316370044 + P_DepVar1 ;
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
