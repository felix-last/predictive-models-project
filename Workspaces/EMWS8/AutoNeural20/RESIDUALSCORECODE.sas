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
      label S_Year_Birth = 'Standard: Year_Birth' ;

      label GRP_AcceptedCmp52 = 'Dummy: GRP_AcceptedCmp5=2' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_MntFishProducts2 = 'Dummy: GRP_MntFishProducts=2' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H1x2_5 = 'Hidden: H1x2_=5' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

      label H2x1_5 = 'Hidden: H2x1_=5' ;

      label I_DepVar = 'Into: DepVar' ;

      label F_DepVar = 'From: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label R_DepVar1 = 'Residual: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

      label R_DepVar0 = 'Residual: DepVar=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop GRP_AcceptedCmp52 ;
if missing( GRP_AcceptedCmp5 ) then do;
   GRP_AcceptedCmp52 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      GRP_AcceptedCmp52 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_AcceptedCmp52 = -1;
   end;
   else do;
      GRP_AcceptedCmp52 = .;
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
   else if _dm12 = '4'  then do;
      GRP_Frq2 = 0;
      GRP_Frq3 = 0;
      GRP_Frq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_Frq2 = 1;
      GRP_Frq3 = 0;
      GRP_Frq4 = 0;
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

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts2 GRP_MntFishProducts3 GRP_MntFishProducts4 ;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts2 = .;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 1;
      GRP_MntFishProducts4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntFishProducts2 = -1;
      GRP_MntFishProducts3 = -1;
      GRP_MntFishProducts4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntFishProducts2 = 0;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntFishProducts2 = 1;
      GRP_MntFishProducts3 = 0;
      GRP_MntFishProducts4 = 0;
   end;
   else do;
      GRP_MntFishProducts2 = .;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 ;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 1;
      GRP_MntGoldProds4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntGoldProds2 = 0;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntGoldProds2 = -1;
      GRP_MntGoldProds3 = -1;
      GRP_MntGoldProds4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntGoldProds2 = 1;
      GRP_MntGoldProds3 = 0;
      GRP_MntGoldProds4 = 0;
   end;
   else do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4 ;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 1;
      GRP_MntMeatProducts4 = 0;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntMeatProducts2 = 0;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 1;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntMeatProducts2 = -1;
      GRP_MntMeatProducts3 = -1;
      GRP_MntMeatProducts4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntMeatProducts2 = 1;
      GRP_MntMeatProducts3 = 0;
      GRP_MntMeatProducts4 = 0;
   end;
   else do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 ;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 1;
      GRP_MntWines4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_MntWines2 = -1;
      GRP_MntWines3 = -1;
      GRP_MntWines4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_MntWines2 = 0;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_MntWines2 = 1;
      GRP_MntWines3 = 0;
      GRP_MntWines4 = 0;
   end;
   else do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4 ;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumCatalogPurchases3 = 1;
      GRP_NumCatalogPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumCatalogPurchases3 = -1;
      GRP_NumCatalogPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumCatalogPurchases3 = 0;
      GRP_NumCatalogPurchases4 = 1;
   end;
   else do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4 ;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_NumDistPurchases2 = -1;
      GRP_NumDistPurchases3 = -1;
      GRP_NumDistPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumDistPurchases2 = 1;
      GRP_NumDistPurchases3 = 0;
      GRP_NumDistPurchases4 = 0;
   end;
   else if _dm12 = '3'  then do;
      GRP_NumDistPurchases2 = 0;
      GRP_NumDistPurchases3 = 1;
      GRP_NumDistPurchases4 = 0;
   end;
   else do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4 ;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 1;
      GRP_NumWebPurchases4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_NumWebPurchases2 = -1;
      GRP_NumWebPurchases3 = -1;
      GRP_NumWebPurchases4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_NumWebPurchases2 = 0;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_NumWebPurchases2 = 1;
      GRP_NumWebPurchases3 = 0;
      GRP_NumWebPurchases4 = 0;
   end;
   else do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 ;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '4'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_RFMstat2 = 0;
      GRP_RFMstat3 = 1;
      GRP_RFMstat4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RFMstat2 = -1;
      GRP_RFMstat3 = -1;
      GRP_RFMstat4 = -1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RFMstat2 = 1;
      GRP_RFMstat3 = 0;
      GRP_RFMstat4 = 0;
   end;
   else do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
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
   if _dm12 = '3'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 1;
      GRP_RMntFrq4 = 0;
   end;
   else if _dm12 = '5'  then do;
      GRP_RMntFrq2 = -1;
      GRP_RMntFrq3 = -1;
      GRP_RMntFrq4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_RMntFrq2 = 0;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 1;
   end;
   else if _dm12 = '2'  then do;
      GRP_RMntFrq2 = 1;
      GRP_RMntFrq3 = 0;
      GRP_RMntFrq4 = 0;
   end;
   else do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 ;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '5'  then do;
      GRP_Recency2 = -1;
      GRP_Recency3 = -1;
      GRP_Recency4 = -1;
   end;
   else if _dm12 = '4'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 0;
      GRP_Recency4 = 1;
   end;
   else if _dm12 = '3'  then do;
      GRP_Recency2 = 0;
      GRP_Recency3 = 1;
      GRP_Recency4 = 0;
   end;
   else if _dm12 = '2'  then do;
      GRP_Recency2 = 1;
      GRP_Recency3 = 0;
      GRP_Recency4 = 0;
   end;
   else do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   Year_Birth   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node interval ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * Year_Birth ;
