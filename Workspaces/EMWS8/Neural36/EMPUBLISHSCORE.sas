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
   H11  =     0.36000962274804 * S_AcceptedCmpTotal  +     0.13239432872685 *
        S_Age  +    -0.24479648030675 * S_Frq  +    -0.11378309212122 *
        S_Income  +     0.21750952380855 * S_Kidhome
          +    -0.08044783492927 * S_MntFishProducts
          +    -0.26553535055884 * S_MntFruits  +    -0.25647833086836 *
        S_MntGoldProds  +     0.07686237427471 * S_MntSweetProducts
          +     0.21771961094731 * S_MonthsAsCustomer
          +    -0.21903402159238 * S_NumDealsPurchases
          +     0.07524051658517 * S_NumWebVisitsMonth
          +     0.09218514539395 * S_RFMstat  +    -0.01500976674783 *
        S_RMntFrq  +     0.15402543843086 * S_Recency
          +     0.18461168759106 * S_Teenhome ;
   H12  =    -0.49653981981197 * S_AcceptedCmpTotal  +     0.00820296023369 *
        S_Age  +     0.02080098287039 * S_Frq  +    -0.88724925439474 *
        S_Income  +    -0.49605626002973 * S_Kidhome
          +     0.10517896157475 * S_MntFishProducts
          +     -0.0429967206225 * S_MntFruits  +     -0.4225884879406 *
        S_MntGoldProds  +     0.19871708839934 * S_MntSweetProducts
          +    -0.10375527308409 * S_MonthsAsCustomer
          +    -0.53136736000436 * S_NumDealsPurchases
          +    -0.65901942080904 * S_NumWebVisitsMonth
          +    -0.29807303144257 * S_RFMstat  +    -0.07000000119957 *
        S_RMntFrq  +     0.74199437413301 * S_Recency
          +     0.29342408495156 * S_Teenhome ;
   H13  =    -0.21846955455906 * S_AcceptedCmpTotal  +     0.05403879643217 *
        S_Age  +     0.32884047934293 * S_Frq  +    -0.26436777416108 *
        S_Income  +     0.59065288574886 * S_Kidhome
          +    -0.18958711335144 * S_MntFishProducts
          +     0.10565927182396 * S_MntFruits  +     0.32606408959907 *
        S_MntGoldProds  +     0.19471013086542 * S_MntSweetProducts
          +     0.71656506833042 * S_MonthsAsCustomer
          +    -0.04072089627582 * S_NumDealsPurchases
          +    -0.27438755826912 * S_NumWebVisitsMonth
          +    -0.15194525158273 * S_RFMstat  +     0.07919379315006 *
        S_RMntFrq  +     0.81758505097075 * S_Recency
          +     0.37450012539479 * S_Teenhome ;
   H14  =    -0.29933236270852 * S_AcceptedCmpTotal  +     0.04416245754949 *
        S_Age  +     0.82879096569011 * S_Frq  +      0.0818363204729 *
        S_Income  +     0.00768227277939 * S_Kidhome
          +    -0.27685739284497 * S_MntFishProducts
          +     0.22901521347456 * S_MntFruits  +    -0.20698520707124 *
        S_MntGoldProds  +     0.10835707853786 * S_MntSweetProducts
          +    -0.03068844998334 * S_MonthsAsCustomer
          +    -0.69479436312036 * S_NumDealsPurchases
          +     -0.4393474107017 * S_NumWebVisitsMonth
          +    -0.15914172884794 * S_RFMstat  +    -0.12183408512217 *
        S_RMntFrq  +      0.8406065527992 * S_Recency
          +     0.10938208644325 * S_Teenhome ;
   H15  =    -0.07989461710968 * S_AcceptedCmpTotal  +     0.02520461782285 *
        S_Age  +     0.46368270076595 * S_Frq  +     0.76261332383453 *
        S_Income  +    -0.51839743047965 * S_Kidhome
          +    -0.02144274217077 * S_MntFishProducts
          +    -0.19784934853186 * S_MntFruits  +    -0.01525984496853 *
        S_MntGoldProds  +    -0.05681912088546 * S_MntSweetProducts
          +     0.24094683798118 * S_MonthsAsCustomer
          +    -0.20470895380857 * S_NumDealsPurchases
          +    -0.04229046042286 * S_NumWebVisitsMonth
          +     0.01961061239932 * S_RFMstat  +      0.3381447256393 *
        S_RMntFrq  +    -0.44932156810373 * S_Recency
          +    -0.61790082797458 * S_Teenhome ;
   H16  =    -0.38269313632664 * S_AcceptedCmpTotal  +     0.11006540091469 *
        S_Age  +     -0.1767910334589 * S_Frq  +    -0.00490242889126 *
        S_Income  +     0.02720460857968 * S_Kidhome
          +     0.29950803645372 * S_MntFishProducts
          +    -0.15345670329539 * S_MntFruits  +     0.34655407204139 *
        S_MntGoldProds  +    -0.02229418931744 * S_MntSweetProducts
          +     0.02204230679806 * S_MonthsAsCustomer
          +    -0.25485501436102 * S_NumDealsPurchases
          +    -0.17609701383443 * S_NumWebVisitsMonth
          +    -0.05938098026417 * S_RFMstat  +    -0.10024611806861 *
        S_RMntFrq  +    -0.26804720805791 * S_Recency
          +    -0.02044175758055 * S_Teenhome ;
   H17  =      0.1985622495367 * S_AcceptedCmpTotal  +    -0.36429758847236 *
        S_Age  +     -0.4954636884509 * S_Frq  +    -0.47213838179513 *
        S_Income  +     0.24254932830419 * S_Kidhome
          +    -0.25035143476353 * S_MntFishProducts
          +      0.3251880352164 * S_MntFruits  +     0.11904076066631 *
        S_MntGoldProds  +      0.4778251958559 * S_MntSweetProducts
          +     0.05508911955177 * S_MonthsAsCustomer
          +     0.43094410881575 * S_NumDealsPurchases
          +     0.55649942238699 * S_NumWebVisitsMonth
          +     0.07386313861153 * S_RFMstat  +     0.09234120382392 *
        S_RMntFrq  +    -0.58631268789981 * S_Recency
          +     0.37236736626549 * S_Teenhome ;
   H11  = H11  +     0.19342246326602 * AcceptedCmp10
          +    -0.07001820008344 * AcceptedCmp20  +     0.21860480261982 *
        AcceptedCmp30  +     0.21374261249746 * AcceptedCmp40
          +    -0.02870278449511 * AcceptedCmp50  +    -0.07033441545804 *
        Complain0  +     0.01642499473064 * HigherEducationBinary0 ;
   H12  = H12  +    -0.08182188852261 * AcceptedCmp10
          +    -0.04639835556703 * AcceptedCmp20  +     0.30885326821956 *
        AcceptedCmp30  +    -0.49293321860901 * AcceptedCmp40
          +     0.14067475472234 * AcceptedCmp50  +    -0.30851269018964 *
        Complain0  +     0.31454620640628 * HigherEducationBinary0 ;
   H13  = H13  +    -0.27886027565455 * AcceptedCmp10
          +    -0.00385859269678 * AcceptedCmp20  +      0.1655367549138 *
        AcceptedCmp30  +    -0.02852382995259 * AcceptedCmp40
          +     0.18013772257339 * AcceptedCmp50  +    -0.58691394085017 *
        Complain0  +     -0.3465210325909 * HigherEducationBinary0 ;
   H14  = H14  +      0.6044118713355 * AcceptedCmp10
          +     0.06510542135177 * AcceptedCmp20  +      0.3366450806552 *
        AcceptedCmp30  +     -0.0330978938783 * AcceptedCmp40
          +     0.60975793313105 * AcceptedCmp50  +     0.00142354760386 *
        Complain0  +    -0.12780047510343 * HigherEducationBinary0 ;
   H15  = H15  +    -0.43840589401705 * AcceptedCmp10
          +    -0.35556869843034 * AcceptedCmp20  +    -0.29691074590721 *
        AcceptedCmp30  +    -0.62791559884262 * AcceptedCmp40
          +     0.07298937862213 * AcceptedCmp50  +     -0.5602729765105 *
        Complain0  +     0.37281598679728 * HigherEducationBinary0 ;
   H16  = H16  +    -0.10495256761878 * AcceptedCmp10
          +     0.20638329490056 * AcceptedCmp20  +     0.33980310571941 *
        AcceptedCmp30  +    -0.02303706996638 * AcceptedCmp40
          +    -0.22082467657245 * AcceptedCmp50  +    -0.37255876907906 *
        Complain0  +     0.14080753528161 * HigherEducationBinary0 ;
   H17  = H17  +    -0.08301858040998 * AcceptedCmp10
          +    -0.04492354980094 * AcceptedCmp20  +    -0.44392932808946 *
        AcceptedCmp30  +     0.10453400288592 * AcceptedCmp40
          +    -0.05275111256982 * AcceptedCmp50  +    -0.19003968198552 *
        Complain0  +    -0.21318068322641 * HigherEducationBinary0 ;
   H11  = H11  +    -0.16815596793035 * Education2n_Cycle
          +     -0.3150496884466 * EducationBasic  +     0.13313088002688 *
        EducationGraduation  +     0.01961806614347 * EducationMaster
          +     0.03275540853062 * Marital_StatusDivorced
          +     0.29689226091885 * Marital_StatusMarried
          +    -0.05586997084575 * Marital_StatusSingle
          +     0.27884598866186 * Marital_StatusTogether ;
   H12  = H12  +    -0.10888736720099 * Education2n_Cycle
          +     0.25302119798937 * EducationBasic  +    -0.25358803628109 *
        EducationGraduation  +     0.07097115235032 * EducationMaster
          +    -0.12970631685661 * Marital_StatusDivorced
          +     0.28853695942277 * Marital_StatusMarried
          +     -0.2170193118554 * Marital_StatusSingle
          +     0.13947296642854 * Marital_StatusTogether ;
   H13  = H13  +     0.15503972613781 * Education2n_Cycle
          +    -0.09410967363961 * EducationBasic  +     0.09429940194034 *
        EducationGraduation  +    -0.24223989549497 * EducationMaster
          +     0.03808999508637 * Marital_StatusDivorced
          +     0.03834730093758 * Marital_StatusMarried
          +     0.16077225431457 * Marital_StatusSingle
          +    -0.41494817791589 * Marital_StatusTogether ;
   H14  = H14  +       0.093101289722 * Education2n_Cycle
          +      0.1765803688537 * EducationBasic  +    -0.08807126490465 *
        EducationGraduation  +     0.00074671485466 * EducationMaster
          +    -0.08695435451347 * Marital_StatusDivorced
          +     0.20042192606764 * Marital_StatusMarried
          +     0.21209104967029 * Marital_StatusSingle
          +     0.25215677247162 * Marital_StatusTogether ;
   H15  = H15  +     0.05518526633864 * Education2n_Cycle
          +     0.15597881738837 * EducationBasic  +     0.18166442962732 *
        EducationGraduation  +    -0.40168146559233 * EducationMaster
          +     0.16021818575472 * Marital_StatusDivorced
          +     -0.8109091408195 * Marital_StatusMarried
          +       0.838127299868 * Marital_StatusSingle
          +    -0.80016450847109 * Marital_StatusTogether ;
   H16  = H16  +    -0.15122478304483 * Education2n_Cycle
          +    -0.32004082421454 * EducationBasic  +     0.14795648488333 *
        EducationGraduation  +     -0.2406520101771 * EducationMaster
          +    -0.01818054449911 * Marital_StatusDivorced
          +     0.04354541213426 * Marital_StatusMarried
          +    -0.05394516832264 * Marital_StatusSingle
          +     0.07577362955755 * Marital_StatusTogether ;
   H17  = H17  +    -0.19184771255349 * Education2n_Cycle
          +     0.31535357760987 * EducationBasic  +      0.2162161773158 *
        EducationGraduation  +     0.13000777186171 * EducationMaster
          +     0.23651538011896 * Marital_StatusDivorced
          +      0.1065515173671 * Marital_StatusMarried
          +    -0.07989500357339 * Marital_StatusSingle
          +    -0.19584393934236 * Marital_StatusTogether ;
   H11  =     1.31709493523372 + H11 ;
   H12  =     0.20417396911424 + H12 ;
   H13  =    -0.78038544901855 + H13 ;
   H14  =     0.85429095428103 + H14 ;
   H15  =    -0.15651558702659 + H15 ;
   H16  =    -0.71475475472328 + H16 ;
   H17  =    -1.05698933818722 + H17 ;
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
   P_DepVar1  =    -0.12038995248961 * H11  +    -2.69324577380512 * H12
          +    -1.79561475706231 * H13  +    -1.84884271280779 * H14
          +     2.51311654601731 * H15  +    -0.19262434168123 * H16
          +     1.25113101091852 * H17 ;
   P_DepVar1  =    -1.67304770086145 + P_DepVar1 ;
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
H16
H17
;
drop S_:;
