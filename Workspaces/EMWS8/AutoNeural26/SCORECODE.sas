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

      label GRP_AcceptedCmpTotal3 = 'Dummy: GRP_AcceptedCmpTotal=3' ;

      label GRP_Frq2 = 'Dummy: GRP_Frq=2' ;

      label GRP_Frq3 = 'Dummy: GRP_Frq=3' ;

      label GRP_Frq4 = 'Dummy: GRP_Frq=4' ;

      label GRP_Frq5 = 'Dummy: GRP_Frq=5' ;

      label GRP_Frq6 = 'Dummy: GRP_Frq=6' ;

      label GRP_Frq7 = 'Dummy: GRP_Frq=7' ;

      label GRP_Frq8 = 'Dummy: GRP_Frq=8' ;

      label GRP_Frq9 = 'Dummy: GRP_Frq=9' ;

      label GRP_Frq10 = 'Dummy: GRP_Frq=10' ;

      label GRP_Income2 = 'Dummy: GRP_Income=2' ;

      label GRP_Income3 = 'Dummy: GRP_Income=3' ;

      label GRP_Income4 = 'Dummy: GRP_Income=4' ;

      label GRP_Income5 = 'Dummy: GRP_Income=5' ;

      label GRP_Income6 = 'Dummy: GRP_Income=6' ;

      label GRP_Income7 = 'Dummy: GRP_Income=7' ;

      label GRP_Income8 = 'Dummy: GRP_Income=8' ;

      label GRP_Income9 = 'Dummy: GRP_Income=9' ;

      label GRP_Income10 = 'Dummy: GRP_Income=10' ;

      label GRP_Mnt2 = 'Dummy: GRP_Mnt=2' ;

      label GRP_Mnt3 = 'Dummy: GRP_Mnt=3' ;

      label GRP_Mnt4 = 'Dummy: GRP_Mnt=4' ;

      label GRP_Mnt5 = 'Dummy: GRP_Mnt=5' ;

      label GRP_Mnt6 = 'Dummy: GRP_Mnt=6' ;

      label GRP_Mnt7 = 'Dummy: GRP_Mnt=7' ;

      label GRP_Mnt8 = 'Dummy: GRP_Mnt=8' ;

      label GRP_Mnt9 = 'Dummy: GRP_Mnt=9' ;

      label GRP_Mnt10 = 'Dummy: GRP_Mnt=10' ;

      label GRP_MntFishProducts3 = 'Dummy: GRP_MntFishProducts=3' ;

      label GRP_MntFishProducts4 = 'Dummy: GRP_MntFishProducts=4' ;

      label GRP_MntFishProducts5 = 'Dummy: GRP_MntFishProducts=5' ;

      label GRP_MntFishProducts6 = 'Dummy: GRP_MntFishProducts=6' ;

      label GRP_MntFishProducts7 = 'Dummy: GRP_MntFishProducts=7' ;

      label GRP_MntFishProducts8 = 'Dummy: GRP_MntFishProducts=8' ;

      label GRP_MntFishProducts9 = 'Dummy: GRP_MntFishProducts=9' ;

      label GRP_MntFishProducts10 = 'Dummy: GRP_MntFishProducts=10' ;

      label GRP_MntGoldProds2 = 'Dummy: GRP_MntGoldProds=2' ;

      label GRP_MntGoldProds3 = 'Dummy: GRP_MntGoldProds=3' ;

      label GRP_MntGoldProds4 = 'Dummy: GRP_MntGoldProds=4' ;

      label GRP_MntGoldProds5 = 'Dummy: GRP_MntGoldProds=5' ;

      label GRP_MntGoldProds6 = 'Dummy: GRP_MntGoldProds=6' ;

      label GRP_MntGoldProds7 = 'Dummy: GRP_MntGoldProds=7' ;

      label GRP_MntGoldProds8 = 'Dummy: GRP_MntGoldProds=8' ;

      label GRP_MntGoldProds9 = 'Dummy: GRP_MntGoldProds=9' ;

      label GRP_MntGoldProds10 = 'Dummy: GRP_MntGoldProds=10' ;

      label GRP_MntMeatProducts2 = 'Dummy: GRP_MntMeatProducts=2' ;

      label GRP_MntMeatProducts3 = 'Dummy: GRP_MntMeatProducts=3' ;

      label GRP_MntMeatProducts4 = 'Dummy: GRP_MntMeatProducts=4' ;

      label GRP_MntMeatProducts5 = 'Dummy: GRP_MntMeatProducts=5' ;

      label GRP_MntMeatProducts6 = 'Dummy: GRP_MntMeatProducts=6' ;

      label GRP_MntMeatProducts7 = 'Dummy: GRP_MntMeatProducts=7' ;

      label GRP_MntMeatProducts8 = 'Dummy: GRP_MntMeatProducts=8' ;

      label GRP_MntMeatProducts9 = 'Dummy: GRP_MntMeatProducts=9' ;

      label GRP_MntMeatProducts10 = 'Dummy: GRP_MntMeatProducts=10' ;

      label GRP_MntSweetProducts3 = 'Dummy: GRP_MntSweetProducts=3' ;

      label GRP_MntSweetProducts4 = 'Dummy: GRP_MntSweetProducts=4' ;

      label GRP_MntSweetProducts5 = 'Dummy: GRP_MntSweetProducts=5' ;

      label GRP_MntSweetProducts6 = 'Dummy: GRP_MntSweetProducts=6' ;

      label GRP_MntSweetProducts7 = 'Dummy: GRP_MntSweetProducts=7' ;

      label GRP_MntSweetProducts8 = 'Dummy: GRP_MntSweetProducts=8' ;

      label GRP_MntSweetProducts9 = 'Dummy: GRP_MntSweetProducts=9' ;

      label GRP_MntSweetProducts10 = 'Dummy: GRP_MntSweetProducts=10' ;

      label GRP_MntWines2 = 'Dummy: GRP_MntWines=2' ;

      label GRP_MntWines3 = 'Dummy: GRP_MntWines=3' ;

      label GRP_MntWines4 = 'Dummy: GRP_MntWines=4' ;

      label GRP_MntWines5 = 'Dummy: GRP_MntWines=5' ;

      label GRP_MntWines6 = 'Dummy: GRP_MntWines=6' ;

      label GRP_MntWines7 = 'Dummy: GRP_MntWines=7' ;

      label GRP_MntWines8 = 'Dummy: GRP_MntWines=8' ;

      label GRP_MntWines9 = 'Dummy: GRP_MntWines=9' ;

      label GRP_MntWines10 = 'Dummy: GRP_MntWines=10' ;

      label GRP_NumCatalogPurchases3 = 'Dummy: GRP_NumCatalogPurchases=3' ;

      label GRP_NumCatalogPurchases4 = 'Dummy: GRP_NumCatalogPurchases=4' ;

      label GRP_NumCatalogPurchases5 = 'Dummy: GRP_NumCatalogPurchases=5' ;

      label GRP_NumCatalogPurchases6 = 'Dummy: GRP_NumCatalogPurchases=6' ;

      label GRP_NumCatalogPurchases7 = 'Dummy: GRP_NumCatalogPurchases=7' ;

      label GRP_NumDistPurchases2 = 'Dummy: GRP_NumDistPurchases=2' ;

      label GRP_NumDistPurchases3 = 'Dummy: GRP_NumDistPurchases=3' ;

      label GRP_NumDistPurchases4 = 'Dummy: GRP_NumDistPurchases=4' ;

      label GRP_NumDistPurchases5 = 'Dummy: GRP_NumDistPurchases=5' ;

      label GRP_NumDistPurchases6 = 'Dummy: GRP_NumDistPurchases=6' ;

      label GRP_NumDistPurchases7 = 'Dummy: GRP_NumDistPurchases=7' ;

      label GRP_NumDistPurchases8 = 'Dummy: GRP_NumDistPurchases=8' ;

      label GRP_NumDistPurchases9 = 'Dummy: GRP_NumDistPurchases=9' ;

      label GRP_NumDistPurchases10 = 'Dummy: GRP_NumDistPurchases=10' ;

      label GRP_NumWebPurchases2 = 'Dummy: GRP_NumWebPurchases=2' ;

      label GRP_NumWebPurchases3 = 'Dummy: GRP_NumWebPurchases=3' ;

      label GRP_NumWebPurchases4 = 'Dummy: GRP_NumWebPurchases=4' ;

      label GRP_NumWebPurchases5 = 'Dummy: GRP_NumWebPurchases=5' ;

      label GRP_NumWebPurchases6 = 'Dummy: GRP_NumWebPurchases=6' ;

      label GRP_NumWebPurchases7 = 'Dummy: GRP_NumWebPurchases=7' ;

      label GRP_NumWebPurchases8 = 'Dummy: GRP_NumWebPurchases=8' ;

      label GRP_NumWebVisitsMonth2 = 'Dummy: GRP_NumWebVisitsMonth=2' ;

      label GRP_NumWebVisitsMonth3 = 'Dummy: GRP_NumWebVisitsMonth=3' ;

      label GRP_NumWebVisitsMonth4 = 'Dummy: GRP_NumWebVisitsMonth=4' ;

      label GRP_NumWebVisitsMonth5 = 'Dummy: GRP_NumWebVisitsMonth=5' ;

      label GRP_NumWebVisitsMonth6 = 'Dummy: GRP_NumWebVisitsMonth=6' ;

      label GRP_NumWebVisitsMonth7 = 'Dummy: GRP_NumWebVisitsMonth=7' ;

      label GRP_NumWebVisitsMonth8 = 'Dummy: GRP_NumWebVisitsMonth=8' ;

      label GRP_RFMstat2 = 'Dummy: GRP_RFMstat=2' ;

      label GRP_RFMstat3 = 'Dummy: GRP_RFMstat=3' ;

      label GRP_RFMstat4 = 'Dummy: GRP_RFMstat=4' ;

      label GRP_RFMstat5 = 'Dummy: GRP_RFMstat=5' ;

      label GRP_RFMstat6 = 'Dummy: GRP_RFMstat=6' ;

      label GRP_RFMstat7 = 'Dummy: GRP_RFMstat=7' ;

      label GRP_RFMstat8 = 'Dummy: GRP_RFMstat=8' ;

      label GRP_RFMstat9 = 'Dummy: GRP_RFMstat=9' ;

      label GRP_RFMstat10 = 'Dummy: GRP_RFMstat=10' ;

      label GRP_RMntFrq2 = 'Dummy: GRP_RMntFrq=2' ;

      label GRP_RMntFrq3 = 'Dummy: GRP_RMntFrq=3' ;

      label GRP_RMntFrq4 = 'Dummy: GRP_RMntFrq=4' ;

      label GRP_RMntFrq5 = 'Dummy: GRP_RMntFrq=5' ;

      label GRP_RMntFrq6 = 'Dummy: GRP_RMntFrq=6' ;

      label GRP_RMntFrq7 = 'Dummy: GRP_RMntFrq=7' ;

      label GRP_RMntFrq8 = 'Dummy: GRP_RMntFrq=8' ;

      label GRP_RMntFrq9 = 'Dummy: GRP_RMntFrq=9' ;

      label GRP_RMntFrq10 = 'Dummy: GRP_RMntFrq=10' ;

      label GRP_Recency2 = 'Dummy: GRP_Recency=2' ;

      label GRP_Recency3 = 'Dummy: GRP_Recency=3' ;

      label GRP_Recency4 = 'Dummy: GRP_Recency=4' ;

      label GRP_Recency5 = 'Dummy: GRP_Recency=5' ;

      label GRP_Recency6 = 'Dummy: GRP_Recency=6' ;

      label GRP_Recency7 = 'Dummy: GRP_Recency=7' ;

      label GRP_Recency8 = 'Dummy: GRP_Recency=8' ;

      label GRP_Recency9 = 'Dummy: GRP_Recency=9' ;

      label GRP_Recency10 = 'Dummy: GRP_Recency=10' ;

      label H1x1_1 = 'Hidden: H1x1_=1' ;

      label H1x1_2 = 'Hidden: H1x1_=2' ;

      label H1x1_3 = 'Hidden: H1x1_=3' ;

      label H1x1_4 = 'Hidden: H1x1_=4' ;

      label H1x2_1 = 'Hidden: H1x2_=1' ;

      label H1x2_2 = 'Hidden: H1x2_=2' ;

      label H1x2_3 = 'Hidden: H1x2_=3' ;

      label H1x2_4 = 'Hidden: H1x2_=4' ;

      label H2x1_1 = 'Hidden: H2x1_=1' ;

      label H2x1_2 = 'Hidden: H2x1_=2' ;

      label H2x1_3 = 'Hidden: H2x1_=3' ;

      label H2x1_4 = 'Hidden: H2x1_=4' ;

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

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop GRP_AcceptedCmpTotal3 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   GRP_AcceptedCmpTotal3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_AcceptedCmpTotal3 = 1;
   end;
   else if _dm12 = '4'  then do;
      GRP_AcceptedCmpTotal3 = -1;
   end;
   else do;
      GRP_AcceptedCmpTotal3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop GRP_Frq2 GRP_Frq3 GRP_Frq4 GRP_Frq5 GRP_Frq6 GRP_Frq7 GRP_Frq8 GRP_Frq9 
        GRP_Frq10 ;