END;
ELSE DO;
   IF MISSING( Year_Birth ) THEN S_Year_Birth  = . ;
   ELSE S_Year_Birth  =    -163.205330145852 +     0.08289609202864 * 
        Year_Birth ;
END;
*** *************************;
*** Writing the Node nominal ;
*** *************************;
*** *************************;
*** Writing the Node H1x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x1_1  =      1.0311746583126 * S_Year_Birth ;
   H1x1_2  =     1.67119181587557 * S_Year_Birth ;
   H1x1_3  =    -2.17540349820814 * S_Year_Birth ;
   H1x1_4  =    -2.56679893298362 * S_Year_Birth ;
   H1x1_5  =    -0.60932306642258 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     0.72534982243417 * GRP_AcceptedCmp52
          +     0.33166960090157 * GRP_Frq2  +     1.71697127611163 * GRP_Frq3
          +     0.81002020807326 * GRP_Frq4  +     0.48027973945372 * 
        GRP_Income2  +    -1.09550149543369 * GRP_Income3
          +    -0.22235642667559 * GRP_Income4  +    -0.00978473434282 * 
        GRP_Mnt2  +    -0.11796310741854 * GRP_Mnt3  +    -0.42227802637743 * 
        GRP_Mnt4  +    -0.60021395849859 * GRP_MntFishProducts2
          +    -1.92253913417034 * GRP_MntFishProducts3
          +     0.11236967036572 * GRP_MntFishProducts4
          +     1.55117451498964 * GRP_MntGoldProds2
          +    -2.17638819155912 * GRP_MntGoldProds3
          +     1.12471370225173 * GRP_MntGoldProds4
          +     0.73773441156548 * GRP_MntMeatProducts2
          +     2.07738910661633 * GRP_MntMeatProducts3
          +    -0.64280630173292 * GRP_MntMeatProducts4
          +     0.77316083192112 * GRP_MntWines2  +     2.15867403144607 * 
        GRP_MntWines3  +     2.47891578910494 * GRP_MntWines4
          +     0.27137671258246 * GRP_NumCatalogPurchases3
          +     1.17769351442984 * GRP_NumCatalogPurchases4
          +     1.22104662684375 * GRP_NumDistPurchases2
          +      3.4956187335148 * GRP_NumDistPurchases3
          +     1.44110988448724 * GRP_NumDistPurchases4
          +    -0.15910531424988 * GRP_NumWebPurchases2
          +      2.0651216353476 * GRP_NumWebPurchases3
          +     1.88264340284474 * GRP_NumWebPurchases4
          +    -0.51356035467324 * GRP_RFMstat2  +    -0.97145618762825 * 
        GRP_RFMstat3  +     1.44865956224608 * GRP_RFMstat4
          +    -0.02171623156521 * GRP_RMntFrq2  +     2.25871822244977 * 
        GRP_RMntFrq3  +    -0.95854946562766 * GRP_RMntFrq4
          +    -0.19279939282854 * GRP_Recency2  +    -0.59440462375689 * 
        GRP_Recency3  +     -2.1494171625282 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +    -1.10416749938295 * GRP_AcceptedCmp52
          +     2.11163264556083 * GRP_Frq2  +    -0.30443521786246 * GRP_Frq3
          +     2.19401599825923 * GRP_Frq4  +    -0.38326784930815 * 
        GRP_Income2  +    -0.07594895187003 * GRP_Income3
          +     0.98207007879144 * GRP_Income4  +    -1.92634732130472 * 
        GRP_Mnt2  +     0.64603066612326 * GRP_Mnt3  +     0.62922821521966 * 
        GRP_Mnt4  +     -0.4161962895106 * GRP_MntFishProducts2
          +     0.69185352158005 * GRP_MntFishProducts3
          +    -0.03493178084029 * GRP_MntFishProducts4
          +     1.51100187776315 * GRP_MntGoldProds2
          +     0.06501688279193 * GRP_MntGoldProds3
          +    -0.39137744731231 * GRP_MntGoldProds4
          +    -1.71718837423104 * GRP_MntMeatProducts2
          +    -2.21915390243757 * GRP_MntMeatProducts3
          +    -0.56748587906854 * GRP_MntMeatProducts4
          +     0.62307046604402 * GRP_MntWines2  +     0.47352126999194 * 
        GRP_MntWines3  +      0.2191426110263 * GRP_MntWines4
          +     1.48903401021544 * GRP_NumCatalogPurchases3
          +     1.17263293507207 * GRP_NumCatalogPurchases4
          +     1.51105230747578 * GRP_NumDistPurchases2
          +     0.77634340058478 * GRP_NumDistPurchases3
          +    -0.03088809375301 * GRP_NumDistPurchases4
          +    -0.96601789395554 * GRP_NumWebPurchases2
          +     0.85040977160083 * GRP_NumWebPurchases3
          +     2.40308918299781 * GRP_NumWebPurchases4
          +     0.12282845458333 * GRP_RFMstat2  +    -0.98545061581559 * 
        GRP_RFMstat3  +     1.25668440586033 * GRP_RFMstat4
          +     0.46767962398497 * GRP_RMntFrq2  +    -0.80481923203399 * 
        GRP_RMntFrq3  +    -1.57392798605208 * GRP_RMntFrq4
          +     0.85109569398847 * GRP_Recency2  +     0.29456403684394 * 
        GRP_Recency3  +     2.66867988462295 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +    -3.01879385716191 * GRP_AcceptedCmp52
          +    -0.13662280353682 * GRP_Frq2  +     2.51930889376721 * GRP_Frq3
          +     1.76895510412356 * GRP_Frq4  +     -0.5692048618965 * 
        GRP_Income2  +     1.18033291239845 * GRP_Income3
          +    -0.64679354804447 * GRP_Income4  +    -1.28802047381892 * 
        GRP_Mnt2  +    -2.46267752020506 * GRP_Mnt3  +     0.17133913926957 * 
        GRP_Mnt4  +     1.27283832451603 * GRP_MntFishProducts2
          +    -0.25133476006515 * GRP_MntFishProducts3
          +     1.43382012526151 * GRP_MntFishProducts4
          +      0.6587510367878 * GRP_MntGoldProds2
          +    -2.29815972364167 * GRP_MntGoldProds3
          +    -1.17878838514109 * GRP_MntGoldProds4
          +    -1.45630165039671 * GRP_MntMeatProducts2
          +    -0.11970663820977 * GRP_MntMeatProducts3
          +    -0.76333182688138 * GRP_MntMeatProducts4
          +    -2.52565926826767 * GRP_MntWines2  +     0.00775439635111 * 
        GRP_MntWines3  +    -1.79940008598217 * GRP_MntWines4
          +    -1.25235345037614 * GRP_NumCatalogPurchases3
          +    -3.32950963282576 * GRP_NumCatalogPurchases4
          +    -0.83062872942088 * GRP_NumDistPurchases2
          +      1.2644984519337 * GRP_NumDistPurchases3
          +     0.62516412515385 * GRP_NumDistPurchases4
          +    -0.91932392687811 * GRP_NumWebPurchases2
          +     0.63985001179952 * GRP_NumWebPurchases3
          +     0.11379774354586 * GRP_NumWebPurchases4
          +    -0.83336515651784 * GRP_RFMstat2  +    -0.76327708518862 * 
        GRP_RFMstat3  +    -1.65882578353771 * GRP_RFMstat4
          +     0.96912805482142 * GRP_RMntFrq2  +     0.89830852536378 * 
        GRP_RMntFrq3  +    -0.80853907149434 * GRP_RMntFrq4
          +    -1.09357609598677 * GRP_Recency2  +    -0.36348291669233 * 
        GRP_Recency3  +    -1.63045870617841 * GRP_Recency4 ;
   H1x1_4  = H1x1_4  +    -0.22003392209515 * GRP_AcceptedCmp52
          +    -0.37446340795406 * GRP_Frq2  +    -0.00569020240777 * GRP_Frq3
          +     0.38116150545111 * GRP_Frq4  +    -0.36688806155078 * 
        GRP_Income2  +     -4.2575032053121 * GRP_Income3
          +     1.51798546961788 * GRP_Income4  +    -0.88579848196414 * 
        GRP_Mnt2  +     1.84159465073955 * GRP_Mnt3  +     0.11670514600746 * 
        GRP_Mnt4  +    -3.46232646407418 * GRP_MntFishProducts2
          +     0.25005234850524 * GRP_MntFishProducts3
          +    -0.07970714752313 * GRP_MntFishProducts4
          +     -0.7495440064059 * GRP_MntGoldProds2
          +     -0.0659148563739 * GRP_MntGoldProds3
          +    -1.42445075896946 * GRP_MntGoldProds4
          +      0.1738975461322 * GRP_MntMeatProducts2
          +    -2.24799164386156 * GRP_MntMeatProducts3
          +    -1.67754357341899 * GRP_MntMeatProducts4
          +    -0.05307351478942 * GRP_MntWines2  +     -2.2168800511889 * 
        GRP_MntWines3  +    -1.48732327222777 * GRP_MntWines4
          +    -0.36761319556449 * GRP_NumCatalogPurchases3
          +    -2.89167685306869 * GRP_NumCatalogPurchases4
          +    -0.48267351716569 * GRP_NumDistPurchases2
          +     0.93211719554417 * GRP_NumDistPurchases3
          +      1.1708430486506 * GRP_NumDistPurchases4
          +     0.03811902892169 * GRP_NumWebPurchases2
          +    -1.51477371309928 * GRP_NumWebPurchases3
          +     1.07378297590898 * GRP_NumWebPurchases4
          +     1.68393431629797 * GRP_RFMstat2  +     1.58685880164611 * 
        GRP_RFMstat3  +     0.80759821340467 * GRP_RFMstat4
          +     1.66879117439255 * GRP_RMntFrq2  +     0.80834322412036 * 
        GRP_RMntFrq3  +     0.23086766354714 * GRP_RMntFrq4
          +      1.3218682104263 * GRP_Recency2  +    -1.73155287312103 * 
        GRP_Recency3  +     0.90108611111458 * GRP_Recency4 ;
   H1x1_5  = H1x1_5  +    -2.25400715952368 * GRP_AcceptedCmp52
          +    -0.68951263089678 * GRP_Frq2  +    -1.06579468283295 * GRP_Frq3
          +    -2.03202371442661 * GRP_Frq4  +      0.1036760802752 * 
        GRP_Income2  +    -0.92046251438792 * GRP_Income3
          +     1.24075371479112 * GRP_Income4  +    -2.19069916142209 * 
        GRP_Mnt2  +     1.76084360929533 * GRP_Mnt3  +     0.20732134279897 * 
        GRP_Mnt4  +    -1.25213582301524 * GRP_MntFishProducts2
          +    -1.49559041774587 * GRP_MntFishProducts3
          +     1.29292270443546 * GRP_MntFishProducts4
          +     3.28109415592287 * GRP_MntGoldProds2
          +     0.40523569115651 * GRP_MntGoldProds3
          +        0.70305704265 * GRP_MntGoldProds4
          +    -1.85351989681271 * GRP_MntMeatProducts2
          +    -0.63625311683955 * GRP_MntMeatProducts3
          +     0.27320544681113 * GRP_MntMeatProducts4
          +     1.96095600251535 * GRP_MntWines2  +     2.24427494885455 * 
        GRP_MntWines3  +    -0.88569250661863 * GRP_MntWines4
          +    -0.42794019910524 * GRP_NumCatalogPurchases3
          +    -2.32852367141603 * GRP_NumCatalogPurchases4
          +    -1.40970961318877 * GRP_NumDistPurchases2
          +     -2.5780841761751 * GRP_NumDistPurchases3
          +    -0.35557998232484 * GRP_NumDistPurchases4
          +     1.27746944985248 * GRP_NumWebPurchases2
          +     0.69463977283169 * GRP_NumWebPurchases3
          +    -0.54397813851169 * GRP_NumWebPurchases4
          +    -0.31669101358561 * GRP_RFMstat2  +     2.18799717857163 * 
        GRP_RFMstat3  +    -0.42571916720282 * GRP_RFMstat4
          +     -0.8273646010144 * GRP_RMntFrq2  +     0.34575371088075 * 
        GRP_RMntFrq3  +    -0.85751874647054 * GRP_RMntFrq4
          +    -1.53759054703623 * GRP_Recency2  +      0.1907268514387 * 
        GRP_Recency3  +    -0.73522914565387 * GRP_Recency4 ;
   H1x1_1  =     0.19335754651259 + H1x1_1 ;
   H1x1_2  =     2.09010164778105 + H1x1_2 ;
   H1x1_3  =    -0.06489378657176 + H1x1_3 ;
   H1x1_4  =    -0.14814564965512 + H1x1_4 ;
   H1x1_5  =      1.2298003293092 + H1x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -1.88709734442083 * S_Year_Birth ;
   H1x2_2  =     0.39337522313841 * S_Year_Birth ;
   H1x2_3  =    -0.80137600943997 * S_Year_Birth ;
   H1x2_4  =     0.56552045600061 * S_Year_Birth ;
   H1x2_5  =     0.08757939638091 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +    -0.80297380803583 * GRP_AcceptedCmp52
          +     0.77171658129897 * GRP_Frq2  +    -1.90373500999925 * GRP_Frq3
          +     0.34067508173447 * GRP_Frq4  +    -3.40546398001194 * 
        GRP_Income2  +      2.4308303101124 * GRP_Income3
          +      1.7371902933386 * GRP_Income4  +    -1.19436336479656 * 
        GRP_Mnt2  +    -0.40996866110225 * GRP_Mnt3  +     1.04801669037568 * 
        GRP_Mnt4  +     1.95500373096914 * GRP_MntFishProducts2
          +     2.51364109656281 * GRP_MntFishProducts3
          +    -1.42490007484769 * GRP_MntFishProducts4
          +    -0.45125943648795 * GRP_MntGoldProds2
          +     2.47102254724134 * GRP_MntGoldProds3
          +     -1.9039173262792 * GRP_MntGoldProds4
          +     0.19349291706995 * GRP_MntMeatProducts2
          +     1.13475826324844 * GRP_MntMeatProducts3
          +    -0.33642288502432 * GRP_MntMeatProducts4
          +     1.11286337512828 * GRP_MntWines2  +    -1.73349392468621 * 
        GRP_MntWines3  +     0.82891272252224 * GRP_MntWines4
          +     0.15659125827236 * GRP_NumCatalogPurchases3
          +     0.32817066335176 * GRP_NumCatalogPurchases4
          +    -0.67313821415044 * GRP_NumDistPurchases2
          +    -0.96239937857546 * GRP_NumDistPurchases3
          +     0.32058507897383 * GRP_NumDistPurchases4
          +     0.02503658374779 * GRP_NumWebPurchases2
          +    -2.42182777667863 * GRP_NumWebPurchases3
          +     1.09934791830799 * GRP_NumWebPurchases4
          +     0.99647285457344 * GRP_RFMstat2  +    -1.81285090299632 * 
        GRP_RFMstat3  +      0.6907946914019 * GRP_RFMstat4
          +    -0.96741541040827 * GRP_RMntFrq2  +     1.54078374992995 * 
        GRP_RMntFrq3  +     -0.5606172121429 * GRP_RMntFrq4
          +     1.09972681443966 * GRP_Recency2  +     0.40240053086114 * 
        GRP_Recency3  +     3.54622644138557 * GRP_Recency4 ;
   H1x2_2  = H1x2_2  +    -0.84257803770334 * GRP_AcceptedCmp52
          +    -1.76147524199782 * GRP_Frq2  +     0.76968937743693 * GRP_Frq3
          +     1.10861276861184 * GRP_Frq4  +    -2.23247622323833 * 
        GRP_Income2  +    -0.30655302009971 * GRP_Income3
          +    -0.67421319601147 * GRP_Income4  +    -0.41833926468843 * 
        GRP_Mnt2  +     0.52496961087688 * GRP_Mnt3  +     2.22224381605808 * 
        GRP_Mnt4  +     1.90603665409631 * GRP_MntFishProducts2
          +    -0.68769529687639 * GRP_MntFishProducts3
          +     0.91046416847697 * GRP_MntFishProducts4
          +     1.93581182421904 * GRP_MntGoldProds2
          +     0.00795466624941 * GRP_MntGoldProds3
          +    -0.22854189252742 * GRP_MntGoldProds4
          +     0.51645804440055 * GRP_MntMeatProducts2
          +    -0.73677565057958 * GRP_MntMeatProducts3
          +    -3.38222954402665 * GRP_MntMeatProducts4
          +    -0.52703533326761 * GRP_MntWines2  +     2.68998648323277 * 
        GRP_MntWines3  +    -1.01553943004578 * GRP_MntWines4
          +    -0.25257542492254 * GRP_NumCatalogPurchases3
          +     0.92868654767551 * GRP_NumCatalogPurchases4
          +    -0.18642581919214 * GRP_NumDistPurchases2
          +     0.32117397006136 * GRP_NumDistPurchases3
          +    -0.59059080451748 * GRP_NumDistPurchases4
          +    -1.05057528699441 * GRP_NumWebPurchases2
          +    -0.84936431958655 * GRP_NumWebPurchases3
          +     0.43322339989668 * GRP_NumWebPurchases4
          +    -0.27462600263662 * GRP_RFMstat2  +    -2.25150384807365 * 
        GRP_RFMstat3  +    -0.00267009939433 * GRP_RFMstat4
          +     1.27314966261257 * GRP_RMntFrq2  +     0.27127797709217 * 
        GRP_RMntFrq3  +     1.12101959838801 * GRP_RMntFrq4
          +     0.79686140512362 * GRP_Recency2  +      -3.204314799241 * 
        GRP_Recency3  +    -0.17063922919112 * GRP_Recency4 ;
   H1x2_3  = H1x2_3  +     0.61950412844712 * GRP_AcceptedCmp52
          +     0.65265389665714 * GRP_Frq2  +     0.12876759740294 * GRP_Frq3
          +    -0.38017417695108 * GRP_Frq4  +    -0.54457623826836 * 
        GRP_Income2  +     2.06545795697617 * GRP_Income3
          +     -0.2725653040132 * GRP_Income4  +     0.59334688450758 * 
        GRP_Mnt2  +    -2.75668429292834 * GRP_Mnt3  +    -0.19086776143213 * 
        GRP_Mnt4  +     -3.7490211951959 * GRP_MntFishProducts2
          +     -0.2747383185488 * GRP_MntFishProducts3
          +     0.05699547232616 * GRP_MntFishProducts4
          +     1.78340082221807 * GRP_MntGoldProds2
          +    -0.21272258173805 * GRP_MntGoldProds3
          +    -0.63881612523162 * GRP_MntGoldProds4
          +     0.35743242018534 * GRP_MntMeatProducts2
          +     0.39288166088974 * GRP_MntMeatProducts3
          +     0.68623350973697 * GRP_MntMeatProducts4
          +    -1.04284335042439 * GRP_MntWines2  +    -0.97636647224011 * 
        GRP_MntWines3  +    -1.75436887389742 * GRP_MntWines4
          +     0.38349558810511 * GRP_NumCatalogPurchases3
          +     0.94944817324412 * GRP_NumCatalogPurchases4
          +     0.87924710032772 * GRP_NumDistPurchases2
          +     0.54658799433949 * GRP_NumDistPurchases3
          +     1.85594529989185 * GRP_NumDistPurchases4
          +    -0.66471569231333 * GRP_NumWebPurchases2
          +    -0.59461900037355 * GRP_NumWebPurchases3
          +     0.12806083458682 * GRP_NumWebPurchases4
          +    -0.75799558259662 * GRP_RFMstat2  +     1.03472328046295 * 
        GRP_RFMstat3  +     0.35460394964665 * GRP_RFMstat4
          +     2.35757770027854 * GRP_RMntFrq2  +    -1.60760048151685 * 
        GRP_RMntFrq3  +       1.734911990241 * GRP_RMntFrq4
          +    -0.50983934759213 * GRP_Recency2  +     1.22056684902473 * 
        GRP_Recency3  +    -0.53617918353506 * GRP_Recency4 ;
   H1x2_4  = H1x2_4  +     1.26170976978884 * GRP_AcceptedCmp52
          +    -0.32711952545891 * GRP_Frq2  +    -1.19397195692697 * GRP_Frq3
          +    -1.91237681986457 * GRP_Frq4  +    -0.79449068445985 * 
        GRP_Income2  +    -1.22812902448096 * GRP_Income3
          +     0.34997306488077 * GRP_Income4  +     0.97887573619442 * 
        GRP_Mnt2  +    -0.47207479147139 * GRP_Mnt3  +    -0.72610866749196 * 
        GRP_Mnt4  +    -1.02568945709262 * GRP_MntFishProducts2
          +    -0.50962348735329 * GRP_MntFishProducts3
          +    -1.75841654964734 * GRP_MntFishProducts4
          +     2.14839745385174 * GRP_MntGoldProds2
          +      2.4716387157729 * GRP_MntGoldProds3
          +     0.61286996367418 * GRP_MntGoldProds4
          +     1.45427097683349 * GRP_MntMeatProducts2
          +    -0.34990206215878 * GRP_MntMeatProducts3
          +     2.25284175811484 * GRP_MntMeatProducts4
          +      0.9855268124051 * GRP_MntWines2  +    -0.12203915234087 * 
        GRP_MntWines3  +     0.25102207151836 * GRP_MntWines4
          +     1.02272173939472 * GRP_NumCatalogPurchases3
          +    -0.86507841983648 * GRP_NumCatalogPurchases4
          +    -0.44080685652484 * GRP_NumDistPurchases2
          +     2.40613428385819 * GRP_NumDistPurchases3
          +     0.26317801067025 * GRP_NumDistPurchases4
          +     2.34961138802546 * GRP_NumWebPurchases2
          +     2.35826990005342 * GRP_NumWebPurchases3
          +     0.18496434892584 * GRP_NumWebPurchases4
          +     1.79795147677472 * GRP_RFMstat2  +     0.58420175726653 * 
        GRP_RFMstat3  +    -1.31222644039147 * GRP_RFMstat4
          +    -0.47605088519028 * GRP_RMntFrq2  +    -1.93444600786423 * 
        GRP_RMntFrq3  +    -1.73270719079454 * GRP_RMntFrq4
          +    -0.07465628796168 * GRP_Recency2  +     0.39933484299815 * 
        GRP_Recency3  +     1.24718444803263 * GRP_Recency4 ;
   H1x2_5  = H1x2_5  +     0.87459488954875 * GRP_AcceptedCmp52
          +    -0.84011640362753 * GRP_Frq2  +     0.77937376717729 * GRP_Frq3
          +    -1.82978666358622 * GRP_Frq4  +    -0.03003575117499 * 
        GRP_Income2  +    -0.09211385255865 * GRP_Income3
          +    -1.94207051248492 * GRP_Income4  +     0.73641935783417 * 
        GRP_Mnt2  +      -0.495669562808 * GRP_Mnt3  +    -0.04058774225968 * 
        GRP_Mnt4  +     1.81606017533935 * GRP_MntFishProducts2
          +     -2.3817205567109 * GRP_MntFishProducts3
          +      1.4356293091772 * GRP_MntFishProducts4
          +    -1.03209023546079 * GRP_MntGoldProds2
          +     1.93949728331263 * GRP_MntGoldProds3
          +     0.44849194130528 * GRP_MntGoldProds4
          +     1.34973896956794 * GRP_MntMeatProducts2
          +     1.40989126474294 * GRP_MntMeatProducts3
          +     0.74435387703611 * GRP_MntMeatProducts4
          +     0.94293940682329 * GRP_MntWines2  +     0.71988830572011 * 
        GRP_MntWines3  +     0.43603082498929 * GRP_MntWines4
          +     1.65449574071289 * GRP_NumCatalogPurchases3
          +    -0.66380394478337 * GRP_NumCatalogPurchases4
          +    -0.76749528874396 * GRP_NumDistPurchases2
          +     1.83370965910825 * GRP_NumDistPurchases3
          +    -0.73709156569506 * GRP_NumDistPurchases4
          +     0.09215124428658 * GRP_NumWebPurchases2
          +      1.0403096068891 * GRP_NumWebPurchases3
          +     0.59317560741224 * GRP_NumWebPurchases4
          +     1.75844403152209 * GRP_RFMstat2  +     -0.8733964014922 * 
        GRP_RFMstat3  +    -0.76258024821499 * GRP_RFMstat4
          +    -1.62335267331435 * GRP_RMntFrq2  +     0.16774877520829 * 
        GRP_RMntFrq3  +    -0.59672894733807 * GRP_RMntFrq4
          +     -0.1207352636629 * GRP_Recency2  +    -3.91419195768202 * 
        GRP_Recency3  +    -1.81688897411428 * GRP_Recency4 ;
   H1x2_1  =     0.53421261957097 + H1x2_1 ;
   H1x2_2  =     0.61690490910033 + H1x2_2 ;
   H1x2_3  =    -1.82311183459857 + H1x2_3 ;
   H1x2_4  =    -0.21816223161936 + H1x2_4 ;
   H1x2_5  =     -0.4592254459549 + H1x2_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x2_1  = 1.0 / (1.0 + EXP(MIN( - H1x2_1 , _EXP_BAR)));
   H1x2_2  = 1.0 / (1.0 + EXP(MIN( - H1x2_2 , _EXP_BAR)));
   H1x2_3  = 1.0 / (1.0 + EXP(MIN( - H1x2_3 , _EXP_BAR)));
   H1x2_4  = 1.0 / (1.0 + EXP(MIN( - H1x2_4 , _EXP_BAR)));
   H1x2_5  = 1.0 / (1.0 + EXP(MIN( - H1x2_5 , _EXP_BAR)));
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
   H1x2_5  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =    -0.10131311732967 * H1x1_1  +     2.09604760546585 * H1x1_2
          +     0.75964449684316 * H1x1_3  +    -3.05899403391852 * H1x1_4
          +    -2.64491525760726 * H1x1_5 ;
   H2x1_2  =     2.09816176126174 * H1x1_1  +     -2.7170504295107 * H1x1_2
          +    -4.28573382707654 * H1x1_3  +     -0.4124455577826 * H1x1_4
          +    -1.74219234169061 * H1x1_5 ;
   H2x1_3  =     -0.0908396989213 * H1x1_1  +    -2.13315935484498 * H1x1_2
          +      -0.041102734605 * H1x1_3  +     0.44906302354183 * H1x1_4
          +     2.22045400368613 * H1x1_5 ;
   H2x1_4  =    -3.59138952025597 * H1x1_1  +     1.29340469653348 * H1x1_2
          +       1.689672422487 * H1x1_3  +    -2.31797692991787 * H1x1_4
          +    -2.53540958111863 * H1x1_5 ;
   H2x1_5  =    -1.20648019467275 * H1x1_1  +      1.9669218225267 * H1x1_2
          +     2.04494536709697 * H1x1_3  +    -2.33648894116384 * H1x1_4
          +    -1.60853492956388 * H1x1_5 ;
   H2x1_1  = H2x1_1  +    -1.45345171601353 * H1x2_1
          +    -0.03179259597665 * H1x2_2  +     -2.9887894366399 * H1x2_3
          +     0.68029332905711 * H1x2_4  +     0.76926185571867 * H1x2_5 ;
   H2x1_2  = H2x1_2  +    -1.21280301577117 * H1x2_1
          +      2.9525914680029 * H1x2_2  +    -0.55393861346072 * H1x2_3
          +     1.77793175958897 * H1x2_4  +     2.51042321881699 * H1x2_5 ;
   H2x1_3  = H2x1_3  +     1.57047941405239 * H1x2_1
          +    -1.31134127121564 * H1x2_2  +      2.1322025881706 * H1x2_3
          +    -0.61230583564273 * H1x2_4  +     0.14627232119209 * H1x2_5 ;
   H2x1_4  = H2x1_4  +    -1.29890984989779 * H1x2_1
          +    -1.37863865683621 * H1x2_2  +    -0.15093392936569 * H1x2_3
          +     2.15628991822961 * H1x2_4  +    -0.04564203403522 * H1x2_5 ;
   H2x1_5  = H2x1_5  +    -1.82286870874677 * H1x2_1
          +    -1.06116903038863 * H1x2_2  +    -1.77472301413445 * H1x2_3
          +     0.17320934910404 * H1x2_4  +    -0.96172965375973 * H1x2_5 ;
   H2x1_1  =     0.61260716175728 + H2x1_1 ;
   H2x1_2  =    -1.78716565467594 + H2x1_2 ;
   H2x1_3  =    -0.88082814085488 + H2x1_3 ;
   H2x1_4  =     0.33869525080862 + H2x1_4 ;
   H2x1_5  =      2.0506883431914 + H2x1_5 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H2x1_1  = 1.0 / (1.0 + EXP(MIN( - H2x1_1 , _EXP_BAR)));
   H2x1_2  = 1.0 / (1.0 + EXP(MIN( - H2x1_2 , _EXP_BAR)));
   H2x1_3  = 1.0 / (1.0 + EXP(MIN( - H2x1_3 , _EXP_BAR)));
   H2x1_4  = 1.0 / (1.0 + EXP(MIN( - H2x1_4 , _EXP_BAR)));
   H2x1_5  = 1.0 / (1.0 + EXP(MIN( - H2x1_5 , _EXP_BAR)));
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
   H2x1_5  = .;
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
   P_DepVar1  =     5.44508928953974 * H2x1_1  +    -7.80342156600058 * H2x1_2
          +    -4.34349012782915 * H2x1_3  +     6.80870509597821 * H2x1_4
          +     5.61199728345116 * H2x1_5 ;
   P_DepVar1  =    -3.84280322129048 + P_DepVar1 ;
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
