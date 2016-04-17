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
NumDistPurchases = NumCatalogPurchases + NumWebPurchases;
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
;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.20808401117374 * GRP_AcceptedCmp52  +      1.5952064946991 *
        GRP_Frq2  +    -0.01225273525848 * GRP_Frq3  +    -0.62835698024634 *
        GRP_Frq4  +     0.44314401678348 * GRP_Income2
          +     0.89646769323205 * GRP_Income3  +    -0.90649183264259 *
        GRP_Income4  +    -0.55176085229947 * GRP_Mnt2
          +    -0.28020133968753 * GRP_Mnt3  +     0.17871933677614 * GRP_Mnt4
          +     0.38585041088838 * GRP_MntFishProducts2
          +    -0.22597951859521 * GRP_MntFishProducts3
          +    -0.12591354177724 * GRP_MntFishProducts4
          +     0.41517790727814 * GRP_MntGoldProds2
          +    -0.01783554546067 * GRP_MntGoldProds3
          +    -0.05254364640808 * GRP_MntGoldProds4
          +     0.11041766264422 * GRP_MntMeatProducts2
          +     0.80734417241917 * GRP_MntMeatProducts3
          +    -0.58385299076265 * GRP_MntMeatProducts4
          +     0.63351163942796 * GRP_MntWines2  +      0.4938617622427 *
        GRP_MntWines3  +     0.02607762678073 * GRP_MntWines4
          +    -1.43194573733764 * GRP_NumCatalogPurchases3
          +     0.55178119754186 * GRP_NumCatalogPurchases4
          +      -1.830671366144 * GRP_NumDistPurchases2
          +    -1.17053785506362 * GRP_NumDistPurchases3
          +     0.98564208160287 * GRP_NumDistPurchases4
          +    -0.22019170543618 * GRP_NumWebPurchases2
          +     0.12596691753667 * GRP_NumWebPurchases3
          +    -0.02882568244969 * GRP_NumWebPurchases4
          +    -0.21302125337044 * GRP_RFMstat2  +     0.08158805477511 *
        GRP_RFMstat3  +     -0.2631946184422 * GRP_RFMstat4
          +      0.1161399236304 * GRP_RMntFrq2  +     0.60576408771811 *
        GRP_RMntFrq3  +    -0.25254086880004 * GRP_RMntFrq4
          +      0.8664956591594 * GRP_Recency2  +     0.06243974875226 *
        GRP_Recency3  +    -0.38266930051466 * GRP_Recency4 ;
   H12  =    -1.49044065215331 * GRP_AcceptedCmp52  +     0.29747214763886 *
        GRP_Frq2  +     0.25845091468379 * GRP_Frq3  +    -0.12253400308729 *
        GRP_Frq4  +     0.67026230943159 * GRP_Income2
          +    -0.07529723714567 * GRP_Income3  +    -0.00656076113338 *
        GRP_Income4  +     0.11866607313287 * GRP_Mnt2
          +     0.50886534936331 * GRP_Mnt3  +    -0.40624874712256 * GRP_Mnt4
          +     0.07903512198302 * GRP_MntFishProducts2
          +     0.30094355054178 * GRP_MntFishProducts3
          +      0.1592854004233 * GRP_MntFishProducts4
          +    -0.71778183892118 * GRP_MntGoldProds2
          +    -0.00758784099151 * GRP_MntGoldProds3
          +    -0.05641788275636 * GRP_MntGoldProds4
          +    -1.00661051196007 * GRP_MntMeatProducts2
          +     -0.7897102230697 * GRP_MntMeatProducts3
          +     0.82643513947121 * GRP_MntMeatProducts4
          +     0.29396736594116 * GRP_MntWines2  +    -0.23616802309365 *
        GRP_MntWines3  +    -0.53754288840118 * GRP_MntWines4
          +     0.51299707442487 * GRP_NumCatalogPurchases3
          +    -0.50131971617023 * GRP_NumCatalogPurchases4
          +     -1.0244605634362 * GRP_NumDistPurchases2
          +     0.62371418531403 * GRP_NumDistPurchases3
          +     0.01028523337025 * GRP_NumDistPurchases4
          +     0.57550765494375 * GRP_NumWebPurchases2
          +     0.06426605759446 * GRP_NumWebPurchases3
          +     -0.0925907148366 * GRP_NumWebPurchases4
          +    -0.38247659021772 * GRP_RFMstat2  +    -0.19029293671326 *
        GRP_RFMstat3  +     0.43474715375598 * GRP_RFMstat4
          +     0.50016038621788 * GRP_RMntFrq2  +    -0.67187730592002 *
        GRP_RMntFrq3  +    -0.23217968284532 * GRP_RMntFrq4
          +     0.58211670962274 * GRP_Recency2  +     0.40065427673317 *
        GRP_Recency3  +     0.03489926907231 * GRP_Recency4 ;
   H11  =    -0.62541132065477 + H11 ;
   H12  =     1.33919796685016 + H12 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     2.63836588308478 * H11  +     2.61621667267981 * H12 ;
   P_DepVar1  =    -1.97856411598138 + P_DepVar1 ;
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
;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.20808401117374 * GRP_AcceptedCmp52  +      1.5952064946991 *
        GRP_Frq2  +    -0.01225273525848 * GRP_Frq3  +    -0.62835698024634 *
        GRP_Frq4  +     0.44314401678348 * GRP_Income2
          +     0.89646769323205 * GRP_Income3  +    -0.90649183264259 *
        GRP_Income4  +    -0.55176085229947 * GRP_Mnt2
          +    -0.28020133968753 * GRP_Mnt3  +     0.17871933677614 * GRP_Mnt4
          +     0.38585041088838 * GRP_MntFishProducts2
          +    -0.22597951859521 * GRP_MntFishProducts3
          +    -0.12591354177724 * GRP_MntFishProducts4
          +     0.41517790727814 * GRP_MntGoldProds2
          +    -0.01783554546067 * GRP_MntGoldProds3
          +    -0.05254364640808 * GRP_MntGoldProds4
          +     0.11041766264422 * GRP_MntMeatProducts2
          +     0.80734417241917 * GRP_MntMeatProducts3
          +    -0.58385299076265 * GRP_MntMeatProducts4
          +     0.63351163942796 * GRP_MntWines2  +      0.4938617622427 *
        GRP_MntWines3  +     0.02607762678073 * GRP_MntWines4
          +    -1.43194573733764 * GRP_NumCatalogPurchases3
          +     0.55178119754186 * GRP_NumCatalogPurchases4
          +      -1.830671366144 * GRP_NumDistPurchases2
          +    -1.17053785506362 * GRP_NumDistPurchases3
          +     0.98564208160287 * GRP_NumDistPurchases4
          +    -0.22019170543618 * GRP_NumWebPurchases2
          +     0.12596691753667 * GRP_NumWebPurchases3
          +    -0.02882568244969 * GRP_NumWebPurchases4
          +    -0.21302125337044 * GRP_RFMstat2  +     0.08158805477511 *
        GRP_RFMstat3  +     -0.2631946184422 * GRP_RFMstat4
          +      0.1161399236304 * GRP_RMntFrq2  +     0.60576408771811 *
        GRP_RMntFrq3  +    -0.25254086880004 * GRP_RMntFrq4
          +      0.8664956591594 * GRP_Recency2  +     0.06243974875226 *
        GRP_Recency3  +    -0.38266930051466 * GRP_Recency4 ;
   H12  =    -1.49044065215331 * GRP_AcceptedCmp52  +     0.29747214763886 *
        GRP_Frq2  +     0.25845091468379 * GRP_Frq3  +    -0.12253400308729 *
        GRP_Frq4  +     0.67026230943159 * GRP_Income2
          +    -0.07529723714567 * GRP_Income3  +    -0.00656076113338 *
        GRP_Income4  +     0.11866607313287 * GRP_Mnt2
          +     0.50886534936331 * GRP_Mnt3  +    -0.40624874712256 * GRP_Mnt4
          +     0.07903512198302 * GRP_MntFishProducts2
          +     0.30094355054178 * GRP_MntFishProducts3
          +      0.1592854004233 * GRP_MntFishProducts4
          +    -0.71778183892118 * GRP_MntGoldProds2
          +    -0.00758784099151 * GRP_MntGoldProds3
          +    -0.05641788275636 * GRP_MntGoldProds4
          +    -1.00661051196007 * GRP_MntMeatProducts2
          +     -0.7897102230697 * GRP_MntMeatProducts3
          +     0.82643513947121 * GRP_MntMeatProducts4
          +     0.29396736594116 * GRP_MntWines2  +    -0.23616802309365 *
        GRP_MntWines3  +    -0.53754288840118 * GRP_MntWines4
          +     0.51299707442487 * GRP_NumCatalogPurchases3
          +    -0.50131971617023 * GRP_NumCatalogPurchases4
          +     -1.0244605634362 * GRP_NumDistPurchases2
          +     0.62371418531403 * GRP_NumDistPurchases3
          +     0.01028523337025 * GRP_NumDistPurchases4
          +     0.57550765494375 * GRP_NumWebPurchases2
          +     0.06426605759446 * GRP_NumWebPurchases3
          +     -0.0925907148366 * GRP_NumWebPurchases4
          +    -0.38247659021772 * GRP_RFMstat2  +    -0.19029293671326 *
        GRP_RFMstat3  +     0.43474715375598 * GRP_RFMstat4
          +     0.50016038621788 * GRP_RMntFrq2  +    -0.67187730592002 *
        GRP_RMntFrq3  +    -0.23217968284532 * GRP_RMntFrq4
          +     0.58211670962274 * GRP_Recency2  +     0.40065427673317 *
        GRP_Recency3  +     0.03489926907231 * GRP_Recency4 ;
   H11  =    -0.62541132065477 + H11 ;
   H12  =     1.33919796685016 + H12 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     2.63836588308478 * H11  +     2.61621667267981 * H12 ;
   P_DepVar1  =    -1.97856411598138 + P_DepVar1 ;
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
;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
;
      label S_Mnt = 'Standard: Mnt' ;

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
   Mnt   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
