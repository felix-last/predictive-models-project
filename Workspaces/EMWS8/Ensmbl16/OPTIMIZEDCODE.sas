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
else _D13=(MonthsAsCustomer-83.5724515585509)/16.947242674662;
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
/****************************************/
* Principal Component 1;
/****************************************/
;
label PC_1 = "Principal Component 1";
PC_1 =
-0.140456284*AcceptedCmp1_1_+
0.1404562837*AcceptedCmp1_2_+
-0.057569529*AcceptedCmp2_1_+
0.0575695287*AcceptedCmp2_2_+
-0.021432127*AcceptedCmp3_1_+
0.0214321269*AcceptedCmp3_2_+
-0.097064339*AcceptedCmp4_1_+
0.0970643388*AcceptedCmp4_2_+
-0.168199957*AcceptedCmp5_1_+
0.168199957*AcceptedCmp5_2_+
0.0084751371*Complain_1_+
-0.008475137*Complain_2_+
-0.037999266*Education_1_+
-0.057927214*Education_2_+
0.016446321*Education_3_+
0.0194631785*Education_4_+
0.0146872875*Education_5_+
-0.06373974*HigherEducationBinary_1_+
0.0637397402*HigherEducationBinary_2_+
-0.003892483*Marital_Status_1_+
-0.004073615*Marital_Status_2_+
-0.001997255*Marital_Status_3_+
0.002693753*Marital_Status_4_+
0.0166902215*Marital_Status_5_+
0.1763649228*_D1+
0.047005492*_D2+
0.2648052267*_D3+
0.2627398378*_D4+
-0.183242614*_D5+
0.2837958803*_D6+
0.1852424385*_D7+
0.1884763077*_D8+
0.1587304006*_D9+
0.2426710433*_D10+
0.1867323296*_D11+
0.2531374829*_D12+
0.0321367876*_D13+
0.2527845127*_D14+
-0.04504185*_D15+
0.2563407967*_D16+
0.2200042287*_D17+
0.1832313782*_D18+
-0.171105697*_D19+
0.1179142052*_D20+
0.253168363*_D21+
0.0000910107*_D22+
-0.044011761*_D23;
/****************************************/
* Principal Component 10;
/****************************************/
;
label PC_10 = "Principal Component 10";
PC_10 =
-0.427405125*AcceptedCmp1_1_+
0.4274051246*AcceptedCmp1_2_+
-0.05603994*AcceptedCmp2_1_+
0.05603994*AcceptedCmp2_2_+
0.197014885*AcceptedCmp3_1_+
-0.197014885*AcceptedCmp3_2_+
0.3255700763*AcceptedCmp4_1_+
-0.325570076*AcceptedCmp4_2_+
-0.022452495*AcceptedCmp5_1_+
0.0224524954*AcceptedCmp5_2_+
0.0303582465*Complain_1_+
-0.030358247*Complain_2_+
0.0445434627*Education_1_+
-0.070271036*Education_2_+
0.0456085635*Education_3_+
-0.04900841*Education_4_+
-0.01464821*Education_5_+
0.002957791*HigherEducationBinary_1_+
-0.002957791*HigherEducationBinary_2_+
0.1537687275*Marital_Status_1_+
-0.006469597*Marital_Status_2_+
-0.210533331*Marital_Status_3_+
0.0925304599*Marital_Status_4_+
0.0260556419*Marital_Status_5_+
-0.027284968*_D1+
0.1489981895*_D2+
0.0266210076*_D3+
0.006169269*_D4+
0.0245591241*_D5+
-0.03768998*_D6+
0.0212035811*_D7+
-0.005893765*_D8+
-0.00187567*_D9+
-0.047882857*_D10+
0.0305714864*_D11+
-0.042173454*_D12+
0.0662539732*_D13+
-0.016443865*_D14+
0.1223748058*_D15+
0.0194589253*_D16+
0.0310384659*_D17+
0.0516990557*_D18+
0.0298928217*_D19+
-0.267664048*_D20+
-0.065830475*_D21+
0.2989577923*_D22+
0.160938713*_D23;
/****************************************/
* Principal Component 11;
/****************************************/
;
label PC_11 = "Principal Component 11";
PC_11 =
-0.006979579*AcceptedCmp1_1_+
0.006979579*AcceptedCmp1_2_+
-0.142098513*AcceptedCmp2_1_+
0.1420985128*AcceptedCmp2_2_+
0.1324255781*AcceptedCmp3_1_+
-0.132425578*AcceptedCmp3_2_+
0.1694535909*AcceptedCmp4_1_+
-0.169453591*AcceptedCmp4_2_+
-0.06424056*AcceptedCmp5_1_+
0.0642405595*AcceptedCmp5_2_+
0.0024270532*Complain_1_+
-0.002427053*Complain_2_+
-0.199421217*Education_1_+
0.2395171129*Education_2_+
-0.272518092*Education_3_+
0.1430095037*Education_4_+
0.2472929643*Education_5_+
-0.052237281*HigherEducationBinary_1_+
0.0522372814*HigherEducationBinary_2_+
-0.307161441*Marital_Status_1_+
0.2933660352*Marital_Status_2_+
-0.05695041*Marital_Status_3_+
0.0002283982*Marital_Status_4_+
-0.166546194*Marital_Status_5_+
-0.067236457*_D1+
-0.258338248*_D2+
0.0236986403*_D3+
-0.088533198*_D4+
0.1699405213*_D5+
0.0534196964*_D6+
0.0042869859*_D7+
-0.022412283*_D8+
-0.066213947*_D9+
0.0564637091*_D10+
-0.002893859*_D11+
0.0709870565*_D12+
0.3370762777*_D13+
0.0014236307*_D14+
0.1088432514*_D15+
0.0528731763*_D16+
-0.022622223*_D17+
0.0915796929*_D18+
0.1919532583*_D19+
0.1326569892*_D20+
0.0521615406*_D21+
-0.080093252*_D22+
-0.252220945*_D23;
/****************************************/
* Principal Component 12;
/****************************************/
;
label PC_12 = "Principal Component 12";
PC_12 =
0.0510983941*AcceptedCmp1_1_+
-0.051098394*AcceptedCmp1_2_+
0.1440358208*AcceptedCmp2_1_+
-0.144035821*AcceptedCmp2_2_+
-0.026967488*AcceptedCmp3_1_+
0.0269674882*AcceptedCmp3_2_+
-0.05844178*AcceptedCmp4_1_+
0.0584417802*AcceptedCmp4_2_+
-0.120170958*AcceptedCmp5_1_+
0.1201709578*AcceptedCmp5_2_+
0.0127802615*Complain_1_+
-0.012780261*Complain_2_+
0.0252264337*Education_1_+
0.0048779687*Education_2_+
0.1160280061*Education_3_+
-0.053756875*Education_4_+
-0.11369683*Education_5_+
0.0248763777*HigherEducationBinary_1_+
-0.024876378*HigherEducationBinary_2_+
-0.135071391*Marital_Status_1_+
0.0211509238*Marital_Status_2_+
-0.606770537*Marital_Status_3_+
0.6282168799*Marital_Status_4_+
0.0827080307*Marital_Status_5_+
0.0388474024*_D1+
0.1056441849*_D2+
-0.027658745*_D3+
-0.029216993*_D4+
0.0126583025*_D5+
-0.008250951*_D6+
0.009144311*_D7+
0.0035401319*_D8+
0.0017710737*_D9+
-0.00222193*_D10+
-0.006885872*_D11+
-0.014475729*_D12+
0.1004540722*_D13+
-0.035011037*_D14+
0.001064966*_D15+
-0.009002123*_D16+
-0.048102218*_D17+
0.0212811527*_D18+
0.0707937357*_D19+
0.1546177343*_D20+
-0.009832758*_D21+
-0.195436846*_D22+
-0.00073807*_D23;
/****************************************/
* Principal Component 13;
/****************************************/
;
label PC_13 = "Principal Component 13";
PC_13 =
0.1170587511*AcceptedCmp1_1_+
-0.117058751*AcceptedCmp1_2_+
0.0756920265*AcceptedCmp2_1_+
-0.075692026*AcceptedCmp2_2_+
-0.057162015*AcceptedCmp3_1_+
0.0571620153*AcceptedCmp3_2_+
-0.147544018*AcceptedCmp4_1_+
0.1475440181*AcceptedCmp4_2_+
-0.008504145*AcceptedCmp5_1_+
0.008504145*AcceptedCmp5_2_+
0.0072128947*Complain_1_+
-0.007212895*Complain_2_+
-0.06764212*Education_1_+
0.074275719*Education_2_+
-0.112468032*Education_3_+
0.4575895049*Education_4_+
-0.248495892*Education_5_+
-0.021336503*HigherEducationBinary_1_+
0.0213365027*HigherEducationBinary_2_+
-0.12236042*Marital_Status_1_+
0.0380914168*Marital_Status_2_+
-0.068142902*Marital_Status_3_+
0.1584860374*Marital_Status_4_+
-0.122478306*Marital_Status_5_+
0.027028395*_D1+
-0.127575188*_D2+
0.0083699197*_D3+
-0.006627528*_D4+
-0.012784581*_D5+
0.0253973074*_D6+
0.0096110966*_D7+
0.0330878093*_D8+
0.044827626*_D9+
-0.002299471*_D10+
0.0353737597*_D11+
0.0302982209*_D12+
-0.019259953*_D13+
-0.003189986*_D14+
-0.019674581*_D15+
0.0199227385*_D16+
-0.009755192*_D17+
0.0384594406*_D18+
0.0203649451*_D19+
-0.458160512*_D20+
0.0442808533*_D21+
0.5571965617*_D22+
-0.077746986*_D23;
/****************************************/
* Principal Component 14;
/****************************************/
;
label PC_14 = "Principal Component 14";
PC_14 =
0.0427793451*AcceptedCmp1_1_+
-0.042779345*AcceptedCmp1_2_+
-0.025195913*AcceptedCmp2_1_+
0.0251959125*AcceptedCmp2_2_+
0.0472864417*AcceptedCmp3_1_+
-0.047286442*AcceptedCmp3_2_+
0.1382380078*AcceptedCmp4_1_+
-0.138238008*AcceptedCmp4_2_+
-0.242705201*AcceptedCmp5_1_+
0.2427052009*AcceptedCmp5_2_+
0.0141453844*Complain_1_+
-0.014145384*Complain_2_+
0.0479007263*Education_1_+
-0.060284247*Education_2_+
0.0024470985*Education_3_+
0.4916898557*Education_4_+
-0.444228276*Education_5_+
0.011117834*HigherEducationBinary_1_+
-0.011117834*HigherEducationBinary_2_+
-0.129239897*Marital_Status_1_+
0.0570991392*Marital_Status_2_+
0.1061362225*Marital_Status_3_+
-0.234332673*Marital_Status_4_+
0.3874390032*Marital_Status_5_+
0.0137161158*_D1+
0.1856654641*_D2+
-0.020428407*_D3+
0.0025205051*_D4+
0.022414974*_D5+
-0.032697559*_D6+
0.000882873*_D7+
0.0005761552*_D8+
0.0471069921*_D9+
-0.058206109*_D10+
-0.008581885*_D11+
-0.027295007*_D12+
0.0575682301*_D13+
-0.054379654*_D14+
0.1039153225*_D15+
-0.01782754*_D16+
-0.019725719*_D17+
0.0262840699*_D18+
0.0569397009*_D19+
0.1197326765*_D20+
-0.033270377*_D21+
-0.22452336*_D22+
0.1483018153*_D23;
/****************************************/
* Principal Component 15;
/****************************************/
;
label PC_15 = "Principal Component 15";
PC_15 =
0.2399143606*AcceptedCmp1_1_+
-0.239914361*AcceptedCmp1_2_+
0.0755044565*AcceptedCmp2_1_+
-0.075504456*AcceptedCmp2_2_+
0.0342216783*AcceptedCmp3_1_+
-0.034221678*AcceptedCmp3_2_+
0.0514198658*AcceptedCmp4_1_+
-0.051419866*AcceptedCmp4_2_+
-0.34506065*AcceptedCmp5_1_+
0.3450606499*AcceptedCmp5_2_+
0.0336110358*Complain_1_+
-0.033611036*Complain_2_+
-0.042357425*Education_1_+
0.1127881546*Education_2_+
0.0948639466*Education_3_+
-0.435345925*Education_4_+
0.2505232852*Education_5_+
0.0210591147*HigherEducationBinary_1_+
-0.021059115*HigherEducationBinary_2_+
-0.124765714*Marital_Status_1_+
-0.035544189*Marital_Status_2_+
0.0817068063*Marital_Status_3_+
-0.099150731*Marital_Status_4_+
0.3701223424*Marital_Status_5_+
0.0029817466*_D1+
0.0937412623*_D2+
-0.026361924*_D3+
-0.010980871*_D4+
0.0457685815*_D5+
0.0213903582*_D6+
-0.009193349*_D7+
-0.004175095*_D8+
0.065007145*_D9+
0.0026068156*_D10+
0.0324813175*_D11+
0.0246219217*_D12+
0.1098476396*_D13+
-0.01013797*_D14+
0.0418801784*_D15+
-0.002304732*_D16+
-0.054717544*_D17+
0.006693925*_D18+
0.0584074001*_D19+
-0.203477223*_D20+
0.0331354242*_D21+
0.3120323941*_D22+
0.0060174876*_D23;
/****************************************/
* Principal Component 16;
/****************************************/
;
label PC_16 = "Principal Component 16";
PC_16 =
0.0834838979*AcceptedCmp1_1_+
-0.083483898*AcceptedCmp1_2_+
-0.007070836*AcceptedCmp2_1_+
0.0070708364*AcceptedCmp2_2_+
-0.018631101*AcceptedCmp3_1_+
0.0186311011*AcceptedCmp3_2_+
-0.032930624*AcceptedCmp4_1_+
0.0329306235*AcceptedCmp4_2_+
-0.015091007*AcceptedCmp5_1_+
0.0150910074*AcceptedCmp5_2_+
-0.013042862*Complain_1_+
0.0130428616*Complain_2_+
-0.149765771*Education_1_+
0.2142822502*Education_2_+
-0.039151876*Education_3_+
0.1047572323*Education_4_+
-0.02724959*Education_5_+
-0.021362835*HigherEducationBinary_1_+
0.0213628348*HigherEducationBinary_2_+
0.749406368*Marital_Status_1_+
-0.046204554*Marital_Status_2_+
-0.29029384*Marital_Status_3_+
-0.220227415*Marital_Status_4_+
0.0589609613*Marital_Status_5_+
-0.00373066*_D1+
0.0671154071*_D2+
-0.094244957*_D3+
-0.08982157*_D4+
0.0603990094*_D5+
0.0743459871*_D6+
0.0869978233*_D7+
0.0916062781*_D8+
0.0405168338*_D9+
0.0594666418*_D10+
0.0776542452*_D11+
0.0549824531*_D12+
0.2346371833*_D13+
-0.01473194*_D14+
-0.0324428*_D15+
-0.047624235*_D16+
-0.139943925*_D17+
-0.068224369*_D18+
0.1334753126*_D19+
0.0216830987*_D20+
0.12981185*_D21+
-0.011839012*_D22+
-0.144422757*_D23;
/****************************************/
* Principal Component 17;
/****************************************/
;
label PC_17 = "Principal Component 17";
PC_17 =
-0.18419605*AcceptedCmp1_1_+
0.1841960497*AcceptedCmp1_2_+
-0.006319142*AcceptedCmp2_1_+
0.0063191417*AcceptedCmp2_2_+
-0.066511965*AcceptedCmp3_1_+
0.0665119654*AcceptedCmp3_2_+
-0.078201497*AcceptedCmp4_1_+
0.0782014973*AcceptedCmp4_2_+
0.282609837*AcceptedCmp5_1_+
-0.282609837*AcceptedCmp5_2_+
-0.017270155*Complain_1_+
0.0172701551*Complain_2_+
-0.262654836*Education_1_+
0.4686807068*Education_2_+
0.0091174655*Education_3_+
-0.017236405*Education_4_+
-0.004652288*Education_5_+
0.0107698965*HigherEducationBinary_1_+
-0.010769896*HigherEducationBinary_2_+
-0.283352437*Marital_Status_1_+
0.0174824931*Marital_Status_2_+
0.033325561*Marital_Status_3_+
-0.013402153*Marital_Status_4_+
0.4008095409*Marital_Status_5_+
0.0133620243*_D1+
0.26371501*_D2+
-0.071945687*_D3+
-0.066235651*_D4+
-0.238956104*_D5+
0.0212305962*_D6+
0.04085142*_D7+
0.0591719814*_D8+
0.0321456244*_D9+
0.003132591*_D10+
0.0235623692*_D11+
0.0149377279*_D12+
0.1248824093*_D13+
0.0033662871*_D14+
-0.168149093*_D15+
-0.064989937*_D16+
-0.066355249*_D17+
-0.117992568*_D18+
-0.015492042*_D19+
-0.047117333*_D20+
0.0761448362*_D21+
-0.003531727*_D22+
0.0174859284*_D23;
/****************************************/
* Principal Component 2;
/****************************************/
;
label PC_2 = "Principal Component 2";
PC_2 =
0.2613886242*AcceptedCmp1_1_+
-0.261388624*AcceptedCmp1_2_+
0.2628562796*AcceptedCmp2_1_+
-0.26285628*AcceptedCmp2_2_+
0.1743125047*AcceptedCmp3_1_+
-0.174312505*AcceptedCmp3_2_+
0.2314725288*AcceptedCmp4_1_+
-0.231472529*AcceptedCmp4_2_+
0.2494300963*AcceptedCmp5_1_+
-0.249430096*AcceptedCmp5_2_+
-0.015119316*Complain_1_+
0.0151193162*Complain_2_+
-0.164633314*Education_1_+
-0.108458008*Education_2_+
0.1007130822*Education_3_+
0.0457874332*Education_4_+
0.0016846578*Education_5_+
-0.202142117*HigherEducationBinary_1_+
0.2021421172*HigherEducationBinary_2_+
-0.009053999*Marital_Status_1_+
-0.018869276*Marital_Status_2_+
0.0041095818*Marital_Status_3_+
0.0246937585*Marital_Status_4_+
-0.00084983*Marital_Status_5_+
-0.403420704*_D1+
0.0939608106*_D2+
0.0977042689*_D3+
0.0840266307*_D4+
-0.091491884*_D5+
0.0578515824*_D6+
0.1204590525*_D7+
0.111858786*_D8+
0.0349231898*_D9+
0.0711675986*_D10+
0.097192991*_D11+
0.0095228109*_D12+
0.0531587627*_D13+
0.0500820367*_D14+
0.0549877617*_D15+
0.0756409737*_D16+
0.1079477298*_D17+
0.0800611213*_D18+
-0.090425249*_D19+
0.0265717169*_D20+
0.057044291*_D21+
-0.008658985*_D22+
0.1065428796*_D23;
/****************************************/
* Principal Component 3;
/****************************************/
;
label PC_3 = "Principal Component 3";
PC_3 =
0.0212271142*AcceptedCmp1_1_+
-0.021227114*AcceptedCmp1_2_+
0.153599634*AcceptedCmp2_1_+
-0.153599634*AcceptedCmp2_2_+
0.0505251773*AcceptedCmp3_1_+
-0.050525177*AcceptedCmp3_2_+
0.1494643377*AcceptedCmp4_1_+
-0.149464338*AcceptedCmp4_2_+
0.0395989803*AcceptedCmp5_1_+
-0.03959898*AcceptedCmp5_2_+
-0.052943369*Complain_1_+
0.0529433691*Complain_2_+
0.4092828582*Education_1_+
0.2108872025*Education_2_+
-0.168701804*Education_3_+
-0.051420336*Education_4_+
-0.133362761*Education_5_+
0.4720236642*HigherEducationBinary_1_+
-0.472023664*HigherEducationBinary_2_+
-0.014220546*Marital_Status_1_+
-0.029446373*Marital_Status_2_+
0.0497623576*Marital_Status_3_+
0.002883951*Marital_Status_4_+
-0.017288775*Marital_Status_5_+
-0.127807371*_D1+
-0.135193036*_D2+
0.0177247579*_D3+
-0.010030905*_D4+
-0.036588103*_D5+
0.0483254653*_D6+
0.1541583069*_D7+
0.1513319655*_D8+
0.0909139318*_D9+
0.0954242121*_D10+
0.1610347118*_D11+
-0.048131585*_D12+
0.0318082459*_D13+
0.0534590723*_D14+
-0.090266552*_D15+
0.0127910419*_D16+
0.0208993223*_D17+
-0.034175113*_D18+
-0.084214957*_D19+
0.0169930607*_D20+
0.0505196626*_D21+
-0.015984872*_D22+
-0.167580885*_D23;
/****************************************/
* Principal Component 4;
/****************************************/
;
label PC_4 = "Principal Component 4";
PC_4 =
0.0899951512*AcceptedCmp1_1_+
-0.089995151*AcceptedCmp1_2_+
-0.087515976*AcceptedCmp2_1_+
0.0875159757*AcceptedCmp2_2_+
-0.319377688*AcceptedCmp3_1_+
0.3193776875*AcceptedCmp3_2_+
0.0293953862*AcceptedCmp4_1_+
-0.029395386*AcceptedCmp4_2_+
0.1835827393*AcceptedCmp5_1_+
-0.183582739*AcceptedCmp5_2_+
-0.082222853*Complain_1_+
0.0822228534*Complain_2_+
0.1231048331*Education_1_+
0.0074498302*Education_2_+
-0.07242522*Education_3_+
-0.049606214*Education_4_+
0.0398061626*Education_5_+
0.112902993*HigherEducationBinary_1_+
-0.112902993*HigherEducationBinary_2_+
0.0269708032*Marital_Status_1_+
-0.023381856*Marital_Status_2_+
-0.009266276*Marital_Status_3_+
0.0093017893*Marital_Status_4_+
0.0190650789*Marital_Status_5_+
0.0269356793*_D1+
0.1104557936*_D2+
0.1599098532*_D3+
-0.026224006*_D4+
0.0321922977*_D5+
0.0104625914*_D6+
-0.051432281*_D7+
-0.063520095*_D8+
0.2108335033*_D9+
-0.108658268*_D10+
-0.064804174*_D11+
0.0783716386*_D12+
0.2238661532*_D13+
0.0262875433*_D14+
0.4196312593*_D15+
0.1958348644*_D16+
0.0748471107*_D17+
0.3169116481*_D18+
0.267093872*_D19+
-0.019106049*_D20+
-0.018310744*_D21+
0.0352925607*_D22+
0.2680315293*_D23;
/****************************************/
* Principal Component 5;
/****************************************/
;
label PC_5 = "Principal Component 5";
PC_5 =
0.067461935*AcceptedCmp1_1_+
-0.067461935*AcceptedCmp1_2_+
-0.080568341*AcceptedCmp2_1_+
0.0805683412*AcceptedCmp2_2_+
0.4549342047*AcceptedCmp3_1_+
-0.454934205*AcceptedCmp3_2_+
-0.353138267*AcceptedCmp4_1_+
0.3531382665*AcceptedCmp4_2_+
0.0526482624*AcceptedCmp5_1_+
-0.052648262*AcceptedCmp5_2_+
-0.013374595*Complain_1_+
0.0133745945*Complain_2_+
0.1299150848*Education_1_+
0.0250850869*Education_2_+
-0.208623845*Education_3_+
0.0418588264*Education_4_+
0.1122950362*Education_5_+
0.1280934852*HigherEducationBinary_1_+
-0.128093485*HigherEducationBinary_2_+
0.05516929*Marital_Status_1_+
0.0096680294*Marital_Status_2_+
-0.070236754*Marital_Status_3_+
-0.017396204*Marital_Status_4_+
0.0873224884*Marital_Status_5_+
-0.084969407*_D1+
0.1549441906*_D2+
0.0784627952*_D3+
0.0443023767*_D4+
-0.091470284*_D5+
-0.004512434*_D6+
-0.082690624*_D7+
-0.087477168*_D8+
-0.127496336*_D9+
-0.077672487*_D10+
-0.065708636*_D11+
0.0906011536*_D12+
0.0473722609*_D13+
-0.043358609*_D14+
0.1165236979*_D15+
0.0357040148*_D16+
0.1220858057*_D17+
0.1088445144*_D18+
0.0311986703*_D19+
-0.003885681*_D20+
-0.02239343*_D21+
0.0017877658*_D22+
0.2005060046*_D23;
/****************************************/
* Principal Component 6;
/****************************************/
;
label PC_6 = "Principal Component 6";
PC_6 =
0.0015007806*AcceptedCmp1_1_+
-0.001500781*AcceptedCmp1_2_+
0.0161080253*AcceptedCmp2_1_+
-0.016108025*AcceptedCmp2_2_+
0.0089459394*AcceptedCmp3_1_+
-0.008945939*AcceptedCmp3_2_+
-0.034709546*AcceptedCmp4_1_+
0.0347095458*AcceptedCmp4_2_+
0.0584974192*AcceptedCmp5_1_+
-0.058497419*AcceptedCmp5_2_+
0.6792118922*Complain_1_+
-0.679211892*Complain_2_+
0.003024713*Education_1_+
0.0786762032*Education_2_+
0.0800062793*Education_3_+
-0.045514376*Education_4_+
-0.092394861*Education_5_+
0.043538486*HigherEducationBinary_1_+
-0.043538486*HigherEducationBinary_2_+
0.0121256581*Marital_Status_1_+
-0.024074875*Marital_Status_2_+
0.0583749095*Marital_Status_3_+
-0.0137083*Marital_Status_4_+
-0.058713458*Marital_Status_5_+
-0.017259408*_D1+
-0.066616218*_D2+
0.0193504447*_D3+
-0.037049851*_D4+
-0.004361989*_D5+
0.0113678078*_D6+
-0.003377852*_D7+
0.01981011*_D8+
0.0687643899*_D9+
-0.004894427*_D10+
0.0239918768*_D11+
0.0083701512*_D12+
0.0404398679*_D13+
-0.004355667*_D14+
0.0625039053*_D15+
0.029780885*_D16+
0.0004580175*_D17+
0.0570521242*_D18+
0.0877593412*_D19+
0.0204898643*_D20+
0.0077986301*_D21+
-0.038072651*_D22+
0.0294678247*_D23;
/****************************************/
* Principal Component 7;
/****************************************/
;
label PC_7 = "Principal Component 7";
PC_7 =
-0.016546856*AcceptedCmp1_1_+
0.0165468556*AcceptedCmp1_2_+
-0.121328463*AcceptedCmp2_1_+
0.1213284625*AcceptedCmp2_2_+
0.1644244536*AcceptedCmp3_1_+
-0.164424454*AcceptedCmp3_2_+
-0.139496571*AcceptedCmp4_1_+
0.1394965712*AcceptedCmp4_2_+
0.051891786*AcceptedCmp5_1_+
-0.051891786*AcceptedCmp5_2_+
-0.136206696*Complain_1_+
0.1362066964*Complain_2_+
-0.042531028*Education_1_+
0.0457203368*Education_2_+
0.5627256708*Education_3_+
-0.262548066*Education_4_+
-0.440552803*Education_5_+
-0.013925473*HigherEducationBinary_1_+
0.0139254728*HigherEducationBinary_2_+
-0.077147663*Marital_Status_1_+
0.0944169008*Marital_Status_2_+
0.0718498212*Marital_Status_3_+
-0.080060564*Marital_Status_4_+
-0.110537782*Marital_Status_5_+
-0.008668293*_D1+
-0.238107386*_D2+
0.0060905418*_D3+
-0.087921721*_D4+
0.0785793656*_D5+
-0.008259408*_D6+
0.1092958617*_D7+
0.0971134051*_D8+
0.1228232901*_D9+
-0.022945512*_D10+
0.1387734551*_D11+
-0.062417085*_D12+
0.1740911031*_D13+
-0.035743285*_D14+
0.1036155497*_D15+
0.0146210225*_D16+
-0.007273618*_D17+
0.0636490794*_D18+
0.1709993965*_D19+
-0.014749221*_D20+
-0.016995245*_D21+
0.0111169108*_D22+
-0.06690288*_D23;
/****************************************/
* Principal Component 8;
/****************************************/
;
label PC_8 = "Principal Component 8";
PC_8 =
-0.236038886*AcceptedCmp1_1_+
0.2360388855*AcceptedCmp1_2_+
0.5413569965*AcceptedCmp2_1_+
-0.541356997*AcceptedCmp2_2_+
-0.022281993*AcceptedCmp3_1_+
0.022281993*AcceptedCmp3_2_+
-0.156895227*AcceptedCmp4_1_+
0.1568952269*AcceptedCmp4_2_+
-0.036674183*AcceptedCmp5_1_+
0.0366741832*AcceptedCmp5_2_+
-0.033407941*Complain_1_+
0.0334079409*Complain_2_+
-0.006577677*Education_1_+
-0.028246584*Education_2_+
-0.009073983*Education_3_+
-0.018081667*Education_4_+
0.0435426715*Education_5_+
-0.02049536*HigherEducationBinary_1_+
0.0204953604*HigherEducationBinary_2_+
-0.023167383*Marital_Status_1_+
0.2641824576*Marital_Status_2_+
0.0148286381*Marital_Status_3_+
-0.284431386*Marital_Status_4_+
-0.050372874*Marital_Status_5_+
0.0822697206*_D1+
-0.043860417*_D2+
0.0062563739*_D3+
-0.018995932*_D4+
0.1169497869*_D5+
0.0086787703*_D6+
-0.073425523*_D7+
-0.073907183*_D8+
-0.025792094*_D9+
-0.007389751*_D10+
-0.034784085*_D11+
0.0477007824*_D12+
0.0684533109*_D13+
-0.006509806*_D14+
0.1311769649*_D15+
0.0404331021*_D16+
-0.043396408*_D17+
0.078091159*_D18+
0.1298919043*_D19+
0.0300428813*_D20+
-0.004989289*_D21+
-0.034391963*_D22+
0.0296234156*_D23;
/****************************************/
* Principal Component 9;
/****************************************/
;
label PC_9 = "Principal Component 9";
PC_9 =
-0.105227871*AcceptedCmp1_1_+
0.1052278706*AcceptedCmp1_2_+
0.1228024124*AcceptedCmp2_1_+
-0.122802412*AcceptedCmp2_2_+
0.0779002441*AcceptedCmp3_1_+
-0.077900244*AcceptedCmp3_2_+
-0.019087459*AcceptedCmp4_1_+
0.0190874591*AcceptedCmp4_2_+
-0.059052463*AcceptedCmp5_1_+
0.0590524625*AcceptedCmp5_2_+
-0.049532357*Complain_1_+
0.0495323569*Complain_2_+
-0.091105493*Education_1_+
0.0744692534*Education_2_+
-0.032525784*Education_3_+
0.0955552424*Education_4_+
-0.010429701*Education_5_+
-0.042017515*HigherEducationBinary_1_+
0.042017515*HigherEducationBinary_2_+
0.07256373*Marital_Status_1_+
-0.688278764*Marital_Status_2_+
0.4209449678*Marital_Status_3_+
0.3296577469*Marital_Status_4_+
0.0214925002*Marital_Status_5_+
0.0180561423*_D1+
-0.100399461*_D2+
-0.000302705*_D3+
-0.064212723*_D4+
0.0899295777*_D5+
0.0279134351*_D6+
-0.054527229*_D7+
-0.032806531*_D8+
-0.033802415*_D9+
0.0072871183*_D10+
-0.063399602*_D11+
0.0692641251*_D12+
0.224426532*_D13+
-0.00149769*_D14+
0.059412725*_D15+
0.0265407964*_D16+
-0.038183303*_D17+
0.0483165767*_D18+
0.1490446885*_D19+
0.0443701528*_D20+
0.0135735853*_D21+
-0.065620368*_D22+
-0.073623735*_D23;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.50754467864853 * S_PC_1  +     -0.0096262574398 * S_PC_10
          +     0.14323564519461 * S_PC_11  +     0.41688732719144 * S_PC_12
          +    -0.23105960395492 * S_PC_13  +    -0.13983457141569 * S_PC_14
          +    -0.09058252871003 * S_PC_15  +     0.13317372705745 * S_PC_16
          +    -0.06281696709893 * S_PC_17  +     0.13346779435623 * S_PC_2
          +     0.19827524013856 * S_PC_3  +    -0.49078002762886 * S_PC_4
          +     0.28666139703857 * S_PC_5  +    -0.10378052990351 * S_PC_6
          +     -0.1968548602707 * S_PC_7  +    -0.45560761696887 * S_PC_8
          +     -0.8114558504722 * S_PC_9  +    -0.09343131455845 *
        S_Year_Birth ;
   H12  =    -0.81573558098063 * S_PC_1  +     0.24773437846044 * S_PC_10
          +     0.13533997706716 * S_PC_11  +     0.75544268766517 * S_PC_12
          +     0.17183445519664 * S_PC_13  +      0.1777896181105 * S_PC_14
          +     0.05706870679047 * S_PC_15  +    -0.46807694963409 * S_PC_16
          +    -0.25190451727153 * S_PC_17  +    -0.08258276412231 * S_PC_2
          +    -0.36441875817422 * S_PC_3  +    -0.39012839645629 * S_PC_4
          +     0.04722996979342 * S_PC_5  +     0.43416394096325 * S_PC_6
          +     0.19725231550558 * S_PC_7  +     0.21295253069805 * S_PC_8
          +    -0.60545100325243 * S_PC_9  +    -0.15355095095987 *
        S_Year_Birth ;
   H13  =    -0.93981943955208 * S_PC_1  +    -0.11850321613711 * S_PC_10
          +    -0.74225741575618 * S_PC_11  +    -0.81034258744012 * S_PC_12
          +     0.21537464928397 * S_PC_13  +    -0.26677965640501 * S_PC_14
          +     0.30177037009096 * S_PC_15  +    -0.26947681668456 * S_PC_16
          +     0.23123019737325 * S_PC_17  +     0.15751211794885 * S_PC_2
          +     0.33175469761366 * S_PC_3  +     0.39514352786101 * S_PC_4
          +      0.7139227368597 * S_PC_5  +      0.0167014877178 * S_PC_6
          +    -0.07449310891132 * S_PC_7  +    -0.05509910154765 * S_PC_8
          +     0.16873655257606 * S_PC_9  +     0.00245043420593 *
        S_Year_Birth ;
   H14  =    -0.12693194472066 * S_PC_1  +     0.60796576749185 * S_PC_10
          +    -0.34420896979597 * S_PC_11  +    -0.23537095833674 * S_PC_12
          +     0.89540868522943 * S_PC_13  +      -0.510842523862 * S_PC_14
          +     0.48567760328151 * S_PC_15  +     0.37897489203761 * S_PC_16
          +     0.05946905584596 * S_PC_17  +     0.14804032191862 * S_PC_2
          +     0.03156879517121 * S_PC_3  +     0.20866387553468 * S_PC_4
          +    -0.11678944684508 * S_PC_5  +    -0.28222346677273 * S_PC_6
          +    -0.07076603764251 * S_PC_7  +    -0.08885981193922 * S_PC_8
          +    -0.17344366575651 * S_PC_9  +    -0.10422043273594 *
        S_Year_Birth ;
   H15  =    -0.18818846792217 * S_PC_1  +     0.15980122155848 * S_PC_10
          +    -0.29415615035488 * S_PC_11  +     0.22673434231766 * S_PC_12
          +     -0.4367544144709 * S_PC_13  +    -0.27215638165388 * S_PC_14
          +     0.21516860661944 * S_PC_15  +    -0.33073452493248 * S_PC_16
          +    -0.12566064186043 * S_PC_17  +    -0.66303106656578 * S_PC_2
          +     0.15398704463012 * S_PC_3  +     0.45620897750328 * S_PC_4
          +     0.21146328236808 * S_PC_5  +     0.09789059959814 * S_PC_6
          +    -0.12207231873189 * S_PC_7  +    -0.02692016155566 * S_PC_8
          +     0.00827837096636 * S_PC_9  +     0.24843752055347 *
        S_Year_Birth ;
   H16  =     0.17834519341997 * S_PC_1  +    -0.32824376267138 * S_PC_10
          +     0.02772071370421 * S_PC_11  +      0.3134819415225 * S_PC_12
          +    -0.34724682137837 * S_PC_13  +     0.19598007494228 * S_PC_14
          +     0.31968916312556 * S_PC_15  +    -0.03617557970689 * S_PC_16
          +    -0.32507715963836 * S_PC_17  +    -0.05923539655778 * S_PC_2
          +     0.36180293380006 * S_PC_3  +    -0.00711502811187 * S_PC_4
          +     -0.4202174009875 * S_PC_5  +    -0.20731677826254 * S_PC_6
          +     -0.0412241308518 * S_PC_7  +     0.64326432309663 * S_PC_8
          +     0.42325597812682 * S_PC_9  +     0.06066746722872 *
        S_Year_Birth ;
   H17  =     0.06122966741514 * S_PC_1  +     0.32630558798132 * S_PC_10
          +     0.08830070784719 * S_PC_11  +    -0.09169481140616 * S_PC_12
          +      0.3549320678826 * S_PC_13  +    -0.21931123167669 * S_PC_14
          +    -0.18036776149727 * S_PC_15  +    -0.49613822738605 * S_PC_16
          +     0.04573861907833 * S_PC_17  +     0.52087249472311 * S_PC_2
          +     0.37349952917867 * S_PC_3  +    -0.00417038828693 * S_PC_4
          +     0.31654515840261 * S_PC_5  +    -0.14807890224435 * S_PC_6
          +    -0.27409057895757 * S_PC_7  +    -0.29271037818625 * S_PC_8
          +     0.14973034409075 * S_PC_9  +     0.30703675352745 *
        S_Year_Birth ;
   H11  =    -0.90910910494332 + H11 ;
   H12  =     1.11114331269115 + H12 ;
   H13  =    -0.39557973491761 + H13 ;
   H14  =     0.11097638588139 + H14 ;
   H15  =    -1.45152011393762 + H15 ;
   H16  =     0.80027129172396 + H16 ;
   H17  =     0.54203925713353 + H17 ;
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
   P_DepVar1  =    -1.36227730329636 * H11  +    -1.56591009171383 * H12
          +    -1.51595469939043 * H13  +    -2.11517380958242 * H14
          +     1.49134383210948 * H15  +     0.83564080974417 * H16
          +    -1.81961134224285 * H17 ;
   P_DepVar1  =    -2.25483055601613 + P_DepVar1 ;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =      0.4640556659307 * S_PC_1  +    -0.33462522014566 * S_PC_10
          +     0.56806418894822 * S_PC_11  +     0.47755179162972 * S_PC_12
          +    -1.05081910003147 * S_PC_13  +     0.51924824879327 * S_PC_14
          +    -0.40498769195755 * S_PC_15  +     0.12870488597274 * S_PC_16
          +    -0.18386984954493 * S_PC_17  +     -0.2086299332252 * S_PC_2
          +    -0.50252958940538 * S_PC_3  +     0.15534767510019 * S_PC_4
          +    -0.06309817063591 * S_PC_5  +     0.11574559455719 * S_PC_6
          +     0.32449679316348 * S_PC_7  +     0.30800540848273 * S_PC_8
          +     0.27935517346427 * S_PC_9  +     0.37069240076102 *
        S_Year_Birth ;
   H12  =     0.39410399313223 * S_PC_1  +     0.24787065969983 * S_PC_10
          +     0.01252810266568 * S_PC_11  +      0.2112853368947 * S_PC_12
          +    -0.28943433543997 * S_PC_13  +       0.039416623543 * S_PC_14
          +     0.38042528163165 * S_PC_15  +     0.58727213716292 * S_PC_16
          +    -0.62894185015376 * S_PC_17  +    -0.45301915449406 * S_PC_2
          +     0.04877645916167 * S_PC_3  +    -0.26981835195451 * S_PC_4
          +    -0.13085816602216 * S_PC_5  +    -0.18793881101225 * S_PC_6
          +     0.18670477755191 * S_PC_7  +     0.10054352014255 * S_PC_8
          +     0.09310848306663 * S_PC_9  +    -0.06981710025305 *
        S_Year_Birth ;
   H13  =    -0.74618513684454 * S_PC_1  +    -0.09872426408083 * S_PC_10
          +    -0.23798160464408 * S_PC_11  +     0.04757319577054 * S_PC_12
          +    -0.37388357209966 * S_PC_13  +     0.84808088438719 * S_PC_14
          +    -0.05926306123652 * S_PC_15  +     0.18815097741352 * S_PC_16
          +     0.06905915680373 * S_PC_17  +    -1.08258627714779 * S_PC_2
          +    -0.40649973463746 * S_PC_3  +     0.42001548371963 * S_PC_4
          +     -0.1534389075544 * S_PC_5  +     0.18740639829009 * S_PC_6
          +    -0.04408545619191 * S_PC_7  +     0.36698801026128 * S_PC_8
          +    -0.07205131499531 * S_PC_9  +    -0.36825369917548 *
        S_Year_Birth ;
   H14  =     0.03862803097854 * S_PC_1  +     0.36123885865628 * S_PC_10
          +    -0.67560468649741 * S_PC_11  +    -0.69577537640908 * S_PC_12
          +     0.76281192398282 * S_PC_13  +     0.17769449989379 * S_PC_14
          +    -0.02693737417861 * S_PC_15  +    -0.10347641425241 * S_PC_16
          +     0.53814093155394 * S_PC_17  +     0.33997107384624 * S_PC_2
          +    -0.13802497891101 * S_PC_3  +     0.40245616650516 * S_PC_4
          +     0.48103095271792 * S_PC_5  +    -0.25102974356893 * S_PC_6
          +     0.33678040132276 * S_PC_7  +    -0.19457240527678 * S_PC_8
          +     -0.1781281379998 * S_PC_9  +    -0.01527450737168 *
        S_Year_Birth ;
   H15  =     0.88303191844461 * S_PC_1  +    -0.46238003710472 * S_PC_10
          +    -0.20085501521888 * S_PC_11  +    -0.70197238540328 * S_PC_12
          +    -0.14564265232718 * S_PC_13  +    -0.11158041083613 * S_PC_14
          +     0.02474516981163 * S_PC_15  +     0.03797715835251 * S_PC_16
          +     0.52678061960714 * S_PC_17  +    -0.48106600242342 * S_PC_2
          +      0.3976982347327 * S_PC_3  +     0.40547333642751 * S_PC_4
          +    -0.71062834957535 * S_PC_5  +    -0.15338067613858 * S_PC_6
          +    -0.49919762898936 * S_PC_7  +    -0.42650670881449 * S_PC_8
          +     0.48631507078449 * S_PC_9  +      0.0497794049348 *
        S_Year_Birth ;
   H16  =     0.70691086447732 * S_PC_1  +    -0.47946522460485 * S_PC_10
          +    -0.71026241368882 * S_PC_11  +    -0.29297239152668 * S_PC_12
          +     0.03684601929927 * S_PC_13  +    -0.19380463617056 * S_PC_14
          +     0.06034168116607 * S_PC_15  +     0.02617203331832 * S_PC_16
          +     0.08436353742259 * S_PC_17  +     0.25125330241669 * S_PC_2
          +     0.67024506325126 * S_PC_3  +     -0.4104513299531 * S_PC_4
          +     0.01439811017846 * S_PC_5  +      0.1353699477934 * S_PC_6
          +    -0.13772050569005 * S_PC_7  +     0.65217587480338 * S_PC_8
          +     0.59972905640062 * S_PC_9  +    -0.23864759601162 *
        S_Year_Birth ;
   H11  =    -0.96473164506576 + H11 ;
   H12  =     0.98279255842783 + H12 ;
   H13  =    -1.66611685085053 + H13 ;
   H14  =    -1.58832310532425 + H14 ;
   H15  =    -1.47322442289085 + H15 ;
   H16  =    -1.98186768764291 + H16 ;
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
   P_DepVar1  =     2.40220964164359 * H11  +     0.57143659221088 * H12
          +     1.33946010617365 * H13  +    -1.50955086610503 * H14
          +     1.52090527627884 * H15  +     1.78582940995754 * H16 ;
   P_DepVar1  =    -0.73688900091284 + P_DepVar1 ;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.64917498634892 * S_PC_1  +    -0.11542518686923 * S_PC_10
          +     0.24789006281492 * S_PC_11  +     0.29029859048219 * S_PC_12
          +    -0.55860346522398 * S_PC_13  +     0.54359630746099 * S_PC_14
          +    -0.19601034247455 * S_PC_15  +     0.10789324573687 * S_PC_16
          +    -0.23559438156009 * S_PC_17  +    -0.26112594215329 * S_PC_2
          +    -0.05861616774393 * S_PC_3  +     0.13176125146685 * S_PC_4
          +    -0.32389209403293 * S_PC_5  +     0.06668081446802 * S_PC_6
          +     0.10687794315293 * S_PC_7  +     0.36804397754071 * S_PC_8
          +      0.5318152129643 * S_PC_9  +     0.46123908390889 *
        S_Year_Birth ;
   H12  =    -0.01801213626812 * S_PC_1  +     -0.2043873131352 * S_PC_10
          +     0.22634530500659 * S_PC_11  +      0.3082120092065 * S_PC_12
          +    -0.24845701925273 * S_PC_13  +     0.10913661031841 * S_PC_14
          +     0.07872049610669 * S_PC_15  +    -0.01772186757041 * S_PC_16
          +     0.50309876372506 * S_PC_17  +      0.0334286731814 * S_PC_2
          +    -0.22577856013151 * S_PC_3  +    -0.14899658751542 * S_PC_4
          +    -0.20131940000977 * S_PC_5  +     0.30905670035888 * S_PC_6
          +     0.27760266803506 * S_PC_7  +     0.49508176088642 * S_PC_8
          +     0.02416700614161 * S_PC_9  +     0.01961564164037 *
        S_Year_Birth ;
   H13  =    -0.32462544631852 * S_PC_1  +     0.60993570444644 * S_PC_10
          +     -0.3652943408382 * S_PC_11  +     -0.3514775281027 * S_PC_12
          +     0.91822527281221 * S_PC_13  +    -0.32876201496528 * S_PC_14
          +     0.45513294250288 * S_PC_15  +    -0.18540211347927 * S_PC_16
          +     0.29366041990964 * S_PC_17  +     0.33764635211366 * S_PC_2
          +    -0.09097395445066 * S_PC_3  +     0.13719908951988 * S_PC_4
          +     0.22703460715896 * S_PC_5  +      -0.170019235519 * S_PC_6
          +     0.21135981208747 * S_PC_7  +     0.03503879697227 * S_PC_8
          +     0.12751213936223 * S_PC_9  +     0.14125995298539 *
        S_Year_Birth ;
   H14  =    -0.88644905388941 * S_PC_1  +     0.11946463876825 * S_PC_10
          +     0.20700553386505 * S_PC_11  +     0.24426124990122 * S_PC_12
          +    -0.29204136607957 * S_PC_13  +     0.29253451421205 * S_PC_14
          +     0.09583889495069 * S_PC_15  +     0.08393526308586 * S_PC_16
          +     -0.1382524970935 * S_PC_17  +    -0.77151881971786 * S_PC_2
          +    -0.63302889267132 * S_PC_3  +     0.98515158315972 * S_PC_4
          +    -0.26847098635021 * S_PC_5  +    -0.37537538399943 * S_PC_6
          +     0.28730733138223 * S_PC_7  +     0.60783744480259 * S_PC_8
          +     0.26786199050734 * S_PC_9  +    -0.12348475922953 *
        S_Year_Birth ;
   H15  =     1.04025741702379 * S_PC_1  +    -0.37094641060303 * S_PC_10
          +    -0.28614666270019 * S_PC_11  +    -0.42824232140855 * S_PC_12
          +     -0.3133983107983 * S_PC_13  +    -0.11984699072712 * S_PC_14
          +     0.03677712851734 * S_PC_15  +      0.0269831970411 * S_PC_16
          +     0.24557112569993 * S_PC_17  +    -0.18797666621001 * S_PC_2
          +     0.29958293056896 * S_PC_3  +    -0.22470684397488 * S_PC_4
          +     0.04580208795813 * S_PC_5  +     0.19624354198997 * S_PC_6
          +    -0.01223221841943 * S_PC_7  +    -0.12295109489073 * S_PC_8
          +     0.39210110562341 * S_PC_9  +    -0.04264256894107 *
        S_Year_Birth ;
   H11  =    -0.58201165596022 + H11 ;
   H12  =    -1.05981403552709 + H12 ;
   H13  =    -0.58494097725461 + H13 ;
   H14  =    -0.98625097571698 + H14 ;
   H15  =    -1.85258286090269 + H15 ;
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
   P_DepVar1  =     1.22863049133923 * H11  +     0.28699946905127 * H12
          +    -2.51725413522976 * H13  +     1.82433485707779 * H14
          +     2.87826463194671 * H15 ;
   P_DepVar1  =     -1.1116551400942 + P_DepVar1 ;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.12276912277718 * S_PC_1  +     0.48323850514438 * S_PC_10
          +     0.68031563674255 * S_PC_11  +     -0.3803252551397 * S_PC_12
          +    -0.38883141448506 * S_PC_13  +     0.18297524908557 * S_PC_14
          +    -0.14130961452043 * S_PC_15  +    -0.01389001966875 * S_PC_16
          +    -0.18236634446035 * S_PC_17  +     -0.2869836818767 * S_PC_2
          +    -0.43115379961177 * S_PC_3  +    -0.71689932090568 * S_PC_4
          +     1.74837235940534 * S_PC_5  +    -0.16799274296092 * S_PC_6
          +     0.59141082507893 * S_PC_7  +    -1.65708073078138 * S_PC_8
          +    -0.23653570264035 * S_PC_9  +     0.12716388854733 *
        S_Year_Birth ;
   H12  =     0.10382591217887 * S_PC_1  +     -0.3681549346254 * S_PC_10
          +     0.31589425945342 * S_PC_11  +     0.32372324560356 * S_PC_12
          +    -0.79985272291669 * S_PC_13  +     0.44553334565041 * S_PC_14
          +     -0.2442840506468 * S_PC_15  +     0.18147336438783 * S_PC_16
          +    -0.08934577134937 * S_PC_17  +    -0.42463827789577 * S_PC_2
          +    -0.37633599282137 * S_PC_3  +     0.23736328762468 * S_PC_4
          +     0.11049377724852 * S_PC_5  +     0.07326935846383 * S_PC_6
          +     0.06224514795359 * S_PC_7  +     0.27947754903632 * S_PC_8
          +     0.16450839173977 * S_PC_9  +       0.284448060549 *
        S_Year_Birth ;
   H13  =     0.78763675004794 * S_PC_1  +    -0.81811103774049 * S_PC_10
          +     0.93366477416666 * S_PC_11  +     1.16965846297343 * S_PC_12
          +    -1.42594589484618 * S_PC_13  +     0.37173637046717 * S_PC_14
          +    -0.71607370368062 * S_PC_15  +     0.03799186473187 * S_PC_16
          +    -0.83923420152049 * S_PC_17  +    -0.52658208711619 * S_PC_2
          +    -0.24847306040654 * S_PC_3  +    -0.07003003817677 * S_PC_4
          +    -0.64088623020589 * S_PC_5  +     0.24934462662515 * S_PC_6
          +    -0.63337344204133 * S_PC_7  +    -0.26492590651331 * S_PC_8
          +    -0.00550038877411 * S_PC_9  +    -0.22936134488413 *
        S_Year_Birth ;
   H14  =     1.00262648008486 * S_PC_1  +    -0.41183284890751 * S_PC_10
          +    -0.27894119697683 * S_PC_11  +    -0.61930087944226 * S_PC_12
          +    -0.33836794697515 * S_PC_13  +     0.01146036698973 * S_PC_14
          +    -0.05548117670116 * S_PC_15  +     0.07568024416566 * S_PC_16
          +     0.21649360412624 * S_PC_17  +    -0.24585285326072 * S_PC_2
          +     0.46924501567271 * S_PC_3  +    -0.29506165193626 * S_PC_4
          +     0.02711238555346 * S_PC_5  +    -0.10547210438429 * S_PC_6
          +    -0.03209348447079 * S_PC_7  +    -0.30829392539758 * S_PC_8
          +     0.43363588600606 * S_PC_9  +     0.08556015108733 *
        S_Year_Birth ;
   H11  =    -0.76298530925791 + H11 ;
   H12  =    -0.91929484612991 + H12 ;
   H13  =     1.64705273571047 + H13 ;
   H14  =    -2.24528811970628 + H14 ;
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
   P_DepVar1  =     -2.7735295605065 * H11  +     2.73796705605762 * H12
          +     2.04094779193741 * H13  +     2.95391486555169 * H14 ;
   P_DepVar1  =    -1.83401683391661 + P_DepVar1 ;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.65368855138007 * S_PC_1  +    -0.43858642808571 * S_PC_10
          +     0.44774257597401 * S_PC_11  +     0.56119426236744 * S_PC_12
          +    -1.34625423578418 * S_PC_13  +      0.4490046335198 * S_PC_14
          +    -0.57321494670986 * S_PC_15  +     0.28275827920588 * S_PC_16
          +    -0.10465984705187 * S_PC_17  +     0.00124260485648 * S_PC_2
          +    -0.36103408936447 * S_PC_3  +      0.0188794550105 * S_PC_4
          +    -0.31176267972644 * S_PC_5  +    -0.62130750777774 * S_PC_6
          +     0.01824618528563 * S_PC_7  +     0.27990971778731 * S_PC_8
          +     0.25285684344446 * S_PC_9  +     0.72536510891281 *
        S_Year_Birth ;
   H12  =     0.64877140978178 * S_PC_1  +    -0.23504836576679 * S_PC_10
          +    -0.13900995660374 * S_PC_11  +    -0.25644128958673 * S_PC_12
          +    -0.15892471251011 * S_PC_13  +    -0.02058583158074 * S_PC_14
          +      0.0190008534305 * S_PC_15  +         0.0411166186 * S_PC_16
          +     0.11535891526057 * S_PC_17  +     -0.2275840979411 * S_PC_2
          +     0.24657353117273 * S_PC_3  +     -0.1402758814142 * S_PC_4
          +    -0.01079222352767 * S_PC_5  +    -0.01020091925976 * S_PC_6
          +    -0.01153586471853 * S_PC_7  +    -0.10556442094722 * S_PC_8
          +     0.21806440355982 * S_PC_9  +    -0.06957405892099 *
        S_Year_Birth ;
   H13  =    -0.78080294183158 * S_PC_1  +    -0.15293405793931 * S_PC_10
          +     0.20496805235629 * S_PC_11  +     0.21305808748543 * S_PC_12
          +    -0.21539525830977 * S_PC_13  +     0.36295087844437 * S_PC_14
          +     0.00204662406445 * S_PC_15  +    -0.03331017668692 * S_PC_16
          +    -0.30636245037495 * S_PC_17  +    -0.67006286184773 * S_PC_2
          +    -0.45540841394297 * S_PC_3  +     0.60411563445926 * S_PC_4
          +     -0.1886380547418 * S_PC_5  +      0.9282932671333 * S_PC_6
          +     0.13390016494386 * S_PC_7  +     0.48785671386504 * S_PC_8
          +     0.07675156489007 * S_PC_9  +    -0.35190414343645 *
        S_Year_Birth ;
   H11  =    -0.68382506756513 + H11 ;
   H12  =    -1.19130754752045 + H12 ;
   H13  =    -1.06127071029416 + H13 ;
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     1.89593445155806 * H11  +     3.94511888903906 * H12
          +     2.29198413143453 * H13 ;
   P_DepVar1  =     0.86637040219244 + P_DepVar1 ;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.55278729836225 * S_PC_1  +     0.73640440680063 * S_PC_10
          +     0.59481848698245 * S_PC_11  +     0.62019639317541 * S_PC_12
          +     0.15624905455303 * S_PC_13  +     0.20933058295146 * S_PC_14
          +     0.00779387490229 * S_PC_15  +    -0.04738185629504 * S_PC_16
          +    -0.47703636603665 * S_PC_17  +     0.83602313123189 * S_PC_2
          +    -0.43331914760469 * S_PC_3  +    -0.38527693892093 * S_PC_4
          +     0.94860762399088 * S_PC_5  +     0.10623351274944 * S_PC_6
          +     0.44674672899855 * S_PC_7  +      0.1335032206699 * S_PC_8
          +     -0.3828823509017 * S_PC_9  +     0.04000762877248 *
        S_Year_Birth ;
   H12  =      0.1015944825754 * S_PC_1  +    -0.28801441137597 * S_PC_10
          +     0.37915147337526 * S_PC_11  +     0.28968281818828 * S_PC_12
          +    -0.79130354243089 * S_PC_13  +     0.41932517876703 * S_PC_14
          +    -0.22016477226882 * S_PC_15  +     0.12240987724601 * S_PC_16
          +    -0.20808147571698 * S_PC_17  +    -0.20640021335574 * S_PC_2
          +    -0.21752852020728 * S_PC_3  +     0.02875487462985 * S_PC_4
          +     0.04319395544222 * S_PC_5  +     0.17075940027899 * S_PC_6
          +     0.19384943366435 * S_PC_7  +     0.24099931206872 * S_PC_8
          +      0.2459307676611 * S_PC_9  +     0.10172259849684 *
        S_Year_Birth ;
   H11  =     2.11760716925128 + H11 ;
   H12  =    -0.54988660963837 + H12 ;
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
   P_DepVar1  =    -2.47311295221045 * H11  +     3.24539170723243 * H12 ;
   P_DepVar1  =    -0.75055589991826 + P_DepVar1 ;
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

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

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
   PC_2 ,
   PC_3 ,
   PC_4 ,
   PC_5 ,
   PC_6 ,
   PC_7 ,
   PC_8 ,
   PC_9 ,
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.11355259784693 * S_PC_1  +     0.09821088930461 * S_PC_10
          +    -0.03790390875086 * S_PC_11  +    -0.02310315531826 * S_PC_12
          +     0.15443150363184 * S_PC_13  +    -0.06423123439766 * S_PC_14
          +     0.04229747295712 * S_PC_15  +     -0.0338418263084 * S_PC_16
          +     0.02045719938559 * S_PC_17  +     0.10726544480497 * S_PC_2
          +     0.02238713759079 * S_PC_3  +    -0.02744369405165 * S_PC_4
          +     0.06597303349601 * S_PC_5  +    -0.03087160674989 * S_PC_6
          +    -0.01940493724452 * S_PC_7  +    -0.05154083987327 * S_PC_8
          +    -0.06916160514074 * S_PC_9  +    -0.00670286344758 *
        S_Year_Birth ;
   H11  =    -0.68068308660931 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     -16.691252350141 * H11 ;
   P_DepVar1  =    -12.7407719174024 + P_DepVar1 ;
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
* NODE: Ensmbl16;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl16: Average Posteriors of 7 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural12_P_DepVar1 +
Neural17_P_DepVar1 +
Neural16_P_DepVar1 +
Neural15_P_DepVar1 +
Neural14_P_DepVar1 +
Neural13_P_DepVar1 +
Neural11_P_DepVar1
)/7;
P_DepVar0 = (
Neural12_P_DepVar0 +
Neural17_P_DepVar0 +
Neural16_P_DepVar0 +
Neural15_P_DepVar0 +
Neural14_P_DepVar0 +
Neural13_P_DepVar0 +
Neural11_P_DepVar0
)/7;
*------------------------------------------------------------*;
* Ensmbl16: Computing Classification Vars;
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
* Ensmbl16: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl16: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
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
