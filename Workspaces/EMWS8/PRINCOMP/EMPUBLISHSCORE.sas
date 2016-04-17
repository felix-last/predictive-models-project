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
