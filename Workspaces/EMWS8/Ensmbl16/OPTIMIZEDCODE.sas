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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     -0.5676300220312 * S_PC_1  +    -0.30685005298258 * S_PC_10
          +     0.33144193521288 * S_PC_11  +     0.48604920744725 * S_PC_12
          +     -0.3343515108255 * S_PC_13  +    -0.24302039168126 * S_PC_14
          +    -0.04203285565889 * S_PC_15  +    -0.02856252858655 * S_PC_16
          +     0.09507071980044 * S_PC_17  +     0.14101757475609 * S_PC_2
          +     0.10400411611015 * S_PC_3  +    -0.60365946974152 * S_PC_4
          +     0.31951023104888 * S_PC_5  +    -0.19495900124965 * S_PC_6
          +    -0.48623238665166 * S_PC_7  +    -0.48996955886063 * S_PC_8
          +    -0.97734935726015 * S_PC_9  +    -0.15876048047142 *
        S_Year_Birth ;
   H12  =    -0.99538279224418 * S_PC_1  +     0.51080506033577 * S_PC_10
          +     0.11168962840475 * S_PC_11  +     0.73413444278653 * S_PC_12
          +     0.34649210530582 * S_PC_13  +     0.13034463919592 * S_PC_14
          +     0.02557639040503 * S_PC_15  +    -0.53720380377274 * S_PC_16
          +    -0.19967827084831 * S_PC_17  +    -0.20514646129984 * S_PC_2
          +    -0.42918913740416 * S_PC_3  +    -0.26543538246483 * S_PC_4
          +      0.1495484443706 * S_PC_5  +     0.42379412404861 * S_PC_6
          +     0.32760041597661 * S_PC_7  +     0.13337617452846 * S_PC_8
          +    -0.64290758383096 * S_PC_9  +    -0.20356285728529 *
        S_Year_Birth ;
   H13  =     -1.0992657781698 * S_PC_1  +     0.03793804392658 * S_PC_10
          +    -0.87112601660535 * S_PC_11  +     -1.1439898359342 * S_PC_12
          +     0.22341662825535 * S_PC_13  +    -0.37197874887684 * S_PC_14
          +     0.30055781758401 * S_PC_15  +    -0.17155015191444 * S_PC_16
          +     0.27076574762285 * S_PC_17  +     0.19305913228169 * S_PC_2
          +     0.47083300459058 * S_PC_3  +     0.57636430755662 * S_PC_4
          +     0.82541924547951 * S_PC_5  +    -0.08491966977298 * S_PC_6
          +    -0.09636016058219 * S_PC_7  +    -0.05101195455819 * S_PC_8
          +     0.21307405812735 * S_PC_9  +      0.0534282745528 *
        S_Year_Birth ;
   H14  =    -0.28033927792161 * S_PC_1  +     0.59493833246644 * S_PC_10
          +    -0.55137023079334 * S_PC_11  +    -0.22268967168536 * S_PC_12
          +      1.0026813896332 * S_PC_13  +    -0.49387305466998 * S_PC_14
          +     0.49776238649549 * S_PC_15  +     0.40400057556983 * S_PC_16
          +      0.0628446798034 * S_PC_17  +     0.04775469750477 * S_PC_2
          +     0.02336139993366 * S_PC_3  +        0.09524660979 * S_PC_4
          +    -0.13739746994018 * S_PC_5  +    -0.25225809263357 * S_PC_6
          +    -0.06487935155791 * S_PC_7  +     -0.1322322847403 * S_PC_8
          +     -0.0661227677489 * S_PC_9  +    -0.10032058920416 *
        S_Year_Birth ;
   H15  =    -0.34016042462479 * S_PC_1  +     0.37454469773631 * S_PC_10
          +    -0.31300667900751 * S_PC_11  +     0.31246253970838 * S_PC_12
          +    -0.49102295972655 * S_PC_13  +    -0.27712376754168 * S_PC_14
          +     0.32925652536478 * S_PC_15  +    -0.33851777824604 * S_PC_16
          +    -0.06016622868243 * S_PC_17  +    -0.76574085180415 * S_PC_2
          +     0.14959059711886 * S_PC_3  +     0.47992442341836 * S_PC_4
          +     0.27744818014204 * S_PC_5  +     0.23310571667766 * S_PC_6
          +    -0.09801680647028 * S_PC_7  +     -0.0461319547186 * S_PC_8
          +     -0.0317075590465 * S_PC_9  +     0.27146889721572 *
        S_Year_Birth ;
   H16  =     0.15099786043328 * S_PC_1  +    -0.33585886774534 * S_PC_10
          +     0.02812263307623 * S_PC_11  +     0.25744092078462 * S_PC_12
          +    -0.41837967158388 * S_PC_13  +     0.20287189163302 * S_PC_14
          +     0.46866832835833 * S_PC_15  +     -0.0201628559761 * S_PC_16
          +     -0.3978461711908 * S_PC_17  +    -0.15412398115987 * S_PC_2
          +     0.36673708324876 * S_PC_3  +    -0.16017079630267 * S_PC_4
          +    -0.63707926563706 * S_PC_5  +    -0.23300386991746 * S_PC_6
          +    -0.08318886288525 * S_PC_7  +     0.74276602413335 * S_PC_8
          +     0.57103943176061 * S_PC_9  +    -0.16157118451233 *
        S_Year_Birth ;
   H17  =       0.330602325747 * S_PC_1  +     0.33032228152843 * S_PC_10
          +     0.23514119397309 * S_PC_11  +     0.11281430081481 * S_PC_12
          +     0.27922853148429 * S_PC_13  +    -0.13641023322947 * S_PC_14
          +    -0.06930142126701 * S_PC_15  +    -0.49846029120568 * S_PC_16
          +     0.04156973818252 * S_PC_17  +     0.75784769859359 * S_PC_2
          +     0.57034551329104 * S_PC_3  +     0.02940592468812 * S_PC_4
          +      0.2173780102755 * S_PC_5  +    -0.18828488891226 * S_PC_6
          +    -0.29383352025112 * S_PC_7  +     -0.3015683807777 * S_PC_8
          +     0.15263811878728 * S_PC_9  +     0.38096811669812 *
        S_Year_Birth ;
   H11  =     -1.1507836976634 + H11 ;
   H12  =     1.36159575454507 + H12 ;
   H13  =    -0.49113198647068 + H13 ;
   H14  =     0.11036109737384 + H14 ;
   H15  =    -1.52568955736796 + H15 ;
   H16  =     0.70595253219317 + H16 ;
   H17  =     0.56521234643088 + H17 ;
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
   P_DepVar1  =    -1.58967822046735 * H11  +    -2.10329065190661 * H12
          +    -1.90822118522278 * H13  +    -2.16762466284078 * H14
          +      1.7747211286988 * H15  +     0.98046519626065 * H16
          +    -1.90328963637158 * H17 ;
   P_DepVar1  =    -2.21107015515665 + P_DepVar1 ;
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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.47325245705958 * S_PC_1  +    -0.32671142398967 * S_PC_10
          +     0.57615604162363 * S_PC_11  +     0.48317613203035 * S_PC_12
          +    -1.05930077532746 * S_PC_13  +      0.5007465821401 * S_PC_14
          +    -0.41547054463424 * S_PC_15  +     0.11424432442491 * S_PC_16
          +    -0.18725136577655 * S_PC_17  +    -0.20911601322263 * S_PC_2
          +    -0.49196475041965 * S_PC_3  +     0.14740529866596 * S_PC_4
          +    -0.03165374814882 * S_PC_5  +     0.09311598667036 * S_PC_6
          +     0.30417718065062 * S_PC_7  +     0.32373700790503 * S_PC_8
          +     0.28212613081564 * S_PC_9  +     0.38601735765022 *
        S_Year_Birth ;
   H12  =      0.3985278956759 * S_PC_1  +     0.27103948298477 * S_PC_10
          +     0.01165110369557 * S_PC_11  +     0.21404029328035 * S_PC_12
          +    -0.27042984265444 * S_PC_13  +     0.04657202774732 * S_PC_14
          +     0.36682212283702 * S_PC_15  +     0.58999310845876 * S_PC_16
          +    -0.63185338323755 * S_PC_17  +    -0.47445887654202 * S_PC_2
          +     0.05620683889662 * S_PC_3  +    -0.27699101353178 * S_PC_4
          +    -0.13567281097834 * S_PC_5  +    -0.18272982323213 * S_PC_6
          +     0.20610837478777 * S_PC_7  +     0.10320859948764 * S_PC_8
          +     0.12065281442441 * S_PC_9  +     -0.0605809550752 *
        S_Year_Birth ;
   H13  =    -0.77180379369522 * S_PC_1  +    -0.09323855070306 * S_PC_10
          +    -0.23585334471306 * S_PC_11  +     0.04781156320899 * S_PC_12
          +     -0.3700858361991 * S_PC_13  +     0.85937640415965 * S_PC_14
          +    -0.06138271078998 * S_PC_15  +      0.1938030316727 * S_PC_16
          +     0.07804776520336 * S_PC_17  +    -1.09437999462919 * S_PC_2
          +    -0.41042427670929 * S_PC_3  +     0.41399292129101 * S_PC_4
          +    -0.15565409173322 * S_PC_5  +     0.17868269952098 * S_PC_6
          +    -0.02576921888753 * S_PC_7  +     0.38854380533175 * S_PC_8
          +    -0.07735504596308 * S_PC_9  +    -0.35295170383727 *
        S_Year_Birth ;
   H14  =     0.04368609067765 * S_PC_1  +     0.37976440519635 * S_PC_10
          +    -0.69771643809086 * S_PC_11  +    -0.71232608576467 * S_PC_12
          +     0.79608037977429 * S_PC_13  +     0.16506021136243 * S_PC_14
          +     -0.0039906388458 * S_PC_15  +    -0.11495714358476 * S_PC_16
          +     0.52938088883283 * S_PC_17  +     0.33511180051287 * S_PC_2
          +    -0.12564500455882 * S_PC_3  +     0.41012234993818 * S_PC_4
          +     0.48470626278461 * S_PC_5  +    -0.24151100494349 * S_PC_6
          +      0.3467371231118 * S_PC_7  +    -0.18816547856508 * S_PC_8
          +    -0.18662279057133 * S_PC_9  +    -0.00309017760375 *
        S_Year_Birth ;
   H15  =     0.91853423521641 * S_PC_1  +    -0.48239932050051 * S_PC_10
          +    -0.24272827898405 * S_PC_11  +    -0.71536663613851 * S_PC_12
          +     -0.1314182451163 * S_PC_13  +    -0.11795982814623 * S_PC_14
          +     0.00161755426146 * S_PC_15  +     0.04899139354401 * S_PC_16
          +     0.53464493570325 * S_PC_17  +    -0.47531778464622 * S_PC_2
          +     0.41378563773052 * S_PC_3  +       0.387319318796 * S_PC_4
          +    -0.73158261568046 * S_PC_5  +    -0.14612596243075 * S_PC_6
          +    -0.48284476016458 * S_PC_7  +    -0.41782202704696 * S_PC_8
          +     0.49641564645767 * S_PC_9  +     0.06250518871044 *
        S_Year_Birth ;
   H16  =     0.70819105687391 * S_PC_1  +    -0.48513931652328 * S_PC_10
          +    -0.72348482492828 * S_PC_11  +    -0.28919233666817 * S_PC_12
          +     0.03554690029559 * S_PC_13  +    -0.18335863094816 * S_PC_14
          +     0.04948435041765 * S_PC_15  +      0.0232442481254 * S_PC_16
          +     0.09612244556808 * S_PC_17  +     0.24278682258458 * S_PC_2
          +     0.66667876657747 * S_PC_3  +    -0.42590544872659 * S_PC_4
          +     0.01277961498761 * S_PC_5  +      0.1340903514811 * S_PC_6
          +    -0.12551702696581 * S_PC_7  +     0.67711554270472 * S_PC_8
          +     0.59807247520609 * S_PC_9  +    -0.24911534258655 *
        S_Year_Birth ;
   H11  =    -0.95564978319691 + H11 ;
   H12  =     0.98269674890534 + H12 ;
   H13  =    -1.65400569197651 + H13 ;
   H14  =    -1.58663025393249 + H14 ;
   H15  =    -1.48054935824057 + H15 ;
   H16  =    -2.01558271631483 + H16 ;
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
   P_DepVar1  =     2.43727835295856 * H11  +     0.59490358065993 * H12
          +     1.32848776996251 * H13  +    -1.54926506480899 * H14
          +     1.54357123271319 * H15  +     1.82788795118491 * H16 ;
   P_DepVar1  =    -0.73131741718223 + P_DepVar1 ;
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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.68853093447805 * S_PC_1  +    -0.09785920988283 * S_PC_10
          +      0.2262793582311 * S_PC_11  +     0.42419074975693 * S_PC_12
          +    -0.54317932872036 * S_PC_13  +     0.53519140067144 * S_PC_14
          +     -0.1744270307344 * S_PC_15  +     0.18241008555072 * S_PC_16
          +    -0.25060854902398 * S_PC_17  +    -0.25611405781684 * S_PC_2
          +    -0.00673065558238 * S_PC_3  +     0.09320597300518 * S_PC_4
          +    -0.33203252569739 * S_PC_5  +     0.00590705460674 * S_PC_6
          +     0.06208675544437 * S_PC_7  +     0.33116857183597 * S_PC_8
          +     0.51908545428588 * S_PC_9  +     0.48276727358582 *
        S_Year_Birth ;
   H12  =     -0.0070856196308 * S_PC_1  +    -0.18611152691043 * S_PC_10
          +     0.22534257578583 * S_PC_11  +     0.33020451143395 * S_PC_12
          +    -0.24237020186597 * S_PC_13  +     0.10222438754058 * S_PC_14
          +      0.0802825515844 * S_PC_15  +    -0.03133698522933 * S_PC_16
          +     0.49736449030833 * S_PC_17  +     0.02917890141067 * S_PC_2
          +    -0.22205362046804 * S_PC_3  +    -0.13304083494845 * S_PC_4
          +    -0.21899822137746 * S_PC_5  +      0.3085123234701 * S_PC_6
          +     0.27342786456998 * S_PC_7  +      0.5031708850414 * S_PC_8
          +     0.01033471788288 * S_PC_9  +     0.03378228698717 *
        S_Year_Birth ;
   H13  =     -0.3421890003062 * S_PC_1  +     0.61136704886339 * S_PC_10
          +    -0.40153427369952 * S_PC_11  +    -0.33462028191119 * S_PC_12
          +     0.90217520388187 * S_PC_13  +    -0.33102298102444 * S_PC_14
          +     0.44286773830646 * S_PC_15  +     -0.1743340863053 * S_PC_16
          +     0.33888590637073 * S_PC_17  +     0.30033175969591 * S_PC_2
          +    -0.06198456990062 * S_PC_3  +     0.15206104869693 * S_PC_4
          +     0.19687028324531 * S_PC_5  +    -0.14869138924001 * S_PC_6
          +     0.23507525658256 * S_PC_7  +     0.01699882178668 * S_PC_8
          +     0.15026892128111 * S_PC_9  +     0.18169263767525 *
        S_Year_Birth ;
   H14  =    -0.89374260994687 * S_PC_1  +     0.01863540801984 * S_PC_10
          +     0.18088063260308 * S_PC_11  +      0.2353606921317 * S_PC_12
          +    -0.32363539668716 * S_PC_13  +     0.27108196537367 * S_PC_14
          +     0.06388106840059 * S_PC_15  +     0.05316247489981 * S_PC_16
          +    -0.16157724090976 * S_PC_17  +    -0.75647334309377 * S_PC_2
          +    -0.68065535863554 * S_PC_3  +     0.92989247031513 * S_PC_4
          +    -0.24569733058495 * S_PC_5  +    -0.37834002395712 * S_PC_6
          +     0.33331169771304 * S_PC_7  +     0.63251953048222 * S_PC_8
          +     0.25962175141496 * S_PC_9  +     -0.1729707105916 *
        S_Year_Birth ;
   H15  =     1.01217214844086 * S_PC_1  +    -0.35814334623573 * S_PC_10
          +    -0.29760011496376 * S_PC_11  +    -0.49659019896438 * S_PC_12
          +    -0.33762765910786 * S_PC_13  +    -0.09661228531408 * S_PC_14
          +     0.03016943976546 * S_PC_15  +     0.03847356369148 * S_PC_16
          +     0.23068042546991 * S_PC_17  +    -0.18214607129888 * S_PC_2
          +      0.2948848371398 * S_PC_3  +    -0.21096950783847 * S_PC_4
          +     -0.0076338973148 * S_PC_5  +      0.1810467647118 * S_PC_6
          +    -0.02747507656548 * S_PC_7  +    -0.12412383565914 * S_PC_8
          +     0.38941553651228 * S_PC_9  +    -0.01702181419661 *
        S_Year_Birth ;
   H11  =    -0.57247481264101 + H11 ;
   H12  =    -1.06998164899914 + H12 ;
   H13  =    -0.62403822966094 + H13 ;
   H14  =    -0.98843273802183 + H14 ;
   H15  =    -1.85576808009036 + H15 ;
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
   P_DepVar1  =     1.25623874740517 * H11  +      0.3331047690966 * H12
          +    -2.49839030053881 * H13  +     1.87210386082699 * H14
          +     2.90192651429203 * H15 ;
   P_DepVar1  =    -1.10300629264999 + P_DepVar1 ;
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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.21916437094975 * S_PC_1  +     0.46895145057244 * S_PC_10
          +     0.69761531323014 * S_PC_11  +    -0.30533094236753 * S_PC_12
          +    -0.36327982586722 * S_PC_13  +     0.19077464191003 * S_PC_14
          +    -0.21149083974554 * S_PC_15  +     0.01556863915224 * S_PC_16
          +    -0.16565778772884 * S_PC_17  +    -0.47244513640232 * S_PC_2
          +    -0.48362143582746 * S_PC_3  +     -0.6605280181533 * S_PC_4
          +     1.75291826116994 * S_PC_5  +    -0.14058141705537 * S_PC_6
          +     0.57374810834101 * S_PC_7  +    -1.68225303594881 * S_PC_8
          +    -0.28316700480518 * S_PC_9  +     0.13982759935686 *
        S_Year_Birth ;
   H12  =     0.12101363568223 * S_PC_1  +    -0.31241856262881 * S_PC_10
          +     0.27517795843322 * S_PC_11  +     0.30784385281478 * S_PC_12
          +    -0.68118348953077 * S_PC_13  +     0.38168910932118 * S_PC_14
          +    -0.24780681116297 * S_PC_15  +     0.17546547375236 * S_PC_16
          +    -0.07928517707643 * S_PC_17  +    -0.38048211293088 * S_PC_2
          +    -0.32652116779986 * S_PC_3  +      0.1905705021635 * S_PC_4
          +     0.12972604290011 * S_PC_5  +      0.0372364587024 * S_PC_6
          +     0.05952907527719 * S_PC_7  +     0.26219877622748 * S_PC_8
          +     0.14791742323382 * S_PC_9  +     0.26135521159879 *
        S_Year_Birth ;
   H13  =     0.64533167919436 * S_PC_1  +    -0.72127290093209 * S_PC_10
          +     0.89051319575822 * S_PC_11  +     0.97129300386918 * S_PC_12
          +    -1.18593762568769 * S_PC_13  +     0.47068229576395 * S_PC_14
          +    -0.69039875931197 * S_PC_15  +    -0.00791179223736 * S_PC_16
          +    -0.78504365089536 * S_PC_17  +    -0.59206299847209 * S_PC_2
          +    -0.12379110893706 * S_PC_3  +    -0.05437594004394 * S_PC_4
          +    -0.65391054090833 * S_PC_5  +      0.2995761236398 * S_PC_6
          +    -0.55231380268006 * S_PC_7  +    -0.21239257615541 * S_PC_8
          +    -0.11441544666014 * S_PC_9  +    -0.23347547419068 *
        S_Year_Birth ;
   H14  =      1.0360241934974 * S_PC_1  +    -0.39202225240717 * S_PC_10
          +    -0.32200625669175 * S_PC_11  +    -0.61609290980998 * S_PC_12
          +    -0.31436369432897 * S_PC_13  +    -0.00486117515969 * S_PC_14
          +    -0.02713823284007 * S_PC_15  +      0.0791834118799 * S_PC_16
          +     0.20897685763318 * S_PC_17  +    -0.22176247499996 * S_PC_2
          +      0.4739224953207 * S_PC_3  +     -0.3176011848773 * S_PC_4
          +     0.05774699044917 * S_PC_5  +    -0.05726336170428 * S_PC_6
          +     -0.0914058382418 * S_PC_7  +    -0.31886775814838 * S_PC_8
          +     0.43994345953404 * S_PC_9  +     0.10106394892699 *
        S_Year_Birth ;
   H11  =    -0.55123213858302 + H11 ;
   H12  =    -0.75869313709114 + H12 ;
   H13  =     1.40273224689344 + H13 ;
   H14  =    -2.25765100137563 + H14 ;
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
   P_DepVar1  =    -2.64261520585079 * H11  +     2.97929850273952 * H12
          +      1.9009978796506 * H13  +      2.8189101465563 * H14 ;
   P_DepVar1  =     -1.5309097146626 + P_DepVar1 ;
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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.19743350968758 * S_PC_1  +     0.30445645806298 * S_PC_10
          +    -0.29319213945098 * S_PC_11  +    -0.25119278206844 * S_PC_12
          +     0.58266759398859 * S_PC_13  +    -0.27174585445956 * S_PC_14
          +     0.22659187495583 * S_PC_15  +      0.0345118108645 * S_PC_16
          +     0.12263049485603 * S_PC_17  +     0.19964403857859 * S_PC_2
          +     0.15954583818685 * S_PC_3  +     -0.2857245627066 * S_PC_4
          +     0.06098551342127 * S_PC_5  +    -0.08058581454455 * S_PC_6
          +     0.03452248935562 * S_PC_7  +    -0.14856891517951 * S_PC_8
          +    -0.23636852409867 * S_PC_9  +    -0.19324045106995 *
        S_Year_Birth ;
   H12  =     1.14358504176708 * S_PC_1  +    -0.36192369706387 * S_PC_10
          +    -0.43744112108977 * S_PC_11  +    -0.71275370600445 * S_PC_12
          +    -0.34045125272447 * S_PC_13  +    -0.15036565546979 * S_PC_14
          +     0.09646564503434 * S_PC_15  +      0.0305829416967 * S_PC_16
          +     0.24019272351574 * S_PC_17  +      -0.293912312459 * S_PC_2
          +     0.56149100357954 * S_PC_3  +    -0.49607477801031 * S_PC_4
          +     0.06419630336205 * S_PC_5  +    -0.04699602508661 * S_PC_6
          +    -0.21664449801506 * S_PC_7  +    -0.22336257677766 * S_PC_8
          +       0.454170642483 * S_PC_9  +     0.00592873995939 *
        S_Year_Birth ;
   H13  =    -0.22672349443199 * S_PC_1  +     -0.2582497841995 * S_PC_10
          +    -0.17326402021021 * S_PC_11  +     0.30935515268934 * S_PC_12
          +    -0.24201742001607 * S_PC_13  +     0.54976933292529 * S_PC_14
          +     0.10932488301679 * S_PC_15  +     0.96661941192331 * S_PC_16
          +    -0.08469518132767 * S_PC_17  +    -0.81412040243848 * S_PC_2
          +    -0.25637624627426 * S_PC_3  +    -0.17164857394469 * S_PC_4
          +     -0.9026842943155 * S_PC_5  +     0.05018319109787 * S_PC_6
          +     0.88423272215876 * S_PC_7  +     0.43376749549251 * S_PC_8
          +     -0.1720661342962 * S_PC_9  +    -0.75152134262635 *
        S_Year_Birth ;
   H11  =      0.3458013028559 + H11 ;
   H12  =    -2.55079965313883 + H12 ;
   H13  =    -1.09335829129594 + H13 ;
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
   P_DepVar1  =     -3.3783400757259 * H11  +     2.62212015591933 * H12
          +     1.35325151350957 * H13 ;
   P_DepVar1  =     0.02395615191895 + P_DepVar1 ;
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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.44094470166711 * S_PC_1  +     0.68660530428767 * S_PC_10
          +     0.56608797558753 * S_PC_11  +     0.61148539981493 * S_PC_12
          +     0.18037030100591 * S_PC_13  +     0.19531632705288 * S_PC_14
          +      0.0003629541091 * S_PC_15  +    -0.03105120453616 * S_PC_16
          +    -0.42128929252507 * S_PC_17  +     0.79369019532415 * S_PC_2
          +    -0.38795036976007 * S_PC_3  +    -0.35964235673334 * S_PC_4
          +     0.90131484671609 * S_PC_5  +     0.12092148031985 * S_PC_6
          +     0.41583181976694 * S_PC_7  +      0.1566777868592 * S_PC_8
          +    -0.36198355157816 * S_PC_9  +     0.00279552011076 *
        S_Year_Birth ;
   H12  =     0.11190030029275 * S_PC_1  +    -0.29636974225573 * S_PC_10
          +     0.37568388726882 * S_PC_11  +     0.29182945572417 * S_PC_12
          +    -0.78800810953859 * S_PC_13  +     0.42594081574646 * S_PC_14
          +    -0.22624149412265 * S_PC_15  +     0.13647529105423 * S_PC_16
          +    -0.20084479162417 * S_PC_17  +     -0.2093211124908 * S_PC_2
          +    -0.20805948514064 * S_PC_3  +     0.03034276945993 * S_PC_4
          +     0.03714133900928 * S_PC_5  +     0.17393183962873 * S_PC_6
          +     0.19364981025256 * S_PC_7  +     0.25830832428745 * S_PC_8
          +     0.24814472238039 * S_PC_9  +     0.09053058930338 *
        S_Year_Birth ;
   H11  =     1.96528258256159 + H11 ;
   H12  =      -0.562350157484 + H12 ;
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
   P_DepVar1  =    -2.41029239659269 * H11  +     3.16181454310684 * H12 ;
   P_DepVar1  =    -0.76061348538912 + P_DepVar1 ;
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
   S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.6294364555292E-15 +     0.29892679459111 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2815536802709E-15 +     0.82177445188012 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2785706580609E-15 +     0.85631006900792 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1387290416389E-15 +     0.88807871240911 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4589830727918E-15 +     0.89679107329648 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2822189123966E-15 +     0.90339654117007 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.2248121649466E-16 +     0.92993702465165 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6897046725231E-15 +     0.95121394314649 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  3.5787742074362E-15 +     0.99887425068205 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4113141631876E-15 +     0.54372869580717 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2104329668238E-15 +     0.55367221144899 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.9509679191637E-15 +     0.63694139531868 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7850489168894E-15 +     0.66667841601593 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5058392834001E-15 +     0.70535593591745 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  2.9182665890544E-16 +     0.74929827240347 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3914410530745E-15 +     0.77166055611422 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.1831576010329E-15 +     0.80828482156853 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.10532645439094 * S_PC_1  +     0.09082172457189 * S_PC_10
          +    -0.03488951171649 * S_PC_11  +    -0.02147769059752 * S_PC_12
          +     0.14287146727966 * S_PC_13  +    -0.05934163676384 * S_PC_14
          +     0.03916978669378 * S_PC_15  +    -0.03125843160394 * S_PC_16
          +     0.01904558354791 * S_PC_17  +     0.09947482126136 * S_PC_2
          +     0.02059526786086 * S_PC_3  +    -0.02543485656441 * S_PC_4
          +     0.06130718674937 * S_PC_5  +    -0.02868633255458 * S_PC_6
          +    -0.01816056471828 * S_PC_7  +    -0.04772003918488 * S_PC_8
          +    -0.06444887969031 * S_PC_9  +    -0.00593514311408 *
        S_Year_Birth ;
   H11  =    -0.86045978291832 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -22.9173253073041 * H11 ;
   P_DepVar1  =    -18.8201593249252 + P_DepVar1 ;
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