*** encoding is sparse, initialize to zero;
GRP_Frq2 = 0;
GRP_Frq3 = 0;
GRP_Frq4 = 0;
GRP_Frq5 = 0;
GRP_Frq6 = 0;
GRP_Frq7 = 0;
GRP_Frq8 = 0;
GRP_Frq9 = 0;
GRP_Frq10 = 0;
if missing( GRP_Frq ) then do;
   GRP_Frq2 = .;
   GRP_Frq3 = .;
   GRP_Frq4 = .;
   GRP_Frq5 = .;
   GRP_Frq6 = .;
   GRP_Frq7 = .;
   GRP_Frq8 = .;
   GRP_Frq9 = .;
   GRP_Frq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Frq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Frq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Frq2 = -1;
                  GRP_Frq3 = -1;
                  GRP_Frq4 = -1;
                  GRP_Frq5 = -1;
                  GRP_Frq6 = -1;
                  GRP_Frq7 = -1;
                  GRP_Frq8 = -1;
                  GRP_Frq9 = -1;
                  GRP_Frq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Frq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Frq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Frq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Frq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Frq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Frq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Frq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Frq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Frq2 = .;
      GRP_Frq3 = .;
      GRP_Frq4 = .;
      GRP_Frq5 = .;
      GRP_Frq6 = .;
      GRP_Frq7 = .;
      GRP_Frq8 = .;
      GRP_Frq9 = .;
      GRP_Frq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop GRP_Income2 GRP_Income3 GRP_Income4 GRP_Income5 GRP_Income6 GRP_Income7 
        GRP_Income8 GRP_Income9 GRP_Income10 ;
*** encoding is sparse, initialize to zero;
GRP_Income2 = 0;
GRP_Income3 = 0;
GRP_Income4 = 0;
GRP_Income5 = 0;
GRP_Income6 = 0;
GRP_Income7 = 0;
GRP_Income8 = 0;
GRP_Income9 = 0;
GRP_Income10 = 0;
if missing( GRP_Income ) then do;
   GRP_Income2 = .;
   GRP_Income3 = .;
   GRP_Income4 = .;
   GRP_Income5 = .;
   GRP_Income6 = .;
   GRP_Income7 = .;
   GRP_Income8 = .;
   GRP_Income9 = .;
   GRP_Income10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Income , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Income10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Income2 = -1;
                  GRP_Income3 = -1;
                  GRP_Income4 = -1;
                  GRP_Income5 = -1;
                  GRP_Income6 = -1;
                  GRP_Income7 = -1;
                  GRP_Income8 = -1;
                  GRP_Income9 = -1;
                  GRP_Income10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Income2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Income3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Income4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Income5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Income6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Income7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Income8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Income9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Income2 = .;
      GRP_Income3 = .;
      GRP_Income4 = .;
      GRP_Income5 = .;
      GRP_Income6 = .;
      GRP_Income7 = .;
      GRP_Income8 = .;
      GRP_Income9 = .;
      GRP_Income10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Mnt ;
drop GRP_Mnt2 GRP_Mnt3 GRP_Mnt4 GRP_Mnt5 GRP_Mnt6 GRP_Mnt7 GRP_Mnt8 GRP_Mnt9 
        GRP_Mnt10 ;
*** encoding is sparse, initialize to zero;
GRP_Mnt2 = 0;
GRP_Mnt3 = 0;
GRP_Mnt4 = 0;
GRP_Mnt5 = 0;
GRP_Mnt6 = 0;
GRP_Mnt7 = 0;
GRP_Mnt8 = 0;
GRP_Mnt9 = 0;
GRP_Mnt10 = 0;
if missing( GRP_Mnt ) then do;
   GRP_Mnt2 = .;
   GRP_Mnt3 = .;
   GRP_Mnt4 = .;
   GRP_Mnt5 = .;
   GRP_Mnt6 = .;
   GRP_Mnt7 = .;
   GRP_Mnt8 = .;
   GRP_Mnt9 = .;
   GRP_Mnt10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Mnt , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Mnt10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Mnt2 = -1;
                  GRP_Mnt3 = -1;
                  GRP_Mnt4 = -1;
                  GRP_Mnt5 = -1;
                  GRP_Mnt6 = -1;
                  GRP_Mnt7 = -1;
                  GRP_Mnt8 = -1;
                  GRP_Mnt9 = -1;
                  GRP_Mnt10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Mnt2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Mnt3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Mnt4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Mnt5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Mnt6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Mnt7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Mnt8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Mnt9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Mnt2 = .;
      GRP_Mnt3 = .;
      GRP_Mnt4 = .;
      GRP_Mnt5 = .;
      GRP_Mnt6 = .;
      GRP_Mnt7 = .;
      GRP_Mnt8 = .;
      GRP_Mnt9 = .;
      GRP_Mnt10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop GRP_MntFishProducts3 GRP_MntFishProducts4 GRP_MntFishProducts5 
        GRP_MntFishProducts6 GRP_MntFishProducts7 GRP_MntFishProducts8 
        GRP_MntFishProducts9 GRP_MntFishProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntFishProducts3 = 0;
GRP_MntFishProducts4 = 0;
GRP_MntFishProducts5 = 0;
GRP_MntFishProducts6 = 0;
GRP_MntFishProducts7 = 0;
GRP_MntFishProducts8 = 0;
GRP_MntFishProducts9 = 0;
GRP_MntFishProducts10 = 0;
if missing( GRP_MntFishProducts ) then do;
   GRP_MntFishProducts3 = .;
   GRP_MntFishProducts4 = .;
   GRP_MntFishProducts5 = .;
   GRP_MntFishProducts6 = .;
   GRP_MntFishProducts7 = .;
   GRP_MntFishProducts8 = .;
   GRP_MntFishProducts9 = .;
   GRP_MntFishProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntFishProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntFishProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntFishProducts3 = -1;
                  GRP_MntFishProducts4 = -1;
                  GRP_MntFishProducts5 = -1;
                  GRP_MntFishProducts6 = -1;
                  GRP_MntFishProducts7 = -1;
                  GRP_MntFishProducts8 = -1;
                  GRP_MntFishProducts9 = -1;
                  GRP_MntFishProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntFishProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntFishProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntFishProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntFishProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntFishProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntFishProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntFishProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntFishProducts3 = .;
      GRP_MntFishProducts4 = .;
      GRP_MntFishProducts5 = .;
      GRP_MntFishProducts6 = .;
      GRP_MntFishProducts7 = .;
      GRP_MntFishProducts8 = .;
      GRP_MntFishProducts9 = .;
      GRP_MntFishProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntGoldProds ;
drop GRP_MntGoldProds2 GRP_MntGoldProds3 GRP_MntGoldProds4 GRP_MntGoldProds5 
        GRP_MntGoldProds6 GRP_MntGoldProds7 GRP_MntGoldProds8 
        GRP_MntGoldProds9 GRP_MntGoldProds10 ;
*** encoding is sparse, initialize to zero;
GRP_MntGoldProds2 = 0;
GRP_MntGoldProds3 = 0;
GRP_MntGoldProds4 = 0;
GRP_MntGoldProds5 = 0;
GRP_MntGoldProds6 = 0;
GRP_MntGoldProds7 = 0;
GRP_MntGoldProds8 = 0;
GRP_MntGoldProds9 = 0;
GRP_MntGoldProds10 = 0;
if missing( GRP_MntGoldProds ) then do;
   GRP_MntGoldProds2 = .;
   GRP_MntGoldProds3 = .;
   GRP_MntGoldProds4 = .;
   GRP_MntGoldProds5 = .;
   GRP_MntGoldProds6 = .;
   GRP_MntGoldProds7 = .;
   GRP_MntGoldProds8 = .;
   GRP_MntGoldProds9 = .;
   GRP_MntGoldProds10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntGoldProds , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntGoldProds10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntGoldProds2 = -1;
                  GRP_MntGoldProds3 = -1;
                  GRP_MntGoldProds4 = -1;
                  GRP_MntGoldProds5 = -1;
                  GRP_MntGoldProds6 = -1;
                  GRP_MntGoldProds7 = -1;
                  GRP_MntGoldProds8 = -1;
                  GRP_MntGoldProds9 = -1;
                  GRP_MntGoldProds10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntGoldProds2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntGoldProds3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntGoldProds4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntGoldProds5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntGoldProds6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntGoldProds7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntGoldProds8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntGoldProds9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntGoldProds2 = .;
      GRP_MntGoldProds3 = .;
      GRP_MntGoldProds4 = .;
      GRP_MntGoldProds5 = .;
      GRP_MntGoldProds6 = .;
      GRP_MntGoldProds7 = .;
      GRP_MntGoldProds8 = .;
      GRP_MntGoldProds9 = .;
      GRP_MntGoldProds10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop GRP_MntMeatProducts2 GRP_MntMeatProducts3 GRP_MntMeatProducts4 
        GRP_MntMeatProducts5 GRP_MntMeatProducts6 GRP_MntMeatProducts7 
        GRP_MntMeatProducts8 GRP_MntMeatProducts9 GRP_MntMeatProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntMeatProducts2 = 0;
GRP_MntMeatProducts3 = 0;
GRP_MntMeatProducts4 = 0;
GRP_MntMeatProducts5 = 0;
GRP_MntMeatProducts6 = 0;
GRP_MntMeatProducts7 = 0;
GRP_MntMeatProducts8 = 0;
GRP_MntMeatProducts9 = 0;
GRP_MntMeatProducts10 = 0;
if missing( GRP_MntMeatProducts ) then do;
   GRP_MntMeatProducts2 = .;
   GRP_MntMeatProducts3 = .;
   GRP_MntMeatProducts4 = .;
   GRP_MntMeatProducts5 = .;
   GRP_MntMeatProducts6 = .;
   GRP_MntMeatProducts7 = .;
   GRP_MntMeatProducts8 = .;
   GRP_MntMeatProducts9 = .;
   GRP_MntMeatProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntMeatProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntMeatProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntMeatProducts2 = -1;
                  GRP_MntMeatProducts3 = -1;
                  GRP_MntMeatProducts4 = -1;
                  GRP_MntMeatProducts5 = -1;
                  GRP_MntMeatProducts6 = -1;
                  GRP_MntMeatProducts7 = -1;
                  GRP_MntMeatProducts8 = -1;
                  GRP_MntMeatProducts9 = -1;
                  GRP_MntMeatProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntMeatProducts2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntMeatProducts3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntMeatProducts4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntMeatProducts5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntMeatProducts6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntMeatProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntMeatProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntMeatProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntMeatProducts2 = .;
      GRP_MntMeatProducts3 = .;
      GRP_MntMeatProducts4 = .;
      GRP_MntMeatProducts5 = .;
      GRP_MntMeatProducts6 = .;
      GRP_MntMeatProducts7 = .;
      GRP_MntMeatProducts8 = .;
      GRP_MntMeatProducts9 = .;
      GRP_MntMeatProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop GRP_MntSweetProducts3 GRP_MntSweetProducts4 GRP_MntSweetProducts5 
        GRP_MntSweetProducts6 GRP_MntSweetProducts7 GRP_MntSweetProducts8 
        GRP_MntSweetProducts9 GRP_MntSweetProducts10 ;
