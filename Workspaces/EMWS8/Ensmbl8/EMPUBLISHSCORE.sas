*------------------------------------------------------------*;
* Ensmbl8: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl8: Scoring Code of model 1 of 3;
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


length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(AcceptedCmp1,BEST.);
length _FILTERNORM1  $32;
drop _FILTERNORM1 ;
%dmnormcp(_FILTERFMT1,_FILTERNORM1);


length _FILTERFMT2  $200;
drop _FILTERFMT2 ;
_FILTERFMT2= put(AcceptedCmp2,BEST.);
length _FILTERNORM2  $32;
drop _FILTERNORM2 ;
%dmnormcp(_FILTERFMT2,_FILTERNORM2);


length _FILTERFMT3  $200;
drop _FILTERFMT3 ;
_FILTERFMT3= put(AcceptedCmp3,BEST.);
length _FILTERNORM3  $32;
drop _FILTERNORM3 ;
%dmnormcp(_FILTERFMT3,_FILTERNORM3);


length _FILTERFMT4  $200;
drop _FILTERFMT4 ;
_FILTERFMT4= put(AcceptedCmp4,BEST.);
length _FILTERNORM4  $32;
drop _FILTERNORM4 ;
%dmnormcp(_FILTERFMT4,_FILTERNORM4);


length _FILTERFMT5  $200;
drop _FILTERFMT5 ;
_FILTERFMT5= put(AcceptedCmp5,BEST.);
length _FILTERNORM5  $32;
drop _FILTERNORM5 ;
%dmnormcp(_FILTERFMT5,_FILTERNORM5);


length _FILTERFMT6  $200;
drop _FILTERFMT6 ;
_FILTERFMT6= put(Complain,BEST.);
length _FILTERNORM6  $32;
drop _FILTERNORM6 ;
%dmnormcp(_FILTERFMT6,_FILTERNORM6);


length _FILTERFMT7  $200;
drop _FILTERFMT7 ;
_FILTERFMT7= put(Education,$10.0);
length _FILTERNORM7  $32;
drop _FILTERNORM7 ;
%dmnormcp(_FILTERFMT7,_FILTERNORM7);


length _FILTERFMT8  $200;
drop _FILTERFMT8 ;
_FILTERFMT8= put(Marital_Status,$8.0);
length _FILTERNORM8  $32;
drop _FILTERNORM8 ;
%dmnormcp(_FILTERFMT8,_FILTERNORM8);
if
_FILTERNORM1 not in ( '.')
 and
_FILTERNORM2 not in ( '.')
 and
_FILTERNORM3 not in ( '.')
 and
_FILTERNORM4 not in ( '.')
 and
_FILTERNORM5 not in ( '.')
 and
_FILTERNORM6 not in ( '.')
 and
_FILTERNORM7 not in ( ' ')
 and
_FILTERNORM8 not in ( ' ')
and
( Dt_Customer ne .)
and ( Income ne . and (Income<=107000))
and ( Kidhome ne .)
and ( MntFishProducts ne .)
and ( MntFruits ne .)
and ( MntGoldProds ne .)
and ( MntMeatProducts ne . and (MntMeatProducts<=964))
and ( MntSweetProducts ne .)
and ( MntWines ne .)
and ( NumCatalogPurchases ne . and (NumCatalogPurchases<=14))
and ( NumDealsPurchases ne . and (NumDealsPurchases<=10.5))
and ( NumStorePurchases ne .)
and ( NumWebPurchases ne .)
and ( NumWebVisitsMonth ne . and (NumWebVisitsMonth<=13.42))
and ( Recency ne .)
and ( Teenhome ne .)
and ( Year_Birth ne .)
then do;
if M_FILTER eq . then M_FILTER = 0;
else M_FILTER = M_FILTER + 0;
end;
else M_FILTER = 1;
label M_FILTER = 'Filtered Indicator';
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
* TOOL: Variable selection Class;
* TYPE: EXPLORE;
* NODE: Varsel;
*------------------------------------------------------------*;
******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


