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

      label S_Age = 'Standard: Age' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Kidhome = 'Standard: Kidhome' ;

      label S_MntFishProducts = 'Standard: MntFishProducts' ;

      label S_MntFruits = 'Standard: MntFruits' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntSweetProducts = 'Standard: MntSweetProducts' ;

      label S_MonthsAsCustomer = 'Standard: MonthsAsCustomer' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_NumWebVisitsMonth = 'Standard: NumWebVisitsMonth' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label S_Teenhome = 'Standard: Teenhome' ;

      label AcceptedCmp10 = 'Dummy: AcceptedCmp1=0' ;

      label AcceptedCmp20 = 'Dummy: AcceptedCmp2=0' ;

      label AcceptedCmp30 = 'Dummy: AcceptedCmp3=0' ;

      label AcceptedCmp40 = 'Dummy: AcceptedCmp4=0' ;

      label AcceptedCmp50 = 'Dummy: AcceptedCmp5=0' ;

      label Complain0 = 'Dummy: Complain=0' ;

      label HigherEducationBinary0 = 'Dummy: HigherEducationBinary=0' ;

      label Education2n_Cycle = 'Dummy: Education=2n Cycle' ;

      label EducationBasic = 'Dummy: Education=Basic' ;

      label EducationGraduation = 'Dummy: Education=Graduation' ;

      label EducationMaster = 'Dummy: Education=Master' ;

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

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

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

