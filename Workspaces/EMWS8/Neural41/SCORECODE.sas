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
   H11  =     0.00008202203841 * S_AcceptedCmpTotal  +    -0.13126483592154 * 
        S_Age  +    -0.18503379491116 * S_Frq  +      0.0037482920266 * 
        S_Income  +    -0.52684337240504 * S_Kidhome
          +     0.07835956947085 * S_MntFishProducts
          +    -0.04668308882455 * S_MntFruits  +     0.05311471984852 * 
        S_MntGoldProds  +    -0.39576933150762 * S_MntSweetProducts
          +    -0.44463888327841 * S_MonthsAsCustomer
          +    -0.20310227710644 * S_NumDealsPurchases
          +     0.06594467408568 * S_NumWebVisitsMonth
          +      0.1351556470497 * S_RFMstat  +    -0.29446460505048 * 
        S_RMntFrq  +    -0.68878207173764 * S_Recency
          +    -0.29241927123525 * S_Teenhome ;
   H12  =     0.38864749644126 * S_AcceptedCmpTotal  +    -0.01077611135972 * 
        S_Age  +     0.24187074268223 * S_Frq  +     0.64180191864108 * 
        S_Income  +     0.91025818069308 * S_Kidhome
          +     0.26585860774761 * S_MntFishProducts
          +     -0.3087386188037 * S_MntFruits  +     0.14643568534568 * 
        S_MntGoldProds  +     0.23763200275034 * S_MntSweetProducts
          +    -0.12421403342454 * S_MonthsAsCustomer
          +     0.66931066909347 * S_NumDealsPurchases
          +     0.35050056776957 * S_NumWebVisitsMonth
          +     0.16127659142199 * S_RFMstat  +     0.04112742589329 * 
        S_RMntFrq  +    -0.83075146355987 * S_Recency
          +    -0.37723917156575 * S_Teenhome ;
   H13  =     0.02339384767281 * S_AcceptedCmpTotal  +    -0.17700567590774 * 
        S_Age  +    -0.38060509731554 * S_Frq  +    -0.86026143079344 * 
        S_Income  +     0.63027536562783 * S_Kidhome
          +     0.15303249164566 * S_MntFishProducts
          +    -0.04780128957622 * S_MntFruits  +    -0.02064261038049 * 
        S_MntGoldProds  +     0.26238383938455 * S_MntSweetProducts
          +    -0.21006970062531 * S_MonthsAsCustomer
          +      0.2955774677605 * S_NumDealsPurchases
          +    -0.15769947513958 * S_NumWebVisitsMonth
          +    -0.02874776268384 * S_RFMstat  +     -0.3955429869434 * 
        S_RMntFrq  +      0.3744122250079 * S_Recency
          +     0.58295521976226 * S_Teenhome ;
   H14  =    -0.22800152627721 * S_AcceptedCmpTotal  +     0.27991667815594 * 
        S_Age  +     0.89001922321833 * S_Frq  +     0.17467731177386 * 
        S_Income  +    -0.00985947331416 * S_Kidhome
          +    -0.27114701164817 * S_MntFishProducts
          +     0.32554392037328 * S_MntFruits  +     0.06705670808471 * 
        S_MntGoldProds  +     -0.3590087223323 * S_MntSweetProducts
          +    -0.02702818828921 * S_MonthsAsCustomer
          +    -0.63381188911946 * S_NumDealsPurchases
          +    -0.86143000704363 * S_NumWebVisitsMonth
          +    -0.16788755655818 * S_RFMstat  +    -0.09712800982817 * 
        S_RMntFrq  +     0.61892338869919 * S_Recency
          +    -0.21544816860839 * S_Teenhome ;
   H15  =      0.0846389232492 * S_AcceptedCmpTotal  +    -0.03933692648164 * 
        S_Age  +     0.26004669807852 * S_Frq  +     0.30306661543325 * 
        S_Income  +    -0.24206929946772 * S_Kidhome
          +    -0.19039689229491 * S_MntFishProducts
          +    -0.22957509816007 * S_MntFruits  +    -0.35006912387254 * 
        S_MntGoldProds  +    -0.02737135204648 * S_MntSweetProducts
          +     0.03815221487927 * S_MonthsAsCustomer
          +    -0.43579024169696 * S_NumDealsPurchases
          +    -0.27796253880432 * S_NumWebVisitsMonth
          +     0.15010895791429 * S_RFMstat  +     0.24377797912725 * 
        S_RMntFrq  +     0.50547916383425 * S_Recency
          +    -0.22622962943787 * S_Teenhome ;
   H16  =     0.03788304209102 * S_AcceptedCmpTotal  +    -0.27022676521755 * 
        S_Age  +    -0.17480141247917 * S_Frq  +     0.53345624791204 * 
        S_Income  +    -0.25736924536467 * S_Kidhome
          +    -0.04400855145817 * S_MntFishProducts
          +    -0.06651358259718 * S_MntFruits  +     -0.0117104183032 * 
        S_MntGoldProds  +    -0.02790266219853 * S_MntSweetProducts
          +     0.00265986106691 * S_MonthsAsCustomer
          +     0.27331919080312 * S_NumDealsPurchases
          +     0.22836119952787 * S_NumWebVisitsMonth
          +     0.09245783028838 * S_RFMstat  +     0.10223459152488 * 
        S_RMntFrq  +    -0.90398250269857 * S_Recency
          +     -0.2621421532112 * S_Teenhome ;
   H11  = H11  +     0.24155985997122 * AcceptedCmp10
          +     0.02727843300562 * AcceptedCmp20  +     0.05990453920581 * 
        AcceptedCmp30  +    -0.43469138041411 * AcceptedCmp40
          +     0.00076050589964 * AcceptedCmp50  +     0.43307119233671 * 
        Complain0  +     0.23242177664865 * HigherEducationBinary0 ;
   H12  = H12  +     0.04034689771488 * AcceptedCmp10
          +    -0.01358747117911 * AcceptedCmp20  +    -0.29883922116453 * 
        AcceptedCmp30  +     0.58794258522438 * AcceptedCmp40
          +    -0.40659406037079 * AcceptedCmp50  +     0.59068991602469 * 
        Complain0  +     -0.3122461557933 * HigherEducationBinary0 ;
   H13  = H13  +     0.49941486221932 * AcceptedCmp10
          +     0.42891153022885 * AcceptedCmp20  +     0.28744085742243 * 
        AcceptedCmp30  +     0.54657253664873 * AcceptedCmp40
          +     0.10655487579255 * AcceptedCmp50  +     0.11223153893952 * 
        Complain0  +    -0.44704943665138 * HigherEducationBinary0 ;
   H14  = H14  +     0.70510583713907 * AcceptedCmp10
          +     0.04052111261969 * AcceptedCmp20  +     0.76301816100625 * 
        AcceptedCmp30  +     0.09753552533639 * AcceptedCmp40
          +     0.40999088454383 * AcceptedCmp50  +     0.19278448059725 * 
        Complain0  +     0.09127136236268 * HigherEducationBinary0 ;
   H15  = H15  +     0.30535300313392 * AcceptedCmp10
          +    -0.01605332227631 * AcceptedCmp20  +     0.09278623651632 * 
        AcceptedCmp30  +     0.03468239765482 * AcceptedCmp40
          +     0.19720723485806 * AcceptedCmp50  +    -0.32364247007443 * 
        Complain0  +    -0.20695533150084 * HigherEducationBinary0 ;
   H16  = H16  +    -0.19354253973215 * AcceptedCmp10
          +     0.01566685138596 * AcceptedCmp20  +    -0.28250218144785 * 
        AcceptedCmp30  +    -0.13118265240955 * AcceptedCmp40
          +    -0.03808858956936 * AcceptedCmp50  +    -0.19850701105147 * 
        Complain0  +     0.14297616111345 * HigherEducationBinary0 ;
   H11  = H11  +     0.05082493200436 * Education2n_Cycle
          +    -0.08192239267323 * EducationBasic  +    -0.01445849926378 * 
        EducationGraduation  +     0.01459143816519 * EducationMaster
          +     0.12502276672336 * Marital_StatusDivorced
          +    -0.02606508453741 * Marital_StatusMarried
          +      0.0418850245266 * Marital_StatusSingle
          +     0.02050996572132 * Marital_StatusTogether ;
   H12  = H12  +     -0.1900759238575 * Education2n_Cycle
          +     0.13535241443003 * EducationBasic  +    -0.00199771592906 * 
        EducationGraduation  +     0.00476193515914 * EducationMaster
          +      0.1943860669795 * Marital_StatusDivorced
          +     -0.1529596261268 * Marital_StatusMarried
          +     0.24187461301348 * Marital_StatusSingle
          +     0.09157538589749 * Marital_StatusTogether ;
   H13  = H13  +     0.02140936656506 * Education2n_Cycle
          +     0.05845427475503 * EducationBasic  +    -0.44298208278895 * 
        EducationGraduation  +     0.17149477011717 * EducationMaster
          +    -0.19677652422622 * Marital_StatusDivorced
          +     0.75897106429478 * Marital_StatusMarried
          +    -0.66692260284833 * Marital_StatusSingle
          +     0.58287349221333 * Marital_StatusTogether ;
   H14  = H14  +     0.18801855635785 * Education2n_Cycle
          +    -0.06231007239836 * EducationBasic  +    -0.26915940640311 * 
        EducationGraduation  +    -0.30689797876717 * EducationMaster
          +    -0.18964222971122 * Marital_StatusDivorced
          +    -0.15222045956879 * Marital_StatusMarried
          +     0.15455795695595 * Marital_StatusSingle
          +    -0.04060840399479 * Marital_StatusTogether ;
   H15  = H15  +    -0.12131367369042 * Education2n_Cycle
          +     0.20547688844423 * EducationBasic  +     0.04965529549437 * 
        EducationGraduation  +    -0.21811990669176 * EducationMaster
          +    -0.10122776921995 * Marital_StatusDivorced
          +     0.14126755564161 * Marital_StatusMarried
          +    -0.18463644418978 * Marital_StatusSingle
          +     0.23071597384519 * Marital_StatusTogether ;
   H16  = H16  +     0.02961881390411 * Education2n_Cycle
          +    -0.46228434914367 * EducationBasic  +    -0.08513280071643 * 
        EducationGraduation  +    -0.20159542694386 * EducationMaster
          +     0.05009431660662 * Marital_StatusDivorced
          +    -0.38407798045329 * Marital_StatusMarried
          +      0.3035257398654 * Marital_StatusSingle
          +    -0.27725923319119 * Marital_StatusTogether ;
   H11  =      1.3960587011002 + H11 ;
   H12  =     0.18947019063375 + H12 ;
   H13  =     0.55907472867898 + H13 ;
   H14  =     0.28336290184268 + H14 ;
   H15  =     1.08919536550159 + H15 ;
   H16  =    -0.22538308534609 + H16 ;
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
   P_DepVar1  =      1.1921632715983 * H11  +     2.38386446186622 * H12
          +    -2.42409896638067 * H13  +    -2.19084949788904 * H14
          +      -0.380575449439 * H15  +     1.17350595805971 * H16 ;
   P_DepVar1  =    -1.70154799161574 + P_DepVar1 ;
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
