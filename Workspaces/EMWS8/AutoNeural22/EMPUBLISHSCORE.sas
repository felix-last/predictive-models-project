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

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x1_5 = 'Hidden: H1x1_=5' ;

      label H1x1_6 = 'Hidden: H1x1_=6' ;

      label H1x1_7 = 'Hidden: H1x1_=7' ;

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
   H1x1_1  =     2.97734663226499 * S_Year_Birth ;
   H1x1_2  =    -0.02332673614472 * S_Year_Birth ;
   H1x1_3  =    -0.21203760038885 * S_Year_Birth ;
   H1x1_4  =    -0.93232920235603 * S_Year_Birth ;
   H1x1_5  =     0.52440348943963 * S_Year_Birth ;
   H1x1_6  =    -2.87318917513282 * S_Year_Birth ;
   H1x1_7  =     1.25367568490371 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +     2.80677271834446 * GRP_AcceptedCmp52
          +    -2.32565230752453 * GRP_Frq2  +     2.22037590877354 * GRP_Frq3
          +    -3.68499358333843 * GRP_Frq4  +    -2.13081454889876 *
        GRP_Income2  +    -0.38485085997351 * GRP_Income3
          +     0.43520727568519 * GRP_Income4  +    -1.67383365803521 *
        GRP_Mnt2  +    -2.27881933900388 * GRP_Mnt3  +    -0.69213755321586 *
        GRP_Mnt4  +    -0.04079006532289 * GRP_MntFishProducts2
          +    -2.14876852259668 * GRP_MntFishProducts3
          +     1.83260002021024 * GRP_MntFishProducts4
          +     0.51096990118592 * GRP_MntGoldProds2
          +     0.50696068122006 * GRP_MntGoldProds3
          +     0.74230349643824 * GRP_MntGoldProds4
          +     1.49045716090612 * GRP_MntMeatProducts2
          +    -0.61254307122158 * GRP_MntMeatProducts3
          +     1.56999187930143 * GRP_MntMeatProducts4
          +    -0.31632843892516 * GRP_MntWines2  +    -1.05626215752058 *
        GRP_MntWines3  +    -0.15924458576467 * GRP_MntWines4
          +    -1.09346439824911 * GRP_NumCatalogPurchases3
          +     1.58785113957128 * GRP_NumCatalogPurchases4
          +    -0.62454988809727 * GRP_NumDistPurchases2
          +     1.37295312356584 * GRP_NumDistPurchases3
          +      1.5440119795954 * GRP_NumDistPurchases4
          +    -0.26547715068585 * GRP_NumWebPurchases2
          +     2.62305554684179 * GRP_NumWebPurchases3
          +     0.91247524672275 * GRP_NumWebPurchases4
          +     0.71467719190546 * GRP_RFMstat2  +     0.44245796416885 *
        GRP_RFMstat3  +      0.0238006357066 * GRP_RFMstat4
          +    -2.17145575258416 * GRP_RMntFrq2  +    -3.29596121756931 *
        GRP_RMntFrq3  +    -0.63464596926142 * GRP_RMntFrq4
          +      0.2862685045527 * GRP_Recency2  +    -0.77133964406228 *
        GRP_Recency3  +     0.83634712420156 * GRP_Recency4 ;
   H1x1_2  = H1x1_2  +    -2.21554077433203 * GRP_AcceptedCmp52
          +     -1.3297040775516 * GRP_Frq2  +     -1.2691861008704 * GRP_Frq3
          +    -0.83350069121519 * GRP_Frq4  +    -0.45956269964658 *
        GRP_Income2  +    -0.23636051304973 * GRP_Income3
          +    -0.09369458285141 * GRP_Income4  +     0.28408485738252 *
        GRP_Mnt2  +    -1.43976442737366 * GRP_Mnt3  +    -0.47811534578751 *
        GRP_Mnt4  +     1.33306738423502 * GRP_MntFishProducts2
          +    -1.03235983303498 * GRP_MntFishProducts3
          +     1.43737242782063 * GRP_MntFishProducts4
          +    -0.10286834037331 * GRP_MntGoldProds2
          +     0.74054061895326 * GRP_MntGoldProds3
          +     0.27916388015938 * GRP_MntGoldProds4
          +     0.12775665160956 * GRP_MntMeatProducts2
          +     1.94239791535409 * GRP_MntMeatProducts3
          +      2.8604089986372 * GRP_MntMeatProducts4
          +     0.18466046439888 * GRP_MntWines2  +     1.56362849954362 *
        GRP_MntWines3  +    -0.74058839441389 * GRP_MntWines4
          +     0.80335076525252 * GRP_NumCatalogPurchases3
          +     -2.1633226572249 * GRP_NumCatalogPurchases4
          +    -0.87650147959772 * GRP_NumDistPurchases2
          +     1.12706069993787 * GRP_NumDistPurchases3
          +    -1.96498929641584 * GRP_NumDistPurchases4
          +     1.06875251220076 * GRP_NumWebPurchases2
          +     1.19584362733739 * GRP_NumWebPurchases3
          +    -0.75462993535725 * GRP_NumWebPurchases4
          +     0.34313165289913 * GRP_RFMstat2  +    -3.07377616469396 *
        GRP_RFMstat3  +    -0.30628532882149 * GRP_RFMstat4
          +     0.90422181954504 * GRP_RMntFrq2  +    -0.82179895308246 *
        GRP_RMntFrq3  +    -0.01336870072701 * GRP_RMntFrq4
          +     0.78962138115092 * GRP_Recency2  +     0.35738352585872 *
        GRP_Recency3  +    -0.83190183219938 * GRP_Recency4 ;
   H1x1_3  = H1x1_3  +     -0.1278687821469 * GRP_AcceptedCmp52
          +     1.77838881912744 * GRP_Frq2  +    -0.95209160545855 * GRP_Frq3
          +     2.40141754421545 * GRP_Frq4  +     0.60378783958273 *
        GRP_Income2  +    -2.18346600414349 * GRP_Income3
          +     0.80627498676781 * GRP_Income4  +     0.81141725300118 *
        GRP_Mnt2  +    -0.20395009454155 * GRP_Mnt3  +     -0.3358053338153 *
        GRP_Mnt4  +    -0.16819978312641 * GRP_MntFishProducts2
          +    -0.11485741469493 * GRP_MntFishProducts3
          +     1.45721315298108 * GRP_MntFishProducts4
          +     0.26086838482974 * GRP_MntGoldProds2
          +    -0.13326700912822 * GRP_MntGoldProds3
          +    -0.31998514458297 * GRP_MntGoldProds4
          +     0.87003612251325 * GRP_MntMeatProducts2
          +    -0.25985022264915 * GRP_MntMeatProducts3
          +    -0.87011310494619 * GRP_MntMeatProducts4
          +     0.18840026647696 * GRP_MntWines2  +    -0.82430822747103 *
        GRP_MntWines3  +     -0.1293341794059 * GRP_MntWines4
          +     1.20111821881337 * GRP_NumCatalogPurchases3
          +     1.02378241927709 * GRP_NumCatalogPurchases4
          +      1.0835984835482 * GRP_NumDistPurchases2
          +     1.45339482543591 * GRP_NumDistPurchases3
          +     0.28792255375632 * GRP_NumDistPurchases4
          +     1.88871344284328 * GRP_NumWebPurchases2
          +     1.61086784930132 * GRP_NumWebPurchases3
          +     0.49767560191528 * GRP_NumWebPurchases4
          +    -2.78411910257351 * GRP_RFMstat2  +     0.84118867927224 *
        GRP_RFMstat3  +    -0.16102328336547 * GRP_RFMstat4
          +     0.27000998599161 * GRP_RMntFrq2  +     0.90131491180658 *
        GRP_RMntFrq3  +    -0.16432121563449 * GRP_RMntFrq4
          +     0.75599465145487 * GRP_Recency2  +     1.38233564862138 *
        GRP_Recency3  +      0.0905871640358 * GRP_Recency4 ;
   H1x1_4  = H1x1_4  +     0.63304456551117 * GRP_AcceptedCmp52
          +    -0.14901142536344 * GRP_Frq2  +    -1.08381199299565 * GRP_Frq3
          +    -0.85011511275423 * GRP_Frq4  +    -0.08287353061518 *
        GRP_Income2  +    -0.58867333501692 * GRP_Income3
          +      2.7097455309793 * GRP_Income4  +    -0.69224144793047 *
        GRP_Mnt2  +    -0.68026366312168 * GRP_Mnt3  +     1.66551851821907 *
        GRP_Mnt4  +    -1.22509209613269 * GRP_MntFishProducts2
          +    -0.00259407262353 * GRP_MntFishProducts3
          +     0.26637234051452 * GRP_MntFishProducts4
          +     1.23072457246487 * GRP_MntGoldProds2
          +     0.27789879553199 * GRP_MntGoldProds3
          +    -1.84318316043809 * GRP_MntGoldProds4
          +    -0.37980618439099 * GRP_MntMeatProducts2
          +    -0.29547725841338 * GRP_MntMeatProducts3
          +      1.3351420752995 * GRP_MntMeatProducts4
          +    -0.69084339698082 * GRP_MntWines2  +    -2.20092193594928 *
        GRP_MntWines3  +     1.01263725926364 * GRP_MntWines4
          +     1.64715242240489 * GRP_NumCatalogPurchases3
          +     0.01013329918753 * GRP_NumCatalogPurchases4
          +      0.0553124072484 * GRP_NumDistPurchases2
          +     0.76354979572241 * GRP_NumDistPurchases3
          +     0.88878742575161 * GRP_NumDistPurchases4
          +    -0.02629928898859 * GRP_NumWebPurchases2
          +     1.58583162640849 * GRP_NumWebPurchases3
          +    -0.90266287490405 * GRP_NumWebPurchases4
          +    -1.30674857203711 * GRP_RFMstat2  +    -1.17342096545194 *
        GRP_RFMstat3  +    -0.30126794428155 * GRP_RFMstat4
          +     -0.8659792150521 * GRP_RMntFrq2  +    -1.44590383236006 *
        GRP_RMntFrq3  +    -0.80966415705314 * GRP_RMntFrq4
          +     0.87489420639261 * GRP_Recency2  +    -1.40960165096221 *
        GRP_Recency3  +    -0.53680151949787 * GRP_Recency4 ;
   H1x1_5  = H1x1_5  +    -0.21941115903739 * GRP_AcceptedCmp52
          +     0.45333751914711 * GRP_Frq2  +     -3.0539111804593 * GRP_Frq3
          +     0.04419455266766 * GRP_Frq4  +     0.43424963383962 *
        GRP_Income2  +     2.20143802199151 * GRP_Income3
          +    -0.28702964858037 * GRP_Income4  +    -1.13156956520544 *
        GRP_Mnt2  +     1.50720291442363 * GRP_Mnt3  +    -1.22848161283033 *
        GRP_Mnt4  +     -0.7725131971727 * GRP_MntFishProducts2
          +    -1.66553508839843 * GRP_MntFishProducts3
          +     3.34099127472134 * GRP_MntFishProducts4
          +    -3.77620930649926 * GRP_MntGoldProds2
          +     2.75980592823208 * GRP_MntGoldProds3
          +    -0.90664928399655 * GRP_MntGoldProds4
          +    -1.27778215433985 * GRP_MntMeatProducts2
          +    -0.38584098789626 * GRP_MntMeatProducts3
          +      0.8642940393434 * GRP_MntMeatProducts4
          +     -1.9800576470315 * GRP_MntWines2  +    -0.84678624865719 *
        GRP_MntWines3  +    -0.71867792060605 * GRP_MntWines4
          +     0.54374663319998 * GRP_NumCatalogPurchases3
          +     0.84217480467185 * GRP_NumCatalogPurchases4
          +    -0.04373645189331 * GRP_NumDistPurchases2
          +    -3.26167594790936 * GRP_NumDistPurchases3
          +    -1.17302893253955 * GRP_NumDistPurchases4
          +     1.08907656354379 * GRP_NumWebPurchases2
          +    -1.23512651413063 * GRP_NumWebPurchases3
          +     1.21540059785356 * GRP_NumWebPurchases4
          +     1.38488146196728 * GRP_RFMstat2  +     0.90046251067185 *
        GRP_RFMstat3  +     1.44622088949053 * GRP_RFMstat4
          +     0.24358390082829 * GRP_RMntFrq2  +    -1.52588683776436 *
        GRP_RMntFrq3  +    -1.28643658389964 * GRP_RMntFrq4
          +    -0.57567006875063 * GRP_Recency2  +    -1.38736001754893 *
        GRP_Recency3  +    -0.14702610320846 * GRP_Recency4 ;
   H1x1_6  = H1x1_6  +     0.08036802334337 * GRP_AcceptedCmp52
          +    -2.51458257290705 * GRP_Frq2  +     0.74528046172987 * GRP_Frq3
          +    -0.77535820763324 * GRP_Frq4  +    -2.00398370232748 *
        GRP_Income2  +     2.31528209254516 * GRP_Income3
          +     0.31630780664757 * GRP_Income4  +    -0.52394275421685 *
        GRP_Mnt2  +    -0.11778857296632 * GRP_Mnt3  +     0.54634621990664 *
        GRP_Mnt4  +    -1.83414469533751 * GRP_MntFishProducts2
          +    -2.67281939906452 * GRP_MntFishProducts3
          +     0.40242786465667 * GRP_MntFishProducts4
          +     1.21530608953831 * GRP_MntGoldProds2
          +      1.3503878333604 * GRP_MntGoldProds3
          +    -0.90580344196397 * GRP_MntGoldProds4
          +    -1.45763540546851 * GRP_MntMeatProducts2
          +     -1.1437696213546 * GRP_MntMeatProducts3
          +    -0.95836970043212 * GRP_MntMeatProducts4
          +     0.05665970127644 * GRP_MntWines2  +     0.73760441066896 *
        GRP_MntWines3  +    -0.66251833030334 * GRP_MntWines4
          +    -0.66756860309452 * GRP_NumCatalogPurchases3
          +    -1.77302756421253 * GRP_NumCatalogPurchases4
          +     0.41629563300233 * GRP_NumDistPurchases2
          +     2.64707563295858 * GRP_NumDistPurchases3
          +    -2.61014123917694 * GRP_NumDistPurchases4
          +     1.31436489534812 * GRP_NumWebPurchases2
          +    -0.44152222308186 * GRP_NumWebPurchases3
          +     1.72168992115176 * GRP_NumWebPurchases4
          +    -0.60634873547541 * GRP_RFMstat2  +      0.5143401306027 *
        GRP_RFMstat3  +      0.4037230104052 * GRP_RFMstat4
          +     1.85795667721847 * GRP_RMntFrq2  +    -1.13313695958964 *
        GRP_RMntFrq3  +     1.21816928983774 * GRP_RMntFrq4
          +     0.28142803075343 * GRP_Recency2  +    -0.43031870131445 *
        GRP_Recency3  +    -0.98956301213704 * GRP_Recency4 ;
   H1x1_7  = H1x1_7  +     0.68410670134149 * GRP_AcceptedCmp52
          +     0.10121806405455 * GRP_Frq2  +     -1.8375798445876 * GRP_Frq3
          +     -2.3304704350487 * GRP_Frq4  +     -0.4064720818222 *
        GRP_Income2  +     1.14246001493098 * GRP_Income3
          +     0.30563934221376 * GRP_Income4  +    -1.03456782830408 *
        GRP_Mnt2  +     0.68732316665899 * GRP_Mnt3  +     0.12193839917197 *
        GRP_Mnt4  +     1.78947230945337 * GRP_MntFishProducts2
          +      -0.152562533802 * GRP_MntFishProducts3
          +     0.16800852501402 * GRP_MntFishProducts4
          +    -0.43436913890783 * GRP_MntGoldProds2
          +    -0.36427695823088 * GRP_MntGoldProds3
          +    -0.70562605444874 * GRP_MntGoldProds4
          +      1.1896868399991 * GRP_MntMeatProducts2
          +    -3.25683109762258 * GRP_MntMeatProducts3
          +     1.07082922763777 * GRP_MntMeatProducts4
          +     0.20781058114233 * GRP_MntWines2  +     0.58933954589501 *
        GRP_MntWines3  +    -0.47329387352048 * GRP_MntWines4
          +     2.86401269707592 * GRP_NumCatalogPurchases3
          +    -0.42660183421871 * GRP_NumCatalogPurchases4
          +     1.70072621341351 * GRP_NumDistPurchases2
          +    -0.01744947613595 * GRP_NumDistPurchases3
          +    -2.08742260039568 * GRP_NumDistPurchases4
          +    -1.04444309037822 * GRP_NumWebPurchases2
          +    -3.12746125340209 * GRP_NumWebPurchases3
          +    -0.71369198142362 * GRP_NumWebPurchases4
          +    -0.49060046002682 * GRP_RFMstat2  +     0.31117459893753 *
        GRP_RFMstat3  +     1.58479219562748 * GRP_RFMstat4
          +     0.16070553135537 * GRP_RMntFrq2  +    -1.17007677743781 *
        GRP_RMntFrq3  +    -0.89420472751582 * GRP_RMntFrq4
          +    -0.18368088096716 * GRP_Recency2  +    -0.51910607139607 *
        GRP_Recency3  +     0.01857782231504 * GRP_Recency4 ;
   H1x1_1  =     1.05791912072896 + H1x1_1 ;
   H1x1_2  =    -3.78026109193218 + H1x1_2 ;
   H1x1_3  =    -0.67855740578745 + H1x1_3 ;
   H1x1_4  =     1.43165665437202 + H1x1_4 ;
   H1x1_5  =     0.38366959591805 + H1x1_5 ;
   H1x1_6  =     3.31752226761072 + H1x1_6 ;
   H1x1_7  =    -0.85163584413854 + H1x1_7 ;
   DROP _EXP_BAR;
   _EXP_BAR=50;
   H1x1_1  = 1.0 / (1.0 + EXP(MIN( - H1x1_1 , _EXP_BAR)));
   H1x1_2  = 1.0 / (1.0 + EXP(MIN( - H1x1_2 , _EXP_BAR)));
   H1x1_3  = 1.0 / (1.0 + EXP(MIN( - H1x1_3 , _EXP_BAR)));
   H1x1_4  = 1.0 / (1.0 + EXP(MIN( - H1x1_4 , _EXP_BAR)));
   H1x1_5  = 1.0 / (1.0 + EXP(MIN( - H1x1_5 , _EXP_BAR)));
   H1x1_6  = 1.0 / (1.0 + EXP(MIN( - H1x1_6 , _EXP_BAR)));
   H1x1_7  = 1.0 / (1.0 + EXP(MIN( - H1x1_7 , _EXP_BAR)));
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
   H1x1_5  = .;
   H1x1_6  = .;
   H1x1_7  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -4.35435611850415 * H1x1_1  +     3.06316051292344 * H1x1_2
          +     1.44284980602333 * H1x1_3  +    -3.32913686535523 * H1x1_4
          +     4.44336056081802 * H1x1_5  +    -4.57997435146105 * H1x1_6
          +      3.7324549254653 * H1x1_7 ;
   P_DepVar1  =    -0.50604500485068 + P_DepVar1 ;
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
drop S_:;
