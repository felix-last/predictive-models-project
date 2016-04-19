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
LENGTH _ARBFMT_8 $      8; DROP _ARBFMT_8;
_ARBFMT_8 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( DepVar , BEST.);
 %DMNORMCP( _ARBFMT_12, F_DepVar );

******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(AcceptedCmpTotal ) AND
                   0.5 <= AcceptedCmpTotal  THEN DO;
  IF  NOT MISSING(Recency ) AND
    Recency  <                 38.5 THEN DO;
    IF  NOT MISSING(AcceptedCmpTotal ) AND
                       1.5 <= AcceptedCmpTotal  THEN DO;
      _NODE_  =                   13;
      _LEAF_  =                   11;
      P_DepVar0  =     0.05263157894736;
      P_DepVar1  =     0.94736842105263;
      Q_DepVar0  =     0.05263157894736;
      Q_DepVar1  =     0.94736842105263;
      V_DepVar0  =                    0;
      V_DepVar1  =                    1;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _ARBFMT_8 = PUT( Marital_Status , $8.);
       %DMNORMIP( _ARBFMT_8);
      IF _ARBFMT_8 IN ('WIDOW' ,'DIVORCED' ,'SINGLE' ) THEN DO;
        _NODE_  =                   25;
        _LEAF_  =                   10;
        P_DepVar0  =      0.2258064516129;
        P_DepVar1  =     0.77419354838709;
        Q_DepVar0  =      0.2258064516129;
        Q_DepVar1  =     0.77419354838709;
        V_DepVar0  =     0.41935483870967;
        V_DepVar1  =     0.58064516129032;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        IF  NOT MISSING(Kidhome ) AND
                           0.5 <= Kidhome  THEN DO;
          _NODE_  =                   39;
          _LEAF_  =                    9;
          P_DepVar0  =               0.3125;
          P_DepVar1  =               0.6875;
          Q_DepVar0  =               0.3125;
          Q_DepVar1  =               0.6875;
          V_DepVar0  =     0.23076923076923;
          V_DepVar1  =     0.76923076923076;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          IF  NOT MISSING(RFMstat ) AND
                2448.04945054945 <= RFMstat  THEN DO;
            _NODE_  =                   51;
            _LEAF_  =                    8;
            P_DepVar0  =     0.23529411764705;
            P_DepVar1  =     0.76470588235294;
            Q_DepVar0  =     0.23529411764705;
            Q_DepVar1  =     0.76470588235294;
            V_DepVar0  =     0.42857142857142;
            V_DepVar1  =     0.57142857142857;
            I_DepVar  = '1' ;
            U_DepVar  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   50;
            _LEAF_  =                    7;
            P_DepVar0  =      0.8076923076923;
            P_DepVar1  =     0.19230769230769;
            Q_DepVar0  =      0.8076923076923;
            Q_DepVar1  =     0.19230769230769;
            V_DepVar0  =     0.78260869565217;
            V_DepVar1  =     0.21739130434782;
            I_DepVar  = '0' ;
            U_DepVar  =                    0;
            END;
          END;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(AcceptedCmpTotal ) AND
                       2.5 <= AcceptedCmpTotal  THEN DO;
      _NODE_  =                   15;
      _LEAF_  =                   13;
      P_DepVar0  =      0.3103448275862;
      P_DepVar1  =     0.68965517241379;
      Q_DepVar0  =      0.3103448275862;
      Q_DepVar1  =     0.68965517241379;
      V_DepVar0  =     0.33333333333333;
      V_DepVar1  =     0.66666666666666;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _NODE_  =                   14;
      _LEAF_  =                   12;
      P_DepVar0  =     0.82562277580071;
      P_DepVar1  =     0.17437722419928;
      Q_DepVar0  =     0.82562277580071;
      Q_DepVar1  =     0.17437722419928;
      V_DepVar0  =     0.81818181818181;
      V_DepVar1  =     0.18181818181818;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(Recency ) AND
    Recency  <                 32.5 THEN DO;
    IF  NOT MISSING(NumDealsPurchases ) AND
                       5.5 <= NumDealsPurchases  THEN DO;
      IF  NOT MISSING(Frq ) AND
        Frq  <                 13.5 THEN DO;
        _NODE_  =                   18;
        _LEAF_  =                    3;
        P_DepVar0  =     0.06666666666666;
        P_DepVar1  =     0.93333333333333;
        Q_DepVar0  =     0.06666666666666;
        Q_DepVar1  =     0.93333333333333;
        V_DepVar0  =                  0.2;
        V_DepVar1  =                  0.8;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        IF  NOT MISSING(RFMstat ) AND
              1513.63146551724 <= RFMstat  THEN DO;
          _NODE_  =                   35;
          _LEAF_  =                    5;
          P_DepVar0  =     0.16666666666666;
          P_DepVar1  =     0.83333333333333;
          Q_DepVar0  =     0.16666666666666;
          Q_DepVar1  =     0.83333333333333;
          V_DepVar0  =                 0.25;
          V_DepVar1  =                 0.75;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   34;
          _LEAF_  =                    4;
          P_DepVar0  =                0.875;
          P_DepVar1  =                0.125;
          Q_DepVar0  =                0.875;
          Q_DepVar1  =                0.125;
          V_DepVar0  =                  0.7;
          V_DepVar1  =                  0.3;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(RFMstat ) AND
            5150.39285714285 <= RFMstat  THEN DO;
        _NODE_  =                   17;
        _LEAF_  =                    2;
        P_DepVar0  =     0.38888888888888;
        P_DepVar1  =     0.61111111111111;
        Q_DepVar0  =     0.38888888888888;
        Q_DepVar1  =     0.61111111111111;
        V_DepVar0  =     0.41666666666666;
        V_DepVar1  =     0.58333333333333;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   16;
        _LEAF_  =                    1;
        P_DepVar0  =     0.84547069271758;
        P_DepVar1  =     0.15452930728241;
        Q_DepVar0  =     0.84547069271758;
        Q_DepVar1  =     0.15452930728241;
        V_DepVar0  =     0.81673306772908;
        V_DepVar1  =     0.18326693227091;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    6;
    P_DepVar0  =     0.98042414355628;
    P_DepVar1  =     0.01957585644371;
    Q_DepVar0  =     0.98042414355628;
    Q_DepVar1  =     0.01957585644371;
    V_DepVar0  =     0.98795180722891;
    V_DepVar1  =     0.01204819277108;
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