*------------------------------------------------------------*;
* Ensmbl17: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl17: Scoring Code of model 1 of 5;
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
* TOOL: Extension Class;
* TYPE: MODIFY;
* NODE: BINNING;
*------------------------------------------------------------*;
length _UFormat $200;
drop _UFormat;
_UFormat='';

*------------------------------------------------------------*;
* Variable: AcceptedCmp5;
*------------------------------------------------------------*;
LABEL GRP_AcceptedCmp5 =
'Grouped: AcceptedCmp5';

_UFormat = put(AcceptedCmp5,BEST.);
%dmnormip(_UFormat);
if MISSING(_UFORMAT) then do;
GRP_AcceptedCmp5 = 1;
end;
else if NOT MISSING(_UFORMAT) then do;
if (_UFORMAT eq '0'
) then do;
GRP_AcceptedCmp5 = 2;
end;
else
if (_UFORMAT eq '1'
) then do;
GRP_AcceptedCmp5 = 3;
end;
else do;
GRP_AcceptedCmp5 = 1;
end;
end;

*------------------------------------------------------------*;
* Variable: Frq;
*------------------------------------------------------------*;
LABEL GRP_Frq = "Grouped: Frq";

if MISSING(Frq) then do;
GRP_Frq = 1;
end;
else if NOT MISSING(Frq) then do;
if Frq < 6 then do;
GRP_Frq = 2;
end;
else
if 6 <= Frq AND Frq < 12 then do;
GRP_Frq = 3;
end;
else
if 12 <= Frq AND Frq < 18 then do;
GRP_Frq = 4;
end;
else
if 18 <= Frq then do;
GRP_Frq = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Income;
*------------------------------------------------------------*;
LABEL GRP_Income =
'Grouped: Income';

if MISSING(Income) then do;
GRP_Income = 1;
end;
else if NOT MISSING(Income) then do;
if Income < 35268 then do;
GRP_Income = 2;
end;
else
if 35268 <= Income AND Income < 52157 then do;
GRP_Income = 3;
end;
else
if 52157 <= Income AND Income < 69486 then do;
GRP_Income = 4;
end;
else
if 69486 <= Income then do;
GRP_Income = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Mnt;
*------------------------------------------------------------*;
LABEL GRP_Mnt = "Grouped: Mnt";

if MISSING(Mnt) then do;
GRP_Mnt = 1;
end;
else if NOT MISSING(Mnt) then do;
if Mnt < 72 then do;
GRP_Mnt = 2;
end;
else
if 72 <= Mnt AND Mnt < 405.5 then do;
GRP_Mnt = 3;
end;
else
if 405.5 <= Mnt AND Mnt < 1064 then do;
GRP_Mnt = 4;
end;
else
if 1064 <= Mnt then do;
GRP_Mnt = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: MntFishProducts;
*------------------------------------------------------------*;
LABEL GRP_MntFishProducts =
'Grouped: MntFishProducts';

if MISSING(MntFishProducts) then do;
GRP_MntFishProducts = 1;
end;
else if NOT MISSING(MntFishProducts) then do;
if MntFishProducts < 3 then do;
GRP_MntFishProducts = 2;
end;
else
if 3 <= MntFishProducts AND MntFishProducts < 13 then do;
GRP_MntFishProducts = 3;
end;
else
if 13 <= MntFishProducts AND MntFishProducts < 47 then do;
GRP_MntFishProducts = 4;
end;
else
if 47 <= MntFishProducts then do;
GRP_MntFishProducts = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: MntGoldProds;
*------------------------------------------------------------*;
LABEL GRP_MntGoldProds =
'Grouped: MntGoldProds';

if MISSING(MntGoldProds) then do;
GRP_MntGoldProds = 1;
end;
else if NOT MISSING(MntGoldProds) then do;
if MntGoldProds < 9 then do;
GRP_MntGoldProds = 2;
end;
else
if 9 <= MntGoldProds AND MntGoldProds < 25 then do;
GRP_MntGoldProds = 3;
end;
else
if 25 <= MntGoldProds AND MntGoldProds < 59 then do;
GRP_MntGoldProds = 4;
end;
else
if 59 <= MntGoldProds then do;
GRP_MntGoldProds = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: MntMeatProducts;
*------------------------------------------------------------*;
LABEL GRP_MntMeatProducts =
'Grouped: MntMeatProducts';

if MISSING(MntMeatProducts) then do;
GRP_MntMeatProducts = 1;
end;
else if NOT MISSING(MntMeatProducts) then do;
if MntMeatProducts < 17 then do;
GRP_MntMeatProducts = 2;
end;
else
if 17 <= MntMeatProducts AND MntMeatProducts < 72 then do;
GRP_MntMeatProducts = 3;
end;
else
if 72 <= MntMeatProducts AND MntMeatProducts < 246 then do;
GRP_MntMeatProducts = 4;
end;
else
if 246 <= MntMeatProducts then do;
GRP_MntMeatProducts = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: MntWines;
*------------------------------------------------------------*;
LABEL GRP_MntWines =
'Grouped: MntWines';

if MISSING(MntWines) then do;
GRP_MntWines = 1;
end;
else if NOT MISSING(MntWines) then do;
if MntWines < 24 then do;
GRP_MntWines = 2;
end;
else
if 24 <= MntWines AND MntWines < 183.5 then do;
GRP_MntWines = 3;
end;
else
if 183.5 <= MntWines AND MntWines < 508 then do;
GRP_MntWines = 4;
end;
else
if 508 <= MntWines then do;
GRP_MntWines = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: NumCatalogPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumCatalogPurchases =
'Grouped: NumCatalogPurchases';

if MISSING(NumCatalogPurchases) then do;
GRP_NumCatalogPurchases = 1;
end;
else if NOT MISSING(NumCatalogPurchases) then do;
if NumCatalogPurchases < 0 then do;
GRP_NumCatalogPurchases = 2;
end;
else
if 0 <= NumCatalogPurchases AND NumCatalogPurchases < 2 then do;
GRP_NumCatalogPurchases = 3;
end;
else
if 2 <= NumCatalogPurchases AND NumCatalogPurchases < 4 then do;
GRP_NumCatalogPurchases = 4;
end;
else
if 4 <= NumCatalogPurchases then do;
GRP_NumCatalogPurchases = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: NumDistPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumDistPurchases = "Grouped: NumDistPurchases";

if MISSING(NumDistPurchases) then do;
GRP_NumDistPurchases = 1;
end;
else if NOT MISSING(NumDistPurchases) then do;
if NumDistPurchases < 3 then do;
GRP_NumDistPurchases = 2;
end;
else
if 3 <= NumDistPurchases AND NumDistPurchases < 6 then do;
GRP_NumDistPurchases = 3;
end;
else
if 6 <= NumDistPurchases AND NumDistPurchases < 10 then do;
GRP_NumDistPurchases = 4;
end;
else
if 10 <= NumDistPurchases then do;
GRP_NumDistPurchases = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: NumWebPurchases;
*------------------------------------------------------------*;
LABEL GRP_NumWebPurchases =
'Grouped: NumWebPurchases';

if MISSING(NumWebPurchases) then do;
GRP_NumWebPurchases = 1;
end;
else if NOT MISSING(NumWebPurchases) then do;
if NumWebPurchases < 2 then do;
GRP_NumWebPurchases = 2;
end;
else
if 2 <= NumWebPurchases AND NumWebPurchases < 4 then do;
GRP_NumWebPurchases = 3;
end;
else
if 4 <= NumWebPurchases AND NumWebPurchases < 6 then do;
GRP_NumWebPurchases = 4;
end;
else
if 6 <= NumWebPurchases then do;
GRP_NumWebPurchases = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: RFMstat;
*------------------------------------------------------------*;
LABEL GRP_RFMstat = "Grouped: RFMstat";

if MISSING(RFMstat) then do;
GRP_RFMstat = 1;
end;
else if NOT MISSING(RFMstat) then do;
if RFMstat < 10.34 then do;
GRP_RFMstat = 2;
end;
else
if 10.34 <= RFMstat AND RFMstat < 128.09 then do;
GRP_RFMstat = 3;
end;
else
if 128.09 <= RFMstat AND RFMstat < 455.22 then do;
GRP_RFMstat = 4;
end;
else
if 455.22 <= RFMstat then do;
GRP_RFMstat = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: RMntFrq;
*------------------------------------------------------------*;
LABEL GRP_RMntFrq = "Grouped: RMntFrq";

if MISSING(RMntFrq) then do;
GRP_RMntFrq = 1;
end;
else if NOT MISSING(RMntFrq) then do;
if RMntFrq < 13.25 then do;
GRP_RMntFrq = 2;
end;
else
if 13.25 <= RMntFrq AND RMntFrq < 30.4 then do;
GRP_RMntFrq = 3;
end;
else
if 30.4 <= RMntFrq AND RMntFrq < 52.86 then do;
GRP_RMntFrq = 4;
end;
else
if 52.86 <= RMntFrq then do;
GRP_RMntFrq = 5;
end;
end;

*------------------------------------------------------------*;
* Variable: Recency;
*------------------------------------------------------------*;
LABEL GRP_Recency =
'Grouped: Recency';

