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
      label GRP_Age2 = 'Dummy: GRP_Age=2' ;

      label GRP_Age3 = 'Dummy: GRP_Age=3' ;

      label GRP_Age4 = 'Dummy: GRP_Age=4' ;

      label GRP_Age_Exmpl22 = 'Dummy: GRP_Age_Exmpl2=2' ;

      label GRP_Age_Exmpl23 = 'Dummy: GRP_Age_Exmpl2=3' ;

      label GRP_Age_Exmpl24 = 'Dummy: GRP_Age_Exmpl2=4' ;

      label GRP_CatPurchase2 = 'Dummy: GRP_CatPurchase=2' ;

      label GRP_CatPurchase3 = 'Dummy: GRP_CatPurchase=3' ;

      label GRP_CatPurchase4 = 'Dummy: GRP_CatPurchase=4' ;

      label GRP_Dependents2 = 'Dummy: GRP_Dependents=2' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_NetPurchase2 = 'Dummy: GRP_NetPurchase=2' ;

      label GRP_NetPurchase3 = 'Dummy: GRP_NetPurchase=3' ;

      label GRP_NetPurchase4 = 'Dummy: GRP_NetPurchase=4' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq_Exmpl22 = 'Dummy: GRP_RMntFrq_Exmpl2=2' ;

      label GRP_RMntFrq_Exmpl23 = 'Dummy: GRP_RMntFrq_Exmpl2=3' ;

      label GRP_RMntFrq_Exmpl24 = 'Dummy: GRP_RMntFrq_Exmpl2=4' ;

      label GRP_Recomendation2 = 'Dummy: GRP_Recomendation=2' ;

      label GRP_Recomendation3 = 'Dummy: GRP_Recomendation=3' ;

      label GRP_Recomendation4 = 'Dummy: GRP_Recomendation=4' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for GRP_Age ;
drop GRP_Age2 GRP_Age3 GRP_Age4 ;
if missing( GRP_Age ) then do;
   GRP_Age2 = .;
   GRP_Age3 = .;
   GRP_Age4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Age , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_Age2 = 0;
      GRP_Age3 = 0;
      GRP_Age4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_Age2 = -1;
      GRP_Age3 = -1;
      GRP_Age4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Age2 = 1;
      GRP_Age3 = 0;
      GRP_Age4 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_Age2 = 0;
      GRP_Age3 = 1;
      GRP_Age4 = 0;
   end;
   else do;
      GRP_Age2 = .;
      GRP_Age3 = .;
      GRP_Age4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Age_Exmpl2 ;
drop GRP_Age_Exmpl22 GRP_Age_Exmpl23 GRP_Age_Exmpl24 ;
if missing( GRP_Age_Exmpl2 ) then do;
   GRP_Age_Exmpl22 = .;
   GRP_Age_Exmpl23 = .;
   GRP_Age_Exmpl24 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Age_Exmpl2 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_Age_Exmpl22 = 0;
      GRP_Age_Exmpl23 = 0;
      GRP_Age_Exmpl24 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_Age_Exmpl22 = -1;
      GRP_Age_Exmpl23 = -1;
      GRP_Age_Exmpl24 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Age_Exmpl22 = 1;
      GRP_Age_Exmpl23 = 0;
      GRP_Age_Exmpl24 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_Age_Exmpl22 = 0;
      GRP_Age_Exmpl23 = 1;
      GRP_Age_Exmpl24 = 0;
   end;
   else do;
      GRP_Age_Exmpl22 = .;
      GRP_Age_Exmpl23 = .;
      GRP_Age_Exmpl24 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_CatPurchase ;
drop GRP_CatPurchase2 GRP_CatPurchase3 GRP_CatPurchase4 ;
if missing( GRP_CatPurchase ) then do;
   GRP_CatPurchase2 = .;
   GRP_CatPurchase3 = .;
   GRP_CatPurchase4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_CatPurchase , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_CatPurchase2 = 0;
      GRP_CatPurchase3 = 0;
      GRP_CatPurchase4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_CatPurchase2 = -1;
      GRP_CatPurchase3 = -1;
      GRP_CatPurchase4 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_CatPurchase2 = 0;
      GRP_CatPurchase3 = 1;
      GRP_CatPurchase4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_CatPurchase2 = 1;
      GRP_CatPurchase3 = 0;
      GRP_CatPurchase4 = 0;
   end;
   else do;
      GRP_CatPurchase2 = .;
      GRP_CatPurchase3 = .;
      GRP_CatPurchase4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Dependents ;
