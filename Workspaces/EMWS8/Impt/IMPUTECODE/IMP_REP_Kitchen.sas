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
