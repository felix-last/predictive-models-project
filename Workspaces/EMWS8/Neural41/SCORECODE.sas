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
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 * 
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
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 * 
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
   H11  =    -0.50311574684963 * S_AcceptedCmpTotal  +    -0.18985055644549 * 
        S_Age  +     0.44828804873659 * S_Frq  +    -0.51280008296346 * 
        S_Income  +    -0.07468461691846 * S_Kidhome
          +    -0.02817334981603 * S_MntFishProducts
          +    -0.23674836972041 * S_MntFruits  +     0.09571592531833 * 
        S_MntGoldProds  +    -0.09676918994417 * S_MntSweetProducts
          +     0.11832246824115 * S_MonthsAsCustomer
          +    -0.06605281991661 * S_NumDealsPurchases
          +    -0.48924564446119 * S_NumWebVisitsMonth
          +    -0.46878579854964 * S_RFMstat  +    -0.08286830724047 * 
        S_RMntFrq  +     0.72493722489034 * S_Recency
          +     0.54759769648457 * S_Teenhome ;
   H12  =     0.27433541795855 * S_AcceptedCmpTotal  +    -0.13239293741829 * 
        S_Age  +       0.297440346075 * S_Frq  +     0.60301641350325 * 
        S_Income  +    -0.52629295860426 * S_Kidhome
          +    -0.09281934074994 * S_MntFishProducts
          +    -0.01139552037387 * S_MntFruits  +    -0.01724648803464 * 
        S_MntGoldProds  +    -0.11213003865462 * S_MntSweetProducts
          +     0.01420877288416 * S_MonthsAsCustomer
          +     0.15753030263585 * S_NumDealsPurchases
          +     0.12839062787468 * S_NumWebVisitsMonth
          +     0.09918681531437 * S_RFMstat  +     0.28128581499392 * 
        S_RMntFrq  +    -0.77555854798433 * S_Recency
          +    -0.39696436898966 * S_Teenhome ;
   H13  =     0.03123358805476 * S_AcceptedCmpTotal  +    -0.11998608363847 * 
        S_Age  +     0.08338729365626 * S_Frq  +     0.36926635699098 * 
        S_Income  +     0.00460024601501 * S_Kidhome
          +    -0.02200799678674 * S_MntFishProducts
          +     0.17038795346592 * S_MntFruits  +    -0.01191054270128 * 
        S_MntGoldProds  +     0.09461198228745 * S_MntSweetProducts
          +     0.11175639451728 * S_MonthsAsCustomer
          +    -0.14915044300238 * S_NumDealsPurchases
          +     -0.0217132622877 * S_NumWebVisitsMonth
          +     0.19209945631632 * S_RFMstat  +     0.27685327218371 * 
        S_RMntFrq  +     -0.1114202547513 * S_Recency
          +    -0.07677627375613 * S_Teenhome ;
   H14  =      -0.510052563552 * S_AcceptedCmpTotal  +    -0.12652051241051 * 
        S_Age  +    -0.42250950524778 * S_Frq  +    -0.66291360306733 * 
        S_Income  +    -0.50120074528145 * S_Kidhome
          +     0.44715945861433 * S_MntFishProducts
          +     0.23552533999892 * S_MntFruits  +    -0.60812570135419 * 
        S_MntGoldProds  +    -0.29436997886251 * S_MntSweetProducts
          +    -0.16226459240838 * S_MonthsAsCustomer
          +    -0.66300674579813 * S_NumDealsPurchases
          +    -0.46113723081205 * S_NumWebVisitsMonth
          +    -0.28741955047351 * S_RFMstat  +    -0.51342973736897 * 
        S_RMntFrq  +     0.32948062104596 * S_Recency
          +     0.04630647814801 * S_Teenhome ;
   H15  =    -0.05552489181258 * S_AcceptedCmpTotal  +      0.3358097664399 * 
        S_Age  +     0.99860330572057 * S_Frq  +     0.33672529961967 * 
        S_Income  +     0.16969714205994 * S_Kidhome
          +     0.04976308170854 * S_MntFishProducts
          +     0.17074705999537 * S_MntFruits  +    -0.14669916972196 * 
        S_MntGoldProds  +    -0.09562051744533 * S_MntSweetProducts
          +     0.17484703075203 * S_MonthsAsCustomer
          +    -0.55173591551358 * S_NumDealsPurchases
          +    -0.43823357997032 * S_NumWebVisitsMonth
          +     0.35315919586696 * S_RFMstat  +    -0.19785503093343 * 
        S_RMntFrq  +     0.71670167585868 * S_Recency
          +    -0.28983189748238 * S_Teenhome ;
   H16  =     0.13586107601616 * S_AcceptedCmpTotal  +    -0.03004972131524 * 
        S_Age  +     0.34607777972893 * S_Frq  +     0.04594045147698 * 
        S_Income  +    -0.02355089102951 * S_Kidhome
          +     0.17666646340328 * S_MntFishProducts
          +    -0.42460885844972 * S_MntFruits  +      0.1419729562767 * 
        S_MntGoldProds  +    -0.37586377717812 * S_MntSweetProducts
          +     0.13355805650034 * S_MonthsAsCustomer
          +     0.14924024487443 * S_NumDealsPurchases
          +     0.34848278731511 * S_NumWebVisitsMonth
          +     0.19641659129802 * S_RFMstat  +    -0.04454828782133 * 
        S_RMntFrq  +    -0.80210797166772 * S_Recency
          +    -0.42106674037771 * S_Teenhome ;
   H11  = H11  +     0.23614129020735 * AcceptedCmp10
          +    -0.02084878775169 * AcceptedCmp20  +     0.37466381839371 * 
        AcceptedCmp30  +    -0.73407018983175 * AcceptedCmp40
          +     0.56003163460043 * AcceptedCmp50  +      0.2232704545414 * 
        Complain0  +    -0.47480864689786 * HigherEducationBinary0 ;
   H12  = H12  +    -0.27353744753102 * AcceptedCmp10
          +    -0.28444143977421 * AcceptedCmp20  +    -0.31024205224044 * 
        AcceptedCmp30  +     -0.3066557522304 * AcceptedCmp40
          +      0.0549579852636 * AcceptedCmp50  +    -0.14741752806404 * 
        Complain0  +     0.28934485954948 * HigherEducationBinary0 ;
   H13  = H13  +    -0.04693289193242 * AcceptedCmp10
          +     0.14083843787444 * AcceptedCmp20  +     0.35339306333755 * 
        AcceptedCmp30  +     0.18353806616447 * AcceptedCmp40
          +      0.1789056537211 * AcceptedCmp50  +     -0.0778376167893 * 
        Complain0  +    -0.42804187853556 * HigherEducationBinary0 ;
   H14  = H14  +     -0.1827583424217 * AcceptedCmp10
          +     -0.1489832073407 * AcceptedCmp20  +     0.19258598777521 * 
        AcceptedCmp30  +    -0.09050532815681 * AcceptedCmp40
          +     0.31883627486144 * AcceptedCmp50  +    -0.45377259681397 * 
        Complain0  +     0.15391344192243 * HigherEducationBinary0 ;
   H15  = H15  +     0.27865852917942 * AcceptedCmp10
          +       0.138287927284 * AcceptedCmp20  +     0.16317472998408 * 
        AcceptedCmp30  +    -0.05372991123771 * AcceptedCmp40
          +     0.10581002090735 * AcceptedCmp50  +     -0.1352393114395 * 
        Complain0  +    -0.01276168923951 * HigherEducationBinary0 ;
   H16  = H16  +     0.54923092188785 * AcceptedCmp10
          +     0.06197589967314 * AcceptedCmp20  +    -0.16384237649268 * 
        AcceptedCmp30  +     0.19164251659143 * AcceptedCmp40
          +     -0.0276972319359 * AcceptedCmp50  +     0.24239824406043 * 
        Complain0  +    -0.10846507318888 * HigherEducationBinary0 ;
   H11  = H11  +     0.04065157802519 * Education2n_Cycle
          +     0.07405354529938 * EducationBasic  +    -0.27041205259916 * 
        EducationGraduation  +     0.19305680604676 * EducationMaster
          +    -0.26816495704747 * Marital_StatusDivorced
          +     0.29673114151649 * Marital_StatusMarried
          +    -0.41626876543099 * Marital_StatusSingle
          +     0.09243411924301 * Marital_StatusTogether ;
   H12  = H12  +     0.01524024349677 * Education2n_Cycle
          +     0.15070908916981 * EducationBasic  +     0.08422316601088 * 
        EducationGraduation  +     -0.1896291301388 * EducationMaster
          +     0.11744127787391 * Marital_StatusDivorced
          +    -0.63703361207291 * Marital_StatusMarried
          +     0.57071735977739 * Marital_StatusSingle
          +    -0.68611342778218 * Marital_StatusTogether ;
   H13  = H13  +     0.09605604995794 * Education2n_Cycle
          +    -0.04349642322783 * EducationBasic  +    -0.11196808839685 * 
        EducationGraduation  +    -0.01261925630364 * EducationMaster
          +     -0.1701911327485 * Marital_StatusDivorced
          +     0.22770672854155 * Marital_StatusMarried
          +    -0.00691671702288 * Marital_StatusSingle
          +       0.236686912143 * Marital_StatusTogether ;
   H14  = H14  +     0.10857873061564 * Education2n_Cycle
          +     0.16814453951395 * EducationBasic  +    -0.34874327957426 * 
        EducationGraduation  +    -0.25193270521624 * EducationMaster
          +    -0.15403542879027 * Marital_StatusDivorced
          +     0.02652360752468 * Marital_StatusMarried
          +    -0.10723298292119 * Marital_StatusSingle
          +     0.11548543150405 * Marital_StatusTogether ;
   H15  = H15  +     0.15880112810083 * Education2n_Cycle
          +     0.24466813535709 * EducationBasic  +    -0.03905452635368 * 
        EducationGraduation  +    -0.24152136481937 * EducationMaster
          +    -0.00204417192532 * Marital_StatusDivorced
          +    -0.16973417192262 * Marital_StatusMarried
          +     0.23027366297507 * Marital_StatusSingle
          +     0.08101453661219 * Marital_StatusTogether ;
   H16  = H16  +     0.06080074855433 * Education2n_Cycle
          +     0.05712541606796 * EducationBasic  +     0.08565135130429 * 
        EducationGraduation  +    -0.35693831321015 * EducationMaster
          +     0.23360275712164 * Marital_StatusDivorced
          +    -0.12276379115508 * Marital_StatusMarried
          +     0.25482197877469 * Marital_StatusSingle
          +    -0.38122499701658 * Marital_StatusTogether ;
   H11  =    -1.45785613717334 + H11 ;
   H12  =    -1.39199534011753 + H12 ;
   H13  =     2.43348807391253 + H13 ;
   H14  =    -0.82674437249292 + H14 ;
   H15  =     1.84262829639962 + H15 ;
   H16  =     1.40892711992493 + H16 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -2.98548396417337 * H11  +     3.55440982243177 * H12
          +    -1.98442501061115 * H13  +    -2.67879549563082 * H14
          +    -2.68634609959794 * H15  +     3.13238014605319 * H16 ;
   P_DepVar1  =    -2.49443575387204 + P_DepVar1 ;
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
