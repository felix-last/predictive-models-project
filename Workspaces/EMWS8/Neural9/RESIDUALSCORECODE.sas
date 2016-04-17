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

      label S_Kidhome = 'Standard: Kidhome' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntFishProducts = 'Standard: MntFishProducts' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumCatalogPurchases = 'Standard: NumCatalogPurchases' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_NumStorePurchases = 'Standard: NumStorePurchases' ;

      label S_NumWebPurchases = 'Standard: NumWebPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label AcceptedCmp10 = 'Dummy: AcceptedCmp1=0' ;

      label AcceptedCmp20 = 'Dummy: AcceptedCmp2=0' ;

      label AcceptedCmp30 = 'Dummy: AcceptedCmp3=0' ;

      label AcceptedCmp40 = 'Dummy: AcceptedCmp4=0' ;

      label AcceptedCmp50 = 'Dummy: AcceptedCmp5=0' ;

      label Complain0 = 'Dummy: Complain=0' ;

      label HigherEducationBinary0 = 'Dummy: HigherEducationBinary=0' ;

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

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for AcceptedCmp1 ;
drop AcceptedCmp10 ;
if missing( AcceptedCmp1 ) then do;
   AcceptedCmp10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp1 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp10 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp10 = -1;
   end;
   else do;
      AcceptedCmp10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp2 ;
drop AcceptedCmp20 ;
if missing( AcceptedCmp2 ) then do;
   AcceptedCmp20 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp2 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp20 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp20 = -1;
   end;
   else do;
      AcceptedCmp20 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp3 ;
drop AcceptedCmp30 ;
if missing( AcceptedCmp3 ) then do;
   AcceptedCmp30 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp3 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp30 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp30 = -1;
   end;
   else do;
      AcceptedCmp30 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp4 ;
drop AcceptedCmp40 ;
if missing( AcceptedCmp4 ) then do;
   AcceptedCmp40 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp4 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp40 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp40 = -1;
   end;
   else do;
      AcceptedCmp40 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for AcceptedCmp5 ;
