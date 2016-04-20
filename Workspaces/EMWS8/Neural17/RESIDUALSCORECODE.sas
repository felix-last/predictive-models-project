***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
      F_DepVar  $ 12
;
      label S_PC_1 = 'Standard: PC_1' ;

      label S_PC_10 = 'Standard: PC_10' ;

      label S_PC_11 = 'Standard: PC_11' ;

      label S_PC_12 = 'Standard: PC_12' ;

      label S_PC_13 = 'Standard: PC_13' ;

      label S_PC_14 = 'Standard: PC_14' ;

      label S_PC_15 = 'Standard: PC_15' ;

      label S_PC_16 = 'Standard: PC_16' ;

      label S_PC_17 = 'Standard: PC_17' ;

      label S_PC_2 = 'Standard: PC_2' ;

      label S_PC_3 = 'Standard: PC_3' ;

      label S_PC_4 = 'Standard: PC_4' ;

      label S_PC_5 = 'Standard: PC_5' ;

      label S_PC_6 = 'Standard: PC_6' ;

      label S_PC_7 = 'Standard: PC_7' ;

      label S_PC_8 = 'Standard: PC_8' ;

      label S_PC_9 = 'Standard: PC_9' ;

      label S_Year_Birth = 'Standard: Year_Birth' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label H16 = 'Hidden: H1=6' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   PC_1 , 
   PC_10 , 
   PC_11 , 
   PC_12 , 
   PC_13 , 
   PC_14 , 
   PC_15 , 
   PC_16 , 
   PC_17 , 
   PC_2 , 
   PC_3 , 
   PC_4 , 
   PC_5 , 
   PC_6 , 
   PC_7 , 
   PC_8 , 
   PC_9 , 
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( PC_1 ) THEN S_PC_1  = . ;
   ELSE S_PC_1  = -3.5843560363112E-15 +     0.29892710740321 * PC_1 ;
   IF MISSING( PC_10 ) THEN S_PC_10  = . ;
   ELSE S_PC_10  = -6.2658190129358E-15 +     0.82174710410461 * PC_10 ;
   IF MISSING( PC_11 ) THEN S_PC_11  = . ;
   ELSE S_PC_11  =  5.2827852337662E-15 +     0.85633436658082 * PC_11 ;
   IF MISSING( PC_12 ) THEN S_PC_12  = . ;
   ELSE S_PC_12  = -4.1238610853835E-15 +     0.88809669446626 * PC_12 ;
   IF MISSING( PC_13 ) THEN S_PC_13  = . ;
   ELSE S_PC_13  =  1.5294467014806E-15 +     0.89679439630496 * PC_13 ;
   IF MISSING( PC_14 ) THEN S_PC_14  = . ;
   ELSE S_PC_14  = -6.2595704915953E-15 +     0.90338385596507 * PC_14 ;
   IF MISSING( PC_15 ) THEN S_PC_15  = . ;
   ELSE S_PC_15  = -5.5154137020119E-16 +     0.92995263572302 * PC_15 ;
   IF MISSING( PC_16 ) THEN S_PC_16  = . ;
   ELSE S_PC_16  = -2.6453177008422E-15 +      0.9512169845353 * PC_16 ;
   IF MISSING( PC_17 ) THEN S_PC_17  = . ;
   ELSE S_PC_17  =   3.641923430911E-15 +     0.99885948412688 * PC_17 ;
   IF MISSING( PC_2 ) THEN S_PC_2  = . ;
   ELSE S_PC_2  =  6.4913163867762E-15 +      0.5437297154044 * PC_2 ;
   IF MISSING( PC_3 ) THEN S_PC_3  = . ;
   ELSE S_PC_3  =  2.2868642839817E-15 +     0.55367105026453 * PC_3 ;
   IF MISSING( PC_4 ) THEN S_PC_4  = . ;
   ELSE S_PC_4  = -4.0268214595882E-15 +     0.63693441603523 * PC_4 ;
   IF MISSING( PC_5 ) THEN S_PC_5  = . ;
   ELSE S_PC_5  = -4.7373321816097E-15 +     0.66668512927319 * PC_5 ;
   IF MISSING( PC_6 ) THEN S_PC_6  = . ;
   ELSE S_PC_6  =  1.5652933820513E-15 +     0.70536143636182 * PC_6 ;
   IF MISSING( PC_7 ) THEN S_PC_7  = . ;
   ELSE S_PC_7  =  3.7827428793697E-16 +     0.74929815039837 * PC_7 ;
   IF MISSING( PC_8 ) THEN S_PC_8  = . ;
   ELSE S_PC_8  = -2.4158031671174E-15 +     0.77165002143369 * PC_8 ;
   IF MISSING( PC_9 ) THEN S_PC_9  = . ;
   ELSE S_PC_9  = -4.0982774857475E-15 +       0.808303499885 * PC_9 ;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * 
        Year_Birth ;
