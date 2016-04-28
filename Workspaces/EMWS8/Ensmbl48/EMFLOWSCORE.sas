*------------------------------------------------------------*;
* Ensmbl48: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 1 of 7;
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
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural24;
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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -1.98556205049158 * S_Year_Birth ;
   H1x1_2  =     2.65003203246915 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +    -0.05712043872213 * GRP_AcceptedCmp52
          +     1.04378756398945 * GRP_Frq2  +     1.53971794568749 * GRP_Frq3
          +     1.46006856973709 * GRP_Frq4  +    -0.56202924907336 *
        GRP_Income2  +     4.72191701616365 * GRP_Income3
          +    -2.66170280222507 * GRP_Income4  +     0.01753317277737 *
        GRP_Mnt2  +    -3.49161842568046 * GRP_Mnt3  +    -2.05166246350112 *
        GRP_Mnt4  +     3.42363704603021 * GRP_MntFishProducts2
          +     4.07177263196201 * GRP_MntFishProducts3
          +    -0.95758193346069 * GRP_MntFishProducts4
          +     0.27642218349221 * GRP_MntGoldProds2
          +    -1.85260255304992 * GRP_MntGoldProds3
          +      0.0084996256166 * GRP_MntGoldProds4
          +     1.78769069128312 * GRP_MntMeatProducts2
          +    -5.09868822425716 * GRP_MntMeatProducts3
          +     -1.2944400003238 * GRP_MntMeatProducts4
          +     2.16310510520522 * GRP_MntWines2  +    -0.98848869719513 *
        GRP_MntWines3  +     0.37628412350279 * GRP_MntWines4
          +    -0.18399160398973 * GRP_NumCatalogPurchases3
          +     2.78149370347513 * GRP_NumCatalogPurchases4
          +    -1.92842775798726 * GRP_NumDistPurchases2
          +     1.36617128431309 * GRP_NumDistPurchases3
          +    -5.04459399151701 * GRP_NumDistPurchases4
          +    -3.10131336282255 * GRP_NumWebPurchases2
          +    -1.70853531086832 * GRP_NumWebPurchases3
          +    -1.81576465350843 * GRP_NumWebPurchases4
          +     0.97448188440932 * GRP_RFMstat2  +    -1.74164713551138 *
        GRP_RFMstat3  +    -1.61869970889612 * GRP_RFMstat4
          +     0.94148483345045 * GRP_RMntFrq2  +    -4.61928796757469 *
        GRP_RMntFrq3  +    -0.29552475494224 * GRP_RMntFrq4
          +     0.59385679636573 * GRP_Recency2  +    -0.70804337284842 *
        GRP_Recency3  +     2.46935358022796 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +    -2.86061192932804 * GRP_AcceptedCmp52
          +    -2.37847197829836 * GRP_Frq2  +     3.04126084255177 * GRP_Frq3
          +    -2.25316213708692 * GRP_Frq4  +    -2.15230505920585 *
        GRP_Income2  +     0.22423161350469 * GRP_Income3
          +     1.82470653064149 * GRP_Income4  +     0.91426377324604 *
        GRP_Mnt2  +    -2.52824414988744 * GRP_Mnt3  +     1.25821903076482 *
        GRP_Mnt4  +     2.48215495303599 * GRP_MntFishProducts2
          +    -2.53912545896945 * GRP_MntFishProducts3
          +    -1.24420085467004 * GRP_MntFishProducts4
          +     0.87589074104426 * GRP_MntGoldProds2
          +     2.05825939506076 * GRP_MntGoldProds3
          +     4.54187777951066 * GRP_MntGoldProds4
          +     1.73194182769876 * GRP_MntMeatProducts2
          +    -0.50494075731675 * GRP_MntMeatProducts3
          +    -1.24502732975278 * GRP_MntMeatProducts4
          +     1.29208460321632 * GRP_MntWines2  +     0.29717301998256 *
        GRP_MntWines3  +    -0.62672710631427 * GRP_MntWines4
          +     1.35492499749641 * GRP_NumCatalogPurchases3
          +    -0.16024517906179 * GRP_NumCatalogPurchases4
          +     1.86677407552405 * GRP_NumDistPurchases2
          +     -0.7331940643207 * GRP_NumDistPurchases3
          +     1.69990326910684 * GRP_NumDistPurchases4
          +     2.43176299986254 * GRP_NumWebPurchases2
          +    -2.13772911466858 * GRP_NumWebPurchases3
          +    -4.73478753166791 * GRP_NumWebPurchases4
          +     2.64399780173577 * GRP_RFMstat2  +    -3.62336346056054 *
        GRP_RFMstat3  +    -3.18363324824984 * GRP_RFMstat4
          +     3.46796006062254 * GRP_RMntFrq2  +    -0.59973905875633 *
        GRP_RMntFrq3  +    -1.07300094897005 * GRP_RMntFrq4
          +     1.65131957040649 * GRP_Recency2  +     2.60583794046673 *
        GRP_Recency3  +    -1.61296974687132 * GRP_Recency4 ;
   H1x1_1  =     2.45115906330524 + H1x1_1 ;
   H1x1_2  =     4.73081202118604 + H1x1_2 ;
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
   P_DepVar1  =      4.0196958449291 * H1x1_1  +    -3.12785763420985 * H1x1_2
         ;
   P_DepVar1  =    -2.56231918790427 + P_DepVar1 ;
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
* Renaming variables for AutoNeural24;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural24;
*------------------------------------------------------------*;
drop AutoNeural24_P_DepVar1;
AutoNeural24_P_DepVar1 = P_DepVar1;
drop AutoNeural24_P_DepVar0;
AutoNeural24_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural24;
*------------------------------------------------------------*;
length AutoNeural24_WARN_ $4;
drop AutoNeural24_WARN_;
AutoNeural24_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 2 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural22;
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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     2.97734663226499 * S_Year_Birth ;
   H1x1_2  =    -0.02332673614472 * S_Year_Birth ;
   H1x1_3  =    -0.21203760038885 * S_Year_Birth ;
   H1x1_4  =    -0.93232920235603 * S_Year_Birth ;
   H1x1_5  =     0.52440348943963 * S_Year_Birth ;
   H1x1_6  =    -2.87318917513282 * S_Year_Birth ;
   H1x1_7  =     1.25367568490371 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     2.80677271834446 * GRP_AcceptedCmp52
          +    -2.32565230752453 * GRP_Frq2  +     2.22037590877354 * GRP_Frq3
          +    -3.68499358333843 * GRP_Frq4  +    -2.13081454889876 *
        GRP_Income2  +    -0.38485085997351 * GRP_Income3
          +     0.43520727568519 * GRP_Income4  +    -1.67383365803521 *
        GRP_Mnt2  +    -2.27881933900388 * GRP_Mnt3  +    -0.69213755321586 *
        GRP_Mnt4  +    -0.04079006532289 * GRP_MntFishProducts2
          +    -2.14876852259668 * GRP_MntFishProducts3
          +     1.83260002021024 * GRP_MntFishProducts4
          +     0.51096990118592 * GRP_MntGoldProds2
          +     0.50696068122006 * GRP_MntGoldProds3
          +     0.74230349643824 * GRP_MntGoldProds4
          +     1.49045716090612 * GRP_MntMeatProducts2
          +    -0.61254307122158 * GRP_MntMeatProducts3
          +     1.56999187930143 * GRP_MntMeatProducts4
          +    -0.31632843892516 * GRP_MntWines2  +    -1.05626215752058 *
        GRP_MntWines3  +    -0.15924458576467 * GRP_MntWines4
          +    -1.09346439824911 * GRP_NumCatalogPurchases3
          +     1.58785113957128 * GRP_NumCatalogPurchases4
          +    -0.62454988809727 * GRP_NumDistPurchases2
          +     1.37295312356584 * GRP_NumDistPurchases3
          +      1.5440119795954 * GRP_NumDistPurchases4
          +    -0.26547715068585 * GRP_NumWebPurchases2
          +     2.62305554684179 * GRP_NumWebPurchases3
          +     0.91247524672275 * GRP_NumWebPurchases4
          +     0.71467719190546 * GRP_RFMstat2  +     0.44245796416885 *
        GRP_RFMstat3  +      0.0238006357066 * GRP_RFMstat4
          +    -2.17145575258416 * GRP_RMntFrq2  +    -3.29596121756931 *
        GRP_RMntFrq3  +    -0.63464596926142 * GRP_RMntFrq4
          +      0.2862685045527 * GRP_Recency2  +    -0.77133964406228 *
        GRP_Recency3  +     0.83634712420156 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +    -2.21554077433203 * GRP_AcceptedCmp52
          +     -1.3297040775516 * GRP_Frq2  +     -1.2691861008704 * GRP_Frq3
          +    -0.83350069121519 * GRP_Frq4  +    -0.45956269964658 *
        GRP_Income2  +    -0.23636051304973 * GRP_Income3
          +    -0.09369458285141 * GRP_Income4  +     0.28408485738252 *
        GRP_Mnt2  +    -1.43976442737366 * GRP_Mnt3  +    -0.47811534578751 *
        GRP_Mnt4  +     1.33306738423502 * GRP_MntFishProducts2
          +    -1.03235983303498 * GRP_MntFishProducts3
          +     1.43737242782063 * GRP_MntFishProducts4
          +    -0.10286834037331 * GRP_MntGoldProds2
          +     0.74054061895326 * GRP_MntGoldProds3
          +     0.27916388015938 * GRP_MntGoldProds4
          +     0.12775665160956 * GRP_MntMeatProducts2
          +     1.94239791535409 * GRP_MntMeatProducts3
          +      2.8604089986372 * GRP_MntMeatProducts4
          +     0.18466046439888 * GRP_MntWines2  +     1.56362849954362 *
        GRP_MntWines3  +    -0.74058839441389 * GRP_MntWines4
          +     0.80335076525252 * GRP_NumCatalogPurchases3
          +     -2.1633226572249 * GRP_NumCatalogPurchases4
          +    -0.87650147959772 * GRP_NumDistPurchases2
          +     1.12706069993787 * GRP_NumDistPurchases3
          +    -1.96498929641584 * GRP_NumDistPurchases4
          +     1.06875251220076 * GRP_NumWebPurchases2
          +     1.19584362733739 * GRP_NumWebPurchases3
          +    -0.75462993535725 * GRP_NumWebPurchases4
          +     0.34313165289913 * GRP_RFMstat2  +    -3.07377616469396 *
        GRP_RFMstat3  +    -0.30628532882149 * GRP_RFMstat4
          +     0.90422181954504 * GRP_RMntFrq2  +    -0.82179895308246 *
        GRP_RMntFrq3  +    -0.01336870072701 * GRP_RMntFrq4
          +     0.78962138115092 * GRP_Recency2  +     0.35738352585872 *
        GRP_Recency3  +    -0.83190183219938 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +     -0.1278687821469 * GRP_AcceptedCmp52
          +     1.77838881912744 * GRP_Frq2  +    -0.95209160545855 * GRP_Frq3
          +     2.40141754421545 * GRP_Frq4  +     0.60378783958273 *
        GRP_Income2  +    -2.18346600414349 * GRP_Income3
          +     0.80627498676781 * GRP_Income4  +     0.81141725300118 *
        GRP_Mnt2  +    -0.20395009454155 * GRP_Mnt3  +     -0.3358053338153 *
        GRP_Mnt4  +    -0.16819978312641 * GRP_MntFishProducts2
          +    -0.11485741469493 * GRP_MntFishProducts3
          +     1.45721315298108 * GRP_MntFishProducts4
          +     0.26086838482974 * GRP_MntGoldProds2
          +    -0.13326700912822 * GRP_MntGoldProds3
          +    -0.31998514458297 * GRP_MntGoldProds4
          +     0.87003612251325 * GRP_MntMeatProducts2
          +    -0.25985022264915 * GRP_MntMeatProducts3
          +    -0.87011310494619 * GRP_MntMeatProducts4
          +     0.18840026647696 * GRP_MntWines2  +    -0.82430822747103 *
        GRP_MntWines3  +     -0.1293341794059 * GRP_MntWines4
          +     1.20111821881337 * GRP_NumCatalogPurchases3
          +     1.02378241927709 * GRP_NumCatalogPurchases4
          +      1.0835984835482 * GRP_NumDistPurchases2
          +     1.45339482543591 * GRP_NumDistPurchases3
          +     0.28792255375632 * GRP_NumDistPurchases4
          +     1.88871344284328 * GRP_NumWebPurchases2
          +     1.61086784930132 * GRP_NumWebPurchases3
          +     0.49767560191528 * GRP_NumWebPurchases4
          +    -2.78411910257351 * GRP_RFMstat2  +     0.84118867927224 *
        GRP_RFMstat3  +    -0.16102328336547 * GRP_RFMstat4
          +     0.27000998599161 * GRP_RMntFrq2  +     0.90131491180658 *
        GRP_RMntFrq3  +    -0.16432121563449 * GRP_RMntFrq4
          +     0.75599465145487 * GRP_Recency2  +     1.38233564862138 *
        GRP_Recency3  +      0.0905871640358 * GRP_Recency4 ;
   H1x1_4  = H1x1_4  +     0.63304456551117 * GRP_AcceptedCmp52
          +    -0.14901142536344 * GRP_Frq2  +    -1.08381199299565 * GRP_Frq3
          +    -0.85011511275423 * GRP_Frq4  +    -0.08287353061518 *
        GRP_Income2  +    -0.58867333501692 * GRP_Income3
          +      2.7097455309793 * GRP_Income4  +    -0.69224144793047 *
        GRP_Mnt2  +    -0.68026366312168 * GRP_Mnt3  +     1.66551851821907 *
        GRP_Mnt4  +    -1.22509209613269 * GRP_MntFishProducts2
          +    -0.00259407262353 * GRP_MntFishProducts3
          +     0.26637234051452 * GRP_MntFishProducts4
          +     1.23072457246487 * GRP_MntGoldProds2
          +     0.27789879553199 * GRP_MntGoldProds3
          +    -1.84318316043809 * GRP_MntGoldProds4
          +    -0.37980618439099 * GRP_MntMeatProducts2
          +    -0.29547725841338 * GRP_MntMeatProducts3
          +      1.3351420752995 * GRP_MntMeatProducts4
          +    -0.69084339698082 * GRP_MntWines2  +    -2.20092193594928 *
        GRP_MntWines3  +     1.01263725926364 * GRP_MntWines4
          +     1.64715242240489 * GRP_NumCatalogPurchases3
          +     0.01013329918753 * GRP_NumCatalogPurchases4
          +      0.0553124072484 * GRP_NumDistPurchases2
          +     0.76354979572241 * GRP_NumDistPurchases3
          +     0.88878742575161 * GRP_NumDistPurchases4
          +    -0.02629928898859 * GRP_NumWebPurchases2
          +     1.58583162640849 * GRP_NumWebPurchases3
          +    -0.90266287490405 * GRP_NumWebPurchases4
          +    -1.30674857203711 * GRP_RFMstat2  +    -1.17342096545194 *
        GRP_RFMstat3  +    -0.30126794428155 * GRP_RFMstat4
          +     -0.8659792150521 * GRP_RMntFrq2  +    -1.44590383236006 *
        GRP_RMntFrq3  +    -0.80966415705314 * GRP_RMntFrq4
          +     0.87489420639261 * GRP_Recency2  +    -1.40960165096221 *
        GRP_Recency3  +    -0.53680151949787 * GRP_Recency4 ;
   H1x1_5  = H1x1_5  +    -0.21941115903739 * GRP_AcceptedCmp52
          +     0.45333751914711 * GRP_Frq2  +     -3.0539111804593 * GRP_Frq3
          +     0.04419455266766 * GRP_Frq4  +     0.43424963383962 *
        GRP_Income2  +     2.20143802199151 * GRP_Income3
          +    -0.28702964858037 * GRP_Income4  +    -1.13156956520544 *
        GRP_Mnt2  +     1.50720291442363 * GRP_Mnt3  +    -1.22848161283033 *
        GRP_Mnt4  +     -0.7725131971727 * GRP_MntFishProducts2
          +    -1.66553508839843 * GRP_MntFishProducts3
          +     3.34099127472134 * GRP_MntFishProducts4
          +    -3.77620930649926 * GRP_MntGoldProds2
          +     2.75980592823208 * GRP_MntGoldProds3
          +    -0.90664928399655 * GRP_MntGoldProds4
          +    -1.27778215433985 * GRP_MntMeatProducts2
          +    -0.38584098789626 * GRP_MntMeatProducts3
          +      0.8642940393434 * GRP_MntMeatProducts4
          +     -1.9800576470315 * GRP_MntWines2  +    -0.84678624865719 *
        GRP_MntWines3  +    -0.71867792060605 * GRP_MntWines4
          +     0.54374663319998 * GRP_NumCatalogPurchases3
          +     0.84217480467185 * GRP_NumCatalogPurchases4
          +    -0.04373645189331 * GRP_NumDistPurchases2
          +    -3.26167594790936 * GRP_NumDistPurchases3
          +    -1.17302893253955 * GRP_NumDistPurchases4
          +     1.08907656354379 * GRP_NumWebPurchases2
          +    -1.23512651413063 * GRP_NumWebPurchases3
          +     1.21540059785356 * GRP_NumWebPurchases4
          +     1.38488146196728 * GRP_RFMstat2  +     0.90046251067185 *
        GRP_RFMstat3  +     1.44622088949053 * GRP_RFMstat4
          +     0.24358390082829 * GRP_RMntFrq2  +    -1.52588683776436 *
        GRP_RMntFrq3  +    -1.28643658389964 * GRP_RMntFrq4
          +    -0.57567006875063 * GRP_Recency2  +    -1.38736001754893 *
        GRP_Recency3  +    -0.14702610320846 * GRP_Recency4 ;
   H1x1_6  = H1x1_6  +     0.08036802334337 * GRP_AcceptedCmp52
          +    -2.51458257290705 * GRP_Frq2  +     0.74528046172987 * GRP_Frq3
          +    -0.77535820763324 * GRP_Frq4  +    -2.00398370232748 *
        GRP_Income2  +     2.31528209254516 * GRP_Income3
          +     0.31630780664757 * GRP_Income4  +    -0.52394275421685 *
        GRP_Mnt2  +    -0.11778857296632 * GRP_Mnt3  +     0.54634621990664 *
        GRP_Mnt4  +    -1.83414469533751 * GRP_MntFishProducts2
          +    -2.67281939906452 * GRP_MntFishProducts3
          +     0.40242786465667 * GRP_MntFishProducts4
          +     1.21530608953831 * GRP_MntGoldProds2
          +      1.3503878333604 * GRP_MntGoldProds3
          +    -0.90580344196397 * GRP_MntGoldProds4
          +    -1.45763540546851 * GRP_MntMeatProducts2
          +     -1.1437696213546 * GRP_MntMeatProducts3
          +    -0.95836970043212 * GRP_MntMeatProducts4
          +     0.05665970127644 * GRP_MntWines2  +     0.73760441066896 *
        GRP_MntWines3  +    -0.66251833030334 * GRP_MntWines4
          +    -0.66756860309452 * GRP_NumCatalogPurchases3
          +    -1.77302756421253 * GRP_NumCatalogPurchases4
          +     0.41629563300233 * GRP_NumDistPurchases2
          +     2.64707563295858 * GRP_NumDistPurchases3
          +    -2.61014123917694 * GRP_NumDistPurchases4
          +     1.31436489534812 * GRP_NumWebPurchases2
          +    -0.44152222308186 * GRP_NumWebPurchases3
          +     1.72168992115176 * GRP_NumWebPurchases4
          +    -0.60634873547541 * GRP_RFMstat2  +      0.5143401306027 *
        GRP_RFMstat3  +      0.4037230104052 * GRP_RFMstat4
          +     1.85795667721847 * GRP_RMntFrq2  +    -1.13313695958964 *
        GRP_RMntFrq3  +     1.21816928983774 * GRP_RMntFrq4
          +     0.28142803075343 * GRP_Recency2  +    -0.43031870131445 *
        GRP_Recency3  +    -0.98956301213704 * GRP_Recency4 ;
   H1x1_7  = H1x1_7  +     0.68410670134149 * GRP_AcceptedCmp52
          +     0.10121806405455 * GRP_Frq2  +     -1.8375798445876 * GRP_Frq3
          +     -2.3304704350487 * GRP_Frq4  +     -0.4064720818222 *
        GRP_Income2  +     1.14246001493098 * GRP_Income3
          +     0.30563934221376 * GRP_Income4  +    -1.03456782830408 *
        GRP_Mnt2  +     0.68732316665899 * GRP_Mnt3  +     0.12193839917197 *
        GRP_Mnt4  +     1.78947230945337 * GRP_MntFishProducts2
          +      -0.152562533802 * GRP_MntFishProducts3
          +     0.16800852501402 * GRP_MntFishProducts4
          +    -0.43436913890783 * GRP_MntGoldProds2
          +    -0.36427695823088 * GRP_MntGoldProds3
          +    -0.70562605444874 * GRP_MntGoldProds4
          +      1.1896868399991 * GRP_MntMeatProducts2
          +    -3.25683109762258 * GRP_MntMeatProducts3
          +     1.07082922763777 * GRP_MntMeatProducts4
          +     0.20781058114233 * GRP_MntWines2  +     0.58933954589501 *
        GRP_MntWines3  +    -0.47329387352048 * GRP_MntWines4
          +     2.86401269707592 * GRP_NumCatalogPurchases3
          +    -0.42660183421871 * GRP_NumCatalogPurchases4
          +     1.70072621341351 * GRP_NumDistPurchases2
          +    -0.01744947613595 * GRP_NumDistPurchases3
          +    -2.08742260039568 * GRP_NumDistPurchases4
          +    -1.04444309037822 * GRP_NumWebPurchases2
          +    -3.12746125340209 * GRP_NumWebPurchases3
          +    -0.71369198142362 * GRP_NumWebPurchases4
          +    -0.49060046002682 * GRP_RFMstat2  +     0.31117459893753 *
        GRP_RFMstat3  +     1.58479219562748 * GRP_RFMstat4
          +     0.16070553135537 * GRP_RMntFrq2  +    -1.17007677743781 *
        GRP_RMntFrq3  +    -0.89420472751582 * GRP_RMntFrq4
          +    -0.18368088096716 * GRP_Recency2  +    -0.51910607139607 *
        GRP_Recency3  +     0.01857782231504 * GRP_Recency4 ;
   H1x1_1  =     1.05791912072896 + H1x1_1 ;
   H1x1_2  =    -3.78026109193218 + H1x1_2 ;
   H1x1_3  =    -0.67855740578745 + H1x1_3 ;
   H1x1_4  =     1.43165665437202 + H1x1_4 ;
   H1x1_5  =     0.38366959591805 + H1x1_5 ;
   H1x1_6  =     3.31752226761072 + H1x1_6 ;
   H1x1_7  =    -0.85163584413854 + H1x1_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
   H1x1_6  = 1.0 / (1.0 + EXP(MIN( - H1x1_6 , _EXP_BAR)));
   H1x1_7  = 1.0 / (1.0 + EXP(MIN( - H1x1_7 , _EXP_BAR)));
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
   P_DepVar1  =    -4.35435611850415 * H1x1_1  +     3.06316051292344 * H1x1_2
          +     1.44284980602333 * H1x1_3  +    -3.32913686535523 * H1x1_4
          +     4.44336056081802 * H1x1_5  +    -4.57997435146105 * H1x1_6
          +      3.7324549254653 * H1x1_7 ;
   P_DepVar1  =    -0.50604500485068 + P_DepVar1 ;
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
* Renaming variables for AutoNeural22;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural22;
*------------------------------------------------------------*;
drop AutoNeural22_P_DepVar1;
AutoNeural22_P_DepVar1 = P_DepVar1;
drop AutoNeural22_P_DepVar0;
AutoNeural22_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural22;
*------------------------------------------------------------*;
length AutoNeural22_WARN_ $4;
drop AutoNeural22_WARN_;
AutoNeural22_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 3 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural21;
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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     1.28407338963657 * S_Year_Birth ;
   H1x1_2  =     2.38810822597472 * S_Year_Birth ;
   H1x1_3  =     -0.7204801808304 * S_Year_Birth ;
   H1x1_4  =    -0.06539124294592 * S_Year_Birth ;
   H1x1_5  =     0.03236440118268 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     2.33808165856563 * GRP_AcceptedCmp52
          +    -0.22986949765805 * GRP_Frq2  +     0.35082837363653 * GRP_Frq3
          +    -0.81539338849938 * GRP_Frq4  +     0.02220909701196 *
        GRP_Income2  +    -0.13099501713971 * GRP_Income3
          +     -0.0804536656406 * GRP_Income4  +    -1.59663744670427 *
        GRP_Mnt2  +    -0.75210072607852 * GRP_Mnt3  +     2.54348518711375 *
        GRP_Mnt4  +    -1.10495982071076 * GRP_MntFishProducts2
          +     0.01777635572399 * GRP_MntFishProducts3
          +     0.64964482065317 * GRP_MntFishProducts4
          +    -1.04611988857835 * GRP_MntGoldProds2
          +    -0.78605743432786 * GRP_MntGoldProds3
          +    -0.66472335544579 * GRP_MntGoldProds4
          +     1.30740864871492 * GRP_MntMeatProducts2
          +     2.64958489779167 * GRP_MntMeatProducts3
          +    -0.07163049651484 * GRP_MntMeatProducts4
          +     0.25422937257394 * GRP_MntWines2  +     4.96131673300801 *
        GRP_MntWines3  +     1.19639467926964 * GRP_MntWines4
          +     1.95336043181706 * GRP_NumCatalogPurchases3
          +    -1.04651597352668 * GRP_NumCatalogPurchases4
          +     2.10673800243141 * GRP_NumDistPurchases2
          +     1.49840431617564 * GRP_NumDistPurchases3
          +     2.97897302921808 * GRP_NumDistPurchases4
          +    -0.06881799061639 * GRP_NumWebPurchases2
          +     2.06509459645382 * GRP_NumWebPurchases3
          +     2.82361840359249 * GRP_NumWebPurchases4
          +    -0.22785891000012 * GRP_RFMstat2  +     0.11731067369321 *
        GRP_RFMstat3  +      2.1473773933678 * GRP_RFMstat4
          +    -0.84256952222829 * GRP_RMntFrq2  +     0.14220513090593 *
        GRP_RMntFrq3  +    -0.12372171572674 * GRP_RMntFrq4
          +    -0.31743815181215 * GRP_Recency2  +    -1.98918978493071 *
        GRP_Recency3  +    -0.65545972977238 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +     0.33200444555787 * GRP_AcceptedCmp52
          +     -0.8934566312976 * GRP_Frq2  +    -0.00243983936395 * GRP_Frq3
          +     0.63648993363629 * GRP_Frq4  +     0.05197343322571 *
        GRP_Income2  +     0.68177129296873 * GRP_Income3
          +     1.16889856198675 * GRP_Income4  +     0.52345733778819 *
        GRP_Mnt2  +     0.86891568330214 * GRP_Mnt3  +    -1.01013818778187 *
        GRP_Mnt4  +     0.01260306109505 * GRP_MntFishProducts2
          +     0.36267476732712 * GRP_MntFishProducts3
          +     -0.0117944700646 * GRP_MntFishProducts4
          +    -2.60247007794362 * GRP_MntGoldProds2
          +     1.49175629619075 * GRP_MntGoldProds3
          +     1.15735621033648 * GRP_MntGoldProds4
          +     -0.8857925625722 * GRP_MntMeatProducts2
          +    -1.11977905267757 * GRP_MntMeatProducts3
          +     0.89317411392862 * GRP_MntMeatProducts4
          +     1.08362434913444 * GRP_MntWines2  +    -2.34573154102981 *
        GRP_MntWines3  +    -1.04821908065864 * GRP_MntWines4
          +    -1.24280966967211 * GRP_NumCatalogPurchases3
          +      3.0326089053041 * GRP_NumCatalogPurchases4
          +     0.04779959574354 * GRP_NumDistPurchases2
          +     1.71017115843439 * GRP_NumDistPurchases3
          +     0.53628643929359 * GRP_NumDistPurchases4
          +     0.89950827667194 * GRP_NumWebPurchases2
          +    -0.92684592689592 * GRP_NumWebPurchases3
          +     2.96876986636503 * GRP_NumWebPurchases4
          +     0.63124526160033 * GRP_RFMstat2  +     1.50566150377083 *
        GRP_RFMstat3  +     1.62201671855053 * GRP_RFMstat4
          +     1.20404881746786 * GRP_RMntFrq2  +    -0.61586201148662 *
        GRP_RMntFrq3  +    -1.45102172370413 * GRP_RMntFrq4
          +     0.89969425569035 * GRP_Recency2  +     0.72245574147873 *
        GRP_Recency3  +     2.83083807801553 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +    -0.49052681984122 * GRP_AcceptedCmp52
          +     0.05710791956099 * GRP_Frq2  +     1.88983418164026 * GRP_Frq3
          +     0.23283788572694 * GRP_Frq4  +    -0.80169095220425 *
        GRP_Income2  +    -1.74093887199998 * GRP_Income3
          +    -0.35184466623661 * GRP_Income4  +     0.02791690171447 *
        GRP_Mnt2  +    -2.20424160961867 * GRP_Mnt3  +     0.50765331628654 *
        GRP_Mnt4  +     0.29403246554661 * GRP_MntFishProducts2
          +    -0.83380418052364 * GRP_MntFishProducts3
          +    -1.82543627661138 * GRP_MntFishProducts4
          +     0.39365380396703 * GRP_MntGoldProds2
          +     0.03998618589682 * GRP_MntGoldProds3
          +    -1.56455277750616 * GRP_MntGoldProds4
          +     0.07220994129439 * GRP_MntMeatProducts2
          +     1.10999034367361 * GRP_MntMeatProducts3
          +     0.63528886514116 * GRP_MntMeatProducts4
          +    -1.82455352991516 * GRP_MntWines2  +    -0.37467219689144 *
        GRP_MntWines3  +     0.51071844252207 * GRP_MntWines4
          +    -0.21422031720258 * GRP_NumCatalogPurchases3
          +    -3.11364867963994 * GRP_NumCatalogPurchases4
          +    -0.08758432252505 * GRP_NumDistPurchases2
          +    -0.24735131829279 * GRP_NumDistPurchases3
          +     1.22135970166178 * GRP_NumDistPurchases4
          +     0.57769775812299 * GRP_NumWebPurchases2
          +     4.20512829375782 * GRP_NumWebPurchases3
          +    -0.77892811708123 * GRP_NumWebPurchases4
          +    -1.48591575907258 * GRP_RFMstat2  +    -0.02715745890283 *
        GRP_RFMstat3  +    -1.82753253216976 * GRP_RFMstat4
          +     0.63517164755033 * GRP_RMntFrq2  +     3.41625861410136 *
        GRP_RMntFrq3  +    -1.06016238729643 * GRP_RMntFrq4
          +     0.96560069161334 * GRP_Recency2  +     2.60413272119793 *
        GRP_Recency3  +    -1.02278922860839 * GRP_Recency4 ;
   H1x1_4  = H1x1_4  +    -3.02372554661072 * GRP_AcceptedCmp52
          +     1.03599850000215 * GRP_Frq2  +     2.24242470356718 * GRP_Frq3
          +      3.4718187916521 * GRP_Frq4  +     1.28707236613409 *
        GRP_Income2  +    -1.54838965127225 * GRP_Income3
          +     2.52665199719571 * GRP_Income4  +    -2.14598289769275 *
        GRP_Mnt2  +    -1.04082723723167 * GRP_Mnt3  +    -1.68747662808983 *
        GRP_Mnt4  +     -0.8736100922486 * GRP_MntFishProducts2
          +     0.12779836724514 * GRP_MntFishProducts3
          +     0.60216313416651 * GRP_MntFishProducts4
          +     0.68165487174749 * GRP_MntGoldProds2
          +    -0.89672475622939 * GRP_MntGoldProds3
          +    -1.77795912962804 * GRP_MntGoldProds4
          +    -0.74193637631708 * GRP_MntMeatProducts2
          +    -3.00981763564253 * GRP_MntMeatProducts3
          +    -0.98818439514034 * GRP_MntMeatProducts4
          +    -0.81552449599254 * GRP_MntWines2  +    -1.24481835102021 *
        GRP_MntWines3  +     0.58877118654504 * GRP_MntWines4
          +    -0.10424789545355 * GRP_NumCatalogPurchases3
          +    -1.76322947168567 * GRP_NumCatalogPurchases4
          +     0.28024987640988 * GRP_NumDistPurchases2
          +    -0.26195842187994 * GRP_NumDistPurchases3
          +     1.27465783090106 * GRP_NumDistPurchases4
          +     0.56044035795721 * GRP_NumWebPurchases2
          +     -1.0019608410124 * GRP_NumWebPurchases3
          +    -1.00438490557229 * GRP_NumWebPurchases4
          +      0.1961165620509 * GRP_RFMstat2  +    -0.64166582924081 *
        GRP_RFMstat3  +     1.80597898183848 * GRP_RFMstat4
          +       0.012135091764 * GRP_RMntFrq2  +     -1.6713653901367 *
        GRP_RMntFrq3  +    -0.99155260811599 * GRP_RMntFrq4
          +    -1.41207701933445 * GRP_Recency2  +    -1.44162495285758 *
        GRP_Recency3  +    -1.33328278459656 * GRP_Recency4 ;
   H1x1_5  = H1x1_5  +    -2.91353005427803 * GRP_AcceptedCmp52
          +    -0.01308096407334 * GRP_Frq2  +    -0.45559322170718 * GRP_Frq3
          +    -0.49751279425547 * GRP_Frq4  +     0.02860594561374 *
        GRP_Income2  +     1.41758925806391 * GRP_Income3
          +     0.03726548596251 * GRP_Income4  +    -1.57900147909252 *
        GRP_Mnt2  +      2.3511697752438 * GRP_Mnt3  +     0.88048248424859 *
        GRP_Mnt4  +    -0.56545409501904 * GRP_MntFishProducts2
          +    -3.10608760567335 * GRP_MntFishProducts3
          +     1.06400320622897 * GRP_MntFishProducts4
          +     2.68670541844486 * GRP_MntGoldProds2
          +     0.07232195736653 * GRP_MntGoldProds3
          +     1.85531703888295 * GRP_MntGoldProds4
          +    -1.87162230531925 * GRP_MntMeatProducts2
          +    -1.13875662802599 * GRP_MntMeatProducts3
          +    -0.24099135606782 * GRP_MntMeatProducts4
          +    -0.13235213570702 * GRP_MntWines2  +    -0.50193070898101 *
        GRP_MntWines3  +     -0.1999771853027 * GRP_MntWines4
          +    -1.59837823433046 * GRP_NumCatalogPurchases3
          +    -3.92043146311091 * GRP_NumCatalogPurchases4
          +    -0.99805577329855 * GRP_NumDistPurchases2
          +     -2.4067364238872 * GRP_NumDistPurchases3
          +     0.25924131471222 * GRP_NumDistPurchases4
          +     0.70743157783391 * GRP_NumWebPurchases2
          +    -2.55740259562506 * GRP_NumWebPurchases3
          +     1.49837454147543 * GRP_NumWebPurchases4
          +     0.02282459900932 * GRP_RFMstat2  +     2.49823188893146 *
        GRP_RFMstat3  +      0.0125770688182 * GRP_RFMstat4
          +    -0.52646059416986 * GRP_RMntFrq2  +     0.48734306173312 *
        GRP_RMntFrq3  +     1.20982084491791 * GRP_RMntFrq4
          +     1.46024730556461 * GRP_Recency2  +     1.39328521843098 *
        GRP_Recency3  +     0.07072877455933 * GRP_Recency4 ;
   H1x1_1  =     2.28517939702199 + H1x1_1 ;
   H1x1_2  =      0.8100923065727 + H1x1_2 ;
   H1x1_3  =    -1.33120225377486 + H1x1_3 ;
   H1x1_4  =    -0.45230391783078 + H1x1_4 ;
   H1x1_5  =    -0.40460344381081 + H1x1_5 ;
   H1x1_6  = 0;
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 );
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
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
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
   P_DepVar1  =    -2.81431269255211 * H1x1_1  +       3.440967475001 * H1x1_2
          +     0.80588527631153 * H1x1_3  +    -2.86385782353564 * H1x1_4
          +     4.10205776026281 * H1x1_5  +    -2.89048426961502 * H1x1_6 ;
   P_DepVar1  =    -1.38440437244113 + P_DepVar1 ;
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
* Renaming variables for AutoNeural21;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural21;
*------------------------------------------------------------*;
drop AutoNeural21_P_DepVar1;
AutoNeural21_P_DepVar1 = P_DepVar1;
drop AutoNeural21_P_DepVar0;
AutoNeural21_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural21;
*------------------------------------------------------------*;
length AutoNeural21_WARN_ $4;
drop AutoNeural21_WARN_;
AutoNeural21_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 4 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural20;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =      1.0311746583126 * S_Year_Birth ;
   H1x1_2  =     1.67119181587557 * S_Year_Birth ;
   H1x1_3  =    -2.17540349820814 * S_Year_Birth ;
   H1x1_4  =    -2.56679893298362 * S_Year_Birth ;
   H1x1_5  =    -0.60932306642258 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     0.72534982243417 * GRP_AcceptedCmp52
          +     0.33166960090157 * GRP_Frq2  +     1.71697127611163 * GRP_Frq3
          +     0.81002020807326 * GRP_Frq4  +     0.48027973945372 *
        GRP_Income2  +    -1.09550149543369 * GRP_Income3
          +    -0.22235642667559 * GRP_Income4  +    -0.00978473434282 *
        GRP_Mnt2  +    -0.11796310741854 * GRP_Mnt3  +    -0.42227802637743 *
        GRP_Mnt4  +    -0.60021395849859 * GRP_MntFishProducts2
          +    -1.92253913417034 * GRP_MntFishProducts3
          +     0.11236967036572 * GRP_MntFishProducts4
          +     1.55117451498964 * GRP_MntGoldProds2
          +    -2.17638819155912 * GRP_MntGoldProds3
          +     1.12471370225173 * GRP_MntGoldProds4
          +     0.73773441156548 * GRP_MntMeatProducts2
          +     2.07738910661633 * GRP_MntMeatProducts3
          +    -0.64280630173292 * GRP_MntMeatProducts4
          +     0.77316083192112 * GRP_MntWines2  +     2.15867403144607 *
        GRP_MntWines3  +     2.47891578910494 * GRP_MntWines4
          +     0.27137671258246 * GRP_NumCatalogPurchases3
          +     1.17769351442984 * GRP_NumCatalogPurchases4
          +     1.22104662684375 * GRP_NumDistPurchases2
          +      3.4956187335148 * GRP_NumDistPurchases3
          +     1.44110988448724 * GRP_NumDistPurchases4
          +    -0.15910531424988 * GRP_NumWebPurchases2
          +      2.0651216353476 * GRP_NumWebPurchases3
          +     1.88264340284474 * GRP_NumWebPurchases4
          +    -0.51356035467324 * GRP_RFMstat2  +    -0.97145618762825 *
        GRP_RFMstat3  +     1.44865956224608 * GRP_RFMstat4
          +    -0.02171623156521 * GRP_RMntFrq2  +     2.25871822244977 *
        GRP_RMntFrq3  +    -0.95854946562766 * GRP_RMntFrq4
          +    -0.19279939282854 * GRP_Recency2  +    -0.59440462375689 *
        GRP_Recency3  +     -2.1494171625282 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +    -1.10416749938295 * GRP_AcceptedCmp52
          +     2.11163264556083 * GRP_Frq2  +    -0.30443521786246 * GRP_Frq3
          +     2.19401599825923 * GRP_Frq4  +    -0.38326784930815 *
        GRP_Income2  +    -0.07594895187003 * GRP_Income3
          +     0.98207007879144 * GRP_Income4  +    -1.92634732130472 *
        GRP_Mnt2  +     0.64603066612326 * GRP_Mnt3  +     0.62922821521966 *
        GRP_Mnt4  +     -0.4161962895106 * GRP_MntFishProducts2
          +     0.69185352158005 * GRP_MntFishProducts3
          +    -0.03493178084029 * GRP_MntFishProducts4
          +     1.51100187776315 * GRP_MntGoldProds2
          +     0.06501688279193 * GRP_MntGoldProds3
          +    -0.39137744731231 * GRP_MntGoldProds4
          +    -1.71718837423104 * GRP_MntMeatProducts2
          +    -2.21915390243757 * GRP_MntMeatProducts3
          +    -0.56748587906854 * GRP_MntMeatProducts4
          +     0.62307046604402 * GRP_MntWines2  +     0.47352126999194 *
        GRP_MntWines3  +      0.2191426110263 * GRP_MntWines4
          +     1.48903401021544 * GRP_NumCatalogPurchases3
          +     1.17263293507207 * GRP_NumCatalogPurchases4
          +     1.51105230747578 * GRP_NumDistPurchases2
          +     0.77634340058478 * GRP_NumDistPurchases3
          +    -0.03088809375301 * GRP_NumDistPurchases4
          +    -0.96601789395554 * GRP_NumWebPurchases2
          +     0.85040977160083 * GRP_NumWebPurchases3
          +     2.40308918299781 * GRP_NumWebPurchases4
          +     0.12282845458333 * GRP_RFMstat2  +    -0.98545061581559 *
        GRP_RFMstat3  +     1.25668440586033 * GRP_RFMstat4
          +     0.46767962398497 * GRP_RMntFrq2  +    -0.80481923203399 *
        GRP_RMntFrq3  +    -1.57392798605208 * GRP_RMntFrq4
          +     0.85109569398847 * GRP_Recency2  +     0.29456403684394 *
        GRP_Recency3  +     2.66867988462295 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +    -3.01879385716191 * GRP_AcceptedCmp52
          +    -0.13662280353682 * GRP_Frq2  +     2.51930889376721 * GRP_Frq3
          +     1.76895510412356 * GRP_Frq4  +     -0.5692048618965 *
        GRP_Income2  +     1.18033291239845 * GRP_Income3
          +    -0.64679354804447 * GRP_Income4  +    -1.28802047381892 *
        GRP_Mnt2  +    -2.46267752020506 * GRP_Mnt3  +     0.17133913926957 *
        GRP_Mnt4  +     1.27283832451603 * GRP_MntFishProducts2
          +    -0.25133476006515 * GRP_MntFishProducts3
          +     1.43382012526151 * GRP_MntFishProducts4
          +      0.6587510367878 * GRP_MntGoldProds2
          +    -2.29815972364167 * GRP_MntGoldProds3
          +    -1.17878838514109 * GRP_MntGoldProds4
          +    -1.45630165039671 * GRP_MntMeatProducts2
          +    -0.11970663820977 * GRP_MntMeatProducts3
          +    -0.76333182688138 * GRP_MntMeatProducts4
          +    -2.52565926826767 * GRP_MntWines2  +     0.00775439635111 *
        GRP_MntWines3  +    -1.79940008598217 * GRP_MntWines4
          +    -1.25235345037614 * GRP_NumCatalogPurchases3
          +    -3.32950963282576 * GRP_NumCatalogPurchases4
          +    -0.83062872942088 * GRP_NumDistPurchases2
          +      1.2644984519337 * GRP_NumDistPurchases3
          +     0.62516412515385 * GRP_NumDistPurchases4
          +    -0.91932392687811 * GRP_NumWebPurchases2
          +     0.63985001179952 * GRP_NumWebPurchases3
          +     0.11379774354586 * GRP_NumWebPurchases4
          +    -0.83336515651784 * GRP_RFMstat2  +    -0.76327708518862 *
        GRP_RFMstat3  +    -1.65882578353771 * GRP_RFMstat4
          +     0.96912805482142 * GRP_RMntFrq2  +     0.89830852536378 *
        GRP_RMntFrq3  +    -0.80853907149434 * GRP_RMntFrq4
          +    -1.09357609598677 * GRP_Recency2  +    -0.36348291669233 *
        GRP_Recency3  +    -1.63045870617841 * GRP_Recency4 ;
   H1x1_4  = H1x1_4  +    -0.22003392209515 * GRP_AcceptedCmp52
          +    -0.37446340795406 * GRP_Frq2  +    -0.00569020240777 * GRP_Frq3
          +     0.38116150545111 * GRP_Frq4  +    -0.36688806155078 *
        GRP_Income2  +     -4.2575032053121 * GRP_Income3
          +     1.51798546961788 * GRP_Income4  +    -0.88579848196414 *
        GRP_Mnt2  +     1.84159465073955 * GRP_Mnt3  +     0.11670514600746 *
        GRP_Mnt4  +    -3.46232646407418 * GRP_MntFishProducts2
          +     0.25005234850524 * GRP_MntFishProducts3
          +    -0.07970714752313 * GRP_MntFishProducts4
          +     -0.7495440064059 * GRP_MntGoldProds2
          +     -0.0659148563739 * GRP_MntGoldProds3
          +    -1.42445075896946 * GRP_MntGoldProds4
          +      0.1738975461322 * GRP_MntMeatProducts2
          +    -2.24799164386156 * GRP_MntMeatProducts3
          +    -1.67754357341899 * GRP_MntMeatProducts4
          +    -0.05307351478942 * GRP_MntWines2  +     -2.2168800511889 *
        GRP_MntWines3  +    -1.48732327222777 * GRP_MntWines4
          +    -0.36761319556449 * GRP_NumCatalogPurchases3
          +    -2.89167685306869 * GRP_NumCatalogPurchases4
          +    -0.48267351716569 * GRP_NumDistPurchases2
          +     0.93211719554417 * GRP_NumDistPurchases3
          +      1.1708430486506 * GRP_NumDistPurchases4
          +     0.03811902892169 * GRP_NumWebPurchases2
          +    -1.51477371309928 * GRP_NumWebPurchases3
          +     1.07378297590898 * GRP_NumWebPurchases4
          +     1.68393431629797 * GRP_RFMstat2  +     1.58685880164611 *
        GRP_RFMstat3  +     0.80759821340467 * GRP_RFMstat4
          +     1.66879117439255 * GRP_RMntFrq2  +     0.80834322412036 *
        GRP_RMntFrq3  +     0.23086766354714 * GRP_RMntFrq4
          +      1.3218682104263 * GRP_Recency2  +    -1.73155287312103 *
        GRP_Recency3  +     0.90108611111458 * GRP_Recency4 ;
   H1x1_5  = H1x1_5  +    -2.25400715952368 * GRP_AcceptedCmp52
          +    -0.68951263089678 * GRP_Frq2  +    -1.06579468283295 * GRP_Frq3
          +    -2.03202371442661 * GRP_Frq4  +      0.1036760802752 *
        GRP_Income2  +    -0.92046251438792 * GRP_Income3
          +     1.24075371479112 * GRP_Income4  +    -2.19069916142209 *
        GRP_Mnt2  +     1.76084360929533 * GRP_Mnt3  +     0.20732134279897 *
        GRP_Mnt4  +    -1.25213582301524 * GRP_MntFishProducts2
          +    -1.49559041774587 * GRP_MntFishProducts3
          +     1.29292270443546 * GRP_MntFishProducts4
          +     3.28109415592287 * GRP_MntGoldProds2
          +     0.40523569115651 * GRP_MntGoldProds3
          +        0.70305704265 * GRP_MntGoldProds4
          +    -1.85351989681271 * GRP_MntMeatProducts2
          +    -0.63625311683955 * GRP_MntMeatProducts3
          +     0.27320544681113 * GRP_MntMeatProducts4
          +     1.96095600251535 * GRP_MntWines2  +     2.24427494885455 *
        GRP_MntWines3  +    -0.88569250661863 * GRP_MntWines4
          +    -0.42794019910524 * GRP_NumCatalogPurchases3
          +    -2.32852367141603 * GRP_NumCatalogPurchases4
          +    -1.40970961318877 * GRP_NumDistPurchases2
          +     -2.5780841761751 * GRP_NumDistPurchases3
          +    -0.35557998232484 * GRP_NumDistPurchases4
          +     1.27746944985248 * GRP_NumWebPurchases2
          +     0.69463977283169 * GRP_NumWebPurchases3
          +    -0.54397813851169 * GRP_NumWebPurchases4
          +    -0.31669101358561 * GRP_RFMstat2  +     2.18799717857163 *
        GRP_RFMstat3  +    -0.42571916720282 * GRP_RFMstat4
          +     -0.8273646010144 * GRP_RMntFrq2  +     0.34575371088075 *
        GRP_RMntFrq3  +    -0.85751874647054 * GRP_RMntFrq4
          +    -1.53759054703623 * GRP_Recency2  +      0.1907268514387 *
        GRP_Recency3  +    -0.73522914565387 * GRP_Recency4 ;
   H1x1_1  =     0.19335754651259 + H1x1_1 ;
   H1x1_2  =     2.09010164778105 + H1x1_2 ;
   H1x1_3  =    -0.06489378657176 + H1x1_3 ;
   H1x1_4  =    -0.14814564965512 + H1x1_4 ;
   H1x1_5  =      1.2298003293092 + H1x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -1.88709734442083 * S_Year_Birth ;
   H1x2_2  =     0.39337522313841 * S_Year_Birth ;
   H1x2_3  =    -0.80137600943997 * S_Year_Birth ;
   H1x2_4  =     0.56552045600061 * S_Year_Birth ;
   H1x2_5  =     0.08757939638091 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +    -0.80297380803583 * GRP_AcceptedCmp52
          +     0.77171658129897 * GRP_Frq2  +    -1.90373500999925 * GRP_Frq3
          +     0.34067508173447 * GRP_Frq4  +    -3.40546398001194 *
        GRP_Income2  +      2.4308303101124 * GRP_Income3
          +      1.7371902933386 * GRP_Income4  +    -1.19436336479656 *
        GRP_Mnt2  +    -0.40996866110225 * GRP_Mnt3  +     1.04801669037568 *
        GRP_Mnt4  +     1.95500373096914 * GRP_MntFishProducts2
          +     2.51364109656281 * GRP_MntFishProducts3
          +    -1.42490007484769 * GRP_MntFishProducts4
          +    -0.45125943648795 * GRP_MntGoldProds2
          +     2.47102254724134 * GRP_MntGoldProds3
          +     -1.9039173262792 * GRP_MntGoldProds4
          +     0.19349291706995 * GRP_MntMeatProducts2
          +     1.13475826324844 * GRP_MntMeatProducts3
          +    -0.33642288502432 * GRP_MntMeatProducts4
          +     1.11286337512828 * GRP_MntWines2  +    -1.73349392468621 *
        GRP_MntWines3  +     0.82891272252224 * GRP_MntWines4
          +     0.15659125827236 * GRP_NumCatalogPurchases3
          +     0.32817066335176 * GRP_NumCatalogPurchases4
          +    -0.67313821415044 * GRP_NumDistPurchases2
          +    -0.96239937857546 * GRP_NumDistPurchases3
          +     0.32058507897383 * GRP_NumDistPurchases4
          +     0.02503658374779 * GRP_NumWebPurchases2
          +    -2.42182777667863 * GRP_NumWebPurchases3
          +     1.09934791830799 * GRP_NumWebPurchases4
          +     0.99647285457344 * GRP_RFMstat2  +    -1.81285090299632 *
        GRP_RFMstat3  +      0.6907946914019 * GRP_RFMstat4
          +    -0.96741541040827 * GRP_RMntFrq2  +     1.54078374992995 *
        GRP_RMntFrq3  +     -0.5606172121429 * GRP_RMntFrq4
          +     1.09972681443966 * GRP_Recency2  +     0.40240053086114 *
        GRP_Recency3  +     3.54622644138557 * GRP_Recency4 ;
   H1x2_2  = H1x2_2  +    -0.84257803770334 * GRP_AcceptedCmp52
          +    -1.76147524199782 * GRP_Frq2  +     0.76968937743693 * GRP_Frq3
          +     1.10861276861184 * GRP_Frq4  +    -2.23247622323833 *
        GRP_Income2  +    -0.30655302009971 * GRP_Income3
          +    -0.67421319601147 * GRP_Income4  +    -0.41833926468843 *
        GRP_Mnt2  +     0.52496961087688 * GRP_Mnt3  +     2.22224381605808 *
        GRP_Mnt4  +     1.90603665409631 * GRP_MntFishProducts2
          +    -0.68769529687639 * GRP_MntFishProducts3
          +     0.91046416847697 * GRP_MntFishProducts4
          +     1.93581182421904 * GRP_MntGoldProds2
          +     0.00795466624941 * GRP_MntGoldProds3
          +    -0.22854189252742 * GRP_MntGoldProds4
          +     0.51645804440055 * GRP_MntMeatProducts2
          +    -0.73677565057958 * GRP_MntMeatProducts3
          +    -3.38222954402665 * GRP_MntMeatProducts4
          +    -0.52703533326761 * GRP_MntWines2  +     2.68998648323277 *
        GRP_MntWines3  +    -1.01553943004578 * GRP_MntWines4
          +    -0.25257542492254 * GRP_NumCatalogPurchases3
          +     0.92868654767551 * GRP_NumCatalogPurchases4
          +    -0.18642581919214 * GRP_NumDistPurchases2
          +     0.32117397006136 * GRP_NumDistPurchases3
          +    -0.59059080451748 * GRP_NumDistPurchases4
          +    -1.05057528699441 * GRP_NumWebPurchases2
          +    -0.84936431958655 * GRP_NumWebPurchases3
          +     0.43322339989668 * GRP_NumWebPurchases4
          +    -0.27462600263662 * GRP_RFMstat2  +    -2.25150384807365 *
        GRP_RFMstat3  +    -0.00267009939433 * GRP_RFMstat4
          +     1.27314966261257 * GRP_RMntFrq2  +     0.27127797709217 *
        GRP_RMntFrq3  +     1.12101959838801 * GRP_RMntFrq4
          +     0.79686140512362 * GRP_Recency2  +      -3.204314799241 *
        GRP_Recency3  +    -0.17063922919112 * GRP_Recency4 ;
   H1x2_3  = H1x2_3  +     0.61950412844712 * GRP_AcceptedCmp52
          +     0.65265389665714 * GRP_Frq2  +     0.12876759740294 * GRP_Frq3
          +    -0.38017417695108 * GRP_Frq4  +    -0.54457623826836 *
        GRP_Income2  +     2.06545795697617 * GRP_Income3
          +     -0.2725653040132 * GRP_Income4  +     0.59334688450758 *
        GRP_Mnt2  +    -2.75668429292834 * GRP_Mnt3  +    -0.19086776143213 *
        GRP_Mnt4  +     -3.7490211951959 * GRP_MntFishProducts2
          +     -0.2747383185488 * GRP_MntFishProducts3
          +     0.05699547232616 * GRP_MntFishProducts4
          +     1.78340082221807 * GRP_MntGoldProds2
          +    -0.21272258173805 * GRP_MntGoldProds3
          +    -0.63881612523162 * GRP_MntGoldProds4
          +     0.35743242018534 * GRP_MntMeatProducts2
          +     0.39288166088974 * GRP_MntMeatProducts3
          +     0.68623350973697 * GRP_MntMeatProducts4
          +    -1.04284335042439 * GRP_MntWines2  +    -0.97636647224011 *
        GRP_MntWines3  +    -1.75436887389742 * GRP_MntWines4
          +     0.38349558810511 * GRP_NumCatalogPurchases3
          +     0.94944817324412 * GRP_NumCatalogPurchases4
          +     0.87924710032772 * GRP_NumDistPurchases2
          +     0.54658799433949 * GRP_NumDistPurchases3
          +     1.85594529989185 * GRP_NumDistPurchases4
          +    -0.66471569231333 * GRP_NumWebPurchases2
          +    -0.59461900037355 * GRP_NumWebPurchases3
          +     0.12806083458682 * GRP_NumWebPurchases4
          +    -0.75799558259662 * GRP_RFMstat2  +     1.03472328046295 *
        GRP_RFMstat3  +     0.35460394964665 * GRP_RFMstat4
          +     2.35757770027854 * GRP_RMntFrq2  +    -1.60760048151685 *
        GRP_RMntFrq3  +       1.734911990241 * GRP_RMntFrq4
          +    -0.50983934759213 * GRP_Recency2  +     1.22056684902473 *
        GRP_Recency3  +    -0.53617918353506 * GRP_Recency4 ;
   H1x2_4  = H1x2_4  +     1.26170976978884 * GRP_AcceptedCmp52
          +    -0.32711952545891 * GRP_Frq2  +    -1.19397195692697 * GRP_Frq3
          +    -1.91237681986457 * GRP_Frq4  +    -0.79449068445985 *
        GRP_Income2  +    -1.22812902448096 * GRP_Income3
          +     0.34997306488077 * GRP_Income4  +     0.97887573619442 *
        GRP_Mnt2  +    -0.47207479147139 * GRP_Mnt3  +    -0.72610866749196 *
        GRP_Mnt4  +    -1.02568945709262 * GRP_MntFishProducts2
          +    -0.50962348735329 * GRP_MntFishProducts3
          +    -1.75841654964734 * GRP_MntFishProducts4
          +     2.14839745385174 * GRP_MntGoldProds2
          +      2.4716387157729 * GRP_MntGoldProds3
          +     0.61286996367418 * GRP_MntGoldProds4
          +     1.45427097683349 * GRP_MntMeatProducts2
          +    -0.34990206215878 * GRP_MntMeatProducts3
          +     2.25284175811484 * GRP_MntMeatProducts4
          +      0.9855268124051 * GRP_MntWines2  +    -0.12203915234087 *
        GRP_MntWines3  +     0.25102207151836 * GRP_MntWines4
          +     1.02272173939472 * GRP_NumCatalogPurchases3
          +    -0.86507841983648 * GRP_NumCatalogPurchases4
          +    -0.44080685652484 * GRP_NumDistPurchases2
          +     2.40613428385819 * GRP_NumDistPurchases3
          +     0.26317801067025 * GRP_NumDistPurchases4
          +     2.34961138802546 * GRP_NumWebPurchases2
          +     2.35826990005342 * GRP_NumWebPurchases3
          +     0.18496434892584 * GRP_NumWebPurchases4
          +     1.79795147677472 * GRP_RFMstat2  +     0.58420175726653 *
        GRP_RFMstat3  +    -1.31222644039147 * GRP_RFMstat4
          +    -0.47605088519028 * GRP_RMntFrq2  +    -1.93444600786423 *
        GRP_RMntFrq3  +    -1.73270719079454 * GRP_RMntFrq4
          +    -0.07465628796168 * GRP_Recency2  +     0.39933484299815 *
        GRP_Recency3  +     1.24718444803263 * GRP_Recency4 ;
   H1x2_5  = H1x2_5  +     0.87459488954875 * GRP_AcceptedCmp52
          +    -0.84011640362753 * GRP_Frq2  +     0.77937376717729 * GRP_Frq3
          +    -1.82978666358622 * GRP_Frq4  +    -0.03003575117499 *
        GRP_Income2  +    -0.09211385255865 * GRP_Income3
          +    -1.94207051248492 * GRP_Income4  +     0.73641935783417 *
        GRP_Mnt2  +      -0.495669562808 * GRP_Mnt3  +    -0.04058774225968 *
        GRP_Mnt4  +     1.81606017533935 * GRP_MntFishProducts2
          +     -2.3817205567109 * GRP_MntFishProducts3
          +      1.4356293091772 * GRP_MntFishProducts4
          +    -1.03209023546079 * GRP_MntGoldProds2
          +     1.93949728331263 * GRP_MntGoldProds3
          +     0.44849194130528 * GRP_MntGoldProds4
          +     1.34973896956794 * GRP_MntMeatProducts2
          +     1.40989126474294 * GRP_MntMeatProducts3
          +     0.74435387703611 * GRP_MntMeatProducts4
          +     0.94293940682329 * GRP_MntWines2  +     0.71988830572011 *
        GRP_MntWines3  +     0.43603082498929 * GRP_MntWines4
          +     1.65449574071289 * GRP_NumCatalogPurchases3
          +    -0.66380394478337 * GRP_NumCatalogPurchases4
          +    -0.76749528874396 * GRP_NumDistPurchases2
          +     1.83370965910825 * GRP_NumDistPurchases3
          +    -0.73709156569506 * GRP_NumDistPurchases4
          +     0.09215124428658 * GRP_NumWebPurchases2
          +      1.0403096068891 * GRP_NumWebPurchases3
          +     0.59317560741224 * GRP_NumWebPurchases4
          +     1.75844403152209 * GRP_RFMstat2  +     -0.8733964014922 *
        GRP_RFMstat3  +    -0.76258024821499 * GRP_RFMstat4
          +    -1.62335267331435 * GRP_RMntFrq2  +     0.16774877520829 *
        GRP_RMntFrq3  +    -0.59672894733807 * GRP_RMntFrq4
          +     -0.1207352636629 * GRP_Recency2  +    -3.91419195768202 *
        GRP_Recency3  +    -1.81688897411428 * GRP_Recency4 ;
   H1x2_1  =     0.53421261957097 + H1x2_1 ;
   H1x2_2  =     0.61690490910033 + H1x2_2 ;
   H1x2_3  =    -1.82311183459857 + H1x2_3 ;
   H1x2_4  =    -0.21816223161936 + H1x2_4 ;
   H1x2_5  =     -0.4592254459549 + H1x2_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
   H1x2_5  = 1.0 / (1.0 + EXP(MIN( - H1x2_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -0.10131311732967 * H1x1_1  +     2.09604760546585 * H1x1_2
          +     0.75964449684316 * H1x1_3  +    -3.05899403391852 * H1x1_4
          +    -2.64491525760726 * H1x1_5 ;
   H2x1_2  =     2.09816176126174 * H1x1_1  +     -2.7170504295107 * H1x1_2
          +    -4.28573382707654 * H1x1_3  +     -0.4124455577826 * H1x1_4
          +    -1.74219234169061 * H1x1_5 ;
   H2x1_3  =     -0.0908396989213 * H1x1_1  +    -2.13315935484498 * H1x1_2
          +      -0.041102734605 * H1x1_3  +     0.44906302354183 * H1x1_4
          +     2.22045400368613 * H1x1_5 ;
   H2x1_4  =    -3.59138952025597 * H1x1_1  +     1.29340469653348 * H1x1_2
          +       1.689672422487 * H1x1_3  +    -2.31797692991787 * H1x1_4
          +    -2.53540958111863 * H1x1_5 ;
   H2x1_5  =    -1.20648019467275 * H1x1_1  +      1.9669218225267 * H1x1_2
          +     2.04494536709697 * H1x1_3  +    -2.33648894116384 * H1x1_4
          +    -1.60853492956388 * H1x1_5 ;
   H2x1_1  = H2x1_1  +    -1.45345171601353 * H1x2_1
          +    -0.03179259597665 * H1x2_2  +     -2.9887894366399 * H1x2_3
          +     0.68029332905711 * H1x2_4  +     0.76926185571867 * H1x2_5 ;
   H2x1_2  = H2x1_2  +    -1.21280301577117 * H1x2_1
          +      2.9525914680029 * H1x2_2  +    -0.55393861346072 * H1x2_3
          +     1.77793175958897 * H1x2_4  +     2.51042321881699 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     1.57047941405239 * H1x2_1
          +    -1.31134127121564 * H1x2_2  +      2.1322025881706 * H1x2_3
          +    -0.61230583564273 * H1x2_4  +     0.14627232119209 * H1x2_5 ;
   H2x1_4  = H2x1_4  +    -1.29890984989779 * H1x2_1
          +    -1.37863865683621 * H1x2_2  +    -0.15093392936569 * H1x2_3
          +     2.15628991822961 * H1x2_4  +    -0.04564203403522 * H1x2_5 ;
   H2x1_5  = H2x1_5  +    -1.82286870874677 * H1x2_1
          +    -1.06116903038863 * H1x2_2  +    -1.77472301413445 * H1x2_3
          +     0.17320934910404 * H1x2_4  +    -0.96172965375973 * H1x2_5 ;
   H2x1_1  =     0.61260716175728 + H2x1_1 ;
   H2x1_2  =    -1.78716565467594 + H2x1_2 ;
   H2x1_3  =    -0.88082814085488 + H2x1_3 ;
   H2x1_4  =     0.33869525080862 + H2x1_4 ;
   H2x1_5  =      2.0506883431914 + H2x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
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
   P_DepVar1  =     5.44508928953974 * H2x1_1  +    -7.80342156600058 * H2x1_2
          +    -4.34349012782915 * H2x1_3  +     6.80870509597821 * H2x1_4
          +     5.61199728345116 * H2x1_5 ;
   P_DepVar1  =    -3.84280322129048 + P_DepVar1 ;
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
* Renaming variables for AutoNeural20;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural20;
*------------------------------------------------------------*;
drop AutoNeural20_P_DepVar1;
AutoNeural20_P_DepVar1 = P_DepVar1;
drop AutoNeural20_P_DepVar0;
AutoNeural20_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural20;
*------------------------------------------------------------*;
length AutoNeural20_WARN_ $4;
drop AutoNeural20_WARN_;
AutoNeural20_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 5 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural26;
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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
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
   P_DepVar1  =     0.19741981116929 * S_Year_Birth ;
   P_DepVar1  = P_DepVar1  +    -1.04029441471903 * GRP_AcceptedCmp52
          +     1.55639377678382 * GRP_Frq2  +     0.31938212279872 * GRP_Frq3
          +    -0.51953925921981 * GRP_Frq4  +     0.69747847384334 *
        GRP_Income2  +     0.68377449690467 * GRP_Income3
          +    -0.69559233910784 * GRP_Income4  +    -0.33403886861179 *
        GRP_Mnt2  +    -0.23948445463576 * GRP_Mnt3  +     0.22705363969173 *
        GRP_Mnt4  +      0.5581826092154 * GRP_MntFishProducts2
          +     0.11895902038445 * GRP_MntFishProducts3
          +     -0.0194508409368 * GRP_MntFishProducts4
          +    -0.27172158371684 * GRP_MntGoldProds2
          +    -0.06617094209943 * GRP_MntGoldProds3
          +     0.04665050332743 * GRP_MntGoldProds4
          +    -0.97879858925028 * GRP_MntMeatProducts2
          +    -0.16953024357929 * GRP_MntMeatProducts3
          +     0.36702521764699 * GRP_MntMeatProducts4
          +     0.66896729653839 * GRP_MntWines2  +     0.41828147331708 *
        GRP_MntWines3  +    -0.39747979825201 * GRP_MntWines4
          +    -0.78725283014847 * GRP_NumCatalogPurchases3
          +     0.03702534142798 * GRP_NumCatalogPurchases4
          +    -1.86131730329435 * GRP_NumDistPurchases2
          +     -0.1744815262149 * GRP_NumDistPurchases3
          +     0.29974863559738 * GRP_NumDistPurchases4
          +     0.08237783693138 * GRP_NumWebPurchases2
          +     0.08904902237334 * GRP_NumWebPurchases3
          +     0.01729681908858 * GRP_NumWebPurchases4
          +    -0.55907537974858 * GRP_RFMstat2  +    -0.19529268587261 *
        GRP_RFMstat3  +     0.03932842736914 * GRP_RFMstat4
          +     0.24491355758464 * GRP_RMntFrq2  +     0.27364945694495 *
        GRP_RMntFrq3  +    -0.64678260362233 * GRP_RMntFrq4
          +     1.49706726643373 * GRP_Recency2  +     0.20083168709986 *
        GRP_Recency3  +    -0.57834308365674 * GRP_Recency4 ;
   P_DepVar1  =    -1.16466009831369 + P_DepVar1 ;
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
* Renaming variables for AutoNeural26;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural26;
*------------------------------------------------------------*;
drop AutoNeural26_P_DepVar1;
AutoNeural26_P_DepVar1 = P_DepVar1;
drop AutoNeural26_P_DepVar0;
AutoNeural26_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural26;
*------------------------------------------------------------*;
length AutoNeural26_WARN_ $4;
drop AutoNeural26_WARN_;
AutoNeural26_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 6 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural25;
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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     0.38021638611764 * S_Year_Birth ;
   H1x1_2  =      -1.088276895346 * S_Year_Birth ;
   H1x1_3  =    -0.21044864474556 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +    -1.19598236721657 * GRP_AcceptedCmp52
          +     0.89556920543007 * GRP_Frq2  +    -1.28633632438875 * GRP_Frq3
          +     1.09957277812081 * GRP_Frq4  +     1.66129248688789 *
        GRP_Income2  +    -0.02208859809261 * GRP_Income3
          +     0.13742442233856 * GRP_Income4  +     -0.8762617114278 *
        GRP_Mnt2  +     0.14483268386758 * GRP_Mnt3  +     1.46115917633769 *
        GRP_Mnt4  +     -0.6421408902491 * GRP_MntFishProducts2
          +      0.1128138472044 * GRP_MntFishProducts3
          +     1.21562636748698 * GRP_MntFishProducts4
          +     0.97422300880066 * GRP_MntGoldProds2
          +    -0.78007036389535 * GRP_MntGoldProds3
          +    -0.13814365615145 * GRP_MntGoldProds4
          +     1.35693955555286 * GRP_MntMeatProducts2
          +    -0.27598973191035 * GRP_MntMeatProducts3
          +     0.24526165671667 * GRP_MntMeatProducts4
          +    -2.07253692193163 * GRP_MntWines2  +    -0.82406684176795 *
        GRP_MntWines3  +     1.33606527822464 * GRP_MntWines4
          +    -1.54679770016919 * GRP_NumCatalogPurchases3
          +    -2.28037541698712 * GRP_NumCatalogPurchases4
          +     0.40979012613952 * GRP_NumDistPurchases2
          +     0.01840169060266 * GRP_NumDistPurchases3
          +     0.45490355508206 * GRP_NumDistPurchases4
          +     -2.5216795172343 * GRP_NumWebPurchases2
          +    -1.84801006282457 * GRP_NumWebPurchases3
          +    -1.97644985842889 * GRP_NumWebPurchases4
          +     1.42008839453911 * GRP_RFMstat2  +    -1.47553685202484 *
        GRP_RFMstat3  +     0.87098855427631 * GRP_RFMstat4
          +     1.05400168422125 * GRP_RMntFrq2  +    -0.41630002795032 *
        GRP_RMntFrq3  +     0.32151577305352 * GRP_RMntFrq4
          +    -0.40892574480582 * GRP_Recency2  +    -0.38760854674907 *
        GRP_Recency3  +    -1.01062906861757 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +    -0.22087092765683 * GRP_AcceptedCmp52
          +     0.86410922322484 * GRP_Frq2  +     1.63807214492524 * GRP_Frq3
          +    -1.25641751320277 * GRP_Frq4  +    -2.06319605492297 *
        GRP_Income2  +    -0.19570512199776 * GRP_Income3
          +    -1.02783445665559 * GRP_Income4  +     0.15804947667697 *
        GRP_Mnt2  +    -1.89927129454089 * GRP_Mnt3  +    -2.03683593435912 *
        GRP_Mnt4  +    -1.52161150732597 * GRP_MntFishProducts2
          +     1.31452667544583 * GRP_MntFishProducts3
          +     -1.7257971559668 * GRP_MntFishProducts4
          +     2.35872511454228 * GRP_MntGoldProds2
          +    -2.18519280701813 * GRP_MntGoldProds3
          +     2.11958828863486 * GRP_MntGoldProds4
          +     0.96289877666679 * GRP_MntMeatProducts2
          +     0.23432155256273 * GRP_MntMeatProducts3
          +     1.73039772995976 * GRP_MntMeatProducts4
          +    -0.42501510787424 * GRP_MntWines2  +    -1.52486822377888 *
        GRP_MntWines3  +      1.6227654564975 * GRP_MntWines4
          +    -1.89995561867666 * GRP_NumCatalogPurchases3
          +     0.67482053398184 * GRP_NumCatalogPurchases4
          +     0.66331524792021 * GRP_NumDistPurchases2
          +    -3.51633711874744 * GRP_NumDistPurchases3
          +    -2.78868266001809 * GRP_NumDistPurchases4
          +     0.48911700629841 * GRP_NumWebPurchases2
          +    -2.04233990579849 * GRP_NumWebPurchases3
          +     0.61493436153841 * GRP_NumWebPurchases4
          +    -0.04998034532745 * GRP_RFMstat2  +     0.70675221202708 *
        GRP_RFMstat3  +      1.1835788842441 * GRP_RFMstat4
          +    -1.59293821911804 * GRP_RMntFrq2  +    -2.00649847294694 *
        GRP_RMntFrq3  +     1.51867097620424 * GRP_RMntFrq4
          +     0.80524037758297 * GRP_Recency2  +     0.46947615167497 *
        GRP_Recency3  +    -0.02984024000355 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +     0.63511799928422 * GRP_AcceptedCmp52
          +      -2.298606068807 * GRP_Frq2  +     3.16864487857804 * GRP_Frq3
          +     3.03519261062887 * GRP_Frq4  +    -1.85162718986086 *
        GRP_Income2  +     0.41526825199627 * GRP_Income3
          +    -0.80593312350255 * GRP_Income4  +     1.66777476102634 *
        GRP_Mnt2  +     2.08848488119875 * GRP_Mnt3  +     0.65051244257971 *
        GRP_Mnt4  +     0.71847095407349 * GRP_MntFishProducts2
          +    -1.10257815890641 * GRP_MntFishProducts3
          +     2.17792588671141 * GRP_MntFishProducts4
          +     2.50223152259939 * GRP_MntGoldProds2
          +    -1.72156085851201 * GRP_MntGoldProds3
          +    -3.91709431063923 * GRP_MntGoldProds4
          +     -1.0779971381482 * GRP_MntMeatProducts2
          +    -1.47970774146601 * GRP_MntMeatProducts3
          +     1.27022891132009 * GRP_MntMeatProducts4
          +     0.48048593774493 * GRP_MntWines2  +     2.90436921022208 *
        GRP_MntWines3  +    -3.52082955604777 * GRP_MntWines4
          +    -0.04446993636304 * GRP_NumCatalogPurchases3
          +     0.63669224655802 * GRP_NumCatalogPurchases4
          +    -3.14645279004965 * GRP_NumDistPurchases2
          +    -2.33190469508132 * GRP_NumDistPurchases3
          +    -0.62827451633899 * GRP_NumDistPurchases4
          +    -1.01851610127648 * GRP_NumWebPurchases2
          +    -1.48934390537683 * GRP_NumWebPurchases3
          +    -0.53741548796796 * GRP_NumWebPurchases4
          +    -0.75492549718573 * GRP_RFMstat2  +     -0.7937620334965 *
        GRP_RFMstat3  +     1.16856250505521 * GRP_RFMstat4
          +     2.45700945744116 * GRP_RMntFrq2  +      2.6192187092108 *
        GRP_RMntFrq3  +    -0.99545519667238 * GRP_RMntFrq4
          +     -0.8178492657671 * GRP_Recency2  +     0.13605490470692 *
        GRP_Recency3  +    -0.93901422840588 * GRP_Recency4 ;
   H1x1_1  =      1.8884999595718 + H1x1_1 ;
   H1x1_2  =    -0.51989390923325 + H1x1_2 ;
   H1x1_3  =     2.10213347257206 + H1x1_3 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
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
   P_DepVar1  =    -2.62984121710329 * H1x1_1  +    -2.65642038715706 * H1x1_2
          +    -4.24846513249504 * H1x1_3 ;
   P_DepVar1  =     3.19982150134729 + P_DepVar1 ;
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
* Renaming variables for AutoNeural25;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural25;
*------------------------------------------------------------*;
drop AutoNeural25_P_DepVar1;
AutoNeural25_P_DepVar1 = P_DepVar1;
drop AutoNeural25_P_DepVar0;
AutoNeural25_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural25;
*------------------------------------------------------------*;
length AutoNeural25_WARN_ $4;
drop AutoNeural25_WARN_;
AutoNeural25_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Scoring Code of model 7 of 7;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural23;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

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
*** Writing the Node interval ;
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
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =     1.95381025032439 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     1.14916728016472 * GRP_AcceptedCmp52
          +    -5.96780006482557 * GRP_Frq2  +     4.49682337069914 * GRP_Frq3
          +    -1.00084168387427 * GRP_Frq4  +    -4.56848186498493 *
        GRP_Income2  +    -6.08290839556081 * GRP_Income3
          +        -1.9523756063 * GRP_Income4  +     2.25453632912582 *
        GRP_Mnt2  +     0.79226665009331 * GRP_Mnt3  +     4.62693684609359 *
        GRP_Mnt4  +     4.80720961994346 * GRP_MntFishProducts2
          +     5.98129040124117 * GRP_MntFishProducts3
          +    -7.67060692838644 * GRP_MntFishProducts4
          +    -2.17396725012949 * GRP_MntGoldProds2
          +     0.85597521158935 * GRP_MntGoldProds3
          +      2.1173332536462 * GRP_MntGoldProds4
          +     7.10141475402441 * GRP_MntMeatProducts2
          +     -4.9090455486088 * GRP_MntMeatProducts3
          +     2.83142638000959 * GRP_MntMeatProducts4
          +     3.69328975873193 * GRP_MntWines2  +      2.1695090110711 *
        GRP_MntWines3  +    -5.30256986722649 * GRP_MntWines4
          +     0.29736312872725 * GRP_NumCatalogPurchases3
          +     4.11382044060245 * GRP_NumCatalogPurchases4
          +    -6.25823764999595 * GRP_NumDistPurchases2
          +    -0.67901515881598 * GRP_NumDistPurchases3
          +     7.85932256128371 * GRP_NumDistPurchases4
          +     3.53767704202566 * GRP_NumWebPurchases2
          +    -6.48408913826017 * GRP_NumWebPurchases3
          +     4.25220646709256 * GRP_NumWebPurchases4
          +     1.52518398177008 * GRP_RFMstat2  +    -8.45537513058681 *
        GRP_RFMstat3  +      1.7628190243685 * GRP_RFMstat4
          +    -2.26342656707522 * GRP_RMntFrq2  +     0.15141321171269 *
        GRP_RMntFrq3  +     4.77478604851781 * GRP_RMntFrq4
          +     7.94049700164507 * GRP_Recency2  +     6.59302318386937 *
        GRP_Recency3  +    -1.94583979914797 * GRP_Recency4 ;
   H1x1_1  =     0.17797650232548 + H1x1_1 ;
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
   H1x2_1  =     -0.4803749248586 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +      -2.709334396045 * GRP_AcceptedCmp52
          +    -0.72996008627086 * GRP_Frq2  +     1.18917091356785 * GRP_Frq3
          +    -0.84357839249772 * GRP_Frq4  +    -1.34210240870748 *
        GRP_Income2  +    -2.49305097670051 * GRP_Income3
          +     0.47903160451188 * GRP_Income4  +    -0.21389782834045 *
        GRP_Mnt2  +    -2.96981107340783 * GRP_Mnt3  +     0.25136923781697 *
        GRP_Mnt4  +    -1.77015468345115 * GRP_MntFishProducts2
          +    -2.01927730228967 * GRP_MntFishProducts3
          +    -1.75480602447555 * GRP_MntFishProducts4
          +     0.42274303160257 * GRP_MntGoldProds2
          +     1.56137884413542 * GRP_MntGoldProds3
          +     0.84731732911707 * GRP_MntGoldProds4
          +     0.81025189254107 * GRP_MntMeatProducts2
          +     1.96319534444801 * GRP_MntMeatProducts3
          +     0.96127142865074 * GRP_MntMeatProducts4
          +    -0.93806166213097 * GRP_MntWines2  +     0.05312243237158 *
        GRP_MntWines3  +     0.84972126175769 * GRP_MntWines4
          +    -1.06178615974842 * GRP_NumCatalogPurchases3
          +     0.40580399494511 * GRP_NumCatalogPurchases4
          +      0.0678513615184 * GRP_NumDistPurchases2
          +     0.02437151967393 * GRP_NumDistPurchases3
          +     0.69402606373719 * GRP_NumDistPurchases4
          +       0.411121097653 * GRP_NumWebPurchases2
          +     0.82481677575773 * GRP_NumWebPurchases3
          +     1.41988866790215 * GRP_NumWebPurchases4
          +     0.85026610914091 * GRP_RFMstat2  +    -2.24707947369438 *
        GRP_RFMstat3  +     -1.1790000875996 * GRP_RFMstat4
          +     0.87106199482984 * GRP_RMntFrq2  +    -0.83130886232946 *
        GRP_RMntFrq3  +    -0.14994298443333 * GRP_RMntFrq4
          +      0.4148069318585 * GRP_Recency2  +     1.81524210481359 *
        GRP_Recency3  +    -0.14279288009067 * GRP_Recency4 ;
   H1x2_1  =    -1.10844381917328 + H1x2_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -4.35637031258639 * H1x1_1 ;
   H2x1_1  = H2x1_1  +    -3.33687841316643 * H1x2_1 ;
   H2x1_1  =     3.05963926783565 + H2x1_1 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
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
   P_DepVar1  =    -6.02136211154727 * H2x1_1 ;
   P_DepVar1  =     0.37595575621801 + P_DepVar1 ;
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
* Renaming variables for AutoNeural23;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural23;
*------------------------------------------------------------*;
drop AutoNeural23_P_DepVar1;
AutoNeural23_P_DepVar1 = P_DepVar1;
drop AutoNeural23_P_DepVar0;
AutoNeural23_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural23;
*------------------------------------------------------------*;
length AutoNeural23_WARN_ $4;
drop AutoNeural23_WARN_;
AutoNeural23_WARN_ = _WARN_;
*------------------------------------------------------------*;
* Ensmbl48: Average Posteriors of 7 models;
*------------------------------------------------------------*;
P_DepVar1 = (
AutoNeural24_P_DepVar1 +
AutoNeural22_P_DepVar1 +
AutoNeural21_P_DepVar1 +
AutoNeural20_P_DepVar1 +
AutoNeural26_P_DepVar1 +
AutoNeural25_P_DepVar1 +
AutoNeural23_P_DepVar1
)/7;
P_DepVar0 = (
AutoNeural24_P_DepVar0 +
AutoNeural22_P_DepVar0 +
AutoNeural21_P_DepVar0 +
AutoNeural20_P_DepVar0 +
AutoNeural26_P_DepVar0 +
AutoNeural25_P_DepVar0 +
AutoNeural23_P_DepVar0
)/7;
*------------------------------------------------------------*;
* Ensmbl48: Computing Classification Vars;
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
* Ensmbl48: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl48: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL24_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL24_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL24_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL24_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL22_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL22_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL22_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL22_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL21_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL21_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL21_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL21_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL20_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL20_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL20_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL20_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL26_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL26_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL26_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL26_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL25_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL25_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL25_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL25_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL23_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL23_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL23_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL23_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl48: Computing Residual Vars;
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
