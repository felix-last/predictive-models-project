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
else _D13=(MonthsAsCustomer-83.4953664700926)/16.9441392661404;
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
/****************************************/
* Principal Component 1;
/****************************************/
;
label PC_1 = "Principal Component 1";
PC_1 =
-0.140458135*AcceptedCmp1_1_+
0.1404581348*AcceptedCmp1_2_+
-0.057569412*AcceptedCmp2_1_+
0.0575694115*AcceptedCmp2_2_+
-0.021432421*AcceptedCmp3_1_+
0.0214324207*AcceptedCmp3_2_+
-0.097064643*AcceptedCmp4_1_+
0.0970646433*AcceptedCmp4_2_+
-0.16820039*AcceptedCmp5_1_+
0.1682003903*AcceptedCmp5_2_+
0.0084775992*Complain_1_+
-0.008477599*Complain_2_+
-0.038001411*Education_1_+
-0.057927007*Education_2_+
0.0164467248*Education_3_+
0.0194632836*Education_4_+
0.0146881605*Education_5_+
-0.063741533*HigherEducationBinary_1_+
0.0637415326*HigherEducationBinary_2_+
-0.003891697*Marital_Status_1_+
-0.004075076*Marital_Status_2_+
-0.001997403*Marital_Status_3_+
0.0026952933*Marital_Status_4_+
0.0166895822*Marital_Status_5_+
0.1763660106*_D1+
0.0470054481*_D2+
0.2648054673*_D3+
0.2627405385*_D4+
-0.183241836*_D5+
0.2837957907*_D6+
0.1852426969*_D7+
0.1884761928*_D8+
0.1587305445*_D9+
0.2426715301*_D10+
0.1867315512*_D11+
0.2531370582*_D12+
0.0320809962*_D13+
0.2527843092*_D14+
-0.0450432*_D15+
0.2563413151*_D16+
0.2200040251*_D17+
0.1832325068*_D18+
-0.171106508*_D19+
0.1179149165*_D20+
0.2531680757*_D21+
0.0000889877*_D22+
-0.044013386*_D23;
/****************************************/
* Principal Component 2;
/****************************************/
;
label PC_2 = "Principal Component 2";
PC_2 =
0.2613714688*AcceptedCmp1_1_+
-0.261371469*AcceptedCmp1_2_+
0.2628239071*AcceptedCmp2_1_+
-0.262823907*AcceptedCmp2_2_+
0.1742955149*AcceptedCmp3_1_+
-0.174295515*AcceptedCmp3_2_+
0.2314404768*AcceptedCmp4_1_+
-0.231440477*AcceptedCmp4_2_+
0.2494235969*AcceptedCmp5_1_+
-0.249423597*AcceptedCmp5_2_+
-0.015082454*Complain_1_+
0.0150824536*Complain_2_+
-0.164744536*Education_1_+
-0.108501665*Education_2_+
0.100757351*Education_3_+
0.045798021*Education_4_+
0.0017200302*Education_5_+
-0.202263299*HigherEducationBinary_1_+
0.2022632987*HigherEducationBinary_2_+
-0.009046132*Marital_Status_1_+
-0.018877558*Marital_Status_2_+
0.00410033*Marital_Status_3_+
0.0247077258*Marital_Status_4_+
-0.000852151*Marital_Status_5_+
-0.403386933*_D1+
0.0939886767*_D2+
0.0977021673*_D3+
0.0840253256*_D4+
-0.091473628*_D5+
0.0578405257*_D6+
0.120423901*_D7+
0.1118224217*_D8+
0.0349080496*_D9+
0.0711464332*_D10+
0.0971499029*_D11+
0.0095334544*_D12+
0.0531668125*_D13+
0.0500672429*_D14+
0.0550132221*_D15+
0.0756439419*_D16+
0.1079389122*_D17+
0.0800820364*_D18+
-0.090392382*_D19+
0.0265740175*_D20+
0.0570316174*_D21+
-0.008671177*_D22+
0.1065727839*_D23;
/****************************************/
* Principal Component 3;
/****************************************/
;
label PC_3 = "Principal Component 3";
PC_3 =
0.0212827863*AcceptedCmp1_1_+
-0.021282786*AcceptedCmp1_2_+
0.1536837823*AcceptedCmp2_1_+
-0.153683782*AcceptedCmp2_2_+
0.0505857421*AcceptedCmp3_1_+
-0.050585742*AcceptedCmp3_2_+
0.1495318043*AcceptedCmp4_1_+
-0.149531804*AcceptedCmp4_2_+
0.0396469576*AcceptedCmp5_1_+
-0.039646958*AcceptedCmp5_2_+
-0.052924088*Complain_1_+
0.0529240885*Complain_2_+
0.4092278476*Education_1_+
0.2108570566*Education_2_+
-0.168672489*Education_3_+
-0.051402001*Education_4_+
-0.133362175*Education_5_+
0.4719592854*HigherEducationBinary_1_+
-0.471959285*HigherEducationBinary_2_+
-0.014219054*Marital_Status_1_+
-0.02945506*Marital_Status_2_+
0.0497627897*Marital_Status_3_+
0.0028947857*Marital_Status_4_+
-0.017294285*Marital_Status_5_+
-0.127912546*_D1+
-0.135177739*_D2+
0.0177378314*_D3+
-0.009993903*_D4+
-0.036617955*_D5+
0.0483380707*_D6+
0.1541989708*_D7+
0.1513700712*_D8+
0.0909039198*_D9+
0.0954587554*_D10+
0.1610658645*_D11+
-0.048143861*_D12+
0.0315445537*_D13+
0.0534739914*_D14+
-0.090312089*_D15+
0.0127943931*_D16+
0.0209233367*_D17+
-0.034185035*_D18+
-0.084292945*_D19+
0.0170051923*_D20+
0.050532779*_D21+
-0.015997946*_D22+
-0.167586144*_D23;
/****************************************/
* Principal Component 4;
/****************************************/
;
label PC_4 = "Principal Component 4";
PC_4 =
0.0898892626*AcceptedCmp1_1_+
-0.089889263*AcceptedCmp1_2_+
-0.087408007*AcceptedCmp2_1_+
0.0874080071*AcceptedCmp2_2_+
-0.3195186*AcceptedCmp3_1_+
0.3195185999*AcceptedCmp3_2_+
0.0295528399*AcceptedCmp4_1_+
-0.02955284*AcceptedCmp4_2_+
0.1836055754*AcceptedCmp5_1_+
-0.183605575*AcceptedCmp5_2_+
-0.081919874*Complain_1_+
0.0819198735*Complain_2_+
0.1230765292*Education_1_+
0.0075607793*Education_2_+
-0.072373987*Education_3_+
-0.049646675*Education_4_+
0.0397531513*Education_5_+
0.1129355442*HigherEducationBinary_1_+
-0.112935544*HigherEducationBinary_2_+
0.0269889319*Marital_Status_1_+
-0.023521405*Marital_Status_2_+
-0.00919597*Marital_Status_3_+
0.009417809*Marital_Status_4_+
0.018977948*Marital_Status_5_+
0.0269457435*_D1+
0.110327775*_D2+
0.1599057503*_D3+
-0.026273918*_D4+
0.0322752756*_D5+
0.010479531*_D6+
-0.051367191*_D7+
-0.063459984*_D8+
0.2109366901*_D9+
-0.108602467*_D10+
-0.06477534*_D11+
0.0783306075*_D12+
0.2238973045*_D13+
0.0262994343*_D14+
0.4196076803*_D15+
0.1958695622*_D16+
0.0747890392*_D17+
0.3169601269*_D18+
0.2671626456*_D19+
-0.019046038*_D20+
-0.018297688*_D21+
0.0351663804*_D22+
0.267866162*_D23;
/****************************************/
* Principal Component 5;
/****************************************/
;
label PC_5 = "Principal Component 5";
PC_5 =
0.0675092094*AcceptedCmp1_1_+
-0.067509209*AcceptedCmp1_2_+
-0.08058286*AcceptedCmp2_1_+
0.0805828601*AcceptedCmp2_2_+
0.4547776528*AcceptedCmp3_1_+
-0.454777653*AcceptedCmp3_2_+
-0.353113637*AcceptedCmp4_1_+
0.3531136365*AcceptedCmp4_2_+
0.0527588146*AcceptedCmp5_1_+
-0.052758815*AcceptedCmp5_2_+
-0.013311605*Complain_1_+
0.0133116048*Complain_2_+
0.1299950447*Education_1_+
0.0251003568*Education_2_+
-0.2087027*Education_3_+
0.0418453701*Education_4_+
0.1123385919*Education_5_+
0.128172236*HigherEducationBinary_1_+
-0.128172236*HigherEducationBinary_2_+
0.0552072498*Marital_Status_1_+
0.0096281013*Marital_Status_2_+
-0.070245199*Marital_Status_3_+
-0.01737064*Marital_Status_4_+
0.0873275688*Marital_Status_5_+
-0.084974366*_D1+
0.1550136015*_D2+
0.078554817*_D3+
0.0443144688*_D4+
-0.091471796*_D5+
-0.004509038*_D6+
-0.082711913*_D7+
-0.087505369*_D8+
-0.127395543*_D9+
-0.077717079*_D10+
-0.06574571*_D11+
0.0906310703*_D12+
0.0471806154*_D13+
-0.043338343*_D14+
0.1166992955*_D15+
0.0358101391*_D16+
0.1221381658*_D17+
0.1090098665*_D18+
0.0312771613*_D19+
-0.003882522*_D20+
-0.022409494*_D21+
0.0017782799*_D22+
0.2006381373*_D23;
/****************************************/
* Principal Component 6;
/****************************************/
;
label PC_6 = "Principal Component 6";
PC_6 =
0.0012958647*AcceptedCmp1_1_+
-0.001295865*AcceptedCmp1_2_+
0.0161803959*AcceptedCmp2_1_+
-0.016180396*AcceptedCmp2_2_+
0.0092356696*AcceptedCmp3_1_+
-0.00923567*AcceptedCmp3_2_+
-0.034735882*AcceptedCmp4_1_+
0.0347358816*AcceptedCmp4_2_+
0.0583327346*AcceptedCmp5_1_+
-0.058332735*AcceptedCmp5_2_+
0.6791492537*Complain_1_+
-0.679149254*Complain_2_+
0.002822791*Education_1_+
0.078767304*Education_2_+
0.0803238125*Education_3_+
-0.045589682*Education_4_+
-0.092607083*Education_5_+
0.0434069556*HigherEducationBinary_1_+
-0.043406956*HigherEducationBinary_2_+
0.0120375992*Marital_Status_1_+
-0.024126543*Marital_Status_2_+
0.0584883211*Marital_Status_3_+
-0.013658534*Marital_Status_4_+
-0.058806277*Marital_Status_5_+
-0.017237296*_D1+
-0.066903646*_D2+
0.0192080633*_D3+
-0.037184122*_D4+
-0.00422198*_D5+
0.01138648*_D6+
-0.003294667*_D7+
0.0198947026*_D8+
0.0686989974*_D9+
-0.00481154*_D10+
0.0240890277*_D11+
0.0083268352*_D12+
0.041331954*_D13+
-0.004410956*_D14+
0.0623540715*_D15+
0.0296598708*_D16+
0.0003159539*_D17+
0.0568977005*_D18+
0.0878952957*_D19+
0.020534053*_D20+
0.0078426398*_D21+
-0.038150379*_D22+
0.0291272006*_D23;
/****************************************/
* Principal Component 7;
/****************************************/
;
label PC_7 = "Principal Component 7";
PC_7 =
-0.016732809*AcceptedCmp1_1_+
0.016732809*AcceptedCmp1_2_+
-0.121166808*AcceptedCmp2_1_+
0.1211668085*AcceptedCmp2_2_+
0.1645500127*AcceptedCmp3_1_+
-0.164550013*AcceptedCmp3_2_+
-0.13953053*AcceptedCmp4_1_+
0.1395305297*AcceptedCmp4_2_+
0.0518809672*AcceptedCmp5_1_+
-0.051880967*AcceptedCmp5_2_+
-0.136735887*Complain_1_+
0.1367358866*Complain_2_+
-0.04256728*Education_1_+
0.0457713155*Education_2_+
0.5625944599*Education_3_+
-0.262518952*Education_4_+
-0.440414648*Education_5_+
-0.013931106*HigherEducationBinary_1_+
0.0139311059*HigherEducationBinary_2_+
-0.077078746*Marital_Status_1_+
0.0941422801*Marital_Status_2_+
0.0719000041*Marital_Status_3_+
-0.079839048*Marital_Status_4_+
-0.110538642*Marital_Status_5_+
-0.008659858*_D1+
-0.238111649*_D2+
0.0061269406*_D3+
-0.087934247*_D4+
0.0786912423*_D5+
-0.008257739*_D6+
0.1092797653*_D7+
0.0970604394*_D8+
0.1227608722*_D9+
-0.022942842*_D10+
0.1386927796*_D11+
-0.062388593*_D12+
0.1741211722*_D13+
-0.035757029*_D14+
0.1036693256*_D15+
0.0146801188*_D16+
-0.007277107*_D17+
0.0637677023*_D18+
0.1710893672*_D19+
-0.014667667*_D20+
-0.017021226*_D21+
0.0109672036*_D22+
-0.066996151*_D23;
/****************************************/
* Principal Component 8;
/****************************************/
;
label PC_8 = "Principal Component 8";
PC_8 =
-0.236173029*AcceptedCmp1_1_+
0.2361730286*AcceptedCmp1_2_+
0.5414302333*AcceptedCmp2_1_+
-0.541430233*AcceptedCmp2_2_+
-0.022190455*AcceptedCmp3_1_+
0.0221904553*AcceptedCmp3_2_+
-0.156807195*AcceptedCmp4_1_+
0.1568071955*AcceptedCmp4_2_+
-0.036753906*AcceptedCmp5_1_+
0.0367539061*AcceptedCmp5_2_+
-0.033548648*Complain_1_+
0.0335486482*Complain_2_+
-0.006666918*Education_1_+
-0.028171988*Education_2_+
-0.009311251*Education_3_+
-0.017942475*Education_4_+
0.0437408665*Education_5_+
-0.02053566*HigherEducationBinary_1_+
0.0205356601*HigherEducationBinary_2_+
-0.023116627*Marital_Status_1_+
0.2637807951*Marital_Status_2_+
0.0149524439*Marital_Status_3_+
-0.284133025*Marital_Status_4_+
-0.050344071*Marital_Status_5_+
0.08226854*_D1+
-0.043867567*_D2+
0.0062373425*_D3+
-0.019033406*_D4+
0.1170258624*_D5+
0.0087026918*_D6+
-0.073463501*_D7+
-0.073949213*_D8+
-0.025884026*_D9+
-0.007355264*_D10+
-0.03486429*_D11+
0.0477549527*_D12+
0.068775092*_D13+
-0.006515602*_D14+
0.1311566443*_D15+
0.0404346108*_D16+
-0.043440395*_D17+
0.0780999618*_D18+
0.1299681525*_D19+
0.0301079866*_D20+
-0.004968781*_D21+
-0.0344928*_D22+
0.0294974419*_D23;
/****************************************/
* Principal Component 9;
/****************************************/
;
label PC_9 = "Principal Component 9";
PC_9 =
-0.105953969*AcceptedCmp1_1_+
0.1059539692*AcceptedCmp1_2_+
0.122120123*AcceptedCmp2_1_+
-0.122120123*AcceptedCmp2_2_+
0.078548407*AcceptedCmp3_1_+
-0.078548407*AcceptedCmp3_2_+
-0.017954118*AcceptedCmp4_1_+
0.0179541179*AcceptedCmp4_2_+
-0.059297126*AcceptedCmp5_1_+
0.0592971265*AcceptedCmp5_2_+
-0.04968973*Complain_1_+
0.04968973*Complain_2_+
-0.091396949*Education_1_+
0.0747650451*Education_2_+
-0.033329735*Education_3_+
0.0957893612*Education_4_+
-0.009575352*Education_5_+
-0.042122042*HigherEducationBinary_1_+
0.0421220419*HigherEducationBinary_2_+
0.0724815558*Marital_Status_1_+
-0.687804004*Marital_Status_2_+
0.4197805047*Marital_Status_3_+
0.3303191759*Marital_Status_4_+
0.0214388276*Marital_Status_5_+
0.017839611*_D1+
-0.100239688*_D2+
-0.000378617*_D3+
-0.064348538*_D4+
0.0901492739*_D5+
0.027946021*_D6+
-0.054382585*_D7+
-0.032796084*_D8+
-0.034069093*_D9+
0.0074185266*_D10+
-0.063401018*_D11+
0.0692554142*_D12+
0.2259900295*_D13+
-0.001567331*_D14+
0.0593813079*_D15+
0.0264878148*_D16+
-0.038275356*_D17+
0.0482971529*_D18+
0.1492466457*_D19+
0.0443006388*_D20+
0.0136224286*_D21+
-0.065555761*_D22+
-0.074045969*_D23;
/****************************************/
* Principal Component 10;
/****************************************/
;
label PC_10 = "Principal Component 10";
PC_10 =
-0.427186966*AcceptedCmp1_1_+
0.4271869663*AcceptedCmp1_2_+
-0.056426078*AcceptedCmp2_1_+
0.0564260777*AcceptedCmp2_2_+
0.1969529564*AcceptedCmp3_1_+
-0.196952956*AcceptedCmp3_2_+
0.3257384652*AcceptedCmp4_1_+
-0.325738465*AcceptedCmp4_2_+
-0.022381012*AcceptedCmp5_1_+
0.022381012*AcceptedCmp5_2_+
0.0303890267*Complain_1_+
-0.030389027*Complain_2_+
0.0445961096*Education_1_+
-0.070263072*Education_2_+
0.0454386945*Education_3_+
-0.04912623*Education_4_+
-0.014379779*Education_5_+
0.0030085561*HigherEducationBinary_1_+
-0.003008556*HigherEducationBinary_2_+
0.1534823752*Marital_Status_1_+
-0.004922338*Marital_Status_2_+
-0.211588617*Marital_Status_3_+
0.0920084661*Marital_Status_4_+
0.0259442352*Marital_Status_5_+
-0.02737027*_D1+
0.1491096189*_D2+
0.0266013384*_D3+
0.0062390256*_D4+
0.0244658757*_D5+
-0.03771128*_D6+
0.0213422473*_D7+
-0.005827005*_D8+
-0.00187685*_D9+
-0.047834554*_D10+
0.0306826338*_D11+
-0.042283239*_D12+
0.0661990957*_D13+
-0.016452359*_D14+
0.1222261139*_D15+
0.0194040253*_D16+
0.0310728148*_D17+
0.0516114058*_D18+
0.0296864714*_D19+
-0.267590485*_D20+
-0.065810275*_D21+
0.2989080089*_D22+
0.1608551794*_D23;
/****************************************/
* Principal Component 11;
/****************************************/
;
label PC_11 = "Principal Component 11";
PC_11 =
-0.006545316*AcceptedCmp1_1_+
0.0065453157*AcceptedCmp1_2_+
-0.142329416*AcceptedCmp2_1_+
0.142329416*AcceptedCmp2_2_+
0.1321079603*AcceptedCmp3_1_+
-0.13210796*AcceptedCmp3_2_+
0.1691823277*AcceptedCmp4_1_+
-0.169182328*AcceptedCmp4_2_+
-0.063943806*AcceptedCmp5_1_+
0.0639438061*AcceptedCmp5_2_+
0.0021797956*Complain_1_+
-0.002179796*Complain_2_+
-0.199156333*Education_1_+
0.2393830101*Education_2_+
-0.272327462*Education_3_+
0.1421865671*Education_4_+
0.2476512015*Education_5_+
-0.052072318*HigherEducationBinary_1_+
0.0520723184*HigherEducationBinary_2_+
-0.307024197*Marital_Status_1_+
0.2948699265*Marital_Status_2_+
-0.059182966*Marital_Status_3_+
0.0005476608*Marital_Status_4_+
-0.166525593*Marital_Status_5_+
-0.067245795*_D1+
-0.25778568*_D2+
0.0235727633*_D3+
-0.088417359*_D4+
0.1696542056*_D5+
0.0533381238*_D6+
0.004548437*_D7+
-0.022269427*_D8+
-0.0662035*_D9+
0.0565662788*_D10+
-0.002846157*_D11+
0.0707142356*_D12+
0.3369273091*_D13+
0.0013660497*_D14+
0.108257531*_D15+
0.052709965*_D16+
-0.022668341*_D17+
0.0913534067*_D18+
0.1915342987*_D19+
0.1335227824*_D20+
0.0521440083*_D21+
-0.081313173*_D22+
-0.252402252*_D23;
/****************************************/
* Principal Component 12;
/****************************************/
;
label PC_12 = "Principal Component 12";
PC_12 =
0.0510744214*AcceptedCmp1_1_+
-0.051074421*AcceptedCmp1_2_+
0.1440255193*AcceptedCmp2_1_+
-0.144025519*AcceptedCmp2_2_+
-0.027260487*AcceptedCmp3_1_+
0.027260487*AcceptedCmp3_2_+
-0.058597723*AcceptedCmp4_1_+
0.0585977234*AcceptedCmp4_2_+
-0.119888842*AcceptedCmp5_1_+
0.1198888424*AcceptedCmp5_2_+
0.0127220893*Complain_1_+
-0.012722089*Complain_2_+
0.0257868965*Education_1_+
0.0042025303*Education_2_+
0.1166743259*Education_3_+
-0.055010218*Education_4_+
-0.11349734*Education_5_+
0.0250219994*HigherEducationBinary_1_+
-0.025021999*HigherEducationBinary_2_+
-0.1338392*Marital_Status_1_+
0.0209414581*Marital_Status_2_+
-0.606974023*Marital_Status_3_+
0.6275252275*Marital_Status_4_+
0.083344908*Marital_Status_5_+
0.0389246309*_D1+
0.1066373922*_D2+
-0.027882483*_D3+
-0.029016524*_D4+
0.0121712393*_D5+
-0.00837083*_D6+
0.0092413594*_D7+
0.0036420049*_D8+
0.0018321613*_D9+
-0.00223226*_D10+
-0.006878559*_D11+
-0.01471795*_D12+
0.1002812811*_D13+
-0.035026987*_D14+
0.000520256*_D15+
-0.009315758*_D16+
-0.048150915*_D17+
0.0207458754*_D18+
0.0702076204*_D19+
0.1552224329*_D20+
-0.009884503*_D21+
-0.196413087*_D22+
-0.000244612*_D23;
/****************************************/
* Principal Component 13;
/****************************************/
;
label PC_13 = "Principal Component 13";
PC_13 =
0.1168819191*AcceptedCmp1_1_+
-0.116881919*AcceptedCmp1_2_+
0.0758870806*AcceptedCmp2_1_+
-0.075887081*AcceptedCmp2_2_+
-0.056988594*AcceptedCmp3_1_+
0.056988594*AcceptedCmp3_2_+
-0.147525952*AcceptedCmp4_1_+
0.1475259524*AcceptedCmp4_2_+
-0.008530649*AcceptedCmp5_1_+
0.0085306491*AcceptedCmp5_2_+
0.0071883028*Complain_1_+
-0.007188303*Complain_2_+
-0.067902272*Education_1_+
0.0746993635*Education_2_+
-0.112499062*Education_3_+
0.4572645886*Education_4_+
-0.248164177*Education_5_+
-0.021346904*HigherEducationBinary_1_+
0.0213469045*HigherEducationBinary_2_+
-0.123224937*Marital_Status_1_+
0.0382122115*Marital_Status_2_+
-0.069300544*Marital_Status_3_+
0.1603573104*Marital_Status_4_+
-0.123149352*Marital_Status_5_+
0.0269944866*_D1+
-0.12812552*_D2+
0.0085609035*_D3+
-0.006778352*_D4+
-0.012426788*_D5+
0.0254169217*_D6+
0.0095487841*_D7+
0.0329538577*_D8+
0.0446703871*_D9+
-0.002268497*_D10+
0.0352803637*_D11+
0.0303726938*_D12+
-0.019355532*_D13+
-0.003176801*_D14+
-0.019348687*_D15+
0.0201804097*_D16+
-0.009699418*_D17+
0.0388991189*_D18+
0.0207633756*_D19+
-0.457660158*_D20+
0.0441794093*_D21+
0.5567817743*_D22+
-0.078107959*_D23;
/****************************************/
* Principal Component 14;
/****************************************/
;
label PC_14 = "Principal Component 14";
PC_14 =
0.0426429068*AcceptedCmp1_1_+
-0.042642907*AcceptedCmp1_2_+
-0.025228395*AcceptedCmp2_1_+
0.0252283946*AcceptedCmp2_2_+
0.0473660271*AcceptedCmp3_1_+
-0.047366027*AcceptedCmp3_2_+
0.1381937381*AcceptedCmp4_1_+
-0.138193738*AcceptedCmp4_2_+
-0.242522406*AcceptedCmp5_1_+
0.2425224061*AcceptedCmp5_2_+
0.0140509736*Complain_1_+
-0.014050974*Complain_2_+
0.0477150931*Education_1_+
-0.060027939*Education_2_+
0.0021813419*Education_3_+
0.4925228344*Education_4_+
-0.444612716*Education_5_+
0.0110865289*HigherEducationBinary_1_+
-0.011086529*HigherEducationBinary_2_+
-0.129759394*Marital_Status_1_+
0.0573077823*Marital_Status_2_+
0.1059860871*Marital_Status_3_+
-0.233824515*Marital_Status_4_+
0.3868567485*Marital_Status_5_+
0.0136830767*_D1+
0.1851649673*_D2+
-0.020219183*_D3+
0.0024977201*_D4+
0.0225911162*_D5+
-0.032718072*_D6+
0.0008678804*_D7+
0.0005216237*_D8+
0.0470760958*_D9+
-0.05825241*_D10+
-0.008632094*_D11+
-0.027282984*_D12+
0.0570637303*_D13+
-0.05436298*_D14+
0.1041335926*_D15+
-0.017602905*_D16+
-0.01958313*_D17+
0.0266618833*_D18+
0.0570728327*_D19+
0.119591875*_D20+
-0.033378445*_D21+
-0.224354133*_D22+
0.1481072157*_D23;
/****************************************/
* Principal Component 15;
/****************************************/
;
label PC_15 = "Principal Component 15";
PC_15 =
0.2399010852*AcceptedCmp1_1_+
-0.239901085*AcceptedCmp1_2_+
0.0754712497*AcceptedCmp2_1_+
-0.07547125*AcceptedCmp2_2_+
0.0344580314*AcceptedCmp3_1_+
-0.034458031*AcceptedCmp3_2_+
0.0516921067*AcceptedCmp4_1_+
-0.051692107*AcceptedCmp4_2_+
-0.345414911*AcceptedCmp5_1_+
0.3454149111*AcceptedCmp5_2_+
0.0335113813*Complain_1_+
-0.033511381*Complain_2_+
-0.042424266*Education_1_+
0.1130155552*Education_2_+
0.0948218704*Education_3_+
-0.434856954*Education_4_+
0.2500966702*Education_5_+
0.0211180106*HigherEducationBinary_1_+
-0.021118011*HigherEducationBinary_2_+
-0.126139537*Marital_Status_1_+
-0.035307002*Marital_Status_2_+
0.0821511115*Marital_Status_3_+
-0.098907723*Marital_Status_4_+
0.3701851951*Marital_Status_5_+
0.0029336209*_D1+
0.0934020981*_D2+
-0.025975204*_D3+
-0.010876446*_D4+
0.046025849*_D5+
0.0212189618*_D6+
-0.00931987*_D7+
-0.004389971*_D8+
0.065028902*_D9+
0.0023935334*_D10+
0.0323197329*_D11+
0.0245132334*_D12+
0.1087394884*_D13+
-0.010134224*_D14+
0.0423730123*_D15+
-0.001931811*_D16+
-0.054394221*_D17+
0.0073465256*_D18+
0.0584574163*_D19+
-0.203469428*_D20+
0.0327440729*_D21+
0.3119905987*_D22+
0.0061647823*_D23;
/****************************************/
* Principal Component 16;
/****************************************/
;
label PC_16 = "Principal Component 16";
PC_16 =
0.0840250236*AcceptedCmp1_1_+
-0.084025024*AcceptedCmp1_2_+
-0.007040006*AcceptedCmp2_1_+
0.007040006*AcceptedCmp2_2_+
-0.018703074*AcceptedCmp3_1_+
0.0187030738*AcceptedCmp3_2_+
-0.033019931*AcceptedCmp4_1_+
0.0330199306*AcceptedCmp4_2_+
-0.015522354*AcceptedCmp5_1_+
0.015522354*AcceptedCmp5_2_+
-0.013127893*Complain_1_+
0.0131278929*Complain_2_+
-0.149771642*Education_1_+
0.2144401457*Education_2_+
-0.03904872*Education_3_+
0.1045506433*Education_4_+
-0.027255476*Education_5_+
-0.021286034*HigherEducationBinary_1_+
0.0212860337*HigherEducationBinary_2_+
0.7491391223*Marital_Status_1_+
-0.046011324*Marital_Status_2_+
-0.289896185*Marital_Status_3_+
-0.221066737*Marital_Status_4_+
0.0599950342*Marital_Status_5_+
-0.003700609*_D1+
0.0675552037*_D2+
-0.094282236*_D3+
-0.08971853*_D4+
0.0602332916*_D5+
0.0743048052*_D6+
0.0870920293*_D7+
0.0916983287*_D8+
0.0408104592*_D9+
0.0594063804*_D10+
0.0777259106*_D11+
0.054870422*_D12+
0.2344965128*_D13+
-0.014782503*_D14+
-0.03265688*_D15+
-0.047647815*_D16+
-0.139992576*_D17+
-0.068212262*_D18+
0.1333002089*_D19+
0.020748141*_D20+
0.1298174867*_D21+
-0.010901902*_D22+
-0.144379876*_D23;
/****************************************/
* Principal Component 17;
/****************************************/
;
label PC_17 = "Principal Component 17";
PC_17 =
-0.18408366*AcceptedCmp1_1_+
0.18408366*AcceptedCmp1_2_+
-0.006335819*AcceptedCmp2_1_+
0.0063358191*AcceptedCmp2_2_+
-0.066528703*AcceptedCmp3_1_+
0.0665287029*AcceptedCmp3_2_+
-0.078236638*AcceptedCmp4_1_+
0.0782366381*AcceptedCmp4_2_+
0.2825526928*AcceptedCmp5_1_+
-0.282552693*AcceptedCmp5_2_+
-0.017317356*Complain_1_+
0.0173173558*Complain_2_+
-0.262511915*Education_1_+
0.4684885608*Education_2_+
0.0091381214*Education_3_+
-0.017258091*Education_4_+
-0.004680038*Education_5_+
0.0107966932*HigherEducationBinary_1_+
-0.010796693*HigherEducationBinary_2_+
-0.283676535*Marital_Status_1_+
0.01759367*Marital_Status_2_+
0.0335127851*Marital_Status_3_+
-0.013578351*Marital_Status_4_+
0.4010451269*Marital_Status_5_+
0.0133661168*_D1+
0.2637699092*_D2+
-0.071884567*_D3+
-0.066141617*_D4+
-0.239002095*_D5+
0.0211616119*_D6+
0.0408605974*_D7+
0.0591654285*_D8+
0.0322230663*_D9+
0.0030881445*_D10+
0.0235261419*_D11+
0.0148357215*_D12+
0.1246760972*_D13+
0.0033553181*_D14+
-0.168244136*_D15+
-0.064947369*_D16+
-0.066281008*_D17+
-0.117905989*_D18+
-0.015630025*_D19+
-0.047411529*_D20+
0.0760465904*_D21+
-0.003321571*_D22+
0.0174812315*_D23;
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
;