drop GRP_Dependents2 ;
if missing( GRP_Dependents ) then do;
   GRP_Dependents2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Dependents , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_Dependents2 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Dependents2 = -1;
   end;
   else do;
      GRP_Dependents2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 ;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Frq2 = -1;
      GRP_Frq3 = -1;
      GRP_Frq4 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 1;
      GRP_Frq4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Frq2 = 1;
      GRP_Frq3 = 0;
      GRP_Frq4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 0;
      GRP_Frq4 = 1;
   end;
   else do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 ;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Income2 = -1;
      GRP_Income3 = -1;
      GRP_Income4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 0;
      GRP_Income4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Income2 = 0;
      GRP_Income3 = 1;
      GRP_Income4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Income2 = 1;
      GRP_Income3 = 0;
      GRP_Income4 = 0;
   end;
   else do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 ;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 1;
      GRP_Mnt4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_Mnt2 = -1;
      GRP_Mnt3 = -1;
      GRP_Mnt4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Mnt2 = 0;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Mnt2 = 1;
      GRP_Mnt3 = 0;
      GRP_Mnt4 = 0;
   end;
   else do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NetPurchase ;
drop GRP_NetPurchase2 GRP_NetPurchase3 GRP_NetPurchase4 ;
if missing( GRP_NetPurchase ) then do;
   GRP_NetPurchase2 = .;
   GRP_NetPurchase3 = .;
   GRP_NetPurchase4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NetPurchase , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_NetPurchase2 = -1;
      GRP_NetPurchase3 = -1;
      GRP_NetPurchase4 = -1;
   end;
   else if _dm12 = '3'  then do;
      GRP_NetPurchase2 = 0;
      GRP_NetPurchase3 = 1;
      GRP_NetPurchase4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_NetPurchase2 = 0;
      GRP_NetPurchase3 = 0;
      GRP_NetPurchase4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NetPurchase2 = 1;
      GRP_NetPurchase3 = 0;
      GRP_NetPurchase4 = 0;
   end;
   else do;
      GRP_NetPurchase2 = .;
      GRP_NetPurchase3 = .;
      GRP_NetPurchase4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 ;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RMntFrq2 = 1;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 1;
      GRP_RMntFrq4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RMntFrq2 = -1;
      GRP_RMntFrq3 = -1;
      GRP_RMntFrq4 = -1;
   end;
   else do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq_Exmpl2 ;
drop GRP_RMntFrq_Exmpl22 GRP_RMntFrq_Exmpl23 GRP_RMntFrq_Exmpl24 ;
if missing( GRP_RMntFrq_Exmpl2 ) then do;
   GRP_RMntFrq_Exmpl22 = .;
   GRP_RMntFrq_Exmpl23 = .;
   GRP_RMntFrq_Exmpl24 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq_Exmpl2 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_RMntFrq_Exmpl22 = 0;
      GRP_RMntFrq_Exmpl23 = 0;
      GRP_RMntFrq_Exmpl24 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RMntFrq_Exmpl22 = 1;
      GRP_RMntFrq_Exmpl23 = 0;
      GRP_RMntFrq_Exmpl24 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_RMntFrq_Exmpl22 = 0;
      GRP_RMntFrq_Exmpl23 = 1;
      GRP_RMntFrq_Exmpl24 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RMntFrq_Exmpl22 = -1;
      GRP_RMntFrq_Exmpl23 = -1;
      GRP_RMntFrq_Exmpl24 = -1;
   end;
   else do;
      GRP_RMntFrq_Exmpl22 = .;
      GRP_RMntFrq_Exmpl23 = .;
      GRP_RMntFrq_Exmpl24 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recomendation ;
