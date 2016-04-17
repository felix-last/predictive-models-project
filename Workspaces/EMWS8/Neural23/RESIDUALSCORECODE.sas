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
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =     0.33640101965956 * GRP_AcceptedCmp52  +    -0.09458866011332 * 
        GRP_Frq2  +     0.08165112288668 * GRP_Frq3  +      0.0098569396377 * 
        GRP_Frq4  +    -0.10718097600137 * GRP_Income2
          +     0.24913133317457 * GRP_Income3  +     0.08606607454597 * 
        GRP_Income4  +    -0.43083911296417 * GRP_Mnt2
          +    -0.35952383025836 * GRP_Mnt3  +     0.15746774085254 * GRP_Mnt4
          +     0.03496490321939 * GRP_MntFishProducts2
          +     -0.1386775704024 * GRP_MntFishProducts3
          +     0.08185130088727 * GRP_MntFishProducts4
          +     0.20666000615395 * GRP_MntGoldProds2
          +     0.02513603537885 * GRP_MntGoldProds3
          +     0.04518515377846 * GRP_MntGoldProds4
          +     0.14564741446952 * GRP_MntMeatProducts2
          +      0.0921407018606 * GRP_MntMeatProducts3
          +     0.03964574584898 * GRP_MntMeatProducts4
          +    -0.10395279216819 * GRP_MntWines2  +     0.12929231428625 * 
        GRP_MntWines3  +     0.00045903854959 * GRP_MntWines4
          +    -0.03496333349231 * GRP_NumCatalogPurchases3
          +    -0.18329339773791 * GRP_NumCatalogPurchases4
          +     0.25535533392017 * GRP_NumDistPurchases2
          +     0.03881117716273 * GRP_NumDistPurchases3
          +    -0.02565551941415 * GRP_NumDistPurchases4
          +     0.31760052513768 * GRP_NumWebPurchases2
          +     0.09995149350563 * GRP_NumWebPurchases3
          +    -0.03267834031943 * GRP_NumWebPurchases4
          +     0.20523977712748 * GRP_RFMstat2  +    -0.05606160362426 * 
        GRP_RFMstat3  +     0.08166835774422 * GRP_RFMstat4
          +    -0.02802261136507 * GRP_RMntFrq2  +     0.04530681268814 * 
        GRP_RMntFrq3  +     0.17075869124019 * GRP_RMntFrq4
          +    -0.07437386313878 * GRP_Recency2  +    -0.03620176560114 * 
        GRP_Recency3  +     -0.1829690397052 * GRP_Recency4 ;
   H12  =    -0.44053040668419 * GRP_AcceptedCmp52  +     0.39130488780547 * 
        GRP_Frq2  +    -0.05339083882864 * GRP_Frq3  +     0.00231451089906 * 
        GRP_Frq4  +      0.5831587240061 * GRP_Income2
          +     0.54852848249408 * GRP_Income3  +     -0.4598479622494 * 
        GRP_Income4  +     0.04804779326921 * GRP_Mnt2
          +    -0.18484356222731 * GRP_Mnt3  +     0.03549703658034 * GRP_Mnt4
          +     0.39885742453554 * GRP_MntFishProducts2
          +     0.15761355687754 * GRP_MntFishProducts3
          +    -0.21271471925571 * GRP_MntFishProducts4
          +     -0.1972927903123 * GRP_MntGoldProds2
          +     0.03399122417272 * GRP_MntGoldProds3
          +    -0.02558670857298 * GRP_MntGoldProds4
          +    -0.41984327217018 * GRP_MntMeatProducts2
          +     0.05051071020912 * GRP_MntMeatProducts3
          +     0.02213191751142 * GRP_MntMeatProducts4
          +     0.27725513562646 * GRP_MntWines2  +    -0.13825638111274 * 
        GRP_MntWines3  +     0.10174302336793 * GRP_MntWines4
          +    -0.13050806508623 * GRP_NumCatalogPurchases3
          +     0.18000903281461 * GRP_NumCatalogPurchases4
          +     -0.5134802042985 * GRP_NumDistPurchases2
          +     -0.0517830924312 * GRP_NumDistPurchases3
          +    -0.16980153882394 * GRP_NumDistPurchases4
          +     0.03868274112159 * GRP_NumWebPurchases2
          +     0.16193614709489 * GRP_NumWebPurchases3
          +      0.0269423998237 * GRP_NumWebPurchases4
          +    -0.32452106975443 * GRP_RFMstat2  +    -0.21611965835421 * 
        GRP_RFMstat3  +    -0.11926055719327 * GRP_RFMstat4
          +     0.21187682021828 * GRP_RMntFrq2  +     0.08976835265364 * 
        GRP_RMntFrq3  +    -0.20787348857522 * GRP_RMntFrq4
          +     0.68804853934306 * GRP_Recency2  +     0.17422440486451 * 
        GRP_Recency3  +    -0.18452599729833 * GRP_Recency4 ;
   H13  =      0.0874014291812 * GRP_AcceptedCmp52  +     0.17304198694157 * 
        GRP_Frq2  +    -0.11491629051719 * GRP_Frq3  +      0.2483225021197 * 
        GRP_Frq4  +    -0.05989120739582 * GRP_Income2
          +    -0.02732012571019 * GRP_Income3  +     0.20807069048689 * 
        GRP_Income4  +     0.33666649935924 * GRP_Mnt2
          +      0.0642358727731 * GRP_Mnt3  +    -0.22568229208697 * GRP_Mnt4
          +    -0.12147573127033 * GRP_MntFishProducts2
          +    -0.19323607018295 * GRP_MntFishProducts3
          +     0.25863847748437 * GRP_MntFishProducts4
          +     -0.0126645668436 * GRP_MntGoldProds2
          +    -0.11323357258997 * GRP_MntGoldProds3
          +    -0.11250689806163 * GRP_MntGoldProds4
          +    -0.12545641044895 * GRP_MntMeatProducts2
          +    -0.04305442792903 * GRP_MntMeatProducts3
          +    -0.32146302728834 * GRP_MntMeatProducts4
          +    -0.00148263872712 * GRP_MntWines2  +     0.11028478479749 * 
        GRP_MntWines3  +    -0.02542826671873 * GRP_MntWines4
          +    -0.03468933342665 * GRP_NumCatalogPurchases3
          +     0.06081255664838 * GRP_NumCatalogPurchases4
          +     0.09115957554684 * GRP_NumDistPurchases2
          +    -0.19448624046951 * GRP_NumDistPurchases3
          +     0.18401866660579 * GRP_NumDistPurchases4
          +    -0.30934548179162 * GRP_NumWebPurchases2
          +    -0.15569430268918 * GRP_NumWebPurchases3
          +    -0.15912290396059 * GRP_NumWebPurchases4
          +      0.3307600563141 * GRP_RFMstat2  +    -0.22709032656384 * 
        GRP_RFMstat3  +      0.0673885738463 * GRP_RFMstat4
          +    -0.34782658221729 * GRP_RMntFrq2  +    -0.37292996378384 * 
        GRP_RMntFrq3  +    -0.19656647007955 * GRP_RMntFrq4
          +    -0.48292133112766 * GRP_Recency2  +    -0.19998163272412 * 
        GRP_Recency3  +     0.04020306752703 * GRP_Recency4 ;
   H14  =    -0.06535462604618 * GRP_AcceptedCmp52  +    -0.02538966501603 * 
        GRP_Frq2  +    -0.37465930862485 * GRP_Frq3  +    -0.09115714895281 * 
        GRP_Frq4  +    -0.19377207233976 * GRP_Income2
          +     0.19699955617479 * GRP_Income3  +     0.18620312701109 * 
        GRP_Income4  +    -0.07918752617024 * GRP_Mnt2
          +    -0.15791729955854 * GRP_Mnt3  +     0.05785915035978 * GRP_Mnt4
          +    -0.15621920593365 * GRP_MntFishProducts2
          +     0.18156570239129 * GRP_MntFishProducts3
          +    -0.19268366331472 * GRP_MntFishProducts4
          +     0.17003324763884 * GRP_MntGoldProds2
          +    -0.24315925332299 * GRP_MntGoldProds3
          +    -0.19433542142509 * GRP_MntGoldProds4
          +     0.48300099715349 * GRP_MntMeatProducts2
          +     0.04287374992788 * GRP_MntMeatProducts3
          +    -0.14772483570864 * GRP_MntMeatProducts4
          +    -0.35939710533055 * GRP_MntWines2  +      0.0814263252657 * 
        GRP_MntWines3  +     0.11455106831693 * GRP_MntWines4
          +     0.28909689894797 * GRP_NumCatalogPurchases3
          +     0.35798075318799 * GRP_NumCatalogPurchases4
          +     0.26175622277157 * GRP_NumDistPurchases2
          +    -0.28134203235556 * GRP_NumDistPurchases3
          +     -0.0849885153607 * GRP_NumDistPurchases4
          +    -0.00363026409862 * GRP_NumWebPurchases2
          +    -0.18458881565534 * GRP_NumWebPurchases3
          +    -0.00054495066636 * GRP_NumWebPurchases4
          +     0.02464665365087 * GRP_RFMstat2  +    -0.04709787167688 * 
        GRP_RFMstat3  +    -0.21485621631981 * GRP_RFMstat4
          +      0.0421527075159 * GRP_RMntFrq2  +     0.12266531817421 * 
        GRP_RMntFrq3  +     0.34319246452663 * GRP_RMntFrq4
          +    -0.42128751178743 * GRP_Recency2  +    -0.03341002800803 * 
        GRP_Recency3  +    -0.00550102888585 * GRP_Recency4 ;
   H15  =     0.20080324976316 * GRP_AcceptedCmp52  +     0.03346464595946 * 
        GRP_Frq2  +    -0.46550936235158 * GRP_Frq3  +     0.11038114045006 * 
        GRP_Frq4  +     0.10073875117437 * GRP_Income2
          +    -0.22683871345668 * GRP_Income3  +    -0.09384548786395 * 
        GRP_Income4  +     0.43323607707701 * GRP_Mnt2
          +     0.27829480348267 * GRP_Mnt3  +     0.12638599389415 * GRP_Mnt4
          +     0.02417129110075 * GRP_MntFishProducts2
          +      0.2545897829616 * GRP_MntFishProducts3
          +    -0.29458064807823 * GRP_MntFishProducts4
          +    -0.15364697476117 * GRP_MntGoldProds2
          +      0.3170384910511 * GRP_MntGoldProds3
          +     0.43731794737697 * GRP_MntGoldProds4
          +     0.51501086483907 * GRP_MntMeatProducts2
          +     0.15231215210229 * GRP_MntMeatProducts3
          +    -0.05381144096743 * GRP_MntMeatProducts4
          +     0.13508510112509 * GRP_MntWines2  +    -0.33096430220175 * 
        GRP_MntWines3  +     0.49248642584759 * GRP_MntWines4
          +     0.25386528096127 * GRP_NumCatalogPurchases3
          +     0.31775128798882 * GRP_NumCatalogPurchases4
          +     0.26152832976302 * GRP_NumDistPurchases2
          +     0.00160473771196 * GRP_NumDistPurchases3
          +      0.0013330753294 * GRP_NumDistPurchases4
          +     0.23697025371136 * GRP_NumWebPurchases2
          +     0.12394312604839 * GRP_NumWebPurchases3
          +     0.29358944454399 * GRP_NumWebPurchases4
          +      0.2711027918467 * GRP_RFMstat2  +    -0.07642391618094 * 
        GRP_RFMstat3  +     0.14712184054126 * GRP_RFMstat4
          +     0.11431001806439 * GRP_RMntFrq2  +     0.06273949214332 * 
        GRP_RMntFrq3  +     0.44954334169592 * GRP_RMntFrq4
          +    -0.10299484961132 * GRP_Recency2  +    -0.00660050077332 * 
        GRP_Recency3  +     0.10477819043432 * GRP_Recency4 ;
   H16  =      0.7597594494859 * GRP_AcceptedCmp52  +    -0.32376689593056 * 
        GRP_Frq2  +    -0.07779183366163 * GRP_Frq3  +     0.11273534310895 * 
        GRP_Frq4  +    -0.36089895624306 * GRP_Income2
          +    -0.38271011363759 * GRP_Income3  +     0.33282176047548 * 
        GRP_Income4  +    -0.13854310872224 * GRP_Mnt2
          +    -0.31005746238746 * GRP_Mnt3  +     0.02082673800287 * GRP_Mnt4
          +     0.01224737349632 * GRP_MntFishProducts2
          +    -0.19458526368147 * GRP_MntFishProducts3
          +    -0.25187479317784 * GRP_MntFishProducts4
          +     0.01924229245332 * GRP_MntGoldProds2
          +     0.01852658027428 * GRP_MntGoldProds3
          +    -0.23305256947549 * GRP_MntGoldProds4
          +     0.13401051842966 * GRP_MntMeatProducts2
          +     0.27193108385041 * GRP_MntMeatProducts3
          +     0.01379422261623 * GRP_MntMeatProducts4
          +    -0.57181882470311 * GRP_MntWines2  +    -0.57187059852098 * 
        GRP_MntWines3  +     0.30882985081217 * GRP_MntWines4
          +     0.49912000555763 * GRP_NumCatalogPurchases3
          +    -0.04354876738665 * GRP_NumCatalogPurchases4
          +     0.34941540707612 * GRP_NumDistPurchases2
          +     0.32691169055841 * GRP_NumDistPurchases3
          +    -0.09211947503636 * GRP_NumDistPurchases4
          +     0.23482266977456 * GRP_NumWebPurchases2
          +     0.33507315521476 * GRP_NumWebPurchases3
          +    -0.08817191120299 * GRP_NumWebPurchases4
          +     0.02374098589478 * GRP_RFMstat2  +    -0.23629328969151 * 
        GRP_RFMstat3  +    -0.52724215414655 * GRP_RFMstat4
          +    -0.11172774703142 * GRP_RMntFrq2  +    -0.23930023577086 * 
        GRP_RMntFrq3  +    -0.17783974029566 * GRP_RMntFrq4
          +    -0.09948595230391 * GRP_Recency2  +    -0.15957779348689 * 
        GRP_Recency3  +     0.12430840578537 * GRP_Recency4 ;
   H11  =    -0.83610777610194 + H11 ;
   H12  =     0.10079183797017 + H12 ;
   H13  =    -1.02827583788856 + H13 ;
   H14  =    -0.61336153955727 + H14 ;
   H15  =      0.2253118259528 + H15 ;
   H16  =     0.92538506927963 + H16 ;
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
   P_DepVar1  =    -0.23603747173409 * H11  +     2.21167504352097 * H12
          +    -0.73919409105284 * H13  +     -1.1148994433356 * H14
          +    -1.58525957527132 * H15  +    -1.77364534531332 * H16 ;
   P_DepVar1  =    -1.69291771072924 + P_DepVar1 ;
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