END;
ELSE DO;
   IF MISSING( Mnt ) THEN S_Mnt  = . ;
   ELSE S_Mnt  =    -1.01843471091398 +      0.0016541571108 * Mnt ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.05639626836962 * S_Mnt ;
   H11  = H11  +      0.0860559154003 * GRP_AcceptedCmp52
          +    -0.19758814669075 * GRP_Frq2  +    -0.02279576157687 * GRP_Frq3
          +     0.07251746297433 * GRP_Frq4  +    -0.09591494883083 *
        GRP_Income2  +    -0.08058752115004 * GRP_Income3
          +     0.08588060203033 * GRP_Income4  +     0.05055584750276 *
        GRP_Mnt2  +     0.02545024725796 * GRP_Mnt3  +    -0.03224681694037 *
        GRP_Mnt4  +    -0.06357865903392 * GRP_MntFishProducts2
          +      -0.010948485075 * GRP_MntFishProducts3
          +     0.00472964640535 * GRP_MntFishProducts4
          +     0.02165833203111 * GRP_MntGoldProds2
          +     0.00197757925658 * GRP_MntGoldProds3
          +    -0.00068547899434 * GRP_MntGoldProds4
          +      0.1194292184341 * GRP_MntMeatProducts2
          +     0.01684568280033 * GRP_MntMeatProducts3
          +    -0.05297956014628 * GRP_MntMeatProducts4
          +    -0.11059672251142 * GRP_MntWines2  +     -0.0539431379238 *
        GRP_MntWines3  +     0.05538795967941 * GRP_MntWines4
          +     0.08963126282705 * GRP_NumCatalogPurchases3
          +    -0.00118154367452 * GRP_NumCatalogPurchases4
          +     0.23032337382095 * GRP_NumDistPurchases2
          +    -0.00108441464763 * GRP_NumDistPurchases3
          +    -0.04458982753158 * GRP_NumDistPurchases4
          +    -0.01380938735738 * GRP_NumWebPurchases2
          +    -0.01095215304735 * GRP_NumWebPurchases3
          +      0.0023394125329 * GRP_NumWebPurchases4
          +     0.05201697043713 * GRP_RFMstat2  +     0.00763917877705 *
        GRP_RFMstat3  +    -0.01926793167425 * GRP_RFMstat4
          +      -0.050495884949 * GRP_RMntFrq2  +    -0.03144438155835 *
        GRP_RMntFrq3  +     0.06453623203831 * GRP_RMntFrq4
          +    -0.15989883925465 * GRP_Recency2  +    -0.04220884971315 *
        GRP_Recency3  +     0.04819510617026 * GRP_Recency4 ;
   H11  =    -0.23141403821803 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -12.3989198958755 * H11 ;
   P_DepVar1  =    -4.61569089751973 + P_DepVar1 ;
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
;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.29083667179588 * GRP_AcceptedCmp52  +     0.25381514879511 *
        GRP_Frq2  +     0.24495490182169 * GRP_Frq3  +     0.08462614656895 *
        GRP_Frq4  +     0.42321493993551 * GRP_Income2
          +     0.73169928117081 * GRP_Income3  +    -0.05544320914832 *
        GRP_Income4  +    -0.24718669893416 * GRP_Mnt2
          +    -0.03207129144847 * GRP_Mnt3  +    -0.25388605829716 * GRP_Mnt4
          +     0.47035397187556 * GRP_MntFishProducts2
          +    -0.08037080105655 * GRP_MntFishProducts3
          +    -0.02398618871954 * GRP_MntFishProducts4
          +    -0.07937868050266 * GRP_MntGoldProds2
          +     0.05027448018004 * GRP_MntGoldProds3
          +     0.07901442033148 * GRP_MntGoldProds4
          +    -0.33936723350812 * GRP_MntMeatProducts2
          +    -0.04484529724292 * GRP_MntMeatProducts3
          +     -0.0415506520001 * GRP_MntMeatProducts4
          +     0.03804983893299 * GRP_MntWines2  +    -0.04512794010485 *
        GRP_MntWines3  +     0.13644345988766 * GRP_MntWines4
          +    -0.14757249557063 * GRP_NumCatalogPurchases3
          +     0.15425218359438 * GRP_NumCatalogPurchases4
          +    -0.29017371671497 * GRP_NumDistPurchases2
          +    -0.28697691933928 * GRP_NumDistPurchases3
          +    -0.14589186171246 * GRP_NumDistPurchases4
          +    -0.04161944892997 * GRP_NumWebPurchases2
          +     0.25846214028528 * GRP_NumWebPurchases3
          +    -0.05415601948083 * GRP_NumWebPurchases4
          +    -0.20357646739267 * GRP_RFMstat2  +    -0.63274902898209 *
        GRP_RFMstat3  +    -0.42178758375646 * GRP_RFMstat4
          +    -0.25050399122469 * GRP_RMntFrq2  +    -0.19112538807366 *
        GRP_RMntFrq3  +     0.09935328688472 * GRP_RMntFrq4
          +     0.87740211815385 * GRP_Recency2  +     0.02731074731084 *
        GRP_Recency3  +    -0.25335916751578 * GRP_Recency4 ;
   H12  =    -0.77250325436995 * GRP_AcceptedCmp52  +     0.15992276693905 *
        GRP_Frq2  +     0.03865511556705 * GRP_Frq3  +    -0.20632943014927 *
        GRP_Frq4  +     0.33135316311494 * GRP_Income2
          +     0.29584600709267 * GRP_Income3  +    -0.42334990488598 *
        GRP_Income4  +     0.15943867910214 * GRP_Mnt2
          +     0.17793824624027 * GRP_Mnt3  +     0.02858905887957 * GRP_Mnt4
          +     0.01579175161385 * GRP_MntFishProducts2
          +     0.17282640703406 * GRP_MntFishProducts3
          +     0.01086096638671 * GRP_MntFishProducts4
          +    -0.18985444898682 * GRP_MntGoldProds2
          +     0.21160891964242 * GRP_MntGoldProds3
          +     0.19583511822565 * GRP_MntGoldProds4
          +     -0.3456806985278 * GRP_MntMeatProducts2
          +    -0.22537760201843 * GRP_MntMeatProducts3
          +     0.25001144882227 * GRP_MntMeatProducts4
          +     0.50922766710996 * GRP_MntWines2  +     0.39373033292339 *
        GRP_MntWines3  +     -0.0631684381291 * GRP_MntWines4
          +    -0.44406418897674 * GRP_NumCatalogPurchases3
          +     0.04067400721697 * GRP_NumCatalogPurchases4
          +    -0.31103378362217 * GRP_NumDistPurchases2
          +     -0.2871376672979 * GRP_NumDistPurchases3
          +    -0.17746737696028 * GRP_NumDistPurchases4
          +     0.10647221525263 * GRP_NumWebPurchases2
          +    -0.41586902546761 * GRP_NumWebPurchases3
          +     0.04660436676773 * GRP_NumWebPurchases4
          +     0.09917764215284 * GRP_RFMstat2  +       0.119759461983 *
        GRP_RFMstat3  +     0.21805558451713 * GRP_RFMstat4
          +     0.22815675287087 * GRP_RMntFrq2  +     0.19732571474618 *
        GRP_RMntFrq3  +     0.07767050452748 * GRP_RMntFrq4
          +     0.46140797631862 * GRP_Recency2  +     0.17265446560815 *
        GRP_Recency3  +    -0.13764246969761 * GRP_Recency4 ;
   H13  =     0.47605838497596 * GRP_AcceptedCmp52  +    -0.24247551747681 *
        GRP_Frq2  +    -0.12921683287602 * GRP_Frq3  +     0.09997146415468 *
        GRP_Frq4  +    -0.33897508851515 * GRP_Income2
          +     0.02013725470644 * GRP_Income3  +     0.62243331624454 *
        GRP_Income4  +    -0.07907139789023 * GRP_Mnt2
          +     0.02855056853431 * GRP_Mnt3  +      0.0571426807888 * GRP_Mnt4
          +    -0.22089400263658 * GRP_MntFishProducts2
          +     0.03415513165136 * GRP_MntFishProducts3
          +     0.11107459135953 * GRP_MntFishProducts4
          +      0.1200436606288 * GRP_MntGoldProds2
          +      0.1845414926618 * GRP_MntGoldProds3
          +     0.05336685345848 * GRP_MntGoldProds4
          +     0.17651888017403 * GRP_MntMeatProducts2
          +    -0.19581823794868 * GRP_MntMeatProducts3
          +    -0.32374735747971 * GRP_MntMeatProducts4
          +    -0.29496513381505 * GRP_MntWines2  +     -0.1846298613936 *
        GRP_MntWines3  +     0.25702620460325 * GRP_MntWines4
          +     0.52809435848016 * GRP_NumCatalogPurchases3
          +     0.22555872046312 * GRP_NumCatalogPurchases4
          +      0.5816615934847 * GRP_NumDistPurchases2
          +    -0.05454598802009 * GRP_NumDistPurchases3
          +     0.10061932097301 * GRP_NumDistPurchases4
          +     0.10350223951336 * GRP_NumWebPurchases2
          +    -0.10094008849705 * GRP_NumWebPurchases3
          +    -0.28943674138057 * GRP_NumWebPurchases4
          +     0.18167045555206 * GRP_RFMstat2  +     -0.2440987298479 *
        GRP_RFMstat3  +    -0.21852350431632 * GRP_RFMstat4
          +       0.048115710925 * GRP_RMntFrq2  +    -0.19258956732647 *
        GRP_RMntFrq3  +     0.21827295876984 * GRP_RMntFrq4
          +    -0.86473147264012 * GRP_Recency2  +    -0.38058925082706 *
        GRP_Recency3  +     0.45619624848066 * GRP_Recency4 ;
   H14  =    -0.20005149248892 * GRP_AcceptedCmp52  +      0.1416453143658 *
        GRP_Frq2  +     0.16615391028307 * GRP_Frq3  +     0.24067740846414 *
        GRP_Frq4  +     0.44252646861104 * GRP_Income2
          +     0.38184638238718 * GRP_Income3  +    -0.31867045455591 *
        GRP_Income4  +    -0.04762919001724 * GRP_Mnt2
          +    -0.00736030333746 * GRP_Mnt3  +    -0.11335269869741 * GRP_Mnt4
          +     0.11397099518618 * GRP_MntFishProducts2
          +     0.02038390970846 * GRP_MntFishProducts3
          +     0.04901565572006 * GRP_MntFishProducts4
          +    -0.26210451979183 * GRP_MntGoldProds2
          +    -0.01291376301388 * GRP_MntGoldProds3
          +    -0.06291397841763 * GRP_MntGoldProds4
          +    -0.28346673842937 * GRP_MntMeatProducts2
          +    -0.22838601011576 * GRP_MntMeatProducts3
          +    -0.35737823232225 * GRP_MntMeatProducts4
          +     0.38985456021102 * GRP_MntWines2  +     0.10061935074263 *
        GRP_MntWines3  +    -0.49094420474651 * GRP_MntWines4
          +    -0.30332072511255 * GRP_NumCatalogPurchases3
          +    -0.13066216416331 * GRP_NumCatalogPurchases4
          +    -0.17811481527528 * GRP_NumDistPurchases2
          +     0.07507990088147 * GRP_NumDistPurchases3
          +    -0.01562644766888 * GRP_NumDistPurchases4
          +    -0.28058368395312 * GRP_NumWebPurchases2
          +     0.06601211704617 * GRP_NumWebPurchases3
          +    -0.11209964154167 * GRP_NumWebPurchases4
          +    -0.24339392229609 * GRP_RFMstat2  +     0.36921551965975 *
        GRP_RFMstat3  +     0.16127058585623 * GRP_RFMstat4
          +     0.01095276184609 * GRP_RMntFrq2  +    -0.21651603975876 *
        GRP_RMntFrq3  +    -0.44785793778994 * GRP_RMntFrq4
          +     0.37654423654871 * GRP_Recency2  +     0.21584324326396 *
        GRP_Recency3  +     0.06923981469933 * GRP_Recency4 ;
   H11  =    -0.90507468819856 + H11 ;
   H12  =    -0.58382573328779 + H12 ;
   H13  =     0.23395947148718 + H13 ;
   H14  =     0.78095059574137 + H14 ;
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
   P_DepVar1  =     1.27226040722218 * H11  +     1.29072977611751 * H12
          +    -1.13529049624055 * H13  +     1.42363080191112 * H14 ;
   P_DepVar1  =    -1.11430363057808 + P_DepVar1 ;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
