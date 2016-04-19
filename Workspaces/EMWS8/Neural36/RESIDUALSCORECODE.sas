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
   H11  =     0.36102409886134 * S_AcceptedCmpTotal  +     0.13395156650326 * 
        S_Age  +    -0.24538302428059 * S_Frq  +    -0.11572058197557 * 
        S_Income  +     0.21790378443814 * S_Kidhome
          +    -0.08134586316395 * S_MntFishProducts
          +     -0.2688648060203 * S_MntFruits  +    -0.25880035211038 * 
        S_MntGoldProds  +     0.07531502626045 * S_MntSweetProducts
          +     0.21726816930291 * S_MonthsAsCustomer
          +    -0.21824241156847 * S_NumDealsPurchases
          +     0.07727563921761 * S_NumWebVisitsMonth
          +     0.09027808324069 * S_RFMstat  +     -0.0189462843628 * 
        S_RMntFrq  +     0.15658915596853 * S_Recency
          +     0.18680606168417 * S_Teenhome ;
   H12  =    -0.50461866181934 * S_AcceptedCmpTotal  +     0.01266437730767 * 
        S_Age  +     0.02534169432751 * S_Frq  +    -0.89441458532035 * 
        S_Income  +    -0.51036141680293 * S_Kidhome
          +     0.10879858722875 * S_MntFishProducts
          +    -0.05639987269313 * S_MntFruits  +    -0.43702228668285 * 
        S_MntGoldProds  +     0.18909754042399 * S_MntSweetProducts
          +    -0.11392977531374 * S_MonthsAsCustomer
          +     -0.5318843752274 * S_NumDealsPurchases
          +    -0.65796537312585 * S_NumWebVisitsMonth
          +    -0.29571612685484 * S_RFMstat  +     -0.0801458884647 * 
        S_RMntFrq  +     0.73429478940872 * S_Recency
          +     0.28950334189528 * S_Teenhome ;
   H13  =    -0.22612994964695 * S_AcceptedCmpTotal  +     0.04392639924073 * 
        S_Age  +     0.32974877429932 * S_Frq  +    -0.26990824722212 * 
        S_Income  +     0.59254092901621 * S_Kidhome
          +    -0.20448500725841 * S_MntFishProducts
          +     0.09904900315476 * S_MntFruits  +     0.33085368683805 * 
        S_MntGoldProds  +     0.19272280339022 * S_MntSweetProducts
          +     0.75084411765835 * S_MonthsAsCustomer
          +     -0.0387146296237 * S_NumDealsPurchases
          +    -0.28387522584505 * S_NumWebVisitsMonth
          +    -0.15204072409221 * S_RFMstat  +     0.09340123133096 * 
        S_RMntFrq  +     0.82636976290684 * S_Recency
          +     0.37810091232378 * S_Teenhome ;
   H14  =    -0.30228547708859 * S_AcceptedCmpTotal  +     0.03241560550242 * 
        S_Age  +     0.84298653991521 * S_Frq  +     0.08457309547848 * 
        S_Income  +    -0.00122834275949 * S_Kidhome
          +    -0.27566379985337 * S_MntFishProducts
          +     0.22439349557664 * S_MntFruits  +     -0.2238462316234 * 
        S_MntGoldProds  +     0.10162320730644 * S_MntSweetProducts
          +    -0.04164317708211 * S_MonthsAsCustomer
          +    -0.69362879353268 * S_NumDealsPurchases
          +    -0.42590146496797 * S_NumWebVisitsMonth
          +    -0.14963136795323 * S_RFMstat  +    -0.12684701620224 * 
        S_RMntFrq  +     0.84758472963267 * S_Recency
          +     0.11712588251204 * S_Teenhome ;
   H15  =    -0.07826142783822 * S_AcceptedCmpTotal  +     0.02869519269506 * 
        S_Age  +     0.47709626753648 * S_Frq  +     0.77626478438802 * 
        S_Income  +    -0.52116533001423 * S_Kidhome
          +     -0.0164127050263 * S_MntFishProducts
          +    -0.21044074963391 * S_MntFruits  +    -0.01106715629962 * 
        S_MntGoldProds  +    -0.04742180634458 * S_MntSweetProducts
          +     0.24190773546087 * S_MonthsAsCustomer
          +    -0.20709839635746 * S_NumDealsPurchases
          +    -0.03892039672539 * S_NumWebVisitsMonth
          +     0.01844174922581 * S_RFMstat  +     0.33852543335405 * 
        S_RMntFrq  +    -0.44935213795722 * S_Recency
          +     -0.6298368435821 * S_Teenhome ;
   H16  =    -0.38278200147216 * S_AcceptedCmpTotal  +     0.10976543329989 * 
        S_Age  +    -0.17634499366273 * S_Frq  +    -0.00464219628456 * 
        S_Income  +     0.02656798188894 * S_Kidhome
          +     0.30126647035438 * S_MntFishProducts
          +    -0.15329042297108 * S_MntFruits  +     0.34485619618635 * 
        S_MntGoldProds  +    -0.02131109278943 * S_MntSweetProducts
          +     0.02225077975252 * S_MonthsAsCustomer
          +    -0.25574607065737 * S_NumDealsPurchases
          +    -0.17649073415066 * S_NumWebVisitsMonth
          +    -0.05940264496746 * S_RFMstat  +    -0.10060551243835 * 
        S_RMntFrq  +    -0.26823576982436 * S_Recency
          +    -0.02089829217347 * S_Teenhome ;
   H17  =     0.19294816663728 * S_AcceptedCmpTotal  +    -0.36492507147362 * 
        S_Age  +     -0.5026822541815 * S_Frq  +    -0.48143237402929 * 
        S_Income  +     0.24859715564668 * S_Kidhome
          +    -0.25170385966484 * S_MntFishProducts
          +     0.32613161868695 * S_MntFruits  +     0.13394374893255 * 
        S_MntGoldProds  +     0.48416151380913 * S_MntSweetProducts
          +     0.05219342683802 * S_MonthsAsCustomer
          +     0.43291262348863 * S_NumDealsPurchases
          +     0.56350506449265 * S_NumWebVisitsMonth
          +     0.07050038692379 * S_RFMstat  +     0.09321760948671 * 
        S_RMntFrq  +      -0.582152401129 * S_Recency
          +     0.37123217787922 * S_Teenhome ;
   H11  = H11  +     0.19124500210188 * AcceptedCmp10
          +    -0.07164186578541 * AcceptedCmp20  +     0.21783016367597 * 
        AcceptedCmp30  +     0.21148394728435 * AcceptedCmp40
          +    -0.03026880266191 * AcceptedCmp50  +    -0.07201946966594 * 
        Complain0  +     0.01809478462337 * HigherEducationBinary0 ;
   H12  = H12  +    -0.08224648561215 * AcceptedCmp10
          +    -0.04262229291512 * AcceptedCmp20  +     0.31730600734378 * 
        AcceptedCmp30  +    -0.50103336510524 * AcceptedCmp40
          +     0.14654032457963 * AcceptedCmp50  +     -0.3081029727525 * 
        Complain0  +     0.33420373179467 * HigherEducationBinary0 ;
   H13  = H13  +     -0.2675286852338 * AcceptedCmp10
          +     0.00293684627092 * AcceptedCmp20  +     0.17042784679702 * 
        AcceptedCmp30  +    -0.03300348487228 * AcceptedCmp40
          +     0.18139562224546 * AcceptedCmp50  +     -0.5876653777255 * 
        Complain0  +      -0.348312724013 * HigherEducationBinary0 ;
   H14  = H14  +     0.62345895952335 * AcceptedCmp10
          +     0.06420128732689 * AcceptedCmp20  +     0.32944172885024 * 
        AcceptedCmp30  +    -0.04719511461619 * AcceptedCmp40
          +     0.61833640682482 * AcceptedCmp50  +     -0.0006656764006 * 
        Complain0  +    -0.12356778452039 * HigherEducationBinary0 ;
   H15  = H15  +    -0.43202592233127 * AcceptedCmp10
          +    -0.35346067325701 * AcceptedCmp20  +    -0.29446055239371 * 
        AcceptedCmp30  +     -0.6355060868005 * AcceptedCmp40
          +     0.08763000125481 * AcceptedCmp50  +    -0.55439066852712 * 
        Complain0  +     0.37078134908454 * HigherEducationBinary0 ;
   H16  = H16  +    -0.10522820178908 * AcceptedCmp10
          +     0.20645125728354 * AcceptedCmp20  +     0.34040121966792 * 
        AcceptedCmp30  +    -0.02259616994399 * AcceptedCmp40
          +    -0.22123397523195 * AcceptedCmp50  +    -0.37258892216723 * 
        Complain0  +     0.14107103807235 * HigherEducationBinary0 ;
   H17  = H17  +    -0.09096203784003 * AcceptedCmp10
          +    -0.04735484605229 * AcceptedCmp20  +     -0.4485810761844 * 
        AcceptedCmp30  +     0.10362320405529 * AcceptedCmp40
          +    -0.05214433990448 * AcceptedCmp50  +    -0.19339827696554 * 
        Complain0  +    -0.21246690264814 * HigherEducationBinary0 ;
   H11  = H11  +    -0.16759278562529 * Education2n_Cycle
          +    -0.31449574789464 * EducationBasic  +     0.13281408830843 * 
        EducationGraduation  +      0.0199258483942 * EducationMaster
          +     0.03245181998921 * Marital_StatusDivorced
          +     0.29722741247663 * Marital_StatusMarried
          +    -0.05683085497262 * Marital_StatusSingle
          +     0.27914630307932 * Marital_StatusTogether ;
   H12  = H12  +    -0.10709422401859 * Education2n_Cycle
          +     0.25457515905931 * EducationBasic  +    -0.26018740430941 * 
        EducationGraduation  +     0.05808954602972 * EducationMaster
          +    -0.13095826187081 * Marital_StatusDivorced
          +     0.29509760197193 * Marital_StatusMarried
          +    -0.21019918550166 * Marital_StatusSingle
          +     0.12557122666089 * Marital_StatusTogether ;
   H13  = H13  +     0.16189957128414 * Education2n_Cycle
          +    -0.08593025695878 * EducationBasic  +     0.11065463845302 * 
        EducationGraduation  +    -0.23434271231945 * EducationMaster
          +     0.03746692643939 * Marital_StatusDivorced
          +     0.03482798841727 * Marital_StatusMarried
          +     0.16645207250571 * Marital_StatusSingle
          +    -0.40169040281111 * Marital_StatusTogether ;
   H14  = H14  +      0.0929589076858 * Education2n_Cycle
          +     0.17576896755796 * EducationBasic  +    -0.08548079761525 * 
        EducationGraduation  +     -0.0086494793343 * EducationMaster
          +     -0.0753971504765 * Marital_StatusDivorced
          +     0.20446719655724 * Marital_StatusMarried
          +     0.21472836757686 * Marital_StatusSingle
          +     0.25097210445128 * Marital_StatusTogether ;
   H15  = H15  +     0.05613706593293 * Education2n_Cycle
          +     0.15733773983498 * EducationBasic  +     0.18710928885666 * 
        EducationGraduation  +    -0.40226962940436 * EducationMaster
          +     0.16191937298215 * Marital_StatusDivorced
          +    -0.81780658848614 * Marital_StatusMarried
          +     0.84981159748349 * Marital_StatusSingle
          +    -0.81246154443713 * Marital_StatusTogether ;
   H16  = H16  +    -0.15143146742513 * Education2n_Cycle
          +    -0.32039616194876 * EducationBasic  +     0.14759493683433 * 
        EducationGraduation  +    -0.24148020292763 * EducationMaster
          +    -0.01766312280073 * Marital_StatusDivorced
          +     0.04455346003394 * Marital_StatusMarried
          +    -0.05433982251127 * Marital_StatusSingle
          +     0.07585750304293 * Marital_StatusTogether ;
   H17  = H17  +    -0.18844639887236 * Education2n_Cycle
          +     0.31793429928185 * EducationBasic  +     0.21885580860665 * 
        EducationGraduation  +      0.1367538666381 * EducationMaster
          +        0.22905595967 * Marital_StatusDivorced
          +      0.1024998677695 * Marital_StatusMarried
          +    -0.07752101768018 * Marital_StatusSingle
          +    -0.19408218868635 * Marital_StatusTogether ;
   H11  =     1.31548476078312 + H11 ;
   H12  =     0.20389286508203 + H12 ;
   H13  =    -0.77820109969785 + H13 ;
   H14  =     0.85462770897247 + H14 ;
   H15  =    -0.15190484788676 + H15 ;
   H16  =     -0.7146854381659 + H16 ;
   H17  =    -1.06220893322882 + H17 ;
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
   P_DepVar1  =    -0.11628699177184 * H11  +    -2.70843270240794 * H12
          +    -1.81814079406916 * H13  +    -1.84852165774564 * H14
          +     2.53533827620448 * H15  +    -0.20106950795136 * H16
          +     1.26058098194871 * H17 ;
   P_DepVar1  =    -1.66152267043508 + P_DepVar1 ;
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
