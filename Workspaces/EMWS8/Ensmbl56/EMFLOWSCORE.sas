*------------------------------------------------------------*;
* Ensmbl56: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 1 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Extension Class;
* TYPE: SAMPLE;
* NODE: FIMPORT;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Statistics Exploration;
* TYPE: EXPLORE;
* NODE: Stat;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Filtering;
* TYPE: MODIFY;
* NODE: Filter;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: SASHELP.EMCORE.EMCODETOOL.CLASS;
* TYPE: UTILITY;
* NODE: EMCODE4;
*------------------------------------------------------------*;

  Frq=NumStorePurchases+NumWebPurchases+NumCatalogPurchases;
  Mnt=MntFishProducts+MntFruits+MntGoldProds+MntMeatProducts+MntSweetProducts+MntWines;
  RMntFrq=Mnt/Frq;
  RFMstat=(Mnt*Frq)/(Recency+1);
  HigherEducation=1*(upcase(Education) in ("GRADUATION","MASTER","PHD"));
  Age = year(today())-Year_Birth;
  AcceptedCmpTotal=AcceptedCmp1+AcceptedCmp2+AcceptedCmp3+AcceptedCmp4+AcceptedCmp5;
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;
MonthsAsCustomer =int((today()-Dt_Customer)/12) ;
HigherEducationBinary =HigherEducation ;
NumDistPurchases =NumCatalogPurchases + NumWebPurchases ;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Metadata Node;
* TYPE: UTILITY;
* NODE: Meta3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural36;
*------------------------------------------------------------*;
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
drop S_:;
* Renaming variables for AutoNeural36;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural36;
*------------------------------------------------------------*;
drop AutoNeural36_P_DepVar1;
AutoNeural36_P_DepVar1 = P_DepVar1;
drop AutoNeural36_P_DepVar0;
AutoNeural36_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural36;
*------------------------------------------------------------*;
length AutoNeural36_I_DepVar $32;
drop AutoNeural36_I_DepVar;
AutoNeural36_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural36;
*------------------------------------------------------------*;
length AutoNeural36_WARN_ $4;
drop AutoNeural36_WARN_;
AutoNeural36_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 2 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural35;
*------------------------------------------------------------*;
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
drop S_:;
* Renaming variables for AutoNeural35;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural35;
*------------------------------------------------------------*;
drop AutoNeural35_P_DepVar1;
AutoNeural35_P_DepVar1 = P_DepVar1;
drop AutoNeural35_P_DepVar0;
AutoNeural35_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural35;
*------------------------------------------------------------*;
length AutoNeural35_I_DepVar $32;
drop AutoNeural35_I_DepVar;
AutoNeural35_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural35;
*------------------------------------------------------------*;
length AutoNeural35_WARN_ $4;
drop AutoNeural35_WARN_;
AutoNeural35_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 3 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural34;
*------------------------------------------------------------*;
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
   H1x1_1  =     0.41659167143273 * S_AcceptedCmpTotal
          +    -0.43555779881125 * S_Age  +    -2.30840270296038 * S_Frq
          +    -0.19595283430985 * S_Income  +     0.38317082020813 *
        S_Kidhome  +    -0.80522492908143 * S_MntFishProducts
          +    -0.11718232128175 * S_MntFruits  +     0.35136974187949 *
        S_MntGoldProds  +     0.35653263985472 * S_MntSweetProducts
          +     0.04740894983714 * S_MonthsAsCustomer
          +     1.39008006467326 * S_NumDealsPurchases
          +     0.21608999126738 * S_NumWebVisitsMonth
          +     0.05554993295686 * S_RFMstat  +     0.72537114423538 *
        S_RMntFrq  +    -0.30830265825486 * S_Recency
          +     0.40535135320567 * S_Teenhome ;
   H1x1_2  =    -1.31386211742069 * S_AcceptedCmpTotal
          +    -0.68003628868004 * S_Age  +     0.59153203929335 * S_Frq
          +    -0.79826058362974 * S_Income  +     0.00134219038557 *
        S_Kidhome  +     0.14291973705288 * S_MntFishProducts
          +    -0.35615254801925 * S_MntFruits  +    -0.65787491938607 *
        S_MntGoldProds  +    -0.81826173843883 * S_MntSweetProducts
          +     0.11090137331567 * S_MonthsAsCustomer
          +     0.22617410760471 * S_NumDealsPurchases
          +    -1.50612324994247 * S_NumWebVisitsMonth
          +    -1.65797080727762 * S_RFMstat  +    -0.00402190774815 *
        S_RMntFrq  +     1.36064773168913 * S_Recency
          +     0.74568313622632 * S_Teenhome ;
   H1x1_3  =      0.0964601887805 * S_AcceptedCmpTotal
          +     0.74252939620948 * S_Age  +    -0.53369097393206 * S_Frq
          +    -1.05153636403464 * S_Income  +      1.6966882737615 *
        S_Kidhome  +     -1.1927564753709 * S_MntFishProducts
          +     0.29709638691214 * S_MntFruits  +     0.08254164506598 *
        S_MntGoldProds  +     0.69694252258498 * S_MntSweetProducts
          +     1.12489244540865 * S_MonthsAsCustomer
          +     0.65186273365438 * S_NumDealsPurchases
          +    -2.32770073685469 * S_NumWebVisitsMonth
          +    -0.47647348844998 * S_RFMstat  +     0.99016859473564 *
        S_RMntFrq  +     2.60277611818411 * S_Recency
          +     0.85460652910726 * S_Teenhome ;
   H1x1_4  =     0.29649216056803 * S_AcceptedCmpTotal
          +    -0.02766114349884 * S_Age  +     0.24204272805161 * S_Frq
          +     1.18769824983204 * S_Income  +    -0.68284444935451 *
        S_Kidhome  +    -0.11979065412591 * S_MntFishProducts
          +    -0.15995606022202 * S_MntFruits  +    -0.10230477550678 *
        S_MntGoldProds  +    -0.12747851524837 * S_MntSweetProducts
          +     0.30886829972356 * S_MonthsAsCustomer
          +     0.65492907685123 * S_NumDealsPurchases
          +     0.10822300736498 * S_NumWebVisitsMonth
          +     0.08852254070372 * S_RFMstat  +     0.49057996875589 *
        S_RMntFrq  +     -0.7378392134822 * S_Recency
          +    -0.99040897413441 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -1.46086901919186 * AcceptedCmp10
          +    -0.06086543707595 * AcceptedCmp20  +    -0.17639316937072 *
        AcceptedCmp30  +    -0.92178496493897 * AcceptedCmp40
          +     0.55970684984856 * AcceptedCmp50  +    -0.55527703641539 *
        Complain0  +    -0.01739075877118 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     -0.0768775139385 * AcceptedCmp10
          +     0.16675663908361 * AcceptedCmp20  +    -0.24864607646531 *
        AcceptedCmp30  +    -2.72835017974134 * AcceptedCmp40
          +     2.50464945392047 * AcceptedCmp50  +    -0.57926150830705 *
        Complain0  +     0.39982220960967 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +    -0.54666498984131 * AcceptedCmp10
          +     1.29686034270038 * AcceptedCmp20  +      0.2422221770056 *
        AcceptedCmp30  +    -0.30436834269159 * AcceptedCmp40
          +     0.80634953873096 * AcceptedCmp50  +    -1.80822548041633 *
        Complain0  +    -0.40212927148666 * HigherEducationBinary0 ;
   H1x1_4  = H1x1_4  +    -0.44403138924573 * AcceptedCmp10
          +     0.13148228993691 * AcceptedCmp20  +    -0.68858891502154 *
        AcceptedCmp30  +    -0.73562513066917 * AcceptedCmp40
          +     0.14959106694889 * AcceptedCmp50  +    -0.62889493860419 *
        Complain0  +     0.43482765846469 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.45985316758065 * Education2n_Cycle
          +     0.50059543788524 * EducationBasic  +    -0.03949874118569 *
        EducationGraduation  +     0.30922934477029 * EducationMaster
          +     0.01556098790048 * Marital_StatusDivorced
          +     0.00512523764645 * Marital_StatusMarried
          +    -0.33980799511448 * Marital_StatusSingle
          +    -0.70457839004957 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -1.22651000864813 * Education2n_Cycle
          +     1.57892586252081 * EducationBasic  +    -0.50402333879661 *
        EducationGraduation  +     0.69751348344321 * EducationMaster
          +     0.01069434029942 * Marital_StatusDivorced
          +      0.3116587285334 * Marital_StatusMarried
          +    -0.98635795023549 * Marital_StatusSingle
          +    -1.19926386369298 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +     0.01113602290833 * Education2n_Cycle
          +    -0.08151748589167 * EducationBasic  +     1.04895627364724 *
        EducationGraduation  +     -0.8155628950024 * EducationMaster
          +    -0.60393077836174 * Marital_StatusDivorced
          +    -0.18138878944937 * Marital_StatusMarried
          +     0.53013032587101 * Marital_StatusSingle
          +    -0.48355749431477 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +    -0.16183745161166 * Education2n_Cycle
          +     0.24616875488483 * EducationBasic  +     0.33817097681105 *
        EducationGraduation  +    -0.40675219343984 * EducationMaster
          +     0.43223311502025 * Marital_StatusDivorced
          +    -1.15741416919552 * Marital_StatusMarried
          +     0.83939799284264 * Marital_StatusSingle
          +     -1.4386179382289 * Marital_StatusTogether ;
   H1x1_1  =    -1.10575074809008 + H1x1_1 ;
   H1x1_2  =    -0.13208482087653 + H1x1_2 ;
   H1x1_3  =    -0.62883550284187 + H1x1_3 ;
   H1x1_4  =    -0.60467840532552 + H1x1_4 ;
   H1x1_5  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 );
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
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
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
   P_DepVar1  =     13.9520296268246 * H1x1_1  +    -14.3029863704541 * H1x1_2
          +    -2.99382524020275 * H1x1_3  +     6.44484431028575 * H1x1_4
          +    -2.75024533065893 * H1x1_5 ;
   P_DepVar1  =    -1.37523509009785 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for AutoNeural34;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural34;
