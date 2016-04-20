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
IF  NOT MISSING(AcceptedCmpTotal ) AND
                   0.5 <= AcceptedCmpTotal  THEN DO;
  IF  NOT MISSING(Recency ) AND
    Recency  <                 38.5 THEN DO;
    IF  NOT MISSING(AcceptedCmpTotal ) AND
                       1.5 <= AcceptedCmpTotal  THEN DO;
      _NODE_  =                   13;
      _LEAF_  =                    9;
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
      _ARBFMT_12 = PUT( G_Marital_Status , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('0' ,'1' ) THEN DO;
        _NODE_  =                   22;
        _LEAF_  =                    5;
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
        IF  NOT MISSING(MntWines ) AND
          MntWines  <                  169 THEN DO;
          _NODE_  =                   42;
          _LEAF_  =                    6;
          P_DepVar0  =     0.24137931034482;
          P_DepVar1  =     0.75862068965517;
          Q_DepVar0  =     0.24137931034482;
          Q_DepVar1  =     0.75862068965517;
          V_DepVar0  =                 0.25;
          V_DepVar1  =                 0.75;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          IF  NOT MISSING(RFMstat ) AND
                2448.04945054945 <= RFMstat  THEN DO;
            _NODE_  =                   55;
            _LEAF_  =                    8;
            P_DepVar0  =                 0.25;
            P_DepVar1  =                 0.75;
            Q_DepVar0  =                 0.25;
            Q_DepVar1  =                 0.75;
            V_DepVar0  =     0.42857142857142;
            V_DepVar1  =     0.57142857142857;
            I_DepVar  = '1' ;
            U_DepVar  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   54;
            _LEAF_  =                    7;
            P_DepVar0  =     0.84615384615384;
            P_DepVar1  =     0.15384615384615;
            Q_DepVar0  =     0.84615384615384;
            Q_DepVar1  =     0.15384615384615;
            V_DepVar0  =     0.67857142857142;
            V_DepVar1  =     0.32142857142857;
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
      IF  NOT MISSING(MntMeatProducts ) AND
                         598 <= MntMeatProducts  THEN DO;
        _ARBFMT_12 = PUT( G_Marital_Status , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('0' ,'1' ) THEN DO;
          _NODE_  =                   47;
          _LEAF_  =                   12;
          P_DepVar0  =     0.15384615384615;
          P_DepVar1  =     0.84615384615384;
          Q_DepVar0  =     0.15384615384615;
          Q_DepVar1  =     0.84615384615384;
          V_DepVar0  =                  0.4;
          V_DepVar1  =                  0.6;
          I_DepVar  = '1' ;
          U_DepVar  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   46;
          _LEAF_  =                   11;
          P_DepVar0  =                 0.76;
          P_DepVar1  =                 0.24;
          Q_DepVar0  =                 0.76;
          Q_DepVar1  =                 0.24;
          V_DepVar0  =     0.83333333333333;
          V_DepVar1  =     0.16666666666666;
          I_DepVar  = '0' ;
          U_DepVar  =                    0;
          END;
        END;
      ELSE DO;
        _NODE_  =                   26;
        _LEAF_  =                   10;
        P_DepVar0  =     0.86831275720164;
        P_DepVar1  =     0.13168724279835;
        Q_DepVar0  =     0.86831275720164;
        Q_DepVar1  =     0.13168724279835;
        V_DepVar0  =     0.85576923076923;
        V_DepVar1  =     0.14423076923076;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(Recency ) AND
    Recency  <                 32.5 THEN DO;
    IF  NOT MISSING(MntMeatProducts ) AND
                       431 <= MntMeatProducts  THEN DO;
      _ARBFMT_12 = PUT( G_Marital_Status , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('2' ) THEN DO;
        _NODE_  =                   19;
        _LEAF_  =                    3;
        P_DepVar0  =     0.65853658536585;
        P_DepVar1  =     0.34146341463414;
        Q_DepVar0  =     0.65853658536585;
        Q_DepVar1  =     0.34146341463414;
        V_DepVar0  =               0.6875;
        V_DepVar1  =               0.3125;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   18;
        _LEAF_  =                    2;
        P_DepVar0  =     0.05555555555555;
        P_DepVar1  =     0.94444444444444;
        Q_DepVar0  =     0.05555555555555;
        Q_DepVar1  =     0.94444444444444;
        V_DepVar0  =                    0;
        V_DepVar1  =                    1;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =     0.84257602862254;
      P_DepVar1  =     0.15742397137745;
      Q_DepVar0  =     0.84257602862254;
      Q_DepVar1  =     0.15742397137745;
      V_DepVar0  =               0.8125;
      V_DepVar1  =               0.1875;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    4;
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

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
drop _LEAF_;
