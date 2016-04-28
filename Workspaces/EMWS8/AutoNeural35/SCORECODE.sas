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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

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
   H1x1_1  =     0.42585587882538 * S_AcceptedCmpTotal
          +    -0.43032612946411 * S_Age  +    -1.84723116954266 * S_Frq
          +    -0.09376996424096 * S_Income  +    -0.63457337145111 * 
        S_Kidhome  +    -1.07062735228011 * S_MntFishProducts
          +    -0.39750126211014 * S_MntFruits  +     0.87836102594883 * 
        S_MntGoldProds  +     4.02875150179318 * S_MntSweetProducts
          +    -0.63886071804247 * S_MonthsAsCustomer
          +      2.3488612891037 * S_NumDealsPurchases
          +     2.32996461229282 * S_NumWebVisitsMonth
          +     3.26514327762389 * S_RFMstat  +     0.81545333248878 * 
        S_RMntFrq  +    -3.18599476886695 * S_Recency
          +    -0.36606572424478 * S_Teenhome ;
   H1x1_2  =     -0.3238529971058 * S_AcceptedCmpTotal
          +     0.01122128383802 * S_Age  +    -1.81697004648061 * S_Frq
          +     0.27195583458212 * S_Income  +     2.44028375867625 * 
        S_Kidhome  +     0.03188165765923 * S_MntFishProducts
          +     0.28741461463462 * S_MntFruits  +     0.91740540315279 * 
        S_MntGoldProds  +     1.53257516137636 * S_MntSweetProducts
          +     0.67699646331113 * S_MonthsAsCustomer
          +     0.70523055739254 * S_NumDealsPurchases
          +    -2.06406682205141 * S_NumWebVisitsMonth
          +    -0.07912192803919 * S_RFMstat  +     -0.1981410297834 * 
        S_RMntFrq  +      5.0273672656487 * S_Recency
          +      1.7761639681499 * S_Teenhome ;
   H1x1_3  =    -0.31627698433663 * S_AcceptedCmpTotal
          +    -1.66608599580569 * S_Age  +     3.03276701042245 * S_Frq
          +    -1.55807144100301 * S_Income  +    -1.61052956577749 * 
        S_Kidhome  +    -1.13374850666912 * S_MntFishProducts
          +     1.69712033465415 * S_MntFruits  +     -0.0956378742157 * 
        S_MntGoldProds  +     0.42344107897201 * S_MntSweetProducts
          +    -0.53694216899543 * S_MonthsAsCustomer
          +     0.25908508836257 * S_NumDealsPurchases
          +    -1.18459231573601 * S_NumWebVisitsMonth
          +    -0.91952963382786 * S_RFMstat  +     1.14118358901223 * 
        S_RMntFrq  +    -1.22457627833901 * S_Recency
          +     0.58418149816249 * S_Teenhome ;
   H1x1_4  =    -0.18730828314928 * S_AcceptedCmpTotal
          +     0.44335866520169 * S_Age  +    -0.52967041213464 * S_Frq
          +    -2.49889000722688 * S_Income  +     2.09225176560102 * 
        S_Kidhome  +     -0.0365038378872 * S_MntFishProducts
          +    -0.27687707269551 * S_MntFruits  +     0.22172940394581 * 
        S_MntGoldProds  +     1.18008846653352 * S_MntSweetProducts
          +    -0.08931078748332 * S_MonthsAsCustomer
          +    -0.46561962814047 * S_NumDealsPurchases
          +    -0.12241295445297 * S_NumWebVisitsMonth
          +    -0.88584926273299 * S_RFMstat  +    -0.19321792123793 * 
        S_RMntFrq  +     0.96804234233608 * S_Recency
          +     2.36799993608153 * S_Teenhome ;
   H1x1_5  =    -0.61669680820161 * S_AcceptedCmpTotal
          +    -2.33152931225693 * S_Age  +    -5.55252945538268 * S_Frq
          +    -1.27866281458938 * S_Income  +     0.57490346430235 * 
        S_Kidhome  +    -0.72481428507501 * S_MntFishProducts
          +     1.09506142984139 * S_MntFruits  +     0.13317961278198 * 
        S_MntGoldProds  +    -0.09910013481931 * S_MntSweetProducts
          +     -0.9186653552138 * S_MonthsAsCustomer
          +     2.17624393037629 * S_NumDealsPurchases
          +    -0.41699900714758 * S_NumWebVisitsMonth
          +     0.90353546864265 * S_RFMstat  +      1.3997584305474 * 
        S_RMntFrq  +    -0.28987089218356 * S_Recency
          +     1.91100508225075 * S_Teenhome ;
   H1x1_6  =     2.41979447479877 * S_AcceptedCmpTotal
          +    -0.20582802429798 * S_Age  +     1.18277101919857 * S_Frq
          +     0.52347523464991 * S_Income  +     0.59569652351781 * 
        S_Kidhome  +    -0.48037342144038 * S_MntFishProducts
          +    -0.75448191371446 * S_MntFruits  +     0.93881795060256 * 
        S_MntGoldProds  +    -1.19303493808819 * S_MntSweetProducts
          +     1.32865070741283 * S_MonthsAsCustomer
          +      0.8173864987673 * S_NumDealsPurchases
          +     1.04804775338375 * S_NumWebVisitsMonth
          +    -1.72946268323829 * S_RFMstat  +     3.74278593401599 * 
        S_RMntFrq  +     0.08690587270493 * S_Recency
          +     0.02047957204463 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -1.50344324990897 * AcceptedCmp10
          +    -0.20978380766564 * AcceptedCmp20  +    -0.59285418034505 * 
        AcceptedCmp30  +    -0.17149392972569 * AcceptedCmp40
          +     0.45249707477318 * AcceptedCmp50  +    -0.65327760824746 * 
        Complain0  +     1.42156460466466 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -1.24289798004439 * AcceptedCmp10
          +     1.24624979457488 * AcceptedCmp20  +     0.33144842139218 * 
        AcceptedCmp30  +     -0.4872034456722 * AcceptedCmp40
          +     1.28997041867854 * AcceptedCmp50  +     -1.5327032066878 * 
        Complain0  +     1.91778569876362 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.87922911399007 * AcceptedCmp10
          +    -0.94787288066533 * AcceptedCmp20  +     2.04527234601749 * 
        AcceptedCmp30  +     0.24833213694075 * AcceptedCmp40
          +     1.60900434754659 * AcceptedCmp50  +    -0.55004614971759 * 
        Complain0  +     0.61774573286103 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +     0.86935835312931 * AcceptedCmp10
          +     0.86645335600811 * AcceptedCmp20  +     0.88117597493148 * 
        AcceptedCmp30  +     0.81675523083166 * AcceptedCmp40
          +     0.19025673240958 * AcceptedCmp50  +     0.88726242767978 * 
        Complain0  +    -1.77794504788307 * HigherEducationBinary0 ;
   H1x1_5  = H1x1_5  +    -1.31606378982907 * AcceptedCmp10
          +    -2.73475337981814 * AcceptedCmp20  +    -0.70870498104131 * 
        AcceptedCmp30  +    -1.05303367791364 * AcceptedCmp40
          +    -0.04198792844785 * AcceptedCmp50  +     0.05756398556346 * 
        Complain0  +     1.03743504565535 * HigherEducationBinary0 ;
   H1x1_6  = H1x1_6  +    -0.34885584282455 * AcceptedCmp10
          +     1.03682337828657 * AcceptedCmp20  +     0.42400668101582 * 
        AcceptedCmp30  +     0.21978456990971 * AcceptedCmp40
          +    -0.07932087917736 * AcceptedCmp50  +      0.8792580651126 * 
        Complain0  +    -1.32868689587866 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     1.22170418338538 * Education2n_Cycle
          +    -0.89708584095759 * EducationBasic  +     0.14600831823121 * 
        EducationGraduation  +    -0.31624019107181 * EducationMaster
          +    -0.82783034099773 * Marital_StatusDivorced
          +     0.39651075241405 * Marital_StatusMarried
          +     0.17323156170107 * Marital_StatusSingle
          +    -0.15463096860068 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.58978972451291 * Education2n_Cycle
          +     0.19362558984066 * EducationBasic  +    -1.26231294369002 * 
        EducationGraduation  +    -0.05323450200928 * EducationMaster
          +    -2.42314580112302 * Marital_StatusDivorced
          +     1.72709251267075 * Marital_StatusMarried
          +    -0.94350561587168 * Marital_StatusSingle
          +      0.7843550906207 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.72941468865776 * Education2n_Cycle
          +    -0.36115614328883 * EducationBasic  +    -1.74898957297891 * 
        EducationGraduation  +    -1.41317064722862 * EducationMaster
          +    -1.25323701705333 * Marital_StatusDivorced
          +    -0.72618091015379 * Marital_StatusMarried
          +     0.20594885266863 * Marital_StatusSingle
          +     1.01375770093502 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.50789594186684 * Education2n_Cycle
          +     -1.1844688511224 * EducationBasic  +     0.58416148321529 * 
        EducationGraduation  +     0.75559299844055 * EducationMaster
          +     -0.9159957275063 * Marital_StatusDivorced
          +     2.06164757358796 * Marital_StatusMarried
          +    -1.61544310412168 * Marital_StatusSingle
          +     2.48191290499231 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +    -0.12718285014627 * Education2n_Cycle
          +    -1.15731060601092 * EducationBasic  +    -2.27989707190272 * 
        EducationGraduation  +     0.27594869585414 * EducationMaster
          +    -0.72418104768251 * Marital_StatusDivorced
          +     0.51077116161056 * Marital_StatusMarried
          +     -2.0857896888723 * Marital_StatusSingle
          +     1.23349520338513 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +    -0.27482868097878 * Education2n_Cycle
          +     0.43660267071317 * EducationBasic  +     2.25751743331526 * 
        EducationGraduation  +     -0.7287361872795 * EducationMaster
          +     0.64139965212864 * Marital_StatusDivorced
          +    -1.52338846336783 * Marital_StatusMarried
          +     1.94794784762286 * Marital_StatusSingle
          +     -0.8708272739488 * Marital_StatusTogether ;
   H1x1_1  =    -0.50508246154341 + H1x1_1 ;
   H1x1_2  =     0.29227723492853 + H1x1_2 ;
   H1x1_3  =     0.87104310832885 + H1x1_3 ;
   H1x1_4  =     1.73967602723421 + H1x1_4 ;
   H1x1_5  =    -2.04513596136193 + H1x1_5 ;
   H1x1_6  =     2.15101812022157 + H1x1_6 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
   H1x1_6  = 1.0 / (1.0 + EXP(MIN( - H1x1_6 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     6.16204844771495 * H1x1_1  +    -7.21545236186523 * H1x1_2
          +    -5.36324944599407 * H1x1_3  +    -11.4351776197688 * H1x1_4
          +     9.05135439297009 * H1x1_5  +     11.1808170215866 * H1x1_6 ;
   P_DepVar1  =    -1.47727219445057 + P_DepVar1 ;
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
