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
   H11  =     0.00111540513846 * S_AcceptedCmpTotal  +    -0.12971131901586 *
        S_Age  +    -0.18520628994151 * S_Frq  +     0.00222884615859 *
        S_Income  +    -0.52351504306035 * S_Kidhome
          +     0.08140325105151 * S_MntFishProducts
          +    -0.04386492140302 * S_MntFruits  +     0.05295232764925 *
        S_MntGoldProds  +    -0.39891652227681 * S_MntSweetProducts
          +    -0.43676985181672 * S_MonthsAsCustomer
          +    -0.20260708598657 * S_NumDealsPurchases
          +     0.06428019964102 * S_NumWebVisitsMonth
          +     0.13467234938466 * S_RFMstat  +    -0.29483834428412 *
        S_RMntFrq  +    -0.68447200324777 * S_Recency
          +    -0.29437834033294 * S_Teenhome ;
   H12  =     0.39213879457216 * S_AcceptedCmpTotal  +    -0.01440353989436 *
        S_Age  +     0.23865918577825 * S_Frq  +      0.6365049428914 *
        S_Income  +     0.91112653634925 * S_Kidhome
          +     0.26539332041133 * S_MntFishProducts
          +    -0.31480262631724 * S_MntFruits  +     0.14786958565778 *
        S_MntGoldProds  +      0.2400589361571 * S_MntSweetProducts
          +    -0.12141919451173 * S_MonthsAsCustomer
          +     0.66105669553858 * S_NumDealsPurchases
          +     0.35126523805992 * S_NumWebVisitsMonth
          +     0.15877473113544 * S_RFMstat  +     0.04256559397745 *
        S_RMntFrq  +    -0.82322754979428 * S_Recency
          +    -0.38093159094381 * S_Teenhome ;
   H13  =     0.01698497071572 * S_AcceptedCmpTotal  +    -0.18194797866377 *
        S_Age  +    -0.38541123385894 * S_Frq  +    -0.85948176553863 *
        S_Income  +     0.62421717479738 * S_Kidhome
          +     0.15545639003856 * S_MntFishProducts
          +    -0.04951281670167 * S_MntFruits  +    -0.02786799666153 *
        S_MntGoldProds  +     0.25863651263316 * S_MntSweetProducts
          +     -0.2202976559774 * S_MonthsAsCustomer
          +      0.2989117555747 * S_NumDealsPurchases
          +    -0.14751065039865 * S_NumWebVisitsMonth
          +    -0.02597231393441 * S_RFMstat  +    -0.39431255412396 *
        S_RMntFrq  +     0.37177599027897 * S_Recency
          +     0.58385986175941 * S_Teenhome ;
   H14  =    -0.23472826464263 * S_AcceptedCmpTotal  +      0.2784288410174 *
        S_Age  +     0.88464843816774 * S_Frq  +     0.17112519951794 *
        S_Income  +    -0.00640590904736 * S_Kidhome
          +    -0.26951923409269 * S_MntFishProducts
          +     0.32894249282173 * S_MntFruits  +     0.07344906774263 *
        S_MntGoldProds  +    -0.34990462553578 * S_MntSweetProducts
          +    -0.03084445162862 * S_MonthsAsCustomer
          +    -0.63431809432586 * S_NumDealsPurchases
          +     -0.8623000996519 * S_NumWebVisitsMonth
          +    -0.16320962913093 * S_RFMstat  +     -0.0912884569806 *
        S_RMntFrq  +     0.62097299931152 * S_Recency
          +    -0.21174542653958 * S_Teenhome ;
   H15  =     0.08498061851068 * S_AcceptedCmpTotal  +    -0.03874599391049 *
        S_Age  +     0.26071229941538 * S_Frq  +      0.3037475539849 *
        S_Income  +    -0.24194113790018 * S_Kidhome
          +    -0.19083222216875 * S_MntFishProducts
          +     -0.2295473697124 * S_MntFruits  +    -0.34933034439567 *
        S_MntGoldProds  +    -0.02693984703623 * S_MntSweetProducts
          +     0.04053963129428 * S_MonthsAsCustomer
          +    -0.43392648307969 * S_NumDealsPurchases
          +    -0.27875696570809 * S_NumWebVisitsMonth
          +     0.15140901901886 * S_RFMstat  +     0.24456818451854 *
        S_RMntFrq  +     0.50440740103916 * S_Recency
          +    -0.22578843225375 * S_Teenhome ;
   H16  =     0.04456496773686 * S_AcceptedCmpTotal  +    -0.27559491111701 *
        S_Age  +    -0.17508336034033 * S_Frq  +     0.53227247274911 *
        S_Income  +    -0.25899044305101 * S_Kidhome
          +    -0.04059351293128 * S_MntFishProducts
          +     -0.0638851827999 * S_MntFruits  +    -0.00679153562123 *
        S_MntGoldProds  +    -0.03056442128246 * S_MntSweetProducts
          +    -0.00021820216919 * S_MonthsAsCustomer
          +     0.26994179879371 * S_NumDealsPurchases
          +     0.22503342875269 * S_NumWebVisitsMonth
          +      0.0842978170878 * S_RFMstat  +     0.10196131382306 *
        S_RMntFrq  +    -0.89639874371569 * S_Recency
          +     -0.2664087147783 * S_Teenhome ;
   H11  = H11  +     0.24041745169534 * AcceptedCmp10
          +     0.02544174782123 * AcceptedCmp20  +     0.05985429287388 *
        AcceptedCmp30  +    -0.43610564100855 * AcceptedCmp40
          +     -0.0033678658149 * AcceptedCmp50  +      0.4302437669653 *
        Complain0  +     0.23399064979433 * HigherEducationBinary0 ;
   H12  = H12  +     0.04113908603951 * AcceptedCmp10
          +    -0.01093566327356 * AcceptedCmp20  +    -0.29048302676994 *
        AcceptedCmp30  +     0.58809451838917 * AcceptedCmp40
          +    -0.40651652706331 * AcceptedCmp50  +     0.59503559231942 *
        Complain0  +    -0.31162206924656 * HigherEducationBinary0 ;
   H13  = H13  +     0.49980132733088 * AcceptedCmp10
          +     0.42591357833168 * AcceptedCmp20  +     0.29341561692077 *
        AcceptedCmp30  +      0.5385511712513 * AcceptedCmp40
          +     0.11385275317979 * AcceptedCmp50  +     0.11081932391124 *
        Complain0  +    -0.44840720707687 * HigherEducationBinary0 ;
   H14  = H14  +     0.70002770930064 * AcceptedCmp10
          +     0.03624451131553 * AcceptedCmp20  +     0.75509304132809 *
        AcceptedCmp30  +     0.10669150880089 * AcceptedCmp40
          +     0.40957450849357 * AcceptedCmp50  +     0.19133447423047 *
        Complain0  +      0.0901288611482 * HigherEducationBinary0 ;
   H15  = H15  +     0.30472902210864 * AcceptedCmp10
          +     -0.0160831175686 * AcceptedCmp20  +     0.09226996454789 *
        AcceptedCmp30  +     0.03526648068533 * AcceptedCmp40
          +      0.1969983492734 * AcceptedCmp50  +    -0.32330512066062 *
        Complain0  +     -0.2085030313253 * HigherEducationBinary0 ;
   H16  = H16  +    -0.19560821735212 * AcceptedCmp10
          +     0.01476856325219 * AcceptedCmp20  +    -0.28505549110679 *
        AcceptedCmp30  +    -0.13003702218159 * AcceptedCmp40
          +     -0.0444894569881 * AcceptedCmp50  +    -0.19927466163886 *
        Complain0  +      0.1418696986192 * HigherEducationBinary0 ;
   H11  = H11  +     0.05142300573614 * Education2n_Cycle
          +    -0.08044262556314 * EducationBasic  +    -0.01420547642374 *
        EducationGraduation  +     0.01590498605031 * EducationMaster
          +     0.12486109091842 * Marital_StatusDivorced
          +    -0.02537427599041 * Marital_StatusMarried
          +     0.04139233887566 * Marital_StatusSingle
          +     0.01979901000533 * Marital_StatusTogether ;
   H12  = H12  +    -0.18925528201163 * Education2n_Cycle
          +     0.13542558539857 * EducationBasic  +    -0.00318989932343 *
        EducationGraduation  +     0.00556061144517 * EducationMaster
          +      0.1922952868897 * Marital_StatusDivorced
          +    -0.15043025991045 * Marital_StatusMarried
          +     0.24380549252268 * Marital_StatusSingle
          +      0.0914480494515 * Marital_StatusTogether ;
   H13  = H13  +     0.01984994959794 * Education2n_Cycle
          +     0.05848951032368 * EducationBasic  +    -0.44607095594807 *
        EducationGraduation  +     0.17433329582337 * EducationMaster
          +    -0.19065058903153 * Marital_StatusDivorced
          +     0.75653054479625 * Marital_StatusMarried
          +    -0.66014855183925 * Marital_StatusSingle
          +     0.57813394995752 * Marital_StatusTogether ;
   H14  = H14  +     0.18480056670996 * Education2n_Cycle
          +    -0.06350174929241 * EducationBasic  +    -0.27462372414402 *
        EducationGraduation  +    -0.30561816795813 * EducationMaster
          +    -0.18567969656169 * Marital_StatusDivorced
          +    -0.14971561557485 * Marital_StatusMarried
          +     0.15498901175156 * Marital_StatusSingle
          +    -0.03455782443417 * Marital_StatusTogether ;
   H15  = H15  +    -0.12232381400482 * Education2n_Cycle
          +     0.20473341276352 * EducationBasic  +      0.0491931637595 *
        EducationGraduation  +    -0.21833425438085 * EducationMaster
          +    -0.10111355311896 * Marital_StatusDivorced
          +     0.14131454959607 * Marital_StatusMarried
          +    -0.18391621678023 * Marital_StatusSingle
          +     0.23175084120404 * Marital_StatusTogether ;
   H16  = H16  +     0.03069778538103 * Education2n_Cycle
          +    -0.45911946295888 * EducationBasic  +    -0.07922750315693 *
        EducationGraduation  +    -0.19964669060264 * EducationMaster
          +     0.04572591415975 * Marital_StatusDivorced
          +    -0.38535549815638 * Marital_StatusMarried
          +     0.30341063880196 * Marital_StatusSingle
          +    -0.28342984798633 * Marital_StatusTogether ;
   H11  =     1.39441509752238 + H11 ;
   H12  =     0.19328666321992 + H12 ;
   H13  =     0.55771988222719 + H13 ;
   H14  =     0.27935543639097 + H14 ;
   H15  =     1.08911808634908 + H15 ;
   H16  =    -0.22580376250744 + H16 ;
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
   P_DepVar1  =     1.18423178138253 * H11  +     2.38126931545785 * H12
          +    -2.42139186007404 * H13  +      -2.187729844004 * H14
          +    -0.38226616805204 * H15  +      1.1710139734699 * H16 ;
   P_DepVar1  =    -1.69958173763243 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
H16
;
drop S_:;
