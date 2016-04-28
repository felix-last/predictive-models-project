*------------------------------------------------------------*;
* Ensmbl49: Combine model for DepVar;
*------------------------------------------------------------*;
* Ensmbl49: Scoring Code of model 1 of 7;
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
   H1x1_1  =     0.02679451047291 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +    -0.12600784765669 * GRP_AcceptedCmp52
          +    -0.24773503003852 * GRP_AcceptedCmpTotal3
          +      0.4763104849584 * GRP_Frq2  +     0.63275575365914 * GRP_Frq3
          +        0.43303671371 * GRP_Frq4  +     0.21081768887869 * GRP_Frq5
          +     0.02077421549694 * GRP_Frq6  +       -0.18052353427 * GRP_Frq7
          +    -0.15508467959586 * GRP_Frq8  +    -0.39641583551518 * GRP_Frq9
          +    -0.39013813553489 * GRP_Frq10  +    -0.17255392498924 *
        GRP_Income2  +    -0.13576786973374 * GRP_Income3
          +    -0.04781197849524 * GRP_Income4  +     0.12775070543371 *
        GRP_Income5  +     0.10172192254113 * GRP_Income6
          +    -0.04690813496361 * GRP_Income7  +    -0.13578615915056 *
        GRP_Income8  +    -0.01623645226123 * GRP_Income9
          +     0.07454002118245 * GRP_Income10  +     0.45196184675881 *
        GRP_Mnt2  +     0.16435061036903 * GRP_Mnt3  +    -0.10118369359748 *
        GRP_Mnt4  +    -0.11856379406936 * GRP_Mnt5  +    -0.15196175341285 *
        GRP_Mnt6  +    -0.05622791071071 * GRP_Mnt7  +    -0.05734126300476 *
        GRP_Mnt8  +    -0.01809161274207 * GRP_Mnt9  +     0.01183785475694 *
        GRP_Mnt10  +     0.14434084987524 * GRP_MntFishProducts3
          +     0.03626833476253 * GRP_MntFishProducts4
          +     0.03716397428065 * GRP_MntFishProducts5
          +    -0.03713280406063 * GRP_MntFishProducts6
          +     0.01033115902207 * GRP_MntFishProducts7
          +     0.08994264335172 * GRP_MntFishProducts8
          +    -0.06726614907875 * GRP_MntFishProducts9
          +    -0.06815040669419 * GRP_MntFishProducts10
          +    -0.08312975756559 * GRP_MntGoldProds2
          +     0.06322823494002 * GRP_MntGoldProds3
          +     0.04037927992918 * GRP_MntGoldProds4
          +     0.07365306538606 * GRP_MntGoldProds5
          +    -0.03732074451152 * GRP_MntGoldProds6
          +    -0.01102012703217 * GRP_MntGoldProds7
          +     -0.0151055337624 * GRP_MntGoldProds8
          +    -0.00974455287664 * GRP_MntGoldProds9
          +    -0.06401240951204 * GRP_MntGoldProds10
          +     -1.4875279111617 * GRP_MntMeatProducts2
          +    -0.73065260778421 * GRP_MntMeatProducts3
          +    -0.53450046275471 * GRP_MntMeatProducts4
          +    -0.24727004598106 * GRP_MntMeatProducts5
          +     0.14988728539424 * GRP_MntMeatProducts6
          +     0.22927517569655 * GRP_MntMeatProducts7
          +     0.47550673507778 * GRP_MntMeatProducts8
          +     0.49353124801333 * GRP_MntMeatProducts9
          +     0.72039572427059 * GRP_MntMeatProducts10
          +     0.06823127787401 * GRP_MntSweetProducts3
          +     0.08472133565279 * GRP_MntSweetProducts4
          +     0.04417062820166 * GRP_MntSweetProducts5
          +     0.00757706145686 * GRP_MntSweetProducts6
          +      0.1226588025112 * GRP_MntSweetProducts7
          +    -0.05190715257838 * GRP_MntSweetProducts8
          +    -0.03422227838413 * GRP_MntSweetProducts9
          +    -0.04532431032726 * GRP_MntSweetProducts10
          +     0.66392959119068 * GRP_MntWines2  +     0.47215147869785 *
        GRP_MntWines3  +     0.41857393427507 * GRP_MntWines4
          +     0.24574035105077 * GRP_MntWines5  +     0.03341599886728 *
        GRP_MntWines6  +    -0.08433880603285 * GRP_MntWines7
          +    -0.27837143556729 * GRP_MntWines8  +    -0.38340464807684 *
        GRP_MntWines9  +    -0.49138348783656 * GRP_MntWines10
          +    -1.01881515787562 * GRP_NumCatalogPurchases3
          +    -0.37363084644318 * GRP_NumCatalogPurchases4
          +     0.04800532096633 * GRP_NumCatalogPurchases5
          +       0.282688244704 * GRP_NumCatalogPurchases6
          +     0.39046101676553 * GRP_NumCatalogPurchases7
          +    -0.01594542509606 * GRP_NumDistPurchases2
          +    -0.29153776030828 * GRP_NumDistPurchases3
          +    -0.09037494972502 * GRP_NumDistPurchases4
          +    -0.00725120968271 * GRP_NumDistPurchases5
          +    -0.06295206424043 * GRP_NumDistPurchases6
          +    -0.02086642105727 * GRP_NumDistPurchases7
          +    -0.12530848103828 * GRP_NumDistPurchases8
          +     0.15626222929177 * GRP_NumDistPurchases9
          +      0.1849440756767 * GRP_NumDistPurchases10
          +    -0.12643283609024 * GRP_NumWebPurchases2
          +    -0.06626578820707 * GRP_NumWebPurchases3
          +      0.0333874176869 * GRP_NumWebPurchases4
          +     0.19509610230025 * GRP_NumWebPurchases5
          +     0.11840420727481 * GRP_NumWebPurchases6
          +     0.05931004123615 * GRP_NumWebPurchases7
          +     -0.0436108373518 * GRP_NumWebPurchases8
          +    -0.60758455983737 * GRP_NumWebVisitsMonth2
          +    -0.39511118084504 * GRP_NumWebVisitsMonth3
          +    -0.28625662028314 * GRP_NumWebVisitsMonth4
          +    -0.11647252154092 * GRP_NumWebVisitsMonth5
          +     0.12812880394268 * GRP_NumWebVisitsMonth6
          +     0.16066073564591 * GRP_NumWebVisitsMonth7
          +     0.38486284852969 * GRP_NumWebVisitsMonth8
          +     -0.1587178923777 * GRP_RFMstat2  +    -0.41277197149671 *
        GRP_RFMstat3  +    -0.13856204606382 * GRP_RFMstat4
          +    -0.09653391003958 * GRP_RFMstat5  +      0.0040424859495 *
        GRP_RFMstat6  +     0.21446234015642 * GRP_RFMstat7
          +     0.05892727008126 * GRP_RFMstat8  +     0.09135293989879 *
        GRP_RFMstat9  +     0.18601108392293 * GRP_RFMstat10
          +     0.41920180865469 * GRP_RMntFrq2  +     0.28892749199433 *
        GRP_RMntFrq3  +     0.27918965478263 * GRP_RMntFrq4
          +    -0.08512643693005 * GRP_RMntFrq5  +    -0.04125552303385 *
        GRP_RMntFrq6  +     -0.2934979947189 * GRP_RMntFrq7
          +    -0.29428282664963 * GRP_RMntFrq8  +    -0.09530668248701 *
        GRP_RMntFrq9  +    -0.20467735159121 * GRP_RMntFrq10
          +     0.54536841935123 * GRP_Recency2  +     0.42077244990419 *
        GRP_Recency3  +     0.44845657449204 * GRP_Recency4
          +      0.2327262468839 * GRP_Recency5  +     0.00356962085572 *
        GRP_Recency6  +    -0.05638004232077 * GRP_Recency7
          +    -0.20819742743075 * GRP_Recency8  +    -0.19201512769412 *
        GRP_Recency9  +    -0.55820399491822 * GRP_Recency10 ;
   H1x1_1  =    -0.14127212990469 + H1x1_1 ;
   H1x1_1  = SIN(H1x1_1 );