if MISSING(Recency) then do;
GRP_Recency = 1;
end;
else if NOT MISSING(Recency) then do;
if Recency < 24 then do;
GRP_Recency = 2;
end;
else
if 24 <= Recency AND Recency < 48 then do;
GRP_Recency = 3;
end;
else
if 48 <= Recency AND Recency < 73 then do;
GRP_Recency = 4;
end;
else
if 73 <= Recency then do;
GRP_Recency = 5;
end;
end;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural21;
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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_MntFishProducts2 = 'Dummy: GRP_MntFishProducts=2' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop GRP_AcceptedCmp52 ;
if missing( GRP_AcceptedCmp5 ) then do;
   GRP_AcceptedCmp52 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_AcceptedCmp52 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_AcceptedCmp52 = -1;
   end;
   else do;
      GRP_AcceptedCmp52 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 ;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Frq2 = -1;
      GRP_Frq3 = -1;
      GRP_Frq4 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 1;
      GRP_Frq4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 0;
      GRP_Frq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Frq2 = 1;
      GRP_Frq3 = 0;
      GRP_Frq4 = 0;
   end;
   else do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 ;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Income2 = -1;
      GRP_Income3 = -1;
      GRP_Income4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 0;
      GRP_Income4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 1;
      GRP_Income4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Income2 = 1;
      GRP_Income3 = 0;
      GRP_Income4 = 0;
   end;
   else do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 ;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 1;
      GRP_Mnt4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_Mnt2 = -1;
      GRP_Mnt3 = -1;
      GRP_Mnt4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Mnt2 = 1;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 0;
   end;
   else do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts2 GRP_MntFishProducts3 GRP_MntFishProducts4 ;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts2 = .;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 1;
      GRP_MntFishProducts4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntFishProducts2 = -1;
      GRP_MntFishProducts3 = -1;
      GRP_MntFishProducts4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntFishProducts2 = 1;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 0;
   end;
   else do;
      GRP_MntFishProducts2 = .;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 ;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 1;
      GRP_MntGoldProds4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntGoldProds2 = -1;
      GRP_MntGoldProds3 = -1;
      GRP_MntGoldProds4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntGoldProds2 = 1;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 0;
   end;
   else do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4 ;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 1;
      GRP_MntMeatProducts4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntMeatProducts2 = -1;
      GRP_MntMeatProducts3 = -1;
      GRP_MntMeatProducts4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntMeatProducts2 = 1;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 0;
   end;
   else do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 ;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 1;
      GRP_MntWines4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntWines2 = -1;
      GRP_MntWines3 = -1;
      GRP_MntWines4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntWines2 = 1;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 0;
   end;
   else do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4 ;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumCatalogPurchases3 = 1;
      GRP_NumCatalogPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumCatalogPurchases3 = -1;
      GRP_NumCatalogPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumCatalogPurchases3 = 0;
      GRP_NumCatalogPurchases4 = 1;
   end;
   else do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4 ;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_NumDistPurchases2 = -1;
      GRP_NumDistPurchases3 = -1;
      GRP_NumDistPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumDistPurchases2 = 1;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 1;
      GRP_NumDistPurchases4 = 0;
   end;
   else do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4 ;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 1;
      GRP_NumWebPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumWebPurchases2 = -1;
      GRP_NumWebPurchases3 = -1;
      GRP_NumWebPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumWebPurchases2 = 1;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 0;
   end;
   else do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 ;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 1;
      GRP_RFMstat4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RFMstat2 = -1;
      GRP_RFMstat3 = -1;
      GRP_RFMstat4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RFMstat2 = 1;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 0;
   end;
   else do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 ;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 1;
      GRP_RMntFrq4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RMntFrq2 = -1;
      GRP_RMntFrq3 = -1;
      GRP_RMntFrq4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RMntFrq2 = 1;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 0;
   end;
   else do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 ;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Recency2 = -1;
      GRP_Recency3 = -1;
      GRP_Recency4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 0;
      GRP_Recency4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 1;
      GRP_Recency4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Recency2 = 1;
      GRP_Recency3 = 0;
      GRP_Recency4 = 0;
   end;
   else do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =      0.0668146440452 * S_Year_Birth ;
   H12  =     0.02918236951724 * S_Year_Birth ;
   H13  =     0.52122974180208 * S_Year_Birth ;
   H14  =     -0.1823800721103 * S_Year_Birth ;
   H11  = H11  +    -0.48347630033708 * GRP_AcceptedCmp52
          +     0.37100635990339 * GRP_Frq2  +     0.04377799127913 * GRP_Frq3
          +     -0.1974477050613 * GRP_Frq4  +     0.10700887225506 *
        GRP_Income2  +      0.3291591268929 * GRP_Income3
          +     0.00612929517663 * GRP_Income4  +    -0.23329153390557 *
        GRP_Mnt2  +    -0.08800204437411 * GRP_Mnt3  +    -0.08445529701198 *
        GRP_Mnt4  +     0.28673732624133 * GRP_MntFishProducts2
          +    -0.14978605827752 * GRP_MntFishProducts3
          +     0.22642470616542 * GRP_MntFishProducts4
          +     0.07604404821672 * GRP_MntGoldProds2
          +     0.04745212568332 * GRP_MntGoldProds3
          +    -0.10028215217028 * GRP_MntGoldProds4
          +    -0.07377682497053 * GRP_MntMeatProducts2
          +    -0.09960214357487 * GRP_MntMeatProducts3
          +    -0.25438120582859 * GRP_MntMeatProducts4
          +     0.42639299324809 * GRP_MntWines2  +     0.31089292559786 *
        GRP_MntWines3  +    -0.26826041457934 * GRP_MntWines4
          +    -0.53742609478771 * GRP_NumCatalogPurchases3
          +    -0.03023603128161 * GRP_NumCatalogPurchases4
          +    -0.37743946252805 * GRP_NumDistPurchases2
          +    -0.01872647257623 * GRP_NumDistPurchases3
          +    -0.31993024737958 * GRP_NumDistPurchases4
          +    -0.11078713164327 * GRP_NumWebPurchases2
          +     0.24754701690398 * GRP_NumWebPurchases3
          +     0.01530465573539 * GRP_NumWebPurchases4
          +    -0.17630256491744 * GRP_RFMstat2  +    -0.47929093118323 *
        GRP_RFMstat3  +     0.26729201021061 * GRP_RFMstat4
          +    -0.20197995708067 * GRP_RMntFrq2  +    -0.07138949090838 *
        GRP_RMntFrq3  +    -0.08653988697814 * GRP_RMntFrq4
          +     1.10790516734526 * GRP_Recency2  +     0.22440369463671 *
        GRP_Recency3  +    -0.44624012521308 * GRP_Recency4 ;
   H12  = H12  +    -0.39171353947494 * GRP_AcceptedCmp52
          +     0.47539355981113 * GRP_Frq2  +     0.13865083322043 * GRP_Frq3
          +     0.07826446095659 * GRP_Frq4  +     0.08299165408218 *
        GRP_Income2  +     0.19385348399904 * GRP_Income3
          +     -0.4686130167393 * GRP_Income4  +     0.07036992149948 *
        GRP_Mnt2  +     0.03891677493503 * GRP_Mnt3  +     0.07820077346387 *
        GRP_Mnt4  +     0.36400126236983 * GRP_MntFishProducts2
          +    -0.12626287803422 * GRP_MntFishProducts3
          +    -0.42885022606866 * GRP_MntFishProducts4
          +    -0.08312331608509 * GRP_MntGoldProds2
          +    -0.20061238652989 * GRP_MntGoldProds3
          +      0.2540651659901 * GRP_MntGoldProds4
          +    -0.05377938516186 * GRP_MntMeatProducts2
          +    -0.20960578757846 * GRP_MntMeatProducts3
          +     0.40616704937625 * GRP_MntMeatProducts4
          +     0.10444770584156 * GRP_MntWines2  +     0.28632714955895 *
        GRP_MntWines3  +     -0.0752487603973 * GRP_MntWines4
          +    -0.34375303246386 * GRP_NumCatalogPurchases3
          +     0.09580710843179 * GRP_NumCatalogPurchases4
          +    -0.07273864038222 * GRP_NumDistPurchases2
          +     0.10966715611059 * GRP_NumDistPurchases3
          +      -0.043035493739 * GRP_NumDistPurchases4
          +    -0.11780256604927 * GRP_NumWebPurchases2
          +    -0.18165047164828 * GRP_NumWebPurchases3
          +     0.26936545488609 * GRP_NumWebPurchases4
          +    -0.06874165804548 * GRP_RFMstat2  +     0.09298117986488 *
        GRP_RFMstat3  +    -0.24177720125931 * GRP_RFMstat4
          +    -0.06280623207978 * GRP_RMntFrq2  +     0.01871815739589 *
        GRP_RMntFrq3  +    -0.14308267957716 * GRP_RMntFrq4
          +     0.34467425877566 * GRP_Recency2  +     0.05820913643645 *
        GRP_Recency3  +     -0.0454148085012 * GRP_Recency4 ;
   H13  = H13  +    -0.08768819217047 * GRP_AcceptedCmp52
          +     0.44895652806962 * GRP_Frq2  +      0.3800586670059 * GRP_Frq3
          +    -0.07849333722318 * GRP_Frq4  +     0.61398939980043 *
        GRP_Income2  +     0.47732933105902 * GRP_Income3
          +    -0.46767598050409 * GRP_Income4  +     0.00119742402812 *
        GRP_Mnt2  +     0.28434487319801 * GRP_Mnt3  +    -0.16337373090226 *
        GRP_Mnt4  +     0.24731982804653 * GRP_MntFishProducts2
          +     0.07001619920815 * GRP_MntFishProducts3
          +     0.07735498521359 * GRP_MntFishProducts4
          +    -0.15884098938162 * GRP_MntGoldProds2
          +    -0.27657428867783 * GRP_MntGoldProds3
          +     -0.1812542301124 * GRP_MntGoldProds4
          +    -0.05299867036647 * GRP_MntMeatProducts2
          +     0.00010942539908 * GRP_MntMeatProducts3
          +     0.03587382246671 * GRP_MntMeatProducts4
          +      0.1756484217323 * GRP_MntWines2  +     0.00289944116976 *
        GRP_MntWines3  +    -0.03752905583429 * GRP_MntWines4
          +     0.14681010085531 * GRP_NumCatalogPurchases3
          +    -0.23177792190553 * GRP_NumCatalogPurchases4
          +      -0.481887498986 * GRP_NumDistPurchases2
          +    -0.09943718589693 * GRP_NumDistPurchases3
          +     0.21760620991618 * GRP_NumDistPurchases4
          +    -0.09523799103665 * GRP_NumWebPurchases2
          +     0.06245025753157 * GRP_NumWebPurchases3
          +     0.11312469123111 * GRP_NumWebPurchases4
          +     -0.0156924842698 * GRP_RFMstat2  +     0.04329307564553 *
        GRP_RFMstat3  +    -0.06522539538042 * GRP_RFMstat4
          +     0.03130432577469 * GRP_RMntFrq2  +     0.15385182155627 *
        GRP_RMntFrq3  +    -0.05116322369837 * GRP_RMntFrq4
          +     0.52385840277978 * GRP_Recency2  +     0.44348058106283 *
        GRP_Recency3  +    -0.30003743891847 * GRP_Recency4 ;
   H14  = H14  +    -0.30891588421078 * GRP_AcceptedCmp52
          +     0.10101143238536 * GRP_Frq2  +    -0.03148220138998 * GRP_Frq3
          +     0.09807803608029 * GRP_Frq4  +     0.11294471318052 *
        GRP_Income2  +      0.0433560034099 * GRP_Income3
          +    -0.35503487261838 * GRP_Income4  +     0.15199410100967 *
        GRP_Mnt2  +    -0.15675008677561 * GRP_Mnt3  +    -0.06110606567063 *
        GRP_Mnt4  +     0.10272197664106 * GRP_MntFishProducts2
          +     0.33369645018356 * GRP_MntFishProducts3
          +     0.08427214551103 * GRP_MntFishProducts4
          +    -0.36187933889617 * GRP_MntGoldProds2
          +      0.1522584097588 * GRP_MntGoldProds3
          +    -0.18069803129722 * GRP_MntGoldProds4
          +    -0.39829328143793 * GRP_MntMeatProducts2
          +     0.00511939388608 * GRP_MntMeatProducts3
          +      0.0518722466688 * GRP_MntMeatProducts4
          +     0.10413724420858 * GRP_MntWines2  +    -0.30183392073068 *
        GRP_MntWines3  +    -0.40546180997599 * GRP_MntWines4
          +    -0.73564355192687 * GRP_NumCatalogPurchases3
          +     0.04239157662699 * GRP_NumCatalogPurchases4
          +    -0.61448773428482 * GRP_NumDistPurchases2
          +    -0.10817170519054 * GRP_NumDistPurchases3
          +    -0.00883878051452 * GRP_NumDistPurchases4
          +      0.0024401108853 * GRP_NumWebPurchases2
          +     -0.1066188825276 * GRP_NumWebPurchases3
          +     -0.2845728776007 * GRP_NumWebPurchases4
          +    -0.46846387193519 * GRP_RFMstat2  +     0.01548835288752 *
        GRP_RFMstat3  +     0.29056719482503 * GRP_RFMstat4
          +     0.13283388675843 * GRP_RMntFrq2  +    -0.01179035894062 *
        GRP_RMntFrq3  +    -0.40979674551139 * GRP_RMntFrq4
          +     0.39674687653317 * GRP_Recency2  +     0.48674783005161 *
        GRP_Recency3  +     0.19384397786172 * GRP_Recency4 ;
   H11  =    -1.18381596942405 + H11 ;
   H12  =     0.86336963287203 + H12 ;
   H13  =     -0.9724199391604 + H13 ;
   H14  =     1.35533016839911 + H14 ;
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
   P_DepVar1  =     2.12648206014408 * H11  +      1.4206902210932 * H12
          +     1.21164854880393 * H13  +      1.5803543453738 * H14 ;
   P_DepVar1  =    -1.66515506353131 + P_DepVar1 ;
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
* Renaming variables for Neural21;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural21;
*------------------------------------------------------------*;
drop Neural21_P_DepVar1;
Neural21_P_DepVar1 = P_DepVar1;
drop Neural21_P_DepVar0;
Neural21_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural21;
*------------------------------------------------------------*;
length Neural21_WARN_ $4;
drop Neural21_WARN_;
Neural21_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl17: Scoring Code of model 2 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural22;
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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_MntFishProducts2 = 'Dummy: GRP_MntFishProducts=2' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

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

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop GRP_AcceptedCmp52 ;
if missing( GRP_AcceptedCmp5 ) then do;
   GRP_AcceptedCmp52 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_AcceptedCmp52 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_AcceptedCmp52 = -1;
   end;
   else do;
      GRP_AcceptedCmp52 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 ;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Frq2 = -1;
      GRP_Frq3 = -1;
      GRP_Frq4 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 1;
      GRP_Frq4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 0;
      GRP_Frq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Frq2 = 1;
      GRP_Frq3 = 0;
      GRP_Frq4 = 0;
   end;
   else do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 ;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Income2 = -1;
      GRP_Income3 = -1;
      GRP_Income4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 0;
      GRP_Income4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 1;
      GRP_Income4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Income2 = 1;
      GRP_Income3 = 0;
      GRP_Income4 = 0;
   end;
   else do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 ;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 1;
      GRP_Mnt4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_Mnt2 = -1;
      GRP_Mnt3 = -1;
      GRP_Mnt4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Mnt2 = 1;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 0;
   end;
   else do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts2 GRP_MntFishProducts3 GRP_MntFishProducts4 ;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts2 = .;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 1;
      GRP_MntFishProducts4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntFishProducts2 = -1;
      GRP_MntFishProducts3 = -1;
      GRP_MntFishProducts4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntFishProducts2 = 1;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 0;
   end;
   else do;
      GRP_MntFishProducts2 = .;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 ;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 1;
      GRP_MntGoldProds4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntGoldProds2 = -1;
      GRP_MntGoldProds3 = -1;
      GRP_MntGoldProds4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntGoldProds2 = 1;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 0;
   end;
   else do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4 ;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 1;
      GRP_MntMeatProducts4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntMeatProducts2 = -1;
      GRP_MntMeatProducts3 = -1;
      GRP_MntMeatProducts4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntMeatProducts2 = 1;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 0;
   end;
   else do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 ;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 1;
      GRP_MntWines4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntWines2 = -1;
      GRP_MntWines3 = -1;
      GRP_MntWines4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntWines2 = 1;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 0;
   end;
   else do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4 ;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumCatalogPurchases3 = 1;
      GRP_NumCatalogPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumCatalogPurchases3 = -1;
      GRP_NumCatalogPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumCatalogPurchases3 = 0;
      GRP_NumCatalogPurchases4 = 1;
   end;
   else do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4 ;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_NumDistPurchases2 = -1;
      GRP_NumDistPurchases3 = -1;
      GRP_NumDistPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumDistPurchases2 = 1;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 1;
      GRP_NumDistPurchases4 = 0;
   end;
   else do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4 ;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 1;
      GRP_NumWebPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumWebPurchases2 = -1;
      GRP_NumWebPurchases3 = -1;
      GRP_NumWebPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumWebPurchases2 = 1;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 0;
   end;
   else do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 ;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 1;
      GRP_RFMstat4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RFMstat2 = -1;
      GRP_RFMstat3 = -1;
      GRP_RFMstat4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RFMstat2 = 1;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 0;
   end;
   else do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 ;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 1;
      GRP_RMntFrq4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RMntFrq2 = -1;
      GRP_RMntFrq3 = -1;
      GRP_RMntFrq4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RMntFrq2 = 1;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 0;
   end;
   else do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 ;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Recency2 = -1;
      GRP_Recency3 = -1;
      GRP_Recency4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 0;
      GRP_Recency4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 1;
      GRP_Recency4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Recency2 = 1;
      GRP_Recency3 = 0;
      GRP_Recency4 = 0;
   end;
   else do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.04727192845675 * S_Year_Birth ;
   H12  =    -0.03499603197831 * S_Year_Birth ;
   H13  =      -0.249387333167 * S_Year_Birth ;
   H14  =    -0.18145230662582 * S_Year_Birth ;
   H15  =    -0.07744416350216 * S_Year_Birth ;
   H11  = H11  +    -0.25371698668168 * GRP_AcceptedCmp52
          +     0.38185615945621 * GRP_Frq2  +     0.03545555759423 * GRP_Frq3
          +    -0.00061660249238 * GRP_Frq4  +     0.41779261820045 *
        GRP_Income2  +     0.51800912898069 * GRP_Income3
          +    -0.36427548932695 * GRP_Income4  +    -0.06433979614617 *
        GRP_Mnt2  +     0.00045120565293 * GRP_Mnt3  +    -0.13992317322759 *
        GRP_Mnt4  +     0.34207391538024 * GRP_MntFishProducts2
          +     0.03411739869638 * GRP_MntFishProducts3
          +      -0.083693402353 * GRP_MntFishProducts4
          +     -0.1318128730187 * GRP_MntGoldProds2
          +     -0.0614737729382 * GRP_MntGoldProds3
          +    -0.00372986687449 * GRP_MntGoldProds4
          +     -0.3129171829017 * GRP_MntMeatProducts2
          +     0.01519664718127 * GRP_MntMeatProducts3
          +     0.29997111548812 * GRP_MntMeatProducts4
          +       0.389673942682 * GRP_MntWines2  +     0.21159785789434 *
        GRP_MntWines3  +    -0.26921349986988 * GRP_MntWines4
          +    -0.47013218092095 * GRP_NumCatalogPurchases3
          +     0.23943411636141 * GRP_NumCatalogPurchases4
          +    -0.68715024477164 * GRP_NumDistPurchases2
          +    -0.09178471992122 * GRP_NumDistPurchases3
          +    -0.01170225640351 * GRP_NumDistPurchases4
          +    -0.14760833919227 * GRP_NumWebPurchases2
          +     0.02966820025811 * GRP_NumWebPurchases3
          +    -0.04127892210576 * GRP_NumWebPurchases4
          +    -0.45467119970502 * GRP_RFMstat2  +    -0.14644406995031 *
        GRP_RFMstat3  +    -0.12660007404037 * GRP_RFMstat4
          +     0.04829215694488 * GRP_RMntFrq2  +     0.10137738373353 *
        GRP_RMntFrq3  +     -0.2873514159435 * GRP_RMntFrq4
          +     0.61737333380878 * GRP_Recency2  +     0.16651370318087 *
        GRP_Recency3  +    -0.15382569411658 * GRP_Recency4 ;
   H12  = H12  +    -0.00960598895677 * GRP_AcceptedCmp52
          +    -0.13877780492855 * GRP_Frq2  +    -0.12078849771739 * GRP_Frq3
          +     0.25058833013238 * GRP_Frq4  +     0.13932014454657 *
        GRP_Income2  +    -0.11560599273748 * GRP_Income3
          +    -0.36622829757109 * GRP_Income4  +     0.12796853065131 *
        GRP_Mnt2  +    -0.15829126446209 * GRP_Mnt3  +    -0.35779207872654 *
        GRP_Mnt4  +     0.06590491513415 * GRP_MntFishProducts2
          +     0.00842475350903 * GRP_MntFishProducts3
          +     -0.1623103908885 * GRP_MntFishProducts4
          +    -0.23845524931139 * GRP_MntGoldProds2
          +    -0.07128567155438 * GRP_MntGoldProds3
          +     0.25778887379163 * GRP_MntGoldProds4
          +    -0.12224351227219 * GRP_MntMeatProducts2
          +     0.06269922653052 * GRP_MntMeatProducts3
          +      0.2587215409794 * GRP_MntMeatProducts4
          +     0.20096090232239 * GRP_MntWines2  +    -0.16858917844476 *
        GRP_MntWines3  +     0.03815809499779 * GRP_MntWines4
          +     0.05177526225067 * GRP_NumCatalogPurchases3
          +    -0.18831777813313 * GRP_NumCatalogPurchases4
          +     0.12374838743082 * GRP_NumDistPurchases2
          +    -0.19910688422086 * GRP_NumDistPurchases3
          +    -0.03804569737208 * GRP_NumDistPurchases4
          +    -0.17179633678901 * GRP_NumWebPurchases2
          +    -0.08560184232365 * GRP_NumWebPurchases3
          +     0.09237237622553 * GRP_NumWebPurchases4
          +     0.01544327143979 * GRP_RFMstat2  +      0.1127818122444 *
        GRP_RFMstat3  +    -0.21371736650143 * GRP_RFMstat4
          +    -0.14005478166078 * GRP_RMntFrq2  +     0.07954568858907 *
        GRP_RMntFrq3  +    -0.02313269086836 * GRP_RMntFrq4
          +     0.04358116545272 * GRP_Recency2  +    -0.02969695172962 *
        GRP_Recency3  +     0.00206593904485 * GRP_Recency4 ;
   H13  = H13  +     0.11273135858209 * GRP_AcceptedCmp52
          +    -0.15015665173608 * GRP_Frq2  +    -0.20454924588356 * GRP_Frq3
          +    -0.04047998964496 * GRP_Frq4  +    -0.29897237144541 *
        GRP_Income2  +      -0.028464296882 * GRP_Income3
          +     0.24836294191696 * GRP_Income4  +     0.08738925553158 *
        GRP_Mnt2  +     0.00962293230168 * GRP_Mnt3  +    -0.12661643514597 *
        GRP_Mnt4  +    -0.03747719154948 * GRP_MntFishProducts2
          +    -0.07078012229572 * GRP_MntFishProducts3
          +    -0.14569186671189 * GRP_MntFishProducts4
          +     0.14963390032413 * GRP_MntGoldProds2
          +    -0.11869917970226 * GRP_MntGoldProds3
          +     0.25943105626615 * GRP_MntGoldProds4
          +     0.36609689271233 * GRP_MntMeatProducts2
          +     0.10969864655073 * GRP_MntMeatProducts3
          +    -0.03446779336952 * GRP_MntMeatProducts4
          +    -0.16882321573662 * GRP_MntWines2  +     0.07914922328232 *
        GRP_MntWines3  +     0.13243594484158 * GRP_MntWines4
          +     0.39758714937962 * GRP_NumCatalogPurchases3
          +     0.31434011051179 * GRP_NumCatalogPurchases4
          +     0.08068432649382 * GRP_NumDistPurchases2
          +    -0.08875599058351 * GRP_NumDistPurchases3
          +     0.26738740475822 * GRP_NumDistPurchases4
          +     -0.0916247468051 * GRP_NumWebPurchases2
          +    -0.17267741073665 * GRP_NumWebPurchases3
          +     0.01349113315351 * GRP_NumWebPurchases4
          +    -0.19075973281592 * GRP_RFMstat2  +    -0.20146461162283 *
        GRP_RFMstat3  +    -0.13097471458987 * GRP_RFMstat4
          +     0.06761773631631 * GRP_RMntFrq2  +     0.27576244694442 *
        GRP_RMntFrq3  +      0.1281788430307 * GRP_RMntFrq4
          +    -0.15939599795679 * GRP_Recency2  +    -0.00210397286084 *
        GRP_Recency3  +     0.28490847560375 * GRP_Recency4 ;
   H14  = H14  +     0.27713596853764 * GRP_AcceptedCmp52
          +    -0.11480256849934 * GRP_Frq2  +      0.0285240312455 * GRP_Frq3
          +     0.09416065239682 * GRP_Frq4  +     -0.1229961422993 *
        GRP_Income2  +     0.01867364051002 * GRP_Income3
          +     0.05820105400306 * GRP_Income4  +    -0.16873429334819 *
        GRP_Mnt2  +    -0.01221085891741 * GRP_Mnt3  +    -0.10225236565235 *
        GRP_Mnt4  +    -0.09613387975858 * GRP_MntFishProducts2
          +    -0.18334484867808 * GRP_MntFishProducts3
          +     0.13484477561766 * GRP_MntFishProducts4
          +    -0.05145913380692 * GRP_MntGoldProds2
          +     0.04459987080173 * GRP_MntGoldProds3
          +     0.01539767655772 * GRP_MntGoldProds4
          +     0.26537148543352 * GRP_MntMeatProducts2
          +     0.22913678530176 * GRP_MntMeatProducts3
          +     0.21262490658374 * GRP_MntMeatProducts4
          +    -0.11513521401249 * GRP_MntWines2  +    -0.14420673462527 *
        GRP_MntWines3  +     0.11949691312637 * GRP_MntWines4
          +    -0.02289734111038 * GRP_NumCatalogPurchases3
          +    -0.12014539185275 * GRP_NumCatalogPurchases4
          +     0.09224372228857 * GRP_NumDistPurchases2
          +    -0.14205094961773 * GRP_NumDistPurchases3
          +    -0.27160467877541 * GRP_NumDistPurchases4
          +    -0.15428446875019 * GRP_NumWebPurchases2
          +    -0.36914157795453 * GRP_NumWebPurchases3
          +    -0.41610537355059 * GRP_NumWebPurchases4
          +    -0.29442656678388 * GRP_RFMstat2  +     0.03961235509827 *
        GRP_RFMstat3  +    -0.18322878380243 * GRP_RFMstat4
          +     0.06857495854453 * GRP_RMntFrq2  +     0.08325769999442 *
        GRP_RMntFrq3  +     0.24334424933749 * GRP_RMntFrq4
          +    -0.50963259840069 * GRP_Recency2  +    -0.24163634485458 *
        GRP_Recency3  +     -0.1023689653207 * GRP_Recency4 ;
   H15  = H15  +    -0.58071728739803 * GRP_AcceptedCmp52
          +    -0.33803120859672 * GRP_Frq2  +    -0.08690701614481 * GRP_Frq3
          +     0.06107334775294 * GRP_Frq4  +     0.00751374071999 *
        GRP_Income2  +     0.20911873861779 * GRP_Income3
          +    -0.14977199160976 * GRP_Income4  +     0.15427447371686 *
        GRP_Mnt2  +    -0.24298277669059 * GRP_Mnt3  +    -0.02935492111499 *
        GRP_Mnt4  +     0.04923982061963 * GRP_MntFishProducts2
          +    -0.08952948139975 * GRP_MntFishProducts3
          +     0.15338133379465 * GRP_MntFishProducts4
          +     0.04821845492824 * GRP_MntGoldProds2
          +     0.20117781904284 * GRP_MntGoldProds3
          +     0.13013396690778 * GRP_MntGoldProds4
          +    -0.03940841472157 * GRP_MntMeatProducts2
          +     0.03161017721112 * GRP_MntMeatProducts3
          +    -0.21938330779867 * GRP_MntMeatProducts4
          +      0.3039864690076 * GRP_MntWines2  +     0.33038690291786 *
        GRP_MntWines3  +     0.03314465135063 * GRP_MntWines4
          +    -0.07655889365033 * GRP_NumCatalogPurchases3
          +    -0.17353955777897 * GRP_NumCatalogPurchases4
          +    -0.16058154480995 * GRP_NumDistPurchases2
          +    -0.30101518928361 * GRP_NumDistPurchases3
          +      0.0473480026433 * GRP_NumDistPurchases4
          +     0.03132883547053 * GRP_NumWebPurchases2
          +    -0.29425936985479 * GRP_NumWebPurchases3
          +    -0.12527625315403 * GRP_NumWebPurchases4
          +     0.30683805591766 * GRP_RFMstat2  +    -0.21275334469197 *
        GRP_RFMstat3  +     0.32474239840607 * GRP_RFMstat4
          +     0.09289841520091 * GRP_RMntFrq2  +     0.22137778862379 *
        GRP_RMntFrq3  +     0.12254524703503 * GRP_RMntFrq4
          +     0.46836624272095 * GRP_Recency2  +     0.01747843890017 *
        GRP_Recency3  +    -0.28363324780869 * GRP_Recency4 ;
   H11  =    -0.09329902916762 + H11 ;
   H12  =     0.21894996952826 + H12 ;
   H13  =    -0.97210428395662 + H13 ;
   H14  =    -0.47241372860242 + H14 ;
   H15  =    -0.89551869986721 + H15 ;
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
   P_DepVar1  =     2.68876927057109 * H11  +     0.34381275178608 * H12
          +    -1.13153750790029 * H13  +    -0.93563986714952 * H14
          +     1.84382077322412 * H15 ;
   P_DepVar1  =    -1.53169022796223 + P_DepVar1 ;
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
* Renaming variables for Neural22;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural22;
*------------------------------------------------------------*;
drop Neural22_P_DepVar1;
Neural22_P_DepVar1 = P_DepVar1;
drop Neural22_P_DepVar0;
Neural22_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural22;
*------------------------------------------------------------*;
length Neural22_WARN_ $4;
drop Neural22_WARN_;
Neural22_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl17: Scoring Code of model 3 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural18;
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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_MntFishProducts2 = 'Dummy: GRP_MntFishProducts=2' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

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

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop GRP_AcceptedCmp52 ;
if missing( GRP_AcceptedCmp5 ) then do;
   GRP_AcceptedCmp52 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_AcceptedCmp52 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_AcceptedCmp52 = -1;
   end;
   else do;
      GRP_AcceptedCmp52 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 ;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Frq2 = -1;
      GRP_Frq3 = -1;
      GRP_Frq4 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 1;
      GRP_Frq4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 0;
      GRP_Frq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Frq2 = 1;
      GRP_Frq3 = 0;
      GRP_Frq4 = 0;
   end;
   else do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 ;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Income2 = -1;
      GRP_Income3 = -1;
      GRP_Income4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 0;
      GRP_Income4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 1;
      GRP_Income4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Income2 = 1;
      GRP_Income3 = 0;
      GRP_Income4 = 0;
   end;
   else do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 ;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 1;
      GRP_Mnt4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_Mnt2 = -1;
      GRP_Mnt3 = -1;
      GRP_Mnt4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Mnt2 = 1;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 0;
   end;
   else do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts2 GRP_MntFishProducts3 GRP_MntFishProducts4 ;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts2 = .;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 1;
      GRP_MntFishProducts4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntFishProducts2 = -1;
      GRP_MntFishProducts3 = -1;
      GRP_MntFishProducts4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntFishProducts2 = 1;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 0;
   end;
   else do;
      GRP_MntFishProducts2 = .;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 ;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 1;
      GRP_MntGoldProds4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntGoldProds2 = -1;
      GRP_MntGoldProds3 = -1;
      GRP_MntGoldProds4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntGoldProds2 = 1;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 0;
   end;
   else do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4 ;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 1;
      GRP_MntMeatProducts4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntMeatProducts2 = -1;
      GRP_MntMeatProducts3 = -1;
      GRP_MntMeatProducts4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntMeatProducts2 = 1;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 0;
   end;
   else do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 ;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 1;
      GRP_MntWines4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntWines2 = -1;
      GRP_MntWines3 = -1;
      GRP_MntWines4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntWines2 = 1;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 0;
   end;
   else do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4 ;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumCatalogPurchases3 = 1;
      GRP_NumCatalogPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumCatalogPurchases3 = -1;
      GRP_NumCatalogPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumCatalogPurchases3 = 0;
      GRP_NumCatalogPurchases4 = 1;
   end;
   else do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4 ;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_NumDistPurchases2 = -1;
      GRP_NumDistPurchases3 = -1;
      GRP_NumDistPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumDistPurchases2 = 1;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 1;
      GRP_NumDistPurchases4 = 0;
   end;
   else do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4 ;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 1;
      GRP_NumWebPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumWebPurchases2 = -1;
      GRP_NumWebPurchases3 = -1;
      GRP_NumWebPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumWebPurchases2 = 1;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 0;
   end;
   else do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 ;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 1;
      GRP_RFMstat4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RFMstat2 = -1;
      GRP_RFMstat3 = -1;
      GRP_RFMstat4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RFMstat2 = 1;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 0;
   end;
   else do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 ;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 1;
      GRP_RMntFrq4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RMntFrq2 = -1;
      GRP_RMntFrq3 = -1;
      GRP_RMntFrq4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RMntFrq2 = 1;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 0;
   end;
   else do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 ;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Recency2 = -1;
      GRP_Recency3 = -1;
      GRP_Recency4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 0;
      GRP_Recency4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 1;
      GRP_Recency4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Recency2 = 1;
      GRP_Recency3 = 0;
      GRP_Recency4 = 0;
   end;
   else do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.03855897145156 * S_Year_Birth ;
   H12  =      0.4940754340088 * S_Year_Birth ;
   H13  =     0.17524137660647 * S_Year_Birth ;
   H14  =     0.27270757044038 * S_Year_Birth ;
   H15  =    -0.02127353119313 * S_Year_Birth ;
   H16  =    -0.10595973365564 * S_Year_Birth ;
   H17  =    -0.11271332681901 * S_Year_Birth ;
   H11  = H11  +     0.21558790598329 * GRP_AcceptedCmp52
          +    -0.07145572032882 * GRP_Frq2  +     0.09268595548153 * GRP_Frq3
          +    -0.20765463263399 * GRP_Frq4  +    -0.00887637988838 *
        GRP_Income2  +    -0.34198008097003 * GRP_Income3
          +     0.00518173450113 * GRP_Income4  +     0.17153998784849 *
        GRP_Mnt2  +    -0.03282863464194 * GRP_Mnt3  +     0.15479242768387 *
        GRP_Mnt4  +    -0.14566682947772 * GRP_MntFishProducts2
          +    -0.04697385312971 * GRP_MntFishProducts3
          +     0.05477300056491 * GRP_MntFishProducts4
          +    -0.21182877070793 * GRP_MntGoldProds2
          +    -0.06202001203906 * GRP_MntGoldProds3
          +    -0.23297283739715 * GRP_MntGoldProds4
          +    -0.27072080481215 * GRP_MntMeatProducts2
          +     -0.0879595975531 * GRP_MntMeatProducts3
          +     0.01711044358319 * GRP_MntMeatProducts4
          +     0.01568057691806 * GRP_MntWines2  +    -0.14454572309741 *
        GRP_MntWines3  +      0.1665968837033 * GRP_MntWines4
          +    -0.24980039994544 * GRP_NumCatalogPurchases3
          +    -0.00199030871063 * GRP_NumCatalogPurchases4
          +     0.11565917560156 * GRP_NumDistPurchases2
          +      0.1678532898895 * GRP_NumDistPurchases3
          +     -0.0338568889009 * GRP_NumDistPurchases4
          +     0.09970745707934 * GRP_NumWebPurchases2
          +     0.02961221360107 * GRP_NumWebPurchases3
          +     0.02261054892411 * GRP_NumWebPurchases4
          +     0.22891892518291 * GRP_RFMstat2  +     0.30720492174411 *
        GRP_RFMstat3  +     0.02558392907316 * GRP_RFMstat4
          +    -0.22752513596954 * GRP_RMntFrq2  +    -0.11010023712096 *
        GRP_RMntFrq3  +    -0.29294961809478 * GRP_RMntFrq4
          +     0.17323450297234 * GRP_Recency2  +    -0.02999008104866 *
        GRP_Recency3  +    -0.07522056103469 * GRP_Recency4 ;
   H12  = H12  +    -0.17475665685155 * GRP_AcceptedCmp52
          +     0.39850686717751 * GRP_Frq2  +     0.21273190324396 * GRP_Frq3
          +    -0.04292229763335 * GRP_Frq4  +     0.48189221687125 *
        GRP_Income2  +       0.757675062227 * GRP_Income3
          +    -0.31438345261512 * GRP_Income4  +     0.08884755999997 *
        GRP_Mnt2  +     0.02891204793625 * GRP_Mnt3  +    -0.11500381143203 *
        GRP_Mnt4  +     0.47755891441547 * GRP_MntFishProducts2
          +     0.26645530981311 * GRP_MntFishProducts3
          +    -0.17631072283513 * GRP_MntFishProducts4
          +    -0.35439521021691 * GRP_MntGoldProds2
          +     0.11419663880206 * GRP_MntGoldProds3
          +     0.07288749113866 * GRP_MntGoldProds4
          +    -0.52191822126159 * GRP_MntMeatProducts2
          +    -0.08421627788812 * GRP_MntMeatProducts3
          +    -0.15930642038763 * GRP_MntMeatProducts4
          +     0.17420985773045 * GRP_MntWines2  +     0.21257483876123 *
        GRP_MntWines3  +    -0.13198840161443 * GRP_MntWines4
          +    -0.24725403471973 * GRP_NumCatalogPurchases3
          +     0.28574938745998 * GRP_NumCatalogPurchases4
          +     -0.4878996299474 * GRP_NumDistPurchases2
          +     0.10139595392447 * GRP_NumDistPurchases3
          +     0.05251891244468 * GRP_NumDistPurchases4
          +    -0.18486003226007 * GRP_NumWebPurchases2
          +      0.0263831646971 * GRP_NumWebPurchases3
          +     0.26495059708503 * GRP_NumWebPurchases4
          +    -0.16580006605432 * GRP_RFMstat2  +    -0.12537703875848 *
        GRP_RFMstat3  +      -0.100652416931 * GRP_RFMstat4
          +    -0.00913931308958 * GRP_RMntFrq2  +    -0.15758837200974 *
        GRP_RMntFrq3  +     -0.1198225533702 * GRP_RMntFrq4
          +       1.075902392162 * GRP_Recency2  +     0.44926983542925 *
        GRP_Recency3  +     -0.4970729472837 * GRP_Recency4 ;
   H13  = H13  +     0.00215688122529 * GRP_AcceptedCmp52
          +    -0.01427589791379 * GRP_Frq2  +    -0.13098496868755 * GRP_Frq3
          +    -0.30502313457201 * GRP_Frq4  +    -0.37973462663051 *
        GRP_Income2  +     0.00732780844057 * GRP_Income3
          +     0.53278328894406 * GRP_Income4  +     0.29819966041309 *
        GRP_Mnt2  +     0.25349727466129 * GRP_Mnt3  +     0.10579488290769 *
        GRP_Mnt4  +    -0.09288921771048 * GRP_MntFishProducts2
          +     0.02714802509094 * GRP_MntFishProducts3
          +     0.27119078554613 * GRP_MntFishProducts4
          +     0.19322428614339 * GRP_MntGoldProds2
          +     0.34778546410632 * GRP_MntGoldProds3
          +    -0.06570146779096 * GRP_MntGoldProds4
          +     0.44935275650977 * GRP_MntMeatProducts2
          +     0.00805794344265 * GRP_MntMeatProducts3
          +     0.02445782833023 * GRP_MntMeatProducts4
          +    -0.12082391878766 * GRP_MntWines2  +    -0.28739181733976 *
        GRP_MntWines3  +    -0.12417307544408 * GRP_MntWines4
          +     0.33901531634752 * GRP_NumCatalogPurchases3
          +     -0.0519425405532 * GRP_NumCatalogPurchases4
          +     0.03481806823908 * GRP_NumDistPurchases2
          +      0.0546202479864 * GRP_NumDistPurchases3
          +    -0.05240296080421 * GRP_NumDistPurchases4
          +     0.28307550964921 * GRP_NumWebPurchases2
          +     0.31503543231591 * GRP_NumWebPurchases3
          +     0.24817135719308 * GRP_NumWebPurchases4
          +    -0.05017370187238 * GRP_RFMstat2  +     0.08161239885611 *
        GRP_RFMstat3  +    -0.14085507706312 * GRP_RFMstat4
          +     0.11738278568714 * GRP_RMntFrq2  +     0.28471680928269 *
        GRP_RMntFrq3  +     0.46590886050772 * GRP_RMntFrq4
          +     -0.2318556486679 * GRP_Recency2  +    -0.37508297533514 *
        GRP_Recency3  +     0.05823801065489 * GRP_Recency4 ;
   H14  = H14  +      0.4684617848987 * GRP_AcceptedCmp52
          +    -0.10078363733095 * GRP_Frq2  +     0.12187262992305 * GRP_Frq3
          +     0.06615581853287 * GRP_Frq4  +    -0.37438533196327 *
        GRP_Income2  +    -0.54951239852844 * GRP_Income3
          +     0.42517426076684 * GRP_Income4  +     0.01160451666213 *
        GRP_Mnt2  +    -0.19046851266656 * GRP_Mnt3  +    -0.22599863084471 *
        GRP_Mnt4  +     0.02252915755857 * GRP_MntFishProducts2
          +    -0.08997232581072 * GRP_MntFishProducts3
          +    -0.05669599356928 * GRP_MntFishProducts4
          +      0.2199150131909 * GRP_MntGoldProds2
          +     0.05584571259838 * GRP_MntGoldProds3
          +    -0.13160142309505 * GRP_MntGoldProds4
          +      0.2539849640816 * GRP_MntMeatProducts2
          +     0.29448191059312 * GRP_MntMeatProducts3
          +    -0.33946200154351 * GRP_MntMeatProducts4
          +    -0.47231816370111 * GRP_MntWines2  +    -0.35916844796743 *
        GRP_MntWines3  +     0.15578356288597 * GRP_MntWines4
          +     0.35913140014848 * GRP_NumCatalogPurchases3
          +    -0.07798422379681 * GRP_NumCatalogPurchases4
          +     0.38206153529506 * GRP_NumDistPurchases2
          +     0.08642998303162 * GRP_NumDistPurchases3
          +    -0.00375635377885 * GRP_NumDistPurchases4
          +    -0.04352529411419 * GRP_NumWebPurchases2
          +    -0.17285172586868 * GRP_NumWebPurchases3
          +     0.23030028338396 * GRP_NumWebPurchases4
          +     0.16194254582104 * GRP_RFMstat2  +    -0.03413270353062 *
        GRP_RFMstat3  +    -0.32516629559317 * GRP_RFMstat4
          +    -0.16070809362515 * GRP_RMntFrq2  +    -0.17716471899416 *
        GRP_RMntFrq3  +     0.09335047904411 * GRP_RMntFrq4
          +    -0.92875393407697 * GRP_Recency2  +     0.16068827585896 *
        GRP_Recency3  +     0.41807637211453 * GRP_Recency4 ;
   H15  = H15  +    -0.78481953865912 * GRP_AcceptedCmp52
          +     0.05211963408638 * GRP_Frq2  +     0.24938737986681 * GRP_Frq3
          +    -0.07347952562846 * GRP_Frq4  +    -0.15741135518664 *
        GRP_Income2  +     0.01909378686442 * GRP_Income3
          +    -0.15898085757789 * GRP_Income4  +     0.09202012507046 *
        GRP_Mnt2  +    -0.39641738573024 * GRP_Mnt3  +     0.02885484069701 *
        GRP_Mnt4  +     0.29554161293423 * GRP_MntFishProducts2
          +    -0.04439366722112 * GRP_MntFishProducts3
          +    -0.22939355735301 * GRP_MntFishProducts4
          +    -0.00367144103801 * GRP_MntGoldProds2
          +      -0.033315128385 * GRP_MntGoldProds3
          +     0.10655545066126 * GRP_MntGoldProds4
          +     0.04927093675686 * GRP_MntMeatProducts2
          +    -0.20156680946257 * GRP_MntMeatProducts3
          +     0.29394273234417 * GRP_MntMeatProducts4
          +     0.27324472738231 * GRP_MntWines2  +       0.398830803883 *
        GRP_MntWines3  +    -0.16588038849208 * GRP_MntWines4
          +     -0.3438340194477 * GRP_NumCatalogPurchases3
          +    -0.37438590488645 * GRP_NumCatalogPurchases4
          +    -0.42285816542086 * GRP_NumDistPurchases2
          +     -0.1008716650505 * GRP_NumDistPurchases3
          +    -0.42793112700917 * GRP_NumDistPurchases4
          +    -0.06792665579186 * GRP_NumWebPurchases2
          +     0.37113277513001 * GRP_NumWebPurchases3
          +     0.05720653023952 * GRP_NumWebPurchases4
          +    -0.30997814005221 * GRP_RFMstat2  +     0.06219993861842 *
        GRP_RFMstat3  +    -0.22600753085668 * GRP_RFMstat4
          +    -0.31041957734532 * GRP_RMntFrq2  +     0.25053172234721 *
        GRP_RMntFrq3  +     0.15983683107051 * GRP_RMntFrq4
          +     0.52797823019932 * GRP_Recency2  +     0.11382874879823 *
        GRP_Recency3  +    -0.22166533511817 * GRP_Recency4 ;
   H16  = H16  +      0.7107136456569 * GRP_AcceptedCmp52
          +     -0.4751898387651 * GRP_Frq2  +    -0.11277060686411 * GRP_Frq3
          +     0.15821547082299 * GRP_Frq4  +    -0.45945049231995 *
        GRP_Income2  +    -0.18413512635176 * GRP_Income3
          +     0.39594738835509 * GRP_Income4  +    -0.15472205523822 *
        GRP_Mnt2  +     0.02844181224363 * GRP_Mnt3  +     0.45435843401555 *
        GRP_Mnt4  +    -0.29220588593813 * GRP_MntFishProducts2
          +     0.04340555393469 * GRP_MntFishProducts3
          +    -0.20048219926361 * GRP_MntFishProducts4
          +     0.16101452165456 * GRP_MntGoldProds2
          +    -0.04467647211336 * GRP_MntGoldProds3
          +     0.32142013598241 * GRP_MntGoldProds4
          +     0.29741565154233 * GRP_MntMeatProducts2
          +    -0.00264678222241 * GRP_MntMeatProducts3
          +    -0.11596499325048 * GRP_MntMeatProducts4
          +    -0.29849043995136 * GRP_MntWines2  +     0.14756452272338 *
        GRP_MntWines3  +     0.48995265672675 * GRP_MntWines4
          +     0.80854583627117 * GRP_NumCatalogPurchases3
          +     0.14001888431357 * GRP_NumCatalogPurchases4
          +     0.36107050137299 * GRP_NumDistPurchases2
          +    -0.10375572120121 * GRP_NumDistPurchases3
          +     0.10557004956787 * GRP_NumDistPurchases4
          +     0.04608069099876 * GRP_NumWebPurchases2
          +     0.15561947954396 * GRP_NumWebPurchases3
          +    -0.01081470092004 * GRP_NumWebPurchases4
          +     0.21994454623245 * GRP_RFMstat2  +    -0.08858421895818 *
        GRP_RFMstat3  +    -0.13608887793525 * GRP_RFMstat4
          +     0.07482010458977 * GRP_RMntFrq2  +    -0.11874760292742 *
        GRP_RMntFrq3  +     0.56887215594366 * GRP_RMntFrq4
          +    -0.13548983954455 * GRP_Recency2  +    -0.25036935235639 *
        GRP_Recency3  +     -0.0282277663071 * GRP_Recency4 ;
   H17  = H17  +    -0.06745892596619 * GRP_AcceptedCmp52
          +    -0.09506194345469 * GRP_Frq2  +    -0.29707644715885 * GRP_Frq3
          +    -0.06874693052001 * GRP_Frq4  +    -0.08949373241741 *
        GRP_Income2  +     0.02965579603049 * GRP_Income3
          +    -0.02192829727213 * GRP_Income4  +     0.30180973300088 *
        GRP_Mnt2  +    -0.10648502526616 * GRP_Mnt3  +     0.07588844839465 *
        GRP_Mnt4  +    -0.30524623655199 * GRP_MntFishProducts2
          +    -0.20032703571491 * GRP_MntFishProducts3
          +    -0.08348811352746 * GRP_MntFishProducts4
          +    -0.00744131870881 * GRP_MntGoldProds2
          +    -0.27347309859096 * GRP_MntGoldProds3
          +    -0.04458870469416 * GRP_MntGoldProds4
          +     0.17538261434498 * GRP_MntMeatProducts2
          +    -0.08059547298843 * GRP_MntMeatProducts3
          +     0.03113249898233 * GRP_MntMeatProducts4
          +    -0.23690909413276 * GRP_MntWines2  +    -0.01511980231776 *
        GRP_MntWines3  +     -0.2825327824317 * GRP_MntWines4
          +     0.13919784888607 * GRP_NumCatalogPurchases3
          +    -0.10871281978714 * GRP_NumCatalogPurchases4
          +     0.20540014620209 * GRP_NumDistPurchases2
          +     0.17744784873298 * GRP_NumDistPurchases3
          +      -0.003486430833 * GRP_NumDistPurchases4
          +    -0.04863967797645 * GRP_NumWebPurchases2
          +     0.07245829152192 * GRP_NumWebPurchases3
          +    -0.27395606297099 * GRP_NumWebPurchases4
          +    -0.14496279180087 * GRP_RFMstat2  +     0.28224463929838 *
        GRP_RFMstat3  +     0.26720059295202 * GRP_RFMstat4
          +    -0.07120881723264 * GRP_RMntFrq2  +     0.16350065828319 *
        GRP_RMntFrq3  +      0.3117297070285 * GRP_RMntFrq4
          +    -0.52884474877094 * GRP_Recency2  +    -0.17937099376746 *
        GRP_Recency3  +     -0.0157357289132 * GRP_Recency4 ;
   H11  =    -0.76467628027618 + H11 ;
   H12  =    -0.03405517571825 + H12 ;
   H13  =    -0.32845676351839 + H13 ;
   H14  =     0.08379615404181 + H14 ;
   H15  =    -0.77228291932436 + H15 ;
   H16  =    -0.77356855332279 + H16 ;
   H17  =     0.45067845230796 + H17 ;
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
   P_DepVar1  =    -0.15999450347654 * H11  +     1.35667407296837 * H12
          +    -0.71419530867579 * H13  +     -1.0947746264744 * H14
          +     0.98315214007209 * H15  +    -1.32163386678746 * H16
          +    -0.29329090231091 * H17 ;
   P_DepVar1  =    -1.66210022161101 + P_DepVar1 ;
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
* Renaming variables for Neural18;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural18;
*------------------------------------------------------------*;
drop Neural18_P_DepVar1;
Neural18_P_DepVar1 = P_DepVar1;
drop Neural18_P_DepVar0;
Neural18_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural18;
*------------------------------------------------------------*;
length Neural18_WARN_ $4;
drop Neural18_WARN_;
Neural18_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl17: Scoring Code of model 4 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg3;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG3DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG3DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check Year_Birth for missing values ;
if missing( Year_Birth ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop _1_0 ;
if missing( GRP_AcceptedCmp5 ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '3'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop _2_0 _2_1 _2_2 ;
if missing( GRP_Frq ) then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _2_0 = -1;
      _2_1 = -1;
      _2_2 = -1;
   end;
   else if _dm12 = '3'  then do;
      _2_0 = 0;
      _2_1 = 1;
      _2_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = 0;
      _2_1 = 0;
      _2_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _2_0 = 1;
      _2_1 = 0;
      _2_2 = 0;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      _2_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop _3_0 _3_1 _3_2 ;
if missing( GRP_Income ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _3_0 = -1;
      _3_1 = -1;
      _3_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _3_0 = 0;
      _3_1 = 0;
      _3_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = 0;
      _3_1 = 1;
      _3_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _3_0 = 1;
      _3_1 = 0;
      _3_2 = 0;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop _5_0 _5_1 _5_2 ;
if missing( GRP_MntFishProducts ) then do;
   _5_0 = .;
   _5_1 = .;
   _5_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _5_0 = 0;
      _5_1 = 1;
      _5_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _5_0 = -1;
      _5_1 = -1;
      _5_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _5_0 = 0;
      _5_1 = 0;
      _5_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _5_0 = 1;
      _5_1 = 0;
      _5_2 = 0;
   end;
   else do;
      _5_0 = .;
      _5_1 = .;
      _5_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop _7_0 _7_1 _7_2 ;
if missing( GRP_MntMeatProducts ) then do;
   _7_0 = .;
   _7_1 = .;
   _7_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _7_0 = 0;
      _7_1 = 1;
      _7_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _7_0 = 0;
      _7_1 = 0;
      _7_2 = 1;
   end;
   else if _dm12 = '5'  then do;
      _7_0 = -1;
      _7_1 = -1;
      _7_2 = -1;
   end;
   else if _dm12 = '2'  then do;
      _7_0 = 1;
      _7_1 = 0;
      _7_2 = 0;
   end;
   else do;
      _7_0 = .;
      _7_1 = .;
      _7_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop _8_0 _8_1 _8_2 ;
if missing( GRP_MntWines ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _8_0 = 0;
      _8_1 = 1;
      _8_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _8_0 = -1;
      _8_1 = -1;
      _8_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _8_0 = 0;
      _8_1 = 0;
      _8_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _8_0 = 1;
      _8_1 = 0;
      _8_2 = 0;
   end;
   else do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop _9_0 _9_1 ;
if missing( GRP_NumCatalogPurchases ) then do;
   _9_0 = .;
   _9_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _9_0 = 1;
      _9_1 = 0;
   end;
   else if _dm12 = '5'  then do;
      _9_0 = -1;
      _9_1 = -1;
   end;
   else if _dm12 = '4'  then do;
      _9_0 = 0;
      _9_1 = 1;
   end;
   else do;
      _9_0 = .;
      _9_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop _10_0 _10_1 _10_2 ;
if missing( GRP_NumDistPurchases ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _10_0 = -1;
      _10_1 = -1;
      _10_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _10_0 = 0;
      _10_1 = 0;
      _10_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _10_0 = 1;
      _10_1 = 0;
      _10_2 = 0;
   end;
   else if _dm12 = '3'  then do;
      _10_0 = 0;
      _10_1 = 1;
      _10_2 = 0;
   end;
   else do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop _13_0 _13_1 _13_2 ;
if missing( GRP_RMntFrq ) then do;
   _13_0 = .;
   _13_1 = .;
   _13_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _13_0 = 0;
      _13_1 = 1;
      _13_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _13_0 = -1;
      _13_1 = -1;
      _13_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _13_0 = 0;
      _13_1 = 0;
      _13_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _13_0 = 1;
      _13_1 = 0;
      _13_2 = 0;
   end;
   else do;
      _13_0 = .;
      _13_1 = .;
      _13_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop _14_0 _14_1 _14_2 ;
if missing( GRP_Recency ) then do;
   _14_0 = .;
   _14_1 = .;
   _14_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _14_0 = -1;
      _14_1 = -1;
      _14_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _14_0 = 0;
      _14_1 = 0;
      _14_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _14_0 = 0;
      _14_1 = 1;
      _14_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _14_0 = 1;
      _14_1 = 0;
      _14_2 = 0;
   end;
   else do;
      _14_0 = .;
      _14_1 = .;
      _14_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    -1.0202735142883) * _TEMP * _1_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (    1.96135216788678) * _TEMP * _2_0;
_LP0 = _LP0 + (    0.16052598190077) * _TEMP * _2_1;
_LP0 = _LP0 + (   -0.70902116030282) * _TEMP * _2_2;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (    0.93791732843579) * _TEMP * _3_0;
_LP0 = _LP0 + (    0.86323578315443) * _TEMP * _3_1;
_LP0 = _LP0 + (   -0.93701763797667) * _TEMP * _3_2;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (     0.6826557743697) * _TEMP * _5_0;
_LP0 = _LP0 + (    0.02285788144903) * _TEMP * _5_1;
_LP0 = _LP0 + (   -0.06609528477722) * _TEMP * _5_2;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.44582935530291) * _TEMP * _7_0;
_LP0 = _LP0 + (   -0.21318741203534) * _TEMP * _7_1;
_LP0 = _LP0 + (    0.53364168349885) * _TEMP * _7_2;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    0.98273321190928) * _TEMP * _8_0;
_LP0 = _LP0 + (      0.432298434838) * _TEMP * _8_1;
_LP0 = _LP0 + (   -0.57365050311778) * _TEMP * _8_2;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.15145054763997) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.03505087718511) * _TEMP * _9_1;