*------------------------------------------------------------*;
drop AutoNeural34_P_DepVar1;
AutoNeural34_P_DepVar1 = P_DepVar1;
drop AutoNeural34_P_DepVar0;
AutoNeural34_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural34;
*------------------------------------------------------------*;
length AutoNeural34_I_DepVar $32;
drop AutoNeural34_I_DepVar;
AutoNeural34_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural34;
*------------------------------------------------------------*;
length AutoNeural34_WARN_ $4;
drop AutoNeural34_WARN_;
AutoNeural34_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 4 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural40;
*------------------------------------------------------------*;
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
   H1x1_1  =    -0.39808302545964 * S_AcceptedCmpTotal
          +     -0.5932682979333 * S_Age  +    -2.09362067413126 * S_Frq
          +    -1.20621515343251 * S_Income  +       0.363305751087 *
        S_Kidhome  +     0.02736315573831 * S_MntFishProducts
          +     0.62551809528748 * S_MntFruits  +      0.6815005748355 *
        S_MntGoldProds  +    -0.14819082706475 * S_MntSweetProducts
          +     -0.6473961304074 * S_MonthsAsCustomer
          +     0.68960902951007 * S_NumDealsPurchases
          +    -0.03600585273268 * S_NumWebVisitsMonth
          +     0.45228404113456 * S_RFMstat  +     0.44947640704726 *
        S_RMntFrq  +    -0.37413569649471 * S_Recency
          +     0.84898068728085 * S_Teenhome ;
   H1x1_2  =     0.27496114501753 * S_AcceptedCmpTotal
          +    -0.73313147330708 * S_Age  +     1.07757803287667 * S_Frq
          +     -0.4059441670097 * S_Income  +    -1.63907729859394 *
        S_Kidhome  +    -0.36081853150156 * S_MntFishProducts
          +     0.77724266147719 * S_MntFruits  +     0.42430298772992 *
        S_MntGoldProds  +    -0.23864099272279 * S_MntSweetProducts
          +    -0.70674764548268 * S_MonthsAsCustomer
          +     0.03761139203619 * S_NumDealsPurchases
          +    -0.69359662485747 * S_NumWebVisitsMonth
          +    -0.15158956986745 * S_RFMstat  +     0.85514526899451 *
        S_RMntFrq  +    -1.62720417424557 * S_Recency
          +    -0.36643380686105 * S_Teenhome ;
   H1x1_3  =    -0.16507220222111 * S_AcceptedCmpTotal
          +    -0.26012819806252 * S_Age  +     -0.0019823410557 * S_Frq
          +    -1.21735801839643 * S_Income  +     0.32645311615861 *
        S_Kidhome  +    -0.13429965223768 * S_MntFishProducts
          +     0.59132541762114 * S_MntFruits  +     0.23741184063267 *
        S_MntGoldProds  +    -0.01067575877498 * S_MntSweetProducts
          +    -0.47559913836984 * S_MonthsAsCustomer
          +    -0.26961781245749 * S_NumDealsPurchases
          +    -0.67017962977412 * S_NumWebVisitsMonth
          +    -0.04160330560857 * S_RFMstat  +     0.00788680751491 *
        S_RMntFrq  +     0.67120737584665 * S_Recency
          +     0.82745650921998 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     -0.8271029788913 * AcceptedCmp10
          +    -1.01090465942885 * AcceptedCmp20  +     0.03605950075563 *
        AcceptedCmp30  +    -0.09307341142556 * AcceptedCmp40
          +     0.62610050256806 * AcceptedCmp50  +     0.41010233889465 *
        Complain0  +     0.12756081707274 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +    -0.67784636659395 * AcceptedCmp10
          +    -0.41778348792892 * AcceptedCmp20  +     0.48982660230515 *
        AcceptedCmp30  +    -0.12586206274558 * AcceptedCmp40
          +     0.63440584081354 * AcceptedCmp50  +    -0.87232626288272 *
        Complain0  +     0.72412034576012 * HigherEducationBinary0 ;
   H1x1_3  = H1x1_3  +     0.02909648889579 * AcceptedCmp10
          +     0.03783859252636 * AcceptedCmp20  +     0.79777546308675 *
        AcceptedCmp30  +     0.30802577452279 * AcceptedCmp40
          +     0.49362015992329 * AcceptedCmp50  +     0.01441743512493 *
        Complain0  +     0.07324232009067 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.34545867357294 * Education2n_Cycle
          +    -0.33162716240606 * EducationBasic  +    -0.53276067461426 *
        EducationGraduation  +     0.46172475127934 * EducationMaster
          +    -0.18858032329482 * Marital_StatusDivorced
          +     0.16067956508072 * Marital_StatusMarried
          +    -0.90926406046237 * Marital_StatusSingle
          +     0.39582771938147 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.26570241340865 * Education2n_Cycle
          +     0.12600765069726 * EducationBasic  +      -0.847209942338 *
        EducationGraduation  +    -0.74629011053947 * EducationMaster
          +     0.71998738170149 * Marital_StatusDivorced
          +    -1.53543515752013 * Marital_StatusMarried
          +     0.44068743694663 * Marital_StatusSingle
          +    -1.12841512916404 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +    -0.01340630624265 * Education2n_Cycle
          +    -0.00246599258364 * EducationBasic  +     -0.6512097106248 *
        EducationGraduation  +     0.11252156068047 * EducationMaster
          +    -0.31683932084863 * Marital_StatusDivorced
          +     0.17674162427585 * Marital_StatusMarried
          +    -0.67064017247711 * Marital_StatusSingle
          +     0.45179875802441 * Marital_StatusTogether ;
   H1x1_1  =     0.41282679514875 + H1x1_1 ;
   H1x1_2  =     -2.3217450621203 + H1x1_2 ;
   H1x1_3  =     1.54125537540943 + H1x1_3 ;
   H1x1_4  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 );
   _SUM_ = 0.;
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
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
   P_DepVar1  =      4.5760049074953 * H1x1_1  +     3.17609897996504 * H1x1_2
          +    -7.59788826096155 * H1x1_3  +      2.3561834107573 * H1x1_4 ;
   P_DepVar1  =     0.78534695136367 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for AutoNeural40;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural40;
