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

      label I_DepVar = 'Into: DepVar' ;

      label U_DepVar = 'Unnormalized Into: DepVar' ;

      label P_DepVar1 = 'Predicted: DepVar=1' ;

      label P_DepVar0 = 'Predicted: DepVar=0' ;

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
   H11  =     0.04727192845675 * S_Year_Birth ;
   H12  =    -0.03499603197831 * S_Year_Birth ;
   H13  =      -0.249387333167 * S_Year_Birth ;
   H14  =    -0.18145230662582 * S_Year_Birth ;
   H15  =    -0.07744416350216 * S_Year_Birth ;
   H11  = H11  +    -0.25371698668168 * GRP_AcceptedCmp52
          +     0.38185615945621 * GRP_Frq2  +     0.03545555759423 * GRP_Frq3
          +    -0.00061660249238 * GRP_Frq4  +     0.41779261820045 * 
        GRP_Income2  +     0.51800912898069 * GRP_Income3
          +    -0.36427548932695 * GRP_Income4  +    -0.06433979614617 * 
        GRP_Mnt2  +     0.00045120565293 * GRP_Mnt3  +    -0.13992317322759 * 
        GRP_Mnt4  +     0.34207391538024 * GRP_MntFishProducts2
          +     0.03411739869638 * GRP_MntFishProducts3
          +      -0.083693402353 * GRP_MntFishProducts4
          +     -0.1318128730187 * GRP_MntGoldProds2
          +     -0.0614737729382 * GRP_MntGoldProds3
          +    -0.00372986687449 * GRP_MntGoldProds4
          +     -0.3129171829017 * GRP_MntMeatProducts2
          +     0.01519664718127 * GRP_MntMeatProducts3
          +     0.29997111548812 * GRP_MntMeatProducts4
          +       0.389673942682 * GRP_MntWines2  +     0.21159785789434 * 
        GRP_MntWines3  +    -0.26921349986988 * GRP_MntWines4
          +    -0.47013218092095 * GRP_NumCatalogPurchases3
          +     0.23943411636141 * GRP_NumCatalogPurchases4
          +    -0.68715024477164 * GRP_NumDistPurchases2
          +    -0.09178471992122 * GRP_NumDistPurchases3
          +    -0.01170225640351 * GRP_NumDistPurchases4
          +    -0.14760833919227 * GRP_NumWebPurchases2
          +     0.02966820025811 * GRP_NumWebPurchases3
          +    -0.04127892210576 * GRP_NumWebPurchases4
          +    -0.45467119970502 * GRP_RFMstat2  +    -0.14644406995031 * 
        GRP_RFMstat3  +    -0.12660007404037 * GRP_RFMstat4
          +     0.04829215694488 * GRP_RMntFrq2  +     0.10137738373353 * 
        GRP_RMntFrq3  +     -0.2873514159435 * GRP_RMntFrq4
          +     0.61737333380878 * GRP_Recency2  +     0.16651370318087 * 
        GRP_Recency3  +    -0.15382569411658 * GRP_Recency4 ;
   H12  = H12  +    -0.00960598895677 * GRP_AcceptedCmp52
          +    -0.13877780492855 * GRP_Frq2  +    -0.12078849771739 * GRP_Frq3
          +     0.25058833013238 * GRP_Frq4  +     0.13932014454657 * 
        GRP_Income2  +    -0.11560599273748 * GRP_Income3
          +    -0.36622829757109 * GRP_Income4  +     0.12796853065131 * 
        GRP_Mnt2  +    -0.15829126446209 * GRP_Mnt3  +    -0.35779207872654 * 
        GRP_Mnt4  +     0.06590491513415 * GRP_MntFishProducts2
          +     0.00842475350903 * GRP_MntFishProducts3
          +     -0.1623103908885 * GRP_MntFishProducts4
          +    -0.23845524931139 * GRP_MntGoldProds2
          +    -0.07128567155438 * GRP_MntGoldProds3
          +     0.25778887379163 * GRP_MntGoldProds4
          +    -0.12224351227219 * GRP_MntMeatProducts2
          +     0.06269922653052 * GRP_MntMeatProducts3
          +      0.2587215409794 * GRP_MntMeatProducts4
          +     0.20096090232239 * GRP_MntWines2  +    -0.16858917844476 * 
        GRP_MntWines3  +     0.03815809499779 * GRP_MntWines4
          +     0.05177526225067 * GRP_NumCatalogPurchases3
          +    -0.18831777813313 * GRP_NumCatalogPurchases4
          +     0.12374838743082 * GRP_NumDistPurchases2
          +    -0.19910688422086 * GRP_NumDistPurchases3
          +    -0.03804569737208 * GRP_NumDistPurchases4
          +    -0.17179633678901 * GRP_NumWebPurchases2
          +    -0.08560184232365 * GRP_NumWebPurchases3
          +     0.09237237622553 * GRP_NumWebPurchases4
          +     0.01544327143979 * GRP_RFMstat2  +      0.1127818122444 * 
        GRP_RFMstat3  +    -0.21371736650143 * GRP_RFMstat4
          +    -0.14005478166078 * GRP_RMntFrq2  +     0.07954568858907 * 
        GRP_RMntFrq3  +    -0.02313269086836 * GRP_RMntFrq4
          +     0.04358116545272 * GRP_Recency2  +    -0.02969695172962 * 
        GRP_Recency3  +     0.00206593904485 * GRP_Recency4 ;
   H13  = H13  +     0.11273135858209 * GRP_AcceptedCmp52
          +    -0.15015665173608 * GRP_Frq2  +    -0.20454924588356 * GRP_Frq3
          +    -0.04047998964496 * GRP_Frq4  +    -0.29897237144541 * 
        GRP_Income2  +      -0.028464296882 * GRP_Income3
          +     0.24836294191696 * GRP_Income4  +     0.08738925553158 * 
        GRP_Mnt2  +     0.00962293230168 * GRP_Mnt3  +    -0.12661643514597 * 
        GRP_Mnt4  +    -0.03747719154948 * GRP_MntFishProducts2
          +    -0.07078012229572 * GRP_MntFishProducts3
          +    -0.14569186671189 * GRP_MntFishProducts4
          +     0.14963390032413 * GRP_MntGoldProds2
          +    -0.11869917970226 * GRP_MntGoldProds3
          +     0.25943105626615 * GRP_MntGoldProds4
          +     0.36609689271233 * GRP_MntMeatProducts2
          +     0.10969864655073 * GRP_MntMeatProducts3
          +    -0.03446779336952 * GRP_MntMeatProducts4
          +    -0.16882321573662 * GRP_MntWines2  +     0.07914922328232 * 
        GRP_MntWines3  +     0.13243594484158 * GRP_MntWines4
          +     0.39758714937962 * GRP_NumCatalogPurchases3
          +     0.31434011051179 * GRP_NumCatalogPurchases4
          +     0.08068432649382 * GRP_NumDistPurchases2
          +    -0.08875599058351 * GRP_NumDistPurchases3
          +     0.26738740475822 * GRP_NumDistPurchases4
          +     -0.0916247468051 * GRP_NumWebPurchases2
          +    -0.17267741073665 * GRP_NumWebPurchases3
          +     0.01349113315351 * GRP_NumWebPurchases4
          +    -0.19075973281592 * GRP_RFMstat2  +    -0.20146461162283 * 
        GRP_RFMstat3  +    -0.13097471458987 * GRP_RFMstat4
          +     0.06761773631631 * GRP_RMntFrq2  +     0.27576244694442 * 
        GRP_RMntFrq3  +      0.1281788430307 * GRP_RMntFrq4
          +    -0.15939599795679 * GRP_Recency2  +    -0.00210397286084 * 
        GRP_Recency3  +     0.28490847560375 * GRP_Recency4 ;
   H14  = H14  +     0.27713596853764 * GRP_AcceptedCmp52
          +    -0.11480256849934 * GRP_Frq2  +      0.0285240312455 * GRP_Frq3
          +     0.09416065239682 * GRP_Frq4  +     -0.1229961422993 * 
        GRP_Income2  +     0.01867364051002 * GRP_Income3
          +     0.05820105400306 * GRP_Income4  +    -0.16873429334819 * 
        GRP_Mnt2  +    -0.01221085891741 * GRP_Mnt3  +    -0.10225236565235 * 
        GRP_Mnt4  +    -0.09613387975858 * GRP_MntFishProducts2
          +    -0.18334484867808 * GRP_MntFishProducts3
          +     0.13484477561766 * GRP_MntFishProducts4
          +    -0.05145913380692 * GRP_MntGoldProds2
          +     0.04459987080173 * GRP_MntGoldProds3
          +     0.01539767655772 * GRP_MntGoldProds4
          +     0.26537148543352 * GRP_MntMeatProducts2
          +     0.22913678530176 * GRP_MntMeatProducts3
          +     0.21262490658374 * GRP_MntMeatProducts4
          +    -0.11513521401249 * GRP_MntWines2  +    -0.14420673462527 * 
        GRP_MntWines3  +     0.11949691312637 * GRP_MntWines4
          +    -0.02289734111038 * GRP_NumCatalogPurchases3
          +    -0.12014539185275 * GRP_NumCatalogPurchases4
          +     0.09224372228857 * GRP_NumDistPurchases2
          +    -0.14205094961773 * GRP_NumDistPurchases3
          +    -0.27160467877541 * GRP_NumDistPurchases4
          +    -0.15428446875019 * GRP_NumWebPurchases2
          +    -0.36914157795453 * GRP_NumWebPurchases3
          +    -0.41610537355059 * GRP_NumWebPurchases4
          +    -0.29442656678388 * GRP_RFMstat2  +     0.03961235509827 * 
        GRP_RFMstat3  +    -0.18322878380243 * GRP_RFMstat4
          +     0.06857495854453 * GRP_RMntFrq2  +     0.08325769999442 * 
        GRP_RMntFrq3  +     0.24334424933749 * GRP_RMntFrq4
          +    -0.50963259840069 * GRP_Recency2  +    -0.24163634485458 * 
        GRP_Recency3  +     -0.1023689653207 * GRP_Recency4 ;
   H15  = H15  +    -0.58071728739803 * GRP_AcceptedCmp52
          +    -0.33803120859672 * GRP_Frq2  +    -0.08690701614481 * GRP_Frq3
          +     0.06107334775294 * GRP_Frq4  +     0.00751374071999 * 
        GRP_Income2  +     0.20911873861779 * GRP_Income3
          +    -0.14977199160976 * GRP_Income4  +     0.15427447371686 * 
        GRP_Mnt2  +    -0.24298277669059 * GRP_Mnt3  +    -0.02935492111499 * 
        GRP_Mnt4  +     0.04923982061963 * GRP_MntFishProducts2
          +    -0.08952948139975 * GRP_MntFishProducts3
          +     0.15338133379465 * GRP_MntFishProducts4
          +     0.04821845492824 * GRP_MntGoldProds2
          +     0.20117781904284 * GRP_MntGoldProds3
          +     0.13013396690778 * GRP_MntGoldProds4
          +    -0.03940841472157 * GRP_MntMeatProducts2
          +     0.03161017721112 * GRP_MntMeatProducts3
          +    -0.21938330779867 * GRP_MntMeatProducts4
          +      0.3039864690076 * GRP_MntWines2  +     0.33038690291786 * 
        GRP_MntWines3  +     0.03314465135063 * GRP_MntWines4
          +    -0.07655889365033 * GRP_NumCatalogPurchases3
          +    -0.17353955777897 * GRP_NumCatalogPurchases4
          +    -0.16058154480995 * GRP_NumDistPurchases2
          +    -0.30101518928361 * GRP_NumDistPurchases3
          +      0.0473480026433 * GRP_NumDistPurchases4
          +     0.03132883547053 * GRP_NumWebPurchases2
          +    -0.29425936985479 * GRP_NumWebPurchases3
          +    -0.12527625315403 * GRP_NumWebPurchases4
          +     0.30683805591766 * GRP_RFMstat2  +    -0.21275334469197 * 
        GRP_RFMstat3  +     0.32474239840607 * GRP_RFMstat4
          +     0.09289841520091 * GRP_RMntFrq2  +     0.22137778862379 * 
        GRP_RMntFrq3  +     0.12254524703503 * GRP_RMntFrq4
          +     0.46836624272095 * GRP_Recency2  +     0.01747843890017 * 
        GRP_Recency3  +    -0.28363324780869 * GRP_Recency4 ;
   H11  =    -0.09329902916762 + H11 ;
   H12  =     0.21894996952826 + H12 ;
   H13  =    -0.97210428395662 + H13 ;
   H14  =    -0.47241372860242 + H14 ;
   H15  =    -0.89551869986721 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     2.68876927057109 * H11  +     0.34381275178608 * H12
          +    -1.13153750790029 * H13  +    -0.93563986714952 * H14
          +     1.84382077322412 * H15 ;
   P_DepVar1  =    -1.53169022796223 + P_DepVar1 ;
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