*** Generate dummy variables for Education ;
drop Education2n_Cycle EducationBasic EducationGraduation EducationMaster ;
*** encoding is sparse, initialize to zero;
Education2n_Cycle = 0;
EducationBasic = 0;
EducationGraduation = 0;
EducationMaster = 0;
if missing( Education ) then do;
   Education2n_Cycle = .;
   EducationBasic = .;
   EducationGraduation = .;
   EducationMaster = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Education , $10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'GRADUATION'  then do;
      EducationGraduation = 1;
   end;
   else if _dm10 = 'PHD'  then do;
      Education2n_Cycle = -1;
      EducationBasic = -1;
      EducationGraduation = -1;
      EducationMaster = -1;
   end;
   else if _dm10 = 'MASTER'  then do;
      EducationMaster = 1;
   end;
   else if _dm10 = '2N CYCLE'  then do;
      Education2n_Cycle = 1;
   end;
   else if _dm10 = 'BASIC'  then do;
      EducationBasic = 1;
   end;
   else do;
      Education2n_Cycle = .;
      EducationBasic = .;
      EducationGraduation = .;
      EducationMaster = .;
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
   Age , 
   Frq , 
   Income , 
   Kidhome , 
   MntFishProducts , 
   MntFruits , 
   MntGoldProds , 
   MntSweetProducts , 
   MonthsAsCustomer , 
   NumDealsPurchases , 
   NumWebVisitsMonth , 
   RFMstat , 
   RMntFrq , 
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
   S_Age  =    -3.91319138389466 +     0.08289609202857 * Age ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
   S_MntFishProducts  =    -0.69884925989448 +     0.01914942799914 * 
        MntFishProducts ;
   S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   S_MonthsAsCustomer  =    -4.92768414840297 +     0.05901745637787 * 
        MonthsAsCustomer ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
   S_Teenhome  =    -0.88382230606631 +     1.81661831567223 * Teenhome ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 * 
        AcceptedCmpTotal ;
   IF MISSING( Age ) THEN S_Age  = . ;
   ELSE S_Age  =    -3.91319138389466 +     0.08289609202857 * Age ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Kidhome ) THEN S_Kidhome  = . ;
   ELSE S_Kidhome  =    -0.81505958668041 +     1.87132636245581 * Kidhome ;
   IF MISSING( MntFishProducts ) THEN S_MntFishProducts  = . ;
   ELSE S_MntFishProducts  =    -0.69884925989448 +     0.01914942799914 * 
        MntFishProducts ;
   IF MISSING( MntFruits ) THEN S_MntFruits  = . ;
   ELSE S_MntFruits  =    -0.68347542544545 +     0.02517057319714 * MntFruits
         ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 * 
        MntGoldProds ;
   IF MISSING( MntSweetProducts ) THEN S_MntSweetProducts  = . ;
   ELSE S_MntSweetProducts  =    -0.69020047720885 +     0.02548703406327 * 
        MntSweetProducts ;
   IF MISSING( MonthsAsCustomer ) THEN S_MonthsAsCustomer  = . ;
   ELSE S_MonthsAsCustomer  =    -4.92768414840297 +     0.05901745637787 * 
        MonthsAsCustomer ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   IF MISSING( NumWebVisitsMonth ) THEN S_NumWebVisitsMonth  = . ;
   ELSE S_NumWebVisitsMonth  =    -2.24769875596018 +     0.42876953368015 * 
        NumWebVisitsMonth ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
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
   H11  =      0.0175934799517 * S_AcceptedCmpTotal  +     0.05885450913465 * 
        S_Age  +    -0.17194721523787 * S_Frq  +    -0.82356228294539 * 
        S_Income  +     0.39869341630865 * S_Kidhome
          +    -0.04263586382867 * S_MntFishProducts
          +     0.02697365132515 * S_MntFruits  +     0.04818007940845 * 
        S_MntGoldProds  +      0.1933390486387 * S_MntSweetProducts
          +    -0.14308588367026 * S_MonthsAsCustomer
          +    -0.01053346972758 * S_NumDealsPurchases
          +    -0.02308351901024 * S_NumWebVisitsMonth
          +     0.00403225397753 * S_RFMstat  +    -0.21691316840182 * 
        S_RMntFrq  +     0.53938373050534 * S_Recency
          +     0.55541282723709 * S_Teenhome ;
   H12  =    -0.31735811206172 * S_AcceptedCmpTotal  +    -0.13976815294846 * 
        S_Age  +    -0.11928757030551 * S_Frq  +    -0.03597478449162 * 
        S_Income  +     0.31514301668626 * S_Kidhome
          +    -0.05723808748191 * S_MntFishProducts
          +     0.04545715816601 * S_MntFruits  +     0.19006209866265 * 
        S_MntGoldProds  +     0.34690576354698 * S_MntSweetProducts
          +    -0.48738730918684 * S_MonthsAsCustomer
          +     0.31545795225489 * S_NumDealsPurchases
          +     0.24686603252864 * S_NumWebVisitsMonth
          +     0.29857007170218 * S_RFMstat  +    -0.01009427724752 * 
        S_RMntFrq  +    -0.48894693883774 * S_Recency
          +    -0.32384426712368 * S_Teenhome ;
   H13  =    -0.67705794412683 * S_AcceptedCmpTotal  +     -0.1538815804864 * 
        S_Age  +    -0.32580272740463 * S_Frq  +    -0.42829033761305 * 
        S_Income  +    -0.48452563006855 * S_Kidhome
          +      0.1638851163007 * S_MntFishProducts
          +      0.0664068987141 * S_MntFruits  +    -0.54942999951449 * 
        S_MntGoldProds  +    -0.03119903843323 * S_MntSweetProducts
          +    -0.09008316729574 * S_MonthsAsCustomer
          +    -0.45452883452999 * S_NumDealsPurchases
          +    -0.51499533680205 * S_NumWebVisitsMonth
          +    -0.31380282266424 * S_RFMstat  +    -0.49525143192723 * 
        S_RMntFrq  +     0.78729387300328 * S_Recency
          +    -0.00915408985389 * S_Teenhome ;
   H14  =     0.38318271090494 * S_AcceptedCmpTotal  +     0.06739638561066 * 
        S_Age  +     0.06912614028701 * S_Frq  +     0.14095220260271 * 
        S_Income  +    -0.62959343200613 * S_Kidhome
          +    -0.08953561593231 * S_MntFishProducts
          +    -0.17218233364246 * S_MntFruits  +    -0.00637076803669 * 
        S_MntGoldProds  +    -0.30194599011284 * S_MntSweetProducts
          +    -0.04786752357029 * S_MonthsAsCustomer
          +     0.01658790214447 * S_NumDealsPurchases
          +     0.60508225698649 * S_NumWebVisitsMonth
          +     0.24353060507938 * S_RFMstat  +    -0.16860031884486 * 
        S_RMntFrq  +    -0.74371082820398 * S_Recency
          +    -0.33551735128078 * S_Teenhome ;
   H15  =    -0.33857166416401 * S_AcceptedCmpTotal  +     0.16520608022036 * 
        S_Age  +     0.94641603263172 * S_Frq  +     0.27973805141234 * 
        S_Income  +    -0.02417847760857 * S_Kidhome
          +    -0.15499190740194 * S_MntFishProducts
          +     0.06053779821593 * S_MntFruits  +     0.01880479324025 * 
        S_MntGoldProds  +    -0.12339726666832 * S_MntSweetProducts
          +     0.03507116553703 * S_MonthsAsCustomer
          +    -0.55190381693021 * S_NumDealsPurchases
          +    -0.59332657995985 * S_NumWebVisitsMonth
          +    -0.06593374840561 * S_RFMstat  +     -0.1695910963416 * 
        S_RMntFrq  +     0.67557246434122 * S_Recency
          +    -0.18658362303394 * S_Teenhome ;
   H11  = H11  +     0.33421746514492 * AcceptedCmp10
          +     0.40665603760529 * AcceptedCmp20  +     0.31091046539166 * 
        AcceptedCmp30  +     0.31067810471417 * AcceptedCmp40
          +     0.23230606314386 * AcceptedCmp50  +     0.16336773428886 * 
        Complain0  +    -0.30987882500611 * HigherEducationBinary0 ;
   H12  = H12  +     0.15837463939449 * AcceptedCmp10
          +    -0.01452684677445 * AcceptedCmp20  +    -0.18194082864383 * 
        AcceptedCmp30  +     0.10656170173016 * AcceptedCmp40
          +     0.27710912124072 * AcceptedCmp50  +     0.21438736172214 * 
        Complain0  +      0.2669951422121 * HigherEducationBinary0 ;
   H13  = H13  +    -0.11101425179048 * AcceptedCmp10
          +    -0.13751555879468 * AcceptedCmp20  +     0.15733527433639 * 
        AcceptedCmp30  +    -0.09214109408136 * AcceptedCmp40
          +     0.20478673178439 * AcceptedCmp50  +    -0.28890027497717 * 
        Complain0  +     0.12242984309847 * HigherEducationBinary0 ;
   H14  = H14  +     0.23187291622457 * AcceptedCmp10
          +    -0.00683976547266 * AcceptedCmp20  +    -0.31710598764248 * 
        AcceptedCmp30  +     0.01758514221597 * AcceptedCmp40
          +     0.01100509244187 * AcceptedCmp50  +     0.18584999296157 * 
        Complain0  +     0.02524550049258 * HigherEducationBinary0 ;
   H15  = H15  +     0.53220831693924 * AcceptedCmp10
          +     0.01983211122446 * AcceptedCmp20  +      0.4704897795251 * 
        AcceptedCmp30  +    -0.05798671810245 * AcceptedCmp40
          +      0.2900384423652 * AcceptedCmp50  +     0.05796705496261 * 
        Complain0  +     0.17745347141736 * HigherEducationBinary0 ;
   H11  = H11  +     0.02871001640043 * Education2n_Cycle
          +    -0.13470776546868 * EducationBasic  +    -0.09722995474504 * 
        EducationGraduation  +     0.23764107317064 * EducationMaster
          +    -0.41654638301737 * Marital_StatusDivorced
          +     0.65956207700583 * Marital_StatusMarried
          +    -0.52573042887166 * Marital_StatusSingle
          +     0.70466028872575 * Marital_StatusTogether ;
   H12  = H12  +    -0.18219729356622 * Education2n_Cycle
          +    -0.04034334204744 * EducationBasic  +     0.26266153233615 * 
        EducationGraduation  +     0.04617834975571 * EducationMaster
          +    -0.32313846862799 * Marital_StatusDivorced
          +     0.15910539009887 * Marital_StatusMarried
          +     0.28781821946114 * Marital_StatusSingle
          +    -0.31451367898445 * Marital_StatusTogether ;
   H13  = H13  +     0.03267721493849 * Education2n_Cycle
          +     0.16906837093601 * EducationBasic  +    -0.24874822218195 * 
        EducationGraduation  +    -0.16815820019721 * EducationMaster
          +    -0.06481096024989 * Marital_StatusDivorced
          +    -0.01184060710261 * Marital_StatusMarried
          +    -0.04932258474026 * Marital_StatusSingle
          +     -0.1515388053958 * Marital_StatusTogether ;
   H14  = H14  +     0.04382537081818 * Education2n_Cycle
          +     0.09896945976445 * EducationBasic  +      0.2410849324915 * 
        EducationGraduation  +    -0.17878202935912 * EducationMaster
          +      0.2062190716357 * Marital_StatusDivorced
          +      -0.523160668609 * Marital_StatusMarried
          +     0.50687401816278 * Marital_StatusSingle
          +    -0.14896192891933 * Marital_StatusTogether ;
   H15  = H15  +    -0.08178258730533 * Education2n_Cycle
          +      0.2352291498146 * EducationBasic  +     0.00142061419661 * 
        EducationGraduation  +      0.0248100493803 * EducationMaster
          +     -0.1386176879533 * Marital_StatusDivorced
          +    -0.17611433777439 * Marital_StatusMarried
          +     0.09908348348999 * Marital_StatusSingle
          +     0.03642332762739 * Marital_StatusTogether ;
   H11  =     0.45628072516851 + H11 ;
   H12  =    -0.95695553300305 + H12 ;
   H13  =    -0.44156518168947 + H13 ;
   H14  =      0.5435213841731 + H14 ;
   H15  =     0.82816554742793 + H15 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -3.08501570662701 * H11  +     0.89180279281701 * H12
          +    -2.65199906073292 * H13  +     1.47191997336768 * H14
          +     -1.9303334635002 * H15 ;
   P_DepVar1  =    -1.84416627670626 + P_DepVar1 ;
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