*------------------------------------------------------------*;
drop AutoNeural40_P_DepVar1;
AutoNeural40_P_DepVar1 = P_DepVar1;
drop AutoNeural40_P_DepVar0;
AutoNeural40_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural40;
*------------------------------------------------------------*;
length AutoNeural40_I_DepVar $32;
drop AutoNeural40_I_DepVar;
AutoNeural40_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural40;
*------------------------------------------------------------*;
length AutoNeural40_WARN_ $4;
drop AutoNeural40_WARN_;
AutoNeural40_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 5 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural39;
*------------------------------------------------------------*;
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
   H1x1_1  =    -0.59619526510279 * S_AcceptedCmpTotal
          +    -0.19567367757209 * S_Age  +    -1.87154193856682 * S_Frq
          +    -0.61220463973763 * S_Income  +     0.39435632091859 *
        S_Kidhome  +     0.27115687172661 * S_MntFishProducts
          +    -0.11978715045932 * S_MntFruits  +     0.29519469099756 *
        S_MntGoldProds  +     0.10278416295834 * S_MntSweetProducts
          +     -0.1740957673716 * S_MonthsAsCustomer
          +     0.66565026405117 * S_NumDealsPurchases
          +     0.43247206282836 * S_NumWebVisitsMonth
          +     0.36972451068821 * S_RFMstat  +     0.26260869862277 *
        S_RMntFrq  +    -0.28002323732518 * S_Recency
          +     0.44490818869588 * S_Teenhome ;
   H1x1_2  =    -0.18817303555602 * S_AcceptedCmpTotal
          +     0.02563068671435 * S_Age  +    -0.19671119906022 * S_Frq
          +    -0.57601068946749 * S_Income  +     0.32494160304894 *
        S_Kidhome  +     0.01652017751959 * S_MntFishProducts
          +     0.05773921061355 * S_MntFruits  +     0.02592530362424 *
        S_MntGoldProds  +     0.08946665597916 * S_MntSweetProducts
          +    -0.06176784990963 * S_MonthsAsCustomer
          +    -0.11740415005833 * S_NumDealsPurchases
          +    -0.17084845478672 * S_NumWebVisitsMonth
          +     0.00178400194387 * S_RFMstat  +    -0.13250191926905 *
        S_RMntFrq  +     0.54983271222574 * S_Recency
          +     0.42609230297633 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.73533354476059 * AcceptedCmp10
          +    -0.96410698969351 * AcceptedCmp20  +    -0.68713486641274 *
        AcceptedCmp30  +    -0.36566057748639 * AcceptedCmp40
          +     0.30630246801131 * AcceptedCmp50  +     0.35120823961025 *
        Complain0  +     -0.4767771812126 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     0.09341963945817 * AcceptedCmp10
          +     0.08648218396156 * AcceptedCmp20  +     0.20807620140826 *
        AcceptedCmp30  +     0.07826062169244 * AcceptedCmp40
          +     0.02564266279554 * AcceptedCmp50  +     0.04261102080378 *
        Complain0  +    -0.27229992860702 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.21712849768666 * Education2n_Cycle
          +    -0.14027907370038 * EducationBasic  +    -0.11959455460972 *
        EducationGraduation  +     0.22632282500966 * EducationMaster
          +     -0.0800438380883 * Marital_StatusDivorced
          +     0.44505766937623 * Marital_StatusMarried
          +    -0.57546515626468 * Marital_StatusSingle
          +     0.38638180853046 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +     0.20241854612702 * Education2n_Cycle
          +    -0.02204834045555 * EducationBasic  +    -0.17229363591628 *
        EducationGraduation  +      0.0794165981215 * EducationMaster
          +    -0.20291653465543 * Marital_StatusDivorced
          +     0.39547414450617 * Marital_StatusMarried
          +    -0.37001331184001 * Marital_StatusSingle
          +     0.37889668606101 * Marital_StatusTogether ;
   H1x1_1  =     0.85218451823494 + H1x1_1 ;
   H1x1_2  =     1.25904481865206 + H1x1_2 ;
   H1x1_3  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 );
   _SUM_ = 0.;
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
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
   P_DepVar1  =     4.98178607983008 * H1x1_1  +    -8.34979505969025 * H1x1_2
          +     10.3301873876241 * H1x1_3 ;
   P_DepVar1  =    -0.46201067268314 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for AutoNeural39;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural39;