*** encoding is sparse, initialize to zero;
GRP_MntSweetProducts3 = 0;
GRP_MntSweetProducts4 = 0;
GRP_MntSweetProducts5 = 0;
GRP_MntSweetProducts6 = 0;
GRP_MntSweetProducts7 = 0;
GRP_MntSweetProducts8 = 0;
GRP_MntSweetProducts9 = 0;
GRP_MntSweetProducts10 = 0;
if missing( GRP_MntSweetProducts ) then do;
   GRP_MntSweetProducts3 = .;
   GRP_MntSweetProducts4 = .;
   GRP_MntSweetProducts5 = .;
   GRP_MntSweetProducts6 = .;
   GRP_MntSweetProducts7 = .;
   GRP_MntSweetProducts8 = .;
   GRP_MntSweetProducts9 = .;
   GRP_MntSweetProducts10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntSweetProducts , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntSweetProducts10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntSweetProducts3 = -1;
                  GRP_MntSweetProducts4 = -1;
                  GRP_MntSweetProducts5 = -1;
                  GRP_MntSweetProducts6 = -1;
                  GRP_MntSweetProducts7 = -1;
                  GRP_MntSweetProducts8 = -1;
                  GRP_MntSweetProducts9 = -1;
                  GRP_MntSweetProducts10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_MntSweetProducts3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_MntSweetProducts4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_MntSweetProducts5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_MntSweetProducts6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntSweetProducts7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntSweetProducts8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntSweetProducts9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntSweetProducts3 = .;
      GRP_MntSweetProducts4 = .;
      GRP_MntSweetProducts5 = .;
      GRP_MntSweetProducts6 = .;
      GRP_MntSweetProducts7 = .;
      GRP_MntSweetProducts8 = .;
      GRP_MntSweetProducts9 = .;
      GRP_MntSweetProducts10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop GRP_MntWines2 GRP_MntWines3 GRP_MntWines4 GRP_MntWines5 GRP_MntWines6 
        GRP_MntWines7 GRP_MntWines8 GRP_MntWines9 GRP_MntWines10 ;
*** encoding is sparse, initialize to zero;
GRP_MntWines2 = 0;
GRP_MntWines3 = 0;
GRP_MntWines4 = 0;
GRP_MntWines5 = 0;
GRP_MntWines6 = 0;
GRP_MntWines7 = 0;
GRP_MntWines8 = 0;
GRP_MntWines9 = 0;
GRP_MntWines10 = 0;
if missing( GRP_MntWines ) then do;
   GRP_MntWines2 = .;
   GRP_MntWines3 = .;
   GRP_MntWines4 = .;
   GRP_MntWines5 = .;
   GRP_MntWines6 = .;
   GRP_MntWines7 = .;
   GRP_MntWines8 = .;
   GRP_MntWines9 = .;
   GRP_MntWines10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_MntWines , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_MntWines10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_MntWines2 = -1;
                  GRP_MntWines3 = -1;
                  GRP_MntWines4 = -1;
                  GRP_MntWines5 = -1;
                  GRP_MntWines6 = -1;
                  GRP_MntWines7 = -1;
                  GRP_MntWines8 = -1;
                  GRP_MntWines9 = -1;
                  GRP_MntWines10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_MntWines2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_MntWines3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_MntWines4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_MntWines5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_MntWines6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_MntWines7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_MntWines8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_MntWines9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_MntWines2 = .;
      GRP_MntWines3 = .;
      GRP_MntWines4 = .;
      GRP_MntWines5 = .;
      GRP_MntWines6 = .;
      GRP_MntWines7 = .;
      GRP_MntWines8 = .;
      GRP_MntWines9 = .;
      GRP_MntWines10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop GRP_NumCatalogPurchases3 GRP_NumCatalogPurchases4 
        GRP_NumCatalogPurchases5 GRP_NumCatalogPurchases6 
        GRP_NumCatalogPurchases7 ;
*** encoding is sparse, initialize to zero;
GRP_NumCatalogPurchases3 = 0;
GRP_NumCatalogPurchases4 = 0;
GRP_NumCatalogPurchases5 = 0;
GRP_NumCatalogPurchases6 = 0;
GRP_NumCatalogPurchases7 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   GRP_NumCatalogPurchases3 = .;
   GRP_NumCatalogPurchases4 = .;
   GRP_NumCatalogPurchases5 = .;
   GRP_NumCatalogPurchases6 = .;
   GRP_NumCatalogPurchases7 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumCatalogPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '4'  then do;
         if _dm12 = '3'  then do;
            GRP_NumCatalogPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumCatalogPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_NumCatalogPurchases5 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumCatalogPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumCatalogPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumCatalogPurchases3 = -1;
            GRP_NumCatalogPurchases4 = -1;
            GRP_NumCatalogPurchases5 = -1;
            GRP_NumCatalogPurchases6 = -1;
            GRP_NumCatalogPurchases7 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumCatalogPurchases3 = .;
      GRP_NumCatalogPurchases4 = .;
      GRP_NumCatalogPurchases5 = .;
      GRP_NumCatalogPurchases6 = .;
      GRP_NumCatalogPurchases7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumDistPurchases ;
drop GRP_NumDistPurchases2 GRP_NumDistPurchases3 GRP_NumDistPurchases4 
        GRP_NumDistPurchases5 GRP_NumDistPurchases6 GRP_NumDistPurchases7 
        GRP_NumDistPurchases8 GRP_NumDistPurchases9 GRP_NumDistPurchases10 ;
*** encoding is sparse, initialize to zero;
GRP_NumDistPurchases2 = 0;
GRP_NumDistPurchases3 = 0;
GRP_NumDistPurchases4 = 0;
GRP_NumDistPurchases5 = 0;
GRP_NumDistPurchases6 = 0;
GRP_NumDistPurchases7 = 0;
GRP_NumDistPurchases8 = 0;
GRP_NumDistPurchases9 = 0;
GRP_NumDistPurchases10 = 0;
if missing( GRP_NumDistPurchases ) then do;
   GRP_NumDistPurchases2 = .;
   GRP_NumDistPurchases3 = .;
   GRP_NumDistPurchases4 = .;
   GRP_NumDistPurchases5 = .;
   GRP_NumDistPurchases6 = .;
   GRP_NumDistPurchases7 = .;
   GRP_NumDistPurchases8 = .;
   GRP_NumDistPurchases9 = .;
   GRP_NumDistPurchases10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumDistPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_NumDistPurchases10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_NumDistPurchases2 = -1;
                  GRP_NumDistPurchases3 = -1;
                  GRP_NumDistPurchases4 = -1;
                  GRP_NumDistPurchases5 = -1;
                  GRP_NumDistPurchases6 = -1;
                  GRP_NumDistPurchases7 = -1;
                  GRP_NumDistPurchases8 = -1;
                  GRP_NumDistPurchases9 = -1;
                  GRP_NumDistPurchases10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_NumDistPurchases2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_NumDistPurchases3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_NumDistPurchases4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_NumDistPurchases5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_NumDistPurchases6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumDistPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumDistPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumDistPurchases9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumDistPurchases2 = .;
      GRP_NumDistPurchases3 = .;
      GRP_NumDistPurchases4 = .;
      GRP_NumDistPurchases5 = .;
      GRP_NumDistPurchases6 = .;
      GRP_NumDistPurchases7 = .;
      GRP_NumDistPurchases8 = .;
      GRP_NumDistPurchases9 = .;
      GRP_NumDistPurchases10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebPurchases ;
drop GRP_NumWebPurchases2 GRP_NumWebPurchases3 GRP_NumWebPurchases4 
        GRP_NumWebPurchases5 GRP_NumWebPurchases6 GRP_NumWebPurchases7 
        GRP_NumWebPurchases8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebPurchases2 = 0;
GRP_NumWebPurchases3 = 0;
GRP_NumWebPurchases4 = 0;
GRP_NumWebPurchases5 = 0;
GRP_NumWebPurchases6 = 0;
GRP_NumWebPurchases7 = 0;
GRP_NumWebPurchases8 = 0;
if missing( GRP_NumWebPurchases ) then do;
   GRP_NumWebPurchases2 = .;
   GRP_NumWebPurchases3 = .;
   GRP_NumWebPurchases4 = .;
   GRP_NumWebPurchases5 = .;
   GRP_NumWebPurchases6 = .;
   GRP_NumWebPurchases7 = .;
   GRP_NumWebPurchases8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebPurchases , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebPurchases2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebPurchases3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebPurchases4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebPurchases5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebPurchases6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebPurchases7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebPurchases8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebPurchases2 = -1;
               GRP_NumWebPurchases3 = -1;
               GRP_NumWebPurchases4 = -1;
               GRP_NumWebPurchases5 = -1;
               GRP_NumWebPurchases6 = -1;
               GRP_NumWebPurchases7 = -1;
               GRP_NumWebPurchases8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebPurchases2 = .;
      GRP_NumWebPurchases3 = .;
      GRP_NumWebPurchases4 = .;
      GRP_NumWebPurchases5 = .;
      GRP_NumWebPurchases6 = .;
      GRP_NumWebPurchases7 = .;
      GRP_NumWebPurchases8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop GRP_NumWebVisitsMonth2 GRP_NumWebVisitsMonth3 GRP_NumWebVisitsMonth4 
        GRP_NumWebVisitsMonth5 GRP_NumWebVisitsMonth6 GRP_NumWebVisitsMonth7 
        GRP_NumWebVisitsMonth8 ;
*** encoding is sparse, initialize to zero;
GRP_NumWebVisitsMonth2 = 0;
GRP_NumWebVisitsMonth3 = 0;
GRP_NumWebVisitsMonth4 = 0;
GRP_NumWebVisitsMonth5 = 0;
GRP_NumWebVisitsMonth6 = 0;
GRP_NumWebVisitsMonth7 = 0;
GRP_NumWebVisitsMonth8 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   GRP_NumWebVisitsMonth2 = .;
   GRP_NumWebVisitsMonth3 = .;
   GRP_NumWebVisitsMonth4 = .;
   GRP_NumWebVisitsMonth5 = .;
   GRP_NumWebVisitsMonth6 = .;
   GRP_NumWebVisitsMonth7 = .;
   GRP_NumWebVisitsMonth8 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_NumWebVisitsMonth , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '5'  then do;
      if _dm12 <= '3'  then do;
         if _dm12 = '2'  then do;
            GRP_NumWebVisitsMonth2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               GRP_NumWebVisitsMonth3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            GRP_NumWebVisitsMonth4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               GRP_NumWebVisitsMonth5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            GRP_NumWebVisitsMonth6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_NumWebVisitsMonth7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_NumWebVisitsMonth8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_NumWebVisitsMonth2 = -1;
               GRP_NumWebVisitsMonth3 = -1;
               GRP_NumWebVisitsMonth4 = -1;
               GRP_NumWebVisitsMonth5 = -1;
               GRP_NumWebVisitsMonth6 = -1;
               GRP_NumWebVisitsMonth7 = -1;
               GRP_NumWebVisitsMonth8 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_NumWebVisitsMonth2 = .;
      GRP_NumWebVisitsMonth3 = .;
      GRP_NumWebVisitsMonth4 = .;
      GRP_NumWebVisitsMonth5 = .;
      GRP_NumWebVisitsMonth6 = .;
      GRP_NumWebVisitsMonth7 = .;
      GRP_NumWebVisitsMonth8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RFMstat ;
