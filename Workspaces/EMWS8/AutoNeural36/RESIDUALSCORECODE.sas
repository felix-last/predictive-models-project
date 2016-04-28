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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

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
*** Writing the Node interval ;
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
*** Writing the Node binary ;
*** *************************;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.87838996558128 * S_AcceptedCmpTotal
          +    -0.72861582704026 * S_Age  +    -0.35976933287364 * S_Frq
          +    -0.39318236650647 * S_Income  +    -0.11306426250077 * 
        S_Kidhome  +    -0.01944344852899 * S_MntFishProducts
          +     0.67111744210837 * S_MntFruits  +    -1.49834452754593 * 
        S_MntGoldProds  +     0.09407089078133 * S_MntSweetProducts
          +     1.47210732135355 * S_MonthsAsCustomer
          +     0.85741098948561 * S_NumDealsPurchases
          +     0.47124997442086 * S_NumWebVisitsMonth
          +     0.34804829630378 * S_RFMstat  +    -0.23886139231434 * 
        S_RMntFrq  +     0.42017826752434 * S_Recency
          +    -0.54808368666243 * S_Teenhome ;
   H1x1_2  =     0.35467524360791 * S_AcceptedCmpTotal
          +     -0.1088788112851 * S_Age  +    -1.36946683613363 * S_Frq
          +    -1.26725497382659 * S_Income  +     0.98129008703449 * 
        S_Kidhome  +     0.14875687682486 * S_MntFishProducts
          +     0.32033599920154 * S_MntFruits  +    -0.07367593486843 * 
        S_MntGoldProds  +     0.09258518253483 * S_MntSweetProducts
          +     0.74811152666015 * S_MonthsAsCustomer
          +    -0.13168708818154 * S_NumDealsPurchases
          +    -0.51935779196522 * S_NumWebVisitsMonth
          +    -1.08122601580595 * S_RFMstat  +    -1.39482117610314 * 
        S_RMntFrq  +     1.96758846931972 * S_Recency
          +     1.07196031967818 * S_Teenhome ;
   H1x1_3  =     0.58244239235575 * S_AcceptedCmpTotal
          +     0.26726833292979 * S_Age  +    -0.61722007550606 * S_Frq
          +     -2.0775058709831 * S_Income  +     2.03934698259906 * 
        S_Kidhome  +     0.07427729378492 * S_MntFishProducts
          +     0.44813996651317 * S_MntFruits  +     -0.7827281459867 * 
        S_MntGoldProds  +       0.690331955695 * S_MntSweetProducts
          +     0.11776941975292 * S_MonthsAsCustomer
          +    -0.69977862189457 * S_NumDealsPurchases
          +    -0.26676589341422 * S_NumWebVisitsMonth
          +     0.20199326764416 * S_RFMstat  +    -0.55698079997966 * 
        S_RMntFrq  +     1.53487074713045 * S_Recency
          +      1.3117308982272 * S_Teenhome ;
   H1x1_4  =     2.22510849246632 * S_AcceptedCmpTotal
          +     0.71558360205634 * S_Age  +    -1.46728474818928 * S_Frq
          +    -1.12286067241512 * S_Income  +     -0.1580680195235 * 
        S_Kidhome  +     0.68682136797377 * S_MntFishProducts
          +    -0.00630677724747 * S_MntFruits  +    -3.19429423961688 * 
        S_MntGoldProds  +     0.29242741711781 * S_MntSweetProducts
          +     0.46606320110885 * S_MonthsAsCustomer
          +     1.64885970718717 * S_NumDealsPurchases
          +     1.70233049691156 * S_NumWebVisitsMonth
          +     1.15990014651932 * S_RFMstat  +    -0.40088577934374 * 
        S_RMntFrq  +    -1.33025042025966 * S_Recency
          +     -0.9160526174073 * S_Teenhome ;
   H1x1_5  =     0.30918783645666 * S_AcceptedCmpTotal
          +    -0.29752446082739 * S_Age  +    -3.36006724068108 * S_Frq
          +    -1.51429072229567 * S_Income  +     1.55823150050807 * 
        S_Kidhome  +     0.38802787611913 * S_MntFishProducts
          +     0.15620247204727 * S_MntFruits  +     0.11877023526371 * 
        S_MntGoldProds  +     0.44012040203684 * S_MntSweetProducts
          +     0.25703511103123 * S_MonthsAsCustomer
          +     0.81449309285524 * S_NumDealsPurchases
          +     0.65863550896078 * S_NumWebVisitsMonth
          +    -0.22817135858684 * S_RFMstat  +    -0.54499264380965 * 
        S_RMntFrq  +     0.35298837231553 * S_Recency
          +     1.18802458817287 * S_Teenhome ;
   H1x1_6  =     -0.2868302514584 * S_AcceptedCmpTotal
          +     1.25880191199869 * S_Age  +    -1.32550387975072 * S_Frq
          +     1.58243208622758 * S_Income  +      0.5401269822193 * 
        S_Kidhome  +     0.39615267981686 * S_MntFishProducts
          +    -0.59610608715534 * S_MntFruits  +    -0.04268143765992 * 
        S_MntGoldProds  +     0.32109584564762 * S_MntSweetProducts
          +     0.79681190434731 * S_MonthsAsCustomer
          +    -0.93973916927987 * S_NumDealsPurchases
          +     1.37415777280471 * S_NumWebVisitsMonth
          +    -0.81476155575497 * S_RFMstat  +    -1.28380749251247 * 
        S_RMntFrq  +     0.25579910148098 * S_Recency
          +     0.17170502426384 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.32981585052698 * AcceptedCmp10
          +    -0.10070450903443 * AcceptedCmp20  +    -0.32664580764086 * 
        AcceptedCmp30  +     0.25620492094938 * AcceptedCmp40
          +     -0.2493451143734 * AcceptedCmp50  +    -0.47357709251263 * 
        Complain0  +     -0.9794610023378 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +      0.5364497875236 * AcceptedCmp10
          +     1.01506150862658 * AcceptedCmp20  +     1.32554231363753 * 
        AcceptedCmp30  +     0.02621436950191 * AcceptedCmp40
          +     1.20891792303907 * AcceptedCmp50  +     -1.0191301862047 * 
        Complain0  +    -0.66229357768492 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.96724269033648 * AcceptedCmp10
          +     0.10726460217503 * AcceptedCmp20  +     0.85605493403339 * 
        AcceptedCmp30  +     1.63214541621179 * AcceptedCmp40
          +     0.07415706251222 * AcceptedCmp50  +     2.12629200518429 * 
        Complain0  +    -1.12574598286695 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -1.49581328009792 * AcceptedCmp10
          +    -0.10449763460895 * AcceptedCmp20  +    -2.27424457300151 * 
        AcceptedCmp30  +    -0.39869791621089 * AcceptedCmp40
          +    -1.66755047713813 * AcceptedCmp50  +    -0.57141180485965 * 
        Complain0  +    -0.68703833434137 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -0.14971849291703 * AcceptedCmp10
          +    -0.38993388100214 * AcceptedCmp20  +     0.09739092235162 * 
        AcceptedCmp30  +     0.40637367458359 * AcceptedCmp40
          +     0.58227745136439 * AcceptedCmp50  +     1.66675944761873 * 
        Complain0  +    -1.15565368750301 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +     0.73379063751421 * AcceptedCmp10
          +     0.54265642922411 * AcceptedCmp20  +     0.78256508185806 * 
        AcceptedCmp30  +    -0.16662791271159 * AcceptedCmp40
          +    -0.41266972896321 * AcceptedCmp50  +    -0.20276730195641 * 
        Complain0  +    -0.76694832159342 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +      -0.400732927621 * Education2n_Cycle
          +     0.50602011031704 * EducationBasic  +     1.07276510373173 * 
        EducationGraduation  +     0.53978142914157 * EducationMaster
          +    -0.28915302940579 * Marital_StatusDivorced
          +     0.36400858753372 * Marital_StatusMarried
          +     0.64088916620982 * Marital_StatusSingle
          +    -0.54924655944458 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.05389569982044 * Education2n_Cycle
          +     0.13032554247329 * EducationBasic  +     0.20377312787364 * 
        EducationGraduation  +     0.31774696403611 * EducationMaster
          +    -0.48311224079569 * Marital_StatusDivorced
          +     0.78522892664414 * Marital_StatusMarried
          +    -0.52144588286939 * Marital_StatusSingle
          +    -0.04491246278055 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.65789462014123 * Education2n_Cycle
          +    -0.61910504823261 * EducationBasic  +    -0.81760650903757 * 
        EducationGraduation  +     1.62119993408702 * EducationMaster
          +    -1.10138941531054 * Marital_StatusDivorced
          +     1.91098461544032 * Marital_StatusMarried
          +    -1.96662881570281 * Marital_StatusSingle
          +     1.72720530696806 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -1.76159504483478 * Education2n_Cycle
          +     1.34419101951319 * EducationBasic  +     0.99605062687588 * 
        EducationGraduation  +    -0.47265183904634 * EducationMaster
          +    -0.26938567401241 * Marital_StatusDivorced
          +      0.5252138734125 * Marital_StatusMarried
          +    -0.77744801183604 * Marital_StatusSingle
          +    -0.75370322503617 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.31531741447118 * Education2n_Cycle
          +    -0.49673458313018 * EducationBasic  +    -0.33747755702453 * 
        EducationGraduation  +     1.34706628408556 * EducationMaster
          +    -0.49116995167497 * Marital_StatusDivorced
          +     1.22243596432371 * Marital_StatusMarried
          +    -1.22268267917833 * Marital_StatusSingle
          +     0.70303458050936 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +     0.24276071035104 * Education2n_Cycle
          +     0.31557411234249 * EducationBasic  +     1.14068984218278 * 
        EducationGraduation  +     0.19530936178176 * EducationMaster
          +    -0.21134253419933 * Marital_StatusDivorced
          +     0.87168965818013 * Marital_StatusMarried
          +     0.07539748751767 * Marital_StatusSingle
          +      2.0073469497136 * Marital_StatusTogether ;
   H1x1_1  =    -0.98435152317316 + H1x1_1 ;
   H1x1_2  =     2.55791603338359 + H1x1_2 ;
   H1x1_3  =     0.01600462421489 + H1x1_3 ;
   H1x1_4  =    -0.49354279621031 + H1x1_4 ;
   H1x1_5  =     0.53894117744381 + H1x1_5 ;
   H1x1_6  =    -1.15704011853801 + H1x1_6 ;
   H1x1_7  = 0; 
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 , H1x1_7
         );
   _SUM_ = 0.; 
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_5  = EXP(H1x1_5  - _MAX_);
   _SUM_ = _SUM_ + H1x1_5 ;
   H1x1_6  = EXP(H1x1_6  - _MAX_);
   _SUM_ = _SUM_ + H1x1_6 ;
   H1x1_7  = EXP(H1x1_7  - _MAX_);
   _SUM_ = _SUM_ + H1x1_7 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
   H1x1_7  = H1x1_7  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
   H1x1_7  = .;
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
   P_DepVar1  =     3.18359703948471 * H1x1_1  +    -10.1784939846064 * H1x1_2
          +    -6.29940271083871 * H1x1_3  +     6.40375096503445 * H1x1_4
          +     2.01883628448723 * H1x1_5  +    -0.39011048402578 * H1x1_6
          +     7.52499467921245 * H1x1_7 ;
   P_DepVar1  =     0.53811970285539 + P_DepVar1 ;
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