END;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =      0.4640556659307 * S_PC_1  +    -0.33462522014566 * S_PC_10
          +     0.56806418894822 * S_PC_11  +     0.47755179162972 * S_PC_12
          +    -1.05081910003147 * S_PC_13  +     0.51924824879327 * S_PC_14
          +    -0.40498769195755 * S_PC_15  +     0.12870488597274 * S_PC_16
          +    -0.18386984954493 * S_PC_17  +     -0.2086299332252 * S_PC_2
          +    -0.50252958940538 * S_PC_3  +     0.15534767510019 * S_PC_4
          +    -0.06309817063591 * S_PC_5  +     0.11574559455719 * S_PC_6
          +     0.32449679316348 * S_PC_7  +     0.30800540848273 * S_PC_8
          +     0.27935517346427 * S_PC_9  +     0.37069240076102 * 
        S_Year_Birth ;
   H12  =     0.39410399313223 * S_PC_1  +     0.24787065969983 * S_PC_10
          +     0.01252810266568 * S_PC_11  +      0.2112853368947 * S_PC_12
          +    -0.28943433543997 * S_PC_13  +       0.039416623543 * S_PC_14
          +     0.38042528163165 * S_PC_15  +     0.58727213716292 * S_PC_16
          +    -0.62894185015376 * S_PC_17  +    -0.45301915449406 * S_PC_2
          +     0.04877645916167 * S_PC_3  +    -0.26981835195451 * S_PC_4
          +    -0.13085816602216 * S_PC_5  +    -0.18793881101225 * S_PC_6
          +     0.18670477755191 * S_PC_7  +     0.10054352014255 * S_PC_8
          +     0.09310848306663 * S_PC_9  +    -0.06981710025305 * 
        S_Year_Birth ;
   H13  =    -0.74618513684454 * S_PC_1  +    -0.09872426408083 * S_PC_10
          +    -0.23798160464408 * S_PC_11  +     0.04757319577054 * S_PC_12
          +    -0.37388357209966 * S_PC_13  +     0.84808088438719 * S_PC_14
          +    -0.05926306123652 * S_PC_15  +     0.18815097741352 * S_PC_16
          +     0.06905915680373 * S_PC_17  +    -1.08258627714779 * S_PC_2
          +    -0.40649973463746 * S_PC_3  +     0.42001548371963 * S_PC_4
          +     -0.1534389075544 * S_PC_5  +     0.18740639829009 * S_PC_6
          +    -0.04408545619191 * S_PC_7  +     0.36698801026128 * S_PC_8
          +    -0.07205131499531 * S_PC_9  +    -0.36825369917548 * 
        S_Year_Birth ;
   H14  =     0.03862803097854 * S_PC_1  +     0.36123885865628 * S_PC_10
          +    -0.67560468649741 * S_PC_11  +    -0.69577537640908 * S_PC_12
          +     0.76281192398282 * S_PC_13  +     0.17769449989379 * S_PC_14
          +    -0.02693737417861 * S_PC_15  +    -0.10347641425241 * S_PC_16
          +     0.53814093155394 * S_PC_17  +     0.33997107384624 * S_PC_2
          +    -0.13802497891101 * S_PC_3  +     0.40245616650516 * S_PC_4
          +     0.48103095271792 * S_PC_5  +    -0.25102974356893 * S_PC_6
          +     0.33678040132276 * S_PC_7  +    -0.19457240527678 * S_PC_8
          +     -0.1781281379998 * S_PC_9  +    -0.01527450737168 * 
        S_Year_Birth ;
   H15  =     0.88303191844461 * S_PC_1  +    -0.46238003710472 * S_PC_10
          +    -0.20085501521888 * S_PC_11  +    -0.70197238540328 * S_PC_12
          +    -0.14564265232718 * S_PC_13  +    -0.11158041083613 * S_PC_14
          +     0.02474516981163 * S_PC_15  +     0.03797715835251 * S_PC_16
          +     0.52678061960714 * S_PC_17  +    -0.48106600242342 * S_PC_2
          +      0.3976982347327 * S_PC_3  +     0.40547333642751 * S_PC_4
          +    -0.71062834957535 * S_PC_5  +    -0.15338067613858 * S_PC_6
          +    -0.49919762898936 * S_PC_7  +    -0.42650670881449 * S_PC_8
          +     0.48631507078449 * S_PC_9  +      0.0497794049348 * 
        S_Year_Birth ;
   H16  =     0.70691086447732 * S_PC_1  +    -0.47946522460485 * S_PC_10
          +    -0.71026241368882 * S_PC_11  +    -0.29297239152668 * S_PC_12
          +     0.03684601929927 * S_PC_13  +    -0.19380463617056 * S_PC_14
          +     0.06034168116607 * S_PC_15  +     0.02617203331832 * S_PC_16
          +     0.08436353742259 * S_PC_17  +     0.25125330241669 * S_PC_2
          +     0.67024506325126 * S_PC_3  +     -0.4104513299531 * S_PC_4
          +     0.01439811017846 * S_PC_5  +      0.1353699477934 * S_PC_6
          +    -0.13772050569005 * S_PC_7  +     0.65217587480338 * S_PC_8
          +     0.59972905640062 * S_PC_9  +    -0.23864759601162 * 
        S_Year_Birth ;
   H11  =    -0.96473164506576 + H11 ;
   H12  =     0.98279255842783 + H12 ;
   H13  =    -1.66611685085053 + H13 ;
   H14  =    -1.58832310532425 + H14 ;
   H15  =    -1.47322442289085 + H15 ;
   H16  =    -1.98186768764291 + H16 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;

