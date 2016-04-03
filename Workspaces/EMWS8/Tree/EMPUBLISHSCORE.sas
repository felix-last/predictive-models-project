****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
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
LABEL I_DepVar  = 'Into: DepVar' ;
LABEL U_DepVar  = 'Unnormalized Into: DepVar' ;
LABEL _WARN_  = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(Mnt ) AND
               1603.16 <= Mnt  THEN DO;
  IF  NOT MISSING(Mnt ) AND
                 2348.84 <= Mnt  THEN DO;
    IF  NOT MISSING(HouseKeeping ) AND
      HouseKeeping  <                  3.5 THEN DO;
      _NODE_  =                   10;
      _LEAF_  =                    3;
      P_DepVar0  =               0.0625;
      P_DepVar1  =               0.9375;
      Q_DepVar0  =               0.0625;
      Q_DepVar1  =               0.9375;
      V_DepVar0  =                    0;
      V_DepVar1  =                    1;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(Rcn ) AND
        Rcn  <                 61.5 THEN DO;
        _NODE_  =                   14;
        _LEAF_  =                    4;
        P_DepVar0  =                    1;
        P_DepVar1  =                    0;
        Q_DepVar0  =                    1;
        Q_DepVar1  =                    0;
        V_DepVar0  =     0.66666666666666;
        V_DepVar1  =     0.33333333333333;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   15;
        _LEAF_  =                    5;
        P_DepVar0  =                 0.25;
        P_DepVar1  =                 0.75;
        Q_DepVar0  =                 0.25;
        Q_DepVar1  =                 0.75;
        V_DepVar0  =                    0;
        V_DepVar1  =                    1;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      END;
    END;
  ELSE DO;
    _NODE_  =                    6;
    _LEAF_  =                    2;
    P_DepVar0  =     0.67272727272727;
    P_DepVar1  =     0.32727272727272;
    Q_DepVar0  =     0.67272727272727;
    Q_DepVar1  =     0.32727272727272;
    V_DepVar0  =     0.73239436619718;
    V_DepVar1  =     0.26760563380281;
    I_DepVar  = '0' ;
    U_DepVar  =                    0;
    END;
  END;
ELSE DO;
  _NODE_  =                    2;
  _LEAF_  =                    1;
  P_DepVar0  =     0.97487787857641;
  P_DepVar1  =     0.02512212142358;
  Q_DepVar0  =     0.97487787857641;
  Q_DepVar1  =     0.02512212142358;
  V_DepVar0  =     0.96290322580645;
  V_DepVar1  =     0.03709677419354;
  I_DepVar  = '0' ;
  U_DepVar  =                    0;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
drop _LEAF_;
