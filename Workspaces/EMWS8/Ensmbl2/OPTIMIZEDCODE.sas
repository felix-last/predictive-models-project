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
HigherEducationBinary = HigherEducation;
MonthsAsCustomer = int((today()-Dt_Customer)/12);
NumDistPurchases = NumCatalogPurchases + NumWebPurchases;
*------------------------------------------------------------*;
* TOOL: Partition Class;
* TYPE: SAMPLE;
* NODE: Part;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
**********************************************************;
**** Begin scoring code for principal components analysis;
**********************************************************;
LENGTH _FORMAT $200;
LENGTH _NORMFMT $%DMNORLEN;
;
/************************************************/
* Create dummy variables for AcceptedCmp1;
/************************************************/
;
_FORMAT =PUT(AcceptedCmp1,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN AcceptedCmp1_1_=0.26876932144267;
ELSE AcceptedCmp1_1_=-3.71909548546304;
IF _NORMFMT ="1" THEN AcceptedCmp1_2_=3.71909548546304;
ELSE AcceptedCmp1_2_=-0.26876932144267;
;
/************************************************/
* Create dummy variables for AcceptedCmp2;
/************************************************/
;
_FORMAT =PUT(AcceptedCmp2,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN AcceptedCmp2_1_=0.11310722188902;
ELSE AcceptedCmp2_1_=-8.83744427026226;
IF _NORMFMT ="1" THEN AcceptedCmp2_2_=8.83744427026228;
ELSE AcceptedCmp2_2_=-0.11310722188902;
;
/************************************************/
* Create dummy variables for AcceptedCmp3;
/************************************************/
;
_FORMAT =PUT(AcceptedCmp3,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN AcceptedCmp3_1_=0.29992150711869;
ELSE AcceptedCmp3_1_=-3.33280123726789;
IF _NORMFMT ="1" THEN AcceptedCmp3_2_=3.33280123726789;
ELSE AcceptedCmp3_2_=-0.29992150711869;
;
/************************************************/
* Create dummy variables for AcceptedCmp4;
/************************************************/
;
_FORMAT =PUT(AcceptedCmp4,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN AcceptedCmp4_1_=0.27590552583209;
ELSE AcceptedCmp4_1_=-3.62290232134287;
IF _NORMFMT ="1" THEN AcceptedCmp4_2_=3.62290232134287;
ELSE AcceptedCmp4_2_=-0.27590552583209;
;
/************************************************/
* Create dummy variables for AcceptedCmp5;
/************************************************/
;
_FORMAT =PUT(AcceptedCmp5,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN AcceptedCmp5_1_=0.29319891417962;
ELSE AcceptedCmp5_1_=-3.4092171616844;
IF _NORMFMT ="1" THEN AcceptedCmp5_2_=3.4092171616844;
ELSE AcceptedCmp5_2_=-0.29319891417962;
;
/************************************************/
* Create dummy variables for Complain;
/************************************************/
;
_FORMAT =PUT(Complain,BEST.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN Complain_1_=0.11118241092474;
ELSE Complain_1_=-8.99043977994892;
IF _NORMFMT ="1" THEN Complain_2_=8.99043977994893;
ELSE Complain_2_=-0.11118241092474;
;
/************************************************/
* Create dummy variables for Education;
/************************************************/
;
_FORMAT =PUT(Education,$10.0);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="2N CYCLE" THEN Education_1_=3.04518447761689;
ELSE Education_1_=-0.3282490034202;
IF _NORMFMT ="BASIC" THEN Education_2_=5.5738665930895;
ELSE Education_2_=-0.17933309908201;
IF _NORMFMT ="GRADUATION" THEN Education_3_=1.00147534945259;
ELSE Education_3_=-0.99810621455115;
IF _NORMFMT ="MASTER" THEN Education_4_=2.33051829834795;
ELSE Education_4_=-0.4289083551573;
IF _NORMFMT ="PHD" THEN Education_5_=1.89952315602701;
ELSE Education_5_=-0.52622615672615;
;
/************************************************/
* Create dummy variables for HigherEducationBinary;
/************************************************/
;
_FORMAT =PUT(HigherEducationBinary, best12.);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="0" THEN HigherEducationBinary_1_=2.60398715412423;
ELSE HigherEducationBinary_1_=-0.38386470855867;
IF _NORMFMT ="1" THEN HigherEducationBinary_2_=0.38386470855867;
ELSE HigherEducationBinary_2_=-2.60398715412423;
;
/************************************************/
* Create dummy variables for Marital_Status;
/************************************************/
;
_FORMAT =PUT(Marital_Status,$8.0);
%DMNORMCP(_FORMAT , _NORMFMT );
IF _NORMFMT ="DIVORCED" THEN Marital_Status_1_=2.98126168425242;
ELSE Marital_Status_1_=-0.33528716224019;
IF _NORMFMT ="MARRIED" THEN Marital_Status_2_=1.18621875805397;
ELSE Marital_Status_2_=-0.84265972294036;
IF _NORMFMT ="SINGLE" THEN Marital_Status_3_=1.8948253753083;
ELSE Marital_Status_3_=-0.52753081261949;
IF _NORMFMT ="TOGETHER" THEN Marital_Status_4_=1.80152761035906;
ELSE Marital_Status_4_=-0.55485065244667;
IF _NORMFMT ="WIDOW" THEN Marital_Status_5_=5.65320745801221;
ELSE Marital_Status_5_=-0.17681621936441;
;
/************************************************/
* Impute missing values for interval variables;
/************************************************/
;
if AcceptedCmpTotal=. then _D1 = 0;
else _D1=(AcceptedCmpTotal-0.31255265374894)/0.66837726102124;
if Age=. then _D2 = 0;
else _D2=(Age-47.2059814658803)/12.0632948493558;
if Frq=. then _D3 = 0;
else _D3=(Frq-12.6545914069081)/7.15980860291451;
if Income=. then _D4 = 0;
else _D4=(Income-51962.545914069)/20878.2658128313;
if Kidhome=. then _D5 = 0;
else _D5=(Kidhome-0.43555181128896)/0.53438033047728;
if Mnt=. then _D6 = 0;
else _D6=(Mnt-615.68197135636)/604.537497355942;
if MntFishProducts=. then _D7 = 0;
else _D7=(MntFishProducts-36.4945240101095)/52.2208809602509;
if MntFruits=. then _D8 = 0;
else _D8=(MntFruits-27.153748946925)/39.7289323595324;
if MntGoldProds=. then _D9 = 0;
else _D9=(MntGoldProds-44.0589721988205)/51.1646481009475;
if MntMeatProducts=. then _D10 = 0;
else _D10=(MntMeatProducts-169.965037910699)/216.176716057929;
if MntSweetProducts=. then _D11 = 0;
else _D11=(MntSweetProducts-27.0804549283909)/39.2356363442449;
if MntWines=. then _D12 = 0;
else _D12=(MntWines-310.929233361415)/341.695699656276;
if MonthsAsCustomer=. then _D13 = 0;
else _D13=(MonthsAsCustomer-83.24599831508)/16.9420859404964;
if NumCatalogPurchases=. then _D14 = 0;
else _D14=(NumCatalogPurchases-2.64448188711036)/2.77214051734809;
if NumDealsPurchases=. then _D15 = 0;
else _D15=(NumDealsPurchases-2.25526537489469)/1.67318269219337;
if NumDistPurchases=. then _D16 = 0;
else _D16=(NumDistPurchases-6.73504633529907)/4.60209117827878;
if NumStorePurchases=. then _D17 = 0;
else _D17=(NumStorePurchases-5.91954507160909)/3.25562388118509;
if NumWebPurchases=. then _D18 = 0;
else _D18=(NumWebPurchases-4.09056444818871)/2.61390561975289;
if NumWebVisitsMonth=. then _D19 = 0;
else _D19=(NumWebVisitsMonth-5.24220724515585)/2.33225525940929;
if RFMstat=. then _D20 = 0;
else _D20=(RFMstat-531.396946202505)/1565.49314871989;
if RMntFrq=. then _D21 = 0;
else _D21=(RMntFrq-37.8039241814599)/30.0642993170191;
if Recency=. then _D22 = 0;
else _D22=(Recency-48.7742207245156)/28.8224799181808;
if Teenhome=. then _D23 = 0;
else _D23=(Teenhome-0.48652064026958)/0.55047336656954;
if Year_Birth=. then _D24 = 0;
else _D24=(Year_Birth-1968.79401853412)/12.063294849345;
;
DROP _FORMAT _NORMFMT
AcceptedCmp1_1_
AcceptedCmp1_2_
AcceptedCmp2_1_
AcceptedCmp2_2_
AcceptedCmp3_1_
AcceptedCmp3_2_
AcceptedCmp4_1_
AcceptedCmp4_2_
AcceptedCmp5_1_
AcceptedCmp5_2_
Complain_1_
Complain_2_
Education_1_
Education_2_
Education_3_
Education_4_
Education_5_
HigherEducationBinary_1_
HigherEducationBinary_2_
Marital_Status_1_
Marital_Status_2_
Marital_Status_3_
Marital_Status_4_
Marital_Status_5_
_D1
_D2
_D3
_D4
_D5
_D6
_D7
_D8
_D9
_D10
_D11
_D12
_D13
_D14
_D15
_D16
_D17
_D18
_D19
_D20
_D21
_D22
_D23
_D24
;
/****************************************/
* Principal Component 1;
/****************************************/
;
label PC_1 = "Principal Component 1";
PC_1 =
-0.139768641*AcceptedCmp1_1_+
0.1397686408*AcceptedCmp1_2_+
-0.057498795*AcceptedCmp2_1_+
0.0574987948*AcceptedCmp2_2_+
-0.021217358*AcceptedCmp3_1_+
0.0212173581*AcceptedCmp3_2_+
-0.096917934*AcceptedCmp4_1_+
0.0969179339*AcceptedCmp4_2_+
-0.167511979*AcceptedCmp5_1_+
0.1675119794*AcceptedCmp5_2_+
0.0083375978*Complain_1_+
-0.008337598*Complain_2_+
-0.038658609*Education_1_+
-0.058674861*Education_2_+
0.0161001343*Education_3_+
0.0198334453*Education_4_+
0.0155711137*Education_5_+
-0.064712001*HigherEducationBinary_1_+
0.0647120014*HigherEducationBinary_2_+
-0.003366478*Marital_Status_1_+
-0.004170187*Marital_Status_2_+
-0.002772342*Marital_Status_3_+
0.0027833604*Marital_Status_4_+
0.0176868236*Marital_Status_5_+
0.1756724591*_D1+
0.0521366803*_D2+
0.2646329541*_D3+
0.2628005347*_D4+
-0.183825035*_D5+
0.2832666938*_D6+
0.1846369874*_D7+
0.1877630286*_D8+
0.1582619005*_D9+
0.2418387755*_D10+
0.1859283542*_D11+
0.2530657056*_D12+
0.0320584731*_D13+
0.2522583397*_D14+
-0.04424864*_D15+
0.2560984818*_D16+
0.2199678966*_D17+
0.1833627794*_D18+
-0.170947519*_D19+
0.1176740833*_D20+
0.2527198381*_D21+
0.0001640728*_D22+
-0.041725177*_D23+
-0.05213668*_D24;
/****************************************/
* Principal Component 11;
/****************************************/
;
label PC_11 = "Principal Component 11";
PC_11 =
-0.240221132*AcceptedCmp1_1_+
0.2402211316*AcceptedCmp1_2_+
-0.17116232*AcceptedCmp2_1_+
0.1711623202*AcceptedCmp2_2_+
0.1813337637*AcceptedCmp3_1_+
-0.181333764*AcceptedCmp3_2_+
0.3123702061*AcceptedCmp4_1_+
-0.312370206*AcceptedCmp4_2_+
0.0110196947*AcceptedCmp5_1_+
-0.011019695*AcceptedCmp5_2_+
0.029890553*Complain_1_+
-0.029890553*Complain_2_+
-0.06784827*Education_1_+
0.0377035134*Education_2_+
-0.26941086*Education_3_+
0.0950128747*Education_4_+
0.276197156*Education_5_+
-0.040512404*HigherEducationBinary_1_+
0.0405124044*HigherEducationBinary_2_+
-0.059702506*Marital_Status_1_+
0.2979624653*Marital_Status_2_+
-0.26183622*Marital_Status_3_+
0.0081434237*Marital_Status_4_+
-0.141224419*Marital_Status_5_+
-0.080271126*_D1+
-0.131835345*_D2+
0.0692531156*_D3+
-0.001955144*_D4+
0.0911620645*_D5+
0.00793097*_D6+
-0.006964806*_D7+
-0.041011738*_D8+
-0.065717856*_D9+
0.0027755549*_D10+
-0.004645954*_D11+
0.0284824691*_D12+
0.1324596924*_D13+
0.0126674171*_D14+
0.1343913586*_D15+
0.0667956441*_D16+
0.0578811974*_D17+
0.1041674123*_D18+
0.0612165939*_D19+
-0.171871803*_D20+
-0.016576237*_D21+
0.2546135214*_D22+
-0.029087607*_D23+
0.1318353452*_D24;
/****************************************/
* Principal Component 12;
/****************************************/
;
label PC_12 = "Principal Component 12";
PC_12 =
0.0437531001*AcceptedCmp1_1_+
-0.0437531*AcceptedCmp1_2_+
0.0135077815*AcceptedCmp2_1_+
-0.013507781*AcceptedCmp2_2_+
0.0658690399*AcceptedCmp3_1_+
-0.06586904*AcceptedCmp3_2_+
0.1004013261*AcceptedCmp4_1_+
-0.100401326*AcceptedCmp4_2_+
-0.214101393*AcceptedCmp5_1_+
0.2141013928*AcceptedCmp5_2_+
0.0070669793*Complain_1_+
-0.007066979*Complain_2_+
-0.08157812*Education_1_+
0.1612553364*Education_2_+
0.0433452499*Education_3_+
0.0003058153*Education_4_+
-0.062182327*Education_5_+
0.0114921446*HigherEducationBinary_1_+
-0.011492145*HigherEducationBinary_2_+
-0.276319096*Marital_Status_1_+
0.1331080479*Marital_Status_2_+
-0.277881745*Marital_Status_3_+
0.2470307732*Marital_Status_4_+
0.1608449542*Marital_Status_5_+
0.002188616*_D1+
0.1032518842*_D2+
-0.051445785*_D3+
-0.091712508*_D4+
0.101151148*_D5+
0.0119739389*_D6+
0.0274168974*_D7+
0.0049550543*_D8+
-0.009993359*_D9+
0.0196766458*_D10+
0.0033837121*_D11+
0.0050776566*_D12+
0.3208444309*_D13+
-0.049384649*_D14+
0.0691712889*_D15+
-0.016944413*_D16+
-0.089187896*_D17+
0.0225415386*_D18+
0.1848856869*_D19+
0.3942794806*_D20+
0.0194393391*_D21+
-0.466397969*_D22+
-0.088428185*_D23+
-0.103251884*_D24;
/****************************************/
* Principal Component 13;
/****************************************/
;
label PC_13 = "Principal Component 13";
PC_13 =
-0.067673026*AcceptedCmp1_1_+
0.0676730262*AcceptedCmp1_2_+
-0.165291629*AcceptedCmp2_1_+
0.1652916292*AcceptedCmp2_2_+
0.0824431118*AcceptedCmp3_1_+
-0.082443112*AcceptedCmp3_2_+
0.1828730443*AcceptedCmp4_1_+
-0.182873044*AcceptedCmp4_2_+
-0.022133905*AcceptedCmp5_1_+
0.0221339047*AcceptedCmp5_2_+
-0.009052823*Complain_1_+
0.0090528233*Complain_2_+
-0.019610194*Education_1_+
0.0230786831*Education_2_+
-0.034366285*Education_3_+
-0.050129548*Education_4_+
0.0901288765*Education_5_+
-0.005383136*HigherEducationBinary_1_+
0.0053831359*HigherEducationBinary_2_+
0.0486107527*Marital_Status_1_+
0.0214616894*Marital_Status_2_+
0.5329491932*Marital_Status_3_+
-0.630308008*Marital_Status_4_+
0.1296731487*Marital_Status_5_+
-0.042168203*_D1+
0.051877784*_D2+
-0.007661289*_D3+
-0.006829674*_D4+
0.0324623093*_D5+
-0.004466276*_D6+
0.0013859207*_D7+
-0.011357352*_D8+
-0.009925277*_D9+
-0.001271168*_D10+
-0.004780137*_D11+
-0.003953864*_D12+
0.0552583955*_D13+
0.0022775272*_D14+
0.0509975342*_D15+
-0.015371595*_D16+
0.0048802075*_D17+
-0.029478917*_D18+
0.0082114633*_D19+
0.221287957*_D20+
-0.005313937*_D21+
-0.274343552*_D22+
0.0330917558*_D23+
-0.051877784*_D24;
/****************************************/
* Principal Component 14;
/****************************************/
;
label PC_14 = "Principal Component 14";
PC_14 =
0.1156616829*AcceptedCmp1_1_+
-0.115661683*AcceptedCmp1_2_+
0.009080823*AcceptedCmp2_1_+
-0.009080823*AcceptedCmp2_2_+
0.0058330168*AcceptedCmp3_1_+
-0.005833017*AcceptedCmp3_2_+
0.0105392099*AcceptedCmp4_1_+
-0.01053921*AcceptedCmp4_2_+
-0.179459143*AcceptedCmp5_1_+
0.1794591428*AcceptedCmp5_2_+
0.0128538558*Complain_1_+
-0.012853856*Complain_2_+
-0.048703258*Education_1_+
0.0618582677*Education_2_+
-0.095285477*Education_3_+
0.6568036301*Education_4_+
-0.452847972*Education_5_+
-0.011011189*HigherEducationBinary_1_+
0.0110111887*HigherEducationBinary_2_+
-0.194362011*Marital_Status_1_+
0.0820784033*Marital_Status_2_+
0.1294678303*Marital_Status_3_+
-0.154552923*Marital_Status_4_+
0.1765957804*Marital_Status_5_+
0.0211616699*_D1+
0.03247643*_D2+
-0.015778451*_D3+
-0.017678221*_D4+
0.0186159666*_D5+
0.0042493603*_D6+
0.0143596726*_D7+
0.0290282021*_D8+
0.0654035837*_D9+
-0.033259881*_D10+
0.0278832756*_D11+
0.0099954608*_D12+
0.0695033501*_D13+
-0.039447984*_D14+
0.0610650885*_D15+
-0.001921024*_D16+
-0.031984642*_D17+
0.0384538085*_D18+
0.0729844675*_D19+
-0.23204048*_D20+
0.0228541763*_D21+
0.2372404919*_D22+
0.0181080969*_D23+
-0.03247643*_D24;
/****************************************/
* Principal Component 15;
/****************************************/
;
label PC_15 = "Principal Component 15";
PC_15 =
0.2280202976*AcceptedCmp1_1_+
-0.228020298*AcceptedCmp1_2_+
0.06752939*AcceptedCmp2_1_+
-0.06752939*AcceptedCmp2_2_+
0.0190427537*AcceptedCmp3_1_+
-0.019042754*AcceptedCmp3_2_+
0.0006307542*AcceptedCmp4_1_+
-0.000630754*AcceptedCmp4_2_+
-0.262036938*AcceptedCmp5_1_+
0.2620369376*AcceptedCmp5_2_+
0.0249081369*Complain_1_+
-0.024908137*Complain_2_+
-0.117787546*Education_1_+
0.2256182322*Education_2_+
0.0627065482*Education_3_+
-0.448865212*Education_4_+
0.3080856118*Education_5_+
0.0128474961*HigherEducationBinary_1_+
-0.012847496*HigherEducationBinary_2_+
-0.110934777*Marital_Status_1_+
-0.021943114*Marital_Status_2_+
0.1049207175*Marital_Status_3_+
-0.089138073*Marital_Status_4_+
0.2260835147*Marital_Status_5_+
0.0009688101*_D1+
0.0565388262*_D2+
-0.042505482*_D3+
-0.041850958*_D4+
0.0393162205*_D5+
0.0457883372*_D6+
0.0126557996*_D7+
0.018353886*_D8+
0.0610917944*_D9+
0.0298190384*_D10+
0.0558526168*_D11+
0.0425154739*_D12+
0.165424122*_D13+
-0.0025137*_D14+
0.0018444747*_D15+
-0.010106934*_D16+
-0.079191606*_D17+
-0.015128589*_D18+
0.0787630501*_D19+
-0.2556599*_D20+
0.0737009254*_D21+
0.3973870833*_D22+
-0.082315816*_D23+
-0.056538826*_D24;
/****************************************/
* Principal Component 16;
/****************************************/
;
label PC_16 = "Principal Component 16";
PC_16 =
0.022404439*AcceptedCmp1_1_+
-0.022404439*AcceptedCmp1_2_+
-0.023503189*AcceptedCmp2_1_+
0.023503189*AcceptedCmp2_2_+
-0.036520422*AcceptedCmp3_1_+
0.0365204218*AcceptedCmp3_2_+
-0.078328631*AcceptedCmp4_1_+
0.0783286307*AcceptedCmp4_2_+
0.1051779253*AcceptedCmp5_1_+
-0.105177925*AcceptedCmp5_2_+
-0.023885584*Complain_1_+
0.0238855836*Complain_2_+
-0.210462678*Education_1_+
0.3118035003*Education_2_+
-0.066297636*Education_3_+
0.1421987656*Education_4_+
-0.024705066*Education_5_+
-0.024475684*HigherEducationBinary_1_+
0.024475684*HigherEducationBinary_2_+
0.6510235146*Marital_Status_1_+
-0.018345828*Marital_Status_2_+
-0.227417743*Marital_Status_3_+
-0.183700318*Marital_Status_4_+
-0.089849399*Marital_Status_5_+
-0.001880061*_D1+
0.0662861281*_D2+
-0.107384161*_D3+
-0.11276807*_D4+
0.0219705654*_D5+
0.0848525061*_D6+
0.1043602296*_D7+
0.1080580063*_D8+
0.0300476609*_D9+
0.0748454231*_D10+
0.0904054898*_D11+
0.0593784957*_D12+
0.2680709247*_D13+
-0.010811409*_D14+
-0.079044561*_D15+
-0.060741687*_D16+
-0.150297231*_D17+
-0.095477066*_D18+
0.1319565276*_D19+
0.0106714797*_D20+
0.1537230777*_D21+
0.0045694459*_D22+
-0.194289375*_D23+
-0.066286128*_D24;
/****************************************/
* Principal Component 17;
/****************************************/
;
label PC_17 = "Principal Component 17";
PC_17 =
0.182713503*AcceptedCmp1_1_+
-0.182713503*AcceptedCmp1_2_+
0.0243379463*AcceptedCmp2_1_+
-0.024337946*AcceptedCmp2_2_+
0.053580041*AcceptedCmp3_1_+
-0.053580041*AcceptedCmp3_2_+
0.1056983329*AcceptedCmp4_1_+
-0.105698333*AcceptedCmp4_2_+
-0.295499498*AcceptedCmp5_1_+
0.295499498*AcceptedCmp5_2_+
0.0235220869*Complain_1_+
-0.023522087*Complain_2_+
0.2200711223*Education_1_+
-0.397122583*Education_2_+
0.0235238302*Education_3_+
0.0005357094*Education_4_+
-0.019815137*Education_5_+
-0.011323504*HigherEducationBinary_1_+
0.011323504*HigherEducationBinary_2_+
0.4936312858*Marital_Status_1_+
-0.078560508*Marital_Status_2_+
-0.239475827*Marital_Status_3_+
-0.092081214*Marital_Status_4_+
0.1621938336*Marital_Status_5_+
-0.015834804*_D1+
-0.17139123*_D2+
0.0604896703*_D3+
0.0669514728*_D4+
0.1923197119*_D5+
-0.020572369*_D6+
-0.047141067*_D7+
-0.047783889*_D8+
0.0009888907*_D9+
-0.021727958*_D10+
-0.03745661*_D11+
-0.005737565*_D12+
-0.120360885*_D13+
0.000912643*_D14+
0.1509338938*_D15+
0.0610298592*_D16+
0.0467589287*_D17+
0.1064824223*_D18+
0.0180645154*_D19+
0.0534756824*_D20+
-0.070980035*_D21+
-0.053609801*_D22+
0.0480925806*_D23+
0.17139123*_D24;
/****************************************/
* Principal Component 18;
/****************************************/
;
label PC_18 = "Principal Component 18";
PC_18 =
-0.053515215*AcceptedCmp1_1_+
0.0535152151*AcceptedCmp1_2_+
-0.04540355*AcceptedCmp2_1_+
0.0454035498*AcceptedCmp2_2_+
-0.022640111*AcceptedCmp3_1_+
0.0226401108*AcceptedCmp3_2_+
-0.076750566*AcceptedCmp4_1_+
0.0767505658*AcceptedCmp4_2_+
0.1881582183*AcceptedCmp5_1_+
-0.188158218*AcceptedCmp5_2_+
0.0399542841*Complain_1_+
-0.039954284*Complain_2_+
0.2701617306*Education_1_+
-0.555027332*Education_2_+
-0.058824684*Education_3_+
0.0185530722*Education_4_+
0.094804806*Education_5_+
-0.048964069*HigherEducationBinary_1_+
0.0489640691*HigherEducationBinary_2_+
-0.137110375*Marital_Status_1_+
0.0018070775*Marital_Status_2_+
-0.024759187*Marital_Status_3_+
-0.022700128*Marital_Status_4_+
0.3515807525*Marital_Status_5_+
-0.009590753*_D1+
-0.016182037*_D2+
-0.138360561*_D3+
-0.026511131*_D4+
0.0535745753*_D5+
0.0857708037*_D6+
0.0384904973*_D7+
0.0900013809*_D8+
0.0271886558*_D9+
0.1125764617*_D10+
0.0513285091*_D11+
0.0542136939*_D12+
0.3857068538*_D13+
-0.041351659*_D14+
-0.090316361*_D15+
-0.122077809*_D16+
-0.131717283*_D17+
-0.171077561*_D18+
0.0930536926*_D19+
-0.079268859*_D20+
0.1892899859*_D21+
0.0455284151*_D22+
-0.170038279*_D23+
0.0161820375*_D24;
/****************************************/
* Principal Component 2;
/****************************************/
;
label PC_2 = "Principal Component 2";
PC_2 =
0.2098304874*AcceptedCmp1_1_+
-0.209830487*AcceptedCmp1_2_+
0.1314902299*AcceptedCmp2_1_+
-0.13149023*AcceptedCmp2_2_+
0.1168334863*AcceptedCmp3_1_+
-0.116833486*AcceptedCmp3_2_+
0.1090291675*AcceptedCmp4_1_+
-0.109029167*AcceptedCmp4_2_+
0.1939205697*AcceptedCmp5_1_+
-0.19392057*AcceptedCmp5_2_+
0.0032849004*Complain_1_+
-0.0032849*Complain_2_+
-0.312985477*Education_1_+
-0.195124296*Education_2_+
0.130115815*Education_3_+
0.0687513879*Education_4_+
0.0890460268*Education_5_+
-0.378546755*HigherEducationBinary_1_+
0.3785467545*HigherEducationBinary_2_+
0.015325327*Marital_Status_1_+
-0.005090223*Marital_Status_2_+
-0.041316437*Marital_Status_3_+
0.0208340979*Marital_Status_4_+
0.0355791445*Marital_Status_5_+
-0.269026075*_D1+
0.2457455504*_D2+
0.0746298438*_D3+
0.0765820714*_D4+
-0.072943244*_D5+
0.0155762432*_D6+
0.0091816307*_D7+
0.0011130316*_D8+
-0.019267994*_D9+
-0.007611257*_D10+
-0.016469101*_D11+
0.0356168458*_D12+
0.0309848234*_D13+
0.0071938791*_D14+
0.1135444799*_D15+
0.0575927644*_D16+
0.0827147898*_D17+
0.093769533*_D18+
-0.02618335*_D19+
0.0077318331*_D20+
0.0140070115*_D21+
0.0037341071*_D22+
0.2217059934*_D23+
-0.24574555*_D24;
/****************************************/
* Principal Component 20;
/****************************************/
;
label PC_20 = "Principal Component 20";
PC_20 =
-0.034985854*AcceptedCmp1_1_+
0.0349858537*AcceptedCmp1_2_+
-0.019648141*AcceptedCmp2_1_+
0.019648141*AcceptedCmp2_2_+
-0.00446545*AcceptedCmp3_1_+
0.0044654502*AcceptedCmp3_2_+
-0.074624122*AcceptedCmp4_1_+
0.074624122*AcceptedCmp4_2_+
0.0306504198*AcceptedCmp5_1_+
-0.03065042*AcceptedCmp5_2_+
-0.002283844*Complain_1_+
0.0022838439*Complain_2_+
-0.082536964*Education_1_+
0.1186664577*Education_2_+
-0.098755738*Education_3_+
0.0274392703*Education_4_+
0.1049984558*Education_5_+
-0.011475102*HigherEducationBinary_1_+
0.0114751021*HigherEducationBinary_2_+
-0.051352045*Marital_Status_1_+
-0.052323486*Marital_Status_2_+
-0.017173603*Marital_Status_3_+
0.0699052528*Marital_Status_4_+
0.1089991345*Marital_Status_5_+
0.034500345*_D1+
-0.057425232*_D2+
-0.142037817*_D3+
0.1061042653*_D4+
0.40403441*_D5+
0.0493631342*_D6+
0.2323536896*_D7+
0.1936832337*_D8+
0.0578110965*_D9+
0.0800013435*_D10+
0.2800068014*_D11+
-0.062117358*_D12+
-0.226920205*_D13+
-0.09177343*_D14+
0.4625990457*_D15+
-0.180861723*_D16+
-0.056708469*_D17+
-0.221099526*_D18+
-0.177515828*_D19+
-0.039143193*_D20+
0.1824651082*_D21+
-0.085767346*_D22+
0.3126733242*_D23+
0.0574252317*_D24;
/****************************************/
* Principal Component 3;
/****************************************/
;
label PC_3 = "Principal Component 3";
PC_3 =
0.1579598*AcceptedCmp1_1_+
-0.1579598*AcceptedCmp1_2_+
0.2749448216*AcceptedCmp2_1_+
-0.274944822*AcceptedCmp2_2_+
0.1379979889*AcceptedCmp3_1_+
-0.137997989*AcceptedCmp3_2_+
0.2538177813*AcceptedCmp4_1_+
-0.253817781*AcceptedCmp4_2_+
0.1648545917*AcceptedCmp5_1_+
-0.164854592*AcceptedCmp5_2_+
-0.046256609*Complain_1_+
0.0462566091*Complain_2_+
0.2329772095*Education_1_+
0.1144232662*Education_2_+
-0.064922734*Education_3_+
-0.019869049*Education_4_+
-0.119546711*Education_5_+
0.2657723241*HigherEducationBinary_1_+
-0.265772324*HigherEducationBinary_2_+
-0.024418108*Marital_Status_1_+
-0.032429562*Marital_Status_2_+
0.0530136907*Marital_Status_3_+
0.0148762547*Marital_Status_4_+
-0.028286532*Marital_Status_5_+
-0.326078421*_D1+
-0.108306513*_D2+
0.0658186359*_D3+
0.0363772307*_D4+
-0.072397376*_D5+
0.0750385147*_D6+
0.1994044259*_D7+
0.1935349316*_D8+
0.0947741965*_D9+
0.1267364485*_D10+
0.1937923293*_D11+
-0.036841371*_D12+
0.0528401102*_D13+
0.074749094*_D14+
-0.056691727*_D15+
0.0503021873*_D16+
0.0736428999*_D17+
0.0092888818*_D18+
-0.122481257*_D19+
0.0312882004*_D20+
0.0764648462*_D21+
-0.01943282*_D22+
-0.104834682*_D23+
0.1083065135*_D24;
/****************************************/
* Principal Component 5;
/****************************************/
;
label PC_5 = "Principal Component 5";
PC_5 =
0.0086529241*AcceptedCmp1_1_+
-0.008652924*AcceptedCmp1_2_+
0.0175889336*AcceptedCmp2_1_+
-0.017588934*AcceptedCmp2_2_+
-0.486413614*AcceptedCmp3_1_+
0.4864136144*AcceptedCmp3_2_+
0.2628757252*AcceptedCmp4_1_+
-0.262875725*AcceptedCmp4_2_+
0.0703324586*AcceptedCmp5_1_+
-0.070332459*AcceptedCmp5_2_+
0.0097664665*Complain_1_+
-0.009766467*Complain_2_+
-0.123816101*Education_1_+
-0.029085686*Education_2_+
0.2247969178*Education_3_+
-0.074531736*Education_4_+
-0.105891869*Education_5_+
-0.124769273*HigherEducationBinary_1_+
0.124769273*HigherEducationBinary_2_+
-0.057080048*Marital_Status_1_+
-0.007312126*Marital_Status_2_+
0.0867636518*Marital_Status_3_+
0.00939798*Marital_Status_4_+
-0.110720843*Marital_Status_5_+
0.064846403*_D1+
-0.211072888*_D2+
0.0303526661*_D3+
-0.057891484*_D4+
0.1193452393*_D5+
0.0173291749*_D6+
0.0441069711*_D7+
0.0449042541*_D8+
0.2130328959*_D9+
0.0143649441*_D10+
0.030748589*_D11+
-0.025820422*_D12+
0.1046279837*_D13+
0.048992456*_D14+
0.1392353222*_D15+
0.0846612706*_D16+
-0.052923683*_D17+
0.0970979642*_D18+
0.1437830745*_D19+
0.0024592997*_D20+
0.0129115248*_D21+
0.0117343633*_D22+
-0.059509991*_D23+
0.2110728879*_D24;
/****************************************/
* Principal Component 6;
/****************************************/
;
label PC_6 = "Principal Component 6";
PC_6 =
0.0509581945*AcceptedCmp1_1_+
-0.050958194*AcceptedCmp1_2_+
-0.040669752*AcceptedCmp2_1_+
0.0406697515*AcceptedCmp2_2_+
0.1620834513*AcceptedCmp3_1_+
-0.162083451*AcceptedCmp3_2_+
-0.197082851*AcceptedCmp4_1_+
0.1970828507*AcceptedCmp4_2_+
0.1166992954*AcceptedCmp5_1_+
-0.116699295*AcceptedCmp5_2_+
0.5230276516*Complain_1_+
-0.523027652*Complain_2_+
-0.010453756*Education_1_+
0.0776275359*Education_2_+
0.1387147819*Education_3_+
-0.080054633*Education_4_+
-0.123118085*Education_5_+
0.0310559869*HigherEducationBinary_1_+
-0.031055987*HigherEducationBinary_2_+
-0.011934577*Marital_Status_1_+
0.004173414*Marital_Status_2_+
0.0780085407*Marital_Status_3_+
-0.036299464*Marital_Status_4_+
-0.088950552*Marital_Status_5_+
-0.050603701*_D1+
-0.182799583*_D2+
0.0798067052*_D3+
-0.044909314*_D4+
0.0209477344*_D5+
0.0185047107*_D6+
-0.019240887*_D7+
-0.002969065*_D8+
0.0675374903*_D9+
-0.039646876*_D10+
0.0174611351*_D11+
0.0489898644*_D12+
0.1434810233*_D13+
-0.015640328*_D14+
0.1889693011*_D15+
0.0845671228*_D16+
0.0559693414*_D17+
0.1654775873*_D18+
0.185158331*_D19+
0.0226915008*_D20+
-0.000623182*_D21+
-0.029691784*_D22+
0.070051042*_D23+
0.1827995833*_D24;
/****************************************/
* Principal Component 8;
/****************************************/
;
label PC_8 = "Principal Component 8";
PC_8 =
-0.208567665*AcceptedCmp1_1_+
0.2085676654*AcceptedCmp1_2_+
0.5482076187*AcceptedCmp2_1_+
-0.548207619*AcceptedCmp2_2_+
-0.044221437*AcceptedCmp3_1_+
0.0442214368*AcceptedCmp3_2_+
-0.14675365*AcceptedCmp4_1_+
0.1467536497*AcceptedCmp4_2_+
-0.038990645*AcceptedCmp5_1_+
0.0389906448*AcceptedCmp5_2_+
-0.024280127*Complain_1_+
0.0242801271*Complain_2_+
-0.012605131*Education_1_+
-0.030493484*Education_2_+
-0.138809012*Education_3_+
0.0475300752*Education_4_+
0.1485316948*Education_5_+
-0.027000779*HigherEducationBinary_1_+
0.0270007789*HigherEducationBinary_2_+
-0.018725217*Marital_Status_1_+
0.2233218453*Marital_Status_2_+
0.023925147*Marital_Status_3_+
-0.25239207*Marital_Status_4_+
-0.041930806*Marital_Status_5_+
0.0768981541*_D1+
-0.042316516*_D2+
0.0145979154*_D3+
-0.003835774*_D4+
0.1100105534*_D5+
0.0158554965*_D6+
-0.101139814*_D7+
-0.098260916*_D8+
-0.055445418*_D9+
-0.001185956*_D10+
-0.069461121*_D11+
0.0719623523*_D12+
0.0524572308*_D13+
0.0032529353*_D14+
0.1209346863*_D15+
0.0472417073*_D16+
-0.034676108*_D17+
0.0797247801*_D18+
0.1086721664*_D19+
0.0421434077*_D20+
0.0021159548*_D21+
-0.042351368*_D22+
0.0271921949*_D23+
0.0423165157*_D24;
/****************************************/
* Principal Component 9;
/****************************************/
;
label PC_9 = "Principal Component 9";
PC_9 =
0.1938001454*AcceptedCmp1_1_+
-0.193800145*AcceptedCmp1_2_+
-0.014545873*AcceptedCmp2_1_+
0.0145458726*AcceptedCmp2_2_+
-0.043871946*AcceptedCmp3_1_+
0.0438719463*AcceptedCmp3_2_+
-0.057867658*AcceptedCmp4_1_+
0.057867658*AcceptedCmp4_2_+
0.0023818415*AcceptedCmp5_1_+
-0.002381842*AcceptedCmp5_2_+
-0.022053952*Complain_1_+
0.0220539521*Complain_2_+
-0.106978426*Education_1_+
0.0682419091*Education_2_+
-0.444791356*Education_3_+
0.2673146013*Education_4_+
0.3527511301*Education_5_+
-0.059310273*HigherEducationBinary_1_+
0.0593102729*HigherEducationBinary_2_+
-0.042529114*Marital_Status_1_+
-0.380649229*Marital_Status_2_+
0.2623013511*Marital_Status_3_+
0.2325237055*Marital_Status_4_+
-0.03802981*Marital_Status_5_+
-0.030965117*_D1+
-0.214498797*_D2+
0.0442140121*_D3+
0.0082470115*_D4+
0.0374258289*_D5+
0.0543400477*_D6+
-0.107947293*_D7+
-0.084854503*_D8+
-0.10815819*_D9+
0.0414238337*_D10+
-0.136016648*_D11+
0.1281098509*_D12+
0.0687534581*_D13+
0.0402606775*_D14+
-0.01185495*_D15+
0.0510300402*_D16+
0.025100862*_D17+
0.047146554*_D18+
0.0185158846*_D19+
0.1198775713*_D20+
0.0503680175*_D21+
-0.104631821*_D22+
-0.135521888*_D23+
0.2144987971*_D24;
*------------------------------------------------------------*;
* TOOL: Regression;
* TYPE: MODEL;
* NODE: Reg2;
*------------------------------------------------------------*;
*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG2DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG2DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Check PC_1 for missing values ;
if missing( PC_1 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_11 for missing values ;
if missing( PC_11 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_12 for missing values ;
if missing( PC_12 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_13 for missing values ;
if missing( PC_13 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_14 for missing values ;
if missing( PC_14 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_15 for missing values ;
if missing( PC_15 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_16 for missing values ;
if missing( PC_16 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_17 for missing values ;
if missing( PC_17 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_18 for missing values ;
if missing( PC_18 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_2 for missing values ;
if missing( PC_2 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_20 for missing values ;
if missing( PC_20 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_3 for missing values ;
if missing( PC_3 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_5 for missing values ;
if missing( PC_5 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_6 for missing values ;
if missing( PC_6 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_8 for missing values ;
if missing( PC_8 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check PC_9 for missing values ;
if missing( PC_9 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG2DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: PC_1 ;
_TEMP = PC_1 ;
_LP0 = _LP0 + (    0.26569938919709 * _TEMP);

***  Effect: PC_11 ;
_TEMP = PC_11 ;
_LP0 = _LP0 + (   -0.59039250393449 * _TEMP);

***  Effect: PC_12 ;
_TEMP = PC_12 ;
_LP0 = _LP0 + (    0.86334123867457 * _TEMP);

***  Effect: PC_13 ;
_TEMP = PC_13 ;
_LP0 = _LP0 + (    0.79717922661676 * _TEMP);

***  Effect: PC_14 ;
_TEMP = PC_14 ;
_LP0 = _LP0 + (   -0.38256274010938 * _TEMP);

***  Effect: PC_15 ;
_TEMP = PC_15 ;
_LP0 = _LP0 + (   -0.42994385711232 * _TEMP);

***  Effect: PC_16 ;
_TEMP = PC_16 ;
_LP0 = _LP0 + (    0.17066079255511 * _TEMP);

***  Effect: PC_17 ;
_TEMP = PC_17 ;
_LP0 = _LP0 + (    0.30940959766476 * _TEMP);

***  Effect: PC_18 ;
_TEMP = PC_18 ;
_LP0 = _LP0 + (    0.19600836509609 * _TEMP);

***  Effect: PC_2 ;
_TEMP = PC_2 ;
_LP0 = _LP0 + (   -0.41856141830882 * _TEMP);

***  Effect: PC_20 ;
_TEMP = PC_20 ;
_LP0 = _LP0 + (    0.23841059305974 * _TEMP);

***  Effect: PC_3 ;
_TEMP = PC_3 ;
_LP0 = _LP0 + (   -0.33250721754288 * _TEMP);

***  Effect: PC_5 ;
_TEMP = PC_5 ;
_LP0 = _LP0 + (    0.41285297863057 * _TEMP);

***  Effect: PC_6 ;
_TEMP = PC_6 ;
_LP0 = _LP0 + (    0.15940802054833 * _TEMP);

***  Effect: PC_8 ;
_TEMP = PC_8 ;
_LP0 = _LP0 + (    0.33656675305612 * _TEMP);

***  Effect: PC_9 ;
_TEMP = PC_9 ;
_LP0 = _LP0 + (    0.32393252277579 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -2.80900800584412 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG2DR1:


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
I_DepVar = REG2DRF[_IY];
U_DepVar = REG2DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
* Renaming variables for Reg2;
*------------------------------------------------------------*;
* Renaming Posterior variables for Reg2;
*------------------------------------------------------------*;
drop Reg2_P_DepVar1;
Reg2_P_DepVar1 = P_DepVar1;
drop Reg2_P_DepVar0;
Reg2_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Reg2;
*------------------------------------------------------------*;
length Reg2_WARN_ $4;
drop Reg2_WARN_;
Reg2_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Decision Tree;
* TYPE: MODEL;
* NODE: Tree2;
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
IF  NOT MISSING(PC_1 ) AND
      4.68709322408413 <= PC_1  THEN DO;
  IF  NOT MISSING(PC_13 ) AND
        0.66383869945606 <= PC_13  THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                   10;
    P_DepVar0  =     0.21794871794871;
    P_DepVar1  =     0.78205128205128;
    Q_DepVar0  =     0.21794871794871;
    Q_DepVar1  =     0.78205128205128;
    V_DepVar0  =      0.2258064516129;
    V_DepVar1  =     0.77419354838709;
    I_DepVar  = '1' ;
    U_DepVar  =                    1;
    END;
  ELSE DO;
    IF  NOT MISSING(PC_3 ) AND
      PC_3  <    -2.17027872615734 THEN DO;
      _NODE_  =                   12;
      _LEAF_  =                    6;
      P_DepVar0  =                 0.34;
      P_DepVar1  =                 0.66;
      Q_DepVar0  =                 0.34;
      Q_DepVar1  =                 0.66;
      V_DepVar0  =     0.46666666666666;
      V_DepVar1  =     0.53333333333333;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(PC_14 ) AND
        PC_14  <     0.05209321878506 THEN DO;
        IF  NOT MISSING(PC_11 ) AND
          PC_11  <    -1.20691074000555 THEN DO;
          _NODE_  =                   30;
          _LEAF_  =                    7;
          P_DepVar0  =                    0;
          P_DepVar1  =                    1;
          Q_DepVar0  =                    0;
          Q_DepVar1  =                    1;
          V_DepVar0  =                    0;
          V_DepVar1  =                    1;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   31;
          _LEAF_  =                    8;
          P_DepVar0  =     0.65853658536585;
          P_DepVar1  =     0.34146341463414;
          Q_DepVar0  =     0.65853658536585;
          Q_DepVar1  =     0.34146341463414;
          V_DepVar0  =     0.68421052631578;
          V_DepVar1  =     0.31578947368421;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        END;
      ELSE DO;
        _NODE_  =                   23;
        _LEAF_  =                    9;
        P_DepVar0  =     0.88524590163934;
        P_DepVar1  =     0.11475409836065;
        Q_DepVar0  =     0.88524590163934;
        Q_DepVar1  =     0.11475409836065;
        V_DepVar0  =                  0.7;
        V_DepVar1  =                  0.3;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(PC_5 ) AND
        2.47368132855669 <= PC_5  THEN DO;
    IF  NOT MISSING(PC_12 ) AND
          0.73782175930673 <= PC_12  THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    5;
      P_DepVar0  =     0.13333333333333;
      P_DepVar1  =     0.86666666666666;
      Q_DepVar0  =     0.13333333333333;
      Q_DepVar1  =     0.86666666666666;
      V_DepVar0  =     0.14285714285714;
      V_DepVar1  =     0.85714285714285;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _NODE_  =                   10;
      _LEAF_  =                    4;
      P_DepVar0  =      0.6159420289855;
      P_DepVar1  =     0.38405797101449;
      Q_DepVar0  =      0.6159420289855;
      Q_DepVar1  =     0.38405797101449;
      V_DepVar0  =     0.63793103448275;
      V_DepVar1  =     0.36206896551724;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(PC_12 ) AND
           1.1476735453533 <= PC_12  THEN DO;
      IF  NOT MISSING(PC_13 ) AND
            1.98102952079247 <= PC_13  THEN DO;
        _NODE_  =                   19;
        _LEAF_  =                    3;
        P_DepVar0  =     0.08333333333333;
        P_DepVar1  =     0.91666666666666;
        Q_DepVar0  =     0.08333333333333;
        Q_DepVar1  =     0.91666666666666;
        V_DepVar0  =                    0;
        V_DepVar1  =                    1;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   18;
        _LEAF_  =                    2;
        P_DepVar0  =      0.7725321888412;
        P_DepVar1  =     0.22746781115879;
        Q_DepVar0  =      0.7725321888412;
        Q_DepVar1  =     0.22746781115879;
        V_DepVar0  =      0.7029702970297;
        V_DepVar1  =     0.29702970297029;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =     0.93955094991364;
      P_DepVar1  =     0.06044905008635;
      Q_DepVar0  =     0.93955094991364;
      Q_DepVar1  =     0.06044905008635;
      V_DepVar0  =     0.93882978723404;
      V_DepVar1  =     0.06117021276595;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
drop _LEAF_;
* Renaming variables for Tree2;
*------------------------------------------------------------*;
* Renaming Posterior variables for Tree2;
*------------------------------------------------------------*;
drop Tree2_P_DepVar1;
Tree2_P_DepVar1 = P_DepVar1;
drop Tree2_P_DepVar0;
Tree2_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Tree2;
*------------------------------------------------------------*;
length Tree2_WARN_ $4;
drop Tree2_WARN_;
Tree2_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
/****************************************/
* Principal Component 10;
/****************************************/
;
label PC_10 = "Principal Component 10";
PC_10 =
-0.335134835*AcceptedCmp1_1_+
0.3351348345*AcceptedCmp1_2_+
0.1039135796*AcceptedCmp2_1_+
-0.10391358*AcceptedCmp2_2_+
0.1565810322*AcceptedCmp3_1_+
-0.156581032*AcceptedCmp3_2_+
0.1317709731*AcceptedCmp4_1_+
-0.131770973*AcceptedCmp4_2_+
-0.070178903*AcceptedCmp5_1_+
0.0701789032*AcceptedCmp5_2_+
-0.024051947*Complain_1_+
0.024051947*Complain_2_+
-0.016643625*Education_1_+
0.005628106*Education_2_+
0.1479707804*Education_3_+
-0.022457445*Education_4_+
-0.150170738*Education_5_+
-0.011818382*HigherEducationBinary_1_+
0.0118183819*HigherEducationBinary_2_+
0.1710716119*Marital_Status_1_+
-0.572483731*Marital_Status_2_+
0.2321169641*Marital_Status_3_+
0.287702504*Marital_Status_4_+
0.0738567804*Marital_Status_5_+
0.0216690757*_D1+
0.0833480024*_D2+
-0.01051481*_D3+
-0.054524015*_D4+
0.0645796413*_D5+
-0.011507684*_D6+
-0.007361187*_D7+
-0.003446626*_D8+
0.0065888954*_D9+
-0.030654129*_D10+
-0.004725202*_D11+
0.0001155953*_D12+
0.1945695711*_D13+
-0.023095104*_D14+
0.0963991008*_D15+
0.0075903172*_D16+
-0.033853836*_D17+
0.037856839*_D18+
0.1296431305*_D19+
-0.107252003*_D20+
-0.033680852*_D21+
0.0869589222*_D22+
0.0648660238*_D23+
-0.083348002*_D24;
/****************************************/
* Principal Component 19;
/****************************************/
;
label PC_19 = "Principal Component 19";
PC_19 =
-0.10413684*AcceptedCmp1_1_+
0.1041368396*AcceptedCmp1_2_+
0.0065369212*AcceptedCmp2_1_+
-0.006536921*AcceptedCmp2_2_+
-0.027480598*AcceptedCmp3_1_+
0.0274805978*AcceptedCmp3_2_+
-0.005039927*AcceptedCmp4_1_+
0.0050399269*AcceptedCmp4_2_+
0.1833479317*AcceptedCmp5_1_+
-0.183347932*AcceptedCmp5_2_+
-0.003894132*Complain_1_+
0.003894132*Complain_2_+
-0.159326483*Education_1_+
0.2567565314*Education_2_+
0.0297667093*Education_3_+
-0.00664015*Education_4_+
-0.023963552*Education_5_+
-0.007772279*HigherEducationBinary_1_+
0.007772279*HigherEducationBinary_2_+
0.0098609729*Marital_Status_1_+
-0.062823215*Marital_Status_2_+
-0.194568421*Marital_Status_3_+
-0.054001871*Marital_Status_4_+
0.7650770907*Marital_Status_5_+
-0.022862298*_D1+
-0.134513267*_D2+
0.1133504813*_D3+
-0.008420059*_D4+
-0.027527483*_D5+
-0.033527787*_D6+
-0.057564465*_D7+
-0.031713289*_D8+
-0.033736718*_D9+
-0.03499632*_D10+
-0.082691562*_D11+
-0.010145956*_D12+
-0.227231415*_D13+
0.0839408582*_D14+
-0.06025929*_D15+
0.1154756144*_D16+
0.0860475457*_D17+
0.1142862428*_D18+
-0.031109294*_D19+
-0.006500114*_D20+
-0.108126281*_D21+
-0.021372926*_D22+
-0.109100194*_D23+
0.1345132672*_D24;
/****************************************/
* Principal Component 4;
/****************************************/
;
label PC_4 = "Principal Component 4";
PC_4 =
0.0659433131*AcceptedCmp1_1_+
-0.065943313*AcceptedCmp1_2_+
-0.091302768*AcceptedCmp2_1_+
0.0913027685*AcceptedCmp2_2_+
-0.1672881*AcceptedCmp3_1_+
0.1672881*AcceptedCmp3_2_+
-0.044824777*AcceptedCmp4_1_+
0.0448247767*AcceptedCmp4_2_+
0.138816668*AcceptedCmp5_1_+
-0.138816668*AcceptedCmp5_2_+
-0.102415604*Complain_1_+
0.1024156042*Complain_2_+
0.2534871452*Education_1_+
0.048091048*Education_2_+
-0.219440728*Education_3_+
-0.022137984*Education_4_+
0.0831178417*Education_5_+
0.2494891825*HigherEducationBinary_1_+
-0.249489183*HigherEducationBinary_2_+
0.0631033811*Marital_Status_1_+
-0.02893419*Marital_Status_2_+
-0.05740676*Marital_Status_3_+
0.0089008214*Marital_Status_4_+
0.0883583805*Marital_Status_5_+
0.0205253088*_D1+
0.2713462866*_D2+
0.1355328333*_D3+
-0.006484408*_D4+
-0.028411303*_D5+
-0.001421756*_D6+
-0.062552863*_D7+
-0.07665111*_D8+
0.1364165908*_D9+
-0.115316343*_D10+
-0.073375722*_D11+
0.0769113342*_D12+
0.1689644769*_D13+
0.0073728744*_D14+
0.3468180397*_D15+
0.1513617447*_D16+
0.0841032644*_D17+
0.2586711246*_D18+
0.1940072057*_D19+
-0.02513841*_D20+
-0.025216111*_D21+
0.031727672*_D22+
0.294827088*_D23+
-0.271346287*_D24;
/****************************************/
* Principal Component 7;
/****************************************/
;
label PC_7 = "Principal Component 7";
PC_7 =
0.0551058657*AcceptedCmp1_1_+
-0.055105866*AcceptedCmp1_2_+
-0.093421366*AcceptedCmp2_1_+
0.093421366*AcceptedCmp2_2_+
0.2055485098*AcceptedCmp3_1_+
-0.20554851*AcceptedCmp3_2_+
-0.219235006*AcceptedCmp4_1_+
0.2192350061*AcceptedCmp4_2_+
0.0669388641*AcceptedCmp5_1_+
-0.066938864*AcceptedCmp5_2_+
-0.453397577*Complain_1_+
0.4533975773*Complain_2_+
-0.055909198*Education_1_+
-0.009225008*Education_2_+
0.2307452888*Education_3_+
-0.104991642*Education_4_+
-0.143535458*Education_5_+
-0.054309698*HigherEducationBinary_1_+
0.0543096984*HigherEducationBinary_2_+
-0.073976978*Marital_Status_1_+
0.0704077055*Marital_Status_2_+
0.0532661862*Marital_Status_3_+
-0.04921591*Marital_Status_4_+
-0.078708359*Marital_Status_5_+
-0.032634069*_D1+
-0.260151977*_D2+
0.0682666673*_D3+
-0.032328016*_D4+
0.0786335917*_D5+
0.0077932727*_D6+
0.0172152838*_D7+
-0.000775711*_D8+
0.0197128527*_D9+
-0.037322194*_D10+
0.0294399249*_D11+
0.0285272552*_D12+
0.1743772551*_D13+
-0.017592501*_D14+
0.1635463064*_D15+
0.0658647575*_D16+
0.0570276725*_D17+
0.1346202025*_D18+
0.1538091782*_D19+
1.0901747E-6*_D20+
-0.013057528*_D21+
0.0202460174*_D22+
-0.018249103*_D23+
0.2601519773*_D24;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural12;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

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

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.21037801380944 * S_PC_1  +    -0.08720829282004 * S_PC_10
          +     0.25215120033315 * S_PC_11  +    -0.10961191645583 * S_PC_12
          +     0.02959554437113 * S_PC_13  +     0.07624433904545 * S_PC_14
          +    -0.22491072953103 * S_PC_15  +     0.29449064969788 * S_PC_16
          +     0.17317833744584 * S_PC_17  +     0.05429827397853 * S_PC_18
          +    -0.33992024219542 * S_PC_19  +     0.16054216143875 * S_PC_2
          +    -0.10166058652456 * S_PC_20  +     0.52599949123306 * S_PC_3
          +    -0.17932881666828 * S_PC_4  +     0.23725630406368 * S_PC_5
          +     0.07212115381489 * S_PC_6  +    -0.03071464968752 * S_PC_7
          +     0.15702910019697 * S_PC_8  +     0.14453952623388 * S_PC_9 ;
   H12  =     0.88405095372457 * S_PC_1  +     0.10148398864269 * S_PC_10
          +    -0.20705974766573 * S_PC_11  +     0.57551339495197 * S_PC_12
          +     0.16357248480022 * S_PC_13  +     0.24116548390027 * S_PC_14
          +     -0.6508034312555 * S_PC_15  +     -0.0243960411688 * S_PC_16
          +     0.30769870057511 * S_PC_17  +    -0.30964713660972 * S_PC_18
          +    -0.13939406660467 * S_PC_19  +    -0.34991654543716 * S_PC_2
          +     0.64413592233679 * S_PC_20  +      0.0658962473494 * S_PC_3
          +    -0.12286813779535 * S_PC_4  +     0.26819293542507 * S_PC_5
          +    -0.04181157680526 * S_PC_6  +    -0.07508075768059 * S_PC_7
          +     0.05928089157964 * S_PC_8  +    -0.08986153416155 * S_PC_9 ;
   H13  =    -0.26220753747273 * S_PC_1  +     0.03442558202065 * S_PC_10
          +    -0.19433654238588 * S_PC_11  +     0.85130648090662 * S_PC_12
          +     0.21422389390385 * S_PC_13  +    -0.52342060859662 * S_PC_14
          +      0.0388266527387 * S_PC_15  +     0.56471604935065 * S_PC_16
          +     0.22585809206344 * S_PC_17  +     0.07524663398993 * S_PC_18
          +    -0.38946225238309 * S_PC_19  +    -0.11615992943564 * S_PC_2
          +     0.26054241711905 * S_PC_20  +    -0.75992066813022 * S_PC_3
          +    -0.00432991607862 * S_PC_4  +     0.44052817293218 * S_PC_5
          +    -0.08395801527515 * S_PC_6  +    -0.12591883723345 * S_PC_7
          +     0.36879609646015 * S_PC_8  +      0.2632138000896 * S_PC_9 ;
   H14  =    -1.10332079251724 * S_PC_1  +    -0.08123568455324 * S_PC_10
          +     0.42261570085907 * S_PC_11  +     0.36758900386029 * S_PC_12
          +    -0.23703857950508 * S_PC_13  +     0.18032772888517 * S_PC_14
          +    -0.15053571104265 * S_PC_15  +     -0.1589584091009 * S_PC_16
          +     0.21333658464729 * S_PC_17  +    -0.16393759287422 * S_PC_18
          +    -0.22679606018271 * S_PC_19  +      0.3541992287872 * S_PC_2
          +     0.63757273317394 * S_PC_20  +    -0.30553453071452 * S_PC_3
          +     0.45024455800823 * S_PC_4  +     0.38062279600912 * S_PC_5
          +     0.05271603852281 * S_PC_6  +      0.1172059009627 * S_PC_7
          +     0.15540054384439 * S_PC_8  +    -0.22351383134415 * S_PC_9 ;
   H15  =     0.19722861430254 * S_PC_1  +      -0.667653482864 * S_PC_10
          +    -0.19496333828312 * S_PC_11  +     0.79234299110326 * S_PC_12
          +     0.51866755972719 * S_PC_13  +    -0.43702026903245 * S_PC_14
          +    -0.82282394942135 * S_PC_15  +      0.0235853486695 * S_PC_16
          +      0.3602307738079 * S_PC_17  +     0.19705006062864 * S_PC_18
          +     0.02386851976074 * S_PC_19  +    -0.19836948779695 * S_PC_2
          +    -0.01490769126602 * S_PC_20  +      0.4581541549854 * S_PC_3
          +     0.07547366568267 * S_PC_4  +    -0.06699445246048 * S_PC_5
          +     0.13752724959699 * S_PC_6  +    -0.17050272374436 * S_PC_7
          +     0.24809374094175 * S_PC_8  +      0.3051219560598 * S_PC_9 ;
   H16  =     0.04979563116116 * S_PC_1  +     0.37425456473496 * S_PC_10
          +    -0.52183397584571 * S_PC_11  +     -0.0492951707684 * S_PC_12
          +     0.49720884559544 * S_PC_13  +      0.0687562053267 * S_PC_14
          +     0.34758368501778 * S_PC_15  +    -0.46010673440088 * S_PC_16
          +    -0.23718460209136 * S_PC_17  +     0.52295717376588 * S_PC_18
          +     -0.1312007800799 * S_PC_19  +    -0.54336616713197 * S_PC_2
          +     0.01512890583449 * S_PC_20  +    -0.45766049132105 * S_PC_3
          +     0.08818801221838 * S_PC_4  +     0.91033430252186 * S_PC_5
          +     0.13421592394868 * S_PC_6  +    -0.02478206071544 * S_PC_7
          +     0.16086023782085 * S_PC_8  +    -0.04221322893874 * S_PC_9 ;
   H17  =     0.26181771079411 * S_PC_1  +     0.15488655843145 * S_PC_10
          +     0.09890835982688 * S_PC_11  +     0.38169216125028 * S_PC_12
          +     0.35884179766984 * S_PC_13  +    -0.11600943215112 * S_PC_14
          +    -0.35075827402374 * S_PC_15  +     0.30212406237593 * S_PC_16
          +     0.35993569225677 * S_PC_17  +    -0.34585866895929 * S_PC_18
          +     0.31800568920635 * S_PC_19  +    -0.04922893376182 * S_PC_2
          +    -0.31518322301322 * S_PC_20  +    -0.20723868513881 * S_PC_3
          +     0.14733585684097 * S_PC_4  +     0.53855314474497 * S_PC_5
          +     0.33707150284902 * S_PC_6  +     0.30926728458609 * S_PC_7
          +     0.19917027684509 * S_PC_8  +     0.31578868608197 * S_PC_9 ;
   H11  =     0.91208584176561 + H11 ;
   H12  =      0.2919162127953 + H12 ;
   H13  =    -0.58626673853356 + H13 ;
   H14  =     1.84514271278893 + H14 ;
   H15  =    -0.12598092081233 + H15 ;
   H16  =     0.44088612390896 + H16 ;
   H17  =     0.10026569431322 + H17 ;
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
   P_DepVar1  =    -0.61260323097533 * H11  +     1.30090555711801 * H12
          +      1.7362874913532 * H13  +    -2.09287445327585 * H14
          +     1.21665749212191 * H15  +      1.4839177023068 * H16
          +      0.9955783523079 * H17 ;
   P_DepVar1  =    -1.81991298094829 + P_DepVar1 ;
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
* Renaming variables for Neural12;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural12;
*------------------------------------------------------------*;
drop Neural12_P_DepVar1;
Neural12_P_DepVar1 = P_DepVar1;
drop Neural12_P_DepVar0;
Neural12_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural12;
*------------------------------------------------------------*;
length Neural12_WARN_ $4;
drop Neural12_WARN_;
Neural12_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural17;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

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

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.80198391473189 * S_PC_1  +     0.07708508420536 * S_PC_10
          +     -0.5948998693841 * S_PC_11  +    -0.30258026092996 * S_PC_12
          +     0.62978702534845 * S_PC_13  +    -0.18440367078326 * S_PC_14
          +     0.03609752993847 * S_PC_15  +     -0.0158699190811 * S_PC_16
          +     0.08479109608464 * S_PC_17  +     0.22074179293199 * S_PC_18
          +     0.05587168708953 * S_PC_19  +    -0.52582185578693 * S_PC_2
          +     -0.1704911233661 * S_PC_20  +     0.18407674284966 * S_PC_3
          +    -0.16074562523243 * S_PC_4  +     0.25965461789084 * S_PC_5
          +     0.02193795171249 * S_PC_6  +    -0.43234039683813 * S_PC_7
          +     0.11315161819822 * S_PC_8  +     0.33948270631366 * S_PC_9 ;
   H12  =     0.32630640539486 * S_PC_1  +    -0.18827402438513 * S_PC_10
          +    -0.23087928007265 * S_PC_11  +     0.03493530555871 * S_PC_12
          +     0.12051812703396 * S_PC_13  +      0.0513581513656 * S_PC_14
          +    -0.49135083322755 * S_PC_15  +    -0.23424715443797 * S_PC_16
          +     0.03914512655981 * S_PC_17  +    -0.53824791847252 * S_PC_18
          +     0.30776644946853 * S_PC_19  +     0.13349406224181 * S_PC_2
          +    -0.11394672965484 * S_PC_20  +      -0.173025831095 * S_PC_3
          +      0.0596702766945 * S_PC_4  +      0.0198642679923 * S_PC_5
          +     0.33517478651526 * S_PC_6  +     0.34391129030453 * S_PC_7
          +       0.244214398189 * S_PC_8  +     0.20060837127761 * S_PC_9 ;
   H13  =    -0.50165061292441 * S_PC_1  +    -0.04906900800182 * S_PC_10
          +      0.2094735190825 * S_PC_11  +    -1.09134317241624 * S_PC_12
          +    -0.45730759613847 * S_PC_13  +     0.27941725761496 * S_PC_14
          +     0.39576395537005 * S_PC_15  +    -0.27911526586632 * S_PC_16
          +    -0.21488175741829 * S_PC_17  +     0.04692577002415 * S_PC_18
          +     0.16955029139987 * S_PC_19  +     0.37415150489766 * S_PC_2
          +    -0.21450975788851 * S_PC_20  +     0.28599965341518 * S_PC_3
          +     0.21163742091763 * S_PC_4  +    -0.40005683564553 * S_PC_5
          +    -0.05087785160495 * S_PC_6  +    -0.01506065828513 * S_PC_7
          +    -0.21982278245544 * S_PC_8  +    -0.19279076886166 * S_PC_9 ;
   H14  =     0.07127535568688 * S_PC_1  +     0.04611331763825 * S_PC_10
          +     0.30931344665073 * S_PC_11  +     0.26225413082664 * S_PC_12
          +    -0.42058323229822 * S_PC_13  +     0.22290902292145 * S_PC_14
          +     0.25358975917078 * S_PC_15  +     0.16235345145156 * S_PC_16
          +    -0.28224656420819 * S_PC_17  +     0.01421979977613 * S_PC_18
          +     0.01504451054749 * S_PC_19  +     0.06056237599599 * S_PC_2
          +     0.68543710616544 * S_PC_20  +      0.5351426365446 * S_PC_3
          +    -0.00979328654574 * S_PC_4  +    -0.19733418333457 * S_PC_5
          +    -0.22080181434332 * S_PC_6  +    -0.39667071628489 * S_PC_7
          +     0.26455382261102 * S_PC_8  +    -0.26576561054478 * S_PC_9 ;
   H15  =    -0.24815516431503 * S_PC_1  +    -0.10488618962533 * S_PC_10
          +    -0.29131882794665 * S_PC_11  +     0.55447570979721 * S_PC_12
          +    -0.04345251268852 * S_PC_13  +    -0.12556631023208 * S_PC_14
          +     0.16535314218308 * S_PC_15  +    -0.17910412775688 * S_PC_16
          +     0.23546805975312 * S_PC_17  +     0.36973241986018 * S_PC_18
          +     0.28497024353409 * S_PC_19  +     -0.2501385107508 * S_PC_2
          +     0.41677435218436 * S_PC_20  +    -0.89705657018228 * S_PC_3
          +     0.30997351641103 * S_PC_4  +    -0.04224204786498 * S_PC_5
          +     0.54565474283324 * S_PC_6  +    -0.07367244349298 * S_PC_7
          +     0.32727083699484 * S_PC_8  +    -0.40586165138302 * S_PC_9 ;
   H16  =    -0.65598956024437 * S_PC_1  +    -0.29182482640965 * S_PC_10
          +     0.19411602647874 * S_PC_11  +     0.22341860288984 * S_PC_12
          +    -0.33859608620455 * S_PC_13  +     0.01609680413712 * S_PC_14
          +       0.170007335229 * S_PC_15  +    -0.34059153042813 * S_PC_16
          +    -0.10031509001666 * S_PC_17  +    -0.33458438180878 * S_PC_18
          +    -0.03535656535892 * S_PC_19  +     0.20787229159824 * S_PC_2
          +      0.2089782140284 * S_PC_20  +    -0.21127272477202 * S_PC_3
          +     0.03521507209015 * S_PC_4  +    -0.01489261680876 * S_PC_5
          +     0.09893921399038 * S_PC_6  +     0.06253881181252 * S_PC_7
          +      0.2145737460009 * S_PC_8  +    -0.33000997858307 * S_PC_9 ;
   H11  =    -1.88928698286099 + H11 ;
   H12  =     0.99057628162191 + H12 ;
   H13  =     0.52726938869037 + H13 ;
   H14  =    -1.75324864668186 + H14 ;
   H15  =    -1.19252503712806 + H15 ;
   H16  =     1.49362478421754 + H16 ;
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
   P_DepVar1  =     1.45836605819469 * H11  +     0.65365187848768 * H12
          +    -2.26897139479857 * H13  +    -0.68822008048768 * H14
          +     1.01238980542398 * H15  +    -0.64752035127218 * H16 ;
   P_DepVar1  =     -1.3294475026486 + P_DepVar1 ;
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
* Renaming variables for Neural17;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural17;
*------------------------------------------------------------*;
drop Neural17_P_DepVar1;
Neural17_P_DepVar1 = P_DepVar1;
drop Neural17_P_DepVar0;
Neural17_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural17;
*------------------------------------------------------------*;
length Neural17_WARN_ $4;
drop Neural17_WARN_;
Neural17_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural16;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

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

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.87985529033799 * S_PC_1  +      0.4152785354231 * S_PC_10
          +     0.16304061845821 * S_PC_11  +    -1.08952456253231 * S_PC_12
          +    -0.16499878790638 * S_PC_13  +     0.19700943516303 * S_PC_14
          +     0.53442619963231 * S_PC_15  +      0.0815645407254 * S_PC_16
          +   6.1455055097511E-6 * S_PC_17  +     0.07812797264138 * S_PC_18
          +     0.26452881915421 * S_PC_19  +     0.30583304789004 * S_PC_2
          +    -0.32419603128176 * S_PC_20  +     -0.0833314603569 * S_PC_3
          +     0.04262550204266 * S_PC_4  +    -0.21735745688106 * S_PC_5
          +      0.1348067968051 * S_PC_6  +     0.40300328062441 * S_PC_7
          +     0.07220012227881 * S_PC_8  +     0.02207129291614 * S_PC_9 ;
   H12  =    -0.06239839954804 * S_PC_1  +    -0.09366838465157 * S_PC_10
          +     0.21674055039123 * S_PC_11  +    -0.68919872418019 * S_PC_12
          +    -0.51637010014787 * S_PC_13  +     0.43448520498453 * S_PC_14
          +     0.37791340490797 * S_PC_15  +    -0.19605244792313 * S_PC_16
          +    -0.49183394762114 * S_PC_17  +    -0.06749843982042 * S_PC_18
          +    -0.15677101252688 * S_PC_19  +     0.21931506187758 * S_PC_2
          +    -0.03591136499868 * S_PC_20  +      0.5255916432353 * S_PC_3
          +     0.15627761072467 * S_PC_4  +    -0.32262529596664 * S_PC_5
          +    -0.24589578477619 * S_PC_6  +    -0.28063301975163 * S_PC_7
          +    -0.31136287591008 * S_PC_8  +    -0.35176991649543 * S_PC_9 ;
   H13  =     0.37052892991841 * S_PC_1  +      0.1687438946533 * S_PC_10
          +       0.068099816462 * S_PC_11  +     0.22987344695229 * S_PC_12
          +    -0.22902963201428 * S_PC_13  +     0.22080646380864 * S_PC_14
          +     0.37164255702642 * S_PC_15  +    -0.15731845659531 * S_PC_16
          +     0.29873092498289 * S_PC_17  +      0.1741334918859 * S_PC_18
          +    -0.47273307030547 * S_PC_19  +     -0.4922299619117 * S_PC_2
          +     0.22022101683962 * S_PC_20  +    -0.18421049528395 * S_PC_3
          +    -0.28181283254668 * S_PC_4  +      0.3762263284981 * S_PC_5
          +      0.1007429976165 * S_PC_6  +     0.06044830530293 * S_PC_7
          +     0.01172087969661 * S_PC_8  +     0.09245378584311 * S_PC_9 ;
   H14  =     0.90297640290994 * S_PC_1  +     0.13041948161047 * S_PC_10
          +    -0.77535837019772 * S_PC_11  +     -0.4424107690377 * S_PC_12
          +      0.5346610917079 * S_PC_13  +     -0.0701245027896 * S_PC_14
          +    -0.00018660615555 * S_PC_15  +     0.05343050394459 * S_PC_16
          +    -0.42739884380956 * S_PC_17  +     0.14491285182751 * S_PC_18
          +     0.02196339681148 * S_PC_19  +    -0.37840184707797 * S_PC_2
          +    -0.26449974044339 * S_PC_20  +      0.0580160083302 * S_PC_3
          +     0.17275625837165 * S_PC_4  +     0.23728001728638 * S_PC_5
          +    -0.25336545677081 * S_PC_6  +    -0.11879047198835 * S_PC_7
          +     0.06848057468918 * S_PC_8  +     0.17053256761161 * S_PC_9 ;
   H15  =      0.3319456803623 * S_PC_1  +    -0.25135311361426 * S_PC_10
          +     0.09574430997605 * S_PC_11  +    -0.36351435720739 * S_PC_12
          +     0.01726694741167 * S_PC_13  +    -0.20185311900782 * S_PC_14
          +    -0.10881397718959 * S_PC_15  +    -0.11026903256573 * S_PC_16
          +    -0.21891970158533 * S_PC_17  +     0.27773436101815 * S_PC_18
          +    -0.12362685539569 * S_PC_19  +     0.63984488191459 * S_PC_2
          +     -0.2844463126829 * S_PC_20  +     0.35355643835888 * S_PC_3
          +    -0.16184446366215 * S_PC_4  +     0.09427477587857 * S_PC_5
          +    -0.17568709507984 * S_PC_6  +     0.12650152831378 * S_PC_7
          +    -0.10817882174405 * S_PC_8  +     0.33635078131267 * S_PC_9 ;
   H11  =    -0.63710174373913 + H11 ;
   H12  =      0.8457781571662 + H12 ;
   H13  =     0.28261520959472 + H13 ;
   H14  =    -1.04295478102168 + H14 ;
   H15  =      0.8730078251022 + H15 ;
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
   P_DepVar1  =    -1.62512633780867 * H11  +    -2.22884014235958 * H12
          +     0.56589376280567 * H13  +     1.68131825229002 * H14
          +    -0.46219982424784 * H15 ;
   P_DepVar1  =    -1.78280840151976 + P_DepVar1 ;
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
* Renaming variables for Neural16;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural16;
*------------------------------------------------------------*;
drop Neural16_P_DepVar1;
Neural16_P_DepVar1 = P_DepVar1;
drop Neural16_P_DepVar0;
Neural16_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural16;
*------------------------------------------------------------*;
length Neural16_WARN_ $4;
drop Neural16_WARN_;
Neural16_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural15;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.38664237458166 * S_PC_1  +    -0.06782034260642 * S_PC_10
          +     0.41833533264093 * S_PC_11  +     0.55182612490891 * S_PC_12
          +    -0.21657289057458 * S_PC_13  +      0.1973363300888 * S_PC_14
          +     -0.1417561903554 * S_PC_15  +    -0.03131163883058 * S_PC_16
          +     0.27792972200805 * S_PC_17  +    -0.23638868683216 * S_PC_18
          +    -0.02851552423879 * S_PC_19  +     0.30789574682959 * S_PC_2
          +     0.72981574817592 * S_PC_20  +    -0.26978055410167 * S_PC_3
          +     0.51982800131821 * S_PC_4  +     0.38666892880921 * S_PC_5
          +     0.67772732631906 * S_PC_6  +    -0.36589607246189 * S_PC_7
          +     0.22095664374831 * S_PC_8  +    -0.22830858981624 * S_PC_9 ;
   H12  =      0.9805786605054 * S_PC_1  +    -0.37430037596207 * S_PC_10
          +     0.71604997076331 * S_PC_11  +    -0.37233651556232 * S_PC_12
          +    -0.52185486524765 * S_PC_13  +     0.21844531513642 * S_PC_14
          +    -0.50341883447092 * S_PC_15  +     0.02225597429156 * S_PC_16
          +    -0.12884671375616 * S_PC_17  +     -0.8560836980266 * S_PC_18
          +      0.5973350246243 * S_PC_19  +     0.32304757036708 * S_PC_2
          +    -0.05861437679794 * S_PC_20  +    -0.14021258360513 * S_PC_3
          +     0.48920026385248 * S_PC_4  +    -0.47755213213657 * S_PC_5
          +      0.3351347944594 * S_PC_6  +     0.75213394874988 * S_PC_7
          +    -0.52434415948615 * S_PC_8  +     0.04645231166732 * S_PC_9 ;
   H13  =     0.33010260427572 * S_PC_1  +    -0.13545793109613 * S_PC_10
          +    -0.14861438803755 * S_PC_11  +     0.51093766169435 * S_PC_12
          +      0.2325724430542 * S_PC_13  +    -0.14593297984016 * S_PC_14
          +    -0.44183153148936 * S_PC_15  +      -0.045799887031 * S_PC_16
          +      0.0913031910953 * S_PC_17  +     -0.0740649444443 * S_PC_18
          +     0.02087270473942 * S_PC_19  +    -0.17418009062705 * S_PC_2
          +     0.05959670004179 * S_PC_20  +    -0.12107656568905 * S_PC_3
          +     0.06025390965507 * S_PC_4  +     0.19765051020765 * S_PC_5
          +     0.19947647122278 * S_PC_6  +    -0.00628384375489 * S_PC_7
          +     0.09723318502979 * S_PC_8  +     0.17189824288116 * S_PC_9 ;
   H14  =     0.74200892607101 * S_PC_1  +    -0.51836259616234 * S_PC_10
          +     0.51514679632751 * S_PC_11  +    -0.51261634544373 * S_PC_12
          +    -0.40942113093583 * S_PC_13  +     0.14833742453259 * S_PC_14
          +    -0.20197117611696 * S_PC_15  +    -0.99078843802702 * S_PC_16
          +    -0.82390897919493 * S_PC_17  +     0.09026123712456 * S_PC_18
          +    -0.52972811687495 * S_PC_19  +     0.09955183642127 * S_PC_2
          +    -0.47043872009654 * S_PC_20  +     0.92257024311986 * S_PC_3
          +    -0.70123238408342 * S_PC_4  +    -0.46862882411712 * S_PC_5
          +    -0.55852364099496 * S_PC_6  +     -0.0071221830173 * S_PC_7
          +    -0.52331395249553 * S_PC_8  +     0.11760605190876 * S_PC_9 ;
   H11  =      2.2555545403347 + H11 ;
   H12  =     -0.6156355346236 + H12 ;
   H13  =    -0.00618836290301 + H13 ;
   H14  =     0.30257133135853 + H14 ;
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
   P_DepVar1  =    -3.20815168642637 * H11  +    -1.34181141204955 * H12
          +     4.24092741271129 * H13  +    -1.83584057359087 * H14 ;
   P_DepVar1  =    -1.83186535709902 + P_DepVar1 ;
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
* Renaming variables for Neural15;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural15;
*------------------------------------------------------------*;
drop Neural15_P_DepVar1;
Neural15_P_DepVar1 = P_DepVar1;
drop Neural15_P_DepVar0;
Neural15_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural15;
*------------------------------------------------------------*;
length Neural15_WARN_ $4;
drop Neural15_WARN_;
Neural15_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural14;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.22196356116954 * S_PC_1  +     0.05344517078482 * S_PC_10
          +      0.6984203867648 * S_PC_11  +     0.43763918010999 * S_PC_12
          +    -0.03672422605188 * S_PC_13  +      0.1259516611641 * S_PC_14
          +    -0.05801762227369 * S_PC_15  +    -0.23391037789444 * S_PC_16
          +     0.35369298503445 * S_PC_17  +    -0.10423956231111 * S_PC_18
          +    -0.27725874271308 * S_PC_19  +     0.68948384127666 * S_PC_2
          +     0.43208892207074 * S_PC_20  +     0.24775274113892 * S_PC_3
          +    -0.28255600795094 * S_PC_4  +    -0.70550055024725 * S_PC_5
          +     0.38208838273969 * S_PC_6  +     0.49732720681648 * S_PC_7
          +     0.01907455998255 * S_PC_8  +    -0.32142612823696 * S_PC_9 ;
   H12  =    -0.14288504420086 * S_PC_1  +    -0.07204180071169 * S_PC_10
          +      0.2058433777918 * S_PC_11  +    -0.72447280544842 * S_PC_12
          +    -0.50408454303488 * S_PC_13  +     0.25490464289158 * S_PC_14
          +     0.28037848773447 * S_PC_15  +    -0.01669043314173 * S_PC_16
          +    -0.24780211304873 * S_PC_17  +    -0.01106800785825 * S_PC_18
          +     0.08560543799495 * S_PC_19  +     0.19800464373596 * S_PC_2
          +    -0.16663011630389 * S_PC_20  +     0.11591720537675 * S_PC_3
          +     0.17064985813689 * S_PC_4  +    -0.08481806363444 * S_PC_5
          +    -0.20776813656018 * S_PC_6  +    -0.20149201283191 * S_PC_7
          +    -0.19048054846238 * S_PC_8  +    -0.17563763618422 * S_PC_9 ;
   H11  =     1.75178136878975 + H11 ;
   H12  =     0.49016930986514 + H12 ;
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
   P_DepVar1  =    -2.26178138125299 * H11  +    -3.22279435260946 * H12 ;
   P_DepVar1  =    -0.85190454292608 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for Neural14;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural14;
*------------------------------------------------------------*;
drop Neural14_P_DepVar1;
Neural14_P_DepVar1 = P_DepVar1;
drop Neural14_P_DepVar0;
Neural14_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural14;
*------------------------------------------------------------*;
length Neural14_WARN_ $4;
drop Neural14_WARN_;
Neural14_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural13;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.22196356116954 * S_PC_1  +     0.05344517078482 * S_PC_10
          +      0.6984203867648 * S_PC_11  +     0.43763918010999 * S_PC_12
          +    -0.03672422605188 * S_PC_13  +      0.1259516611641 * S_PC_14
          +    -0.05801762227369 * S_PC_15  +    -0.23391037789444 * S_PC_16
          +     0.35369298503445 * S_PC_17  +    -0.10423956231111 * S_PC_18
          +    -0.27725874271308 * S_PC_19  +     0.68948384127666 * S_PC_2
          +     0.43208892207074 * S_PC_20  +     0.24775274113892 * S_PC_3
          +    -0.28255600795094 * S_PC_4  +    -0.70550055024725 * S_PC_5
          +     0.38208838273969 * S_PC_6  +     0.49732720681648 * S_PC_7
          +     0.01907455998255 * S_PC_8  +    -0.32142612823696 * S_PC_9 ;
   H12  =    -0.14288504420086 * S_PC_1  +    -0.07204180071169 * S_PC_10
          +      0.2058433777918 * S_PC_11  +    -0.72447280544842 * S_PC_12
          +    -0.50408454303488 * S_PC_13  +     0.25490464289158 * S_PC_14
          +     0.28037848773447 * S_PC_15  +    -0.01669043314173 * S_PC_16
          +    -0.24780211304873 * S_PC_17  +    -0.01106800785825 * S_PC_18
          +     0.08560543799495 * S_PC_19  +     0.19800464373596 * S_PC_2
          +    -0.16663011630389 * S_PC_20  +     0.11591720537675 * S_PC_3
          +     0.17064985813689 * S_PC_4  +    -0.08481806363444 * S_PC_5
          +    -0.20776813656018 * S_PC_6  +    -0.20149201283191 * S_PC_7
          +    -0.19048054846238 * S_PC_8  +    -0.17563763618422 * S_PC_9 ;
   H11  =     1.75178136878975 + H11 ;
   H12  =     0.49016930986514 + H12 ;
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
   P_DepVar1  =    -2.26178138125299 * H11  +    -3.22279435260946 * H12 ;
   P_DepVar1  =    -0.85190454292608 + P_DepVar1 ;
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
drop S_:;
* Renaming variables for Neural13;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural13;
*------------------------------------------------------------*;
drop Neural13_P_DepVar1;
Neural13_P_DepVar1 = P_DepVar1;
drop Neural13_P_DepVar0;
Neural13_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural13;
*------------------------------------------------------------*;
length Neural13_WARN_ $4;
drop Neural13_WARN_;
Neural13_WARN_ = _WARN_;
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
* TOOL: princompanalysis Class;
* TYPE: MODIFY;
* NODE: PRINCOMP;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TOOL: Neural;
* TYPE: MODEL;
* NODE: Neural11;
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
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_18 = 'Standard: PC_18' ;

      label S_PC_19 = 'Standard: PC_19' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_20 = 'Standard: PC_20' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label H11 = 'Hidden: H1=1' ;

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 ,
   PC_10 ,
   PC_11 ,
   PC_12 ,
   PC_13 ,
   PC_14 ,
   PC_15 ,
   PC_16 ,
   PC_17 ,
   PC_18 ,
   PC_19 ,
   PC_2 ,
   PC_20 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.9326340637957E-15 +     0.29856127196125 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -9.2255679809319E-15 +     0.81267664272505 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  3.9010508694298E-15 +      0.8343488153056 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  =  -3.549148780412E-15 +     0.88094641144592 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.2236400050078E-16 +     0.89160303670676 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -2.7740851751603E-15 +     0.89958319422991 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =  1.2368456096485E-15 +      0.9273996164564 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -9.1662217565311E-16 +     0.94870355386249 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  = -3.2793544087531E-15 +     0.97039233963067 * PC_17 ;
   IF MISSING( PC_18 ) THEN S_PC_18  = . ;
   ELSE S_PC_18  =  2.6573178728951E-15 +     1.01893035135692 * PC_18 ;
   IF MISSING( PC_19 ) THEN S_PC_19  = . ;
   ELSE S_PC_19  =  5.4571033427589E-15 +     1.03575063058043 * PC_19 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  1.7819005044245E-16 +     0.53620237396367 * PC_2 ;
   IF MISSING( PC_20 ) THEN S_PC_20  = . ;
   ELSE S_PC_20  = -6.5745909034615E-15 +     1.17404202930983 * PC_20 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  7.2659414314573E-15 +     0.54882613091499 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  =  -9.594020997569E-15 +     0.62616694648196 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  =  6.4769256780617E-15 +     0.65381673515035 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =   3.580536079847E-15 +     0.70036731226737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7364722741013E-15 +     0.71812657760342 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -1.3132402130488E-15 +     0.77088794083704 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  =   6.653417690349E-15 +     0.79301377407747 * PC_9 ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.11291389797984 * S_PC_1  +     0.00989452135404 * S_PC_10
          +    -0.08782782041825 * S_PC_11  +     0.12896858955031 * S_PC_12
          +     0.10852552259949 * S_PC_13  +    -0.05459013239627 * S_PC_14
          +    -0.06188895597388 * S_PC_15  +     0.02191855220919 * S_PC_16
          +      0.0406908878643 * S_PC_17  +      0.0210719986739 * S_PC_18
          +    -0.00097087095304 * S_PC_19  +    -0.09397655088279 * S_PC_2
          +     0.02419420716907 * S_PC_20  +    -0.07217172638111 * S_PC_3
          +    -0.01064095728398 * S_PC_4  +     0.08089909058248 * S_PC_5
          +     0.02668988972907 * S_PC_6  +     0.00136326079552 * S_PC_7
          +     0.05125338899143 * S_PC_8  +     0.05004904495619 * S_PC_9 ;
   H11  =     0.43168893994775 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     12.2601604533939 * H11 ;
   P_DepVar1  =    -7.90048847586824 + P_DepVar1 ;
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
* Renaming variables for Neural11;
*------------------------------------------------------------*;
* Renaming Posterior variables for Neural11;
*------------------------------------------------------------*;
drop Neural11_P_DepVar1;
Neural11_P_DepVar1 = P_DepVar1;
drop Neural11_P_DepVar0;
Neural11_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for Neural11;
*------------------------------------------------------------*;
length Neural11_WARN_ $4;
drop Neural11_WARN_;
Neural11_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl2;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl2: Average Posteriors of 9 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Reg2_P_DepVar1 +
Tree2_P_DepVar1 +
Neural12_P_DepVar1 +
Neural17_P_DepVar1 +
Neural16_P_DepVar1 +
Neural15_P_DepVar1 +
Neural14_P_DepVar1 +
Neural13_P_DepVar1 +
Neural11_P_DepVar1
)/9;
P_DepVar0 = (
Reg2_P_DepVar0 +
Tree2_P_DepVar0 +
Neural12_P_DepVar0 +
Neural17_P_DepVar0 +
Neural16_P_DepVar0 +
Neural15_P_DepVar0 +
Neural14_P_DepVar0 +
Neural13_P_DepVar0 +
Neural11_P_DepVar0
)/9;
*------------------------------------------------------------*;
* Ensmbl2: Computing Classification Vars;
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
* Ensmbl2: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl2: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(REG2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(TREE2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(TREE2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(TREE2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(TREE2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL12_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL12_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL12_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL12_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL17_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL17_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL17_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL17_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL16_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL16_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL16_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL16_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL15_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL15_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL15_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL15_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL14_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL14_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL14_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL14_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL13_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL13_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL13_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL13_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL11_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL11_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL11_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL11_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