END;
ELSE DO;
   H1x1_1  = .;
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
   P_DepVar1  =     7.19007204863201 * H1x1_1 ;
   P_DepVar1  =    -3.03178550261488 + P_DepVar1 ;
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
* Ensmbl49: Scoring Code of model 2 of 7;
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
   H1x1_1  =     48.9465081991162 * S_Year_Birth ;
   H1x1_2  =     2.02087365254286 * S_Year_Birth ;
   H1x1_3  =      2.4592532691129 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     0.71676376330119 * GRP_AcceptedCmp52
          +    -0.92635980793428 * GRP_AcceptedCmpTotal3
          +    -0.28730763810705 * GRP_Frq2  +     0.51925889916312 * GRP_Frq3
          +     -0.6431651730272 * GRP_Frq4  +    -1.23700914617998 * GRP_Frq5
          +    -0.16744940694414 * GRP_Frq6  +    -0.30152573091873 * GRP_Frq7
          +     -1.3314768147468 * GRP_Frq8  +     0.17126339432009 * GRP_Frq9
          +     -0.0889204149078 * GRP_Frq10  +      0.4741194060187 *
        GRP_Income2  +     1.56070730507658 * GRP_Income3
          +     0.53746893731356 * GRP_Income4  +    -0.76738101410035 *
        GRP_Income5  +     0.85451657926949 * GRP_Income6
          +     0.76132605887735 * GRP_Income7  +     0.06592406535671 *
        GRP_Income8  +     1.97305302340144 * GRP_Income9
          +     1.02012810874527 * GRP_Income10  +     0.02631203134579 *
        GRP_Mnt2  +    -1.30050547549954 * GRP_Mnt3  +    -0.36906367733678 *
        GRP_Mnt4  +     1.04522826393693 * GRP_Mnt5  +     0.62644301984134 *
        GRP_Mnt6  +     1.15385855214269 * GRP_Mnt7  +    -0.82602046556465 *
        GRP_Mnt8  +     -0.4111324432654 * GRP_Mnt9  +    -0.56476276333863 *
        GRP_Mnt10  +     0.52471556990605 * GRP_MntFishProducts3
          +     0.16044770035396 * GRP_MntFishProducts4
          +    -1.17374131153541 * GRP_MntFishProducts5
          +    -0.83131801764513 * GRP_MntFishProducts6
          +     1.14299447378441 * GRP_MntFishProducts7
          +    -0.15781477960507 * GRP_MntFishProducts8
          +    -1.12153624062142 * GRP_MntFishProducts9
          +     0.23353899882952 * GRP_MntFishProducts10
          +      0.9934704930855 * GRP_MntGoldProds2
          +     0.55747340998385 * GRP_MntGoldProds3
          +    -0.17034801431646 * GRP_MntGoldProds4
          +     1.21830221546251 * GRP_MntGoldProds5
          +    -1.22259417805613 * GRP_MntGoldProds6
          +    -0.36828783291156 * GRP_MntGoldProds7
          +     0.78525677330014 * GRP_MntGoldProds8
          +     0.47984476584191 * GRP_MntGoldProds9
          +     0.03467373901273 * GRP_MntGoldProds10
          +    -0.57349410415913 * GRP_MntMeatProducts2
          +     0.65134044606103 * GRP_MntMeatProducts3
          +     0.36788044128902 * GRP_MntMeatProducts4
          +     0.29120969129561 * GRP_MntMeatProducts5
          +    -1.36110766617809 * GRP_MntMeatProducts6
          +    -0.33627963920768 * GRP_MntMeatProducts7
          +     0.29864505305537 * GRP_MntMeatProducts8
          +     0.20571131972856 * GRP_MntMeatProducts9
          +     0.50414797440093 * GRP_MntMeatProducts10
          +    -1.72121615822238 * GRP_MntSweetProducts3
          +     -0.6848717524032 * GRP_MntSweetProducts4
          +     0.21764928333182 * GRP_MntSweetProducts5
          +      0.5156326916797 * GRP_MntSweetProducts6
          +    -1.81239268036233 * GRP_MntSweetProducts7
          +     1.69793128774016 * GRP_MntSweetProducts8
          +     0.21494191976556 * GRP_MntSweetProducts9
          +    -1.36662509099176 * GRP_MntSweetProducts10
          +    -0.62845147000994 * GRP_MntWines2  +     0.95185291016713 *
        GRP_MntWines3  +    -0.69708425204065 * GRP_MntWines4
          +    -1.23435797956339 * GRP_MntWines5  +     -1.5220790223763 *
        GRP_MntWines6  +      0.2067568077444 * GRP_MntWines7
          +     0.87704257787756 * GRP_MntWines8  +    -1.99552292812582 *
        GRP_MntWines9  +    -0.07587861352893 * GRP_MntWines10
          +     0.35815441966601 * GRP_NumCatalogPurchases3
          +     0.07176464499033 * GRP_NumCatalogPurchases4
          +     0.29459918891622 * GRP_NumCatalogPurchases5
          +     0.31886968573327 * GRP_NumCatalogPurchases6
          +    -1.51387976023239 * GRP_NumCatalogPurchases7
          +     1.20860019572302 * GRP_NumDistPurchases2
          +     0.46210628473586 * GRP_NumDistPurchases3
          +    -2.56072327490522 * GRP_NumDistPurchases4
          +     1.03435677588053 * GRP_NumDistPurchases5
          +     0.04522378064572 * GRP_NumDistPurchases6
          +    -0.85331194553641 * GRP_NumDistPurchases7
          +    -1.22935279264677 * GRP_NumDistPurchases8
          +    -0.65851400385577 * GRP_NumDistPurchases9
          +    -1.01774823358732 * GRP_NumDistPurchases10
          +    -0.86377318792053 * GRP_NumWebPurchases2
          +     0.21661789250787 * GRP_NumWebPurchases3
          +    -1.30691605989363 * GRP_NumWebPurchases4
          +    -0.48532556674706 * GRP_NumWebPurchases5
          +     0.59310004264709 * GRP_NumWebPurchases6
          +     0.43335009213506 * GRP_NumWebPurchases7
          +     -0.7639814067765 * GRP_NumWebPurchases8
          +     1.38321438368337 * GRP_NumWebVisitsMonth2
          +     0.47188296824861 * GRP_NumWebVisitsMonth3
          +    -1.78625193231398 * GRP_NumWebVisitsMonth4
          +     1.64086827442453 * GRP_NumWebVisitsMonth5
          +     0.03446991492896 * GRP_NumWebVisitsMonth6
          +    -0.45614880997983 * GRP_NumWebVisitsMonth7
          +     0.42333060077089 * GRP_NumWebVisitsMonth8
          +    -0.26497911055373 * GRP_RFMstat2  +     1.41331191509815 *
        GRP_RFMstat3  +    -0.72899210329908 * GRP_RFMstat4
          +    -0.51925237587027 * GRP_RFMstat5  +    -0.12861049633485 *
        GRP_RFMstat6  +    -1.05799117155955 * GRP_RFMstat7
          +     0.92142033704749 * GRP_RFMstat8  +      0.4817018906046 *
        GRP_RFMstat9  +    -1.21700873377512 * GRP_RFMstat10
          +    -0.44993227310411 * GRP_RMntFrq2  +     1.02278288492285 *
        GRP_RMntFrq3  +    -0.52153555031696 * GRP_RMntFrq4
          +     1.28928411047852 * GRP_RMntFrq5  +    -1.71778296055387 *
        GRP_RMntFrq6  +    -0.19028690696286 * GRP_RMntFrq7
          +    -0.62011590396692 * GRP_RMntFrq8  +     1.45129397542294 *
        GRP_RMntFrq9  +     0.06615784080128 * GRP_RMntFrq10
          +    -0.32041425963328 * GRP_Recency2  +     -0.9881569760974 *
        GRP_Recency3  +    -0.51344461817292 * GRP_Recency4
          +     1.16861419470805 * GRP_Recency5  +     0.18835458430028 *
        GRP_Recency6  +     2.84664593413438 * GRP_Recency7
          +     -0.1813906971641 * GRP_Recency8  +    -0.16805479054549 *
        GRP_Recency9  +     0.02055980478388 * GRP_Recency10 ;
   H1x1_2  = H1x1_2  +     1.54906602910059 * GRP_AcceptedCmp52
          +     2.27617601085527 * GRP_AcceptedCmpTotal3
          +     1.48540449527868 * GRP_Frq2  +    -0.60923069898807 * GRP_Frq3
          +     -0.0368535358215 * GRP_Frq4  +    -1.18941365357904 * GRP_Frq5
          +     1.22445800124678 * GRP_Frq6  +     -1.3516431363703 * GRP_Frq7
          +    -0.48231848710081 * GRP_Frq8  +    -0.46429007154719 * GRP_Frq9
          +    -0.59573416306808 * GRP_Frq10  +     0.15720399083979 *
        GRP_Income2  +    -0.61345730206179 * GRP_Income3
          +    -2.60180837454575 * GRP_Income4  +     1.68721717972638 *
        GRP_Income5  +    -1.14043189774882 * GRP_Income6
          +    -1.65034796071558 * GRP_Income7  +     0.96537091831533 *
        GRP_Income8  +      1.9815044443061 * GRP_Income9
          +    -0.82350660692239 * GRP_Income10  +     2.86005545579867 *
        GRP_Mnt2  +    -1.64805200594142 * GRP_Mnt3  +     0.82206598750464 *
        GRP_Mnt4  +      -1.785895388304 * GRP_Mnt5  +    -1.17108148178058 *
        GRP_Mnt6  +     0.08089063222924 * GRP_Mnt7  +    -0.09820504774867 *
        GRP_Mnt8  +    -2.15609481865681 * GRP_Mnt9  +     0.32675137919046 *
        GRP_Mnt10  +     1.22381214535693 * GRP_MntFishProducts3
          +    -0.78126288260758 * GRP_MntFishProducts4
          +    -1.21111214275067 * GRP_MntFishProducts5
          +     0.28720250492064 * GRP_MntFishProducts6
          +      0.4852822639139 * GRP_MntFishProducts7
          +    -2.04291612093927 * GRP_MntFishProducts8
          +    -0.24795489067995 * GRP_MntFishProducts9
          +    -1.76136796298463 * GRP_MntFishProducts10
          +      0.4263187803616 * GRP_MntGoldProds2
          +     1.84909440915903 * GRP_MntGoldProds3
          +    -0.39798177649193 * GRP_MntGoldProds4
          +    -2.54755160294536 * GRP_MntGoldProds5
          +    -1.28982494547534 * GRP_MntGoldProds6
          +    -1.67021273990857 * GRP_MntGoldProds7
          +     -2.3042297184959 * GRP_MntGoldProds8
          +     3.09097855619745 * GRP_MntGoldProds9
          +     1.93600988736611 * GRP_MntGoldProds10
          +     0.09848257045454 * GRP_MntMeatProducts2
          +     1.08304168417965 * GRP_MntMeatProducts3
          +     1.91882445829551 * GRP_MntMeatProducts4
          +     0.35520536863258 * GRP_MntMeatProducts5
          +    -1.11205797114044 * GRP_MntMeatProducts6
          +     0.43563318671882 * GRP_MntMeatProducts7
          +    -0.74270605349827 * GRP_MntMeatProducts8
          +    -0.29550693297591 * GRP_MntMeatProducts9
          +      0.2766601721624 * GRP_MntMeatProducts10
          +     0.75058577420898 * GRP_MntSweetProducts3
          +    -0.56185376554629 * GRP_MntSweetProducts4
          +    -1.05152828789454 * GRP_MntSweetProducts5
          +     1.00220971259397 * GRP_MntSweetProducts6
          +    -0.77193622487428 * GRP_MntSweetProducts7
          +     0.26442183085042 * GRP_MntSweetProducts8
          +     1.25825351006964 * GRP_MntSweetProducts9
          +    -0.00709190308776 * GRP_MntSweetProducts10
          +     1.88786953703682 * GRP_MntWines2  +    -2.10043706907947 *
        GRP_MntWines3  +    -0.37517500522875 * GRP_MntWines4
          +    -0.18006973196751 * GRP_MntWines5  +    -0.95199068268302 *
        GRP_MntWines6  +     0.06801155856486 * GRP_MntWines7
          +     0.34478968361592 * GRP_MntWines8  +     2.54128029741065 *
        GRP_MntWines9  +     0.23106135005771 * GRP_MntWines10
          +     0.39725833376834 * GRP_NumCatalogPurchases3
          +    -0.67139494868643 * GRP_NumCatalogPurchases4
          +      1.5447002000778 * GRP_NumCatalogPurchases5
          +     0.09330433399681 * GRP_NumCatalogPurchases6
          +     0.62825597584327 * GRP_NumCatalogPurchases7
          +     1.18162241824504 * GRP_NumDistPurchases2
          +     -1.9946583037891 * GRP_NumDistPurchases3
          +     1.89348453467246 * GRP_NumDistPurchases4
          +    -1.04666376883699 * GRP_NumDistPurchases5
          +     0.25268529470975 * GRP_NumDistPurchases6
          +     1.86652956276603 * GRP_NumDistPurchases7
          +    -0.69782473674049 * GRP_NumDistPurchases8
          +       -1.15138058126 * GRP_NumDistPurchases9
          +    -3.19969298738512 * GRP_NumDistPurchases10
          +     1.12885105205807 * GRP_NumWebPurchases2
          +     2.25528779471396 * GRP_NumWebPurchases3
          +    -0.23663724121963 * GRP_NumWebPurchases4
          +    -0.78009469666272 * GRP_NumWebPurchases5
          +     1.77370357588641 * GRP_NumWebPurchases6
          +     1.22392891369749 * GRP_NumWebPurchases7
          +    -1.61655624441792 * GRP_NumWebPurchases8
          +    -0.13001746156436 * GRP_NumWebVisitsMonth2
          +    -0.72575926018145 * GRP_NumWebVisitsMonth3
          +    -0.94816479697152 * GRP_NumWebVisitsMonth4
          +     1.16144102182867 * GRP_NumWebVisitsMonth5
          +     1.70938770020645 * GRP_NumWebVisitsMonth6
          +    -0.48304241282132 * GRP_NumWebVisitsMonth7
          +     0.70529232466454 * GRP_NumWebVisitsMonth8
          +     0.65772145666627 * GRP_RFMstat2  +     2.86660915599885 *
        GRP_RFMstat3  +    -0.22923576328844 * GRP_RFMstat4
          +     0.03385950626308 * GRP_RFMstat5  +     0.62446884850413 *
        GRP_RFMstat6  +    -1.56316157740304 * GRP_RFMstat7
          +     0.98813608226531 * GRP_RFMstat8  +    -0.63565291977652 *
        GRP_RFMstat9  +    -0.82989429531226 * GRP_RFMstat10
          +     0.11925727600741 * GRP_RMntFrq2  +    -0.46501464175926 *
        GRP_RMntFrq3  +    -3.30325300706323 * GRP_RMntFrq4
          +    -1.34536441554295 * GRP_RMntFrq5  +    -3.84413028109146 *
        GRP_RMntFrq6  +     0.47106170435895 * GRP_RMntFrq7
          +    -0.72605486027727 * GRP_RMntFrq8  +     0.63627621829641 *
        GRP_RMntFrq9  +    -4.54092878045381 * GRP_RMntFrq10
          +     0.58944361382169 * GRP_Recency2  +    -1.67787675914457 *
        GRP_Recency3  +    -0.91945083634427 * GRP_Recency4
          +    -0.23606342713401 * GRP_Recency5  +     0.82900786271425 *
        GRP_Recency6  +     0.17592316512272 * GRP_Recency7
          +     1.95888212107252 * GRP_Recency8  +      -1.118949694735 *
        GRP_Recency9  +     -0.6213199815951 * GRP_Recency10 ;
   H1x1_3  = H1x1_3  +     0.93426558045547 * GRP_AcceptedCmp52
          +     0.58768630988717 * GRP_AcceptedCmpTotal3
          +    -1.51960343620707 * GRP_Frq2  +    -1.98554513483427 * GRP_Frq3
          +     0.99517325158626 * GRP_Frq4  +    -1.43534788488184 * GRP_Frq5
          +    -1.74159367781906 * GRP_Frq6  +    -2.24167428586446 * GRP_Frq7
          +    -1.26021179170898 * GRP_Frq8  +     0.10708963233949 * GRP_Frq9
          +    -0.08287659877378 * GRP_Frq10  +    -0.29602203429318 *
        GRP_Income2  +    -1.70148026213507 * GRP_Income3
          +     0.28159451624585 * GRP_Income4  +      0.6177722344415 *
        GRP_Income5  +    -2.23556766589076 * GRP_Income6
          +     3.93505019030186 * GRP_Income7  +     -2.0824621480124 *
        GRP_Income8  +     1.88660584456731 * GRP_Income9
          +     0.90295722629145 * GRP_Income10  +     0.04984689303414 *
        GRP_Mnt2  +    -0.50038201931754 * GRP_Mnt3  +    -1.62831680351379 *
        GRP_Mnt4  +      1.4492453889036 * GRP_Mnt5  +    -0.19189043815297 *
        GRP_Mnt6  +     0.64443706548299 * GRP_Mnt7  +     0.17668938010528 *
        GRP_Mnt8  +     1.28610426388581 * GRP_Mnt9  +    -2.01393224902779 *
        GRP_Mnt10  +     -2.3797115089998 * GRP_MntFishProducts3
          +     1.20810501566648 * GRP_MntFishProducts4
          +    -0.31798087525347 * GRP_MntFishProducts5
          +    -0.69237701732465 * GRP_MntFishProducts6
          +    -0.54891111072215 * GRP_MntFishProducts7
          +    -0.62013170184324 * GRP_MntFishProducts8
          +     1.17121982810796 * GRP_MntFishProducts9
          +    -3.62687099938455 * GRP_MntFishProducts10
          +     2.07559340651906 * GRP_MntGoldProds2
          +     0.78435949490522 * GRP_MntGoldProds3
          +      1.0403239403189 * GRP_MntGoldProds4
          +    -0.66844808788018 * GRP_MntGoldProds5
          +    -0.48019660076402 * GRP_MntGoldProds6
          +      0.6062935347869 * GRP_MntGoldProds7
          +    -0.38141722319712 * GRP_MntGoldProds8
          +    -1.92694153724383 * GRP_MntGoldProds9
          +     -2.3811309398323 * GRP_MntGoldProds10
          +     0.10759987908894 * GRP_MntMeatProducts2
          +     2.14459189351851 * GRP_MntMeatProducts3
          +    -2.45166597704042 * GRP_MntMeatProducts4
          +     -0.7650846730976 * GRP_MntMeatProducts5
          +    -3.51160870099496 * GRP_MntMeatProducts6
          +     -0.8259206362298 * GRP_MntMeatProducts7
          +     0.29979404593461 * GRP_MntMeatProducts8
          +     -0.9589168823801 * GRP_MntMeatProducts9
          +     -0.2853616099647 * GRP_MntMeatProducts10
          +     0.49848568055456 * GRP_MntSweetProducts3
          +    -0.72776474415712 * GRP_MntSweetProducts4
          +     0.74313666927565 * GRP_MntSweetProducts5
          +     0.84606469030976 * GRP_MntSweetProducts6
          +    -0.38145119762704 * GRP_MntSweetProducts7
          +    -1.43497411133169 * GRP_MntSweetProducts8
          +    -0.84817446071124 * GRP_MntSweetProducts9
          +    -0.09240038512346 * GRP_MntSweetProducts10
          +    -1.08774185820812 * GRP_MntWines2  +    -0.39031626452132 *
        GRP_MntWines3  +    -0.58688830577606 * GRP_MntWines4
          +     0.22911849699923 * GRP_MntWines5  +     2.74308065676411 *
        GRP_MntWines6  +    -1.07317065256082 * GRP_MntWines7
          +    -1.81019667683263 * GRP_MntWines8  +    -0.17488280044697 *
        GRP_MntWines9  +     0.76965731666557 * GRP_MntWines10
          +     1.45683083695577 * GRP_NumCatalogPurchases3
          +     2.55194057820162 * GRP_NumCatalogPurchases4
          +    -0.63390649143698 * GRP_NumCatalogPurchases5
          +    -0.55465371468416 * GRP_NumCatalogPurchases6
          +    -1.41375459861532 * GRP_NumCatalogPurchases7
          +     0.71013591832499 * GRP_NumDistPurchases2
          +    -0.99941348822511 * GRP_NumDistPurchases3
          +    -1.71222646914551 * GRP_NumDistPurchases4
          +     -0.8355751544695 * GRP_NumDistPurchases5
          +     1.09722441702491 * GRP_NumDistPurchases6
          +    -0.36564797968298 * GRP_NumDistPurchases7
          +    -1.39173348713836 * GRP_NumDistPurchases8
          +    -1.61047806766864 * GRP_NumDistPurchases9
          +    -0.31673455057836 * GRP_NumDistPurchases10
          +     1.71749014777959 * GRP_NumWebPurchases2
          +    -0.61464421268827 * GRP_NumWebPurchases3
          +     0.55447637104071 * GRP_NumWebPurchases4
          +    -1.81323137433091 * GRP_NumWebPurchases5
          +    -1.22214842263814 * GRP_NumWebPurchases6
          +     0.28275706587518 * GRP_NumWebPurchases7
          +     1.22923531582435 * GRP_NumWebPurchases8
          +     2.85238831013779 * GRP_NumWebVisitsMonth2
          +    -3.29385804821776 * GRP_NumWebVisitsMonth3
          +     2.20618829723914 * GRP_NumWebVisitsMonth4
          +     3.24203514545625 * GRP_NumWebVisitsMonth5
          +    -0.84086906040118 * GRP_NumWebVisitsMonth6
          +      0.3333837280375 * GRP_NumWebVisitsMonth7
          +    -1.25762217338287 * GRP_NumWebVisitsMonth8
          +     1.30519643221337 * GRP_RFMstat2  +    -0.02627804260872 *
        GRP_RFMstat3  +     1.14984082845421 * GRP_RFMstat4
          +     0.83225475534069 * GRP_RFMstat5  +    -0.42428538184132 *
        GRP_RFMstat6  +     1.94081253380073 * GRP_RFMstat7
          +    -0.76825104075311 * GRP_RFMstat8  +    -0.46997664130688 *
        GRP_RFMstat9  +     0.65545683682605 * GRP_RFMstat10
          +     0.22000711002242 * GRP_RMntFrq2  +    -0.02562020055082 *
        GRP_RMntFrq3  +    -2.48187788965499 * GRP_RMntFrq4
          +     0.66508637059331 * GRP_RMntFrq5  +     1.45751327667919 *
        GRP_RMntFrq6  +    -1.96809727947204 * GRP_RMntFrq7
          +     -0.8082292555095 * GRP_RMntFrq8  +     1.11614264001551 *
        GRP_RMntFrq9  +    -1.43870507651779 * GRP_RMntFrq10
          +    -0.57256200762816 * GRP_Recency2  +    -1.71538421405636 *
        GRP_Recency3  +    -2.19388644962641 * GRP_Recency4
          +    -1.37716674588339 * GRP_Recency5  +     1.63969065912165 *
        GRP_Recency6  +     -1.6515031413567 * GRP_Recency7
          +      2.3895996064376 * GRP_Recency8  +     2.13861252560781 *
        GRP_Recency9  +    -0.93183650754976 * GRP_Recency10 ;
   H1x1_1  =    -0.72291715628882 + H1x1_1 ;
   H1x1_2  =    -0.26964559997869 + H1x1_2 ;
   H1x1_3  =     0.02355688048223 + H1x1_3 ;
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
   P_DepVar1  =    -0.57143452341404 * H1x1_1  +    -7.51528087621546 * H1x1_2
          +    -7.29696024025406 * H1x1_3 ;
   P_DepVar1  =     1.14031494500233 + P_DepVar1 ;
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
* Ensmbl49: Scoring Code of model 3 of 7;
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
* Ensmbl49: Scoring Code of model 4 of 7;
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
   P_DepVar1  =     0.13041505791867 * S_Year_Birth ;
   P_DepVar1  = P_DepVar1  +    -0.81394914954047 * GRP_AcceptedCmp52
          +    -1.57479065391046 * GRP_AcceptedCmpTotal3
          +     0.55721665311121 * GRP_Frq2  +     2.03538591612101 * GRP_Frq3
          +     1.71084973908714 * GRP_Frq4  +     0.93073119070526 * GRP_Frq5
          +     0.58841250291933 * GRP_Frq6  +    -0.21635109021843 * GRP_Frq7
          +      0.0213506254167 * GRP_Frq8  +    -1.30191697936168 * GRP_Frq9
          +    -1.31179820046974 * GRP_Frq10  +    -1.08336033604841 *
        GRP_Income2  +    -0.79871206076892 * GRP_Income3
          +    -0.30315183422585 * GRP_Income4  +     0.82131408307175 *
        GRP_Income5  +     0.48741274023405 * GRP_Income6
          +    -0.50872786670529 * GRP_Income7  +     -0.8768319258445 *
        GRP_Income8  +    -0.05749742206435 * GRP_Income9
          +     0.62080590842343 * GRP_Income10  +     2.52780693320463 *
        GRP_Mnt2  +     1.42753900899901 * GRP_Mnt3  +    -0.37486538648468 *
        GRP_Mnt4  +    -0.70186702387476 * GRP_Mnt5  +    -1.09419855761909 *
        GRP_Mnt6  +    -0.74794036813571 * GRP_Mnt7  +    -0.38086942027823 *
        GRP_Mnt8  +    -0.14878906184572 * GRP_Mnt9  +     0.10029389010909 *
        GRP_Mnt10  +     0.93741359799158 * GRP_MntFishProducts3
          +     0.33815869767181 * GRP_MntFishProducts4
          +     0.18521216857753 * GRP_MntFishProducts5
          +    -0.17622093488116 * GRP_MntFishProducts6
          +     0.10360579093666 * GRP_MntFishProducts7
          +     0.67417645975591 * GRP_MntFishProducts8
          +     -0.4949659833943 * GRP_MntFishProducts9
          +    -0.53307075001864 * GRP_MntFishProducts10
          +    -0.44965793048776 * GRP_MntGoldProds2
          +     0.70029834666821 * GRP_MntGoldProds3
          +     0.26643011384249 * GRP_MntGoldProds4
          +      0.2416000208193 * GRP_MntGoldProds5
          +    -0.16739557727601 * GRP_MntGoldProds6
          +    -0.03966136377161 * GRP_MntGoldProds7
          +    -0.14433335823753 * GRP_MntGoldProds8
          +    -0.01379766565883 * GRP_MntGoldProds9
          +    -0.47948207920798 * GRP_MntGoldProds10
          +     -7.7797809223883 * GRP_MntMeatProducts2
          +    -4.30448682283205 * GRP_MntMeatProducts3
          +    -3.09196678122785 * GRP_MntMeatProducts4
          +    -1.39782945162908 * GRP_MntMeatProducts5
          +     0.98656746132259 * GRP_MntMeatProducts6
          +     1.23570299146524 * GRP_MntMeatProducts7
          +     2.63070630185363 * GRP_MntMeatProducts8
          +     2.57140709387759 * GRP_MntMeatProducts9
          +     3.88874807046828 * GRP_MntMeatProducts10
          +     0.33174074042224 * GRP_MntSweetProducts3
          +     0.69101850116915 * GRP_MntSweetProducts4
          +     0.17295436074838 * GRP_MntSweetProducts5
          +      0.0314089298439 * GRP_MntSweetProducts6
          +     0.79474403533727 * GRP_MntSweetProducts7
          +    -0.35030029933384 * GRP_MntSweetProducts8
          +    -0.22491638984504 * GRP_MntSweetProducts9
          +    -0.26300371563779 * GRP_MntSweetProducts10
          +       4.623529533535 * GRP_MntWines2  +     3.38930591268617 *
        GRP_MntWines3  +     2.86869681071208 * GRP_MntWines4
          +     1.99919334553514 * GRP_MntWines5  +     0.51392642718101 *
        GRP_MntWines6  +    -0.54295287328303 * GRP_MntWines7
          +     -1.9404151310852 * GRP_MntWines8  +    -2.81755694441313 *
        GRP_MntWines9  +    -3.65585472427726 * GRP_MntWines10
          +    -6.48636650946379 * GRP_NumCatalogPurchases3
          +    -2.42520952237724 * GRP_NumCatalogPurchases4
          +     0.23992315717993 * GRP_NumCatalogPurchases5
          +     1.78022371269645 * GRP_NumCatalogPurchases6
          +     2.51919850869031 * GRP_NumCatalogPurchases7
          +    -0.29160915509933 * GRP_NumDistPurchases2
          +    -1.59386292237547 * GRP_NumDistPurchases3
          +    -0.58149143918747 * GRP_NumDistPurchases4
          +    -0.15227686380495 * GRP_NumDistPurchases5
          +    -0.39776772752273 * GRP_NumDistPurchases6
          +    -0.25189925687254 * GRP_NumDistPurchases7
          +     -0.8006222944202 * GRP_NumDistPurchases8
          +      1.1137088740435 * GRP_NumDistPurchases9
          +     1.23069956311587 * GRP_NumDistPurchases10
          +     0.00077574452293 * GRP_NumWebPurchases2
          +     0.24159496564294 * GRP_NumWebPurchases3
          +     0.30982055062128 * GRP_NumWebPurchases4
          +     0.91413433678014 * GRP_NumWebPurchases5
          +     0.47430505202684 * GRP_NumWebPurchases6
          +     0.05910332727627 * GRP_NumWebPurchases7
          +    -0.73591735479205 * GRP_NumWebPurchases8
          +     -4.1347431929822 * GRP_NumWebVisitsMonth2
          +    -2.56208193086546 * GRP_NumWebVisitsMonth3
          +    -1.81937126717482 * GRP_NumWebVisitsMonth4
          +    -0.77444924696859 * GRP_NumWebVisitsMonth5
          +     0.82562856901811 * GRP_NumWebVisitsMonth6
          +     1.04369947846006 * GRP_NumWebVisitsMonth7
          +     2.55675009308953 * GRP_NumWebVisitsMonth8
          +     0.20809605612831 * GRP_RFMstat2  +    -1.61430160476517 *
        GRP_RFMstat3  +    -0.52301122119481 * GRP_RFMstat4
          +    -0.55945361088087 * GRP_RFMstat5  +    -0.14424212281577 *
        GRP_RFMstat6  +     1.05234320810026 * GRP_RFMstat7
          +    -0.05407410464352 * GRP_RFMstat8  +    -0.01646632074069 *
        GRP_RFMstat9  +     0.70828472822109 * GRP_RFMstat10
          +      1.8726948284706 * GRP_RMntFrq2  +     1.05367221065359 *
        GRP_RMntFrq3  +     1.16252388400818 * GRP_RMntFrq4
          +    -0.68337506267394 * GRP_RMntFrq5  +    -0.30999632256804 *
        GRP_RMntFrq6  +      -1.800352250825 * GRP_RMntFrq7
          +    -1.53582014310476 * GRP_RMntFrq8  +    -0.07192943405375 *
        GRP_RMntFrq9  +    -0.60583604685254 * GRP_RMntFrq10
          +     3.84355692804923 * GRP_Recency2  +     2.89076929480023 *
        GRP_Recency3  +     2.87026210399223 * GRP_Recency4
          +     1.49685595027077 * GRP_Recency5  +    -0.07603609831014 *
        GRP_Recency6  +    -0.44761807904964 * GRP_Recency7
          +    -1.48577941891686 * GRP_Recency8  +    -1.45982970045671 *
        GRP_Recency9  +     -3.5176122167203 * GRP_Recency10 ;
   P_DepVar1  =    -3.73504752117057 + P_DepVar1 ;
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
* Ensmbl49: Scoring Code of model 5 of 7;
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
   P_DepVar1  =     0.13041505791867 * S_Year_Birth ;
   P_DepVar1  = P_DepVar1  +    -0.81394914954047 * GRP_AcceptedCmp52
          +    -1.57479065391046 * GRP_AcceptedCmpTotal3
          +     0.55721665311121 * GRP_Frq2  +     2.03538591612101 * GRP_Frq3
          +     1.71084973908714 * GRP_Frq4  +     0.93073119070526 * GRP_Frq5
          +     0.58841250291933 * GRP_Frq6  +    -0.21635109021843 * GRP_Frq7
          +      0.0213506254167 * GRP_Frq8  +    -1.30191697936168 * GRP_Frq9
          +    -1.31179820046974 * GRP_Frq10  +    -1.08336033604841 *
        GRP_Income2  +    -0.79871206076892 * GRP_Income3
          +    -0.30315183422585 * GRP_Income4  +     0.82131408307175 *
        GRP_Income5  +     0.48741274023405 * GRP_Income6
          +    -0.50872786670529 * GRP_Income7  +     -0.8768319258445 *
        GRP_Income8  +    -0.05749742206435 * GRP_Income9
          +     0.62080590842343 * GRP_Income10  +     2.52780693320463 *
        GRP_Mnt2  +     1.42753900899901 * GRP_Mnt3  +    -0.37486538648468 *
        GRP_Mnt4  +    -0.70186702387476 * GRP_Mnt5  +    -1.09419855761909 *
        GRP_Mnt6  +    -0.74794036813571 * GRP_Mnt7  +    -0.38086942027823 *
        GRP_Mnt8  +    -0.14878906184572 * GRP_Mnt9  +     0.10029389010909 *
        GRP_Mnt10  +     0.93741359799158 * GRP_MntFishProducts3
          +     0.33815869767181 * GRP_MntFishProducts4
          +     0.18521216857753 * GRP_MntFishProducts5
          +    -0.17622093488116 * GRP_MntFishProducts6
          +     0.10360579093666 * GRP_MntFishProducts7
          +     0.67417645975591 * GRP_MntFishProducts8
          +     -0.4949659833943 * GRP_MntFishProducts9
          +    -0.53307075001864 * GRP_MntFishProducts10
          +    -0.44965793048776 * GRP_MntGoldProds2
          +     0.70029834666821 * GRP_MntGoldProds3
          +     0.26643011384249 * GRP_MntGoldProds4
          +      0.2416000208193 * GRP_MntGoldProds5
          +    -0.16739557727601 * GRP_MntGoldProds6
          +    -0.03966136377161 * GRP_MntGoldProds7
          +    -0.14433335823753 * GRP_MntGoldProds8
          +    -0.01379766565883 * GRP_MntGoldProds9
          +    -0.47948207920798 * GRP_MntGoldProds10
          +     -7.7797809223883 * GRP_MntMeatProducts2
          +    -4.30448682283205 * GRP_MntMeatProducts3
          +    -3.09196678122785 * GRP_MntMeatProducts4
          +    -1.39782945162908 * GRP_MntMeatProducts5
          +     0.98656746132259 * GRP_MntMeatProducts6
          +     1.23570299146524 * GRP_MntMeatProducts7
          +     2.63070630185363 * GRP_MntMeatProducts8
          +     2.57140709387759 * GRP_MntMeatProducts9
          +     3.88874807046828 * GRP_MntMeatProducts10
          +     0.33174074042224 * GRP_MntSweetProducts3
          +     0.69101850116915 * GRP_MntSweetProducts4
          +     0.17295436074838 * GRP_MntSweetProducts5
          +      0.0314089298439 * GRP_MntSweetProducts6
          +     0.79474403533727 * GRP_MntSweetProducts7
          +    -0.35030029933384 * GRP_MntSweetProducts8
          +    -0.22491638984504 * GRP_MntSweetProducts9
          +    -0.26300371563779 * GRP_MntSweetProducts10
          +       4.623529533535 * GRP_MntWines2  +     3.38930591268617 *
        GRP_MntWines3  +     2.86869681071208 * GRP_MntWines4
          +     1.99919334553514 * GRP_MntWines5  +     0.51392642718101 *
        GRP_MntWines6  +    -0.54295287328303 * GRP_MntWines7
          +     -1.9404151310852 * GRP_MntWines8  +    -2.81755694441313 *
        GRP_MntWines9  +    -3.65585472427726 * GRP_MntWines10
          +    -6.48636650946379 * GRP_NumCatalogPurchases3
          +    -2.42520952237724 * GRP_NumCatalogPurchases4
          +     0.23992315717993 * GRP_NumCatalogPurchases5
          +     1.78022371269645 * GRP_NumCatalogPurchases6
          +     2.51919850869031 * GRP_NumCatalogPurchases7
          +    -0.29160915509933 * GRP_NumDistPurchases2
          +    -1.59386292237547 * GRP_NumDistPurchases3
          +    -0.58149143918747 * GRP_NumDistPurchases4
          +    -0.15227686380495 * GRP_NumDistPurchases5
          +    -0.39776772752273 * GRP_NumDistPurchases6
          +    -0.25189925687254 * GRP_NumDistPurchases7
          +     -0.8006222944202 * GRP_NumDistPurchases8
          +      1.1137088740435 * GRP_NumDistPurchases9
          +     1.23069956311587 * GRP_NumDistPurchases10
          +     0.00077574452293 * GRP_NumWebPurchases2
          +     0.24159496564294 * GRP_NumWebPurchases3
          +     0.30982055062128 * GRP_NumWebPurchases4
          +     0.91413433678014 * GRP_NumWebPurchases5
          +     0.47430505202684 * GRP_NumWebPurchases6
          +     0.05910332727627 * GRP_NumWebPurchases7
          +    -0.73591735479205 * GRP_NumWebPurchases8
          +     -4.1347431929822 * GRP_NumWebVisitsMonth2
          +    -2.56208193086546 * GRP_NumWebVisitsMonth3
          +    -1.81937126717482 * GRP_NumWebVisitsMonth4
          +    -0.77444924696859 * GRP_NumWebVisitsMonth5
          +     0.82562856901811 * GRP_NumWebVisitsMonth6
          +     1.04369947846006 * GRP_NumWebVisitsMonth7
          +     2.55675009308953 * GRP_NumWebVisitsMonth8
          +     0.20809605612831 * GRP_RFMstat2  +    -1.61430160476517 *
        GRP_RFMstat3  +    -0.52301122119481 * GRP_RFMstat4
          +    -0.55945361088087 * GRP_RFMstat5  +    -0.14424212281577 *
        GRP_RFMstat6  +     1.05234320810026 * GRP_RFMstat7
          +    -0.05407410464352 * GRP_RFMstat8  +    -0.01646632074069 *
        GRP_RFMstat9  +     0.70828472822109 * GRP_RFMstat10
          +      1.8726948284706 * GRP_RMntFrq2  +     1.05367221065359 *
        GRP_RMntFrq3  +     1.16252388400818 * GRP_RMntFrq4
          +    -0.68337506267394 * GRP_RMntFrq5  +    -0.30999632256804 *
        GRP_RMntFrq6  +      -1.800352250825 * GRP_RMntFrq7
          +    -1.53582014310476 * GRP_RMntFrq8  +    -0.07192943405375 *
        GRP_RMntFrq9  +    -0.60583604685254 * GRP_RMntFrq10
          +     3.84355692804923 * GRP_Recency2  +     2.89076929480023 *
        GRP_Recency3  +     2.87026210399223 * GRP_Recency4
          +     1.49685595027077 * GRP_Recency5  +    -0.07603609831014 *
        GRP_Recency6  +    -0.44761807904964 * GRP_Recency7
          +    -1.48577941891686 * GRP_Recency8  +    -1.45982970045671 *
        GRP_Recency9  +     -3.5176122167203 * GRP_Recency10 ;
   P_DepVar1  =    -3.73504752117057 + P_DepVar1 ;
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
* Ensmbl49: Scoring Code of model 6 of 7;
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
   P_DepVar1  =     0.13041505791867 * S_Year_Birth ;
   P_DepVar1  = P_DepVar1  +    -0.81394914954047 * GRP_AcceptedCmp52
          +    -1.57479065391046 * GRP_AcceptedCmpTotal3
          +     0.55721665311121 * GRP_Frq2  +     2.03538591612101 * GRP_Frq3
          +     1.71084973908714 * GRP_Frq4  +     0.93073119070526 * GRP_Frq5
          +     0.58841250291933 * GRP_Frq6  +    -0.21635109021843 * GRP_Frq7
          +      0.0213506254167 * GRP_Frq8  +    -1.30191697936168 * GRP_Frq9
          +    -1.31179820046974 * GRP_Frq10  +    -1.08336033604841 *
        GRP_Income2  +    -0.79871206076892 * GRP_Income3
          +    -0.30315183422585 * GRP_Income4  +     0.82131408307175 *
        GRP_Income5  +     0.48741274023405 * GRP_Income6
          +    -0.50872786670529 * GRP_Income7  +     -0.8768319258445 *
        GRP_Income8  +    -0.05749742206435 * GRP_Income9
          +     0.62080590842343 * GRP_Income10  +     2.52780693320463 *
        GRP_Mnt2  +     1.42753900899901 * GRP_Mnt3  +    -0.37486538648468 *
        GRP_Mnt4  +    -0.70186702387476 * GRP_Mnt5  +    -1.09419855761909 *
        GRP_Mnt6  +    -0.74794036813571 * GRP_Mnt7  +    -0.38086942027823 *
        GRP_Mnt8  +    -0.14878906184572 * GRP_Mnt9  +     0.10029389010909 *
        GRP_Mnt10  +     0.93741359799158 * GRP_MntFishProducts3
          +     0.33815869767181 * GRP_MntFishProducts4
          +     0.18521216857753 * GRP_MntFishProducts5
          +    -0.17622093488116 * GRP_MntFishProducts6
          +     0.10360579093666 * GRP_MntFishProducts7
          +     0.67417645975591 * GRP_MntFishProducts8
          +     -0.4949659833943 * GRP_MntFishProducts9
          +    -0.53307075001864 * GRP_MntFishProducts10
          +    -0.44965793048776 * GRP_MntGoldProds2
          +     0.70029834666821 * GRP_MntGoldProds3
          +     0.26643011384249 * GRP_MntGoldProds4
          +      0.2416000208193 * GRP_MntGoldProds5
          +    -0.16739557727601 * GRP_MntGoldProds6
          +    -0.03966136377161 * GRP_MntGoldProds7
          +    -0.14433335823753 * GRP_MntGoldProds8
          +    -0.01379766565883 * GRP_MntGoldProds9
          +    -0.47948207920798 * GRP_MntGoldProds10
          +     -7.7797809223883 * GRP_MntMeatProducts2
          +    -4.30448682283205 * GRP_MntMeatProducts3
          +    -3.09196678122785 * GRP_MntMeatProducts4
          +    -1.39782945162908 * GRP_MntMeatProducts5
          +     0.98656746132259 * GRP_MntMeatProducts6
          +     1.23570299146524 * GRP_MntMeatProducts7
          +     2.63070630185363 * GRP_MntMeatProducts8
          +     2.57140709387759 * GRP_MntMeatProducts9
          +     3.88874807046828 * GRP_MntMeatProducts10
          +     0.33174074042224 * GRP_MntSweetProducts3
          +     0.69101850116915 * GRP_MntSweetProducts4
          +     0.17295436074838 * GRP_MntSweetProducts5
          +      0.0314089298439 * GRP_MntSweetProducts6
          +     0.79474403533727 * GRP_MntSweetProducts7
          +    -0.35030029933384 * GRP_MntSweetProducts8
          +    -0.22491638984504 * GRP_MntSweetProducts9
          +    -0.26300371563779 * GRP_MntSweetProducts10
          +       4.623529533535 * GRP_MntWines2  +     3.38930591268617 *
        GRP_MntWines3  +     2.86869681071208 * GRP_MntWines4
          +     1.99919334553514 * GRP_MntWines5  +     0.51392642718101 *
        GRP_MntWines6  +    -0.54295287328303 * GRP_MntWines7
          +     -1.9404151310852 * GRP_MntWines8  +    -2.81755694441313 *
        GRP_MntWines9  +    -3.65585472427726 * GRP_MntWines10
          +    -6.48636650946379 * GRP_NumCatalogPurchases3
          +    -2.42520952237724 * GRP_NumCatalogPurchases4
          +     0.23992315717993 * GRP_NumCatalogPurchases5
          +     1.78022371269645 * GRP_NumCatalogPurchases6
          +     2.51919850869031 * GRP_NumCatalogPurchases7
          +    -0.29160915509933 * GRP_NumDistPurchases2
          +    -1.59386292237547 * GRP_NumDistPurchases3
          +    -0.58149143918747 * GRP_NumDistPurchases4
          +    -0.15227686380495 * GRP_NumDistPurchases5
          +    -0.39776772752273 * GRP_NumDistPurchases6
          +    -0.25189925687254 * GRP_NumDistPurchases7
          +     -0.8006222944202 * GRP_NumDistPurchases8
          +      1.1137088740435 * GRP_NumDistPurchases9
          +     1.23069956311587 * GRP_NumDistPurchases10
          +     0.00077574452293 * GRP_NumWebPurchases2
          +     0.24159496564294 * GRP_NumWebPurchases3
          +     0.30982055062128 * GRP_NumWebPurchases4
          +     0.91413433678014 * GRP_NumWebPurchases5
          +     0.47430505202684 * GRP_NumWebPurchases6
          +     0.05910332727627 * GRP_NumWebPurchases7
          +    -0.73591735479205 * GRP_NumWebPurchases8
          +     -4.1347431929822 * GRP_NumWebVisitsMonth2
          +    -2.56208193086546 * GRP_NumWebVisitsMonth3
          +    -1.81937126717482 * GRP_NumWebVisitsMonth4
          +    -0.77444924696859 * GRP_NumWebVisitsMonth5
          +     0.82562856901811 * GRP_NumWebVisitsMonth6
          +     1.04369947846006 * GRP_NumWebVisitsMonth7
          +     2.55675009308953 * GRP_NumWebVisitsMonth8
          +     0.20809605612831 * GRP_RFMstat2  +    -1.61430160476517 *
        GRP_RFMstat3  +    -0.52301122119481 * GRP_RFMstat4
          +    -0.55945361088087 * GRP_RFMstat5  +    -0.14424212281577 *
        GRP_RFMstat6  +     1.05234320810026 * GRP_RFMstat7
          +    -0.05407410464352 * GRP_RFMstat8  +    -0.01646632074069 *
        GRP_RFMstat9  +     0.70828472822109 * GRP_RFMstat10
          +      1.8726948284706 * GRP_RMntFrq2  +     1.05367221065359 *
        GRP_RMntFrq3  +     1.16252388400818 * GRP_RMntFrq4
          +    -0.68337506267394 * GRP_RMntFrq5  +    -0.30999632256804 *
        GRP_RMntFrq6  +      -1.800352250825 * GRP_RMntFrq7
          +    -1.53582014310476 * GRP_RMntFrq8  +    -0.07192943405375 *
        GRP_RMntFrq9  +    -0.60583604685254 * GRP_RMntFrq10
          +     3.84355692804923 * GRP_Recency2  +     2.89076929480023 *
        GRP_Recency3  +     2.87026210399223 * GRP_Recency4
          +     1.49685595027077 * GRP_Recency5  +    -0.07603609831014 *
        GRP_Recency6  +    -0.44761807904964 * GRP_Recency7
          +    -1.48577941891686 * GRP_Recency8  +    -1.45982970045671 *
        GRP_Recency9  +     -3.5176122167203 * GRP_Recency10 ;
   P_DepVar1  =    -3.73504752117057 + P_DepVar1 ;
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
* Ensmbl49: Scoring Code of model 7 of 7;
*------------------------------------------------------------*;
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
   H1x1_1  =     48.9625880039011 * S_Year_Birth ;
   H1x1_2  =      2.3480613207553 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     0.57296040682617 * GRP_AcceptedCmp52
          +    -0.43465944274373 * GRP_AcceptedCmpTotal3
          +     1.23568422751721 * GRP_Frq2  +    -0.49642506525192 * GRP_Frq3
          +     0.70391697171995 * GRP_Frq4  +    -0.14134436933193 * GRP_Frq5
          +    -0.01549682506912 * GRP_Frq6  +    -0.22657110244223 * GRP_Frq7
          +    -0.59754004286083 * GRP_Frq8  +     0.45674940127248 * GRP_Frq9
          +     0.58716648285248 * GRP_Frq10  +    -0.18777243366208 *
        GRP_Income2  +    -1.32693054983924 * GRP_Income3
          +     -2.7858893286266 * GRP_Income4  +     0.20438057327906 *
        GRP_Income5  +    -1.79342297827195 * GRP_Income6
          +    -0.47556756437272 * GRP_Income7  +    -0.17877089966588 *
        GRP_Income8  +      0.8209391880457 * GRP_Income9
          +    -1.26814273934749 * GRP_Income10  +      1.9670286664293 *
        GRP_Mnt2  +    -0.66603911666343 * GRP_Mnt3  +    -0.01872708755225 *
        GRP_Mnt4  +    -1.28267768198581 * GRP_Mnt5  +    -1.81153804919439 *
        GRP_Mnt6  +    -0.97927179380128 * GRP_Mnt7  +    -0.52660882489285 *
        GRP_Mnt8  +    -1.63152344901596 * GRP_Mnt9  +    -0.10917591385297 *
        GRP_Mnt10  +     1.44940124094155 * GRP_MntFishProducts3
          +    -0.40183612400826 * GRP_MntFishProducts4
          +    -0.10084968960434 * GRP_MntFishProducts5
          +    -0.68000795418335 * GRP_MntFishProducts6
          +      1.0610975136973 * GRP_MntFishProducts7
          +     -1.1949205528412 * GRP_MntFishProducts8
          +     0.09090070748983 * GRP_MntFishProducts9
          +    -0.40175894232552 * GRP_MntFishProducts10
          +      1.3023525948528 * GRP_MntGoldProds2
          +     1.95382840240501 * GRP_MntGoldProds3
          +     0.27205885452257 * GRP_MntGoldProds4
          +     0.07188433078595 * GRP_MntGoldProds5
          +     1.22176523622961 * GRP_MntGoldProds6
          +    -1.20646098377835 * GRP_MntGoldProds7
          +    -1.68955690431328 * GRP_MntGoldProds8
          +     2.16262517323031 * GRP_MntGoldProds9
          +     1.61952763590646 * GRP_MntGoldProds10
          +    -0.20636764590717 * GRP_MntMeatProducts2
          +     1.36852317568288 * GRP_MntMeatProducts3
          +     1.55904989423062 * GRP_MntMeatProducts4
          +    -0.48087366849043 * GRP_MntMeatProducts5
          +     0.23702242104668 * GRP_MntMeatProducts6
          +     0.53543554113074 * GRP_MntMeatProducts7
          +     -0.6708299035154 * GRP_MntMeatProducts8
          +    -0.25109599944325 * GRP_MntMeatProducts9
          +     0.34800482143107 * GRP_MntMeatProducts10
          +    -0.64275675988131 * GRP_MntSweetProducts3
          +    -1.34438451917461 * GRP_MntSweetProducts4
          +    -1.28424044633672 * GRP_MntSweetProducts5
          +      0.3645042718376 * GRP_MntSweetProducts6
          +    -0.88992624765171 * GRP_MntSweetProducts7
          +    -0.02323627679225 * GRP_MntSweetProducts8
          +    -1.20235441075321 * GRP_MntSweetProducts9
          +     0.92573964550675 * GRP_MntSweetProducts10
          +     0.38459347190258 * GRP_MntWines2  +    -1.68125902834379 *
        GRP_MntWines3  +    -2.19902112617128 * GRP_MntWines4
          +    -0.47642653358092 * GRP_MntWines5  +    -1.05491498054825 *
        GRP_MntWines6  +    -0.18428193629276 * GRP_MntWines7
          +    -0.64561524328336 * GRP_MntWines8  +     0.35183016181799 *
        GRP_MntWines9  +    -0.01485566952715 * GRP_MntWines10
          +     -0.6823197783855 * GRP_NumCatalogPurchases3
          +    -2.17309228552115 * GRP_NumCatalogPurchases4
          +    -1.24003936143545 * GRP_NumCatalogPurchases5
          +    -0.16693730130097 * GRP_NumCatalogPurchases6
          +    -0.32659751986957 * GRP_NumCatalogPurchases7
          +     0.90890508917256 * GRP_NumDistPurchases2
          +    -2.16774123507947 * GRP_NumDistPurchases3
          +     0.40681084726483 * GRP_NumDistPurchases4
          +    -0.75384919871728 * GRP_NumDistPurchases5
          +     1.05523509812166 * GRP_NumDistPurchases6
          +      0.9676988808176 * GRP_NumDistPurchases7
          +    -0.82423997194741 * GRP_NumDistPurchases8
          +    -1.36141265358941 * GRP_NumDistPurchases9
          +    -3.03686284313131 * GRP_NumDistPurchases10
          +     1.03642105167151 * GRP_NumWebPurchases2
          +     1.27129295107214 * GRP_NumWebPurchases3
          +    -0.06353523818212 * GRP_NumWebPurchases4
          +    -0.20570984251081 * GRP_NumWebPurchases5
          +     1.77139649920003 * GRP_NumWebPurchases6
          +     0.59260312488214 * GRP_NumWebPurchases7
          +    -0.57691453026943 * GRP_NumWebPurchases8
          +    -0.32223216300805 * GRP_NumWebVisitsMonth2
          +    -0.33350866192142 * GRP_NumWebVisitsMonth3
          +     -1.6134045162309 * GRP_NumWebVisitsMonth4
          +     0.93341369917817 * GRP_NumWebVisitsMonth5
          +     0.21061677257818 * GRP_NumWebVisitsMonth6
          +     0.59526240808864 * GRP_NumWebVisitsMonth7
          +     1.60573488860369 * GRP_NumWebVisitsMonth8
          +    -0.53142311203609 * GRP_RFMstat2  +      1.1014921229548 *
        GRP_RFMstat3  +     1.02859153032095 * GRP_RFMstat4
          +    -1.30208046908501 * GRP_RFMstat5  +    -0.05964394349423 *
        GRP_RFMstat6  +    -2.75511396407577 * GRP_RFMstat7
          +     1.44994927297721 * GRP_RFMstat8  +    -0.49216093900515 *
        GRP_RFMstat9  +    -1.17237824997322 * GRP_RFMstat10
          +     0.06012124933442 * GRP_RMntFrq2  +     0.56959620444203 *
        GRP_RMntFrq3  +    -1.32949170873388 * GRP_RMntFrq4
          +    -0.42155806865618 * GRP_RMntFrq5  +    -3.02702900614169 *
        GRP_RMntFrq6  +     1.24621212023665 * GRP_RMntFrq7
          +     0.97955296610433 * GRP_RMntFrq8  +     0.62231087279612 *
        GRP_RMntFrq9  +    -2.51649566610914 * GRP_RMntFrq10
          +     0.66757705078215 * GRP_Recency2  +     0.06231291035067 *
        GRP_Recency3  +    -0.43933192620497 * GRP_Recency4
          +     0.30190616339365 * GRP_Recency5  +    -0.40582348689776 *
        GRP_Recency6  +    -0.19283493143253 * GRP_Recency7
          +     1.43757093307186 * GRP_Recency8  +    -0.07098855181346 *
        GRP_Recency9  +    -0.14063396224268 * GRP_Recency10 ;
   H1x1_2  = H1x1_2  +     0.78960637022896 * GRP_AcceptedCmp52
          +     1.23177636491685 * GRP_AcceptedCmpTotal3
          +    -1.92783571713078 * GRP_Frq2  +    -2.63957329669848 * GRP_Frq3
          +     1.25110461191568 * GRP_Frq4  +    -2.50773888265754 * GRP_Frq5
          +    -2.57746693367116 * GRP_Frq6  +    -2.83487451340874 * GRP_Frq7
          +    -1.49499377179546 * GRP_Frq8  +     0.11561028606554 * GRP_Frq9
          +      0.7311918619786 * GRP_Frq10  +    -1.00451071629428 *
        GRP_Income2  +     -2.6898302666404 * GRP_Income3
          +    -0.95750286519084 * GRP_Income4  +     0.69265819586153 *
        GRP_Income5  +    -3.64261735467505 * GRP_Income6
          +     5.05833024408182 * GRP_Income7  +    -1.37256890014994 *
        GRP_Income8  +     3.01773584775352 * GRP_Income9
          +     1.61408516538641 * GRP_Income10  +    -0.79965017003551 *
        GRP_Mnt2  +     0.10817293299434 * GRP_Mnt3  +    -1.36651297926579 *
        GRP_Mnt4  +     1.12865169064702 * GRP_Mnt5  +    -0.99771117959611 *
        GRP_Mnt6  +     2.40214237251486 * GRP_Mnt7  +     -0.5117271308651 *
        GRP_Mnt8  +     2.01438343711111 * GRP_Mnt9  +    -2.42199568475662 *
        GRP_Mnt10  +     -1.0533736151102 * GRP_MntFishProducts3
          +     2.43812042941313 * GRP_MntFishProducts4
          +    -1.62876250077113 * GRP_MntFishProducts5
          +    -1.42472742042354 * GRP_MntFishProducts6
          +    -1.28883554797652 * GRP_MntFishProducts7
          +     -1.8967649908153 * GRP_MntFishProducts8
          +     1.45969180673523 * GRP_MntFishProducts9
          +     -3.1677371872164 * GRP_MntFishProducts10
          +     3.12892052894131 * GRP_MntGoldProds2
          +     0.87701102235469 * GRP_MntGoldProds3
          +     2.72098623398148 * GRP_MntGoldProds4
          +    -1.34909768450532 * GRP_MntGoldProds5
          +    -0.97528291247104 * GRP_MntGoldProds6
          +     0.51571780252401 * GRP_MntGoldProds7
          +    -0.09111680344158 * GRP_MntGoldProds8
          +    -2.19412431493192 * GRP_MntGoldProds9
          +     -2.9072222881073 * GRP_MntGoldProds10
          +     0.45741502061814 * GRP_MntMeatProducts2
          +     3.25604708959735 * GRP_MntMeatProducts3
          +     -2.7642277166213 * GRP_MntMeatProducts4
          +    -2.03175935592904 * GRP_MntMeatProducts5
          +    -3.06303197475919 * GRP_MntMeatProducts6
          +     0.92356105917794 * GRP_MntMeatProducts7
          +    -0.47055397964532 * GRP_MntMeatProducts8
          +    -1.27864469659448 * GRP_MntMeatProducts9
          +    -0.63915939696816 * GRP_MntMeatProducts10
          +      -0.558009883178 * GRP_MntSweetProducts3
          +    -0.74589832448642 * GRP_MntSweetProducts4
          +     2.24483656971418 * GRP_MntSweetProducts5
          +     1.60493863195828 * GRP_MntSweetProducts6
          +     0.59558657433792 * GRP_MntSweetProducts7
          +    -2.44940259192023 * GRP_MntSweetProducts8
          +    -1.87311281926098 * GRP_MntSweetProducts9
          +    -0.08002533847297 * GRP_MntSweetProducts10
          +    -1.80339759121661 * GRP_MntWines2  +    -0.36395041803024 *
        GRP_MntWines3  +    -1.35104361547645 * GRP_MntWines4
          +     0.43591577974273 * GRP_MntWines5  +     2.71549844689835 *
        GRP_MntWines6  +    -0.95191426252926 * GRP_MntWines7
          +    -1.41162725099911 * GRP_MntWines8  +    -0.00133470528999 *
        GRP_MntWines9  +     1.41436249992175 * GRP_MntWines10
          +     2.08453720967901 * GRP_NumCatalogPurchases3
          +     4.12890984024305 * GRP_NumCatalogPurchases4
          +    -1.24798884408257 * GRP_NumCatalogPurchases5
          +    -0.72949102954422 * GRP_NumCatalogPurchases6
          +     -2.5763662735991 * GRP_NumCatalogPurchases7
          +     0.84573511120107 * GRP_NumDistPurchases2
          +    -1.25571159703548 * GRP_NumDistPurchases3
          +    -1.52740566708902 * GRP_NumDistPurchases4
          +    -0.05879292423093 * GRP_NumDistPurchases5
          +     1.17938273022068 * GRP_NumDistPurchases6
          +     0.85635958132945 * GRP_NumDistPurchases7
          +    -1.30131606527889 * GRP_NumDistPurchases8
          +     -2.4962366758772 * GRP_NumDistPurchases9
          +    -0.38275352223391 * GRP_NumDistPurchases10
          +     2.39178618022488 * GRP_NumWebPurchases2
          +    -0.41905438105855 * GRP_NumWebPurchases3
          +     1.66286405908088 * GRP_NumWebPurchases4
          +    -1.19820637232512 * GRP_NumWebPurchases5
          +     0.44045554492246 * GRP_NumWebPurchases6
          +     1.01418061041709 * GRP_NumWebPurchases7
          +     1.60776204671951 * GRP_NumWebPurchases8
          +     3.61150318594445 * GRP_NumWebVisitsMonth2
          +    -3.76884910470716 * GRP_NumWebVisitsMonth3
          +     2.25392241969273 * GRP_NumWebVisitsMonth4
          +     4.29765580765502 * GRP_NumWebVisitsMonth5
          +    -0.15184862644719 * GRP_NumWebVisitsMonth6
          +    -0.00078561925087 * GRP_NumWebVisitsMonth7
          +    -2.55360228601633 * GRP_NumWebVisitsMonth8
          +     1.47274242872802 * GRP_RFMstat2  +     0.24459857984741 *
        GRP_RFMstat3  +     1.52397996779228 * GRP_RFMstat4
          +     0.89057903060985 * GRP_RFMstat5  +    -1.53451420712114 *
        GRP_RFMstat6  +     2.16562130999206 * GRP_RFMstat7
          +    -0.98612368004668 * GRP_RFMstat8  +    -0.05081101237493 *
        GRP_RFMstat9  +    -0.00858612413388 * GRP_RFMstat10
          +    -0.31695707409721 * GRP_RMntFrq2  +    -0.15325226845609 *
        GRP_RMntFrq3  +    -2.16814389453148 * GRP_RMntFrq4
          +     1.35548572905249 * GRP_RMntFrq5  +     1.15410180323568 *
        GRP_RMntFrq6  +    -0.99266974538625 * GRP_RMntFrq7
          +     0.21467962653372 * GRP_RMntFrq8  +     0.11072479261511 *
        GRP_RMntFrq9  +     -2.0542507434743 * GRP_RMntFrq10
          +    -1.49376319561211 * GRP_Recency2  +    -2.61141932291776 *
        GRP_Recency3  +    -3.13592383227366 * GRP_Recency4
          +    -2.57168419196934 * GRP_Recency5  +     1.02533489787473 *
        GRP_Recency6  +    -2.67711893364708 * GRP_Recency7
          +     2.63071743830208 * GRP_Recency8  +      3.3060381155291 *
        GRP_Recency9  +    -1.03682700820122 * GRP_Recency10 ;
   H1x1_1  =     0.67220585724541 + H1x1_1 ;
   H1x1_2  =     0.42334243451116 + H1x1_2 ;
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
   P_DepVar1  =    -1.79997072457069 * H1x1_1  +    -9.46328499314945 * H1x1_2
         ;
   P_DepVar1  =    -0.92121687514276 + P_DepVar1 ;
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
* Ensmbl49: Maximum Posteriors of 7 models;
*------------------------------------------------------------*;
_psum = 0;
drop _psum _premainder;
P_DepVar1 = max(
AutoNeural23_P_DepVar1 ,
AutoNeural25_P_DepVar1 ,
AutoNeural26_P_DepVar1 ,
AutoNeural20_P_DepVar1 ,
AutoNeural21_P_DepVar1 ,
AutoNeural22_P_DepVar1 ,
AutoNeural24_P_DepVar1
);
_premainder =1 - _psum;
if P_DepVar1 > _premainder then do;
P_DepVar1 = _premainder;
end;
_psum + P_DepVar1;
P_DepVar0 = max(
AutoNeural23_P_DepVar0 ,
AutoNeural25_P_DepVar0 ,
AutoNeural26_P_DepVar0 ,
AutoNeural20_P_DepVar0 ,
AutoNeural21_P_DepVar0 ,
AutoNeural22_P_DepVar0 ,
AutoNeural24_P_DepVar0
);
_premainder =1 - _psum;
if P_DepVar0 > _premainder then do;
P_DepVar0 = _premainder;
end;
_psum + P_DepVar0;
*------------------------------------------------------------*;
* Ensmbl49: Computing Classification Vars;
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
* Ensmbl49: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl49: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL23_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL23_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL23_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL23_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL25_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL25_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL25_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL25_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL26_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL26_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL26_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL26_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL20_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL20_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL20_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL20_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL21_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL21_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL21_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL21_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL22_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL22_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL22_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL22_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL24_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL24_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL24_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL24_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl49: Computing Residual Vars;
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
