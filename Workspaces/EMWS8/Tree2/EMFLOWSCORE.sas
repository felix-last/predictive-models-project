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
      4.68709322408413 <= PC_1  THEN DO;
  IF  NOT MISSING(PC_13 ) AND
        0.66383869945606 <= PC_13  THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                   10;
    P_DepVar0  =     0.21794871794871;
    P_DepVar1  =     0.78205128205128;
    Q_DepVar0  =     0.21794871794871;
    Q_DepVar1  =     0.78205128205128;
    V_DepVar0  =      0.2258064516129;
    V_DepVar1  =     0.77419354838709;
    I_DepVar  = '1' ;
    U_DepVar  =                    1;
    END;
  ELSE DO;
    IF  NOT MISSING(PC_3 ) AND
      PC_3  <    -2.17027872615734 THEN DO;
      _NODE_  =                   12;
      _LEAF_  =                    6;
      P_DepVar0  =                 0.34;
      P_DepVar1  =                 0.66;
      Q_DepVar0  =                 0.34;
      Q_DepVar1  =                 0.66;
      V_DepVar0  =     0.46666666666666;
      V_DepVar1  =     0.53333333333333;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(PC_14 ) AND
        PC_14  <     0.05209321878506 THEN DO;
        IF  NOT MISSING(PC_11 ) AND
          PC_11  <    -1.20691074000555 THEN DO;
          _NODE_  =                   30;
          _LEAF_  =                    7;
          P_DepVar0  =                    0;
          P_DepVar1  =                    1;
          Q_DepVar0  =                    0;
          Q_DepVar1  =                    1;
          V_DepVar0  =                    0;
          V_DepVar1  =                    1;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   31;
          _LEAF_  =                    8;
          P_DepVar0  =     0.65853658536585;
          P_DepVar1  =     0.34146341463414;
          Q_DepVar0  =     0.65853658536585;
          Q_DepVar1  =     0.34146341463414;
          V_DepVar0  =     0.68421052631578;
          V_DepVar1  =     0.31578947368421;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        END;
      ELSE DO;
        _NODE_  =                   23;
        _LEAF_  =                    9;
        P_DepVar0  =     0.88524590163934;
        P_DepVar1  =     0.11475409836065;
        Q_DepVar0  =     0.88524590163934;
        Q_DepVar1  =     0.11475409836065;
        V_DepVar0  =                  0.7;
        V_DepVar1  =                  0.3;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(PC_5 ) AND
        2.47368132855669 <= PC_5  THEN DO;
    IF  NOT MISSING(PC_12 ) AND
          0.73782175930673 <= PC_12  THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    5;
      P_DepVar0  =     0.13333333333333;
      P_DepVar1  =     0.86666666666666;
      Q_DepVar0  =     0.13333333333333;
      Q_DepVar1  =     0.86666666666666;
      V_DepVar0  =     0.14285714285714;
      V_DepVar1  =     0.85714285714285;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _NODE_  =                   10;
      _LEAF_  =                    4;
      P_DepVar0  =      0.6159420289855;
      P_DepVar1  =     0.38405797101449;
      Q_DepVar0  =      0.6159420289855;
      Q_DepVar1  =     0.38405797101449;
      V_DepVar0  =     0.63793103448275;
      V_DepVar1  =     0.36206896551724;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(PC_12 ) AND
           1.1476735453533 <= PC_12  THEN DO;
      IF  NOT MISSING(PC_13 ) AND
            1.98102952079247 <= PC_13  THEN DO;
        _NODE_  =                   19;
        _LEAF_  =                    3;
        P_DepVar0  =     0.08333333333333;
        P_DepVar1  =     0.91666666666666;
        Q_DepVar0  =     0.08333333333333;
        Q_DepVar1  =     0.91666666666666;
        V_DepVar0  =                    0;
        V_DepVar1  =                    1;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   18;
        _LEAF_  =                    2;
        P_DepVar0  =      0.7725321888412;
        P_DepVar1  =     0.22746781115879;
        Q_DepVar0  =      0.7725321888412;
        Q_DepVar1  =     0.22746781115879;
        V_DepVar0  =      0.7029702970297;
        V_DepVar1  =     0.29702970297029;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =     0.93955094991364;
      P_DepVar1  =     0.06044905008635;
      Q_DepVar0  =     0.93955094991364;
      Q_DepVar1  =     0.06044905008635;
      V_DepVar0  =     0.93882978723404;
      V_DepVar1  =     0.06117021276595;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
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