drop GRP_RFMstat2 GRP_RFMstat3 GRP_RFMstat4 GRP_RFMstat5 GRP_RFMstat6 
        GRP_RFMstat7 GRP_RFMstat8 GRP_RFMstat9 GRP_RFMstat10 ;
*** encoding is sparse, initialize to zero;
GRP_RFMstat2 = 0;
GRP_RFMstat3 = 0;
GRP_RFMstat4 = 0;
GRP_RFMstat5 = 0;
GRP_RFMstat6 = 0;
GRP_RFMstat7 = 0;
GRP_RFMstat8 = 0;
GRP_RFMstat9 = 0;
GRP_RFMstat10 = 0;
if missing( GRP_RFMstat ) then do;
   GRP_RFMstat2 = .;
   GRP_RFMstat3 = .;
   GRP_RFMstat4 = .;
   GRP_RFMstat5 = .;
   GRP_RFMstat6 = .;
   GRP_RFMstat7 = .;
   GRP_RFMstat8 = .;
   GRP_RFMstat9 = .;
   GRP_RFMstat10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RFMstat , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RFMstat10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RFMstat2 = -1;
                  GRP_RFMstat3 = -1;
                  GRP_RFMstat4 = -1;
                  GRP_RFMstat5 = -1;
                  GRP_RFMstat6 = -1;
                  GRP_RFMstat7 = -1;
                  GRP_RFMstat8 = -1;
                  GRP_RFMstat9 = -1;
                  GRP_RFMstat10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RFMstat2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RFMstat3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RFMstat4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RFMstat5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RFMstat6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RFMstat7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RFMstat8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RFMstat9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RFMstat2 = .;
      GRP_RFMstat3 = .;
      GRP_RFMstat4 = .;
      GRP_RFMstat5 = .;
      GRP_RFMstat6 = .;
      GRP_RFMstat7 = .;
      GRP_RFMstat8 = .;
      GRP_RFMstat9 = .;
      GRP_RFMstat10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop GRP_RMntFrq2 GRP_RMntFrq3 GRP_RMntFrq4 GRP_RMntFrq5 GRP_RMntFrq6 
        GRP_RMntFrq7 GRP_RMntFrq8 GRP_RMntFrq9 GRP_RMntFrq10 ;
*** encoding is sparse, initialize to zero;
GRP_RMntFrq2 = 0;
GRP_RMntFrq3 = 0;
GRP_RMntFrq4 = 0;
GRP_RMntFrq5 = 0;
GRP_RMntFrq6 = 0;
GRP_RMntFrq7 = 0;
GRP_RMntFrq8 = 0;
GRP_RMntFrq9 = 0;
GRP_RMntFrq10 = 0;
if missing( GRP_RMntFrq ) then do;
   GRP_RMntFrq2 = .;
   GRP_RMntFrq3 = .;
   GRP_RMntFrq4 = .;
   GRP_RMntFrq5 = .;
   GRP_RMntFrq6 = .;
   GRP_RMntFrq7 = .;
   GRP_RMntFrq8 = .;
   GRP_RMntFrq9 = .;
   GRP_RMntFrq10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_RMntFrq , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_RMntFrq10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_RMntFrq2 = -1;
                  GRP_RMntFrq3 = -1;
                  GRP_RMntFrq4 = -1;
                  GRP_RMntFrq5 = -1;
                  GRP_RMntFrq6 = -1;
                  GRP_RMntFrq7 = -1;
                  GRP_RMntFrq8 = -1;
                  GRP_RMntFrq9 = -1;
                  GRP_RMntFrq10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_RMntFrq2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_RMntFrq3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_RMntFrq4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_RMntFrq5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_RMntFrq6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_RMntFrq7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_RMntFrq8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_RMntFrq9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_RMntFrq2 = .;
      GRP_RMntFrq3 = .;
      GRP_RMntFrq4 = .;
      GRP_RMntFrq5 = .;
      GRP_RMntFrq6 = .;
      GRP_RMntFrq7 = .;
      GRP_RMntFrq8 = .;
      GRP_RMntFrq9 = .;
      GRP_RMntFrq10 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop GRP_Recency2 GRP_Recency3 GRP_Recency4 GRP_Recency5 GRP_Recency6 
        GRP_Recency7 GRP_Recency8 GRP_Recency9 GRP_Recency10 ;
