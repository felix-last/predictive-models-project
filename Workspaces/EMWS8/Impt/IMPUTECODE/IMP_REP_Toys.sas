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
