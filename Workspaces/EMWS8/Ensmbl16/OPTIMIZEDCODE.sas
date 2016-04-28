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
else _D13=(MonthsAsCustomer-84.24599831508)/16.9420859404964;
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
-0.140458888*AcceptedCmp1_1_+
0.1404588882*AcceptedCmp1_2_+
-0.057568896*AcceptedCmp2_1_+
0.0575688956*AcceptedCmp2_2_+
-0.021433552*AcceptedCmp3_1_+
0.0214335523*AcceptedCmp3_2_+
-0.097063732*AcceptedCmp4_1_+
0.0970637321*AcceptedCmp4_2_+
-0.168200899*AcceptedCmp5_1_+
0.1682008988*AcceptedCmp5_2_+
0.0084781031*Complain_1_+
-0.008478103*Complain_2_+
-0.038003287*Education_1_+
-0.057927145*Education_2_+
0.0164465972*Education_3_+
0.0194651919*Education_4_+
0.0146880445*Education_5_+
-0.063743265*HigherEducationBinary_1_+
0.0637432653*HigherEducationBinary_2_+
-0.003890002*Marital_Status_1_+
-0.004071985*Marital_Status_2_+
-0.001996769*Marital_Status_3_+
0.002689363*Marital_Status_4_+
0.0166908645*Marital_Status_5_+
0.1763665288*_D1+
0.0470046571*_D2+
0.2648044061*_D3+
0.262739808*_D4+
-0.183241011*_D5+
0.2837958276*_D6+
0.1852431093*_D7+
0.1884751965*_D8+
0.1587298169*_D9+
0.24267182*_D10+
0.1867327524*_D11+
0.2531369639*_D12+
0.0321043005*_D13+
0.2527844847*_D14+
-0.045043167*_D15+
0.2563398668*_D16+
0.2200037385*_D17+
0.1832297708*_D18+
-0.171105825*_D19+
0.1179155237*_D20+
0.2531686898*_D21+
0.0000908071*_D22+
-0.044014026*_D23;
/****************************************/
* Principal Component 10;
/****************************************/
;
label PC_10 = "Principal Component 10";
PC_10 =
-0.427224572*AcceptedCmp1_1_+
0.4272245721*AcceptedCmp1_2_+
-0.056551106*AcceptedCmp2_1_+
0.0565511065*AcceptedCmp2_2_+
0.1971218688*AcceptedCmp3_1_+
-0.197121869*AcceptedCmp3_2_+
0.3258134287*AcceptedCmp4_1_+
-0.325813429*AcceptedCmp4_2_+
-0.022434333*AcceptedCmp5_1_+
0.0224343333*AcceptedCmp5_2_+
0.0303262114*Complain_1_+
-0.030326211*Complain_2_+
0.04443513*Education_1_+
-0.070081375*Education_2_+
0.0452767947*Education_3_+
-0.048834309*Education_4_+
-0.014400848*Education_5_+
0.0029603386*HigherEducationBinary_1_+
-0.002960339*HigherEducationBinary_2_+
0.1536672665*Marital_Status_1_+
-0.005774759*Marital_Status_2_+
-0.210874897*Marital_Status_3_+
0.0921304029*Marital_Status_4_+
0.0260492282*Marital_Status_5_+
-0.027412049*_D1+
0.1489432411*_D2+
0.0266005107*_D3+
0.0061347884*_D4+
0.024583495*_D5+
-0.037649615*_D6+
0.0213235766*_D7+
-0.005852523*_D8+
-0.001912774*_D9+
-0.047811995*_D10+
0.030657933*_D11+
-0.042174374*_D12+
0.0666210171*_D13+
-0.01644653*_D14+
0.1223314456*_D15+
0.0194189934*_D16+
0.0310498357*_D17+
0.051631578*_D18+
0.0299013739*_D19+
-0.267552361*_D20+
-0.065745313*_D21+
0.2989199403*_D22+
0.1607221363*_D23;
/****************************************/
* Principal Component 11;
/****************************************/
;
label PC_11 = "Principal Component 11";
PC_11 =
-0.006284082*AcceptedCmp1_1_+
0.0062840821*AcceptedCmp1_2_+
-0.143385735*AcceptedCmp2_1_+
0.1433857353*AcceptedCmp2_2_+
0.1324381842*AcceptedCmp3_1_+
-0.132438184*AcceptedCmp3_2_+
0.1695277239*AcceptedCmp4_1_+
-0.169527724*AcceptedCmp4_2_+
-0.0638527*AcceptedCmp5_1_+
0.0638527001*AcceptedCmp5_2_+
0.0020639416*Complain_1_+
-0.002063942*Complain_2_+
-0.199430781*Education_1_+
0.2396774234*Education_2_+
-0.273053337*Education_3_+
0.1437414923*Education_4_+
0.2472380957*Education_5_+
-0.052162497*HigherEducationBinary_1_+
0.052162497*HigherEducationBinary_2_+
-0.305522204*Marital_Status_1_+
0.2934121003*Marital_Status_2_+
-0.055867283*Marital_Status_3_+
-0.002414435*Marital_Status_4_+
-0.16562818*Marital_Status_5_+
-0.067472598*_D1+
-0.257936836*_D2+
0.023478841*_D3+
-0.088533722*_D4+
0.1696794781*_D5+
0.0535231357*_D6+
0.0046826945*_D7+
-0.02221624*_D8+
-0.066118449*_D9+
0.0566027973*_D10+
-0.002636118*_D11+
0.0709549044*_D12+
0.3377970996*_D13+
0.0014306746*_D14+
0.1084202375*_D15+
0.0525321211*_D16+
-0.022623499*_D17+
0.0909717544*_D18+
0.1916910533*_D19+
0.1330611441*_D20+
0.0524787718*_D21+
-0.080500534*_D22+
-0.252431647*_D23;
/****************************************/
* Principal Component 12;
/****************************************/
;
label PC_12 = "Principal Component 12";
PC_12 =
0.0505944773*AcceptedCmp1_1_+
-0.050594477*AcceptedCmp1_2_+
0.1435449098*AcceptedCmp2_1_+
-0.14354491*AcceptedCmp2_2_+
-0.026327963*AcceptedCmp3_1_+
0.0263279626*AcceptedCmp3_2_+
-0.057920662*AcceptedCmp4_1_+
0.0579206623*AcceptedCmp4_2_+
-0.11994584*AcceptedCmp5_1_+
0.1199458399*AcceptedCmp5_2_+
0.0125275421*Complain_1_+
-0.012527542*Complain_2_+
0.0245292784*Education_1_+
0.0058997846*Education_2_+
0.1153950216*Education_3_+
-0.053258585*Education_4_+
-0.113296501*Education_5_+
0.024789574*HigherEducationBinary_1_+
-0.024789574*HigherEducationBinary_2_+
-0.135838024*Marital_Status_1_+
0.0212916957*Marital_Status_2_+
-0.606631412*Marital_Status_3_+
0.6288530315*Marital_Status_4_+
0.081742382*Marital_Status_5_+
0.038564179*_D1+
0.104389528*_D2+
-0.027198554*_D3+
-0.029498052*_D4+
0.0134784681*_D5+
-0.008178931*_D6+
0.0091315797*_D7+
0.0033017315*_D8+
0.0015443221*_D9+
-0.002193831*_D10+
-0.006990663*_D11+
-0.014290435*_D12+
0.1000580567*_D13+
-0.034938639*_D14+
0.0019358961*_D15+
-0.008463501*_D16+
-0.047851547*_D17+
0.0221526792*_D18+
0.0715763701*_D19+
0.1555193184*_D20+
-0.009977151*_D21+
-0.196190208*_D22+
-0.00143379*_D23;
/****************************************/
* Principal Component 13;
/****************************************/
;
label PC_13 = "Principal Component 13";
PC_13 =
0.1168365108*AcceptedCmp1_1_+
-0.116836511*AcceptedCmp1_2_+
0.0757071355*AcceptedCmp2_1_+
-0.075707135*AcceptedCmp2_2_+
-0.057045916*AcceptedCmp3_1_+
0.0570459156*AcceptedCmp3_2_+
-0.147546991*AcceptedCmp4_1_+
0.1475469912*AcceptedCmp4_2_+
-0.008243735*AcceptedCmp5_1_+
0.0082437347*AcceptedCmp5_2_+
0.00718411*Complain_1_+
-0.00718411*Complain_2_+
-0.067870126*Education_1_+
0.0745779105*Education_2_+
-0.112617493*Education_3_+
0.45706646*Education_4_+
-0.24781824*Education_5_+
-0.021381508*HigherEducationBinary_1_+
0.0213815079*HigherEducationBinary_2_+
-0.122856056*Marital_Status_1_+
0.0381836579*Marital_Status_2_+
-0.068364219*Marital_Status_3_+
0.1592933502*Marital_Status_4_+
-0.123336857*Marital_Status_5_+
0.0269573408*_D1+
-0.128210706*_D2+
0.0085564136*_D3+
-0.006689656*_D4+
-0.012567649*_D5+
0.0254314151*_D6+
0.009538763*_D7+
0.0329820684*_D8+
0.0446770688*_D9+
-0.002242114*_D10+
0.0353048792*_D11+
0.0303760802*_D12+
-0.01950177*_D13+
-0.003106486*_D14+
-0.019520217*_D15+
0.0201335496*_D16+
-0.009643051*_D17+
0.0387420441*_D18+
0.0205088271*_D19+
-0.458067721*_D20+
0.044224532*_D21+
0.5572614288*_D22+
-0.078086786*_D23;
/****************************************/
* Principal Component 14;
/****************************************/
;
label PC_14 = "Principal Component 14";
PC_14 =
0.0432755382*AcceptedCmp1_1_+
-0.043275538*AcceptedCmp1_2_+
-0.024975772*AcceptedCmp2_1_+
0.0249757718*AcceptedCmp2_2_+
0.0469157734*AcceptedCmp3_1_+
-0.046915773*AcceptedCmp3_2_+
0.1376733226*AcceptedCmp4_1_+
-0.137673323*AcceptedCmp4_2_+
-0.242686036*AcceptedCmp5_1_+
0.2426860357*AcceptedCmp5_2_+
0.0141486991*Complain_1_+
-0.014148699*Complain_2_+
0.0480096438*Education_1_+
-0.060401629*Education_2_+
0.0025827565*Education_3_+
0.4920950957*Education_4_+
-0.444777911*Education_5_+
0.0111533418*HigherEducationBinary_1_+
-0.011153342*HigherEducationBinary_2_+
-0.12821226*Marital_Status_1_+
0.0568682039*Marital_Status_2_+
0.105481017*Marital_Status_3_+
-0.234345947*Marital_Status_4_+
0.3879059242*Marital_Status_5_+
0.0138547709*_D1+
0.186185346*_D2+
-0.020720999*_D3+
0.0025257744*_D4+
0.022059495*_D5+
-0.032616305*_D6+
0.0010705713*_D7+
0.0008216955*_D8+
0.0473195465*_D9+
-0.058144142*_D10+
-0.008372542*_D11+
-0.027303553*_D12+
0.0580284423*_D13+
-0.054436514*_D14+
0.1034219519*_D15+
-0.018115411*_D16+
-0.019962262*_D17+
0.0258375412*_D18+
0.0567679846*_D19+
0.1188749741*_D20+
-0.032996965*_D21+
-0.223567317*_D22+
0.1483093232*_D23;
/****************************************/
* Principal Component 15;
/****************************************/
;
label PC_15 = "Principal Component 15";
PC_15 =
0.2401403825*AcceptedCmp1_1_+
-0.240140383*AcceptedCmp1_2_+
0.0756046324*AcceptedCmp2_1_+
-0.075604632*AcceptedCmp2_2_+
0.0342576128*AcceptedCmp3_1_+
-0.034257613*AcceptedCmp3_2_+
0.0512325807*AcceptedCmp4_1_+
-0.051232581*AcceptedCmp4_2_+
-0.345125228*AcceptedCmp5_1_+
0.3451252281*AcceptedCmp5_2_+
0.0334718757*Complain_1_+
-0.033471876*Complain_2_+
-0.042725028*Education_1_+
0.11349975*Education_2_+
0.0949217496*Education_3_+
-0.435349503*Education_4_+
0.2504206092*Education_5_+
0.0211030866*HigherEducationBinary_1_+
-0.021103087*HigherEducationBinary_2_+
-0.123918158*Marital_Status_1_+
-0.035789355*Marital_Status_2_+
0.0805295774*Marital_Status_3_+
-0.098365515*Marital_Status_4_+
0.370227515*Marital_Status_5_+
0.0029633696*_D1+
0.0936488854*_D2+
-0.026336064*_D3+
-0.011170127*_D4+
0.0460391701*_D5+
0.0214798623*_D6+
-0.009016454*_D7+
-0.004123505*_D8+
0.0650733551*_D9+
0.0026624464*_D10+
0.0326007636*_D11+
0.0246884169*_D12+
0.1097605822*_D13+
-0.010147606*_D14+
0.0420324711*_D15+
-0.002194007*_D16+
-0.054817191*_D17+
0.0068990898*_D18+
0.0587837419*_D19+
-0.203317028*_D20+
0.0332194475*_D21+
0.3120339305*_D22+
0.0056477518*_D23;
/****************************************/
* Principal Component 16;
/****************************************/
;
label PC_16 = "Principal Component 16";
PC_16 =
0.0831695965*AcceptedCmp1_1_+
-0.083169597*AcceptedCmp1_2_+
-0.007138276*AcceptedCmp2_1_+
0.0071382757*AcceptedCmp2_2_+
-0.019416622*AcceptedCmp3_1_+
0.0194166217*AcceptedCmp3_2_+
-0.034172192*AcceptedCmp4_1_+
0.0341721919*AcceptedCmp4_2_+
-0.013270248*AcceptedCmp5_1_+
0.0132702479*AcceptedCmp5_2_+
-0.01311247*Complain_1_+
0.0131124704*Complain_2_+
-0.148738095*Education_1_+
0.2126400216*Education_2_+
-0.039000907*Education_3_+
0.1046021054*Education_4_+
-0.027342921*Education_5_+
-0.021305492*HigherEducationBinary_1_+
0.0213054921*HigherEducationBinary_2_+
0.7491801701*Marital_Status_1_+
-0.046450087*Marital_Status_2_+
-0.290876822*Marital_Status_3_+
-0.219406917*Marital_Status_4_+
0.0594371938*Marital_Status_5_+
-0.003537272*_D1+
0.0681641043*_D2+
-0.094885283*_D3+
-0.089653134*_D4+
0.0590401935*_D5+
0.0744057419*_D6+
0.0873234845*_D7+
0.0919496761*_D8+
0.0405612856*_D9+
0.0597296012*_D10+
0.0778757951*_D11+
0.0548000164*_D12+
0.2363199749*_D13+
-0.014794654*_D14+
-0.034054653*_D15+
-0.048511761*_D16+
-0.140097546*_D17+
-0.069720455*_D18+
0.1325809783*_D19+
0.0209771163*_D20+
0.1303271255*_D21+
-0.011298336*_D22+
-0.144328939*_D23;
/****************************************/
* Principal Component 17;
/****************************************/
;
label PC_17 = "Principal Component 17";
PC_17 =
-0.184306682*AcceptedCmp1_1_+
0.1843066817*AcceptedCmp1_2_+
-0.006412454*AcceptedCmp2_1_+
0.0064124536*AcceptedCmp2_2_+
-0.0666242*AcceptedCmp3_1_+
0.0666241999*AcceptedCmp3_2_+
-0.07854715*AcceptedCmp4_1_+
0.0785471498*AcceptedCmp4_2_+
0.2831399709*AcceptedCmp5_1_+
-0.283139971*AcceptedCmp5_2_+
-0.017192504*Complain_1_+
0.0171925038*Complain_2_+
-0.261309786*Education_1_+
0.4663453583*Education_2_+
0.0091318551*Education_3_+
-0.017573142*Education_4_+
-0.004356253*Education_5_+
0.0107483742*HigherEducationBinary_1_+
-0.010748374*HigherEducationBinary_2_+
-0.285195021*Marital_Status_1_+
0.0174722482*Marital_Status_2_+
0.0336853979*Marital_Status_3_+
-0.012648959*Marital_Status_4_+
0.401348429*Marital_Status_5_+
0.0133837678*_D1+
0.263663527*_D2+
-0.072145196*_D3+
-0.066032229*_D4+
-0.239088771*_D5+
0.0212550762*_D6+
0.0408606988*_D7+
0.0591773807*_D8+
0.0321352025*_D9+
0.0033114052*_D10+
0.023590372*_D11+
0.0148642095*_D12+
0.1256685453*_D13+
0.0032701333*_D14+
-0.168499651*_D15+
-0.06533333*_D16+
-0.066308597*_D17+
-0.118495177*_D18+
-0.015723372*_D19+
-0.047469853*_D20+
0.0763487899*_D21+
-0.003169873*_D22+
0.0174163752*_D23;
/****************************************/
* Principal Component 2;
/****************************************/
;
label PC_2 = "Principal Component 2";
PC_2 =
0.261355008*AcceptedCmp1_1_+
-0.261355008*AcceptedCmp1_2_+
0.2627927001*AcceptedCmp2_1_+
-0.2627927*AcceptedCmp2_2_+
0.1742769022*AcceptedCmp3_1_+
-0.174276902*AcceptedCmp3_2_+
0.2314100517*AcceptedCmp4_1_+
-0.231410052*AcceptedCmp4_2_+
0.2493970819*AcceptedCmp5_1_+
-0.249397082*AcceptedCmp5_2_+
-0.015057931*Complain_1_+
0.0150579314*Complain_2_+
-0.164888504*Education_1_+
-0.108570621*Education_2_+
0.1008119457*Education_3_+
0.0458312774*Education_4_+
0.0017571635*Education_5_+
-0.202426623*HigherEducationBinary_1_+
0.2024266234*HigherEducationBinary_2_+
-0.009030743*Marital_Status_1_+
-0.01883885*Marital_Status_2_+
0.0040899293*Marital_Status_3_+
0.0246572814*Marital_Status_4_+
-0.000840591*Marital_Status_5_+
-0.403345485*_D1+
0.0940183632*_D2+
0.0976807994*_D3+
0.0840318425*_D4+
-0.091460589*_D5+
0.0578258597*_D6+
0.1203861379*_D7+
0.1117774617*_D8+
0.0348656849*_D9+
0.0711297128*_D10+
0.097115059*_D11+
0.0095394286*_D12+
0.0530629695*_D13+
0.0500541593*_D14+
0.0550068018*_D15+
0.0756195049*_D16+
0.1079264635*_D17+
0.0800528878*_D18+
-0.090394432*_D19+
0.026572954*_D20+
0.0570213985*_D21+
-0.008654662*_D22+
0.1066009855*_D23;
/****************************************/
* Principal Component 3;
/****************************************/
;
label PC_3 = "Principal Component 3";
PC_3 =
0.0213563865*AcceptedCmp1_1_+
-0.021356387*AcceptedCmp1_2_+
0.1537892705*AcceptedCmp2_1_+
-0.153789271*AcceptedCmp2_2_+
0.0506556371*AcceptedCmp3_1_+
-0.050655637*AcceptedCmp3_2_+
0.149620014*AcceptedCmp4_1_+
-0.149620014*AcceptedCmp4_2_+
0.0397019482*AcceptedCmp5_1_+
-0.039701948*AcceptedCmp5_2_+
-0.052917357*Complain_1_+
0.0529173567*Complain_2_+
0.4091590172*Education_1_+
0.2108138889*Education_2_+
-0.168637127*Education_3_+
-0.051369914*Education_4_+
-0.133365585*Education_5_+
0.4718759037*HigherEducationBinary_1_+
-0.471875904*HigherEducationBinary_2_+
-0.014214454*Marital_Status_1_+
-0.029437331*Marital_Status_2_+
0.0497651408*Marital_Status_3_+
0.0028676259*Marital_Status_4_+
-0.017291776*Marital_Status_5_+
-0.128042651*_D1+
-0.135160274*_D2+
0.0177473221*_D3+
-0.009950227*_D4+
-0.036656148*_D5+
0.0483544153*_D6+
0.1542505187*_D7+
0.1514146405*_D8+
0.0908861891*_D9+
0.0955021937*_D10+
0.1611134116*_D11+
-0.04815829*_D12+
0.0312693289*_D13+
0.0534945927*_D14+
-0.090368563*_D15+
0.0127885763*_D16+
0.0209524311*_D17+
-0.034217124*_D18+
-0.084391802*_D19+
0.01701725*_D20+
0.0505533586*_D21+
-0.015994215*_D22+
-0.167589196*_D23;
/****************************************/
* Principal Component 4;
/****************************************/
;
label PC_4 = "Principal Component 4";
PC_4 =
0.0898577315*AcceptedCmp1_1_+
-0.089857731*AcceptedCmp1_2_+
-0.08720437*AcceptedCmp2_1_+
0.0872043703*AcceptedCmp2_2_+
-0.32008852*AcceptedCmp3_1_+
0.3200885201*AcceptedCmp3_2_+
0.0300103843*AcceptedCmp4_1_+
-0.030010384*AcceptedCmp4_2_+
0.1836156216*AcceptedCmp5_1_+
-0.183615622*AcceptedCmp5_2_+
-0.081929484*Complain_1_+
0.0819294838*Complain_2_+
0.1230319497*Education_1_+
0.0075420397*Education_2_+
-0.072320674*Education_3_+
-0.04957966*Education_4_+
0.0396695222*Education_5_+
0.1128863279*HigherEducationBinary_1_+
-0.112886328*HigherEducationBinary_2_+
0.0270439727*Marital_Status_1_+
-0.023296918*Marital_Status_2_+
-0.009122216*Marital_Status_3_+
0.0090500442*Marital_Status_4_+
0.0189685215*Marital_Status_5_+
0.0269786175*_D1+
0.1102049696*_D2+
0.1598520092*_D3+
-0.026273657*_D4+
0.0323482919*_D5+
0.0105033697*_D6+
-0.051231979*_D7+
-0.063380288*_D8+
0.2110851533*_D9+
-0.108495726*_D10+
-0.06463181*_D11+
0.0782366105*_D12+
0.2233542441*_D13+
0.0263929507*_D14+
0.4195135243*_D15+
0.1958354865*_D16+
0.07471902*_D17+
0.3168009552*_D18+
0.2670429086*_D19+
-0.019031409*_D20+
-0.018243957*_D21+
0.0352667825*_D22+
0.2677075332*_D23;
/****************************************/
* Principal Component 5;
/****************************************/
;
label PC_5 = "Principal Component 5";
PC_5 =
0.0676793607*AcceptedCmp1_1_+
-0.067679361*AcceptedCmp1_2_+
-0.080650154*AcceptedCmp2_1_+
0.080650154*AcceptedCmp2_2_+
0.45432519*AcceptedCmp3_1_+
-0.45432519*AcceptedCmp3_2_+
-0.35304252*AcceptedCmp4_1_+
0.3530425205*AcceptedCmp4_2_+
0.053019269*AcceptedCmp5_1_+
-0.053019269*AcceptedCmp5_2_+
-0.013464932*Complain_1_+
0.0134649319*Complain_2_+
0.1302112201*Education_1_+
0.0250645069*Education_2_+
-0.208927027*Education_3_+
0.0418499193*Education_4_+
0.1124663997*Education_5_+
0.1283450845*HigherEducationBinary_1_+
-0.128345085*HigherEducationBinary_2_+
0.0552972512*Marital_Status_1_+
0.0096829906*Marital_Status_2_+
-0.070300026*Marital_Status_3_+
-0.017474271*Marital_Status_4_+
0.0873999876*Marital_Status_5_+
-0.084973146*_D1+
0.1552416829*_D2+
0.078777442*_D3+
0.0443651285*_D4+
-0.091495121*_D5+
-0.004503983*_D6+
-0.082773732*_D7+
-0.087599434*_D8+
-0.127162843*_D9+
-0.077844766*_D10+
-0.065826578*_D11+
0.0907156241*_D12+
0.0467293224*_D13+
-0.043275683*_D14+
0.1171611985*_D15+
0.0360529931*_D16+
0.1222844715*_D17+
0.1093709865*_D18+
0.0314375194*_D19+
-0.003914177*_D20+
-0.022442902*_D21+
0.0018640957*_D22+
0.2010344481*_D23;
/****************************************/
* Principal Component 6;
/****************************************/
;
label PC_6 = "Principal Component 6";
PC_6 =
0.0013015356*AcceptedCmp1_1_+
-0.001301536*AcceptedCmp1_2_+
0.0162056172*AcceptedCmp2_1_+
-0.016205617*AcceptedCmp2_2_+
0.0092693179*AcceptedCmp3_1_+
-0.009269318*AcceptedCmp3_2_+
-0.034783488*AcceptedCmp4_1_+
0.0347834879*AcceptedCmp4_2_+
0.0583573504*AcceptedCmp5_1_+
-0.05835735*AcceptedCmp5_2_+
0.6791473729*Complain_1_+
-0.679147373*Complain_2_+
0.0028596095*Education_1_+
0.0787729722*Education_2_+
0.0802408088*Education_3_+
-0.045552675*Education_4_+
-0.092567787*Education_5_+
0.0434425095*HigherEducationBinary_1_+
-0.04344251*HigherEducationBinary_2_+
0.0120748234*Marital_Status_1_+
-0.024040043*Marital_Status_2_+
0.0584742338*Marital_Status_3_+
-0.013785781*Marital_Status_4_+
-0.058771539*Marital_Status_5_+
-0.017249177*_D1+
-0.066863954*_D2+
0.0192308701*_D3+
-0.03717591*_D4+
-0.004228503*_D5+
0.0113913962*_D6+
-0.00330908*_D7+
0.019864785*_D8+
0.0686891403*_D9+
-0.004827238*_D10+
0.0240856319*_D11+
0.0083530121*_D12+
0.0413489403*_D13+
-0.004409985*_D14+
0.0624158526*_D15+
0.0296752514*_D16+
0.0003443691*_D17+
0.05692375*_D18+
0.0879181852*_D19+
0.0205343508*_D20+
0.0078473176*_D21+
-0.038123423*_D22+
0.0291869021*_D23;
/****************************************/
* Principal Component 7;
/****************************************/
;
label PC_7 = "Principal Component 7";
PC_7 =
-0.016877765*AcceptedCmp1_1_+
0.0168777649*AcceptedCmp1_2_+
-0.120651675*AcceptedCmp2_1_+
0.1206516755*AcceptedCmp2_2_+
0.1645292791*AcceptedCmp3_1_+
-0.164529279*AcceptedCmp3_2_+
-0.139803363*AcceptedCmp4_1_+
0.1398033627*AcceptedCmp4_2_+
0.0520003255*AcceptedCmp5_1_+
-0.052000326*AcceptedCmp5_2_+
-0.136742395*Complain_1_+
0.1367423953*Complain_2_+
-0.042423109*Education_1_+
0.0457372822*Education_2_+
0.5624565732*Education_3_+
-0.262462793*Education_4_+
-0.440386061*Education_5_+
-0.013821089*HigherEducationBinary_1_+
0.0138210886*HigherEducationBinary_2_+
-0.076947997*Marital_Status_1_+
0.0950790283*Marital_Status_2_+
0.0717915016*Marital_Status_3_+
-0.080938986*Marital_Status_4_+
-0.1104777*Marital_Status_5_+
-0.008626577*_D1+
-0.238044278*_D2+
0.0062167388*_D3+
-0.087904679*_D4+
0.078764628*_D5+
-0.008244904*_D6+
0.1092349948*_D7+
0.0969316628*_D8+
0.1227889726*_D9+
-0.023006647*_D10+
0.1387425649*_D11+
-0.062313628*_D12+
0.1739428825*_D13+
-0.035746022*_D14+
0.1040147522*_D15+
0.0147636604*_D16+
-0.007197715*_D17+
0.0639031129*_D18+
0.1712320333*_D19+
-0.014676984*_D20+
-0.017012684*_D21+
0.0111169134*_D22+
-0.066733479*_D23;
/****************************************/
* Principal Component 8;
/****************************************/
;
label PC_8 = "Principal Component 8";
PC_8 =
-0.236327542*AcceptedCmp1_1_+
0.2363275424*AcceptedCmp1_2_+
0.5415353816*AcceptedCmp2_1_+
-0.541535382*AcceptedCmp2_2_+
-0.022132024*AcceptedCmp3_1_+
0.022132024*AcceptedCmp3_2_+
-0.156407414*AcceptedCmp4_1_+
0.1564074136*AcceptedCmp4_2_+
-0.037041252*AcceptedCmp5_1_+
0.0370412517*AcceptedCmp5_2_+
-0.033428073*Complain_1_+
0.0334280725*Complain_2_+
-0.006843071*Education_1_+
-0.028056972*Education_2_+
-0.010366797*Education_3_+
-0.017295551*Education_4_+
0.0445308549*Education_5_+
-0.020631947*HigherEducationBinary_1_+
0.020631947*HigherEducationBinary_2_+
-0.022999211*Marital_Status_1_+
0.2633810054*Marital_Status_2_+
0.0150510076*Marital_Status_3_+
-0.283940814*Marital_Status_4_+
-0.050114445*Marital_Status_5_+
0.0822475704*_D1+
-0.04367832*_D2+
0.0061040825*_D3+
-0.019064432*_D4+
0.1170687629*_D5+
0.0087903989*_D6+
-0.073600097*_D7+
-0.074090043*_D8+
-0.026201399*_D9+
-0.007227172*_D10+
-0.035042829*_D11+
0.0479343615*_D12+
0.0698325137*_D13+
-0.006497862*_D14+
0.1309759594*_D15+
0.0403121232*_D16+
-0.043560316*_D17+
0.0778654943*_D18+
0.129964942*_D19+
0.0301794733*_D20+
-0.004822853*_D21+
-0.034504653*_D22+
0.029282447*_D23;
/****************************************/
* Principal Component 9;
/****************************************/
;
label PC_9 = "Principal Component 9";
PC_9 =
-0.105237364*AcceptedCmp1_1_+
0.1052373644*AcceptedCmp1_2_+
0.121579204*AcceptedCmp2_1_+
-0.121579204*AcceptedCmp2_2_+
0.0783925122*AcceptedCmp3_1_+
-0.078392512*AcceptedCmp3_2_+
-0.01855201*AcceptedCmp4_1_+
0.0185520095*AcceptedCmp4_2_+
-0.058833011*AcceptedCmp5_1_+
0.0588330108*AcceptedCmp5_2_+
-0.049859437*Complain_1_+
0.0498594373*Complain_2_+
-0.091194213*Education_1_+
0.0747803095*Education_2_+
-0.032728492*Education_3_+
0.0958160202*Education_4_+
-0.01048039*Education_5_+
-0.041934551*HigherEducationBinary_1_+
0.0419345512*HigherEducationBinary_2_+
0.0730611552*Marital_Status_1_+
-0.688503402*Marital_Status_2_+
0.4210698964*Marital_Status_3_+
0.3293705219*Marital_Status_4_+
0.0216735626*Marital_Status_5_+
0.0177672708*_D1+
-0.100408868*_D2+
-0.000206755*_D3+
-0.064275425*_D4+
0.0899635127*_D5+
0.0279301081*_D6+
-0.054251679*_D7+
-0.032721303*_D8+
-0.033749242*_D9+
0.0072814812*_D10+
-0.063215763*_D11+
0.0692160968*_D12+
0.2246269884*_D13+
-0.001501935*_D14+
0.0595633586*_D15+
0.0265670889*_D16+
-0.038009456*_D17+
0.0483673704*_D18+
0.1491356819*_D19+
0.0443007827*_D20+
0.0135969881*_D21+
-0.065412637*_D22+
-0.073731572*_D23;
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
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -1.54338903955541 * S_PC_1  +     0.73226058692887 * S_PC_10
          +     0.59106646452907 * S_PC_11  +     0.62334205070578 * S_PC_12
          +      0.1587295305464 * S_PC_13  +     0.21019089410849 * S_PC_14
          +     0.00885894863408 * S_PC_15  +    -0.04864076912746 * S_PC_16
          +    -0.47424234433803 * S_PC_17  +     0.83904277850707 * S_PC_2
          +     -0.4253880942025 * S_PC_3  +     -0.3881176035698 * S_PC_4
          +     0.94208020114349 * S_PC_5  +     0.10848598408473 * S_PC_6
          +     0.44623796831768 * S_PC_7  +      0.1444139120969 * S_PC_8
          +    -0.38119847903467 * S_PC_9  +     0.03462171477307 *
        S_Year_Birth ;
   H12  =     0.10211789322644 * S_PC_1  +    -0.28896485372886 * S_PC_10
          +     0.37926665209721 * S_PC_11  +     0.29307245567057 * S_PC_12
          +    -0.79276921133636 * S_PC_13  +     0.41980207496941 * S_PC_14
          +    -0.21971594319207 * S_PC_15  +     0.12130916750868 * S_PC_16
          +    -0.20919411167768 * S_PC_17  +    -0.20377285070241 * S_PC_2
          +    -0.21559741321693 * S_PC_3  +     0.02690908204417 * S_PC_4
          +     0.04156964082268 * S_PC_5  +     0.17112646193201 * S_PC_6
          +     0.19399189989866 * S_PC_7  +     0.24521256789853 * S_PC_8
          +     0.24592685405399 * S_PC_9  +     0.10038417394745 *
        S_Year_Birth ;
   H11  =     2.10457457316907 + H11 ;
   H12  =    -0.55171031470238 + H12 ;
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
   P_DepVar1  =    -2.47489693050934 * H11  +     3.24364330024777 * H12 ;
   P_DepVar1  =    -0.74857761295084 + P_DepVar1 ;
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
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =      0.2142022960337 * S_PC_1  +     0.45958481274618 * S_PC_10
          +     0.69707764460073 * S_PC_11  +    -0.28731584859801 * S_PC_12
          +    -0.36950107897164 * S_PC_13  +     0.18809798735641 * S_PC_14
          +     -0.2130015500898 * S_PC_15  +      0.0071701964964 * S_PC_16
          +    -0.16484342463114 * S_PC_17  +    -0.45239110771446 * S_PC_2
          +    -0.46983508200606 * S_PC_3  +    -0.66796376673143 * S_PC_4
          +     1.74809683790662 * S_PC_5  +    -0.13522760990537 * S_PC_6
          +     0.55932520504169 * S_PC_7  +     -1.6522575410041 * S_PC_8
          +    -0.27156327412277 * S_PC_9  +     0.13502580420273 *
        S_Year_Birth ;
   H12  =     0.11812229131662 * S_PC_1  +    -0.30871683896859 * S_PC_10
          +     0.27201131036585 * S_PC_11  +     0.30251258127641 * S_PC_12
          +    -0.67346016770754 * S_PC_13  +     0.37176061574683 * S_PC_14
          +    -0.23991822296987 * S_PC_15  +     0.16688456482026 * S_PC_16
          +    -0.07997426604796 * S_PC_17  +    -0.37489008231683 * S_PC_2
          +    -0.31917168095976 * S_PC_3  +      0.1852305444751 * S_PC_4
          +     0.12292563944212 * S_PC_5  +       0.040943627574 * S_PC_6
          +     0.06243182785513 * S_PC_7  +      0.2576666765474 * S_PC_8
          +     0.14669869508947 * S_PC_9  +     0.25287680510356 *
        S_Year_Birth ;
   H13  =     0.64343224615395 * S_PC_1  +    -0.70988675774855 * S_PC_10
          +     0.88271581211552 * S_PC_11  +     0.96991990033944 * S_PC_12
          +    -1.17246354807186 * S_PC_13  +     0.46319326792627 * S_PC_14
          +    -0.68647913740539 * S_PC_15  +    -0.01341897678398 * S_PC_16
          +    -0.77351032460481 * S_PC_17  +    -0.57723175268209 * S_PC_2
          +    -0.11732850831905 * S_PC_3  +    -0.04783645844047 * S_PC_4
          +    -0.64916508516345 * S_PC_5  +     0.29343176558715 * S_PC_6
          +    -0.54745345702111 * S_PC_7  +    -0.21360252466545 * S_PC_8
          +    -0.12601782119443 * S_PC_9  +    -0.23396269663696 *
        S_Year_Birth ;
   H14  =      1.0341215312277 * S_PC_1  +    -0.39415731025938 * S_PC_10
          +    -0.32060014638152 * S_PC_11  +    -0.61669234969925 * S_PC_12
          +    -0.31179815348792 * S_PC_13  +    -0.00798094231062 * S_PC_14
          +    -0.02653679285646 * S_PC_15  +     0.07670313502809 * S_PC_16
          +     0.21136382302776 * S_PC_17  +    -0.22154119624002 * S_PC_2
          +     0.47642619465816 * S_PC_3  +    -0.31672307688174 * S_PC_4
          +     0.05874501739573 * S_PC_5  +    -0.05897167931726 * S_PC_6
          +    -0.09671465231304 * S_PC_7  +    -0.31597714355748 * S_PC_8
          +     0.43891531065352 * S_PC_9  +     0.09716703238388 *
        S_Year_Birth ;
   H11  =    -0.54498134015293 + H11 ;
   H12  =    -0.74199857282203 + H12 ;
   H13  =     1.38839834700907 + H13 ;
   H14  =     -2.2533612485392 + H14 ;
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
   P_DepVar1  =    -2.60708041357943 * H11  +     3.00483048817261 * H12
          +     1.87856416825462 * H13  +      2.8062260938905 * H14 ;
   P_DepVar1  =    -1.50175498849739 + P_DepVar1 ;
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
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.63485798320112 * S_PC_1  +    -0.10477176269948 * S_PC_10
          +     0.26184752074824 * S_PC_11  +     0.23906845584659 * S_PC_12
          +    -0.51362798675812 * S_PC_13  +     0.53649831892278 * S_PC_14
          +    -0.16550965082885 * S_PC_15  +     0.08963779199746 * S_PC_16
          +    -0.22854664969932 * S_PC_17  +     -0.2718375422761 * S_PC_2
          +    -0.10520565981952 * S_PC_3  +     0.14464520775348 * S_PC_4
          +    -0.36340428430683 * S_PC_5  +     0.08841175439911 * S_PC_6
          +     0.12382023838606 * S_PC_7  +     0.40356220098507 * S_PC_8
          +     0.50262016790679 * S_PC_9  +     0.41239597569241 *
        S_Year_Birth ;
   H12  =    -0.03170129209823 * S_PC_1  +    -0.19329486349068 * S_PC_10
          +     0.24083128784168 * S_PC_11  +     0.28756274404764 * S_PC_12
          +    -0.25849881854532 * S_PC_13  +     0.12499850440002 * S_PC_14
          +     0.07646986108238 * S_PC_15  +    -0.01146226791749 * S_PC_16
          +     0.49313465756008 * S_PC_17  +     0.03756325026606 * S_PC_2
          +    -0.22130956851974 * S_PC_3  +    -0.15038689409236 * S_PC_4
          +     -0.1936231522874 * S_PC_5  +     0.30908287695375 * S_PC_6
          +     0.28242803528842 * S_PC_7  +     0.49201488080614 * S_PC_8
          +     0.01990940708468 * S_PC_9  +     0.02254382253892 *
        S_Year_Birth ;
   H13  =    -0.33736159716995 * S_PC_1  +     0.62554367173021 * S_PC_10
          +    -0.34831070805463 * S_PC_11  +    -0.36922498575096 * S_PC_12
          +     0.94983800400642 * S_PC_13  +    -0.35859278290552 * S_PC_14
          +     0.44501576629992 * S_PC_15  +    -0.17494995053533 * S_PC_16
          +     0.30840870792191 * S_PC_17  +      0.3232437418424 * S_PC_2
          +     -0.0934348840848 * S_PC_3  +     0.14641006967036 * S_PC_4
          +      0.2004739086116 * S_PC_5  +    -0.14647803303742 * S_PC_6
          +     0.19072771899527 * S_PC_7  +     0.02891642169532 * S_PC_8
          +     0.12514276138392 * S_PC_9  +     0.15230898502359 *
        S_Year_Birth ;
   H14  =    -0.86649119228703 * S_PC_1  +     0.13942745565709 * S_PC_10
          +     0.19051326714567 * S_PC_11  +      0.2590968446418 * S_PC_12
          +    -0.28068845804298 * S_PC_13  +     0.27304925444222 * S_PC_14
          +     0.10185343419254 * S_PC_15  +     0.06866641525222 * S_PC_16
          +     -0.1485934835166 * S_PC_17  +    -0.76032508397066 * S_PC_2
          +    -0.62162055889812 * S_PC_3  +     0.95603112187736 * S_PC_4
          +    -0.25924553394194 * S_PC_5  +    -0.37934023964572 * S_PC_6
          +     0.30742207990733 * S_PC_7  +     0.55939149551964 * S_PC_8
          +     0.23942030839495 * S_PC_9  +    -0.08485647236628 *
        S_Year_Birth ;
   H15  =     1.02458774592717 * S_PC_1  +    -0.37954747209518 * S_PC_10
          +    -0.28184467032484 * S_PC_11  +    -0.41558464107982 * S_PC_12
          +    -0.29715733091874 * S_PC_13  +    -0.11729409586297 * S_PC_14
          +     0.05111693019056 * S_PC_15  +     0.01776303221562 * S_PC_16
          +     0.22309194254283 * S_PC_17  +    -0.19092216040796 * S_PC_2
          +      0.2996018073758 * S_PC_3  +     -0.1914691441837 * S_PC_4
          +     0.02659052050719 * S_PC_5  +     0.20194936538427 * S_PC_6
          +    -0.04560428499129 * S_PC_7  +     -0.1138247006838 * S_PC_8
          +     0.38441462800294 * S_PC_9  +    -0.03543454432849 *
        S_Year_Birth ;
   H11  =    -0.57205266427164 + H11 ;
   H12  =    -1.05797297317597 + H12 ;
   H13  =    -0.52645850486448 + H13 ;
   H14  =    -0.98990475299524 + H14 ;
   H15  =     -1.7862898917182 + H15 ;
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
   P_DepVar1  =     1.21721053417712 * H11  +     0.25895256464462 * H12
          +    -2.48608235736238 * H13  +      1.7837986557289 * H14
          +     2.84991482748509 * H15 ;
   P_DepVar1  =    -1.11076420927493 + P_DepVar1 ;
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
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.66162415407107 * S_PC_1  +    -0.41766308568497 * S_PC_10
          +     0.44716155726684 * S_PC_11  +     0.51882451748254 * S_PC_12
          +    -1.34027194120483 * S_PC_13  +     0.44167412235656 * S_PC_14
          +    -0.53028738685237 * S_PC_15  +     0.27562098694114 * S_PC_16
          +    -0.06818955880859 * S_PC_17  +    -0.04345289092052 * S_PC_2
          +    -0.43706082404622 * S_PC_3  +     0.01676067813068 * S_PC_4
          +    -0.28127929682521 * S_PC_5  +    -0.29846073286585 * S_PC_6
          +    -0.03499642701132 * S_PC_7  +     0.15229243815145 * S_PC_8
          +     0.18530157772282 * S_PC_9  +     0.73017449579728 *
        S_Year_Birth ;
   H12  =     0.64597977704217 * S_PC_1  +    -0.23821744991134 * S_PC_10
          +    -0.14632606678812 * S_PC_11  +     -0.2642046964713 * S_PC_12
          +    -0.16132504913978 * S_PC_13  +    -0.01926596440034 * S_PC_14
          +     0.02011273330816 * S_PC_15  +     0.04329735456053 * S_PC_16
          +     0.10020893774507 * S_PC_17  +    -0.22659427061067 * S_PC_2
          +     0.26918226646558 * S_PC_3  +    -0.15805153820258 * S_PC_4
          +    -0.01318382613484 * S_PC_5  +     0.00207126308167 * S_PC_6
          +    -0.02015277359299 * S_PC_7  +    -0.09265573996803 * S_PC_8
          +     0.23125247113744 * S_PC_9  +    -0.07574909545113 *
        S_Year_Birth ;
   H13  =    -0.78518075666801 * S_PC_1  +    -0.13651032443592 * S_PC_10
          +     0.18814513480757 * S_PC_11  +     0.20574038612337 * S_PC_12
          +    -0.13848955692195 * S_PC_13  +     0.33983166896863 * S_PC_14
          +     0.00067982783371 * S_PC_15  +    -0.04362239065819 * S_PC_16
          +    -0.29971068993151 * S_PC_17  +    -0.64512941056708 * S_PC_2
          +    -0.42925249333906 * S_PC_3  +     0.58020341068864 * S_PC_4
          +    -0.20361504709271 * S_PC_5  +     0.91204972953983 * S_PC_6
          +     0.14118665494483 * S_PC_7  +     0.51813003035978 * S_PC_8
          +     0.08227061949238 * S_PC_9  +     -0.3793843971308 *
        S_Year_Birth ;
   H11  =    -0.71192629005572 + H11 ;
   H12  =    -1.21495096628713 + H12 ;
   H13  =     -1.0262160199904 + H13 ;
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
   P_DepVar1  =     1.97211912500641 * H11  +     3.85901238295283 * H12
          +     2.28455259493407 * H13 ;
   P_DepVar1  =     0.85003990401463 + P_DepVar1 ;
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
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.57635658190396 * S_PC_1  +    -0.31351012201247 * S_PC_10
          +     0.35554236871072 * S_PC_11  +     0.46825529128996 * S_PC_12
          +    -0.37534513422477 * S_PC_13  +    -0.27110906744409 * S_PC_14
          +    -0.03970223918992 * S_PC_15  +    -0.00368328213623 * S_PC_16
          +     0.08494552733159 * S_PC_17  +     0.14575286148432 * S_PC_2
          +     0.10708586704976 * S_PC_3  +    -0.57137094863252 * S_PC_4
          +     0.33654954830967 * S_PC_5  +    -0.19099897947761 * S_PC_6
          +    -0.54884274488614 * S_PC_7  +    -0.53626765517945 * S_PC_8
          +    -0.95844798051607 * S_PC_9  +    -0.15346954705487 *
        S_Year_Birth ;
   H12  =    -0.99754140868259 * S_PC_1  +     0.48432033889368 * S_PC_10
          +     0.13485378897804 * S_PC_11  +     0.70654387154986 * S_PC_12
          +     0.31535013010443 * S_PC_13  +     0.13352150372021 * S_PC_14
          +     0.02266953346702 * S_PC_15  +     -0.4891980125355 * S_PC_16
          +    -0.19919312353832 * S_PC_17  +    -0.19402007559395 * S_PC_2
          +    -0.44787100056646 * S_PC_3  +    -0.34998796930312 * S_PC_4
          +     0.18268054629551 * S_PC_5  +     0.39959406390493 * S_PC_6
          +     0.29629443914547 * S_PC_7  +     0.11287954527851 * S_PC_8
          +    -0.64839515869454 * S_PC_9  +    -0.19380600849554 *
        S_Year_Birth ;
   H13  =     -1.0823067374947 * S_PC_1  +     0.03757671255421 * S_PC_10
          +    -0.88553156949014 * S_PC_11  +    -1.14340212735558 * S_PC_12
          +     0.21740954678016 * S_PC_13  +     -0.3725711948052 * S_PC_14
          +     0.31479165759956 * S_PC_15  +    -0.12010822665038 * S_PC_16
          +     0.25822787581675 * S_PC_17  +     0.20473449568327 * S_PC_2
          +     0.42895056545479 * S_PC_3  +     0.58129578141832 * S_PC_4
          +     0.81812143004044 * S_PC_5  +    -0.08541579592673 * S_PC_6
          +    -0.08298404993106 * S_PC_7  +    -0.06771155681427 * S_PC_8
          +     0.23336761981714 * S_PC_9  +      0.0401091765443 *
        S_Year_Birth ;
   H14  =    -0.31646532994072 * S_PC_1  +     0.62489375771545 * S_PC_10
          +    -0.53010968080053 * S_PC_11  +    -0.23968869971937 * S_PC_12
          +     1.03461385619659 * S_PC_13  +    -0.46882027028342 * S_PC_14
          +     0.46734491267632 * S_PC_15  +     0.39229663491061 * S_PC_16
          +     0.08012897742232 * S_PC_17  +     0.04675555594631 * S_PC_2
          +     0.00464369091888 * S_PC_3  +     0.09395424337114 * S_PC_4
          +    -0.13384452448773 * S_PC_5  +    -0.25307416163671 * S_PC_6
          +    -0.02506188916405 * S_PC_7  +     -0.1509186430772 * S_PC_8
          +    -0.04892999983232 * S_PC_9  +    -0.13112409612727 *
        S_Year_Birth ;
   H15  =    -0.36792335928443 * S_PC_1  +     0.37715022064516 * S_PC_10
          +    -0.34263128406455 * S_PC_11  +     0.30201456615476 * S_PC_12
          +    -0.45934658855136 * S_PC_13  +    -0.26533309504931 * S_PC_14
          +     0.36238053824316 * S_PC_15  +    -0.31713865718922 * S_PC_16
          +     -0.0765828768821 * S_PC_17  +    -0.77974070972324 * S_PC_2
          +     0.12886823717699 * S_PC_3  +     0.45610079035114 * S_PC_4
          +      0.2567880548249 * S_PC_5  +     0.23940714475233 * S_PC_6
          +    -0.06293859719329 * S_PC_7  +    -0.05522982795714 * S_PC_8
          +    -0.03013010516899 * S_PC_9  +     0.27486484306687 *
        S_Year_Birth ;
   H16  =     0.13975575860529 * S_PC_1  +    -0.35575487248938 * S_PC_10
          +     0.02983601640638 * S_PC_11  +     0.26434219975941 * S_PC_12
          +    -0.40948666727232 * S_PC_13  +     0.20186769345139 * S_PC_14
          +     0.45170616775352 * S_PC_15  +     0.00258771853777 * S_PC_16
          +    -0.40888320799045 * S_PC_17  +    -0.18037761561331 * S_PC_2
          +     0.37721304589753 * S_PC_3  +    -0.19118634307032 * S_PC_4
          +    -0.63151251587428 * S_PC_5  +    -0.23281740347406 * S_PC_6
          +     -0.0828679380821 * S_PC_7  +     0.76178109678759 * S_PC_8
          +     0.57258725782556 * S_PC_9  +    -0.15432480762964 *
        S_Year_Birth ;
   H17  =     0.31605900784266 * S_PC_1  +     0.34833374230803 * S_PC_10
          +     0.23320656792555 * S_PC_11  +     0.16099686297534 * S_PC_12
          +     0.27657165659696 * S_PC_13  +    -0.16386328713702 * S_PC_14
          +    -0.07457567503477 * S_PC_15  +    -0.48573025440334 * S_PC_16
          +      0.0321218057153 * S_PC_17  +     0.75395393692804 * S_PC_2
          +     0.58102263323057 * S_PC_3  +     0.03732139018296 * S_PC_4
          +     0.21321560935535 * S_PC_5  +    -0.17682802646605 * S_PC_6
          +    -0.25681275271584 * S_PC_7  +    -0.26821028181474 * S_PC_8
          +     0.15279812226638 * S_PC_9  +     0.37146205771289 *
        S_Year_Birth ;
   H11  =    -1.16794994414366 + H11 ;
   H12  =     1.34950067589415 + H12 ;
   H13  =    -0.44254911274099 + H13 ;
   H14  =     0.15367849524818 + H14 ;
   H15  =    -1.51939092158903 + H15 ;
   H16  =      0.6953452432569 + H16 ;
   H17  =     0.58084316489966 + H17 ;
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
   P_DepVar1  =    -1.61984691421844 * H11  +    -2.05503974494971 * H12
          +    -1.93074257008285 * H13  +    -2.19463525441367 * H14
          +     1.77553865420261 * H15  +     1.01400297881478 * H16
          +     -1.9246974233586 * H17 ;
   P_DepVar1  =    -2.20781421095695 + P_DepVar1 ;
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
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural14;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

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
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.10164757372038 * S_PC_1  +     0.23564366900821 * S_PC_10
          +     0.03218545477975 * S_PC_11  +    -0.20105633481452 * S_PC_12
          +     0.46218918894091 * S_PC_13  +    -0.29807808914991 * S_PC_14
          +     0.17583796979491 * S_PC_15  +     0.03033544353418 * S_PC_16
          +     0.25021734275353 * S_PC_17  +    -0.24021688140508 * S_PC_2
          +     -0.1102916075826 * S_PC_3  +    -0.00240745238609 * S_PC_4
          +     -0.0274131852155 * S_PC_5  +    -0.19254616122832 * S_PC_6
          +     0.11532321939184 * S_PC_7  +     -0.6677111259933 * S_PC_8
          +    -0.25753224620538 * S_PC_9  +    -0.30186388169486 *
        S_Year_Birth ;
   H1x1_2  =     0.69328570966752 * S_PC_1  +    -0.35284925856721 * S_PC_10
          +     0.02290654324776 * S_PC_11  +     0.00970894937381 * S_PC_12
          +    -0.04741179982085 * S_PC_13  +    -0.20302788277292 * S_PC_14
          +    -0.05864666074321 * S_PC_15  +     0.05995123856812 * S_PC_16
          +     0.23138477322273 * S_PC_17  +    -0.34252755127761 * S_PC_2
          +     0.17382271435334 * S_PC_3  +    -0.01868728319481 * S_PC_4
          +    -0.40174697156367 * S_PC_5  +    -0.06272489483222 * S_PC_6
          +     0.02659607049312 * S_PC_7  +    -0.10881698069286 * S_PC_8
          +     0.15346273425449 * S_PC_9  +    -0.34879716236226 *
        S_Year_Birth ;
   H1x1_3  =     0.93991744730684 * S_PC_1  +     0.21004088081659 * S_PC_10
          +     0.04043531851461 * S_PC_11  +     0.38076091002631 * S_PC_12
          +     0.34034977799818 * S_PC_13  +    -0.04437127519769 * S_PC_14
          +    -0.32171755712003 * S_PC_15  +     -0.2933258304452 * S_PC_16
          +    -0.23861752489561 * S_PC_17  +     0.46352713116162 * S_PC_2
          +    -0.09577439848272 * S_PC_3  +     0.22567854138108 * S_PC_4
          +     0.33161087629213 * S_PC_5  +    -0.34451188357259 * S_PC_6
          +     0.09767167948587 * S_PC_7  +    -0.04416656932503 * S_PC_8
          +    -0.19126765564439 * S_PC_9  +     0.01696566154262 *
        S_Year_Birth ;
   H1x1_4  =    -0.49573102444764 * S_PC_1  +     0.22232925363327 * S_PC_10
          +    -0.35780218268518 * S_PC_11  +    -0.41209217464771 * S_PC_12
          +      0.1179498443288 * S_PC_13  +     0.17628378505051 * S_PC_14
          +     0.21318677923196 * S_PC_15  +     0.07202379004462 * S_PC_16
          +    -0.08037138282193 * S_PC_17  +     0.65976091792431 * S_PC_2
          +    -0.27807281453857 * S_PC_3  +    -0.08689369989391 * S_PC_4
          +     1.00856784829836 * S_PC_5  +    -0.21706066016492 * S_PC_6
          +     0.23716358945002 * S_PC_7  +    -0.09140093918751 * S_PC_8
          +      0.0211162515675 * S_PC_9  +      0.6353422873589 *
        S_Year_Birth ;
   H1x1_5  =     0.02040134912024 * S_PC_1  +     0.05075007592975 * S_PC_10
          +    -0.15645990555913 * S_PC_11  +    -0.01709812234954 * S_PC_12
          +     0.40054996592819 * S_PC_13  +    -0.18950040503056 * S_PC_14
          +     0.06047523781982 * S_PC_15  +    -0.17743373575604 * S_PC_16
          +    -0.19467350400571 * S_PC_17  +     0.89927735899217 * S_PC_2
          +     0.44521412231525 * S_PC_3  +    -0.33298102090281 * S_PC_4
          +     0.05363089428662 * S_PC_5  +     0.03881454959471 * S_PC_6
          +    -0.22983843245132 * S_PC_7  +     0.26424334847901 * S_PC_8
          +    -0.05271169502035 * S_PC_9  +     0.00379146974401 *
        S_Year_Birth ;
   H1x1_6  =    -0.33275570391765 * S_PC_1  +     -0.2596575581091 * S_PC_10
          +      0.4888454490764 * S_PC_11  +     0.22831374108122 * S_PC_12
          +    -0.04376514466691 * S_PC_13  +    -0.13785898130709 * S_PC_14
          +    -0.11680863449762 * S_PC_15  +    -0.07518218015133 * S_PC_16
          +    -0.28918738454724 * S_PC_17  +     0.22007508424835 * S_PC_2
          +      0.4220725647584 * S_PC_3  +    -0.29485122266251 * S_PC_4
          +     0.30806088125759 * S_PC_5  +    -0.68630199360769 * S_PC_6
          +    -0.09428563446862 * S_PC_7  +    -0.54659793803024 * S_PC_8
          +    -0.41839207546201 * S_PC_9  +    -0.26675361273026 *
        S_Year_Birth ;
   H1x1_1  =     0.22559498123533 + H1x1_1 ;
   H1x1_2  =    -1.29065161913632 + H1x1_2 ;
   H1x1_3  =    -0.93756126423055 + H1x1_3 ;
   H1x1_4  =    -0.33996906467692 + H1x1_4 ;
   H1x1_5  =     1.34348361378973 + H1x1_5 ;
   H1x1_6  =     -0.7957714824619 + H1x1_6 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
   H1x1_5  = SIN(H1x1_5 );
   H1x1_6  = SIN(H1x1_6 );
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
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -3.58923066796587 * H1x1_1  +     2.69392081819043 * H1x1_2
          +    -1.71083444372434 * H1x1_3  +    -2.20995560146016 * H1x1_4
          +    -2.80104378083098 * H1x1_5  +    -2.08178136334122 * H1x1_6 ;
   P_DepVar1  =    -0.72100321751756 + P_DepVar1 ;
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
* Renaming variables for AutoNeural14;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural14;
*------------------------------------------------------------*;
drop AutoNeural14_P_DepVar1;
AutoNeural14_P_DepVar1 = P_DepVar1;
drop AutoNeural14_P_DepVar0;
AutoNeural14_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural14;
*------------------------------------------------------------*;
length AutoNeural14_WARN_ $4;
drop AutoNeural14_WARN_;
AutoNeural14_WARN_ = _WARN_;
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
* TOOL: AutoNeural;
* TYPE: MODEL;
* NODE: AutoNeural13;
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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

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
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  =  -3.567597872154E-15 +     0.29892739052271 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.0346468636081E-15 +     0.82173953858445 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =   6.055841017477E-15 +     0.85619046033275 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -3.9570415662911E-15 +     0.88816580619395 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.4807903817941E-15 +     0.89679040249719 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.1940871521205E-15 +     0.90336543119982 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  =   -3.45147395417E-16 +     0.92997960877389 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.0832890955173E-15 +     0.95096832834142 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =  4.0710461992609E-15 +     0.99882451143041 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4589631283016E-15 +      0.5437311140029 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2833690425384E-15 +     0.55367740285547 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -3.6725092169592E-15 +     0.63698127005552 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.6355038408768E-15 +     0.66670299180006 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5846922792836E-15 +     0.70534791664737 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  6.7268179657212E-16 +     0.74932361381713 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.3246545307055E-15 +     0.77161638976627 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -3.7729896578756E-15 +     0.80831761659605 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 *
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =    -0.32594323715507 * S_PC_1  +     0.35601244497616 * S_PC_10
          +     0.23551037194578 * S_PC_11  +     0.36329343976958 * S_PC_12
          +     0.18625241284147 * S_PC_13  +    -0.26738645821727 * S_PC_14
          +    -0.11334514198957 * S_PC_15  +    -0.13541776549359 * S_PC_16
          +     0.01536562915516 * S_PC_17  +    -0.37475909603056 * S_PC_2
          +    -0.39525354848961 * S_PC_3  +     0.23407225580273 * S_PC_4
          +     0.14886448532502 * S_PC_5  +    -0.07500687735169 * S_PC_6
          +     0.29657240921985 * S_PC_7  +    -0.41074019492767 * S_PC_8
          +    -0.46585918851858 * S_PC_9  +    -0.03775321190087 *
        S_Year_Birth ;
   H1x1_2  =      0.2295203400892 * S_PC_1  +    -0.33102630465707 * S_PC_10
          +      0.3982295545742 * S_PC_11  +     0.20462619478042 * S_PC_12
          +    -0.68487726222023 * S_PC_13  +     0.37650172545509 * S_PC_14
          +    -0.27887735958753 * S_PC_15  +    -0.02581469991742 * S_PC_16
          +    -0.28205659737284 * S_PC_17  +    -0.10182055063415 * S_PC_2
          +     0.12812251643176 * S_PC_3  +    -0.23066282129667 * S_PC_4
          +     0.07541284680186 * S_PC_5  +     0.24012121689661 * S_PC_6
          +     0.13842613504509 * S_PC_7  +     0.05569302549963 * S_PC_8
          +     0.21283858437275 * S_PC_9  +    -0.07763224593416 *
        S_Year_Birth ;
   H1x1_3  =    -0.81897893610437 * S_PC_1  +     0.17086737000156 * S_PC_10
          +    -0.41456412659338 * S_PC_11  +    -0.10210116836733 * S_PC_12
          +    -0.01781792809366 * S_PC_13  +     0.87937511104362 * S_PC_14
          +     0.11363426216873 * S_PC_15  +     0.15473733315317 * S_PC_16
          +    -0.25728762971414 * S_PC_17  +     0.14902434266152 * S_PC_2
          +    -0.54672153901076 * S_PC_3  +     0.68025560498171 * S_PC_4
          +     0.38503442452439 * S_PC_5  +     0.12957351960793 * S_PC_6
          +    -0.55840202311292 * S_PC_7  +    -0.04966795126386 * S_PC_8
          +    -0.18806551125208 * S_PC_9  +     1.14929153435805 *
        S_Year_Birth ;
   H1x1_4  =    -0.14487980505225 * S_PC_1  +     0.17192203332047 * S_PC_10
          +     0.03195160273321 * S_PC_11  +    -0.08689400274427 * S_PC_12
          +     0.38089132351821 * S_PC_13  +     -0.0266430724512 * S_PC_14
          +     0.04400113177839 * S_PC_15  +    -0.11330745510845 * S_PC_16
          +    -0.02017896419464 * S_PC_17  +      0.3275023839513 * S_PC_2
          +     0.12820167568493 * S_PC_3  +    -0.21125497799085 * S_PC_4
          +     0.24494493836545 * S_PC_5  +    -0.05439626774834 * S_PC_6
          +    -0.00677402946214 * S_PC_7  +    -0.14431119046299 * S_PC_8
          +    -0.05606535418296 * S_PC_9  +    -0.10392063931961 *
        S_Year_Birth ;
   H1x1_5  =     0.46644634016117 * S_PC_1  +     0.24966722326697 * S_PC_10
          +    -0.50204053155973 * S_PC_11  +    -0.16163921287329 * S_PC_12
          +     -0.2117873065953 * S_PC_13  +     0.00321866119698 * S_PC_14
          +      0.0699390312895 * S_PC_15  +     0.04948301682548 * S_PC_16
          +      0.3193284933053 * S_PC_17  +     0.83054970008779 * S_PC_2
          +       0.926899452502 * S_PC_3  +    -0.65951796203459 * S_PC_4
          +    -0.04590479970431 * S_PC_5  +    -0.34410773240721 * S_PC_6
          +    -0.57666665311988 * S_PC_7  +     0.13200105511652 * S_PC_8
          +     0.22557835400272 * S_PC_9  +     0.37883228433977 *
        S_Year_Birth ;
   H1x1_1  =    -1.47213938689482 + H1x1_1 ;
   H1x1_2  =     0.04468453740373 + H1x1_2 ;
   H1x1_3  =     1.02710140676845 + H1x1_3 ;
   H1x1_4  =     0.72012823118527 + H1x1_4 ;
   H1x1_5  =      0.2940192888358 + H1x1_5 ;
   H1x1_1  = SIN(H1x1_1 );
   H1x1_2  = SIN(H1x1_2 );
   H1x1_3  = SIN(H1x1_3 );
   H1x1_4  = SIN(H1x1_4 );
   H1x1_5  = SIN(H1x1_5 );
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =      2.8481167326349 * H1x1_1  +     2.49835781491849 * H1x1_2
          +    -1.58189403173494 * H1x1_3  +    -3.82498978068274 * H1x1_4
          +     -1.3633590212543 * H1x1_5 ;
   P_DepVar1  =     0.71854967580477 + P_DepVar1 ;
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
* Renaming variables for AutoNeural13;
*------------------------------------------------------------*;
* Renaming Posterior variables for AutoNeural13;
*------------------------------------------------------------*;
drop AutoNeural13_P_DepVar1;
AutoNeural13_P_DepVar1 = P_DepVar1;
drop AutoNeural13_P_DepVar0;
AutoNeural13_P_DepVar0 = P_DepVar0;
*------------------------------------------------------------*;
* Renaming _WARN_ variable for AutoNeural13;
*------------------------------------------------------------*;
length AutoNeural13_WARN_ $4;
drop AutoNeural13_WARN_;
AutoNeural13_WARN_ = _WARN_;
*------------------------------------------------------------*;
* TOOL: Ensemble;
* TYPE: MODEL;
* NODE: Ensmbl16;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* Ensmbl16: Average Posteriors of 7 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural13_P_DepVar1 +
Neural15_P_DepVar1 +
Neural16_P_DepVar1 +
Neural14_P_DepVar1 +
Neural12_P_DepVar1 +
AutoNeural14_P_DepVar1 +
AutoNeural13_P_DepVar1
)/7;
P_DepVar0 = (
Neural13_P_DepVar0 +
Neural15_P_DepVar0 +
Neural16_P_DepVar0 +
Neural14_P_DepVar0 +
Neural12_P_DepVar0 +
AutoNeural14_P_DepVar0 +
AutoNeural13_P_DepVar0
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
if index(NEURAL13_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL13_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL13_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL13_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL15_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL15_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL15_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL15_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL16_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL16_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL16_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL16_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL14_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL14_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL14_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL14_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL12_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL12_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL12_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL12_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL14_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL14_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL14_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL14_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL13_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL13_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL13_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL13_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