/*----G_Marital_Status begin----*/
length _NORM8 $ 8;
_NORM8 = put( Marital_Status , $8. );
%DMNORMIP( _NORM8 )
drop _NORM8;
select(_NORM8);
  when("DIVORCED" ) G_Marital_Status = 1;
  when("MARRIED " ) G_Marital_Status = 2;
  when("SINGLE  " ) G_Marital_Status = 0;
  when("TOGETHER" ) G_Marital_Status = 2;
  when("WIDOW   " ) G_Marital_Status = 0;
  otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Marital_Status="Grouped Levels for Marital_Status";
/*----G_Marital_Status end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural8;
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
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

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

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Frq ,
   Income ,
   Mnt ,
   MntGoldProds ,
   MntMeatProducts ,
   MntWines ,
   NumDistPurchases ,
   RFMstat ,
   RMntFrq ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.33294813803267 * S_AcceptedCmpTotal  +    -1.24039573879629 *
        S_Frq  +    -0.05312453396461 * S_Income  +    -1.10582794272994 *
        S_Mnt  +    -0.07760643003938 * S_MntGoldProds
          +     1.40615546889198 * S_MntMeatProducts
          +    -0.07607000653866 * S_MntWines  +      1.3974050378538 *
        S_NumDistPurchases  +     0.21523028866532 * S_RFMstat
          +    -0.90250971189164 * S_RMntFrq  +    -0.29921926423225 *
        S_Recency ;
   H12  =    -0.12895365437344 * S_AcceptedCmpTotal  +     -1.3313949600547 *
        S_Frq  +    -1.37899106632441 * S_Income  +    -0.58761109294666 *
        S_Mnt  +     0.35202206207132 * S_MntGoldProds
          +     0.09184646817235 * S_MntMeatProducts
          +     0.13335664554613 * S_MntWines  +     0.61353674232736 *
        S_NumDistPurchases  +     0.35066529273924 * S_RFMstat
          +     0.65664535290196 * S_RMntFrq  +    -0.18186117718946 *
        S_Recency ;
   H13  =     0.37357969261544 * S_AcceptedCmpTotal  +     0.39633284030412 *
        S_Frq  +     0.64644973118257 * S_Income  +    -0.00934866805665 *
        S_Mnt  +     0.34942371005238 * S_MntGoldProds
          +     0.39891627134773 * S_MntMeatProducts
          +    -0.03684678353498 * S_MntWines  +     1.02433172338367 *
        S_NumDistPurchases  +     0.20910974889856 * S_RFMstat
          +     0.07904474603466 * S_RMntFrq  +    -0.30357080495082 *
        S_Recency ;
   H14  =     0.13554328647808 * S_AcceptedCmpTotal  +    -0.07048372524888 *
        S_Frq  +     0.04610079419509 * S_Income  +     0.10924113857251 *
        S_Mnt  +     0.12915488369242 * S_MntGoldProds
          +     0.18610321199349 * S_MntMeatProducts
          +     0.70556343816133 * S_MntWines  +     0.25728143320607 *
        S_NumDistPurchases  +     0.15972524961567 * S_RFMstat
          +     0.01276365258392 * S_RMntFrq  +    -0.66413982659745 *
        S_Recency ;
   H15  =     -1.1420503402904 * S_AcceptedCmpTotal  +     0.71380555863062 *
        S_Frq  +    -0.24803616582173 * S_Income  +     0.13154058420998 *
        S_Mnt  +    -0.42749671288369 * S_MntGoldProds
          +     -1.3154288229161 * S_MntMeatProducts
          +      -0.255711705654 * S_MntWines  +     0.11914899881729 *
        S_NumDistPurchases  +    -0.05982295822576 * S_RFMstat
          +    -0.69679195615668 * S_RMntFrq  +    -0.21391830972623 *
        S_Recency ;
   H16  =     0.00981250946025 * S_AcceptedCmpTotal  +     0.04123504196179 *
        S_Frq  +     0.12222635666431 * S_Income  +     0.29796072335771 *
        S_Mnt  +     0.22410489312536 * S_MntGoldProds
          +    -1.05184346257138 * S_MntMeatProducts
          +     0.19959913357382 * S_MntWines  +    -0.69776033144787 *
        S_NumDistPurchases  +    -0.40844675601616 * S_RFMstat
          +    -0.86567751620087 * S_RMntFrq  +       0.363703677148 *
        S_Recency ;
   H17  =     0.94478838355387 * S_AcceptedCmpTotal  +    -0.70060201854486 *
        S_Frq  +     -0.1828959052644 * S_Income  +    -0.69020858610444 *
        S_Mnt  +    -0.10810625538739 * S_MntGoldProds
          +     0.08623383006102 * S_MntMeatProducts
          +    -0.10662594781542 * S_MntWines  +     0.49956982718189 *
        S_NumDistPurchases  +    -0.52485639325545 * S_RFMstat
          +    -0.21634639560711 * S_RMntFrq  +    -1.54075315391445 *
        S_Recency ;
   H11  = H11  +     0.16164655653565 * G_Marital_Status0
          +     0.08705670063172 * G_Marital_Status1 ;
   H12  = H12  +     0.00173619463191 * G_Marital_Status0
          +    -0.01602297769528 * G_Marital_Status1 ;
   H13  = H13  +    -0.20647507845797 * G_Marital_Status0
          +    -0.14268881423356 * G_Marital_Status1 ;
   H14  = H14  +     0.66515401547718 * G_Marital_Status0
          +     0.13894686879381 * G_Marital_Status1 ;
   H15  = H15  +    -0.10602970955306 * G_Marital_Status0
          +     0.12966863964317 * G_Marital_Status1 ;
   H16  = H16  +     0.25775977539205 * G_Marital_Status0
          +     0.20902791963936 * G_Marital_Status1 ;
   H17  = H17  +     0.54268893569335 * G_Marital_Status0
          +     0.63641124967593 * G_Marital_Status1 ;
   H11  =    -0.89307077259606 + H11 ;
   H12  =    -0.52976269769549 + H12 ;
   H13  =     1.93938724237609 + H13 ;
   H14  =    -2.08624954900209 + H14 ;
   H15  =     1.21926205411217 + H15 ;
   H16  =    -0.82614580546756 + H16 ;
   H17  =     0.88553151374376 + H17 ;
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
   P_DepVar1  =     2.95606472513759 * H11  +     1.89470964296724 * H12
          +     1.54768089051578 * H13  +     1.66736822539449 * H14
          +    -1.78269941197359 * H15  +    -1.37291423165719 * H16
          +      2.0599951000352 * H17 ;
   P_DepVar1  =    -1.26664447892937 + P_DepVar1 ;
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
* Renaming variables for Neural8;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural8;
*------------------------------------------------------------*;
drop Neural8_P_DepVar1;
Neural8_P_DepVar1 = P_DepVar1;
drop Neural8_P_DepVar0;
Neural8_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural8;
*------------------------------------------------------------*;
length Neural8_WARN_ $4;
drop Neural8_WARN_;
Neural8_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl8: Scoring Code of model 2 of 3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural28;
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
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Frq ,
   Income ,
   Mnt ,
   MntGoldProds ,
   MntMeatProducts ,
   MntWines ,
   NumDistPurchases ,
   RFMstat ,
   RMntFrq ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.40839920245437 * S_AcceptedCmpTotal  +    -0.80301052154323 *
        S_Frq  +     0.19839975683497 * S_Income  +    -0.71099382445924 *
        S_Mnt  +    -0.15644638799226 * S_MntGoldProds
          +    -0.05910355740416 * S_MntMeatProducts
          +     0.23095157103241 * S_MntWines  +     0.67840217585411 *
        S_NumDistPurchases  +     0.12536920827324 * S_RFMstat
          +    -0.27246125863137 * S_RMntFrq  +    -1.02114645988925 *
        S_Recency ;
   H12  =    -0.09503041118006 * S_AcceptedCmpTotal  +     0.74672296647411 *
        S_Frq  +     1.82688988564051 * S_Income  +    -0.06831964209279 *
        S_Mnt  +    -0.13330887266177 * S_MntGoldProds
          +     0.09400377526937 * S_MntMeatProducts
          +    -0.53358910675611 * S_MntWines  +     0.13886503925085 *
        S_NumDistPurchases  +     0.02243224025219 * S_RFMstat
          +    -0.03110171961938 * S_RMntFrq  +     0.39055670382948 *
        S_Recency ;
   H13  =    -0.07144509122078 * S_AcceptedCmpTotal  +     0.65325962599673 *
        S_Frq  +     0.03169199805286 * S_Income  +     0.53573115818994 *
        S_Mnt  +     0.13372718478424 * S_MntGoldProds
          +    -1.62740823190029 * S_MntMeatProducts
          +     0.15642273844597 * S_MntWines  +    -0.78908066213044 *
        S_NumDistPurchases  +     -0.4365555360753 * S_RFMstat
          +    -0.63552932650743 * S_RMntFrq  +     0.17699292292485 *
        S_Recency ;
   H14  =     0.03098188354318 * S_AcceptedCmpTotal  +    -0.04737735825642 *
        S_Frq  +     0.30967861276694 * S_Income  +    -0.03786683388502 *
        S_Mnt  +     0.25532115520236 * S_MntGoldProds
          +      0.3965117290354 * S_MntMeatProducts
          +     0.36188945634536 * S_MntWines  +    -0.24664355133344 *
        S_NumDistPurchases  +     0.15627885374544 * S_RFMstat
          +    -0.10763737759383 * S_RMntFrq  +     -0.4091862538023 *
        S_Recency ;
   H15  =     0.27467896926965 * S_AcceptedCmpTotal  +    -1.33897347254907 *
        S_Frq  +    -0.08574739739253 * S_Income  +    -0.68536026344277 *
        S_Mnt  +     0.08729572232071 * S_MntGoldProds
          +     1.44231431118379 * S_MntMeatProducts
          +    -0.09322237385561 * S_MntWines  +      1.5568901785563 *
        S_NumDistPurchases  +     0.06237505409693 * S_RFMstat
          +    -1.04636887800306 * S_RMntFrq  +    -0.38411527089703 *
        S_Recency ;
   H16  =    -0.89143353938241 * S_AcceptedCmpTotal  +     0.45211708970504 *
        S_Frq  +    -0.44897699945178 * S_Income  +    -0.32314426452158 *
        S_Mnt  +    -0.32329530597419 * S_MntGoldProds
          +    -0.44244305964257 * S_MntMeatProducts
          +    -0.04171589876809 * S_MntWines  +     0.42122451368745 *
        S_NumDistPurchases  +    -0.15802898075961 * S_RFMstat
          +    -0.40329155853226 * S_RMntFrq  +    -0.65176917675454 *
        S_Recency ;
   H11  = H11  +     0.01448447530274 * G_Marital_Status0
          +     0.42194179998625 * G_Marital_Status1 ;
   H12  = H12  +     0.12689198218881 * G_Marital_Status0
          +     0.13222809503301 * G_Marital_Status1 ;
   H13  = H13  +     0.02279524261833 * G_Marital_Status0
          +     0.22562672580832 * G_Marital_Status1 ;
   H14  = H14  +     1.11856448462308 * G_Marital_Status0
          +     0.27730078918446 * G_Marital_Status1 ;
   H15  = H15  +    -0.04694745686684 * G_Marital_Status0
          +     0.25879365732348 * G_Marital_Status1 ;
   H16  = H16  +    -0.22835702249634 * G_Marital_Status0
          +     0.18090765090711 * G_Marital_Status1 ;
   H11  =     1.23863858658783 + H11 ;
   H12  =    -0.12218156586843 + H12 ;
   H13  =    -1.28170837349164 + H13 ;
   H14  =    -2.07579206307318 + H14 ;
   H15  =    -0.99934113480463 + H15 ;
   H16  =     1.30250382782737 + H16 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     3.62046962800706 * H11  +      -1.860875673098 * H12
          +    -3.65105027155196 * H13  +     2.14381074770309 * H14
          +     3.35729012959095 * H15  +    -2.46245459087361 * H16 ;
   P_DepVar1  =    -2.50510283018473 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural28;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural28;
*------------------------------------------------------------*;
drop Neural28_P_DepVar1;
Neural28_P_DepVar1 = P_DepVar1;
drop Neural28_P_DepVar0;
Neural28_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural28;
*------------------------------------------------------------*;
length Neural28_WARN_ $4;
drop Neural28_WARN_;
Neural28_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl8: Scoring Code of model 3 of 3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural26;
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
;
      label S_AcceptedCmpTotal = 'Standard: AcceptedCmpTotal' ;

      label S_Frq = 'Standard: Frq' ;

      label S_Income = 'Standard: Income' ;

      label S_Mnt = 'Standard: Mnt' ;

      label S_MntGoldProds = 'Standard: MntGoldProds' ;

      label S_MntMeatProducts = 'Standard: MntMeatProducts' ;

      label S_MntWines = 'Standard: MntWines' ;

      label S_NumDistPurchases = 'Standard: NumDistPurchases' ;

      label S_RFMstat = 'Standard: RFMstat' ;

      label S_RMntFrq = 'Standard: RMntFrq' ;

      label S_Recency = 'Standard: Recency' ;

      label G_Marital_Status0 = 'Dummy: G_Marital_Status=0' ;

      label G_Marital_Status1 = 'Dummy: G_Marital_Status=1' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for G_Marital_Status ;
drop G_Marital_Status0 G_Marital_Status1 ;
if missing( G_Marital_Status ) then do;
   G_Marital_Status0 = .;
   G_Marital_Status1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Marital_Status , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_Marital_Status0 = -1;
      G_Marital_Status1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_Marital_Status0 = 1;
      G_Marital_Status1 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Marital_Status0 = 0;
      G_Marital_Status1 = 1;
   end;
   else do;
      G_Marital_Status0 = .;
      G_Marital_Status1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   AcceptedCmpTotal ,
   Frq ,
   Income ,
   Mnt ,
   MntGoldProds ,
   MntMeatProducts ,
   MntWines ,
   NumDistPurchases ,
   RFMstat ,
   RMntFrq ,
   Recency   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
ELSE DO;
   IF MISSING( AcceptedCmpTotal ) THEN S_AcceptedCmpTotal  = . ;
   ELSE S_AcceptedCmpTotal  =    -0.46762909508827 +      1.4961610131261 *
        AcceptedCmpTotal ;
   IF MISSING( Frq ) THEN S_Frq  = . ;
   ELSE S_Frq  =     -1.7674482809159 +     0.13966853800993 * Frq ;
   IF MISSING( Income ) THEN S_Income  = . ;
   ELSE S_Income  =    -2.48883438787018 +     0.00004789669836 * Income ;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
   IF MISSING( MntGoldProds ) THEN S_MntGoldProds  = . ;
   ELSE S_MntGoldProds  =     -0.8611213764608 +     0.01954474499711 *
        MntGoldProds ;
   IF MISSING( MntMeatProducts ) THEN S_MntMeatProducts  = . ;
   ELSE S_MntMeatProducts  =    -0.78623193565931 +     0.00462584508746 *
        MntMeatProducts ;
   IF MISSING( MntWines ) THEN S_MntWines  = . ;
   ELSE S_MntWines  =    -0.90995945712571 +     0.00292658058326 * MntWines ;
   IF MISSING( NumDistPurchases ) THEN S_NumDistPurchases  = . ;
   ELSE S_NumDistPurchases  =    -1.46347520602971 +     0.21729252230374 *
        NumDistPurchases ;
   IF MISSING( RFMstat ) THEN S_RFMstat  = . ;
   ELSE S_RFMstat  =    -0.33944380186973 +     0.00063877635032 * RFMstat ;
   IF MISSING( RMntFrq ) THEN S_RMntFrq  = . ;
   ELSE S_RMntFrq  =    -1.25743573075922 +     0.03326204244626 * RMntFrq ;
   IF MISSING( Recency ) THEN S_Recency  = . ;
   ELSE S_Recency  =    -1.69222845719633 +     0.03469514083585 * Recency ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.52455774235062 * S_AcceptedCmpTotal  +      0.8466329583809 *
        S_Frq  +    -0.24140635088555 * S_Income  +     1.10423984303161 *
        S_Mnt  +    -0.01619058875438 * S_MntGoldProds
          +    -0.55263908764573 * S_MntMeatProducts
          +    -0.70001086687566 * S_MntWines  +    -0.13954000532733 *
        S_NumDistPurchases  +     0.13318250375153 * S_RFMstat
          +      0.4272420646455 * S_RMntFrq  +     0.41719267652064 *
        S_Recency ;
   H12  =    -0.04686202753184 * S_AcceptedCmpTotal  +     1.54159677165215 *
        S_Frq  +      1.5876209259654 * S_Income  +      0.5309695784835 *
        S_Mnt  +    -0.52971373734216 * S_MntGoldProds
          +     0.06735454992171 * S_MntMeatProducts
          +    -0.65753196206072 * S_MntWines  +    -0.43284750594408 *
        S_NumDistPurchases  +    -0.15176413476147 * S_RFMstat
          +    -0.45476834326399 * S_RMntFrq  +     0.41776804290571 *
        S_Recency ;
   H13  =    -0.31352262917412 * S_AcceptedCmpTotal  +     1.63883520018095 *
        S_Frq  +     0.02249756771349 * S_Income  +     0.21682603962115 *
        S_Mnt  +     0.15589923965689 * S_MntGoldProds
          +    -3.43308711980096 * S_MntMeatProducts
          +    -0.25180710956094 * S_MntWines  +    -1.36606037284233 *
        S_NumDistPurchases  +    -0.42313397988951 * S_RFMstat
          +     0.07406816799464 * S_RMntFrq  +     0.32607822998847 *
        S_Recency ;
   H14  =     0.40033548790491 * S_AcceptedCmpTotal  +    -0.40354500664934 *
        S_Frq  +      0.3774879421468 * S_Income  +    -0.16410506362553 *
        S_Mnt  +     0.02885736564162 * S_MntGoldProds
          +     0.71381843077774 * S_MntMeatProducts
          +    -0.26487063623892 * S_MntWines  +     1.18188766928145 *
        S_NumDistPurchases  +      0.1157647927608 * S_RFMstat
          +    -0.05680377377798 * S_RMntFrq  +    -0.89452100436419 *
        S_Recency ;
   H11  = H11  +    -0.53031970918814 * G_Marital_Status0
          +    -0.23001488541689 * G_Marital_Status1 ;
   H12  = H12  +     0.29542224963064 * G_Marital_Status0
          +    -0.13806446525096 * G_Marital_Status1 ;
   H13  = H13  +    -0.03108243750652 * G_Marital_Status0
          +     0.08210849129934 * G_Marital_Status1 ;
   H14  = H14  +     0.42709681519893 * G_Marital_Status0
          +     0.09450701323627 * G_Marital_Status1 ;
   H11  =    -0.80237558754999 + H11 ;
   H12  =     0.47909013828426 + H12 ;
   H13  =    -1.98531714916096 + H13 ;
   H14  =    -3.14128712464503 + H14 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -2.49130347768925 * H11  +    -2.38718075390418 * H12
          +    -5.92002796763835 * H13  +     4.95923742700541 * H14 ;
   P_DepVar1  =    -2.59807662162616 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural26;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural26;
*------------------------------------------------------------*;
drop Neural26_P_DepVar1;
Neural26_P_DepVar1 = P_DepVar1;
drop Neural26_P_DepVar0;
Neural26_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural26;
*------------------------------------------------------------*;
length Neural26_WARN_ $4;
drop Neural26_WARN_;
Neural26_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl8: Average Posteriors of 3 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural8_P_DepVar1 +
Neural28_P_DepVar1 +
Neural26_P_DepVar1
)/3;
P_DepVar0 = (
Neural8_P_DepVar0 +
Neural28_P_DepVar0 +
Neural26_P_DepVar0
)/3;
*------------------------------------------------------------*;
* Ensmbl8: Computing Classification Vars;
*------------------------------------------------------------*;
length I_DepVar $32;
label I_DepVar = 'Into: DepVar';
length _format $200;
drop _format;
_format= ' ';
_p_= 0;
drop _p_;
if P_DepVar1 > _p_ then do;
_p_= P_DepVar1;
_format= '1';
end;
if P_DepVar0 > _p_ then do;
_p_= P_DepVar0;
_format= '0';
end;
%DMNORMCP(_format,I_DepVar);
*------------------------------------------------------------*;
* Ensmbl8: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl8: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL8_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL8_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL8_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL8_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL28_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL28_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL28_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL28_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL26_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL26_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL26_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL26_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
