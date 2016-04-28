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
