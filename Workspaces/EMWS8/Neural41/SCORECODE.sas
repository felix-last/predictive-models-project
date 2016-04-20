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
   S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 * 
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
   ELSE S_MonthsAsCustomer  =    -4.93133031507839 +     0.05900664899872 * 
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
   H11  =      0.0008226807158 * S_AcceptedCmpTotal  +    -0.13079988413445 * 
        S_Age  +    -0.18186889239879 * S_Frq  +     0.00434831119231 * 
        S_Income  +    -0.53011815040389 * S_Kidhome
          +     0.07798575279605 * S_MntFishProducts
          +    -0.04638001961046 * S_MntFruits  +     0.05519829379656 * 
        S_MntGoldProds  +    -0.39625749892117 * S_MntSweetProducts
          +    -0.43868326715852 * S_MonthsAsCustomer
          +    -0.20150528265823 * S_NumDealsPurchases
          +     0.06302113040532 * S_NumWebVisitsMonth
          +      0.1350599599417 * S_RFMstat  +    -0.29383555338259 * 
        S_RMntFrq  +    -0.68766827249955 * S_Recency
          +    -0.29183727562247 * S_Teenhome ;
   H12  =     0.39055667226149 * S_AcceptedCmpTotal  +    -0.01370934848049 * 
        S_Age  +     0.24087739377669 * S_Frq  +      0.6385645265661 * 
        S_Income  +     0.91005509221929 * S_Kidhome
          +     0.26314513971971 * S_MntFishProducts
          +    -0.31269343103037 * S_MntFruits  +     0.14926981327092 * 
        S_MntGoldProds  +     0.23823473046762 * S_MntSweetProducts
          +    -0.11762692239171 * S_MonthsAsCustomer
          +     0.66369415921808 * S_NumDealsPurchases
          +     0.34818395961585 * S_NumWebVisitsMonth
          +     0.15957643046632 * S_RFMstat  +       0.043074454712 * 
        S_RMntFrq  +     -0.8279410878863 * S_Recency
          +    -0.37857896695074 * S_Teenhome ;
   H13  =     0.01761535715706 * S_AcceptedCmpTotal  +      -0.178245965481 * 
        S_Age  +    -0.38345114554341 * S_Frq  +    -0.85875480356991 * 
        S_Income  +     0.62650302214702 * S_Kidhome
          +     0.15114878471783 * S_MntFishProducts
          +    -0.04867026102421 * S_MntFruits  +    -0.02464340314012 * 
        S_MntGoldProds  +     0.25958757216658 * S_MntSweetProducts
          +    -0.21247922433607 * S_MonthsAsCustomer
          +     0.29870259291589 * S_NumDealsPurchases
          +    -0.15551171574573 * S_NumWebVisitsMonth
          +    -0.02668833787849 * S_RFMstat  +     -0.3938077247244 * 
        S_RMntFrq  +     0.37292679100385 * S_Recency
          +     0.58536255154591 * S_Teenhome ;
   H14  =    -0.23067808386271 * S_AcceptedCmpTotal  +      0.2795284747435 * 
        S_Age  +     0.88920181420929 * S_Frq  +     0.17396080204168 * 
        S_Income  +    -0.00823748207218 * S_Kidhome
          +    -0.26914878127706 * S_MntFishProducts
          +     0.32721028770496 * S_MntFruits  +     0.07070268272045 * 
        S_MntGoldProds  +    -0.35290123515707 * S_MntSweetProducts
          +    -0.02974642168316 * S_MonthsAsCustomer
          +    -0.63307764160477 * S_NumDealsPurchases
          +    -0.86210034703857 * S_NumWebVisitsMonth
          +    -0.16450375531942 * S_RFMstat  +     -0.0920077372506 * 
        S_RMntFrq  +     0.61882336952278 * S_Recency
          +    -0.21217863284358 * S_Teenhome ;
   H15  =     0.08444141658062 * S_AcceptedCmpTotal  +    -0.03922634475077 * 
        S_Age  +     0.26114587238563 * S_Frq  +     0.30374331939028 * 
        S_Income  +     -0.2421178734201 * S_Kidhome
          +    -0.19019330388039 * S_MntFishProducts
          +    -0.22928418606812 * S_MntFruits  +    -0.34980290580426 * 
        S_MntGoldProds  +    -0.02640373527826 * S_MntSweetProducts
          +     0.04217213390907 * S_MonthsAsCustomer
          +    -0.43394541277085 * S_NumDealsPurchases
          +    -0.27821724458462 * S_NumWebVisitsMonth
          +     0.15130301601187 * S_RFMstat  +     0.24450838354469 * 
        S_RMntFrq  +     0.50442944125738 * S_Recency
          +     -0.2256501036913 * S_Teenhome ;
   H16  =     0.04374591358456 * S_AcceptedCmpTotal  +     -0.2751915893845 * 
        S_Age  +    -0.17372079221228 * S_Frq  +     0.53295067221555 * 
        S_Income  +    -0.25554119630622 * S_Kidhome
          +    -0.04166493246597 * S_MntFishProducts
          +    -0.06487290273448 * S_MntFruits  +    -0.00905943807166 * 
        S_MntGoldProds  +    -0.02954875571593 * S_MntSweetProducts
          +    -0.00047914053162 * S_MonthsAsCustomer
          +     0.27113708386032 * S_NumDealsPurchases
          +      0.2230890818172 * S_NumWebVisitsMonth
          +     0.08637996401688 * S_RFMstat  +     0.10242942070091 * 
        S_RMntFrq  +    -0.89858232865076 * S_Recency
          +    -0.26683150727678 * S_Teenhome ;
   H11  = H11  +      0.2420532776991 * AcceptedCmp10
          +     0.02694604108098 * AcceptedCmp20  +     0.06010577635911 * 
        AcceptedCmp30  +    -0.43469683295349 * AcceptedCmp40
          +    -0.00225551219247 * AcceptedCmp50  +     0.43197139863535 * 
        Complain0  +      0.2323752775589 * HigherEducationBinary0 ;
   H12  = H12  +      0.0418845409836 * AcceptedCmp10
          +    -0.01079705732899 * AcceptedCmp20  +    -0.29526959542283 * 
        AcceptedCmp30  +     0.58938855079432 * AcceptedCmp40
          +    -0.40652812652647 * AcceptedCmp50  +       0.594077548144 * 
        Complain0  +    -0.31255483011975 * HigherEducationBinary0 ;
   H13  = H13  +     0.49883844557768 * AcceptedCmp10
          +     0.42674404967605 * AcceptedCmp20  +     0.29339018006371 * 
        AcceptedCmp30  +     0.54178658137703 * AcceptedCmp40
          +     0.11058374076127 * AcceptedCmp50  +     0.11090027293948 * 
        Complain0  +    -0.44686878118331 * HigherEducationBinary0 ;
   H14  = H14  +     0.70177037762742 * AcceptedCmp10
          +     0.03868361905724 * AcceptedCmp20  +      0.7582949125852 * 
        AcceptedCmp30  +     0.10306711606837 * AcceptedCmp40
          +     0.40988843645402 * AcceptedCmp50  +     0.19161446313882 * 
        Complain0  +     0.09113445636937 * HigherEducationBinary0 ;
   H15  = H15  +     0.30528471213622 * AcceptedCmp10
          +    -0.01583520039877 * AcceptedCmp20  +     0.09319095124312 * 
        AcceptedCmp30  +     0.03503111555527 * AcceptedCmp40
          +     0.19732231305873 * AcceptedCmp50  +    -0.32344950489145 * 
        Complain0  +    -0.20793136544812 * HigherEducationBinary0 ;
   H16  = H16  +      -0.197363329461 * AcceptedCmp10
          +     0.01373408247141 * AcceptedCmp20  +    -0.28302701132077 * 
        AcceptedCmp30  +    -0.13213187292914 * AcceptedCmp40
          +    -0.04492941290682 * AcceptedCmp50  +     -0.1996561599765 * 
        Complain0  +     0.14532553420948 * HigherEducationBinary0 ;
   H11  = H11  +     0.05185932264462 * Education2n_Cycle
          +    -0.08049073469669 * EducationBasic  +    -0.01273883208394 * 
        EducationGraduation  +     0.01672434885938 * EducationMaster
          +      0.1247897348584 * Marital_StatusDivorced
          +    -0.02487802842095 * Marital_StatusMarried
          +     0.04087485047811 * Marital_StatusSingle
          +     0.02032230199979 * Marital_StatusTogether ;
   H12  = H12  +    -0.18957172593422 * Education2n_Cycle
          +     0.13527696352941 * EducationBasic  +    -0.00239660031532 * 
        EducationGraduation  +     0.00550624186666 * EducationMaster
          +     0.19258280536293 * Marital_StatusDivorced
          +     -0.1513365484224 * Marital_StatusMarried
          +     0.24428021275955 * Marital_StatusSingle
          +     0.09103830773223 * Marital_StatusTogether ;
   H13  = H13  +     0.02098627668197 * Education2n_Cycle
          +      0.0580330260954 * EducationBasic  +    -0.44505513897295 * 
        EducationGraduation  +     0.17237699716249 * EducationMaster
          +    -0.19344679470577 * Marital_StatusDivorced
          +     0.75587070758138 * Marital_StatusMarried
          +    -0.65993136500147 * Marital_StatusSingle
          +     0.58034892534704 * Marital_StatusTogether ;
   H14  = H14  +      0.1859168336856 * Education2n_Cycle
          +    -0.06308135212768 * EducationBasic  +    -0.27356179131381 * 
        EducationGraduation  +      -0.306174241941 * EducationMaster
          +    -0.18717675910714 * Marital_StatusDivorced
          +    -0.15181048866652 * Marital_StatusMarried
          +     0.15597021159938 * Marital_StatusSingle
          +    -0.03726120161813 * Marital_StatusTogether ;
   H15  = H15  +    -0.12193342286067 * Education2n_Cycle
          +     0.20525778906074 * EducationBasic  +     0.04967185521727 * 
        EducationGraduation  +    -0.21821780206446 * EducationMaster
          +    -0.10132599459296 * Marital_StatusDivorced
          +     0.14113826410264 * Marital_StatusMarried
          +    -0.18380525511118 * Marital_StatusSingle
          +     0.23156188953493 * Marital_StatusTogether ;
   H16  = H16  +     0.03162941262342 * Education2n_Cycle
          +    -0.45867622010455 * EducationBasic  +    -0.08178251039016 * 
        EducationGraduation  +     -0.1990982641521 * EducationMaster
          +     0.04797839463285 * Marital_StatusDivorced
          +    -0.38756124755799 * Marital_StatusMarried
          +      0.3042262890255 * Marital_StatusSingle
          +    -0.28172576605756 * Marital_StatusTogether ;
   H11  =     1.39567717675367 + H11 ;
   H12  =     0.19220435511693 + H12 ;
   H13  =     0.55786873663699 + H13 ;
   H14  =     0.28152400973799 + H14 ;
   H15  =     1.08936778651476 + H15 ;
   H16  =     -0.2268073967479 + H16 ;
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
   P_DepVar1  =       1.190486795477 * H11  +     2.38320433896182 * H12
          +    -2.42159759131581 * H13  +    -2.18917732939624 * H14
          +    -0.38101990662686 * H15  +     1.17308047763791 * H16 ;
   P_DepVar1  =    -1.69959324221607 + P_DepVar1 ;
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