*** encoding is sparse, initialize to zero;
GRP_Recency2 = 0;
GRP_Recency3 = 0;
GRP_Recency4 = 0;
GRP_Recency5 = 0;
GRP_Recency6 = 0;
GRP_Recency7 = 0;
GRP_Recency8 = 0;
GRP_Recency9 = 0;
GRP_Recency10 = 0;
if missing( GRP_Recency ) then do;
   GRP_Recency2 = .;
   GRP_Recency3 = .;
   GRP_Recency4 = .;
   GRP_Recency5 = .;
   GRP_Recency6 = .;
   GRP_Recency7 = .;
   GRP_Recency8 = .;
   GRP_Recency9 = .;
   GRP_Recency10 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_Recency , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '4'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 <= '11'  then do;
            if _dm12 = '10'  then do;
               GRP_Recency10 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  GRP_Recency2 = -1;
                  GRP_Recency3 = -1;
                  GRP_Recency4 = -1;
                  GRP_Recency5 = -1;
                  GRP_Recency6 = -1;
                  GRP_Recency7 = -1;
                  GRP_Recency8 = -1;
                  GRP_Recency9 = -1;
                  GRP_Recency10 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_Recency2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_Recency3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               GRP_Recency4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               GRP_Recency5 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  GRP_Recency6 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               GRP_Recency7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            GRP_Recency8 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               GRP_Recency9 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_Recency2 = .;
      GRP_Recency3 = .;
      GRP_Recency4 = .;
      GRP_Recency5 = .;
      GRP_Recency6 = .;
      GRP_Recency7 = .;
      GRP_Recency8 = .;
      GRP_Recency9 = .;
      GRP_Recency10 = .;
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
   H1x1_1  =     48.9150991327121 * S_Year_Birth ;
   H1x1_2  =     -1.2448778225302 * S_Year_Birth ;
   H1x1_3  =    -1.17490240099498 * S_Year_Birth ;
   H1x1_1  = H1x1_1  +      1.4952515081505 * GRP_AcceptedCmp52
          +     1.14523176862382 * GRP_AcceptedCmpTotal3
          +     0.93425623080229 * GRP_Frq2  +    -0.23764135713737 * GRP_Frq3
          +     1.05225179768198 * GRP_Frq4  +     1.13893285231202 * GRP_Frq5
          +    -0.27680259911931 * GRP_Frq6  +    -0.38613226683298 * GRP_Frq7
          +     0.94138019603873 * GRP_Frq8  +    -0.96317020684084 * GRP_Frq9
          +     1.74049706575335 * GRP_Frq10  +    -1.04039907773219 * 
        GRP_Income2  +     -0.3786016700082 * GRP_Income3
          +     1.05648065329445 * GRP_Income4  +    -0.56495305593924 * 
        GRP_Income5  +      0.3223314463995 * GRP_Income6
          +    -0.47141915296565 * GRP_Income7  +     0.72744850687316 * 
        GRP_Income8  +     0.36203320013679 * GRP_Income9
          +     1.03998002924375 * GRP_Income10  +    -1.48754816106222 * 
        GRP_Mnt2  +    -0.30894429756232 * GRP_Mnt3  +    -0.95770423028109 * 
        GRP_Mnt4  +    -1.64539798690154 * GRP_Mnt5  +     0.41874777811787 * 
        GRP_Mnt6  +     -0.1532077512138 * GRP_Mnt7  +    -0.04430209280744 * 
        GRP_Mnt8  +     0.02050928860703 * GRP_Mnt9  +    -0.23141760714689 * 
        GRP_Mnt10  +     0.57065075916048 * GRP_MntFishProducts3
          +     2.12207366601436 * GRP_MntFishProducts4
          +     1.24477569664546 * GRP_MntFishProducts5
          +    -0.15100981079052 * GRP_MntFishProducts6
          +     0.46801413141905 * GRP_MntFishProducts7
          +     1.01445048363237 * GRP_MntFishProducts8
          +     0.13349988618819 * GRP_MntFishProducts9
          +     0.63636065903854 * GRP_MntFishProducts10
          +     0.35790281852262 * GRP_MntGoldProds2
          +     0.11971728944951 * GRP_MntGoldProds3
          +     1.37638045474104 * GRP_MntGoldProds4
          +      0.7726977538873 * GRP_MntGoldProds5
          +     1.54380129285603 * GRP_MntGoldProds6
          +    -0.43867873229224 * GRP_MntGoldProds7
          +     -0.0828489784008 * GRP_MntGoldProds8
          +    -1.30553169816686 * GRP_MntGoldProds9
          +     0.31517486136642 * GRP_MntGoldProds10
          +     2.08926485272668 * GRP_MntMeatProducts2
          +    -0.41323675739227 * GRP_MntMeatProducts3
          +     0.77026554823296 * GRP_MntMeatProducts4
          +     1.50837606673951 * GRP_MntMeatProducts5
          +    -0.50610766287925 * GRP_MntMeatProducts6
          +    -0.95808202669031 * GRP_MntMeatProducts7
          +    -0.73210997972236 * GRP_MntMeatProducts8
          +      0.4803662033036 * GRP_MntMeatProducts9
          +    -0.42623536772485 * GRP_MntMeatProducts10
          +    -0.98377710430047 * GRP_MntSweetProducts3
          +     1.29812120945148 * GRP_MntSweetProducts4
          +     1.13394147298504 * GRP_MntSweetProducts5
          +     1.88553289457256 * GRP_MntSweetProducts6
          +     1.01861533954881 * GRP_MntSweetProducts7
          +    -0.96863877000054 * GRP_MntSweetProducts8
          +    -0.62054685937371 * GRP_MntSweetProducts9
          +     0.12973446109882 * GRP_MntSweetProducts10
          +    -0.62846271426447 * GRP_MntWines2  +     -0.8813121582917 * 
        GRP_MntWines3  +     0.63705101351299 * GRP_MntWines4
          +    -1.87236646995285 * GRP_MntWines5  +    -1.18525347066321 * 
        GRP_MntWines6  +     2.53144197387008 * GRP_MntWines7
          +      0.4451263901865 * GRP_MntWines8  +      1.2759478420416 * 
        GRP_MntWines9  +    -0.31414756703531 * GRP_MntWines10
          +     0.24125160079787 * GRP_NumCatalogPurchases3
          +     0.92633573785462 * GRP_NumCatalogPurchases4
          +     1.18471184481323 * GRP_NumCatalogPurchases5
          +    -0.58925390407558 * GRP_NumCatalogPurchases6
          +     0.17286372485467 * GRP_NumCatalogPurchases7
          +    -0.33288324436397 * GRP_NumDistPurchases2
          +    -0.00244246555209 * GRP_NumDistPurchases3
          +    -0.68136277383147 * GRP_NumDistPurchases4
          +    -0.39044423572436 * GRP_NumDistPurchases5
          +    -0.63508124022502 * GRP_NumDistPurchases6
          +     1.12448752949295 * GRP_NumDistPurchases7
          +     0.02898721976687 * GRP_NumDistPurchases8
          +     0.78422457187261 * GRP_NumDistPurchases9
          +    -0.51157522383083 * GRP_NumDistPurchases10
          +    -0.19655601102758 * GRP_NumWebPurchases2
          +    -0.43353198133592 * GRP_NumWebPurchases3
          +     0.57303663109299 * GRP_NumWebPurchases4
          +     0.44298473255625 * GRP_NumWebPurchases5
          +     1.64940181869571 * GRP_NumWebPurchases6
          +    -0.25769995323951 * GRP_NumWebPurchases7
          +    -1.80626838046671 * GRP_NumWebPurchases8
          +    -0.39825837678237 * GRP_NumWebVisitsMonth2
          +    -0.27886029046796 * GRP_NumWebVisitsMonth3
          +    -0.78900900175098 * GRP_NumWebVisitsMonth4
          +    -0.03893707525125 * GRP_NumWebVisitsMonth5
          +    -0.46465177083799 * GRP_NumWebVisitsMonth6
          +     0.42334277075131 * GRP_NumWebVisitsMonth7
          +     0.95483884118217 * GRP_NumWebVisitsMonth8
          +    -1.60737512717605 * GRP_RFMstat2  +     0.12532825553734 * 
        GRP_RFMstat3  +     -0.8715682423187 * GRP_RFMstat4
          +    -1.58991314451625 * GRP_RFMstat5  +       1.561575688018 * 
        GRP_RFMstat6  +     1.02933022756158 * GRP_RFMstat7
          +    -2.31915849609871 * GRP_RFMstat8  +    -2.84566628839516 * 
        GRP_RFMstat9  +    -0.57016541369574 * GRP_RFMstat10
          +    -0.31514918770314 * GRP_RMntFrq2  +     0.63646656105106 * 
        GRP_RMntFrq3  +    -0.46293466192264 * GRP_RMntFrq4
          +     0.54567569749056 * GRP_RMntFrq5  +     0.86979763512166 * 
        GRP_RMntFrq6  +     0.52805740997594 * GRP_RMntFrq7
          +    -1.02676864365651 * GRP_RMntFrq8  +    -0.06036462998226 * 
        GRP_RMntFrq9  +     1.10224270504506 * GRP_RMntFrq10
          +    -0.23825567927471 * GRP_Recency2  +     0.57752173954669 * 
        GRP_Recency3  +    -1.04299682241307 * GRP_Recency4
          +     0.48450986361423 * GRP_Recency5  +    -0.27557230387919 * 
        GRP_Recency6  +     1.13777960768356 * GRP_Recency7
          +     0.41680852213768 * GRP_Recency8  +    -0.32662764603354 * 
        GRP_Recency9  +     0.80671738024139 * GRP_Recency10 ;
   H1x1_2  = H1x1_2  +     0.32193368206173 * GRP_AcceptedCmp52
          +     0.82326963141087 * GRP_AcceptedCmpTotal3
          +     0.29199450204637 * GRP_Frq2  +    -0.20110326184849 * GRP_Frq3
          +     1.15620288699913 * GRP_Frq4  +     1.91563433844484 * GRP_Frq5
          +    -1.94417593954758 * GRP_Frq6  +    -0.47586232856071 * GRP_Frq7
          +    -0.10925637884701 * GRP_Frq8  +     1.04074726941789 * GRP_Frq9
          +    -1.19736074070766 * GRP_Frq10  +     1.23870153104153 * 
        GRP_Income2  +     1.32868254469642 * GRP_Income3
          +    -1.43777045525805 * GRP_Income4  +    -3.47419008335802 * 
        GRP_Income5  +    -1.27020686562599 * GRP_Income6
          +    -0.98522733275557 * GRP_Income7  +    -0.14168992699506 * 
        GRP_Income8  +    -0.85866324769247 * GRP_Income9
          +    -1.23618327699367 * GRP_Income10  +     1.68515397455794 * 
        GRP_Mnt2  +    -0.47759836154745 * GRP_Mnt3  +     0.78983592820334 * 
        GRP_Mnt4  +    -0.68136197325175 * GRP_Mnt5  +    -1.12504577016144 * 
        GRP_Mnt6  +     0.04737591582113 * GRP_Mnt7  +     1.28481668963926 * 
        GRP_Mnt8  +    -0.80486225354961 * GRP_Mnt9  +     0.21161129936087 * 
        GRP_Mnt10  +    -0.36757535415244 * GRP_MntFishProducts3
          +    -0.33143977879958 * GRP_MntFishProducts4
          +     1.93255446105149 * GRP_MntFishProducts5
          +    -1.04814780142169 * GRP_MntFishProducts6
          +     0.55741771876452 * GRP_MntFishProducts7
          +    -0.92346757070836 * GRP_MntFishProducts8
          +    -2.06316504690909 * GRP_MntFishProducts9
          +    -0.99663986972644 * GRP_MntFishProducts10
          +     2.71588988290106 * GRP_MntGoldProds2
          +    -2.95950500047378 * GRP_MntGoldProds3
          +    -0.12315192366204 * GRP_MntGoldProds4
          +     2.36302474420457 * GRP_MntGoldProds5
          +    -1.11740173730236 * GRP_MntGoldProds6
          +    -0.06629690891602 * GRP_MntGoldProds7
          +     1.53811367494183 * GRP_MntGoldProds8
          +    -0.74588656478301 * GRP_MntGoldProds9
          +     -0.1802565447079 * GRP_MntGoldProds10
          +    -0.01894056181534 * GRP_MntMeatProducts2
          +    -1.15568679348089 * GRP_MntMeatProducts3
          +    -0.58682052930966 * GRP_MntMeatProducts4
          +     -0.6043543906002 * GRP_MntMeatProducts5
          +     2.85692516249605 * GRP_MntMeatProducts6
          +     0.73625924216854 * GRP_MntMeatProducts7
          +     1.74214728746989 * GRP_MntMeatProducts8
          +    -0.45744353564408 * GRP_MntMeatProducts9
          +     -1.4723966813517 * GRP_MntMeatProducts10
          +    -1.09495306347627 * GRP_MntSweetProducts3
          +     -0.4054731731199 * GRP_MntSweetProducts4
          +    -0.60803493417392 * GRP_MntSweetProducts5
          +     0.20719345639414 * GRP_MntSweetProducts6
          +     1.02644572280032 * GRP_MntSweetProducts7
          +    -1.64943878087677 * GRP_MntSweetProducts8
          +      2.5809291197819 * GRP_MntSweetProducts9
          +    -1.12543901836329 * GRP_MntSweetProducts10
          +     0.80918074561742 * GRP_MntWines2  +    -0.41223459539794 * 
        GRP_MntWines3  +    -1.98090391049585 * GRP_MntWines4
          +     0.47010666911014 * GRP_MntWines5  +    -2.49811494662362 * 
        GRP_MntWines6  +    -0.66268495109454 * GRP_MntWines7
          +     0.39873289333478 * GRP_MntWines8  +     0.59392453433629 * 
        GRP_MntWines9  +     1.76795712153005 * GRP_MntWines10
          +     0.62443875288586 * GRP_NumCatalogPurchases3
          +    -0.23239899520452 * GRP_NumCatalogPurchases4
          +     0.77819270235427 * GRP_NumCatalogPurchases5
          +    -0.66349897020768 * GRP_NumCatalogPurchases6
          +    -0.28807954547855 * GRP_NumCatalogPurchases7
          +     0.68100611767034 * GRP_NumDistPurchases2
          +     -0.2983323877346 * GRP_NumDistPurchases3
          +     1.45550232689859 * GRP_NumDistPurchases4
          +     0.11615366779409 * GRP_NumDistPurchases5
          +    -2.32779642988276 * GRP_NumDistPurchases6
          +    -1.28135209220093 * GRP_NumDistPurchases7
          +    -0.28870369893693 * GRP_NumDistPurchases8
          +     0.19103763943343 * GRP_NumDistPurchases9
          +    -0.45462159014129 * GRP_NumDistPurchases10
          +     0.97366301040717 * GRP_NumWebPurchases2
          +     3.15113200753743 * GRP_NumWebPurchases3
          +     0.58917122105031 * GRP_NumWebPurchases4
          +     0.12866676129391 * GRP_NumWebPurchases5
          +     0.07041507244185 * GRP_NumWebPurchases6
          +    -0.06632505905192 * GRP_NumWebPurchases7
          +     1.50920205841058 * GRP_NumWebPurchases8
          +    -2.47459746725091 * GRP_NumWebVisitsMonth2
          +     1.21230732020908 * GRP_NumWebVisitsMonth3
          +     0.02999057712001 * GRP_NumWebVisitsMonth4
          +    -0.33433716782878 * GRP_NumWebVisitsMonth5
          +     2.75617273064887 * GRP_NumWebVisitsMonth6
          +     0.91205481253913 * GRP_NumWebVisitsMonth7
          +    -1.40389237616488 * GRP_NumWebVisitsMonth8
          +    -0.07601897093846 * GRP_RFMstat2  +    -0.17804688029525 * 
        GRP_RFMstat3  +    -1.25755712891617 * GRP_RFMstat4
          +    -1.44373874040728 * GRP_RFMstat5  +     0.18486659716439 * 
        GRP_RFMstat6  +    -1.15261748039876 * GRP_RFMstat7
          +     1.14394270249563 * GRP_RFMstat8  +    -1.50826640819395 * 
        GRP_RFMstat9  +     0.90336660848561 * GRP_RFMstat10
          +     0.11901703475432 * GRP_RMntFrq2  +     0.14476182733312 * 
        GRP_RMntFrq3  +     0.32489702019702 * GRP_RMntFrq4
          +    -1.57145901582776 * GRP_RMntFrq5  +     0.07677043753266 * 
        GRP_RMntFrq6  +     1.15426453256065 * GRP_RMntFrq7
          +     1.61100197843951 * GRP_RMntFrq8  +    -0.55320583423719 * 
        GRP_RMntFrq9  +    -0.36289317306929 * GRP_RMntFrq10
          +     -0.0602051134327 * GRP_Recency2  +     0.72031394040131 * 
        GRP_Recency3  +    -1.01324252973573 * GRP_Recency4
          +     -0.2828776155712 * GRP_Recency5  +    -0.55661874182308 * 
        GRP_Recency6  +    -0.31727450762599 * GRP_Recency7
          +     1.13540870611782 * GRP_Recency8  +    -1.13660380171875 * 
        GRP_Recency9  +     1.50200700925354 * GRP_Recency10 ;
   H1x1_3  = H1x1_3  +    -1.03985555112012 * GRP_AcceptedCmp52
          +     0.25775857203989 * GRP_AcceptedCmpTotal3
          +    -0.71156531868268 * GRP_Frq2  +     0.67259022689422 * GRP_Frq3
          +    -1.97845323119706 * GRP_Frq4  +    -1.52930723846502 * GRP_Frq5
          +     0.28107074664618 * GRP_Frq6  +     1.14326791621936 * GRP_Frq7
          +    -1.22814850699575 * GRP_Frq8  +     -0.1984823170485 * GRP_Frq9
          +     1.55339967620915 * GRP_Frq10  +     0.40856006828913 * 
        GRP_Income2  +    -0.24937432220747 * GRP_Income3
          +     0.77178170458781 * GRP_Income4  +     -0.1042181149455 * 
        GRP_Income5  +     0.83921353126936 * GRP_Income6
          +     0.42897985145162 * GRP_Income7  +    -0.99399816643537 * 
        GRP_Income8  +     1.43456355062073 * GRP_Income9
          +      2.0557598827554 * GRP_Income10  +     0.53153636588135 * 
        GRP_Mnt2  +      1.4499127888941 * GRP_Mnt3  +    -1.79642136320056 * 
        GRP_Mnt4  +     0.23742732777127 * GRP_Mnt5  +     0.66365989150128 * 
        GRP_Mnt6  +    -2.42545477483083 * GRP_Mnt7  +    -2.06918742851762 * 
        GRP_Mnt8  +     0.39193343300266 * GRP_Mnt9  +    -0.68271160013302 * 
        GRP_Mnt10  +    -0.40413771106033 * GRP_MntFishProducts3
          +     1.62536744100755 * GRP_MntFishProducts4
          +     1.00956771804097 * GRP_MntFishProducts5
          +    -0.04807563648335 * GRP_MntFishProducts6
          +    -0.27640554543874 * GRP_MntFishProducts7
          +    -0.09019675678864 * GRP_MntFishProducts8
          +     1.51664080485047 * GRP_MntFishProducts9
          +     -1.2348175966111 * GRP_MntFishProducts10
          +     0.84388560297705 * GRP_MntGoldProds2
          +     0.21507152885146 * GRP_MntGoldProds3
          +    -0.15826409097881 * GRP_MntGoldProds4
          +    -2.20608646296521 * GRP_MntGoldProds5
          +    -0.36898605604248 * GRP_MntGoldProds6
          +     0.80401593320079 * GRP_MntGoldProds7
          +     -0.0928561699183 * GRP_MntGoldProds8
          +    -0.76260849885604 * GRP_MntGoldProds9
          +     0.41599883721366 * GRP_MntGoldProds10
          +    -0.58540441202927 * GRP_MntMeatProducts2
          +     0.53713605550175 * GRP_MntMeatProducts3
          +    -0.65152621681077 * GRP_MntMeatProducts4
          +    -0.69756285035088 * GRP_MntMeatProducts5
          +     0.05767888263587 * GRP_MntMeatProducts6
          +     -0.1888350635322 * GRP_MntMeatProducts7
          +     0.19414921399907 * GRP_MntMeatProducts8
          +    -1.72928794783971 * GRP_MntMeatProducts9
          +     -0.4799288615181 * GRP_MntMeatProducts10
          +    -0.68909946079146 * GRP_MntSweetProducts3
          +     0.63891877698479 * GRP_MntSweetProducts4
          +     0.57432083655993 * GRP_MntSweetProducts5
          +    -0.58035522854804 * GRP_MntSweetProducts6
          +       1.935803556079 * GRP_MntSweetProducts7
          +     0.18629207650306 * GRP_MntSweetProducts8
          +     0.00378347159862 * GRP_MntSweetProducts9
          +     1.81075447841433 * GRP_MntSweetProducts10
          +    -0.19044365625491 * GRP_MntWines2  +     -0.2677543994646 * 
        GRP_MntWines3  +     0.68523737842149 * GRP_MntWines4
          +     0.28487452840765 * GRP_MntWines5  +    -0.32830007597399 * 
        GRP_MntWines6  +    -1.01109771829124 * GRP_MntWines7
          +    -0.44351213929191 * GRP_MntWines8  +    -0.79170922676093 * 
        GRP_MntWines9  +    -0.65765490294224 * GRP_MntWines10
          +     0.35708705290413 * GRP_NumCatalogPurchases3
          +     0.57640598587175 * GRP_NumCatalogPurchases4
          +      1.0380514084777 * GRP_NumCatalogPurchases5
          +    -0.21526014109961 * GRP_NumCatalogPurchases6
          +     0.21188563678996 * GRP_NumCatalogPurchases7
          +     0.92069365116707 * GRP_NumDistPurchases2
          +    -1.32849502144337 * GRP_NumDistPurchases3
          +     0.70446398487953 * GRP_NumDistPurchases4
          +    -0.57133137108926 * GRP_NumDistPurchases5
          +    -0.82186404546977 * GRP_NumDistPurchases6
          +     0.46329271267276 * GRP_NumDistPurchases7
          +    -0.66807540291648 * GRP_NumDistPurchases8
          +    -1.44336206173897 * GRP_NumDistPurchases9
          +    -1.13977568624017 * GRP_NumDistPurchases10
          +    -1.70104902572474 * GRP_NumWebPurchases2
          +     1.02036350016006 * GRP_NumWebPurchases3
          +     0.39753119384781 * GRP_NumWebPurchases4
          +     -1.0013941887276 * GRP_NumWebPurchases5
          +    -1.86464684445185 * GRP_NumWebPurchases6
          +    -0.34858626425799 * GRP_NumWebPurchases7
          +    -1.44547405446756 * GRP_NumWebPurchases8
          +     0.05140836436438 * GRP_NumWebVisitsMonth2
          +     0.24015379584676 * GRP_NumWebVisitsMonth3
          +    -0.49517632469744 * GRP_NumWebVisitsMonth4
          +    -1.43605492927257 * GRP_NumWebVisitsMonth5
          +     0.60170726736208 * GRP_NumWebVisitsMonth6
          +     0.63411609486483 * GRP_NumWebVisitsMonth7
          +     -1.2126844839861 * GRP_NumWebVisitsMonth8
          +    -0.64965441128326 * GRP_RFMstat2  +     0.34697568605896 * 
        GRP_RFMstat3  +    -0.43341862711381 * GRP_RFMstat4
          +     1.06858029248659 * GRP_RFMstat5  +    -0.56457302770384 * 
        GRP_RFMstat6  +     1.66706381189326 * GRP_RFMstat7
          +    -2.17135319116775 * GRP_RFMstat8  +    -0.21450659726193 * 
        GRP_RFMstat9  +    -0.31077905350474 * GRP_RFMstat10
          +      0.2192436825917 * GRP_RMntFrq2  +     1.83372548820854 * 
        GRP_RMntFrq3  +    -0.11145697947633 * GRP_RMntFrq4
          +     0.55148891791064 * GRP_RMntFrq5  +     0.59018223296027 * 
        GRP_RMntFrq6  +    -1.05010790826944 * GRP_RMntFrq7
          +     0.52934032045284 * GRP_RMntFrq8  +      0.2953493263513 * 
        GRP_RMntFrq9  +     -1.5124212512629 * GRP_RMntFrq10
          +    -0.25342816485434 * GRP_Recency2  +    -1.06632533875501 * 
        GRP_Recency3  +     0.92243866019235 * GRP_Recency4
          +    -0.69765274503358 * GRP_Recency5  +    -1.03684525826147 * 
        GRP_Recency6  +     0.92907236967862 * GRP_Recency7
          +     0.67510319128245 * GRP_Recency8  +    -0.12563628417614 * 
        GRP_Recency9  +     0.22617805549496 * GRP_Recency10 ;
   H1x1_1  =     0.15531859064267 + H1x1_1 ;
   H1x1_2  =     1.82135862068225 + H1x1_2 ;
   H1x1_3  =      0.3038406758605 + H1x1_3 ;
   H1x1_4  = 0; 
   _MAX_ = MAX (H1x1_1 , H1x1_2 , H1x1_3 , H1x1_4 );
   _SUM_ = 0.; 
   H1x1_1  = EXP(H1x1_1  - _MAX_);
   _SUM_ = _SUM_ + H1x1_1 ;
   H1x1_2  = EXP(H1x1_2  - _MAX_);
   _SUM_ = _SUM_ + H1x1_2 ;
   H1x1_3  = EXP(H1x1_3  - _MAX_);
   _SUM_ = _SUM_ + H1x1_3 ;
   H1x1_4  = EXP(H1x1_4  - _MAX_);
   _SUM_ = _SUM_ + H1x1_4 ;
   H1x1_1  = H1x1_1  / _SUM_;
   H1x1_2  = H1x1_2  / _SUM_;
   H1x1_3  = H1x1_3  / _SUM_;
   H1x1_4  = H1x1_4  / _SUM_;