*------------------------------------------------------------*;
* TOOL: Decision Tree;
* TYPE: MODEL;
* NODE: Tree3;
*------------------------------------------------------------*;
****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
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
LABEL I_DepVar  = 'Into: DepVar' ;
LABEL U_DepVar  = 'Unnormalized Into: DepVar' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


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
        _NODE_  =                   16;
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
        _NODE_  =                   17;
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
        _NODE_  =                   20;
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
        _NODE_  =                   21;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
_LP0 = _LP0 + (   -1.02877515677573) * _TEMP * _1_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (     1.9467311516595) * _TEMP * _2_0;
_LP0 = _LP0 + (    0.16734849497288) * _TEMP * _2_1;
_LP0 = _LP0 + (   -0.71216043302912) * _TEMP * _2_2;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (    1.00633080323166) * _TEMP * _3_0;
_LP0 = _LP0 + (    0.85917878021713) * _TEMP * _3_1;
_LP0 = _LP0 + (   -0.97761167986152) * _TEMP * _3_2;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.65248692594388) * _TEMP * _5_0;
_LP0 = _LP0 + (     0.0417259399181) * _TEMP * _5_1;
_LP0 = _LP0 + (   -0.05258075832348) * _TEMP * _5_2;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.48113569275309) * _TEMP * _7_0;
_LP0 = _LP0 + (   -0.22439832100882) * _TEMP * _7_1;
_LP0 = _LP0 + (     0.5480751224945) * _TEMP * _7_2;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    1.04449090892344) * _TEMP * _8_0;
_LP0 = _LP0 + (    0.44337701613731) * _TEMP * _8_1;
_LP0 = _LP0 + (   -0.60815032674089) * _TEMP * _8_2;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.14772939970229) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.01236638317437) * _TEMP * _9_1;

