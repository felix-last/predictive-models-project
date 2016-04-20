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
   H11  =     0.02151728870806 * S_AcceptedCmpTotal  +     0.05254894554809 *
        S_Age  +    -0.16973386556377 * S_Frq  +    -0.82728779491682 *
        S_Income  +     0.39903592539043 * S_Kidhome
          +    -0.04460924056526 * S_MntFishProducts
          +     0.02733683231833 * S_MntFruits  +     0.05011896594494 *
        S_MntGoldProds  +     0.19517504324129 * S_MntSweetProducts
          +    -0.13600486461772 * S_MonthsAsCustomer
          +    -0.00505319277464 * S_NumDealsPurchases
          +    -0.02131770482252 * S_NumWebVisitsMonth
          +     0.00524769837231 * S_RFMstat  +    -0.21746675829719 *
        S_RMntFrq  +     0.54271297675327 * S_Recency
          +      0.5568869219643 * S_Teenhome ;
   H12  =    -0.31677356986514 * S_AcceptedCmpTotal  +    -0.13636654958991 *
        S_Age  +    -0.12127604451874 * S_Frq  +    -0.03912727186842 *
        S_Income  +     0.31541271020596 * S_Kidhome
          +    -0.06070575535455 * S_MntFishProducts
          +     0.04717351357982 * S_MntFruits  +     0.20035627551608 *
        S_MntGoldProds  +     0.34661630810838 * S_MntSweetProducts
          +    -0.49660266591157 * S_MonthsAsCustomer
          +     0.31834511850835 * S_NumDealsPurchases
          +     0.24781307795044 * S_NumWebVisitsMonth
          +      0.2962065441422 * S_RFMstat  +    -0.00931536368325 *
        S_RMntFrq  +     -0.4887066152184 * S_Recency
          +    -0.31733549884932 * S_Teenhome ;
   H13  =    -0.67923945541429 * S_AcceptedCmpTotal  +     -0.1600759141845 *
        S_Age  +    -0.32206936571155 * S_Frq  +    -0.42231968918367 *
        S_Income  +    -0.48980326576867 * S_Kidhome
          +     0.16754214531813 * S_MntFishProducts
          +     0.07042633274724 * S_MntFruits  +    -0.54860029741519 *
        S_MntGoldProds  +    -0.02870819733746 * S_MntSweetProducts
          +    -0.09017520473136 * S_MonthsAsCustomer
          +    -0.45842921605242 * S_NumDealsPurchases
          +    -0.51952177798857 * S_NumWebVisitsMonth
          +    -0.31466002172051 * S_RFMstat  +    -0.48848348436254 *
        S_RMntFrq  +     0.79178959337864 * S_Recency
          +    -0.01573946454754 * S_Teenhome ;
   H14  =     0.38562838138579 * S_AcceptedCmpTotal  +     0.07260700845897 *
        S_Age  +     0.06970375186829 * S_Frq  +     0.14363271673316 *
        S_Income  +    -0.63270966560605 * S_Kidhome
          +    -0.08814987977037 * S_MntFishProducts
          +    -0.16742996280424 * S_MntFruits  +     -0.0048241161297 *
        S_MntGoldProds  +    -0.29868881598251 * S_MntSweetProducts
          +    -0.04826032378728 * S_MonthsAsCustomer
          +     0.01599853180114 * S_NumDealsPurchases
          +     0.60119173038714 * S_NumWebVisitsMonth
          +     0.24192512657122 * S_RFMstat  +    -0.16600268948701 *
        S_RMntFrq  +    -0.74024886149073 * S_Recency
          +    -0.33502330424595 * S_Teenhome ;
   H15  =    -0.34311356733661 * S_AcceptedCmpTotal  +     0.16235616443826 *
        S_Age  +     0.94382517748399 * S_Frq  +      0.2748531338861 *
        S_Income  +    -0.02219671454546 * S_Kidhome
          +    -0.15542333204257 * S_MntFishProducts
          +     0.05860799445207 * S_MntFruits  +      0.0164088007412 *
        S_MntGoldProds  +    -0.12449090470408 * S_MntSweetProducts
          +     0.03737130526687 * S_MonthsAsCustomer
          +    -0.55633092697691 * S_NumDealsPurchases
          +     -0.5935978122359 * S_NumWebVisitsMonth
          +    -0.06684824395733 * S_RFMstat  +    -0.17365329607203 *
        S_RMntFrq  +      0.6764486616945 * S_Recency
          +     -0.1892667221599 * S_Teenhome ;
   H11  = H11  +     0.32339671285779 * AcceptedCmp10
          +     0.40704039360735 * AcceptedCmp20  +     0.30956684671901 *
        AcceptedCmp30  +     0.31438728866768 * AcceptedCmp40
          +     0.23235496545772 * AcceptedCmp50  +     0.16248155382451 *
        Complain0  +    -0.30696195142475 * HigherEducationBinary0 ;
   H12  = H12  +     0.15468195814719 * AcceptedCmp10
          +    -0.01658463628305 * AcceptedCmp20  +    -0.18284432439766 *
        AcceptedCmp30  +     0.10412487730599 * AcceptedCmp40
          +      0.2784347604012 * AcceptedCmp50  +     0.21341015945758 *
        Complain0  +     0.26769837741874 * HigherEducationBinary0 ;
   H13  = H13  +    -0.11177158752481 * AcceptedCmp10
          +    -0.13739486515218 * AcceptedCmp20  +     0.15972072685818 *
        AcceptedCmp30  +    -0.09073450388158 * AcceptedCmp40
          +     0.20479045598357 * AcceptedCmp50  +    -0.28874847014038 *
        Complain0  +     0.12082289787754 * HigherEducationBinary0 ;
   H14  = H14  +     0.22760562650379 * AcceptedCmp10
          +    -0.01066432835565 * AcceptedCmp20  +    -0.32053666689899 *
        AcceptedCmp30  +     0.01405337529301 * AcceptedCmp40
          +     0.00690669937705 * AcceptedCmp50  +     0.18207401895977 *
        Complain0  +     0.02728138057211 * HigherEducationBinary0 ;
   H15  = H15  +     0.53146690040164 * AcceptedCmp10
          +     0.02061647343682 * AcceptedCmp20  +     0.47331796914114 *
        AcceptedCmp30  +    -0.05515580192077 * AcceptedCmp40
          +     0.29161268499344 * AcceptedCmp50  +     0.05844301388229 *
        Complain0  +      0.1779848505105 * HigherEducationBinary0 ;
   H11  = H11  +     0.03097010145548 * Education2n_Cycle
          +    -0.13406554569598 * EducationBasic  +    -0.09871242696608 *
        EducationGraduation  +     0.23998958645262 * EducationMaster
          +    -0.42082033749096 * Marital_StatusDivorced
          +     0.66219400411029 * Marital_StatusMarried
          +     -0.5319693170402 * Marital_StatusSingle
          +     0.70748197229966 * Marital_StatusTogether ;
   H12  = H12  +    -0.18240954892125 * Education2n_Cycle
          +      -0.040279707928 * EducationBasic  +     0.26318151864922 *
        EducationGraduation  +     0.04495546932118 * EducationMaster
          +      -0.322040509013 * Marital_StatusDivorced
          +     0.15587841196747 * Marital_StatusMarried
          +     0.28814320146342 * Marital_StatusSingle
          +    -0.31522150769005 * Marital_StatusTogether ;
   H13  = H13  +     0.03294796280016 * Education2n_Cycle
          +     0.16865870867242 * EducationBasic  +    -0.24783622415669 *
        EducationGraduation  +    -0.16728377319058 * EducationMaster
          +    -0.06468619863793 * Marital_StatusDivorced
          +    -0.01423713588549 * Marital_StatusMarried
          +    -0.04729389811247 * Marital_StatusSingle
          +    -0.15198305020182 * Marital_StatusTogether ;
   H14  = H14  +      0.0429131340472 * Education2n_Cycle
          +     0.09798160258855 * EducationBasic  +     0.23808953197663 *
        EducationGraduation  +    -0.18027397340106 * EducationMaster
          +     0.20711724648422 * Marital_StatusDivorced
          +    -0.52428656670194 * Marital_StatusMarried
          +     0.50784243935214 * Marital_StatusSingle
          +    -0.15093459229255 * Marital_StatusTogether ;
   H15  = H15  +    -0.07839732345604 * Education2n_Cycle
          +     0.23809754868431 * EducationBasic  +     0.00672017411768 *
        EducationGraduation  +     0.02815790747137 * EducationMaster
          +    -0.13878251101316 * Marital_StatusDivorced
          +     -0.1763810748285 * Marital_StatusMarried
          +     0.09863670564728 * Marital_StatusSingle
          +     0.03752805463412 * Marital_StatusTogether ;
   H11  =     0.45564602198436 + H11 ;
   H12  =    -0.95855185996396 + H12 ;
   H13  =    -0.44150964212393 + H13 ;
   H14  =     0.53989079832138 + H14 ;
   H15  =     0.82844095622763 + H15 ;
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
   P_DepVar1  =    -3.08524657689897 * H11  +     0.90135731546766 * H12
          +    -2.65297083917138 * H13  +     1.47809334967539 * H14
          +    -1.92897922289298 * H15 ;
   P_DepVar1  =    -1.84374798036079 + P_DepVar1 ;
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
