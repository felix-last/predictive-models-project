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
if Mnt=. then _S2_MNT = 0;
else _S2_MNT=(Mnt-615.68197135636)/604.537497355942;
if MntMeatProducts=. then _S3_MNTMEATPRODUCTS = 0;
else _S3_MNTMEATPRODUCTS=(MntMeatProducts-169.965037910699)/216.176716057929;
if NumCatalogPurchases=. then _S4_NUMCATALOGPURCHASES = 0;
else _S4_NUMCATALOGPURCHASES=(NumCatalogPurchases-2.64448188711036)/2.77214051734809;
if RFMstat=. then _S5_RFMSTAT = 0;
else _S5_RFMSTAT=(RFMstat-531.396946202505)/1565.49314871989;
if Recency=. then _S6_RECENCY = 0;
else _S6_RECENCY=(Recency-48.7742207245156)/28.8224799181808;
;
/*----------------------------------------------*/
* Component 1 at stage 0;
/*----------------------------------------------*/
;
_SPRIN01=
0.3290397948*_S1_ACCEPTEDCMPTOTAL+
0.5374691584*_S2_MNT+
0.5080895383*_S3_MNTMEATPRODUCTS+
0.5017950101*_S4_NUMCATALOGPURCHASES+
0.3013048241*_S5_RFMSTAT+
-0.046064184*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 0;
/*----------------------------------------------*/
;
_SPRIN02=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 0;
/*----------------------------------------------*/
;
_SPRIN03=
0.1374691289*_S1_ACCEPTEDCMPTOTAL+
0.1087901318*_S2_MNT+
0.0846582314*_S3_MNTMEATPRODUCTS+
0.1168772715*_S4_NUMCATALOGPURCHASES+
-0.559752239*_S5_RFMSTAT+
0.7969423216*_S6_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 0;
/*----------------------------------------------*/
;
_SPRIN04=
0.0864282309*_S1_ACCEPTEDCMPTOTAL+
-0.796009619*_S2_MNT+
0.5578145973*_S3_MNTMEATPRODUCTS+
0.214935625*_S4_NUMCATALOGPURCHASES+
0.0306971608*_S5_RFMSTAT+
0.0245374038*_S6_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 0;
/*----------------------------------------------*/
;
_SPRIN05=
0.0453091502*_S1_ACCEPTEDCMPTOTAL+
-0.113848017*_S2_MNT+
-0.190193757*_S3_MNTMEATPRODUCTS+
-0.122879307*_S4_NUMCATALOGPURCHASES+
0.7685193197*_S5_RFMSTAT+
0.585739512*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 1;
/*----------------------------------------------*/
;
_SPRIN11=
0.0864282309*_S1_ACCEPTEDCMPTOTAL+
-0.796009619*_S2_MNT+
0.5578145973*_S3_MNTMEATPRODUCTS+
0.214935625*_S4_NUMCATALOGPURCHASES+
0.0306971608*_S5_RFMSTAT+
0.0245374038*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 1;
/*----------------------------------------------*/
;
_SPRIN12=
0.3290397948*_S1_ACCEPTEDCMPTOTAL+
0.5374691584*_S2_MNT+
0.5080895383*_S3_MNTMEATPRODUCTS+
0.5017950101*_S4_NUMCATALOGPURCHASES+
0.3013048241*_S5_RFMSTAT+
-0.046064184*_S6_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 1;
/*----------------------------------------------*/
;
_SPRIN13=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 1;
/*----------------------------------------------*/
;
_SPRIN14=
0.0792320846*_S1_ACCEPTEDCMPTOTAL+
0.1798296437*_S2_MNT+
0.5541281961*_S3_MNTMEATPRODUCTS+
-0.808383705*_S4_NUMCATALOGPURCHASES+
0.0087823313*_S5_RFMSTAT+
0.0276437095*_S6_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 1;
/*----------------------------------------------*/
;
_SPRIN15=
0.1374691289*_S1_ACCEPTEDCMPTOTAL+
0.1087901318*_S2_MNT+
0.0846582314*_S3_MNTMEATPRODUCTS+
0.1168772715*_S4_NUMCATALOGPURCHASES+
-0.559752239*_S5_RFMSTAT+
0.7969423216*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 2;
/*----------------------------------------------*/
;
_SPRIN21=
0.0864282309*_S1_ACCEPTEDCMPTOTAL+
-0.796009619*_S2_MNT+
0.5578145973*_S3_MNTMEATPRODUCTS+
0.214935625*_S4_NUMCATALOGPURCHASES+
0.0306971608*_S5_RFMSTAT+
0.0245374038*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 2;
/*----------------------------------------------*/
;
_SPRIN22=
0.0792320846*_S1_ACCEPTEDCMPTOTAL+
0.1798296437*_S2_MNT+
0.5541281961*_S3_MNTMEATPRODUCTS+
-0.808383705*_S4_NUMCATALOGPURCHASES+
0.0087823313*_S5_RFMSTAT+
0.0276437095*_S6_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 2;
/*----------------------------------------------*/
;
_SPRIN23=
0.3290397948*_S1_ACCEPTEDCMPTOTAL+
0.5374691584*_S2_MNT+
0.5080895383*_S3_MNTMEATPRODUCTS+
0.5017950101*_S4_NUMCATALOGPURCHASES+
0.3013048241*_S5_RFMSTAT+
-0.046064184*_S6_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 2;
/*----------------------------------------------*/
;
_SPRIN24=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 3;
/*----------------------------------------------*/
;
_SPRIN31=
0.0864282309*_S1_ACCEPTEDCMPTOTAL+
-0.796009619*_S2_MNT+
0.5578145973*_S3_MNTMEATPRODUCTS+
0.214935625*_S4_NUMCATALOGPURCHASES+
0.0306971608*_S5_RFMSTAT+
0.0245374038*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 3;
/*----------------------------------------------*/
;
_SPRIN32=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 4;
/*----------------------------------------------*/
;
_SPRIN41=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 4;
/*----------------------------------------------*/
;
_SPRIN42=
0.0453091502*_S1_ACCEPTEDCMPTOTAL+
-0.113848017*_S2_MNT+
-0.190193757*_S3_MNTMEATPRODUCTS+
-0.122879307*_S4_NUMCATALOGPURCHASES+
0.7685193197*_S5_RFMSTAT+
0.585739512*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 5;
/*----------------------------------------------*/
;
_SPRIN51=
0.0453091502*_S1_ACCEPTEDCMPTOTAL+
-0.113848017*_S2_MNT+
-0.190193757*_S3_MNTMEATPRODUCTS+
-0.122879307*_S4_NUMCATALOGPURCHASES+
0.7685193197*_S5_RFMSTAT+
0.585739512*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 5;
/*----------------------------------------------*/
;
_SPRIN52=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 5;
/*----------------------------------------------*/
;
_SPRIN53=
0.1374691289*_S1_ACCEPTEDCMPTOTAL+
0.1087901318*_S2_MNT+
0.0846582314*_S3_MNTMEATPRODUCTS+
0.1168772715*_S4_NUMCATALOGPURCHASES+
-0.559752239*_S5_RFMSTAT+
0.7969423216*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 6;
/*----------------------------------------------*/
;
_SPRIN61=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 6;
/*----------------------------------------------*/
;
_SPRIN62=
0.0453091502*_S1_ACCEPTEDCMPTOTAL+
-0.113848017*_S2_MNT+
-0.190193757*_S3_MNTMEATPRODUCTS+
-0.122879307*_S4_NUMCATALOGPURCHASES+
0.7685193197*_S5_RFMSTAT+
0.585739512*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 7;
/*----------------------------------------------*/
;
_SPRIN71=
0.0453091502*_S1_ACCEPTEDCMPTOTAL+
-0.113848017*_S2_MNT+
-0.190193757*_S3_MNTMEATPRODUCTS+
-0.122879307*_S4_NUMCATALOGPURCHASES+
0.7685193197*_S5_RFMSTAT+
0.585739512*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 7;
/*----------------------------------------------*/
;
_SPRIN72=
0.9257616165*_S1_ACCEPTEDCMPTOTAL+
-0.142689264*_S2_MNT+
-0.283353414*_S3_MNTMEATPRODUCTS+
-0.140572437*_S4_NUMCATALOGPURCHASES+
-0.065203098*_S5_RFMSTAT+
-0.135292247*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 8;
/*----------------------------------------------*/
;
_SPRIN81=
0.1374691289*_S1_ACCEPTEDCMPTOTAL+
0.1087901318*_S2_MNT+
0.0846582314*_S3_MNTMEATPRODUCTS+
0.1168772715*_S4_NUMCATALOGPURCHASES+
-0.559752239*_S5_RFMSTAT+
0.7969423216*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 8;
/*----------------------------------------------*/
;
_SPRIN82=
0.0792320846*_S1_ACCEPTEDCMPTOTAL+
0.1798296437*_S2_MNT+
0.5541281961*_S3_MNTMEATPRODUCTS+
-0.808383705*_S4_NUMCATALOGPURCHASES+
0.0087823313*_S5_RFMSTAT+
0.0276437095*_S6_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 9;
/*----------------------------------------------*/
;
_SPRIN91=
0.0792320846*_S1_ACCEPTEDCMPTOTAL+
0.1798296437*_S2_MNT+
0.5541281961*_S3_MNTMEATPRODUCTS+
-0.808383705*_S4_NUMCATALOGPURCHASES+
0.0087823313*_S5_RFMSTAT+
0.0276437095*_S6_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 9;
/*----------------------------------------------*/
;
_SPRIN92=
0.1374691289*_S1_ACCEPTEDCMPTOTAL+
0.1087901318*_S2_MNT+
0.0846582314*_S3_MNTMEATPRODUCTS+
0.1168772715*_S4_NUMCATALOGPURCHASES+
-0.559752239*_S5_RFMSTAT+
0.7969423216*_S6_RECENCY;
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
_SPRIN31
_SPRIN32
_SPRIN41
_SPRIN42
_SPRIN51
_SPRIN52
_SPRIN53
_SPRIN61
_SPRIN62
_SPRIN71
_SPRIN72
_SPRIN81
_SPRIN82
_SPRIN91
_SPRIN92
;
;
/**********************************************************/
* Selected activation function at stage 0 = SIN;
/**********************************************************/
;
_YHAT0=2.2012932637
+14.8557194238155*SIN(-0.05655276542652*_SPRIN01*(2/ARCOS(-1)))
+13.481909413672*SIN(-0.09677887213153*_SPRIN02*(2/ARCOS(-1)))
+2.83596778718721*SIN(0.48529364915088*_SPRIN03*(2/ARCOS(-1)))
+4.21906784539051*SIN(-0.42769522194195*_SPRIN04*(2/ARCOS(-1)))
+1.07052649577056*SIN(0.88037255841185*_SPRIN05*(2/ARCOS(-1)))
;
/*--- Target level is binary, take a logistic link function --*/
if _YHAT0 > 0 then _YHAT0=1/(1+exp(-_YHAT0));
else _YHAT0=exp(_YHAT0)/(1+exp(_YHAT0));
;
/**********************************************************/
* Selected activation function at stage 1 = GAUSS;
/**********************************************************/
;
_RHAT1=-0.123866614
+0.07706294217246*exp(-(2.92544781120774*_SPRIN11*2.92544781120774*_SPRIN11))
+0.16922821677663*exp(-(0.16725539875894*_SPRIN12*0.16725539875894*_SPRIN12))
+0.07551172421375*exp(-(0.48574717515447*_SPRIN13*0.48574717515447*_SPRIN13))
+-0.08952117295162*exp(-(0.55229720822169*_SPRIN14*0.55229720822169*_SPRIN14))
+-0.06615313227777*exp(-(-0.53782679423952*_SPRIN15*-0.53782679423952*_SPRIN15))
;
;
/**********************************************************/
* Selected activation function at stage 2 = TANH;
/**********************************************************/
;
_RHAT2=0.008215354
+-0.16001558456505*TANH(0.2712320323826*_SPRIN21)
+0.12356430469767*TANH(0.1686070475744*_SPRIN22)
+-0.01390368846175*TANH(-1.31495933200985*_SPRIN23)
+-0.00711588556486*TANH(0.02635498107348*_SPRIN24)
;
;
/**********************************************************/
* Selected activation function at stage 3 = SQUARE;
/**********************************************************/
;
_RHAT3=-0.00306658
+(-0.01736246972984+-0.02979330795282*_SPRIN31)*_SPRIN31
+(-0.00332049293721+0.0030791815984*_SPRIN32)*_SPRIN32
;
;
/**********************************************************/
* Selected activation function at stage 4 = COS;
/**********************************************************/
;
_RHAT4=0.0826256873
+-0.12238172190706*COS(0.02282548926214*_SPRIN41*(2/ARCOS(-1)))
+0.04484860199928*COS(1.48265756415328*_SPRIN42*(2/ARCOS(-1)))
;
;
/**********************************************************/
* Selected activation function at stage 5 = COS;
/**********************************************************/
;
_RHAT5=-0.52219127
+-0.00160515605439*COS(0.30587662321319*_SPRIN51*(2/ARCOS(-1)))
+0.57980710141949*COS(0.05285096253042*_SPRIN52*(2/ARCOS(-1)))
+-0.05638211732802*COS(0.39892152738836*_SPRIN53*(2/ARCOS(-1)))
;
;
/**********************************************************/
* Selected activation function at stage 6 = GAUSS;
/**********************************************************/
;
_RHAT6=0.2291041173
+-0.27087104133354*exp(-(0.01497465137757*_SPRIN61*0.01497465137757*_SPRIN61))
+0.04495253299061*exp(-(-0.53853738934044*_SPRIN62*-0.53853738934044*_SPRIN62))
;
;
/**********************************************************/
* Selected activation function at stage 7 = TANH;
/**********************************************************/
;
_RHAT7=-0.000155303
+0.08225980630599*TANH(0.09090661078805*_SPRIN71)
+-0.00601524575819*TANH(1.83770197448699*_SPRIN72)
;
;
/**********************************************************/
* Selected activation function at stage 8 = TANH;
/**********************************************************/
;
_RHAT8=0.0003764288
+9.9565532917997E-6*TANH(0.25338971357985*_SPRIN81)
+0.01274328817113*TANH(3.99440936961243*_SPRIN82)
;
;
/**********************************************************/
* Selected activation function at stage 9 = SQUARE;
/**********************************************************/
;
_RHAT9=0.0362328144
+(0.08320836153318+-0.04610022807898*_SPRIN91)*_SPRIN91
+(0.02838947392465+0.00729753230704*_SPRIN92)*_SPRIN92
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
_tmpPredict
_S1_ACCEPTEDCMPTOTAL
_S2_MNT
_S3_MNTMEATPRODUCTS
_S4_NUMCATALOGPURCHASES
_S5_RFMSTAT
_S6_RECENCY
;