END;
ELSE DO;
   H1x1_1  = .;
   H1x1_2  = .;
   H1x1_3  = .;
   H1x1_4  = .;
END;
*** *************************;
*** Writing the Node H1x2_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H1x2_1  =    -1.12587004977911 * S_Year_Birth ;
   H1x2_2  =     1.95303306784814 * S_Year_Birth ;
   H1x2_3  =    -0.90076896361071 * S_Year_Birth ;
   H1x2_1  = H1x2_1  +    -0.79126569643619 * GRP_AcceptedCmp52
          +     1.43306912145272 * GRP_AcceptedCmpTotal3
          +     1.22454618925923 * GRP_Frq2  +    -1.05161181420251 * GRP_Frq3
          +     0.18863611173949 * GRP_Frq4  +    -1.53183971921525 * GRP_Frq5
          +    -2.01595133665319 * GRP_Frq6  +     -1.0035007257827 * GRP_Frq7
          +     0.15713490969217 * GRP_Frq8  +    -0.83347236903779 * GRP_Frq9
          +     0.29577012385785 * GRP_Frq10  +    -0.62392105819131 * 
        GRP_Income2  +     0.50038805154482 * GRP_Income3
          +    -3.13357648186361 * GRP_Income4  +     0.10711964638702 * 
        GRP_Income5  +     0.09871993128645 * GRP_Income6
          +     1.58783603619041 * GRP_Income7  +    -2.39170088940171 * 
        GRP_Income8  +     0.84317235077516 * GRP_Income9
          +     0.21927112782838 * GRP_Income10  +     1.44688080741688 * 
        GRP_Mnt2  +     0.98559424831742 * GRP_Mnt3  +    -0.83479015994315 * 
        GRP_Mnt4  +    -1.25208462521822 * GRP_Mnt5  +      0.5659903070034 * 
        GRP_Mnt6  +      1.1919814928293 * GRP_Mnt7  +    -0.57500802418483 * 
        GRP_Mnt8  +     0.01798716798387 * GRP_Mnt9  +     -0.9726123707811 * 
        GRP_Mnt10  +     -0.6415326473362 * GRP_MntFishProducts3
          +    -0.10224099785309 * GRP_MntFishProducts4
          +     0.72743835436702 * GRP_MntFishProducts5
          +     0.29614489369863 * GRP_MntFishProducts6
          +     1.63513523583267 * GRP_MntFishProducts7
          +     2.82434082348947 * GRP_MntFishProducts8
          +      0.5231937168513 * GRP_MntFishProducts9
          +     0.55251870054858 * GRP_MntFishProducts10
          +    -0.98753393210474 * GRP_MntGoldProds2
          +     -0.1940135001606 * GRP_MntGoldProds3
          +     0.91054070984291 * GRP_MntGoldProds4
          +    -1.12994907018166 * GRP_MntGoldProds5
          +     1.27179432245575 * GRP_MntGoldProds6
          +     0.18442086794002 * GRP_MntGoldProds7
          +     0.13785506159767 * GRP_MntGoldProds8
          +     0.47959028032247 * GRP_MntGoldProds9
          +     0.39229732865897 * GRP_MntGoldProds10
          +     0.23926854234201 * GRP_MntMeatProducts2
          +     0.85207763313609 * GRP_MntMeatProducts3
          +     0.42240672557213 * GRP_MntMeatProducts4
          +     1.34861801506289 * GRP_MntMeatProducts5
          +    -1.90829994248939 * GRP_MntMeatProducts6
          +    -1.20216774826328 * GRP_MntMeatProducts7
          +     0.21149278031924 * GRP_MntMeatProducts8
          +     0.56060387833343 * GRP_MntMeatProducts9
          +     0.08240378464729 * GRP_MntMeatProducts10
          +     0.16630337453841 * GRP_MntSweetProducts3
          +    -0.76600764359826 * GRP_MntSweetProducts4
          +     1.50792024107994 * GRP_MntSweetProducts5
          +     1.43253580615881 * GRP_MntSweetProducts6
          +     0.21920103392576 * GRP_MntSweetProducts7
          +    -0.17220433340388 * GRP_MntSweetProducts8
          +    -0.27184415375521 * GRP_MntSweetProducts9
          +     1.06559352978761 * GRP_MntSweetProducts10
          +      0.3638071493651 * GRP_MntWines2  +    -1.03089735689723 * 
        GRP_MntWines3  +    -0.28348074712993 * GRP_MntWines4
          +    -1.16208580461502 * GRP_MntWines5  +     0.05256517522541 * 
        GRP_MntWines6  +    -3.45408294270214 * GRP_MntWines7
          +     -1.3283333848315 * GRP_MntWines8  +    -0.31095479430398 * 
        GRP_MntWines9  +     0.15559494113085 * GRP_MntWines10
          +     0.43779353849058 * GRP_NumCatalogPurchases3
          +    -0.91049921837605 * GRP_NumCatalogPurchases4
          +    -0.62690332918044 * GRP_NumCatalogPurchases5
          +    -0.43739432912503 * GRP_NumCatalogPurchases6
          +     0.16278086436799 * GRP_NumCatalogPurchases7
          +     0.35715282562267 * GRP_NumDistPurchases2
          +     1.84468920663071 * GRP_NumDistPurchases3
          +    -2.73925942945889 * GRP_NumDistPurchases4
          +     0.59074278753284 * GRP_NumDistPurchases5
          +    -0.29365199688931 * GRP_NumDistPurchases6
          +    -1.16685203020069 * GRP_NumDistPurchases7
          +     -0.7875731631251 * GRP_NumDistPurchases8
          +    -1.10510861301954 * GRP_NumDistPurchases9
          +    -0.03346524636684 * GRP_NumDistPurchases10
          +    -0.85072273160097 * GRP_NumWebPurchases2
          +     0.90393600640139 * GRP_NumWebPurchases3
          +    -0.25391465775867 * GRP_NumWebPurchases4
          +     1.40214100313324 * GRP_NumWebPurchases5
          +     0.50386388744504 * GRP_NumWebPurchases6
          +    -0.38538022046144 * GRP_NumWebPurchases7
          +    -0.90483081808977 * GRP_NumWebPurchases8
          +    -0.63366478324154 * GRP_NumWebVisitsMonth2
          +    -1.41147267846877 * GRP_NumWebVisitsMonth3
          +     1.96455239930015 * GRP_NumWebVisitsMonth4
          +     1.74571803237503 * GRP_NumWebVisitsMonth5
          +     1.08303441803169 * GRP_NumWebVisitsMonth6
          +     0.08841803401126 * GRP_NumWebVisitsMonth7
          +     1.38561551238731 * GRP_NumWebVisitsMonth8
          +     0.42159527214144 * GRP_RFMstat2  +     0.39205646681751 * 
        GRP_RFMstat3  +    -2.50004006229316 * GRP_RFMstat4
          +     0.24218846060019 * GRP_RFMstat5  +    -0.52013661702385 * 
        GRP_RFMstat6  +     2.09715348886186 * GRP_RFMstat7
          +     1.17945186200384 * GRP_RFMstat8  +    -0.19936602116765 * 
        GRP_RFMstat9  +     1.55749736422931 * GRP_RFMstat10
          +     0.26371295729234 * GRP_RMntFrq2  +     0.21256291633719 * 
        GRP_RMntFrq3  +     1.61594740267638 * GRP_RMntFrq4
          +     0.40518302938557 * GRP_RMntFrq5  +    -0.39917281851837 * 
        GRP_RMntFrq6  +     -0.4628652915326 * GRP_RMntFrq7
          +    -0.38905036918399 * GRP_RMntFrq8  +    -2.18723781804534 * 
        GRP_RMntFrq9  +    -0.56209811155219 * GRP_RMntFrq10
          +    -0.21941631743981 * GRP_Recency2  +     0.62365652451736 * 
        GRP_Recency3  +     0.16890109579365 * GRP_Recency4
          +     1.18652000001776 * GRP_Recency5  +      1.2800112939146 * 
        GRP_Recency6  +     1.11205915793382 * GRP_Recency7
          +    -0.01678209606086 * GRP_Recency8  +    -0.49049076797222 * 
        GRP_Recency9  +     -0.3017614099326 * GRP_Recency10 ;
   H1x2_2  = H1x2_2  +     0.67398933015706 * GRP_AcceptedCmp52
          +     -0.8751453503824 * GRP_AcceptedCmpTotal3
          +    -0.39482876732264 * GRP_Frq2  +     1.47757467388321 * GRP_Frq3
          +     1.83867441067752 * GRP_Frq4  +    -0.44009343778503 * GRP_Frq5
          +     1.79969806004367 * GRP_Frq6  +    -0.73760862560354 * GRP_Frq7
          +    -0.27901106932898 * GRP_Frq8  +     -0.2579404478755 * GRP_Frq9
          +     0.92818121440017 * GRP_Frq10  +     1.23619934553523 * 
        GRP_Income2  +    -0.75075854848504 * GRP_Income3
          +      2.6356052001789 * GRP_Income4  +     0.37936058080477 * 
        GRP_Income5  +    -0.20967950465903 * GRP_Income6
          +     0.99334907985914 * GRP_Income7  +    -0.08920239779189 * 
        GRP_Income8  +    -0.22578219454998 * GRP_Income9
          +     2.34062669066844 * GRP_Income10  +     1.22929044941773 * 
        GRP_Mnt2  +     0.14397695972183 * GRP_Mnt3  +     0.51032665988083 * 
        GRP_Mnt4  +    -1.38153126365165 * GRP_Mnt5  +     1.63106485668984 * 
        GRP_Mnt6  +     0.66336076908093 * GRP_Mnt7  +    -1.74416183994338 * 
        GRP_Mnt8  +     0.26066677250535 * GRP_Mnt9  +      0.3077437522773 * 
        GRP_Mnt10  +     0.31536873558672 * GRP_MntFishProducts3
          +    -0.76193578413236 * GRP_MntFishProducts4
          +     0.26441683863806 * GRP_MntFishProducts5
          +    -1.13218530156836 * GRP_MntFishProducts6
          +    -1.75837301022941 * GRP_MntFishProducts7
          +    -0.60984304748028 * GRP_MntFishProducts8
          +     0.02475727805659 * GRP_MntFishProducts9
          +    -1.33855779072481 * GRP_MntFishProducts10
          +    -1.92410927496765 * GRP_MntGoldProds2
          +     1.37957021991927 * GRP_MntGoldProds3
          +     -1.1577166761956 * GRP_MntGoldProds4
          +     1.17595415699299 * GRP_MntGoldProds5
          +    -1.44888413734615 * GRP_MntGoldProds6
          +     -0.6269952213199 * GRP_MntGoldProds7
          +     2.05006558590766 * GRP_MntGoldProds8
          +       0.105525514708 * GRP_MntGoldProds9
          +    -0.67797887575985 * GRP_MntGoldProds10
          +     2.31770696034252 * GRP_MntMeatProducts2
          +    -0.76500299288116 * GRP_MntMeatProducts3
          +    -0.08828598934539 * GRP_MntMeatProducts4
          +    -0.02140592940052 * GRP_MntMeatProducts5
          +     1.03141631738102 * GRP_MntMeatProducts6
          +     0.38981881043903 * GRP_MntMeatProducts7
          +     0.40533105938471 * GRP_MntMeatProducts8
          +     -0.3745105385612 * GRP_MntMeatProducts9
          +    -1.05280123780042 * GRP_MntMeatProducts10
          +    -0.65620511867931 * GRP_MntSweetProducts3
          +     1.21474510355056 * GRP_MntSweetProducts4
          +    -1.25507723676387 * GRP_MntSweetProducts5
          +     0.92194675503686 * GRP_MntSweetProducts6
          +     0.24570791052404 * GRP_MntSweetProducts7
          +    -0.65553994719174 * GRP_MntSweetProducts8
          +    -0.92841570255174 * GRP_MntSweetProducts9
          +     0.30873152061447 * GRP_MntSweetProducts10
          +      -0.076966369313 * GRP_MntWines2  +     -1.0025350275284 * 
        GRP_MntWines3  +     0.62441192788771 * GRP_MntWines4
          +    -0.21651325463938 * GRP_MntWines5  +    -1.28062431918087 * 
        GRP_MntWines6  +     0.69883808355517 * GRP_MntWines7
          +    -0.05950002086458 * GRP_MntWines8  +    -1.10191079055508 * 
        GRP_MntWines9  +     0.63137280145547 * GRP_MntWines10
          +     0.76262347276195 * GRP_NumCatalogPurchases3
          +     0.27178684022178 * GRP_NumCatalogPurchases4
          +      0.7925446848717 * GRP_NumCatalogPurchases5
          +     1.31986309150149 * GRP_NumCatalogPurchases6
          +     0.13154865053956 * GRP_NumCatalogPurchases7
          +     0.90300521816676 * GRP_NumDistPurchases2
          +    -1.08143603674908 * GRP_NumDistPurchases3
          +     1.45290495686195 * GRP_NumDistPurchases4
          +    -0.27200074304672 * GRP_NumDistPurchases5
          +    -1.22641713762099 * GRP_NumDistPurchases6
          +     0.59896437874483 * GRP_NumDistPurchases7
          +    -1.27615643084203 * GRP_NumDistPurchases8
          +     1.56986239933089 * GRP_NumDistPurchases9
          +     0.25700981555502 * GRP_NumDistPurchases10
          +    -0.00592602966853 * GRP_NumWebPurchases2
          +     -0.1326853227988 * GRP_NumWebPurchases3
          +     -0.2104875425464 * GRP_NumWebPurchases4
          +    -0.37786922546668 * GRP_NumWebPurchases5
          +    -2.31891994594655 * GRP_NumWebPurchases6
          +     0.21244077840762 * GRP_NumWebPurchases7
          +     0.20544153361165 * GRP_NumWebPurchases8
          +     0.25466867279004 * GRP_NumWebVisitsMonth2
          +     0.27188060033621 * GRP_NumWebVisitsMonth3
          +    -0.95934500827979 * GRP_NumWebVisitsMonth4
          +     -1.0658065247518 * GRP_NumWebVisitsMonth5
          +     0.29606991820625 * GRP_NumWebVisitsMonth6
          +     1.39148292787476 * GRP_NumWebVisitsMonth7
          +    -0.89682418536404 * GRP_NumWebVisitsMonth8
          +    -0.29501845280237 * GRP_RFMstat2  +    -1.62706110727439 * 
        GRP_RFMstat3  +    -0.05816762603923 * GRP_RFMstat4
          +     0.14056517927553 * GRP_RFMstat5  +     0.16264724605568 * 
        GRP_RFMstat6  +    -1.46819615066357 * GRP_RFMstat7
          +    -3.13528696014007 * GRP_RFMstat8  +     0.01832687767367 * 
        GRP_RFMstat9  +     2.36690257733755 * GRP_RFMstat10
          +     0.47170735684844 * GRP_RMntFrq2  +     0.76473788912988 * 
        GRP_RMntFrq3  +    -0.92101075362772 * GRP_RMntFrq4
          +     0.42659547546303 * GRP_RMntFrq5  +    -0.39107990111087 * 
        GRP_RMntFrq6  +     1.22534154436379 * GRP_RMntFrq7
          +     0.17325823510284 * GRP_RMntFrq8  +    -0.15337233078899 * 
        GRP_RMntFrq9  +     0.95961796320344 * GRP_RMntFrq10
          +     0.78187566388581 * GRP_Recency2  +     0.32432493265807 * 
        GRP_Recency3  +    -0.36127769208093 * GRP_Recency4
          +     0.49278466273238 * GRP_Recency5  +     1.02136259767421 * 
        GRP_Recency6  +     0.24565781332322 * GRP_Recency7
          +    -0.01819850591897 * GRP_Recency8  +    -0.88865832552994 * 
        GRP_Recency9  +    -1.06023089287045 * GRP_Recency10 ;
   H1x2_3  = H1x2_3  +     0.72829233603077 * GRP_AcceptedCmp52
          +    -0.64130750101094 * GRP_AcceptedCmpTotal3
          +    -0.62578027971767 * GRP_Frq2  +    -1.71391822542149 * GRP_Frq3
          +    -2.03690224986772 * GRP_Frq4  +     0.00250860268093 * GRP_Frq5
          +     3.77431536270677 * GRP_Frq6  +    -0.98694179514917 * GRP_Frq7
          +    -1.73466635264086 * GRP_Frq8  +    -0.55401738923895 * GRP_Frq9
          +    -1.75356906289375 * GRP_Frq10  +     1.49171603856686 * 
        GRP_Income2  +     2.11511145525038 * GRP_Income3
          +    -0.88783509763572 * GRP_Income4  +     0.16185380039783 * 
        GRP_Income5  +      0.4509467817404 * GRP_Income6
          +     0.42854496757248 * GRP_Income7  +    -0.62868012410212 * 
        GRP_Income8  +    -1.38694404635062 * GRP_Income9
          +    -0.74342405534619 * GRP_Income10  +     2.14444292945881 * 
        GRP_Mnt2  +    -1.40243675049805 * GRP_Mnt3  +     1.59454244242313 * 
        GRP_Mnt4  +     0.96363567691465 * GRP_Mnt5  +    -0.62891559534925 * 
        GRP_Mnt6  +    -0.28268355612216 * GRP_Mnt7  +     2.66118539089177 * 
        GRP_Mnt8  +    -1.43910408435818 * GRP_Mnt9  +     1.56729239602888 * 
        GRP_Mnt10  +     0.10200954846302 * GRP_MntFishProducts3
          +     0.11287042668469 * GRP_MntFishProducts4
          +    -0.89531289481293 * GRP_MntFishProducts5
          +     0.08643547718119 * GRP_MntFishProducts6
          +    -0.17770650235868 * GRP_MntFishProducts7
          +    -1.30659888536456 * GRP_MntFishProducts8
          +     2.06257011493102 * GRP_MntFishProducts9
          +    -0.57535905840521 * GRP_MntFishProducts10
          +     1.61685583269611 * GRP_MntGoldProds2
          +     0.76201845089384 * GRP_MntGoldProds3
          +    -0.20116109553599 * GRP_MntGoldProds4
          +    -0.35354590570837 * GRP_MntGoldProds5
          +    -0.07414881491148 * GRP_MntGoldProds6
          +    -0.93265516833704 * GRP_MntGoldProds7
          +     0.27562090724475 * GRP_MntGoldProds8
          +     0.21497600131343 * GRP_MntGoldProds9
          +    -1.31728109344577 * GRP_MntGoldProds10
          +     2.04761490869712 * GRP_MntMeatProducts2
          +    -1.25735539389252 * GRP_MntMeatProducts3
          +     2.53856697441095 * GRP_MntMeatProducts4
          +    -0.01594190004707 * GRP_MntMeatProducts5
          +     2.15096647695357 * GRP_MntMeatProducts6
          +     0.57494957107204 * GRP_MntMeatProducts7
          +     2.00730679226119 * GRP_MntMeatProducts8
          +    -0.71668533381607 * GRP_MntMeatProducts9
          +     0.53556599855475 * GRP_MntMeatProducts10
          +     1.54693619731858 * GRP_MntSweetProducts3
          +    -0.74400819703128 * GRP_MntSweetProducts4
          +    -1.02827729809733 * GRP_MntSweetProducts5
          +    -0.23410492711421 * GRP_MntSweetProducts6
          +    -1.04201907068576 * GRP_MntSweetProducts7
          +    -1.60007026788916 * GRP_MntSweetProducts8
          +    -2.09407617502035 * GRP_MntSweetProducts9
          +    -0.26803603659514 * GRP_MntSweetProducts10
          +    -1.71265459102005 * GRP_MntWines2  +     2.46887341207122 * 
        GRP_MntWines3  +     0.34837694975842 * GRP_MntWines4
          +      0.7876281786545 * GRP_MntWines5  +    -0.30368035070812 * 
        GRP_MntWines6  +    -0.58629960316924 * GRP_MntWines7
          +     1.95937960001866 * GRP_MntWines8  +    -0.25505243271449 * 
        GRP_MntWines9  +    -1.17987872337491 * GRP_MntWines10
          +     0.22023604608467 * GRP_NumCatalogPurchases3
          +    -2.56871980434954 * GRP_NumCatalogPurchases4
          +    -1.44764737334028 * GRP_NumCatalogPurchases5
          +     -0.2446195910135 * GRP_NumCatalogPurchases6
          +     2.90538414905594 * GRP_NumCatalogPurchases7
          +     0.88336976623421 * GRP_NumDistPurchases2
          +     2.13942226719201 * GRP_NumDistPurchases3
          +     1.34320499597894 * GRP_NumDistPurchases4
          +    -1.51639001105393 * GRP_NumDistPurchases5
          +     0.57368953355036 * GRP_NumDistPurchases6
          +     0.70444554339708 * GRP_NumDistPurchases7
          +     1.28554266385595 * GRP_NumDistPurchases8
          +     1.37825141302574 * GRP_NumDistPurchases9
          +    -1.43691218320245 * GRP_NumDistPurchases10
          +    -0.66804085143805 * GRP_NumWebPurchases2
          +     0.07392237122103 * GRP_NumWebPurchases3
          +    -1.49905765103392 * GRP_NumWebPurchases4
          +     -1.5187477833321 * GRP_NumWebPurchases5
          +     0.48158072068531 * GRP_NumWebPurchases6
          +     0.23079702131182 * GRP_NumWebPurchases7
          +    -0.20622792691222 * GRP_NumWebPurchases8
          +     0.30007609674528 * GRP_NumWebVisitsMonth2
          +     1.12205187145706 * GRP_NumWebVisitsMonth3
          +     0.51718549115979 * GRP_NumWebVisitsMonth4
          +    -1.04703503782865 * GRP_NumWebVisitsMonth5
          +     0.22390337037879 * GRP_NumWebVisitsMonth6
          +    -0.18626487429236 * GRP_NumWebVisitsMonth7
          +     1.57022893774879 * GRP_NumWebVisitsMonth8
          +    -0.18955402131625 * GRP_RFMstat2  +     1.36375958279816 * 
        GRP_RFMstat3  +     0.69388690636651 * GRP_RFMstat4
          +    -0.14096513433405 * GRP_RFMstat5  +     0.06232569479305 * 
        GRP_RFMstat6  +    -1.98686981980517 * GRP_RFMstat7
          +    -0.04208886647313 * GRP_RFMstat8  +     0.13969094966118 * 
        GRP_RFMstat9  +    -0.78889510235752 * GRP_RFMstat10
          +     0.00773524086935 * GRP_RMntFrq2  +     0.42760129795181 * 
        GRP_RMntFrq3  +     1.20654035825086 * GRP_RMntFrq4
          +    -1.96326294005559 * GRP_RMntFrq5  +     0.19508572570635 * 
        GRP_RMntFrq6  +     0.64155838577241 * GRP_RMntFrq7
          +     0.29646831812974 * GRP_RMntFrq8  +    -1.79415071937644 * 
        GRP_RMntFrq9  +     0.50025621373087 * GRP_RMntFrq10
          +    -1.09969223947409 * GRP_Recency2  +     0.28522088439434 * 
        GRP_Recency3  +     0.00277105517522 * GRP_Recency4
          +     0.84025488137705 * GRP_Recency5  +    -0.15771429015941 * 
        GRP_Recency6  +     0.60418796843171 * GRP_Recency7
          +    -0.08237018446397 * GRP_Recency8  +    -0.48067966796564 * 
        GRP_Recency9  +     1.24119420047225 * GRP_Recency10 ;
   H1x2_1  =     1.77895259501913 + H1x2_1 ;
   H1x2_2  =    -0.15319898291656 + H1x2_2 ;
   H1x2_3  =     1.06881294227229 + H1x2_3 ;
   H1x2_4  = 0; 
   _MAX_ = MAX (H1x2_1 , H1x2_2 , H1x2_3 , H1x2_4 );
   _SUM_ = 0.; 
   H1x2_1  = EXP(H1x2_1  - _MAX_);
   _SUM_ = _SUM_ + H1x2_1 ;
   H1x2_2  = EXP(H1x2_2  - _MAX_);
   _SUM_ = _SUM_ + H1x2_2 ;
   H1x2_3  = EXP(H1x2_3  - _MAX_);
   _SUM_ = _SUM_ + H1x2_3 ;
   H1x2_4  = EXP(H1x2_4  - _MAX_);
   _SUM_ = _SUM_ + H1x2_4 ;
   H1x2_1  = H1x2_1  / _SUM_;
   H1x2_2  = H1x2_2  / _SUM_;
   H1x2_3  = H1x2_3  / _SUM_;
   H1x2_4  = H1x2_4  / _SUM_;
