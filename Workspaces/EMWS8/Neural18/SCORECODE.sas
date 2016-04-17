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

      label H16 = 'Hidden: H1=6' ;

      label H17 = 'Hidden: H1=7' ;

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
   H11  =     0.04711628818085 * GRP_AcceptedCmp52  +    -0.13027365748107 * 
        GRP_Frq2  +    -0.04632677563882 * GRP_Frq3  +    -0.08320341313947 * 
        GRP_Frq4  +     0.15407011801643 * GRP_Income2
          +    -0.10383560943317 * GRP_Income3  +    -0.40582360882321 * 
        GRP_Income4  +    -0.00866872751194 * GRP_Mnt2
          +     0.03835423241766 * GRP_Mnt3  +     0.10111653307734 * GRP_Mnt4
          +     0.27649544705807 * GRP_MntFishProducts2
          +     0.03806617200527 * GRP_MntFishProducts3
          +    -0.14924458232763 * GRP_MntFishProducts4
          +    -0.61470593668196 * GRP_MntGoldProds2
          +      0.3229990608995 * GRP_MntGoldProds3
          +    -0.38604519701302 * GRP_MntGoldProds4
          +    -0.16788745104812 * GRP_MntMeatProducts2
          +    -0.02411102582134 * GRP_MntMeatProducts3
          +     0.20999119459991 * GRP_MntMeatProducts4
          +     0.00013023256115 * GRP_MntWines2  +    -0.19154805414183 * 
        GRP_MntWines3  +     0.10487287927665 * GRP_MntWines4
          +    -0.18385399575632 * GRP_NumCatalogPurchases3
          +     0.26139870297501 * GRP_NumCatalogPurchases4
          +    -0.45516424216634 * GRP_NumDistPurchases2
          +    -0.02821228922166 * GRP_NumDistPurchases3
          +     -0.0277463007541 * GRP_NumDistPurchases4
          +    -0.20089085216463 * GRP_NumWebPurchases2
          +     0.25653821989992 * GRP_NumWebPurchases3
          +    -0.28787845842774 * GRP_NumWebPurchases4
          +    -0.55935702240721 * GRP_RFMstat2  +     0.06115264011229 * 
        GRP_RFMstat3  +     0.23395576453228 * GRP_RFMstat4
          +     0.14575536355828 * GRP_RMntFrq2  +    -0.17534689953321 * 
        GRP_RMntFrq3  +     0.02136609987453 * GRP_RMntFrq4
          +       0.198287170399 * GRP_Recency2  +     0.20837384647001 * 
        GRP_Recency3  +    -0.03491976754069 * GRP_Recency4 ;
   H12  =     0.27125178346152 * GRP_AcceptedCmp52  +     0.39367144184074 * 
        GRP_Frq2  +     0.47183329287273 * GRP_Frq3  +     0.06075107930837 * 
        GRP_Frq4  +     0.77794746315957 * GRP_Income2
          +     0.86453663986099 * GRP_Income3  +    -0.24014105964843 * 
        GRP_Income4  +     0.18332391092776 * GRP_Mnt2
          +    -0.05132712807258 * GRP_Mnt3  +    -0.12150106989075 * GRP_Mnt4
          +     0.37088160406221 * GRP_MntFishProducts2
          +     0.16511263167544 * GRP_MntFishProducts3
          +    -0.25696902575665 * GRP_MntFishProducts4
          +    -0.25511966497767 * GRP_MntGoldProds2
          +     0.10357155941955 * GRP_MntGoldProds3
          +    -0.04921872016349 * GRP_MntGoldProds4
          +    -0.11063359070508 * GRP_MntMeatProducts2
          +    -0.08379163747059 * GRP_MntMeatProducts3
          +     0.18893182644469 * GRP_MntMeatProducts4
          +     0.41618237258351 * GRP_MntWines2  +    -0.00683285266538 * 
        GRP_MntWines3  +    -0.12347598430406 * GRP_MntWines4
          +    -0.28043452635336 * GRP_NumCatalogPurchases3
          +     0.19010019257459 * GRP_NumCatalogPurchases4
          +    -0.29362124038326 * GRP_NumDistPurchases2
          +    -0.03304017306295 * GRP_NumDistPurchases3
          +    -0.11165609534026 * GRP_NumDistPurchases4
          +      0.1536111955491 * GRP_NumWebPurchases2
          +     0.14856361677069 * GRP_NumWebPurchases3
          +      0.0385282170017 * GRP_NumWebPurchases4
          +    -0.42245587008719 * GRP_RFMstat2  +     0.15962543914936 * 
        GRP_RFMstat3  +    -0.39342058803069 * GRP_RFMstat4
          +    -0.28590254800789 * GRP_RMntFrq2  +    -0.21564130946407 * 
        GRP_RMntFrq3  +    -0.22044591524393 * GRP_RMntFrq4
          +      1.1127849486131 * GRP_Recency2  +     0.37451568388848 * 
        GRP_Recency3  +    -0.33640572843758 * GRP_Recency4 ;
   H13  =    -0.00640066603747 * GRP_AcceptedCmp52  +    -0.11333647417979 * 
        GRP_Frq2  +    -0.11647952262542 * GRP_Frq3  +    -0.14006488881524 * 
        GRP_Frq4  +     0.27728124026233 * GRP_Income2
          +     0.05697521068764 * GRP_Income3  +    -0.37633026358792 * 
        GRP_Income4  +    -0.17440692689662 * GRP_Mnt2
          +    -0.10036881667196 * GRP_Mnt3  +    -0.13642140412399 * GRP_Mnt4
          +      0.2081380258467 * GRP_MntFishProducts2
          +    -0.08668229639505 * GRP_MntFishProducts3
          +     0.14081019578955 * GRP_MntFishProducts4
          +    -0.17027561298255 * GRP_MntGoldProds2
          +    -0.34742776244059 * GRP_MntGoldProds3
          +     0.12168590176726 * GRP_MntGoldProds4
          +    -0.05512121591373 * GRP_MntMeatProducts2
          +    -0.34519642935258 * GRP_MntMeatProducts3
          +    -0.13168847945689 * GRP_MntMeatProducts4
          +     0.28193282372353 * GRP_MntWines2  +     0.14946457186192 * 
        GRP_MntWines3  +     0.06804391722409 * GRP_MntWines4
          +    -0.08346399909028 * GRP_NumCatalogPurchases3
          +    -0.15880621701951 * GRP_NumCatalogPurchases4
          +    -0.25528445685452 * GRP_NumDistPurchases2
          +    -0.10526630829598 * GRP_NumDistPurchases3
          +    -0.03726952062424 * GRP_NumDistPurchases4
          +    -0.05938919871449 * GRP_NumWebPurchases2
          +     0.18366019558751 * GRP_NumWebPurchases3
          +    -0.19335960904254 * GRP_NumWebPurchases4
          +     0.15283900648967 * GRP_RFMstat2  +    -0.03738648354517 * 
        GRP_RFMstat3  +      0.0780054343538 * GRP_RFMstat4
          +     0.08482465227003 * GRP_RMntFrq2  +    -0.04156217601701 * 
        GRP_RMntFrq3  +    -0.27972469674532 * GRP_RMntFrq4
          +     0.20311018978803 * GRP_Recency2  +     0.02026894035212 * 
        GRP_Recency3  +    -0.22461335805045 * GRP_Recency4 ;
   H14  =     0.84759844370999 * GRP_AcceptedCmp52  +    -0.40207108050785 * 
        GRP_Frq2  +    -0.11957926267486 * GRP_Frq3  +     0.39764041522616 * 
        GRP_Frq4  +    -0.21133467357887 * GRP_Income2
          +    -0.37600727819569 * GRP_Income3  +     0.61191321060217 * 
        GRP_Income4  +    -0.01918945699115 * GRP_Mnt2
          +    -0.28923187120656 * GRP_Mnt3  +     0.20590552102477 * GRP_Mnt4
          +     0.03194734131194 * GRP_MntFishProducts2
          +    -0.08555244396388 * GRP_MntFishProducts3
          +     -0.1294949057865 * GRP_MntFishProducts4
          +    -0.28742848639985 * GRP_MntGoldProds2
          +    -0.00435260781733 * GRP_MntGoldProds3
          +    -0.12007613875856 * GRP_MntGoldProds4
          +     0.36325039255643 * GRP_MntMeatProducts2
          +    -0.08728922471846 * GRP_MntMeatProducts3
          +    -0.19062123750322 * GRP_MntMeatProducts4
          +    -0.54694203087226 * GRP_MntWines2  +    -0.63189775838668 * 
        GRP_MntWines3  +      0.3957291463714 * GRP_MntWines4
          +       0.435944756052 * GRP_NumCatalogPurchases3
          +      0.2205855993165 * GRP_NumCatalogPurchases4
          +     0.59192262496927 * GRP_NumDistPurchases2
          +     0.04008128670209 * GRP_NumDistPurchases3
          +    -0.00330725734446 * GRP_NumDistPurchases4
          +     0.18235346155154 * GRP_NumWebPurchases2
          +     0.06863306934707 * GRP_NumWebPurchases3
          +     0.06339667504979 * GRP_NumWebPurchases4
          +     0.09545179117637 * GRP_RFMstat2  +     0.14008923310046 * 
        GRP_RFMstat3  +    -0.26191188327872 * GRP_RFMstat4
          +    -0.21341781402946 * GRP_RMntFrq2  +    -0.16158721892261 * 
        GRP_RMntFrq3  +    -0.03125612925483 * GRP_RMntFrq4
          +    -0.57136536034562 * GRP_Recency2  +    -0.28843025104868 * 
        GRP_Recency3  +     0.23682927566038 * GRP_Recency4 ;
   H15  =      -0.270075163047 * GRP_AcceptedCmp52  +     0.12329750151184 * 
        GRP_Frq2  +    -0.00636074237745 * GRP_Frq3  +     0.06125360704983 * 
        GRP_Frq4  +    -0.02221726738608 * GRP_Income2
          +     0.02831089386274 * GRP_Income3  +    -0.14245161962732 * 
        GRP_Income4  +    -0.33215929968734 * GRP_Mnt2
          +    -0.12990224977804 * GRP_Mnt3  +     0.01224047316232 * GRP_Mnt4
          +     0.43021866757807 * GRP_MntFishProducts2
          +    -0.27483945374498 * GRP_MntFishProducts3
          +     0.35053639451726 * GRP_MntFishProducts4
          +    -0.00509900753344 * GRP_MntGoldProds2
          +     -0.2114201518265 * GRP_MntGoldProds3
          +    -0.13970354632794 * GRP_MntGoldProds4
          +     0.08840789662233 * GRP_MntMeatProducts2
          +    -0.00365357432837 * GRP_MntMeatProducts3
          +    -0.17124615615804 * GRP_MntMeatProducts4
          +     -0.3149461311814 * GRP_MntWines2  +     0.13173264925134 * 
        GRP_MntWines3  +    -0.11604679382146 * GRP_MntWines4
          +     -0.5316533346484 * GRP_NumCatalogPurchases3
          +    -0.29157679545376 * GRP_NumCatalogPurchases4
          +    -0.08055861305066 * GRP_NumDistPurchases2
          +    -0.08674081531395 * GRP_NumDistPurchases3
          +    -0.17551921835199 * GRP_NumDistPurchases4
          +    -0.03222539166367 * GRP_NumWebPurchases2
          +    -0.13811302108485 * GRP_NumWebPurchases3
          +     0.06646439445075 * GRP_NumWebPurchases4
          +    -0.07079122602276 * GRP_RFMstat2  +    -0.39615424117539 * 
        GRP_RFMstat3  +     0.04146636703929 * GRP_RFMstat4
          +     -0.0853308883886 * GRP_RMntFrq2  +    -0.13702404280363 * 
        GRP_RMntFrq3  +    -0.27355720177265 * GRP_RMntFrq4
          +     0.33867777321903 * GRP_Recency2  +    -0.09253457902218 * 
        GRP_Recency3  +    -0.05897210090797 * GRP_Recency4 ;
   H16  =    -0.30271284676983 * GRP_AcceptedCmp52  +     0.03117199224725 * 
        GRP_Frq2  +    -0.26799382098604 * GRP_Frq3  +    -0.13070336759958 * 
        GRP_Frq4  +     0.12672160649087 * GRP_Income2
          +    -0.21150829323326 * GRP_Income3  +    -0.15720750294685 * 
        GRP_Income4  +     0.09905728950306 * GRP_Mnt2
          +    -0.43923284882193 * GRP_Mnt3  +     0.03431635930451 * GRP_Mnt4
          +     0.06947673564935 * GRP_MntFishProducts2
          +     -0.2220161944842 * GRP_MntFishProducts3
          +      -0.115965454808 * GRP_MntFishProducts4
          +    -0.01957355844265 * GRP_MntGoldProds2
          +     0.29129268161925 * GRP_MntGoldProds3
          +     0.06228256145252 * GRP_MntGoldProds4
          +    -0.09695386874195 * GRP_MntMeatProducts2
          +    -0.15864685727366 * GRP_MntMeatProducts3
          +    -0.49032797729016 * GRP_MntMeatProducts4
          +     0.37470089287985 * GRP_MntWines2  +     0.36115743239288 * 
        GRP_MntWines3  +    -0.34359138002961 * GRP_MntWines4
          +    -0.19461285131827 * GRP_NumCatalogPurchases3
          +     0.04513674368784 * GRP_NumCatalogPurchases4
          +    -0.03507865895925 * GRP_NumDistPurchases2
          +     0.09915485245283 * GRP_NumDistPurchases3
          +    -0.33100664342194 * GRP_NumDistPurchases4
          +     0.13724527126482 * GRP_NumWebPurchases2
          +    -0.02356592443136 * GRP_NumWebPurchases3
          +      0.2573229592217 * GRP_NumWebPurchases4
          +     0.05747809528111 * GRP_RFMstat2  +     0.09535983705402 * 
        GRP_RFMstat3  +    -0.10249907985488 * GRP_RFMstat4
          +     0.08979004612339 * GRP_RMntFrq2  +     0.21152228987437 * 
        GRP_RMntFrq3  +     0.01345639991803 * GRP_RMntFrq4
          +     0.52890036744064 * GRP_Recency2  +    -0.04507648861408 * 
        GRP_Recency3  +    -0.03669931738284 * GRP_Recency4 ;
   H17  =    -0.24394616675587 * GRP_AcceptedCmp52  +     0.28964856194613 * 
        GRP_Frq2  +    -0.08289613695725 * GRP_Frq3  +     0.21998897095553 * 
        GRP_Frq4  +     0.18107497199311 * GRP_Income2
          +      0.1107558510921 * GRP_Income3  +    -0.36116869826735 * 
        GRP_Income4  +     0.02424010270897 * GRP_Mnt2
          +    -0.15852275336702 * GRP_Mnt3  +    -0.35418266455505 * GRP_Mnt4
          +     0.20869043565167 * GRP_MntFishProducts2
          +     0.10833559681607 * GRP_MntFishProducts3
          +    -0.10347776442631 * GRP_MntFishProducts4
          +    -0.32065428276511 * GRP_MntGoldProds2
          +    -0.43926899233496 * GRP_MntGoldProds3
          +    -0.10606506374615 * GRP_MntGoldProds4
          +    -0.31984276315874 * GRP_MntMeatProducts2
          +    -0.10334364706061 * GRP_MntMeatProducts3
          +    -0.00884354140504 * GRP_MntMeatProducts4
          +     0.23600639890053 * GRP_MntWines2  +    -0.29934386684584 * 
        GRP_MntWines3  +     0.16274179248724 * GRP_MntWines4
          +    -0.32950762391869 * GRP_NumCatalogPurchases3
          +     0.01712392556947 * GRP_NumCatalogPurchases4
          +    -0.34220067420996 * GRP_NumDistPurchases2
          +    -0.15410597036596 * GRP_NumDistPurchases3
          +    -0.05769918195545 * GRP_NumDistPurchases4
          +    -0.03929570019271 * GRP_NumWebPurchases2
          +    -0.30647973770852 * GRP_NumWebPurchases3
          +    -0.09809448516146 * GRP_NumWebPurchases4
          +     0.02199652262588 * GRP_RFMstat2  +    -0.18677191406874 * 
        GRP_RFMstat3  +    -0.06022520470141 * GRP_RFMstat4
          +    -0.14995521360575 * GRP_RMntFrq2  +     0.00512207268691 * 
        GRP_RMntFrq3  +    -0.58308661640325 * GRP_RMntFrq4
          +     0.09125052186965 * GRP_Recency2  +    -0.01605996390173 * 
        GRP_Recency3  +     0.09260166797685 * GRP_Recency4 ;
   H11  =     1.47536864687001 + H11 ;
   H12  =    -0.03796823184366 + H12 ;
   H13  =     0.20545721254095 + H13 ;
   H14  =     0.82513531048516 + H14 ;
   H15  =    -0.86531822153621 + H15 ;
   H16  =    -1.63588460642984 + H16 ;
   H17  =     1.27216054538203 + H17 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
   H16  = TANH(H16 );
   H17  = TANH(H17 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
   H16  = .;
   H17  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =     1.96524348977009 * H11  +     1.80437226064293 * H12
          +     0.26614818926491 * H13  +     -2.3095876381555 * H14
          +     0.55402099095215 * H15  +     1.54522449582288 * H16
          +     1.13845442289883 * H17 ;
   P_DepVar1  =    -1.53783202740594 + P_DepVar1 ;
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
