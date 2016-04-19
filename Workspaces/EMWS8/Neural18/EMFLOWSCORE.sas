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

      label H17 = 'Hidden: H1=7' ;

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
   H11  =     0.03855897145156 * S_Year_Birth ;
   H12  =      0.4940754340088 * S_Year_Birth ;
   H13  =     0.17524137660647 * S_Year_Birth ;
   H14  =     0.27270757044038 * S_Year_Birth ;
   H15  =    -0.02127353119313 * S_Year_Birth ;
   H16  =    -0.10595973365564 * S_Year_Birth ;
   H17  =    -0.11271332681901 * S_Year_Birth ;
   H11  = H11  +     0.21558790598329 * GRP_AcceptedCmp52
          +    -0.07145572032882 * GRP_Frq2  +     0.09268595548153 * GRP_Frq3
          +    -0.20765463263399 * GRP_Frq4  +    -0.00887637988838 *
        GRP_Income2  +    -0.34198008097003 * GRP_Income3
          +     0.00518173450113 * GRP_Income4  +     0.17153998784849 *
        GRP_Mnt2  +    -0.03282863464194 * GRP_Mnt3  +     0.15479242768387 *
        GRP_Mnt4  +    -0.14566682947772 * GRP_MntFishProducts2
          +    -0.04697385312971 * GRP_MntFishProducts3
          +     0.05477300056491 * GRP_MntFishProducts4
          +    -0.21182877070793 * GRP_MntGoldProds2
          +    -0.06202001203906 * GRP_MntGoldProds3
          +    -0.23297283739715 * GRP_MntGoldProds4
          +    -0.27072080481215 * GRP_MntMeatProducts2
          +     -0.0879595975531 * GRP_MntMeatProducts3
          +     0.01711044358319 * GRP_MntMeatProducts4
          +     0.01568057691806 * GRP_MntWines2  +    -0.14454572309741 *
        GRP_MntWines3  +      0.1665968837033 * GRP_MntWines4
          +    -0.24980039994544 * GRP_NumCatalogPurchases3
          +    -0.00199030871063 * GRP_NumCatalogPurchases4
          +     0.11565917560156 * GRP_NumDistPurchases2
          +      0.1678532898895 * GRP_NumDistPurchases3
          +     -0.0338568889009 * GRP_NumDistPurchases4
          +     0.09970745707934 * GRP_NumWebPurchases2
          +     0.02961221360107 * GRP_NumWebPurchases3
          +     0.02261054892411 * GRP_NumWebPurchases4
          +     0.22891892518291 * GRP_RFMstat2  +     0.30720492174411 *
        GRP_RFMstat3  +     0.02558392907316 * GRP_RFMstat4
          +    -0.22752513596954 * GRP_RMntFrq2  +    -0.11010023712096 *
        GRP_RMntFrq3  +    -0.29294961809478 * GRP_RMntFrq4
          +     0.17323450297234 * GRP_Recency2  +    -0.02999008104866 *
        GRP_Recency3  +    -0.07522056103469 * GRP_Recency4 ;
   H12  = H12  +    -0.17475665685155 * GRP_AcceptedCmp52
          +     0.39850686717751 * GRP_Frq2  +     0.21273190324396 * GRP_Frq3
          +    -0.04292229763335 * GRP_Frq4  +     0.48189221687125 *
        GRP_Income2  +       0.757675062227 * GRP_Income3
          +    -0.31438345261512 * GRP_Income4  +     0.08884755999997 *
        GRP_Mnt2  +     0.02891204793625 * GRP_Mnt3  +    -0.11500381143203 *
        GRP_Mnt4  +     0.47755891441547 * GRP_MntFishProducts2
          +     0.26645530981311 * GRP_MntFishProducts3
          +    -0.17631072283513 * GRP_MntFishProducts4
          +    -0.35439521021691 * GRP_MntGoldProds2
          +     0.11419663880206 * GRP_MntGoldProds3
          +     0.07288749113866 * GRP_MntGoldProds4
          +    -0.52191822126159 * GRP_MntMeatProducts2
          +    -0.08421627788812 * GRP_MntMeatProducts3
          +    -0.15930642038763 * GRP_MntMeatProducts4
          +     0.17420985773045 * GRP_MntWines2  +     0.21257483876123 *
        GRP_MntWines3  +    -0.13198840161443 * GRP_MntWines4
          +    -0.24725403471973 * GRP_NumCatalogPurchases3
          +     0.28574938745998 * GRP_NumCatalogPurchases4
          +     -0.4878996299474 * GRP_NumDistPurchases2
          +     0.10139595392447 * GRP_NumDistPurchases3
          +     0.05251891244468 * GRP_NumDistPurchases4
          +    -0.18486003226007 * GRP_NumWebPurchases2
          +      0.0263831646971 * GRP_NumWebPurchases3
          +     0.26495059708503 * GRP_NumWebPurchases4
          +    -0.16580006605432 * GRP_RFMstat2  +    -0.12537703875848 *
        GRP_RFMstat3  +      -0.100652416931 * GRP_RFMstat4
          +    -0.00913931308958 * GRP_RMntFrq2  +    -0.15758837200974 *
        GRP_RMntFrq3  +     -0.1198225533702 * GRP_RMntFrq4
          +       1.075902392162 * GRP_Recency2  +     0.44926983542925 *
        GRP_Recency3  +     -0.4970729472837 * GRP_Recency4 ;
   H13  = H13  +     0.00215688122529 * GRP_AcceptedCmp52
          +    -0.01427589791379 * GRP_Frq2  +    -0.13098496868755 * GRP_Frq3
          +    -0.30502313457201 * GRP_Frq4  +    -0.37973462663051 *
        GRP_Income2  +     0.00732780844057 * GRP_Income3
          +     0.53278328894406 * GRP_Income4  +     0.29819966041309 *
        GRP_Mnt2  +     0.25349727466129 * GRP_Mnt3  +     0.10579488290769 *
        GRP_Mnt4  +    -0.09288921771048 * GRP_MntFishProducts2
          +     0.02714802509094 * GRP_MntFishProducts3
          +     0.27119078554613 * GRP_MntFishProducts4
          +     0.19322428614339 * GRP_MntGoldProds2
          +     0.34778546410632 * GRP_MntGoldProds3
          +    -0.06570146779096 * GRP_MntGoldProds4
          +     0.44935275650977 * GRP_MntMeatProducts2
          +     0.00805794344265 * GRP_MntMeatProducts3
          +     0.02445782833023 * GRP_MntMeatProducts4
          +    -0.12082391878766 * GRP_MntWines2  +    -0.28739181733976 *
        GRP_MntWines3  +    -0.12417307544408 * GRP_MntWines4
          +     0.33901531634752 * GRP_NumCatalogPurchases3
          +     -0.0519425405532 * GRP_NumCatalogPurchases4
          +     0.03481806823908 * GRP_NumDistPurchases2
          +      0.0546202479864 * GRP_NumDistPurchases3
          +    -0.05240296080421 * GRP_NumDistPurchases4
          +     0.28307550964921 * GRP_NumWebPurchases2
          +     0.31503543231591 * GRP_NumWebPurchases3
          +     0.24817135719308 * GRP_NumWebPurchases4
          +    -0.05017370187238 * GRP_RFMstat2  +     0.08161239885611 *
        GRP_RFMstat3  +    -0.14085507706312 * GRP_RFMstat4
          +     0.11738278568714 * GRP_RMntFrq2  +     0.28471680928269 *
        GRP_RMntFrq3  +     0.46590886050772 * GRP_RMntFrq4
          +     -0.2318556486679 * GRP_Recency2  +    -0.37508297533514 *
        GRP_Recency3  +     0.05823801065489 * GRP_Recency4 ;
   H14  = H14  +      0.4684617848987 * GRP_AcceptedCmp52
          +    -0.10078363733095 * GRP_Frq2  +     0.12187262992305 * GRP_Frq3
          +     0.06615581853287 * GRP_Frq4  +    -0.37438533196327 *
        GRP_Income2  +    -0.54951239852844 * GRP_Income3
          +     0.42517426076684 * GRP_Income4  +     0.01160451666213 *
        GRP_Mnt2  +    -0.19046851266656 * GRP_Mnt3  +    -0.22599863084471 *
        GRP_Mnt4  +     0.02252915755857 * GRP_MntFishProducts2
          +    -0.08997232581072 * GRP_MntFishProducts3
          +    -0.05669599356928 * GRP_MntFishProducts4
          +      0.2199150131909 * GRP_MntGoldProds2
          +     0.05584571259838 * GRP_MntGoldProds3
          +    -0.13160142309505 * GRP_MntGoldProds4
          +      0.2539849640816 * GRP_MntMeatProducts2
          +     0.29448191059312 * GRP_MntMeatProducts3
          +    -0.33946200154351 * GRP_MntMeatProducts4
          +    -0.47231816370111 * GRP_MntWines2  +    -0.35916844796743 *
        GRP_MntWines3  +     0.15578356288597 * GRP_MntWines4
          +     0.35913140014848 * GRP_NumCatalogPurchases3
          +    -0.07798422379681 * GRP_NumCatalogPurchases4
          +     0.38206153529506 * GRP_NumDistPurchases2
          +     0.08642998303162 * GRP_NumDistPurchases3
          +    -0.00375635377885 * GRP_NumDistPurchases4
          +    -0.04352529411419 * GRP_NumWebPurchases2
          +    -0.17285172586868 * GRP_NumWebPurchases3
          +     0.23030028338396 * GRP_NumWebPurchases4
          +     0.16194254582104 * GRP_RFMstat2  +    -0.03413270353062 *
        GRP_RFMstat3  +    -0.32516629559317 * GRP_RFMstat4
          +    -0.16070809362515 * GRP_RMntFrq2  +    -0.17716471899416 *
        GRP_RMntFrq3  +     0.09335047904411 * GRP_RMntFrq4
          +    -0.92875393407697 * GRP_Recency2  +     0.16068827585896 *
        GRP_Recency3  +     0.41807637211453 * GRP_Recency4 ;
   H15  = H15  +    -0.78481953865912 * GRP_AcceptedCmp52
          +     0.05211963408638 * GRP_Frq2  +     0.24938737986681 * GRP_Frq3
          +    -0.07347952562846 * GRP_Frq4  +    -0.15741135518664 *
        GRP_Income2  +     0.01909378686442 * GRP_Income3
          +    -0.15898085757789 * GRP_Income4  +     0.09202012507046 *
        GRP_Mnt2  +    -0.39641738573024 * GRP_Mnt3  +     0.02885484069701 *
        GRP_Mnt4  +     0.29554161293423 * GRP_MntFishProducts2
          +    -0.04439366722112 * GRP_MntFishProducts3
          +    -0.22939355735301 * GRP_MntFishProducts4
          +    -0.00367144103801 * GRP_MntGoldProds2
          +      -0.033315128385 * GRP_MntGoldProds3
          +     0.10655545066126 * GRP_MntGoldProds4
          +     0.04927093675686 * GRP_MntMeatProducts2
          +    -0.20156680946257 * GRP_MntMeatProducts3
          +     0.29394273234417 * GRP_MntMeatProducts4
          +     0.27324472738231 * GRP_MntWines2  +       0.398830803883 *
        GRP_MntWines3  +    -0.16588038849208 * GRP_MntWines4
          +     -0.3438340194477 * GRP_NumCatalogPurchases3
          +    -0.37438590488645 * GRP_NumCatalogPurchases4
          +    -0.42285816542086 * GRP_NumDistPurchases2
          +     -0.1008716650505 * GRP_NumDistPurchases3
          +    -0.42793112700917 * GRP_NumDistPurchases4
          +    -0.06792665579186 * GRP_NumWebPurchases2
          +     0.37113277513001 * GRP_NumWebPurchases3
          +     0.05720653023952 * GRP_NumWebPurchases4
          +    -0.30997814005221 * GRP_RFMstat2  +     0.06219993861842 *
        GRP_RFMstat3  +    -0.22600753085668 * GRP_RFMstat4
          +    -0.31041957734532 * GRP_RMntFrq2  +     0.25053172234721 *
        GRP_RMntFrq3  +     0.15983683107051 * GRP_RMntFrq4
          +     0.52797823019932 * GRP_Recency2  +     0.11382874879823 *
        GRP_Recency3  +    -0.22166533511817 * GRP_Recency4 ;
   H16  = H16  +      0.7107136456569 * GRP_AcceptedCmp52
          +     -0.4751898387651 * GRP_Frq2  +    -0.11277060686411 * GRP_Frq3
          +     0.15821547082299 * GRP_Frq4  +    -0.45945049231995 *
        GRP_Income2  +    -0.18413512635176 * GRP_Income3
          +     0.39594738835509 * GRP_Income4  +    -0.15472205523822 *
        GRP_Mnt2  +     0.02844181224363 * GRP_Mnt3  +     0.45435843401555 *
        GRP_Mnt4  +    -0.29220588593813 * GRP_MntFishProducts2
          +     0.04340555393469 * GRP_MntFishProducts3
          +    -0.20048219926361 * GRP_MntFishProducts4
          +     0.16101452165456 * GRP_MntGoldProds2
          +    -0.04467647211336 * GRP_MntGoldProds3
          +     0.32142013598241 * GRP_MntGoldProds4
          +     0.29741565154233 * GRP_MntMeatProducts2
          +    -0.00264678222241 * GRP_MntMeatProducts3
          +    -0.11596499325048 * GRP_MntMeatProducts4
          +    -0.29849043995136 * GRP_MntWines2  +     0.14756452272338 *
        GRP_MntWines3  +     0.48995265672675 * GRP_MntWines4
          +     0.80854583627117 * GRP_NumCatalogPurchases3
          +     0.14001888431357 * GRP_NumCatalogPurchases4
          +     0.36107050137299 * GRP_NumDistPurchases2
          +    -0.10375572120121 * GRP_NumDistPurchases3
          +     0.10557004956787 * GRP_NumDistPurchases4
          +     0.04608069099876 * GRP_NumWebPurchases2
          +     0.15561947954396 * GRP_NumWebPurchases3
          +    -0.01081470092004 * GRP_NumWebPurchases4
          +     0.21994454623245 * GRP_RFMstat2  +    -0.08858421895818 *
        GRP_RFMstat3  +    -0.13608887793525 * GRP_RFMstat4
          +     0.07482010458977 * GRP_RMntFrq2  +    -0.11874760292742 *
        GRP_RMntFrq3  +     0.56887215594366 * GRP_RMntFrq4
          +    -0.13548983954455 * GRP_Recency2  +    -0.25036935235639 *
        GRP_Recency3  +     -0.0282277663071 * GRP_Recency4 ;
   H17  = H17  +    -0.06745892596619 * GRP_AcceptedCmp52
          +    -0.09506194345469 * GRP_Frq2  +    -0.29707644715885 * GRP_Frq3
          +    -0.06874693052001 * GRP_Frq4  +    -0.08949373241741 *
        GRP_Income2  +     0.02965579603049 * GRP_Income3
          +    -0.02192829727213 * GRP_Income4  +     0.30180973300088 *
        GRP_Mnt2  +    -0.10648502526616 * GRP_Mnt3  +     0.07588844839465 *
        GRP_Mnt4  +    -0.30524623655199 * GRP_MntFishProducts2
          +    -0.20032703571491 * GRP_MntFishProducts3
          +    -0.08348811352746 * GRP_MntFishProducts4
          +    -0.00744131870881 * GRP_MntGoldProds2
          +    -0.27347309859096 * GRP_MntGoldProds3
          +    -0.04458870469416 * GRP_MntGoldProds4
          +     0.17538261434498 * GRP_MntMeatProducts2
          +    -0.08059547298843 * GRP_MntMeatProducts3
          +     0.03113249898233 * GRP_MntMeatProducts4
          +    -0.23690909413276 * GRP_MntWines2  +    -0.01511980231776 *
        GRP_MntWines3  +     -0.2825327824317 * GRP_MntWines4
          +     0.13919784888607 * GRP_NumCatalogPurchases3
          +    -0.10871281978714 * GRP_NumCatalogPurchases4
          +     0.20540014620209 * GRP_NumDistPurchases2
          +     0.17744784873298 * GRP_NumDistPurchases3
          +      -0.003486430833 * GRP_NumDistPurchases4
          +    -0.04863967797645 * GRP_NumWebPurchases2
          +     0.07245829152192 * GRP_NumWebPurchases3
          +    -0.27395606297099 * GRP_NumWebPurchases4
          +    -0.14496279180087 * GRP_RFMstat2  +     0.28224463929838 *
        GRP_RFMstat3  +     0.26720059295202 * GRP_RFMstat4
          +    -0.07120881723264 * GRP_RMntFrq2  +     0.16350065828319 *
        GRP_RMntFrq3  +      0.3117297070285 * GRP_RMntFrq4
          +    -0.52884474877094 * GRP_Recency2  +    -0.17937099376746 *
        GRP_Recency3  +     -0.0157357289132 * GRP_Recency4 ;
   H11  =    -0.76467628027618 + H11 ;
   H12  =    -0.03405517571825 + H12 ;
   H13  =    -0.32845676351839 + H13 ;
   H14  =     0.08379615404181 + H14 ;
   H15  =    -0.77228291932436 + H15 ;
   H16  =    -0.77356855332279 + H16 ;
   H17  =     0.45067845230796 + H17 ;
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
   P_DepVar1  =    -0.15999450347654 * H11  +     1.35667407296837 * H12
          +    -0.71419530867579 * H13  +     -1.0947746264744 * H14
          +     0.98315214007209 * H15  +    -1.32163386678746 * H16
          +    -0.29329090231091 * H17 ;
   P_DepVar1  =    -1.66210022161101 + P_DepVar1 ;
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
drop
H11
H12
H13
H14
H15
H16
H17
;
drop S_:;
