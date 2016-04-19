*------------------------------------------------------------*;
* Ensmbl3: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl3: Scoring Code of model 1 of 10;
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

*** Generate dummy variables for DepVar ;
drop _Y ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   _Y = .;
end;
else do;
   if F_DepVar = '0'  then do;
      _Y = 1;
   end;
   else if F_DepVar = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

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

*** Residuals;
if (_Y = .) then do;
   R_DepVar1 = .;
   R_DepVar0 = .;
end;
else do;
    label R_DepVar1 = 'Residual: DepVar=1' ;
    label R_DepVar0 = 'Residual: DepVar=0' ;
   R_DepVar1 = - _P0;
   R_DepVar0 = - _P1;
   select( _Y );
      when (0)  R_DepVar1 = R_DepVar1 + 1;
      when (1)  R_DepVar0 = R_DepVar0 + 1;
   end;
end;

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
* Ensmbl3: Scoring Code of model 2 of 10;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Decision Tree;
* TYPE: MODEL;
* NODE: Tree3;
*------------------------------------------------------------*;
****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_DepVar  $   12;
LENGTH I_DepVar  $   12;
LENGTH _WARN_  $    4;

******              LABELS FOR NEW VARIABLES              ******;
LABEL _NODE_  = 'Node' ;
LABEL _LEAF_  = 'Leaf' ;
LABEL P_DepVar0  = 'Predicted: DepVar=0' ;
LABEL P_DepVar1  = 'Predicted: DepVar=1' ;
LABEL Q_DepVar0  = 'Unadjusted P: DepVar=0' ;
LABEL Q_DepVar1  = 'Unadjusted P: DepVar=1' ;
LABEL V_DepVar0  = 'Validated: DepVar=0' ;
LABEL V_DepVar1  = 'Validated: DepVar=1' ;
LABEL R_DepVar0  = 'Residual: DepVar=0' ;
LABEL R_DepVar1  = 'Residual: DepVar=1' ;
LABEL F_DepVar  = 'From: DepVar' ;
LABEL I_DepVar  = 'Into: DepVar' ;
LABEL U_DepVar  = 'Unnormalized Into: DepVar' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( DepVar , BEST.);
 %DMNORMCP( _ARBFMT_12, F_DepVar );

