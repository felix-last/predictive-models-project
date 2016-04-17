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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.47846451014473 * GRP_AcceptedCmp52  +     0.19123593876387 *
        GRP_Frq2  +     0.09643181492148 * GRP_Frq3  +     0.05144024674895 *
        GRP_Frq4  +     0.04295631018086 * GRP_Income2
          +     -0.1228594895838 * GRP_Income3  +    -0.24669259703155 *
        GRP_Income4  +    -0.12634710557505 * GRP_Mnt2
          +     0.06153848379201 * GRP_Mnt3  +    -0.25623825887978 * GRP_Mnt4
          +    -0.09885892988252 * GRP_MntFishProducts2
          +     0.08406776876431 * GRP_MntFishProducts3
          +    -0.01961506207304 * GRP_MntFishProducts4
          +     0.05865015349102 * GRP_MntGoldProds2
          +    -0.19025881153665 * GRP_MntGoldProds3
          +     0.11742267670165 * GRP_MntGoldProds4
          +    -0.48107725600014 * GRP_MntMeatProducts2
          +    -0.06405219545244 * GRP_MntMeatProducts3
          +    -0.28599597872655 * GRP_MntMeatProducts4
          +     0.09252331701173 * GRP_MntWines2  +    -0.01679973092371 *
        GRP_MntWines3  +    -0.28118765113398 * GRP_MntWines4
          +    -0.20589129984224 * GRP_NumCatalogPurchases3
          +     0.09269540062859 * GRP_NumCatalogPurchases4
          +    -0.21301173258264 * GRP_NumDistPurchases2
          +     0.02968077077204 * GRP_NumDistPurchases3
          +     0.37847518797466 * GRP_NumDistPurchases4
          +    -0.14460622553066 * GRP_NumWebPurchases2
          +     0.24087714617368 * GRP_NumWebPurchases3
          +     0.31645984538255 * GRP_NumWebPurchases4
          +    -0.21603366146166 * GRP_RFMstat2  +    -0.16662861409798 *
        GRP_RFMstat3  +     0.21007601365613 * GRP_RFMstat4
          +    -0.01443663304415 * GRP_RMntFrq2  +    -0.10326438582674 *
        GRP_RMntFrq3  +    -0.65474128199839 * GRP_RMntFrq4
          +     0.32165037855922 * GRP_Recency2  +     0.13838311684738 *
        GRP_Recency3  +     0.25495034500897 * GRP_Recency4 ;
   H12  =     0.19980227701329 * GRP_AcceptedCmp52  +     0.35227413860542 *
        GRP_Frq2  +    -0.08132751965568 * GRP_Frq3  +     0.06274660992037 *
        GRP_Frq4  +     0.14609729670665 * GRP_Income2
          +     -0.0521158725468 * GRP_Income3  +     0.29485821055626 *
        GRP_Income4  +     0.11491631500511 * GRP_Mnt2
          +    -0.48249282197964 * GRP_Mnt3  +    -0.43275960999945 * GRP_Mnt4
          +     0.23372129286866 * GRP_MntFishProducts2
          +     0.08173006283377 * GRP_MntFishProducts3
          +    -0.26374451563307 * GRP_MntFishProducts4
          +    -0.05478986771486 * GRP_MntGoldProds2
          +     0.15674217490538 * GRP_MntGoldProds3
          +     -0.0970693263223 * GRP_MntGoldProds4
          +    -0.07551339114514 * GRP_MntMeatProducts2
          +     0.20520020022282 * GRP_MntMeatProducts3
          +     0.18185271543305 * GRP_MntMeatProducts4
          +     0.13372808101693 * GRP_MntWines2  +    -0.23508613293176 *
        GRP_MntWines3  +     0.03782283781196 * GRP_MntWines4
          +    -0.01759208575836 * GRP_NumCatalogPurchases3
          +     0.03228155996803 * GRP_NumCatalogPurchases4
          +    -0.16689756602171 * GRP_NumDistPurchases2
          +     0.23008084678616 * GRP_NumDistPurchases3
          +      0.1020080832353 * GRP_NumDistPurchases4
          +     0.00689419482794 * GRP_NumWebPurchases2
          +     0.45549724613494 * GRP_NumWebPurchases3
          +     0.21666691620434 * GRP_NumWebPurchases4
          +    -0.02464138218078 * GRP_RFMstat2  +     0.13412544784153 *
        GRP_RFMstat3  +    -0.09645970560405 * GRP_RFMstat4
          +     0.04270814348512 * GRP_RMntFrq2  +     -0.1501520967589 *
        GRP_RMntFrq3  +     -0.1772447013278 * GRP_RMntFrq4
          +      0.1223375687576 * GRP_Recency2  +      0.1019105028487 *
        GRP_Recency3  +     0.06326170958276 * GRP_Recency4 ;
   H13  =    -0.47552326597307 * GRP_AcceptedCmp52  +     0.13942347151662 *
        GRP_Frq2  +     0.15792042601114 * GRP_Frq3  +    -0.31699137546772 *
        GRP_Frq4  +     0.31623959766757 * GRP_Income2
          +     0.51675448663341 * GRP_Income3  +    -0.28386096750656 *
        GRP_Income4  +    -0.19585257598596 * GRP_Mnt2
          +     0.03528129174811 * GRP_Mnt3  +     0.16020552351069 * GRP_Mnt4
          +     0.11549870508237 * GRP_MntFishProducts2
          +    -0.02472870244462 * GRP_MntFishProducts3
          +    -0.08397818027214 * GRP_MntFishProducts4
          +    -0.15352678487636 * GRP_MntGoldProds2
          +    -0.22936969994696 * GRP_MntGoldProds3
          +    -0.14955434708754 * GRP_MntGoldProds4
          +    -0.27851745198006 * GRP_MntMeatProducts2
          +    -0.20347624413948 * GRP_MntMeatProducts3
          +     0.22612412661729 * GRP_MntMeatProducts4
          +      0.0680550338972 * GRP_MntWines2  +     0.13605728094791 *
        GRP_MntWines3  +    -0.24233826362305 * GRP_MntWines4
          +    -0.51105265438413 * GRP_NumCatalogPurchases3
          +      0.3463181885617 * GRP_NumCatalogPurchases4
          +    -0.42061003686263 * GRP_NumDistPurchases2
          +     0.05694490202182 * GRP_NumDistPurchases3
          +    -0.05589065356183 * GRP_NumDistPurchases4
          +    -0.15004779907268 * GRP_NumWebPurchases2
          +    -0.03683214810286 * GRP_NumWebPurchases3
          +    -0.14152766915751 * GRP_NumWebPurchases4
          +    -0.34448387603605 * GRP_RFMstat2  +    -0.12678315363038 *
        GRP_RFMstat3  +    -0.17785766746488 * GRP_RFMstat4
          +    -0.12269367915474 * GRP_RMntFrq2  +     0.15261716486225 *
        GRP_RMntFrq3  +    -0.14834283523731 * GRP_RMntFrq4
          +     0.41906757309616 * GRP_Recency2  +     0.11383836551208 *
        GRP_Recency3  +    -0.50873022901358 * GRP_Recency4 ;
   H14  =     0.47487308000188 * GRP_AcceptedCmp52  +    -0.20783874293801 *
        GRP_Frq2  +     -0.2262487293265 * GRP_Frq3  +    -0.24497015722444 *
        GRP_Frq4  +    -0.41352416374349 * GRP_Income2
          +    -0.19029917786221 * GRP_Income3  +     0.44371774186743 *
        GRP_Income4  +     0.03966957052109 * GRP_Mnt2
          +     0.21041258864544 * GRP_Mnt3  +    -0.03545115071009 * GRP_Mnt4
          +     -0.3523117475999 * GRP_MntFishProducts2
          +     0.01075749365425 * GRP_MntFishProducts3
          +    -0.19220397921061 * GRP_MntFishProducts4
          +     0.24691019907326 * GRP_MntGoldProds2
          +    -0.36269131170152 * GRP_MntGoldProds3
          +    -0.07442729340208 * GRP_MntGoldProds4
          +     0.14166838567576 * GRP_MntMeatProducts2
          +     -0.0573636128895 * GRP_MntMeatProducts3
          +     0.11782684497872 * GRP_MntMeatProducts4
          +    -0.58306293735162 * GRP_MntWines2  +     -0.1332347200661 *
        GRP_MntWines3  +     -0.0491151521812 * GRP_MntWines4
          +     0.19217394838443 * GRP_NumCatalogPurchases3
          +     0.30242368378572 * GRP_NumCatalogPurchases4
          +      0.5631335040028 * GRP_NumDistPurchases2
          +      0.2833277493575 * GRP_NumDistPurchases3
          +     0.15501991757103 * GRP_NumDistPurchases4
          +     0.06522663204791 * GRP_NumWebPurchases2
          +    -0.24250508241812 * GRP_NumWebPurchases3
          +    -0.14936719392927 * GRP_NumWebPurchases4
          +     0.07538326365237 * GRP_RFMstat2  +    -0.11207708467015 *
        GRP_RFMstat3  +    -0.03495013261696 * GRP_RFMstat4
          +    -0.07948642963964 * GRP_RMntFrq2  +     -0.3740993499425 *
        GRP_RMntFrq3  +      0.1224880912483 * GRP_RMntFrq4
          +    -1.20234498415322 * GRP_Recency2  +    -0.15277267671243 *
        GRP_Recency3  +     0.17498175973385 * GRP_Recency4 ;
   H15  =     0.31607756545434 * GRP_AcceptedCmp52  +    -0.39938983779344 *
        GRP_Frq2  +     0.14190381114364 * GRP_Frq3  +    -0.04654073105991 *
        GRP_Frq4  +    -0.46847099915399 * GRP_Income2
          +    -0.24521056791482 * GRP_Income3  +     0.29673900247528 *
        GRP_Income4  +    -0.24347594694596 * GRP_Mnt2
          +    -0.25470417967356 * GRP_Mnt3  +     -0.3155333752807 * GRP_Mnt4
          +    -0.16164851437662 * GRP_MntFishProducts2
          +    -0.07507872874942 * GRP_MntFishProducts3
          +     -0.0000128165366 * GRP_MntFishProducts4
          +    -0.13003975496355 * GRP_MntGoldProds2
          +     0.10076462685161 * GRP_MntGoldProds3
          +     0.06823082371801 * GRP_MntGoldProds4
          +    -0.06661203056726 * GRP_MntMeatProducts2
          +     0.21135583081997 * GRP_MntMeatProducts3
          +     0.05317467469941 * GRP_MntMeatProducts4
          +     -0.6790577471338 * GRP_MntWines2  +    -0.29030845400198 *
        GRP_MntWines3  +     0.17538455641954 * GRP_MntWines4
          +     0.27411589551701 * GRP_NumCatalogPurchases3
          +     0.33639439802576 * GRP_NumCatalogPurchases4
          +     0.37202178791302 * GRP_NumDistPurchases2
          +     0.21242089259106 * GRP_NumDistPurchases3
          +     0.01745612539369 * GRP_NumDistPurchases4
          +     0.06417261665114 * GRP_NumWebPurchases2
          +     0.34302874594069 * GRP_NumWebPurchases3
          +     0.08556934131582 * GRP_NumWebPurchases4
          +    -0.01317484038203 * GRP_RFMstat2  +    -0.26798645102872 *
        GRP_RFMstat3  +    -0.23199496411354 * GRP_RFMstat4
          +    -0.36396476479849 * GRP_RMntFrq2  +    -0.16838193614715 *
        GRP_RMntFrq3  +       0.051807632343 * GRP_RMntFrq4
          +    -0.13014582685433 * GRP_Recency2  +     0.01537566565331 *
        GRP_Recency3  +      0.1365007617785 * GRP_Recency4 ;
   H11  =    -0.02804722687441 + H11 ;
   H12  =    -1.15173994765723 + H12 ;
   H13  =     0.30124306509106 + H13 ;
   H14  =    -0.37792609262463 + H14 ;
   H15  =     0.46405557098176 + H15 ;
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
   P_DepVar1  =     1.14388401268032 * H11  +      0.6001876010487 * H12
          +     2.09526498410663 * H13  +    -1.84849014758118 * H14
          +    -1.09009016441951 * H15 ;
   P_DepVar1  =    -1.61414772995986 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
;
