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
_ARBFMT_12 = PUT( GRP_RFMstat , BEST12.);
 %DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('5' ) THEN DO;
  _ARBFMT_12 = PUT( GRP_AcceptedCmp5 , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('3' ) THEN DO;
    _ARBFMT_12 = PUT( GRP_Recency , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('2' ) THEN DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_DepVar0  =     0.11111111111111;
      P_DepVar1  =     0.88888888888888;
      Q_DepVar0  =     0.11111111111111;
      Q_DepVar1  =     0.88888888888888;
      V_DepVar0  =                  0.1;
      V_DepVar1  =                  0.9;
      I_DepVar  = '1' ;
      U_DepVar  =                    1;
      END;
    ELSE DO;
      _NODE_  =                    9;
      _LEAF_  =                    2;
      P_DepVar0  =     0.54430379746835;
      P_DepVar1  =     0.45569620253164;
      Q_DepVar0  =     0.54430379746835;
      Q_DepVar1  =     0.45569620253164;
      V_DepVar0  =     0.56756756756756;
      V_DepVar1  =     0.43243243243243;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    END;
  ELSE DO;
    _ARBFMT_12 = PUT( GRP_Recency , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ,'5' ,'4' ) THEN DO;
      _NODE_  =                   11;
      _LEAF_  =                    5;
      P_DepVar0  =     0.82027649769585;
      P_DepVar1  =     0.17972350230414;
      Q_DepVar0  =     0.82027649769585;
      Q_DepVar1  =     0.17972350230414;
      V_DepVar0  =     0.82222222222222;
      V_DepVar1  =     0.17777777777777;
      I_DepVar  = '0' ;
      U_DepVar  =                    0;
      END;
    ELSE DO;
      _ARBFMT_12 = PUT( GRP_NumCatalogPurchases , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('5' ) THEN DO;
        _NODE_  =                   16;
        _LEAF_  =                    3;
        P_DepVar0  =      0.4758064516129;
        P_DepVar1  =     0.52419354838709;
        Q_DepVar0  =      0.4758064516129;
        Q_DepVar1  =     0.52419354838709;
        V_DepVar0  =     0.48333333333333;
        V_DepVar1  =     0.51666666666666;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   17;
        _LEAF_  =                    4;
        P_DepVar0  =            0.7734375;
        P_DepVar1  =            0.2265625;
        Q_DepVar0  =            0.7734375;
        Q_DepVar1  =            0.2265625;
        V_DepVar0  =     0.75510204081632;
        V_DepVar1  =     0.24489795918367;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_12 = PUT( GRP_Recency , BEST12.);
   %DMNORMIP( _ARBFMT_12);
  IF _ARBFMT_12 IN ('2' ) THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                    9;
    P_DepVar0  =     0.79078014184397;
    P_DepVar1  =     0.20921985815602;
    Q_DepVar0  =     0.79078014184397;
    Q_DepVar1  =     0.20921985815602;
    V_DepVar0  =     0.72268907563025;
    V_DepVar1  =     0.27731092436974;
    I_DepVar  = '0' ;
    U_DepVar  =                    0;
    END;
  ELSE DO;
    _ARBFMT_12 = PUT( GRP_AcceptedCmp5 , BEST12.);
     %DMNORMIP( _ARBFMT_12);
    IF _ARBFMT_12 IN ('3' ) THEN DO;
      _ARBFMT_12 = PUT( GRP_MntWines , BEST12.);
       %DMNORMIP( _ARBFMT_12);
      IF _ARBFMT_12 IN ('3' ,'4' ) THEN DO;
        _NODE_  =                   20;
        _LEAF_  =                    6;
        P_DepVar0  =     0.26315789473684;
        P_DepVar1  =     0.73684210526315;
        Q_DepVar0  =     0.26315789473684;
        Q_DepVar1  =     0.73684210526315;
        V_DepVar0  =     0.28571428571428;
        V_DepVar1  =     0.71428571428571;
        I_DepVar  = '1' ;
        U_DepVar  =                    1;
        END;
      ELSE DO;
        _NODE_  =                   21;
        _LEAF_  =                    7;
        P_DepVar0  =     0.81818181818181;
        P_DepVar1  =     0.18181818181818;
        Q_DepVar0  =     0.81818181818181;
        Q_DepVar1  =     0.18181818181818;
        V_DepVar0  =     0.66666666666666;
        V_DepVar1  =     0.33333333333333;
        I_DepVar  = '0' ;
        U_DepVar  =                    0;
        END;
      END;
    ELSE DO;
      _NODE_  =                   13;
      _LEAF_  =                    8;
      P_DepVar0  =     0.95194986072423;
      P_DepVar1  =     0.04805013927576;
      Q_DepVar0  =     0.95194986072423;
      Q_DepVar1  =     0.04805013927576;
      V_DepVar0  =     0.95980707395498;
      V_DepVar1  =     0.04019292604501;
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
