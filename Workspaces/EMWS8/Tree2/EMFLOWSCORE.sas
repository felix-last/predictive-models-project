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
      4.72890391929894 <= PC_1  THEN DO;
  IF  NOT MISSING(PC_13 ) AND
         0.7934719529821 <= PC_13  THEN DO;
    IF  NOT MISSING(PC_3 ) AND
      PC_3  <    -0.89919177649188 THEN DO;
      IF  NOT MISSING(PC_14 ) AND
        PC_14  <    -0.28662782595399 THEN DO;
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
           2.8283843484414 <= PC_10  THEN DO;
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
            0.57994817718225 <= PC_2  THEN DO;
        IF  NOT MISSING(PC_10 ) AND
          PC_10  <    -1.00979078933032 THEN DO;
          _NODE_  =                   44;
          _LEAF_  =                    6;
          P_DepVar0  =     0.14285714285714;
          P_DepVar1  =     0.85714285714285;
          Q_DepVar0  =     0.14285714285714;
          Q_DepVar1  =     0.85714285714285;
          V_DepVar0  =                    0;
          V_DepVar1  =                    1;
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
          PC_9  <    -1.25942381578662 THEN DO;
          _NODE_  =                   42;
          _LEAF_  =                    4;
          P_DepVar0  =     0.53333333333333;
          P_DepVar1  =     0.46666666666666;
          Q_DepVar0  =     0.53333333333333;
          Q_DepVar1  =     0.46666666666666;
          V_DepVar0  =                    1;
          V_DepVar1  =                    0;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   43;
          _LEAF_  =                    5;
          P_DepVar0  =     0.05617977528089;
          P_DepVar1  =      0.9438202247191;
          Q_DepVar0  =     0.05617977528089;
          Q_DepVar1  =      0.9438202247191;
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
    PC_10  <    -1.17632487738677 THEN DO;
    IF  NOT MISSING(PC_13 ) AND
      PC_13  <    -0.26517164611357 THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =                0.375;
      P_DepVar1  =                0.625;
      Q_DepVar0  =                0.375;
      Q_DepVar1  =                0.625;
      V_DepVar0  =                  0.4;
      V_DepVar1  =                  0.6;
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
      V_DepVar0  =     0.75675675675675;
      V_DepVar1  =     0.24324324324324;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    3;
    P_DepVar0  =     0.92388451443569;
    P_DepVar1  =      0.0761154855643;
    Q_DepVar0  =     0.92388451443569;
    Q_DepVar1  =      0.0761154855643;
    V_DepVar0  =     0.91219512195121;
    V_DepVar1  =     0.08780487804878;
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