******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_12 = PUT( GRP_RFMstat , BEST12.);
 %DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('5' ) THEN DO;
  _ARBFMT_12 = PUT( GRP_AcceptedCmp5 , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('3' ) THEN DO;
    _ARBFMT_12 = PUT( GRP_Recency , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ) THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =     0.11111111111111;
      P_DepVar1  =     0.88888888888888;
      Q_DepVar0  =     0.11111111111111;
      Q_DepVar1  =     0.88888888888888;
      V_DepVar0  =                  0.1;
      V_DepVar1  =                  0.9;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _NODE_  =                    9;
      _LEAF_  =                    2;
      P_DepVar0  =     0.54430379746835;
      P_DepVar1  =     0.45569620253164;
      Q_DepVar0  =     0.54430379746835;
      Q_DepVar1  =     0.45569620253164;
      V_DepVar0  =     0.56756756756756;
      V_DepVar1  =     0.43243243243243;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    _ARBFMT_12 = PUT( GRP_Recency , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'5' ,'4' ) THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    5;
      P_DepVar0  =     0.82027649769585;
      P_DepVar1  =     0.17972350230414;
      Q_DepVar0  =     0.82027649769585;
      Q_DepVar1  =     0.17972350230414;
      V_DepVar0  =     0.82222222222222;
      V_DepVar1  =     0.17777777777777;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    ELSE DO;
      _ARBFMT_12 = PUT( GRP_NumCatalogPurchases , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('5' ) THEN DO;
        _NODE_  =                   18;
        _LEAF_  =                    3;
        P_DepVar0  =      0.4758064516129;
        P_DepVar1  =     0.52419354838709;
        Q_DepVar0  =      0.4758064516129;
        Q_DepVar1  =     0.52419354838709;
        V_DepVar0  =     0.48333333333333;
        V_DepVar1  =     0.51666666666666;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   19;
        _LEAF_  =                    4;
        P_DepVar0  =            0.7734375;
        P_DepVar1  =            0.2265625;
        Q_DepVar0  =            0.7734375;
        Q_DepVar1  =            0.2265625;
        V_DepVar0  =     0.75510204081632;
        V_DepVar1  =     0.24489795918367;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_12 = PUT( GRP_Recency , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('2' ) THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                    9;
    P_DepVar0  =     0.79078014184397;
    P_DepVar1  =     0.20921985815602;
    Q_DepVar0  =     0.79078014184397;
    Q_DepVar1  =     0.20921985815602;
    V_DepVar0  =     0.72268907563025;
    V_DepVar1  =     0.27731092436974;
    I_DepVar  = '0' ;
    U_DepVar  =                    0;
    END;
  ELSE DO;
    _ARBFMT_12 = PUT( GRP_AcceptedCmp5 , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ) THEN DO;
      _ARBFMT_12 = PUT( GRP_MntWines , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
        _NODE_  =                   22;
        _LEAF_  =                    6;
        P_DepVar0  =     0.26315789473684;
        P_DepVar1  =     0.73684210526315;
        Q_DepVar0  =     0.26315789473684;
        Q_DepVar1  =     0.73684210526315;
        V_DepVar0  =     0.28571428571428;
        V_DepVar1  =     0.71428571428571;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   23;
        _LEAF_  =                    7;
        P_DepVar0  =     0.81818181818181;
        P_DepVar1  =     0.18181818181818;
        Q_DepVar0  =     0.81818181818181;
        Q_DepVar1  =     0.18181818181818;
        V_DepVar0  =     0.66666666666666;
        V_DepVar1  =     0.33333333333333;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    ELSE DO;
      _NODE_  =                   13;
      _LEAF_  =                    8;
      P_DepVar0  =     0.95194986072423;
      P_DepVar1  =     0.04805013927576;
      Q_DepVar0  =     0.95194986072423;
      Q_DepVar1  =     0.04805013927576;
      V_DepVar0  =     0.95980707395498;
      V_DepVar1  =     0.04019292604501;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  END;

*****  RESIDUALS R_ *************;
IF  F_DepVar  NE '0'
AND F_DepVar  NE '1'  THEN DO;
        R_DepVar0  = .;
        R_DepVar1  = .;
 END;
 ELSE DO;
       R_DepVar0  =  -P_DepVar0 ;
       R_DepVar1  =  -P_DepVar1 ;
       SELECT( F_DepVar  );
          WHEN( '0'  ) R_DepVar0  = R_DepVar0  +1;
          WHEN( '1'  ) R_DepVar1  = R_DepVar1  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
drop _LEAF_;
* Renaming variables for Tree3;
*------------------------------------------------------------*;
* Renaming Posterior variables for Tree3;
*------------------------------------------------------------*;
drop Tree3_P_DepVar1;
Tree3_P_DepVar1 = P_DepVar1;
drop Tree3_P_DepVar0;
Tree3_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Tree3;
*------------------------------------------------------------*;
length Tree3_WARN_ $4;
drop Tree3_WARN_;
Tree3_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl3: Scoring Code of model 3 of 10;
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
      F_DepVar  $ 12
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

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
* Ensmbl3: Scoring Code of model 4 of 10;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural23;
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

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   H11  =     0.25397263809886 * S_Year_Birth ;
   H12  =     0.05075762370892 * S_Year_Birth ;
   H13  =     0.04360472272597 * S_Year_Birth ;
   H14  =     0.01387196819865 * S_Year_Birth ;
   H15  =     0.05734148733166 * S_Year_Birth ;
   H16  =     0.07449261080848 * S_Year_Birth ;
   H11  = H11  +    -0.13483168537737 * GRP_AcceptedCmp52
          +     0.02321007103238 * GRP_Frq2  +      0.2993754491201 * GRP_Frq3
          +     0.03188619345426 * GRP_Frq4  +     0.23837524440518 *
        GRP_Income2  +    -0.02988101686846 * GRP_Income3
          +    -0.04314945794282 * GRP_Income4  +      0.0797760707666 *
        GRP_Mnt2  +    -0.02272798443967 * GRP_Mnt3  +    -0.37386810467628 *
        GRP_Mnt4  +      0.0916244532169 * GRP_MntFishProducts2
          +    -0.08991361976323 * GRP_MntFishProducts3
          +    -0.12439533124432 * GRP_MntFishProducts4
          +    -0.38906628986229 * GRP_MntGoldProds2
          +     0.02112411721097 * GRP_MntGoldProds3
          +     0.05560214439156 * GRP_MntGoldProds4
          +     0.07558086835487 * GRP_MntMeatProducts2
          +    -0.24998452825562 * GRP_MntMeatProducts3
          +    -0.11030888417179 * GRP_MntMeatProducts4
          +     0.13229832861513 * GRP_MntWines2  +     0.50793143142609 *
        GRP_MntWines3  +    -0.26273353961061 * GRP_MntWines4
          +    -0.02587175944603 * GRP_NumCatalogPurchases3
          +    -0.07172373139956 * GRP_NumCatalogPurchases4
          +    -0.26905740590447 * GRP_NumDistPurchases2
          +     0.06889154687101 * GRP_NumDistPurchases3
          +    -0.31591167055503 * GRP_NumDistPurchases4
          +    -0.26862765566252 * GRP_NumWebPurchases2
          +     0.01579611280005 * GRP_NumWebPurchases3
          +    -0.06884702149074 * GRP_NumWebPurchases4
          +     0.19400469320488 * GRP_RFMstat2  +     0.32533875784776 *
        GRP_RFMstat3  +    -0.13730222015702 * GRP_RFMstat4
          +    -0.21360134050893 * GRP_RMntFrq2  +     0.10280382689873 *
        GRP_RMntFrq3  +    -0.16238020658392 * GRP_RMntFrq4
          +     0.38795494894841 * GRP_Recency2  +    -0.18447788823185 *
        GRP_Recency3  +    -0.44523742460939 * GRP_Recency4 ;
   H12  = H12  +    -0.44240901099215 * GRP_AcceptedCmp52
          +     0.35451936529374 * GRP_Frq2  +     0.01466130191686 * GRP_Frq3
          +     0.21356077566978 * GRP_Frq4  +     0.22887565933637 *
        GRP_Income2  +     0.28123841156129 * GRP_Income3
          +    -0.30634832652689 * GRP_Income4  +     0.06733141985754 *
        GRP_Mnt2  +     0.24901181590062 * GRP_Mnt3  +     0.23926240883217 *
        GRP_Mnt4  +     0.36878256431394 * GRP_MntFishProducts2
          +    -0.03033118293022 * GRP_MntFishProducts3
          +     0.12939247483371 * GRP_MntFishProducts4
          +     -0.1948739109476 * GRP_MntGoldProds2
          +    -0.02487689041808 * GRP_MntGoldProds3
          +      0.0424854445517 * GRP_MntGoldProds4
          +    -0.77110165164491 * GRP_MntMeatProducts2
          +    -0.04188692453988 * GRP_MntMeatProducts3
          +     0.16117883521584 * GRP_MntMeatProducts4
          +     0.26607076588839 * GRP_MntWines2  +     0.08155165225431 *
        GRP_MntWines3  +     0.05320347913397 * GRP_MntWines4
          +    -0.60136669330804 * GRP_NumCatalogPurchases3
          +    -0.32571087796929 * GRP_NumCatalogPurchases4
          +    -0.82361130213661 * GRP_NumDistPurchases2
          +     0.18332361990877 * GRP_NumDistPurchases3
          +    -0.10228504756385 * GRP_NumDistPurchases4
          +     0.21492204339132 * GRP_NumWebPurchases2
          +     0.22752835090931 * GRP_NumWebPurchases3
          +    -0.04291366517536 * GRP_NumWebPurchases4
          +     -0.1860476520082 * GRP_RFMstat2  +      0.2676074141222 *
        GRP_RFMstat3  +     0.25111332591837 * GRP_RFMstat4
          +    -0.16694407619317 * GRP_RMntFrq2  +     0.21748370383635 *
        GRP_RMntFrq3  +    -0.33247097178921 * GRP_RMntFrq4
          +     0.96302825639489 * GRP_Recency2  +     0.29783943122668 *
        GRP_Recency3  +    -0.18073280365547 * GRP_Recency4 ;
   H13  = H13  +     0.02391312263521 * GRP_AcceptedCmp52
          +    -0.01218158666492 * GRP_Frq2  +     0.03493150543946 * GRP_Frq3
          +    -0.19640223643897 * GRP_Frq4  +    -0.02394476100786 *
        GRP_Income2  +     0.05107107029363 * GRP_Income3
          +    -0.26596751360911 * GRP_Income4  +    -0.02628350983207 *
        GRP_Mnt2  +    -0.08273234777804 * GRP_Mnt3  +      0.2039544161917 *
        GRP_Mnt4  +     0.19888587009926 * GRP_MntFishProducts2
          +    -0.12190385526661 * GRP_MntFishProducts3
          +     0.11161376295027 * GRP_MntFishProducts4
          +     0.09536549249994 * GRP_MntGoldProds2
          +    -0.39027188388377 * GRP_MntGoldProds3
          +    -0.26960120596574 * GRP_MntGoldProds4
          +    -0.29704810464482 * GRP_MntMeatProducts2
          +    -0.17523279359181 * GRP_MntMeatProducts3
          +     0.01169006509688 * GRP_MntMeatProducts4
          +    -0.03150424899485 * GRP_MntWines2  +    -0.18135684744581 *
        GRP_MntWines3  +    -0.22282316044351 * GRP_MntWines4
          +    -0.06575154068738 * GRP_NumCatalogPurchases3
          +     0.12535793167638 * GRP_NumCatalogPurchases4
          +     0.10187760390092 * GRP_NumDistPurchases2
          +    -0.25409837313865 * GRP_NumDistPurchases3
          +    -0.28689980992526 * GRP_NumDistPurchases4
          +     0.00005909057861 * GRP_NumWebPurchases2
          +    -0.14419000341563 * GRP_NumWebPurchases3
          +     0.09095003593529 * GRP_NumWebPurchases4
          +    -0.02794941494222 * GRP_RFMstat2  +    -0.08735126371613 *
        GRP_RFMstat3  +      0.0136997814979 * GRP_RFMstat4
          +    -0.02686274413645 * GRP_RMntFrq2  +    -0.13529202759766 *
        GRP_RMntFrq3  +     0.22088337575055 * GRP_RMntFrq4
          +      0.2635440865684 * GRP_Recency2  +     0.12547691494271 *
        GRP_Recency3  +    -0.10311689817468 * GRP_Recency4 ;
   H14  = H14  +     0.41081496203789 * GRP_AcceptedCmp52
          +    -0.47313297382337 * GRP_Frq2  +     0.19313816686029 * GRP_Frq3
          +     0.41736322582944 * GRP_Frq4  +    -0.28916219130566 *
        GRP_Income2  +     0.14505600514674 * GRP_Income3
          +    -0.04580645427966 * GRP_Income4  +    -0.19949742172257 *
        GRP_Mnt2  +     0.27329529634974 * GRP_Mnt3  +     0.33404292971179 *
        GRP_Mnt4  +    -0.37521460360102 * GRP_MntFishProducts2
          +    -0.14631724639492 * GRP_MntFishProducts3
          +     0.10002979979527 * GRP_MntFishProducts4
          +    -0.09816985850711 * GRP_MntGoldProds2
          +    -0.12203012318985 * GRP_MntGoldProds3
          +    -0.01815311012777 * GRP_MntGoldProds4
          +    -0.06619591895459 * GRP_MntMeatProducts2
          +    -0.09072077897467 * GRP_MntMeatProducts3
          +      0.1726695423557 * GRP_MntMeatProducts4
          +    -0.28636541965058 * GRP_MntWines2  +    -0.02631953768864 *
        GRP_MntWines3  +     0.06980122973657 * GRP_MntWines4
          +     0.09645375616786 * GRP_NumCatalogPurchases3
          +    -0.41914184592159 * GRP_NumCatalogPurchases4
          +      0.1854692255158 * GRP_NumDistPurchases2
          +    -0.22330441571095 * GRP_NumDistPurchases3
          +     0.13028835056864 * GRP_NumDistPurchases4
          +    -0.16915625127212 * GRP_NumWebPurchases2
          +    -0.29991156671478 * GRP_NumWebPurchases3
          +     0.01989579721354 * GRP_NumWebPurchases4
          +    -0.12351517510664 * GRP_RFMstat2  +     0.41722412115996 *
        GRP_RFMstat3  +    -0.02210360437313 * GRP_RFMstat4
          +    -0.04201080178576 * GRP_RMntFrq2  +     0.21775390796319 *
        GRP_RMntFrq3  +     0.31823734284083 * GRP_RMntFrq4
          +    -0.53168026601605 * GRP_Recency2  +     -0.3287664545088 *
        GRP_Recency3  +     0.04505851470752 * GRP_Recency4 ;
   H15  = H15  +     0.13088214496598 * GRP_AcceptedCmp52
          +    -0.08389895441588 * GRP_Frq2  +     0.05379617788531 * GRP_Frq3
          +     0.05704464608157 * GRP_Frq4  +    -0.33954574127328 *
        GRP_Income2  +    -0.19537868529992 * GRP_Income3
          +     0.16339422960337 * GRP_Income4  +    -0.15103080606917 *
        GRP_Mnt2  +    -0.10359763066736 * GRP_Mnt3  +    -0.15169095818331 *
        GRP_Mnt4  +    -0.00757439653534 * GRP_MntFishProducts2
          +     0.03013301742801 * GRP_MntFishProducts3
          +     -0.0753778180106 * GRP_MntFishProducts4
          +     0.22882421007211 * GRP_MntGoldProds2
          +    -0.06369987000315 * GRP_MntGoldProds3
          +     0.09890582278559 * GRP_MntGoldProds4
          +    -0.21052640581149 * GRP_MntMeatProducts2
          +    -0.00867214697179 * GRP_MntMeatProducts3
          +     0.11929485476343 * GRP_MntMeatProducts4
          +    -0.18943631653077 * GRP_MntWines2  +     0.03539441492325 *
        GRP_MntWines3  +     0.30650819876628 * GRP_MntWines4
          +     0.06292612305453 * GRP_NumCatalogPurchases3
          +      0.2309036660938 * GRP_NumCatalogPurchases4
          +    -0.10062151440617 * GRP_NumDistPurchases2
          +       0.229091410456 * GRP_NumDistPurchases3
          +    -0.19729313017904 * GRP_NumDistPurchases4
          +    -0.04101710595215 * GRP_NumWebPurchases2
          +     0.13926341050039 * GRP_NumWebPurchases3
          +    -0.04443067825367 * GRP_NumWebPurchases4
          +     0.12014961650367 * GRP_RFMstat2  +     0.01617790323448 *
        GRP_RFMstat3  +     -0.1552934903319 * GRP_RFMstat4
          +    -0.04595909907677 * GRP_RMntFrq2  +    -0.44798863026137 *
        GRP_RMntFrq3  +     -0.0483895955721 * GRP_RMntFrq4
          +    -0.03768706422132 * GRP_Recency2  +    -0.02473503115913 *
        GRP_Recency3  +    -0.07674131244122 * GRP_Recency4 ;
   H16  = H16  +     0.46251048250873 * GRP_AcceptedCmp52
          +    -0.00268856292377 * GRP_Frq2  +    -0.25660455566834 * GRP_Frq3
          +     0.00867022501651 * GRP_Frq4  +    -0.19509148919986 *
        GRP_Income2  +    -0.39761314772605 * GRP_Income3
          +     0.62767489359884 * GRP_Income4  +     0.12500076687539 *
        GRP_Mnt2  +    -0.21739986249936 * GRP_Mnt3  +     0.17941174570957 *
        GRP_Mnt4  +    -0.05655316560222 * GRP_MntFishProducts2
          +    -0.03224941225278 * GRP_MntFishProducts3
          +     0.12546380835809 * GRP_MntFishProducts4
          +     0.21690521778421 * GRP_MntGoldProds2
          +     0.09035550488812 * GRP_MntGoldProds3
          +    -0.03133919720822 * GRP_MntGoldProds4
          +     0.05188619692889 * GRP_MntMeatProducts2
          +    -0.04899714585321 * GRP_MntMeatProducts3
          +    -0.35752492237905 * GRP_MntMeatProducts4
          +    -0.08947041349478 * GRP_MntWines2  +      0.0265961489442 *
        GRP_MntWines3  +     0.09890393808772 * GRP_MntWines4
          +     0.45534320348836 * GRP_NumCatalogPurchases3
          +    -0.31950647452009 * GRP_NumCatalogPurchases4
          +     0.21080174299166 * GRP_NumDistPurchases2
          +     0.24874731231732 * GRP_NumDistPurchases3
          +    -0.01320035732018 * GRP_NumDistPurchases4
          +     0.17773116301115 * GRP_NumWebPurchases2
          +     0.13686106729498 * GRP_NumWebPurchases3
          +     -0.0690876840257 * GRP_NumWebPurchases4
          +     0.46273916902968 * GRP_RFMstat2  +     0.51267279380421 *
        GRP_RFMstat3  +     0.27205036954754 * GRP_RFMstat4
          +    -0.41192018310368 * GRP_RMntFrq2  +    -0.01025987166968 *
        GRP_RMntFrq3  +     0.08432669626242 * GRP_RMntFrq4
          +    -0.37569076006412 * GRP_Recency2  +    -0.09560087881071 *
        GRP_Recency3  +     0.15619501698904 * GRP_Recency4 ;
   H11  =     1.02277651695375 + H11 ;
   H12  =     0.30687404845149 + H12 ;
   H13  =     0.38396141006686 + H13 ;
   H14  =     0.66961227315774 + H14 ;
   H15  =     0.55149278706288 + H15 ;
   H16  =    -0.54938689657398 + H16 ;
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
   P_DepVar1  =     1.19791571177519 * H11  +     1.91589058327051 * H12
          +     0.44556788800887 * H13  +    -1.25798187083564 * H14
          +    -0.40058942527791 * H15  +    -1.41542812613902 * H16 ;
   P_DepVar1  =    -2.68041503413101 + P_DepVar1 ;
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
* Renaming variables for Neural23;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural23;
*------------------------------------------------------------*;
drop Neural23_P_DepVar1;
Neural23_P_DepVar1 = P_DepVar1;
drop Neural23_P_DepVar0;
Neural23_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural23;
*------------------------------------------------------------*;
length Neural23_WARN_ $4;
drop Neural23_WARN_;
Neural23_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl3: Scoring Code of model 5 of 10;
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
      F_DepVar  $ 12
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

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
* Ensmbl3: Scoring Code of model 6 of 10;
*------------------------------------------------------------*;
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
      F_DepVar  $ 12
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

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
* Ensmbl3: Scoring Code of model 7 of 10;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural20;
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

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   H11  =    -0.41939883149261 * S_Year_Birth ;
   H12  =    -0.11064938192918 * S_Year_Birth ;
   H13  =    -0.06467031288187 * S_Year_Birth ;
   H11  = H11  +     0.35448004105908 * GRP_AcceptedCmp52
          +     -0.0918084964279 * GRP_Frq2  +    -0.23985284532042 * GRP_Frq3
          +     0.05570802281486 * GRP_Frq4  +     -0.3547598798301 *
        GRP_Income2  +    -0.33962703607715 * GRP_Income3
          +     0.12436841230863 * GRP_Income4  +    -0.01455143009771 *
        GRP_Mnt2  +     0.10120972709945 * GRP_Mnt3  +     -0.0249155152295 *
        GRP_Mnt4  +      -0.269333013942 * GRP_MntFishProducts2
          +     0.05785555057946 * GRP_MntFishProducts3
          +    -0.13000426565494 * GRP_MntFishProducts4
          +     0.17862455375899 * GRP_MntGoldProds2
          +     0.06257016564867 * GRP_MntGoldProds3
          +     0.20249370161035 * GRP_MntGoldProds4
          +     0.32678386182233 * GRP_MntMeatProducts2
          +      0.3373259079058 * GRP_MntMeatProducts3
          +     0.28061036187325 * GRP_MntMeatProducts4
          +    -0.03272437686392 * GRP_MntWines2  +    -0.21202325680638 *
        GRP_MntWines3  +      0.3424605103125 * GRP_MntWines4
          +     0.18542181546309 * GRP_NumCatalogPurchases3
          +     0.14594977072698 * GRP_NumCatalogPurchases4
          +     0.20431880618842 * GRP_NumDistPurchases2
          +    -0.15119714667229 * GRP_NumDistPurchases3
          +     0.19430353652214 * GRP_NumDistPurchases4
          +     0.04685341709526 * GRP_NumWebPurchases2
          +    -0.06094487598588 * GRP_NumWebPurchases3
          +    -0.04237233324733 * GRP_NumWebPurchases4
          +    -0.08991829185393 * GRP_RFMstat2  +    -0.07347809144281 *
        GRP_RFMstat3  +     -0.4341534715985 * GRP_RFMstat4
          +     -0.0196197195217 * GRP_RMntFrq2  +     0.12097540554524 *
        GRP_RMntFrq3  +     0.26057062278983 * GRP_RMntFrq4
          +    -0.63029497931535 * GRP_Recency2  +    -0.41040165908214 *
        GRP_Recency3  +     0.03209060504164 * GRP_Recency4 ;
   H12  = H12  +    -0.16182441315567 * GRP_AcceptedCmp52
          +     0.17228162466334 * GRP_Frq2  +     0.15132687990319 * GRP_Frq3
          +     -0.1689155033241 * GRP_Frq4  +     0.15149901619495 *
        GRP_Income2  +     0.17788129654866 * GRP_Income3
          +     0.05923547318389 * GRP_Income4  +    -0.08355004275991 *
        GRP_Mnt2  +     0.02631246580002 * GRP_Mnt3  +     -0.2309890088856 *
        GRP_Mnt4  +     0.14312480402918 * GRP_MntFishProducts2
          +     -0.2578736956972 * GRP_MntFishProducts3
          +     0.18402620335031 * GRP_MntFishProducts4
          +     0.05242149290227 * GRP_MntGoldProds2
          +    -0.21803869063517 * GRP_MntGoldProds3
          +     0.13815635816146 * GRP_MntGoldProds4
          +    -0.27330809721997 * GRP_MntMeatProducts2
          +    -0.21530314028526 * GRP_MntMeatProducts3
          +     0.02052103215709 * GRP_MntMeatProducts4
          +    -0.12650113568762 * GRP_MntWines2  +     0.11322482902275 *
        GRP_MntWines3  +    -0.27438926594633 * GRP_MntWines4
          +    -0.54784157827091 * GRP_NumCatalogPurchases3
          +    -0.08859032150825 * GRP_NumCatalogPurchases4
          +     -0.1595237277506 * GRP_NumDistPurchases2
          +     0.00057390274989 * GRP_NumDistPurchases3
          +     -0.1082308524036 * GRP_NumDistPurchases4
          +     0.08795971555231 * GRP_NumWebPurchases2
          +    -0.23666817227274 * GRP_NumWebPurchases3
          +     0.01490866706276 * GRP_NumWebPurchases4
          +    -0.00588866906818 * GRP_RFMstat2  +    -0.01109150017006 *
        GRP_RFMstat3  +    -0.00327834027258 * GRP_RFMstat4
          +     0.04028767653615 * GRP_RMntFrq2  +     -0.0163649640466 *
        GRP_RMntFrq3  +    -0.07601316125357 * GRP_RMntFrq4
          +     0.66228536796217 * GRP_Recency2  +     0.48287342862457 *
        GRP_Recency3  +    -0.03032773010646 * GRP_Recency4 ;
   H13  = H13  +    -0.76222121025234 * GRP_AcceptedCmp52
          +     0.36511613420086 * GRP_Frq2  +    -0.02961648849396 * GRP_Frq3
          +     0.08263295800576 * GRP_Frq4  +     0.53248885273716 *
        GRP_Income2  +     0.58143836248256 * GRP_Income3
          +     -0.6819044946332 * GRP_Income4  +     0.09969835343923 *
        GRP_Mnt2  +     0.22681708558976 * GRP_Mnt3  +    -0.05933156304489 *
        GRP_Mnt4  +      0.3115929057885 * GRP_MntFishProducts2
          +     0.20656815909058 * GRP_MntFishProducts3
          +    -0.18100587726033 * GRP_MntFishProducts4
          +    -0.26082445403302 * GRP_MntGoldProds2
          +     0.05485426947921 * GRP_MntGoldProds3
          +     0.09168468833046 * GRP_MntGoldProds4
          +    -0.26764306152541 * GRP_MntMeatProducts2
          +    -0.05251001605784 * GRP_MntMeatProducts3
          +     0.29225259283913 * GRP_MntMeatProducts4
          +     0.61402400906277 * GRP_MntWines2  +     0.18145923811098 *
        GRP_MntWines3  +    -0.04337923172483 * GRP_MntWines4
          +    -0.72349314013585 * GRP_NumCatalogPurchases3
          +     0.14875924587174 * GRP_NumCatalogPurchases4
          +    -0.74484872686794 * GRP_NumDistPurchases2
          +    -0.21410281712514 * GRP_NumDistPurchases3
          +     0.04732133485671 * GRP_NumDistPurchases4
          +     -0.1068322737335 * GRP_NumWebPurchases2
          +     0.16615642908107 * GRP_NumWebPurchases3
          +     0.06510367246629 * GRP_NumWebPurchases4
          +    -0.32688260466431 * GRP_RFMstat2  +    -0.18733405583331 *
        GRP_RFMstat3  +     -0.2070438751052 * GRP_RFMstat4
          +     0.00135495431586 * GRP_RMntFrq2  +     0.14594289041413 *
        GRP_RMntFrq3  +    -0.22868347656723 * GRP_RMntFrq4
          +     0.85583167880584 * GRP_Recency2  +     0.12194433799934 *
        GRP_Recency3  +    -0.40666493945855 * GRP_Recency4 ;
   H11  =    -0.47589199029932 + H11 ;
   H12  =    -0.33973735112712 + H12 ;
   H13  =     0.16076842495153 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
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
   P_DepVar1  =    -1.16415993584169 * H11  +     0.57209582268762 * H12
          +     1.90916164841558 * H13 ;
   P_DepVar1  =    -1.85769338519577 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural20;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural20;
*------------------------------------------------------------*;
drop Neural20_P_DepVar1;
Neural20_P_DepVar1 = P_DepVar1;
drop Neural20_P_DepVar0;
Neural20_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural20;
*------------------------------------------------------------*;
length Neural20_WARN_ $4;
drop Neural20_WARN_;
Neural20_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl3: Scoring Code of model 8 of 10;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural19;
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

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   H11  =    -0.00764494959641 * S_Year_Birth ;
   H12  =     0.07985236007447 * S_Year_Birth ;
   H11  = H11  +     0.30243585989963 * GRP_AcceptedCmp52
          +    -1.01247574867977 * GRP_Frq2  +    -0.20269284301089 * GRP_Frq3
          +     0.13795348170285 * GRP_Frq4  +     0.01460946974261 *
        GRP_Income2  +     0.07493432056114 * GRP_Income3
          +     0.02989162785893 * GRP_Income4  +    -0.02386105013807 *
        GRP_Mnt2  +    -0.41942836136152 * GRP_Mnt3  +     0.22813965454599 *
        GRP_Mnt4  +    -0.02248365969183 * GRP_MntFishProducts2
          +    -0.17213374102896 * GRP_MntFishProducts3
          +    -0.03630204919594 * GRP_MntFishProducts4
          +    -0.05460186275698 * GRP_MntGoldProds2
          +     0.17440895359267 * GRP_MntGoldProds3
          +     0.06276226158536 * GRP_MntGoldProds4
          +     0.24913658683735 * GRP_MntMeatProducts2
          +     0.34153298373719 * GRP_MntMeatProducts3
          +    -0.01479035508855 * GRP_MntMeatProducts4
          +    -0.30090319249134 * GRP_MntWines2  +    -0.22956799988205 *
        GRP_MntWines3  +      0.2174634765863 * GRP_MntWines4
          +     0.59798838520377 * GRP_NumCatalogPurchases3
          +     0.18459646376075 * GRP_NumCatalogPurchases4
          +     0.68686707296889 * GRP_NumDistPurchases2
          +     0.01763602172593 * GRP_NumDistPurchases3
          +    -0.18269797362148 * GRP_NumDistPurchases4
          +     0.60927764745536 * GRP_NumWebPurchases2
          +     0.13479979954708 * GRP_NumWebPurchases3
          +    -0.08022145941408 * GRP_NumWebPurchases4
          +     0.31971573913723 * GRP_RFMstat2  +     0.14998276665028 *
        GRP_RFMstat3  +    -0.35264122886189 * GRP_RFMstat4
          +     0.73614679989894 * GRP_RMntFrq2  +     0.68193669255848 *
        GRP_RMntFrq3  +     1.12908709575784 * GRP_RMntFrq4
          +    -0.34988546752368 * GRP_Recency2  +    -0.09861529398333 *
        GRP_Recency3  +     0.03043927813491 * GRP_Recency4 ;
   H12  = H12  +    -0.28470958349897 * GRP_AcceptedCmp52
          +     0.38963626888759 * GRP_Frq2  +    -0.08631643702353 * GRP_Frq3
          +    -0.10781175757073 * GRP_Frq4  +     0.52838454887758 *
        GRP_Income2  +     0.49811285398937 * GRP_Income3
          +    -0.52344032334308 * GRP_Income4  +    -0.16102798071085 *
        GRP_Mnt2  +    -0.59987497547696 * GRP_Mnt3  +     0.30977299182247 *
        GRP_Mnt4  +     0.31161547120638 * GRP_MntFishProducts2
          +    -0.13904940340926 * GRP_MntFishProducts3
          +     -0.0238384717361 * GRP_MntFishProducts4
          +    -0.07342882109089 * GRP_MntGoldProds2
          +     0.06209137082418 * GRP_MntGoldProds3
          +    -0.01682894618174 * GRP_MntGoldProds4
          +    -0.70514696594831 * GRP_MntMeatProducts2
          +     0.30494479189325 * GRP_MntMeatProducts3
          +     0.16724961510362 * GRP_MntMeatProducts4
          +     0.47753590354486 * GRP_MntWines2  +     -0.0475037304462 *
        GRP_MntWines3  +    -0.15194191043511 * GRP_MntWines4
          +    -0.02600524471339 * GRP_NumCatalogPurchases3
          +     0.04676493824202 * GRP_NumCatalogPurchases4
          +    -0.87566302467834 * GRP_NumDistPurchases2
          +     0.14216206915436 * GRP_NumDistPurchases3
          +      0.0473423363943 * GRP_NumDistPurchases4
          +     0.48704677587339 * GRP_NumWebPurchases2
          +     0.05866537558911 * GRP_NumWebPurchases3
          +    -0.12537289794862 * GRP_NumWebPurchases4
          +    -0.44186169476572 * GRP_RFMstat2  +     0.40940999072989 *
        GRP_RFMstat3  +    -0.12217840922636 * GRP_RFMstat4
          +     0.67040692062491 * GRP_RMntFrq2  +     0.18389631151947 *
        GRP_RMntFrq3  +    -0.08386771645702 * GRP_RMntFrq4
          +     0.55720904594774 * GRP_Recency2  +     0.12496105124544 *
        GRP_Recency3  +    -0.23658499274155 * GRP_Recency4 ;
   H11  =    -0.50260831929377 + H11 ;
   H12  =     0.67324662853602 + H12 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
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
   P_DepVar1  =    -2.91374311447337 * H11  +      3.9462028641342 * H12 ;
   P_DepVar1  =    -3.48795847558643 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural19;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural19;
*------------------------------------------------------------*;
drop Neural19_P_DepVar1;
Neural19_P_DepVar1 = P_DepVar1;
drop Neural19_P_DepVar0;
Neural19_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural19;
*------------------------------------------------------------*;
length Neural19_WARN_ $4;
drop Neural19_WARN_;
Neural19_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl3: Scoring Code of model 9 of 10;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural5;
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

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

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
   H11  =     -0.0249129843743 * S_Year_Birth ;
   H11  = H11  +     0.12725616992691 * GRP_AcceptedCmp52
          +    -0.26945372540537 * GRP_Frq2  +    -0.02807540638783 * GRP_Frq3
          +     0.09639274822287 * GRP_Frq4  +    -0.12205097466688 *
        GRP_Income2  +    -0.11081339105891 * GRP_Income3
          +     0.11708983682544 * GRP_Income4  +     0.08213996698973 *
        GRP_Mnt2  +     0.04755736117379 * GRP_Mnt3  +    -0.04386204709619 *
        GRP_Mnt4  +    -0.08900126769754 * GRP_MntFishProducts2
          +    -0.01139329678589 * GRP_MntFishProducts3
          +     0.01080020635436 * GRP_MntFishProducts4
          +     0.03276801167604 * GRP_MntGoldProds2
          +     0.00684607145566 * GRP_MntGoldProds3
          +     0.00079341373044 * GRP_MntGoldProds4
          +     0.17029271800291 * GRP_MntMeatProducts2
          +     0.03003718456752 * GRP_MntMeatProducts3
          +    -0.06730384984954 * GRP_MntMeatProducts4
          +    -0.12738653189788 * GRP_MntWines2  +    -0.05870095101029 *
        GRP_MntWines3  +     0.07315089663035 * GRP_MntWines4
          +      0.1241456955943 * GRP_NumCatalogPurchases3
          +    -0.00574720008996 * GRP_NumCatalogPurchases4
          +     0.32158219504705 * GRP_NumDistPurchases2
          +      0.0000285685731 * GRP_NumDistPurchases3
          +    -0.05920668594102 * GRP_NumDistPurchases4
          +    -0.02186462965936 * GRP_NumWebPurchases2
          +    -0.01225939075207 * GRP_NumWebPurchases3
          +     0.00325978185796 * GRP_NumWebPurchases4
          +     0.08029400003818 * GRP_RFMstat2  +     0.01517552489443 *
        GRP_RFMstat3  +    -0.02560149548828 * GRP_RFMstat4
          +    -0.06091086754789 * GRP_RMntFrq2  +    -0.03720166216597 *
        GRP_RMntFrq3  +     0.09749105098352 * GRP_RMntFrq4
          +    -0.21514477253983 * GRP_Recency2  +    -0.05786796429946 *
        GRP_Recency3  +     0.06630148536635 * GRP_Recency4 ;
   H11  =     -0.2495737283502 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
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
   P_DepVar1  =    -9.21655554427872 * H11 ;
   P_DepVar1  =    -3.98078306870422 + P_DepVar1 ;
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
;
drop S_:;
* Renaming variables for Neural5;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural5;
*------------------------------------------------------------*;
drop Neural5_P_DepVar1;
Neural5_P_DepVar1 = P_DepVar1;
drop Neural5_P_DepVar0;
Neural5_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural5;
*------------------------------------------------------------*;
length Neural5_WARN_ $4;
drop Neural5_WARN_;
Neural5_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl3: Scoring Code of model 10 of 10;
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

*** Generate dummy variables for DepVar ;
drop _Y ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   _Y = .;
end;
else do;
   if F_DepVar = '0'  then do;
      _Y = 1;
   end;
   else if F_DepVar = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

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

*** Residuals;
if (_Y = .) then do;
   R_DepVar1 = .;
   R_DepVar0 = .;
end;
else do;
    label R_DepVar1 = 'Residual: DepVar=1' ;
    label R_DepVar0 = 'Residual: DepVar=0' ;
   R_DepVar1 = - _P0;
   R_DepVar0 = - _P1;
   select( _Y );
      when (0)  R_DepVar1 = R_DepVar1 + 1;
      when (1)  R_DepVar0 = R_DepVar0 + 1;
   end;
end;

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
* Ensmbl3: Average Posteriors of 10 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Reg3_P_DepVar1 +
Tree3_P_DepVar1 +
Neural18_P_DepVar1 +
Neural23_P_DepVar1 +
Neural22_P_DepVar1 +
Neural21_P_DepVar1 +
Neural20_P_DepVar1 +
Neural19_P_DepVar1 +
Neural5_P_DepVar1 +
Reg7_P_DepVar1
)/10;
P_DepVar0 = (
Reg3_P_DepVar0 +
Tree3_P_DepVar0 +
Neural18_P_DepVar0 +
Neural23_P_DepVar0 +
Neural22_P_DepVar0 +
Neural21_P_DepVar0 +
Neural20_P_DepVar0 +
Neural19_P_DepVar0 +
Neural5_P_DepVar0 +
Reg7_P_DepVar0
)/10;
*------------------------------------------------------------*;
* Ensmbl3: Computing Classification Vars;
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
* Ensmbl3: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl3: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(REG3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(TREE3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(TREE3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(TREE3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(TREE3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL18_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL18_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL18_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL18_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL23_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL23_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL23_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL23_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL22_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL22_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL22_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL22_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL21_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL21_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL21_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL21_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL20_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL20_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL20_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL20_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL19_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL19_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL19_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL19_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL5_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL5_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL5_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL5_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl3: Computing Residual Vars;
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