drop GRP_Recomendation2 GRP_Recomendation3 GRP_Recomendation4 ;
if missing( GRP_Recomendation ) then do;
   GRP_Recomendation2 = .;
   GRP_Recomendation3 = .;
   GRP_Recomendation4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recomendation , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Recomendation2 = -1;
      GRP_Recomendation3 = -1;
      GRP_Recomendation4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Recomendation2 = 0;
      GRP_Recomendation3 = 0;
      GRP_Recomendation4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Recomendation2 = 0;
      GRP_Recomendation3 = 1;
      GRP_Recomendation4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Recomendation2 = 1;
      GRP_Recomendation3 = 0;
      GRP_Recomendation4 = 0;
   end;
   else do;
      GRP_Recomendation2 = .;
      GRP_Recomendation3 = .;
      GRP_Recomendation4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.23844369635995 * GRP_Age2  +    -0.30091223908953 * GRP_Age3
          +    -0.20874911801425 * GRP_Age4  +     0.18150327937482 *
        GRP_Age_Exmpl22  +    -0.12902365437209 * GRP_Age_Exmpl23
          +    -0.54479789851323 * GRP_Age_Exmpl24  +    -0.65955903728956 *
        GRP_CatPurchase2  +    -0.27515589272887 * GRP_CatPurchase3
          +    -0.00187670363617 * GRP_CatPurchase4  +      0.8340036072259 *
        GRP_Dependents2  +     0.37777427133519 * GRP_Frq2
          +     0.41380075951826 * GRP_Frq3  +    -0.54502908270841 * GRP_Frq4
          +     0.78668319713172 * GRP_Income2  +     0.78164682945162 *
        GRP_Income3  +     0.78598615584951 * GRP_Income4
          +     0.42611398235639 * GRP_Mnt2  +     0.10159460674363 * GRP_Mnt3
          +    -0.31666387982722 * GRP_Mnt4  +     0.10740195396699 *
        GRP_NetPurchase2  +    -0.15939334144213 * GRP_NetPurchase3
          +    -0.68584584449425 * GRP_NetPurchase4  +      0.4436271256155 *
        GRP_RMntFrq2  +     0.29951078208656 * GRP_RMntFrq3
          +    -0.47428818300944 * GRP_RMntFrq4  +    -0.08523435902257 *
        GRP_RMntFrq_Exmpl22  +     0.09304094833041 * GRP_RMntFrq_Exmpl23
          +    -0.28207777186887 * GRP_RMntFrq_Exmpl24
          +    -0.41302023417328 * GRP_Recomendation2
          +    -0.37853285481185 * GRP_Recomendation3
          +     0.33876451754606 * GRP_Recomendation4 ;
   H12  =     0.12774390687503 * GRP_Age2  +     0.00519677013639 * GRP_Age3
          +     0.24858532729532 * GRP_Age4  +     0.28242311238177 *
        GRP_Age_Exmpl22  +    -0.03574048047866 * GRP_Age_Exmpl23
          +      0.0041074515049 * GRP_Age_Exmpl24  +    -0.06557510059033 *
        GRP_CatPurchase2  +     0.05713103969881 * GRP_CatPurchase3
          +     0.74413916413536 * GRP_CatPurchase4  +    -0.31816262179801 *
        GRP_Dependents2  +     0.40278562518368 * GRP_Frq2
          +     0.49097065473223 * GRP_Frq3  +     0.24977409249161 * GRP_Frq4
          +     0.04154407236989 * GRP_Income2  +    -0.37241698829703 *
        GRP_Income3  +    -0.33428073027467 * GRP_Income4
          +      0.0229312235472 * GRP_Mnt2  +     0.21036809622946 * GRP_Mnt3
          +    -0.19977584736017 * GRP_Mnt4  +     0.07436848197059 *
        GRP_NetPurchase2  +    -0.25144724615626 * GRP_NetPurchase3
          +    -0.27193290215764 * GRP_NetPurchase4  +     -0.0306450674923 *
        GRP_RMntFrq2  +     -0.5308099568484 * GRP_RMntFrq3
          +     0.15207885672757 * GRP_RMntFrq4  +    -0.06642826538976 *
        GRP_RMntFrq_Exmpl22  +    -0.30475963040935 * GRP_RMntFrq_Exmpl23
          +     0.32200812898161 * GRP_RMntFrq_Exmpl24
          +    -0.56263203382767 * GRP_Recomendation2
          +     0.28198521847768 * GRP_Recomendation3
          +     0.08871358729424 * GRP_Recomendation4 ;
   H13  =    -0.01844982008001 * GRP_Age2  +    -0.59501873651288 * GRP_Age3
          +     0.41522071092119 * GRP_Age4  +    -0.11160318569433 *
        GRP_Age_Exmpl22  +    -0.49473645427092 * GRP_Age_Exmpl23
          +     0.02464215401664 * GRP_Age_Exmpl24  +     0.80455409383701 *
        GRP_CatPurchase2  +    -0.34887174045282 * GRP_CatPurchase3
          +    -0.34893566952031 * GRP_CatPurchase4  +     0.19324612924664 *
        GRP_Dependents2  +     0.01448786316467 * GRP_Frq2
          +     0.17004656802955 * GRP_Frq3  +     -0.5787867482215 * GRP_Frq4
          +     0.35172718673154 * GRP_Income2  +     0.59314732201887 *
        GRP_Income3  +     0.63770556795866 * GRP_Income4
          +     0.23466675837674 * GRP_Mnt2  +     0.49738420755746 * GRP_Mnt3
          +    -0.31935983891823 * GRP_Mnt4  +    -0.60064077712758 *
        GRP_NetPurchase2  +     0.64602332468559 * GRP_NetPurchase3
          +    -0.94103588894483 * GRP_NetPurchase4  +     0.03730051505081 *
        GRP_RMntFrq2  +    -0.65359291442145 * GRP_RMntFrq3
          +    -0.10192773359462 * GRP_RMntFrq4  +    -0.39153474830722 *
        GRP_RMntFrq_Exmpl22  +    -0.77106993561112 * GRP_RMntFrq_Exmpl23
          +    -0.15025747685729 * GRP_RMntFrq_Exmpl24
          +    -0.17975132151702 * GRP_Recomendation2
          +     0.55911186939298 * GRP_Recomendation3
          +    -0.28246996748275 * GRP_Recomendation4 ;
   H11  =    -0.24239063726552 + H11 ;
   H12  =     1.18659612094031 + H12 ;
   H13  =      0.2301898059177 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
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
   P_DepVar1  =    -3.66375609913088 * H11  +    -3.08576015266387 * H12
          +     2.46738389837274 * H13 ;
   P_DepVar1  =     -4.2006076223422 + P_DepVar1 ;
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
   P_DepVar1  =     0.06989576946658;
   P_DepVar0  =     0.93010423053341;
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
drop
H11
H12
H13
;
