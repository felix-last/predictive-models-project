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

      label H1x1_6 = 'Hidden: H1x1_=6' ;

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
   H1x1_1  =     1.28407338963657 * S_Year_Birth ;
   H1x1_2  =     2.38810822597472 * S_Year_Birth ;
   H1x1_3  =     -0.7204801808304 * S_Year_Birth ;
   H1x1_4  =    -0.06539124294592 * S_Year_Birth ;
   H1x1_5  =     0.03236440118268 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     2.33808165856563 * GRP_AcceptedCmp52
          +    -0.22986949765805 * GRP_Frq2  +     0.35082837363653 * GRP_Frq3
          +    -0.81539338849938 * GRP_Frq4  +     0.02220909701196 * 
        GRP_Income2  +    -0.13099501713971 * GRP_Income3
          +     -0.0804536656406 * GRP_Income4  +    -1.59663744670427 * 
        GRP_Mnt2  +    -0.75210072607852 * GRP_Mnt3  +     2.54348518711375 * 
        GRP_Mnt4  +    -1.10495982071076 * GRP_MntFishProducts2
          +     0.01777635572399 * GRP_MntFishProducts3
          +     0.64964482065317 * GRP_MntFishProducts4
          +    -1.04611988857835 * GRP_MntGoldProds2
          +    -0.78605743432786 * GRP_MntGoldProds3
          +    -0.66472335544579 * GRP_MntGoldProds4
          +     1.30740864871492 * GRP_MntMeatProducts2
          +     2.64958489779167 * GRP_MntMeatProducts3
          +    -0.07163049651484 * GRP_MntMeatProducts4
          +     0.25422937257394 * GRP_MntWines2  +     4.96131673300801 * 
        GRP_MntWines3  +     1.19639467926964 * GRP_MntWines4
          +     1.95336043181706 * GRP_NumCatalogPurchases3
          +    -1.04651597352668 * GRP_NumCatalogPurchases4
          +     2.10673800243141 * GRP_NumDistPurchases2
          +     1.49840431617564 * GRP_NumDistPurchases3
          +     2.97897302921808 * GRP_NumDistPurchases4
          +    -0.06881799061639 * GRP_NumWebPurchases2
          +     2.06509459645382 * GRP_NumWebPurchases3
          +     2.82361840359249 * GRP_NumWebPurchases4
          +    -0.22785891000012 * GRP_RFMstat2  +     0.11731067369321 * 
        GRP_RFMstat3  +      2.1473773933678 * GRP_RFMstat4
          +    -0.84256952222829 * GRP_RMntFrq2  +     0.14220513090593 * 
        GRP_RMntFrq3  +    -0.12372171572674 * GRP_RMntFrq4
          +    -0.31743815181215 * GRP_Recency2  +    -1.98918978493071 * 
        GRP_Recency3  +    -0.65545972977238 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +     0.33200444555787 * GRP_AcceptedCmp52
          +     -0.8934566312976 * GRP_Frq2  +    -0.00243983936395 * GRP_Frq3
          +     0.63648993363629 * GRP_Frq4  +     0.05197343322571 * 
        GRP_Income2  +     0.68177129296873 * GRP_Income3
          +     1.16889856198675 * GRP_Income4  +     0.52345733778819 * 
        GRP_Mnt2  +     0.86891568330214 * GRP_Mnt3  +    -1.01013818778187 * 
        GRP_Mnt4  +     0.01260306109505 * GRP_MntFishProducts2
          +     0.36267476732712 * GRP_MntFishProducts3
          +     -0.0117944700646 * GRP_MntFishProducts4
          +    -2.60247007794362 * GRP_MntGoldProds2
          +     1.49175629619075 * GRP_MntGoldProds3
          +     1.15735621033648 * GRP_MntGoldProds4
          +     -0.8857925625722 * GRP_MntMeatProducts2
          +    -1.11977905267757 * GRP_MntMeatProducts3
          +     0.89317411392862 * GRP_MntMeatProducts4
          +     1.08362434913444 * GRP_MntWines2  +    -2.34573154102981 * 
        GRP_MntWines3  +    -1.04821908065864 * GRP_MntWines4
          +    -1.24280966967211 * GRP_NumCatalogPurchases3
          +      3.0326089053041 * GRP_NumCatalogPurchases4
          +     0.04779959574354 * GRP_NumDistPurchases2
          +     1.71017115843439 * GRP_NumDistPurchases3
          +     0.53628643929359 * GRP_NumDistPurchases4
          +     0.89950827667194 * GRP_NumWebPurchases2
          +    -0.92684592689592 * GRP_NumWebPurchases3
          +     2.96876986636503 * GRP_NumWebPurchases4
          +     0.63124526160033 * GRP_RFMstat2  +     1.50566150377083 * 
        GRP_RFMstat3  +     1.62201671855053 * GRP_RFMstat4
          +     1.20404881746786 * GRP_RMntFrq2  +    -0.61586201148662 * 
        GRP_RMntFrq3  +    -1.45102172370413 * GRP_RMntFrq4
          +     0.89969425569035 * GRP_Recency2  +     0.72245574147873 * 
        GRP_Recency3  +     2.83083807801553 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +    -0.49052681984122 * GRP_AcceptedCmp52
          +     0.05710791956099 * GRP_Frq2  +     1.88983418164026 * GRP_Frq3
          +     0.23283788572694 * GRP_Frq4  +    -0.80169095220425 * 
        GRP_Income2  +    -1.74093887199998 * GRP_Income3
          +    -0.35184466623661 * GRP_Income4  +     0.02791690171447 * 
        GRP_Mnt2  +    -2.20424160961867 * GRP_Mnt3  +     0.50765331628654 * 
        GRP_Mnt4  +     0.29403246554661 * GRP_MntFishProducts2
          +    -0.83380418052364 * GRP_MntFishProducts3
          +    -1.82543627661138 * GRP_MntFishProducts4
          +     0.39365380396703 * GRP_MntGoldProds2
          +     0.03998618589682 * GRP_MntGoldProds3
          +    -1.56455277750616 * GRP_MntGoldProds4
          +     0.07220994129439 * GRP_MntMeatProducts2
          +     1.10999034367361 * GRP_MntMeatProducts3
          +     0.63528886514116 * GRP_MntMeatProducts4
          +    -1.82455352991516 * GRP_MntWines2  +    -0.37467219689144 * 
        GRP_MntWines3  +     0.51071844252207 * GRP_MntWines4
          +    -0.21422031720258 * GRP_NumCatalogPurchases3
          +    -3.11364867963994 * GRP_NumCatalogPurchases4
          +    -0.08758432252505 * GRP_NumDistPurchases2
          +    -0.24735131829279 * GRP_NumDistPurchases3
          +     1.22135970166178 * GRP_NumDistPurchases4
          +     0.57769775812299 * GRP_NumWebPurchases2
          +     4.20512829375782 * GRP_NumWebPurchases3
          +    -0.77892811708123 * GRP_NumWebPurchases4
          +    -1.48591575907258 * GRP_RFMstat2  +    -0.02715745890283 * 
        GRP_RFMstat3  +    -1.82753253216976 * GRP_RFMstat4
          +     0.63517164755033 * GRP_RMntFrq2  +     3.41625861410136 * 
        GRP_RMntFrq3  +    -1.06016238729643 * GRP_RMntFrq4
          +     0.96560069161334 * GRP_Recency2  +     2.60413272119793 * 
        GRP_Recency3  +    -1.02278922860839 * GRP_Recency4 ;
   H1x1_4  = H1x1_4  +    -3.02372554661072 * GRP_AcceptedCmp52
          +     1.03599850000215 * GRP_Frq2  +     2.24242470356718 * GRP_Frq3
          +      3.4718187916521 * GRP_Frq4  +     1.28707236613409 * 
        GRP_Income2  +    -1.54838965127225 * GRP_Income3
          +     2.52665199719571 * GRP_Income4  +    -2.14598289769275 * 
        GRP_Mnt2  +    -1.04082723723167 * GRP_Mnt3  +    -1.68747662808983 * 
        GRP_Mnt4  +     -0.8736100922486 * GRP_MntFishProducts2
          +     0.12779836724514 * GRP_MntFishProducts3
          +     0.60216313416651 * GRP_MntFishProducts4
          +     0.68165487174749 * GRP_MntGoldProds2
          +    -0.89672475622939 * GRP_MntGoldProds3
          +    -1.77795912962804 * GRP_MntGoldProds4
          +    -0.74193637631708 * GRP_MntMeatProducts2
          +    -3.00981763564253 * GRP_MntMeatProducts3
          +    -0.98818439514034 * GRP_MntMeatProducts4
          +    -0.81552449599254 * GRP_MntWines2  +    -1.24481835102021 * 
        GRP_MntWines3  +     0.58877118654504 * GRP_MntWines4
          +    -0.10424789545355 * GRP_NumCatalogPurchases3
          +    -1.76322947168567 * GRP_NumCatalogPurchases4
          +     0.28024987640988 * GRP_NumDistPurchases2
          +    -0.26195842187994 * GRP_NumDistPurchases3
          +     1.27465783090106 * GRP_NumDistPurchases4
          +     0.56044035795721 * GRP_NumWebPurchases2
          +     -1.0019608410124 * GRP_NumWebPurchases3
          +    -1.00438490557229 * GRP_NumWebPurchases4
          +      0.1961165620509 * GRP_RFMstat2  +    -0.64166582924081 * 
        GRP_RFMstat3  +     1.80597898183848 * GRP_RFMstat4
          +       0.012135091764 * GRP_RMntFrq2  +     -1.6713653901367 * 
        GRP_RMntFrq3  +    -0.99155260811599 * GRP_RMntFrq4
          +    -1.41207701933445 * GRP_Recency2  +    -1.44162495285758 * 
        GRP_Recency3  +    -1.33328278459656 * GRP_Recency4 ;
   H1x1_5  = H1x1_5  +    -2.91353005427803 * GRP_AcceptedCmp52
          +    -0.01308096407334 * GRP_Frq2  +    -0.45559322170718 * GRP_Frq3
          +    -0.49751279425547 * GRP_Frq4  +     0.02860594561374 * 
        GRP_Income2  +     1.41758925806391 * GRP_Income3
          +     0.03726548596251 * GRP_Income4  +    -1.57900147909252 * 
        GRP_Mnt2  +      2.3511697752438 * GRP_Mnt3  +     0.88048248424859 * 
        GRP_Mnt4  +    -0.56545409501904 * GRP_MntFishProducts2
          +    -3.10608760567335 * GRP_MntFishProducts3
          +     1.06400320622897 * GRP_MntFishProducts4
          +     2.68670541844486 * GRP_MntGoldProds2
          +     0.07232195736653 * GRP_MntGoldProds3
          +     1.85531703888295 * GRP_MntGoldProds4
          +    -1.87162230531925 * GRP_MntMeatProducts2
          +    -1.13875662802599 * GRP_MntMeatProducts3
          +    -0.24099135606782 * GRP_MntMeatProducts4
          +    -0.13235213570702 * GRP_MntWines2  +    -0.50193070898101 * 
        GRP_MntWines3  +     -0.1999771853027 * GRP_MntWines4
          +    -1.59837823433046 * GRP_NumCatalogPurchases3
          +    -3.92043146311091 * GRP_NumCatalogPurchases4
          +    -0.99805577329855 * GRP_NumDistPurchases2
          +     -2.4067364238872 * GRP_NumDistPurchases3
          +     0.25924131471222 * GRP_NumDistPurchases4
          +     0.70743157783391 * GRP_NumWebPurchases2
          +    -2.55740259562506 * GRP_NumWebPurchases3
          +     1.49837454147543 * GRP_NumWebPurchases4
          +     0.02282459900932 * GRP_RFMstat2  +     2.49823188893146 * 
        GRP_RFMstat3  +      0.0125770688182 * GRP_RFMstat4
          +    -0.52646059416986 * GRP_RMntFrq2  +     0.48734306173312 * 
        GRP_RMntFrq3  +     1.20982084491791 * GRP_RMntFrq4
          +     1.46024730556461 * GRP_Recency2  +     1.39328521843098 * 
        GRP_Recency3  +     0.07072877455933 * GRP_Recency4 ;
   H1x1_1  =     2.28517939702199 + H1x1_1 ;
   H1x1_2  =      0.8100923065727 + H1x1_2 ;
   H1x1_3  =    -1.33120225377486 + H1x1_3 ;
   H1x1_4  =    -0.45230391783078 + H1x1_4 ;
   H1x1_5  =    -0.40460344381081 + H1x1_5 ;
   H1x1_6  = 0; 
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 , H1x1_5 , H1x1_6 );
   _SUM_ = 0.; 
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_5  = EXP(H1x1_5  - _MAX_);
   _SUM_ = _SUM_ + H1x1_5 ;
   H1x1_6  = EXP(H1x1_6  - _MAX_);
   _SUM_ = _SUM_ + H1x1_6 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
   H1x1_5  = H1x1_5  / _SUM_;
   H1x1_6  = H1x1_6  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
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
   P_DepVar1  =    -2.81431269255211 * H1x1_1  +       3.440967475001 * H1x1_2
          +     0.80588527631153 * H1x1_3  +    -2.86385782353564 * H1x1_4
          +     4.10205776026281 * H1x1_5  +    -2.89048426961502 * H1x1_6 ;
   P_DepVar1  =    -1.38440437244113 + P_DepVar1 ;
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