***  Effect: GRP_NumDistPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -2.65515163278803) * _TEMP * _10_0;
_LP0 = _LP0 + (    0.05356116501287) * _TEMP * _10_1;
_LP0 = _LP0 + (    0.54048303369343) * _TEMP * _10_2;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.25558521864842) * _TEMP * _13_0;
_LP0 = _LP0 + (    0.02282756746923) * _TEMP * _13_1;
_LP0 = _LP0 + (   -0.39418668032866) * _TEMP * _13_2;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    1.93344839762718) * _TEMP * _14_0;
_LP0 = _LP0 + (    0.53898198413912) * _TEMP * _14_1;
_LP0 = _LP0 + (   -0.59895640903963) * _TEMP * _14_2;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -1.75214170195592 + _LP0;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.47846451014473 * GRP_AcceptedCmp52  +     0.19123593876387 *
        GRP_Frq2  +     0.09643181492148 * GRP_Frq3  +     0.05144024674895 *
        GRP_Frq4  +     0.04295631018086 * GRP_Income2
          +     -0.1228594895838 * GRP_Income3  +    -0.24669259703155 *
        GRP_Income4  +    -0.12634710557505 * GRP_Mnt2
          +     0.06153848379201 * GRP_Mnt3  +    -0.25623825887978 * GRP_Mnt4
          +    -0.09885892988252 * GRP_MntFishProducts2
          +     0.08406776876431 * GRP_MntFishProducts3
          +    -0.01961506207304 * GRP_MntFishProducts4
          +     0.05865015349102 * GRP_MntGoldProds2
          +    -0.19025881153665 * GRP_MntGoldProds3
          +     0.11742267670165 * GRP_MntGoldProds4
          +    -0.48107725600014 * GRP_MntMeatProducts2
          +    -0.06405219545244 * GRP_MntMeatProducts3
          +    -0.28599597872655 * GRP_MntMeatProducts4
          +     0.09252331701173 * GRP_MntWines2  +    -0.01679973092371 *
        GRP_MntWines3  +    -0.28118765113398 * GRP_MntWines4
          +    -0.20589129984224 * GRP_NumCatalogPurchases3
          +     0.09269540062859 * GRP_NumCatalogPurchases4
          +    -0.21301173258264 * GRP_NumDistPurchases2
          +     0.02968077077204 * GRP_NumDistPurchases3
          +     0.37847518797466 * GRP_NumDistPurchases4
          +    -0.14460622553066 * GRP_NumWebPurchases2
          +     0.24087714617368 * GRP_NumWebPurchases3
          +     0.31645984538255 * GRP_NumWebPurchases4
          +    -0.21603366146166 * GRP_RFMstat2  +    -0.16662861409798 *
        GRP_RFMstat3  +     0.21007601365613 * GRP_RFMstat4
          +    -0.01443663304415 * GRP_RMntFrq2  +    -0.10326438582674 *
        GRP_RMntFrq3  +    -0.65474128199839 * GRP_RMntFrq4
          +     0.32165037855922 * GRP_Recency2  +     0.13838311684738 *
        GRP_Recency3  +     0.25495034500897 * GRP_Recency4 ;
   H12  =     0.19980227701329 * GRP_AcceptedCmp52  +     0.35227413860542 *
        GRP_Frq2  +    -0.08132751965568 * GRP_Frq3  +     0.06274660992037 *
        GRP_Frq4  +     0.14609729670665 * GRP_Income2
          +     -0.0521158725468 * GRP_Income3  +     0.29485821055626 *
        GRP_Income4  +     0.11491631500511 * GRP_Mnt2
          +    -0.48249282197964 * GRP_Mnt3  +    -0.43275960999945 * GRP_Mnt4
          +     0.23372129286866 * GRP_MntFishProducts2
          +     0.08173006283377 * GRP_MntFishProducts3
          +    -0.26374451563307 * GRP_MntFishProducts4
          +    -0.05478986771486 * GRP_MntGoldProds2
          +     0.15674217490538 * GRP_MntGoldProds3
          +     -0.0970693263223 * GRP_MntGoldProds4
          +    -0.07551339114514 * GRP_MntMeatProducts2
          +     0.20520020022282 * GRP_MntMeatProducts3
          +     0.18185271543305 * GRP_MntMeatProducts4
          +     0.13372808101693 * GRP_MntWines2  +    -0.23508613293176 *
        GRP_MntWines3  +     0.03782283781196 * GRP_MntWines4
          +    -0.01759208575836 * GRP_NumCatalogPurchases3
          +     0.03228155996803 * GRP_NumCatalogPurchases4
          +    -0.16689756602171 * GRP_NumDistPurchases2
          +     0.23008084678616 * GRP_NumDistPurchases3
          +      0.1020080832353 * GRP_NumDistPurchases4
          +     0.00689419482794 * GRP_NumWebPurchases2
          +     0.45549724613494 * GRP_NumWebPurchases3
          +     0.21666691620434 * GRP_NumWebPurchases4
          +    -0.02464138218078 * GRP_RFMstat2  +     0.13412544784153 *
        GRP_RFMstat3  +    -0.09645970560405 * GRP_RFMstat4
          +     0.04270814348512 * GRP_RMntFrq2  +     -0.1501520967589 *
        GRP_RMntFrq3  +     -0.1772447013278 * GRP_RMntFrq4
          +      0.1223375687576 * GRP_Recency2  +      0.1019105028487 *
        GRP_Recency3  +     0.06326170958276 * GRP_Recency4 ;
   H13  =    -0.47552326597307 * GRP_AcceptedCmp52  +     0.13942347151662 *
        GRP_Frq2  +     0.15792042601114 * GRP_Frq3  +    -0.31699137546772 *
        GRP_Frq4  +     0.31623959766757 * GRP_Income2
          +     0.51675448663341 * GRP_Income3  +    -0.28386096750656 *
        GRP_Income4  +    -0.19585257598596 * GRP_Mnt2
          +     0.03528129174811 * GRP_Mnt3  +     0.16020552351069 * GRP_Mnt4
          +     0.11549870508237 * GRP_MntFishProducts2
          +    -0.02472870244462 * GRP_MntFishProducts3
          +    -0.08397818027214 * GRP_MntFishProducts4
          +    -0.15352678487636 * GRP_MntGoldProds2
          +    -0.22936969994696 * GRP_MntGoldProds3
          +    -0.14955434708754 * GRP_MntGoldProds4
          +    -0.27851745198006 * GRP_MntMeatProducts2
          +    -0.20347624413948 * GRP_MntMeatProducts3
          +     0.22612412661729 * GRP_MntMeatProducts4
          +      0.0680550338972 * GRP_MntWines2  +     0.13605728094791 *
        GRP_MntWines3  +    -0.24233826362305 * GRP_MntWines4
          +    -0.51105265438413 * GRP_NumCatalogPurchases3
          +      0.3463181885617 * GRP_NumCatalogPurchases4
          +    -0.42061003686263 * GRP_NumDistPurchases2
          +     0.05694490202182 * GRP_NumDistPurchases3
          +    -0.05589065356183 * GRP_NumDistPurchases4
          +    -0.15004779907268 * GRP_NumWebPurchases2
          +    -0.03683214810286 * GRP_NumWebPurchases3
          +    -0.14152766915751 * GRP_NumWebPurchases4
          +    -0.34448387603605 * GRP_RFMstat2  +    -0.12678315363038 *
        GRP_RFMstat3  +    -0.17785766746488 * GRP_RFMstat4
          +    -0.12269367915474 * GRP_RMntFrq2  +     0.15261716486225 *
        GRP_RMntFrq3  +    -0.14834283523731 * GRP_RMntFrq4
          +     0.41906757309616 * GRP_Recency2  +     0.11383836551208 *
        GRP_Recency3  +    -0.50873022901358 * GRP_Recency4 ;
   H14  =     0.47487308000188 * GRP_AcceptedCmp52  +    -0.20783874293801 *
        GRP_Frq2  +     -0.2262487293265 * GRP_Frq3  +    -0.24497015722444 *
        GRP_Frq4  +    -0.41352416374349 * GRP_Income2
          +    -0.19029917786221 * GRP_Income3  +     0.44371774186743 *
        GRP_Income4  +     0.03966957052109 * GRP_Mnt2
          +     0.21041258864544 * GRP_Mnt3  +    -0.03545115071009 * GRP_Mnt4
          +     -0.3523117475999 * GRP_MntFishProducts2
          +     0.01075749365425 * GRP_MntFishProducts3
          +    -0.19220397921061 * GRP_MntFishProducts4
          +     0.24691019907326 * GRP_MntGoldProds2
          +    -0.36269131170152 * GRP_MntGoldProds3
          +    -0.07442729340208 * GRP_MntGoldProds4
          +     0.14166838567576 * GRP_MntMeatProducts2
          +     -0.0573636128895 * GRP_MntMeatProducts3
          +     0.11782684497872 * GRP_MntMeatProducts4
          +    -0.58306293735162 * GRP_MntWines2  +     -0.1332347200661 *
        GRP_MntWines3  +     -0.0491151521812 * GRP_MntWines4
          +     0.19217394838443 * GRP_NumCatalogPurchases3
          +     0.30242368378572 * GRP_NumCatalogPurchases4
          +      0.5631335040028 * GRP_NumDistPurchases2
          +      0.2833277493575 * GRP_NumDistPurchases3
          +     0.15501991757103 * GRP_NumDistPurchases4
          +     0.06522663204791 * GRP_NumWebPurchases2
          +    -0.24250508241812 * GRP_NumWebPurchases3
          +    -0.14936719392927 * GRP_NumWebPurchases4
          +     0.07538326365237 * GRP_RFMstat2  +    -0.11207708467015 *
        GRP_RFMstat3  +    -0.03495013261696 * GRP_RFMstat4
          +    -0.07948642963964 * GRP_RMntFrq2  +     -0.3740993499425 *
        GRP_RMntFrq3  +      0.1224880912483 * GRP_RMntFrq4
          +    -1.20234498415322 * GRP_Recency2  +    -0.15277267671243 *
        GRP_Recency3  +     0.17498175973385 * GRP_Recency4 ;
   H15  =     0.31607756545434 * GRP_AcceptedCmp52  +    -0.39938983779344 *
        GRP_Frq2  +     0.14190381114364 * GRP_Frq3  +    -0.04654073105991 *
        GRP_Frq4  +    -0.46847099915399 * GRP_Income2
          +    -0.24521056791482 * GRP_Income3  +     0.29673900247528 *
        GRP_Income4  +    -0.24347594694596 * GRP_Mnt2
          +    -0.25470417967356 * GRP_Mnt3  +     -0.3155333752807 * GRP_Mnt4
          +    -0.16164851437662 * GRP_MntFishProducts2
          +    -0.07507872874942 * GRP_MntFishProducts3
          +     -0.0000128165366 * GRP_MntFishProducts4
          +    -0.13003975496355 * GRP_MntGoldProds2
          +     0.10076462685161 * GRP_MntGoldProds3
          +     0.06823082371801 * GRP_MntGoldProds4
          +    -0.06661203056726 * GRP_MntMeatProducts2
          +     0.21135583081997 * GRP_MntMeatProducts3
          +     0.05317467469941 * GRP_MntMeatProducts4
          +     -0.6790577471338 * GRP_MntWines2  +    -0.29030845400198 *
        GRP_MntWines3  +     0.17538455641954 * GRP_MntWines4
          +     0.27411589551701 * GRP_NumCatalogPurchases3
          +     0.33639439802576 * GRP_NumCatalogPurchases4
          +     0.37202178791302 * GRP_NumDistPurchases2
          +     0.21242089259106 * GRP_NumDistPurchases3
          +     0.01745612539369 * GRP_NumDistPurchases4
          +     0.06417261665114 * GRP_NumWebPurchases2
          +     0.34302874594069 * GRP_NumWebPurchases3
          +     0.08556934131582 * GRP_NumWebPurchases4
          +    -0.01317484038203 * GRP_RFMstat2  +    -0.26798645102872 *
        GRP_RFMstat3  +    -0.23199496411354 * GRP_RFMstat4
          +    -0.36396476479849 * GRP_RMntFrq2  +    -0.16838193614715 *
        GRP_RMntFrq3  +       0.051807632343 * GRP_RMntFrq4
          +    -0.13014582685433 * GRP_Recency2  +     0.01537566565331 *
        GRP_Recency3  +      0.1365007617785 * GRP_Recency4 ;
   H11  =    -0.02804722687441 + H11 ;
   H12  =    -1.15173994765723 + H12 ;
   H13  =     0.30124306509106 + H13 ;
   H14  =    -0.37792609262463 + H14 ;
   H15  =     0.46405557098176 + H15 ;
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
   P_DepVar1  =     1.14388401268032 * H11  +      0.6001876010487 * H12
          +     2.09526498410663 * H13  +    -1.84849014758118 * H14
          +    -1.09009016441951 * H15 ;
   P_DepVar1  =    -1.61414772995986 + P_DepVar1 ;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.33640101965956 * GRP_AcceptedCmp52  +    -0.09458866011332 *
        GRP_Frq2  +     0.08165112288668 * GRP_Frq3  +      0.0098569396377 *
        GRP_Frq4  +    -0.10718097600137 * GRP_Income2
          +     0.24913133317457 * GRP_Income3  +     0.08606607454597 *
        GRP_Income4  +    -0.43083911296417 * GRP_Mnt2
          +    -0.35952383025836 * GRP_Mnt3  +     0.15746774085254 * GRP_Mnt4
          +     0.03496490321939 * GRP_MntFishProducts2
          +     -0.1386775704024 * GRP_MntFishProducts3
          +     0.08185130088727 * GRP_MntFishProducts4
          +     0.20666000615395 * GRP_MntGoldProds2
          +     0.02513603537885 * GRP_MntGoldProds3
          +     0.04518515377846 * GRP_MntGoldProds4
          +     0.14564741446952 * GRP_MntMeatProducts2
          +      0.0921407018606 * GRP_MntMeatProducts3
          +     0.03964574584898 * GRP_MntMeatProducts4
          +    -0.10395279216819 * GRP_MntWines2  +     0.12929231428625 *
        GRP_MntWines3  +     0.00045903854959 * GRP_MntWines4
          +    -0.03496333349231 * GRP_NumCatalogPurchases3
          +    -0.18329339773791 * GRP_NumCatalogPurchases4
          +     0.25535533392017 * GRP_NumDistPurchases2
          +     0.03881117716273 * GRP_NumDistPurchases3
          +    -0.02565551941415 * GRP_NumDistPurchases4
          +     0.31760052513768 * GRP_NumWebPurchases2
          +     0.09995149350563 * GRP_NumWebPurchases3
          +    -0.03267834031943 * GRP_NumWebPurchases4
          +     0.20523977712748 * GRP_RFMstat2  +    -0.05606160362426 *
        GRP_RFMstat3  +     0.08166835774422 * GRP_RFMstat4
          +    -0.02802261136507 * GRP_RMntFrq2  +     0.04530681268814 *
        GRP_RMntFrq3  +     0.17075869124019 * GRP_RMntFrq4
          +    -0.07437386313878 * GRP_Recency2  +    -0.03620176560114 *
        GRP_Recency3  +     -0.1829690397052 * GRP_Recency4 ;
   H12  =    -0.44053040668419 * GRP_AcceptedCmp52  +     0.39130488780547 *
        GRP_Frq2  +    -0.05339083882864 * GRP_Frq3  +     0.00231451089906 *
        GRP_Frq4  +      0.5831587240061 * GRP_Income2
          +     0.54852848249408 * GRP_Income3  +     -0.4598479622494 *
        GRP_Income4  +     0.04804779326921 * GRP_Mnt2
          +    -0.18484356222731 * GRP_Mnt3  +     0.03549703658034 * GRP_Mnt4
          +     0.39885742453554 * GRP_MntFishProducts2
          +     0.15761355687754 * GRP_MntFishProducts3
          +    -0.21271471925571 * GRP_MntFishProducts4
          +     -0.1972927903123 * GRP_MntGoldProds2
          +     0.03399122417272 * GRP_MntGoldProds3
          +    -0.02558670857298 * GRP_MntGoldProds4
          +    -0.41984327217018 * GRP_MntMeatProducts2
          +     0.05051071020912 * GRP_MntMeatProducts3
          +     0.02213191751142 * GRP_MntMeatProducts4
          +     0.27725513562646 * GRP_MntWines2  +    -0.13825638111274 *
        GRP_MntWines3  +     0.10174302336793 * GRP_MntWines4
          +    -0.13050806508623 * GRP_NumCatalogPurchases3
          +     0.18000903281461 * GRP_NumCatalogPurchases4
          +     -0.5134802042985 * GRP_NumDistPurchases2
          +     -0.0517830924312 * GRP_NumDistPurchases3
          +    -0.16980153882394 * GRP_NumDistPurchases4
          +     0.03868274112159 * GRP_NumWebPurchases2
          +     0.16193614709489 * GRP_NumWebPurchases3
          +      0.0269423998237 * GRP_NumWebPurchases4
          +    -0.32452106975443 * GRP_RFMstat2  +    -0.21611965835421 *
        GRP_RFMstat3  +    -0.11926055719327 * GRP_RFMstat4
          +     0.21187682021828 * GRP_RMntFrq2  +     0.08976835265364 *
        GRP_RMntFrq3  +    -0.20787348857522 * GRP_RMntFrq4
          +     0.68804853934306 * GRP_Recency2  +     0.17422440486451 *
        GRP_Recency3  +    -0.18452599729833 * GRP_Recency4 ;
   H13  =      0.0874014291812 * GRP_AcceptedCmp52  +     0.17304198694157 *
        GRP_Frq2  +    -0.11491629051719 * GRP_Frq3  +      0.2483225021197 *
        GRP_Frq4  +    -0.05989120739582 * GRP_Income2
          +    -0.02732012571019 * GRP_Income3  +     0.20807069048689 *
        GRP_Income4  +     0.33666649935924 * GRP_Mnt2
          +      0.0642358727731 * GRP_Mnt3  +    -0.22568229208697 * GRP_Mnt4
          +    -0.12147573127033 * GRP_MntFishProducts2
          +    -0.19323607018295 * GRP_MntFishProducts3
          +     0.25863847748437 * GRP_MntFishProducts4
          +     -0.0126645668436 * GRP_MntGoldProds2
          +    -0.11323357258997 * GRP_MntGoldProds3
          +    -0.11250689806163 * GRP_MntGoldProds4
          +    -0.12545641044895 * GRP_MntMeatProducts2
          +    -0.04305442792903 * GRP_MntMeatProducts3
          +    -0.32146302728834 * GRP_MntMeatProducts4
          +    -0.00148263872712 * GRP_MntWines2  +     0.11028478479749 *
        GRP_MntWines3  +    -0.02542826671873 * GRP_MntWines4
          +    -0.03468933342665 * GRP_NumCatalogPurchases3
          +     0.06081255664838 * GRP_NumCatalogPurchases4
          +     0.09115957554684 * GRP_NumDistPurchases2
          +    -0.19448624046951 * GRP_NumDistPurchases3
          +     0.18401866660579 * GRP_NumDistPurchases4
          +    -0.30934548179162 * GRP_NumWebPurchases2
          +    -0.15569430268918 * GRP_NumWebPurchases3
          +    -0.15912290396059 * GRP_NumWebPurchases4
          +      0.3307600563141 * GRP_RFMstat2  +    -0.22709032656384 *
        GRP_RFMstat3  +      0.0673885738463 * GRP_RFMstat4
          +    -0.34782658221729 * GRP_RMntFrq2  +    -0.37292996378384 *
        GRP_RMntFrq3  +    -0.19656647007955 * GRP_RMntFrq4
          +    -0.48292133112766 * GRP_Recency2  +    -0.19998163272412 *
        GRP_Recency3  +     0.04020306752703 * GRP_Recency4 ;
   H14  =    -0.06535462604618 * GRP_AcceptedCmp52  +    -0.02538966501603 *
        GRP_Frq2  +    -0.37465930862485 * GRP_Frq3  +    -0.09115714895281 *
        GRP_Frq4  +    -0.19377207233976 * GRP_Income2
          +     0.19699955617479 * GRP_Income3  +     0.18620312701109 *
        GRP_Income4  +    -0.07918752617024 * GRP_Mnt2
          +    -0.15791729955854 * GRP_Mnt3  +     0.05785915035978 * GRP_Mnt4
          +    -0.15621920593365 * GRP_MntFishProducts2
          +     0.18156570239129 * GRP_MntFishProducts3
          +    -0.19268366331472 * GRP_MntFishProducts4
          +     0.17003324763884 * GRP_MntGoldProds2
          +    -0.24315925332299 * GRP_MntGoldProds3
          +    -0.19433542142509 * GRP_MntGoldProds4
          +     0.48300099715349 * GRP_MntMeatProducts2
          +     0.04287374992788 * GRP_MntMeatProducts3
          +    -0.14772483570864 * GRP_MntMeatProducts4
          +    -0.35939710533055 * GRP_MntWines2  +      0.0814263252657 *
        GRP_MntWines3  +     0.11455106831693 * GRP_MntWines4
          +     0.28909689894797 * GRP_NumCatalogPurchases3
          +     0.35798075318799 * GRP_NumCatalogPurchases4
          +     0.26175622277157 * GRP_NumDistPurchases2
          +    -0.28134203235556 * GRP_NumDistPurchases3
          +     -0.0849885153607 * GRP_NumDistPurchases4
          +    -0.00363026409862 * GRP_NumWebPurchases2
          +    -0.18458881565534 * GRP_NumWebPurchases3
          +    -0.00054495066636 * GRP_NumWebPurchases4
          +     0.02464665365087 * GRP_RFMstat2  +    -0.04709787167688 *
        GRP_RFMstat3  +    -0.21485621631981 * GRP_RFMstat4
          +      0.0421527075159 * GRP_RMntFrq2  +     0.12266531817421 *
        GRP_RMntFrq3  +     0.34319246452663 * GRP_RMntFrq4
          +    -0.42128751178743 * GRP_Recency2  +    -0.03341002800803 *
        GRP_Recency3  +    -0.00550102888585 * GRP_Recency4 ;
   H15  =     0.20080324976316 * GRP_AcceptedCmp52  +     0.03346464595946 *
        GRP_Frq2  +    -0.46550936235158 * GRP_Frq3  +     0.11038114045006 *
        GRP_Frq4  +     0.10073875117437 * GRP_Income2
          +    -0.22683871345668 * GRP_Income3  +    -0.09384548786395 *
        GRP_Income4  +     0.43323607707701 * GRP_Mnt2
          +     0.27829480348267 * GRP_Mnt3  +     0.12638599389415 * GRP_Mnt4
          +     0.02417129110075 * GRP_MntFishProducts2
          +      0.2545897829616 * GRP_MntFishProducts3
          +    -0.29458064807823 * GRP_MntFishProducts4
          +    -0.15364697476117 * GRP_MntGoldProds2
          +      0.3170384910511 * GRP_MntGoldProds3
          +     0.43731794737697 * GRP_MntGoldProds4
          +     0.51501086483907 * GRP_MntMeatProducts2
          +     0.15231215210229 * GRP_MntMeatProducts3
          +    -0.05381144096743 * GRP_MntMeatProducts4
          +     0.13508510112509 * GRP_MntWines2  +    -0.33096430220175 *
        GRP_MntWines3  +     0.49248642584759 * GRP_MntWines4
          +     0.25386528096127 * GRP_NumCatalogPurchases3
          +     0.31775128798882 * GRP_NumCatalogPurchases4
          +     0.26152832976302 * GRP_NumDistPurchases2
          +     0.00160473771196 * GRP_NumDistPurchases3
          +      0.0013330753294 * GRP_NumDistPurchases4
          +     0.23697025371136 * GRP_NumWebPurchases2
          +     0.12394312604839 * GRP_NumWebPurchases3
          +     0.29358944454399 * GRP_NumWebPurchases4
          +      0.2711027918467 * GRP_RFMstat2  +    -0.07642391618094 *
        GRP_RFMstat3  +     0.14712184054126 * GRP_RFMstat4
          +     0.11431001806439 * GRP_RMntFrq2  +     0.06273949214332 *
        GRP_RMntFrq3  +     0.44954334169592 * GRP_RMntFrq4
          +    -0.10299484961132 * GRP_Recency2  +    -0.00660050077332 *
        GRP_Recency3  +     0.10477819043432 * GRP_Recency4 ;
   H16  =      0.7597594494859 * GRP_AcceptedCmp52  +    -0.32376689593056 *
        GRP_Frq2  +    -0.07779183366163 * GRP_Frq3  +     0.11273534310895 *
        GRP_Frq4  +    -0.36089895624306 * GRP_Income2
          +    -0.38271011363759 * GRP_Income3  +     0.33282176047548 *
        GRP_Income4  +    -0.13854310872224 * GRP_Mnt2
          +    -0.31005746238746 * GRP_Mnt3  +     0.02082673800287 * GRP_Mnt4
          +     0.01224737349632 * GRP_MntFishProducts2
          +    -0.19458526368147 * GRP_MntFishProducts3
          +    -0.25187479317784 * GRP_MntFishProducts4
          +     0.01924229245332 * GRP_MntGoldProds2
          +     0.01852658027428 * GRP_MntGoldProds3
          +    -0.23305256947549 * GRP_MntGoldProds4
          +     0.13401051842966 * GRP_MntMeatProducts2
          +     0.27193108385041 * GRP_MntMeatProducts3
          +     0.01379422261623 * GRP_MntMeatProducts4
          +    -0.57181882470311 * GRP_MntWines2  +    -0.57187059852098 *
        GRP_MntWines3  +     0.30882985081217 * GRP_MntWines4
          +     0.49912000555763 * GRP_NumCatalogPurchases3
          +    -0.04354876738665 * GRP_NumCatalogPurchases4
          +     0.34941540707612 * GRP_NumDistPurchases2
          +     0.32691169055841 * GRP_NumDistPurchases3
          +    -0.09211947503636 * GRP_NumDistPurchases4
          +     0.23482266977456 * GRP_NumWebPurchases2
          +     0.33507315521476 * GRP_NumWebPurchases3
          +    -0.08817191120299 * GRP_NumWebPurchases4
          +     0.02374098589478 * GRP_RFMstat2  +    -0.23629328969151 *
        GRP_RFMstat3  +    -0.52724215414655 * GRP_RFMstat4
          +    -0.11172774703142 * GRP_RMntFrq2  +    -0.23930023577086 *
        GRP_RMntFrq3  +    -0.17783974029566 * GRP_RMntFrq4
          +    -0.09948595230391 * GRP_Recency2  +    -0.15957779348689 *
        GRP_Recency3  +     0.12430840578537 * GRP_Recency4 ;
   H11  =    -0.83610777610194 + H11 ;
   H12  =     0.10079183797017 + H12 ;
   H13  =    -1.02827583788856 + H13 ;
   H14  =    -0.61336153955727 + H14 ;
   H15  =      0.2253118259528 + H15 ;
   H16  =     0.92538506927963 + H16 ;
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
   P_DepVar1  =    -0.23603747173409 * H11  +     2.21167504352097 * H12
          +    -0.73919409105284 * H13  +     -1.1148994433356 * H14
          +    -1.58525957527132 * H15  +    -1.77364534531332 * H16 ;
   P_DepVar1  =    -1.69291771072924 + P_DepVar1 ;
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
*------------------------------------------------------------*;
* TOOL: Transform;
* TYPE: MODIFY;
* NODE: Trans;
*------------------------------------------------------------*;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.04711628818085 * GRP_AcceptedCmp52  +    -0.13027365748107 *
        GRP_Frq2  +    -0.04632677563882 * GRP_Frq3  +    -0.08320341313947 *
        GRP_Frq4  +     0.15407011801643 * GRP_Income2
          +    -0.10383560943317 * GRP_Income3  +    -0.40582360882321 *
        GRP_Income4  +    -0.00866872751194 * GRP_Mnt2
          +     0.03835423241766 * GRP_Mnt3  +     0.10111653307734 * GRP_Mnt4
          +     0.27649544705807 * GRP_MntFishProducts2
          +     0.03806617200527 * GRP_MntFishProducts3
          +    -0.14924458232763 * GRP_MntFishProducts4
          +    -0.61470593668196 * GRP_MntGoldProds2
          +      0.3229990608995 * GRP_MntGoldProds3
          +    -0.38604519701302 * GRP_MntGoldProds4
          +    -0.16788745104812 * GRP_MntMeatProducts2
          +    -0.02411102582134 * GRP_MntMeatProducts3
          +     0.20999119459991 * GRP_MntMeatProducts4
          +     0.00013023256115 * GRP_MntWines2  +    -0.19154805414183 *
        GRP_MntWines3  +     0.10487287927665 * GRP_MntWines4
          +    -0.18385399575632 * GRP_NumCatalogPurchases3
          +     0.26139870297501 * GRP_NumCatalogPurchases4
          +    -0.45516424216634 * GRP_NumDistPurchases2
          +    -0.02821228922166 * GRP_NumDistPurchases3
          +     -0.0277463007541 * GRP_NumDistPurchases4
          +    -0.20089085216463 * GRP_NumWebPurchases2
          +     0.25653821989992 * GRP_NumWebPurchases3
          +    -0.28787845842774 * GRP_NumWebPurchases4
          +    -0.55935702240721 * GRP_RFMstat2  +     0.06115264011229 *
        GRP_RFMstat3  +     0.23395576453228 * GRP_RFMstat4
          +     0.14575536355828 * GRP_RMntFrq2  +    -0.17534689953321 *
        GRP_RMntFrq3  +     0.02136609987453 * GRP_RMntFrq4
          +       0.198287170399 * GRP_Recency2  +     0.20837384647001 *
        GRP_Recency3  +    -0.03491976754069 * GRP_Recency4 ;
   H12  =     0.27125178346152 * GRP_AcceptedCmp52  +     0.39367144184074 *
        GRP_Frq2  +     0.47183329287273 * GRP_Frq3  +     0.06075107930837 *
        GRP_Frq4  +     0.77794746315957 * GRP_Income2
          +     0.86453663986099 * GRP_Income3  +    -0.24014105964843 *
        GRP_Income4  +     0.18332391092776 * GRP_Mnt2
          +    -0.05132712807258 * GRP_Mnt3  +    -0.12150106989075 * GRP_Mnt4
          +     0.37088160406221 * GRP_MntFishProducts2
          +     0.16511263167544 * GRP_MntFishProducts3
          +    -0.25696902575665 * GRP_MntFishProducts4
          +    -0.25511966497767 * GRP_MntGoldProds2
          +     0.10357155941955 * GRP_MntGoldProds3
          +    -0.04921872016349 * GRP_MntGoldProds4
          +    -0.11063359070508 * GRP_MntMeatProducts2
          +    -0.08379163747059 * GRP_MntMeatProducts3
          +     0.18893182644469 * GRP_MntMeatProducts4
          +     0.41618237258351 * GRP_MntWines2  +    -0.00683285266538 *
        GRP_MntWines3  +    -0.12347598430406 * GRP_MntWines4
          +    -0.28043452635336 * GRP_NumCatalogPurchases3
          +     0.19010019257459 * GRP_NumCatalogPurchases4
          +    -0.29362124038326 * GRP_NumDistPurchases2
          +    -0.03304017306295 * GRP_NumDistPurchases3
          +    -0.11165609534026 * GRP_NumDistPurchases4
          +      0.1536111955491 * GRP_NumWebPurchases2
          +     0.14856361677069 * GRP_NumWebPurchases3
          +      0.0385282170017 * GRP_NumWebPurchases4
          +    -0.42245587008719 * GRP_RFMstat2  +     0.15962543914936 *
        GRP_RFMstat3  +    -0.39342058803069 * GRP_RFMstat4
          +    -0.28590254800789 * GRP_RMntFrq2  +    -0.21564130946407 *
        GRP_RMntFrq3  +    -0.22044591524393 * GRP_RMntFrq4
          +      1.1127849486131 * GRP_Recency2  +     0.37451568388848 *
        GRP_Recency3  +    -0.33640572843758 * GRP_Recency4 ;
   H13  =    -0.00640066603747 * GRP_AcceptedCmp52  +    -0.11333647417979 *
        GRP_Frq2  +    -0.11647952262542 * GRP_Frq3  +    -0.14006488881524 *
        GRP_Frq4  +     0.27728124026233 * GRP_Income2
          +     0.05697521068764 * GRP_Income3  +    -0.37633026358792 *
        GRP_Income4  +    -0.17440692689662 * GRP_Mnt2
          +    -0.10036881667196 * GRP_Mnt3  +    -0.13642140412399 * GRP_Mnt4
          +      0.2081380258467 * GRP_MntFishProducts2
          +    -0.08668229639505 * GRP_MntFishProducts3
          +     0.14081019578955 * GRP_MntFishProducts4
          +    -0.17027561298255 * GRP_MntGoldProds2
          +    -0.34742776244059 * GRP_MntGoldProds3
          +     0.12168590176726 * GRP_MntGoldProds4
          +    -0.05512121591373 * GRP_MntMeatProducts2
          +    -0.34519642935258 * GRP_MntMeatProducts3
          +    -0.13168847945689 * GRP_MntMeatProducts4
          +     0.28193282372353 * GRP_MntWines2  +     0.14946457186192 *
        GRP_MntWines3  +     0.06804391722409 * GRP_MntWines4
          +    -0.08346399909028 * GRP_NumCatalogPurchases3
          +    -0.15880621701951 * GRP_NumCatalogPurchases4
          +    -0.25528445685452 * GRP_NumDistPurchases2
          +    -0.10526630829598 * GRP_NumDistPurchases3
          +    -0.03726952062424 * GRP_NumDistPurchases4
          +    -0.05938919871449 * GRP_NumWebPurchases2
          +     0.18366019558751 * GRP_NumWebPurchases3
          +    -0.19335960904254 * GRP_NumWebPurchases4
          +     0.15283900648967 * GRP_RFMstat2  +    -0.03738648354517 *
        GRP_RFMstat3  +      0.0780054343538 * GRP_RFMstat4
          +     0.08482465227003 * GRP_RMntFrq2  +    -0.04156217601701 *
        GRP_RMntFrq3  +    -0.27972469674532 * GRP_RMntFrq4
          +     0.20311018978803 * GRP_Recency2  +     0.02026894035212 *
        GRP_Recency3  +    -0.22461335805045 * GRP_Recency4 ;
   H14  =     0.84759844370999 * GRP_AcceptedCmp52  +    -0.40207108050785 *
        GRP_Frq2  +    -0.11957926267486 * GRP_Frq3  +     0.39764041522616 *
        GRP_Frq4  +    -0.21133467357887 * GRP_Income2
          +    -0.37600727819569 * GRP_Income3  +     0.61191321060217 *
        GRP_Income4  +    -0.01918945699115 * GRP_Mnt2
          +    -0.28923187120656 * GRP_Mnt3  +     0.20590552102477 * GRP_Mnt4
          +     0.03194734131194 * GRP_MntFishProducts2
          +    -0.08555244396388 * GRP_MntFishProducts3
          +     -0.1294949057865 * GRP_MntFishProducts4
          +    -0.28742848639985 * GRP_MntGoldProds2
          +    -0.00435260781733 * GRP_MntGoldProds3
          +    -0.12007613875856 * GRP_MntGoldProds4
          +     0.36325039255643 * GRP_MntMeatProducts2
          +    -0.08728922471846 * GRP_MntMeatProducts3
          +    -0.19062123750322 * GRP_MntMeatProducts4
          +    -0.54694203087226 * GRP_MntWines2  +    -0.63189775838668 *
        GRP_MntWines3  +      0.3957291463714 * GRP_MntWines4
          +       0.435944756052 * GRP_NumCatalogPurchases3
          +      0.2205855993165 * GRP_NumCatalogPurchases4
          +     0.59192262496927 * GRP_NumDistPurchases2
          +     0.04008128670209 * GRP_NumDistPurchases3
          +    -0.00330725734446 * GRP_NumDistPurchases4
          +     0.18235346155154 * GRP_NumWebPurchases2
          +     0.06863306934707 * GRP_NumWebPurchases3
          +     0.06339667504979 * GRP_NumWebPurchases4
          +     0.09545179117637 * GRP_RFMstat2  +     0.14008923310046 *
        GRP_RFMstat3  +    -0.26191188327872 * GRP_RFMstat4
          +    -0.21341781402946 * GRP_RMntFrq2  +    -0.16158721892261 *
        GRP_RMntFrq3  +    -0.03125612925483 * GRP_RMntFrq4
          +    -0.57136536034562 * GRP_Recency2  +    -0.28843025104868 *
        GRP_Recency3  +     0.23682927566038 * GRP_Recency4 ;
   H15  =      -0.270075163047 * GRP_AcceptedCmp52  +     0.12329750151184 *
        GRP_Frq2  +    -0.00636074237745 * GRP_Frq3  +     0.06125360704983 *
        GRP_Frq4  +    -0.02221726738608 * GRP_Income2
          +     0.02831089386274 * GRP_Income3  +    -0.14245161962732 *
        GRP_Income4  +    -0.33215929968734 * GRP_Mnt2
          +    -0.12990224977804 * GRP_Mnt3  +     0.01224047316232 * GRP_Mnt4
          +     0.43021866757807 * GRP_MntFishProducts2
          +    -0.27483945374498 * GRP_MntFishProducts3
          +     0.35053639451726 * GRP_MntFishProducts4
          +    -0.00509900753344 * GRP_MntGoldProds2
          +     -0.2114201518265 * GRP_MntGoldProds3
          +    -0.13970354632794 * GRP_MntGoldProds4
          +     0.08840789662233 * GRP_MntMeatProducts2
          +    -0.00365357432837 * GRP_MntMeatProducts3
          +    -0.17124615615804 * GRP_MntMeatProducts4
          +     -0.3149461311814 * GRP_MntWines2  +     0.13173264925134 *
        GRP_MntWines3  +    -0.11604679382146 * GRP_MntWines4
          +     -0.5316533346484 * GRP_NumCatalogPurchases3
          +    -0.29157679545376 * GRP_NumCatalogPurchases4
          +    -0.08055861305066 * GRP_NumDistPurchases2
          +    -0.08674081531395 * GRP_NumDistPurchases3
          +    -0.17551921835199 * GRP_NumDistPurchases4
          +    -0.03222539166367 * GRP_NumWebPurchases2
          +    -0.13811302108485 * GRP_NumWebPurchases3
          +     0.06646439445075 * GRP_NumWebPurchases4
          +    -0.07079122602276 * GRP_RFMstat2  +    -0.39615424117539 *
        GRP_RFMstat3  +     0.04146636703929 * GRP_RFMstat4
          +     -0.0853308883886 * GRP_RMntFrq2  +    -0.13702404280363 *
        GRP_RMntFrq3  +    -0.27355720177265 * GRP_RMntFrq4
          +     0.33867777321903 * GRP_Recency2  +    -0.09253457902218 *
        GRP_Recency3  +    -0.05897210090797 * GRP_Recency4 ;
   H16  =    -0.30271284676983 * GRP_AcceptedCmp52  +     0.03117199224725 *
        GRP_Frq2  +    -0.26799382098604 * GRP_Frq3  +    -0.13070336759958 *
        GRP_Frq4  +     0.12672160649087 * GRP_Income2
          +    -0.21150829323326 * GRP_Income3  +    -0.15720750294685 *
        GRP_Income4  +     0.09905728950306 * GRP_Mnt2
          +    -0.43923284882193 * GRP_Mnt3  +     0.03431635930451 * GRP_Mnt4
          +     0.06947673564935 * GRP_MntFishProducts2
          +     -0.2220161944842 * GRP_MntFishProducts3
          +      -0.115965454808 * GRP_MntFishProducts4
          +    -0.01957355844265 * GRP_MntGoldProds2
          +     0.29129268161925 * GRP_MntGoldProds3
          +     0.06228256145252 * GRP_MntGoldProds4
          +    -0.09695386874195 * GRP_MntMeatProducts2
          +    -0.15864685727366 * GRP_MntMeatProducts3
          +    -0.49032797729016 * GRP_MntMeatProducts4
          +     0.37470089287985 * GRP_MntWines2  +     0.36115743239288 *
        GRP_MntWines3  +    -0.34359138002961 * GRP_MntWines4
          +    -0.19461285131827 * GRP_NumCatalogPurchases3
          +     0.04513674368784 * GRP_NumCatalogPurchases4
          +    -0.03507865895925 * GRP_NumDistPurchases2
          +     0.09915485245283 * GRP_NumDistPurchases3
          +    -0.33100664342194 * GRP_NumDistPurchases4
          +     0.13724527126482 * GRP_NumWebPurchases2
          +    -0.02356592443136 * GRP_NumWebPurchases3
          +      0.2573229592217 * GRP_NumWebPurchases4
          +     0.05747809528111 * GRP_RFMstat2  +     0.09535983705402 *
        GRP_RFMstat3  +    -0.10249907985488 * GRP_RFMstat4
          +     0.08979004612339 * GRP_RMntFrq2  +     0.21152228987437 *
        GRP_RMntFrq3  +     0.01345639991803 * GRP_RMntFrq4
          +     0.52890036744064 * GRP_Recency2  +    -0.04507648861408 *
        GRP_Recency3  +    -0.03669931738284 * GRP_Recency4 ;
   H17  =    -0.24394616675587 * GRP_AcceptedCmp52  +     0.28964856194613 *
        GRP_Frq2  +    -0.08289613695725 * GRP_Frq3  +     0.21998897095553 *
        GRP_Frq4  +     0.18107497199311 * GRP_Income2
          +      0.1107558510921 * GRP_Income3  +    -0.36116869826735 *
        GRP_Income4  +     0.02424010270897 * GRP_Mnt2
          +    -0.15852275336702 * GRP_Mnt3  +    -0.35418266455505 * GRP_Mnt4
          +     0.20869043565167 * GRP_MntFishProducts2
          +     0.10833559681607 * GRP_MntFishProducts3
          +    -0.10347776442631 * GRP_MntFishProducts4
          +    -0.32065428276511 * GRP_MntGoldProds2
          +    -0.43926899233496 * GRP_MntGoldProds3
          +    -0.10606506374615 * GRP_MntGoldProds4
          +    -0.31984276315874 * GRP_MntMeatProducts2
          +    -0.10334364706061 * GRP_MntMeatProducts3
          +    -0.00884354140504 * GRP_MntMeatProducts4
          +     0.23600639890053 * GRP_MntWines2  +    -0.29934386684584 *
        GRP_MntWines3  +     0.16274179248724 * GRP_MntWines4
          +    -0.32950762391869 * GRP_NumCatalogPurchases3
          +     0.01712392556947 * GRP_NumCatalogPurchases4
          +    -0.34220067420996 * GRP_NumDistPurchases2
          +    -0.15410597036596 * GRP_NumDistPurchases3
          +    -0.05769918195545 * GRP_NumDistPurchases4
          +    -0.03929570019271 * GRP_NumWebPurchases2
          +    -0.30647973770852 * GRP_NumWebPurchases3
          +    -0.09809448516146 * GRP_NumWebPurchases4
          +     0.02199652262588 * GRP_RFMstat2  +    -0.18677191406874 *
        GRP_RFMstat3  +    -0.06022520470141 * GRP_RFMstat4
          +    -0.14995521360575 * GRP_RMntFrq2  +     0.00512207268691 *
        GRP_RMntFrq3  +    -0.58308661640325 * GRP_RMntFrq4
          +     0.09125052186965 * GRP_Recency2  +    -0.01605996390173 *
        GRP_Recency3  +     0.09260166797685 * GRP_Recency4 ;
   H11  =     1.47536864687001 + H11 ;
   H12  =    -0.03796823184366 + H12 ;
   H13  =     0.20545721254095 + H13 ;
   H14  =     0.82513531048516 + H14 ;
   H15  =    -0.86531822153621 + H15 ;
   H16  =    -1.63588460642984 + H16 ;
   H17  =     1.27216054538203 + H17 ;
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
   P_DepVar1  =     1.96524348977009 * H11  +     1.80437226064293 * H12
          +     0.26614818926491 * H13  +     -2.3095876381555 * H14
          +     0.55402099095215 * H15  +     1.54522449582288 * H16
          +     1.13845442289883 * H17 ;
   P_DepVar1  =    -1.53783202740594 + P_DepVar1 ;
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
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl3;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl3: Average Posteriors of 9 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural20_P_DepVar1 +
Neural19_P_DepVar1 +
Neural5_P_DepVar1 +
Neural21_P_DepVar1 +
Tree3_P_DepVar1 +
Reg3_P_DepVar1 +
Neural22_P_DepVar1 +
Neural23_P_DepVar1 +
Neural18_P_DepVar1
)/9;
P_DepVar0 = (
Neural20_P_DepVar0 +
Neural19_P_DepVar0 +
Neural5_P_DepVar0 +
Neural21_P_DepVar0 +
Tree3_P_DepVar0 +
Reg3_P_DepVar0 +
Neural22_P_DepVar0 +
Neural23_P_DepVar0 +
Neural18_P_DepVar0
)/9;
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
if index(NEURAL21_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL21_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL21_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL21_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(TREE3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(TREE3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(TREE3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(TREE3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL22_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL22_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL22_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL22_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL23_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL23_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL23_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL23_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL18_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL18_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL18_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL18_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