*------------------------------------------------------------*;
drop AutoNeural39_P_DepVar1;
AutoNeural39_P_DepVar1 = P_DepVar1;
drop AutoNeural39_P_DepVar0;
AutoNeural39_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural39;
*------------------------------------------------------------*;
length AutoNeural39_I_DepVar $32;
drop AutoNeural39_I_DepVar;
AutoNeural39_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural39;
*------------------------------------------------------------*;
length AutoNeural39_WARN_ $4;
drop AutoNeural39_WARN_;
AutoNeural39_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 6 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural38;
*------------------------------------------------------------*;
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
   H1x1_1  =     0.14799095926144 * S_AcceptedCmpTotal
          +    -0.04647384466642 * S_Age  +     0.24999790039572 * S_Frq
          +     0.67193946760329 * S_Income  +    -0.42077272097029 *
        S_Kidhome  +    -0.02139676364759 * S_MntFishProducts
          +    -0.06309036790386 * S_MntFruits  +    -0.02579098391162 *
        S_MntGoldProds  +    -0.10360214785919 * S_MntSweetProducts
          +     0.07696704519183 * S_MonthsAsCustomer
          +     0.06885982009617 * S_NumDealsPurchases
          +     0.18284147478918 * S_NumWebVisitsMonth
          +    -0.00475791839806 * S_RFMstat  +     0.16731511643557 *
        S_RMntFrq  +    -0.65651411558717 * S_Recency
          +    -0.45659275487674 * S_Teenhome ;
   H1x1_2  =      0.4505629421372 * S_AcceptedCmpTotal
          +     0.25939118491361 * S_Age  +     2.77688249418832 * S_Frq
          +     0.32697030303845 * S_Income  +    -0.37246867163551 *
        S_Kidhome  +    -0.61585865165341 * S_MntFishProducts
          +     0.48583904586511 * S_MntFruits  +    -0.38353134378746 *
        S_MntGoldProds  +     0.00655094628315 * S_MntSweetProducts
          +     0.19400730773464 * S_MonthsAsCustomer
          +    -1.36455521037197 * S_NumDealsPurchases
          +    -1.07068059346196 * S_NumWebVisitsMonth
          +     -0.4953702697801 * S_RFMstat  +    -0.73989265677449 *
        S_RMntFrq  +     1.36066079800227 * S_Recency
          +    -0.04271320094349 * S_Teenhome ;
   H1x1_1  = H1x1_1  +    -0.15625358687394 * AcceptedCmp10
          +    -0.16004536933275 * AcceptedCmp20  +    -0.25016784155495 *
        AcceptedCmp30  +    -0.15585105085453 * AcceptedCmp40
          +    -0.06982247699471 * AcceptedCmp50  +    -0.11568047349098 *
        Complain0  +     0.36349047632504 * HigherEducationBinary0 ;
   H1x1_2  = H1x1_2  +     1.51765243597714 * AcceptedCmp10
          +     1.47001519525633 * AcceptedCmp20  +      1.4613337402064 *
        AcceptedCmp30  +     0.39175009738324 * AcceptedCmp40
          +    -0.35396325940732 * AcceptedCmp50  +     -0.8151538493653 *
        Complain0  +     0.47014175146609 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +    -0.41546031612995 * Education2n_Cycle
          +     0.33474673936754 * EducationBasic  +     0.15788973153313 *
        EducationGraduation  +    -0.13796568916415 * EducationMaster
          +     0.23432241402098 * Marital_StatusDivorced
          +    -0.46302700269027 * Marital_StatusMarried
          +      0.4032168653504 * Marital_StatusSingle
          +    -0.44795341835702 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -0.18958861902397 * Education2n_Cycle
          +     0.56593307913524 * EducationBasic  +    -0.16639049776163 *
        EducationGraduation  +     -0.3917553423088 * EducationMaster
          +    -0.31347503340603 * Marital_StatusDivorced
          +    -0.20319530959178 * Marital_StatusMarried
          +     0.48298350411196 * Marital_StatusSingle
          +      -0.252969507874 * Marital_StatusTogether ;
   H1x1_1  =    -1.25768416618497 + H1x1_1 ;
   H1x1_2  =      1.4658519648796 + H1x1_2 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
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
   P_DepVar1  =     15.2788764824385 * H1x1_1  +    -7.37711503177617 * H1x1_2
         ;
   P_DepVar1  =     0.37159160751318 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for AutoNeural38;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural38;
