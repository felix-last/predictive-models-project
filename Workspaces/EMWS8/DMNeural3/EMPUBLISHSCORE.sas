**********************************************************;
**** Begin scoring code for DMNeural;
**********************************************************;
LENGTH _WARN_ $ 4;
LABEL _WARN_ = "Warnings";
LENGTH I_DepVar $%DMNORLEN;
LABEL I_DepVar="Into: DepVar";
LENGTH _FORMAT_ $200;
LENGTH _NORMFMT_ $%DMNORLEN;
;
/************************************************/
* Create dummy variables for Marital_Status;
/************************************************/
;
_FORMAT_ =PUT(Marital_Status,$8.0);
%DMNORMCP(_FORMAT_ , _NORMFMT_ );
IF _NORMFMT_ ="DIVORCED" THEN Marital_Status_1_=2.98126168425242;
/*---- (1-0.10109519797809)/0.30151824872338 -----*/
ELSE Marital_Status_1_=-0.33528716224019;
/*---- (0-0.10109519797809)/0.30151824872338 -----*/
IF _NORMFMT_ ="MARRIED" THEN Marital_Status_2_=1.18621875805397;
/*---- (1-0.41533277169334)/0.49288314177885 -----*/
ELSE Marital_Status_2_=-0.84265972294036;
/*---- (0-0.41533277169334)/0.49288314177885 -----*/
IF _NORMFMT_ ="SINGLE" THEN Marital_Status_3_=1.8948253753083;
/*---- (1-0.21777590564448)/0.41282120481854 -----*/
ELSE Marital_Status_3_=-0.52753081261949;
/*---- (0-0.21777590564448)/0.41282120481854 -----*/
IF _NORMFMT_ ="TOGETHER" THEN Marital_Status_4_=1.80152761035906;
/*---- (1-0.23546756529064)/0.42438008183342 -----*/
ELSE Marital_Status_4_=-0.55485065244667;
/*---- (0-0.23546756529064)/0.42438008183342 -----*/
IF _NORMFMT_ ="WIDOW" THEN Marital_Status_5_=5.65320745801221;
/*---- (1-0.03032855939342)/0.17152589000289 -----*/
ELSE Marital_Status_5_=-0.17681621936441;
/*---- (0-0.03032855939342)/0.17152589000289 -----*/
DROP
_FORMAT_ _NORMFMT_;
;
/*-------------------------------------------------------------------------*/
*Impute missing values for interval variables;
/*-------------------------------------------------------------------------*/
;
if AcceptedCmpTotal=. then _S1_ACCEPTEDCMPTOTAL = 0;
else _S1_ACCEPTEDCMPTOTAL=(AcceptedCmpTotal-0.31255265374894)/0.66837726102124;
if Frq=. then _S2_FRQ = 0;
else _S2_FRQ=(Frq-12.6545914069081)/7.15980860291451;
if Mnt=. then _S3_MNT = 0;
else _S3_MNT=(Mnt-615.68197135636)/604.537497355942;
if MntMeatProducts=. then _S4_MNTMEATPRODUCTS = 0;
else _S4_MNTMEATPRODUCTS=(MntMeatProducts-169.965037910699)/216.176716057929;
if NumCatalogPurchases=. then _S5_NUMCATALOGPURCHASES = 0;
else _S5_NUMCATALOGPURCHASES=(NumCatalogPurchases-2.64448188711036)/2.77214051734809;
if NumDealsPurchases=. then _S6_NUMDEALSPURCHASES = 0;
else _S6_NUMDEALSPURCHASES=(NumDealsPurchases-2.25526537489469)/1.67318269219337;
if NumWebVisitsMonth=. then _S7_NUMWEBVISITSMONTH = 0;
else _S7_NUMWEBVISITSMONTH=(NumWebVisitsMonth-5.24220724515585)/2.33225525940929;
if Recency=. then _S8_RECENCY = 0;
else _S8_RECENCY=(Recency-48.7742207245156)/28.8224799181808;
;
/*----------------------------------------------*/
* Component 1 at stage 0;
/*----------------------------------------------*/
;
_SPRIN01=
-0.030533433*Marital_Status_1_+
-0.027998459*Marital_Status_2_+
0.0214882295*Marital_Status_3_+
0.0497827209*Marital_Status_4_+
-0.040759072*Marital_Status_5_+
0.9051379856*_S1_ACCEPTEDCMPTOTAL+
-0.141633693*_S2_FRQ+
-0.027881214*_S3_MNT+
-0.116645115*_S4_MNTMEATPRODUCTS+
-0.086193895*_S5_NUMCATALOGPURCHASES+
-0.224050139*_S6_NUMDEALSPURCHASES+
0.2854421342*_S7_NUMWEBVISITSMONTH+
-0.029309469*_S8_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 0;
/*----------------------------------------------*/
;
_SPRIN02=
-0.158984376*Marital_Status_1_+
-0.029292114*Marital_Status_2_+
0.0652374414*Marital_Status_3_+
-0.047272583*Marital_Status_4_+
0.3235921012*Marital_Status_5_+
0.0050764455*_S1_ACCEPTEDCMPTOTAL+
-0.053126301*_S2_FRQ+
-0.029062364*_S3_MNT+
-0.026276531*_S4_MNTMEATPRODUCTS+
-0.016173632*_S5_NUMCATALOGPURCHASES+
-0.160580587*_S6_NUMDEALSPURCHASES+
-0.063858808*_S7_NUMWEBVISITSMONTH+
0.9100299784*_S8_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 0;
/*----------------------------------------------*/
;
_SPRIN03=
-0.009163356*Marital_Status_1_+
-0.017190525*Marital_Status_2_+
0.0041674821*Marital_Status_3_+
0.0108473335*Marital_Status_4_+
0.0286372045*Marital_Status_5_+
0.2589037298*_S1_ACCEPTEDCMPTOTAL+
0.4288634785*_S2_FRQ+
0.468169543*_S3_MNT+
0.4406657126*_S4_MNTMEATPRODUCTS+
0.4512293115*_S5_NUMCATALOGPURCHASES+
-0.120164039*_S6_NUMDEALSPURCHASES+
-0.341012847*_S7_NUMWEBVISITSMONTH+
0.002081234*_S8_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 0;
/*----------------------------------------------*/
;
_SPRIN04=
-0.004105841*Marital_Status_1_+
0.0026546575*Marital_Status_2_+
-0.011950511*Marital_Status_3_+
0.0078474067*Marital_Status_4_+
0.0089356261*Marital_Status_5_+
-0.004132789*_S1_ACCEPTEDCMPTOTAL+
-0.562859505*_S2_FRQ+
-0.277471603*_S3_MNT+
0.2126634859*_S4_MNTMEATPRODUCTS+
0.7310937079*_S5_NUMCATALOGPURCHASES+
0.1193426498*_S6_NUMDEALSPURCHASES+
0.1090597873*_S7_NUMWEBVISITSMONTH+
0.0036037072*_S8_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 0;
/*----------------------------------------------*/
;
_SPRIN05=
0.0422645704*Marital_Status_1_+
-0.045690447*Marital_Status_2_+
0.7146731592*Marital_Status_3_+
-0.682396424*Marital_Status_4_+
0.0253007126*Marital_Status_5_+
0.0300322737*_S1_ACCEPTEDCMPTOTAL+
0.0233845108*_S2_FRQ+
0.0185707635*_S3_MNT+
-0.002634244*_S4_MNTMEATPRODUCTS+
0.0212505751*_S5_NUMCATALOGPURCHASES+
0.0939199651*_S6_NUMDEALSPURCHASES+
0.0592362947*_S7_NUMWEBVISITSMONTH+
-0.066942428*_S8_RECENCY;
/*----------------------------------------------*/
* Component 6 at stage 0;
/*----------------------------------------------*/
;
_SPRIN06=
-0.133661323*Marital_Status_1_+
-0.051981669*Marital_Status_2_+
-0.137405736*Marital_Status_3_+
-0.079938161*Marital_Status_4_+
0.9128090284*Marital_Status_5_+
0.0224242054*_S1_ACCEPTEDCMPTOTAL+
-0.006793272*_S2_FRQ+
-0.013098113*_S3_MNT+
-0.029730878*_S4_MNTMEATPRODUCTS+
-0.014442513*_S5_NUMCATALOGPURCHASES+
0.0017352662*_S6_NUMDEALSPURCHASES+
0.0088977322*_S7_NUMWEBVISITSMONTH+
-0.34503122*_S8_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 1;
/*----------------------------------------------*/
;
_SPRIN11=
0.0088433896*Marital_Status_1_+
-0.012550627*Marital_Status_2_+
-0.002271234*Marital_Status_3_+
0.0021642821*Marital_Status_4_+
0.0206306135*Marital_Status_5_+
0.1009035281*_S1_ACCEPTEDCMPTOTAL+
-0.456946736*_S2_FRQ+
0.1988530541*_S3_MNT+
0.6183600004*_S4_MNTMEATPRODUCTS+
-0.481393504*_S5_NUMCATALOGPURCHASES+
0.311462421*_S6_NUMDEALSPURCHASES+
-0.170402162*_S7_NUMWEBVISITSMONTH+
0.0254931556*_S8_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 1;
/*----------------------------------------------*/
;
_SPRIN12=
0.0106637752*Marital_Status_1_+
-0.006976946*Marital_Status_2_+
0.0029754745*Marital_Status_3_+
-0.005574564*Marital_Status_4_+
0.0079340274*Marital_Status_5_+
0.0743426991*_S1_ACCEPTEDCMPTOTAL+
0.4172241749*_S2_FRQ+
-0.756399427*_S3_MNT+
0.4836524496*_S4_MNTMEATPRODUCTS+
-0.1064254*_S5_NUMCATALOGPURCHASES+
-0.033812052*_S6_NUMDEALSPURCHASES+
0.0394187446*_S7_NUMWEBVISITSMONTH+
0.0069739491*_S8_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 1;
/*----------------------------------------------*/
;
_SPRIN13=
0.0059671872*Marital_Status_1_+
0.0184384503*Marital_Status_2_+
-0.020790781*Marital_Status_3_+
-0.011947833*Marital_Status_4_+
0.0161263141*Marital_Status_5_+
-0.272236938*_S1_ACCEPTEDCMPTOTAL+
0.0343385179*_S2_FRQ+
0.2782657866*_S3_MNT+
0.3531293035*_S4_MNTMEATPRODUCTS+
-0.02753263*_S5_NUMCATALOGPURCHASES+
-0.36457907*_S6_NUMDEALSPURCHASES+
0.766563427*_S7_NUMWEBVISITSMONTH+
0.0083475574*_S8_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 1;
/*----------------------------------------------*/
;
_SPRIN14=
-0.004105841*Marital_Status_1_+
0.0026546575*Marital_Status_2_+
-0.011950511*Marital_Status_3_+
0.0078474067*Marital_Status_4_+
0.0089356261*Marital_Status_5_+
-0.004132789*_S1_ACCEPTEDCMPTOTAL+
-0.562859505*_S2_FRQ+
-0.277471603*_S3_MNT+
0.2126634859*_S4_MNTMEATPRODUCTS+
0.7310937079*_S5_NUMCATALOGPURCHASES+
0.1193426498*_S6_NUMDEALSPURCHASES+
0.1090597873*_S7_NUMWEBVISITSMONTH+
0.0036037072*_S8_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 1;
/*----------------------------------------------*/
;
_SPRIN15=
0.4188802441*Marital_Status_1_+
-0.108693579*Marital_Status_2_+
-0.18569781*Marital_Status_3_+
-0.030796546*Marital_Status_4_+
0.0991257331*Marital_Status_5_+
0.133338802*_S1_ACCEPTEDCMPTOTAL+
0.2615189161*_S2_FRQ+
0.0994085062*_S3_MNT+
-0.065649042*_S4_MNTMEATPRODUCTS+
0.089704836*_S5_NUMCATALOGPURCHASES+
0.6988027641*_S6_NUMDEALSPURCHASES+
0.3548155116*_S7_NUMWEBVISITSMONTH+
0.2117486643*_S8_RECENCY;
/*----------------------------------------------*/
* Component 6 at stage 1;
/*----------------------------------------------*/
;
_SPRIN16=
-0.795416959*Marital_Status_1_+
0.0824648192*Marital_Status_2_+
0.2317116976*Marital_Status_3_+
0.2690782351*Marital_Status_4_+
-0.062146515*Marital_Status_5_+
0.0182327007*_S1_ACCEPTEDCMPTOTAL+
0.1513611302*_S2_FRQ+
0.0513363831*_S3_MNT+
-0.010073056*_S4_MNTMEATPRODUCTS+
0.0406819984*_S5_NUMCATALOGPURCHASES+
0.4050473454*_S6_NUMDEALSPURCHASES+
0.1960229521*_S7_NUMWEBVISITSMONTH+
-0.020806956*_S8_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 2;
/*----------------------------------------------*/
;
_SPRIN21=
-0.004105841*Marital_Status_1_+
0.0026546575*Marital_Status_2_+
-0.011950511*Marital_Status_3_+
0.0078474067*Marital_Status_4_+
0.0089356261*Marital_Status_5_+
-0.004132789*_S1_ACCEPTEDCMPTOTAL+
-0.562859505*_S2_FRQ+
-0.277471603*_S3_MNT+
0.2126634859*_S4_MNTMEATPRODUCTS+
0.7310937079*_S5_NUMCATALOGPURCHASES+
0.1193426498*_S6_NUMDEALSPURCHASES+
0.1090597873*_S7_NUMWEBVISITSMONTH+
0.0036037072*_S8_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 2;
/*----------------------------------------------*/
;
_SPRIN22=
-0.009163356*Marital_Status_1_+
-0.017190525*Marital_Status_2_+
0.0041674821*Marital_Status_3_+
0.0108473335*Marital_Status_4_+
0.0286372045*Marital_Status_5_+
0.2589037298*_S1_ACCEPTEDCMPTOTAL+
0.4288634785*_S2_FRQ+
0.468169543*_S3_MNT+
0.4406657126*_S4_MNTMEATPRODUCTS+
0.4512293115*_S5_NUMCATALOGPURCHASES+
-0.120164039*_S6_NUMDEALSPURCHASES+
-0.341012847*_S7_NUMWEBVISITSMONTH+
0.002081234*_S8_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 2;
/*----------------------------------------------*/
;
_SPRIN23=
-0.133661323*Marital_Status_1_+
-0.051981669*Marital_Status_2_+
-0.137405736*Marital_Status_3_+
-0.079938161*Marital_Status_4_+
0.9128090284*Marital_Status_5_+
0.0224242054*_S1_ACCEPTEDCMPTOTAL+
-0.006793272*_S2_FRQ+
-0.013098113*_S3_MNT+
-0.029730878*_S4_MNTMEATPRODUCTS+
-0.014442513*_S5_NUMCATALOGPURCHASES+
0.0017352662*_S6_NUMDEALSPURCHASES+
0.0088977322*_S7_NUMWEBVISITSMONTH+
-0.34503122*_S8_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 2;
/*----------------------------------------------*/
;
_SPRIN24=
0.0106637752*Marital_Status_1_+
-0.006976946*Marital_Status_2_+
0.0029754745*Marital_Status_3_+
-0.005574564*Marital_Status_4_+
0.0079340274*Marital_Status_5_+
0.0743426991*_S1_ACCEPTEDCMPTOTAL+
0.4172241749*_S2_FRQ+
-0.756399427*_S3_MNT+
0.4836524496*_S4_MNTMEATPRODUCTS+
-0.1064254*_S5_NUMCATALOGPURCHASES+
-0.033812052*_S6_NUMDEALSPURCHASES+
0.0394187446*_S7_NUMWEBVISITSMONTH+
0.0069739491*_S8_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 2;
/*----------------------------------------------*/
;
_SPRIN25=
-0.030533433*Marital_Status_1_+
-0.027998459*Marital_Status_2_+
0.0214882295*Marital_Status_3_+
0.0497827209*Marital_Status_4_+
-0.040759072*Marital_Status_5_+
0.9051379856*_S1_ACCEPTEDCMPTOTAL+
-0.141633693*_S2_FRQ+
-0.027881214*_S3_MNT+
-0.116645115*_S4_MNTMEATPRODUCTS+
-0.086193895*_S5_NUMCATALOGPURCHASES+
-0.224050139*_S6_NUMDEALSPURCHASES+
0.2854421342*_S7_NUMWEBVISITSMONTH+
-0.029309469*_S8_RECENCY;
/*----------------------------------------------*/
* Component 6 at stage 2;
/*----------------------------------------------*/
;
_SPRIN26=
0.0088433896*Marital_Status_1_+
-0.012550627*Marital_Status_2_+
-0.002271234*Marital_Status_3_+
0.0021642821*Marital_Status_4_+
0.0206306135*Marital_Status_5_+
0.1009035281*_S1_ACCEPTEDCMPTOTAL+
-0.456946736*_S2_FRQ+
0.1988530541*_S3_MNT+
0.6183600004*_S4_MNTMEATPRODUCTS+
-0.481393504*_S5_NUMCATALOGPURCHASES+
0.311462421*_S6_NUMDEALSPURCHASES+
-0.170402162*_S7_NUMWEBVISITSMONTH+
0.0254931556*_S8_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 3;
/*----------------------------------------------*/
;
_SPRIN31=
0.4188802441*Marital_Status_1_+
-0.108693579*Marital_Status_2_+
-0.18569781*Marital_Status_3_+
-0.030796546*Marital_Status_4_+
0.0991257331*Marital_Status_5_+
0.133338802*_S1_ACCEPTEDCMPTOTAL+
0.2615189161*_S2_FRQ+
0.0994085062*_S3_MNT+
-0.065649042*_S4_MNTMEATPRODUCTS+
0.089704836*_S5_NUMCATALOGPURCHASES+
0.6988027641*_S6_NUMDEALSPURCHASES+
0.3548155116*_S7_NUMWEBVISITSMONTH+
0.2117486643*_S8_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 3;
/*----------------------------------------------*/
;
_SPRIN32=
0.0106637752*Marital_Status_1_+
-0.006976946*Marital_Status_2_+
0.0029754745*Marital_Status_3_+
-0.005574564*Marital_Status_4_+
0.0079340274*Marital_Status_5_+
0.0743426991*_S1_ACCEPTEDCMPTOTAL+
0.4172241749*_S2_FRQ+
-0.756399427*_S3_MNT+
0.4836524496*_S4_MNTMEATPRODUCTS+
-0.1064254*_S5_NUMCATALOGPURCHASES+
-0.033812052*_S6_NUMDEALSPURCHASES+
0.0394187446*_S7_NUMWEBVISITSMONTH+
0.0069739491*_S8_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 3;
/*----------------------------------------------*/
;
_SPRIN33=
-0.009163356*Marital_Status_1_+
-0.017190525*Marital_Status_2_+
0.0041674821*Marital_Status_3_+
0.0108473335*Marital_Status_4_+
0.0286372045*Marital_Status_5_+
0.2589037298*_S1_ACCEPTEDCMPTOTAL+
0.4288634785*_S2_FRQ+
0.468169543*_S3_MNT+
0.4406657126*_S4_MNTMEATPRODUCTS+
0.4512293115*_S5_NUMCATALOGPURCHASES+
-0.120164039*_S6_NUMDEALSPURCHASES+
-0.341012847*_S7_NUMWEBVISITSMONTH+
0.002081234*_S8_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 3;
/*----------------------------------------------*/
;
_SPRIN34=
-0.795416959*Marital_Status_1_+
0.0824648192*Marital_Status_2_+
0.2317116976*Marital_Status_3_+
0.2690782351*Marital_Status_4_+
-0.062146515*Marital_Status_5_+
0.0182327007*_S1_ACCEPTEDCMPTOTAL+
0.1513611302*_S2_FRQ+
0.0513363831*_S3_MNT+
-0.010073056*_S4_MNTMEATPRODUCTS+
0.0406819984*_S5_NUMCATALOGPURCHASES+
0.4050473454*_S6_NUMDEALSPURCHASES+
0.1960229521*_S7_NUMWEBVISITSMONTH+
-0.020806956*_S8_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 3;
/*----------------------------------------------*/
;
_SPRIN35=
0.0059671872*Marital_Status_1_+
0.0184384503*Marital_Status_2_+
-0.020790781*Marital_Status_3_+
-0.011947833*Marital_Status_4_+
0.0161263141*Marital_Status_5_+
-0.272236938*_S1_ACCEPTEDCMPTOTAL+
0.0343385179*_S2_FRQ+
0.2782657866*_S3_MNT+
0.3531293035*_S4_MNTMEATPRODUCTS+
-0.02753263*_S5_NUMCATALOGPURCHASES+
-0.36457907*_S6_NUMDEALSPURCHASES+
0.766563427*_S7_NUMWEBVISITSMONTH+
0.0083475574*_S8_RECENCY;
/*----------------------------------------------*/
* Component 6 at stage 3;
/*----------------------------------------------*/
;
_SPRIN36=
-0.158984376*Marital_Status_1_+
-0.029292114*Marital_Status_2_+
0.0652374414*Marital_Status_3_+
-0.047272583*Marital_Status_4_+
0.3235921012*Marital_Status_5_+
0.0050764455*_S1_ACCEPTEDCMPTOTAL+
-0.053126301*_S2_FRQ+
-0.029062364*_S3_MNT+
-0.026276531*_S4_MNTMEATPRODUCTS+
-0.016173632*_S5_NUMCATALOGPURCHASES+
-0.160580587*_S6_NUMDEALSPURCHASES+
-0.063858808*_S7_NUMWEBVISITSMONTH+
0.9100299784*_S8_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 4;
/*----------------------------------------------*/
;
_SPRIN41=
0.0106637752*Marital_Status_1_+
-0.006976946*Marital_Status_2_+
0.0029754745*Marital_Status_3_+
-0.005574564*Marital_Status_4_+
0.0079340274*Marital_Status_5_+
0.0743426991*_S1_ACCEPTEDCMPTOTAL+
0.4172241749*_S2_FRQ+
-0.756399427*_S3_MNT+
0.4836524496*_S4_MNTMEATPRODUCTS+
-0.1064254*_S5_NUMCATALOGPURCHASES+
-0.033812052*_S6_NUMDEALSPURCHASES+
0.0394187446*_S7_NUMWEBVISITSMONTH+
0.0069739491*_S8_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 4;
/*----------------------------------------------*/
;
_SPRIN42=
-0.158984376*Marital_Status_1_+
-0.029292114*Marital_Status_2_+
0.0652374414*Marital_Status_3_+
-0.047272583*Marital_Status_4_+
0.3235921012*Marital_Status_5_+
0.0050764455*_S1_ACCEPTEDCMPTOTAL+
-0.053126301*_S2_FRQ+
-0.029062364*_S3_MNT+
-0.026276531*_S4_MNTMEATPRODUCTS+
-0.016173632*_S5_NUMCATALOGPURCHASES+
-0.160580587*_S6_NUMDEALSPURCHASES+
-0.063858808*_S7_NUMWEBVISITSMONTH+
0.9100299784*_S8_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 4;
/*----------------------------------------------*/
;
_SPRIN43=
-0.795416959*Marital_Status_1_+
0.0824648192*Marital_Status_2_+
0.2317116976*Marital_Status_3_+
0.2690782351*Marital_Status_4_+
-0.062146515*Marital_Status_5_+
0.0182327007*_S1_ACCEPTEDCMPTOTAL+
0.1513611302*_S2_FRQ+
0.0513363831*_S3_MNT+
-0.010073056*_S4_MNTMEATPRODUCTS+
0.0406819984*_S5_NUMCATALOGPURCHASES+
0.4050473454*_S6_NUMDEALSPURCHASES+
0.1960229521*_S7_NUMWEBVISITSMONTH+
-0.020806956*_S8_RECENCY;
/*----------------------------------------------*/
* Component 4 at stage 4;
/*----------------------------------------------*/
;
_SPRIN44=
0.0422645704*Marital_Status_1_+
-0.045690447*Marital_Status_2_+
0.7146731592*Marital_Status_3_+
-0.682396424*Marital_Status_4_+
0.0253007126*Marital_Status_5_+
0.0300322737*_S1_ACCEPTEDCMPTOTAL+
0.0233845108*_S2_FRQ+
0.0185707635*_S3_MNT+
-0.002634244*_S4_MNTMEATPRODUCTS+
0.0212505751*_S5_NUMCATALOGPURCHASES+
0.0939199651*_S6_NUMDEALSPURCHASES+
0.0592362947*_S7_NUMWEBVISITSMONTH+
-0.066942428*_S8_RECENCY;
/*----------------------------------------------*/
* Component 5 at stage 4;
/*----------------------------------------------*/
;
_SPRIN45=
-0.030533433*Marital_Status_1_+
-0.027998459*Marital_Status_2_+
0.0214882295*Marital_Status_3_+
0.0497827209*Marital_Status_4_+
-0.040759072*Marital_Status_5_+
0.9051379856*_S1_ACCEPTEDCMPTOTAL+
-0.141633693*_S2_FRQ+
-0.027881214*_S3_MNT+
-0.116645115*_S4_MNTMEATPRODUCTS+
-0.086193895*_S5_NUMCATALOGPURCHASES+
-0.224050139*_S6_NUMDEALSPURCHASES+
0.2854421342*_S7_NUMWEBVISITSMONTH+
-0.029309469*_S8_RECENCY;
/*----------------------------------------------*/
* Component 6 at stage 4;
/*----------------------------------------------*/
;
_SPRIN46=
0.0088433896*Marital_Status_1_+
-0.012550627*Marital_Status_2_+
-0.002271234*Marital_Status_3_+
0.0021642821*Marital_Status_4_+
0.0206306135*Marital_Status_5_+
0.1009035281*_S1_ACCEPTEDCMPTOTAL+
-0.456946736*_S2_FRQ+
0.1988530541*_S3_MNT+
0.6183600004*_S4_MNTMEATPRODUCTS+
-0.481393504*_S5_NUMCATALOGPURCHASES+
0.311462421*_S6_NUMDEALSPURCHASES+
-0.170402162*_S7_NUMWEBVISITSMONTH+
0.0254931556*_S8_RECENCY;
;
/*----------------------------------------------*/
* Component 1 at stage 5;
/*----------------------------------------------*/
;
_SPRIN51=
-0.030533433*Marital_Status_1_+
-0.027998459*Marital_Status_2_+
0.0214882295*Marital_Status_3_+
0.0497827209*Marital_Status_4_+
-0.040759072*Marital_Status_5_+
0.9051379856*_S1_ACCEPTEDCMPTOTAL+
-0.141633693*_S2_FRQ+
-0.027881214*_S3_MNT+
-0.116645115*_S4_MNTMEATPRODUCTS+
-0.086193895*_S5_NUMCATALOGPURCHASES+
-0.224050139*_S6_NUMDEALSPURCHASES+
0.2854421342*_S7_NUMWEBVISITSMONTH+
-0.029309469*_S8_RECENCY;
/*----------------------------------------------*/
* Component 2 at stage 5;
/*----------------------------------------------*/
;
_SPRIN52=
-0.009163356*Marital_Status_1_+
-0.017190525*Marital_Status_2_+
0.0041674821*Marital_Status_3_+
0.0108473335*Marital_Status_4_+
0.0286372045*Marital_Status_5_+
0.2589037298*_S1_ACCEPTEDCMPTOTAL+
0.4288634785*_S2_FRQ+
0.468169543*_S3_MNT+
0.4406657126*_S4_MNTMEATPRODUCTS+
0.4512293115*_S5_NUMCATALOGPURCHASES+
-0.120164039*_S6_NUMDEALSPURCHASES+
-0.341012847*_S7_NUMWEBVISITSMONTH+
0.002081234*_S8_RECENCY;
/*----------------------------------------------*/
* Component 3 at stage 5;
/*----------------------------------------------*/
;
_SPRIN53=
-0.158984376*Marital_Status_1_+
-0.029292114*Marital_Status_2_+
0.0652374414*Marital_Status_3_+
-0.047272583*Marital_Status_4_+
0.3235921012*Marital_Status_5_+
0.0050764455*_S1_ACCEPTEDCMPTOTAL+
-0.053126301*_S2_FRQ+
-0.029062364*_S3_MNT+
-0.026276531*_S4_MNTMEATPRODUCTS+
-0.016173632*_S5_NUMCATALOGPURCHASES+
-0.160580587*_S6_NUMDEALSPURCHASES+
-0.063858808*_S7_NUMWEBVISITSMONTH+
0.9100299784*_S8_RECENCY;
;
DROP
_SPRIN01
_SPRIN02
_SPRIN03
_SPRIN04
_SPRIN05
_SPRIN06
_SPRIN11
_SPRIN12
_SPRIN13
_SPRIN14
_SPRIN15
_SPRIN16
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
_SPRIN36
_SPRIN41
_SPRIN42
_SPRIN43
_SPRIN44
_SPRIN45
_SPRIN46
_SPRIN51
_SPRIN52
_SPRIN53
;
;
/**********************************************************/
* Selected activation function at stage 0 = SQUARE;
/**********************************************************/
;
_YHAT0=3.798978316
+(-1.22825262909667+-0.04299302501804*_SPRIN01)*_SPRIN01
+(1.98251776355506+-0.01908423872862*_SPRIN02)*_SPRIN02
+(-0.62146334798025+0.02278042228177*_SPRIN03)*_SPRIN03
+(-2.28151452670447+0.14883315570938*_SPRIN04)*_SPRIN04
+(-0.62817566899844+-0.20649000825165*_SPRIN05)*_SPRIN05
+(-0.65010059015777+-0.01294373133357*_SPRIN06)*_SPRIN06
;
/*--- Target level is binary, take a logistic link function --*/
if _YHAT0 > 0 then _YHAT0=1/(1+exp(-_YHAT0));
else _YHAT0=exp(_YHAT0)/(1+exp(_YHAT0));
;
/**********************************************************/
* Selected activation function at stage 1 = SQUARE;
/**********************************************************/
;
_RHAT1=0.0149657388
+(-0.05835608559578+0.01214775792274*_SPRIN11)*_SPRIN11
+(-0.08057160048236+-0.06242653916252*_SPRIN12)*_SPRIN12
+(-0.04279674411413+-0.01164723613787*_SPRIN13)*_SPRIN13
+(-0.02712577531283+0.0025113183348*_SPRIN14)*_SPRIN14
+(-0.01920040627235+-0.00073026462435*_SPRIN15)*_SPRIN15
+(-0.01318789614847+-0.00005253336044*_SPRIN16)*_SPRIN16
;
;
/**********************************************************/
* Selected activation function at stage 2 = SQUARE;
/**********************************************************/
;
_RHAT2=-0.029646812
+(-0.06196691124613+-0.04998114082335*_SPRIN21)*_SPRIN21
+(0.00276424597854+0.00615099991046*_SPRIN22)*_SPRIN22
+(-0.00753510645576+-0.00062778720444*_SPRIN23)*_SPRIN23
+(-0.01436555718974+-0.03060520362936*_SPRIN24)*_SPRIN24
+(-0.01694591616438+0.00197749018349*_SPRIN25)*_SPRIN25
+(-0.02237956446504+-0.00115040932227*_SPRIN26)*_SPRIN26
;
;
/**********************************************************/
* Selected activation function at stage 3 = COS;
/**********************************************************/
;
_RHAT3=0.0257191945
+-0.02800185435927*COS(1.41896099294643*_SPRIN31*(2/ARCOS(-1)))
+0.3412398353768*COS(0.32259583044937*_SPRIN32*(2/ARCOS(-1)))
+0.01060654682685*COS(-0.35971082122701*_SPRIN33*(2/ARCOS(-1)))
+-2.26076370664657*COS(0.00941787038345*_SPRIN34*(2/ARCOS(-1)))
+1.31170592303827*COS(-0.03085251908102*_SPRIN35*(2/ARCOS(-1)))
+0.59239568564671*COS(0.09769476696649*_SPRIN36*(2/ARCOS(-1)))
;
;
/**********************************************************/
* Selected activation function at stage 4 = SIN;
/**********************************************************/
;
_RHAT4=0.0029327183
+0.03771647945026*SIN(-1.2352576692348*_SPRIN41*(2/ARCOS(-1)))
+-0.02838436219569*SIN(-0.19049287491309*_SPRIN42*(2/ARCOS(-1)))
+-0.04691078311928*SIN(-0.12359709908775*_SPRIN43*(2/ARCOS(-1)))
+0.00599852350489*SIN(-0.3868829620053*_SPRIN44*(2/ARCOS(-1)))
+0.03740371310513*SIN(-0.00842435790751*_SPRIN45*(2/ARCOS(-1)))
+0.00423439430896*SIN(-0.71742307187617*_SPRIN46*(2/ARCOS(-1)))
;
;
/**********************************************************/
* Selected activation function at stage 5 = EXP;
/**********************************************************/
;
_RHAT5=-0.070233579
+0.11046568750913*exp(0.01760697003035*_SPRIN51)
+0.01657876628253*exp(-0.11623043616899*_SPRIN52)
+-0.06066697184384*exp(-0.06633987365798*_SPRIN53)
;
;
_tmpPredict
=_YHAT0
+_RHAT1
+_RHAT2
+_RHAT3
+_RHAT4
+_RHAT5
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
;
DROP _YHAT0
_RHAT1
_RHAT2
_RHAT3
_RHAT4
_RHAT5
_tmpPredict
Marital_Status_1_
Marital_Status_2_
Marital_Status_3_
Marital_Status_4_
Marital_Status_5_
_S1_ACCEPTEDCMPTOTAL
_S2_FRQ
_S3_MNT
_S4_MNTMEATPRODUCTS
_S5_NUMCATALOGPURCHASES
_S6_NUMDEALSPURCHASES
_S7_NUMWEBVISITSMONTH
_S8_RECENCY
;
