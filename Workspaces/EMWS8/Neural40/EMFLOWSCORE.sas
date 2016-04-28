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
   H11  =     0.00871038651131 * S_AcceptedCmpTotal  +     0.04885111887799 *
        S_Age  +    -0.16081720955101 * S_Frq  +    -0.81673231415398 *
        S_Income  +     0.39760289149752 * S_Kidhome
          +     -0.0376693415484 * S_MntFishProducts
          +     0.01707556953741 * S_MntFruits  +     0.03640992016126 *
        S_MntGoldProds  +     0.18721014378487 * S_MntSweetProducts
          +    -0.13043754404228 * S_MonthsAsCustomer
          +     -0.0139146653349 * S_NumDealsPurchases
          +    -0.01539820220757 * S_NumWebVisitsMonth
          +     0.00494819481975 * S_RFMstat  +    -0.22517942530642 *
        S_RMntFrq  +     0.55149605442396 * S_Recency
          +     0.54614592562743 * S_Teenhome ;
   H12  =    -0.31218916782956 * S_AcceptedCmpTotal  +    -0.13577174745207 *
        S_Age  +     -0.1133596721701 * S_Frq  +    -0.03250630326063 *
        S_Income  +     0.31208673256073 * S_Kidhome
          +    -0.04911763008195 * S_MntFishProducts
          +     0.04440357574827 * S_MntFruits  +     0.18064625439163 *
        S_MntGoldProds  +     0.34124097901137 * S_MntSweetProducts
          +    -0.48577934340503 * S_MonthsAsCustomer
          +     0.31218334237091 * S_NumDealsPurchases
          +     0.24212805498377 * S_NumWebVisitsMonth
          +     0.30439494800184 * S_RFMstat  +    -0.01845944589462 *
        S_RMntFrq  +    -0.48513476805321 * S_Recency
          +    -0.32721006241811 * S_Teenhome ;
   H13  =    -0.68076549765273 * S_AcceptedCmpTotal  +    -0.14510411148941 *
        S_Age  +     -0.3233004374436 * S_Frq  +    -0.42499945066724 *
        S_Income  +    -0.48748003518551 * S_Kidhome
          +     0.15434683428908 * S_MntFishProducts
          +     0.06482294164983 * S_MntFruits  +    -0.54308686262134 *
        S_MntGoldProds  +    -0.03954494482452 * S_MntSweetProducts
          +    -0.07405705160744 * S_MonthsAsCustomer
          +    -0.44979778263337 * S_NumDealsPurchases
          +    -0.51422673599958 * S_NumWebVisitsMonth
          +    -0.31727878849334 * S_RFMstat  +    -0.49659927360573 *
        S_RMntFrq  +     0.79850779605341 * S_Recency
          +    -0.01021777395977 * S_Teenhome ;
   H14  =     0.38365136681667 * S_AcceptedCmpTotal  +     0.07084748712672 *
        S_Age  +     0.07185932608666 * S_Frq  +     0.14505870102604 *
        S_Income  +    -0.62401744170985 * S_Kidhome
          +    -0.08499883212951 * S_MntFishProducts
          +     -0.1648853454448 * S_MntFruits  +    -0.00355780886042 *
        S_MntGoldProds  +    -0.29925551636086 * S_MntSweetProducts
          +    -0.04051431518694 * S_MonthsAsCustomer
          +     0.00788125797776 * S_NumDealsPurchases
          +     0.59495434076477 * S_NumWebVisitsMonth
          +     0.24302483463729 * S_RFMstat  +    -0.16358266655642 *
        S_RMntFrq  +    -0.73053231334164 * S_Recency
          +    -0.33321827557738 * S_Teenhome ;
   H15  =    -0.33763603932626 * S_AcceptedCmpTotal  +     0.16015390350682 *
        S_Age  +     0.93534536415494 * S_Frq  +     0.26932392970726 *
        S_Income  +     -0.0256051183156 * S_Kidhome
          +    -0.15661247042419 * S_MntFishProducts
          +     0.05583315238736 * S_MntFruits  +     0.02103897411055 *
        S_MntGoldProds  +     -0.1231125389085 * S_MntSweetProducts
          +     0.03994503424293 * S_MonthsAsCustomer
          +    -0.53734193208154 * S_NumDealsPurchases
          +    -0.58547802324835 * S_NumWebVisitsMonth
          +    -0.06088682875304 * S_RFMstat  +    -0.16953747051887 *
        S_RMntFrq  +     0.66048924026365 * S_Recency
          +    -0.18125808371879 * S_Teenhome ;
   H11  = H11  +     0.32214548124302 * AcceptedCmp10
          +     0.39647739988372 * AcceptedCmp20  +     0.31108042021128 *
        AcceptedCmp30  +     0.29806974935147 * AcceptedCmp40
          +     0.22776887209675 * AcceptedCmp50  +     0.15240663199135 *
        Complain0  +    -0.29371842867452 * HigherEducationBinary0 ;
   H12  = H12  +     0.16508910764131 * AcceptedCmp10
          +    -0.01591698903562 * AcceptedCmp20  +    -0.18749319390831 *
        AcceptedCmp30  +     0.10267845517937 * AcceptedCmp40
          +     0.26889478167941 * AcceptedCmp50  +     0.21127321497252 *
        Complain0  +     0.26244151632714 * HigherEducationBinary0 ;
   H13  = H13  +     -0.1188260559539 * AcceptedCmp10
          +    -0.14527518577208 * AcceptedCmp20  +     0.15234135364477 *
        AcceptedCmp30  +    -0.09444923232962 * AcceptedCmp40
          +     0.19708535923248 * AcceptedCmp50  +    -0.29618019247654 *
        Complain0  +     0.12575052691333 * HigherEducationBinary0 ;
   H14  = H14  +     0.22744978434743 * AcceptedCmp10
          +    -0.01189686575388 * AcceptedCmp20  +    -0.32196819611195 *
        AcceptedCmp30  +     0.01600068421368 * AcceptedCmp40
          +     0.00556822856215 * AcceptedCmp50  +     0.18009079154413 *
        Complain0  +     0.03016266549641 * HigherEducationBinary0 ;
   H15  = H15  +     0.52725777941338 * AcceptedCmp10
          +     0.01843467049946 * AcceptedCmp20  +     0.47168025621809 *
        AcceptedCmp30  +    -0.05224480469429 * AcceptedCmp40
          +     0.29146234318613 * AcceptedCmp50  +     0.05946217105031 *
        Complain0  +     0.16683238673979 * HigherEducationBinary0 ;
   H11  = H11  +     0.02840049264257 * Education2n_Cycle
          +    -0.12984345243569 * EducationBasic  +    -0.10299098163695 *
        EducationGraduation  +     0.23295390047952 * EducationMaster
          +    -0.41529808115031 * Marital_StatusDivorced
          +     0.65264978817749 * Marital_StatusMarried
          +    -0.52150453945732 * Marital_StatusSingle
          +     0.69963607397544 * Marital_StatusTogether ;
   H12  = H12  +    -0.18683184010407 * Education2n_Cycle
          +    -0.04325754530797 * EducationBasic  +     0.25926294135162 *
        EducationGraduation  +     0.04425534246646 * EducationMaster
          +    -0.32207382402099 * Marital_StatusDivorced
          +     0.16112567537413 * Marital_StatusMarried
          +     0.28859198712458 * Marital_StatusSingle
          +    -0.31707896724726 * Marital_StatusTogether ;
   H13  = H13  +     0.03402340531236 * Education2n_Cycle
          +     0.17313991053917 * EducationBasic  +    -0.24806694961277 *
        EducationGraduation  +    -0.16283334360744 * EducationMaster
          +    -0.06823118087629 * Marital_StatusDivorced
          +    -0.01696675344176 * Marital_StatusMarried
          +    -0.04922830766868 * Marital_StatusSingle
          +    -0.15449558545998 * Marital_StatusTogether ;
   H14  = H14  +     0.04419529419265 * Education2n_Cycle
          +     0.10023190362026 * EducationBasic  +     0.23777777952905 *
        EducationGraduation  +     -0.1779877655909 * EducationMaster
          +     0.20346888384065 * Marital_StatusDivorced
          +     -0.5246097720646 * Marital_StatusMarried
          +     0.50991923175058 * Marital_StatusSingle
          +    -0.15346924309445 * Marital_StatusTogether ;
   H15  = H15  +     -0.0859109352002 * Education2n_Cycle
          +     0.23688872874499 * EducationBasic  +      0.0044459307881 *
        EducationGraduation  +     0.03117170136897 * EducationMaster
          +    -0.14128509643843 * Marital_StatusDivorced
          +    -0.17344467864829 * Marital_StatusMarried
          +     0.09201105049634 * Marital_StatusSingle
          +     0.03562553790735 * Marital_StatusTogether ;
   H11  =     0.44460027749342 + H11 ;
   H12  =    -0.95819350927335 + H12 ;
   H13  =    -0.44968673753742 + H13 ;
   H14  =     0.53878131931255 + H14 ;
   H15  =     0.82891048270823 + H15 ;
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
   P_DepVar1  =    -3.09211467027119 * H11  +      0.8780551921753 * H12
          +    -2.64280779387115 * H13  +     1.47258844960489 * H14
          +     -1.9161512747512 * H15 ;
   P_DepVar1  =    -1.84694532241195 + P_DepVar1 ;
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
;
drop S_:;