*------------------------------------------------------------*;
drop AutoNeural38_P_DepVar1;
AutoNeural38_P_DepVar1 = P_DepVar1;
drop AutoNeural38_P_DepVar0;
AutoNeural38_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural38;
*------------------------------------------------------------*;
length AutoNeural38_I_DepVar $32;
drop AutoNeural38_I_DepVar;
AutoNeural38_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural38;
*------------------------------------------------------------*;
length AutoNeural38_WARN_ $4;
drop AutoNeural38_WARN_;
AutoNeural38_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Scoring Code of model 7 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural37;
*------------------------------------------------------------*;
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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x3_1 = 'Hidden: H1x3_=1' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x2_1 = 'Hidden: H2x2_=1' ;

      label H3x1_1 = 'Hidden: H3x1_=1' ;

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
   H1x1_1  =    -0.16752750958623 * S_AcceptedCmpTotal
          +     0.06403041073662 * S_Age  +     0.37887435203175 * S_Frq
          +    -0.06488471849106 * S_Income  +     0.02927960705587 *
        S_Kidhome  +     -0.0153182718754 * S_MntFishProducts
          +      0.0592803373375 * S_MntFruits  +     -0.1059983645705 *
        S_MntGoldProds  +     0.08839399409229 * S_MntSweetProducts
          +    -0.01191239814261 * S_MonthsAsCustomer
          +      -0.307259983666 * S_NumDealsPurchases
          +    -0.23972300101674 * S_NumWebVisitsMonth
          +    -0.30556185778423 * S_RFMstat  +    -0.08105827641093 *
        S_RMntFrq  +     0.32671320165482 * S_Recency
          +      0.0130097267127 * S_Teenhome ;
   H1x1_1  = H1x1_1  +     0.04957160124382 * AcceptedCmp10
          +    -0.05376340328215 * AcceptedCmp20  +     0.11970832567932 *
        AcceptedCmp30  +    -0.20257152181059 * AcceptedCmp40
          +     0.19055537475137 * AcceptedCmp50  +    -0.16409517539938 *
        Complain0  +    -0.05757658272561 * HigherEducationBinary0 ;
   H1x1_1  = H1x1_1  +     0.14272714853962 * Education2n_Cycle
          +     0.17151280502053 * EducationBasic  +    -0.11549721715363 *
        EducationGraduation  +    -0.14651231631393 * EducationMaster
          +     -0.0692762335753 * Marital_StatusDivorced
          +     0.02472293911071 * Marital_StatusMarried
          +     0.04038393550437 * Marital_StatusSingle
          +     0.04243299259503 * Marital_StatusTogether ;
   H1x1_1  =     0.23154562419649 + H1x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -0.31529057180483 * S_AcceptedCmpTotal
          +      0.2513504223928 * S_Age  +     1.31369907469092 * S_Frq
          +     1.18208440103935 * S_Income  +    -0.63035218994975 *
        S_Kidhome  +     0.06794324522555 * S_MntFishProducts
          +    -0.02910005341604 * S_MntFruits  +     -0.2809281327009 *
        S_MntGoldProds  +     0.03300083755879 * S_MntSweetProducts
          +     0.14524334187971 * S_MonthsAsCustomer
          +    -0.58464031025411 * S_NumDealsPurchases
          +    -0.10768856151333 * S_NumWebVisitsMonth
          +    -0.54602308682658 * S_RFMstat  +    -0.07771897681693 *
        S_RMntFrq  +    -0.04430281297191 * S_Recency
          +    -0.75550113104618 * S_Teenhome ;
   H1x2_1  = H1x2_1  +    -0.32989699322067 * AcceptedCmp10
          +    -0.49194930861593 * AcceptedCmp20  +    -0.29685081372508 *
        AcceptedCmp30  +    -1.09268493953815 * AcceptedCmp40
          +     0.19253596686854 * AcceptedCmp50  +    -0.52740837757185 *
        Complain0  +     0.92701971187717 * HigherEducationBinary0 ;
   H1x2_1  = H1x2_1  +    -0.67905848838903 * Education2n_Cycle
          +     0.18443463984889 * EducationBasic  +     0.41283576419495 *
        EducationGraduation  +    -0.37768027773032 * EducationMaster
          +     0.07007941100006 * Marital_StatusDivorced
          +     -0.7850554528889 * Marital_StatusMarried
          +     1.17661634109847 * Marital_StatusSingle
          +    -0.55785837414708 * Marital_StatusTogether ;
   H1x2_1  =    -0.47254621873132 + H1x2_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