***  Effect: GRP_NumDistPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -2.65890505222228) * _TEMP * _10_0;
_LP0 = _LP0 + (     0.0545239904585) * _TEMP * _10_1;
_LP0 = _LP0 + (    0.51990032635141) * _TEMP * _10_2;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.25494301084801) * _TEMP * _13_0;
_LP0 = _LP0 + (    0.02802747054775) * _TEMP * _13_1;
_LP0 = _LP0 + (   -0.40273598284868) * _TEMP * _13_2;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    1.94607798996867) * _TEMP * _14_0;
_LP0 = _LP0 + (    0.53257949184685) * _TEMP * _14_1;
_LP0 = _LP0 + (   -0.62881974341908) * _TEMP * _14_2;

***  Effect: Year_Birth ;
_TEMP = Year_Birth ;
_LP0 = _LP0 + (    0.01824806947783 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -37.6992883159803 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG3DR1:


*** Posterior Probabilities and Predicted Level;
label P_DepVar1 = 'Predicted: DepVar=1' ;
label P_DepVar0 = 'Predicted: DepVar=0' ;
P_DepVar1 = _P0;
_MAXP = _P0;
_IY = 1;
P_DepVar0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_DepVar = REG3DRF[_IY];
U_DepVar = REG3DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
* Renaming variables for Reg3;
*------------------------------------------------------------*;
* Renaming Posterior variables for Reg3;
*------------------------------------------------------------*;
drop Reg3_P_DepVar1;
Reg3_P_DepVar1 = P_DepVar1;
drop Reg3_P_DepVar0;
Reg3_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Reg3;
*------------------------------------------------------------*;
length Reg3_WARN_ $4;
drop Reg3_WARN_;
Reg3_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl17: Scoring Code of model 5 of 5;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg7;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG7DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG7DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check Year_Birth for missing values ;
if missing( Year_Birth ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop _1_0 ;
if missing( GRP_AcceptedCmp5 ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '3'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop _2_0 _2_1 _2_2 ;
if missing( GRP_Frq ) then do;
   _2_0 = .;
   _2_1 = .;
   _2_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _2_0 = -1;
      _2_1 = -1;
      _2_2 = -1;
   end;
   else if _dm12 = '3'  then do;
      _2_0 = 0;
      _2_1 = 1;
      _2_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = 0;
      _2_1 = 0;
      _2_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _2_0 = 1;
      _2_1 = 0;
      _2_2 = 0;
   end;
   else do;
      _2_0 = .;
      _2_1 = .;
      _2_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop _3_0 _3_1 _3_2 ;
if missing( GRP_Income ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _3_0 = -1;
      _3_1 = -1;
      _3_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _3_0 = 0;
      _3_1 = 0;
      _3_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _3_0 = 0;
      _3_1 = 1;
      _3_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _3_0 = 1;
      _3_1 = 0;
      _3_2 = 0;
   end;
   else do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop _5_0 _5_1 _5_2 ;
if missing( GRP_MntFishProducts ) then do;
   _5_0 = .;
   _5_1 = .;
   _5_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _5_0 = 0;
      _5_1 = 1;
      _5_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _5_0 = -1;
      _5_1 = -1;
      _5_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _5_0 = 0;
      _5_1 = 0;
      _5_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _5_0 = 1;
      _5_1 = 0;
      _5_2 = 0;
   end;
   else do;
      _5_0 = .;
      _5_1 = .;
      _5_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop _7_0 _7_1 _7_2 ;
if missing( GRP_MntMeatProducts ) then do;
   _7_0 = .;
   _7_1 = .;
   _7_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _7_0 = 0;
      _7_1 = 1;
      _7_2 = 0;
   end;
   else if _dm12 = '4'  then do;
      _7_0 = 0;
      _7_1 = 0;
      _7_2 = 1;
   end;
   else if _dm12 = '5'  then do;
      _7_0 = -1;
      _7_1 = -1;
      _7_2 = -1;
   end;
   else if _dm12 = '2'  then do;
      _7_0 = 1;
      _7_1 = 0;
      _7_2 = 0;
   end;
   else do;
      _7_0 = .;
      _7_1 = .;
      _7_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop _8_0 _8_1 _8_2 ;
if missing( GRP_MntWines ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _8_0 = 0;
      _8_1 = 1;
      _8_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _8_0 = -1;
      _8_1 = -1;
      _8_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _8_0 = 0;
      _8_1 = 0;
      _8_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _8_0 = 1;
      _8_1 = 0;
      _8_2 = 0;
   end;
   else do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop _9_0 _9_1 ;
if missing( GRP_NumCatalogPurchases ) then do;
   _9_0 = .;
   _9_1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _9_0 = 1;
      _9_1 = 0;
   end;
   else if _dm12 = '5'  then do;
      _9_0 = -1;
      _9_1 = -1;
   end;
   else if _dm12 = '4'  then do;
      _9_0 = 0;
      _9_1 = 1;
   end;
   else do;
      _9_0 = .;
      _9_1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop _10_0 _10_1 _10_2 ;
if missing( GRP_NumDistPurchases ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _10_0 = -1;
      _10_1 = -1;
      _10_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _10_0 = 0;
      _10_1 = 0;
      _10_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _10_0 = 1;
      _10_1 = 0;
      _10_2 = 0;
   end;
   else if _dm12 = '3'  then do;
      _10_0 = 0;
      _10_1 = 1;
      _10_2 = 0;
   end;
   else do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop _13_0 _13_1 _13_2 ;
if missing( GRP_RMntFrq ) then do;
   _13_0 = .;
   _13_1 = .;
   _13_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _13_0 = 0;
      _13_1 = 1;
      _13_2 = 0;
   end;
   else if _dm12 = '5'  then do;
      _13_0 = -1;
      _13_1 = -1;
      _13_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _13_0 = 0;
      _13_1 = 0;
      _13_2 = 1;
   end;
   else if _dm12 = '2'  then do;
      _13_0 = 1;
      _13_1 = 0;
      _13_2 = 0;
   end;
   else do;
      _13_0 = .;
      _13_1 = .;
      _13_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop _14_0 _14_1 _14_2 ;
if missing( GRP_Recency ) then do;
   _14_0 = .;
   _14_1 = .;
   _14_2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      _14_0 = -1;
      _14_1 = -1;
      _14_2 = -1;
   end;
   else if _dm12 = '4'  then do;
      _14_0 = 0;
      _14_1 = 0;
      _14_2 = 1;
   end;
   else if _dm12 = '3'  then do;
      _14_0 = 0;
      _14_1 = 1;
      _14_2 = 0;
   end;
   else if _dm12 = '2'  then do;
      _14_0 = 1;
      _14_1 = 0;
      _14_2 = 0;
   end;
   else do;
      _14_0 = .;
      _14_1 = .;
      _14_2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG7DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.5862337869734) * _TEMP * _1_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (     1.0565693238421) * _TEMP * _2_0;
_LP0 = _LP0 + (     0.0911336121088) * _TEMP * _2_1;
_LP0 = _LP0 + (   -0.37448220273968) * _TEMP * _2_2;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (    0.51658584340625) * _TEMP * _3_0;
_LP0 = _LP0 + (    0.48505772489262) * _TEMP * _3_1;
_LP0 = _LP0 + (   -0.50854630566525) * _TEMP * _3_2;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.38994498659965) * _TEMP * _5_0;
_LP0 = _LP0 + (    0.03146325606998) * _TEMP * _5_1;
_LP0 = _LP0 + (   -0.05372169204837) * _TEMP * _5_2;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.79733877870259) * _TEMP * _7_0;
_LP0 = _LP0 + (   -0.15003183676105) * _TEMP * _7_1;
_LP0 = _LP0 + (    0.31191597751128) * _TEMP * _7_2;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    0.53434964580952) * _TEMP * _8_0;
_LP0 = _LP0 + (    0.22167667253067) * _TEMP * _8_1;
_LP0 = _LP0 + (     -0.305489910536) * _TEMP * _8_2;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (     -0.629899271763) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.03240844395355) * _TEMP * _9_1;

***  Effect: GRP_NumDistPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.42622019893988) * _TEMP * _10_0;
_LP0 = _LP0 + (    0.05466498093201) * _TEMP * _10_1;
_LP0 = _LP0 + (    0.25182489000571) * _TEMP * _10_2;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.14979245852204) * _TEMP * _13_0;
_LP0 = _LP0 + (     0.0056028143187) * _TEMP * _13_1;
_LP0 = _LP0 + (   -0.23315930182624) * _TEMP * _13_2;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    1.06974976023651) * _TEMP * _14_0;
_LP0 = _LP0 + (    0.29139327664531) * _TEMP * _14_1;
_LP0 = _LP0 + (   -0.34742570667526) * _TEMP * _14_2;

