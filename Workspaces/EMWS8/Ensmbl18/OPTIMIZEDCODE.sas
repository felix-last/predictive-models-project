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
* Variable: AcceptedCmpTotal;
*------------------------------------------------------------*;
LABEL GRP_AcceptedCmpTotal = "Grouped: AcceptedCmpTotal";

if MISSING(AcceptedCmpTotal) then do;
GRP_AcceptedCmpTotal = 1;
end;
else if NOT MISSING(AcceptedCmpTotal) then do;
if AcceptedCmpTotal < 0 then do;
GRP_AcceptedCmpTotal = 2;
end;
else
if 0 <= AcceptedCmpTotal AND AcceptedCmpTotal < 1 then do;
GRP_AcceptedCmpTotal = 3;
end;
else
if 1 <= AcceptedCmpTotal then do;
GRP_AcceptedCmpTotal = 4;
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
if Frq < 4 then do;
GRP_Frq = 2;
end;
else
if 4 <= Frq AND Frq < 5 then do;
GRP_Frq = 3;
end;
else
if 5 <= Frq AND Frq < 6 then do;
GRP_Frq = 4;
end;
else
if 6 <= Frq AND Frq < 9 then do;
GRP_Frq = 5;
end;
else
if 9 <= Frq AND Frq < 12 then do;
GRP_Frq = 6;
end;
else
if 12 <= Frq AND Frq < 15 then do;
GRP_Frq = 7;
end;
else
if 15 <= Frq AND Frq < 17 then do;
GRP_Frq = 8;
end;
else
if 17 <= Frq AND Frq < 20 then do;
GRP_Frq = 9;
end;
else
if 20 <= Frq AND Frq < 23 then do;
GRP_Frq = 10;
end;
else
if 23 <= Frq then do;
GRP_Frq = 11;
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
if Income < 23983 then do;
GRP_Income = 2;
end;
else
if 23983 <= Income AND Income < 31322 then do;
GRP_Income = 3;
end;
else
if 31322 <= Income AND Income < 38157 then do;
GRP_Income = 4;
end;
else
if 38157 <= Income AND Income < 44900 then do;
GRP_Income = 5;
end;
else
if 44900 <= Income AND Income < 52157 then do;
GRP_Income = 6;
end;
else
if 52157 <= Income AND Income < 59111 then do;
GRP_Income = 7;
end;
else
if 59111 <= Income AND Income < 65808 then do;
GRP_Income = 8;
end;
else
if 65808 <= Income AND Income < 72025 then do;
GRP_Income = 9;
end;
else
if 72025 <= Income AND Income < 79470 then do;
GRP_Income = 10;
end;
else
if 79470 <= Income then do;
GRP_Income = 11;
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
if Mnt < 34 then do;
GRP_Mnt = 2;
end;
else
if 34 <= Mnt AND Mnt < 57 then do;
GRP_Mnt = 3;
end;
else
if 57 <= Mnt AND Mnt < 94 then do;
GRP_Mnt = 4;
end;
else
if 94 <= Mnt AND Mnt < 219 then do;
GRP_Mnt = 5;
end;
else
if 219 <= Mnt AND Mnt < 405.5 then do;
GRP_Mnt = 6;
end;
else
if 405.5 <= Mnt AND Mnt < 650 then do;
GRP_Mnt = 7;
end;
else
if 650 <= Mnt AND Mnt < 906 then do;
GRP_Mnt = 8;
end;
else
if 906 <= Mnt AND Mnt < 1215 then do;
GRP_Mnt = 9;
end;
else
if 1215 <= Mnt AND Mnt < 1526 then do;
GRP_Mnt = 10;
end;
else
if 1526 <= Mnt then do;
GRP_Mnt = 11;
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
if MntFishProducts < 0 then do;
GRP_MntFishProducts = 2;
end;
else
if 0 <= MntFishProducts AND MntFishProducts < 2 then do;
GRP_MntFishProducts = 3;
end;
else
if 2 <= MntFishProducts AND MntFishProducts < 4 then do;
GRP_MntFishProducts = 4;
end;
else
if 4 <= MntFishProducts AND MntFishProducts < 7 then do;
GRP_MntFishProducts = 5;
end;
else
if 7 <= MntFishProducts AND MntFishProducts < 13 then do;
GRP_MntFishProducts = 6;
end;
else
if 13 <= MntFishProducts AND MntFishProducts < 23 then do;
GRP_MntFishProducts = 7;
end;
else
if 23 <= MntFishProducts AND MntFishProducts < 37 then do;
GRP_MntFishProducts = 8;
end;
else
if 37 <= MntFishProducts AND MntFishProducts < 62 then do;
GRP_MntFishProducts = 9;
end;
else
if 62 <= MntFishProducts AND MntFishProducts < 116 then do;
GRP_MntFishProducts = 10;
end;
else
if 116 <= MntFishProducts then do;
GRP_MntFishProducts = 11;
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
if MntGoldProds < 3 then do;
GRP_MntGoldProds = 2;
end;
else
if 3 <= MntGoldProds AND MntGoldProds < 7 then do;
GRP_MntGoldProds = 3;
end;
else
if 7 <= MntGoldProds AND MntGoldProds < 12 then do;
GRP_MntGoldProds = 4;
end;
else
if 12 <= MntGoldProds AND MntGoldProds < 17 then do;
GRP_MntGoldProds = 5;
end;
else
if 17 <= MntGoldProds AND MntGoldProds < 25 then do;
GRP_MntGoldProds = 6;
end;
else
if 25 <= MntGoldProds AND MntGoldProds < 34 then do;
GRP_MntGoldProds = 7;
end;
else
if 34 <= MntGoldProds AND MntGoldProds < 48 then do;
GRP_MntGoldProds = 8;
end;
else
if 48 <= MntGoldProds AND MntGoldProds < 74 then do;
GRP_MntGoldProds = 9;
end;
else
if 74 <= MntGoldProds AND MntGoldProds < 116 then do;
GRP_MntGoldProds = 10;
end;
else
if 116 <= MntGoldProds then do;
GRP_MntGoldProds = 11;
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
if MntMeatProducts < 7 then do;
GRP_MntMeatProducts = 2;
end;
else
if 7 <= MntMeatProducts AND MntMeatProducts < 12 then do;
GRP_MntMeatProducts = 3;
end;
else
if 12 <= MntMeatProducts AND MntMeatProducts < 21 then do;
GRP_MntMeatProducts = 4;
end;
else
if 21 <= MntMeatProducts AND MntMeatProducts < 38 then do;
GRP_MntMeatProducts = 5;
end;
else
if 38 <= MntMeatProducts AND MntMeatProducts < 72 then do;
GRP_MntMeatProducts = 6;
end;
else
if 72 <= MntMeatProducts AND MntMeatProducts < 116 then do;
GRP_MntMeatProducts = 7;
end;
else
if 116 <= MntMeatProducts AND MntMeatProducts < 186 then do;
GRP_MntMeatProducts = 8;
end;
else
if 186 <= MntMeatProducts AND MntMeatProducts < 309 then do;
GRP_MntMeatProducts = 9;
end;
else
if 309 <= MntMeatProducts AND MntMeatProducts < 518 then do;
GRP_MntMeatProducts = 10;
end;
else
if 518 <= MntMeatProducts then do;
GRP_MntMeatProducts = 11;
end;
end;

*------------------------------------------------------------*;
* Variable: MntSweetProducts;
*------------------------------------------------------------*;
LABEL GRP_MntSweetProducts =
'Grouped: MntSweetProducts';

if MISSING(MntSweetProducts) then do;
GRP_MntSweetProducts = 1;
end;
else if NOT MISSING(MntSweetProducts) then do;
if MntSweetProducts < 0 then do;
GRP_MntSweetProducts = 2;
end;
else
if 0 <= MntSweetProducts AND MntSweetProducts < 1 then do;
GRP_MntSweetProducts = 3;
end;
else
if 1 <= MntSweetProducts AND MntSweetProducts < 3 then do;
GRP_MntSweetProducts = 4;
end;
else
if 3 <= MntSweetProducts AND MntSweetProducts < 5 then do;
GRP_MntSweetProducts = 5;
end;
else
if 5 <= MntSweetProducts AND MntSweetProducts < 9 then do;
GRP_MntSweetProducts = 6;
end;
else
if 9 <= MntSweetProducts AND MntSweetProducts < 16 then do;
GRP_MntSweetProducts = 7;
end;
else
if 16 <= MntSweetProducts AND MntSweetProducts < 27 then do;
GRP_MntSweetProducts = 8;
end;
else
if 27 <= MntSweetProducts AND MntSweetProducts < 46 then do;
GRP_MntSweetProducts = 9;
end;
else
if 46 <= MntSweetProducts AND MntSweetProducts < 84 then do;
GRP_MntSweetProducts = 10;
end;
else
if 84 <= MntSweetProducts then do;
GRP_MntSweetProducts = 11;
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
if MntWines < 6 then do;
GRP_MntWines = 2;
end;
else
if 6 <= MntWines AND MntWines < 16 then do;
GRP_MntWines = 3;
end;
else
if 16 <= MntWines AND MntWines < 33 then do;
GRP_MntWines = 4;
end;
else
if 33 <= MntWines AND MntWines < 84 then do;
GRP_MntWines = 5;
end;
else
if 84 <= MntWines AND MntWines < 183.5 then do;
GRP_MntWines = 6;
end;
else
if 183.5 <= MntWines AND MntWines < 298 then do;
GRP_MntWines = 7;
end;
else
if 298 <= MntWines AND MntWines < 429 then do;
GRP_MntWines = 8;
end;
else
if 429 <= MntWines AND MntWines < 602 then do;
GRP_MntWines = 9;
end;
else
if 602 <= MntWines AND MntWines < 836 then do;
GRP_MntWines = 10;
end;
else
if 836 <= MntWines then do;
GRP_MntWines = 11;
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
if 0 <= NumCatalogPurchases AND NumCatalogPurchases < 1 then do;
GRP_NumCatalogPurchases = 3;
end;
else
if 1 <= NumCatalogPurchases AND NumCatalogPurchases < 2 then do;
GRP_NumCatalogPurchases = 4;
end;
else
if 2 <= NumCatalogPurchases AND NumCatalogPurchases < 4 then do;
GRP_NumCatalogPurchases = 5;
end;
else
if 4 <= NumCatalogPurchases AND NumCatalogPurchases < 5 then do;
GRP_NumCatalogPurchases = 6;
end;
else
if 5 <= NumCatalogPurchases AND NumCatalogPurchases < 7 then do;
GRP_NumCatalogPurchases = 7;
end;
else
if 7 <= NumCatalogPurchases then do;
GRP_NumCatalogPurchases = 8;
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
if NumDistPurchases < 1 then do;
GRP_NumDistPurchases = 2;
end;
else
if 1 <= NumDistPurchases AND NumDistPurchases < 2 then do;
GRP_NumDistPurchases = 3;
end;
else
if 2 <= NumDistPurchases AND NumDistPurchases < 3 then do;
GRP_NumDistPurchases = 4;
end;
else
if 3 <= NumDistPurchases AND NumDistPurchases < 5 then do;
GRP_NumDistPurchases = 5;
end;
else
if 5 <= NumDistPurchases AND NumDistPurchases < 6 then do;
GRP_NumDistPurchases = 6;
end;
else
if 6 <= NumDistPurchases AND NumDistPurchases < 8 then do;
GRP_NumDistPurchases = 7;
end;
else
if 8 <= NumDistPurchases AND NumDistPurchases < 9 then do;
GRP_NumDistPurchases = 8;
end;
else
if 9 <= NumDistPurchases AND NumDistPurchases < 11 then do;
GRP_NumDistPurchases = 9;
end;
else
if 11 <= NumDistPurchases AND NumDistPurchases < 13 then do;
GRP_NumDistPurchases = 10;
end;
else
if 13 <= NumDistPurchases then do;
GRP_NumDistPurchases = 11;
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
if NumWebPurchases < 1 then do;
GRP_NumWebPurchases = 2;
end;
else
if 1 <= NumWebPurchases AND NumWebPurchases < 2 then do;
GRP_NumWebPurchases = 3;
end;
else
if 2 <= NumWebPurchases AND NumWebPurchases < 3 then do;
GRP_NumWebPurchases = 4;
end;
else
if 3 <= NumWebPurchases AND NumWebPurchases < 4 then do;
GRP_NumWebPurchases = 5;
end;
else
if 4 <= NumWebPurchases AND NumWebPurchases < 5 then do;
GRP_NumWebPurchases = 6;
end;
else
if 5 <= NumWebPurchases AND NumWebPurchases < 6 then do;
GRP_NumWebPurchases = 7;
end;
else
if 6 <= NumWebPurchases AND NumWebPurchases < 8 then do;
GRP_NumWebPurchases = 8;
end;
else
if 8 <= NumWebPurchases then do;
GRP_NumWebPurchases = 9;
end;
end;

*------------------------------------------------------------*;
* Variable: NumWebVisitsMonth;
*------------------------------------------------------------*;
LABEL GRP_NumWebVisitsMonth =
'Grouped: NumWebVisitsMonth';

if MISSING(NumWebVisitsMonth) then do;
GRP_NumWebVisitsMonth = 1;
end;
else if NOT MISSING(NumWebVisitsMonth) then do;
if NumWebVisitsMonth < 2 then do;
GRP_NumWebVisitsMonth = 2;
end;
else
if 2 <= NumWebVisitsMonth AND NumWebVisitsMonth < 3 then do;
GRP_NumWebVisitsMonth = 3;
end;
else
if 3 <= NumWebVisitsMonth AND NumWebVisitsMonth < 4 then do;
GRP_NumWebVisitsMonth = 4;
end;
else
if 4 <= NumWebVisitsMonth AND NumWebVisitsMonth < 5 then do;
GRP_NumWebVisitsMonth = 5;
end;
else
if 5 <= NumWebVisitsMonth AND NumWebVisitsMonth < 6 then do;
GRP_NumWebVisitsMonth = 6;
end;
else
if 6 <= NumWebVisitsMonth AND NumWebVisitsMonth < 7 then do;
GRP_NumWebVisitsMonth = 7;
end;
else
if 7 <= NumWebVisitsMonth AND NumWebVisitsMonth < 8 then do;
GRP_NumWebVisitsMonth = 8;
end;
else
if 8 <= NumWebVisitsMonth then do;
GRP_NumWebVisitsMonth = 9;
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
if RFMstat < 3 then do;
GRP_RFMstat = 2;
end;
else
if 3 <= RFMstat AND RFMstat < 6.88 then do;
GRP_RFMstat = 3;
end;
else
if 6.88 <= RFMstat AND RFMstat < 18.67 then do;
GRP_RFMstat = 4;
end;
else
if 18.67 <= RFMstat AND RFMstat < 52.5 then do;
GRP_RFMstat = 5;
end;
else
if 52.5 <= RFMstat AND RFMstat < 128.09 then do;
GRP_RFMstat = 6;
end;
else
if 128.09 <= RFMstat AND RFMstat < 234.14 then do;
GRP_RFMstat = 7;
end;
else
if 234.14 <= RFMstat AND RFMstat < 369.14 then do;
GRP_RFMstat = 8;
end;
else
if 369.14 <= RFMstat AND RFMstat < 571.29 then do;
GRP_RFMstat = 9;
end;
else
if 571.29 <= RFMstat AND RFMstat < 1073.68 then do;
GRP_RFMstat = 10;
end;
else
if 1073.68 <= RFMstat then do;
GRP_RFMstat = 11;
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
if RMntFrq < 7.83 then do;
GRP_RMntFrq = 2;
end;
else
if 7.83 <= RMntFrq AND RMntFrq < 11 then do;
GRP_RMntFrq = 3;
end;
else
if 11 <= RMntFrq AND RMntFrq < 15.83 then do;
GRP_RMntFrq = 4;
end;
else
if 15.83 <= RMntFrq AND RMntFrq < 23.77 then do;
GRP_RMntFrq = 5;
end;
else
if 23.77 <= RMntFrq AND RMntFrq < 30.4 then do;
GRP_RMntFrq = 6;
end;
else
if 30.4 <= RMntFrq AND RMntFrq < 36.55 then do;
GRP_RMntFrq = 7;
end;
else
if 36.55 <= RMntFrq AND RMntFrq < 43.06 then do;
GRP_RMntFrq = 8;
end;
else
if 43.06 <= RMntFrq AND RMntFrq < 68.73 then do;
GRP_RMntFrq = 9;
end;
else
if 68.73 <= RMntFrq AND RMntFrq < 75.83 then do;
GRP_RMntFrq = 10;
end;
else
if 75.83 <= RMntFrq then do;
GRP_RMntFrq = 11;
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
if Recency < 9 then do;
GRP_Recency = 2;
end;
else
if 9 <= Recency AND Recency < 19 then do;
GRP_Recency = 3;
end;
else
if 19 <= Recency AND Recency < 29 then do;
GRP_Recency = 4;
end;
else
if 29 <= Recency AND Recency < 38 then do;
GRP_Recency = 5;
end;
else
if 38 <= Recency AND Recency < 48 then do;
GRP_Recency = 6;
end;
else
if 48 <= Recency AND Recency < 58 then do;
GRP_Recency = 7;
end;
else
if 58 <= Recency AND Recency < 68 then do;
GRP_Recency = 8;
end;
else
if 68 <= Recency AND Recency < 79 then do;
GRP_Recency = 9;
end;
else
if 79 <= Recency AND Recency < 90 then do;
GRP_Recency = 10;
end;
else
if 90 <= Recency then do;
GRP_Recency = 11;
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

      label GRP_AcceptedCmpTotal3 = 'Dummy: GRP_AcceptedCmpTotal=3' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Frq5 = 'Dummy: GRP_Frq=5' ;

      label GRP_Frq6 = 'Dummy: GRP_Frq=6' ;

      label GRP_Frq7 = 'Dummy: GRP_Frq=7' ;

      label GRP_Frq8 = 'Dummy: GRP_Frq=8' ;

      label GRP_Frq9 = 'Dummy: GRP_Frq=9' ;

      label GRP_Frq10 = 'Dummy: GRP_Frq=10' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Income5 = 'Dummy: GRP_Income=5' ;

      label GRP_Income6 = 'Dummy: GRP_Income=6' ;

      label GRP_Income7 = 'Dummy: GRP_Income=7' ;

      label GRP_Income8 = 'Dummy: GRP_Income=8' ;

      label GRP_Income9 = 'Dummy: GRP_Income=9' ;

      label GRP_Income10 = 'Dummy: GRP_Income=10' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_Mnt5 = 'Dummy: GRP_Mnt=5' ;

      label GRP_Mnt6 = 'Dummy: GRP_Mnt=6' ;

      label GRP_Mnt7 = 'Dummy: GRP_Mnt=7' ;

      label GRP_Mnt8 = 'Dummy: GRP_Mnt=8' ;

      label GRP_Mnt9 = 'Dummy: GRP_Mnt=9' ;

      label GRP_Mnt10 = 'Dummy: GRP_Mnt=10' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntFishProducts5 = 'Dummy: GRP_MntFishProducts=5' ;

      label GRP_MntFishProducts6 = 'Dummy: GRP_MntFishProducts=6' ;

      label GRP_MntFishProducts7 = 'Dummy: GRP_MntFishProducts=7' ;

      label GRP_MntFishProducts8 = 'Dummy: GRP_MntFishProducts=8' ;

      label GRP_MntFishProducts9 = 'Dummy: GRP_MntFishProducts=9' ;

      label GRP_MntFishProducts10 = 'Dummy: GRP_MntFishProducts=10' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntGoldProds5 = 'Dummy: GRP_MntGoldProds=5' ;

      label GRP_MntGoldProds6 = 'Dummy: GRP_MntGoldProds=6' ;

      label GRP_MntGoldProds7 = 'Dummy: GRP_MntGoldProds=7' ;

      label GRP_MntGoldProds8 = 'Dummy: GRP_MntGoldProds=8' ;

      label GRP_MntGoldProds9 = 'Dummy: GRP_MntGoldProds=9' ;

      label GRP_MntGoldProds10 = 'Dummy: GRP_MntGoldProds=10' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntMeatProducts5 = 'Dummy: GRP_MntMeatProducts=5' ;

      label GRP_MntMeatProducts6 = 'Dummy: GRP_MntMeatProducts=6' ;

      label GRP_MntMeatProducts7 = 'Dummy: GRP_MntMeatProducts=7' ;

      label GRP_MntMeatProducts8 = 'Dummy: GRP_MntMeatProducts=8' ;

      label GRP_MntMeatProducts9 = 'Dummy: GRP_MntMeatProducts=9' ;

      label GRP_MntMeatProducts10 = 'Dummy: GRP_MntMeatProducts=10' ;

      label GRP_MntSweetProducts3 = 'Dummy: GRP_MntSweetProducts=3' ;

      label GRP_MntSweetProducts4 = 'Dummy: GRP_MntSweetProducts=4' ;

      label GRP_MntSweetProducts5 = 'Dummy: GRP_MntSweetProducts=5' ;

      label GRP_MntSweetProducts6 = 'Dummy: GRP_MntSweetProducts=6' ;

      label GRP_MntSweetProducts7 = 'Dummy: GRP_MntSweetProducts=7' ;

      label GRP_MntSweetProducts8 = 'Dummy: GRP_MntSweetProducts=8' ;

      label GRP_MntSweetProducts9 = 'Dummy: GRP_MntSweetProducts=9' ;

      label GRP_MntSweetProducts10 = 'Dummy: GRP_MntSweetProducts=10' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_MntWines5 = 'Dummy: GRP_MntWines=5' ;

      label GRP_MntWines6 = 'Dummy: GRP_MntWines=6' ;

      label GRP_MntWines7 = 'Dummy: GRP_MntWines=7' ;

      label GRP_MntWines8 = 'Dummy: GRP_MntWines=8' ;

      label GRP_MntWines9 = 'Dummy: GRP_MntWines=9' ;

      label GRP_MntWines10 = 'Dummy: GRP_MntWines=10' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumCatalogPurchases5 = 'Dummy: GRP_NumCatalogPurchases=5' ;

      label GRP_NumCatalogPurchases6 = 'Dummy: GRP_NumCatalogPurchases=6' ;

      label GRP_NumCatalogPurchases7 = 'Dummy: GRP_NumCatalogPurchases=7' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumDistPurchases5 = 'Dummy: GRP_NumDistPurchases=5' ;

      label GRP_NumDistPurchases6 = 'Dummy: GRP_NumDistPurchases=6' ;

      label GRP_NumDistPurchases7 = 'Dummy: GRP_NumDistPurchases=7' ;

      label GRP_NumDistPurchases8 = 'Dummy: GRP_NumDistPurchases=8' ;

      label GRP_NumDistPurchases9 = 'Dummy: GRP_NumDistPurchases=9' ;

      label GRP_NumDistPurchases10 = 'Dummy: GRP_NumDistPurchases=10' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_NumWebPurchases5 = 'Dummy: GRP_NumWebPurchases=5' ;

      label GRP_NumWebPurchases6 = 'Dummy: GRP_NumWebPurchases=6' ;

      label GRP_NumWebPurchases7 = 'Dummy: GRP_NumWebPurchases=7' ;

      label GRP_NumWebPurchases8 = 'Dummy: GRP_NumWebPurchases=8' ;

      label GRP_NumWebVisitsMonth2 = 'Dummy: GRP_NumWebVisitsMonth=2' ;

      label GRP_NumWebVisitsMonth3 = 'Dummy: GRP_NumWebVisitsMonth=3' ;

      label GRP_NumWebVisitsMonth4 = 'Dummy: GRP_NumWebVisitsMonth=4' ;

      label GRP_NumWebVisitsMonth5 = 'Dummy: GRP_NumWebVisitsMonth=5' ;

      label GRP_NumWebVisitsMonth6 = 'Dummy: GRP_NumWebVisitsMonth=6' ;

      label GRP_NumWebVisitsMonth7 = 'Dummy: GRP_NumWebVisitsMonth=7' ;

      label GRP_NumWebVisitsMonth8 = 'Dummy: GRP_NumWebVisitsMonth=8' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RFMstat5 = 'Dummy: GRP_RFMstat=5' ;

      label GRP_RFMstat6 = 'Dummy: GRP_RFMstat=6' ;

      label GRP_RFMstat7 = 'Dummy: GRP_RFMstat=7' ;

      label GRP_RFMstat8 = 'Dummy: GRP_RFMstat=8' ;

      label GRP_RFMstat9 = 'Dummy: GRP_RFMstat=9' ;

      label GRP_RFMstat10 = 'Dummy: GRP_RFMstat=10' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq5 = 'Dummy: GRP_RMntFrq=5' ;

      label GRP_RMntFrq6 = 'Dummy: GRP_RMntFrq=6' ;

      label GRP_RMntFrq7 = 'Dummy: GRP_RMntFrq=7' ;

      label GRP_RMntFrq8 = 'Dummy: GRP_RMntFrq=8' ;

      label GRP_RMntFrq9 = 'Dummy: GRP_RMntFrq=9' ;

      label GRP_RMntFrq10 = 'Dummy: GRP_RMntFrq=10' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label GRP_Recency5 = 'Dummy: GRP_Recency=5' ;

      label GRP_Recency6 = 'Dummy: GRP_Recency=6' ;

      label GRP_Recency7 = 'Dummy: GRP_Recency=7' ;

      label GRP_Recency8 = 'Dummy: GRP_Recency=8' ;

      label GRP_Recency9 = 'Dummy: GRP_Recency=9' ;

      label GRP_Recency10 = 'Dummy: GRP_Recency=10' ;

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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop GRP_AcceptedCmpTotal3 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   GRP_AcceptedCmpTotal3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_AcceptedCmpTotal3 = 1;
   end;
   else if _dm12 = '4'  then do;
      GRP_AcceptedCmpTotal3 = -1;
   end;
   else do;
      GRP_AcceptedCmpTotal3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 GRP_Frq5 GRP_Frq6 GRP_Frq7 GRP_Frq8 GRP_Frq9
        GRP_Frq10 ;
*** encoding is sparse, initialize to zero;
GRP_Frq2 = 0;
GRP_Frq3 = 0;
GRP_Frq4 = 0;
GRP_Frq5 = 0;
GRP_Frq6 = 0;
GRP_Frq7 = 0;
GRP_Frq8 = 0;
GRP_Frq9 = 0;
GRP_Frq10 = 0;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   GRP_Frq5 = .;
   GRP_Frq6 = .;
   GRP_Frq7 = .;
   GRP_Frq8 = .;
   GRP_Frq9 = .;
   GRP_Frq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Frq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Frq2 = -1;
                  GRP_Frq3 = -1;
                  GRP_Frq4 = -1;
                  GRP_Frq5 = -1;
                  GRP_Frq6 = -1;
                  GRP_Frq7 = -1;
                  GRP_Frq8 = -1;
                  GRP_Frq9 = -1;
                  GRP_Frq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Frq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Frq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Frq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Frq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Frq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Frq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Frq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Frq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      GRP_Frq5 = .;
      GRP_Frq6 = .;
      GRP_Frq7 = .;
      GRP_Frq8 = .;
      GRP_Frq9 = .;
      GRP_Frq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 GRP_Income5 GRP_Income6 GRP_Income7
        GRP_Income8 GRP_Income9 GRP_Income10 ;
*** encoding is sparse, initialize to zero;
GRP_Income2 = 0;
GRP_Income3 = 0;
GRP_Income4 = 0;
GRP_Income5 = 0;
GRP_Income6 = 0;
GRP_Income7 = 0;
GRP_Income8 = 0;
GRP_Income9 = 0;
GRP_Income10 = 0;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   GRP_Income5 = .;
   GRP_Income6 = .;
   GRP_Income7 = .;
   GRP_Income8 = .;
   GRP_Income9 = .;
   GRP_Income10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Income10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Income2 = -1;
                  GRP_Income3 = -1;
                  GRP_Income4 = -1;
                  GRP_Income5 = -1;
                  GRP_Income6 = -1;
                  GRP_Income7 = -1;
                  GRP_Income8 = -1;
                  GRP_Income9 = -1;
                  GRP_Income10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Income2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Income3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Income4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Income5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Income6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Income7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Income8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Income9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      GRP_Income5 = .;
      GRP_Income6 = .;
      GRP_Income7 = .;
      GRP_Income8 = .;
      GRP_Income9 = .;
      GRP_Income10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 GRP_Mnt5 GRP_Mnt6 GRP_Mnt7 GRP_Mnt8 GRP_Mnt9
        GRP_Mnt10 ;
*** encoding is sparse, initialize to zero;
GRP_Mnt2 = 0;
GRP_Mnt3 = 0;
GRP_Mnt4 = 0;
GRP_Mnt5 = 0;
GRP_Mnt6 = 0;
GRP_Mnt7 = 0;
GRP_Mnt8 = 0;
GRP_Mnt9 = 0;
GRP_Mnt10 = 0;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   GRP_Mnt5 = .;
   GRP_Mnt6 = .;
   GRP_Mnt7 = .;
   GRP_Mnt8 = .;
   GRP_Mnt9 = .;
   GRP_Mnt10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Mnt10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Mnt2 = -1;
                  GRP_Mnt3 = -1;
                  GRP_Mnt4 = -1;
                  GRP_Mnt5 = -1;
                  GRP_Mnt6 = -1;
                  GRP_Mnt7 = -1;
                  GRP_Mnt8 = -1;
                  GRP_Mnt9 = -1;
                  GRP_Mnt10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Mnt2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Mnt3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Mnt4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Mnt5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Mnt6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Mnt7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Mnt8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Mnt9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      GRP_Mnt5 = .;
      GRP_Mnt6 = .;
      GRP_Mnt7 = .;
      GRP_Mnt8 = .;
      GRP_Mnt9 = .;
      GRP_Mnt10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts3 GRP_MntFishProducts4 GRP_MntFishProducts5
        GRP_MntFishProducts6 GRP_MntFishProducts7 GRP_MntFishProducts8
        GRP_MntFishProducts9 GRP_MntFishProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntFishProducts3 = 0;
GRP_MntFishProducts4 = 0;
GRP_MntFishProducts5 = 0;
GRP_MntFishProducts6 = 0;
GRP_MntFishProducts7 = 0;
GRP_MntFishProducts8 = 0;
GRP_MntFishProducts9 = 0;
GRP_MntFishProducts10 = 0;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   GRP_MntFishProducts5 = .;
   GRP_MntFishProducts6 = .;
   GRP_MntFishProducts7 = .;
   GRP_MntFishProducts8 = .;
   GRP_MntFishProducts9 = .;
   GRP_MntFishProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntFishProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntFishProducts3 = -1;
                  GRP_MntFishProducts4 = -1;
                  GRP_MntFishProducts5 = -1;
                  GRP_MntFishProducts6 = -1;
                  GRP_MntFishProducts7 = -1;
                  GRP_MntFishProducts8 = -1;
                  GRP_MntFishProducts9 = -1;
                  GRP_MntFishProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntFishProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntFishProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntFishProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntFishProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntFishProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntFishProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntFishProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      GRP_MntFishProducts5 = .;
      GRP_MntFishProducts6 = .;
      GRP_MntFishProducts7 = .;
      GRP_MntFishProducts8 = .;
      GRP_MntFishProducts9 = .;
      GRP_MntFishProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 GRP_MntGoldProds5
        GRP_MntGoldProds6 GRP_MntGoldProds7 GRP_MntGoldProds8
        GRP_MntGoldProds9 GRP_MntGoldProds10 ;
*** encoding is sparse, initialize to zero;
GRP_MntGoldProds2 = 0;
GRP_MntGoldProds3 = 0;
GRP_MntGoldProds4 = 0;
GRP_MntGoldProds5 = 0;
GRP_MntGoldProds6 = 0;
GRP_MntGoldProds7 = 0;
GRP_MntGoldProds8 = 0;
GRP_MntGoldProds9 = 0;
GRP_MntGoldProds10 = 0;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   GRP_MntGoldProds5 = .;
   GRP_MntGoldProds6 = .;
   GRP_MntGoldProds7 = .;
   GRP_MntGoldProds8 = .;
   GRP_MntGoldProds9 = .;
   GRP_MntGoldProds10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntGoldProds10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntGoldProds2 = -1;
                  GRP_MntGoldProds3 = -1;
                  GRP_MntGoldProds4 = -1;
                  GRP_MntGoldProds5 = -1;
                  GRP_MntGoldProds6 = -1;
                  GRP_MntGoldProds7 = -1;
                  GRP_MntGoldProds8 = -1;
                  GRP_MntGoldProds9 = -1;
                  GRP_MntGoldProds10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntGoldProds2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntGoldProds3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntGoldProds4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntGoldProds5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntGoldProds6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntGoldProds7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntGoldProds8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntGoldProds9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      GRP_MntGoldProds5 = .;
      GRP_MntGoldProds6 = .;
      GRP_MntGoldProds7 = .;
      GRP_MntGoldProds8 = .;
      GRP_MntGoldProds9 = .;
      GRP_MntGoldProds10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4
        GRP_MntMeatProducts5 GRP_MntMeatProducts6 GRP_MntMeatProducts7
        GRP_MntMeatProducts8 GRP_MntMeatProducts9 GRP_MntMeatProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntMeatProducts2 = 0;
GRP_MntMeatProducts3 = 0;
GRP_MntMeatProducts4 = 0;
GRP_MntMeatProducts5 = 0;
GRP_MntMeatProducts6 = 0;
GRP_MntMeatProducts7 = 0;
GRP_MntMeatProducts8 = 0;
GRP_MntMeatProducts9 = 0;
GRP_MntMeatProducts10 = 0;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   GRP_MntMeatProducts5 = .;
   GRP_MntMeatProducts6 = .;
   GRP_MntMeatProducts7 = .;
   GRP_MntMeatProducts8 = .;
   GRP_MntMeatProducts9 = .;
   GRP_MntMeatProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntMeatProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntMeatProducts2 = -1;
                  GRP_MntMeatProducts3 = -1;
                  GRP_MntMeatProducts4 = -1;
                  GRP_MntMeatProducts5 = -1;
                  GRP_MntMeatProducts6 = -1;
                  GRP_MntMeatProducts7 = -1;
                  GRP_MntMeatProducts8 = -1;
                  GRP_MntMeatProducts9 = -1;
                  GRP_MntMeatProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntMeatProducts2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntMeatProducts3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntMeatProducts4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntMeatProducts5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntMeatProducts6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntMeatProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntMeatProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntMeatProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      GRP_MntMeatProducts5 = .;
      GRP_MntMeatProducts6 = .;
      GRP_MntMeatProducts7 = .;
      GRP_MntMeatProducts8 = .;
      GRP_MntMeatProducts9 = .;
      GRP_MntMeatProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop GRP_MntSweetProducts3 GRP_MntSweetProducts4 GRP_MntSweetProducts5
        GRP_MntSweetProducts6 GRP_MntSweetProducts7 GRP_MntSweetProducts8
        GRP_MntSweetProducts9 GRP_MntSweetProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntSweetProducts3 = 0;
GRP_MntSweetProducts4 = 0;
GRP_MntSweetProducts5 = 0;
GRP_MntSweetProducts6 = 0;
GRP_MntSweetProducts7 = 0;
GRP_MntSweetProducts8 = 0;
GRP_MntSweetProducts9 = 0;
GRP_MntSweetProducts10 = 0;
if missing( GRP_MntSweetProducts ) then do;
   GRP_MntSweetProducts3 = .;
   GRP_MntSweetProducts4 = .;
   GRP_MntSweetProducts5 = .;
   GRP_MntSweetProducts6 = .;
   GRP_MntSweetProducts7 = .;
   GRP_MntSweetProducts8 = .;
   GRP_MntSweetProducts9 = .;
   GRP_MntSweetProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntSweetProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntSweetProducts3 = -1;
                  GRP_MntSweetProducts4 = -1;
                  GRP_MntSweetProducts5 = -1;
                  GRP_MntSweetProducts6 = -1;
                  GRP_MntSweetProducts7 = -1;
                  GRP_MntSweetProducts8 = -1;
                  GRP_MntSweetProducts9 = -1;
                  GRP_MntSweetProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntSweetProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntSweetProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntSweetProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntSweetProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntSweetProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntSweetProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntSweetProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntSweetProducts3 = .;
      GRP_MntSweetProducts4 = .;
      GRP_MntSweetProducts5 = .;
      GRP_MntSweetProducts6 = .;
      GRP_MntSweetProducts7 = .;
      GRP_MntSweetProducts8 = .;
      GRP_MntSweetProducts9 = .;
      GRP_MntSweetProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 GRP_MntWines5 GRP_MntWines6
        GRP_MntWines7 GRP_MntWines8 GRP_MntWines9 GRP_MntWines10 ;
*** encoding is sparse, initialize to zero;
GRP_MntWines2 = 0;
GRP_MntWines3 = 0;
GRP_MntWines4 = 0;
GRP_MntWines5 = 0;
GRP_MntWines6 = 0;
GRP_MntWines7 = 0;
GRP_MntWines8 = 0;
GRP_MntWines9 = 0;
GRP_MntWines10 = 0;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   GRP_MntWines5 = .;
   GRP_MntWines6 = .;
   GRP_MntWines7 = .;
   GRP_MntWines8 = .;
   GRP_MntWines9 = .;
   GRP_MntWines10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntWines10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntWines2 = -1;
                  GRP_MntWines3 = -1;
                  GRP_MntWines4 = -1;
                  GRP_MntWines5 = -1;
                  GRP_MntWines6 = -1;
                  GRP_MntWines7 = -1;
                  GRP_MntWines8 = -1;
                  GRP_MntWines9 = -1;
                  GRP_MntWines10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntWines2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntWines3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntWines4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntWines5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntWines6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntWines7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntWines8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntWines9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      GRP_MntWines5 = .;
      GRP_MntWines6 = .;
      GRP_MntWines7 = .;
      GRP_MntWines8 = .;
      GRP_MntWines9 = .;
      GRP_MntWines10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4
        GRP_NumCatalogPurchases5 GRP_NumCatalogPurchases6
        GRP_NumCatalogPurchases7 ;
*** encoding is sparse, initialize to zero;
GRP_NumCatalogPurchases3 = 0;
GRP_NumCatalogPurchases4 = 0;
GRP_NumCatalogPurchases5 = 0;
GRP_NumCatalogPurchases6 = 0;
GRP_NumCatalogPurchases7 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   GRP_NumCatalogPurchases5 = .;
   GRP_NumCatalogPurchases6 = .;
   GRP_NumCatalogPurchases7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            GRP_NumCatalogPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumCatalogPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_NumCatalogPurchases5 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumCatalogPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumCatalogPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumCatalogPurchases3 = -1;
            GRP_NumCatalogPurchases4 = -1;
            GRP_NumCatalogPurchases5 = -1;
            GRP_NumCatalogPurchases6 = -1;
            GRP_NumCatalogPurchases7 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      GRP_NumCatalogPurchases5 = .;
      GRP_NumCatalogPurchases6 = .;
      GRP_NumCatalogPurchases7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4
        GRP_NumDistPurchases5 GRP_NumDistPurchases6 GRP_NumDistPurchases7
        GRP_NumDistPurchases8 GRP_NumDistPurchases9 GRP_NumDistPurchases10 ;
*** encoding is sparse, initialize to zero;
GRP_NumDistPurchases2 = 0;
GRP_NumDistPurchases3 = 0;
GRP_NumDistPurchases4 = 0;
GRP_NumDistPurchases5 = 0;
GRP_NumDistPurchases6 = 0;
GRP_NumDistPurchases7 = 0;
GRP_NumDistPurchases8 = 0;
GRP_NumDistPurchases9 = 0;
GRP_NumDistPurchases10 = 0;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   GRP_NumDistPurchases5 = .;
   GRP_NumDistPurchases6 = .;
   GRP_NumDistPurchases7 = .;
   GRP_NumDistPurchases8 = .;
   GRP_NumDistPurchases9 = .;
   GRP_NumDistPurchases10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_NumDistPurchases10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_NumDistPurchases2 = -1;
                  GRP_NumDistPurchases3 = -1;
                  GRP_NumDistPurchases4 = -1;
                  GRP_NumDistPurchases5 = -1;
                  GRP_NumDistPurchases6 = -1;
                  GRP_NumDistPurchases7 = -1;
                  GRP_NumDistPurchases8 = -1;
                  GRP_NumDistPurchases9 = -1;
                  GRP_NumDistPurchases10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_NumDistPurchases2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_NumDistPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumDistPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_NumDistPurchases5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_NumDistPurchases6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumDistPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumDistPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumDistPurchases9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      GRP_NumDistPurchases5 = .;
      GRP_NumDistPurchases6 = .;
      GRP_NumDistPurchases7 = .;
      GRP_NumDistPurchases8 = .;
      GRP_NumDistPurchases9 = .;
      GRP_NumDistPurchases10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4
        GRP_NumWebPurchases5 GRP_NumWebPurchases6 GRP_NumWebPurchases7
        GRP_NumWebPurchases8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebPurchases2 = 0;
GRP_NumWebPurchases3 = 0;
GRP_NumWebPurchases4 = 0;
GRP_NumWebPurchases5 = 0;
GRP_NumWebPurchases6 = 0;
GRP_NumWebPurchases7 = 0;
GRP_NumWebPurchases8 = 0;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   GRP_NumWebPurchases5 = .;
   GRP_NumWebPurchases6 = .;
   GRP_NumWebPurchases7 = .;
   GRP_NumWebPurchases8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebPurchases2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebPurchases3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebPurchases4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebPurchases5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebPurchases2 = -1;
               GRP_NumWebPurchases3 = -1;
               GRP_NumWebPurchases4 = -1;
               GRP_NumWebPurchases5 = -1;
               GRP_NumWebPurchases6 = -1;
               GRP_NumWebPurchases7 = -1;
               GRP_NumWebPurchases8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      GRP_NumWebPurchases5 = .;
      GRP_NumWebPurchases6 = .;
      GRP_NumWebPurchases7 = .;
      GRP_NumWebPurchases8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop GRP_NumWebVisitsMonth2 GRP_NumWebVisitsMonth3 GRP_NumWebVisitsMonth4
        GRP_NumWebVisitsMonth5 GRP_NumWebVisitsMonth6 GRP_NumWebVisitsMonth7
        GRP_NumWebVisitsMonth8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebVisitsMonth2 = 0;
GRP_NumWebVisitsMonth3 = 0;
GRP_NumWebVisitsMonth4 = 0;
GRP_NumWebVisitsMonth5 = 0;
GRP_NumWebVisitsMonth6 = 0;
GRP_NumWebVisitsMonth7 = 0;
GRP_NumWebVisitsMonth8 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   GRP_NumWebVisitsMonth2 = .;
   GRP_NumWebVisitsMonth3 = .;
   GRP_NumWebVisitsMonth4 = .;
   GRP_NumWebVisitsMonth5 = .;
   GRP_NumWebVisitsMonth6 = .;
   GRP_NumWebVisitsMonth7 = .;
   GRP_NumWebVisitsMonth8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebVisitsMonth2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebVisitsMonth3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebVisitsMonth4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebVisitsMonth5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebVisitsMonth6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebVisitsMonth7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebVisitsMonth8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebVisitsMonth2 = -1;
               GRP_NumWebVisitsMonth3 = -1;
               GRP_NumWebVisitsMonth4 = -1;
               GRP_NumWebVisitsMonth5 = -1;
               GRP_NumWebVisitsMonth6 = -1;
               GRP_NumWebVisitsMonth7 = -1;
               GRP_NumWebVisitsMonth8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebVisitsMonth2 = .;
      GRP_NumWebVisitsMonth3 = .;
      GRP_NumWebVisitsMonth4 = .;
      GRP_NumWebVisitsMonth5 = .;
      GRP_NumWebVisitsMonth6 = .;
      GRP_NumWebVisitsMonth7 = .;
      GRP_NumWebVisitsMonth8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 GRP_RFMstat5 GRP_RFMstat6
        GRP_RFMstat7 GRP_RFMstat8 GRP_RFMstat9 GRP_RFMstat10 ;
*** encoding is sparse, initialize to zero;
GRP_RFMstat2 = 0;
GRP_RFMstat3 = 0;
GRP_RFMstat4 = 0;
GRP_RFMstat5 = 0;
GRP_RFMstat6 = 0;
GRP_RFMstat7 = 0;
GRP_RFMstat8 = 0;
GRP_RFMstat9 = 0;
GRP_RFMstat10 = 0;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   GRP_RFMstat5 = .;
   GRP_RFMstat6 = .;
   GRP_RFMstat7 = .;
   GRP_RFMstat8 = .;
   GRP_RFMstat9 = .;
   GRP_RFMstat10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RFMstat10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RFMstat2 = -1;
                  GRP_RFMstat3 = -1;
                  GRP_RFMstat4 = -1;
                  GRP_RFMstat5 = -1;
                  GRP_RFMstat6 = -1;
                  GRP_RFMstat7 = -1;
                  GRP_RFMstat8 = -1;
                  GRP_RFMstat9 = -1;
                  GRP_RFMstat10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RFMstat2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RFMstat3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RFMstat4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RFMstat5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RFMstat6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RFMstat7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RFMstat8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RFMstat9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      GRP_RFMstat5 = .;
      GRP_RFMstat6 = .;
      GRP_RFMstat7 = .;
      GRP_RFMstat8 = .;
      GRP_RFMstat9 = .;
      GRP_RFMstat10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 GRP_RMntFrq5 GRP_RMntFrq6
        GRP_RMntFrq7 GRP_RMntFrq8 GRP_RMntFrq9 GRP_RMntFrq10 ;
*** encoding is sparse, initialize to zero;
GRP_RMntFrq2 = 0;
GRP_RMntFrq3 = 0;
GRP_RMntFrq4 = 0;
GRP_RMntFrq5 = 0;
GRP_RMntFrq6 = 0;
GRP_RMntFrq7 = 0;
GRP_RMntFrq8 = 0;
GRP_RMntFrq9 = 0;
GRP_RMntFrq10 = 0;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   GRP_RMntFrq5 = .;
   GRP_RMntFrq6 = .;
   GRP_RMntFrq7 = .;
   GRP_RMntFrq8 = .;
   GRP_RMntFrq9 = .;
   GRP_RMntFrq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RMntFrq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RMntFrq2 = -1;
                  GRP_RMntFrq3 = -1;
                  GRP_RMntFrq4 = -1;
                  GRP_RMntFrq5 = -1;
                  GRP_RMntFrq6 = -1;
                  GRP_RMntFrq7 = -1;
                  GRP_RMntFrq8 = -1;
                  GRP_RMntFrq9 = -1;
                  GRP_RMntFrq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RMntFrq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RMntFrq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RMntFrq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RMntFrq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RMntFrq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RMntFrq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RMntFrq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RMntFrq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      GRP_RMntFrq5 = .;
      GRP_RMntFrq6 = .;
      GRP_RMntFrq7 = .;
      GRP_RMntFrq8 = .;
      GRP_RMntFrq9 = .;
      GRP_RMntFrq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 GRP_Recency5 GRP_Recency6
        GRP_Recency7 GRP_Recency8 GRP_Recency9 GRP_Recency10 ;
*** encoding is sparse, initialize to zero;
GRP_Recency2 = 0;
GRP_Recency3 = 0;
GRP_Recency4 = 0;
GRP_Recency5 = 0;
GRP_Recency6 = 0;
GRP_Recency7 = 0;
GRP_Recency8 = 0;
GRP_Recency9 = 0;
GRP_Recency10 = 0;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   GRP_Recency5 = .;
   GRP_Recency6 = .;
   GRP_Recency7 = .;
   GRP_Recency8 = .;
   GRP_Recency9 = .;
   GRP_Recency10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Recency10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Recency2 = -1;
                  GRP_Recency3 = -1;
                  GRP_Recency4 = -1;
                  GRP_Recency5 = -1;
                  GRP_Recency6 = -1;
                  GRP_Recency7 = -1;
                  GRP_Recency8 = -1;
                  GRP_Recency9 = -1;
                  GRP_Recency10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Recency2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Recency3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Recency4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Recency5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Recency6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Recency7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Recency8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Recency9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      GRP_Recency5 = .;
      GRP_Recency6 = .;
      GRP_Recency7 = .;
      GRP_Recency8 = .;
      GRP_Recency9 = .;
      GRP_Recency10 = .;
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
   H11  =    -0.00948621369724 * S_Year_Birth ;
   H12  =    -0.01332341973479 * S_Year_Birth ;
   H13  =     0.02680689553656 * S_Year_Birth ;
   H14  =    -0.05792010201099 * S_Year_Birth ;
   H11  = H11  +    -0.02260423134056 * GRP_AcceptedCmp52
          +     0.02720559312851 * GRP_AcceptedCmpTotal3
          +    -0.15450091961365 * GRP_Frq2  +     0.09645463806885 * GRP_Frq3
          +     0.03736163540292 * GRP_Frq4  +     0.01900271189796 * GRP_Frq5
          +    -0.13179882755919 * GRP_Frq6  +     0.01465231552131 * GRP_Frq7
          +    -0.04169557500262 * GRP_Frq8  +     0.07827591455784 * GRP_Frq9
          +    -0.03487939104209 * GRP_Frq10  +     0.05958734743547 *
        GRP_Income2  +     0.01404642578447 * GRP_Income3
          +     0.04000373829592 * GRP_Income4  +     0.09647687151979 *
        GRP_Income5  +     0.06770903818234 * GRP_Income6
          +    -0.01608747579531 * GRP_Income7  +    -0.00780986866619 *
        GRP_Income8  +     -0.1208946083115 * GRP_Income9
          +     0.03310590486044 * GRP_Income10  +     0.17104549399846 *
        GRP_Mnt2  +     0.21060565394874 * GRP_Mnt3  +    -0.12267534495423 *
        GRP_Mnt4  +    -0.10253377099747 * GRP_Mnt5  +    -0.11840036183379 *
        GRP_Mnt6  +    -0.11604826579267 * GRP_Mnt7  +     0.01947785416729 *
        GRP_Mnt8  +    -0.05235329093653 * GRP_Mnt9  +     0.07555781461819 *
        GRP_Mnt10  +    -0.01119415232571 * GRP_MntFishProducts3
          +    -0.06258932287441 * GRP_MntFishProducts4
          +    -0.06249443279969 * GRP_MntFishProducts5
          +    -0.08705043005418 * GRP_MntFishProducts6
          +    -0.06250880856231 * GRP_MntFishProducts7
          +    -0.05093956410774 * GRP_MntFishProducts8
          +    -0.09998603623322 * GRP_MntFishProducts9
          +    -0.11699508574447 * GRP_MntFishProducts10
          +     0.02785617442392 * GRP_MntGoldProds2
          +    -0.05567610344713 * GRP_MntGoldProds3
          +     0.16109145442162 * GRP_MntGoldProds4
          +     0.03742879797511 * GRP_MntGoldProds5
          +    -0.08696099359949 * GRP_MntGoldProds6
          +     -0.0588447840843 * GRP_MntGoldProds7
          +     0.15325470173248 * GRP_MntGoldProds8
          +     0.00385119880016 * GRP_MntGoldProds9
          +    -0.16390538082766 * GRP_MntGoldProds10
          +    -0.20303201880776 * GRP_MntMeatProducts2
          +     0.03734497366287 * GRP_MntMeatProducts3
          +    -0.06040331506352 * GRP_MntMeatProducts4
          +     -0.2326640786805 * GRP_MntMeatProducts5
          +     0.02550674463793 * GRP_MntMeatProducts6
          +     0.01243117483441 * GRP_MntMeatProducts7
          +    -0.05306157906691 * GRP_MntMeatProducts8
          +    -0.09547068986286 * GRP_MntMeatProducts9
          +     0.03112838891015 * GRP_MntMeatProducts10
          +     0.09111442307664 * GRP_MntSweetProducts3
          +      0.0107058747912 * GRP_MntSweetProducts4
          +     0.04640266357853 * GRP_MntSweetProducts5
          +     0.13526853355441 * GRP_MntSweetProducts6
          +     0.07441197067395 * GRP_MntSweetProducts7
          +    -0.09568756831283 * GRP_MntSweetProducts8
          +     0.03869271873041 * GRP_MntSweetProducts9
          +     0.05612168167252 * GRP_MntSweetProducts10
          +    -0.00850747945986 * GRP_MntWines2  +     0.12696578230364 *
        GRP_MntWines3  +    -0.01923404044081 * GRP_MntWines4
          +    -0.00141124921757 * GRP_MntWines5  +    -0.02934016169309 *
        GRP_MntWines6  +     -0.0164398439556 * GRP_MntWines7
          +     0.06701798829051 * GRP_MntWines8  +    -0.02797742497893 *
        GRP_MntWines9  +     0.05201446053337 * GRP_MntWines10
          +     -0.2778937883206 * GRP_NumCatalogPurchases3
          +     -0.1231993049521 * GRP_NumCatalogPurchases4
          +     0.08135862707329 * GRP_NumCatalogPurchases5
          +     0.02574286247976 * GRP_NumCatalogPurchases6
          +     0.02559601262487 * GRP_NumCatalogPurchases7
          +    -0.08253441492209 * GRP_NumDistPurchases2
          +     0.01265204338515 * GRP_NumDistPurchases3
          +    -0.03063058899389 * GRP_NumDistPurchases4
          +    -0.06178083495796 * GRP_NumDistPurchases5
          +     -0.1492712291363 * GRP_NumDistPurchases6
          +    -0.14958918022575 * GRP_NumDistPurchases7
          +    -0.09536113688852 * GRP_NumDistPurchases8
          +     0.04170413501769 * GRP_NumDistPurchases9
          +     0.10545552590758 * GRP_NumDistPurchases10
          +     0.05210109610761 * GRP_NumWebPurchases2
          +     0.05397391472214 * GRP_NumWebPurchases3
          +    -0.12031416266972 * GRP_NumWebPurchases4
          +     0.04724646654051 * GRP_NumWebPurchases5
          +    -0.02978784813141 * GRP_NumWebPurchases6
          +     -0.0168431490057 * GRP_NumWebPurchases7
          +     0.07572495984248 * GRP_NumWebPurchases8
          +    -0.10063666360572 * GRP_NumWebVisitsMonth2
          +     0.12818576928715 * GRP_NumWebVisitsMonth3
          +     0.07015739340698 * GRP_NumWebVisitsMonth4
          +     0.03240967088049 * GRP_NumWebVisitsMonth5
          +    -0.03086111309383 * GRP_NumWebVisitsMonth6
          +    -0.06320363459905 * GRP_NumWebVisitsMonth7
          +     0.04670619840742 * GRP_NumWebVisitsMonth8
          +     0.04453011488971 * GRP_RFMstat2  +     0.15610360599426 *
        GRP_RFMstat3  +     0.09186530151002 * GRP_RFMstat4
          +    -0.05250976143638 * GRP_RFMstat5  +    -0.02042259949305 *
        GRP_RFMstat6  +     0.13413509404122 * GRP_RFMstat7
          +    -0.14319131039645 * GRP_RFMstat8  +     -0.1444714383638 *
        GRP_RFMstat9  +      -0.044284646065 * GRP_RFMstat10
          +    -0.02719945852219 * GRP_RMntFrq2  +    -0.03801088789497 *
        GRP_RMntFrq3  +     0.07981441011324 * GRP_RMntFrq4
          +     0.06741578630774 * GRP_RMntFrq5  +     0.19310013954589 *
        GRP_RMntFrq6  +     0.00743294497919 * GRP_RMntFrq7
          +     0.00541768619652 * GRP_RMntFrq8  +     0.01332359705323 *
        GRP_RMntFrq9  +      0.1663635539775 * GRP_RMntFrq10
          +     0.17981703522868 * GRP_Recency2  +     0.07184936595964 *
        GRP_Recency3  +     0.14931002408095 * GRP_Recency4
          +     0.07367008524035 * GRP_Recency5  +    -0.06724879225375 *
        GRP_Recency6  +     0.10841604926699 * GRP_Recency7
          +      0.0114286640874 * GRP_Recency8  +    -0.14186269866507 *
        GRP_Recency9  +    -0.12413447885857 * GRP_Recency10 ;
   H12  = H12  +    -0.20007524086445 * GRP_AcceptedCmp52
          +    -0.16729932820809 * GRP_AcceptedCmpTotal3
          +    -0.12884916492888 * GRP_Frq2  +     0.14967036744155 * GRP_Frq3
          +     0.05770982235071 * GRP_Frq4  +      0.0628391762924 * GRP_Frq5
          +     0.05431716737919 * GRP_Frq6  +     0.10745808097383 * GRP_Frq7
          +     0.23952229255304 * GRP_Frq8  +    -0.05371211302868 * GRP_Frq9
          +    -0.05985851645562 * GRP_Frq10  +    -0.13177149874266 *
        GRP_Income2  +     0.03108250947614 * GRP_Income3
          +     0.00867545419318 * GRP_Income4  +     0.02072807762075 *
        GRP_Income5  +     0.05779877582231 * GRP_Income6
          +    -0.16033506450883 * GRP_Income7  +    -0.23212401087817 *
        GRP_Income8  +    -0.13969173009505 * GRP_Income9
          +    -0.16757916709985 * GRP_Income10  +    -0.16736426339803 *
        GRP_Mnt2  +    -0.04512730246837 * GRP_Mnt3  +     0.07871620172074 *
        GRP_Mnt4  +     0.02210063088584 * GRP_Mnt5  +     0.00113900420462 *
        GRP_Mnt6  +    -0.00325600445009 * GRP_Mnt7  +     0.12277948724152 *
        GRP_Mnt8  +    -0.06450645559218 * GRP_Mnt9  +     0.02751633515273 *
        GRP_Mnt10  +    -0.02295934870811 * GRP_MntFishProducts3
          +    -0.09091738334044 * GRP_MntFishProducts4
          +    -0.17215913962632 * GRP_MntFishProducts5
          +    -0.02215062707394 * GRP_MntFishProducts6
          +     0.15786158609875 * GRP_MntFishProducts7
          +     0.02898137691066 * GRP_MntFishProducts8
          +     0.02460286530548 * GRP_MntFishProducts9
          +     0.00115437949667 * GRP_MntFishProducts10
          +    -0.00213129422546 * GRP_MntGoldProds2
          +    -0.12397853161837 * GRP_MntGoldProds3
          +     -0.0584658010472 * GRP_MntGoldProds4
          +     0.01881727095823 * GRP_MntGoldProds5
          +      0.0153191380708 * GRP_MntGoldProds6
          +     0.04181614488427 * GRP_MntGoldProds7
          +    -0.10215565788689 * GRP_MntGoldProds8
          +    -0.00026847795089 * GRP_MntGoldProds9
          +    -0.10017180970238 * GRP_MntGoldProds10
          +    -0.01773693416857 * GRP_MntMeatProducts2
          +    -0.05457783123601 * GRP_MntMeatProducts3
          +     -0.1254419941589 * GRP_MntMeatProducts4
          +     0.02786233878035 * GRP_MntMeatProducts5
          +     0.06748248678642 * GRP_MntMeatProducts6
          +    -0.04307169734328 * GRP_MntMeatProducts7
          +     0.16728572439015 * GRP_MntMeatProducts8
          +     0.07723253718183 * GRP_MntMeatProducts9
          +     0.17570358054951 * GRP_MntMeatProducts10
          +    -0.07570559711527 * GRP_MntSweetProducts3
          +     0.13421045032545 * GRP_MntSweetProducts4
          +     0.05720723087107 * GRP_MntSweetProducts5
          +    -0.03443719682454 * GRP_MntSweetProducts6
          +    -0.04785378335782 * GRP_MntSweetProducts7
          +     0.07030038479722 * GRP_MntSweetProducts8
          +    -0.11909384204549 * GRP_MntSweetProducts9
          +     0.00893159834248 * GRP_MntSweetProducts10
          +     0.02706821408101 * GRP_MntWines2  +     0.07853615958472 *
        GRP_MntWines3  +      0.0165840167654 * GRP_MntWines4
          +     0.11381704490834 * GRP_MntWines5  +    -0.02673312861473 *
        GRP_MntWines6  +    -0.03438966845229 * GRP_MntWines7
          +    -0.07262187800865 * GRP_MntWines8  +    -0.11122344602356 *
        GRP_MntWines9  +    -0.13847205127967 * GRP_MntWines10
          +    -0.29205812336992 * GRP_NumCatalogPurchases3
          +    -0.16811447081502 * GRP_NumCatalogPurchases4
          +     -0.0273024777873 * GRP_NumCatalogPurchases5
          +     0.17992236014851 * GRP_NumCatalogPurchases6
          +     0.06059737603987 * GRP_NumCatalogPurchases7
          +     0.02875528210613 * GRP_NumDistPurchases2
          +    -0.11554200989866 * GRP_NumDistPurchases3
          +    -0.07999101745848 * GRP_NumDistPurchases4
          +     0.12752069256982 * GRP_NumDistPurchases5
          +     0.07528833273371 * GRP_NumDistPurchases6
          +    -0.03374494963533 * GRP_NumDistPurchases7
          +    -0.23956848709413 * GRP_NumDistPurchases8
          +     0.10443461160425 * GRP_NumDistPurchases9
          +     0.09989230824677 * GRP_NumDistPurchases10
          +     0.02170399453491 * GRP_NumWebPurchases2
          +     0.07913129030626 * GRP_NumWebPurchases3
          +     -0.0073484355563 * GRP_NumWebPurchases4
          +     0.08497037355795 * GRP_NumWebPurchases5
          +    -0.14428987116045 * GRP_NumWebPurchases6
          +     0.05169310220567 * GRP_NumWebPurchases7
          +     -0.0550549286808 * GRP_NumWebPurchases8
          +    -0.10959239529028 * GRP_NumWebVisitsMonth2
          +    -0.05013980548494 * GRP_NumWebVisitsMonth3
          +    -0.06804641342564 * GRP_NumWebVisitsMonth4
          +    -0.10768760031749 * GRP_NumWebVisitsMonth5
          +      0.0177417463129 * GRP_NumWebVisitsMonth6
          +     0.00302619272018 * GRP_NumWebVisitsMonth7
          +     0.17926683826416 * GRP_NumWebVisitsMonth8
          +    -0.09656387201255 * GRP_RFMstat2  +    -0.02876291404483 *
        GRP_RFMstat3  +     0.06308497069919 * GRP_RFMstat4
          +      0.0541388054147 * GRP_RFMstat5  +    -0.06370878563284 *
        GRP_RFMstat6  +    -0.01923965581058 * GRP_RFMstat7
          +     0.02020606733431 * GRP_RFMstat8  +     0.21879832650899 *
        GRP_RFMstat9  +     0.08843931418923 * GRP_RFMstat10
          +     0.15143302333297 * GRP_RMntFrq2  +    -0.03210119800793 *
        GRP_RMntFrq3  +     0.05621145429751 * GRP_RMntFrq4
          +    -0.06223171253584 * GRP_RMntFrq5  +    -0.09571387544151 *
        GRP_RMntFrq6  +    -0.01115636053107 * GRP_RMntFrq7
          +    -0.14811084366924 * GRP_RMntFrq8  +    -0.25770733746475 *
        GRP_RMntFrq9  +    -0.25310204430604 * GRP_RMntFrq10
          +     0.31012304155833 * GRP_Recency2  +     0.24565000403408 *
        GRP_Recency3  +     0.10883228894004 * GRP_Recency4
          +     0.04878649118954 * GRP_Recency5  +    -0.06422297566642 *
        GRP_Recency6  +    -0.10742748821025 * GRP_Recency7
          +    -0.09485680103688 * GRP_Recency8  +    -0.06223551373135 *
        GRP_Recency9  +    -0.11604857438338 * GRP_Recency10 ;
   H13  = H13  +    -0.00844369053891 * GRP_AcceptedCmp52
          +    -0.16580334896333 * GRP_AcceptedCmpTotal3
          +     0.02345282257505 * GRP_Frq2  +     0.09018950667725 * GRP_Frq3
          +    -0.01547733102385 * GRP_Frq4  +    -0.09320517865894 * GRP_Frq5
          +     0.08812197749015 * GRP_Frq6  +     0.03686940738652 * GRP_Frq7
          +      0.0439773427612 * GRP_Frq8  +     0.01401252704413 * GRP_Frq9
          +    -0.01001749163372 * GRP_Frq10  +    -0.06357246489998 *
        GRP_Income2  +     0.09128341137626 * GRP_Income3
          +     0.03869580591871 * GRP_Income4  +     0.11838540963238 *
        GRP_Income5  +     0.09313527800019 * GRP_Income6
          +    -0.03909386514373 * GRP_Income7  +    -0.06058259454027 *
        GRP_Income8  +     0.04397620843764 * GRP_Income9
          +     0.11923337644697 * GRP_Income10  +     0.02523111499739 *
        GRP_Mnt2  +     0.10319544476668 * GRP_Mnt3  +    -0.01096488413249 *
        GRP_Mnt4  +    -0.14102391868136 * GRP_Mnt5  +    -0.03604923182846 *
        GRP_Mnt6  +     0.00846033898209 * GRP_Mnt7  +     0.00777389006931 *
        GRP_Mnt8  +     0.03334758057616 * GRP_Mnt9  +     0.11718114943152 *
        GRP_Mnt10  +     0.11365506718081 * GRP_MntFishProducts3
          +     0.05877708579505 * GRP_MntFishProducts4
          +     0.12747316330807 * GRP_MntFishProducts5
          +     0.07689430712979 * GRP_MntFishProducts6
          +    -0.09363621335848 * GRP_MntFishProducts7
          +     0.08251517571588 * GRP_MntFishProducts8
          +    -0.05720106981853 * GRP_MntFishProducts9
          +     0.10238572217437 * GRP_MntFishProducts10
          +    -0.08850177920551 * GRP_MntGoldProds2
          +     0.07106548185844 * GRP_MntGoldProds3
          +    -0.07504915090166 * GRP_MntGoldProds4
          +     0.06547146351826 * GRP_MntGoldProds5
          +     -0.0183922939684 * GRP_MntGoldProds6
          +    -0.02389732320092 * GRP_MntGoldProds7
          +     0.12523682898289 * GRP_MntGoldProds8
          +     0.00195716544171 * GRP_MntGoldProds9
          +     0.07941160526672 * GRP_MntGoldProds10
          +    -0.19179046775456 * GRP_MntMeatProducts2
          +     -0.0389402396037 * GRP_MntMeatProducts3
          +     -0.0290860829201 * GRP_MntMeatProducts4
          +    -0.21872866533352 * GRP_MntMeatProducts5
          +     0.05533791843698 * GRP_MntMeatProducts6
          +       -0.20666651072 * GRP_MntMeatProducts7
          +     -0.0796307914564 * GRP_MntMeatProducts8
          +      0.0125623649724 * GRP_MntMeatProducts9
          +     0.13146603147935 * GRP_MntMeatProducts10
          +     0.01378152909286 * GRP_MntSweetProducts3
          +     0.02339728625396 * GRP_MntSweetProducts4
          +     0.05470854138774 * GRP_MntSweetProducts5
          +    -0.11288367910123 * GRP_MntSweetProducts6
          +      0.0473676315858 * GRP_MntSweetProducts7
          +     0.00514004828595 * GRP_MntSweetProducts8
          +     0.08883555376201 * GRP_MntSweetProducts9
          +    -0.12751681325032 * GRP_MntSweetProducts10
          +     0.24462525059623 * GRP_MntWines2  +     0.08091739110364 *
        GRP_MntWines3  +     0.13524654938253 * GRP_MntWines4
          +     0.15228680493337 * GRP_MntWines5  +     0.25211379896757 *
        GRP_MntWines6  +     0.02380959223176 * GRP_MntWines7
          +    -0.14313923152473 * GRP_MntWines8  +    -0.11801761082695 *
        GRP_MntWines9  +    -0.16852571259922 * GRP_MntWines10
          +    -0.16746744583721 * GRP_NumCatalogPurchases3
          +    -0.17642734245373 * GRP_NumCatalogPurchases4
          +    -0.01168768829825 * GRP_NumCatalogPurchases5
          +     0.04056903892747 * GRP_NumCatalogPurchases6
          +     0.09841905741313 * GRP_NumCatalogPurchases7
          +     0.05529930922103 * GRP_NumDistPurchases2
          +    -0.10272835270323 * GRP_NumDistPurchases3
          +    -0.00982050980651 * GRP_NumDistPurchases4
          +     0.09350773406021 * GRP_NumDistPurchases5
          +    -0.03841834935067 * GRP_NumDistPurchases6
          +    -0.04827508249402 * GRP_NumDistPurchases7
          +     0.06075797424637 * GRP_NumDistPurchases8
          +     0.00359161903684 * GRP_NumDistPurchases9
          +     0.02799377755166 * GRP_NumDistPurchases10
          +     0.09457700570761 * GRP_NumWebPurchases2
          +     0.01861029541012 * GRP_NumWebPurchases3
          +     0.12768862734633 * GRP_NumWebPurchases4
          +    -0.01467162149146 * GRP_NumWebPurchases5
          +     0.13130516110782 * GRP_NumWebPurchases6
          +    -0.14604853629518 * GRP_NumWebPurchases7
          +    -0.09562824326923 * GRP_NumWebPurchases8
          +    -0.36442341137072 * GRP_NumWebVisitsMonth2
          +    -0.25323161950235 * GRP_NumWebVisitsMonth3
          +    -0.31096337590253 * GRP_NumWebVisitsMonth4
          +    -0.11461544143288 * GRP_NumWebVisitsMonth5
          +     0.07238715763207 * GRP_NumWebVisitsMonth6
          +     0.08935531829342 * GRP_NumWebVisitsMonth7
          +     0.22850565953975 * GRP_NumWebVisitsMonth8
          +     0.02432510168957 * GRP_RFMstat2  +    -0.28494767117611 *
        GRP_RFMstat3  +    -0.07452225624443 * GRP_RFMstat4
          +    -0.08506838768317 * GRP_RFMstat5  +     0.12721981901289 *
        GRP_RFMstat6  +      0.0542859812271 * GRP_RFMstat7
          +    -0.07944879635099 * GRP_RFMstat8  +    -0.10026977236747 *
        GRP_RFMstat9  +     0.07918108350163 * GRP_RFMstat10
          +     0.05858569169219 * GRP_RMntFrq2  +      0.0705461018017 *
        GRP_RMntFrq3  +     -0.0071799988051 * GRP_RMntFrq4
          +     0.06239785628657 * GRP_RMntFrq5  +     0.00486900089926 *
        GRP_RMntFrq6  +    -0.26361892152101 * GRP_RMntFrq7
          +    -0.01726856530355 * GRP_RMntFrq8  +     0.11504782062521 *
        GRP_RMntFrq9  +    -0.08165273435547 * GRP_RMntFrq10
          +     0.22589731933824 * GRP_Recency2  +     0.33111289517863 *
        GRP_Recency3  +     0.30932072844653 * GRP_Recency4
          +     0.16344846166946 * GRP_Recency5  +    -0.01627540259305 *
        GRP_Recency6  +    -0.04684120624061 * GRP_Recency7
          +    -0.08623219384728 * GRP_Recency8  +    -0.15965579764063 *
        GRP_Recency9  +     -0.2117499807521 * GRP_Recency10 ;
   H14  = H14  +     0.02188114748803 * GRP_AcceptedCmp52
          +     0.08646908458594 * GRP_AcceptedCmpTotal3
          +     0.05149348769542 * GRP_Frq2  +     0.03793848109065 * GRP_Frq3
          +     -0.0357431627489 * GRP_Frq4  +    -0.00859269863478 * GRP_Frq5
          +     0.04871738846304 * GRP_Frq6  +    -0.00283283467808 * GRP_Frq7
          +    -0.13378372438169 * GRP_Frq8  +     0.14432015182237 * GRP_Frq9
          +     0.05045092354406 * GRP_Frq10  +    -0.05764056653665 *
        GRP_Income2  +     0.06016395989717 * GRP_Income3
          +    -0.05143665678579 * GRP_Income4  +    -0.01148849326685 *
        GRP_Income5  +      0.0911892851136 * GRP_Income6
          +     0.09394446335188 * GRP_Income7  +     0.00877583522767 *
        GRP_Income8  +     0.07189506315871 * GRP_Income9
          +     0.04726250000171 * GRP_Income10  +    -0.11590947250466 *
        GRP_Mnt2  +     0.01896972354319 * GRP_Mnt3  +     0.08416918130321 *
        GRP_Mnt4  +     -0.0917308291268 * GRP_Mnt5  +     -0.1386762622738 *
        GRP_Mnt6  +    -0.03407647523138 * GRP_Mnt7  +     0.05194678912988 *
        GRP_Mnt8  +     -0.0784059272097 * GRP_Mnt9  +    -0.04948120280701 *
        GRP_Mnt10  +    -0.05764476907718 * GRP_MntFishProducts3
          +     0.00294137266486 * GRP_MntFishProducts4
          +    -0.08345533289743 * GRP_MntFishProducts5
          +     0.08682504365049 * GRP_MntFishProducts6
          +     0.04861994293725 * GRP_MntFishProducts7
          +    -0.09658732528952 * GRP_MntFishProducts8
          +     0.01932524346969 * GRP_MntFishProducts9
          +     0.15356685769543 * GRP_MntFishProducts10
          +     0.05121543419353 * GRP_MntGoldProds2
          +    -0.09687503776349 * GRP_MntGoldProds3
          +    -0.00201047423565 * GRP_MntGoldProds4
          +     0.04606915090643 * GRP_MntGoldProds5
          +     0.01296728512581 * GRP_MntGoldProds6
          +     0.02980475037287 * GRP_MntGoldProds7
          +     0.17242808162197 * GRP_MntGoldProds8
          +     -0.1062245169599 * GRP_MntGoldProds9
          +    -0.00239349600358 * GRP_MntGoldProds10
          +     0.19105508406692 * GRP_MntMeatProducts2
          +      0.0721892389979 * GRP_MntMeatProducts3
          +     0.04950248428821 * GRP_MntMeatProducts4
          +       0.011202043465 * GRP_MntMeatProducts5
          +     0.07338692011158 * GRP_MntMeatProducts6
          +     0.06519246489007 * GRP_MntMeatProducts7
          +    -0.02344006364501 * GRP_MntMeatProducts8
          +    -0.12065570244649 * GRP_MntMeatProducts9
          +    -0.14483876061509 * GRP_MntMeatProducts10
          +     0.09233833803975 * GRP_MntSweetProducts3
          +    -0.03103945429335 * GRP_MntSweetProducts4
          +     0.03404552551606 * GRP_MntSweetProducts5
          +    -0.17790480920128 * GRP_MntSweetProducts6
          +    -0.09117458403661 * GRP_MntSweetProducts7
          +      0.0470789733132 * GRP_MntSweetProducts8
          +     0.03124684587707 * GRP_MntSweetProducts9
          +    -0.07252949331221 * GRP_MntSweetProducts10
          +     0.04338049667872 * GRP_MntWines2  +     0.05153731920051 *
        GRP_MntWines3  +    -0.16539066936293 * GRP_MntWines4
          +    -0.02379793124646 * GRP_MntWines5  +     0.09501109169586 *
        GRP_MntWines6  +    -0.01191112499181 * GRP_MntWines7
          +    -0.09067672094836 * GRP_MntWines8  +     -0.0250288077958 *
        GRP_MntWines9  +     0.09261800213767 * GRP_MntWines10
          +     0.36494259072852 * GRP_NumCatalogPurchases3
          +    -0.06958342540716 * GRP_NumCatalogPurchases4
          +    -0.01785410770752 * GRP_NumCatalogPurchases5
          +     0.01307071043939 * GRP_NumCatalogPurchases6
          +    -0.05249899159254 * GRP_NumCatalogPurchases7
          +     0.09706613070736 * GRP_NumDistPurchases2
          +     0.13754416009752 * GRP_NumDistPurchases3
          +    -0.06704798738337 * GRP_NumDistPurchases4
          +     0.16337691573309 * GRP_NumDistPurchases5
          +      0.0846818034339 * GRP_NumDistPurchases6
          +    -0.12464813850441 * GRP_NumDistPurchases7
          +     0.23177223873272 * GRP_NumDistPurchases8
          +     0.06428698468893 * GRP_NumDistPurchases9
          +    -0.05013693947238 * GRP_NumDistPurchases10
          +     -0.0781210505593 * GRP_NumWebPurchases2
          +    -0.10217360277948 * GRP_NumWebPurchases3
          +    -0.05411682202927 * GRP_NumWebPurchases4
          +    -0.10412358734945 * GRP_NumWebPurchases5
          +     0.04964026358117 * GRP_NumWebPurchases6
          +    -0.09298687213836 * GRP_NumWebPurchases7
          +     0.05568849249074 * GRP_NumWebPurchases8
          +     0.18272268077874 * GRP_NumWebVisitsMonth2
          +     0.11750209202845 * GRP_NumWebVisitsMonth3
          +     0.06687705249888 * GRP_NumWebVisitsMonth4
          +     0.11268971948683 * GRP_NumWebVisitsMonth5
          +     0.00979384704108 * GRP_NumWebVisitsMonth6
          +    -0.17908175163427 * GRP_NumWebVisitsMonth7
          +    -0.06773147555787 * GRP_NumWebVisitsMonth8
          +     0.05459536114484 * GRP_RFMstat2  +     0.06011583519368 *
        GRP_RFMstat3  +     0.09628400129954 * GRP_RFMstat4
          +     0.03585351764696 * GRP_RFMstat5  +      0.1209143981958 *
        GRP_RFMstat6  +    -0.07709098052561 * GRP_RFMstat7
          +      0.0009682685775 * GRP_RFMstat8  +     0.04727616520495 *
        GRP_RFMstat9  +    -0.07610354030212 * GRP_RFMstat10
          +     0.01004155540427 * GRP_RMntFrq2  +     0.01281356001896 *
        GRP_RMntFrq3  +    -0.10953055934486 * GRP_RMntFrq4
          +    -0.01825619287016 * GRP_RMntFrq5  +     0.02057971320366 *
        GRP_RMntFrq6  +      0.0273435515115 * GRP_RMntFrq7
          +     0.17818733602064 * GRP_RMntFrq8  +    -0.21654061862442 *
        GRP_RMntFrq9  +    -0.11612261965604 * GRP_RMntFrq10
          +    -0.31358790280217 * GRP_Recency2  +    -0.04884121560273 *
        GRP_Recency3  +    -0.22489072492485 * GRP_Recency4
          +    -0.06066194287053 * GRP_Recency5  +     0.06482925138951 *
        GRP_Recency6  +    -0.00980826734495 * GRP_Recency7
          +     0.14228651088455 * GRP_Recency8  +     0.08422707361259 *
        GRP_Recency9  +     0.41077062610618 * GRP_Recency10 ;
   H11  =    -0.15383925908497 + H11 ;
   H12  =    -0.23094845660008 + H12 ;
   H13  =    -0.04539536517242 + H13 ;
   H14  =     -0.0221725214396 + H14 ;
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
   P_DepVar1  =     1.33069771729993 * H11  +     3.50828788182772 * H12
          +     4.28135607872491 * H13  +    -2.55291090360344 * H14 ;
   P_DepVar1  =    -1.74824649141499 + P_DepVar1 ;
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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_AcceptedCmpTotal3 = 'Dummy: GRP_AcceptedCmpTotal=3' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Frq5 = 'Dummy: GRP_Frq=5' ;

      label GRP_Frq6 = 'Dummy: GRP_Frq=6' ;

      label GRP_Frq7 = 'Dummy: GRP_Frq=7' ;

      label GRP_Frq8 = 'Dummy: GRP_Frq=8' ;

      label GRP_Frq9 = 'Dummy: GRP_Frq=9' ;

      label GRP_Frq10 = 'Dummy: GRP_Frq=10' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Income5 = 'Dummy: GRP_Income=5' ;

      label GRP_Income6 = 'Dummy: GRP_Income=6' ;

      label GRP_Income7 = 'Dummy: GRP_Income=7' ;

      label GRP_Income8 = 'Dummy: GRP_Income=8' ;

      label GRP_Income9 = 'Dummy: GRP_Income=9' ;

      label GRP_Income10 = 'Dummy: GRP_Income=10' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_Mnt5 = 'Dummy: GRP_Mnt=5' ;

      label GRP_Mnt6 = 'Dummy: GRP_Mnt=6' ;

      label GRP_Mnt7 = 'Dummy: GRP_Mnt=7' ;

      label GRP_Mnt8 = 'Dummy: GRP_Mnt=8' ;

      label GRP_Mnt9 = 'Dummy: GRP_Mnt=9' ;

      label GRP_Mnt10 = 'Dummy: GRP_Mnt=10' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntFishProducts5 = 'Dummy: GRP_MntFishProducts=5' ;

      label GRP_MntFishProducts6 = 'Dummy: GRP_MntFishProducts=6' ;

      label GRP_MntFishProducts7 = 'Dummy: GRP_MntFishProducts=7' ;

      label GRP_MntFishProducts8 = 'Dummy: GRP_MntFishProducts=8' ;

      label GRP_MntFishProducts9 = 'Dummy: GRP_MntFishProducts=9' ;

      label GRP_MntFishProducts10 = 'Dummy: GRP_MntFishProducts=10' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntGoldProds5 = 'Dummy: GRP_MntGoldProds=5' ;

      label GRP_MntGoldProds6 = 'Dummy: GRP_MntGoldProds=6' ;

      label GRP_MntGoldProds7 = 'Dummy: GRP_MntGoldProds=7' ;

      label GRP_MntGoldProds8 = 'Dummy: GRP_MntGoldProds=8' ;

      label GRP_MntGoldProds9 = 'Dummy: GRP_MntGoldProds=9' ;

      label GRP_MntGoldProds10 = 'Dummy: GRP_MntGoldProds=10' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntMeatProducts5 = 'Dummy: GRP_MntMeatProducts=5' ;

      label GRP_MntMeatProducts6 = 'Dummy: GRP_MntMeatProducts=6' ;

      label GRP_MntMeatProducts7 = 'Dummy: GRP_MntMeatProducts=7' ;

      label GRP_MntMeatProducts8 = 'Dummy: GRP_MntMeatProducts=8' ;

      label GRP_MntMeatProducts9 = 'Dummy: GRP_MntMeatProducts=9' ;

      label GRP_MntMeatProducts10 = 'Dummy: GRP_MntMeatProducts=10' ;

      label GRP_MntSweetProducts3 = 'Dummy: GRP_MntSweetProducts=3' ;

      label GRP_MntSweetProducts4 = 'Dummy: GRP_MntSweetProducts=4' ;

      label GRP_MntSweetProducts5 = 'Dummy: GRP_MntSweetProducts=5' ;

      label GRP_MntSweetProducts6 = 'Dummy: GRP_MntSweetProducts=6' ;

      label GRP_MntSweetProducts7 = 'Dummy: GRP_MntSweetProducts=7' ;

      label GRP_MntSweetProducts8 = 'Dummy: GRP_MntSweetProducts=8' ;

      label GRP_MntSweetProducts9 = 'Dummy: GRP_MntSweetProducts=9' ;

      label GRP_MntSweetProducts10 = 'Dummy: GRP_MntSweetProducts=10' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_MntWines5 = 'Dummy: GRP_MntWines=5' ;

      label GRP_MntWines6 = 'Dummy: GRP_MntWines=6' ;

      label GRP_MntWines7 = 'Dummy: GRP_MntWines=7' ;

      label GRP_MntWines8 = 'Dummy: GRP_MntWines=8' ;

      label GRP_MntWines9 = 'Dummy: GRP_MntWines=9' ;

      label GRP_MntWines10 = 'Dummy: GRP_MntWines=10' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumCatalogPurchases5 = 'Dummy: GRP_NumCatalogPurchases=5' ;

      label GRP_NumCatalogPurchases6 = 'Dummy: GRP_NumCatalogPurchases=6' ;

      label GRP_NumCatalogPurchases7 = 'Dummy: GRP_NumCatalogPurchases=7' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumDistPurchases5 = 'Dummy: GRP_NumDistPurchases=5' ;

      label GRP_NumDistPurchases6 = 'Dummy: GRP_NumDistPurchases=6' ;

      label GRP_NumDistPurchases7 = 'Dummy: GRP_NumDistPurchases=7' ;

      label GRP_NumDistPurchases8 = 'Dummy: GRP_NumDistPurchases=8' ;

      label GRP_NumDistPurchases9 = 'Dummy: GRP_NumDistPurchases=9' ;

      label GRP_NumDistPurchases10 = 'Dummy: GRP_NumDistPurchases=10' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_NumWebPurchases5 = 'Dummy: GRP_NumWebPurchases=5' ;

      label GRP_NumWebPurchases6 = 'Dummy: GRP_NumWebPurchases=6' ;

      label GRP_NumWebPurchases7 = 'Dummy: GRP_NumWebPurchases=7' ;

      label GRP_NumWebPurchases8 = 'Dummy: GRP_NumWebPurchases=8' ;

      label GRP_NumWebVisitsMonth2 = 'Dummy: GRP_NumWebVisitsMonth=2' ;

      label GRP_NumWebVisitsMonth3 = 'Dummy: GRP_NumWebVisitsMonth=3' ;

      label GRP_NumWebVisitsMonth4 = 'Dummy: GRP_NumWebVisitsMonth=4' ;

      label GRP_NumWebVisitsMonth5 = 'Dummy: GRP_NumWebVisitsMonth=5' ;

      label GRP_NumWebVisitsMonth6 = 'Dummy: GRP_NumWebVisitsMonth=6' ;

      label GRP_NumWebVisitsMonth7 = 'Dummy: GRP_NumWebVisitsMonth=7' ;

      label GRP_NumWebVisitsMonth8 = 'Dummy: GRP_NumWebVisitsMonth=8' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RFMstat5 = 'Dummy: GRP_RFMstat=5' ;

      label GRP_RFMstat6 = 'Dummy: GRP_RFMstat=6' ;

      label GRP_RFMstat7 = 'Dummy: GRP_RFMstat=7' ;

      label GRP_RFMstat8 = 'Dummy: GRP_RFMstat=8' ;

      label GRP_RFMstat9 = 'Dummy: GRP_RFMstat=9' ;

      label GRP_RFMstat10 = 'Dummy: GRP_RFMstat=10' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq5 = 'Dummy: GRP_RMntFrq=5' ;

      label GRP_RMntFrq6 = 'Dummy: GRP_RMntFrq=6' ;

      label GRP_RMntFrq7 = 'Dummy: GRP_RMntFrq=7' ;

      label GRP_RMntFrq8 = 'Dummy: GRP_RMntFrq=8' ;

      label GRP_RMntFrq9 = 'Dummy: GRP_RMntFrq=9' ;

      label GRP_RMntFrq10 = 'Dummy: GRP_RMntFrq=10' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label GRP_Recency5 = 'Dummy: GRP_Recency=5' ;

      label GRP_Recency6 = 'Dummy: GRP_Recency=6' ;

      label GRP_Recency7 = 'Dummy: GRP_Recency=7' ;

      label GRP_Recency8 = 'Dummy: GRP_Recency=8' ;

      label GRP_Recency9 = 'Dummy: GRP_Recency=9' ;

      label GRP_Recency10 = 'Dummy: GRP_Recency=10' ;

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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop GRP_AcceptedCmpTotal3 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   GRP_AcceptedCmpTotal3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_AcceptedCmpTotal3 = 1;
   end;
   else if _dm12 = '4'  then do;
      GRP_AcceptedCmpTotal3 = -1;
   end;
   else do;
      GRP_AcceptedCmpTotal3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 GRP_Frq5 GRP_Frq6 GRP_Frq7 GRP_Frq8 GRP_Frq9
        GRP_Frq10 ;
*** encoding is sparse, initialize to zero;
GRP_Frq2 = 0;
GRP_Frq3 = 0;
GRP_Frq4 = 0;
GRP_Frq5 = 0;
GRP_Frq6 = 0;
GRP_Frq7 = 0;
GRP_Frq8 = 0;
GRP_Frq9 = 0;
GRP_Frq10 = 0;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   GRP_Frq5 = .;
   GRP_Frq6 = .;
   GRP_Frq7 = .;
   GRP_Frq8 = .;
   GRP_Frq9 = .;
   GRP_Frq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Frq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Frq2 = -1;
                  GRP_Frq3 = -1;
                  GRP_Frq4 = -1;
                  GRP_Frq5 = -1;
                  GRP_Frq6 = -1;
                  GRP_Frq7 = -1;
                  GRP_Frq8 = -1;
                  GRP_Frq9 = -1;
                  GRP_Frq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Frq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Frq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Frq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Frq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Frq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Frq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Frq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Frq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      GRP_Frq5 = .;
      GRP_Frq6 = .;
      GRP_Frq7 = .;
      GRP_Frq8 = .;
      GRP_Frq9 = .;
      GRP_Frq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 GRP_Income5 GRP_Income6 GRP_Income7
        GRP_Income8 GRP_Income9 GRP_Income10 ;
*** encoding is sparse, initialize to zero;
GRP_Income2 = 0;
GRP_Income3 = 0;
GRP_Income4 = 0;
GRP_Income5 = 0;
GRP_Income6 = 0;
GRP_Income7 = 0;
GRP_Income8 = 0;
GRP_Income9 = 0;
GRP_Income10 = 0;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   GRP_Income5 = .;
   GRP_Income6 = .;
   GRP_Income7 = .;
   GRP_Income8 = .;
   GRP_Income9 = .;
   GRP_Income10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Income10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Income2 = -1;
                  GRP_Income3 = -1;
                  GRP_Income4 = -1;
                  GRP_Income5 = -1;
                  GRP_Income6 = -1;
                  GRP_Income7 = -1;
                  GRP_Income8 = -1;
                  GRP_Income9 = -1;
                  GRP_Income10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Income2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Income3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Income4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Income5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Income6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Income7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Income8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Income9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      GRP_Income5 = .;
      GRP_Income6 = .;
      GRP_Income7 = .;
      GRP_Income8 = .;
      GRP_Income9 = .;
      GRP_Income10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 GRP_Mnt5 GRP_Mnt6 GRP_Mnt7 GRP_Mnt8 GRP_Mnt9
        GRP_Mnt10 ;
*** encoding is sparse, initialize to zero;
GRP_Mnt2 = 0;
GRP_Mnt3 = 0;
GRP_Mnt4 = 0;
GRP_Mnt5 = 0;
GRP_Mnt6 = 0;
GRP_Mnt7 = 0;
GRP_Mnt8 = 0;
GRP_Mnt9 = 0;
GRP_Mnt10 = 0;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   GRP_Mnt5 = .;
   GRP_Mnt6 = .;
   GRP_Mnt7 = .;
   GRP_Mnt8 = .;
   GRP_Mnt9 = .;
   GRP_Mnt10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Mnt10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Mnt2 = -1;
                  GRP_Mnt3 = -1;
                  GRP_Mnt4 = -1;
                  GRP_Mnt5 = -1;
                  GRP_Mnt6 = -1;
                  GRP_Mnt7 = -1;
                  GRP_Mnt8 = -1;
                  GRP_Mnt9 = -1;
                  GRP_Mnt10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Mnt2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Mnt3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Mnt4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Mnt5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Mnt6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Mnt7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Mnt8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Mnt9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      GRP_Mnt5 = .;
      GRP_Mnt6 = .;
      GRP_Mnt7 = .;
      GRP_Mnt8 = .;
      GRP_Mnt9 = .;
      GRP_Mnt10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts3 GRP_MntFishProducts4 GRP_MntFishProducts5
        GRP_MntFishProducts6 GRP_MntFishProducts7 GRP_MntFishProducts8
        GRP_MntFishProducts9 GRP_MntFishProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntFishProducts3 = 0;
GRP_MntFishProducts4 = 0;
GRP_MntFishProducts5 = 0;
GRP_MntFishProducts6 = 0;
GRP_MntFishProducts7 = 0;
GRP_MntFishProducts8 = 0;
GRP_MntFishProducts9 = 0;
GRP_MntFishProducts10 = 0;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   GRP_MntFishProducts5 = .;
   GRP_MntFishProducts6 = .;
   GRP_MntFishProducts7 = .;
   GRP_MntFishProducts8 = .;
   GRP_MntFishProducts9 = .;
   GRP_MntFishProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntFishProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntFishProducts3 = -1;
                  GRP_MntFishProducts4 = -1;
                  GRP_MntFishProducts5 = -1;
                  GRP_MntFishProducts6 = -1;
                  GRP_MntFishProducts7 = -1;
                  GRP_MntFishProducts8 = -1;
                  GRP_MntFishProducts9 = -1;
                  GRP_MntFishProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntFishProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntFishProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntFishProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntFishProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntFishProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntFishProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntFishProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      GRP_MntFishProducts5 = .;
      GRP_MntFishProducts6 = .;
      GRP_MntFishProducts7 = .;
      GRP_MntFishProducts8 = .;
      GRP_MntFishProducts9 = .;
      GRP_MntFishProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 GRP_MntGoldProds5
        GRP_MntGoldProds6 GRP_MntGoldProds7 GRP_MntGoldProds8
        GRP_MntGoldProds9 GRP_MntGoldProds10 ;
*** encoding is sparse, initialize to zero;
GRP_MntGoldProds2 = 0;
GRP_MntGoldProds3 = 0;
GRP_MntGoldProds4 = 0;
GRP_MntGoldProds5 = 0;
GRP_MntGoldProds6 = 0;
GRP_MntGoldProds7 = 0;
GRP_MntGoldProds8 = 0;
GRP_MntGoldProds9 = 0;
GRP_MntGoldProds10 = 0;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   GRP_MntGoldProds5 = .;
   GRP_MntGoldProds6 = .;
   GRP_MntGoldProds7 = .;
   GRP_MntGoldProds8 = .;
   GRP_MntGoldProds9 = .;
   GRP_MntGoldProds10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntGoldProds10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntGoldProds2 = -1;
                  GRP_MntGoldProds3 = -1;
                  GRP_MntGoldProds4 = -1;
                  GRP_MntGoldProds5 = -1;
                  GRP_MntGoldProds6 = -1;
                  GRP_MntGoldProds7 = -1;
                  GRP_MntGoldProds8 = -1;
                  GRP_MntGoldProds9 = -1;
                  GRP_MntGoldProds10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntGoldProds2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntGoldProds3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntGoldProds4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntGoldProds5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntGoldProds6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntGoldProds7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntGoldProds8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntGoldProds9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      GRP_MntGoldProds5 = .;
      GRP_MntGoldProds6 = .;
      GRP_MntGoldProds7 = .;
      GRP_MntGoldProds8 = .;
      GRP_MntGoldProds9 = .;
      GRP_MntGoldProds10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4
        GRP_MntMeatProducts5 GRP_MntMeatProducts6 GRP_MntMeatProducts7
        GRP_MntMeatProducts8 GRP_MntMeatProducts9 GRP_MntMeatProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntMeatProducts2 = 0;
GRP_MntMeatProducts3 = 0;
GRP_MntMeatProducts4 = 0;
GRP_MntMeatProducts5 = 0;
GRP_MntMeatProducts6 = 0;
GRP_MntMeatProducts7 = 0;
GRP_MntMeatProducts8 = 0;
GRP_MntMeatProducts9 = 0;
GRP_MntMeatProducts10 = 0;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   GRP_MntMeatProducts5 = .;
   GRP_MntMeatProducts6 = .;
   GRP_MntMeatProducts7 = .;
   GRP_MntMeatProducts8 = .;
   GRP_MntMeatProducts9 = .;
   GRP_MntMeatProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntMeatProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntMeatProducts2 = -1;
                  GRP_MntMeatProducts3 = -1;
                  GRP_MntMeatProducts4 = -1;
                  GRP_MntMeatProducts5 = -1;
                  GRP_MntMeatProducts6 = -1;
                  GRP_MntMeatProducts7 = -1;
                  GRP_MntMeatProducts8 = -1;
                  GRP_MntMeatProducts9 = -1;
                  GRP_MntMeatProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntMeatProducts2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntMeatProducts3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntMeatProducts4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntMeatProducts5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntMeatProducts6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntMeatProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntMeatProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntMeatProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      GRP_MntMeatProducts5 = .;
      GRP_MntMeatProducts6 = .;
      GRP_MntMeatProducts7 = .;
      GRP_MntMeatProducts8 = .;
      GRP_MntMeatProducts9 = .;
      GRP_MntMeatProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop GRP_MntSweetProducts3 GRP_MntSweetProducts4 GRP_MntSweetProducts5
        GRP_MntSweetProducts6 GRP_MntSweetProducts7 GRP_MntSweetProducts8
        GRP_MntSweetProducts9 GRP_MntSweetProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntSweetProducts3 = 0;
GRP_MntSweetProducts4 = 0;
GRP_MntSweetProducts5 = 0;
GRP_MntSweetProducts6 = 0;
GRP_MntSweetProducts7 = 0;
GRP_MntSweetProducts8 = 0;
GRP_MntSweetProducts9 = 0;
GRP_MntSweetProducts10 = 0;
if missing( GRP_MntSweetProducts ) then do;
   GRP_MntSweetProducts3 = .;
   GRP_MntSweetProducts4 = .;
   GRP_MntSweetProducts5 = .;
   GRP_MntSweetProducts6 = .;
   GRP_MntSweetProducts7 = .;
   GRP_MntSweetProducts8 = .;
   GRP_MntSweetProducts9 = .;
   GRP_MntSweetProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntSweetProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntSweetProducts3 = -1;
                  GRP_MntSweetProducts4 = -1;
                  GRP_MntSweetProducts5 = -1;
                  GRP_MntSweetProducts6 = -1;
                  GRP_MntSweetProducts7 = -1;
                  GRP_MntSweetProducts8 = -1;
                  GRP_MntSweetProducts9 = -1;
                  GRP_MntSweetProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntSweetProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntSweetProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntSweetProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntSweetProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntSweetProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntSweetProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntSweetProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntSweetProducts3 = .;
      GRP_MntSweetProducts4 = .;
      GRP_MntSweetProducts5 = .;
      GRP_MntSweetProducts6 = .;
      GRP_MntSweetProducts7 = .;
      GRP_MntSweetProducts8 = .;
      GRP_MntSweetProducts9 = .;
      GRP_MntSweetProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 GRP_MntWines5 GRP_MntWines6
        GRP_MntWines7 GRP_MntWines8 GRP_MntWines9 GRP_MntWines10 ;
*** encoding is sparse, initialize to zero;
GRP_MntWines2 = 0;
GRP_MntWines3 = 0;
GRP_MntWines4 = 0;
GRP_MntWines5 = 0;
GRP_MntWines6 = 0;
GRP_MntWines7 = 0;
GRP_MntWines8 = 0;
GRP_MntWines9 = 0;
GRP_MntWines10 = 0;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   GRP_MntWines5 = .;
   GRP_MntWines6 = .;
   GRP_MntWines7 = .;
   GRP_MntWines8 = .;
   GRP_MntWines9 = .;
   GRP_MntWines10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntWines10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntWines2 = -1;
                  GRP_MntWines3 = -1;
                  GRP_MntWines4 = -1;
                  GRP_MntWines5 = -1;
                  GRP_MntWines6 = -1;
                  GRP_MntWines7 = -1;
                  GRP_MntWines8 = -1;
                  GRP_MntWines9 = -1;
                  GRP_MntWines10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntWines2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntWines3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntWines4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntWines5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntWines6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntWines7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntWines8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntWines9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      GRP_MntWines5 = .;
      GRP_MntWines6 = .;
      GRP_MntWines7 = .;
      GRP_MntWines8 = .;
      GRP_MntWines9 = .;
      GRP_MntWines10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4
        GRP_NumCatalogPurchases5 GRP_NumCatalogPurchases6
        GRP_NumCatalogPurchases7 ;
*** encoding is sparse, initialize to zero;
GRP_NumCatalogPurchases3 = 0;
GRP_NumCatalogPurchases4 = 0;
GRP_NumCatalogPurchases5 = 0;
GRP_NumCatalogPurchases6 = 0;
GRP_NumCatalogPurchases7 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   GRP_NumCatalogPurchases5 = .;
   GRP_NumCatalogPurchases6 = .;
   GRP_NumCatalogPurchases7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            GRP_NumCatalogPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumCatalogPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_NumCatalogPurchases5 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumCatalogPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumCatalogPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumCatalogPurchases3 = -1;
            GRP_NumCatalogPurchases4 = -1;
            GRP_NumCatalogPurchases5 = -1;
            GRP_NumCatalogPurchases6 = -1;
            GRP_NumCatalogPurchases7 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      GRP_NumCatalogPurchases5 = .;
      GRP_NumCatalogPurchases6 = .;
      GRP_NumCatalogPurchases7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4
        GRP_NumDistPurchases5 GRP_NumDistPurchases6 GRP_NumDistPurchases7
        GRP_NumDistPurchases8 GRP_NumDistPurchases9 GRP_NumDistPurchases10 ;
*** encoding is sparse, initialize to zero;
GRP_NumDistPurchases2 = 0;
GRP_NumDistPurchases3 = 0;
GRP_NumDistPurchases4 = 0;
GRP_NumDistPurchases5 = 0;
GRP_NumDistPurchases6 = 0;
GRP_NumDistPurchases7 = 0;
GRP_NumDistPurchases8 = 0;
GRP_NumDistPurchases9 = 0;
GRP_NumDistPurchases10 = 0;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   GRP_NumDistPurchases5 = .;
   GRP_NumDistPurchases6 = .;
   GRP_NumDistPurchases7 = .;
   GRP_NumDistPurchases8 = .;
   GRP_NumDistPurchases9 = .;
   GRP_NumDistPurchases10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_NumDistPurchases10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_NumDistPurchases2 = -1;
                  GRP_NumDistPurchases3 = -1;
                  GRP_NumDistPurchases4 = -1;
                  GRP_NumDistPurchases5 = -1;
                  GRP_NumDistPurchases6 = -1;
                  GRP_NumDistPurchases7 = -1;
                  GRP_NumDistPurchases8 = -1;
                  GRP_NumDistPurchases9 = -1;
                  GRP_NumDistPurchases10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_NumDistPurchases2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_NumDistPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumDistPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_NumDistPurchases5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_NumDistPurchases6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumDistPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumDistPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumDistPurchases9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      GRP_NumDistPurchases5 = .;
      GRP_NumDistPurchases6 = .;
      GRP_NumDistPurchases7 = .;
      GRP_NumDistPurchases8 = .;
      GRP_NumDistPurchases9 = .;
      GRP_NumDistPurchases10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4
        GRP_NumWebPurchases5 GRP_NumWebPurchases6 GRP_NumWebPurchases7
        GRP_NumWebPurchases8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebPurchases2 = 0;
GRP_NumWebPurchases3 = 0;
GRP_NumWebPurchases4 = 0;
GRP_NumWebPurchases5 = 0;
GRP_NumWebPurchases6 = 0;
GRP_NumWebPurchases7 = 0;
GRP_NumWebPurchases8 = 0;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   GRP_NumWebPurchases5 = .;
   GRP_NumWebPurchases6 = .;
   GRP_NumWebPurchases7 = .;
   GRP_NumWebPurchases8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebPurchases2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebPurchases3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebPurchases4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebPurchases5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebPurchases2 = -1;
               GRP_NumWebPurchases3 = -1;
               GRP_NumWebPurchases4 = -1;
               GRP_NumWebPurchases5 = -1;
               GRP_NumWebPurchases6 = -1;
               GRP_NumWebPurchases7 = -1;
               GRP_NumWebPurchases8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      GRP_NumWebPurchases5 = .;
      GRP_NumWebPurchases6 = .;
      GRP_NumWebPurchases7 = .;
      GRP_NumWebPurchases8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop GRP_NumWebVisitsMonth2 GRP_NumWebVisitsMonth3 GRP_NumWebVisitsMonth4
        GRP_NumWebVisitsMonth5 GRP_NumWebVisitsMonth6 GRP_NumWebVisitsMonth7
        GRP_NumWebVisitsMonth8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebVisitsMonth2 = 0;
GRP_NumWebVisitsMonth3 = 0;
GRP_NumWebVisitsMonth4 = 0;
GRP_NumWebVisitsMonth5 = 0;
GRP_NumWebVisitsMonth6 = 0;
GRP_NumWebVisitsMonth7 = 0;
GRP_NumWebVisitsMonth8 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   GRP_NumWebVisitsMonth2 = .;
   GRP_NumWebVisitsMonth3 = .;
   GRP_NumWebVisitsMonth4 = .;
   GRP_NumWebVisitsMonth5 = .;
   GRP_NumWebVisitsMonth6 = .;
   GRP_NumWebVisitsMonth7 = .;
   GRP_NumWebVisitsMonth8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebVisitsMonth2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebVisitsMonth3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebVisitsMonth4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebVisitsMonth5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebVisitsMonth6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebVisitsMonth7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebVisitsMonth8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebVisitsMonth2 = -1;
               GRP_NumWebVisitsMonth3 = -1;
               GRP_NumWebVisitsMonth4 = -1;
               GRP_NumWebVisitsMonth5 = -1;
               GRP_NumWebVisitsMonth6 = -1;
               GRP_NumWebVisitsMonth7 = -1;
               GRP_NumWebVisitsMonth8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebVisitsMonth2 = .;
      GRP_NumWebVisitsMonth3 = .;
      GRP_NumWebVisitsMonth4 = .;
      GRP_NumWebVisitsMonth5 = .;
      GRP_NumWebVisitsMonth6 = .;
      GRP_NumWebVisitsMonth7 = .;
      GRP_NumWebVisitsMonth8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 GRP_RFMstat5 GRP_RFMstat6
        GRP_RFMstat7 GRP_RFMstat8 GRP_RFMstat9 GRP_RFMstat10 ;
*** encoding is sparse, initialize to zero;
GRP_RFMstat2 = 0;
GRP_RFMstat3 = 0;
GRP_RFMstat4 = 0;
GRP_RFMstat5 = 0;
GRP_RFMstat6 = 0;
GRP_RFMstat7 = 0;
GRP_RFMstat8 = 0;
GRP_RFMstat9 = 0;
GRP_RFMstat10 = 0;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   GRP_RFMstat5 = .;
   GRP_RFMstat6 = .;
   GRP_RFMstat7 = .;
   GRP_RFMstat8 = .;
   GRP_RFMstat9 = .;
   GRP_RFMstat10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RFMstat10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RFMstat2 = -1;
                  GRP_RFMstat3 = -1;
                  GRP_RFMstat4 = -1;
                  GRP_RFMstat5 = -1;
                  GRP_RFMstat6 = -1;
                  GRP_RFMstat7 = -1;
                  GRP_RFMstat8 = -1;
                  GRP_RFMstat9 = -1;
                  GRP_RFMstat10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RFMstat2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RFMstat3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RFMstat4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RFMstat5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RFMstat6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RFMstat7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RFMstat8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RFMstat9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      GRP_RFMstat5 = .;
      GRP_RFMstat6 = .;
      GRP_RFMstat7 = .;
      GRP_RFMstat8 = .;
      GRP_RFMstat9 = .;
      GRP_RFMstat10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 GRP_RMntFrq5 GRP_RMntFrq6
        GRP_RMntFrq7 GRP_RMntFrq8 GRP_RMntFrq9 GRP_RMntFrq10 ;
*** encoding is sparse, initialize to zero;
GRP_RMntFrq2 = 0;
GRP_RMntFrq3 = 0;
GRP_RMntFrq4 = 0;
GRP_RMntFrq5 = 0;
GRP_RMntFrq6 = 0;
GRP_RMntFrq7 = 0;
GRP_RMntFrq8 = 0;
GRP_RMntFrq9 = 0;
GRP_RMntFrq10 = 0;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   GRP_RMntFrq5 = .;
   GRP_RMntFrq6 = .;
   GRP_RMntFrq7 = .;
   GRP_RMntFrq8 = .;
   GRP_RMntFrq9 = .;
   GRP_RMntFrq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RMntFrq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RMntFrq2 = -1;
                  GRP_RMntFrq3 = -1;
                  GRP_RMntFrq4 = -1;
                  GRP_RMntFrq5 = -1;
                  GRP_RMntFrq6 = -1;
                  GRP_RMntFrq7 = -1;
                  GRP_RMntFrq8 = -1;
                  GRP_RMntFrq9 = -1;
                  GRP_RMntFrq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RMntFrq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RMntFrq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RMntFrq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RMntFrq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RMntFrq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RMntFrq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RMntFrq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RMntFrq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      GRP_RMntFrq5 = .;
      GRP_RMntFrq6 = .;
      GRP_RMntFrq7 = .;
      GRP_RMntFrq8 = .;
      GRP_RMntFrq9 = .;
      GRP_RMntFrq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 GRP_Recency5 GRP_Recency6
        GRP_Recency7 GRP_Recency8 GRP_Recency9 GRP_Recency10 ;
*** encoding is sparse, initialize to zero;
GRP_Recency2 = 0;
GRP_Recency3 = 0;
GRP_Recency4 = 0;
GRP_Recency5 = 0;
GRP_Recency6 = 0;
GRP_Recency7 = 0;
GRP_Recency8 = 0;
GRP_Recency9 = 0;
GRP_Recency10 = 0;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   GRP_Recency5 = .;
   GRP_Recency6 = .;
   GRP_Recency7 = .;
   GRP_Recency8 = .;
   GRP_Recency9 = .;
   GRP_Recency10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Recency10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Recency2 = -1;
                  GRP_Recency3 = -1;
                  GRP_Recency4 = -1;
                  GRP_Recency5 = -1;
                  GRP_Recency6 = -1;
                  GRP_Recency7 = -1;
                  GRP_Recency8 = -1;
                  GRP_Recency9 = -1;
                  GRP_Recency10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Recency2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Recency3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Recency4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Recency5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Recency6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Recency7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Recency8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Recency9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      GRP_Recency5 = .;
      GRP_Recency6 = .;
      GRP_Recency7 = .;
      GRP_Recency8 = .;
      GRP_Recency9 = .;
      GRP_Recency10 = .;
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
   H11  =    -0.11779994129006 * S_Year_Birth ;
   H12  =     0.01439270223905 * S_Year_Birth ;
   H13  =     0.16810576596239 * S_Year_Birth ;
   H14  =      0.0126323556283 * S_Year_Birth ;
   H15  =     0.00490126786427 * S_Year_Birth ;
   H11  = H11  +    -0.10120130038823 * GRP_AcceptedCmp52
          +    -0.29145091653241 * GRP_AcceptedCmpTotal3
          +     0.01802833275582 * GRP_Frq2  +     0.15272820858021 * GRP_Frq3
          +     0.14370686750504 * GRP_Frq4  +    -0.06074271943474 * GRP_Frq5
          +    -0.16494155191767 * GRP_Frq6  +    -0.03508219706844 * GRP_Frq7
          +     0.03801978911133 * GRP_Frq8  +    -0.04837268754875 * GRP_Frq9
          +     0.04133949833009 * GRP_Frq10  +     0.01585269216602 *
        GRP_Income2  +     0.02526921062614 * GRP_Income3
          +     0.19310035357829 * GRP_Income4  +     0.16615699836751 *
        GRP_Income5  +    -0.01656164262311 * GRP_Income6
          +     0.04387641774257 * GRP_Income7  +    -0.17330241074594 *
        GRP_Income8  +     0.16738656775649 * GRP_Income9
          +      0.1630131883969 * GRP_Income10  +     0.34279387127093 *
        GRP_Mnt2  +     0.02575623945089 * GRP_Mnt3  +      0.0148719039037 *
        GRP_Mnt4  +    -0.14622490571067 * GRP_Mnt5  +    -0.19294026942757 *
        GRP_Mnt6  +    -0.00783114298777 * GRP_Mnt7  +     0.09174888699683 *
        GRP_Mnt8  +    -0.08601289398209 * GRP_Mnt9  +     0.21448453029375 *
        GRP_Mnt10  +     0.10697869967047 * GRP_MntFishProducts3
          +     0.06225775049469 * GRP_MntFishProducts4
          +    -0.01408797391558 * GRP_MntFishProducts5
          +     0.02848289613699 * GRP_MntFishProducts6
          +     0.05325776779504 * GRP_MntFishProducts7
          +     0.02437321250069 * GRP_MntFishProducts8
          +      0.2617858307061 * GRP_MntFishProducts9
          +    -0.07319837564913 * GRP_MntFishProducts10
          +    -0.02161432541757 * GRP_MntGoldProds2
          +     0.19849470180453 * GRP_MntGoldProds3
          +     0.08066760525249 * GRP_MntGoldProds4
          +     0.14331081076233 * GRP_MntGoldProds5
          +     0.05943247571249 * GRP_MntGoldProds6
          +      0.0608061458335 * GRP_MntGoldProds7
          +     0.05038235669624 * GRP_MntGoldProds8
          +    -0.04685805642629 * GRP_MntGoldProds9
          +    -0.29152354570589 * GRP_MntGoldProds10
          +    -0.39968469332087 * GRP_MntMeatProducts2
          +    -0.19201423289799 * GRP_MntMeatProducts3
          +    -0.27560935050599 * GRP_MntMeatProducts4
          +     -0.0283731212244 * GRP_MntMeatProducts5
          +     0.03960809803437 * GRP_MntMeatProducts6
          +    -0.18777726757179 * GRP_MntMeatProducts7
          +    -0.05524894778392 * GRP_MntMeatProducts8
          +     0.13594754762959 * GRP_MntMeatProducts9
          +     0.43906108436269 * GRP_MntMeatProducts10
          +    -0.06435829145013 * GRP_MntSweetProducts3
          +     -0.0210530647656 * GRP_MntSweetProducts4
          +     0.12313868065999 * GRP_MntSweetProducts5
          +     0.09312437748244 * GRP_MntSweetProducts6
          +    -0.12471463660639 * GRP_MntSweetProducts7
          +     0.06602921514536 * GRP_MntSweetProducts8
          +     0.08468927916869 * GRP_MntSweetProducts9
          +    -0.13586571968305 * GRP_MntSweetProducts10
          +     0.36708616844444 * GRP_MntWines2  +     0.10783294052251 *
        GRP_MntWines3  +     0.04439392359556 * GRP_MntWines4
          +     0.03715965915951 * GRP_MntWines5  +    -0.03210586065209 *
        GRP_MntWines6  +     0.11894764415135 * GRP_MntWines7
          +    -0.11667658986463 * GRP_MntWines8  +    -0.00166194976989 *
        GRP_MntWines9  +    -0.40981775275403 * GRP_MntWines10
          +    -0.44861088264537 * GRP_NumCatalogPurchases3
          +    -0.16773306967441 * GRP_NumCatalogPurchases4
          +    -0.09165932058272 * GRP_NumCatalogPurchases5
          +     0.14298090214424 * GRP_NumCatalogPurchases6
          +    -0.02734458137769 * GRP_NumCatalogPurchases7
          +     0.08564176396946 * GRP_NumDistPurchases2
          +    -0.04992946661847 * GRP_NumDistPurchases3
          +    -0.02597736910094 * GRP_NumDistPurchases4
          +    -0.05061636893507 * GRP_NumDistPurchases5
          +    -0.03128813104108 * GRP_NumDistPurchases6
          +    -0.13321401016342 * GRP_NumDistPurchases7
          +    -0.16916873887958 * GRP_NumDistPurchases8
          +     0.27222053253076 * GRP_NumDistPurchases9
          +     0.31493873732485 * GRP_NumDistPurchases10
          +     0.00940915246846 * GRP_NumWebPurchases2
          +    -0.09454543870383 * GRP_NumWebPurchases3
          +     0.02354360806187 * GRP_NumWebPurchases4
          +      0.0623848511153 * GRP_NumWebPurchases5
          +    -0.14177656017556 * GRP_NumWebPurchases6
          +    -0.08722967193472 * GRP_NumWebPurchases7
          +     0.08762950710966 * GRP_NumWebPurchases8
          +    -0.02407598807456 * GRP_NumWebVisitsMonth2
          +    -0.08734142313349 * GRP_NumWebVisitsMonth3
          +    -0.07761023656162 * GRP_NumWebVisitsMonth4
          +     -0.1666467425177 * GRP_NumWebVisitsMonth5
          +    -0.08134770955005 * GRP_NumWebVisitsMonth6
          +     0.02327986356952 * GRP_NumWebVisitsMonth7
          +     0.35444907806561 * GRP_NumWebVisitsMonth8
          +     0.09441161284057 * GRP_RFMstat2  +     -0.1319671606322 *
        GRP_RFMstat3  +     0.02748981688883 * GRP_RFMstat4
          +    -0.11127405232643 * GRP_RFMstat5  +     0.02825604094962 *
        GRP_RFMstat6  +    -0.11039280017266 * GRP_RFMstat7
          +    -0.26019386650861 * GRP_RFMstat8  +    -0.21523161156313 *
        GRP_RFMstat9  +    -0.03629252062158 * GRP_RFMstat10
          +     0.15763266470046 * GRP_RMntFrq2  +     0.08780054158661 *
        GRP_RMntFrq3  +     0.17890334374232 * GRP_RMntFrq4
          +     0.19959789054927 * GRP_RMntFrq5  +    -0.13310639896206 *
        GRP_RMntFrq6  +     0.02766923637797 * GRP_RMntFrq7
          +    -0.00498872677557 * GRP_RMntFrq8  +     0.28068860472864 *
        GRP_RMntFrq9  +    -0.00625449404896 * GRP_RMntFrq10
          +     0.14035437235589 * GRP_Recency2  +     0.21926411321176 *
        GRP_Recency3  +     0.40977962900363 * GRP_Recency4
          +    -0.04780791117376 * GRP_Recency5  +     0.06447865348011 *
        GRP_Recency6  +     0.02645001728685 * GRP_Recency7
          +    -0.25500720229394 * GRP_Recency8  +    -0.33194208803227 *
        GRP_Recency9  +    -0.37509931095396 * GRP_Recency10 ;
   H12  = H12  +    -0.00249283048209 * GRP_AcceptedCmp52
          +    -0.09776325087959 * GRP_AcceptedCmpTotal3
          +    -0.00891809516361 * GRP_Frq2  +     0.14615554769541 * GRP_Frq3
          +      0.1722454322885 * GRP_Frq4  +     0.09138515117743 * GRP_Frq5
          +     0.14064605711365 * GRP_Frq6  +       0.208609928829 * GRP_Frq7
          +     0.06763174841825 * GRP_Frq8  +    -0.16985550967141 * GRP_Frq9
          +    -0.30826093029849 * GRP_Frq10  +    -0.17205683871698 *
        GRP_Income2  +    -0.07552170179471 * GRP_Income3
          +    -0.08527885170211 * GRP_Income4  +     0.06185373635887 *
        GRP_Income5  +     0.00815930818625 * GRP_Income6
          +    -0.19329281237864 * GRP_Income7  +    -0.24838123961567 *
        GRP_Income8  +     -0.3451185715786 * GRP_Income9
          +    -0.06156031870187 * GRP_Income10  +     0.12646781621248 *
        GRP_Mnt2  +     0.20774819950358 * GRP_Mnt3  +     0.09336734204436 *
        GRP_Mnt4  +    -0.01383466332001 * GRP_Mnt5  +     0.00434172484009 *
        GRP_Mnt6  +    -0.09016745393613 * GRP_Mnt7  +     0.02434881276443 *
        GRP_Mnt8  +     0.10420387102641 * GRP_Mnt9  +     0.03849142222263 *
        GRP_Mnt10  +     0.00119020430694 * GRP_MntFishProducts3
          +    -0.04202232011311 * GRP_MntFishProducts4
          +     0.00471909191461 * GRP_MntFishProducts5
          +    -0.01341208106056 * GRP_MntFishProducts6
          +    -0.03381180366256 * GRP_MntFishProducts7
          +     0.07915179388389 * GRP_MntFishProducts8
          +     -0.2118274361441 * GRP_MntFishProducts9
          +     0.00900226925099 * GRP_MntFishProducts10
          +    -0.07254685103355 * GRP_MntGoldProds2
          +     0.07651956492684 * GRP_MntGoldProds3
          +      0.0379503877146 * GRP_MntGoldProds4
          +     -0.0143124128849 * GRP_MntGoldProds5
          +    -0.09371264388109 * GRP_MntGoldProds6
          +    -0.08979093146507 * GRP_MntGoldProds7
          +    -0.11428579149697 * GRP_MntGoldProds8
          +     0.02515117293126 * GRP_MntGoldProds9
          +     0.03958828108962 * GRP_MntGoldProds10
          +    -0.53525050445826 * GRP_MntMeatProducts2
          +    -0.38303217784514 * GRP_MntMeatProducts3
          +    -0.15105347636013 * GRP_MntMeatProducts4
          +    -0.12802941645278 * GRP_MntMeatProducts5
          +     0.10972081378946 * GRP_MntMeatProducts6
          +     0.22627684747763 * GRP_MntMeatProducts7
          +     0.23914993995125 * GRP_MntMeatProducts8
          +     0.21711314655121 * GRP_MntMeatProducts9
          +     0.17696755989253 * GRP_MntMeatProducts10
          +     0.01432518789616 * GRP_MntSweetProducts3
          +       0.112537640149 * GRP_MntSweetProducts4
          +     0.02389715897828 * GRP_MntSweetProducts5
          +    -0.05432364662019 * GRP_MntSweetProducts6
          +     0.12863266937677 * GRP_MntSweetProducts7
          +    -0.12170377984261 * GRP_MntSweetProducts8
          +    -0.15569754043078 * GRP_MntSweetProducts9
          +     0.11101814605488 * GRP_MntSweetProducts10
          +     0.26441611005377 * GRP_MntWines2  +     0.20796872121882 *
        GRP_MntWines3  +     0.18485529175745 * GRP_MntWines4
          +     0.20613815212747 * GRP_MntWines5  +    -0.08399507703703 *
        GRP_MntWines6  +    -0.12917024022546 * GRP_MntWines7
          +    -0.11831999499226 * GRP_MntWines8  +    -0.23794898937509 *
        GRP_MntWines9  +    -0.24100263717396 * GRP_MntWines10
          +    -0.64938371587273 * GRP_NumCatalogPurchases3
          +    -0.26502090013033 * GRP_NumCatalogPurchases4
          +     0.11962176026494 * GRP_NumCatalogPurchases5
          +     0.23744578086114 * GRP_NumCatalogPurchases6
          +     0.33203573078088 * GRP_NumCatalogPurchases7
          +     -0.1355753508144 * GRP_NumDistPurchases2
          +    -0.19902516536157 * GRP_NumDistPurchases3
          +     0.01617542872985 * GRP_NumDistPurchases4
          +     0.03558443617419 * GRP_NumDistPurchases5
          +     0.01694358499533 * GRP_NumDistPurchases6
          +    -0.03587174008246 * GRP_NumDistPurchases7
          +    -0.13059687132935 * GRP_NumDistPurchases8
          +    -0.00261084476059 * GRP_NumDistPurchases9
          +     0.03959312715152 * GRP_NumDistPurchases10
          +    -0.00699065524457 * GRP_NumWebPurchases2
          +     0.08645828622182 * GRP_NumWebPurchases3
          +     0.06137932095071 * GRP_NumWebPurchases4
          +     0.04397086481384 * GRP_NumWebPurchases5
          +     0.03939129656232 * GRP_NumWebPurchases6
          +      0.0761710872424 * GRP_NumWebPurchases7
          +    -0.18535375992005 * GRP_NumWebPurchases8
          +    -0.37974326775206 * GRP_NumWebVisitsMonth2
          +    -0.21664462893373 * GRP_NumWebVisitsMonth3
          +    -0.29354965662623 * GRP_NumWebVisitsMonth4
          +     0.05912309691805 * GRP_NumWebVisitsMonth5
          +     0.00336298282733 * GRP_NumWebVisitsMonth6
          +     0.18685442551954 * GRP_NumWebVisitsMonth7
          +     0.07672545849498 * GRP_NumWebVisitsMonth8
          +    -0.07207149498011 * GRP_RFMstat2  +    -0.15950305183546 *
        GRP_RFMstat3  +    -0.04769364516978 * GRP_RFMstat4
          +    -0.00882390888626 * GRP_RFMstat5  +    -0.07661006142272 *
        GRP_RFMstat6  +     0.10619202272066 * GRP_RFMstat7
          +     0.12781265381966 * GRP_RFMstat8  +    -0.06589954645466 *
        GRP_RFMstat9  +      0.0920076477391 * GRP_RFMstat10
          +     0.22417426812948 * GRP_RMntFrq2  +     0.12308955447252 *
        GRP_RMntFrq3  +     -0.0709096722458 * GRP_RMntFrq4
          +    -0.09665324906445 * GRP_RMntFrq5  +     0.05404802941496 *
        GRP_RMntFrq6  +     -0.2773732279586 * GRP_RMntFrq7
          +    -0.30308069179408 * GRP_RMntFrq8  +    -0.11423475800051 *
        GRP_RMntFrq9  +    -0.00207097504576 * GRP_RMntFrq10
          +     0.48750564548185 * GRP_Recency2  +     0.33320222570381 *
        GRP_Recency3  +     0.24796788740541 * GRP_Recency4
          +     0.24418511158274 * GRP_Recency5  +     0.04836980441754 *
        GRP_Recency6  +     0.00192843617184 * GRP_Recency7
          +    -0.09040437561133 * GRP_Recency8  +    -0.13695951196499 *
        GRP_Recency9  +    -0.38555406809777 * GRP_Recency10 ;
   H13  = H13  +    -0.23975949521409 * GRP_AcceptedCmp52
          +    -0.15038912427149 * GRP_AcceptedCmpTotal3
          +    -0.02639019894622 * GRP_Frq2  +      0.0209879343907 * GRP_Frq3
          +    -0.04701151124137 * GRP_Frq4  +     0.21097277354199 * GRP_Frq5
          +     0.12012227863902 * GRP_Frq6  +    -0.07421032341607 * GRP_Frq7
          +     0.19658431807083 * GRP_Frq8  +    -0.05226562615755 * GRP_Frq9
          +     0.05597653780122 * GRP_Frq10  +     0.17120341383362 *
        GRP_Income2  +     0.09812054914141 * GRP_Income3
          +     0.15644165989621 * GRP_Income4  +     0.04090465657337 *
        GRP_Income5  +     0.14854142220811 * GRP_Income6
          +     0.10518345156393 * GRP_Income7  +     0.07639614158562 *
        GRP_Income8  +     0.17046626234482 * GRP_Income9
          +     0.03825262112761 * GRP_Income10  +    -0.06766465427377 *
        GRP_Mnt2  +    -0.08563392300903 * GRP_Mnt3  +    -0.21787222756548 *
        GRP_Mnt4  +     0.01899823791029 * GRP_Mnt5  +     0.05967271085466 *
        GRP_Mnt6  +    -0.12499644228381 * GRP_Mnt7  +    -0.14435081412155 *
        GRP_Mnt8  +    -0.14252043260208 * GRP_Mnt9  +    -0.08323850676532 *
        GRP_Mnt10  +     0.04114477269411 * GRP_MntFishProducts3
          +     0.09893856338637 * GRP_MntFishProducts4
          +      0.1385215809505 * GRP_MntFishProducts5
          +    -0.14638498466154 * GRP_MntFishProducts6
          +    -0.00648777978091 * GRP_MntFishProducts7
          +     0.10782473267799 * GRP_MntFishProducts8
          +     0.13001972812092 * GRP_MntFishProducts9
          +    -0.15664721122766 * GRP_MntFishProducts10
          +     0.06207283716621 * GRP_MntGoldProds2
          +    -0.16540502618932 * GRP_MntGoldProds3
          +    -0.00419113426167 * GRP_MntGoldProds4
          +    -0.15616562124594 * GRP_MntGoldProds5
          +     0.19299597306567 * GRP_MntGoldProds6
          +     0.06014052355635 * GRP_MntGoldProds7
          +    -0.04575999486456 * GRP_MntGoldProds8
          +      0.0095752569809 * GRP_MntGoldProds9
          +    -0.05949014660438 * GRP_MntGoldProds10
          +    -0.19601970187904 * GRP_MntMeatProducts2
          +    -0.05185736813653 * GRP_MntMeatProducts3
          +    -0.09619773384577 * GRP_MntMeatProducts4
          +    -0.01027665288868 * GRP_MntMeatProducts5
          +    -0.07620773034876 * GRP_MntMeatProducts6
          +    -0.21888659802114 * GRP_MntMeatProducts7
          +     0.09136355079296 * GRP_MntMeatProducts8
          +    -0.03462987847874 * GRP_MntMeatProducts9
          +      0.2033242827681 * GRP_MntMeatProducts10
          +    -0.03870314975231 * GRP_MntSweetProducts3
          +     0.02833274507907 * GRP_MntSweetProducts4
          +    -0.14006037291884 * GRP_MntSweetProducts5
          +     0.02172045500272 * GRP_MntSweetProducts6
          +     0.10356823396614 * GRP_MntSweetProducts7
          +     0.19721738077737 * GRP_MntSweetProducts8
          +    -0.04378585782125 * GRP_MntSweetProducts9
          +     0.08558224507445 * GRP_MntSweetProducts10
          +     0.18750621323673 * GRP_MntWines2  +     0.20631370991164 *
        GRP_MntWines3  +     0.18264845188539 * GRP_MntWines4
          +     0.19517731981032 * GRP_MntWines5  +      0.3172348878549 *
        GRP_MntWines6  +     -0.0700174737681 * GRP_MntWines7
          +    -0.13433821831179 * GRP_MntWines8  +    -0.18525074858401 *
        GRP_MntWines9  +    -0.00462918646351 * GRP_MntWines10
          +    -0.26862743551871 * GRP_NumCatalogPurchases3
          +     -0.1922446276115 * GRP_NumCatalogPurchases4
          +    -0.14822362894342 * GRP_NumCatalogPurchases5
          +    -0.04052742965098 * GRP_NumCatalogPurchases6
          +     0.21101352511891 * GRP_NumCatalogPurchases7
          +    -0.09588775463072 * GRP_NumDistPurchases2
          +    -0.15658252158004 * GRP_NumDistPurchases3
          +      0.0013743090184 * GRP_NumDistPurchases4
          +    -0.11554368014443 * GRP_NumDistPurchases5
          +     0.07423244034811 * GRP_NumDistPurchases6
          +     0.05834805090718 * GRP_NumDistPurchases7
          +    -0.12463576132288 * GRP_NumDistPurchases8
          +    -0.03179189812652 * GRP_NumDistPurchases9
          +     0.01279300331344 * GRP_NumDistPurchases10
          +    -0.05148868227287 * GRP_NumWebPurchases2
          +       0.126407567911 * GRP_NumWebPurchases3
          +    -0.07384834706894 * GRP_NumWebPurchases4
          +     0.20664248870859 * GRP_NumWebPurchases5
          +     0.12584364051888 * GRP_NumWebPurchases6
          +    -0.07856262149859 * GRP_NumWebPurchases7
          +     -0.0421904538227 * GRP_NumWebPurchases8
          +    -0.39807813413922 * GRP_NumWebVisitsMonth2
          +    -0.41818221692382 * GRP_NumWebVisitsMonth3
          +    -0.10842629005668 * GRP_NumWebVisitsMonth4
          +     0.04070704103804 * GRP_NumWebVisitsMonth5
          +     0.14449276979575 * GRP_NumWebVisitsMonth6
          +    -0.03455833946004 * GRP_NumWebVisitsMonth7
          +      0.2795681557571 * GRP_NumWebVisitsMonth8
          +    -0.11584512993649 * GRP_RFMstat2  +    -0.08000771454672 *
        GRP_RFMstat3  +     0.15435047581932 * GRP_RFMstat4
          +     0.15639777401667 * GRP_RFMstat5  +     0.13653913265734 *
        GRP_RFMstat6  +     0.01738099885837 * GRP_RFMstat7
          +    -0.09833460018931 * GRP_RFMstat8  +      0.1824870541175 *
        GRP_RFMstat9  +    -0.06768797179234 * GRP_RFMstat10
          +     0.12594211084791 * GRP_RMntFrq2  +    -0.01760788766872 *
        GRP_RMntFrq3  +     0.17892049391542 * GRP_RMntFrq4
          +      0.0600208306946 * GRP_RMntFrq5  +    -0.01237732322599 *
        GRP_RMntFrq6  +     0.05686770073947 * GRP_RMntFrq7
          +     0.02731624688039 * GRP_RMntFrq8  +     0.00340498223629 *
        GRP_RMntFrq9  +    -0.22067101016209 * GRP_RMntFrq10
          +      0.2098710117924 * GRP_Recency2  +     0.14903439860077 *
        GRP_Recency3  +     0.13401249348315 * GRP_Recency4
          +     0.07298641932791 * GRP_Recency5  +    -0.06050660489562 *
        GRP_Recency6  +    -0.09715484342683 * GRP_Recency7
          +    -0.07334022459066 * GRP_Recency8  +     0.08622885824343 *
        GRP_Recency9  +    -0.14521252633207 * GRP_Recency10 ;
   H14  = H14  +     0.09775139014406 * GRP_AcceptedCmp52
          +    -0.05185326111457 * GRP_AcceptedCmpTotal3
          +     0.06346844628454 * GRP_Frq2  +    -0.12509273928412 * GRP_Frq3
          +    -0.09198262128828 * GRP_Frq4  +    -0.01182504550004 * GRP_Frq5
          +      -0.056768207716 * GRP_Frq6  +    -0.16132581110621 * GRP_Frq7
          +    -0.04959596102282 * GRP_Frq8  +    -0.04567484157076 * GRP_Frq9
          +    -0.19802300351641 * GRP_Frq10  +      0.0752413635351 *
        GRP_Income2  +     0.00476632282991 * GRP_Income3
          +     0.06457401869132 * GRP_Income4  +     0.17338522672456 *
        GRP_Income5  +     0.05634925985236 * GRP_Income6
          +    -0.04324886540049 * GRP_Income7  +     0.12151783797002 *
        GRP_Income8  +     0.05164926456192 * GRP_Income9
          +     0.00485439723946 * GRP_Income10  +     0.15110097357718 *
        GRP_Mnt2  +     0.09865119271264 * GRP_Mnt3  +    -0.00511534178899 *
        GRP_Mnt4  +    -0.05719362330008 * GRP_Mnt5  +     0.02913562361493 *
        GRP_Mnt6  +     0.13642412041981 * GRP_Mnt7  +      0.0644852158438 *
        GRP_Mnt8  +     0.11260528545055 * GRP_Mnt9  +    -0.04836232783362 *
        GRP_Mnt10  +    -0.10704879727804 * GRP_MntFishProducts3
          +    -0.10246133021659 * GRP_MntFishProducts4
          +     0.07511280205792 * GRP_MntFishProducts5
          +     0.05316490785199 * GRP_MntFishProducts6
          +    -0.08700716569909 * GRP_MntFishProducts7
          +    -0.09682177985634 * GRP_MntFishProducts8
          +     0.07439756883922 * GRP_MntFishProducts9
          +     0.00446074450706 * GRP_MntFishProducts10
          +    -0.09001143924347 * GRP_MntGoldProds2
          +     0.01609312672536 * GRP_MntGoldProds3
          +     0.07035469032678 * GRP_MntGoldProds4
          +     0.00711603846698 * GRP_MntGoldProds5
          +    -0.04068446183089 * GRP_MntGoldProds6
          +     0.15395481242479 * GRP_MntGoldProds7
          +    -0.11308236846443 * GRP_MntGoldProds8
          +    -0.03537344566096 * GRP_MntGoldProds9
          +     0.06051838016414 * GRP_MntGoldProds10
          +      0.2035141766276 * GRP_MntMeatProducts2
          +     0.11278969513967 * GRP_MntMeatProducts3
          +     0.04661931313376 * GRP_MntMeatProducts4
          +     0.16452320933838 * GRP_MntMeatProducts5
          +     0.10770184592821 * GRP_MntMeatProducts6
          +     0.13901339765753 * GRP_MntMeatProducts7
          +    -0.05190887812163 * GRP_MntMeatProducts8
          +     0.01954217936532 * GRP_MntMeatProducts9
          +     0.03332801536639 * GRP_MntMeatProducts10
          +     0.08361196701406 * GRP_MntSweetProducts3
          +     0.12046863267625 * GRP_MntSweetProducts4
          +    -0.06960624989657 * GRP_MntSweetProducts5
          +     0.02528342548299 * GRP_MntSweetProducts6
          +     0.06650097777299 * GRP_MntSweetProducts7
          +     0.11859111222476 * GRP_MntSweetProducts8
          +    -0.06554622682799 * GRP_MntSweetProducts9
          +     0.21001957500605 * GRP_MntSweetProducts10
          +     0.00731755704127 * GRP_MntWines2  +    -0.13735139324497 *
        GRP_MntWines3  +    -0.04158270471567 * GRP_MntWines4
          +     0.07926049065675 * GRP_MntWines5  +    -0.02429458037724 *
        GRP_MntWines6  +     -0.1282166172913 * GRP_MntWines7
          +    -0.08677752910806 * GRP_MntWines8  +     0.07540797934238 *
        GRP_MntWines9  +     0.17493983229139 * GRP_MntWines10
          +     -0.0713614079649 * GRP_NumCatalogPurchases3
          +     0.04023033957679 * GRP_NumCatalogPurchases4
          +     0.05335371946994 * GRP_NumCatalogPurchases5
          +    -0.04900718695282 * GRP_NumCatalogPurchases6
          +    -0.02899204623539 * GRP_NumCatalogPurchases7
          +     0.03938478596542 * GRP_NumDistPurchases2
          +    -0.11842065825647 * GRP_NumDistPurchases3
          +     0.12810519506777 * GRP_NumDistPurchases4
          +     0.03251975367652 * GRP_NumDistPurchases5
          +    -0.20095019460601 * GRP_NumDistPurchases6
          +     0.10812326965005 * GRP_NumDistPurchases7
          +      0.0287453988047 * GRP_NumDistPurchases8
          +     -0.0969283103509 * GRP_NumDistPurchases9
          +    -0.16520433255669 * GRP_NumDistPurchases10
          +    -0.05852836521422 * GRP_NumWebPurchases2
          +    -0.09748986581637 * GRP_NumWebPurchases3
          +     -0.1035732808226 * GRP_NumWebPurchases4
          +    -0.02657669178935 * GRP_NumWebPurchases5
          +    -0.14302610588281 * GRP_NumWebPurchases6
          +    -0.02401715848443 * GRP_NumWebPurchases7
          +    -0.00665464700774 * GRP_NumWebPurchases8
          +     0.10779106619083 * GRP_NumWebVisitsMonth2
          +    -0.02984428486672 * GRP_NumWebVisitsMonth3
          +     0.13778787733685 * GRP_NumWebVisitsMonth4
          +     0.00802707801664 * GRP_NumWebVisitsMonth5
          +    -0.16625282394015 * GRP_NumWebVisitsMonth6
          +     0.10106887697617 * GRP_NumWebVisitsMonth7
          +    -0.08824472498437 * GRP_NumWebVisitsMonth8
          +    -0.03526513082645 * GRP_RFMstat2  +     0.10283156836959 *
        GRP_RFMstat3  +    -0.01757421618587 * GRP_RFMstat4
          +     0.14132635365523 * GRP_RFMstat5  +    -0.03672768186133 *
        GRP_RFMstat6  +     0.00258056988376 * GRP_RFMstat7
          +     0.05732533278238 * GRP_RFMstat8  +    -0.11555107353955 *
        GRP_RFMstat9  +     0.13078950712504 * GRP_RFMstat10
          +     0.06981855039942 * GRP_RMntFrq2  +     -0.0674188031774 *
        GRP_RMntFrq3  +     0.01403624484254 * GRP_RMntFrq4
          +     0.15675245151505 * GRP_RMntFrq5  +     0.02655321401599 *
        GRP_RMntFrq6  +     0.19673158757121 * GRP_RMntFrq7
          +    -0.07596120973163 * GRP_RMntFrq8  +    -0.02098873085179 *
        GRP_RMntFrq9  +     0.05038094121628 * GRP_RMntFrq10
          +     0.06723803817114 * GRP_Recency2  +    -0.05982635501022 *
        GRP_Recency3  +    -0.08002228635654 * GRP_Recency4
          +     -0.0814806856315 * GRP_Recency5  +     -0.0111860674205 *
        GRP_Recency6  +     0.14684736173087 * GRP_Recency7
          +     0.03782442851658 * GRP_Recency8  +     0.27840617851866 *
        GRP_Recency9  +     0.06367048710928 * GRP_Recency10 ;
   H15  = H15  +    -0.07806115508508 * GRP_AcceptedCmp52
          +    -0.07253207743328 * GRP_AcceptedCmpTotal3
          +     0.00068319550289 * GRP_Frq2  +     0.01053423185442 * GRP_Frq3
          +     0.12146836577194 * GRP_Frq4  +    -0.02109847088645 * GRP_Frq5
          +     0.12117603213018 * GRP_Frq6  +    -0.05610800968967 * GRP_Frq7
          +     0.03978492600567 * GRP_Frq8  +     0.04223735193015 * GRP_Frq9
          +    -0.06520463728003 * GRP_Frq10  +       0.062049900978 *
        GRP_Income2  +     0.03328830262974 * GRP_Income3
          +    -0.02319751936777 * GRP_Income4  +    -0.14018290895085 *
        GRP_Income5  +    -0.20161259066579 * GRP_Income6
          +     0.04520749587308 * GRP_Income7  +    -0.12005951328941 *
        GRP_Income8  +     -0.0271220049046 * GRP_Income9
          +    -0.01279023704027 * GRP_Income10  +     0.08937556740583 *
        GRP_Mnt2  +    -0.10612717465916 * GRP_Mnt3  +     0.17815428575003 *
        GRP_Mnt4  +     -0.0370614578947 * GRP_Mnt5  +    -0.01135345278923 *
        GRP_Mnt6  +    -0.12746479049026 * GRP_Mnt7  +    -0.10029531183924 *
        GRP_Mnt8  +    -0.05531509364291 * GRP_Mnt9  +    -0.05237212542444 *
        GRP_Mnt10  +    -0.11135939029175 * GRP_MntFishProducts3
          +     0.00523055501837 * GRP_MntFishProducts4
          +     0.06995755836785 * GRP_MntFishProducts5
          +    -0.04271980194111 * GRP_MntFishProducts6
          +     0.01174513507622 * GRP_MntFishProducts7
          +    -0.01277525563734 * GRP_MntFishProducts8
          +     0.12998167316257 * GRP_MntFishProducts9
          +    -0.09861861312574 * GRP_MntFishProducts10
          +     0.01241278109567 * GRP_MntGoldProds2
          +    -0.08099817362086 * GRP_MntGoldProds3
          +     0.06851172830818 * GRP_MntGoldProds4
          +     0.08958140948505 * GRP_MntGoldProds5
          +    -0.00218658598252 * GRP_MntGoldProds6
          +     -0.0121636699266 * GRP_MntGoldProds7
          +     0.08312530546896 * GRP_MntGoldProds8
          +    -0.09695558162329 * GRP_MntGoldProds9
          +    -0.13362889085159 * GRP_MntGoldProds10
          +      0.1497720820291 * GRP_MntMeatProducts2
          +     0.13747884120385 * GRP_MntMeatProducts3
          +    -0.01382324310957 * GRP_MntMeatProducts4
          +      0.1026627602622 * GRP_MntMeatProducts5
          +     0.12473983237959 * GRP_MntMeatProducts6
          +    -0.00460258978783 * GRP_MntMeatProducts7
          +    -0.02636237932342 * GRP_MntMeatProducts8
          +     0.01088187708787 * GRP_MntMeatProducts9
          +    -0.06235232820082 * GRP_MntMeatProducts10
          +    -0.01027496660636 * GRP_MntSweetProducts3
          +    -0.03339881469063 * GRP_MntSweetProducts4
          +    -0.00006744319692 * GRP_MntSweetProducts5
          +    -0.08133264214994 * GRP_MntSweetProducts6
          +    -0.08611045862832 * GRP_MntSweetProducts7
          +     0.04349149520384 * GRP_MntSweetProducts8
          +    -0.11983272725696 * GRP_MntSweetProducts9
          +      0.0295546319232 * GRP_MntSweetProducts10
          +    -0.08123379301643 * GRP_MntWines2  +     0.04651831039743 *
        GRP_MntWines3  +     0.06310002346307 * GRP_MntWines4
          +    -0.17933545315591 * GRP_MntWines5  +     -0.1937708146292 *
        GRP_MntWines6  +    -0.03101077799974 * GRP_MntWines7
          +     -0.1041503240188 * GRP_MntWines8  +     0.05775300092738 *
        GRP_MntWines9  +    -0.03058517174309 * GRP_MntWines10
          +     0.07560261351989 * GRP_NumCatalogPurchases3
          +    -0.02171409354554 * GRP_NumCatalogPurchases4
          +    -0.05679659919998 * GRP_NumCatalogPurchases5
          +    -0.12764205653408 * GRP_NumCatalogPurchases6
          +    -0.08101121779612 * GRP_NumCatalogPurchases7
          +     0.01667103886915 * GRP_NumDistPurchases2
          +    -0.01671279072694 * GRP_NumDistPurchases3
          +      0.1259674987166 * GRP_NumDistPurchases4
          +    -0.16321313045784 * GRP_NumDistPurchases5
          +     0.11936322929288 * GRP_NumDistPurchases6
          +    -0.06556668418313 * GRP_NumDistPurchases7
          +     0.10511131736767 * GRP_NumDistPurchases8
          +     0.15706878704211 * GRP_NumDistPurchases9
          +    -0.02459606438141 * GRP_NumDistPurchases10
          +    -0.12649905874392 * GRP_NumWebPurchases2
          +    -0.19047040809704 * GRP_NumWebPurchases3
          +     0.05314754301096 * GRP_NumWebPurchases4
          +     0.07985015828954 * GRP_NumWebPurchases5
          +     0.03142129782708 * GRP_NumWebPurchases6
          +    -0.06854751810317 * GRP_NumWebPurchases7
          +     0.04252315624645 * GRP_NumWebPurchases8
          +     0.05095051650376 * GRP_NumWebVisitsMonth2
          +    -0.06364646216319 * GRP_NumWebVisitsMonth3
          +     -0.0763099305682 * GRP_NumWebVisitsMonth4
          +    -0.09328993733351 * GRP_NumWebVisitsMonth5
          +    -0.15992682318474 * GRP_NumWebVisitsMonth6
          +     0.05855154160855 * GRP_NumWebVisitsMonth7
          +    -0.02936254579621 * GRP_NumWebVisitsMonth8
          +     0.03386330448388 * GRP_RFMstat2  +     0.15736501855948 *
        GRP_RFMstat3  +     0.00191361166205 * GRP_RFMstat4
          +     0.13353067210356 * GRP_RFMstat5  +     0.07177888737143 *
        GRP_RFMstat6  +    -0.09136544703087 * GRP_RFMstat7
          +     0.06240017584936 * GRP_RFMstat8  +    -0.13392008107813 *
        GRP_RFMstat9  +      0.1640400559806 * GRP_RFMstat10
          +    -0.04729585381288 * GRP_RMntFrq2  +    -0.10696256491016 *
        GRP_RMntFrq3  +    -0.01612962997775 * GRP_RMntFrq4
          +     0.03988781041495 * GRP_RMntFrq5  +    -0.16331389081736 *
        GRP_RMntFrq6  +    -0.04782412873041 * GRP_RMntFrq7
          +    -0.26113374531456 * GRP_RMntFrq8  +     0.12714151557135 *
        GRP_RMntFrq9  +     0.04516692519663 * GRP_RMntFrq10
          +    -0.02063571135452 * GRP_Recency2  +    -0.26395733111279 *
        GRP_Recency3  +     0.06052941897951 * GRP_Recency4
          +     0.02037202909561 * GRP_Recency5  +    -0.03853508999085 *
        GRP_Recency6  +    -0.04725141215181 * GRP_Recency7
          +    -0.03539071681016 * GRP_Recency8  +     0.00231218046757 *
        GRP_Recency9  +     0.15061319591771 * GRP_Recency10 ;
   H11  =    -0.41794755051402 + H11 ;
   H12  =    -0.49840292545282 + H12 ;
   H13  =     0.68519838870778 + H13 ;
   H14  =    -0.29927820698876 + H14 ;
   H15  =    -1.33189145036759 + H15 ;
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
   P_DepVar1  =     3.74750910029477 * H11  +     6.03649252206533 * H12
          +     3.79892216009428 * H13  +    -0.91884002074191 * H14
          +    -0.46883154533119 * H15 ;
   P_DepVar1  =    -1.84390654654668 + P_DepVar1 ;
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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_AcceptedCmpTotal3 = 'Dummy: GRP_AcceptedCmpTotal=3' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Frq5 = 'Dummy: GRP_Frq=5' ;

      label GRP_Frq6 = 'Dummy: GRP_Frq=6' ;

      label GRP_Frq7 = 'Dummy: GRP_Frq=7' ;

      label GRP_Frq8 = 'Dummy: GRP_Frq=8' ;

      label GRP_Frq9 = 'Dummy: GRP_Frq=9' ;

      label GRP_Frq10 = 'Dummy: GRP_Frq=10' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Income5 = 'Dummy: GRP_Income=5' ;

      label GRP_Income6 = 'Dummy: GRP_Income=6' ;

      label GRP_Income7 = 'Dummy: GRP_Income=7' ;

      label GRP_Income8 = 'Dummy: GRP_Income=8' ;

      label GRP_Income9 = 'Dummy: GRP_Income=9' ;

      label GRP_Income10 = 'Dummy: GRP_Income=10' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_Mnt5 = 'Dummy: GRP_Mnt=5' ;

      label GRP_Mnt6 = 'Dummy: GRP_Mnt=6' ;

      label GRP_Mnt7 = 'Dummy: GRP_Mnt=7' ;

      label GRP_Mnt8 = 'Dummy: GRP_Mnt=8' ;

      label GRP_Mnt9 = 'Dummy: GRP_Mnt=9' ;

      label GRP_Mnt10 = 'Dummy: GRP_Mnt=10' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntFishProducts5 = 'Dummy: GRP_MntFishProducts=5' ;

      label GRP_MntFishProducts6 = 'Dummy: GRP_MntFishProducts=6' ;

      label GRP_MntFishProducts7 = 'Dummy: GRP_MntFishProducts=7' ;

      label GRP_MntFishProducts8 = 'Dummy: GRP_MntFishProducts=8' ;

      label GRP_MntFishProducts9 = 'Dummy: GRP_MntFishProducts=9' ;

      label GRP_MntFishProducts10 = 'Dummy: GRP_MntFishProducts=10' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntGoldProds5 = 'Dummy: GRP_MntGoldProds=5' ;

      label GRP_MntGoldProds6 = 'Dummy: GRP_MntGoldProds=6' ;

      label GRP_MntGoldProds7 = 'Dummy: GRP_MntGoldProds=7' ;

      label GRP_MntGoldProds8 = 'Dummy: GRP_MntGoldProds=8' ;

      label GRP_MntGoldProds9 = 'Dummy: GRP_MntGoldProds=9' ;

      label GRP_MntGoldProds10 = 'Dummy: GRP_MntGoldProds=10' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntMeatProducts5 = 'Dummy: GRP_MntMeatProducts=5' ;

      label GRP_MntMeatProducts6 = 'Dummy: GRP_MntMeatProducts=6' ;

      label GRP_MntMeatProducts7 = 'Dummy: GRP_MntMeatProducts=7' ;

      label GRP_MntMeatProducts8 = 'Dummy: GRP_MntMeatProducts=8' ;

      label GRP_MntMeatProducts9 = 'Dummy: GRP_MntMeatProducts=9' ;

      label GRP_MntMeatProducts10 = 'Dummy: GRP_MntMeatProducts=10' ;

      label GRP_MntSweetProducts3 = 'Dummy: GRP_MntSweetProducts=3' ;

      label GRP_MntSweetProducts4 = 'Dummy: GRP_MntSweetProducts=4' ;

      label GRP_MntSweetProducts5 = 'Dummy: GRP_MntSweetProducts=5' ;

      label GRP_MntSweetProducts6 = 'Dummy: GRP_MntSweetProducts=6' ;

      label GRP_MntSweetProducts7 = 'Dummy: GRP_MntSweetProducts=7' ;

      label GRP_MntSweetProducts8 = 'Dummy: GRP_MntSweetProducts=8' ;

      label GRP_MntSweetProducts9 = 'Dummy: GRP_MntSweetProducts=9' ;

      label GRP_MntSweetProducts10 = 'Dummy: GRP_MntSweetProducts=10' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_MntWines5 = 'Dummy: GRP_MntWines=5' ;

      label GRP_MntWines6 = 'Dummy: GRP_MntWines=6' ;

      label GRP_MntWines7 = 'Dummy: GRP_MntWines=7' ;

      label GRP_MntWines8 = 'Dummy: GRP_MntWines=8' ;

      label GRP_MntWines9 = 'Dummy: GRP_MntWines=9' ;

      label GRP_MntWines10 = 'Dummy: GRP_MntWines=10' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumCatalogPurchases5 = 'Dummy: GRP_NumCatalogPurchases=5' ;

      label GRP_NumCatalogPurchases6 = 'Dummy: GRP_NumCatalogPurchases=6' ;

      label GRP_NumCatalogPurchases7 = 'Dummy: GRP_NumCatalogPurchases=7' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumDistPurchases5 = 'Dummy: GRP_NumDistPurchases=5' ;

      label GRP_NumDistPurchases6 = 'Dummy: GRP_NumDistPurchases=6' ;

      label GRP_NumDistPurchases7 = 'Dummy: GRP_NumDistPurchases=7' ;

      label GRP_NumDistPurchases8 = 'Dummy: GRP_NumDistPurchases=8' ;

      label GRP_NumDistPurchases9 = 'Dummy: GRP_NumDistPurchases=9' ;

      label GRP_NumDistPurchases10 = 'Dummy: GRP_NumDistPurchases=10' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_NumWebPurchases5 = 'Dummy: GRP_NumWebPurchases=5' ;

      label GRP_NumWebPurchases6 = 'Dummy: GRP_NumWebPurchases=6' ;

      label GRP_NumWebPurchases7 = 'Dummy: GRP_NumWebPurchases=7' ;

      label GRP_NumWebPurchases8 = 'Dummy: GRP_NumWebPurchases=8' ;

      label GRP_NumWebVisitsMonth2 = 'Dummy: GRP_NumWebVisitsMonth=2' ;

      label GRP_NumWebVisitsMonth3 = 'Dummy: GRP_NumWebVisitsMonth=3' ;

      label GRP_NumWebVisitsMonth4 = 'Dummy: GRP_NumWebVisitsMonth=4' ;

      label GRP_NumWebVisitsMonth5 = 'Dummy: GRP_NumWebVisitsMonth=5' ;

      label GRP_NumWebVisitsMonth6 = 'Dummy: GRP_NumWebVisitsMonth=6' ;

      label GRP_NumWebVisitsMonth7 = 'Dummy: GRP_NumWebVisitsMonth=7' ;

      label GRP_NumWebVisitsMonth8 = 'Dummy: GRP_NumWebVisitsMonth=8' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RFMstat5 = 'Dummy: GRP_RFMstat=5' ;

      label GRP_RFMstat6 = 'Dummy: GRP_RFMstat=6' ;

      label GRP_RFMstat7 = 'Dummy: GRP_RFMstat=7' ;

      label GRP_RFMstat8 = 'Dummy: GRP_RFMstat=8' ;

      label GRP_RFMstat9 = 'Dummy: GRP_RFMstat=9' ;

      label GRP_RFMstat10 = 'Dummy: GRP_RFMstat=10' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq5 = 'Dummy: GRP_RMntFrq=5' ;

      label GRP_RMntFrq6 = 'Dummy: GRP_RMntFrq=6' ;

      label GRP_RMntFrq7 = 'Dummy: GRP_RMntFrq=7' ;

      label GRP_RMntFrq8 = 'Dummy: GRP_RMntFrq=8' ;

      label GRP_RMntFrq9 = 'Dummy: GRP_RMntFrq=9' ;

      label GRP_RMntFrq10 = 'Dummy: GRP_RMntFrq=10' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label GRP_Recency5 = 'Dummy: GRP_Recency=5' ;

      label GRP_Recency6 = 'Dummy: GRP_Recency=6' ;

      label GRP_Recency7 = 'Dummy: GRP_Recency=7' ;

      label GRP_Recency8 = 'Dummy: GRP_Recency=8' ;

      label GRP_Recency9 = 'Dummy: GRP_Recency=9' ;

      label GRP_Recency10 = 'Dummy: GRP_Recency=10' ;

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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop GRP_AcceptedCmpTotal3 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   GRP_AcceptedCmpTotal3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_AcceptedCmpTotal3 = 1;
   end;
   else if _dm12 = '4'  then do;
      GRP_AcceptedCmpTotal3 = -1;
   end;
   else do;
      GRP_AcceptedCmpTotal3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 GRP_Frq5 GRP_Frq6 GRP_Frq7 GRP_Frq8 GRP_Frq9
        GRP_Frq10 ;
*** encoding is sparse, initialize to zero;
GRP_Frq2 = 0;
GRP_Frq3 = 0;
GRP_Frq4 = 0;
GRP_Frq5 = 0;
GRP_Frq6 = 0;
GRP_Frq7 = 0;
GRP_Frq8 = 0;
GRP_Frq9 = 0;
GRP_Frq10 = 0;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   GRP_Frq5 = .;
   GRP_Frq6 = .;
   GRP_Frq7 = .;
   GRP_Frq8 = .;
   GRP_Frq9 = .;
   GRP_Frq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Frq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Frq2 = -1;
                  GRP_Frq3 = -1;
                  GRP_Frq4 = -1;
                  GRP_Frq5 = -1;
                  GRP_Frq6 = -1;
                  GRP_Frq7 = -1;
                  GRP_Frq8 = -1;
                  GRP_Frq9 = -1;
                  GRP_Frq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Frq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Frq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Frq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Frq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Frq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Frq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Frq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Frq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      GRP_Frq5 = .;
      GRP_Frq6 = .;
      GRP_Frq7 = .;
      GRP_Frq8 = .;
      GRP_Frq9 = .;
      GRP_Frq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 GRP_Income5 GRP_Income6 GRP_Income7
        GRP_Income8 GRP_Income9 GRP_Income10 ;
*** encoding is sparse, initialize to zero;
GRP_Income2 = 0;
GRP_Income3 = 0;
GRP_Income4 = 0;
GRP_Income5 = 0;
GRP_Income6 = 0;
GRP_Income7 = 0;
GRP_Income8 = 0;
GRP_Income9 = 0;
GRP_Income10 = 0;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   GRP_Income5 = .;
   GRP_Income6 = .;
   GRP_Income7 = .;
   GRP_Income8 = .;
   GRP_Income9 = .;
   GRP_Income10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Income10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Income2 = -1;
                  GRP_Income3 = -1;
                  GRP_Income4 = -1;
                  GRP_Income5 = -1;
                  GRP_Income6 = -1;
                  GRP_Income7 = -1;
                  GRP_Income8 = -1;
                  GRP_Income9 = -1;
                  GRP_Income10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Income2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Income3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Income4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Income5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Income6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Income7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Income8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Income9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      GRP_Income5 = .;
      GRP_Income6 = .;
      GRP_Income7 = .;
      GRP_Income8 = .;
      GRP_Income9 = .;
      GRP_Income10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 GRP_Mnt5 GRP_Mnt6 GRP_Mnt7 GRP_Mnt8 GRP_Mnt9
        GRP_Mnt10 ;
*** encoding is sparse, initialize to zero;
GRP_Mnt2 = 0;
GRP_Mnt3 = 0;
GRP_Mnt4 = 0;
GRP_Mnt5 = 0;
GRP_Mnt6 = 0;
GRP_Mnt7 = 0;
GRP_Mnt8 = 0;
GRP_Mnt9 = 0;
GRP_Mnt10 = 0;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   GRP_Mnt5 = .;
   GRP_Mnt6 = .;
   GRP_Mnt7 = .;
   GRP_Mnt8 = .;
   GRP_Mnt9 = .;
   GRP_Mnt10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Mnt10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Mnt2 = -1;
                  GRP_Mnt3 = -1;
                  GRP_Mnt4 = -1;
                  GRP_Mnt5 = -1;
                  GRP_Mnt6 = -1;
                  GRP_Mnt7 = -1;
                  GRP_Mnt8 = -1;
                  GRP_Mnt9 = -1;
                  GRP_Mnt10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Mnt2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Mnt3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Mnt4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Mnt5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Mnt6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Mnt7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Mnt8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Mnt9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      GRP_Mnt5 = .;
      GRP_Mnt6 = .;
      GRP_Mnt7 = .;
      GRP_Mnt8 = .;
      GRP_Mnt9 = .;
      GRP_Mnt10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts3 GRP_MntFishProducts4 GRP_MntFishProducts5
        GRP_MntFishProducts6 GRP_MntFishProducts7 GRP_MntFishProducts8
        GRP_MntFishProducts9 GRP_MntFishProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntFishProducts3 = 0;
GRP_MntFishProducts4 = 0;
GRP_MntFishProducts5 = 0;
GRP_MntFishProducts6 = 0;
GRP_MntFishProducts7 = 0;
GRP_MntFishProducts8 = 0;
GRP_MntFishProducts9 = 0;
GRP_MntFishProducts10 = 0;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   GRP_MntFishProducts5 = .;
   GRP_MntFishProducts6 = .;
   GRP_MntFishProducts7 = .;
   GRP_MntFishProducts8 = .;
   GRP_MntFishProducts9 = .;
   GRP_MntFishProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntFishProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntFishProducts3 = -1;
                  GRP_MntFishProducts4 = -1;
                  GRP_MntFishProducts5 = -1;
                  GRP_MntFishProducts6 = -1;
                  GRP_MntFishProducts7 = -1;
                  GRP_MntFishProducts8 = -1;
                  GRP_MntFishProducts9 = -1;
                  GRP_MntFishProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntFishProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntFishProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntFishProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntFishProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntFishProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntFishProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntFishProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      GRP_MntFishProducts5 = .;
      GRP_MntFishProducts6 = .;
      GRP_MntFishProducts7 = .;
      GRP_MntFishProducts8 = .;
      GRP_MntFishProducts9 = .;
      GRP_MntFishProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 GRP_MntGoldProds5
        GRP_MntGoldProds6 GRP_MntGoldProds7 GRP_MntGoldProds8
        GRP_MntGoldProds9 GRP_MntGoldProds10 ;
*** encoding is sparse, initialize to zero;
GRP_MntGoldProds2 = 0;
GRP_MntGoldProds3 = 0;
GRP_MntGoldProds4 = 0;
GRP_MntGoldProds5 = 0;
GRP_MntGoldProds6 = 0;
GRP_MntGoldProds7 = 0;
GRP_MntGoldProds8 = 0;
GRP_MntGoldProds9 = 0;
GRP_MntGoldProds10 = 0;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   GRP_MntGoldProds5 = .;
   GRP_MntGoldProds6 = .;
   GRP_MntGoldProds7 = .;
   GRP_MntGoldProds8 = .;
   GRP_MntGoldProds9 = .;
   GRP_MntGoldProds10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntGoldProds10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntGoldProds2 = -1;
                  GRP_MntGoldProds3 = -1;
                  GRP_MntGoldProds4 = -1;
                  GRP_MntGoldProds5 = -1;
                  GRP_MntGoldProds6 = -1;
                  GRP_MntGoldProds7 = -1;
                  GRP_MntGoldProds8 = -1;
                  GRP_MntGoldProds9 = -1;
                  GRP_MntGoldProds10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntGoldProds2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntGoldProds3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntGoldProds4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntGoldProds5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntGoldProds6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntGoldProds7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntGoldProds8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntGoldProds9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      GRP_MntGoldProds5 = .;
      GRP_MntGoldProds6 = .;
      GRP_MntGoldProds7 = .;
      GRP_MntGoldProds8 = .;
      GRP_MntGoldProds9 = .;
      GRP_MntGoldProds10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4
        GRP_MntMeatProducts5 GRP_MntMeatProducts6 GRP_MntMeatProducts7
        GRP_MntMeatProducts8 GRP_MntMeatProducts9 GRP_MntMeatProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntMeatProducts2 = 0;
GRP_MntMeatProducts3 = 0;
GRP_MntMeatProducts4 = 0;
GRP_MntMeatProducts5 = 0;
GRP_MntMeatProducts6 = 0;
GRP_MntMeatProducts7 = 0;
GRP_MntMeatProducts8 = 0;
GRP_MntMeatProducts9 = 0;
GRP_MntMeatProducts10 = 0;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   GRP_MntMeatProducts5 = .;
   GRP_MntMeatProducts6 = .;
   GRP_MntMeatProducts7 = .;
   GRP_MntMeatProducts8 = .;
   GRP_MntMeatProducts9 = .;
   GRP_MntMeatProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntMeatProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntMeatProducts2 = -1;
                  GRP_MntMeatProducts3 = -1;
                  GRP_MntMeatProducts4 = -1;
                  GRP_MntMeatProducts5 = -1;
                  GRP_MntMeatProducts6 = -1;
                  GRP_MntMeatProducts7 = -1;
                  GRP_MntMeatProducts8 = -1;
                  GRP_MntMeatProducts9 = -1;
                  GRP_MntMeatProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntMeatProducts2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntMeatProducts3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntMeatProducts4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntMeatProducts5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntMeatProducts6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntMeatProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntMeatProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntMeatProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      GRP_MntMeatProducts5 = .;
      GRP_MntMeatProducts6 = .;
      GRP_MntMeatProducts7 = .;
      GRP_MntMeatProducts8 = .;
      GRP_MntMeatProducts9 = .;
      GRP_MntMeatProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop GRP_MntSweetProducts3 GRP_MntSweetProducts4 GRP_MntSweetProducts5
        GRP_MntSweetProducts6 GRP_MntSweetProducts7 GRP_MntSweetProducts8
        GRP_MntSweetProducts9 GRP_MntSweetProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntSweetProducts3 = 0;
GRP_MntSweetProducts4 = 0;
GRP_MntSweetProducts5 = 0;
GRP_MntSweetProducts6 = 0;
GRP_MntSweetProducts7 = 0;
GRP_MntSweetProducts8 = 0;
GRP_MntSweetProducts9 = 0;
GRP_MntSweetProducts10 = 0;
if missing( GRP_MntSweetProducts ) then do;
   GRP_MntSweetProducts3 = .;
   GRP_MntSweetProducts4 = .;
   GRP_MntSweetProducts5 = .;
   GRP_MntSweetProducts6 = .;
   GRP_MntSweetProducts7 = .;
   GRP_MntSweetProducts8 = .;
   GRP_MntSweetProducts9 = .;
   GRP_MntSweetProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntSweetProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntSweetProducts3 = -1;
                  GRP_MntSweetProducts4 = -1;
                  GRP_MntSweetProducts5 = -1;
                  GRP_MntSweetProducts6 = -1;
                  GRP_MntSweetProducts7 = -1;
                  GRP_MntSweetProducts8 = -1;
                  GRP_MntSweetProducts9 = -1;
                  GRP_MntSweetProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntSweetProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntSweetProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntSweetProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntSweetProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntSweetProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntSweetProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntSweetProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntSweetProducts3 = .;
      GRP_MntSweetProducts4 = .;
      GRP_MntSweetProducts5 = .;
      GRP_MntSweetProducts6 = .;
      GRP_MntSweetProducts7 = .;
      GRP_MntSweetProducts8 = .;
      GRP_MntSweetProducts9 = .;
      GRP_MntSweetProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 GRP_MntWines5 GRP_MntWines6
        GRP_MntWines7 GRP_MntWines8 GRP_MntWines9 GRP_MntWines10 ;
*** encoding is sparse, initialize to zero;
GRP_MntWines2 = 0;
GRP_MntWines3 = 0;
GRP_MntWines4 = 0;
GRP_MntWines5 = 0;
GRP_MntWines6 = 0;
GRP_MntWines7 = 0;
GRP_MntWines8 = 0;
GRP_MntWines9 = 0;
GRP_MntWines10 = 0;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   GRP_MntWines5 = .;
   GRP_MntWines6 = .;
   GRP_MntWines7 = .;
   GRP_MntWines8 = .;
   GRP_MntWines9 = .;
   GRP_MntWines10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntWines10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntWines2 = -1;
                  GRP_MntWines3 = -1;
                  GRP_MntWines4 = -1;
                  GRP_MntWines5 = -1;
                  GRP_MntWines6 = -1;
                  GRP_MntWines7 = -1;
                  GRP_MntWines8 = -1;
                  GRP_MntWines9 = -1;
                  GRP_MntWines10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntWines2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntWines3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntWines4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntWines5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntWines6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntWines7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntWines8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntWines9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      GRP_MntWines5 = .;
      GRP_MntWines6 = .;
      GRP_MntWines7 = .;
      GRP_MntWines8 = .;
      GRP_MntWines9 = .;
      GRP_MntWines10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4
        GRP_NumCatalogPurchases5 GRP_NumCatalogPurchases6
        GRP_NumCatalogPurchases7 ;
*** encoding is sparse, initialize to zero;
GRP_NumCatalogPurchases3 = 0;
GRP_NumCatalogPurchases4 = 0;
GRP_NumCatalogPurchases5 = 0;
GRP_NumCatalogPurchases6 = 0;
GRP_NumCatalogPurchases7 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   GRP_NumCatalogPurchases5 = .;
   GRP_NumCatalogPurchases6 = .;
   GRP_NumCatalogPurchases7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            GRP_NumCatalogPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumCatalogPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_NumCatalogPurchases5 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumCatalogPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumCatalogPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumCatalogPurchases3 = -1;
            GRP_NumCatalogPurchases4 = -1;
            GRP_NumCatalogPurchases5 = -1;
            GRP_NumCatalogPurchases6 = -1;
            GRP_NumCatalogPurchases7 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      GRP_NumCatalogPurchases5 = .;
      GRP_NumCatalogPurchases6 = .;
      GRP_NumCatalogPurchases7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4
        GRP_NumDistPurchases5 GRP_NumDistPurchases6 GRP_NumDistPurchases7
        GRP_NumDistPurchases8 GRP_NumDistPurchases9 GRP_NumDistPurchases10 ;
*** encoding is sparse, initialize to zero;
GRP_NumDistPurchases2 = 0;
GRP_NumDistPurchases3 = 0;
GRP_NumDistPurchases4 = 0;
GRP_NumDistPurchases5 = 0;
GRP_NumDistPurchases6 = 0;
GRP_NumDistPurchases7 = 0;
GRP_NumDistPurchases8 = 0;
GRP_NumDistPurchases9 = 0;
GRP_NumDistPurchases10 = 0;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   GRP_NumDistPurchases5 = .;
   GRP_NumDistPurchases6 = .;
   GRP_NumDistPurchases7 = .;
   GRP_NumDistPurchases8 = .;
   GRP_NumDistPurchases9 = .;
   GRP_NumDistPurchases10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_NumDistPurchases10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_NumDistPurchases2 = -1;
                  GRP_NumDistPurchases3 = -1;
                  GRP_NumDistPurchases4 = -1;
                  GRP_NumDistPurchases5 = -1;
                  GRP_NumDistPurchases6 = -1;
                  GRP_NumDistPurchases7 = -1;
                  GRP_NumDistPurchases8 = -1;
                  GRP_NumDistPurchases9 = -1;
                  GRP_NumDistPurchases10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_NumDistPurchases2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_NumDistPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumDistPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_NumDistPurchases5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_NumDistPurchases6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumDistPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumDistPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumDistPurchases9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      GRP_NumDistPurchases5 = .;
      GRP_NumDistPurchases6 = .;
      GRP_NumDistPurchases7 = .;
      GRP_NumDistPurchases8 = .;
      GRP_NumDistPurchases9 = .;
      GRP_NumDistPurchases10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4
        GRP_NumWebPurchases5 GRP_NumWebPurchases6 GRP_NumWebPurchases7
        GRP_NumWebPurchases8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebPurchases2 = 0;
GRP_NumWebPurchases3 = 0;
GRP_NumWebPurchases4 = 0;
GRP_NumWebPurchases5 = 0;
GRP_NumWebPurchases6 = 0;
GRP_NumWebPurchases7 = 0;
GRP_NumWebPurchases8 = 0;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   GRP_NumWebPurchases5 = .;
   GRP_NumWebPurchases6 = .;
   GRP_NumWebPurchases7 = .;
   GRP_NumWebPurchases8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebPurchases2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebPurchases3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebPurchases4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebPurchases5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebPurchases2 = -1;
               GRP_NumWebPurchases3 = -1;
               GRP_NumWebPurchases4 = -1;
               GRP_NumWebPurchases5 = -1;
               GRP_NumWebPurchases6 = -1;
               GRP_NumWebPurchases7 = -1;
               GRP_NumWebPurchases8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      GRP_NumWebPurchases5 = .;
      GRP_NumWebPurchases6 = .;
      GRP_NumWebPurchases7 = .;
      GRP_NumWebPurchases8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop GRP_NumWebVisitsMonth2 GRP_NumWebVisitsMonth3 GRP_NumWebVisitsMonth4
        GRP_NumWebVisitsMonth5 GRP_NumWebVisitsMonth6 GRP_NumWebVisitsMonth7
        GRP_NumWebVisitsMonth8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebVisitsMonth2 = 0;
GRP_NumWebVisitsMonth3 = 0;
GRP_NumWebVisitsMonth4 = 0;
GRP_NumWebVisitsMonth5 = 0;
GRP_NumWebVisitsMonth6 = 0;
GRP_NumWebVisitsMonth7 = 0;
GRP_NumWebVisitsMonth8 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   GRP_NumWebVisitsMonth2 = .;
   GRP_NumWebVisitsMonth3 = .;
   GRP_NumWebVisitsMonth4 = .;
   GRP_NumWebVisitsMonth5 = .;
   GRP_NumWebVisitsMonth6 = .;
   GRP_NumWebVisitsMonth7 = .;
   GRP_NumWebVisitsMonth8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebVisitsMonth2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebVisitsMonth3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebVisitsMonth4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebVisitsMonth5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebVisitsMonth6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebVisitsMonth7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebVisitsMonth8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebVisitsMonth2 = -1;
               GRP_NumWebVisitsMonth3 = -1;
               GRP_NumWebVisitsMonth4 = -1;
               GRP_NumWebVisitsMonth5 = -1;
               GRP_NumWebVisitsMonth6 = -1;
               GRP_NumWebVisitsMonth7 = -1;
               GRP_NumWebVisitsMonth8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebVisitsMonth2 = .;
      GRP_NumWebVisitsMonth3 = .;
      GRP_NumWebVisitsMonth4 = .;
      GRP_NumWebVisitsMonth5 = .;
      GRP_NumWebVisitsMonth6 = .;
      GRP_NumWebVisitsMonth7 = .;
      GRP_NumWebVisitsMonth8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 GRP_RFMstat5 GRP_RFMstat6
        GRP_RFMstat7 GRP_RFMstat8 GRP_RFMstat9 GRP_RFMstat10 ;
*** encoding is sparse, initialize to zero;
GRP_RFMstat2 = 0;
GRP_RFMstat3 = 0;
GRP_RFMstat4 = 0;
GRP_RFMstat5 = 0;
GRP_RFMstat6 = 0;
GRP_RFMstat7 = 0;
GRP_RFMstat8 = 0;
GRP_RFMstat9 = 0;
GRP_RFMstat10 = 0;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   GRP_RFMstat5 = .;
   GRP_RFMstat6 = .;
   GRP_RFMstat7 = .;
   GRP_RFMstat8 = .;
   GRP_RFMstat9 = .;
   GRP_RFMstat10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RFMstat10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RFMstat2 = -1;
                  GRP_RFMstat3 = -1;
                  GRP_RFMstat4 = -1;
                  GRP_RFMstat5 = -1;
                  GRP_RFMstat6 = -1;
                  GRP_RFMstat7 = -1;
                  GRP_RFMstat8 = -1;
                  GRP_RFMstat9 = -1;
                  GRP_RFMstat10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RFMstat2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RFMstat3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RFMstat4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RFMstat5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RFMstat6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RFMstat7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RFMstat8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RFMstat9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      GRP_RFMstat5 = .;
      GRP_RFMstat6 = .;
      GRP_RFMstat7 = .;
      GRP_RFMstat8 = .;
      GRP_RFMstat9 = .;
      GRP_RFMstat10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 GRP_RMntFrq5 GRP_RMntFrq6
        GRP_RMntFrq7 GRP_RMntFrq8 GRP_RMntFrq9 GRP_RMntFrq10 ;
*** encoding is sparse, initialize to zero;
GRP_RMntFrq2 = 0;
GRP_RMntFrq3 = 0;
GRP_RMntFrq4 = 0;
GRP_RMntFrq5 = 0;
GRP_RMntFrq6 = 0;
GRP_RMntFrq7 = 0;
GRP_RMntFrq8 = 0;
GRP_RMntFrq9 = 0;
GRP_RMntFrq10 = 0;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   GRP_RMntFrq5 = .;
   GRP_RMntFrq6 = .;
   GRP_RMntFrq7 = .;
   GRP_RMntFrq8 = .;
   GRP_RMntFrq9 = .;
   GRP_RMntFrq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RMntFrq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RMntFrq2 = -1;
                  GRP_RMntFrq3 = -1;
                  GRP_RMntFrq4 = -1;
                  GRP_RMntFrq5 = -1;
                  GRP_RMntFrq6 = -1;
                  GRP_RMntFrq7 = -1;
                  GRP_RMntFrq8 = -1;
                  GRP_RMntFrq9 = -1;
                  GRP_RMntFrq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RMntFrq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RMntFrq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RMntFrq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RMntFrq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RMntFrq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RMntFrq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RMntFrq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RMntFrq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      GRP_RMntFrq5 = .;
      GRP_RMntFrq6 = .;
      GRP_RMntFrq7 = .;
      GRP_RMntFrq8 = .;
      GRP_RMntFrq9 = .;
      GRP_RMntFrq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 GRP_Recency5 GRP_Recency6
        GRP_Recency7 GRP_Recency8 GRP_Recency9 GRP_Recency10 ;
*** encoding is sparse, initialize to zero;
GRP_Recency2 = 0;
GRP_Recency3 = 0;
GRP_Recency4 = 0;
GRP_Recency5 = 0;
GRP_Recency6 = 0;
GRP_Recency7 = 0;
GRP_Recency8 = 0;
GRP_Recency9 = 0;
GRP_Recency10 = 0;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   GRP_Recency5 = .;
   GRP_Recency6 = .;
   GRP_Recency7 = .;
   GRP_Recency8 = .;
   GRP_Recency9 = .;
   GRP_Recency10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Recency10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Recency2 = -1;
                  GRP_Recency3 = -1;
                  GRP_Recency4 = -1;
                  GRP_Recency5 = -1;
                  GRP_Recency6 = -1;
                  GRP_Recency7 = -1;
                  GRP_Recency8 = -1;
                  GRP_Recency9 = -1;
                  GRP_Recency10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Recency2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Recency3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Recency4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Recency5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Recency6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Recency7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Recency8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Recency9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      GRP_Recency5 = .;
      GRP_Recency6 = .;
      GRP_Recency7 = .;
      GRP_Recency8 = .;
      GRP_Recency9 = .;
      GRP_Recency10 = .;
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
   H11  =     0.00123076410129 * S_Year_Birth ;
   H12  =    -0.09262709246761 * S_Year_Birth ;
   H13  =     0.02753705077567 * S_Year_Birth ;
   H14  =    -0.07602273274194 * S_Year_Birth ;
   H15  =    -0.04945703736257 * S_Year_Birth ;
   H16  =    -0.02840126211219 * S_Year_Birth ;
   H17  =    -0.16664040149349 * S_Year_Birth ;
   H11  = H11  +    -0.27457126083831 * GRP_AcceptedCmp52
          +     -0.2882719651303 * GRP_AcceptedCmpTotal3
          +      0.0165335174946 * GRP_Frq2  +      0.0650040133085 * GRP_Frq3
          +     0.01379346089007 * GRP_Frq4  +    -0.02885339753071 * GRP_Frq5
          +     -0.0557995532397 * GRP_Frq6  +     0.06688638012515 * GRP_Frq7
          +     0.14348346597984 * GRP_Frq8  +     0.02261308850193 * GRP_Frq9
          +    -0.02604870078446 * GRP_Frq10  +    -0.09049422714038 *
        GRP_Income2  +    -0.11864913247425 * GRP_Income3
          +     0.03988478957126 * GRP_Income4  +     0.03154722461706 *
        GRP_Income5  +      -0.031011625499 * GRP_Income6
          +    -0.08916599067864 * GRP_Income7  +    -0.15041071877103 *
        GRP_Income8  +     0.01121233596611 * GRP_Income9
          +     0.00846277580798 * GRP_Income10  +     0.10925116382231 *
        GRP_Mnt2  +     0.13947593277299 * GRP_Mnt3  +     0.03019838609598 *
        GRP_Mnt4  +     0.02930468460858 * GRP_Mnt5  +    -0.11875932366108 *
        GRP_Mnt6  +     -0.0968957899307 * GRP_Mnt7  +    -0.19041387331169 *
        GRP_Mnt8  +    -0.01847226835985 * GRP_Mnt9  +    -0.07361357636936 *
        GRP_Mnt10  +     0.03497947725375 * GRP_MntFishProducts3
          +     0.02592877260581 * GRP_MntFishProducts4
          +    -0.06339099719248 * GRP_MntFishProducts5
          +    -0.05917650742948 * GRP_MntFishProducts6
          +    -0.06449693270029 * GRP_MntFishProducts7
          +     0.07220345558469 * GRP_MntFishProducts8
          +     0.05302431423486 * GRP_MntFishProducts9
          +     0.07006736084879 * GRP_MntFishProducts10
          +    -0.01927397966732 * GRP_MntGoldProds2
          +     0.00813554272623 * GRP_MntGoldProds3
          +     0.01615544486153 * GRP_MntGoldProds4
          +     0.05755535451856 * GRP_MntGoldProds5
          +    -0.11379232218741 * GRP_MntGoldProds6
          +    -0.01439492944609 * GRP_MntGoldProds7
          +     0.03711792777182 * GRP_MntGoldProds8
          +    -0.11269223623052 * GRP_MntGoldProds9
          +     0.04579363541884 * GRP_MntGoldProds10
          +    -0.32237766766899 * GRP_MntMeatProducts2
          +    -0.09067685703431 * GRP_MntMeatProducts3
          +    -0.05534491792097 * GRP_MntMeatProducts4
          +    -0.13563832459623 * GRP_MntMeatProducts5
          +    -0.03620592995881 * GRP_MntMeatProducts6
          +    -0.08493503595938 * GRP_MntMeatProducts7
          +     0.12165711539056 * GRP_MntMeatProducts8
          +     0.10037740804563 * GRP_MntMeatProducts9
          +       0.014484218695 * GRP_MntMeatProducts10
          +    -0.02216824538302 * GRP_MntSweetProducts3
          +     0.09616415999651 * GRP_MntSweetProducts4
          +     0.03909141599729 * GRP_MntSweetProducts5
          +    -0.03380661476159 * GRP_MntSweetProducts6
          +     0.15539873250694 * GRP_MntSweetProducts7
          +    -0.08817314784338 * GRP_MntSweetProducts8
          +    -0.08144635633498 * GRP_MntSweetProducts9
          +    -0.05255801697754 * GRP_MntSweetProducts10
          +      0.1732677110496 * GRP_MntWines2  +     0.08103441740122 *
        GRP_MntWines3  +     0.10504344960493 * GRP_MntWines4
          +     0.22368517399622 * GRP_MntWines5  +     0.00312827693773 *
        GRP_MntWines6  +     0.10646235620915 * GRP_MntWines7
          +     -0.0171802368059 * GRP_MntWines8  +    -0.10317334538205 *
        GRP_MntWines9  +    -0.33534713012874 * GRP_MntWines10
          +    -0.39196643210926 * GRP_NumCatalogPurchases3
          +    -0.13405153432706 * GRP_NumCatalogPurchases4
          +     -0.1408745839048 * GRP_NumCatalogPurchases5
          +     0.03446753278553 * GRP_NumCatalogPurchases6
          +     0.09120767098547 * GRP_NumCatalogPurchases7
          +      -0.019468007716 * GRP_NumDistPurchases2
          +    -0.00703545300617 * GRP_NumDistPurchases3
          +    -0.07033642440361 * GRP_NumDistPurchases4
          +    -0.05069203510159 * GRP_NumDistPurchases5
          +    -0.09426838219524 * GRP_NumDistPurchases6
          +    -0.10775620292637 * GRP_NumDistPurchases7
          +    -0.05899953451216 * GRP_NumDistPurchases8
          +     0.04694525641538 * GRP_NumDistPurchases9
          +     0.12621998594753 * GRP_NumDistPurchases10
          +     0.05821142354481 * GRP_NumWebPurchases2
          +     0.06578164787975 * GRP_NumWebPurchases3
          +      0.0357977753373 * GRP_NumWebPurchases4
          +     0.12660077358516 * GRP_NumWebPurchases5
          +     0.01373165361015 * GRP_NumWebPurchases6
          +     0.00889884869565 * GRP_NumWebPurchases7
          +    -0.09365845479043 * GRP_NumWebPurchases8
          +    -0.15084154352743 * GRP_NumWebVisitsMonth2
          +    -0.26416298149166 * GRP_NumWebVisitsMonth3
          +    -0.24977050492109 * GRP_NumWebVisitsMonth4
          +     0.00921932727625 * GRP_NumWebVisitsMonth5
          +     0.01985702400189 * GRP_NumWebVisitsMonth6
          +    -0.00870053320048 * GRP_NumWebVisitsMonth7
          +     0.10063012045773 * GRP_NumWebVisitsMonth8
          +    -0.09718021706684 * GRP_RFMstat2  +     -0.1867390622846 *
        GRP_RFMstat3  +    -0.10580841662343 * GRP_RFMstat4
          +    -0.02397309435656 * GRP_RFMstat5  +     0.05714660987804 *
        GRP_RFMstat6  +     0.05392761339793 * GRP_RFMstat7
          +    -0.10404114760706 * GRP_RFMstat8  +    -0.03650836068636 *
        GRP_RFMstat9  +     0.04116122267408 * GRP_RFMstat10
          +     0.13753541644014 * GRP_RMntFrq2  +      0.0317668792713 *
        GRP_RMntFrq3  +     0.11523758605447 * GRP_RMntFrq4
          +     0.10852100173875 * GRP_RMntFrq5  +     0.03667186301252 *
        GRP_RMntFrq6  +    -0.06223173606957 * GRP_RMntFrq7
          +    -0.05197320285373 * GRP_RMntFrq8  +      0.0536714967616 *
        GRP_RMntFrq9  +    -0.07245149526125 * GRP_RMntFrq10
          +     0.27704954327346 * GRP_Recency2  +     0.25740573807381 *
        GRP_Recency3  +     0.20439671976612 * GRP_Recency4
          +     0.18534302276035 * GRP_Recency5  +    -0.08634066715937 *
        GRP_Recency6  +    -0.04152228887641 * GRP_Recency7
          +     -0.1178654876661 * GRP_Recency8  +    -0.03862846209631 *
        GRP_Recency9  +    -0.29135005033449 * GRP_Recency10 ;
   H12  = H12  +    -0.12358391399353 * GRP_AcceptedCmp52
          +     0.11306832872376 * GRP_AcceptedCmpTotal3
          +     0.08912947312263 * GRP_Frq2  +    -0.13015422136859 * GRP_Frq3
          +    -0.27792400778045 * GRP_Frq4  +    -0.10651648985743 * GRP_Frq5
          +    -0.03732786661674 * GRP_Frq6  +    -0.04662568019572 * GRP_Frq7
          +    -0.06947917205093 * GRP_Frq8  +     0.05254998273377 * GRP_Frq9
          +     0.01957801159317 * GRP_Frq10  +     0.13628452101137 *
        GRP_Income2  +    -0.09359063923432 * GRP_Income3
          +    -0.10391157462422 * GRP_Income4  +     0.10760925079046 *
        GRP_Income5  +    -0.07055918299672 * GRP_Income6
          +     -0.0149251142626 * GRP_Income7  +      0.1294475718688 *
        GRP_Income8  +     0.13787831360924 * GRP_Income9
          +    -0.04770321446523 * GRP_Income10  +    -0.12661242170951 *
        GRP_Mnt2  +    -0.01680251442722 * GRP_Mnt3  +    -0.00079428654781 *
        GRP_Mnt4  +     0.02546987725967 * GRP_Mnt5  +     0.05570091713344 *
        GRP_Mnt6  +    -0.02183688370496 * GRP_Mnt7  +    -0.09517660337727 *
        GRP_Mnt8  +    -0.03851529572653 * GRP_Mnt9  +    -0.05827465643295 *
        GRP_Mnt10  +     0.00802523112025 * GRP_MntFishProducts3
          +    -0.01688733943855 * GRP_MntFishProducts4
          +     0.07943337387451 * GRP_MntFishProducts5
          +     0.02644522515395 * GRP_MntFishProducts6
          +    -0.05246114356304 * GRP_MntFishProducts7
          +    -0.06256992465552 * GRP_MntFishProducts8
          +     0.12436002700496 * GRP_MntFishProducts9
          +     0.13682966445795 * GRP_MntFishProducts10
          +    -0.09649876431393 * GRP_MntGoldProds2
          +    -0.11706910478166 * GRP_MntGoldProds3
          +    -0.08730464348581 * GRP_MntGoldProds4
          +     0.05245174076261 * GRP_MntGoldProds5
          +     -0.1035255388375 * GRP_MntGoldProds6
          +     0.00012563893979 * GRP_MntGoldProds7
          +    -0.10266062995129 * GRP_MntGoldProds8
          +    -0.14782416880614 * GRP_MntGoldProds9
          +     0.04365461065573 * GRP_MntGoldProds10
          +     0.18618419296898 * GRP_MntMeatProducts2
          +      0.2998175200504 * GRP_MntMeatProducts3
          +     0.14404473594989 * GRP_MntMeatProducts4
          +     0.17498712713152 * GRP_MntMeatProducts5
          +    -0.09995829905417 * GRP_MntMeatProducts6
          +     0.02482370732802 * GRP_MntMeatProducts7
          +     0.04895923112963 * GRP_MntMeatProducts8
          +    -0.10873344351445 * GRP_MntMeatProducts9
          +    -0.17312384972174 * GRP_MntMeatProducts10
          +    -0.00902012942575 * GRP_MntSweetProducts3
          +     0.06413252583793 * GRP_MntSweetProducts4
          +    -0.09476529818205 * GRP_MntSweetProducts5
          +    -0.07611107273614 * GRP_MntSweetProducts6
          +     0.14253043340671 * GRP_MntSweetProducts7
          +     0.09742865741227 * GRP_MntSweetProducts8
          +    -0.11544571066709 * GRP_MntSweetProducts9
          +     0.08202701062194 * GRP_MntSweetProducts10
          +    -0.28467827976516 * GRP_MntWines2  +    -0.29841950757653 *
        GRP_MntWines3  +    -0.06540040056513 * GRP_MntWines4
          +    -0.09754914006375 * GRP_MntWines5  +    -0.06119841306044 *
        GRP_MntWines6  +     0.02670590790165 * GRP_MntWines7
          +    -0.05821035551271 * GRP_MntWines8  +     0.11322924730071 *
        GRP_MntWines9  +    -0.09122092619335 * GRP_MntWines10
          +     0.27446830023682 * GRP_NumCatalogPurchases3
          +     0.27825173190563 * GRP_NumCatalogPurchases4
          +     0.02934600040398 * GRP_NumCatalogPurchases5
          +    -0.24090442859654 * GRP_NumCatalogPurchases6
          +    -0.02232921984924 * GRP_NumCatalogPurchases7
          +     0.00536961043745 * GRP_NumDistPurchases2
          +     0.15977203906353 * GRP_NumDistPurchases3
          +    -0.00187486196353 * GRP_NumDistPurchases4
          +    -0.01825938414528 * GRP_NumDistPurchases5
          +    -0.01999564822103 * GRP_NumDistPurchases6
          +     -0.0442143640548 * GRP_NumDistPurchases7
          +     0.18693222597237 * GRP_NumDistPurchases8
          +    -0.02359750991034 * GRP_NumDistPurchases9
          +     -0.0680563963255 * GRP_NumDistPurchases10
          +    -0.12802896329497 * GRP_NumWebPurchases2
          +    -0.12685525422753 * GRP_NumWebPurchases3
          +    -0.03033098051125 * GRP_NumWebPurchases4
          +     0.02095544507908 * GRP_NumWebPurchases5
          +     0.03784049022201 * GRP_NumWebPurchases6
          +     0.16090474548936 * GRP_NumWebPurchases7
          +     0.18171609694396 * GRP_NumWebPurchases8
          +     0.37797647062994 * GRP_NumWebVisitsMonth2
          +     0.10587828755654 * GRP_NumWebVisitsMonth3
          +     0.05451664437616 * GRP_NumWebVisitsMonth4
          +    -0.03021409617172 * GRP_NumWebVisitsMonth5
          +    -0.04633608914143 * GRP_NumWebVisitsMonth6
          +    -0.26869287409045 * GRP_NumWebVisitsMonth7
          +    -0.15489585245223 * GRP_NumWebVisitsMonth8
          +     0.04054670902677 * GRP_RFMstat2  +     0.03035551464427 *
        GRP_RFMstat3  +    -0.00215842734485 * GRP_RFMstat4
          +    -0.00336986188983 * GRP_RFMstat5  +     0.03837987482431 *
        GRP_RFMstat6  +    -0.06136601997942 * GRP_RFMstat7
          +    -0.09044052708393 * GRP_RFMstat8  +     0.05908558862207 *
        GRP_RFMstat9  +    -0.23243914472362 * GRP_RFMstat10
          +    -0.21793950009643 * GRP_RMntFrq2  +     0.09263896824079 *
        GRP_RMntFrq3  +    -0.02177304206764 * GRP_RMntFrq4
          +    -0.01603985903338 * GRP_RMntFrq5  +    -0.02811613841156 *
        GRP_RMntFrq6  +     0.09673849387193 * GRP_RMntFrq7
          +     0.17081250015693 * GRP_RMntFrq8  +     0.13143969405516 *
        GRP_RMntFrq9  +    -0.01617259091276 * GRP_RMntFrq10
          +     -0.1860010049142 * GRP_Recency2  +    -0.18589866925924 *
        GRP_Recency3  +    -0.10100462356516 * GRP_Recency4
          +    -0.09663111042726 * GRP_Recency5  +      0.1453243638335 *
        GRP_Recency6  +    -0.03312445332383 * GRP_Recency7
          +     0.07457300072372 * GRP_Recency8  +     0.18783464452758 *
        GRP_Recency9  +     0.07093626178585 * GRP_Recency10 ;
   H13  = H13  +    -0.09316706350701 * GRP_AcceptedCmp52
          +    -0.08688221861206 * GRP_AcceptedCmpTotal3
          +     0.02220265937895 * GRP_Frq2  +    -0.13875018547683 * GRP_Frq3
          +    -0.14291899717508 * GRP_Frq4  +    -0.12982048580826 * GRP_Frq5
          +    -0.14448991015426 * GRP_Frq6  +    -0.16562517255203 * GRP_Frq7
          +    -0.03606055584428 * GRP_Frq8  +     0.17132951498331 * GRP_Frq9
          +    -0.16334574950289 * GRP_Frq10  +     0.09472495315184 *
        GRP_Income2  +    -0.07605749607474 * GRP_Income3
          +      -0.168896055443 * GRP_Income4  +     -0.1596827843405 *
        GRP_Income5  +     -0.0646899267851 * GRP_Income6
          +      0.0258822267391 * GRP_Income7  +     -0.0904884822833 *
        GRP_Income8  +     0.05428507585705 * GRP_Income9
          +     0.00010512890986 * GRP_Income10  +     0.05119617882938 *
        GRP_Mnt2  +    -0.02997356371616 * GRP_Mnt3  +    -0.05392816289734 *
        GRP_Mnt4  +    -0.13827761149583 * GRP_Mnt5  +    -0.09885275832147 *
        GRP_Mnt6  +    -0.04305820083191 * GRP_Mnt7  +     0.11892844865074 *
        GRP_Mnt8  +     0.19210998094844 * GRP_Mnt9  +     0.01770207202247 *
        GRP_Mnt10  +    -0.09637776760754 * GRP_MntFishProducts3
          +     0.03249702033853 * GRP_MntFishProducts4
          +    -0.00380887152232 * GRP_MntFishProducts5
          +     -0.0331168760152 * GRP_MntFishProducts6
          +    -0.24682693966447 * GRP_MntFishProducts7
          +     -0.1374407396509 * GRP_MntFishProducts8
          +     0.00757425754005 * GRP_MntFishProducts9
          +     0.18310555763672 * GRP_MntFishProducts10
          +      0.1076963463344 * GRP_MntGoldProds2
          +     0.08488912276253 * GRP_MntGoldProds3
          +     0.01529494326542 * GRP_MntGoldProds4
          +    -0.07310538642548 * GRP_MntGoldProds5
          +     0.10073591895022 * GRP_MntGoldProds6
          +     0.13584207577723 * GRP_MntGoldProds7
          +     0.09010798952772 * GRP_MntGoldProds8
          +     0.00269955900589 * GRP_MntGoldProds9
          +    -0.08144297878211 * GRP_MntGoldProds10
          +     0.10865364997679 * GRP_MntMeatProducts2
          +    -0.16623314416655 * GRP_MntMeatProducts3
          +    -0.08127843254095 * GRP_MntMeatProducts4
          +     0.07952423663486 * GRP_MntMeatProducts5
          +     0.02545823425737 * GRP_MntMeatProducts6
          +     0.01303094381526 * GRP_MntMeatProducts7
          +    -0.08413642129666 * GRP_MntMeatProducts8
          +    -0.01951356144631 * GRP_MntMeatProducts9
          +    -0.02053520197857 * GRP_MntMeatProducts10
          +     -0.0424532763378 * GRP_MntSweetProducts3
          +    -0.08309021878343 * GRP_MntSweetProducts4
          +    -0.11807002122632 * GRP_MntSweetProducts5
          +     0.10005111456261 * GRP_MntSweetProducts6
          +    -0.06744979845032 * GRP_MntSweetProducts7
          +    -0.07390127150017 * GRP_MntSweetProducts8
          +     0.14835423526178 * GRP_MntSweetProducts9
          +     0.08543899279812 * GRP_MntSweetProducts10
          +    -0.10439578602844 * GRP_MntWines2  +     0.00963054206289 *
        GRP_MntWines3  +    -0.01462903394922 * GRP_MntWines4
          +      0.0315670218798 * GRP_MntWines5  +    -0.08830718447644 *
        GRP_MntWines6  +    -0.04888757421925 * GRP_MntWines7
          +     0.16446494942243 * GRP_MntWines8  +     0.00551008216749 *
        GRP_MntWines9  +     0.21976336113622 * GRP_MntWines10
          +     0.17051630774993 * GRP_NumCatalogPurchases3
          +    -0.02088308440932 * GRP_NumCatalogPurchases4
          +      0.0281386725231 * GRP_NumCatalogPurchases5
          +    -0.11084406042118 * GRP_NumCatalogPurchases6
          +    -0.19078216800394 * GRP_NumCatalogPurchases7
          +      0.1303570905924 * GRP_NumDistPurchases2
          +     0.10611549096256 * GRP_NumDistPurchases3
          +    -0.07214850779052 * GRP_NumDistPurchases4
          +     -0.0726131258026 * GRP_NumDistPurchases5
          +    -0.15930462512862 * GRP_NumDistPurchases6
          +    -0.02025611365267 * GRP_NumDistPurchases7
          +     0.03104023027558 * GRP_NumDistPurchases8
          +    -0.21123981397458 * GRP_NumDistPurchases9
          +    -0.07863675944569 * GRP_NumDistPurchases10
          +    -0.02032446674941 * GRP_NumWebPurchases2
          +      0.0119766491379 * GRP_NumWebPurchases3
          +    -0.10418911005667 * GRP_NumWebPurchases4
          +    -0.10155996464648 * GRP_NumWebPurchases5
          +     -0.1028519954194 * GRP_NumWebPurchases6
          +     -0.0431961250067 * GRP_NumWebPurchases7
          +    -0.08872321482005 * GRP_NumWebPurchases8
          +     0.17794738403334 * GRP_NumWebVisitsMonth2
          +      0.1103646548326 * GRP_NumWebVisitsMonth3
          +     0.05088867448038 * GRP_NumWebVisitsMonth4
          +     0.17401152862117 * GRP_NumWebVisitsMonth5
          +    -0.07854922730514 * GRP_NumWebVisitsMonth6
          +     0.07649296048845 * GRP_NumWebVisitsMonth7
          +    -0.19774399324915 * GRP_NumWebVisitsMonth8
          +     0.02014842262775 * GRP_RFMstat2  +     0.22173985704338 *
        GRP_RFMstat3  +    -0.01521326895449 * GRP_RFMstat4
          +     0.02483784481732 * GRP_RFMstat5  +     0.19472181579807 *
        GRP_RFMstat6  +    -0.15963138075025 * GRP_RFMstat7
          +    -0.01728920293571 * GRP_RFMstat8  +    -0.06782934379146 *
        GRP_RFMstat9  +    -0.00977250928644 * GRP_RFMstat10
          +    -0.00384489820617 * GRP_RMntFrq2  +     0.06443265930338 *
        GRP_RMntFrq3  +    -0.04105799474043 * GRP_RMntFrq4
          +    -0.06951947562667 * GRP_RMntFrq5  +     -0.0235821493498 *
        GRP_RMntFrq6  +    -0.03006344872763 * GRP_RMntFrq7
          +    -0.00961580131923 * GRP_RMntFrq8  +    -0.04016874949009 *
        GRP_RMntFrq9  +      0.0999752134596 * GRP_RMntFrq10
          +    -0.29178823498774 * GRP_Recency2  +    -0.20350379792721 *
        GRP_Recency3  +    -0.16522305274562 * GRP_Recency4
          +    -0.13499886552537 * GRP_Recency5  +     0.04952729792615 *
        GRP_Recency6  +     0.06229836271866 * GRP_Recency7
          +    -0.01852242085361 * GRP_Recency8  +    -0.02131897033996 *
        GRP_Recency9  +     0.20672895128588 * GRP_Recency10 ;
   H14  = H14  +     0.01071953246911 * GRP_AcceptedCmp52
          +    -0.06461940218584 * GRP_AcceptedCmpTotal3
          +      0.0894324243551 * GRP_Frq2  +     0.14551164674415 * GRP_Frq3
          +    -0.02885007499311 * GRP_Frq4  +     0.14170843056992 * GRP_Frq5
          +      0.1448194087902 * GRP_Frq6  +     0.08643717895232 * GRP_Frq7
          +     0.11509564907961 * GRP_Frq8  +    -0.05089408041983 * GRP_Frq9
          +     0.16579969479484 * GRP_Frq10  +    -0.02948069734808 *
        GRP_Income2  +    -0.04273634547144 * GRP_Income3
          +     0.07858573820417 * GRP_Income4  +    -0.11819484788777 *
        GRP_Income5  +     0.10808210050899 * GRP_Income6
          +     0.05635717536035 * GRP_Income7  +     0.02870694648581 *
        GRP_Income8  +     0.03636364114922 * GRP_Income9
          +    -0.04562436396663 * GRP_Income10  +    -0.06781445122239 *
        GRP_Mnt2  +    -0.11715572379516 * GRP_Mnt3  +     0.00349054869757 *
        GRP_Mnt4  +     0.02792197480279 * GRP_Mnt5  +    -0.01017711490326 *
        GRP_Mnt6  +     0.07473091909769 * GRP_Mnt7  +    -0.08450195284729 *
        GRP_Mnt8  +    -0.03526653311047 * GRP_Mnt9  +     0.00831740495699 *
        GRP_Mnt10  +     0.06706826065482 * GRP_MntFishProducts3
          +    -0.10680206251603 * GRP_MntFishProducts4
          +    -0.06224682637669 * GRP_MntFishProducts5
          +    -0.15438234553702 * GRP_MntFishProducts6
          +     0.08554531534173 * GRP_MntFishProducts7
          +    -0.08208798665338 * GRP_MntFishProducts8
          +     -0.0226177845135 * GRP_MntFishProducts9
          +    -0.10213867503731 * GRP_MntFishProducts10
          +     -0.2123383588051 * GRP_MntGoldProds2
          +     -0.0079196011043 * GRP_MntGoldProds3
          +     0.06475631380543 * GRP_MntGoldProds4
          +     0.07663588991326 * GRP_MntGoldProds5
          +    -0.01384879164969 * GRP_MntGoldProds6
          +    -0.08139521928662 * GRP_MntGoldProds7
          +     0.02561995850855 * GRP_MntGoldProds8
          +    -0.12018610491882 * GRP_MntGoldProds9
          +     0.05118819490447 * GRP_MntGoldProds10
          +     0.00621465066793 * GRP_MntMeatProducts2
          +    -0.01128187506021 * GRP_MntMeatProducts3
          +      0.1668151183087 * GRP_MntMeatProducts4
          +    -0.00469589246613 * GRP_MntMeatProducts5
          +    -0.02973638276766 * GRP_MntMeatProducts6
          +     0.09283513897938 * GRP_MntMeatProducts7
          +     0.00156665361561 * GRP_MntMeatProducts8
          +     0.09665827883776 * GRP_MntMeatProducts9
          +     0.02735273826412 * GRP_MntMeatProducts10
          +     0.03319263140422 * GRP_MntSweetProducts3
          +    -0.01090810339485 * GRP_MntSweetProducts4
          +    -0.10386446852846 * GRP_MntSweetProducts5
          +     0.04489390653568 * GRP_MntSweetProducts6
          +     -0.1246309369471 * GRP_MntSweetProducts7
          +     -0.0783468435824 * GRP_MntSweetProducts8
          +    -0.17944550614161 * GRP_MntSweetProducts9
          +    -0.18148708357375 * GRP_MntSweetProducts10
          +    -0.03754810557525 * GRP_MntWines2  +     0.33227616052249 *
        GRP_MntWines3  +    -0.10952056302187 * GRP_MntWines4
          +    -0.19309977187458 * GRP_MntWines5  +    -0.06665843115254 *
        GRP_MntWines6  +    -0.15444809679017 * GRP_MntWines7
          +      0.1521480058086 * GRP_MntWines8  +     0.04990234603837 *
        GRP_MntWines9  +      0.0215190291763 * GRP_MntWines10
          +    -0.03574013909657 * GRP_NumCatalogPurchases3
          +     0.01861868156045 * GRP_NumCatalogPurchases4
          +     0.00164729283365 * GRP_NumCatalogPurchases5
          +    -0.08029264062177 * GRP_NumCatalogPurchases6
          +    -0.12924169806649 * GRP_NumCatalogPurchases7
          +    -0.09991925554011 * GRP_NumDistPurchases2
          +     0.18073050846411 * GRP_NumDistPurchases3
          +    -0.15551006949589 * GRP_NumDistPurchases4
          +     0.15081802950402 * GRP_NumDistPurchases5
          +     0.02312408114206 * GRP_NumDistPurchases6
          +    -0.03169443695609 * GRP_NumDistPurchases7
          +    -0.05379076389738 * GRP_NumDistPurchases8
          +     0.19904110786906 * GRP_NumDistPurchases9
          +     -0.1730044050466 * GRP_NumDistPurchases10
          +     0.18657764271039 * GRP_NumWebPurchases2
          +     0.00353763213276 * GRP_NumWebPurchases3
          +     0.04963223619426 * GRP_NumWebPurchases4
          +    -0.11517591892024 * GRP_NumWebPurchases5
          +    -0.00279774618745 * GRP_NumWebPurchases6
          +     0.05144971022046 * GRP_NumWebPurchases7
          +    -0.08267100800373 * GRP_NumWebPurchases8
          +     0.18968233374036 * GRP_NumWebVisitsMonth2
          +     0.03119260972187 * GRP_NumWebVisitsMonth3
          +     0.21694039557006 * GRP_NumWebVisitsMonth4
          +     0.07376293646884 * GRP_NumWebVisitsMonth5
          +    -0.01740027385397 * GRP_NumWebVisitsMonth6
          +     0.02005403596657 * GRP_NumWebVisitsMonth7
          +    -0.05434956224641 * GRP_NumWebVisitsMonth8
          +    -0.09771756627009 * GRP_RFMstat2  +     0.07194462658446 *
        GRP_RFMstat3  +    -0.05139062495327 * GRP_RFMstat4
          +    -0.12667411650982 * GRP_RFMstat5  +     0.14186789881049 *
        GRP_RFMstat6  +    -0.13896429495605 * GRP_RFMstat7
          +     0.15695524778926 * GRP_RFMstat8  +    -0.01905424186169 *
        GRP_RFMstat9  +     0.08435540734078 * GRP_RFMstat10
          +     0.00857732804196 * GRP_RMntFrq2  +      0.1275041361121 *
        GRP_RMntFrq3  +    -0.11260162363067 * GRP_RMntFrq4
          +     0.01724794097456 * GRP_RMntFrq5  +     0.07192926542116 *
        GRP_RMntFrq6  +    -0.02371411275797 * GRP_RMntFrq7
          +    -0.09957818845976 * GRP_RMntFrq8  +     0.04085979984244 *
        GRP_RMntFrq9  +    -0.08537005727014 * GRP_RMntFrq10
          +    -0.10076590903384 * GRP_Recency2  +    -0.17391140666387 *
        GRP_Recency3  +    -0.03520132702185 * GRP_Recency4
          +    -0.15270778645553 * GRP_Recency5  +     0.17662248372889 *
        GRP_Recency6  +     0.01323791656115 * GRP_Recency7
          +    -0.00626808504011 * GRP_Recency8  +      0.0119916912422 *
        GRP_Recency9  +     -0.0484820772442 * GRP_Recency10 ;
   H15  = H15  +     0.10886307444453 * GRP_AcceptedCmp52
          +    -0.09141476953226 * GRP_AcceptedCmpTotal3
          +    -0.14930623104714 * GRP_Frq2  +      0.0001018204747 * GRP_Frq3
          +    -0.31361056551275 * GRP_Frq4  +    -0.05958442956735 * GRP_Frq5
          +    -0.01962763097788 * GRP_Frq6  +     0.19629918365066 * GRP_Frq7
          +     0.04692744377057 * GRP_Frq8  +     0.17054278472024 * GRP_Frq9
          +     0.07134228041533 * GRP_Frq10  +    -0.12906657270123 *
        GRP_Income2  +     0.01815973180249 * GRP_Income3
          +     0.04101883053911 * GRP_Income4  +     0.08459345278601 *
        GRP_Income5  +      0.0665628565644 * GRP_Income6
          +    -0.18654503589953 * GRP_Income7  +    -0.04092050460131 *
        GRP_Income8  +      0.0042837824954 * GRP_Income9
          +     -0.1225136493777 * GRP_Income10  +    -0.09735261669213 *
        GRP_Mnt2  +     0.02370606672105 * GRP_Mnt3  +     0.06279496136534 *
        GRP_Mnt4  +    -0.01641605962318 * GRP_Mnt5  +     0.00058349191947 *
        GRP_Mnt6  +      0.0262135333519 * GRP_Mnt7  +     0.02402382166218 *
        GRP_Mnt8  +    -0.11045981131563 * GRP_Mnt9  +     0.01335607474901 *
        GRP_Mnt10  +      -0.001031809476 * GRP_MntFishProducts3
          +     0.06517892494465 * GRP_MntFishProducts4
          +    -0.02105260007195 * GRP_MntFishProducts5
          +     0.07816980749668 * GRP_MntFishProducts6
          +     0.09166611577818 * GRP_MntFishProducts7
          +     0.02623679207974 * GRP_MntFishProducts8
          +    -0.01701253974019 * GRP_MntFishProducts9
          +    -0.17369285723227 * GRP_MntFishProducts10
          +     -0.0257615698775 * GRP_MntGoldProds2
          +    -0.00281150265384 * GRP_MntGoldProds3
          +    -0.07457719455266 * GRP_MntGoldProds4
          +    -0.02701914687994 * GRP_MntGoldProds5
          +      0.0320668652934 * GRP_MntGoldProds6
          +     0.05874167386173 * GRP_MntGoldProds7
          +    -0.17678260281395 * GRP_MntGoldProds8
          +     0.00108323929767 * GRP_MntGoldProds9
          +    -0.02609952249201 * GRP_MntGoldProds10
          +     0.02269200571808 * GRP_MntMeatProducts2
          +    -0.13735702811418 * GRP_MntMeatProducts3
          +     0.01593653669761 * GRP_MntMeatProducts4
          +    -0.05235397183307 * GRP_MntMeatProducts5
          +     0.06214731463774 * GRP_MntMeatProducts6
          +    -0.04587757079082 * GRP_MntMeatProducts7
          +     0.03385994796195 * GRP_MntMeatProducts8
          +    -0.06730939985929 * GRP_MntMeatProducts9
          +     0.02955920615331 * GRP_MntMeatProducts10
          +     0.02538436200453 * GRP_MntSweetProducts3
          +    -0.05289452464152 * GRP_MntSweetProducts4
          +     0.12111073059475 * GRP_MntSweetProducts5
          +     0.14232094532509 * GRP_MntSweetProducts6
          +    -0.04679821143864 * GRP_MntSweetProducts7
          +     0.13013205904303 * GRP_MntSweetProducts8
          +     0.05234871756974 * GRP_MntSweetProducts9
          +     0.21348485656819 * GRP_MntSweetProducts10
          +    -0.14424630240261 * GRP_MntWines2  +     0.00497090414999 *
        GRP_MntWines3  +    -0.03461787755729 * GRP_MntWines4
          +      0.0073319659503 * GRP_MntWines5  +     0.06962517498634 *
        GRP_MntWines6  +    -0.06837792711609 * GRP_MntWines7
          +     -0.0208414323719 * GRP_MntWines8  +     0.01993619131684 *
        GRP_MntWines9  +    -0.07506403365351 * GRP_MntWines10
          +    -0.01769508366756 * GRP_NumCatalogPurchases3
          +      0.0693344187484 * GRP_NumCatalogPurchases4
          +    -0.15019953298298 * GRP_NumCatalogPurchases5
          +     0.07901567777775 * GRP_NumCatalogPurchases6
          +    -0.00639000664073 * GRP_NumCatalogPurchases7
          +      0.0336567746391 * GRP_NumDistPurchases2
          +      0.1750985730927 * GRP_NumDistPurchases3
          +     0.03546686017737 * GRP_NumDistPurchases4
          +    -0.00971459569262 * GRP_NumDistPurchases5
          +    -0.07855734622345 * GRP_NumDistPurchases6
          +     0.11885795672993 * GRP_NumDistPurchases7
          +    -0.05465836198109 * GRP_NumDistPurchases8
          +      0.0190044315646 * GRP_NumDistPurchases9
          +    -0.02674942070656 * GRP_NumDistPurchases10
          +    -0.02567620277867 * GRP_NumWebPurchases2
          +    -0.05670996651155 * GRP_NumWebPurchases3
          +    -0.04731165021578 * GRP_NumWebPurchases4
          +     0.00812774715596 * GRP_NumWebPurchases5
          +    -0.02473143850008 * GRP_NumWebPurchases6
          +     0.14971881883908 * GRP_NumWebPurchases7
          +     0.05509947478244 * GRP_NumWebPurchases8
          +     0.10573374107522 * GRP_NumWebVisitsMonth2
          +     0.02609642083905 * GRP_NumWebVisitsMonth3
          +     0.12685900243413 * GRP_NumWebVisitsMonth4
          +    -0.08044983304842 * GRP_NumWebVisitsMonth5
          +     0.09577058423339 * GRP_NumWebVisitsMonth6
          +      0.1870383976325 * GRP_NumWebVisitsMonth7
          +     0.13512907999722 * GRP_NumWebVisitsMonth8
          +     0.02499103981433 * GRP_RFMstat2  +     -0.0012604186181 *
        GRP_RFMstat3  +     -0.0139909895856 * GRP_RFMstat4
          +     0.10092163696892 * GRP_RFMstat5  +     0.05642191959698 *
        GRP_RFMstat6  +    -0.05954031177389 * GRP_RFMstat7
          +     0.02035715844336 * GRP_RFMstat8  +     0.01687040966927 *
        GRP_RFMstat9  +     0.11588167321885 * GRP_RFMstat10
          +     0.10058670183272 * GRP_RMntFrq2  +     0.15879689915766 *
        GRP_RMntFrq3  +     0.04667944767764 * GRP_RMntFrq4
          +    -0.15196599849656 * GRP_RMntFrq5  +     0.02280744723717 *
        GRP_RMntFrq6  +     0.03763093906535 * GRP_RMntFrq7
          +    -0.00355321572205 * GRP_RMntFrq8  +     0.04758490465011 *
        GRP_RMntFrq9  +     0.01254716566017 * GRP_RMntFrq10
          +    -0.04848252945572 * GRP_Recency2  +    -0.08043146293306 *
        GRP_Recency3  +     0.00637533323705 * GRP_Recency4
          +    -0.01156980272453 * GRP_Recency5  +    -0.12161478172017 *
        GRP_Recency6  +    -0.00510381849313 * GRP_Recency7
          +    -0.09894631445766 * GRP_Recency8  +     0.02314716771759 *
        GRP_Recency9  +     0.00607453368106 * GRP_Recency10 ;
   H16  = H16  +     0.04560334544784 * GRP_AcceptedCmp52
          +      0.0792009785355 * GRP_AcceptedCmpTotal3
          +     -0.0124290531194 * GRP_Frq2  +     0.03942143739911 * GRP_Frq3
          +     0.15834505962283 * GRP_Frq4  +     0.13657867386823 * GRP_Frq5
          +    -0.09909566873427 * GRP_Frq6  +    -0.00374716809854 * GRP_Frq7
          +     0.05475582453764 * GRP_Frq8  +     0.04177468386811 * GRP_Frq9
          +     0.32130956079427 * GRP_Frq10  +    -0.01663475923697 *
        GRP_Income2  +    -0.07540253562398 * GRP_Income3
          +     0.09224642047363 * GRP_Income4  +    -0.12632272788468 *
        GRP_Income5  +    -0.08484542372027 * GRP_Income6
          +     0.06493340074367 * GRP_Income7  +     0.12547279997578 *
        GRP_Income8  +     0.03305866255367 * GRP_Income9
          +    -0.05334375320475 * GRP_Income10  +     -0.1244751694519 *
        GRP_Mnt2  +    -0.14333744662066 * GRP_Mnt3  +     0.00923679681586 *
        GRP_Mnt4  +     0.17011945406529 * GRP_Mnt5  +    -0.01491013870453 *
        GRP_Mnt6  +      0.1398776007466 * GRP_Mnt7  +    -0.12265469498804 *
        GRP_Mnt8  +    -0.10470674811597 * GRP_Mnt9  +    -0.11613981752739 *
        GRP_Mnt10  +     -0.1435145336959 * GRP_MntFishProducts3
          +      0.0671274756531 * GRP_MntFishProducts4
          +    -0.08883253998299 * GRP_MntFishProducts5
          +    -0.03748787285737 * GRP_MntFishProducts6
          +     0.02046138794647 * GRP_MntFishProducts7
          +     0.06541747713468 * GRP_MntFishProducts8
          +      0.0020927081278 * GRP_MntFishProducts9
          +    -0.01820059213204 * GRP_MntFishProducts10
          +     0.12913850719168 * GRP_MntGoldProds2
          +    -0.11454734283992 * GRP_MntGoldProds3
          +    -0.03787480948393 * GRP_MntGoldProds4
          +     0.10090513466885 * GRP_MntGoldProds5
          +    -0.03912797375616 * GRP_MntGoldProds6
          +       0.008573756121 * GRP_MntGoldProds7
          +     0.20210211313573 * GRP_MntGoldProds8
          +    -0.01491860471696 * GRP_MntGoldProds9
          +     0.18300761768606 * GRP_MntGoldProds10
          +     0.07446614047588 * GRP_MntMeatProducts2
          +     0.09479933375513 * GRP_MntMeatProducts3
          +     0.17191509956786 * GRP_MntMeatProducts4
          +     0.00520549298368 * GRP_MntMeatProducts5
          +    -0.03556989667137 * GRP_MntMeatProducts6
          +     0.04882067449331 * GRP_MntMeatProducts7
          +    -0.01002309093613 * GRP_MntMeatProducts8
          +    -0.02726750094366 * GRP_MntMeatProducts9
          +    -0.26142062441213 * GRP_MntMeatProducts10
          +     0.05909942170336 * GRP_MntSweetProducts3
          +    -0.04563924523159 * GRP_MntSweetProducts4
          +       0.037735444613 * GRP_MntSweetProducts5
          +    -0.08613703519228 * GRP_MntSweetProducts6
          +    -0.05795278262054 * GRP_MntSweetProducts7
          +    -0.09155269081154 * GRP_MntSweetProducts8
          +    -0.05696268909421 * GRP_MntSweetProducts9
          +    -0.18187795877629 * GRP_MntSweetProducts10
          +     0.00002022743319 * GRP_MntWines2  +      0.0069639077064 *
        GRP_MntWines3  +    -0.21365781094781 * GRP_MntWines4
          +    -0.03937352318962 * GRP_MntWines5  +    -0.04669406967934 *
        GRP_MntWines6  +     0.17339580679014 * GRP_MntWines7
          +     0.08731821722828 * GRP_MntWines8  +     0.06609679803106 *
        GRP_MntWines9  +     0.15322579318294 * GRP_MntWines10
          +     0.53649313219519 * GRP_NumCatalogPurchases3
          +     0.10802339200943 * GRP_NumCatalogPurchases4
          +     -0.1559722894884 * GRP_NumCatalogPurchases5
          +     0.00690258519125 * GRP_NumCatalogPurchases6
          +    -0.05823581889593 * GRP_NumCatalogPurchases7
          +     -0.0892386326214 * GRP_NumDistPurchases2
          +      0.1099586571427 * GRP_NumDistPurchases3
          +    -0.00372327158741 * GRP_NumDistPurchases4
          +     0.08058130182666 * GRP_NumDistPurchases5
          +     0.07608652810845 * GRP_NumDistPurchases6
          +     0.10728894561959 * GRP_NumDistPurchases7
          +     0.22657815795591 * GRP_NumDistPurchases8
          +     0.00005481450606 * GRP_NumDistPurchases9
          +    -0.04405240256405 * GRP_NumDistPurchases10
          +     0.08531639260704 * GRP_NumWebPurchases2
          +    -0.01311969724144 * GRP_NumWebPurchases3
          +     0.01203598453956 * GRP_NumWebPurchases4
          +      0.0446838861403 * GRP_NumWebPurchases5
          +     0.03172975544028 * GRP_NumWebPurchases6
          +    -0.11743389659544 * GRP_NumWebPurchases7
          +     -0.0032942396637 * GRP_NumWebPurchases8
          +     0.38612227582146 * GRP_NumWebVisitsMonth2
          +     0.04321181405881 * GRP_NumWebVisitsMonth3
          +     0.10743155899433 * GRP_NumWebVisitsMonth4
          +      0.1763198241391 * GRP_NumWebVisitsMonth5
          +    -0.12699239153956 * GRP_NumWebVisitsMonth6
          +    -0.10086837765024 * GRP_NumWebVisitsMonth7
          +    -0.24707273445227 * GRP_NumWebVisitsMonth8
          +    -0.00949311547422 * GRP_RFMstat2  +      0.0606013750995 *
        GRP_RFMstat3  +     0.00069687993839 * GRP_RFMstat4
          +     0.04757292681257 * GRP_RFMstat5  +    -0.01094643104576 *
        GRP_RFMstat6  +    -0.06104550696604 * GRP_RFMstat7
          +       0.013881751366 * GRP_RFMstat8  +    -0.01138329284578 *
        GRP_RFMstat9  +     0.00276718643583 * GRP_RFMstat10
          +     0.08253406999973 * GRP_RMntFrq2  +    -0.13476711166759 *
        GRP_RMntFrq3  +     0.00109332436232 * GRP_RMntFrq4
          +     0.08254935387199 * GRP_RMntFrq5  +    -0.05031162729999 *
        GRP_RMntFrq6  +     0.08667223153356 * GRP_RMntFrq7
          +     0.06401664719874 * GRP_RMntFrq8  +    -0.02917008730768 *
        GRP_RMntFrq9  +     0.15980356286515 * GRP_RMntFrq10
          +    -0.33093762404066 * GRP_Recency2  +    -0.05494964591102 *
        GRP_Recency3  +    -0.37311459916113 * GRP_Recency4
          +    -0.02680457179473 * GRP_Recency5  +     -0.1060465605844 *
        GRP_Recency6  +     0.02070105469983 * GRP_Recency7
          +     0.11696205079934 * GRP_Recency8  +     0.18084628307877 *
        GRP_Recency9  +     0.28706495246548 * GRP_Recency10 ;
   H17  = H17  +     0.00344366732351 * GRP_AcceptedCmp52
          +    -0.05085164462133 * GRP_AcceptedCmpTotal3
          +     0.06849255259405 * GRP_Frq2  +    -0.07381006724232 * GRP_Frq3
          +    -0.07433233570269 * GRP_Frq4  +    -0.01070137611395 * GRP_Frq5
          +    -0.16400408628141 * GRP_Frq6  +     -0.0235493332713 * GRP_Frq7
          +    -0.06977762099822 * GRP_Frq8  +     0.04740490147038 * GRP_Frq9
          +     0.05174511921176 * GRP_Frq10  +     0.10449948098175 *
        GRP_Income2  +    -0.05546698910271 * GRP_Income3
          +    -0.02026210178594 * GRP_Income4  +    -0.02757426920512 *
        GRP_Income5  +      0.0188564263716 * GRP_Income6
          +    -0.02773092111365 * GRP_Income7  +     0.01892264748415 *
        GRP_Income8  +     0.11970327100159 * GRP_Income9
          +     -0.0988518772613 * GRP_Income10  +      0.1072923687804 *
        GRP_Mnt2  +     0.01196539744907 * GRP_Mnt3  +     0.05319575879007 *
        GRP_Mnt4  +    -0.04866861102463 * GRP_Mnt5  +       0.071979352321 *
        GRP_Mnt6  +    -0.03163583853582 * GRP_Mnt7  +    -0.09909179638478 *
        GRP_Mnt8  +    -0.13687949771862 * GRP_Mnt9  +    -0.07561489859448 *
        GRP_Mnt10  +    -0.07803390779674 * GRP_MntFishProducts3
          +     0.01478378006285 * GRP_MntFishProducts4
          +     0.07672362238279 * GRP_MntFishProducts5
          +    -0.02358661166706 * GRP_MntFishProducts6
          +    -0.08588488418885 * GRP_MntFishProducts7
          +    -0.11520920807552 * GRP_MntFishProducts8
          +     -0.0197078009616 * GRP_MntFishProducts9
          +    -0.09191265823181 * GRP_MntFishProducts10
          +     0.19411067126627 * GRP_MntGoldProds2
          +      0.2462190553504 * GRP_MntGoldProds3
          +     0.11130765048854 * GRP_MntGoldProds4
          +     0.10751048867742 * GRP_MntGoldProds5
          +    -0.05060557333037 * GRP_MntGoldProds6
          +     0.19117819976798 * GRP_MntGoldProds7
          +     0.11021926619171 * GRP_MntGoldProds8
          +     0.02149837520327 * GRP_MntGoldProds9
          +     0.08784469234715 * GRP_MntGoldProds10
          +     0.04638704950097 * GRP_MntMeatProducts2
          +    -0.05299850180317 * GRP_MntMeatProducts3
          +    -0.07873824950704 * GRP_MntMeatProducts4
          +     0.16695068934671 * GRP_MntMeatProducts5
          +     0.02145858048611 * GRP_MntMeatProducts6
          +     0.13796802778238 * GRP_MntMeatProducts7
          +     0.14983402082758 * GRP_MntMeatProducts8
          +    -0.11974328831838 * GRP_MntMeatProducts9
          +     0.17766752421522 * GRP_MntMeatProducts10
          +     0.04090771242253 * GRP_MntSweetProducts3
          +    -0.01637530761985 * GRP_MntSweetProducts4
          +    -0.03091917565231 * GRP_MntSweetProducts5
          +     -0.1361701861429 * GRP_MntSweetProducts6
          +      -0.121451177342 * GRP_MntSweetProducts7
          +    -0.04776470920755 * GRP_MntSweetProducts8
          +    -0.00419431536984 * GRP_MntSweetProducts9
          +     0.06839103312499 * GRP_MntSweetProducts10
          +     0.03255949749474 * GRP_MntWines2  +    -0.06491639613801 *
        GRP_MntWines3  +     0.04526032037152 * GRP_MntWines4
          +    -0.13413589293967 * GRP_MntWines5  +     0.01979217538837 *
        GRP_MntWines6  +     0.06132805645526 * GRP_MntWines7
          +    -0.17884775781432 * GRP_MntWines8  +     0.06723845041252 *
        GRP_MntWines9  +    -0.11802722706977 * GRP_MntWines10
          +    -0.13469501544875 * GRP_NumCatalogPurchases3
          +     0.10437849330506 * GRP_NumCatalogPurchases4
          +    -0.10238944046221 * GRP_NumCatalogPurchases5
          +     0.25239457618915 * GRP_NumCatalogPurchases6
          +    -0.04311890106122 * GRP_NumCatalogPurchases7
          +     0.14314412544138 * GRP_NumDistPurchases2
          +    -0.02251898653754 * GRP_NumDistPurchases3
          +     0.09923814342281 * GRP_NumDistPurchases4
          +      0.1070484412301 * GRP_NumDistPurchases5
          +     0.03907906433135 * GRP_NumDistPurchases6
          +     0.06744835513133 * GRP_NumDistPurchases7
          +     0.05075217048734 * GRP_NumDistPurchases8
          +     0.05637489409645 * GRP_NumDistPurchases9
          +     0.18422799737764 * GRP_NumDistPurchases10
          +    -0.03724545644791 * GRP_NumWebPurchases2
          +     -0.0425571341212 * GRP_NumWebPurchases3
          +     0.08565233833888 * GRP_NumWebPurchases4
          +    -0.00870288161048 * GRP_NumWebPurchases5
          +     -0.0456295907564 * GRP_NumWebPurchases6
          +     0.00527043360692 * GRP_NumWebPurchases7
          +     0.05595593381462 * GRP_NumWebPurchases8
          +     0.13918156734466 * GRP_NumWebVisitsMonth2
          +    -0.03877657521533 * GRP_NumWebVisitsMonth3
          +    -0.04967689388372 * GRP_NumWebVisitsMonth4
          +    -0.07659986940605 * GRP_NumWebVisitsMonth5
          +    -0.00482027839524 * GRP_NumWebVisitsMonth6
          +    -0.03499153084734 * GRP_NumWebVisitsMonth7
          +    -0.03731338783829 * GRP_NumWebVisitsMonth8
          +    -0.28723503724294 * GRP_RFMstat2  +     -0.1964673241979 *
        GRP_RFMstat3  +     0.03738704243948 * GRP_RFMstat4
          +     0.00033143322256 * GRP_RFMstat5  +    -0.17142659820969 *
        GRP_RFMstat6  +     0.01703938377256 * GRP_RFMstat7
          +    -0.04291983565161 * GRP_RFMstat8  +     0.00587396977846 *
        GRP_RFMstat9  +     0.11123814792375 * GRP_RFMstat10
          +    -0.03576146053433 * GRP_RMntFrq2  +    -0.11388253139104 *
        GRP_RMntFrq3  +    -0.15950517673473 * GRP_RMntFrq4
          +     0.04949799565035 * GRP_RMntFrq5  +    -0.15524481203884 *
        GRP_RMntFrq6  +    -0.13504407355289 * GRP_RMntFrq7
          +    -0.03167783548387 * GRP_RMntFrq8  +    -0.03669253223509 *
        GRP_RMntFrq9  +    -0.05967716551252 * GRP_RMntFrq10
          +    -0.06163563153904 * GRP_Recency2  +     0.01372918489899 *
        GRP_Recency3  +     0.06331929253132 * GRP_Recency4
          +     0.12554884559749 * GRP_Recency5  +    -0.07871532152132 *
        GRP_Recency6  +     0.05113686048813 * GRP_Recency7
          +     0.05067053788164 * GRP_Recency8  +    -0.08066403153869 *
        GRP_Recency9  +    -0.01871140107407 * GRP_Recency10 ;
   H11  =    -0.22090014441173 + H11 ;
   H12  =      0.7938625735214 + H12 ;
   H13  =    -0.02803857026454 + H13 ;
   H14  =    -1.49984857300756 + H14 ;
   H15  =     0.69609172873771 + H15 ;
   H16  =    -0.35701522413568 + H16 ;
   H17  =     0.35195323490594 + H17 ;
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
   P_DepVar1  =      5.2679890618814 * H11  +    -4.64032348095386 * H12
          +    -3.51419784245436 * H13  +    -1.41988180667552 * H14
          +    -0.64492920049272 * H15  +    -4.44282536224268 * H16
          +      0.2098288805141 * H17 ;
   P_DepVar1  =    -1.83708643516383 + P_DepVar1 ;
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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop _2_0 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop _3_0 _3_1 _3_2 _3_3 _3_4 _3_5 _3_6 _3_7 _3_8 ;
*** encoding is sparse, initialize to zero;
_3_0 = 0;
_3_1 = 0;
_3_2 = 0;
_3_3 = 0;
_3_4 = 0;
_3_5 = 0;
_3_6 = 0;
_3_7 = 0;
_3_8 = 0;
if missing( GRP_Frq ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   _3_3 = .;
   _3_4 = .;
   _3_5 = .;
   _3_6 = .;
   _3_7 = .;
   _3_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _3_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _3_0 = -1;
                  _3_1 = -1;
                  _3_2 = -1;
                  _3_3 = -1;
                  _3_4 = -1;
                  _3_5 = -1;
                  _3_6 = -1;
                  _3_7 = -1;
                  _3_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _3_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _3_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _3_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _3_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _3_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _3_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _3_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _3_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      _3_3 = .;
      _3_4 = .;
      _3_5 = .;
      _3_6 = .;
      _3_7 = .;
      _3_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop _4_0 _4_1 _4_2 _4_3 _4_4 _4_5 _4_6 _4_7 _4_8 ;
*** encoding is sparse, initialize to zero;
_4_0 = 0;
_4_1 = 0;
_4_2 = 0;
_4_3 = 0;
_4_4 = 0;
_4_5 = 0;
_4_6 = 0;
_4_7 = 0;
_4_8 = 0;
if missing( GRP_Income ) then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   _4_3 = .;
   _4_4 = .;
   _4_5 = .;
   _4_6 = .;
   _4_7 = .;
   _4_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _4_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _4_0 = -1;
                  _4_1 = -1;
                  _4_2 = -1;
                  _4_3 = -1;
                  _4_4 = -1;
                  _4_5 = -1;
                  _4_6 = -1;
                  _4_7 = -1;
                  _4_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _4_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _4_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _4_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _4_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _4_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _4_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _4_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _4_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _4_0 = .;
      _4_1 = .;
      _4_2 = .;
      _4_3 = .;
      _4_4 = .;
      _4_5 = .;
      _4_6 = .;
      _4_7 = .;
      _4_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop _6_0 _6_1 _6_2 _6_3 _6_4 _6_5 _6_6 _6_7 ;
*** encoding is sparse, initialize to zero;
_6_0 = 0;
_6_1 = 0;
_6_2 = 0;
_6_3 = 0;
_6_4 = 0;
_6_5 = 0;
_6_6 = 0;
_6_7 = 0;
if missing( GRP_MntFishProducts ) then do;
   _6_0 = .;
   _6_1 = .;
   _6_2 = .;
   _6_3 = .;
   _6_4 = .;
   _6_5 = .;
   _6_6 = .;
   _6_7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _6_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _6_0 = -1;
                  _6_1 = -1;
                  _6_2 = -1;
                  _6_3 = -1;
                  _6_4 = -1;
                  _6_5 = -1;
                  _6_6 = -1;
                  _6_7 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               _6_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _6_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _6_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _6_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _6_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _6_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _6_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _6_0 = .;
      _6_1 = .;
      _6_2 = .;
      _6_3 = .;
      _6_4 = .;
      _6_5 = .;
      _6_6 = .;
      _6_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop _8_0 _8_1 _8_2 _8_3 _8_4 _8_5 _8_6 _8_7 _8_8 ;
*** encoding is sparse, initialize to zero;
_8_0 = 0;
_8_1 = 0;
_8_2 = 0;
_8_3 = 0;
_8_4 = 0;
_8_5 = 0;
_8_6 = 0;
_8_7 = 0;
_8_8 = 0;
if missing( GRP_MntMeatProducts ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   _8_3 = .;
   _8_4 = .;
   _8_5 = .;
   _8_6 = .;
   _8_7 = .;
   _8_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _8_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _8_0 = -1;
                  _8_1 = -1;
                  _8_2 = -1;
                  _8_3 = -1;
                  _8_4 = -1;
                  _8_5 = -1;
                  _8_6 = -1;
                  _8_7 = -1;
                  _8_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _8_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _8_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _8_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _8_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _8_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _8_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _8_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _8_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      _8_3 = .;
      _8_4 = .;
      _8_5 = .;
      _8_6 = .;
      _8_7 = .;
      _8_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop _9_0 _9_1 _9_2 _9_3 _9_4 _9_5 _9_6 _9_7 ;
*** encoding is sparse, initialize to zero;
_9_0 = 0;
_9_1 = 0;
_9_2 = 0;
_9_3 = 0;
_9_4 = 0;
_9_5 = 0;
_9_6 = 0;
_9_7 = 0;
if missing( GRP_MntSweetProducts ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   _9_3 = .;
   _9_4 = .;
   _9_5 = .;
   _9_6 = .;
   _9_7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _9_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _9_0 = -1;
                  _9_1 = -1;
                  _9_2 = -1;
                  _9_3 = -1;
                  _9_4 = -1;
                  _9_5 = -1;
                  _9_6 = -1;
                  _9_7 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               _9_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _9_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _9_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _9_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _9_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _9_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _9_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      _9_3 = .;
      _9_4 = .;
      _9_5 = .;
      _9_6 = .;
      _9_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop _10_0 _10_1 _10_2 _10_3 _10_4 _10_5 _10_6 _10_7 _10_8 ;
*** encoding is sparse, initialize to zero;
_10_0 = 0;
_10_1 = 0;
_10_2 = 0;
_10_3 = 0;
_10_4 = 0;
_10_5 = 0;
_10_6 = 0;
_10_7 = 0;
_10_8 = 0;
if missing( GRP_MntWines ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   _10_3 = .;
   _10_4 = .;
   _10_5 = .;
   _10_6 = .;
   _10_7 = .;
   _10_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _10_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _10_0 = -1;
                  _10_1 = -1;
                  _10_2 = -1;
                  _10_3 = -1;
                  _10_4 = -1;
                  _10_5 = -1;
                  _10_6 = -1;
                  _10_7 = -1;
                  _10_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _10_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _10_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _10_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _10_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _10_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _10_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _10_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _10_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      _10_3 = .;
      _10_4 = .;
      _10_5 = .;
      _10_6 = .;
      _10_7 = .;
      _10_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop _11_0 _11_1 _11_2 _11_3 _11_4 ;
*** encoding is sparse, initialize to zero;
_11_0 = 0;
_11_1 = 0;
_11_2 = 0;
_11_3 = 0;
_11_4 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   _11_0 = .;
   _11_1 = .;
   _11_2 = .;
   _11_3 = .;
   _11_4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            _11_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _11_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            _11_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _11_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _11_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _11_0 = -1;
            _11_1 = -1;
            _11_2 = -1;
            _11_3 = -1;
            _11_4 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _11_0 = .;
      _11_1 = .;
      _11_2 = .;
      _11_3 = .;
      _11_4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop _14_0 _14_1 _14_2 _14_3 _14_4 _14_5 _14_6 ;
*** encoding is sparse, initialize to zero;
_14_0 = 0;
_14_1 = 0;
_14_2 = 0;
_14_3 = 0;
_14_4 = 0;
_14_5 = 0;
_14_6 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   _14_0 = .;
   _14_1 = .;
   _14_2 = .;
   _14_3 = .;
   _14_4 = .;
   _14_5 = .;
   _14_6 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            _14_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               _14_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _14_2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _14_3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _14_4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _14_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _14_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _14_0 = -1;
               _14_1 = -1;
               _14_2 = -1;
               _14_3 = -1;
               _14_4 = -1;
               _14_5 = -1;
               _14_6 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _14_0 = .;
      _14_1 = .;
      _14_2 = .;
      _14_3 = .;
      _14_4 = .;
      _14_5 = .;
      _14_6 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop _16_0 _16_1 _16_2 _16_3 _16_4 _16_5 _16_6 _16_7 _16_8 ;
*** encoding is sparse, initialize to zero;
_16_0 = 0;
_16_1 = 0;
_16_2 = 0;
_16_3 = 0;
_16_4 = 0;
_16_5 = 0;
_16_6 = 0;
_16_7 = 0;
_16_8 = 0;
if missing( GRP_RMntFrq ) then do;
   _16_0 = .;
   _16_1 = .;
   _16_2 = .;
   _16_3 = .;
   _16_4 = .;
   _16_5 = .;
   _16_6 = .;
   _16_7 = .;
   _16_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _16_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _16_0 = -1;
                  _16_1 = -1;
                  _16_2 = -1;
                  _16_3 = -1;
                  _16_4 = -1;
                  _16_5 = -1;
                  _16_6 = -1;
                  _16_7 = -1;
                  _16_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _16_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _16_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _16_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _16_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _16_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _16_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _16_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _16_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _16_0 = .;
      _16_1 = .;
      _16_2 = .;
      _16_3 = .;
      _16_4 = .;
      _16_5 = .;
      _16_6 = .;
      _16_7 = .;
      _16_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop _17_0 _17_1 _17_2 _17_3 _17_4 _17_5 _17_6 _17_7 _17_8 ;
*** encoding is sparse, initialize to zero;
_17_0 = 0;
_17_1 = 0;
_17_2 = 0;
_17_3 = 0;
_17_4 = 0;
_17_5 = 0;
_17_6 = 0;
_17_7 = 0;
_17_8 = 0;
if missing( GRP_Recency ) then do;
   _17_0 = .;
   _17_1 = .;
   _17_2 = .;
   _17_3 = .;
   _17_4 = .;
   _17_5 = .;
   _17_6 = .;
   _17_7 = .;
   _17_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _17_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _17_0 = -1;
                  _17_1 = -1;
                  _17_2 = -1;
                  _17_3 = -1;
                  _17_4 = -1;
                  _17_5 = -1;
                  _17_6 = -1;
                  _17_7 = -1;
                  _17_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _17_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _17_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _17_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _17_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _17_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _17_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _17_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _17_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _17_0 = .;
      _17_1 = .;
      _17_2 = .;
      _17_3 = .;
      _17_4 = .;
      _17_5 = .;
      _17_6 = .;
      _17_7 = .;
      _17_8 = .;
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
_LP0 = _LP0 + (   -0.43533664969535) * _TEMP * _1_0;

***  Effect: GRP_AcceptedCmpTotal ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.80259368074474) * _TEMP * _2_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (    0.91100459014326) * _TEMP * _3_0;
_LP0 = _LP0 + (    1.30517605331849) * _TEMP * _3_1;
_LP0 = _LP0 + (    1.11556358848526) * _TEMP * _3_2;
_LP0 = _LP0 + (    0.75137606837703) * _TEMP * _3_3;
_LP0 = _LP0 + (    0.22667584665051) * _TEMP * _3_4;
_LP0 = _LP0 + (   -0.36355490163716) * _TEMP * _3_5;
_LP0 = _LP0 + (   -0.27212699434389) * _TEMP * _3_6;
_LP0 = _LP0 + (   -0.89978590791079) * _TEMP * _3_7;
_LP0 = _LP0 + (   -0.94480140724689) * _TEMP * _3_8;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.67863268191527) * _TEMP * _4_0;
_LP0 = _LP0 + (   -0.57046328857592) * _TEMP * _4_1;
_LP0 = _LP0 + (    -0.1890918276771) * _TEMP * _4_2;
_LP0 = _LP0 + (    0.23692190511298) * _TEMP * _4_3;
_LP0 = _LP0 + (    0.20526853412013) * _TEMP * _4_4;
_LP0 = _LP0 + (   -0.17214495632527) * _TEMP * _4_5;
_LP0 = _LP0 + (   -0.39723869175524) * _TEMP * _4_6;
_LP0 = _LP0 + (    0.12606456143445) * _TEMP * _4_7;
_LP0 = _LP0 + (    0.42361200787646) * _TEMP * _4_8;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.48752062405289) * _TEMP * _6_0;
_LP0 = _LP0 + (    0.17481352517088) * _TEMP * _6_1;
_LP0 = _LP0 + (    0.09853640441631) * _TEMP * _6_2;
_LP0 = _LP0 + (   -0.07229233845021) * _TEMP * _6_3;
_LP0 = _LP0 + (   -0.01389179233941) * _TEMP * _6_4;
_LP0 = _LP0 + (     0.3386403333754) * _TEMP * _6_5;
_LP0 = _LP0 + (   -0.25832507184609) * _TEMP * _6_6;
_LP0 = _LP0 + (   -0.26492098163096) * _TEMP * _6_7;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -4.59610842787446) * _TEMP * _8_0;
_LP0 = _LP0 + (   -2.32024987229394) * _TEMP * _8_1;
_LP0 = _LP0 + (   -1.64646759719417) * _TEMP * _8_2;
_LP0 = _LP0 + (   -0.76151212861519) * _TEMP * _8_3;
_LP0 = _LP0 + (    0.51722378376922) * _TEMP * _8_4;
_LP0 = _LP0 + (    0.75208074934091) * _TEMP * _8_5;
_LP0 = _LP0 + (    1.45871842458832) * _TEMP * _8_6;
_LP0 = _LP0 + (    1.52563715317721) * _TEMP * _8_7;
_LP0 = _LP0 + (    2.21558270110625) * _TEMP * _8_8;

***  Effect: GRP_MntSweetProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.18739902632568) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.37870460830373) * _TEMP * _9_1;
_LP0 = _LP0 + (    0.22908519374031) * _TEMP * _9_2;
_LP0 = _LP0 + (   -0.00561701310679) * _TEMP * _9_3;
_LP0 = _LP0 + (     0.3857620674363) * _TEMP * _9_4;
_LP0 = _LP0 + (   -0.16844878587934) * _TEMP * _9_5;
_LP0 = _LP0 + (    -0.1305347485537) * _TEMP * _9_6;
_LP0 = _LP0 + (   -0.18036392668341) * _TEMP * _9_7;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    2.19744807146287) * _TEMP * _10_0;
_LP0 = _LP0 + (    1.49780556010343) * _TEMP * _10_1;
_LP0 = _LP0 + (    1.20853403645007) * _TEMP * _10_2;
_LP0 = _LP0 + (    0.91522429321633) * _TEMP * _10_3;
_LP0 = _LP0 + (    0.07188342963614) * _TEMP * _10_4;
_LP0 = _LP0 + (   -0.19911189687109) * _TEMP * _10_5;
_LP0 = _LP0 + (   -0.89304358322459) * _TEMP * _10_6;
_LP0 = _LP0 + (   -1.20703026995025) * _TEMP * _10_7;
_LP0 = _LP0 + (   -1.59039392715362) * _TEMP * _10_8;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -3.40703872318535) * _TEMP * _11_0;
_LP0 = _LP0 + (   -1.45181049982561) * _TEMP * _11_1;
_LP0 = _LP0 + (   -0.08347404660345) * _TEMP * _11_2;
_LP0 = _LP0 + (    0.81955944534199) * _TEMP * _11_3;
_LP0 = _LP0 + (    1.45035693356184) * _TEMP * _11_4;

***  Effect: GRP_NumWebVisitsMonth ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.81981937806131) * _TEMP * _14_0;
_LP0 = _LP0 + (   -1.17799242784665) * _TEMP * _14_1;
_LP0 = _LP0 + (   -0.94053899638537) * _TEMP * _14_2;
_LP0 = _LP0 + (   -0.36886112918233) * _TEMP * _14_3;
_LP0 = _LP0 + (    0.29366599559997) * _TEMP * _14_4;
_LP0 = _LP0 + (    0.37587988225403) * _TEMP * _14_5;
_LP0 = _LP0 + (     1.2821313793468) * _TEMP * _14_6;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (    1.52257971842016) * _TEMP * _16_0;
_LP0 = _LP0 + (    0.89925185098242) * _TEMP * _16_1;
_LP0 = _LP0 + (    0.43979399106939) * _TEMP * _16_2;
_LP0 = _LP0 + (   -0.48868452275874) * _TEMP * _16_3;
_LP0 = _LP0 + (   -0.47818270496821) * _TEMP * _16_4;
_LP0 = _LP0 + (   -0.97732618505089) * _TEMP * _16_5;
_LP0 = _LP0 + (   -0.76235371002566) * _TEMP * _16_6;
_LP0 = _LP0 + (   -0.06176798843746) * _TEMP * _16_7;
_LP0 = _LP0 + (   -0.36783009575746) * _TEMP * _16_8;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    2.27376799087472) * _TEMP * _17_0;
_LP0 = _LP0 + (    1.66840677656296) * _TEMP * _17_1;
_LP0 = _LP0 + (    1.58394582906104) * _TEMP * _17_2;
_LP0 = _LP0 + (    0.81992790457539) * _TEMP * _17_3;
_LP0 = _LP0 + (   -0.09864306453973) * _TEMP * _17_4;
_LP0 = _LP0 + (   -0.23893324542319) * _TEMP * _17_5;
_LP0 = _LP0 + (   -0.78852448679899) * _TEMP * _17_6;
_LP0 = _LP0 + (   -0.94445512442103) * _TEMP * _17_7;
_LP0 = _LP0 + (   -2.02058858598198) * _TEMP * _17_8;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -1.74663497603269) + _LP0);
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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop _2_0 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop _3_0 _3_1 _3_2 _3_3 _3_4 _3_5 _3_6 _3_7 _3_8 ;
*** encoding is sparse, initialize to zero;
_3_0 = 0;
_3_1 = 0;
_3_2 = 0;
_3_3 = 0;
_3_4 = 0;
_3_5 = 0;
_3_6 = 0;
_3_7 = 0;
_3_8 = 0;
if missing( GRP_Frq ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   _3_3 = .;
   _3_4 = .;
   _3_5 = .;
   _3_6 = .;
   _3_7 = .;
   _3_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _3_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _3_0 = -1;
                  _3_1 = -1;
                  _3_2 = -1;
                  _3_3 = -1;
                  _3_4 = -1;
                  _3_5 = -1;
                  _3_6 = -1;
                  _3_7 = -1;
                  _3_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _3_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _3_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _3_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _3_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _3_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _3_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _3_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _3_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      _3_3 = .;
      _3_4 = .;
      _3_5 = .;
      _3_6 = .;
      _3_7 = .;
      _3_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop _4_0 _4_1 _4_2 _4_3 _4_4 _4_5 _4_6 _4_7 _4_8 ;
*** encoding is sparse, initialize to zero;
_4_0 = 0;
_4_1 = 0;
_4_2 = 0;
_4_3 = 0;
_4_4 = 0;
_4_5 = 0;
_4_6 = 0;
_4_7 = 0;
_4_8 = 0;
if missing( GRP_Income ) then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   _4_3 = .;
   _4_4 = .;
   _4_5 = .;
   _4_6 = .;
   _4_7 = .;
   _4_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _4_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _4_0 = -1;
                  _4_1 = -1;
                  _4_2 = -1;
                  _4_3 = -1;
                  _4_4 = -1;
                  _4_5 = -1;
                  _4_6 = -1;
                  _4_7 = -1;
                  _4_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _4_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _4_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _4_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _4_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _4_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _4_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _4_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _4_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _4_0 = .;
      _4_1 = .;
      _4_2 = .;
      _4_3 = .;
      _4_4 = .;
      _4_5 = .;
      _4_6 = .;
      _4_7 = .;
      _4_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop _6_0 _6_1 _6_2 _6_3 _6_4 _6_5 _6_6 _6_7 ;
*** encoding is sparse, initialize to zero;
_6_0 = 0;
_6_1 = 0;
_6_2 = 0;
_6_3 = 0;
_6_4 = 0;
_6_5 = 0;
_6_6 = 0;
_6_7 = 0;
if missing( GRP_MntFishProducts ) then do;
   _6_0 = .;
   _6_1 = .;
   _6_2 = .;
   _6_3 = .;
   _6_4 = .;
   _6_5 = .;
   _6_6 = .;
   _6_7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _6_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _6_0 = -1;
                  _6_1 = -1;
                  _6_2 = -1;
                  _6_3 = -1;
                  _6_4 = -1;
                  _6_5 = -1;
                  _6_6 = -1;
                  _6_7 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               _6_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _6_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _6_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _6_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _6_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _6_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _6_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _6_0 = .;
      _6_1 = .;
      _6_2 = .;
      _6_3 = .;
      _6_4 = .;
      _6_5 = .;
      _6_6 = .;
      _6_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop _8_0 _8_1 _8_2 _8_3 _8_4 _8_5 _8_6 _8_7 _8_8 ;
*** encoding is sparse, initialize to zero;
_8_0 = 0;
_8_1 = 0;
_8_2 = 0;
_8_3 = 0;
_8_4 = 0;
_8_5 = 0;
_8_6 = 0;
_8_7 = 0;
_8_8 = 0;
if missing( GRP_MntMeatProducts ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   _8_3 = .;
   _8_4 = .;
   _8_5 = .;
   _8_6 = .;
   _8_7 = .;
   _8_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _8_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _8_0 = -1;
                  _8_1 = -1;
                  _8_2 = -1;
                  _8_3 = -1;
                  _8_4 = -1;
                  _8_5 = -1;
                  _8_6 = -1;
                  _8_7 = -1;
                  _8_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _8_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _8_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _8_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _8_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _8_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _8_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _8_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _8_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      _8_3 = .;
      _8_4 = .;
      _8_5 = .;
      _8_6 = .;
      _8_7 = .;
      _8_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop _9_0 _9_1 _9_2 _9_3 _9_4 _9_5 _9_6 _9_7 ;
*** encoding is sparse, initialize to zero;
_9_0 = 0;
_9_1 = 0;
_9_2 = 0;
_9_3 = 0;
_9_4 = 0;
_9_5 = 0;
_9_6 = 0;
_9_7 = 0;
if missing( GRP_MntSweetProducts ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   _9_3 = .;
   _9_4 = .;
   _9_5 = .;
   _9_6 = .;
   _9_7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _9_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _9_0 = -1;
                  _9_1 = -1;
                  _9_2 = -1;
                  _9_3 = -1;
                  _9_4 = -1;
                  _9_5 = -1;
                  _9_6 = -1;
                  _9_7 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               _9_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _9_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _9_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _9_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _9_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _9_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _9_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      _9_3 = .;
      _9_4 = .;
      _9_5 = .;
      _9_6 = .;
      _9_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop _10_0 _10_1 _10_2 _10_3 _10_4 _10_5 _10_6 _10_7 _10_8 ;
*** encoding is sparse, initialize to zero;
_10_0 = 0;
_10_1 = 0;
_10_2 = 0;
_10_3 = 0;
_10_4 = 0;
_10_5 = 0;
_10_6 = 0;
_10_7 = 0;
_10_8 = 0;
if missing( GRP_MntWines ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   _10_3 = .;
   _10_4 = .;
   _10_5 = .;
   _10_6 = .;
   _10_7 = .;
   _10_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _10_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _10_0 = -1;
                  _10_1 = -1;
                  _10_2 = -1;
                  _10_3 = -1;
                  _10_4 = -1;
                  _10_5 = -1;
                  _10_6 = -1;
                  _10_7 = -1;
                  _10_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _10_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _10_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _10_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _10_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _10_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _10_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _10_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _10_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      _10_3 = .;
      _10_4 = .;
      _10_5 = .;
      _10_6 = .;
      _10_7 = .;
      _10_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop _11_0 _11_1 _11_2 _11_3 _11_4 ;
*** encoding is sparse, initialize to zero;
_11_0 = 0;
_11_1 = 0;
_11_2 = 0;
_11_3 = 0;
_11_4 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   _11_0 = .;
   _11_1 = .;
   _11_2 = .;
   _11_3 = .;
   _11_4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            _11_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _11_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            _11_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _11_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _11_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _11_0 = -1;
            _11_1 = -1;
            _11_2 = -1;
            _11_3 = -1;
            _11_4 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _11_0 = .;
      _11_1 = .;
      _11_2 = .;
      _11_3 = .;
      _11_4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop _14_0 _14_1 _14_2 _14_3 _14_4 _14_5 _14_6 ;
*** encoding is sparse, initialize to zero;
_14_0 = 0;
_14_1 = 0;
_14_2 = 0;
_14_3 = 0;
_14_4 = 0;
_14_5 = 0;
_14_6 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   _14_0 = .;
   _14_1 = .;
   _14_2 = .;
   _14_3 = .;
   _14_4 = .;
   _14_5 = .;
   _14_6 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            _14_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               _14_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _14_2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _14_3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _14_4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _14_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _14_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _14_0 = -1;
               _14_1 = -1;
               _14_2 = -1;
               _14_3 = -1;
               _14_4 = -1;
               _14_5 = -1;
               _14_6 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _14_0 = .;
      _14_1 = .;
      _14_2 = .;
      _14_3 = .;
      _14_4 = .;
      _14_5 = .;
      _14_6 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop _16_0 _16_1 _16_2 _16_3 _16_4 _16_5 _16_6 _16_7 _16_8 ;
*** encoding is sparse, initialize to zero;
_16_0 = 0;
_16_1 = 0;
_16_2 = 0;
_16_3 = 0;
_16_4 = 0;
_16_5 = 0;
_16_6 = 0;
_16_7 = 0;
_16_8 = 0;
if missing( GRP_RMntFrq ) then do;
   _16_0 = .;
   _16_1 = .;
   _16_2 = .;
   _16_3 = .;
   _16_4 = .;
   _16_5 = .;
   _16_6 = .;
   _16_7 = .;
   _16_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _16_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _16_0 = -1;
                  _16_1 = -1;
                  _16_2 = -1;
                  _16_3 = -1;
                  _16_4 = -1;
                  _16_5 = -1;
                  _16_6 = -1;
                  _16_7 = -1;
                  _16_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _16_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _16_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _16_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _16_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _16_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _16_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _16_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _16_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _16_0 = .;
      _16_1 = .;
      _16_2 = .;
      _16_3 = .;
      _16_4 = .;
      _16_5 = .;
      _16_6 = .;
      _16_7 = .;
      _16_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop _17_0 _17_1 _17_2 _17_3 _17_4 _17_5 _17_6 _17_7 _17_8 ;
*** encoding is sparse, initialize to zero;
_17_0 = 0;
_17_1 = 0;
_17_2 = 0;
_17_3 = 0;
_17_4 = 0;
_17_5 = 0;
_17_6 = 0;
_17_7 = 0;
_17_8 = 0;
if missing( GRP_Recency ) then do;
   _17_0 = .;
   _17_1 = .;
   _17_2 = .;
   _17_3 = .;
   _17_4 = .;
   _17_5 = .;
   _17_6 = .;
   _17_7 = .;
   _17_8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               _17_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _17_0 = -1;
                  _17_1 = -1;
                  _17_2 = -1;
                  _17_3 = -1;
                  _17_4 = -1;
                  _17_5 = -1;
                  _17_6 = -1;
                  _17_7 = -1;
                  _17_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _17_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _17_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _17_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _17_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _17_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _17_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _17_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _17_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _17_0 = .;
      _17_1 = .;
      _17_2 = .;
      _17_3 = .;
      _17_4 = .;
      _17_5 = .;
      _17_6 = .;
      _17_7 = .;
      _17_8 = .;
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
_LP0 = _LP0 + (    -0.7446790765921) * _TEMP * _1_0;

***  Effect: GRP_AcceptedCmpTotal ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.47644515097353) * _TEMP * _2_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (    1.60669977062618) * _TEMP * _3_0;
_LP0 = _LP0 + (    2.43462608830259) * _TEMP * _3_1;
_LP0 = _LP0 + (     2.0853454925309) * _TEMP * _3_2;
_LP0 = _LP0 + (    1.39670974961972) * _TEMP * _3_3;
_LP0 = _LP0 + (    0.42808058742905) * _TEMP * _3_4;
_LP0 = _LP0 + (   -0.71021933964392) * _TEMP * _3_5;
_LP0 = _LP0 + (   -0.48135407112575) * _TEMP * _3_6;
_LP0 = _LP0 + (   -1.63572249476541) * _TEMP * _3_7;
_LP0 = _LP0 + (   -1.72256503137932) * _TEMP * _3_8;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (    -1.1068873777974) * _TEMP * _4_0;
_LP0 = _LP0 + (    -0.9547086898092) * _TEMP * _4_1;
_LP0 = _LP0 + (   -0.31212332505455) * _TEMP * _4_2;
_LP0 = _LP0 + (     0.4494292325574) * _TEMP * _4_3;
_LP0 = _LP0 + (    0.32802633763272) * _TEMP * _4_4;
_LP0 = _LP0 + (   -0.19075671306322) * _TEMP * _4_5;
_LP0 = _LP0 + (   -0.77559003357315) * _TEMP * _4_6;
_LP0 = _LP0 + (    0.18603490415793) * _TEMP * _4_7;
_LP0 = _LP0 + (    0.63801918363541) * _TEMP * _4_8;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.95284156310019) * _TEMP * _6_0;
_LP0 = _LP0 + (    0.26502435397607) * _TEMP * _6_1;
_LP0 = _LP0 + (    0.17695765630059) * _TEMP * _6_2;
_LP0 = _LP0 + (   -0.14572197867389) * _TEMP * _6_3;
_LP0 = _LP0 + (    0.01505271297294) * _TEMP * _6_4;
_LP0 = _LP0 + (    0.54563980035699) * _TEMP * _6_5;
_LP0 = _LP0 + (   -0.52118071899185) * _TEMP * _6_6;
_LP0 = _LP0 + (    -0.4363500869228) * _TEMP * _6_7;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -8.31770021190691) * _TEMP * _8_0;
_LP0 = _LP0 + (   -4.36624878948483) * _TEMP * _8_1;
_LP0 = _LP0 + (   -3.04851308469506) * _TEMP * _8_2;
_LP0 = _LP0 + (   -1.48432419417486) * _TEMP * _8_3;
_LP0 = _LP0 + (    0.88788868200015) * _TEMP * _8_4;
_LP0 = _LP0 + (    1.33039344853623) * _TEMP * _8_5;
_LP0 = _LP0 + (    2.74637356935852) * _TEMP * _8_6;
_LP0 = _LP0 + (    2.83781421974894) * _TEMP * _8_7;
_LP0 = _LP0 + (    4.06889115404295) * _TEMP * _8_8;

***  Effect: GRP_MntSweetProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.30891510159184) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.71823102140593) * _TEMP * _9_1;
_LP0 = _LP0 + (    0.40751268124015) * _TEMP * _9_2;
_LP0 = _LP0 + (    -0.0500970886438) * _TEMP * _9_3;
_LP0 = _LP0 + (    0.75914971161272) * _TEMP * _9_4;
_LP0 = _LP0 + (   -0.27777464352641) * _TEMP * _9_5;
_LP0 = _LP0 + (   -0.19862700981974) * _TEMP * _9_6;
_LP0 = _LP0 + (   -0.38787782785805) * _TEMP * _9_7;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    3.97976057988328) * _TEMP * _10_0;
_LP0 = _LP0 + (     2.7500535043595) * _TEMP * _10_1;
_LP0 = _LP0 + (    2.23351774782852) * _TEMP * _10_2;
_LP0 = _LP0 + (     1.7536016671876) * _TEMP * _10_3;
_LP0 = _LP0 + (     0.1640545854573) * _TEMP * _10_4;
_LP0 = _LP0 + (   -0.36967718483959) * _TEMP * _10_5;
_LP0 = _LP0 + (   -1.60242387302593) * _TEMP * _10_6;
_LP0 = _LP0 + (   -2.18568823441387) * _TEMP * _10_7;
_LP0 = _LP0 + (   -3.01781681630858) * _TEMP * _10_8;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -6.23994183900208) * _TEMP * _11_0;
_LP0 = _LP0 + (   -2.68869740629193) * _TEMP * _11_1;
_LP0 = _LP0 + (   -0.15877773244651) * _TEMP * _11_2;
_LP0 = _LP0 + (    1.53123175936135) * _TEMP * _11_3;
_LP0 = _LP0 + (    2.69517926058072) * _TEMP * _11_4;

***  Effect: GRP_NumWebVisitsMonth ;
_TEMP = 1;
_LP0 = _LP0 + (    -3.3002412240753) * _TEMP * _14_0;
_LP0 = _LP0 + (   -2.20033226941868) * _TEMP * _14_1;
_LP0 = _LP0 + (   -1.72135475558275) * _TEMP * _14_2;
_LP0 = _LP0 + (   -0.69842997035409) * _TEMP * _14_3;
_LP0 = _LP0 + (    0.59993420393711) * _TEMP * _14_4;
_LP0 = _LP0 + (    0.72581883605563) * _TEMP * _14_5;
_LP0 = _LP0 + (    2.32956561429985) * _TEMP * _14_6;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (    2.78248187088817) * _TEMP * _16_0;
_LP0 = _LP0 + (    1.57916958099666) * _TEMP * _16_1;
_LP0 = _LP0 + (    0.80760708078323) * _TEMP * _16_2;
_LP0 = _LP0 + (   -0.84109819008678) * _TEMP * _16_3;
_LP0 = _LP0 + (   -0.83990394353114) * _TEMP * _16_4;
_LP0 = _LP0 + (   -1.88920830968665) * _TEMP * _16_5;
_LP0 = _LP0 + (   -1.53102493561927) * _TEMP * _16_6;
_LP0 = _LP0 + (   -0.00003768720234) * _TEMP * _16_7;
_LP0 = _LP0 + (   -0.59460667119256) * _TEMP * _16_8;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    4.15436119707335) * _TEMP * _17_0;
_LP0 = _LP0 + (    3.08080497220808) * _TEMP * _17_1;
_LP0 = _LP0 + (    2.90742407234312) * _TEMP * _17_2;
_LP0 = _LP0 + (    1.50207200800462) * _TEMP * _17_3;
_LP0 = _LP0 + (   -0.21286194047464) * _TEMP * _17_4;
_LP0 = _LP0 + (    -0.3852938818758) * _TEMP * _17_5;
_LP0 = _LP0 + (   -1.39433099504826) * _TEMP * _17_6;
_LP0 = _LP0 + (   -1.80436921997444) * _TEMP * _17_7;
_LP0 = _LP0 + (   -3.75257988441601) * _TEMP * _17_8;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -3.20489068488757 + _LP0;
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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_AcceptedCmpTotal3 = 'Dummy: GRP_AcceptedCmpTotal=3' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Frq5 = 'Dummy: GRP_Frq=5' ;

      label GRP_Frq6 = 'Dummy: GRP_Frq=6' ;

      label GRP_Frq7 = 'Dummy: GRP_Frq=7' ;

      label GRP_Frq8 = 'Dummy: GRP_Frq=8' ;

      label GRP_Frq9 = 'Dummy: GRP_Frq=9' ;

      label GRP_Frq10 = 'Dummy: GRP_Frq=10' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Income5 = 'Dummy: GRP_Income=5' ;

      label GRP_Income6 = 'Dummy: GRP_Income=6' ;

      label GRP_Income7 = 'Dummy: GRP_Income=7' ;

      label GRP_Income8 = 'Dummy: GRP_Income=8' ;

      label GRP_Income9 = 'Dummy: GRP_Income=9' ;

      label GRP_Income10 = 'Dummy: GRP_Income=10' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_Mnt5 = 'Dummy: GRP_Mnt=5' ;

      label GRP_Mnt6 = 'Dummy: GRP_Mnt=6' ;

      label GRP_Mnt7 = 'Dummy: GRP_Mnt=7' ;

      label GRP_Mnt8 = 'Dummy: GRP_Mnt=8' ;

      label GRP_Mnt9 = 'Dummy: GRP_Mnt=9' ;

      label GRP_Mnt10 = 'Dummy: GRP_Mnt=10' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntFishProducts5 = 'Dummy: GRP_MntFishProducts=5' ;

      label GRP_MntFishProducts6 = 'Dummy: GRP_MntFishProducts=6' ;

      label GRP_MntFishProducts7 = 'Dummy: GRP_MntFishProducts=7' ;

      label GRP_MntFishProducts8 = 'Dummy: GRP_MntFishProducts=8' ;

      label GRP_MntFishProducts9 = 'Dummy: GRP_MntFishProducts=9' ;

      label GRP_MntFishProducts10 = 'Dummy: GRP_MntFishProducts=10' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntGoldProds5 = 'Dummy: GRP_MntGoldProds=5' ;

      label GRP_MntGoldProds6 = 'Dummy: GRP_MntGoldProds=6' ;

      label GRP_MntGoldProds7 = 'Dummy: GRP_MntGoldProds=7' ;

      label GRP_MntGoldProds8 = 'Dummy: GRP_MntGoldProds=8' ;

      label GRP_MntGoldProds9 = 'Dummy: GRP_MntGoldProds=9' ;

      label GRP_MntGoldProds10 = 'Dummy: GRP_MntGoldProds=10' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntMeatProducts5 = 'Dummy: GRP_MntMeatProducts=5' ;

      label GRP_MntMeatProducts6 = 'Dummy: GRP_MntMeatProducts=6' ;

      label GRP_MntMeatProducts7 = 'Dummy: GRP_MntMeatProducts=7' ;

      label GRP_MntMeatProducts8 = 'Dummy: GRP_MntMeatProducts=8' ;

      label GRP_MntMeatProducts9 = 'Dummy: GRP_MntMeatProducts=9' ;

      label GRP_MntMeatProducts10 = 'Dummy: GRP_MntMeatProducts=10' ;

      label GRP_MntSweetProducts3 = 'Dummy: GRP_MntSweetProducts=3' ;

      label GRP_MntSweetProducts4 = 'Dummy: GRP_MntSweetProducts=4' ;

      label GRP_MntSweetProducts5 = 'Dummy: GRP_MntSweetProducts=5' ;

      label GRP_MntSweetProducts6 = 'Dummy: GRP_MntSweetProducts=6' ;

      label GRP_MntSweetProducts7 = 'Dummy: GRP_MntSweetProducts=7' ;

      label GRP_MntSweetProducts8 = 'Dummy: GRP_MntSweetProducts=8' ;

      label GRP_MntSweetProducts9 = 'Dummy: GRP_MntSweetProducts=9' ;

      label GRP_MntSweetProducts10 = 'Dummy: GRP_MntSweetProducts=10' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_MntWines5 = 'Dummy: GRP_MntWines=5' ;

      label GRP_MntWines6 = 'Dummy: GRP_MntWines=6' ;

      label GRP_MntWines7 = 'Dummy: GRP_MntWines=7' ;

      label GRP_MntWines8 = 'Dummy: GRP_MntWines=8' ;

      label GRP_MntWines9 = 'Dummy: GRP_MntWines=9' ;

      label GRP_MntWines10 = 'Dummy: GRP_MntWines=10' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumCatalogPurchases5 = 'Dummy: GRP_NumCatalogPurchases=5' ;

      label GRP_NumCatalogPurchases6 = 'Dummy: GRP_NumCatalogPurchases=6' ;

      label GRP_NumCatalogPurchases7 = 'Dummy: GRP_NumCatalogPurchases=7' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumDistPurchases5 = 'Dummy: GRP_NumDistPurchases=5' ;

      label GRP_NumDistPurchases6 = 'Dummy: GRP_NumDistPurchases=6' ;

      label GRP_NumDistPurchases7 = 'Dummy: GRP_NumDistPurchases=7' ;

      label GRP_NumDistPurchases8 = 'Dummy: GRP_NumDistPurchases=8' ;

      label GRP_NumDistPurchases9 = 'Dummy: GRP_NumDistPurchases=9' ;

      label GRP_NumDistPurchases10 = 'Dummy: GRP_NumDistPurchases=10' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_NumWebPurchases5 = 'Dummy: GRP_NumWebPurchases=5' ;

      label GRP_NumWebPurchases6 = 'Dummy: GRP_NumWebPurchases=6' ;

      label GRP_NumWebPurchases7 = 'Dummy: GRP_NumWebPurchases=7' ;

      label GRP_NumWebPurchases8 = 'Dummy: GRP_NumWebPurchases=8' ;

      label GRP_NumWebVisitsMonth2 = 'Dummy: GRP_NumWebVisitsMonth=2' ;

      label GRP_NumWebVisitsMonth3 = 'Dummy: GRP_NumWebVisitsMonth=3' ;

      label GRP_NumWebVisitsMonth4 = 'Dummy: GRP_NumWebVisitsMonth=4' ;

      label GRP_NumWebVisitsMonth5 = 'Dummy: GRP_NumWebVisitsMonth=5' ;

      label GRP_NumWebVisitsMonth6 = 'Dummy: GRP_NumWebVisitsMonth=6' ;

      label GRP_NumWebVisitsMonth7 = 'Dummy: GRP_NumWebVisitsMonth=7' ;

      label GRP_NumWebVisitsMonth8 = 'Dummy: GRP_NumWebVisitsMonth=8' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RFMstat5 = 'Dummy: GRP_RFMstat=5' ;

      label GRP_RFMstat6 = 'Dummy: GRP_RFMstat=6' ;

      label GRP_RFMstat7 = 'Dummy: GRP_RFMstat=7' ;

      label GRP_RFMstat8 = 'Dummy: GRP_RFMstat=8' ;

      label GRP_RFMstat9 = 'Dummy: GRP_RFMstat=9' ;

      label GRP_RFMstat10 = 'Dummy: GRP_RFMstat=10' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq5 = 'Dummy: GRP_RMntFrq=5' ;

      label GRP_RMntFrq6 = 'Dummy: GRP_RMntFrq=6' ;

      label GRP_RMntFrq7 = 'Dummy: GRP_RMntFrq=7' ;

      label GRP_RMntFrq8 = 'Dummy: GRP_RMntFrq=8' ;

      label GRP_RMntFrq9 = 'Dummy: GRP_RMntFrq=9' ;

      label GRP_RMntFrq10 = 'Dummy: GRP_RMntFrq=10' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label GRP_Recency5 = 'Dummy: GRP_Recency=5' ;

      label GRP_Recency6 = 'Dummy: GRP_Recency=6' ;

      label GRP_Recency7 = 'Dummy: GRP_Recency=7' ;

      label GRP_Recency8 = 'Dummy: GRP_Recency=8' ;

      label GRP_Recency9 = 'Dummy: GRP_Recency=9' ;

      label GRP_Recency10 = 'Dummy: GRP_Recency=10' ;

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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop GRP_AcceptedCmpTotal3 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   GRP_AcceptedCmpTotal3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_AcceptedCmpTotal3 = 1;
   end;
   else if _dm12 = '4'  then do;
      GRP_AcceptedCmpTotal3 = -1;
   end;
   else do;
      GRP_AcceptedCmpTotal3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 GRP_Frq5 GRP_Frq6 GRP_Frq7 GRP_Frq8 GRP_Frq9
        GRP_Frq10 ;
*** encoding is sparse, initialize to zero;
GRP_Frq2 = 0;
GRP_Frq3 = 0;
GRP_Frq4 = 0;
GRP_Frq5 = 0;
GRP_Frq6 = 0;
GRP_Frq7 = 0;
GRP_Frq8 = 0;
GRP_Frq9 = 0;
GRP_Frq10 = 0;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   GRP_Frq5 = .;
   GRP_Frq6 = .;
   GRP_Frq7 = .;
   GRP_Frq8 = .;
   GRP_Frq9 = .;
   GRP_Frq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Frq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Frq2 = -1;
                  GRP_Frq3 = -1;
                  GRP_Frq4 = -1;
                  GRP_Frq5 = -1;
                  GRP_Frq6 = -1;
                  GRP_Frq7 = -1;
                  GRP_Frq8 = -1;
                  GRP_Frq9 = -1;
                  GRP_Frq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Frq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Frq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Frq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Frq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Frq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Frq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Frq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Frq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      GRP_Frq5 = .;
      GRP_Frq6 = .;
      GRP_Frq7 = .;
      GRP_Frq8 = .;
      GRP_Frq9 = .;
      GRP_Frq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 GRP_Income5 GRP_Income6 GRP_Income7
        GRP_Income8 GRP_Income9 GRP_Income10 ;
*** encoding is sparse, initialize to zero;
GRP_Income2 = 0;
GRP_Income3 = 0;
GRP_Income4 = 0;
GRP_Income5 = 0;
GRP_Income6 = 0;
GRP_Income7 = 0;
GRP_Income8 = 0;
GRP_Income9 = 0;
GRP_Income10 = 0;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   GRP_Income5 = .;
   GRP_Income6 = .;
   GRP_Income7 = .;
   GRP_Income8 = .;
   GRP_Income9 = .;
   GRP_Income10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Income10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Income2 = -1;
                  GRP_Income3 = -1;
                  GRP_Income4 = -1;
                  GRP_Income5 = -1;
                  GRP_Income6 = -1;
                  GRP_Income7 = -1;
                  GRP_Income8 = -1;
                  GRP_Income9 = -1;
                  GRP_Income10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Income2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Income3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Income4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Income5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Income6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Income7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Income8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Income9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      GRP_Income5 = .;
      GRP_Income6 = .;
      GRP_Income7 = .;
      GRP_Income8 = .;
      GRP_Income9 = .;
      GRP_Income10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 GRP_Mnt5 GRP_Mnt6 GRP_Mnt7 GRP_Mnt8 GRP_Mnt9
        GRP_Mnt10 ;
*** encoding is sparse, initialize to zero;
GRP_Mnt2 = 0;
GRP_Mnt3 = 0;
GRP_Mnt4 = 0;
GRP_Mnt5 = 0;
GRP_Mnt6 = 0;
GRP_Mnt7 = 0;
GRP_Mnt8 = 0;
GRP_Mnt9 = 0;
GRP_Mnt10 = 0;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   GRP_Mnt5 = .;
   GRP_Mnt6 = .;
   GRP_Mnt7 = .;
   GRP_Mnt8 = .;
   GRP_Mnt9 = .;
   GRP_Mnt10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Mnt10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Mnt2 = -1;
                  GRP_Mnt3 = -1;
                  GRP_Mnt4 = -1;
                  GRP_Mnt5 = -1;
                  GRP_Mnt6 = -1;
                  GRP_Mnt7 = -1;
                  GRP_Mnt8 = -1;
                  GRP_Mnt9 = -1;
                  GRP_Mnt10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Mnt2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Mnt3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Mnt4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Mnt5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Mnt6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Mnt7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Mnt8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Mnt9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      GRP_Mnt5 = .;
      GRP_Mnt6 = .;
      GRP_Mnt7 = .;
      GRP_Mnt8 = .;
      GRP_Mnt9 = .;
      GRP_Mnt10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts3 GRP_MntFishProducts4 GRP_MntFishProducts5
        GRP_MntFishProducts6 GRP_MntFishProducts7 GRP_MntFishProducts8
        GRP_MntFishProducts9 GRP_MntFishProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntFishProducts3 = 0;
GRP_MntFishProducts4 = 0;
GRP_MntFishProducts5 = 0;
GRP_MntFishProducts6 = 0;
GRP_MntFishProducts7 = 0;
GRP_MntFishProducts8 = 0;
GRP_MntFishProducts9 = 0;
GRP_MntFishProducts10 = 0;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   GRP_MntFishProducts5 = .;
   GRP_MntFishProducts6 = .;
   GRP_MntFishProducts7 = .;
   GRP_MntFishProducts8 = .;
   GRP_MntFishProducts9 = .;
   GRP_MntFishProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntFishProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntFishProducts3 = -1;
                  GRP_MntFishProducts4 = -1;
                  GRP_MntFishProducts5 = -1;
                  GRP_MntFishProducts6 = -1;
                  GRP_MntFishProducts7 = -1;
                  GRP_MntFishProducts8 = -1;
                  GRP_MntFishProducts9 = -1;
                  GRP_MntFishProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntFishProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntFishProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntFishProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntFishProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntFishProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntFishProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntFishProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      GRP_MntFishProducts5 = .;
      GRP_MntFishProducts6 = .;
      GRP_MntFishProducts7 = .;
      GRP_MntFishProducts8 = .;
      GRP_MntFishProducts9 = .;
      GRP_MntFishProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 GRP_MntGoldProds5
        GRP_MntGoldProds6 GRP_MntGoldProds7 GRP_MntGoldProds8
        GRP_MntGoldProds9 GRP_MntGoldProds10 ;
*** encoding is sparse, initialize to zero;
GRP_MntGoldProds2 = 0;
GRP_MntGoldProds3 = 0;
GRP_MntGoldProds4 = 0;
GRP_MntGoldProds5 = 0;
GRP_MntGoldProds6 = 0;
GRP_MntGoldProds7 = 0;
GRP_MntGoldProds8 = 0;
GRP_MntGoldProds9 = 0;
GRP_MntGoldProds10 = 0;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   GRP_MntGoldProds5 = .;
   GRP_MntGoldProds6 = .;
   GRP_MntGoldProds7 = .;
   GRP_MntGoldProds8 = .;
   GRP_MntGoldProds9 = .;
   GRP_MntGoldProds10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntGoldProds10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntGoldProds2 = -1;
                  GRP_MntGoldProds3 = -1;
                  GRP_MntGoldProds4 = -1;
                  GRP_MntGoldProds5 = -1;
                  GRP_MntGoldProds6 = -1;
                  GRP_MntGoldProds7 = -1;
                  GRP_MntGoldProds8 = -1;
                  GRP_MntGoldProds9 = -1;
                  GRP_MntGoldProds10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntGoldProds2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntGoldProds3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntGoldProds4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntGoldProds5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntGoldProds6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntGoldProds7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntGoldProds8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntGoldProds9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      GRP_MntGoldProds5 = .;
      GRP_MntGoldProds6 = .;
      GRP_MntGoldProds7 = .;
      GRP_MntGoldProds8 = .;
      GRP_MntGoldProds9 = .;
      GRP_MntGoldProds10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4
        GRP_MntMeatProducts5 GRP_MntMeatProducts6 GRP_MntMeatProducts7
        GRP_MntMeatProducts8 GRP_MntMeatProducts9 GRP_MntMeatProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntMeatProducts2 = 0;
GRP_MntMeatProducts3 = 0;
GRP_MntMeatProducts4 = 0;
GRP_MntMeatProducts5 = 0;
GRP_MntMeatProducts6 = 0;
GRP_MntMeatProducts7 = 0;
GRP_MntMeatProducts8 = 0;
GRP_MntMeatProducts9 = 0;
GRP_MntMeatProducts10 = 0;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   GRP_MntMeatProducts5 = .;
   GRP_MntMeatProducts6 = .;
   GRP_MntMeatProducts7 = .;
   GRP_MntMeatProducts8 = .;
   GRP_MntMeatProducts9 = .;
   GRP_MntMeatProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntMeatProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntMeatProducts2 = -1;
                  GRP_MntMeatProducts3 = -1;
                  GRP_MntMeatProducts4 = -1;
                  GRP_MntMeatProducts5 = -1;
                  GRP_MntMeatProducts6 = -1;
                  GRP_MntMeatProducts7 = -1;
                  GRP_MntMeatProducts8 = -1;
                  GRP_MntMeatProducts9 = -1;
                  GRP_MntMeatProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntMeatProducts2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntMeatProducts3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntMeatProducts4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntMeatProducts5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntMeatProducts6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntMeatProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntMeatProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntMeatProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      GRP_MntMeatProducts5 = .;
      GRP_MntMeatProducts6 = .;
      GRP_MntMeatProducts7 = .;
      GRP_MntMeatProducts8 = .;
      GRP_MntMeatProducts9 = .;
      GRP_MntMeatProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop GRP_MntSweetProducts3 GRP_MntSweetProducts4 GRP_MntSweetProducts5
        GRP_MntSweetProducts6 GRP_MntSweetProducts7 GRP_MntSweetProducts8
        GRP_MntSweetProducts9 GRP_MntSweetProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntSweetProducts3 = 0;
GRP_MntSweetProducts4 = 0;
GRP_MntSweetProducts5 = 0;
GRP_MntSweetProducts6 = 0;
GRP_MntSweetProducts7 = 0;
GRP_MntSweetProducts8 = 0;
GRP_MntSweetProducts9 = 0;
GRP_MntSweetProducts10 = 0;
if missing( GRP_MntSweetProducts ) then do;
   GRP_MntSweetProducts3 = .;
   GRP_MntSweetProducts4 = .;
   GRP_MntSweetProducts5 = .;
   GRP_MntSweetProducts6 = .;
   GRP_MntSweetProducts7 = .;
   GRP_MntSweetProducts8 = .;
   GRP_MntSweetProducts9 = .;
   GRP_MntSweetProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntSweetProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntSweetProducts3 = -1;
                  GRP_MntSweetProducts4 = -1;
                  GRP_MntSweetProducts5 = -1;
                  GRP_MntSweetProducts6 = -1;
                  GRP_MntSweetProducts7 = -1;
                  GRP_MntSweetProducts8 = -1;
                  GRP_MntSweetProducts9 = -1;
                  GRP_MntSweetProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntSweetProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntSweetProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntSweetProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntSweetProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntSweetProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntSweetProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntSweetProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntSweetProducts3 = .;
      GRP_MntSweetProducts4 = .;
      GRP_MntSweetProducts5 = .;
      GRP_MntSweetProducts6 = .;
      GRP_MntSweetProducts7 = .;
      GRP_MntSweetProducts8 = .;
      GRP_MntSweetProducts9 = .;
      GRP_MntSweetProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 GRP_MntWines5 GRP_MntWines6
        GRP_MntWines7 GRP_MntWines8 GRP_MntWines9 GRP_MntWines10 ;
*** encoding is sparse, initialize to zero;
GRP_MntWines2 = 0;
GRP_MntWines3 = 0;
GRP_MntWines4 = 0;
GRP_MntWines5 = 0;
GRP_MntWines6 = 0;
GRP_MntWines7 = 0;
GRP_MntWines8 = 0;
GRP_MntWines9 = 0;
GRP_MntWines10 = 0;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   GRP_MntWines5 = .;
   GRP_MntWines6 = .;
   GRP_MntWines7 = .;
   GRP_MntWines8 = .;
   GRP_MntWines9 = .;
   GRP_MntWines10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntWines10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntWines2 = -1;
                  GRP_MntWines3 = -1;
                  GRP_MntWines4 = -1;
                  GRP_MntWines5 = -1;
                  GRP_MntWines6 = -1;
                  GRP_MntWines7 = -1;
                  GRP_MntWines8 = -1;
                  GRP_MntWines9 = -1;
                  GRP_MntWines10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntWines2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntWines3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntWines4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntWines5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntWines6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntWines7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntWines8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntWines9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      GRP_MntWines5 = .;
      GRP_MntWines6 = .;
      GRP_MntWines7 = .;
      GRP_MntWines8 = .;
      GRP_MntWines9 = .;
      GRP_MntWines10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4
        GRP_NumCatalogPurchases5 GRP_NumCatalogPurchases6
        GRP_NumCatalogPurchases7 ;
*** encoding is sparse, initialize to zero;
GRP_NumCatalogPurchases3 = 0;
GRP_NumCatalogPurchases4 = 0;
GRP_NumCatalogPurchases5 = 0;
GRP_NumCatalogPurchases6 = 0;
GRP_NumCatalogPurchases7 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   GRP_NumCatalogPurchases5 = .;
   GRP_NumCatalogPurchases6 = .;
   GRP_NumCatalogPurchases7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            GRP_NumCatalogPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumCatalogPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_NumCatalogPurchases5 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumCatalogPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumCatalogPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumCatalogPurchases3 = -1;
            GRP_NumCatalogPurchases4 = -1;
            GRP_NumCatalogPurchases5 = -1;
            GRP_NumCatalogPurchases6 = -1;
            GRP_NumCatalogPurchases7 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      GRP_NumCatalogPurchases5 = .;
      GRP_NumCatalogPurchases6 = .;
      GRP_NumCatalogPurchases7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4
        GRP_NumDistPurchases5 GRP_NumDistPurchases6 GRP_NumDistPurchases7
        GRP_NumDistPurchases8 GRP_NumDistPurchases9 GRP_NumDistPurchases10 ;
*** encoding is sparse, initialize to zero;
GRP_NumDistPurchases2 = 0;
GRP_NumDistPurchases3 = 0;
GRP_NumDistPurchases4 = 0;
GRP_NumDistPurchases5 = 0;
GRP_NumDistPurchases6 = 0;
GRP_NumDistPurchases7 = 0;
GRP_NumDistPurchases8 = 0;
GRP_NumDistPurchases9 = 0;
GRP_NumDistPurchases10 = 0;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   GRP_NumDistPurchases5 = .;
   GRP_NumDistPurchases6 = .;
   GRP_NumDistPurchases7 = .;
   GRP_NumDistPurchases8 = .;
   GRP_NumDistPurchases9 = .;
   GRP_NumDistPurchases10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_NumDistPurchases10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_NumDistPurchases2 = -1;
                  GRP_NumDistPurchases3 = -1;
                  GRP_NumDistPurchases4 = -1;
                  GRP_NumDistPurchases5 = -1;
                  GRP_NumDistPurchases6 = -1;
                  GRP_NumDistPurchases7 = -1;
                  GRP_NumDistPurchases8 = -1;
                  GRP_NumDistPurchases9 = -1;
                  GRP_NumDistPurchases10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_NumDistPurchases2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_NumDistPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumDistPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_NumDistPurchases5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_NumDistPurchases6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumDistPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumDistPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumDistPurchases9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      GRP_NumDistPurchases5 = .;
      GRP_NumDistPurchases6 = .;
      GRP_NumDistPurchases7 = .;
      GRP_NumDistPurchases8 = .;
      GRP_NumDistPurchases9 = .;
      GRP_NumDistPurchases10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4
        GRP_NumWebPurchases5 GRP_NumWebPurchases6 GRP_NumWebPurchases7
        GRP_NumWebPurchases8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebPurchases2 = 0;
GRP_NumWebPurchases3 = 0;
GRP_NumWebPurchases4 = 0;
GRP_NumWebPurchases5 = 0;
GRP_NumWebPurchases6 = 0;
GRP_NumWebPurchases7 = 0;
GRP_NumWebPurchases8 = 0;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   GRP_NumWebPurchases5 = .;
   GRP_NumWebPurchases6 = .;
   GRP_NumWebPurchases7 = .;
   GRP_NumWebPurchases8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebPurchases2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebPurchases3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebPurchases4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebPurchases5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebPurchases2 = -1;
               GRP_NumWebPurchases3 = -1;
               GRP_NumWebPurchases4 = -1;
               GRP_NumWebPurchases5 = -1;
               GRP_NumWebPurchases6 = -1;
               GRP_NumWebPurchases7 = -1;
               GRP_NumWebPurchases8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      GRP_NumWebPurchases5 = .;
      GRP_NumWebPurchases6 = .;
      GRP_NumWebPurchases7 = .;
      GRP_NumWebPurchases8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop GRP_NumWebVisitsMonth2 GRP_NumWebVisitsMonth3 GRP_NumWebVisitsMonth4
        GRP_NumWebVisitsMonth5 GRP_NumWebVisitsMonth6 GRP_NumWebVisitsMonth7
        GRP_NumWebVisitsMonth8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebVisitsMonth2 = 0;
GRP_NumWebVisitsMonth3 = 0;
GRP_NumWebVisitsMonth4 = 0;
GRP_NumWebVisitsMonth5 = 0;
GRP_NumWebVisitsMonth6 = 0;
GRP_NumWebVisitsMonth7 = 0;
GRP_NumWebVisitsMonth8 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   GRP_NumWebVisitsMonth2 = .;
   GRP_NumWebVisitsMonth3 = .;
   GRP_NumWebVisitsMonth4 = .;
   GRP_NumWebVisitsMonth5 = .;
   GRP_NumWebVisitsMonth6 = .;
   GRP_NumWebVisitsMonth7 = .;
   GRP_NumWebVisitsMonth8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebVisitsMonth2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebVisitsMonth3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebVisitsMonth4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebVisitsMonth5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebVisitsMonth6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebVisitsMonth7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebVisitsMonth8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebVisitsMonth2 = -1;
               GRP_NumWebVisitsMonth3 = -1;
               GRP_NumWebVisitsMonth4 = -1;
               GRP_NumWebVisitsMonth5 = -1;
               GRP_NumWebVisitsMonth6 = -1;
               GRP_NumWebVisitsMonth7 = -1;
               GRP_NumWebVisitsMonth8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebVisitsMonth2 = .;
      GRP_NumWebVisitsMonth3 = .;
      GRP_NumWebVisitsMonth4 = .;
      GRP_NumWebVisitsMonth5 = .;
      GRP_NumWebVisitsMonth6 = .;
      GRP_NumWebVisitsMonth7 = .;
      GRP_NumWebVisitsMonth8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 GRP_RFMstat5 GRP_RFMstat6
        GRP_RFMstat7 GRP_RFMstat8 GRP_RFMstat9 GRP_RFMstat10 ;
*** encoding is sparse, initialize to zero;
GRP_RFMstat2 = 0;
GRP_RFMstat3 = 0;
GRP_RFMstat4 = 0;
GRP_RFMstat5 = 0;
GRP_RFMstat6 = 0;
GRP_RFMstat7 = 0;
GRP_RFMstat8 = 0;
GRP_RFMstat9 = 0;
GRP_RFMstat10 = 0;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   GRP_RFMstat5 = .;
   GRP_RFMstat6 = .;
   GRP_RFMstat7 = .;
   GRP_RFMstat8 = .;
   GRP_RFMstat9 = .;
   GRP_RFMstat10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RFMstat10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RFMstat2 = -1;
                  GRP_RFMstat3 = -1;
                  GRP_RFMstat4 = -1;
                  GRP_RFMstat5 = -1;
                  GRP_RFMstat6 = -1;
                  GRP_RFMstat7 = -1;
                  GRP_RFMstat8 = -1;
                  GRP_RFMstat9 = -1;
                  GRP_RFMstat10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RFMstat2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RFMstat3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RFMstat4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RFMstat5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RFMstat6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RFMstat7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RFMstat8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RFMstat9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      GRP_RFMstat5 = .;
      GRP_RFMstat6 = .;
      GRP_RFMstat7 = .;
      GRP_RFMstat8 = .;
      GRP_RFMstat9 = .;
      GRP_RFMstat10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 GRP_RMntFrq5 GRP_RMntFrq6
        GRP_RMntFrq7 GRP_RMntFrq8 GRP_RMntFrq9 GRP_RMntFrq10 ;
*** encoding is sparse, initialize to zero;
GRP_RMntFrq2 = 0;
GRP_RMntFrq3 = 0;
GRP_RMntFrq4 = 0;
GRP_RMntFrq5 = 0;
GRP_RMntFrq6 = 0;
GRP_RMntFrq7 = 0;
GRP_RMntFrq8 = 0;
GRP_RMntFrq9 = 0;
GRP_RMntFrq10 = 0;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   GRP_RMntFrq5 = .;
   GRP_RMntFrq6 = .;
   GRP_RMntFrq7 = .;
   GRP_RMntFrq8 = .;
   GRP_RMntFrq9 = .;
   GRP_RMntFrq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RMntFrq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RMntFrq2 = -1;
                  GRP_RMntFrq3 = -1;
                  GRP_RMntFrq4 = -1;
                  GRP_RMntFrq5 = -1;
                  GRP_RMntFrq6 = -1;
                  GRP_RMntFrq7 = -1;
                  GRP_RMntFrq8 = -1;
                  GRP_RMntFrq9 = -1;
                  GRP_RMntFrq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RMntFrq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RMntFrq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RMntFrq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RMntFrq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RMntFrq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RMntFrq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RMntFrq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RMntFrq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      GRP_RMntFrq5 = .;
      GRP_RMntFrq6 = .;
      GRP_RMntFrq7 = .;
      GRP_RMntFrq8 = .;
      GRP_RMntFrq9 = .;
      GRP_RMntFrq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 GRP_Recency5 GRP_Recency6
        GRP_Recency7 GRP_Recency8 GRP_Recency9 GRP_Recency10 ;
*** encoding is sparse, initialize to zero;
GRP_Recency2 = 0;
GRP_Recency3 = 0;
GRP_Recency4 = 0;
GRP_Recency5 = 0;
GRP_Recency6 = 0;
GRP_Recency7 = 0;
GRP_Recency8 = 0;
GRP_Recency9 = 0;
GRP_Recency10 = 0;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   GRP_Recency5 = .;
   GRP_Recency6 = .;
   GRP_Recency7 = .;
   GRP_Recency8 = .;
   GRP_Recency9 = .;
   GRP_Recency10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Recency10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Recency2 = -1;
                  GRP_Recency3 = -1;
                  GRP_Recency4 = -1;
                  GRP_Recency5 = -1;
                  GRP_Recency6 = -1;
                  GRP_Recency7 = -1;
                  GRP_Recency8 = -1;
                  GRP_Recency9 = -1;
                  GRP_Recency10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Recency2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Recency3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Recency4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Recency5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Recency6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Recency7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Recency8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Recency9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      GRP_Recency5 = .;
      GRP_Recency6 = .;
      GRP_Recency7 = .;
      GRP_Recency8 = .;
      GRP_Recency9 = .;
      GRP_Recency10 = .;
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
   H11  =     0.04300585332324 * S_Year_Birth ;
   H11  = H11  +    -0.25012801590724 * GRP_AcceptedCmp52
          +    -0.37869987279851 * GRP_AcceptedCmpTotal3
          +     0.15006462002842 * GRP_Frq2  +     0.59311882977199 * GRP_Frq3
          +     0.48863159490605 * GRP_Frq4  +     0.23756914199975 * GRP_Frq5
          +     0.15292781317067 * GRP_Frq6  +    -0.11592605985351 * GRP_Frq7
          +     0.06137265628021 * GRP_Frq8  +    -0.44148087686331 * GRP_Frq9
          +    -0.37239747435563 * GRP_Frq10  +    -0.33886075630942 *
        GRP_Income2  +    -0.21062689959195 * GRP_Income3
          +    -0.02074322835534 * GRP_Income4  +     0.23736224709946 *
        GRP_Income5  +       0.214138712249 * GRP_Income6
          +    -0.08175318112923 * GRP_Income7  +    -0.23142596478054 *
        GRP_Income8  +    -0.03280351769655 * GRP_Income9
          +     0.05960899733774 * GRP_Income10  +     0.62945008101182 *
        GRP_Mnt2  +     0.23513521259531 * GRP_Mnt3  +    -0.22050478121794 *
        GRP_Mnt4  +    -0.23496647111623 * GRP_Mnt5  +     -0.3569882935843 *
        GRP_Mnt6  +    -0.14144158170442 * GRP_Mnt7  +    -0.03161437694621 *
        GRP_Mnt8  +     0.08139247135792 * GRP_Mnt9  +     0.13501492095238 *
        GRP_Mnt10  +     0.23880841706575 * GRP_MntFishProducts3
          +     0.06503801758864 * GRP_MntFishProducts4
          +     0.09102980083654 * GRP_MntFishProducts5
          +    -0.04584733595541 * GRP_MntFishProducts6
          +      0.0047590794436 * GRP_MntFishProducts7
          +     0.08965871166811 * GRP_MntFishProducts8
          +    -0.04689010091525 * GRP_MntFishProducts9
          +    -0.12756554624309 * GRP_MntFishProducts10
          +    -0.15322061825285 * GRP_MntGoldProds2
          +     0.05064474124591 * GRP_MntGoldProds3
          +     0.05376152840645 * GRP_MntGoldProds4
          +     0.18514951703658 * GRP_MntGoldProds5
          +     -0.0228435349625 * GRP_MntGoldProds6
          +    -0.05833149507837 * GRP_MntGoldProds7
          +    -0.01269646637627 * GRP_MntGoldProds8
          +    -0.04081901388752 * GRP_MntGoldProds9
          +    -0.10178351483194 * GRP_MntGoldProds10
          +    -2.16041812730595 * GRP_MntMeatProducts2
          +    -1.05318212746385 * GRP_MntMeatProducts3
          +    -0.85101582616407 * GRP_MntMeatProducts4
          +     -0.3789391459587 * GRP_MntMeatProducts5
          +     0.19963282878872 * GRP_MntMeatProducts6
          +     0.29528329515437 * GRP_MntMeatProducts7
          +     0.72282511504882 * GRP_MntMeatProducts8
          +     0.73137800561315 * GRP_MntMeatProducts9
          +     1.11372973744167 * GRP_MntMeatProducts10
          +     0.13714947662222 * GRP_MntSweetProducts3
          +     0.13502625139483 * GRP_MntSweetProducts4
          +     0.10201827585695 * GRP_MntSweetProducts5
          +     0.02182580788203 * GRP_MntSweetProducts6
          +     0.16407951796879 * GRP_MntSweetProducts7
          +    -0.09392511451972 * GRP_MntSweetProducts8
          +    -0.03209865060001 * GRP_MntSweetProducts9
          +    -0.10329797161512 * GRP_MntSweetProducts10
          +     1.18332515105976 * GRP_MntWines2  +     0.84181303371169 *
        GRP_MntWines3  +     0.76571078435571 * GRP_MntWines4
          +     0.38343595841735 * GRP_MntWines5  +     0.00838349639503 *
        GRP_MntWines6  +     -0.1971647370262 * GRP_MntWines7
          +    -0.49310287654861 * GRP_MntWines8  +    -0.68124023520555 *
        GRP_MntWines9  +    -0.80220917099655 * GRP_MntWines10
          +    -1.49096566802658 * GRP_NumCatalogPurchases3
          +    -0.54819423968295 * GRP_NumCatalogPurchases4
          +     0.08825885841396 * GRP_NumCatalogPurchases5
          +     0.41207378972098 * GRP_NumCatalogPurchases6
          +     0.54628098901944 * GRP_NumCatalogPurchases7
          +     -0.0629130302903 * GRP_NumDistPurchases2
          +    -0.29094599549611 * GRP_NumDistPurchases3
          +    -0.18498106274822 * GRP_NumDistPurchases4
          +    -0.05463662394416 * GRP_NumDistPurchases5
          +    -0.16217859620819 * GRP_NumDistPurchases6
          +    -0.06071456439516 * GRP_NumDistPurchases7
          +      -0.185658447131 * GRP_NumDistPurchases8
          +     0.21894888768073 * GRP_NumDistPurchases9
          +     0.30072347520846 * GRP_NumDistPurchases10
          +     0.01881444116023 * GRP_NumWebPurchases2
          +    -0.10629396737358 * GRP_NumWebPurchases3
          +     0.03973732718471 * GRP_NumWebPurchases4
          +     0.29025134983566 * GRP_NumWebPurchases5
          +     0.15659677468698 * GRP_NumWebPurchases6
          +     0.08689280539077 * GRP_NumWebPurchases7
          +    -0.12132983347385 * GRP_NumWebPurchases8
          +    -0.92229442257389 * GRP_NumWebVisitsMonth2
          +    -0.62575099365871 * GRP_NumWebVisitsMonth3
          +     -0.4717683105557 * GRP_NumWebVisitsMonth4
          +    -0.14508478537532 * GRP_NumWebVisitsMonth5
          +     0.17542447977708 * GRP_NumWebVisitsMonth6
          +     0.28583917704167 * GRP_NumWebVisitsMonth7
          +     0.57596619831657 * GRP_NumWebVisitsMonth8
          +     0.01025459649951 * GRP_RFMstat2  +    -0.47900430920353 *
        GRP_RFMstat3  +     -0.1435376039811 * GRP_RFMstat4
          +    -0.13607321318589 * GRP_RFMstat5  +    -0.03528947422259 *
        GRP_RFMstat6  +     0.30190259080383 * GRP_RFMstat7
          +    -0.00439732746601 * GRP_RFMstat8  +     0.07440482790781 *
        GRP_RFMstat9  +     0.17209605756477 * GRP_RFMstat10
          +     0.56764167986386 * GRP_RMntFrq2  +      0.4095196911598 *
        GRP_RMntFrq3  +     0.44821902984524 * GRP_RMntFrq4
          +     -0.0789724256468 * GRP_RMntFrq5  +     0.03923972250549 *
        GRP_RMntFrq6  +    -0.36705219679785 * GRP_RMntFrq7
          +    -0.50876994489963 * GRP_RMntFrq8  +    -0.21054799253058 *
        GRP_RMntFrq9  +    -0.37296215900105 * GRP_RMntFrq10
          +     0.92412018369104 * GRP_Recency2  +     0.67145647908049 *
        GRP_Recency3  +     0.78764081941284 * GRP_Recency4
          +     0.37729708634421 * GRP_Recency5  +     0.01853267052188 *
        GRP_Recency6  +    -0.11929636949209 * GRP_Recency7
          +    -0.38214166033914 * GRP_Recency8  +    -0.24094482542027 *
        GRP_Recency9  +    -0.95570898059922 * GRP_Recency10 ;
   H11  =    -0.19011571315493 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     6.21764405217432 * H11 ;
   P_DepVar1  =     -3.4157322171382 + P_DepVar1 ;
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
;
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_AcceptedCmpTotal3 = 'Dummy: GRP_AcceptedCmpTotal=3' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Frq5 = 'Dummy: GRP_Frq=5' ;

      label GRP_Frq6 = 'Dummy: GRP_Frq=6' ;

      label GRP_Frq7 = 'Dummy: GRP_Frq=7' ;

      label GRP_Frq8 = 'Dummy: GRP_Frq=8' ;

      label GRP_Frq9 = 'Dummy: GRP_Frq=9' ;

      label GRP_Frq10 = 'Dummy: GRP_Frq=10' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Income5 = 'Dummy: GRP_Income=5' ;

      label GRP_Income6 = 'Dummy: GRP_Income=6' ;

      label GRP_Income7 = 'Dummy: GRP_Income=7' ;

      label GRP_Income8 = 'Dummy: GRP_Income=8' ;

      label GRP_Income9 = 'Dummy: GRP_Income=9' ;

      label GRP_Income10 = 'Dummy: GRP_Income=10' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_Mnt5 = 'Dummy: GRP_Mnt=5' ;

      label GRP_Mnt6 = 'Dummy: GRP_Mnt=6' ;

      label GRP_Mnt7 = 'Dummy: GRP_Mnt=7' ;

      label GRP_Mnt8 = 'Dummy: GRP_Mnt=8' ;

      label GRP_Mnt9 = 'Dummy: GRP_Mnt=9' ;

      label GRP_Mnt10 = 'Dummy: GRP_Mnt=10' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntFishProducts5 = 'Dummy: GRP_MntFishProducts=5' ;

      label GRP_MntFishProducts6 = 'Dummy: GRP_MntFishProducts=6' ;

      label GRP_MntFishProducts7 = 'Dummy: GRP_MntFishProducts=7' ;

      label GRP_MntFishProducts8 = 'Dummy: GRP_MntFishProducts=8' ;

      label GRP_MntFishProducts9 = 'Dummy: GRP_MntFishProducts=9' ;

      label GRP_MntFishProducts10 = 'Dummy: GRP_MntFishProducts=10' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntGoldProds5 = 'Dummy: GRP_MntGoldProds=5' ;

      label GRP_MntGoldProds6 = 'Dummy: GRP_MntGoldProds=6' ;

      label GRP_MntGoldProds7 = 'Dummy: GRP_MntGoldProds=7' ;

      label GRP_MntGoldProds8 = 'Dummy: GRP_MntGoldProds=8' ;

      label GRP_MntGoldProds9 = 'Dummy: GRP_MntGoldProds=9' ;

      label GRP_MntGoldProds10 = 'Dummy: GRP_MntGoldProds=10' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntMeatProducts5 = 'Dummy: GRP_MntMeatProducts=5' ;

      label GRP_MntMeatProducts6 = 'Dummy: GRP_MntMeatProducts=6' ;

      label GRP_MntMeatProducts7 = 'Dummy: GRP_MntMeatProducts=7' ;

      label GRP_MntMeatProducts8 = 'Dummy: GRP_MntMeatProducts=8' ;

      label GRP_MntMeatProducts9 = 'Dummy: GRP_MntMeatProducts=9' ;

      label GRP_MntMeatProducts10 = 'Dummy: GRP_MntMeatProducts=10' ;

      label GRP_MntSweetProducts3 = 'Dummy: GRP_MntSweetProducts=3' ;

      label GRP_MntSweetProducts4 = 'Dummy: GRP_MntSweetProducts=4' ;

      label GRP_MntSweetProducts5 = 'Dummy: GRP_MntSweetProducts=5' ;

      label GRP_MntSweetProducts6 = 'Dummy: GRP_MntSweetProducts=6' ;

      label GRP_MntSweetProducts7 = 'Dummy: GRP_MntSweetProducts=7' ;

      label GRP_MntSweetProducts8 = 'Dummy: GRP_MntSweetProducts=8' ;

      label GRP_MntSweetProducts9 = 'Dummy: GRP_MntSweetProducts=9' ;

      label GRP_MntSweetProducts10 = 'Dummy: GRP_MntSweetProducts=10' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_MntWines5 = 'Dummy: GRP_MntWines=5' ;

      label GRP_MntWines6 = 'Dummy: GRP_MntWines=6' ;

      label GRP_MntWines7 = 'Dummy: GRP_MntWines=7' ;

      label GRP_MntWines8 = 'Dummy: GRP_MntWines=8' ;

      label GRP_MntWines9 = 'Dummy: GRP_MntWines=9' ;

      label GRP_MntWines10 = 'Dummy: GRP_MntWines=10' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumCatalogPurchases5 = 'Dummy: GRP_NumCatalogPurchases=5' ;

      label GRP_NumCatalogPurchases6 = 'Dummy: GRP_NumCatalogPurchases=6' ;

      label GRP_NumCatalogPurchases7 = 'Dummy: GRP_NumCatalogPurchases=7' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumDistPurchases5 = 'Dummy: GRP_NumDistPurchases=5' ;

      label GRP_NumDistPurchases6 = 'Dummy: GRP_NumDistPurchases=6' ;

      label GRP_NumDistPurchases7 = 'Dummy: GRP_NumDistPurchases=7' ;

      label GRP_NumDistPurchases8 = 'Dummy: GRP_NumDistPurchases=8' ;

      label GRP_NumDistPurchases9 = 'Dummy: GRP_NumDistPurchases=9' ;

      label GRP_NumDistPurchases10 = 'Dummy: GRP_NumDistPurchases=10' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_NumWebPurchases5 = 'Dummy: GRP_NumWebPurchases=5' ;

      label GRP_NumWebPurchases6 = 'Dummy: GRP_NumWebPurchases=6' ;

      label GRP_NumWebPurchases7 = 'Dummy: GRP_NumWebPurchases=7' ;

      label GRP_NumWebPurchases8 = 'Dummy: GRP_NumWebPurchases=8' ;

      label GRP_NumWebVisitsMonth2 = 'Dummy: GRP_NumWebVisitsMonth=2' ;

      label GRP_NumWebVisitsMonth3 = 'Dummy: GRP_NumWebVisitsMonth=3' ;

      label GRP_NumWebVisitsMonth4 = 'Dummy: GRP_NumWebVisitsMonth=4' ;

      label GRP_NumWebVisitsMonth5 = 'Dummy: GRP_NumWebVisitsMonth=5' ;

      label GRP_NumWebVisitsMonth6 = 'Dummy: GRP_NumWebVisitsMonth=6' ;

      label GRP_NumWebVisitsMonth7 = 'Dummy: GRP_NumWebVisitsMonth=7' ;

      label GRP_NumWebVisitsMonth8 = 'Dummy: GRP_NumWebVisitsMonth=8' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RFMstat5 = 'Dummy: GRP_RFMstat=5' ;

      label GRP_RFMstat6 = 'Dummy: GRP_RFMstat=6' ;

      label GRP_RFMstat7 = 'Dummy: GRP_RFMstat=7' ;

      label GRP_RFMstat8 = 'Dummy: GRP_RFMstat=8' ;

      label GRP_RFMstat9 = 'Dummy: GRP_RFMstat=9' ;

      label GRP_RFMstat10 = 'Dummy: GRP_RFMstat=10' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq5 = 'Dummy: GRP_RMntFrq=5' ;

      label GRP_RMntFrq6 = 'Dummy: GRP_RMntFrq=6' ;

      label GRP_RMntFrq7 = 'Dummy: GRP_RMntFrq=7' ;

      label GRP_RMntFrq8 = 'Dummy: GRP_RMntFrq=8' ;

      label GRP_RMntFrq9 = 'Dummy: GRP_RMntFrq=9' ;

      label GRP_RMntFrq10 = 'Dummy: GRP_RMntFrq=10' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label GRP_Recency5 = 'Dummy: GRP_Recency=5' ;

      label GRP_Recency6 = 'Dummy: GRP_Recency=6' ;

      label GRP_Recency7 = 'Dummy: GRP_Recency=7' ;

      label GRP_Recency8 = 'Dummy: GRP_Recency=8' ;

      label GRP_Recency9 = 'Dummy: GRP_Recency=9' ;

      label GRP_Recency10 = 'Dummy: GRP_Recency=10' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop GRP_AcceptedCmpTotal3 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   GRP_AcceptedCmpTotal3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_AcceptedCmpTotal3 = 1;
   end;
   else if _dm12 = '4'  then do;
      GRP_AcceptedCmpTotal3 = -1;
   end;
   else do;
      GRP_AcceptedCmpTotal3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 GRP_Frq5 GRP_Frq6 GRP_Frq7 GRP_Frq8 GRP_Frq9
        GRP_Frq10 ;
*** encoding is sparse, initialize to zero;
GRP_Frq2 = 0;
GRP_Frq3 = 0;
GRP_Frq4 = 0;
GRP_Frq5 = 0;
GRP_Frq6 = 0;
GRP_Frq7 = 0;
GRP_Frq8 = 0;
GRP_Frq9 = 0;
GRP_Frq10 = 0;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   GRP_Frq5 = .;
   GRP_Frq6 = .;
   GRP_Frq7 = .;
   GRP_Frq8 = .;
   GRP_Frq9 = .;
   GRP_Frq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Frq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Frq2 = -1;
                  GRP_Frq3 = -1;
                  GRP_Frq4 = -1;
                  GRP_Frq5 = -1;
                  GRP_Frq6 = -1;
                  GRP_Frq7 = -1;
                  GRP_Frq8 = -1;
                  GRP_Frq9 = -1;
                  GRP_Frq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Frq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Frq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Frq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Frq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Frq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Frq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Frq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Frq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      GRP_Frq5 = .;
      GRP_Frq6 = .;
      GRP_Frq7 = .;
      GRP_Frq8 = .;
      GRP_Frq9 = .;
      GRP_Frq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 GRP_Income5 GRP_Income6 GRP_Income7
        GRP_Income8 GRP_Income9 GRP_Income10 ;
*** encoding is sparse, initialize to zero;
GRP_Income2 = 0;
GRP_Income3 = 0;
GRP_Income4 = 0;
GRP_Income5 = 0;
GRP_Income6 = 0;
GRP_Income7 = 0;
GRP_Income8 = 0;
GRP_Income9 = 0;
GRP_Income10 = 0;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   GRP_Income5 = .;
   GRP_Income6 = .;
   GRP_Income7 = .;
   GRP_Income8 = .;
   GRP_Income9 = .;
   GRP_Income10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Income10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Income2 = -1;
                  GRP_Income3 = -1;
                  GRP_Income4 = -1;
                  GRP_Income5 = -1;
                  GRP_Income6 = -1;
                  GRP_Income7 = -1;
                  GRP_Income8 = -1;
                  GRP_Income9 = -1;
                  GRP_Income10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Income2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Income3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Income4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Income5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Income6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Income7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Income8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Income9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      GRP_Income5 = .;
      GRP_Income6 = .;
      GRP_Income7 = .;
      GRP_Income8 = .;
      GRP_Income9 = .;
      GRP_Income10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 GRP_Mnt5 GRP_Mnt6 GRP_Mnt7 GRP_Mnt8 GRP_Mnt9
        GRP_Mnt10 ;
*** encoding is sparse, initialize to zero;
GRP_Mnt2 = 0;
GRP_Mnt3 = 0;
GRP_Mnt4 = 0;
GRP_Mnt5 = 0;
GRP_Mnt6 = 0;
GRP_Mnt7 = 0;
GRP_Mnt8 = 0;
GRP_Mnt9 = 0;
GRP_Mnt10 = 0;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   GRP_Mnt5 = .;
   GRP_Mnt6 = .;
   GRP_Mnt7 = .;
   GRP_Mnt8 = .;
   GRP_Mnt9 = .;
   GRP_Mnt10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Mnt10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Mnt2 = -1;
                  GRP_Mnt3 = -1;
                  GRP_Mnt4 = -1;
                  GRP_Mnt5 = -1;
                  GRP_Mnt6 = -1;
                  GRP_Mnt7 = -1;
                  GRP_Mnt8 = -1;
                  GRP_Mnt9 = -1;
                  GRP_Mnt10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Mnt2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Mnt3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Mnt4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Mnt5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Mnt6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Mnt7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Mnt8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Mnt9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      GRP_Mnt5 = .;
      GRP_Mnt6 = .;
      GRP_Mnt7 = .;
      GRP_Mnt8 = .;
      GRP_Mnt9 = .;
      GRP_Mnt10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts3 GRP_MntFishProducts4 GRP_MntFishProducts5
        GRP_MntFishProducts6 GRP_MntFishProducts7 GRP_MntFishProducts8
        GRP_MntFishProducts9 GRP_MntFishProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntFishProducts3 = 0;
GRP_MntFishProducts4 = 0;
GRP_MntFishProducts5 = 0;
GRP_MntFishProducts6 = 0;
GRP_MntFishProducts7 = 0;
GRP_MntFishProducts8 = 0;
GRP_MntFishProducts9 = 0;
GRP_MntFishProducts10 = 0;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   GRP_MntFishProducts5 = .;
   GRP_MntFishProducts6 = .;
   GRP_MntFishProducts7 = .;
   GRP_MntFishProducts8 = .;
   GRP_MntFishProducts9 = .;
   GRP_MntFishProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntFishProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntFishProducts3 = -1;
                  GRP_MntFishProducts4 = -1;
                  GRP_MntFishProducts5 = -1;
                  GRP_MntFishProducts6 = -1;
                  GRP_MntFishProducts7 = -1;
                  GRP_MntFishProducts8 = -1;
                  GRP_MntFishProducts9 = -1;
                  GRP_MntFishProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntFishProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntFishProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntFishProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntFishProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntFishProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntFishProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntFishProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      GRP_MntFishProducts5 = .;
      GRP_MntFishProducts6 = .;
      GRP_MntFishProducts7 = .;
      GRP_MntFishProducts8 = .;
      GRP_MntFishProducts9 = .;
      GRP_MntFishProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 GRP_MntGoldProds5
        GRP_MntGoldProds6 GRP_MntGoldProds7 GRP_MntGoldProds8
        GRP_MntGoldProds9 GRP_MntGoldProds10 ;
*** encoding is sparse, initialize to zero;
GRP_MntGoldProds2 = 0;
GRP_MntGoldProds3 = 0;
GRP_MntGoldProds4 = 0;
GRP_MntGoldProds5 = 0;
GRP_MntGoldProds6 = 0;
GRP_MntGoldProds7 = 0;
GRP_MntGoldProds8 = 0;
GRP_MntGoldProds9 = 0;
GRP_MntGoldProds10 = 0;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   GRP_MntGoldProds5 = .;
   GRP_MntGoldProds6 = .;
   GRP_MntGoldProds7 = .;
   GRP_MntGoldProds8 = .;
   GRP_MntGoldProds9 = .;
   GRP_MntGoldProds10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntGoldProds10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntGoldProds2 = -1;
                  GRP_MntGoldProds3 = -1;
                  GRP_MntGoldProds4 = -1;
                  GRP_MntGoldProds5 = -1;
                  GRP_MntGoldProds6 = -1;
                  GRP_MntGoldProds7 = -1;
                  GRP_MntGoldProds8 = -1;
                  GRP_MntGoldProds9 = -1;
                  GRP_MntGoldProds10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntGoldProds2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntGoldProds3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntGoldProds4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntGoldProds5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntGoldProds6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntGoldProds7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntGoldProds8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntGoldProds9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      GRP_MntGoldProds5 = .;
      GRP_MntGoldProds6 = .;
      GRP_MntGoldProds7 = .;
      GRP_MntGoldProds8 = .;
      GRP_MntGoldProds9 = .;
      GRP_MntGoldProds10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4
        GRP_MntMeatProducts5 GRP_MntMeatProducts6 GRP_MntMeatProducts7
        GRP_MntMeatProducts8 GRP_MntMeatProducts9 GRP_MntMeatProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntMeatProducts2 = 0;
GRP_MntMeatProducts3 = 0;
GRP_MntMeatProducts4 = 0;
GRP_MntMeatProducts5 = 0;
GRP_MntMeatProducts6 = 0;
GRP_MntMeatProducts7 = 0;
GRP_MntMeatProducts8 = 0;
GRP_MntMeatProducts9 = 0;
GRP_MntMeatProducts10 = 0;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   GRP_MntMeatProducts5 = .;
   GRP_MntMeatProducts6 = .;
   GRP_MntMeatProducts7 = .;
   GRP_MntMeatProducts8 = .;
   GRP_MntMeatProducts9 = .;
   GRP_MntMeatProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntMeatProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntMeatProducts2 = -1;
                  GRP_MntMeatProducts3 = -1;
                  GRP_MntMeatProducts4 = -1;
                  GRP_MntMeatProducts5 = -1;
                  GRP_MntMeatProducts6 = -1;
                  GRP_MntMeatProducts7 = -1;
                  GRP_MntMeatProducts8 = -1;
                  GRP_MntMeatProducts9 = -1;
                  GRP_MntMeatProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntMeatProducts2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntMeatProducts3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntMeatProducts4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntMeatProducts5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntMeatProducts6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntMeatProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntMeatProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntMeatProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      GRP_MntMeatProducts5 = .;
      GRP_MntMeatProducts6 = .;
      GRP_MntMeatProducts7 = .;
      GRP_MntMeatProducts8 = .;
      GRP_MntMeatProducts9 = .;
      GRP_MntMeatProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop GRP_MntSweetProducts3 GRP_MntSweetProducts4 GRP_MntSweetProducts5
        GRP_MntSweetProducts6 GRP_MntSweetProducts7 GRP_MntSweetProducts8
        GRP_MntSweetProducts9 GRP_MntSweetProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntSweetProducts3 = 0;
GRP_MntSweetProducts4 = 0;
GRP_MntSweetProducts5 = 0;
GRP_MntSweetProducts6 = 0;
GRP_MntSweetProducts7 = 0;
GRP_MntSweetProducts8 = 0;
GRP_MntSweetProducts9 = 0;
GRP_MntSweetProducts10 = 0;
if missing( GRP_MntSweetProducts ) then do;
   GRP_MntSweetProducts3 = .;
   GRP_MntSweetProducts4 = .;
   GRP_MntSweetProducts5 = .;
   GRP_MntSweetProducts6 = .;
   GRP_MntSweetProducts7 = .;
   GRP_MntSweetProducts8 = .;
   GRP_MntSweetProducts9 = .;
   GRP_MntSweetProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntSweetProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntSweetProducts3 = -1;
                  GRP_MntSweetProducts4 = -1;
                  GRP_MntSweetProducts5 = -1;
                  GRP_MntSweetProducts6 = -1;
                  GRP_MntSweetProducts7 = -1;
                  GRP_MntSweetProducts8 = -1;
                  GRP_MntSweetProducts9 = -1;
                  GRP_MntSweetProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntSweetProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntSweetProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntSweetProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntSweetProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntSweetProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntSweetProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntSweetProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntSweetProducts3 = .;
      GRP_MntSweetProducts4 = .;
      GRP_MntSweetProducts5 = .;
      GRP_MntSweetProducts6 = .;
      GRP_MntSweetProducts7 = .;
      GRP_MntSweetProducts8 = .;
      GRP_MntSweetProducts9 = .;
      GRP_MntSweetProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 GRP_MntWines5 GRP_MntWines6
        GRP_MntWines7 GRP_MntWines8 GRP_MntWines9 GRP_MntWines10 ;
*** encoding is sparse, initialize to zero;
GRP_MntWines2 = 0;
GRP_MntWines3 = 0;
GRP_MntWines4 = 0;
GRP_MntWines5 = 0;
GRP_MntWines6 = 0;
GRP_MntWines7 = 0;
GRP_MntWines8 = 0;
GRP_MntWines9 = 0;
GRP_MntWines10 = 0;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   GRP_MntWines5 = .;
   GRP_MntWines6 = .;
   GRP_MntWines7 = .;
   GRP_MntWines8 = .;
   GRP_MntWines9 = .;
   GRP_MntWines10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntWines10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntWines2 = -1;
                  GRP_MntWines3 = -1;
                  GRP_MntWines4 = -1;
                  GRP_MntWines5 = -1;
                  GRP_MntWines6 = -1;
                  GRP_MntWines7 = -1;
                  GRP_MntWines8 = -1;
                  GRP_MntWines9 = -1;
                  GRP_MntWines10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntWines2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntWines3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntWines4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntWines5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntWines6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntWines7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntWines8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntWines9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      GRP_MntWines5 = .;
      GRP_MntWines6 = .;
      GRP_MntWines7 = .;
      GRP_MntWines8 = .;
      GRP_MntWines9 = .;
      GRP_MntWines10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4
        GRP_NumCatalogPurchases5 GRP_NumCatalogPurchases6
        GRP_NumCatalogPurchases7 ;
*** encoding is sparse, initialize to zero;
GRP_NumCatalogPurchases3 = 0;
GRP_NumCatalogPurchases4 = 0;
GRP_NumCatalogPurchases5 = 0;
GRP_NumCatalogPurchases6 = 0;
GRP_NumCatalogPurchases7 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   GRP_NumCatalogPurchases5 = .;
   GRP_NumCatalogPurchases6 = .;
   GRP_NumCatalogPurchases7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            GRP_NumCatalogPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumCatalogPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_NumCatalogPurchases5 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumCatalogPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumCatalogPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumCatalogPurchases3 = -1;
            GRP_NumCatalogPurchases4 = -1;
            GRP_NumCatalogPurchases5 = -1;
            GRP_NumCatalogPurchases6 = -1;
            GRP_NumCatalogPurchases7 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      GRP_NumCatalogPurchases5 = .;
      GRP_NumCatalogPurchases6 = .;
      GRP_NumCatalogPurchases7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4
        GRP_NumDistPurchases5 GRP_NumDistPurchases6 GRP_NumDistPurchases7
        GRP_NumDistPurchases8 GRP_NumDistPurchases9 GRP_NumDistPurchases10 ;
*** encoding is sparse, initialize to zero;
GRP_NumDistPurchases2 = 0;
GRP_NumDistPurchases3 = 0;
GRP_NumDistPurchases4 = 0;
GRP_NumDistPurchases5 = 0;
GRP_NumDistPurchases6 = 0;
GRP_NumDistPurchases7 = 0;
GRP_NumDistPurchases8 = 0;
GRP_NumDistPurchases9 = 0;
GRP_NumDistPurchases10 = 0;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   GRP_NumDistPurchases5 = .;
   GRP_NumDistPurchases6 = .;
   GRP_NumDistPurchases7 = .;
   GRP_NumDistPurchases8 = .;
   GRP_NumDistPurchases9 = .;
   GRP_NumDistPurchases10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_NumDistPurchases10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_NumDistPurchases2 = -1;
                  GRP_NumDistPurchases3 = -1;
                  GRP_NumDistPurchases4 = -1;
                  GRP_NumDistPurchases5 = -1;
                  GRP_NumDistPurchases6 = -1;
                  GRP_NumDistPurchases7 = -1;
                  GRP_NumDistPurchases8 = -1;
                  GRP_NumDistPurchases9 = -1;
                  GRP_NumDistPurchases10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_NumDistPurchases2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_NumDistPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumDistPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_NumDistPurchases5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_NumDistPurchases6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumDistPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumDistPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumDistPurchases9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      GRP_NumDistPurchases5 = .;
      GRP_NumDistPurchases6 = .;
      GRP_NumDistPurchases7 = .;
      GRP_NumDistPurchases8 = .;
      GRP_NumDistPurchases9 = .;
      GRP_NumDistPurchases10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4
        GRP_NumWebPurchases5 GRP_NumWebPurchases6 GRP_NumWebPurchases7
        GRP_NumWebPurchases8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebPurchases2 = 0;
GRP_NumWebPurchases3 = 0;
GRP_NumWebPurchases4 = 0;
GRP_NumWebPurchases5 = 0;
GRP_NumWebPurchases6 = 0;
GRP_NumWebPurchases7 = 0;
GRP_NumWebPurchases8 = 0;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   GRP_NumWebPurchases5 = .;
   GRP_NumWebPurchases6 = .;
   GRP_NumWebPurchases7 = .;
   GRP_NumWebPurchases8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebPurchases2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebPurchases3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebPurchases4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebPurchases5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebPurchases2 = -1;
               GRP_NumWebPurchases3 = -1;
               GRP_NumWebPurchases4 = -1;
               GRP_NumWebPurchases5 = -1;
               GRP_NumWebPurchases6 = -1;
               GRP_NumWebPurchases7 = -1;
               GRP_NumWebPurchases8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      GRP_NumWebPurchases5 = .;
      GRP_NumWebPurchases6 = .;
      GRP_NumWebPurchases7 = .;
      GRP_NumWebPurchases8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop GRP_NumWebVisitsMonth2 GRP_NumWebVisitsMonth3 GRP_NumWebVisitsMonth4
        GRP_NumWebVisitsMonth5 GRP_NumWebVisitsMonth6 GRP_NumWebVisitsMonth7
        GRP_NumWebVisitsMonth8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebVisitsMonth2 = 0;
GRP_NumWebVisitsMonth3 = 0;
GRP_NumWebVisitsMonth4 = 0;
GRP_NumWebVisitsMonth5 = 0;
GRP_NumWebVisitsMonth6 = 0;
GRP_NumWebVisitsMonth7 = 0;
GRP_NumWebVisitsMonth8 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   GRP_NumWebVisitsMonth2 = .;
   GRP_NumWebVisitsMonth3 = .;
   GRP_NumWebVisitsMonth4 = .;
   GRP_NumWebVisitsMonth5 = .;
   GRP_NumWebVisitsMonth6 = .;
   GRP_NumWebVisitsMonth7 = .;
   GRP_NumWebVisitsMonth8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebVisitsMonth2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebVisitsMonth3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebVisitsMonth4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebVisitsMonth5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebVisitsMonth6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebVisitsMonth7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebVisitsMonth8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebVisitsMonth2 = -1;
               GRP_NumWebVisitsMonth3 = -1;
               GRP_NumWebVisitsMonth4 = -1;
               GRP_NumWebVisitsMonth5 = -1;
               GRP_NumWebVisitsMonth6 = -1;
               GRP_NumWebVisitsMonth7 = -1;
               GRP_NumWebVisitsMonth8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebVisitsMonth2 = .;
      GRP_NumWebVisitsMonth3 = .;
      GRP_NumWebVisitsMonth4 = .;
      GRP_NumWebVisitsMonth5 = .;
      GRP_NumWebVisitsMonth6 = .;
      GRP_NumWebVisitsMonth7 = .;
      GRP_NumWebVisitsMonth8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 GRP_RFMstat5 GRP_RFMstat6
        GRP_RFMstat7 GRP_RFMstat8 GRP_RFMstat9 GRP_RFMstat10 ;
*** encoding is sparse, initialize to zero;
GRP_RFMstat2 = 0;
GRP_RFMstat3 = 0;
GRP_RFMstat4 = 0;
GRP_RFMstat5 = 0;
GRP_RFMstat6 = 0;
GRP_RFMstat7 = 0;
GRP_RFMstat8 = 0;
GRP_RFMstat9 = 0;
GRP_RFMstat10 = 0;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   GRP_RFMstat5 = .;
   GRP_RFMstat6 = .;
   GRP_RFMstat7 = .;
   GRP_RFMstat8 = .;
   GRP_RFMstat9 = .;
   GRP_RFMstat10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RFMstat10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RFMstat2 = -1;
                  GRP_RFMstat3 = -1;
                  GRP_RFMstat4 = -1;
                  GRP_RFMstat5 = -1;
                  GRP_RFMstat6 = -1;
                  GRP_RFMstat7 = -1;
                  GRP_RFMstat8 = -1;
                  GRP_RFMstat9 = -1;
                  GRP_RFMstat10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RFMstat2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RFMstat3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RFMstat4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RFMstat5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RFMstat6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RFMstat7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RFMstat8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RFMstat9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      GRP_RFMstat5 = .;
      GRP_RFMstat6 = .;
      GRP_RFMstat7 = .;
      GRP_RFMstat8 = .;
      GRP_RFMstat9 = .;
      GRP_RFMstat10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 GRP_RMntFrq5 GRP_RMntFrq6
        GRP_RMntFrq7 GRP_RMntFrq8 GRP_RMntFrq9 GRP_RMntFrq10 ;
*** encoding is sparse, initialize to zero;
GRP_RMntFrq2 = 0;
GRP_RMntFrq3 = 0;
GRP_RMntFrq4 = 0;
GRP_RMntFrq5 = 0;
GRP_RMntFrq6 = 0;
GRP_RMntFrq7 = 0;
GRP_RMntFrq8 = 0;
GRP_RMntFrq9 = 0;
GRP_RMntFrq10 = 0;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   GRP_RMntFrq5 = .;
   GRP_RMntFrq6 = .;
   GRP_RMntFrq7 = .;
   GRP_RMntFrq8 = .;
   GRP_RMntFrq9 = .;
   GRP_RMntFrq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RMntFrq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RMntFrq2 = -1;
                  GRP_RMntFrq3 = -1;
                  GRP_RMntFrq4 = -1;
                  GRP_RMntFrq5 = -1;
                  GRP_RMntFrq6 = -1;
                  GRP_RMntFrq7 = -1;
                  GRP_RMntFrq8 = -1;
                  GRP_RMntFrq9 = -1;
                  GRP_RMntFrq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RMntFrq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RMntFrq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RMntFrq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RMntFrq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RMntFrq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RMntFrq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RMntFrq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RMntFrq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      GRP_RMntFrq5 = .;
      GRP_RMntFrq6 = .;
      GRP_RMntFrq7 = .;
      GRP_RMntFrq8 = .;
      GRP_RMntFrq9 = .;
      GRP_RMntFrq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 GRP_Recency5 GRP_Recency6
        GRP_Recency7 GRP_Recency8 GRP_Recency9 GRP_Recency10 ;
*** encoding is sparse, initialize to zero;
GRP_Recency2 = 0;
GRP_Recency3 = 0;
GRP_Recency4 = 0;
GRP_Recency5 = 0;
GRP_Recency6 = 0;
GRP_Recency7 = 0;
GRP_Recency8 = 0;
GRP_Recency9 = 0;
GRP_Recency10 = 0;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   GRP_Recency5 = .;
   GRP_Recency6 = .;
   GRP_Recency7 = .;
   GRP_Recency8 = .;
   GRP_Recency9 = .;
   GRP_Recency10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Recency10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Recency2 = -1;
                  GRP_Recency3 = -1;
                  GRP_Recency4 = -1;
                  GRP_Recency5 = -1;
                  GRP_Recency6 = -1;
                  GRP_Recency7 = -1;
                  GRP_Recency8 = -1;
                  GRP_Recency9 = -1;
                  GRP_Recency10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Recency2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Recency3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Recency4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Recency5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Recency6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Recency7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Recency8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Recency9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      GRP_Recency5 = .;
      GRP_Recency6 = .;
      GRP_Recency7 = .;
      GRP_Recency8 = .;
      GRP_Recency9 = .;
      GRP_Recency10 = .;
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
   H1x1_1  =     48.9150991327121 * S_Year_Birth ;
   H1x1_2  =     -1.2448778225302 * S_Year_Birth ;
   H1x1_3  =    -1.17490240099498 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +      1.4952515081505 * GRP_AcceptedCmp52
          +     1.14523176862382 * GRP_AcceptedCmpTotal3
          +     0.93425623080229 * GRP_Frq2  +    -0.23764135713737 * GRP_Frq3
          +     1.05225179768198 * GRP_Frq4  +     1.13893285231202 * GRP_Frq5
          +    -0.27680259911931 * GRP_Frq6  +    -0.38613226683298 * GRP_Frq7
          +     0.94138019603873 * GRP_Frq8  +    -0.96317020684084 * GRP_Frq9
          +     1.74049706575335 * GRP_Frq10  +    -1.04039907773219 *
        GRP_Income2  +     -0.3786016700082 * GRP_Income3
          +     1.05648065329445 * GRP_Income4  +    -0.56495305593924 *
        GRP_Income5  +      0.3223314463995 * GRP_Income6
          +    -0.47141915296565 * GRP_Income7  +     0.72744850687316 *
        GRP_Income8  +     0.36203320013679 * GRP_Income9
          +     1.03998002924375 * GRP_Income10  +    -1.48754816106222 *
        GRP_Mnt2  +    -0.30894429756232 * GRP_Mnt3  +    -0.95770423028109 *
        GRP_Mnt4  +    -1.64539798690154 * GRP_Mnt5  +     0.41874777811787 *
        GRP_Mnt6  +     -0.1532077512138 * GRP_Mnt7  +    -0.04430209280744 *
        GRP_Mnt8  +     0.02050928860703 * GRP_Mnt9  +    -0.23141760714689 *
        GRP_Mnt10  +     0.57065075916048 * GRP_MntFishProducts3
          +     2.12207366601436 * GRP_MntFishProducts4
          +     1.24477569664546 * GRP_MntFishProducts5
          +    -0.15100981079052 * GRP_MntFishProducts6
          +     0.46801413141905 * GRP_MntFishProducts7
          +     1.01445048363237 * GRP_MntFishProducts8
          +     0.13349988618819 * GRP_MntFishProducts9
          +     0.63636065903854 * GRP_MntFishProducts10
          +     0.35790281852262 * GRP_MntGoldProds2
          +     0.11971728944951 * GRP_MntGoldProds3
          +     1.37638045474104 * GRP_MntGoldProds4
          +      0.7726977538873 * GRP_MntGoldProds5
          +     1.54380129285603 * GRP_MntGoldProds6
          +    -0.43867873229224 * GRP_MntGoldProds7
          +     -0.0828489784008 * GRP_MntGoldProds8
          +    -1.30553169816686 * GRP_MntGoldProds9
          +     0.31517486136642 * GRP_MntGoldProds10
          +     2.08926485272668 * GRP_MntMeatProducts2
          +    -0.41323675739227 * GRP_MntMeatProducts3
          +     0.77026554823296 * GRP_MntMeatProducts4
          +     1.50837606673951 * GRP_MntMeatProducts5
          +    -0.50610766287925 * GRP_MntMeatProducts6
          +    -0.95808202669031 * GRP_MntMeatProducts7
          +    -0.73210997972236 * GRP_MntMeatProducts8
          +      0.4803662033036 * GRP_MntMeatProducts9
          +    -0.42623536772485 * GRP_MntMeatProducts10
          +    -0.98377710430047 * GRP_MntSweetProducts3
          +     1.29812120945148 * GRP_MntSweetProducts4
          +     1.13394147298504 * GRP_MntSweetProducts5
          +     1.88553289457256 * GRP_MntSweetProducts6
          +     1.01861533954881 * GRP_MntSweetProducts7
          +    -0.96863877000054 * GRP_MntSweetProducts8
          +    -0.62054685937371 * GRP_MntSweetProducts9
          +     0.12973446109882 * GRP_MntSweetProducts10
          +    -0.62846271426447 * GRP_MntWines2  +     -0.8813121582917 *
        GRP_MntWines3  +     0.63705101351299 * GRP_MntWines4
          +    -1.87236646995285 * GRP_MntWines5  +    -1.18525347066321 *
        GRP_MntWines6  +     2.53144197387008 * GRP_MntWines7
          +      0.4451263901865 * GRP_MntWines8  +      1.2759478420416 *
        GRP_MntWines9  +    -0.31414756703531 * GRP_MntWines10
          +     0.24125160079787 * GRP_NumCatalogPurchases3
          +     0.92633573785462 * GRP_NumCatalogPurchases4
          +     1.18471184481323 * GRP_NumCatalogPurchases5
          +    -0.58925390407558 * GRP_NumCatalogPurchases6
          +     0.17286372485467 * GRP_NumCatalogPurchases7
          +    -0.33288324436397 * GRP_NumDistPurchases2
          +    -0.00244246555209 * GRP_NumDistPurchases3
          +    -0.68136277383147 * GRP_NumDistPurchases4
          +    -0.39044423572436 * GRP_NumDistPurchases5
          +    -0.63508124022502 * GRP_NumDistPurchases6
          +     1.12448752949295 * GRP_NumDistPurchases7
          +     0.02898721976687 * GRP_NumDistPurchases8
          +     0.78422457187261 * GRP_NumDistPurchases9
          +    -0.51157522383083 * GRP_NumDistPurchases10
          +    -0.19655601102758 * GRP_NumWebPurchases2
          +    -0.43353198133592 * GRP_NumWebPurchases3
          +     0.57303663109299 * GRP_NumWebPurchases4
          +     0.44298473255625 * GRP_NumWebPurchases5
          +     1.64940181869571 * GRP_NumWebPurchases6
          +    -0.25769995323951 * GRP_NumWebPurchases7
          +    -1.80626838046671 * GRP_NumWebPurchases8
          +    -0.39825837678237 * GRP_NumWebVisitsMonth2
          +    -0.27886029046796 * GRP_NumWebVisitsMonth3
          +    -0.78900900175098 * GRP_NumWebVisitsMonth4
          +    -0.03893707525125 * GRP_NumWebVisitsMonth5
          +    -0.46465177083799 * GRP_NumWebVisitsMonth6
          +     0.42334277075131 * GRP_NumWebVisitsMonth7
          +     0.95483884118217 * GRP_NumWebVisitsMonth8
          +    -1.60737512717605 * GRP_RFMstat2  +     0.12532825553734 *
        GRP_RFMstat3  +     -0.8715682423187 * GRP_RFMstat4
          +    -1.58991314451625 * GRP_RFMstat5  +       1.561575688018 *
        GRP_RFMstat6  +     1.02933022756158 * GRP_RFMstat7
          +    -2.31915849609871 * GRP_RFMstat8  +    -2.84566628839516 *
        GRP_RFMstat9  +    -0.57016541369574 * GRP_RFMstat10
          +    -0.31514918770314 * GRP_RMntFrq2  +     0.63646656105106 *
        GRP_RMntFrq3  +    -0.46293466192264 * GRP_RMntFrq4
          +     0.54567569749056 * GRP_RMntFrq5  +     0.86979763512166 *
        GRP_RMntFrq6  +     0.52805740997594 * GRP_RMntFrq7
          +    -1.02676864365651 * GRP_RMntFrq8  +    -0.06036462998226 *
        GRP_RMntFrq9  +     1.10224270504506 * GRP_RMntFrq10
          +    -0.23825567927471 * GRP_Recency2  +     0.57752173954669 *
        GRP_Recency3  +    -1.04299682241307 * GRP_Recency4
          +     0.48450986361423 * GRP_Recency5  +    -0.27557230387919 *
        GRP_Recency6  +     1.13777960768356 * GRP_Recency7
          +     0.41680852213768 * GRP_Recency8  +    -0.32662764603354 *
        GRP_Recency9  +     0.80671738024139 * GRP_Recency10 ;
   H1x1_2  = H1x1_2  +     0.32193368206173 * GRP_AcceptedCmp52
          +     0.82326963141087 * GRP_AcceptedCmpTotal3
          +     0.29199450204637 * GRP_Frq2  +    -0.20110326184849 * GRP_Frq3
          +     1.15620288699913 * GRP_Frq4  +     1.91563433844484 * GRP_Frq5
          +    -1.94417593954758 * GRP_Frq6  +    -0.47586232856071 * GRP_Frq7
          +    -0.10925637884701 * GRP_Frq8  +     1.04074726941789 * GRP_Frq9
          +    -1.19736074070766 * GRP_Frq10  +     1.23870153104153 *
        GRP_Income2  +     1.32868254469642 * GRP_Income3
          +    -1.43777045525805 * GRP_Income4  +    -3.47419008335802 *
        GRP_Income5  +    -1.27020686562599 * GRP_Income6
          +    -0.98522733275557 * GRP_Income7  +    -0.14168992699506 *
        GRP_Income8  +    -0.85866324769247 * GRP_Income9
          +    -1.23618327699367 * GRP_Income10  +     1.68515397455794 *
        GRP_Mnt2  +    -0.47759836154745 * GRP_Mnt3  +     0.78983592820334 *
        GRP_Mnt4  +    -0.68136197325175 * GRP_Mnt5  +    -1.12504577016144 *
        GRP_Mnt6  +     0.04737591582113 * GRP_Mnt7  +     1.28481668963926 *
        GRP_Mnt8  +    -0.80486225354961 * GRP_Mnt9  +     0.21161129936087 *
        GRP_Mnt10  +    -0.36757535415244 * GRP_MntFishProducts3
          +    -0.33143977879958 * GRP_MntFishProducts4
          +     1.93255446105149 * GRP_MntFishProducts5
          +    -1.04814780142169 * GRP_MntFishProducts6
          +     0.55741771876452 * GRP_MntFishProducts7
          +    -0.92346757070836 * GRP_MntFishProducts8
          +    -2.06316504690909 * GRP_MntFishProducts9
          +    -0.99663986972644 * GRP_MntFishProducts10
          +     2.71588988290106 * GRP_MntGoldProds2
          +    -2.95950500047378 * GRP_MntGoldProds3
          +    -0.12315192366204 * GRP_MntGoldProds4
          +     2.36302474420457 * GRP_MntGoldProds5
          +    -1.11740173730236 * GRP_MntGoldProds6
          +    -0.06629690891602 * GRP_MntGoldProds7
          +     1.53811367494183 * GRP_MntGoldProds8
          +    -0.74588656478301 * GRP_MntGoldProds9
          +     -0.1802565447079 * GRP_MntGoldProds10
          +    -0.01894056181534 * GRP_MntMeatProducts2
          +    -1.15568679348089 * GRP_MntMeatProducts3
          +    -0.58682052930966 * GRP_MntMeatProducts4
          +     -0.6043543906002 * GRP_MntMeatProducts5
          +     2.85692516249605 * GRP_MntMeatProducts6
          +     0.73625924216854 * GRP_MntMeatProducts7
          +     1.74214728746989 * GRP_MntMeatProducts8
          +    -0.45744353564408 * GRP_MntMeatProducts9
          +     -1.4723966813517 * GRP_MntMeatProducts10
          +    -1.09495306347627 * GRP_MntSweetProducts3
          +     -0.4054731731199 * GRP_MntSweetProducts4
          +    -0.60803493417392 * GRP_MntSweetProducts5
          +     0.20719345639414 * GRP_MntSweetProducts6
          +     1.02644572280032 * GRP_MntSweetProducts7
          +    -1.64943878087677 * GRP_MntSweetProducts8
          +      2.5809291197819 * GRP_MntSweetProducts9
          +    -1.12543901836329 * GRP_MntSweetProducts10
          +     0.80918074561742 * GRP_MntWines2  +    -0.41223459539794 *
        GRP_MntWines3  +    -1.98090391049585 * GRP_MntWines4
          +     0.47010666911014 * GRP_MntWines5  +    -2.49811494662362 *
        GRP_MntWines6  +    -0.66268495109454 * GRP_MntWines7
          +     0.39873289333478 * GRP_MntWines8  +     0.59392453433629 *
        GRP_MntWines9  +     1.76795712153005 * GRP_MntWines10
          +     0.62443875288586 * GRP_NumCatalogPurchases3
          +    -0.23239899520452 * GRP_NumCatalogPurchases4
          +     0.77819270235427 * GRP_NumCatalogPurchases5
          +    -0.66349897020768 * GRP_NumCatalogPurchases6
          +    -0.28807954547855 * GRP_NumCatalogPurchases7
          +     0.68100611767034 * GRP_NumDistPurchases2
          +     -0.2983323877346 * GRP_NumDistPurchases3
          +     1.45550232689859 * GRP_NumDistPurchases4
          +     0.11615366779409 * GRP_NumDistPurchases5
          +    -2.32779642988276 * GRP_NumDistPurchases6
          +    -1.28135209220093 * GRP_NumDistPurchases7
          +    -0.28870369893693 * GRP_NumDistPurchases8
          +     0.19103763943343 * GRP_NumDistPurchases9
          +    -0.45462159014129 * GRP_NumDistPurchases10
          +     0.97366301040717 * GRP_NumWebPurchases2
          +     3.15113200753743 * GRP_NumWebPurchases3
          +     0.58917122105031 * GRP_NumWebPurchases4
          +     0.12866676129391 * GRP_NumWebPurchases5
          +     0.07041507244185 * GRP_NumWebPurchases6
          +    -0.06632505905192 * GRP_NumWebPurchases7
          +     1.50920205841058 * GRP_NumWebPurchases8
          +    -2.47459746725091 * GRP_NumWebVisitsMonth2
          +     1.21230732020908 * GRP_NumWebVisitsMonth3
          +     0.02999057712001 * GRP_NumWebVisitsMonth4
          +    -0.33433716782878 * GRP_NumWebVisitsMonth5
          +     2.75617273064887 * GRP_NumWebVisitsMonth6
          +     0.91205481253913 * GRP_NumWebVisitsMonth7
          +    -1.40389237616488 * GRP_NumWebVisitsMonth8
          +    -0.07601897093846 * GRP_RFMstat2  +    -0.17804688029525 *
        GRP_RFMstat3  +    -1.25755712891617 * GRP_RFMstat4
          +    -1.44373874040728 * GRP_RFMstat5  +     0.18486659716439 *
        GRP_RFMstat6  +    -1.15261748039876 * GRP_RFMstat7
          +     1.14394270249563 * GRP_RFMstat8  +    -1.50826640819395 *
        GRP_RFMstat9  +     0.90336660848561 * GRP_RFMstat10
          +     0.11901703475432 * GRP_RMntFrq2  +     0.14476182733312 *
        GRP_RMntFrq3  +     0.32489702019702 * GRP_RMntFrq4
          +    -1.57145901582776 * GRP_RMntFrq5  +     0.07677043753266 *
        GRP_RMntFrq6  +     1.15426453256065 * GRP_RMntFrq7
          +     1.61100197843951 * GRP_RMntFrq8  +    -0.55320583423719 *
        GRP_RMntFrq9  +    -0.36289317306929 * GRP_RMntFrq10
          +     -0.0602051134327 * GRP_Recency2  +     0.72031394040131 *
        GRP_Recency3  +    -1.01324252973573 * GRP_Recency4
          +     -0.2828776155712 * GRP_Recency5  +    -0.55661874182308 *
        GRP_Recency6  +    -0.31727450762599 * GRP_Recency7
          +     1.13540870611782 * GRP_Recency8  +    -1.13660380171875 *
        GRP_Recency9  +     1.50200700925354 * GRP_Recency10 ;
   H1x1_3  = H1x1_3  +    -1.03985555112012 * GRP_AcceptedCmp52
          +     0.25775857203989 * GRP_AcceptedCmpTotal3
          +    -0.71156531868268 * GRP_Frq2  +     0.67259022689422 * GRP_Frq3
          +    -1.97845323119706 * GRP_Frq4  +    -1.52930723846502 * GRP_Frq5
          +     0.28107074664618 * GRP_Frq6  +     1.14326791621936 * GRP_Frq7
          +    -1.22814850699575 * GRP_Frq8  +     -0.1984823170485 * GRP_Frq9
          +     1.55339967620915 * GRP_Frq10  +     0.40856006828913 *
        GRP_Income2  +    -0.24937432220747 * GRP_Income3
          +     0.77178170458781 * GRP_Income4  +     -0.1042181149455 *
        GRP_Income5  +     0.83921353126936 * GRP_Income6
          +     0.42897985145162 * GRP_Income7  +    -0.99399816643537 *
        GRP_Income8  +     1.43456355062073 * GRP_Income9
          +      2.0557598827554 * GRP_Income10  +     0.53153636588135 *
        GRP_Mnt2  +      1.4499127888941 * GRP_Mnt3  +    -1.79642136320056 *
        GRP_Mnt4  +     0.23742732777127 * GRP_Mnt5  +     0.66365989150128 *
        GRP_Mnt6  +    -2.42545477483083 * GRP_Mnt7  +    -2.06918742851762 *
        GRP_Mnt8  +     0.39193343300266 * GRP_Mnt9  +    -0.68271160013302 *
        GRP_Mnt10  +    -0.40413771106033 * GRP_MntFishProducts3
          +     1.62536744100755 * GRP_MntFishProducts4
          +     1.00956771804097 * GRP_MntFishProducts5
          +    -0.04807563648335 * GRP_MntFishProducts6
          +    -0.27640554543874 * GRP_MntFishProducts7
          +    -0.09019675678864 * GRP_MntFishProducts8
          +     1.51664080485047 * GRP_MntFishProducts9
          +     -1.2348175966111 * GRP_MntFishProducts10
          +     0.84388560297705 * GRP_MntGoldProds2
          +     0.21507152885146 * GRP_MntGoldProds3
          +    -0.15826409097881 * GRP_MntGoldProds4
          +    -2.20608646296521 * GRP_MntGoldProds5
          +    -0.36898605604248 * GRP_MntGoldProds6
          +     0.80401593320079 * GRP_MntGoldProds7
          +     -0.0928561699183 * GRP_MntGoldProds8
          +    -0.76260849885604 * GRP_MntGoldProds9
          +     0.41599883721366 * GRP_MntGoldProds10
          +    -0.58540441202927 * GRP_MntMeatProducts2
          +     0.53713605550175 * GRP_MntMeatProducts3
          +    -0.65152621681077 * GRP_MntMeatProducts4
          +    -0.69756285035088 * GRP_MntMeatProducts5
          +     0.05767888263587 * GRP_MntMeatProducts6
          +     -0.1888350635322 * GRP_MntMeatProducts7
          +     0.19414921399907 * GRP_MntMeatProducts8
          +    -1.72928794783971 * GRP_MntMeatProducts9
          +     -0.4799288615181 * GRP_MntMeatProducts10
          +    -0.68909946079146 * GRP_MntSweetProducts3
          +     0.63891877698479 * GRP_MntSweetProducts4
          +     0.57432083655993 * GRP_MntSweetProducts5
          +    -0.58035522854804 * GRP_MntSweetProducts6
          +       1.935803556079 * GRP_MntSweetProducts7
          +     0.18629207650306 * GRP_MntSweetProducts8
          +     0.00378347159862 * GRP_MntSweetProducts9
          +     1.81075447841433 * GRP_MntSweetProducts10
          +    -0.19044365625491 * GRP_MntWines2  +     -0.2677543994646 *
        GRP_MntWines3  +     0.68523737842149 * GRP_MntWines4
          +     0.28487452840765 * GRP_MntWines5  +    -0.32830007597399 *
        GRP_MntWines6  +    -1.01109771829124 * GRP_MntWines7
          +    -0.44351213929191 * GRP_MntWines8  +    -0.79170922676093 *
        GRP_MntWines9  +    -0.65765490294224 * GRP_MntWines10
          +     0.35708705290413 * GRP_NumCatalogPurchases3
          +     0.57640598587175 * GRP_NumCatalogPurchases4
          +      1.0380514084777 * GRP_NumCatalogPurchases5
          +    -0.21526014109961 * GRP_NumCatalogPurchases6
          +     0.21188563678996 * GRP_NumCatalogPurchases7
          +     0.92069365116707 * GRP_NumDistPurchases2
          +    -1.32849502144337 * GRP_NumDistPurchases3
          +     0.70446398487953 * GRP_NumDistPurchases4
          +    -0.57133137108926 * GRP_NumDistPurchases5
          +    -0.82186404546977 * GRP_NumDistPurchases6
          +     0.46329271267276 * GRP_NumDistPurchases7
          +    -0.66807540291648 * GRP_NumDistPurchases8
          +    -1.44336206173897 * GRP_NumDistPurchases9
          +    -1.13977568624017 * GRP_NumDistPurchases10
          +    -1.70104902572474 * GRP_NumWebPurchases2
          +     1.02036350016006 * GRP_NumWebPurchases3
          +     0.39753119384781 * GRP_NumWebPurchases4
          +     -1.0013941887276 * GRP_NumWebPurchases5
          +    -1.86464684445185 * GRP_NumWebPurchases6
          +    -0.34858626425799 * GRP_NumWebPurchases7
          +    -1.44547405446756 * GRP_NumWebPurchases8
          +     0.05140836436438 * GRP_NumWebVisitsMonth2
          +     0.24015379584676 * GRP_NumWebVisitsMonth3
          +    -0.49517632469744 * GRP_NumWebVisitsMonth4
          +    -1.43605492927257 * GRP_NumWebVisitsMonth5
          +     0.60170726736208 * GRP_NumWebVisitsMonth6
          +     0.63411609486483 * GRP_NumWebVisitsMonth7
          +     -1.2126844839861 * GRP_NumWebVisitsMonth8
          +    -0.64965441128326 * GRP_RFMstat2  +     0.34697568605896 *
        GRP_RFMstat3  +    -0.43341862711381 * GRP_RFMstat4
          +     1.06858029248659 * GRP_RFMstat5  +    -0.56457302770384 *
        GRP_RFMstat6  +     1.66706381189326 * GRP_RFMstat7
          +    -2.17135319116775 * GRP_RFMstat8  +    -0.21450659726193 *
        GRP_RFMstat9  +    -0.31077905350474 * GRP_RFMstat10
          +      0.2192436825917 * GRP_RMntFrq2  +     1.83372548820854 *
        GRP_RMntFrq3  +    -0.11145697947633 * GRP_RMntFrq4
          +     0.55148891791064 * GRP_RMntFrq5  +     0.59018223296027 *
        GRP_RMntFrq6  +    -1.05010790826944 * GRP_RMntFrq7
          +     0.52934032045284 * GRP_RMntFrq8  +      0.2953493263513 *
        GRP_RMntFrq9  +     -1.5124212512629 * GRP_RMntFrq10
          +    -0.25342816485434 * GRP_Recency2  +    -1.06632533875501 *
        GRP_Recency3  +     0.92243866019235 * GRP_Recency4
          +    -0.69765274503358 * GRP_Recency5  +    -1.03684525826147 *
        GRP_Recency6  +     0.92907236967862 * GRP_Recency7
          +     0.67510319128245 * GRP_Recency8  +    -0.12563628417614 *
        GRP_Recency9  +     0.22617805549496 * GRP_Recency10 ;
   H1x1_1  =     0.15531859064267 + H1x1_1 ;
   H1x1_2  =     1.82135862068225 + H1x1_2 ;
   H1x1_3  =      0.3038406758605 + H1x1_3 ;
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
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -1.12587004977911 * S_Year_Birth ;
   H1x2_2  =     1.95303306784814 * S_Year_Birth ;
   H1x2_3  =    -0.90076896361071 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +    -0.79126569643619 * GRP_AcceptedCmp52
          +     1.43306912145272 * GRP_AcceptedCmpTotal3
          +     1.22454618925923 * GRP_Frq2  +    -1.05161181420251 * GRP_Frq3
          +     0.18863611173949 * GRP_Frq4  +    -1.53183971921525 * GRP_Frq5
          +    -2.01595133665319 * GRP_Frq6  +     -1.0035007257827 * GRP_Frq7
          +     0.15713490969217 * GRP_Frq8  +    -0.83347236903779 * GRP_Frq9
          +     0.29577012385785 * GRP_Frq10  +    -0.62392105819131 *
        GRP_Income2  +     0.50038805154482 * GRP_Income3
          +    -3.13357648186361 * GRP_Income4  +     0.10711964638702 *
        GRP_Income5  +     0.09871993128645 * GRP_Income6
          +     1.58783603619041 * GRP_Income7  +    -2.39170088940171 *
        GRP_Income8  +     0.84317235077516 * GRP_Income9
          +     0.21927112782838 * GRP_Income10  +     1.44688080741688 *
        GRP_Mnt2  +     0.98559424831742 * GRP_Mnt3  +    -0.83479015994315 *
        GRP_Mnt4  +    -1.25208462521822 * GRP_Mnt5  +      0.5659903070034 *
        GRP_Mnt6  +      1.1919814928293 * GRP_Mnt7  +    -0.57500802418483 *
        GRP_Mnt8  +     0.01798716798387 * GRP_Mnt9  +     -0.9726123707811 *
        GRP_Mnt10  +     -0.6415326473362 * GRP_MntFishProducts3
          +    -0.10224099785309 * GRP_MntFishProducts4
          +     0.72743835436702 * GRP_MntFishProducts5
          +     0.29614489369863 * GRP_MntFishProducts6
          +     1.63513523583267 * GRP_MntFishProducts7
          +     2.82434082348947 * GRP_MntFishProducts8
          +      0.5231937168513 * GRP_MntFishProducts9
          +     0.55251870054858 * GRP_MntFishProducts10
          +    -0.98753393210474 * GRP_MntGoldProds2
          +     -0.1940135001606 * GRP_MntGoldProds3
          +     0.91054070984291 * GRP_MntGoldProds4
          +    -1.12994907018166 * GRP_MntGoldProds5
          +     1.27179432245575 * GRP_MntGoldProds6
          +     0.18442086794002 * GRP_MntGoldProds7
          +     0.13785506159767 * GRP_MntGoldProds8
          +     0.47959028032247 * GRP_MntGoldProds9
          +     0.39229732865897 * GRP_MntGoldProds10
          +     0.23926854234201 * GRP_MntMeatProducts2
          +     0.85207763313609 * GRP_MntMeatProducts3
          +     0.42240672557213 * GRP_MntMeatProducts4
          +     1.34861801506289 * GRP_MntMeatProducts5
          +    -1.90829994248939 * GRP_MntMeatProducts6
          +    -1.20216774826328 * GRP_MntMeatProducts7
          +     0.21149278031924 * GRP_MntMeatProducts8
          +     0.56060387833343 * GRP_MntMeatProducts9
          +     0.08240378464729 * GRP_MntMeatProducts10
          +     0.16630337453841 * GRP_MntSweetProducts3
          +    -0.76600764359826 * GRP_MntSweetProducts4
          +     1.50792024107994 * GRP_MntSweetProducts5
          +     1.43253580615881 * GRP_MntSweetProducts6
          +     0.21920103392576 * GRP_MntSweetProducts7
          +    -0.17220433340388 * GRP_MntSweetProducts8
          +    -0.27184415375521 * GRP_MntSweetProducts9
          +     1.06559352978761 * GRP_MntSweetProducts10
          +      0.3638071493651 * GRP_MntWines2  +    -1.03089735689723 *
        GRP_MntWines3  +    -0.28348074712993 * GRP_MntWines4
          +    -1.16208580461502 * GRP_MntWines5  +     0.05256517522541 *
        GRP_MntWines6  +    -3.45408294270214 * GRP_MntWines7
          +     -1.3283333848315 * GRP_MntWines8  +    -0.31095479430398 *
        GRP_MntWines9  +     0.15559494113085 * GRP_MntWines10
          +     0.43779353849058 * GRP_NumCatalogPurchases3
          +    -0.91049921837605 * GRP_NumCatalogPurchases4
          +    -0.62690332918044 * GRP_NumCatalogPurchases5
          +    -0.43739432912503 * GRP_NumCatalogPurchases6
          +     0.16278086436799 * GRP_NumCatalogPurchases7
          +     0.35715282562267 * GRP_NumDistPurchases2
          +     1.84468920663071 * GRP_NumDistPurchases3
          +    -2.73925942945889 * GRP_NumDistPurchases4
          +     0.59074278753284 * GRP_NumDistPurchases5
          +    -0.29365199688931 * GRP_NumDistPurchases6
          +    -1.16685203020069 * GRP_NumDistPurchases7
          +     -0.7875731631251 * GRP_NumDistPurchases8
          +    -1.10510861301954 * GRP_NumDistPurchases9
          +    -0.03346524636684 * GRP_NumDistPurchases10
          +    -0.85072273160097 * GRP_NumWebPurchases2
          +     0.90393600640139 * GRP_NumWebPurchases3
          +    -0.25391465775867 * GRP_NumWebPurchases4
          +     1.40214100313324 * GRP_NumWebPurchases5
          +     0.50386388744504 * GRP_NumWebPurchases6
          +    -0.38538022046144 * GRP_NumWebPurchases7
          +    -0.90483081808977 * GRP_NumWebPurchases8
          +    -0.63366478324154 * GRP_NumWebVisitsMonth2
          +    -1.41147267846877 * GRP_NumWebVisitsMonth3
          +     1.96455239930015 * GRP_NumWebVisitsMonth4
          +     1.74571803237503 * GRP_NumWebVisitsMonth5
          +     1.08303441803169 * GRP_NumWebVisitsMonth6
          +     0.08841803401126 * GRP_NumWebVisitsMonth7
          +     1.38561551238731 * GRP_NumWebVisitsMonth8
          +     0.42159527214144 * GRP_RFMstat2  +     0.39205646681751 *
        GRP_RFMstat3  +    -2.50004006229316 * GRP_RFMstat4
          +     0.24218846060019 * GRP_RFMstat5  +    -0.52013661702385 *
        GRP_RFMstat6  +     2.09715348886186 * GRP_RFMstat7
          +     1.17945186200384 * GRP_RFMstat8  +    -0.19936602116765 *
        GRP_RFMstat9  +     1.55749736422931 * GRP_RFMstat10
          +     0.26371295729234 * GRP_RMntFrq2  +     0.21256291633719 *
        GRP_RMntFrq3  +     1.61594740267638 * GRP_RMntFrq4
          +     0.40518302938557 * GRP_RMntFrq5  +    -0.39917281851837 *
        GRP_RMntFrq6  +     -0.4628652915326 * GRP_RMntFrq7
          +    -0.38905036918399 * GRP_RMntFrq8  +    -2.18723781804534 *
        GRP_RMntFrq9  +    -0.56209811155219 * GRP_RMntFrq10
          +    -0.21941631743981 * GRP_Recency2  +     0.62365652451736 *
        GRP_Recency3  +     0.16890109579365 * GRP_Recency4
          +     1.18652000001776 * GRP_Recency5  +      1.2800112939146 *
        GRP_Recency6  +     1.11205915793382 * GRP_Recency7
          +    -0.01678209606086 * GRP_Recency8  +    -0.49049076797222 *
        GRP_Recency9  +     -0.3017614099326 * GRP_Recency10 ;
   H1x2_2  = H1x2_2  +     0.67398933015706 * GRP_AcceptedCmp52
          +     -0.8751453503824 * GRP_AcceptedCmpTotal3
          +    -0.39482876732264 * GRP_Frq2  +     1.47757467388321 * GRP_Frq3
          +     1.83867441067752 * GRP_Frq4  +    -0.44009343778503 * GRP_Frq5
          +     1.79969806004367 * GRP_Frq6  +    -0.73760862560354 * GRP_Frq7
          +    -0.27901106932898 * GRP_Frq8  +     -0.2579404478755 * GRP_Frq9
          +     0.92818121440017 * GRP_Frq10  +     1.23619934553523 *
        GRP_Income2  +    -0.75075854848504 * GRP_Income3
          +      2.6356052001789 * GRP_Income4  +     0.37936058080477 *
        GRP_Income5  +    -0.20967950465903 * GRP_Income6
          +     0.99334907985914 * GRP_Income7  +    -0.08920239779189 *
        GRP_Income8  +    -0.22578219454998 * GRP_Income9
          +     2.34062669066844 * GRP_Income10  +     1.22929044941773 *
        GRP_Mnt2  +     0.14397695972183 * GRP_Mnt3  +     0.51032665988083 *
        GRP_Mnt4  +    -1.38153126365165 * GRP_Mnt5  +     1.63106485668984 *
        GRP_Mnt6  +     0.66336076908093 * GRP_Mnt7  +    -1.74416183994338 *
        GRP_Mnt8  +     0.26066677250535 * GRP_Mnt9  +      0.3077437522773 *
        GRP_Mnt10  +     0.31536873558672 * GRP_MntFishProducts3
          +    -0.76193578413236 * GRP_MntFishProducts4
          +     0.26441683863806 * GRP_MntFishProducts5
          +    -1.13218530156836 * GRP_MntFishProducts6
          +    -1.75837301022941 * GRP_MntFishProducts7
          +    -0.60984304748028 * GRP_MntFishProducts8
          +     0.02475727805659 * GRP_MntFishProducts9
          +    -1.33855779072481 * GRP_MntFishProducts10
          +    -1.92410927496765 * GRP_MntGoldProds2
          +     1.37957021991927 * GRP_MntGoldProds3
          +     -1.1577166761956 * GRP_MntGoldProds4
          +     1.17595415699299 * GRP_MntGoldProds5
          +    -1.44888413734615 * GRP_MntGoldProds6
          +     -0.6269952213199 * GRP_MntGoldProds7
          +     2.05006558590766 * GRP_MntGoldProds8
          +       0.105525514708 * GRP_MntGoldProds9
          +    -0.67797887575985 * GRP_MntGoldProds10
          +     2.31770696034252 * GRP_MntMeatProducts2
          +    -0.76500299288116 * GRP_MntMeatProducts3
          +    -0.08828598934539 * GRP_MntMeatProducts4
          +    -0.02140592940052 * GRP_MntMeatProducts5
          +     1.03141631738102 * GRP_MntMeatProducts6
          +     0.38981881043903 * GRP_MntMeatProducts7
          +     0.40533105938471 * GRP_MntMeatProducts8
          +     -0.3745105385612 * GRP_MntMeatProducts9
          +    -1.05280123780042 * GRP_MntMeatProducts10
          +    -0.65620511867931 * GRP_MntSweetProducts3
          +     1.21474510355056 * GRP_MntSweetProducts4
          +    -1.25507723676387 * GRP_MntSweetProducts5
          +     0.92194675503686 * GRP_MntSweetProducts6
          +     0.24570791052404 * GRP_MntSweetProducts7
          +    -0.65553994719174 * GRP_MntSweetProducts8
          +    -0.92841570255174 * GRP_MntSweetProducts9
          +     0.30873152061447 * GRP_MntSweetProducts10
          +      -0.076966369313 * GRP_MntWines2  +     -1.0025350275284 *
        GRP_MntWines3  +     0.62441192788771 * GRP_MntWines4
          +    -0.21651325463938 * GRP_MntWines5  +    -1.28062431918087 *
        GRP_MntWines6  +     0.69883808355517 * GRP_MntWines7
          +    -0.05950002086458 * GRP_MntWines8  +    -1.10191079055508 *
        GRP_MntWines9  +     0.63137280145547 * GRP_MntWines10
          +     0.76262347276195 * GRP_NumCatalogPurchases3
          +     0.27178684022178 * GRP_NumCatalogPurchases4
          +      0.7925446848717 * GRP_NumCatalogPurchases5
          +     1.31986309150149 * GRP_NumCatalogPurchases6
          +     0.13154865053956 * GRP_NumCatalogPurchases7
          +     0.90300521816676 * GRP_NumDistPurchases2
          +    -1.08143603674908 * GRP_NumDistPurchases3
          +     1.45290495686195 * GRP_NumDistPurchases4
          +    -0.27200074304672 * GRP_NumDistPurchases5
          +    -1.22641713762099 * GRP_NumDistPurchases6
          +     0.59896437874483 * GRP_NumDistPurchases7
          +    -1.27615643084203 * GRP_NumDistPurchases8
          +     1.56986239933089 * GRP_NumDistPurchases9
          +     0.25700981555502 * GRP_NumDistPurchases10
          +    -0.00592602966853 * GRP_NumWebPurchases2
          +     -0.1326853227988 * GRP_NumWebPurchases3
          +     -0.2104875425464 * GRP_NumWebPurchases4
          +    -0.37786922546668 * GRP_NumWebPurchases5
          +    -2.31891994594655 * GRP_NumWebPurchases6
          +     0.21244077840762 * GRP_NumWebPurchases7
          +     0.20544153361165 * GRP_NumWebPurchases8
          +     0.25466867279004 * GRP_NumWebVisitsMonth2
          +     0.27188060033621 * GRP_NumWebVisitsMonth3
          +    -0.95934500827979 * GRP_NumWebVisitsMonth4
          +     -1.0658065247518 * GRP_NumWebVisitsMonth5
          +     0.29606991820625 * GRP_NumWebVisitsMonth6
          +     1.39148292787476 * GRP_NumWebVisitsMonth7
          +    -0.89682418536404 * GRP_NumWebVisitsMonth8
          +    -0.29501845280237 * GRP_RFMstat2  +    -1.62706110727439 *
        GRP_RFMstat3  +    -0.05816762603923 * GRP_RFMstat4
          +     0.14056517927553 * GRP_RFMstat5  +     0.16264724605568 *
        GRP_RFMstat6  +    -1.46819615066357 * GRP_RFMstat7
          +    -3.13528696014007 * GRP_RFMstat8  +     0.01832687767367 *
        GRP_RFMstat9  +     2.36690257733755 * GRP_RFMstat10
          +     0.47170735684844 * GRP_RMntFrq2  +     0.76473788912988 *
        GRP_RMntFrq3  +    -0.92101075362772 * GRP_RMntFrq4
          +     0.42659547546303 * GRP_RMntFrq5  +    -0.39107990111087 *
        GRP_RMntFrq6  +     1.22534154436379 * GRP_RMntFrq7
          +     0.17325823510284 * GRP_RMntFrq8  +    -0.15337233078899 *
        GRP_RMntFrq9  +     0.95961796320344 * GRP_RMntFrq10
          +     0.78187566388581 * GRP_Recency2  +     0.32432493265807 *
        GRP_Recency3  +    -0.36127769208093 * GRP_Recency4
          +     0.49278466273238 * GRP_Recency5  +     1.02136259767421 *
        GRP_Recency6  +     0.24565781332322 * GRP_Recency7
          +    -0.01819850591897 * GRP_Recency8  +    -0.88865832552994 *
        GRP_Recency9  +    -1.06023089287045 * GRP_Recency10 ;
   H1x2_3  = H1x2_3  +     0.72829233603077 * GRP_AcceptedCmp52
          +    -0.64130750101094 * GRP_AcceptedCmpTotal3
          +    -0.62578027971767 * GRP_Frq2  +    -1.71391822542149 * GRP_Frq3
          +    -2.03690224986772 * GRP_Frq4  +     0.00250860268093 * GRP_Frq5
          +     3.77431536270677 * GRP_Frq6  +    -0.98694179514917 * GRP_Frq7
          +    -1.73466635264086 * GRP_Frq8  +    -0.55401738923895 * GRP_Frq9
          +    -1.75356906289375 * GRP_Frq10  +     1.49171603856686 *
        GRP_Income2  +     2.11511145525038 * GRP_Income3
          +    -0.88783509763572 * GRP_Income4  +     0.16185380039783 *
        GRP_Income5  +      0.4509467817404 * GRP_Income6
          +     0.42854496757248 * GRP_Income7  +    -0.62868012410212 *
        GRP_Income8  +    -1.38694404635062 * GRP_Income9
          +    -0.74342405534619 * GRP_Income10  +     2.14444292945881 *
        GRP_Mnt2  +    -1.40243675049805 * GRP_Mnt3  +     1.59454244242313 *
        GRP_Mnt4  +     0.96363567691465 * GRP_Mnt5  +    -0.62891559534925 *
        GRP_Mnt6  +    -0.28268355612216 * GRP_Mnt7  +     2.66118539089177 *
        GRP_Mnt8  +    -1.43910408435818 * GRP_Mnt9  +     1.56729239602888 *
        GRP_Mnt10  +     0.10200954846302 * GRP_MntFishProducts3
          +     0.11287042668469 * GRP_MntFishProducts4
          +    -0.89531289481293 * GRP_MntFishProducts5
          +     0.08643547718119 * GRP_MntFishProducts6
          +    -0.17770650235868 * GRP_MntFishProducts7
          +    -1.30659888536456 * GRP_MntFishProducts8
          +     2.06257011493102 * GRP_MntFishProducts9
          +    -0.57535905840521 * GRP_MntFishProducts10
          +     1.61685583269611 * GRP_MntGoldProds2
          +     0.76201845089384 * GRP_MntGoldProds3
          +    -0.20116109553599 * GRP_MntGoldProds4
          +    -0.35354590570837 * GRP_MntGoldProds5
          +    -0.07414881491148 * GRP_MntGoldProds6
          +    -0.93265516833704 * GRP_MntGoldProds7
          +     0.27562090724475 * GRP_MntGoldProds8
          +     0.21497600131343 * GRP_MntGoldProds9
          +    -1.31728109344577 * GRP_MntGoldProds10
          +     2.04761490869712 * GRP_MntMeatProducts2
          +    -1.25735539389252 * GRP_MntMeatProducts3
          +     2.53856697441095 * GRP_MntMeatProducts4
          +    -0.01594190004707 * GRP_MntMeatProducts5
          +     2.15096647695357 * GRP_MntMeatProducts6
          +     0.57494957107204 * GRP_MntMeatProducts7
          +     2.00730679226119 * GRP_MntMeatProducts8
          +    -0.71668533381607 * GRP_MntMeatProducts9
          +     0.53556599855475 * GRP_MntMeatProducts10
          +     1.54693619731858 * GRP_MntSweetProducts3
          +    -0.74400819703128 * GRP_MntSweetProducts4
          +    -1.02827729809733 * GRP_MntSweetProducts5
          +    -0.23410492711421 * GRP_MntSweetProducts6
          +    -1.04201907068576 * GRP_MntSweetProducts7
          +    -1.60007026788916 * GRP_MntSweetProducts8
          +    -2.09407617502035 * GRP_MntSweetProducts9
          +    -0.26803603659514 * GRP_MntSweetProducts10
          +    -1.71265459102005 * GRP_MntWines2  +     2.46887341207122 *
        GRP_MntWines3  +     0.34837694975842 * GRP_MntWines4
          +      0.7876281786545 * GRP_MntWines5  +    -0.30368035070812 *
        GRP_MntWines6  +    -0.58629960316924 * GRP_MntWines7
          +     1.95937960001866 * GRP_MntWines8  +    -0.25505243271449 *
        GRP_MntWines9  +    -1.17987872337491 * GRP_MntWines10
          +     0.22023604608467 * GRP_NumCatalogPurchases3
          +    -2.56871980434954 * GRP_NumCatalogPurchases4
          +    -1.44764737334028 * GRP_NumCatalogPurchases5
          +     -0.2446195910135 * GRP_NumCatalogPurchases6
          +     2.90538414905594 * GRP_NumCatalogPurchases7
          +     0.88336976623421 * GRP_NumDistPurchases2
          +     2.13942226719201 * GRP_NumDistPurchases3
          +     1.34320499597894 * GRP_NumDistPurchases4
          +    -1.51639001105393 * GRP_NumDistPurchases5
          +     0.57368953355036 * GRP_NumDistPurchases6
          +     0.70444554339708 * GRP_NumDistPurchases7
          +     1.28554266385595 * GRP_NumDistPurchases8
          +     1.37825141302574 * GRP_NumDistPurchases9
          +    -1.43691218320245 * GRP_NumDistPurchases10
          +    -0.66804085143805 * GRP_NumWebPurchases2
          +     0.07392237122103 * GRP_NumWebPurchases3
          +    -1.49905765103392 * GRP_NumWebPurchases4
          +     -1.5187477833321 * GRP_NumWebPurchases5
          +     0.48158072068531 * GRP_NumWebPurchases6
          +     0.23079702131182 * GRP_NumWebPurchases7
          +    -0.20622792691222 * GRP_NumWebPurchases8
          +     0.30007609674528 * GRP_NumWebVisitsMonth2
          +     1.12205187145706 * GRP_NumWebVisitsMonth3
          +     0.51718549115979 * GRP_NumWebVisitsMonth4
          +    -1.04703503782865 * GRP_NumWebVisitsMonth5
          +     0.22390337037879 * GRP_NumWebVisitsMonth6
          +    -0.18626487429236 * GRP_NumWebVisitsMonth7
          +     1.57022893774879 * GRP_NumWebVisitsMonth8
          +    -0.18955402131625 * GRP_RFMstat2  +     1.36375958279816 *
        GRP_RFMstat3  +     0.69388690636651 * GRP_RFMstat4
          +    -0.14096513433405 * GRP_RFMstat5  +     0.06232569479305 *
        GRP_RFMstat6  +    -1.98686981980517 * GRP_RFMstat7
          +    -0.04208886647313 * GRP_RFMstat8  +     0.13969094966118 *
        GRP_RFMstat9  +    -0.78889510235752 * GRP_RFMstat10
          +     0.00773524086935 * GRP_RMntFrq2  +     0.42760129795181 *
        GRP_RMntFrq3  +     1.20654035825086 * GRP_RMntFrq4
          +    -1.96326294005559 * GRP_RMntFrq5  +     0.19508572570635 *
        GRP_RMntFrq6  +     0.64155838577241 * GRP_RMntFrq7
          +     0.29646831812974 * GRP_RMntFrq8  +    -1.79415071937644 *
        GRP_RMntFrq9  +     0.50025621373087 * GRP_RMntFrq10
          +    -1.09969223947409 * GRP_Recency2  +     0.28522088439434 *
        GRP_Recency3  +     0.00277105517522 * GRP_Recency4
          +     0.84025488137705 * GRP_Recency5  +    -0.15771429015941 *
        GRP_Recency6  +     0.60418796843171 * GRP_Recency7
          +    -0.08237018446397 * GRP_Recency8  +    -0.48067966796564 *
        GRP_Recency9  +     1.24119420047225 * GRP_Recency10 ;
   H1x2_1  =     1.77895259501913 + H1x2_1 ;
   H1x2_2  =    -0.15319898291656 + H1x2_2 ;
   H1x2_3  =     1.06881294227229 + H1x2_3 ;
   H1x2_4  = 0;
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 );
   _SUM_ = 0.;
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     0.60543735927278 * H1x1_1  +     3.85958773643111 * H1x1_2
          +    -0.13813806296693 * H1x1_3  +    -2.68183941928297 * H1x1_4 ;
   H2x1_2  =    -0.14350534886194 * H1x1_1  +    -0.58869275717393 * H1x1_2
          +     0.27201202126987 * H1x1_3  +     0.84944711792034 * H1x1_4 ;
   H2x1_3  =     0.16377235892809 * H1x1_1  +     0.32450938656975 * H1x1_2
          +    -0.96313538220557 * H1x1_3  +      -1.179254081075 * H1x1_4 ;
   H2x1_1  = H2x1_1  +     0.15983017127833 * H1x2_1
          +    -2.52556013675769 * H1x2_2  +     1.74538330689549 * H1x2_3
          +     0.68913073131319 * H1x2_4 ;
   H2x1_2  = H2x1_2  +     0.40540171537462 * H1x2_1
          +     2.27830241234825 * H1x2_2  +     0.15661386543073 * H1x2_3
          +    -0.12036833619531 * H1x2_4 ;
   H2x1_3  = H2x1_3  +     -0.8609897463305 * H1x2_1
          +     1.80866840044437 * H1x2_2  +    -0.99524522029584 * H1x2_3
          +    -0.16746987063494 * H1x2_4 ;
   H2x1_1  =    -0.00538470720937 + H2x1_1 ;
   H2x1_2  =    -0.26197576528123 + H2x1_2 ;
   H2x1_3  =    -1.06687812193911 + H2x1_3 ;
   H2x1_4  = 0;
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 );
   _SUM_ = 0.;
   H2x1_1  = EXP(H2x1_1  - _MAX_);
   _SUM_ = _SUM_ + H2x1_1 ;
   H2x1_2  = EXP(H2x1_2  - _MAX_);
   _SUM_ = _SUM_ + H2x1_2 ;
   H2x1_3  = EXP(H2x1_3  - _MAX_);
   _SUM_ = _SUM_ + H2x1_3 ;
   H2x1_4  = EXP(H2x1_4  - _MAX_);
   _SUM_ = _SUM_ + H2x1_4 ;
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -6.74158110639118 * H2x1_1  +     3.33281062877513 * H2x1_2
          +     0.83315809661207 * H2x1_3  +     2.92602608104015 * H2x1_4 ;
   P_DepVar1  =    -3.28186383811869 + P_DepVar1 ;
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
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl18;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl18: Average Posteriors of 7 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural21_P_DepVar1 +
Neural22_P_DepVar1 +
Neural18_P_DepVar1 +
Reg7_P_DepVar1 +
Reg3_P_DepVar1 +
Neural5_P_DepVar1 +
AutoNeural26_P_DepVar1
)/7;
P_DepVar0 = (
Neural21_P_DepVar0 +
Neural22_P_DepVar0 +
Neural18_P_DepVar0 +
Reg7_P_DepVar0 +
Reg3_P_DepVar0 +
Neural5_P_DepVar0 +
AutoNeural26_P_DepVar0
)/7;
*------------------------------------------------------------*;
* Ensmbl18: Computing Classification Vars;
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
* Ensmbl18: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl18: Computing _WARN_ Variable;
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
if index(REG7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL5_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL5_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL5_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL5_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL26_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL26_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL26_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL26_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