END;
*** *************************;
*** Writing the Node H1x3_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x3_1  =    -1.82667161026613 * S_AcceptedCmpTotal
          +    -1.37253292193256 * S_Age  +    -2.75518607832551 * S_Frq
          +    -0.79839250431153 * S_Income  +     1.11821147878382 *
        S_Kidhome  +    -0.44513342757321 * S_MntFishProducts
          +     0.87700219878037 * S_MntFruits  +    -0.11016064598169 *
        S_MntGoldProds  +    -0.01609032798943 * S_MntSweetProducts
          +    -2.17154324602167 * S_MonthsAsCustomer
          +    -1.39930460918007 * S_NumDealsPurchases
          +    -0.16044576482901 * S_NumWebVisitsMonth
          +    -0.41327898874555 * S_RFMstat  +     0.52147960287475 *
        S_RMntFrq  +    -0.73252715992964 * S_Recency
          +    -0.30335608719088 * S_Teenhome ;
   H1x3_1  = H1x3_1  +     -1.0325678563582 * AcceptedCmp10
          +     0.25951825842624 * AcceptedCmp20  +    -0.75269528776274 *
        AcceptedCmp30  +    -1.09208637335913 * AcceptedCmp40
          +     0.94597602278581 * AcceptedCmp50  +     0.73782287956403 *
        Complain0  +     0.48147273740028 * HigherEducationBinary0 ;
   H1x3_1  = H1x3_1  +     0.75114718211842 * Education2n_Cycle
          +     0.08709759722742 * EducationBasic  +     0.25555397082161 *
        EducationGraduation  +    -0.35403398893388 * EducationMaster
          +     0.83271778325587 * Marital_StatusDivorced
          +     0.79137899511518 * Marital_StatusMarried
          +    -0.51320080030576 * Marital_StatusSingle
          +    -0.48315893978838 * Marital_StatusTogether ;
   H1x3_1  =     1.23763256110337 + H1x3_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x3_1  = 1.0 / (1.0 + EXP(MIN( - H1x3_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x3_1  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     4.77126766160389 * H1x1_1 ;
   H2x1_1  = H2x1_1  +       -2.06136482688 * H1x2_1 ;
   H2x1_1  = H2x1_1  +    -0.66088716356598 * H1x3_1 ;
   H2x1_1  =    -1.42497113284005 + H2x1_1 ;
   H2x1_1  = SIN(H2x1_1 );
END;
ELSE DO;
   H2x1_1  = .;
END;
*** *************************;
*** Writing the Node H2x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x2_1  =     1.50159856860224 * H1x1_1 ;
   H2x2_1  = H2x2_1  +    -1.21325055599412 * H1x2_1 ;
   H2x2_1  = H2x2_1  +      0.4926229652129 * H1x3_1 ;
   H2x2_1  =    -0.30658924042786 + H2x2_1 ;
   H2x2_1  = SIN(H2x2_1 );
END;
ELSE DO;
   H2x2_1  = .;
END;
*** *************************;
*** Writing the Node H3x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H3x1_1  =     4.83751882303338 * H2x1_1 ;
   H3x1_1  = H3x1_1  +     2.12677516906018 * H2x2_1 ;
   H3x1_1  =     0.02705273717187 + H3x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H3x1_1  = 1.0 / (1.0 + EXP(MIN( - H3x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H3x1_1  = .;
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
   P_DepVar1  =     -6.6798185012723 * H3x1_1 ;
   P_DepVar1  =     2.10208029317576 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for AutoNeural37;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural37;
*------------------------------------------------------------*;
drop AutoNeural37_P_DepVar1;
AutoNeural37_P_DepVar1 = P_DepVar1;
drop AutoNeural37_P_DepVar0;
AutoNeural37_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming Into variables for AutoNeural37;
*------------------------------------------------------------*;
length AutoNeural37_I_DepVar $32;
drop AutoNeural37_I_DepVar;
AutoNeural37_I_DepVar = I_DepVar;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural37;
*------------------------------------------------------------*;
length AutoNeural37_WARN_ $4;
drop AutoNeural37_WARN_;
AutoNeural37_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl56: Voting to produce predicted target;
*------------------------------------------------------------*;
array Ensmbl56_post{2} _temporary_;
array Ensmbl56_count{2} _temporary_;
array Ensmbl56_level{2} $32 _temporary_ (
"1"
"0"
);
do i=1 to 2;
Ensmbl56_post{i} = 0;
Ensmbl56_count{i} = 0;
end;
if AutoNeural36_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural36_P_DepVar1;
end;
if AutoNeural35_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural35_P_DepVar1;
end;
if AutoNeural34_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural34_P_DepVar1;
end;
if AutoNeural40_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural40_P_DepVar1;
end;
if AutoNeural39_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural39_P_DepVar1;
end;
if AutoNeural38_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural38_P_DepVar1;
end;
if AutoNeural37_I_DepVar = Ensmbl56_level{1} then do;
Ensmbl56_count{1} + 1;
Ensmbl56_post{1}=Ensmbl56_post{1}+ AutoNeural37_P_DepVar1;
end;
if AutoNeural36_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural36_P_DepVar0;
end;
if AutoNeural35_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural35_P_DepVar0;
end;
if AutoNeural34_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural34_P_DepVar0;
end;
if AutoNeural40_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural40_P_DepVar0;
end;
if AutoNeural39_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural39_P_DepVar0;
end;
if AutoNeural38_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural38_P_DepVar0;
end;
if AutoNeural37_I_DepVar = Ensmbl56_level{2} then do;
Ensmbl56_count{2} + 1;
Ensmbl56_post{2}=Ensmbl56_post{2}+ AutoNeural37_P_DepVar0;
end;
*------------------------------------------------------------*;
* Ensmbl56: Determine Into Variable;
*------------------------------------------------------------*;
length I_DepVar $32;
drop i vote_count vote_post;
vote_count = max(
Ensmbl56_count{1} ,
Ensmbl56_count{2}
);
do i=1 to 2;
if Ensmbl56_count{i}=vote_count and Ensmbl56_post{i}>vote_post then do;
I_DepVar = Ensmbl56_level{i};
vote_post = Ensmbl56_count{i};
end;
end;
*------------------------------------------------------------*;
* Ensmbl56: Compute posterior vars using models predicting the chosen level;
*------------------------------------------------------------*;
P_DepVar1 = 0;
P_DepVar0 = 0;
if I_DepVar = AutoNeural36_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural36_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural36_P_DepVar0;
end;
if I_DepVar = AutoNeural35_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural35_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural35_P_DepVar0;
end;
if I_DepVar = AutoNeural34_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural34_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural34_P_DepVar0;
end;
if I_DepVar = AutoNeural40_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural40_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural40_P_DepVar0;
end;
if I_DepVar = AutoNeural39_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural39_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural39_P_DepVar0;
end;
if I_DepVar = AutoNeural38_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural38_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural38_P_DepVar0;
end;
if I_DepVar = AutoNeural37_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural37_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural37_P_DepVar0;
end;
* Ensmbl56: Averaging posterior;
P_DepVar1 = P_DepVar1/vote_count;
P_DepVar0 = P_DepVar0/vote_count;
*------------------------------------------------------------*;
* Ensmbl56: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl56: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL36_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL36_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL36_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL36_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL35_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL35_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL35_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL35_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL34_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL34_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL34_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL34_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL40_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL40_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL40_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL40_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL39_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL39_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL39_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL39_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL38_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL38_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL38_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL38_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL37_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL37_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL37_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL37_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl56: Computing Residual Vars;
*------------------------------------------------------------*;
if
F_DepVar NE '1'
AND F_DepVar NE '0'
then do;
R_DepVar1 = .;
R_DepVar0 = .;
end;
else do;
R_DepVar1 = -P_DepVar1;
R_DepVar0 = -P_DepVar0;
SELECT(F_DepVar);
WHEN('1') R_DepVar1 = R_DepVar1 +1;
WHEN('0') R_DepVar0 = R_DepVar0 +1;
OTHERWISE;
END;
END;
