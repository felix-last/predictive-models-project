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
   H11  =     0.36133262718383 * S_AcceptedCmpTotal  +      0.1343771400865 * 
        S_Age  +    -0.24571467055536 * S_Frq  +    -0.11635861322703 * 
        S_Income  +     0.21800402847245 * S_Kidhome
          +    -0.08149710666733 * S_MntFishProducts
          +     -0.2701399689031 * S_MntFruits  +    -0.25914859917698 * 
        S_MntGoldProds  +     0.07460522502866 * S_MntSweetProducts
          +     0.21797461204216 * S_MonthsAsCustomer
          +    -0.21815589160821 * S_NumDealsPurchases
          +     0.07812084857236 * S_NumWebVisitsMonth
          +     0.08932200343778 * S_RFMstat  +    -0.02006098427394 * 
        S_RMntFrq  +     0.15769561600884 * S_Recency
          +     0.18750185075516 * S_Teenhome ;
   H12  =    -0.50617940273705 * S_AcceptedCmpTotal  +     0.01742905139009 * 
        S_Age  +     0.02860405601568 * S_Frq  +     -0.8946732981825 * 
        S_Income  +    -0.51395557383394 * S_Kidhome
          +     0.11230001652798 * S_MntFishProducts
          +    -0.05937548001223 * S_MntFruits  +    -0.43879855376106 * 
        S_MntGoldProds  +      0.1886933749454 * S_MntSweetProducts
          +    -0.12024856595234 * S_MonthsAsCustomer
          +    -0.53457103099833 * S_NumDealsPurchases
          +    -0.65858266122841 * S_NumWebVisitsMonth
          +    -0.29325586421931 * S_RFMstat  +    -0.07711837853536 * 
        S_RMntFrq  +     0.73198178314208 * S_Recency
          +       0.284273700583 * S_Teenhome ;
   H13  =    -0.22382536367821 * S_AcceptedCmpTotal  +     0.04173724966563 * 
        S_Age  +     0.33332048365592 * S_Frq  +    -0.27050680035036 * 
        S_Income  +     0.59619777894904 * S_Kidhome
          +    -0.20681231438874 * S_MntFishProducts
          +     0.09668269245081 * S_MntFruits  +     0.33122038423469 * 
        S_MntGoldProds  +     0.19072077497407 * S_MntSweetProducts
          +     0.74999757376588 * S_MonthsAsCustomer
          +     -0.0414957568196 * S_NumDealsPurchases
          +    -0.28660732058672 * S_NumWebVisitsMonth
          +    -0.14783319113971 * S_RFMstat  +     0.08819285971239 * 
        S_RMntFrq  +     0.82939566759356 * S_Recency
          +     0.37769126383714 * S_Teenhome ;
   H14  =    -0.29813774834901 * S_AcceptedCmpTotal  +     0.02971084841681 * 
        S_Age  +     0.84689199886227 * S_Frq  +     0.08860239979138 * 
        S_Income  +    -0.00048825209248 * S_Kidhome
          +    -0.27253152390669 * S_MntFishProducts
          +     0.22290984088185 * S_MntFruits  +    -0.22538306066789 * 
        S_MntGoldProds  +     0.10593860044534 * S_MntSweetProducts
          +    -0.04061858729352 * S_MonthsAsCustomer
          +    -0.69966026045197 * S_NumDealsPurchases
          +    -0.42440411795848 * S_NumWebVisitsMonth
          +    -0.15144674016689 * S_RFMstat  +    -0.12725894949315 * 
        S_RMntFrq  +     0.85043625268487 * S_Recency
          +     0.11330341680725 * S_Teenhome ;
   H15  =    -0.07982747659587 * S_AcceptedCmpTotal  +     0.02995727735441 * 
        S_Age  +     0.48248608076176 * S_Frq  +     0.77701541080871 * 
        S_Income  +     -0.5200016917594 * S_Kidhome
          +    -0.01917879751968 * S_MntFishProducts
          +      -0.208302760068 * S_MntFruits  +    -0.01328591874164 * 
        S_MntGoldProds  +    -0.04604837766039 * S_MntSweetProducts
          +     0.24883938360928 * S_MonthsAsCustomer
          +    -0.20671463104805 * S_NumDealsPurchases
          +    -0.04211724261457 * S_NumWebVisitsMonth
          +     0.01917470342239 * S_RFMstat  +     0.33439664089227 * 
        S_RMntFrq  +    -0.44822635454662 * S_Recency
          +    -0.63325249003932 * S_Teenhome ;
   H16  =    -0.38297792304862 * S_AcceptedCmpTotal  +     0.10981213932608 * 
        S_Age  +    -0.17598557908808 * S_Frq  +    -0.00438864339571 * 
        S_Income  +     0.02657538028182 * S_Kidhome
          +     0.30261554656963 * S_MntFishProducts
          +    -0.15342918076573 * S_MntFruits  +     0.34453886692852 * 
        S_MntGoldProds  +    -0.02040982310102 * S_MntSweetProducts
          +     0.02174590740842 * S_MonthsAsCustomer
          +     -0.2564742686659 * S_NumDealsPurchases
          +    -0.17669736301302 * S_NumWebVisitsMonth
          +    -0.05908565871891 * S_RFMstat  +     -0.1004598146117 * 
        S_RMntFrq  +    -0.26904490861856 * S_Recency
          +    -0.02193907318371 * S_Teenhome ;
   H17  =     0.19136795761974 * S_AcceptedCmpTotal  +    -0.36598513063907 * 
        S_Age  +    -0.50377462461047 * S_Frq  +     -0.4823937142695 * 
        S_Income  +     0.24766328423243 * S_Kidhome
          +    -0.25095009551816 * S_MntFishProducts
          +     0.32862405994166 * S_MntFruits  +     0.13545997285014 * 
        S_MntGoldProds  +     0.48572798966447 * S_MntSweetProducts
          +     0.05495423017724 * S_MonthsAsCustomer
          +     0.43616167783834 * S_NumDealsPurchases
          +     0.56632988971927 * S_NumWebVisitsMonth
          +     0.07176913532762 * S_RFMstat  +     0.09455545385258 * 
        S_RMntFrq  +    -0.57930962586715 * S_Recency
          +     0.37402577765336 * S_Teenhome ;
   H11  = H11  +     0.19051470634808 * AcceptedCmp10
          +    -0.07216947855434 * AcceptedCmp20  +     0.21737393600184 * 
        AcceptedCmp30  +     0.21085157726024 * AcceptedCmp40
          +    -0.03060343696444 * AcceptedCmp50  +    -0.07251000037685 * 
        Complain0  +     0.01831009008775 * HigherEducationBinary0 ;
   H12  = H12  +    -0.08376219764212 * AcceptedCmp10
          +    -0.04318604935285 * AcceptedCmp20  +     0.31686571931406 * 
        AcceptedCmp30  +    -0.50381802619358 * AcceptedCmp40
          +     0.14765895912577 * AcceptedCmp50  +    -0.30891077015908 * 
        Complain0  +     0.33649437112475 * HigherEducationBinary0 ;
   H13  = H13  +    -0.26783020607447 * AcceptedCmp10
          +     0.00469266575176 * AcceptedCmp20  +     0.17067955604815 * 
        AcceptedCmp30  +    -0.03800701493644 * AcceptedCmp40
          +     0.18664788771851 * AcceptedCmp50  +    -0.58650285377449 * 
        Complain0  +    -0.35013080380749 * HigherEducationBinary0 ;
   H14  = H14  +     0.63010904279384 * AcceptedCmp10
          +     0.06584826963979 * AcceptedCmp20  +     0.32237915530123 * 
        AcceptedCmp30  +    -0.04951576144663 * AcceptedCmp40
          +     0.61998234297035 * AcceptedCmp50  +     0.00048129839212 * 
        Complain0  +     -0.1253104829676 * HigherEducationBinary0 ;
   H15  = H15  +      -0.431361787308 * AcceptedCmp10
          +    -0.35444173306347 * AcceptedCmp20  +    -0.29829328632276 * 
        AcceptedCmp30  +    -0.63891180852982 * AcceptedCmp40
          +     0.09112550400968 * AcceptedCmp50  +    -0.55600327682226 * 
        Complain0  +     0.37327970930193 * HigherEducationBinary0 ;
   H16  = H16  +    -0.10510318083151 * AcceptedCmp10
          +     0.20700826755616 * AcceptedCmp20  +     0.34115351197698 * 
        AcceptedCmp30  +    -0.02186089038242 * AcceptedCmp40
          +    -0.22066876509421 * AcceptedCmp50  +    -0.37202379131817 * 
        Complain0  +     0.14046104192307 * HigherEducationBinary0 ;
   H17  = H17  +    -0.09298124880387 * AcceptedCmp10
          +    -0.04743706801693 * AcceptedCmp20  +    -0.44870387587127 * 
        AcceptedCmp30  +      0.1036296198206 * AcceptedCmp40
          +    -0.05138140136888 * AcceptedCmp50  +    -0.19337238268115 * 
        Complain0  +    -0.21291261409303 * HigherEducationBinary0 ;
   H11  = H11  +    -0.16744529688383 * Education2n_Cycle
          +    -0.31425534410414 * EducationBasic  +     0.13292009986312 * 
        EducationGraduation  +     0.02026218772144 * EducationMaster
          +     0.03224080100133 * Marital_StatusDivorced
          +     0.29745692653089 * Marital_StatusMarried
          +    -0.05710732710843 * Marital_StatusSingle
          +     0.27928074465671 * Marital_StatusTogether ;
   H12  = H12  +    -0.10675016455937 * Education2n_Cycle
          +     0.25652819606036 * EducationBasic  +    -0.25732914554257 * 
        EducationGraduation  +     0.05617204773323 * EducationMaster
          +    -0.13213973463809 * Marital_StatusDivorced
          +     0.29599134560833 * Marital_StatusMarried
          +     -0.2063852486711 * Marital_StatusSingle
          +     0.12103657163442 * Marital_StatusTogether ;
   H13  = H13  +     0.16437023455981 * Education2n_Cycle
          +    -0.08434195766996 * EducationBasic  +     0.11865174008514 * 
        EducationGraduation  +    -0.23426651494583 * EducationMaster
          +     0.03869842290419 * Marital_StatusDivorced
          +     0.02863271652743 * Marital_StatusMarried
          +     0.16900197403585 * Marital_StatusSingle
          +     -0.4005829242866 * Marital_StatusTogether ;
   H14  = H14  +     0.09249210314159 * Education2n_Cycle
          +     0.17486481480148 * EducationBasic  +    -0.08188859647689 * 
        EducationGraduation  +    -0.01246856756087 * EducationMaster
          +    -0.07321508189995 * Marital_StatusDivorced
          +     0.20555334173771 * Marital_StatusMarried
          +     0.21523251628551 * Marital_StatusSingle
          +     0.25008985020723 * Marital_StatusTogether ;
   H15  = H15  +      0.0559000195465 * Education2n_Cycle
          +     0.15755882128532 * EducationBasic  +     0.18728279497378 * 
        EducationGraduation  +    -0.40523840756533 * EducationMaster
          +     0.16221006173823 * Marital_StatusDivorced
          +    -0.82194777490073 * Marital_StatusMarried
          +     0.85321787917596 * Marital_StatusSingle
          +    -0.81385338897521 * Marital_StatusTogether ;
   H16  = H16  +    -0.15156841688167 * Education2n_Cycle
          +    -0.32052189509613 * EducationBasic  +     0.14814402908721 * 
        EducationGraduation  +    -0.24180213668326 * EducationMaster
          +    -0.01732271619375 * Marital_StatusDivorced
          +     0.04513262049576 * Marital_StatusMarried
          +    -0.05438203821532 * Marital_StatusSingle
          +      0.0759481335775 * Marital_StatusTogether ;
   H17  = H17  +    -0.18722295224931 * Education2n_Cycle
          +      0.3187729862352 * EducationBasic  +     0.22068390790352 * 
        EducationGraduation  +     0.13877995362513 * EducationMaster
          +     0.22623757264973 * Marital_StatusDivorced
          +     0.10308007683249 * Marital_StatusMarried
          +    -0.07750614215091 * Marital_StatusSingle
          +    -0.19333798296202 * Marital_StatusTogether ;
   H11  =     1.31496618512526 + H11 ;
   H12  =     0.20245920531192 + H12 ;
   H13  =     -0.7770501213614 + H13 ;
   H14  =     0.85602300575727 + H14 ;
   H15  =    -0.15331135041487 + H15 ;
   H16  =    -0.71412018703209 + H16 ;
   H17  =    -1.06302431968156 + H17 ;
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
   P_DepVar1  =    -0.11734493117272 * H11  +    -2.70843436735374 * H12
          +    -1.82278168298088 * H13  +    -1.84841969324871 * H14
          +     2.54735424594008 * H15  +     -0.2050385322443 * H16
          +     1.26532821734496 * H17 ;
   P_DepVar1  =    -1.65851332548506 + P_DepVar1 ;
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