***  Effect: Year_Birth ;
_TEMP = Year_Birth ;
_LP0 = _LP0 + (    0.01045707390649 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -21.5603180840073) + _LP0);
_P1 = 1.0 - _P0;

REG7DR1:


*** Posterior Probabilities and Predicted Level;
label P_DepVar1 = 'Predicted: DepVar=1' ;
label P_DepVar0 = 'Predicted: DepVar=0' ;
P_DepVar1 = _P0;
_MAXP = _P0;
_IY = 1;
P_DepVar0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_DepVar = REG7DRF[_IY];
U_DepVar = REG7DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
* Renaming variables for Reg7;
*------------------------------------------------------------*;
* Renaming Posterior variables for Reg7;
*------------------------------------------------------------*;
drop Reg7_P_DepVar1;
Reg7_P_DepVar1 = P_DepVar1;
drop Reg7_P_DepVar0;
Reg7_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Reg7;
*------------------------------------------------------------*;
length Reg7_WARN_ $4;
drop Reg7_WARN_;
Reg7_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl17: Average Posteriors of 5 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural21_P_DepVar1 +
Neural22_P_DepVar1 +
Neural18_P_DepVar1 +
Reg3_P_DepVar1 +
Reg7_P_DepVar1
)/5;
P_DepVar0 = (
Neural21_P_DepVar0 +
Neural22_P_DepVar0 +
Neural18_P_DepVar0 +
Reg3_P_DepVar0 +
Reg7_P_DepVar0
)/5;
*------------------------------------------------------------*;
* Ensmbl17: Computing Classification Vars;
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
* Ensmbl17: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl17: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL21_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL21_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL21_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL21_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL22_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL22_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL22_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL22_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL18_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL18_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL18_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL18_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
