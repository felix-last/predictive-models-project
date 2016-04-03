*;
*MOST FREQUENT VALUE (COUNT);
*;
length IMP_REP_Education $10;
format IMP_REP_Education $10.0;
label IMP_REP_Education = 'Imputed: Replacement: Education';
IMP_REP_Education = REP_Education;
if REP_Education = '' then IMP_REP_Education = 'Graduation';
length IMP_REP_Gender $1;
format IMP_REP_Gender $1.0;
label IMP_REP_Gender = 'Imputed: Replacement: Gender';
IMP_REP_Gender = REP_Gender;
if REP_Gender = '' then IMP_REP_Gender = 'F';
length IMP_REP_Marital_Status $12;
format IMP_REP_Marital_Status $12.0;
label IMP_REP_Marital_Status = 'Imputed: Replacement: Marital_Status';
IMP_REP_Marital_Status = REP_Marital_Status;
if REP_Marital_Status = '' then IMP_REP_Marital_Status = 'Married';
*;
* TREE IMPUTATION;
*;
*;
* IMPUTE VARIABLE: Income;
*;
format IMP_Income BEST.;
label IMP_Income = 'Imputed: Income';
IMP_Income = Income;
if IMP_Income eq . then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
LABEL P_Income = 'Predicted: Income';
LABEL _WARN_ = 'Warnings';
****** ASSIGN OBSERVATION TO NODE ******;
IF NOT MISSING(Year_Birth ) AND
1968.5 <= Year_Birth THEN DO;
IF NOT MISSING(Year_Birth ) AND
1983.5 <= Year_Birth THEN DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1988.5 THEN DO;
IF NOT MISSING(Mnt ) AND
94.12 <= Mnt THEN DO;
P_Income = 51792.6258620689;
END;
ELSE DO;
P_Income = 42384.7182926829;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
93.08 <= Mnt THEN DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1992.5 THEN DO;
P_Income = 45360.075;
END;
ELSE DO;
P_Income = 36021.93;
END;
END;
ELSE DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1991.5 THEN DO;
P_Income = 35359.3398876404;
END;
ELSE DO;
P_Income = 29282.8300531914;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
109.2 <= Mnt THEN DO;
IF NOT MISSING(Year_Birth ) AND
1975.5 <= Year_Birth THEN DO;
IF NOT MISSING(Mnt ) AND
536.12 <= Mnt THEN DO;
P_Income = 67967.2777777777;
END;
ELSE DO;
P_Income = 58692.8584158416;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
381.16 <= Mnt THEN DO;
P_Income = 73606.2104166666;
END;
ELSE DO;
IF NOT MISSING(Dt_Customer ) AND
19533 <= Dt_Customer THEN DO;
P_Income = 70189.4375;
END;
ELSE DO;
P_Income = 62547.7602272727;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1974.5 THEN DO;
P_Income = 60885.965;
END;
ELSE DO;
P_Income = 50018.507918552;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1951.5 THEN DO;
IF NOT MISSING(Mnt ) AND
1602.12 <= Mnt THEN DO;
IF NOT MISSING(Year_Birth ) AND
1944.5 <= Year_Birth THEN DO;
P_Income = 109554.352941176;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
2185.56 <= Mnt THEN DO;
P_Income = 126223.521052631;
END;
ELSE DO;
IF NOT MISSING(Dt_Customer ) AND
Dt_Customer < 19501 THEN DO;
P_Income = 112988.731578947;
END;
ELSE DO;
P_Income = 121554.279411764;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
Mnt < 932.88 THEN DO;
P_Income = 96244.2833333333;
END;
ELSE DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1943.5 THEN DO;
P_Income = 111193.566129032;
END;
ELSE DO;
IF NOT MISSING(Dt_Customer ) AND
19749.5 <= Dt_Customer THEN DO;
P_Income = 108965.112162162;
END;
ELSE DO;
P_Income = 101652.857727272;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Year_Birth ) AND
Year_Birth < 1959.5 THEN DO;
IF NOT MISSING(Mnt ) AND
Mnt < 648.96 THEN DO;
IF NOT MISSING(Mnt ) AND
Mnt < 334.36 THEN DO;
P_Income = 78161.4909090909;
END;
ELSE DO;
IF NOT MISSING(Dt_Customer ) AND
19669.5 <= Dt_Customer THEN DO;
P_Income = 92220.6409090909;
END;
ELSE DO;
P_Income = 84575.12;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
1332.24 <= Mnt THEN DO;
P_Income = 100136.364406779;
END;
ELSE DO;
P_Income = 93087.8516129032;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
731.64 <= Mnt THEN DO;
IF NOT MISSING(Dt_Customer ) AND
Dt_Customer < 19402 THEN DO;
P_Income = 82426.9586538461;
END;
ELSE DO;
P_Income = 89224.4602941176;
END;
END;
ELSE DO;
IF NOT MISSING(Mnt ) AND
Mnt < 125.32 THEN DO;
P_Income = 66476.9336538461;
END;
ELSE DO;
IF NOT MISSING(Dt_Customer ) AND
19677.5 <= Dt_Customer THEN DO;
P_Income = 80942.7272727272;
END;
ELSE DO;
P_Income = 73470.7986486486;
END;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: Income;
*;
IMP_Income = P_INCOME;
END;
*;
* IMPUTE VARIABLE: REP_HouseKeeping;
*;
label IMP_REP_HouseKeeping = 'Imputed: Replacement: HouseKeeping';
IMP_REP_HouseKeeping = REP_HouseKeeping;
if IMP_REP_HouseKeeping eq . then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
LABEL P_REP_HouseKeeping = 'Predicted: REP_HouseKeeping';
LABEL _WARN_ = 'Warnings';
****** ASSIGN OBSERVATION TO NODE ******;
IF NOT MISSING(Clothes ) AND
Clothes < 42.5 THEN DO;
IF NOT MISSING(Year_Birth ) AND
1992.5 <= Year_Birth THEN DO;
P_REP_HouseKeeping = 17.7683615819209;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 37.5 THEN DO;
IF NOT MISSING(Clothes ) AND
Clothes < 27.5 THEN DO;
IF NOT MISSING(REP_Kitchen ) AND
18.5 <= REP_Kitchen THEN DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 18 THEN DO;
P_REP_HouseKeeping = 14.4444444444444;
END;
ELSE DO;
P_REP_HouseKeeping = 4.93333333333333;
END;
END;
ELSE DO;
P_REP_HouseKeeping = 19.5102040816326;
END;
END;
ELSE DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 8.5 THEN DO;
IF NOT MISSING(REP_Kitchen ) AND
REP_Kitchen < 9.5 THEN DO;
P_REP_HouseKeeping = 19.9130434782608;
END;
ELSE DO;
P_REP_HouseKeeping = 11.7;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 22.5 THEN DO;
P_REP_HouseKeeping = 14.15;
END;
ELSE DO;
P_REP_HouseKeeping = 8.70940170940171;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 29.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
50.5 <= SmallAppliances THEN DO;
IF NOT MISSING(REP_Toys ) AND
9.5 <= REP_Toys THEN DO;
P_REP_HouseKeeping = 3.5;
END;
ELSE DO;
P_REP_HouseKeeping = 9.19148936170213;
END;
END;
ELSE DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 2.5 THEN DO;
P_REP_HouseKeeping = 19.7272727272727;
END;
ELSE DO;
P_REP_HouseKeeping = 11.3846153846153;
END;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 44.5 THEN DO;
IF NOT MISSING(REP_Toys ) AND
11.5 <= REP_Toys THEN DO;
P_REP_HouseKeeping = 3.1875;
END;
ELSE DO;
P_REP_HouseKeeping = 7.95348837209302;
END;
END;
ELSE DO;
P_REP_HouseKeeping = 4.90756302521008;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 62.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 22.5 THEN DO;
IF NOT MISSING(REP_Toys ) AND
11.5 <= REP_Toys THEN DO;
P_REP_HouseKeeping = 5.65217391304347;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 54.5 THEN DO;
IF NOT MISSING(REP_Kitchen ) AND
20.5 <= REP_Kitchen THEN DO;
P_REP_HouseKeeping = 7.5;
END;
ELSE DO;
P_REP_HouseKeeping = 15.590909090909;
END;
END;
ELSE DO;
P_REP_HouseKeeping = 8.84210526315789;
END;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
33.5 <= SmallAppliances THEN DO;
IF NOT MISSING(Clothes ) AND
53.5 <= Clothes THEN DO;
P_REP_HouseKeeping = 2.25581395348837;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 38.5 THEN DO;
P_REP_HouseKeeping = 5.38095238095238;
END;
ELSE DO;
P_REP_HouseKeeping = 3.61363636363636;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 49.5 THEN DO;
P_REP_HouseKeeping = 7.71111111111111;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 56.5 THEN DO;
P_REP_HouseKeeping = 5.69369369369369;
END;
ELSE DO;
P_REP_HouseKeeping = 4.12686567164179;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
76.5 <= Clothes THEN DO;
IF NOT MISSING(Clothes ) AND
86.5 <= Clothes THEN DO;
IF NOT MISSING(REP_Kitchen ) AND
0.5 <= REP_Kitchen THEN DO;
P_REP_HouseKeeping = 0.74626865671641;
END;
ELSE DO;
P_REP_HouseKeeping = 0.36559139784946;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 8.5 THEN DO;
P_REP_HouseKeeping = 4;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
16.5 <= SmallAppliances THEN DO;
P_REP_HouseKeeping = 0.84126984126984;
END;
ELSE DO;
P_REP_HouseKeeping = 1.47179487179487;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 17.5 THEN DO;
IF NOT MISSING(Clothes ) AND
Clothes < 66.5 THEN DO;
P_REP_HouseKeeping = 8.5;
END;
ELSE DO;
P_REP_HouseKeeping = 3.75;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
70.5 <= Clothes THEN DO;
IF NOT MISSING(SmallAppliances ) AND
21.5 <= SmallAppliances THEN DO;
P_REP_HouseKeeping = 1.36507936507936;
END;
ELSE DO;
P_REP_HouseKeeping = 2.17142857142857;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 23.5 THEN DO;
P_REP_HouseKeeping = 4.0126582278481;
END;
ELSE DO;
P_REP_HouseKeeping = 2.20134228187919;
END;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: REP_HouseKeeping;
*;
IMP_REP_HouseKeeping = P_REP_HOUSEKEEPING;
END;
*;
* IMPUTE VARIABLE: REP_Kitchen;
*;
label IMP_REP_Kitchen = 'Imputed: Replacement: Kitchen';
IMP_REP_Kitchen = REP_Kitchen;
if IMP_REP_Kitchen eq . then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
LABEL P_REP_Kitchen = 'Predicted: REP_Kitchen';
LABEL _WARN_ = 'Warnings';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_10 $ 10;
DROP _ARBFMT_10;
_ARBFMT_10 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
IF NOT MISSING(Clothes ) AND
Clothes < 37.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
39.5 <= SmallAppliances THEN DO;
IF NOT MISSING(Clothes ) AND
Clothes < 24.5 THEN DO;
IF NOT MISSING(Clothes ) AND
Clothes < 12.5 THEN DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 5 THEN DO;
P_REP_Kitchen = 28.8;
END;
ELSE DO;
P_REP_Kitchen = 13.6666666666666;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
49.5 <= SmallAppliances THEN DO;
P_REP_Kitchen = 7.27777777777777;
END;
ELSE DO;
P_REP_Kitchen = 12.21875;
END;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 46.5 THEN DO;
P_REP_Kitchen = 8.1;
END;
ELSE DO;
P_REP_Kitchen = 5.14035087719298;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 13.5 THEN DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 17.5 THEN DO;
IF NOT MISSING(Frq ) AND
14 <= Frq THEN DO;
P_REP_Kitchen = 15.6;
END;
ELSE DO;
P_REP_Kitchen = 30.1428571428571;
END;
END;
ELSE DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 7.5 THEN DO;
P_REP_Kitchen = 26.4736842105263;
END;
ELSE DO;
P_REP_Kitchen = 16.75;
END;
END;
END;
ELSE DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 17.5 THEN DO;
IF NOT MISSING(Clothes ) AND
Clothes < 27.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 28.5 THEN DO;
P_REP_Kitchen = 26.7037037037037;
END;
ELSE DO;
P_REP_Kitchen = 17.44;
END;
END;
ELSE DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 6.5 THEN DO;
P_REP_Kitchen = 19.8571428571428;
END;
ELSE DO;
P_REP_Kitchen = 13.6185567010309;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Recomendation ) AND
4.5 <= Recomendation THEN DO;
P_REP_Kitchen = 16.28;
END;
ELSE DO;
P_REP_Kitchen = 10.2345679012345;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 58.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 27.5 THEN DO;
IF NOT MISSING(Clothes ) AND
49.5 <= Clothes THEN DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 3.5 THEN DO;
P_REP_Kitchen = 11.3076923076923;
END;
ELSE DO;
P_REP_Kitchen = 6.47252747252747;
END;
END;
ELSE DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 6.5 THEN DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 12 THEN DO;
P_REP_Kitchen = 24.2727272727272;
END;
ELSE DO;
P_REP_Kitchen = 14.7857142857142;
END;
END;
ELSE DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 8.5 THEN DO;
P_REP_Kitchen = 13.3235294117647;
END;
ELSE DO;
P_REP_Kitchen = 8.31111111111111;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
51.5 <= Clothes THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 32.5 THEN DO;
P_REP_Kitchen = 4.84375;
END;
ELSE DO;
P_REP_Kitchen = 2.92452830188679;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
41.5 <= SmallAppliances THEN DO;
P_REP_Kitchen = 3.54807692307692;
END;
ELSE DO;
IF NOT MISSING(REP_Toys ) AND
REP_Toys < 2.5 THEN DO;
P_REP_Kitchen = 9.07692307692307;
END;
ELSE DO;
P_REP_Kitchen = 5.929203539823;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 73.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 19.5 THEN DO;
P_REP_Kitchen = 5.88043478260869;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 63.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 27.5 THEN DO;
P_REP_Kitchen = 5.32203389830508;
END;
ELSE DO;
P_REP_Kitchen = 2.52054794520547;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 22.5 THEN DO;
P_REP_Kitchen = 3.1159420289855;
END;
ELSE DO;
P_REP_Kitchen = 2.02793296089385;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
87.5 <= Clothes THEN DO;
IF NOT MISSING(Clothes ) AND
91.5 <= Clothes THEN DO;
P_REP_Kitchen = 0.21666666666666;
END;
ELSE DO;
P_REP_Kitchen = 0.63414634146341;
END;
END;
ELSE DO;
_ARBFMT_10 = PUT( REP_Education , $10.);
%DMNORMIP( _ARBFMT_10);
IF _ARBFMT_10 IN ('BASIC' ,'2N CYCLE' ) THEN DO;
P_REP_Kitchen = 2.23404255319149;
END;
ELSE DO;
P_REP_Kitchen = 1.39384615384615;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: REP_Kitchen;
*;
IMP_REP_Kitchen = P_REP_KITCHEN;
END;
*;
* IMPUTE VARIABLE: REP_Toys;
*;
label IMP_REP_Toys = 'Imputed: Replacement: Toys';
IMP_REP_Toys = REP_Toys;
if IMP_REP_Toys eq . then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
LABEL P_REP_Toys = 'Predicted: REP_Toys';
LABEL _WARN_ = 'Warnings';
****** ASSIGN OBSERVATION TO NODE ******;
IF NOT MISSING(Clothes ) AND
Clothes < 40.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 34.5 THEN DO;
IF NOT MISSING(Clothes ) AND
28.5 <= Clothes THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 25.5 THEN DO;
P_REP_Toys = 15.5576923076923;
END;
ELSE DO;
IF NOT MISSING(REP_Kitchen ) AND
16.5 <= REP_Kitchen THEN DO;
P_REP_Toys = 6.56521739130434;
END;
ELSE DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 15.5 THEN DO;
P_REP_Toys = 13.8235294117647;
END;
ELSE DO;
P_REP_Toys = 6.88888888888889;
END;
END;
END;
END;
ELSE DO;
P_REP_Toys = 18.9620853080568;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 23.5 THEN DO;
IF NOT MISSING(REP_HouseKeeping ) AND
3.5 <= REP_HouseKeeping THEN DO;
IF NOT MISSING(REP_Kitchen ) AND
REP_Kitchen < 5.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 46.5 THEN DO;
P_REP_Toys = 22.3636363636363;
END;
ELSE DO;
P_REP_Toys = 10.8666666666666;
END;
END;
ELSE DO;
P_REP_Toys = 10.1025641025641;
END;
END;
ELSE DO;
P_REP_Toys = 17.7692307692307;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
47.5 <= SmallAppliances THEN DO;
P_REP_Toys = 5.71551724137931;
END;
ELSE DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 3.5 THEN DO;
P_REP_Toys = 11.78125;
END;
ELSE DO;
IF NOT MISSING(REP_Kitchen ) AND
10.5 <= REP_Kitchen THEN DO;
P_REP_Toys = 5.8;
END;
ELSE DO;
P_REP_Toys = 8.62878787878788;
END;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 58.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 30.5 THEN DO;
IF NOT MISSING(REP_Kitchen ) AND
REP_Kitchen < 3.5 THEN DO;
IF NOT MISSING(Clothes ) AND
55.5 <= Clothes THEN DO;
P_REP_Toys = 6.26666666666666;
END;
ELSE DO;
P_REP_Toys = 15.078947368421;
END;
END;
ELSE DO;
IF NOT MISSING(REP_HouseKeeping ) AND
REP_HouseKeeping < 4.5 THEN DO;
IF NOT MISSING(Clothes ) AND
53.5 <= Clothes THEN DO;
P_REP_Toys = 7.03333333333333;
END;
ELSE DO;
P_REP_Toys = 12.9166666666666;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 44.5 THEN DO;
P_REP_Toys = 9.45945945945946;
END;
ELSE DO;
P_REP_Toys = 5.8859649122807;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
49.5 <= Clothes THEN DO;
IF NOT MISSING(SmallAppliances ) AND
35.5 <= SmallAppliances THEN DO;
P_REP_Toys = 2.23188405797101;
END;
ELSE DO;
P_REP_Toys = 3.94444444444444;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
40.5 <= SmallAppliances THEN DO;
P_REP_Toys = 3.09090909090909;
END;
ELSE DO;
IF NOT MISSING(REP_Kitchen ) AND
REP_Kitchen < 5.5 THEN DO;
P_REP_Toys = 8.21666666666666;
END;
ELSE DO;
P_REP_Toys = 5.54929577464788;
END;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 73.5 THEN DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 19.5 THEN DO;
P_REP_Toys = 5.26086956521739;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
67.5 <= Clothes THEN DO;
P_REP_Toys = 1.87692307692307;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 24.5 THEN DO;
P_REP_Toys = 4.38095238095238;
END;
ELSE DO;
P_REP_Toys = 2.45989304812834;
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
83.5 <= Clothes THEN DO;
IF NOT MISSING(Clothes ) AND
91.5 <= Clothes THEN DO;
P_REP_Toys = 0.21666666666666;
END;
ELSE DO;
P_REP_Toys = 0.73652694610778;
END;
END;
ELSE DO;
IF NOT MISSING(SmallAppliances ) AND
SmallAppliances < 13.5 THEN DO;
IF NOT MISSING(Clothes ) AND
Clothes < 79.5 THEN DO;
P_REP_Toys = 4.61538461538461;
END;
ELSE DO;
P_REP_Toys = 2.22857142857142;
END;
END;
ELSE DO;
IF NOT MISSING(Clothes ) AND
Clothes < 76.5 THEN DO;
P_REP_Toys = 1.90588235294117;
END;
ELSE DO;
P_REP_Toys = 1.24025974025974;
END;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: REP_Toys;
*;
IMP_REP_Toys = P_REP_TOYS;
END;
*;
* Drop prediction variables since they are for INPUTS not TARGETS;
* Replace _NODE_ by _XODE_ so it can be safely dropped;
*;
drop
P_Income
P_REP_HouseKeeping
P_REP_Kitchen
P_REP_Toys
;
