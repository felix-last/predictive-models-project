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
   S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   ELSE S_MonthsAsCustomer  =    -4.93910929907081 +      0.0590440785747 *
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
   H11  =      0.0032927309355 * S_AcceptedCmpTotal  +     0.09101334306394 *
        S_Age  +    -0.17737387030956 * S_Frq  +     -0.7980677567639 *
        S_Income  +     0.43076147384738 * S_Kidhome
          +    -0.03764687993601 * S_MntFishProducts
          +     0.02729806956772 * S_MntFruits  +     0.08803652910758 *
        S_MntGoldProds  +     0.17643871051763 * S_MntSweetProducts
          +    -0.21857007362207 * S_MonthsAsCustomer
          +    -0.01738553271488 * S_NumDealsPurchases
          +    -0.05405784617097 * S_NumWebVisitsMonth
          +    -0.02555104359687 * S_RFMstat  +    -0.22262932120098 *
        S_RMntFrq  +     0.52463751421504 * S_Recency
          +     0.54544496970995 * S_Teenhome ;
   H12  =    -0.33803565764996 * S_AcceptedCmpTotal  +     -0.1574598864259 *
        S_Age  +    -0.11819127145626 * S_Frq  +     -0.0410639104551 *
        S_Income  +     0.30116999256128 * S_Kidhome
          +    -0.05148754431395 * S_MntFishProducts
          +     0.06976805639315 * S_MntFruits  +     0.21288156312487 *
        S_MntGoldProds  +     0.38336457324703 * S_MntSweetProducts
          +    -0.47049602184046 * S_MonthsAsCustomer
          +     0.31766759211089 * S_NumDealsPurchases
          +     0.23065914125267 * S_NumWebVisitsMonth
          +     0.30304676466657 * S_RFMstat  +     0.02069006823415 *
        S_RMntFrq  +    -0.50214492406349 * S_Recency
          +    -0.31828314433486 * S_Teenhome ;
   H13  =    -0.66950066433143 * S_AcceptedCmpTotal  +    -0.13180706544499 *
        S_Age  +    -0.35768347811788 * S_Frq  +    -0.48081944747804 *
        S_Income  +    -0.47031432651131 * S_Kidhome
          +     0.14501559210465 * S_MntFishProducts
          +     0.04696430031502 * S_MntFruits  +    -0.56155803643986 *
        S_MntGoldProds  +    -0.03811468849817 * S_MntSweetProducts
          +    -0.12263198714092 * S_MonthsAsCustomer
          +    -0.44778701790462 * S_NumDealsPurchases
          +    -0.48451328063306 * S_NumWebVisitsMonth
          +    -0.30729532219651 * S_RFMstat  +    -0.53933327781572 *
        S_RMntFrq  +     0.73816873319969 * S_Recency
          +     0.02727962791734 * S_Teenhome ;
   H14  =     0.31637384240651 * S_AcceptedCmpTotal  +     0.01318551698119 *
        S_Age  +     0.05366305732147 * S_Frq  +     0.11980702632855 *
        S_Income  +    -0.63361814765775 * S_Kidhome
          +    -0.09824863224867 * S_MntFishProducts
          +    -0.19022726480556 * S_MntFruits  +    -0.03622071498812 *
        S_MntGoldProds  +    -0.33481056314568 * S_MntSweetProducts
          +    -0.02935796970517 * S_MonthsAsCustomer
          +     0.02015249143837 * S_NumDealsPurchases
          +     0.60675564879689 * S_NumWebVisitsMonth
          +     0.25432072256404 * S_RFMstat  +    -0.18855949493817 *
        S_RMntFrq  +    -0.75663473950421 * S_Recency
          +    -0.34865918998533 * S_Teenhome ;
   H15  =    -0.32654270849386 * S_AcceptedCmpTotal  +     0.17707100422873 *
        S_Age  +     0.93625207609464 * S_Frq  +     0.26987977696455 *
        S_Income  +    -0.00728146808361 * S_Kidhome
          +    -0.15850529937985 * S_MntFishProducts
          +     0.06513447200778 * S_MntFruits  +      0.0398444679725 *
        S_MntGoldProds  +    -0.12149497244296 * S_MntSweetProducts
          +    -0.00539233520343 * S_MonthsAsCustomer
          +    -0.54182368084643 * S_NumDealsPurchases
          +    -0.60072233649965 * S_NumWebVisitsMonth
          +    -0.09022759163793 * S_RFMstat  +    -0.16894620369906 *
        S_RMntFrq  +     0.66307424769463 * S_Recency
          +    -0.17356690404814 * S_Teenhome ;
   H11  = H11  +     0.40379020589792 * AcceptedCmp10
          +     0.41163608029184 * AcceptedCmp20  +     0.31824152457666 *
        AcceptedCmp30  +     0.30059703252717 * AcceptedCmp40
          +     0.21809621049566 * AcceptedCmp50  +     0.17161388784292 *
        Complain0  +    -0.35356191864234 * HigherEducationBinary0 ;
   H12  = H12  +     0.14146453229372 * AcceptedCmp10
          +    -0.01499648130434 * AcceptedCmp20  +    -0.15319425809948 *
        AcceptedCmp30  +     0.10722126908794 * AcceptedCmp40
          +     0.29524215734213 * AcceptedCmp50  +     0.21901777981386 *
        Complain0  +     0.26589689583514 * HigherEducationBinary0 ;
   H13  = H13  +    -0.13089590705194 * AcceptedCmp10
          +    -0.16147741287576 * AcceptedCmp20  +     0.13892066553636 *
        AcceptedCmp30  +    -0.12220468306752 * AcceptedCmp40
          +     0.18197624280085 * AcceptedCmp50  +    -0.31355578222066 *
        Complain0  +     0.17409691060383 * HigherEducationBinary0 ;
   H14  = H14  +     0.24764542202116 * AcceptedCmp10
          +     0.00575121729576 * AcceptedCmp20  +    -0.30692671431758 *
        AcceptedCmp30  +     0.04820882787304 * AcceptedCmp40
          +     0.05262951745934 * AcceptedCmp50  +     0.19424906323292 *
        Complain0  +     0.02739699491892 * HigherEducationBinary0 ;
   H15  = H15  +     0.55249118257316 * AcceptedCmp10
          +     0.03472783050924 * AcceptedCmp20  +     0.45051734949789 *
        AcceptedCmp30  +    -0.03032221189323 * AcceptedCmp40
          +     0.28472394784854 * AcceptedCmp50  +     0.06409321661831 *
        Complain0  +     0.17517854321941 * HigherEducationBinary0 ;
   H11  = H11  +     0.01296567207369 * Education2n_Cycle
          +     -0.1384611563627 * EducationBasic  +    -0.07977602646684 *
        EducationGraduation  +     0.24334570893333 * EducationMaster
          +    -0.38882658584856 * Marital_StatusDivorced
          +     0.65814014556907 * Marital_StatusMarried
          +    -0.47946271812834 * Marital_StatusSingle
          +     0.68266301555878 * Marital_StatusTogether ;
   H12  = H12  +    -0.17120287038112 * Education2n_Cycle
          +    -0.02706838966272 * EducationBasic  +     0.28296380151006 *
        EducationGraduation  +     0.06350902674039 * EducationMaster
          +     -0.3300387788221 * Marital_StatusDivorced
          +     0.15584744966644 * Marital_StatusMarried
          +     0.26617174676758 * Marital_StatusSingle
          +    -0.29771537576014 * Marital_StatusTogether ;
   H13  = H13  +     0.05524541069883 * Education2n_Cycle
          +     0.18324866500855 * EducationBasic  +    -0.25557023117825 *
        EducationGraduation  +    -0.16479543389993 * EducationMaster
          +    -0.06758334778864 * Marital_StatusDivorced
          +    -0.00076716594904 * Marital_StatusMarried
          +    -0.04319541969046 * Marital_StatusSingle
          +    -0.16936317180157 * Marital_StatusTogether ;
   H14  = H14  +     0.04763927770842 * Education2n_Cycle
          +     0.09740370469315 * EducationBasic  +      0.2355172519549 *
        EducationGraduation  +    -0.17375916527677 * EducationMaster
          +      0.2099776154173 * Marital_StatusDivorced
          +    -0.53311901286241 * Marital_StatusMarried
          +     0.48618352894253 * Marital_StatusSingle
          +    -0.13406957503471 * Marital_StatusTogether ;
   H15  = H15  +     -0.1000300691329 * Education2n_Cycle
          +      0.2070015782176 * EducationBasic  +    -0.02421180620986 *
        EducationGraduation  +     -0.0194914340189 * EducationMaster
          +     -0.1329378358285 * Marital_StatusDivorced
          +     -0.1585939674118 * Marital_StatusMarried
          +     0.12646246189261 * Marital_StatusSingle
          +     0.02351898949739 * Marital_StatusTogether ;
   H11  =      0.4650755258615 + H11 ;
   H12  =    -0.95637983233364 + H12 ;
   H13  =    -0.46557260942286 + H13 ;
   H14  =     0.54843208877211 + H14 ;
   H15  =     0.84042548309301 + H15 ;
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
   P_DepVar1  =    -3.09243100351612 * H11  +     0.88657133745413 * H12
          +    -2.65301673073237 * H13  +     1.47093743452607 * H14
          +    -1.93226639391443 * H15 ;
   P_DepVar1  =    -1.83325335768642 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
;
drop S_:;
