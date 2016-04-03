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
