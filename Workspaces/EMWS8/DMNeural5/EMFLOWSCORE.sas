**********************************************************;
**** Begin scoring code for DMNeural;
**********************************************************;
LENGTH _WARN_ $ 4;
LABEL _WARN_ = "Warnings";
LENGTH I_DepVar $%DMNORLEN;
LABEL I_DepVar="Into: DepVar";
LENGTH _FORMAT_ $200;
LENGTH _NORMFMT_ $%DMNORLEN;
LENGTH F_DepVar $%DMNORLEN;
LABEL F_DepVar="From: DepVar";
LENGTH _TARGNOR_ $%DMNORLEN;
_FORMAT_ =PUT(DepVar, BEST.);
%DMNORMCP(_FORMAT_ , _TARGNOR_ );
F_DepVar=_TARGNOR_;
DROP
_FORMAT_ _NORMFMT_;
;
/*-------------------------------------------------------------------------*/
*Impute missing values for interval variables;
/*-------------------------------------------------------------------------*/
;
if AcceptedCmpTotal=. then _S1_ACCEPTEDCMPTOTAL = 0;
else _S1_ACCEPTEDCMPTOTAL=(AcceptedCmpTotal-0.31255265374894)/0.66837726102124;
if Income=. then _S2_INCOME = 0;
else _S2_INCOME=(Income-51962.545914069)/20878.2658128313;
if Mnt=. then _S3_MNT = 0;
else _S3_MNT=(Mnt-615.68197135636)/604.537497355942;
if NumDistPurchases=. then _S4_NUMDISTPURCHASES = 0;
else _S4_NUMDISTPURCHASES=(NumDistPurchases-6.73504633529907)/4.60209117827878;
if RFMstat=. then _S5_RFMSTAT = 0;
else _S5_RFMSTAT=(RFMstat-531.396946202505)/1565.49314871989;
if RMntFrq=. then _S6_RMNTFRQ = 0;
else _S6_RMNTFRQ=(RMntFrq-37.8039241814599)/30.0642993170191;
;
/*----------------------------------------------*/
* Component 1 at stage 0;
/*----------------------------------------------*/
;
_SPRIN01=
0.9046626244*_S1_ACCEPTEDCMPTOTAL+
-0.188835475*_S2_INCOME+
-0.156406342*_S3_MNT+
-0.140654415*_S4_NUMDISTPURCHASES+
0.2445164966*_S5_RFMSTAT+
-0.2046748*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 0;
/*----------------------------------------------*/
;
_SPRIN02=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 3 at stage 0;
/*----------------------------------------------*/
;
_SPRIN03=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 4 at stage 0;
/*----------------------------------------------*/
;
_SPRIN04=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 5 at stage 0;
/*----------------------------------------------*/
;
_SPRIN05=
0.0142710092*_S1_ACCEPTEDCMPTOTAL+
0.8551360682*_S2_INCOME+
-0.269952828*_S3_MNT+
-0.380017014*_S4_NUMDISTPURCHASES+
0.0283185455*_S5_RFMSTAT+
-0.224609088*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 1;
/*----------------------------------------------*/
;
_SPRIN11=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 1;
/*----------------------------------------------*/
;
_SPRIN12=
0.9046626244*_S1_ACCEPTEDCMPTOTAL+
-0.188835475*_S2_INCOME+
-0.156406342*_S3_MNT+
-0.140654415*_S4_NUMDISTPURCHASES+
0.2445164966*_S5_RFMSTAT+
-0.2046748*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 3 at stage 1;
/*----------------------------------------------*/
;
_SPRIN13=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 4 at stage 1;
/*----------------------------------------------*/
;
_SPRIN14=
0.0142710092*_S1_ACCEPTEDCMPTOTAL+
0.8551360682*_S2_INCOME+
-0.269952828*_S3_MNT+
-0.380017014*_S4_NUMDISTPURCHASES+
0.0283185455*_S5_RFMSTAT+
-0.224609088*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 5 at stage 1;
/*----------------------------------------------*/
;
_SPRIN15=
-0.023137807*_S1_ACCEPTEDCMPTOTAL+
0.1173732321*_S2_INCOME+
-0.191458751*_S3_MNT+
0.7586706544*_S4_NUMDISTPURCHASES+
-0.021032306*_S5_RFMSTAT+
-0.610743967*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 2;
/*----------------------------------------------*/
;
_SPRIN21=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 2;
/*----------------------------------------------*/
;
_SPRIN22=
0.9046626244*_S1_ACCEPTEDCMPTOTAL+
-0.188835475*_S2_INCOME+
-0.156406342*_S3_MNT+
-0.140654415*_S4_NUMDISTPURCHASES+
0.2445164966*_S5_RFMSTAT+
-0.2046748*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 3 at stage 2;
/*----------------------------------------------*/
;
_SPRIN23=
0.0142710092*_S1_ACCEPTEDCMPTOTAL+
0.8551360682*_S2_INCOME+
-0.269952828*_S3_MNT+
-0.380017014*_S4_NUMDISTPURCHASES+
0.0283185455*_S5_RFMSTAT+
-0.224609088*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 4 at stage 2;
/*----------------------------------------------*/
;
_SPRIN24=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 5 at stage 2;
/*----------------------------------------------*/
;
_SPRIN25=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 6 at stage 2;
/*----------------------------------------------*/
;
_SPRIN26=
-0.023137807*_S1_ACCEPTEDCMPTOTAL+
0.1173732321*_S2_INCOME+
-0.191458751*_S3_MNT+
0.7586706544*_S4_NUMDISTPURCHASES+
-0.021032306*_S5_RFMSTAT+
-0.610743967*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 3;
/*----------------------------------------------*/
;
_SPRIN31=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 3;
/*----------------------------------------------*/
;
_SPRIN32=
0.9046626244*_S1_ACCEPTEDCMPTOTAL+
-0.188835475*_S2_INCOME+
-0.156406342*_S3_MNT+
-0.140654415*_S4_NUMDISTPURCHASES+
0.2445164966*_S5_RFMSTAT+
-0.2046748*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 3 at stage 3;
/*----------------------------------------------*/
;
_SPRIN33=
0.0142710092*_S1_ACCEPTEDCMPTOTAL+
0.8551360682*_S2_INCOME+
-0.269952828*_S3_MNT+
-0.380017014*_S4_NUMDISTPURCHASES+
0.0283185455*_S5_RFMSTAT+
-0.224609088*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 4 at stage 3;
/*----------------------------------------------*/
;
_SPRIN34=
-0.023137807*_S1_ACCEPTEDCMPTOTAL+
0.1173732321*_S2_INCOME+
-0.191458751*_S3_MNT+
0.7586706544*_S4_NUMDISTPURCHASES+
-0.021032306*_S5_RFMSTAT+
-0.610743967*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 5 at stage 3;
/*----------------------------------------------*/
;
_SPRIN35=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 4;
/*----------------------------------------------*/
;
_SPRIN41=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 4;
/*----------------------------------------------*/
;
_SPRIN42=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 3 at stage 4;
/*----------------------------------------------*/
;
_SPRIN43=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 5;
/*----------------------------------------------*/
;
_SPRIN51=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 5;
/*----------------------------------------------*/
;
_SPRIN52=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 6;
/*----------------------------------------------*/
;
_SPRIN61=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 6;
/*----------------------------------------------*/
;
_SPRIN62=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 7;
/*----------------------------------------------*/
;
_SPRIN71=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 7;
/*----------------------------------------------*/
;
_SPRIN72=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 8;
/*----------------------------------------------*/
;
_SPRIN81=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 8;
/*----------------------------------------------*/
;
_SPRIN82=
0.0262923619*_S1_ACCEPTEDCMPTOTAL+
0.0112843223*_S2_INCOME+
-0.785897617*_S3_MNT+
0.2541728271*_S4_NUMDISTPURCHASES+
0.0256969066*_S5_RFMSTAT+
0.5623896823*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 3 at stage 8;
/*----------------------------------------------*/
;
_SPRIN83=
0.9046626244*_S1_ACCEPTEDCMPTOTAL+
-0.188835475*_S2_INCOME+
-0.156406342*_S3_MNT+
-0.140654415*_S4_NUMDISTPURCHASES+
0.2445164966*_S5_RFMSTAT+
-0.2046748*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 4 at stage 8;
/*----------------------------------------------*/
;
_SPRIN84=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
;
/*----------------------------------------------*/
* Component 1 at stage 9;
/*----------------------------------------------*/
;
_SPRIN91=
-0.311343989*_S1_ACCEPTEDCMPTOTAL+
-0.09192664*_S2_INCOME+
-0.060640599*_S3_MNT+
-0.054327938*_S4_NUMDISTPURCHASES+
0.9383364806*_S5_RFMSTAT+
-0.08666173*_S6_RMNTFRQ;
/*----------------------------------------------*/
* Component 2 at stage 9;
/*----------------------------------------------*/
;
_SPRIN92=
0.2884790257*_S1_ACCEPTEDCMPTOTAL+
0.4590524476*_S2_INCOME+
0.4946652679*_S3_MNT+
0.438938369*_S4_NUMDISTPURCHASES+
0.2404822302*_S5_RFMSTAT+
0.4591931838*_S6_RMNTFRQ;
;
DROP
_SPRIN01
_SPRIN02
_SPRIN03
_SPRIN04
_SPRIN05
_SPRIN11
_SPRIN12
_SPRIN13
_SPRIN14
_SPRIN15
_SPRIN21
_SPRIN22
_SPRIN23
_SPRIN24
_SPRIN25
_SPRIN26
_SPRIN31
_SPRIN32
_SPRIN33
_SPRIN34
_SPRIN35
_SPRIN41
_SPRIN42
_SPRIN43
_SPRIN51
_SPRIN52
_SPRIN61
_SPRIN62
_SPRIN71
_SPRIN72
_SPRIN81
_SPRIN82
_SPRIN83
_SPRIN84
_SPRIN91
_SPRIN92
;
;
/**********************************************************/
* Selected activation function at stage 0 = LOGIST;
/**********************************************************/
;
_YHAT0=-3.790351337
;
if -(-78.7580216583561*_SPRIN01) <= 0
then _tmpLogit=1/(1+exp(-(-78.7580216583561*_SPRIN01)));
else _tmpLogit=exp((-78.7580216583561*_SPRIN01))
/(1+exp((-78.7580216583561*_SPRIN01)));
_YHAT0=_YHAT0+1.2125160145*_tmpLogit;
if -(-0.20085109739778*_SPRIN02) <= 0
then _tmpLogit=1/(1+exp(-(-0.20085109739778*_SPRIN02)));
else _tmpLogit=exp((-0.20085109739778*_SPRIN02))
/(1+exp((-0.20085109739778*_SPRIN02)));
_YHAT0=_YHAT0+14.422044995*_tmpLogit;
if -(-33.1383346450376*_SPRIN03) <= 0
then _tmpLogit=1/(1+exp(-(-33.1383346450376*_SPRIN03)));
else _tmpLogit=exp((-33.1383346450376*_SPRIN03))
/(1+exp((-33.1383346450376*_SPRIN03)));
_YHAT0=_YHAT0+-0.363107377*_tmpLogit;
if -(7.59906937007084*_SPRIN04) <= 0
then _tmpLogit=1/(1+exp(-(7.59906937007084*_SPRIN04)));
else _tmpLogit=exp((7.59906937007084*_SPRIN04))
/(1+exp((7.59906937007084*_SPRIN04)));
_YHAT0=_YHAT0+0.039150692*_tmpLogit;
if -(0.85210915397767*_SPRIN05) <= 0
then _tmpLogit=1/(1+exp(-(0.85210915397767*_SPRIN05)));
else _tmpLogit=exp((0.85210915397767*_SPRIN05))
/(1+exp((0.85210915397767*_SPRIN05)));
_YHAT0=_YHAT0+-1.715086997*_tmpLogit;
;
/*--- Target level is binary, take a logistic link function --*/
if _YHAT0 > 0 then _YHAT0=1/(1+exp(-_YHAT0));
else _YHAT0=exp(_YHAT0)/(1+exp(_YHAT0));
;
/**********************************************************/
* Selected activation function at stage 1 = LOGIST;
/**********************************************************/
;
_RHAT1=0.0251563404
;
if -(-3.43716780937551*_SPRIN11) <= 0
then _tmpLogit=1/(1+exp(-(-3.43716780937551*_SPRIN11)));
else _tmpLogit=exp((-3.43716780937551*_SPRIN11))
/(1+exp((-3.43716780937551*_SPRIN11)));
_RHAT1=_RHAT1+0.1592016602*_tmpLogit;
if -(0.21416847077854*_SPRIN12) <= 0
then _tmpLogit=1/(1+exp(-(0.21416847077854*_SPRIN12)));
else _tmpLogit=exp((0.21416847077854*_SPRIN12))
/(1+exp((0.21416847077854*_SPRIN12)));
_RHAT1=_RHAT1+-0.605943094*_tmpLogit;
if -(1.64883929554916*_SPRIN13) <= 0
then _tmpLogit=1/(1+exp(-(1.64883929554916*_SPRIN13)));
else _tmpLogit=exp((1.64883929554916*_SPRIN13))
/(1+exp((1.64883929554916*_SPRIN13)));
_RHAT1=_RHAT1+-0.143628868*_tmpLogit;
if -(0.72304520869261*_SPRIN14) <= 0
then _tmpLogit=1/(1+exp(-(0.72304520869261*_SPRIN14)));
else _tmpLogit=exp((0.72304520869261*_SPRIN14))
/(1+exp((0.72304520869261*_SPRIN14)));
_RHAT1=_RHAT1+0.1072317513*_tmpLogit;
if -(-0.31634081743659*_SPRIN15) <= 0
then _tmpLogit=1/(1+exp(-(-0.31634081743659*_SPRIN15)));
else _tmpLogit=exp((-0.31634081743659*_SPRIN15))
/(1+exp((-0.31634081743659*_SPRIN15)));
_RHAT1=_RHAT1+0.3040322724*_tmpLogit;
;
;
/**********************************************************/
* Selected activation function at stage 2 = TANH;
/**********************************************************/
;
_RHAT2=0.0037368744
+0.24509185564498*TANH(-0.22766591063218*_SPRIN21)
+-0.12226104493481*TANH(0.11844355916085*_SPRIN22)
+0.22736439254794*TANH(0.05489227554239*_SPRIN23)
+0.05254666351477*TANH(-0.78180525890618*_SPRIN24)
+0.07483544124088*TANH(-0.12431837995063*_SPRIN25)
+-0.01686883514205*TANH(0.39709097344802*_SPRIN26)
;
;
/**********************************************************/
* Selected activation function at stage 3 = SQUARE;
/**********************************************************/
;
_RHAT3=-0.022052101
+(-0.0977177085079+0.00691990140402*_SPRIN31)*_SPRIN31
+(-0.03059395418228+-0.00667288771384*_SPRIN32)*_SPRIN32
+(0.03747596772594+0.00571410506002*_SPRIN33)*_SPRIN33
+(0.02410862500084+0.01363577745125*_SPRIN34)*_SPRIN34
+(-0.00136695465228+0.0036463140305*_SPRIN35)*_SPRIN35
;
;
/**********************************************************/
* Selected activation function at stage 4 = LOGIST;
/**********************************************************/
;
_RHAT4=0.0441385056
;
if -(-3.50378275616244*_SPRIN41) <= 0
then _tmpLogit=1/(1+exp(-(-3.50378275616244*_SPRIN41)));
else _tmpLogit=exp((-3.50378275616244*_SPRIN41))
/(1+exp((-3.50378275616244*_SPRIN41)));
_RHAT4=_RHAT4+0.0675674361*_tmpLogit;
if -(-0.68142768864615*_SPRIN42) <= 0
then _tmpLogit=1/(1+exp(-(-0.68142768864615*_SPRIN42)));
else _tmpLogit=exp((-0.68142768864615*_SPRIN42))
/(1+exp((-0.68142768864615*_SPRIN42)));
_RHAT4=_RHAT4+0.0788330005*_tmpLogit;
if -(0.01804490084237*_SPRIN43) <= 0
then _tmpLogit=1/(1+exp(-(0.01804490084237*_SPRIN43)));
else _tmpLogit=exp((0.01804490084237*_SPRIN43))
/(1+exp((0.01804490084237*_SPRIN43)));
_RHAT4=_RHAT4+-0.201594425*_tmpLogit;
;
;
/**********************************************************/
* Selected activation function at stage 5 = COS;
/**********************************************************/
;
_RHAT5=1.6036995269
+-0.79319039901112*COS(0.35522643723722*_SPRIN51*(2/ARCOS(-1)))
+-0.82284903068383*COS(0.03064693387791*_SPRIN52*(2/ARCOS(-1)))
;
;
/**********************************************************/
* Selected activation function at stage 6 = LOGIST;
/**********************************************************/
;
_RHAT6=0.1
;
if -(-0.1*_SPRIN61) <= 0
then _tmpLogit=1/(1+exp(-(-0.1*_SPRIN61)));
else _tmpLogit=exp((-0.1*_SPRIN61))
/(1+exp((-0.1*_SPRIN61)));
_RHAT6=_RHAT6+-0.1*_tmpLogit;
if -(0.1*_SPRIN62) <= 0
then _tmpLogit=1/(1+exp(-(0.1*_SPRIN62)));
else _tmpLogit=exp((0.1*_SPRIN62))
/(1+exp((0.1*_SPRIN62)));
_RHAT6=_RHAT6+-0.1*_tmpLogit;
;
;
/**********************************************************/
* Selected activation function at stage 7 = GAUSS;
/**********************************************************/
;
_RHAT7=0.1936780186
+0.04053032681598*exp(-(9.24176504115922*_SPRIN71*9.24176504115922*_SPRIN71))
+-0.20785410800795*exp(-(0.29311251021882*_SPRIN72*0.29311251021882*_SPRIN72))
;
;
/**********************************************************/
* Selected activation function at stage 8 = LOGIST;
/**********************************************************/
;
_RHAT8=0.0959411414
;
if -(-0.46525905235341*_SPRIN81) <= 0
then _tmpLogit=1/(1+exp(-(-0.46525905235341*_SPRIN81)));
else _tmpLogit=exp((-0.46525905235341*_SPRIN81))
/(1+exp((-0.46525905235341*_SPRIN81)));
_RHAT8=_RHAT8+0.1033285648*_tmpLogit;
if -(2.13410240213739*_SPRIN82) <= 0
then _tmpLogit=1/(1+exp(-(2.13410240213739*_SPRIN82)));
else _tmpLogit=exp((2.13410240213739*_SPRIN82))
/(1+exp((2.13410240213739*_SPRIN82)));
_RHAT8=_RHAT8+-0.101630747*_tmpLogit;
if -(0.31625236500835*_SPRIN83) <= 0
then _tmpLogit=1/(1+exp(-(0.31625236500835*_SPRIN83)));
else _tmpLogit=exp((0.31625236500835*_SPRIN83))
/(1+exp((0.31625236500835*_SPRIN83)));
_RHAT8=_RHAT8+-0.098830155*_tmpLogit;
if -(0.01058734408671*_SPRIN84) <= 0
then _tmpLogit=1/(1+exp(-(0.01058734408671*_SPRIN84)));
else _tmpLogit=exp((0.01058734408671*_SPRIN84))
/(1+exp((0.01058734408671*_SPRIN84)));
_RHAT8=_RHAT8+-0.086531966*_tmpLogit;
;
;
/**********************************************************/
* Selected activation function at stage 9 = COS;
/**********************************************************/
;
_RHAT9=0.073209372
+-0.07686528190743*COS(0.86827538576157*_SPRIN91*(2/ARCOS(-1)))
+-0.01265860256501*COS(-0.37912517119517*_SPRIN92*(2/ARCOS(-1)))
;
;
_tmpPredict
=_YHAT0
+_RHAT1
+_RHAT2
+_RHAT3
+_RHAT4
+_RHAT5
+_RHAT6
+_RHAT7
+_RHAT8
+_RHAT9
;
_tmpPredict=1-_tmpPredict;
If _tmpPredict > 1 then _tmpPredict=1;
else if _tmpPredict < 0 then _tmpPredict=0;
P_DepVar1=_tmpPredict;
label P_DepVar1 = "Predicted: DepVar=1";
P_DepVar0=1-_tmpPredict;
label P_DepVar0 = "Predicted: DepVar=0";
if P_DepVar1 ge 0.5 then I_DepVar="1";
else I_DepVar="0";
if F_DepVar NE "1" AND F_DepVar NE "0" then do;
R_DepVar1 = .;
R_DepVar0 = .;
end;
else do;
R_DepVar1 = -P_DepVar1;
R_DepVar0 = -P_DepVar0;
SELECT(F_DepVar);
WHEN("1") R_DepVar1 = R_DepVar1 +1;
WHEN("0") R_DepVar0 = R_DepVar0 +1;
OTHERWISE;
end;
END;
;
DROP _YHAT0
_RHAT1
_RHAT2
_RHAT3
_RHAT4
_RHAT5
_RHAT6
_RHAT7
_RHAT8
_RHAT9
_tmpLogit
_tmpPredict
_S1_ACCEPTEDCMPTOTAL
_S2_INCOME
_S3_MNT
_S4_NUMDISTPURCHASES
_S5_RFMSTAT
_S6_RMNTFRQ
;
