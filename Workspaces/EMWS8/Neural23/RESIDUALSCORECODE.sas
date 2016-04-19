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
*** Writing the Node intvl ;
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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.25397263809886 * S_Year_Birth ;
   H12  =     0.05075762370892 * S_Year_Birth ;
   H13  =     0.04360472272597 * S_Year_Birth ;
   H14  =     0.01387196819865 * S_Year_Birth ;
   H15  =     0.05734148733166 * S_Year_Birth ;
   H16  =     0.07449261080848 * S_Year_Birth ;
   H11  = H11  +    -0.13483168537737 * GRP_AcceptedCmp52
          +     0.02321007103238 * GRP_Frq2  +      0.2993754491201 * GRP_Frq3
          +     0.03188619345426 * GRP_Frq4  +     0.23837524440518 * 
        GRP_Income2  +    -0.02988101686846 * GRP_Income3
          +    -0.04314945794282 * GRP_Income4  +      0.0797760707666 * 
        GRP_Mnt2  +    -0.02272798443967 * GRP_Mnt3  +    -0.37386810467628 * 
        GRP_Mnt4  +      0.0916244532169 * GRP_MntFishProducts2
          +    -0.08991361976323 * GRP_MntFishProducts3
          +    -0.12439533124432 * GRP_MntFishProducts4
          +    -0.38906628986229 * GRP_MntGoldProds2
          +     0.02112411721097 * GRP_MntGoldProds3
          +     0.05560214439156 * GRP_MntGoldProds4
          +     0.07558086835487 * GRP_MntMeatProducts2
          +    -0.24998452825562 * GRP_MntMeatProducts3
          +    -0.11030888417179 * GRP_MntMeatProducts4
          +     0.13229832861513 * GRP_MntWines2  +     0.50793143142609 * 
        GRP_MntWines3  +    -0.26273353961061 * GRP_MntWines4
          +    -0.02587175944603 * GRP_NumCatalogPurchases3
          +    -0.07172373139956 * GRP_NumCatalogPurchases4
          +    -0.26905740590447 * GRP_NumDistPurchases2
          +     0.06889154687101 * GRP_NumDistPurchases3
          +    -0.31591167055503 * GRP_NumDistPurchases4
          +    -0.26862765566252 * GRP_NumWebPurchases2
          +     0.01579611280005 * GRP_NumWebPurchases3
          +    -0.06884702149074 * GRP_NumWebPurchases4
          +     0.19400469320488 * GRP_RFMstat2  +     0.32533875784776 * 
        GRP_RFMstat3  +    -0.13730222015702 * GRP_RFMstat4
          +    -0.21360134050893 * GRP_RMntFrq2  +     0.10280382689873 * 
        GRP_RMntFrq3  +    -0.16238020658392 * GRP_RMntFrq4
          +     0.38795494894841 * GRP_Recency2  +    -0.18447788823185 * 
        GRP_Recency3  +    -0.44523742460939 * GRP_Recency4 ;
   H12  = H12  +    -0.44240901099215 * GRP_AcceptedCmp52
          +     0.35451936529374 * GRP_Frq2  +     0.01466130191686 * GRP_Frq3
          +     0.21356077566978 * GRP_Frq4  +     0.22887565933637 * 
        GRP_Income2  +     0.28123841156129 * GRP_Income3
          +    -0.30634832652689 * GRP_Income4  +     0.06733141985754 * 
        GRP_Mnt2  +     0.24901181590062 * GRP_Mnt3  +     0.23926240883217 * 
        GRP_Mnt4  +     0.36878256431394 * GRP_MntFishProducts2
          +    -0.03033118293022 * GRP_MntFishProducts3
          +     0.12939247483371 * GRP_MntFishProducts4
          +     -0.1948739109476 * GRP_MntGoldProds2
          +    -0.02487689041808 * GRP_MntGoldProds3
          +      0.0424854445517 * GRP_MntGoldProds4
          +    -0.77110165164491 * GRP_MntMeatProducts2
          +    -0.04188692453988 * GRP_MntMeatProducts3
          +     0.16117883521584 * GRP_MntMeatProducts4
          +     0.26607076588839 * GRP_MntWines2  +     0.08155165225431 * 
        GRP_MntWines3  +     0.05320347913397 * GRP_MntWines4
          +    -0.60136669330804 * GRP_NumCatalogPurchases3
          +    -0.32571087796929 * GRP_NumCatalogPurchases4
          +    -0.82361130213661 * GRP_NumDistPurchases2
          +     0.18332361990877 * GRP_NumDistPurchases3
          +    -0.10228504756385 * GRP_NumDistPurchases4
          +     0.21492204339132 * GRP_NumWebPurchases2
          +     0.22752835090931 * GRP_NumWebPurchases3
          +    -0.04291366517536 * GRP_NumWebPurchases4
          +     -0.1860476520082 * GRP_RFMstat2  +      0.2676074141222 * 
        GRP_RFMstat3  +     0.25111332591837 * GRP_RFMstat4
          +    -0.16694407619317 * GRP_RMntFrq2  +     0.21748370383635 * 
        GRP_RMntFrq3  +    -0.33247097178921 * GRP_RMntFrq4
          +     0.96302825639489 * GRP_Recency2  +     0.29783943122668 * 
        GRP_Recency3  +    -0.18073280365547 * GRP_Recency4 ;
   H13  = H13  +     0.02391312263521 * GRP_AcceptedCmp52
          +    -0.01218158666492 * GRP_Frq2  +     0.03493150543946 * GRP_Frq3
          +    -0.19640223643897 * GRP_Frq4  +    -0.02394476100786 * 
        GRP_Income2  +     0.05107107029363 * GRP_Income3
          +    -0.26596751360911 * GRP_Income4  +    -0.02628350983207 * 
        GRP_Mnt2  +    -0.08273234777804 * GRP_Mnt3  +      0.2039544161917 * 
        GRP_Mnt4  +     0.19888587009926 * GRP_MntFishProducts2
          +    -0.12190385526661 * GRP_MntFishProducts3
          +     0.11161376295027 * GRP_MntFishProducts4
          +     0.09536549249994 * GRP_MntGoldProds2
          +    -0.39027188388377 * GRP_MntGoldProds3
          +    -0.26960120596574 * GRP_MntGoldProds4
          +    -0.29704810464482 * GRP_MntMeatProducts2
          +    -0.17523279359181 * GRP_MntMeatProducts3
          +     0.01169006509688 * GRP_MntMeatProducts4
          +    -0.03150424899485 * GRP_MntWines2  +    -0.18135684744581 * 
        GRP_MntWines3  +    -0.22282316044351 * GRP_MntWines4
          +    -0.06575154068738 * GRP_NumCatalogPurchases3
          +     0.12535793167638 * GRP_NumCatalogPurchases4
          +     0.10187760390092 * GRP_NumDistPurchases2
          +    -0.25409837313865 * GRP_NumDistPurchases3
          +    -0.28689980992526 * GRP_NumDistPurchases4
          +     0.00005909057861 * GRP_NumWebPurchases2
          +    -0.14419000341563 * GRP_NumWebPurchases3
          +     0.09095003593529 * GRP_NumWebPurchases4
          +    -0.02794941494222 * GRP_RFMstat2  +    -0.08735126371613 * 
        GRP_RFMstat3  +      0.0136997814979 * GRP_RFMstat4
          +    -0.02686274413645 * GRP_RMntFrq2  +    -0.13529202759766 * 
        GRP_RMntFrq3  +     0.22088337575055 * GRP_RMntFrq4
          +      0.2635440865684 * GRP_Recency2  +     0.12547691494271 * 
        GRP_Recency3  +    -0.10311689817468 * GRP_Recency4 ;
   H14  = H14  +     0.41081496203789 * GRP_AcceptedCmp52
          +    -0.47313297382337 * GRP_Frq2  +     0.19313816686029 * GRP_Frq3
          +     0.41736322582944 * GRP_Frq4  +    -0.28916219130566 * 
        GRP_Income2  +     0.14505600514674 * GRP_Income3
          +    -0.04580645427966 * GRP_Income4  +    -0.19949742172257 * 
        GRP_Mnt2  +     0.27329529634974 * GRP_Mnt3  +     0.33404292971179 * 
        GRP_Mnt4  +    -0.37521460360102 * GRP_MntFishProducts2
          +    -0.14631724639492 * GRP_MntFishProducts3
          +     0.10002979979527 * GRP_MntFishProducts4
          +    -0.09816985850711 * GRP_MntGoldProds2
          +    -0.12203012318985 * GRP_MntGoldProds3
          +    -0.01815311012777 * GRP_MntGoldProds4
          +    -0.06619591895459 * GRP_MntMeatProducts2
          +    -0.09072077897467 * GRP_MntMeatProducts3
          +      0.1726695423557 * GRP_MntMeatProducts4
          +    -0.28636541965058 * GRP_MntWines2  +    -0.02631953768864 * 
        GRP_MntWines3  +     0.06980122973657 * GRP_MntWines4
          +     0.09645375616786 * GRP_NumCatalogPurchases3
          +    -0.41914184592159 * GRP_NumCatalogPurchases4
          +      0.1854692255158 * GRP_NumDistPurchases2
          +    -0.22330441571095 * GRP_NumDistPurchases3
          +     0.13028835056864 * GRP_NumDistPurchases4
          +    -0.16915625127212 * GRP_NumWebPurchases2
          +    -0.29991156671478 * GRP_NumWebPurchases3
          +     0.01989579721354 * GRP_NumWebPurchases4
          +    -0.12351517510664 * GRP_RFMstat2  +     0.41722412115996 * 
        GRP_RFMstat3  +    -0.02210360437313 * GRP_RFMstat4
          +    -0.04201080178576 * GRP_RMntFrq2  +     0.21775390796319 * 
        GRP_RMntFrq3  +     0.31823734284083 * GRP_RMntFrq4
          +    -0.53168026601605 * GRP_Recency2  +     -0.3287664545088 * 
        GRP_Recency3  +     0.04505851470752 * GRP_Recency4 ;
   H15  = H15  +     0.13088214496598 * GRP_AcceptedCmp52
          +    -0.08389895441588 * GRP_Frq2  +     0.05379617788531 * GRP_Frq3
          +     0.05704464608157 * GRP_Frq4  +    -0.33954574127328 * 
        GRP_Income2  +    -0.19537868529992 * GRP_Income3
          +     0.16339422960337 * GRP_Income4  +    -0.15103080606917 * 
        GRP_Mnt2  +    -0.10359763066736 * GRP_Mnt3  +    -0.15169095818331 * 
        GRP_Mnt4  +    -0.00757439653534 * GRP_MntFishProducts2
          +     0.03013301742801 * GRP_MntFishProducts3
          +     -0.0753778180106 * GRP_MntFishProducts4
          +     0.22882421007211 * GRP_MntGoldProds2
          +    -0.06369987000315 * GRP_MntGoldProds3
          +     0.09890582278559 * GRP_MntGoldProds4
          +    -0.21052640581149 * GRP_MntMeatProducts2
          +    -0.00867214697179 * GRP_MntMeatProducts3
          +     0.11929485476343 * GRP_MntMeatProducts4
          +    -0.18943631653077 * GRP_MntWines2  +     0.03539441492325 * 
        GRP_MntWines3  +     0.30650819876628 * GRP_MntWines4
          +     0.06292612305453 * GRP_NumCatalogPurchases3
          +      0.2309036660938 * GRP_NumCatalogPurchases4
          +    -0.10062151440617 * GRP_NumDistPurchases2
          +       0.229091410456 * GRP_NumDistPurchases3
          +    -0.19729313017904 * GRP_NumDistPurchases4
          +    -0.04101710595215 * GRP_NumWebPurchases2
          +     0.13926341050039 * GRP_NumWebPurchases3
          +    -0.04443067825367 * GRP_NumWebPurchases4
          +     0.12014961650367 * GRP_RFMstat2  +     0.01617790323448 * 
        GRP_RFMstat3  +     -0.1552934903319 * GRP_RFMstat4
          +    -0.04595909907677 * GRP_RMntFrq2  +    -0.44798863026137 * 
        GRP_RMntFrq3  +     -0.0483895955721 * GRP_RMntFrq4
          +    -0.03768706422132 * GRP_Recency2  +    -0.02473503115913 * 
        GRP_Recency3  +    -0.07674131244122 * GRP_Recency4 ;
   H16  = H16  +     0.46251048250873 * GRP_AcceptedCmp52
          +    -0.00268856292377 * GRP_Frq2  +    -0.25660455566834 * GRP_Frq3
          +     0.00867022501651 * GRP_Frq4  +    -0.19509148919986 * 
        GRP_Income2  +    -0.39761314772605 * GRP_Income3
          +     0.62767489359884 * GRP_Income4  +     0.12500076687539 * 
        GRP_Mnt2  +    -0.21739986249936 * GRP_Mnt3  +     0.17941174570957 * 
        GRP_Mnt4  +    -0.05655316560222 * GRP_MntFishProducts2
          +    -0.03224941225278 * GRP_MntFishProducts3
          +     0.12546380835809 * GRP_MntFishProducts4
          +     0.21690521778421 * GRP_MntGoldProds2
          +     0.09035550488812 * GRP_MntGoldProds3
          +    -0.03133919720822 * GRP_MntGoldProds4
          +     0.05188619692889 * GRP_MntMeatProducts2
          +    -0.04899714585321 * GRP_MntMeatProducts3
          +    -0.35752492237905 * GRP_MntMeatProducts4
          +    -0.08947041349478 * GRP_MntWines2  +      0.0265961489442 * 
        GRP_MntWines3  +     0.09890393808772 * GRP_MntWines4
          +     0.45534320348836 * GRP_NumCatalogPurchases3
          +    -0.31950647452009 * GRP_NumCatalogPurchases4
          +     0.21080174299166 * GRP_NumDistPurchases2
          +     0.24874731231732 * GRP_NumDistPurchases3
          +    -0.01320035732018 * GRP_NumDistPurchases4
          +     0.17773116301115 * GRP_NumWebPurchases2
          +     0.13686106729498 * GRP_NumWebPurchases3
          +     -0.0690876840257 * GRP_NumWebPurchases4
          +     0.46273916902968 * GRP_RFMstat2  +     0.51267279380421 * 
        GRP_RFMstat3  +     0.27205036954754 * GRP_RFMstat4
          +    -0.41192018310368 * GRP_RMntFrq2  +    -0.01025987166968 * 
        GRP_RMntFrq3  +     0.08432669626242 * GRP_RMntFrq4
          +    -0.37569076006412 * GRP_Recency2  +    -0.09560087881071 * 
        GRP_Recency3  +     0.15619501698904 * GRP_Recency4 ;
   H11  =     1.02277651695375 + H11 ;
   H12  =     0.30687404845149 + H12 ;
   H13  =     0.38396141006686 + H13 ;
   H14  =     0.66961227315774 + H14 ;
   H15  =     0.55149278706288 + H15 ;
   H16  =    -0.54938689657398 + H16 ;
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
   P_DepVar1  =     1.19791571177519 * H11  +     1.91589058327051 * H12
          +     0.44556788800887 * H13  +    -1.25798187083564 * H14
          +    -0.40058942527791 * H15  +    -1.41542812613902 * H16 ;
   P_DepVar1  =    -2.68041503413101 + P_DepVar1 ;
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
