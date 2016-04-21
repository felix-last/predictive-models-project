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
else _D13=(MonthsAsCustomer-83.6512215669755)/16.9364993770664;
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
-0.140454302*AcceptedCmp1_1_+
0.1404543022*AcceptedCmp1_2_+
-0.057569794*AcceptedCmp2_1_+
0.0575697938*AcceptedCmp2_2_+
-0.021431449*AcceptedCmp3_1_+
0.0214314485*AcceptedCmp3_2_+
-0.097065482*AcceptedCmp4_1_+
0.0970654815*AcceptedCmp4_2_+
-0.168199479*AcceptedCmp5_1_+
0.1681994785*AcceptedCmp5_2_+
0.0084759129*Complain_1_+
-0.008475913*Complain_2_+
-0.038000034*Education_1_+
-0.057925878*Education_2_+
0.0164462571*Education_3_+
0.0194623439*Education_4_+
0.0146880874*Education_5_+
-0.063739726*HigherEducationBinary_1_+
0.0637397262*HigherEducationBinary_2_+
-0.00389261*Marital_Status_1_+
-0.004074461*Marital_Status_2_+
-0.001997044*Marital_Status_3_+
0.0026947482*Marital_Status_4_+
0.0166899043*Marital_Status_5_+
0.1763641894*_D1+
0.0470053829*_D2+
0.2648055246*_D3+
0.2627397379*_D4+
-0.183241573*_D5+
0.2837953869*_D6+
0.1852427835*_D7+
0.1884759378*_D8+
0.1587295691*_D9+
0.2426707545*_D10+
0.1867325402*_D11+
0.2531368833*_D12+
0.0321725006*_D13+
0.2527857902*_D14+
-0.045040466*_D15+
0.2563416737*_D16+
0.2200036441*_D17+
0.1832315675*_D18+
-0.171104944*_D19+
0.1179148072*_D20+
0.253167609*_D21+
0.0000895737*_D22+
-0.044011253*_D23;
/****************************************/
* Principal Component 2;
/****************************************/
;
label PC_2 = "Principal Component 2";
PC_2 =
0.2614011757*AcceptedCmp1_1_+
-0.261401176*AcceptedCmp1_2_+
0.2628399349*AcceptedCmp2_1_+
-0.262839935*AcceptedCmp2_2_+
0.1743155092*AcceptedCmp3_1_+
-0.174315509*AcceptedCmp3_2_+
0.2314478334*AcceptedCmp4_1_+
-0.231447833*AcceptedCmp4_2_+
0.2494297569*AcceptedCmp5_1_+
-0.249429757*AcceptedCmp5_2_+
-0.015107149*Complain_1_+
0.0151071492*Complain_2_+
-0.164660507*Education_1_+
-0.10845945*Education_2_+
0.1007201837*Education_3_+
0.0457837746*Education_4_+
0.001699421*Education_5_+
-0.202166951*HigherEducationBinary_1_+
0.2021669512*HigherEducationBinary_2_+
-0.009053535*Marital_Status_1_+
-0.018874479*Marital_Status_2_+
0.0041082102*Marital_Status_3_+
0.024701033*Marital_Status_4_+
-0.000850393*Marital_Status_5_+
-0.403414305*_D1+
0.0939684474*_D2+
0.0977068435*_D3+
0.0840265555*_D4+
-0.091483559*_D5+
0.0578458891*_D6+
0.1204496679*_D7+
0.1118454517*_D8+
0.0349122965*_D9+
0.0711585167*_D10+
0.0971827646*_D11+
0.009524274*_D12+
0.0532088579*_D13+
0.0500861414*_D14+
0.0550047797*_D15+
0.0756472118*_D16+
0.1079445738*_D17+
0.080067751*_D18+
-0.090413318*_D19+
0.0265765286*_D20+
0.0570362761*_D21+
-0.008668977*_D22+
0.1065581676*_D23;
/****************************************/
* Principal Component 3;
/****************************************/
;
label PC_3 = "Principal Component 3";
PC_3 =
0.021251488*AcceptedCmp1_1_+
-0.021251488*AcceptedCmp1_2_+
0.1536186884*AcceptedCmp2_1_+
-0.153618688*AcceptedCmp2_2_+
0.0505497198*AcceptedCmp3_1_+
-0.05054972*AcceptedCmp3_2_+
0.1494718096*AcceptedCmp4_1_+
-0.14947181*AcceptedCmp4_2_+
0.0396084565*AcceptedCmp5_1_+
-0.039608457*AcceptedCmp5_2_+
-0.052934973*Complain_1_+
0.0529349735*Complain_2_+
0.4092679469*Education_1_+
0.2108837641*Education_2_+
-0.168696609*Education_3_+
-0.05141788*Education_4_+
-0.13335905*Education_5_+
0.4720086716*HigherEducationBinary_1_+
-0.472008672*HigherEducationBinary_2_+
-0.014220845*Marital_Status_1_+
-0.029449271*Marital_Status_2_+
0.0497624365*Marital_Status_3_+
0.0028880598*Marital_Status_4_+
-0.017290281*Marital_Status_5_+
-0.127836505*_D1+
-0.135189542*_D2+
0.0177274694*_D3+
-0.010017313*_D4+
-0.036596236*_D5+
0.0483263692*_D6+
0.1541700091*_D7+
0.1513409165*_D8+
0.0909019054*_D9+
0.0954337793*_D10+
0.1610447756*_D11+
-0.048138223*_D12+
0.0317082074*_D13+
0.0534684242*_D14+
-0.090284378*_D15+
0.0127912995*_D16+
0.0209049214*_D17+
-0.034184577*_D18+
-0.084245882*_D19+
0.0169991458*_D20+
0.0505197622*_D21+
-0.015992715*_D22+
-0.167582344*_D23;
/****************************************/
* Principal Component 4;
/****************************************/
;
label PC_4 = "Principal Component 4";
PC_4 =
0.090130882*AcceptedCmp1_1_+
-0.090130882*AcceptedCmp1_2_+
-0.087580539*AcceptedCmp2_1_+
0.0875805391*AcceptedCmp2_2_+
-0.319198238*AcceptedCmp3_1_+
0.3191982383*AcceptedCmp3_2_+
0.0291858633*AcceptedCmp4_1_+
-0.029185863*AcceptedCmp4_2_+
0.1836112834*AcceptedCmp5_1_+
-0.183611283*AcceptedCmp5_2_+
-0.082110053*Complain_1_+
0.0821100531*Complain_2_+
0.1231708309*Education_1_+
0.0075512261*Education_2_+
-0.072532918*Education_3_+
-0.049640827*Education_4_+
0.0398770323*Education_5_+
0.1130141059*HigherEducationBinary_1_+
-0.113014106*HigherEducationBinary_2_+
0.0269883687*Marital_Status_1_+
-0.023433447*Marital_Status_2_+
-0.009270211*Marital_Status_3_+
0.0093479335*Marital_Status_4_+
0.0190777527*Marital_Status_5_+
0.0268905103*_D1+
0.1104874718*_D2+
0.1599605306*_D3+
-0.026193264*_D4+
0.0321778511*_D5+
0.0104478744*_D6+
-0.051443194*_D7+
-0.063554936*_D8+
0.210758091*_D9+
-0.108685432*_D10+
-0.064811506*_D11+
0.0783806389*_D12+
0.2238074254*_D13+
0.0263310081*_D14+
0.4196872924*_D15+
0.1958857518*_D16+
0.0748866276*_D17+
0.3169551454*_D18+
0.2670792048*_D19+
-0.019054402*_D20+
-0.018346158*_D21+
0.0352091077*_D22+
0.2681040392*_D23;
/****************************************/
* Principal Component 5;
/****************************************/
;
label PC_5 = "Principal Component 5";
PC_5 =
0.0674062505*AcceptedCmp1_1_+
-0.067406251*AcceptedCmp1_2_+
-0.080536708*AcceptedCmp2_1_+
0.0805367081*AcceptedCmp2_2_+
0.4551262141*AcceptedCmp3_1_+
-0.455126214*AcceptedCmp3_2_+
-0.353181566*AcceptedCmp4_1_+
0.3531815665*AcceptedCmp4_2_+
0.0525350245*AcceptedCmp5_1_+
-0.052535024*AcceptedCmp5_2_+
-0.013251977*Complain_1_+
0.0132519766*Complain_2_+
0.1298157575*Education_1_+
0.0251324571*Education_2_+
-0.208526197*Education_3_+
0.0418493868*Education_4_+
0.1122363259*Education_5_+
0.1280301121*HigherEducationBinary_1_+
-0.128030112*HigherEducationBinary_2_+
0.0551339648*Marital_Status_1_+
0.0096530041*Marital_Status_2_+
-0.070196805*Marital_Status_3_+
-0.017377854*Marital_Status_4_+
0.0872862117*Marital_Status_5_+
-0.084970507*_D1+
0.1548219692*_D2+
0.0783651972*_D3+
0.0442721358*_D4+
-0.091444281*_D5+
-0.004513593*_D6+
-0.082653404*_D7+
-0.087435574*_D8+
-0.127598562*_D9+
-0.077612158*_D10+
-0.065658765*_D11+
0.0905599914*_D12+
0.0476406629*_D13+
-0.043371418*_D14+
0.1163341506*_D15+
0.0356032168*_D16+
0.1220136533*_D17+
0.1086806319*_D18+
0.0311429067*_D19+
-0.003853949*_D20+
-0.022377794*_D21+
0.0017342712*_D22+
0.2003213621*_D23;
/****************************************/
* Principal Component 6;
/****************************************/
;
label PC_6 = "Principal Component 6";
PC_6 =
0.0014571502*AcceptedCmp1_1_+
-0.00145715*AcceptedCmp1_2_+
0.0161200567*AcceptedCmp2_1_+
-0.016120057*AcceptedCmp2_2_+
0.0089982965*AcceptedCmp3_1_+
-0.008998296*AcceptedCmp3_2_+
-0.03469685*AcceptedCmp4_1_+
0.0346968499*AcceptedCmp4_2_+
0.0584233499*AcceptedCmp5_1_+
-0.05842335*AcceptedCmp5_2_+
0.6791875975*Complain_1_+
-0.679187597*Complain_2_+
0.0029265084*Education_1_+
0.0787230422*Education_2_+
0.0801625447*Education_3_+
-0.045563584*Education_4_+
-0.092490306*Education_5_+
0.0434758314*HigherEducationBinary_1_+
-0.043475831*HigherEducationBinary_2_+
0.0120745003*Marital_Status_1_+
-0.02409954*Marital_Status_2_+
0.0584333915*Marital_Status_3_+
-0.013680348*Marital_Status_4_+
-0.058762564*Marital_Status_5_+
-0.017241554*_D1+
-0.0667557*_D2+
0.0192852076*_D3+
-0.037104781*_D4+
-0.004294977*_D5+
0.011372435*_D6+
-0.003329436*_D7+
0.0198555071*_D8+
0.0687463319*_D9+
-0.004851967*_D10+
0.0240451765*_D11+
0.0083353816*_D12+
0.0407892061*_D13+
-0.004357563*_D14+
0.0624278459*_D15+
0.0297313778*_D16+
0.0003845297*_D17+
0.0569669719*_D18+
0.0877972905*_D19+
0.0205192551*_D20+
0.0078143676*_D21+
-0.038116213*_D22+
0.029308498*_D23;
/****************************************/
* Principal Component 7;
/****************************************/
;
label PC_7 = "Principal Component 7";
PC_7 =
-0.016235531*AcceptedCmp1_1_+
0.016235531*AcceptedCmp1_2_+
-0.121587817*AcceptedCmp2_1_+
0.1215878171*AcceptedCmp2_2_+
0.1642716497*AcceptedCmp3_1_+
-0.16427165*AcceptedCmp3_2_+
-0.139474469*AcceptedCmp4_1_+
0.1394744695*AcceptedCmp4_2_+
0.051870024*AcceptedCmp5_1_+
-0.051870024*AcceptedCmp5_2_+
-0.136405907*Complain_1_+
0.1364059074*Complain_2_+
-0.04259765*Education_1_+
0.045821831*Education_2_+
0.5627226886*Education_3_+
-0.262602105*Education_4_+
-0.440496567*Education_5_+
-0.013931771*HigherEducationBinary_1_+
0.0139317705*HigherEducationBinary_2_+
-0.077197593*Marital_Status_1_+
0.0941981396*Marital_Status_2_+
0.0719167582*Marital_Status_3_+
-0.079831915*Marital_Status_4_+
-0.11054821*Marital_Status_5_+
-0.008678496*_D1+
-0.238173026*_D2+
0.0060771375*_D3+
-0.087904424*_D4+
0.078591263*_D5+
-0.008271507*_D6+
0.1093661782*_D7+
0.097153567*_D8+
0.1227994637*_D9+
-0.022905364*_D10+
0.1388002*_D11+
-0.062478811*_D12+
0.174032683*_D13+
-0.035653751*_D14+
0.1035005648*_D15+
0.0146239352*_D16+
-0.007307214*_D17+
0.0635592538*_D18+
0.1708819737*_D19+
-0.014630207*_D20+
-0.017007255*_D21+
0.0109658506*_D22+
-0.067033781*_D23;
/****************************************/
* Principal Component 8;
/****************************************/
;
label PC_8 = "Principal Component 8";
PC_8 =
-0.235851403*AcceptedCmp1_1_+
0.2358514032*AcceptedCmp1_2_+
0.5412944513*AcceptedCmp2_1_+
-0.541294451*AcceptedCmp2_2_+
-0.022362865*AcceptedCmp3_1_+
0.0223628655*AcceptedCmp3_2_+
-0.157112609*AcceptedCmp4_1_+
0.1571126093*AcceptedCmp4_2_+
-0.036557963*AcceptedCmp5_1_+
0.0365579631*AcceptedCmp5_2_+
-0.033523327*Complain_1_+
0.0335233265*Complain_2_+
-0.006531761*Education_1_+
-0.028237098*Education_2_+
-0.008667937*Education_3_+
-0.018353326*Education_4_+
0.043251878*Education_5_+
-0.020449766*HigherEducationBinary_1_+
0.020449766*HigherEducationBinary_2_+
-0.02323077*Marital_Status_1_+
0.2644213873*Marital_Status_2_+
0.0148164098*Marital_Status_3_+
-0.284613755*Marital_Status_4_+
-0.050467382*Marital_Status_5_+
0.0822795992*_D1+
-0.043982821*_D2+
0.0063085323*_D3+
-0.018983157*_D4+
0.1169593859*_D5+
0.0086468049*_D6+
-0.073345048*_D7+
-0.07385018*_D8+
-0.025675132*_D9+
-0.007425212*_D10+
-0.034687616*_D11+
0.0476191461*_D12+
0.0680472099*_D13+
-0.006480048*_D14+
0.1312467887*_D15+
0.0404890669*_D16+
-0.043360812*_D17+
0.0781581324*_D18+
0.1298816022*_D19+
0.0300867524*_D20+
-0.005040823*_D21+
-0.034451357*_D22+
0.0296644988*_D23;
/****************************************/
* Principal Component 9;
/****************************************/
;
label PC_9 = "Principal Component 9";
PC_9 =
-0.103954189*AcceptedCmp1_1_+
0.1039541885*AcceptedCmp1_2_+
0.123211149*AcceptedCmp2_1_+
-0.123211149*AcceptedCmp2_2_+
0.0772250645*AcceptedCmp3_1_+
-0.077225064*AcceptedCmp3_2_+
-0.020051094*AcceptedCmp4_1_+
0.0200510942*AcceptedCmp4_2_+
-0.059115231*AcceptedCmp5_1_+
0.0591152311*AcceptedCmp5_2_+
-0.049749475*Complain_1_+
0.0497494753*Complain_2_+
-0.091377633*Education_1_+
0.0748542289*Education_2_+
-0.032789179*Education_3_+
0.0955465331*Education_4_+
-0.010069143*Education_5_+
-0.042058617*HigherEducationBinary_1_+
0.0420586173*HigherEducationBinary_2_+
0.0719905383*Marital_Status_1_+
-0.688029581*Marital_Status_2_+
0.4213999478*Marital_Status_3_+
0.3294069381*Marital_Status_4_+
0.0213095702*Marital_Status_5_+
0.018183196*_D1+
-0.100945028*_D2+
-0.000392988*_D3+
-0.064248971*_D4+
0.0900572974*_D5+
0.0280195506*_D6+
-0.054570556*_D7+
-0.032835859*_D8+
-0.033920595*_D9+
0.0074873988*_D10+
-0.063479826*_D11+
0.0693620977*_D12+
0.2245073411*_D13+
-0.001332574*_D14+
0.0590974037*_D15+
0.0265411561*_D16+
-0.038382364*_D17+
0.0481420987*_D18+
0.148996119*_D19+
0.0453406083*_D20+
0.0137411465*_D21+
-0.066714756*_D22+
-0.07425267*_D23;
/****************************************/
* Principal Component 10;
/****************************************/
;
label PC_10 = "Principal Component 10";
PC_10 =
-0.427874411*AcceptedCmp1_1_+
0.4278744107*AcceptedCmp1_2_+
-0.055248509*AcceptedCmp2_1_+
0.0552485095*AcceptedCmp2_2_+
0.1970552167*AcceptedCmp3_1_+
-0.197055217*AcceptedCmp3_2_+
0.3250869874*AcceptedCmp4_1_+
-0.325086987*AcceptedCmp4_2_+
-0.022371995*AcceptedCmp5_1_+
0.0223719953*AcceptedCmp5_2_+
0.0300793977*Complain_1_+
-0.030079398*Complain_2_+
0.0445970543*Education_1_+
-0.070359741*Education_2_+
0.0462756238*Education_3_+
-0.049196156*Education_4_+
-0.015293531*Education_5_+
0.0029591891*HigherEducationBinary_1_+
-0.002959189*HigherEducationBinary_2_+
0.1544727439*Marital_Status_1_+
-0.009168037*Marital_Status_2_+
-0.208842015*Marital_Status_3_+
0.0934756654*Marital_Status_4_+
0.0261629396*Marital_Status_5_+
-0.027104953*_D1+
0.1488737531*_D2+
0.0267669463*_D3+
0.0061368745*_D4+
0.0247122634*_D5+
-0.037740221*_D6+
0.021014237*_D7+
-0.006010419*_D8+
-0.001792592*_D9+
-0.048044162*_D10+
0.0303955068*_D11+
-0.042110022*_D12+
0.065532531*_D13+
-0.016388635*_D14+
0.1227062742*_D15+
0.0196636318*_D16+
0.0310700466*_D17+
0.0520008926*_D18+
0.0301354098*_D19+
-0.267762816*_D20+
-0.06601987*_D21+
0.2989188542*_D22+
0.1612628586*_D23;
/****************************************/
* Principal Component 11;
/****************************************/
;
label PC_11 = "Principal Component 11";
PC_11 =
-0.007850321*AcceptedCmp1_1_+
0.007850321*AcceptedCmp1_2_+
-0.141932781*AcceptedCmp2_1_+
0.1419327805*AcceptedCmp2_2_+
0.1326722203*AcceptedCmp3_1_+
-0.13267222*AcceptedCmp3_2_+
0.1701191504*AcceptedCmp4_1_+
-0.17011915*AcceptedCmp4_2_+
-0.064426095*AcceptedCmp5_1_+
0.064426095*AcceptedCmp5_2_+
0.002376288*Complain_1_+
-0.002376288*Complain_2_+
-0.199351374*Education_1_+
0.2395110747*Education_2_+
-0.272200061*Education_3_+
0.1420267521*Education_4_+
0.2477233896*Education_5_+
-0.052178557*HigherEducationBinary_1_+
0.0521785571*HigherEducationBinary_2_+
-0.306760848*Marital_Status_1_+
0.2936908074*Marital_Status_2_+
-0.058227299*Marital_Status_3_+
0.0008191296*Marital_Status_4_+
-0.166572013*Marital_Status_5_+
-0.06721949*_D1+
-0.257881472*_D2+
0.0237524776*_D3+
-0.088465195*_D4+
0.1701598619*_D5+
0.0532522665*_D6+
0.0044322611*_D7+
-0.022454255*_D8+
-0.066358745*_D9+
0.0563983496*_D10+
-0.002749799*_D11+
0.0707200029*_D12+
0.3372483306*_D13+
0.0015876425*_D14+
0.1091214517*_D15+
0.0529890598*_D16+
-0.022667634*_D17+
0.0916097792*_D18+
0.1918846211*_D19+
0.1323639318*_D20+
0.0518739596*_D21+
-0.079817855*_D22+
-0.251856032*_D23;
/****************************************/
* Principal Component 12;
/****************************************/
;
label PC_12 = "Principal Component 12";
PC_12 =
0.0509699703*AcceptedCmp1_1_+
-0.05096997*AcceptedCmp1_2_+
0.1441112065*AcceptedCmp2_1_+
-0.144111207*AcceptedCmp2_2_+
-0.027075333*AcceptedCmp3_1_+
0.0270753332*AcceptedCmp3_2_+
-0.058391611*AcceptedCmp4_1_+
0.0583916113*AcceptedCmp4_2_+
-0.120144753*AcceptedCmp5_1_+
0.1201447525*AcceptedCmp5_2_+
0.01277631*Complain_1_+
-0.01277631*Complain_2_+
0.0254879918*Education_1_+
0.0045774365*Education_2_+
0.1164353239*Education_3_+
-0.054774111*Education_4_+
-0.113358095*Education_5_+
0.0249519622*HigherEducationBinary_1_+
-0.024951962*HigherEducationBinary_2_+
-0.134355536*Marital_Status_1_+
0.0209656214*Marital_Status_2_+
-0.606895601*Marital_Status_3_+
0.6279109157*Marital_Status_4_+
0.0830401302*Marital_Status_5_+
0.0388975577*_D1+
0.1061958401*_D2+
-0.027766116*_D3+
-0.029102121*_D4+
0.0124857387*_D5+
-0.008333784*_D6+
0.0092016583*_D7+
0.0035684098*_D8+
0.0017532031*_D9+
-0.002230646*_D10+
-0.006837582*_D11+
-0.014631685*_D12+
0.1004668034*_D13+
-0.034943327*_D14+
0.0008722278*_D15+
-0.009132118*_D16+
-0.048154591*_D17+
0.0209804722*_D18+
0.0704811054*_D19+
0.1547713846*_D20+
-0.00990716*_D21+
-0.195715318*_D22+
-0.000402836*_D23;
/****************************************/
* Principal Component 13;
/****************************************/
;
label PC_13 = "Principal Component 13";
PC_13 =
0.1169755496*AcceptedCmp1_1_+
-0.11697555*AcceptedCmp1_2_+
0.0757849532*AcceptedCmp2_1_+
-0.075784953*AcceptedCmp2_2_+
-0.057071392*AcceptedCmp3_1_+
0.0570713922*AcceptedCmp3_2_+
-0.147549922*AcceptedCmp4_1_+
0.1475499216*AcceptedCmp4_2_+
-0.008504434*AcceptedCmp5_1_+
0.0085044344*AcceptedCmp5_2_+
0.0071941252*Complain_1_+
-0.007194125*Complain_2_+
-0.067773977*Education_1_+
0.0744924052*Education_2_+
-0.112494265*Education_3_+
0.4575079235*Education_4_+
-0.248388899*Education_5_+
-0.021340755*HigherEducationBinary_1_+
0.0213407547*HigherEducationBinary_2_+
-0.122858359*Marital_Status_1_+
0.0381770427*Marital_Status_2_+
-0.06879816*Marital_Status_3_+
0.1595200211*Marital_Status_4_+
-0.122830226*Marital_Status_5_+
0.0270091356*_D1+
-0.127870581*_D2+
0.0084724994*_D3+
-0.006713567*_D4+
-0.012601248*_D5+
0.0254086542*_D6+
0.0095759265*_D7+
0.0330181109*_D8+
0.0447511173*_D9+
-0.002285522*_D10+
0.0353111992*_D11+
0.0303415898*_D12+
-0.019329074*_D13+
-0.003201901*_D14+
-0.019505973*_D15+
0.0200575892*_D16+
-0.00972022*_D17+
0.0387094976*_D18+
0.0205913911*_D19+
-0.457828589*_D20+
0.0442294781*_D21+
0.5568865157*_D22+
-0.077951596*_D23;
/****************************************/
* Principal Component 14;
/****************************************/
;
label PC_14 = "Principal Component 14";
PC_14 =
0.0426147676*AcceptedCmp1_1_+
-0.042614768*AcceptedCmp1_2_+
-0.025168834*AcceptedCmp2_1_+
0.0251688343*AcceptedCmp2_2_+
0.0474360954*AcceptedCmp3_1_+
-0.047436095*AcceptedCmp3_2_+
0.1383740617*AcceptedCmp4_1_+
-0.138374062*AcceptedCmp4_2_+
-0.242770896*AcceptedCmp5_1_+
0.2427708964*AcceptedCmp5_2_+
0.0140993141*Complain_1_+
-0.014099314*Complain_2_+
0.0477228486*Education_1_+
-0.060012572*Education_2_+
0.0023136125*Education_3_+
0.4920268608*Education_4_+
-0.444349234*Education_5_+
0.0111013786*HigherEducationBinary_1_+
-0.011101379*HigherEducationBinary_2_+
-0.129783208*Marital_Status_1_+
0.0572234051*Marital_Status_2_+
0.1059827297*Marital_Status_3_+
-0.233798438*Marital_Status_4_+
0.387084632*Marital_Status_5_+
0.0136860368*_D1+
0.1852959026*_D2+
-0.020240577*_D3+
0.0024898069*_D4+
0.0226727076*_D5+
-0.032733823*_D6+
0.0008526873*_D7+
0.0004834844*_D8+
0.0470369827*_D9+
-0.058255799*_D10+
-0.008617562*_D11+
-0.027297761*_D12+
0.057257675*_D13+
-0.054331448*_D14+
0.1042387254*_D15+
-0.017604484*_D16+
-0.019627949*_D17+
0.0266256626*_D18+
0.0571147662*_D19+
0.1197286344*_D20+
-0.033413162*_D21+
-0.224472411*_D22+
0.1482134436*_D23;
/****************************************/
* Principal Component 15;
/****************************************/
;
label PC_15 = "Principal Component 15";
PC_15 =
0.2399229828*AcceptedCmp1_1_+
-0.239922983*AcceptedCmp1_2_+
0.0755077329*AcceptedCmp2_1_+
-0.075507733*AcceptedCmp2_2_+
0.0341435117*AcceptedCmp3_1_+
-0.034143512*AcceptedCmp3_2_+
0.0514178664*AcceptedCmp4_1_+
-0.051417866*AcceptedCmp4_2_+
-0.345087029*AcceptedCmp5_1_+
0.3450870289*AcceptedCmp5_2_+
0.0335921778*Complain_1_+
-0.033592178*Complain_2_+
-0.042394251*Education_1_+
0.1128254137*Education_2_+
0.0948264851*Education_3_+
-0.434976457*Education_4_+
0.2502547117*Education_5_+
0.0210458473*HigherEducationBinary_1_+
-0.021045847*HigherEducationBinary_2_+
-0.12406899*Marital_Status_1_+
-0.035535903*Marital_Status_2_+
0.0816599973*Marital_Status_3_+
-0.099660596*Marital_Status_4_+
0.370247927*Marital_Status_5_+
0.0030215846*_D1+
0.0939732227*_D2+
-0.026464004*_D3+
-0.010968952*_D4+
0.0457471033*_D5+
0.0213887591*_D6+
-0.009072236*_D7+
-0.004070016*_D8+
0.0650334577*_D9+
0.0026172965*_D10+
0.0326052399*_D11+
0.024563565*_D12+
0.1100970715*_D13+
-0.010084763*_D14+
0.0418125067*_D15+
-0.002374882*_D16+
-0.054842878*_D17+
0.0065139914*_D18+
0.058333971*_D19+
-0.203796501*_D20+
0.0331824596*_D21+
0.3123049747*_D22+
0.0060939406*_D23;
/****************************************/
* Principal Component 16;
/****************************************/
;
label PC_16 = "Principal Component 16";
PC_16 =
0.0831810663*AcceptedCmp1_1_+
-0.083181066*AcceptedCmp1_2_+
-0.007090145*AcceptedCmp2_1_+
0.0070901453*AcceptedCmp2_2_+
-0.018619025*AcceptedCmp3_1_+
0.0186190245*AcceptedCmp3_2_+
-0.032752726*AcceptedCmp4_1_+
0.0327527259*AcceptedCmp4_2_+
-0.015070729*AcceptedCmp5_1_+
0.0150707289*AcceptedCmp5_2_+
-0.013133997*Complain_1_+
0.0131339969*Complain_2_+
-0.149835216*Education_1_+
0.2144109382*Education_2_+
-0.039239573*Education_3_+
0.1055618971*Education_4_+
-0.027854888*Education_5_+
-0.02135751*HigherEducationBinary_1_+
0.0213575097*HigherEducationBinary_2_+
0.7496767449*Marital_Status_1_+
-0.046096414*Marital_Status_2_+
-0.290233501*Marital_Status_3_+
-0.22045248*Marital_Status_4_+
0.0585865568*Marital_Status_5_+
-0.003695253*_D1+
0.0671010843*_D2+
-0.094086612*_D3+
-0.089702234*_D4+
0.0605516214*_D5+
0.0741769407*_D6+
0.0870842808*_D7+
0.0915705105*_D8+
0.0403857582*_D9+
0.0593456337*_D10+
0.077707584*_D11+
0.0547643761*_D12+
0.2342332971*_D13+
-0.014544747*_D14+
-0.032197516*_D15+
-0.047446129*_D16+
-0.139847457*_D17+
-0.068109318*_D18+
0.1332781764*_D19+
0.0215359876*_D20+
0.1295121025*_D21+
-0.011851936*_D22+
-0.144143955*_D23;
/****************************************/
* Principal Component 17;
/****************************************/
;
label PC_17 = "Principal Component 17";
PC_17 =
-0.184208555*AcceptedCmp1_1_+
0.1842085553*AcceptedCmp1_2_+
-0.006210893*AcceptedCmp2_1_+
0.0062108933*AcceptedCmp2_2_+
-0.066440856*AcceptedCmp3_1_+
0.0664408557*AcceptedCmp3_2_+
-0.077959677*AcceptedCmp4_1_+
0.0779596772*AcceptedCmp4_2_+
0.2822356061*AcceptedCmp5_1_+
-0.282235606*AcceptedCmp5_2_+
-0.017403508*Complain_1_+
0.0174035085*Complain_2_+
-0.263472535*Education_1_+
0.470273171*Education_2_+
0.0092246158*Education_3_+
-0.017083279*Education_4_+
-0.005000337*Education_5_+
0.0108726868*HigherEducationBinary_1_+
-0.010872687*HigherEducationBinary_2_+
-0.282867176*Marital_Status_1_+
0.0174621828*Marital_Status_2_+
0.0332318853*Marital_Status_3_+
-0.013472821*Marital_Status_4_+
0.4004151797*Marital_Status_5_+
0.0133777646*_D1+
0.2637061461*_D2+
-0.071557905*_D3+
-0.066188371*_D4+
-0.23886293*_D5+
0.0210008335*_D6+
0.040849144*_D7+
0.0589954968*_D8+
0.032030704*_D9+
0.0028658606*_D10+
0.0235136966*_D11+
0.0147436391*_D12+
0.1237776793*_D13+
0.0035920915*_D14+
-0.167775461*_D15+
-0.064574439*_D16+
-0.066089773*_D17+
-0.117500509*_D18+
-0.01566547*_D19+
-0.047020759*_D20+
0.0756221478*_D21+
-0.00360862*_D22+
0.017816877*_D23;
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
