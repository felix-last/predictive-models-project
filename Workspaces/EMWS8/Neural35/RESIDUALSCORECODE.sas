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

      label H16 = 'Hidden: H1=6' ;

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
   H11  =    -0.67146426793697 * S_AcceptedCmpTotal  +     1.29995065458071 * 
        S_Frq  +     0.03391277791136 * S_Income  +     0.06144148645782 * 
        S_Mnt  +      0.1927634649657 * S_MntGoldProds
          +    -0.96539971510064 * S_MntMeatProducts
          +    -0.97523935474564 * S_NumCatalogPurchases
          +    -0.35630345207431 * S_NumDealsPurchases
          +    -0.65250840334148 * S_NumWebVisitsMonth
          +     -0.5583483273313 * S_RFMstat  +     0.92611241960409 * 
        S_Recency  +    -0.28046900231772 * S_Teenhome
          +    -0.36679552487377 * S_Year_Birth ;
   H12  =     0.01313882014444 * S_AcceptedCmpTotal  +    -0.09323632112464 * 
        S_Frq  +    -0.50844943609701 * S_Income  +     0.12669204045997 * 
        S_Mnt  +     0.07219925031793 * S_MntGoldProds
          +     0.00674486363195 * S_MntMeatProducts
          +    -0.71888988378033 * S_NumCatalogPurchases
          +    -0.05178493195796 * S_NumDealsPurchases
          +    -0.13170943250514 * S_NumWebVisitsMonth
          +     0.29728347817458 * S_RFMstat  +     0.55622398306893 * 
        S_Recency  +     0.65796567499462 * S_Teenhome
          +     0.00193686664896 * S_Year_Birth ;
   H13  =     0.20103801508012 * S_AcceptedCmpTotal  +     0.95927797553655 * 
        S_Frq  +    -0.15567014433853 * S_Income  +     1.36081245941611 * 
        S_Mnt  +     0.05809389425429 * S_MntGoldProds
          +    -0.69411784005832 * S_MntMeatProducts
          +    -1.56722173769724 * S_NumCatalogPurchases
          +    -0.89016432055901 * S_NumDealsPurchases
          +    -0.25186123136312 * S_NumWebVisitsMonth
          +    -0.18552596430516 * S_RFMstat  +    -0.00994342829979 * 
        S_Recency  +     0.31484296272338 * S_Teenhome
          +     0.32960826974016 * S_Year_Birth ;
   H14  =    -0.02188823670778 * S_AcceptedCmpTotal  +     0.27719691992625 * 
        S_Frq  +     0.38214818032822 * S_Income  +     0.23149239732903 * 
        S_Mnt  +    -0.05080446917223 * S_MntGoldProds
          +     0.12845067622428 * S_MntMeatProducts
          +    -0.16827412575583 * S_NumCatalogPurchases
          +    -0.03839124625146 * S_NumDealsPurchases
          +     -0.2367352243813 * S_NumWebVisitsMonth
          +     0.17896271610121 * S_RFMstat  +     0.00633782629695 * 
        S_Recency  +    -0.00928124461725 * S_Teenhome
          +     0.36590114390336 * S_Year_Birth ;
   H15  =     0.73569024045144 * S_AcceptedCmpTotal  +    -0.87610449778995 * 
        S_Frq  +     0.43542512371065 * S_Income  +    -1.14529245346123 * 
        S_Mnt  +     0.05618295533205 * S_MntGoldProds
          +     0.63301604773165 * S_MntMeatProducts
          +     0.42982341417504 * S_NumCatalogPurchases
          +     0.23896170370451 * S_NumDealsPurchases
          +     0.98929405444097 * S_NumWebVisitsMonth
          +     0.05471667340406 * S_RFMstat  +    -1.07690972830307 * 
        S_Recency  +    -0.05123342633437 * S_Teenhome
          +    -0.11570945297607 * S_Year_Birth ;
   H16  =    -0.75571155913011 * S_AcceptedCmpTotal  +     0.09840879372663 * 
        S_Frq  +    -0.53461000732313 * S_Income  +      0.0787877759044 * 
        S_Mnt  +    -0.53449001676017 * S_MntGoldProds
          +    -0.69187171438234 * S_MntMeatProducts
          +    -0.11822288494525 * S_NumCatalogPurchases
          +       0.519466734012 * S_NumDealsPurchases
          +    -0.51791781576859 * S_NumWebVisitsMonth
          +     0.22469288951761 * S_RFMstat  +     0.38650165150045 * 
        S_Recency  +     0.58503658919931 * S_Teenhome
          +     0.03967747415483 * S_Year_Birth ;
   H11  = H11  +     0.04410898156447 * Marital_StatusDivorced
          +      0.1598517048471 * Marital_StatusMarried
          +     0.01142377364732 * Marital_StatusSingle
          +     0.06539003775575 * Marital_StatusTogether ;
   H12  = H12  +     0.00306434299969 * Marital_StatusDivorced
          +    -0.26397365975909 * Marital_StatusMarried
          +    -0.18834295704477 * Marital_StatusSingle
          +     0.44699691253862 * Marital_StatusTogether ;
   H13  = H13  +    -0.28709990984097 * Marital_StatusDivorced
          +     -0.3545019739037 * Marital_StatusMarried
          +     0.07927126592528 * Marital_StatusSingle
          +    -0.21786411284156 * Marital_StatusTogether ;
   H14  = H14  +     0.02206189536446 * Marital_StatusDivorced
          +    -0.55625916317319 * Marital_StatusMarried
          +     0.05831638520166 * Marital_StatusSingle
          +    -0.48779635493104 * Marital_StatusTogether ;
   H15  = H15  +     0.46162998965598 * Marital_StatusDivorced
          +    -1.42284160271852 * Marital_StatusMarried
          +     0.99787512457662 * Marital_StatusSingle
          +    -1.28275199288232 * Marital_StatusTogether ;
   H16  = H16  +     0.21134806671623 * Marital_StatusDivorced
          +     0.34831713709698 * Marital_StatusMarried
          +    -0.45422691054026 * Marital_StatusSingle
          +     0.12023788093816 * Marital_StatusTogether ;
   H11  =      1.5022178269739 + H11 ;
   H12  =     0.73484629523687 + H12 ;
   H13  =     0.69194935422921 + H13 ;
   H14  =     0.85630780742617 + H14 ;
   H15  =     0.98348561215424 + H15 ;
   H16  =     1.51368234130787 + H16 ;
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
   P_DepVar1  =    -3.07342131758869 * H11  +    -0.81132049141319 * H12
          +    -2.19940529234218 * H13  +    -0.48199183515645 * H14
          +     4.03916391547898 * H15  +     -2.8998255953728 * H16 ;
   P_DepVar1  =    -1.74498921303611 + P_DepVar1 ;
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