END;
ELSE DO;
   H1x2_1  = .;
   H1x2_2  = .;
   H1x2_3  = .;
   H1x2_4  = .;
END;
*** *************************;
*** Writing the Node H2x1_ ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H2x1_1  =     0.60543735927278 * H1x1_1  +     3.85958773643111 * H1x1_2
          +    -0.13813806296693 * H1x1_3  +    -2.68183941928297 * H1x1_4 ;
   H2x1_2  =    -0.14350534886194 * H1x1_1  +    -0.58869275717393 * H1x1_2
          +     0.27201202126987 * H1x1_3  +     0.84944711792034 * H1x1_4 ;
   H2x1_3  =     0.16377235892809 * H1x1_1  +     0.32450938656975 * H1x1_2
          +    -0.96313538220557 * H1x1_3  +      -1.179254081075 * H1x1_4 ;
   H2x1_1  = H2x1_1  +     0.15983017127833 * H1x2_1
          +    -2.52556013675769 * H1x2_2  +     1.74538330689549 * H1x2_3
          +     0.68913073131319 * H1x2_4 ;
   H2x1_2  = H2x1_2  +     0.40540171537462 * H1x2_1
          +     2.27830241234825 * H1x2_2  +     0.15661386543073 * H1x2_3
          +    -0.12036833619531 * H1x2_4 ;
   H2x1_3  = H2x1_3  +     -0.8609897463305 * H1x2_1
          +     1.80866840044437 * H1x2_2  +    -0.99524522029584 * H1x2_3
          +    -0.16746987063494 * H1x2_4 ;
   H2x1_1  =    -0.00538470720937 + H2x1_1 ;
   H2x1_2  =    -0.26197576528123 + H2x1_2 ;
   H2x1_3  =    -1.06687812193911 + H2x1_3 ;
   H2x1_4  = 0; 
   _MAX_ = MAX (H2x1_1 , H2x1_2 , H2x1_3 , H2x1_4 );
   _SUM_ = 0.; 
   H2x1_1  = EXP(H2x1_1  - _MAX_);
   _SUM_ = _SUM_ + H2x1_1 ;
   H2x1_2  = EXP(H2x1_2  - _MAX_);
   _SUM_ = _SUM_ + H2x1_2 ;
   H2x1_3  = EXP(H2x1_3  - _MAX_);
   _SUM_ = _SUM_ + H2x1_3 ;
   H2x1_4  = EXP(H2x1_4  - _MAX_);
   _SUM_ = _SUM_ + H2x1_4 ;
   H2x1_1  = H2x1_1  / _SUM_;
   H2x1_2  = H2x1_2  / _SUM_;
   H2x1_3  = H2x1_3  / _SUM_;
   H2x1_4  = H2x1_4  / _SUM_;
END;
ELSE DO;
   H2x1_1  = .;
   H2x1_2  = .;
   H2x1_3  = .;
   H2x1_4  = .;
END;
*** *************************;
*** Writing the Node DepVar ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_DepVar1  =    -6.74158110639118 * H2x1_1  +     3.33281062877513 * H2x1_2
          +     0.83315809661207 * H2x1_3  +     2.92602608104015 * H2x1_4 ;
   P_DepVar1  =    -3.28186383811869 + P_DepVar1 ;
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