drop AcceptedCmp50 ;
if missing( AcceptedCmp5 ) then do;
   AcceptedCmp50 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( AcceptedCmp5 , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      AcceptedCmp50 = 1;
   end;
   else if _dm12 = '1'  then do;
      AcceptedCmp50 = -1;
   end;
   else do;
      AcceptedCmp50 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Complain ;
drop Complain0 ;
if missing( Complain ) then do;
   Complain0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Complain , BEST. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      Complain0 = 1;
   end;
   else if _dm12 = '1'  then do;
      Complain0 = -1;
   end;
   else do;
      Complain0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for HigherEducationBinary ;
drop HigherEducationBinary0 ;
if missing( HigherEducationBinary ) then do;
   HigherEducationBinary0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( HigherEducationBinary , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      HigherEducationBinary0 = -1;
   end;
   else if _dm12 = '0'  then do;
      HigherEducationBinary0 = 1;
   end;
   else do;
      HigherEducationBinary0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

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
   Kidhome , 
   Mnt , 
   MntFishProducts , 
   MntFruits , 
   MntGoldProds , 
   MntMeatProducts , 
   MntSweetProducts , 
   MntWines , 
   NumCatalogPurchases , 
   NumDealsPurchases , 
   NumDistPurchases , 
   NumStorePurchases , 
   NumWebPurchases , 
   NumWebVisitsMonth , 
   RFMstat , 
   Recency , 
   Teenhome   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntFishProducts  =    -0.69884925989448 +     0.01914942799914 * 
        MntFishProducts ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumCatalogPurchases  =     -0.9539494374694 +     0.36073207463401 * 
        NumCatalogPurchases ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 * 
        NumDistPurchases ;
   S_NumStorePurchases  =    -1.81825213465822 +     0.30716078899015 * 
        NumStorePurchases ;
   S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 * 
        NumWebPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   IF MISSING( Kidhome ) THEN S_Kidhome  = . ;
   ELSE S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntFishProducts ) THEN S_MntFishProducts  = . ;
   ELSE S_MntFishProducts  =    -0.69884925989448 +     0.01914942799914 * 
        MntFishProducts ;
   IF MISSING( MntFruits ) THEN S_MntFruits  = . ;
   ELSE S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits
         ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 * 
        MntMeatProducts ;
   IF MISSING( MntSweetProducts ) THEN S_MntSweetProducts  = . ;
   ELSE S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumCatalogPurchases ) THEN S_NumCatalogPurchases  = . ;
   ELSE S_NumCatalogPurchases
          =     -0.9539494374694 +     0.36073207463401 * NumCatalogPurchases
         ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 * 
        NumDistPurchases ;
   IF MISSING( NumStorePurchases ) THEN S_NumStorePurchases  = . ;
   ELSE S_NumStorePurchases  =    -1.81825213465822 +     0.30716078899015 * 
        NumStorePurchases ;
   IF MISSING( NumWebPurchases ) THEN S_NumWebPurchases  = . ;
   ELSE S_NumWebPurchases  =    -1.56492430992034 +     0.38256928346729 * 
        NumWebPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   IF MISSING( Teenhome ) THEN S_Teenhome  = . ;
   ELSE S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.43912775344039 * S_AcceptedCmpTotal  +     0.15324285507227 * 
        S_Kidhome  +     0.02569219772928 * S_Mnt  +     0.22132183806169 * 
        S_MntFishProducts  +    -0.06337563896219 * S_MntFruits
          +      0.0657331004553 * S_MntGoldProds  +     0.80090124687167 * 
        S_MntMeatProducts  +     0.09182621620999 * S_MntSweetProducts
          +    -0.41629315832186 * S_MntWines  +     0.39665915225092 * 
        S_NumCatalogPurchases  +     0.35456089035071 * S_NumDealsPurchases
          +     0.24337801999461 * S_NumDistPurchases
          +    -0.81198839661616 * S_NumStorePurchases
          +    -0.41689687433747 * S_NumWebPurchases
          +     0.48849235469028 * S_NumWebVisitsMonth
          +     0.27825597215948 * S_RFMstat  +    -0.88374261044519 * 
        S_Recency  +    -0.02773716219523 * S_Teenhome ;
   H12  =     0.07434104162353 * S_AcceptedCmpTotal  +    -0.03195098726594 * 
        S_Kidhome  +     0.01543386863542 * S_Mnt  +     0.12485525017443 * 
        S_MntFishProducts  +    -0.30946247800427 * S_MntFruits
          +    -0.01203402973786 * S_MntGoldProds  +     0.63100948725324 * 
        S_MntMeatProducts  +    -0.22236382332547 * S_MntSweetProducts
          +    -0.34774748026941 * S_MntWines  +     0.44473136951588 * 
        S_NumCatalogPurchases  +     0.62678568949617 * S_NumDealsPurchases
          +    -0.31385132988744 * S_NumDistPurchases
          +    -0.40280836861804 * S_NumStorePurchases
          +    -0.48794669697044 * S_NumWebPurchases
          +     0.72338984901279 * S_NumWebVisitsMonth
          +     0.23547214976166 * S_RFMstat  +     -0.6164747614748 * 
        S_Recency  +     0.04790780856477 * S_Teenhome ;
   H13  =    -0.63820214578159 * S_AcceptedCmpTotal  +     0.49904086064338 * 
        S_Kidhome  +     0.13139593987479 * S_Mnt  +     0.18642565416238 * 
        S_MntFishProducts  +     0.14097505415753 * S_MntFruits
          +    -0.06937869906897 * S_MntGoldProds  +    -0.44490405662638 * 
        S_MntMeatProducts  +     0.03747875754721 * S_MntSweetProducts
          +     0.61023960214888 * S_MntWines  +    -0.66633431715473 * 
        S_NumCatalogPurchases  +    -0.17986683579301 * S_NumDealsPurchases
          +    -0.22919354561837 * S_NumDistPurchases
          +     0.48900512750371 * S_NumStorePurchases
          +     0.63563236542104 * S_NumWebPurchases
          +    -1.24241302949211 * S_NumWebVisitsMonth
          +    -0.04477686111233 * S_RFMstat  +      1.2888939271922 * 
        S_Recency  +      0.4139068327639 * S_Teenhome ;
   H14  =     0.48105826056294 * S_AcceptedCmpTotal  +    -0.42248585066001 * 
        S_Kidhome  +    -0.07174155418099 * S_Mnt  +    -0.42778960343462 * 
        S_MntFishProducts  +     0.09779975165182 * S_MntFruits
          +     0.02450574144035 * S_MntGoldProds  +     0.84681198347991 * 
        S_MntMeatProducts  +    -0.23934138256418 * S_MntSweetProducts
          +     0.10825550313301 * S_MntWines  +     0.13496669006169 * 
        S_NumCatalogPurchases  +    -0.07641504001178 * S_NumDealsPurchases
          +     0.57486886714013 * S_NumDistPurchases
          +    -0.01439167006681 * S_NumStorePurchases
          +    -0.22502024795489 * S_NumWebPurchases
          +     0.31403814101947 * S_NumWebVisitsMonth
          +     0.06121982713427 * S_RFMstat  +    -0.66476823891241 * 
        S_Recency  +     -0.4404721787316 * S_Teenhome ;
   H15  =    -0.01000128129385 * S_AcceptedCmpTotal  +     0.06375204613433 * 
        S_Kidhome  +    -0.05376216682906 * S_Mnt  +    -0.08473670073828 * 
        S_MntFishProducts  +     0.13371751007328 * S_MntFruits
          +     0.11259736161219 * S_MntGoldProds  +     0.03735647266983 * 
        S_MntMeatProducts  +    -0.12544959729848 * S_MntSweetProducts
          +     0.17571980400351 * S_MntWines  +    -0.09289650416254 * 
        S_NumCatalogPurchases  +    -0.13579396915412 * S_NumDealsPurchases
          +    -0.18997260805501 * S_NumDistPurchases
          +     0.29468211427777 * S_NumStorePurchases
          +     0.17132038178189 * S_NumWebPurchases
          +    -0.19708361532263 * S_NumWebVisitsMonth
          +     0.38006918721363 * S_RFMstat  +     0.23377164556017 * 
        S_Recency  +    -0.00205417580177 * S_Teenhome ;
   H16  =     0.17294085934065 * S_AcceptedCmpTotal  +    -0.39698389286699 * 
        S_Kidhome  +    -0.13545797896515 * S_Mnt  +    -0.12002803153381 * 
        S_MntFishProducts  +    -0.11507127001045 * S_MntFruits
          +    -0.12266840134948 * S_MntGoldProds  +    -0.45452045159312 * 
        S_MntMeatProducts  +     0.00553267509866 * S_MntSweetProducts
          +    -0.15768353487074 * S_MntWines  +    -0.72223742588038 * 
        S_NumCatalogPurchases  +    -0.42741922123767 * S_NumDealsPurchases
          +    -0.74097227246314 * S_NumDistPurchases
          +     0.06550389451608 * S_NumStorePurchases
          +     0.23777098322244 * S_NumWebPurchases
          +    -0.14585163604726 * S_NumWebVisitsMonth
          +    -0.39028525061866 * S_RFMstat  +     0.07130869316282 * 
        S_Recency  +    -0.00401659472541 * S_Teenhome ;
   H11  = H11  +    -0.02007476396722 * AcceptedCmp10
          +     0.09720288796707 * AcceptedCmp20  +     0.11205658872251 * 
        AcceptedCmp30  +    -0.13511778770753 * AcceptedCmp40
          +    -0.26504356137187 * AcceptedCmp50  +     0.03201227673285 * 
        Complain0  +    -0.15566647786045 * HigherEducationBinary0 ;
   H12  = H12  +    -0.52595746088087 * AcceptedCmp10
          +    -0.15041757209085 * AcceptedCmp20  +    -0.48938205246808 * 
        AcceptedCmp30  +     -0.1982121209098 * AcceptedCmp40
          +    -0.45745206981227 * AcceptedCmp50  +    -0.24421059586296 * 
        Complain0  +     -0.0372485515029 * HigherEducationBinary0 ;
   H13  = H13  +    -0.02992554536875 * AcceptedCmp10
          +     0.20420421321169 * AcceptedCmp20  +     0.17676273529469 * 
        AcceptedCmp30  +     -0.1875050368358 * AcceptedCmp40
          +     0.44580716573032 * AcceptedCmp50  +     -0.3702812451724 * 
        Complain0  +     0.07192397780717 * HigherEducationBinary0 ;
   H14  = H14  +    -0.24903976363288 * AcceptedCmp10
          +    -0.33252849654907 * AcceptedCmp20  +    -0.01800268234049 * 
        AcceptedCmp30  +    -0.24627514089072 * AcceptedCmp40
          +    -0.00915156624914 * AcceptedCmp50  +    -0.05033360712883 * 
        Complain0  +      0.3339375399643 * HigherEducationBinary0 ;
   H15  = H15  +    -0.27519938462786 * AcceptedCmp10
          +     0.07731721526247 * AcceptedCmp20  +     0.14906574971325 * 
        AcceptedCmp30  +     0.13255042650483 * AcceptedCmp40
          +    -0.02940483359408 * AcceptedCmp50  +     0.13352278200648 * 
        Complain0  +     0.08170186393964 * HigherEducationBinary0 ;
   H16  = H16  +     0.10529304585202 * AcceptedCmp10
          +     0.31213134788133 * AcceptedCmp20  +     0.30084869783987 * 
        AcceptedCmp30  +    -0.01118871464539 * AcceptedCmp40
          +    -0.04086250638732 * AcceptedCmp50  +    -0.07837727874375 * 
        Complain0  +     0.12138365487453 * HigherEducationBinary0 ;
   H11  = H11  +     0.37637396661146 * Marital_StatusDivorced
          +    -0.26467919055845 * Marital_StatusMarried
          +     -0.0147004493608 * Marital_StatusSingle
          +    -0.34554452729743 * Marital_StatusTogether ;
   H12  = H12  +    -0.02293194383383 * Marital_StatusDivorced
          +     0.22656143769796 * Marital_StatusMarried
          +     -0.2497880429053 * Marital_StatusSingle
          +     0.00744194900473 * Marital_StatusTogether ;
   H13  = H13  +    -0.08040527368027 * Marital_StatusDivorced
          +     0.70834351124371 * Marital_StatusMarried
          +    -0.79585819567656 * Marital_StatusSingle
          +     0.83850839024957 * Marital_StatusTogether ;
   H14  = H14  +     0.05889234585558 * Marital_StatusDivorced
          +    -0.94141743088603 * Marital_StatusMarried
          +     0.86423540784285 * Marital_StatusSingle
          +     -0.6260719130207 * Marital_StatusTogether ;
   H15  = H15  +     0.19106392110706 * Marital_StatusDivorced
          +    -0.18189885719847 * Marital_StatusMarried
          +     0.36145162549083 * Marital_StatusSingle
          +    -0.26654643410008 * Marital_StatusTogether ;
   H16  = H16  +     0.08265128366103 * Marital_StatusDivorced
          +    -0.52831758614523 * Marital_StatusMarried
          +    -0.12671844940828 * Marital_StatusSingle
          +    -0.43605855534313 * Marital_StatusTogether ;
   H11  =     -1.3276216013071 + H11 ;
   H12  =    -0.00525373429217 + H12 ;
   H13  =     0.30688582916965 + H13 ;
   H14  =    -1.32677970876573 + H14 ;
   H15  =      0.7399814373424 + H15 ;
   H16  =    -1.64568358786672 + H16 ;
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
   P_DepVar1  =     1.40410400811948 * H11  +      1.6065080260622 * H12
          +    -2.28029439254425 * H13  +     2.12025707381767 * H14
          +    -0.28698895635258 * H15  +    -1.55666643166016 * H16 ;
   P_DepVar1  =    -1.08867940823404 + P_DepVar1 ;
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
