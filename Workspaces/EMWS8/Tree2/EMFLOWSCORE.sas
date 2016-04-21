****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_DepVar  $   12;
LENGTH I_DepVar  $   12;
LENGTH _WARN_  $    4;

******              LABELS FOR NEW VARIABLES              ******;
LABEL _NODE_  = 'Node' ;
LABEL _LEAF_  = 'Leaf' ;
LABEL P_DepVar0  = 'Predicted: DepVar=0' ;
LABEL P_DepVar1  = 'Predicted: DepVar=1' ;
LABEL Q_DepVar0  = 'Unadjusted P: DepVar=0' ;
LABEL Q_DepVar1  = 'Unadjusted P: DepVar=1' ;
LABEL V_DepVar0  = 'Validated: DepVar=0' ;
LABEL V_DepVar1  = 'Validated: DepVar=1' ;
LABEL R_DepVar0  = 'Residual: DepVar=0' ;
LABEL R_DepVar1  = 'Residual: DepVar=1' ;
LABEL F_DepVar  = 'From: DepVar' ;
LABEL I_DepVar  = 'Into: DepVar' ;
LABEL U_DepVar  = 'Unnormalized Into: DepVar' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( DepVar , BEST.);
 %DMNORMCP( _ARBFMT_12, F_DepVar );

******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(PC_1 ) AND
      4.72867010608898 <= PC_1  THEN DO;
  IF  NOT MISSING(PC_13 ) AND
        0.79321352563817 <= PC_13  THEN DO;
    IF  NOT MISSING(PC_3 ) AND
      PC_3  <    -0.89718284109131 THEN DO;
      IF  NOT MISSING(PC_14 ) AND
        PC_14  <     -0.2850970940981 THEN DO;
        _NODE_  =                   28;
        _LEAF_  =                    9;
        P_DepVar0  =      0.9090909090909;
        P_DepVar1  =     0.09090909090909;
        Q_DepVar0  =      0.9090909090909;
        Q_DepVar1  =     0.09090909090909;
        V_DepVar0  =                  0.8;
        V_DepVar1  =                  0.2;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   29;
        _LEAF_  =                   10;
        P_DepVar0  =     0.35714285714285;
        P_DepVar1  =     0.64285714285714;
        Q_DepVar0  =     0.35714285714285;
        Q_DepVar1  =     0.64285714285714;
        V_DepVar0  =     0.33333333333333;
        V_DepVar1  =     0.66666666666666;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      END;
    ELSE DO;
      _NODE_  =                   15;
      _LEAF_  =                   11;
      P_DepVar0  =                 0.92;
      P_DepVar1  =                 0.08;
      Q_DepVar0  =                 0.92;
      Q_DepVar1  =                 0.08;
      V_DepVar0  =     0.78947368421052;
      V_DepVar1  =     0.21052631578947;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(PC_10 ) AND
          2.81456071838374 <= PC_10  THEN DO;
      _NODE_  =                   13;
      _LEAF_  =                    8;
      P_DepVar0  =     0.69444444444444;
      P_DepVar1  =     0.30555555555555;
      Q_DepVar0  =     0.69444444444444;
      Q_DepVar1  =     0.30555555555555;
      V_DepVar0  =     0.63157894736842;
      V_DepVar1  =     0.36842105263157;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    ELSE DO;
      IF  NOT MISSING(PC_2 ) AND
            0.58123312716899 <= PC_2  THEN DO;
        IF  NOT MISSING(PC_10 ) AND
          PC_10  <    -1.00440747949411 THEN DO;
          _NODE_  =                   44;
          _LEAF_  =                    6;
          P_DepVar0  =     0.14285714285714;
          P_DepVar1  =     0.85714285714285;
          Q_DepVar0  =     0.14285714285714;
          Q_DepVar1  =     0.85714285714285;
          V_DepVar0  =                  0.2;
          V_DepVar1  =                  0.8;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   45;
          _LEAF_  =                    7;
          P_DepVar0  =                0.875;
          P_DepVar1  =                0.125;
          Q_DepVar0  =                0.875;
          Q_DepVar1  =                0.125;
          V_DepVar0  =                    1;
          V_DepVar1  =                    0;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(PC_9 ) AND
          PC_9  <    -1.24218248225148 THEN DO;
          _NODE_  =                   42;
          _LEAF_  =                    4;
          P_DepVar0  =                  0.5;
          P_DepVar1  =                  0.5;
          Q_DepVar0  =                  0.5;
          Q_DepVar1  =                  0.5;
          V_DepVar0  =                    1;
          V_DepVar1  =                    0;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   43;
          _LEAF_  =                    5;
          P_DepVar0  =     0.05681818181818;
          P_DepVar1  =     0.94318181818181;
          Q_DepVar0  =     0.05681818181818;
          Q_DepVar1  =     0.94318181818181;
          V_DepVar0  =     0.23684210526315;
          V_DepVar1  =     0.76315789473684;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        END;
      END;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(PC_10 ) AND
    PC_10  <    -1.17030927830388 THEN DO;
    IF  NOT MISSING(PC_13 ) AND
      PC_13  <    -0.26447784994774 THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =     0.38202247191011;
      P_DepVar1  =     0.61797752808988;
      Q_DepVar0  =     0.38202247191011;
      Q_DepVar1  =     0.61797752808988;
      V_DepVar0  =     0.38709677419354;
      V_DepVar1  =     0.61290322580645;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _NODE_  =                    9;
      _LEAF_  =                    2;
      P_DepVar0  =     0.75524475524475;
      P_DepVar1  =     0.24475524475524;
      Q_DepVar0  =     0.75524475524475;
      Q_DepVar1  =     0.24475524475524;
      V_DepVar0  =                 0.76;
      V_DepVar1  =                 0.24;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    3;
    P_DepVar0  =     0.92384453781512;
    P_DepVar1  =     0.07615546218487;
    Q_DepVar0  =     0.92384453781512;
    Q_DepVar1  =     0.07615546218487;
    V_DepVar0  =     0.91320293398533;
    V_DepVar1  =     0.08679706601466;
    I_DepVar  = '0' ;
    U_DepVar  =                    0;
    END;
  END;

*****  RESIDUALS R_ *************;
IF  F_DepVar  NE '0'
AND F_DepVar  NE '1'  THEN DO;
        R_DepVar0  = .;
        R_DepVar1  = .;
 END;
 ELSE DO;
       R_DepVar0  =  -P_DepVar0 ;
       R_DepVar1  =  -P_DepVar1 ;
       SELECT( F_DepVar  );
          WHEN( '0'  ) R_DepVar0  = R_DepVar0  +1;
          WHEN( '1'  ) R_DepVar1  = R_DepVar1  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
drop _LEAF_;
