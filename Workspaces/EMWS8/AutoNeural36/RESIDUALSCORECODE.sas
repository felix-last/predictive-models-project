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

      label S_Mnt = 'Standard: Mnt' ;

      label S_MonthsAsCustomer = 'Standard: MonthsAsCustomer' ;

      label S_NumDealsPurchases = 'Standard: NumDealsPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

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

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H1x2_6 = 'Hidden: H1x2_=6' ;

      label H1x2_7 = 'Hidden: H1x2_=7' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label H2x1_6 = 'Hidden: H2x1_=6' ;

      label H2x1_7 = 'Hidden: H2x1_=7' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

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
   Mnt , 
   MonthsAsCustomer , 
   NumDealsPurchases , 
   RFMstat , 
   RMntFrq , 
   Recency   ) THEN DO;
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
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 * 
        MonthsAsCustomer ;
   S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
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
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MonthsAsCustomer ) THEN S_MonthsAsCustomer  = . ;
   ELSE S_MonthsAsCustomer  =    -4.97258711890416 +     0.05902460910139 * 
        MonthsAsCustomer ;
   IF MISSING( NumDealsPurchases ) THEN S_NumDealsPurchases  = . ;
   ELSE S_NumDealsPurchases  =    -1.34788949552081 +     0.59766336614987 * 
        NumDealsPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.30481486354693 * S_AcceptedCmpTotal
          +    -0.54498241754254 * S_Age  +     0.77206354789092 * S_Frq
          +     0.77765118088689 * S_Income  +     2.07246475111178 * S_Mnt
          +     0.15694091890477 * S_MonthsAsCustomer
          +     -1.0600620676599 * S_NumDealsPurchases
          +    -0.78289508342634 * S_RFMstat  +     0.19331311075458 * 
        S_RMntFrq  +    -1.71456360786658 * S_Recency ;
   H1x1_2  =    -0.96048908096197 * S_AcceptedCmpTotal
          +     0.61099944974097 * S_Age  +      0.4684473135544 * S_Frq
          +    -2.31993521385384 * S_Income  +     2.52767604744554 * S_Mnt
          +     0.20666851985718 * S_MonthsAsCustomer
          +    -0.97515743354403 * S_NumDealsPurchases
          +    -1.60973003553548 * S_RFMstat  +     0.38264930583453 * 
        S_RMntFrq  +     0.62464670758498 * S_Recency ;
   H1x1_3  =     1.49024193524953 * S_AcceptedCmpTotal
          +     0.87828167929416 * S_Age  +    -0.52335990132001 * S_Frq
          +      0.9815918481595 * S_Income  +     -0.8590454743927 * S_Mnt
          +     1.96613163097137 * S_MonthsAsCustomer
          +    -0.85819237425464 * S_NumDealsPurchases
          +     -0.7342163150526 * S_RFMstat  +     0.48733597827391 * 
        S_RMntFrq  +    -0.66735158687249 * S_Recency ;
   H1x1_4  =     0.87457093235854 * S_AcceptedCmpTotal
          +    -1.02143136564148 * S_Age  +    -1.09359519644151 * S_Frq
          +    -0.89748654819184 * S_Income  +    -3.14790224149288 * S_Mnt
          +    -0.31071408258066 * S_MonthsAsCustomer
          +     1.21951604292052 * S_NumDealsPurchases
          +     0.60033377302433 * S_RFMstat  +       2.735334396444 * 
        S_RMntFrq  +    -0.76247954154221 * S_Recency ;
   H1x1_5  =    -4.13283711801786 * S_AcceptedCmpTotal
          +     0.65523908431557 * S_Age  +       0.241594110415 * S_Frq
          +    -3.38304490912368 * S_Income  +     0.53515570058216 * S_Mnt
          +     -0.8375115921249 * S_MonthsAsCustomer
          +    -2.76762970370889 * S_NumDealsPurchases
          +    -0.31498136101098 * S_RFMstat  +     1.72327465491237 * 
        S_RMntFrq  +     3.05117529717203 * S_Recency ;
   H1x1_6  =     0.46164701397937 * S_AcceptedCmpTotal
          +    -0.05398683598274 * S_Age  +    -0.01337431547588 * S_Frq
          +    -1.76339414880327 * S_Income  +     1.23336004482684 * S_Mnt
          +    -0.01195434382001 * S_MonthsAsCustomer
          +    -0.22511191581542 * S_NumDealsPurchases
          +    -0.21743492426936 * S_RFMstat  +     0.70664209010105 * 
        S_RMntFrq  +    -0.63308651184161 * S_Recency ;
   H1x1_1  = H1x1_1  +     0.14465238062285 * Education2n_Cycle
          +    -0.13499144500095 * EducationBasic  +     0.03467679372603 * 
        EducationGraduation  +    -1.58377231605996 * EducationMaster
          +    -0.27581240033839 * Marital_StatusDivorced
          +    -1.12832049699997 * Marital_StatusMarried
          +     0.82883719735146 * Marital_StatusSingle
          +    -2.32617371707346 * Marital_StatusTogether ;
   H1x1_2  = H1x1_2  +    -1.02985085771388 * Education2n_Cycle
          +    -0.71138586317542 * EducationBasic  +      0.9204282495835 * 
        EducationGraduation  +    -0.56396475549448 * EducationMaster
          +    -2.88079169727878 * Marital_StatusDivorced
          +      1.4258648072807 * Marital_StatusMarried
          +    -0.05697857513269 * Marital_StatusSingle
          +       0.146794539218 * Marital_StatusTogether ;
   H1x1_3  = H1x1_3  +      0.4986985713774 * Education2n_Cycle
          +     0.48522560277601 * EducationBasic  +      0.2665812273322 * 
        EducationGraduation  +    -0.43467066919002 * EducationMaster
          +     0.97365776664715 * Marital_StatusDivorced
          +    -1.35319508385505 * Marital_StatusMarried
          +    -2.08101354192275 * Marital_StatusSingle
          +    -1.08368710958752 * Marital_StatusTogether ;
   H1x1_4  = H1x1_4  +     0.12246361307736 * Education2n_Cycle
          +    -0.87242664849916 * EducationBasic  +     0.05734144684226 * 
        EducationGraduation  +      0.1094230580859 * EducationMaster
          +     1.30117552300686 * Marital_StatusDivorced
          +     0.53050975427276 * Marital_StatusMarried
          +     0.58835158853841 * Marital_StatusSingle
          +     0.35012244081762 * Marital_StatusTogether ;
   H1x1_5  = H1x1_5  +     0.44203285123576 * Education2n_Cycle
          +     0.97765557937358 * EducationBasic  +    -1.28394729707826 * 
        EducationGraduation  +    -1.12057694939559 * EducationMaster
          +     0.12299395165884 * Marital_StatusDivorced
          +     2.11564865051502 * Marital_StatusMarried
          +    -1.68266424942244 * Marital_StatusSingle
          +    -1.30201890465315 * Marital_StatusTogether ;
   H1x1_6  = H1x1_6  +    -0.71184939998405 * Education2n_Cycle
          +     -0.2381973597947 * EducationBasic  +     0.72843044670208 * 
        EducationGraduation  +     -1.5328787518455 * EducationMaster
          +    -1.41873022821424 * Marital_StatusDivorced
          +     0.40098835311075 * Marital_StatusMarried
          +    -0.09372928755875 * Marital_StatusSingle
          +    -0.09998589182884 * Marital_StatusTogether ;
   H1x1_1  =    -3.75455576881973 + H1x1_1 ;
   H1x1_2  =     1.02599110730212 + H1x1_2 ;
   H1x1_3  =    -5.02132252266269 + H1x1_3 ;
   H1x1_4  =    -3.72059356025649 + H1x1_4 ;
   H1x1_5  =    -1.07693007750395 + H1x1_5 ;
   H1x1_6  =    -1.52496643461776 + H1x1_6 ;
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
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -2.35027500439298 * S_AcceptedCmpTotal
          +    -0.67511893990067 * S_Age  +     1.49125635524782 * S_Frq
          +     1.89900242308397 * S_Income  +    -1.41577577314386 * S_Mnt
          +    -0.12978028874416 * S_MonthsAsCustomer
          +    -0.39260853282107 * S_NumDealsPurchases
          +     0.30036568091644 * S_RFMstat  +    -2.19102157904836 * 
        S_RMntFrq  +     2.94582083187032 * S_Recency ;
   H1x2_2  =    -0.03331810854247 * S_AcceptedCmpTotal
          +     1.27198928290899 * S_Age  +     0.69769930260623 * S_Frq
          +    -2.17697765847182 * S_Income  +    -0.46828238331202 * S_Mnt
          +    -1.18020817984508 * S_MonthsAsCustomer
          +    -0.76018496095249 * S_NumDealsPurchases
          +     0.38979694392016 * S_RFMstat  +    -1.11499711633668 * 
        S_RMntFrq  +    -1.34218347683284 * S_Recency ;
   H1x2_3  =     1.81808299909721 * S_AcceptedCmpTotal
          +     2.80026213830764 * S_Age  +     0.67856560144026 * S_Frq
          +     0.34475962715827 * S_Income  +     0.74603066354603 * S_Mnt
          +     0.26504929991482 * S_MonthsAsCustomer
          +    -1.26103018947565 * S_NumDealsPurchases
          +    -1.33243417287661 * S_RFMstat  +    -0.00176307020977 * 
        S_RMntFrq  +    -0.21128598130257 * S_Recency ;
   H1x2_4  =     2.31588427775472 * S_AcceptedCmpTotal
          +    -3.21386435228346 * S_Age  +     0.68394836057334 * S_Frq
          +    -0.83082404247604 * S_Income  +      0.5646298058715 * S_Mnt
          +    -0.96101962087016 * S_MonthsAsCustomer
          +     0.53895776956019 * S_NumDealsPurchases
          +    -2.77317426080135 * S_RFMstat  +    -1.40860473567967 * 
        S_RMntFrq  +    -2.95554889000394 * S_Recency ;
   H1x2_5  =      -0.777266460878 * S_AcceptedCmpTotal
          +     0.01579573397788 * S_Age  +    -2.84422956162508 * S_Frq
          +    -1.31669656264232 * S_Income  +    -0.66924703594723 * S_Mnt
          +    -1.72026081079839 * S_MonthsAsCustomer
          +    -1.71079026502574 * S_NumDealsPurchases
          +    -0.03662186229567 * S_RFMstat  +    -1.24972087695297 * 
        S_RMntFrq  +     1.04543079647491 * S_Recency ;
   H1x2_6  =     1.69110259857591 * S_AcceptedCmpTotal
          +     0.00892588186256 * S_Age  +    -0.18146967584731 * S_Frq
          +    -0.31087763826718 * S_Income  +     0.56723072587288 * S_Mnt
          +     2.09779206434265 * S_MonthsAsCustomer
          +    -4.62382081626491 * S_NumDealsPurchases
          +    -1.80913011632359 * S_RFMstat  +     1.31665805856342 * 
        S_RMntFrq  +     0.23009882422123 * S_Recency ;
   H1x2_1  = H1x2_1  +      -0.792748784283 * Education2n_Cycle
          +     -3.1545276157878 * EducationBasic  +    -1.84635075518535 * 
        EducationGraduation  +     0.34003849763429 * EducationMaster
          +     0.87175246176936 * Marital_StatusDivorced
          +       1.886837085895 * Marital_StatusMarried
          +    -2.62856059218615 * Marital_StatusSingle
          +    -0.28378285019157 * Marital_StatusTogether ;
   H1x2_2  = H1x2_2  +     0.97869649953975 * Education2n_Cycle
          +     -0.1761488411286 * EducationBasic  +     0.67652366107509 * 
        EducationGraduation  +    -0.64609653207988 * EducationMaster
          +    -1.04636200999352 * Marital_StatusDivorced
          +    -2.20460672424325 * Marital_StatusMarried
          +     1.92289461564531 * Marital_StatusSingle
          +     1.47625725526399 * Marital_StatusTogether ;
   H1x2_3  = H1x2_3  +    -2.07401442500279 * Education2n_Cycle
          +     1.21973185172113 * EducationBasic  +    -0.79741186803969 * 
        EducationGraduation  +     1.49311599719023 * EducationMaster
          +    -1.13895501836476 * Marital_StatusDivorced
          +     1.43612542821271 * Marital_StatusMarried
          +     0.91677631555352 * Marital_StatusSingle
          +     0.33252495590801 * Marital_StatusTogether ;
   H1x2_4  = H1x2_4  +      2.4424766190091 * Education2n_Cycle
          +     0.47140305257945 * EducationBasic  +      2.7708619311072 * 
        EducationGraduation  +    -2.38708962953818 * EducationMaster
          +     1.02392148356491 * Marital_StatusDivorced
          +    -2.79834250271747 * Marital_StatusMarried
          +     0.37486674438879 * Marital_StatusSingle
          +    -0.90001754865313 * Marital_StatusTogether ;
   H1x2_5  = H1x2_5  +     0.57039395022571 * Education2n_Cycle
          +    -1.20607102294785 * EducationBasic  +    -1.20974592343731 * 
        EducationGraduation  +    -1.78316556210385 * EducationMaster
          +     0.08716543806063 * Marital_StatusDivorced
          +      3.3173294406026 * Marital_StatusMarried
          +    -2.04905920436719 * Marital_StatusSingle
          +    -0.92890900129079 * Marital_StatusTogether ;
   H1x2_6  = H1x2_6  +    -1.76908866896846 * Education2n_Cycle
          +     1.33855560696293 * EducationBasic  +    -1.09590386934602 * 
        EducationGraduation  +      0.2960051745455 * EducationMaster
          +    -0.70904317435795 * Marital_StatusDivorced
          +    -5.00691978227454 * Marital_StatusMarried
          +     0.73327055883196 * Marital_StatusSingle
          +     2.54710000390378 * Marital_StatusTogether ;
   H1x2_1  =      3.0403536713797 + H1x2_1 ;
   H1x2_2  =    -0.78229913772699 + H1x2_2 ;
   H1x2_3  =    -1.80501525659805 + H1x2_3 ;
   H1x2_4  =    -0.22778318711622 + H1x2_4 ;
   H1x2_5  =     2.48237075611881 + H1x2_5 ;
   H1x2_6  =    -0.82863852729951 + H1x2_6 ;
   H1x2_7  = 0; 
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 , H1x2_5 , H1x2_6 , H1x2_7
         );
   _SUM_ = 0.; 
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_5  = EXP(H1x2_5  - _MAX_);
   _SUM_ = _SUM_ + H1x2_5 ;
   H1x2_6  = EXP(H1x2_6  - _MAX_);
   _SUM_ = _SUM_ + H1x2_6 ;
   H1x2_7  = EXP(H1x2_7  - _MAX_);
   _SUM_ = _SUM_ + H1x2_7 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
   H1x2_5  = H1x2_5  / _SUM_;
   H1x2_6  = H1x2_6  / _SUM_;
   H1x2_7  = H1x2_7  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
   H1x2_6  = .;
   H1x2_7  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     0.55650858371679 * H1x1_1  +    -2.01187113608164 * H1x1_2
          +     2.37528163136734 * H1x1_3  +      0.2577438948091 * H1x1_4
          +    -0.81587385765783 * H1x1_5  +      1.8042025611704 * H1x1_6
          +    -3.45642860807175 * H1x1_7 ;
   H2x1_2  =     -1.4072868703808 * H1x1_1  +     3.64648594782782 * H1x1_2
          +    -0.97896293812564 * H1x1_3  +     -0.0515166769119 * H1x1_4
          +    -1.41673645576175 * H1x1_5  +    -2.04724593301835 * H1x1_6
          +    -1.69759048008451 * H1x1_7 ;
   H2x1_3  =     0.17611478872439 * H1x1_1  +    -1.13951985212293 * H1x1_2
          +     0.24509716046934 * H1x1_3  +    -2.33272482978723 * H1x1_4
          +     2.06710126283903 * H1x1_5  +     0.97372424029049 * H1x1_6
          +     2.16001069853838 * H1x1_7 ;
   H2x1_4  =    -1.56242602289778 * H1x1_1  +     1.09571275176266 * H1x1_2
          +     0.57875647465484 * H1x1_3  +    -2.54053446807412 * H1x1_4
          +     2.24540710654718 * H1x1_5  +     0.24935407149696 * H1x1_6
          +     1.42518244328819 * H1x1_7 ;
   H2x1_5  =     0.45461413483239 * H1x1_1  +     0.09139773883448 * H1x1_2
          +    -0.14370782899127 * H1x1_3  +     -2.2905121573504 * H1x1_4
          +     2.17107827046607 * H1x1_5  +     0.24487485877154 * H1x1_6
          +     2.38104894605064 * H1x1_7 ;
   H2x1_6  =    -0.44870071546359 * H1x1_1  +       2.237322314873 * H1x1_2
          +     0.24890008976787 * H1x1_3  +     0.63384157957732 * H1x1_4
          +     1.82203807831835 * H1x1_5  +    -1.17519565559917 * H1x1_6
          +    -0.11716886313964 * H1x1_7 ;
   H2x1_7  =     2.99959476563174 * H1x1_1  +    -1.21447936480485 * H1x1_2
          +    -0.42282478682154 * H1x1_3  +     0.15046791677409 * H1x1_4
          +     1.60174668718794 * H1x1_5  +    -2.57476195495421 * H1x1_6
          +     1.39309183472163 * H1x1_7 ;
   H2x1_1  = H2x1_1  +    -0.85299949538873 * H1x2_1
          +     1.11957578787789 * H1x2_2  +     0.77632856464508 * H1x2_3
          +    -0.22142828268323 * H1x2_4  +    -1.11892970068871 * H1x2_5
          +    -0.45106149596477 * H1x2_6  +     1.82409496885518 * H1x2_7 ;
   H2x1_2  = H2x1_2  +     1.56027698718135 * H1x2_1
          +    -3.12952137753096 * H1x2_2  +     0.67845593837614 * H1x2_3
          +    -0.58499883763121 * H1x2_4  +     3.06988979274118 * H1x2_5
          +     0.84233592798078 * H1x2_6  +    -0.25350257273147 * H1x2_7 ;
   H2x1_3  = H2x1_3  +    -1.02626832167323 * H1x2_1
          +    -1.02095723163902 * H1x2_2  +     2.59777541665491 * H1x2_3
          +    -1.63932615629402 * H1x2_4  +      0.1149997605256 * H1x2_5
          +    -0.69284467630647 * H1x2_6  +    -0.94009958377785 * H1x2_7 ;
   H2x1_4  = H2x1_4  +     0.11969265761078 * H1x2_1
          +     0.04033549826998 * H1x2_2  +      -1.490004333932 * H1x2_3
          +     1.99762787420623 * H1x2_4  +    -1.80181570867464 * H1x2_5
          +    -2.27533163878271 * H1x2_6  +    -2.79829090885664 * H1x2_7 ;
   H2x1_5  = H2x1_5  +     0.93741515154624 * H1x2_1
          +     2.80174557093867 * H1x2_2  +    -0.59413837656645 * H1x2_3
          +    -2.68875022750192 * H1x2_4  +     0.84356741719215 * H1x2_5
          +    -0.13063096007897 * H1x2_6  +      0.6576272455984 * H1x2_7 ;
   H2x1_6  = H2x1_6  +    -0.32172094231708 * H1x2_1
          +    -2.61425111541297 * H1x2_2  +     0.70455244280471 * H1x2_3
          +     0.09811819511468 * H1x2_4  +     1.46168032542747 * H1x2_5
          +     0.04218695988667 * H1x2_6  +     1.10437906607258 * H1x2_7 ;
   H2x1_7  = H2x1_7  +     1.13645258617353 * H1x2_1
          +    -0.97343338604962 * H1x2_2  +     2.00931557903924 * H1x2_3
          +     1.66929738474491 * H1x2_4  +     0.08470409916384 * H1x2_5
          +    -2.15461461967398 * H1x2_6  +    -0.79755343050623 * H1x2_7 ;
   H2x1_1  =     0.52921356535163 + H2x1_1 ;
   H2x1_2  =    -0.21635675069014 + H2x1_2 ;
   H2x1_3  =     0.95752177029829 + H2x1_3 ;
   H2x1_4  =     0.22291220826227 + H2x1_4 ;
   H2x1_5  =    -0.06679108498996 + H2x1_5 ;
   H2x1_6  =    -0.90670810620183 + H2x1_6 ;
   H2x1_7  =    -1.16484680209158 + H2x1_7 ;
   H2x1_1  = SIN(H2x1_1 );
   H2x1_2  = SIN(H2x1_2 );
   H2x1_3  = SIN(H2x1_3 );
   H2x1_4  = SIN(H2x1_4 );
   H2x1_5  = SIN(H2x1_5 );
   H2x1_6  = SIN(H2x1_6 );
   H2x1_7  = SIN(H2x1_7 );
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
   H2x1_6  = .;
   H2x1_7  = .;
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
   P_DepVar1  =     5.80975497420578 * H2x1_1  +    -2.74663187385757 * H2x1_2
          +     -3.6174698620679 * H2x1_3  +    -5.46706578275872 * H2x1_4
          +    -2.91745157769246 * H2x1_5  +    -2.85601964782018 * H2x1_6
          +    -4.23684454687824 * H2x1_7 ;
   P_DepVar1  =     0.23065635639808 + P_DepVar1 ;
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