*** Generate dummy variables for DepVar ;
drop DepVar1 DepVar0 ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   DepVar1 = .;
   DepVar0 = .;
end;
else do;
   if F_DepVar = '0'  then do;
      DepVar1 = 0;
      DepVar0 = 1;
   end;
   else if F_DepVar = '1'  then do;
      DepVar1 = 1;
      DepVar0 = 0;
   end;
   else do;
      DepVar1 = .;
      DepVar0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     2.40220964164359 * H11  +     0.57143659221088 * H12
          +     1.33946010617365 * H13  +    -1.50955086610503 * H14
          +     1.52090527627884 * H15  +     1.78582940995754 * H16 ;
   P_DepVar1  =    -0.73688900091284 + P_DepVar1 ;
   P_DepVar0  = 0; 
   _MAX_ = MAX (P_DepVar1 , P_DepVar0 );
   _SUM_ = 0.; 
   P_DepVar1  = EXP(P_DepVar1  - _MAX_);
   _SUM_ = _SUM_ + P_DepVar1 ;
   P_DepVar0  = EXP(P_DepVar0  - _MAX_);
   _SUM_ = _SUM_ + P_DepVar0 ;
   P_DepVar1  = P_DepVar1  / _SUM_;
   P_DepVar0  = P_DepVar0  / _SUM_;
END;
ELSE DO;
   P_DepVar1  = .;
   P_DepVar0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_DepVar1  =     0.15122156697556;
   P_DepVar0  =     0.84877843302443;
END;
*** *****************************;
*** Writing the Residuals  of the Node DepVar ;
*** ******************************;
IF MISSING( DepVar1 ) THEN R_DepVar1  = . ;
ELSE R_DepVar1  = DepVar1  - P_DepVar1 ;
IF MISSING( DepVar0 ) THEN R_DepVar0  = . ;
ELSE R_DepVar0  = DepVar0  - P_DepVar0 ;
*** *************************;
*** Writing the I_DepVar  AND U_DepVar ;
*** *************************;
_MAXP_ = P_DepVar1 ;
I_DepVar  = "1           " ;
U_DepVar  =                    1;
IF( _MAXP_ LT P_DepVar0  ) THEN DO; 
   _MAXP_ = P_DepVar0 ;
   I_DepVar  = "0           " ;
   U_DepVar  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
