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

      label H16 = 'Hidden: H1=6' ;

      label H17 = 'Hidden: H1=7' ;

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
   H11  =     0.36110803954855 * S_AcceptedCmpTotal  +     0.13547801674585 * 
        S_Age  +    -0.24552124555532 * S_Frq  +    -0.11657390188351 * 
        S_Income  +     0.21841327214328 * S_Kidhome
          +    -0.08125755885491 * S_MntFishProducts
          +     -0.2705052745123 * S_MntFruits  +     -0.2590576061572 * 
        S_MntGoldProds  +     0.07459498469538 * S_MntSweetProducts
          +     0.21866166218293 * S_MonthsAsCustomer
          +    -0.21701762836549 * S_NumDealsPurchases
          +     0.07894851045935 * S_NumWebVisitsMonth
          +     0.08921612822245 * S_RFMstat  +    -0.02040952914279 * 
        S_RMntFrq  +     0.15773040296683 * S_Recency
          +     0.18795040351393 * S_Teenhome ;
   H12  =     -0.5016796601689 * S_AcceptedCmpTotal  +     0.02141252121077 * 
        S_Age  +     0.02533358832525 * S_Frq  +    -0.89656056304793 * 
        S_Income  +    -0.50741018742107 * S_Kidhome
          +     0.11789235500688 * S_MntFishProducts
          +    -0.05391257299074 * S_MntFruits  +    -0.43844383398328 * 
        S_MntGoldProds  +     0.20086516584172 * S_MntSweetProducts
          +    -0.12096441889126 * S_MonthsAsCustomer
          +    -0.53182967817876 * S_NumDealsPurchases
          +    -0.65381646818525 * S_NumWebVisitsMonth
          +    -0.29345654851839 * S_RFMstat  +    -0.07284725988025 * 
        S_RMntFrq  +     0.73417460609275 * S_Recency
          +     0.28152108778838 * S_Teenhome ;
   H13  =    -0.22241318356942 * S_AcceptedCmpTotal  +     0.04664521183033 * 
        S_Age  +     0.33683339375822 * S_Frq  +    -0.27700440206991 * 
        S_Income  +     0.59731856577609 * S_Kidhome
          +    -0.21417066380485 * S_MntFishProducts
          +     0.09462678519727 * S_MntFruits  +     0.33690652154135 * 
        S_MntGoldProds  +     0.18218751437319 * S_MntSweetProducts
          +     0.74506126241168 * S_MonthsAsCustomer
          +     -0.0426046522032 * S_NumDealsPurchases
          +    -0.28766319294366 * S_NumWebVisitsMonth
          +    -0.15001102616419 * S_RFMstat  +      0.0796282932817 * 
        S_RMntFrq  +     0.82312941262219 * S_Recency
          +     0.37834061867339 * S_Teenhome ;
   H14  =    -0.29647151260749 * S_AcceptedCmpTotal  +     0.03875185072729 * 
        S_Age  +     0.84663314841373 * S_Frq  +     0.08781808788689 * 
        S_Income  +     0.00520247940824 * S_Kidhome
          +    -0.27279099954997 * S_MntFishProducts
          +     0.22411346263117 * S_MntFruits  +    -0.22117604499599 * 
        S_MntGoldProds  +      0.1133354997708 * S_MntSweetProducts
          +    -0.03930385119549 * S_MonthsAsCustomer
          +    -0.70151263335901 * S_NumDealsPurchases
          +     -0.4265994687181 * S_NumWebVisitsMonth
          +    -0.15748641435362 * S_RFMstat  +    -0.13078011500878 * 
        S_RMntFrq  +     0.84719737677288 * S_Recency
          +     0.10706817431021 * S_Teenhome ;
   H15  =    -0.07899787590352 * S_AcceptedCmpTotal  +     0.03180708050796 * 
        S_Age  +     0.48119579482844 * S_Frq  +     0.77894167571758 * 
        S_Income  +    -0.51766206077271 * S_Kidhome
          +    -0.02457049344389 * S_MntFishProducts
          +    -0.20172553597691 * S_MntFruits  +    -0.01323073969545 * 
        S_MntGoldProds  +    -0.04777972579646 * S_MntSweetProducts
          +      0.2527325279137 * S_MonthsAsCustomer
          +     -0.2042358011289 * S_NumDealsPurchases
          +    -0.04239170381036 * S_NumWebVisitsMonth
          +     0.02012529381207 * S_RFMstat  +     0.33404529308618 * 
        S_RMntFrq  +    -0.44724048899839 * S_Recency
          +    -0.63180189567132 * S_Teenhome ;
   H16  =      -0.383410328703 * S_AcceptedCmpTotal  +     0.11015036032707 * 
        S_Age  +    -0.17603849696268 * S_Frq  +    -0.00482417497586 * 
        S_Income  +     0.02703524116788 * S_Kidhome
          +      0.3032492052643 * S_MntFishProducts
          +    -0.15404208571625 * S_MntFruits  +     0.34380561605192 * 
        S_MntGoldProds  +    -0.01993566560895 * S_MntSweetProducts
          +     0.02239066904537 * S_MonthsAsCustomer
          +    -0.25672377994849 * S_NumDealsPurchases
          +    -0.17631825911607 * S_NumWebVisitsMonth
          +    -0.05766944902387 * S_RFMstat  +    -0.10123742631192 * 
        S_RMntFrq  +    -0.27017097846466 * S_Recency
          +    -0.02255470439449 * S_Teenhome ;
   H17  =     0.19026773905324 * S_AcceptedCmpTotal  +    -0.36595652460169 * 
        S_Age  +    -0.50203116840269 * S_Frq  +    -0.48148272876868 * 
        S_Income  +     0.24269117164704 * S_Kidhome
          +    -0.25280027660497 * S_MntFishProducts
          +     0.32817616458642 * S_MntFruits  +      0.1314087142667 * 
        S_MntGoldProds  +     0.48501628960615 * S_MntSweetProducts
          +     0.05844462803784 * S_MonthsAsCustomer
          +     0.44050031660904 * S_NumDealsPurchases
          +     0.56802299610748 * S_NumWebVisitsMonth
          +     0.07111036873206 * S_RFMstat  +     0.09513487392921 * 
        S_RMntFrq  +    -0.57895917541133 * S_Recency
          +      0.3784306430786 * S_Teenhome ;
   H11  = H11  +     0.19053470959518 * AcceptedCmp10
          +    -0.07214096695579 * AcceptedCmp20  +     0.21734632286308 * 
        AcceptedCmp30  +     0.21104454807694 * AcceptedCmp40
          +    -0.03042840763045 * AcceptedCmp50  +    -0.07248819948399 * 
        Complain0  +     0.01807512537676 * HigherEducationBinary0 ;
   H12  = H12  +    -0.08643027844399 * AcceptedCmp10
          +    -0.04690429005463 * AcceptedCmp20  +     0.31198784964773 * 
        AcceptedCmp30  +    -0.49945004903212 * AcceptedCmp40
          +     0.13835872835723 * AcceptedCmp50  +    -0.31088531623779 * 
        Complain0  +      0.3349555407628 * HigherEducationBinary0 ;
   H13  = H13  +    -0.26820236609158 * AcceptedCmp10
          +     0.00448855360376 * AcceptedCmp20  +     0.16944645736856 * 
        AcceptedCmp30  +    -0.04005549221867 * AcceptedCmp40
          +      0.1910208977492 * AcceptedCmp50  +    -0.58683723735432 * 
        Complain0  +    -0.35128851625292 * HigherEducationBinary0 ;
   H14  = H14  +     0.62785274077618 * AcceptedCmp10
          +      0.0693722948195 * AcceptedCmp20  +     0.32529417239013 * 
        AcceptedCmp30  +    -0.04192585494202 * AcceptedCmp40
          +     0.61511047277682 * AcceptedCmp50  +     0.00175862626358 * 
        Complain0  +     -0.1307616855525 * HigherEducationBinary0 ;
   H15  = H15  +    -0.43561963745277 * AcceptedCmp10
          +    -0.35461269691767 * AcceptedCmp20  +    -0.30302138803147 * 
        AcceptedCmp30  +    -0.63665313118921 * AcceptedCmp40
          +     0.08104592597156 * AcceptedCmp50  +    -0.56003108172887 * 
        Complain0  +     0.37695623750728 * HigherEducationBinary0 ;
   H16  = H16  +    -0.10473893768031 * AcceptedCmp10
          +     0.20741912244959 * AcceptedCmp20  +     0.34161448957673 * 
        AcceptedCmp30  +    -0.02143448305541 * AcceptedCmp40
          +     -0.2199415295718 * AcceptedCmp50  +    -0.37163650635155 * 
        Complain0  +     0.13984739049701 * HigherEducationBinary0 ;
   H17  = H17  +    -0.09370093055173 * AcceptedCmp10
          +    -0.04918758410641 * AcceptedCmp20  +    -0.44974584575411 * 
        AcceptedCmp30  +     0.10464992854985 * AcceptedCmp40
          +    -0.05182980556199 * AcceptedCmp50  +    -0.19323882957787 * 
        Complain0  +    -0.21093860578303 * HigherEducationBinary0 ;
   H11  = H11  +    -0.16742393784366 * Education2n_Cycle
          +    -0.31414461011734 * EducationBasic  +     0.13322773160329 * 
        EducationGraduation  +     0.02044133367016 * EducationMaster
          +     0.03218438391868 * Marital_StatusDivorced
          +     0.29740201431648 * Marital_StatusMarried
          +    -0.05711320105182 * Marital_StatusSingle
          +     0.27921996089325 * Marital_StatusTogether ;
   H12  = H12  +    -0.10551122009757 * Education2n_Cycle
          +     0.25967552558213 * EducationBasic  +    -0.25379946081258 * 
        EducationGraduation  +     0.06172711985252 * EducationMaster
          +    -0.13485953864883 * Marital_StatusDivorced
          +     0.29585621396014 * Marital_StatusMarried
          +    -0.21062396510776 * Marital_StatusSingle
          +     0.12581779616426 * Marital_StatusTogether ;
   H13  = H13  +     0.16376652881662 * Education2n_Cycle
          +    -0.08434665843847 * EducationBasic  +      0.1195595163399 * 
        EducationGraduation  +    -0.23477707229079 * EducationMaster
          +     0.03739211492109 * Marital_StatusDivorced
          +     0.02254393538602 * Marital_StatusMarried
          +     0.17136006383242 * Marital_StatusSingle
          +    -0.40488263187974 * Marital_StatusTogether ;
   H14  = H14  +     0.08980489161782 * Education2n_Cycle
          +     0.17398317663845 * EducationBasic  +    -0.08201462711728 * 
        EducationGraduation  +    -0.01140342790221 * EducationMaster
          +    -0.07451351408309 * Marital_StatusDivorced
          +      0.2029630348745 * Marital_StatusMarried
          +     0.21447602869795 * Marital_StatusSingle
          +     0.24985218402946 * Marital_StatusTogether ;
   H15  = H15  +     0.05571864694522 * Education2n_Cycle
          +     0.15599348383381 * EducationBasic  +     0.18446892396738 * 
        EducationGraduation  +    -0.40873344898593 * EducationMaster
          +     0.16093771775144 * Marital_StatusDivorced
          +    -0.81694058036214 * Marital_StatusMarried
          +     0.85329100663689 * Marital_StatusSingle
          +    -0.81086593091247 * Marital_StatusTogether ;
   H16  = H16  +    -0.15186411904751 * Education2n_Cycle
          +    -0.32073478970843 * EducationBasic  +     0.14834928320728 * 
        EducationGraduation  +     -0.2421067497959 * EducationMaster
          +    -0.01714918488371 * Marital_StatusDivorced
          +     0.04552206929478 * Marital_StatusMarried
          +    -0.05463276154515 * Marital_StatusSingle
          +     0.07591432748361 * Marital_StatusTogether ;
   H17  = H17  +     -0.1856786144352 * Education2n_Cycle
          +     0.31836662672474 * EducationBasic  +     0.21999227529727 * 
        EducationGraduation  +     0.13896310567103 * EducationMaster
          +     0.22629171286765 * Marital_StatusDivorced
          +     0.10716741132649 * Marital_StatusMarried
          +    -0.07811411689056 * Marital_StatusSingle
          +    -0.19403139012242 * Marital_StatusTogether ;
   H11  =     1.31498645608645 + H11 ;
   H12  =     0.20013197362598 + H12 ;
   H13  =    -0.77650087384368 + H13 ;
   H14  =     0.85810948448782 + H14 ;
   H15  =     -0.1569386020503 + H15 ;
   H16  =     -0.7137060746003 + H16 ;
   H17  =    -1.06403256916825 + H17 ;
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
   P_DepVar1  =    -0.12091629032846 * H11  +     -2.7057572850547 * H12
          +    -1.82036433923679 * H13  +    -1.84943401889148 * H14
          +      2.5473822826307 * H15  +    -0.20625314344181 * H16
          +     1.26998332460819 * H17 ;
   P_DepVar1  =    -1.65872808052338 + P_DepVar1 ;
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
