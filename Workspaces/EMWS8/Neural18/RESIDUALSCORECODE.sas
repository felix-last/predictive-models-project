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
   H11  =     0.00123076410129 * S_Year_Birth ;
   H12  =    -0.09262709246761 * S_Year_Birth ;
   H13  =     0.02753705077567 * S_Year_Birth ;
   H14  =    -0.07602273274194 * S_Year_Birth ;
   H15  =    -0.04945703736257 * S_Year_Birth ;
   H16  =    -0.02840126211219 * S_Year_Birth ;
   H17  =    -0.16664040149349 * S_Year_Birth ;
   H11  = H11  +    -0.27457126083831 * GRP_AcceptedCmp52
          +     -0.2882719651303 * GRP_AcceptedCmpTotal3
          +      0.0165335174946 * GRP_Frq2  +      0.0650040133085 * GRP_Frq3
          +     0.01379346089007 * GRP_Frq4  +    -0.02885339753071 * GRP_Frq5
          +     -0.0557995532397 * GRP_Frq6  +     0.06688638012515 * GRP_Frq7
          +     0.14348346597984 * GRP_Frq8  +     0.02261308850193 * GRP_Frq9
          +    -0.02604870078446 * GRP_Frq10  +    -0.09049422714038 * 
        GRP_Income2  +    -0.11864913247425 * GRP_Income3
          +     0.03988478957126 * GRP_Income4  +     0.03154722461706 * 
        GRP_Income5  +      -0.031011625499 * GRP_Income6
          +    -0.08916599067864 * GRP_Income7  +    -0.15041071877103 * 
        GRP_Income8  +     0.01121233596611 * GRP_Income9
          +     0.00846277580798 * GRP_Income10  +     0.10925116382231 * 
        GRP_Mnt2  +     0.13947593277299 * GRP_Mnt3  +     0.03019838609598 * 
        GRP_Mnt4  +     0.02930468460858 * GRP_Mnt5  +    -0.11875932366108 * 
        GRP_Mnt6  +     -0.0968957899307 * GRP_Mnt7  +    -0.19041387331169 * 
        GRP_Mnt8  +    -0.01847226835985 * GRP_Mnt9  +    -0.07361357636936 * 
        GRP_Mnt10  +     0.03497947725375 * GRP_MntFishProducts3
          +     0.02592877260581 * GRP_MntFishProducts4
          +    -0.06339099719248 * GRP_MntFishProducts5
          +    -0.05917650742948 * GRP_MntFishProducts6
          +    -0.06449693270029 * GRP_MntFishProducts7
          +     0.07220345558469 * GRP_MntFishProducts8
          +     0.05302431423486 * GRP_MntFishProducts9
          +     0.07006736084879 * GRP_MntFishProducts10
          +    -0.01927397966732 * GRP_MntGoldProds2
          +     0.00813554272623 * GRP_MntGoldProds3
          +     0.01615544486153 * GRP_MntGoldProds4
          +     0.05755535451856 * GRP_MntGoldProds5
          +    -0.11379232218741 * GRP_MntGoldProds6
          +    -0.01439492944609 * GRP_MntGoldProds7
          +     0.03711792777182 * GRP_MntGoldProds8
          +    -0.11269223623052 * GRP_MntGoldProds9
          +     0.04579363541884 * GRP_MntGoldProds10
          +    -0.32237766766899 * GRP_MntMeatProducts2
          +    -0.09067685703431 * GRP_MntMeatProducts3
          +    -0.05534491792097 * GRP_MntMeatProducts4
          +    -0.13563832459623 * GRP_MntMeatProducts5
          +    -0.03620592995881 * GRP_MntMeatProducts6
          +    -0.08493503595938 * GRP_MntMeatProducts7
          +     0.12165711539056 * GRP_MntMeatProducts8
          +     0.10037740804563 * GRP_MntMeatProducts9
          +       0.014484218695 * GRP_MntMeatProducts10
          +    -0.02216824538302 * GRP_MntSweetProducts3
          +     0.09616415999651 * GRP_MntSweetProducts4
          +     0.03909141599729 * GRP_MntSweetProducts5
          +    -0.03380661476159 * GRP_MntSweetProducts6
          +     0.15539873250694 * GRP_MntSweetProducts7
          +    -0.08817314784338 * GRP_MntSweetProducts8
          +    -0.08144635633498 * GRP_MntSweetProducts9
          +    -0.05255801697754 * GRP_MntSweetProducts10
          +      0.1732677110496 * GRP_MntWines2  +     0.08103441740122 * 
        GRP_MntWines3  +     0.10504344960493 * GRP_MntWines4
          +     0.22368517399622 * GRP_MntWines5  +     0.00312827693773 * 
        GRP_MntWines6  +     0.10646235620915 * GRP_MntWines7
          +     -0.0171802368059 * GRP_MntWines8  +    -0.10317334538205 * 
        GRP_MntWines9  +    -0.33534713012874 * GRP_MntWines10
          +    -0.39196643210926 * GRP_NumCatalogPurchases3
          +    -0.13405153432706 * GRP_NumCatalogPurchases4
          +     -0.1408745839048 * GRP_NumCatalogPurchases5
          +     0.03446753278553 * GRP_NumCatalogPurchases6
          +     0.09120767098547 * GRP_NumCatalogPurchases7
          +      -0.019468007716 * GRP_NumDistPurchases2
          +    -0.00703545300617 * GRP_NumDistPurchases3
          +    -0.07033642440361 * GRP_NumDistPurchases4
          +    -0.05069203510159 * GRP_NumDistPurchases5
          +    -0.09426838219524 * GRP_NumDistPurchases6
          +    -0.10775620292637 * GRP_NumDistPurchases7
          +    -0.05899953451216 * GRP_NumDistPurchases8
          +     0.04694525641538 * GRP_NumDistPurchases9
          +     0.12621998594753 * GRP_NumDistPurchases10
          +     0.05821142354481 * GRP_NumWebPurchases2
          +     0.06578164787975 * GRP_NumWebPurchases3
          +      0.0357977753373 * GRP_NumWebPurchases4
          +     0.12660077358516 * GRP_NumWebPurchases5
          +     0.01373165361015 * GRP_NumWebPurchases6
          +     0.00889884869565 * GRP_NumWebPurchases7
          +    -0.09365845479043 * GRP_NumWebPurchases8
          +    -0.15084154352743 * GRP_NumWebVisitsMonth2
          +    -0.26416298149166 * GRP_NumWebVisitsMonth3
          +    -0.24977050492109 * GRP_NumWebVisitsMonth4
          +     0.00921932727625 * GRP_NumWebVisitsMonth5
          +     0.01985702400189 * GRP_NumWebVisitsMonth6
          +    -0.00870053320048 * GRP_NumWebVisitsMonth7
          +     0.10063012045773 * GRP_NumWebVisitsMonth8
          +    -0.09718021706684 * GRP_RFMstat2  +     -0.1867390622846 * 
        GRP_RFMstat3  +    -0.10580841662343 * GRP_RFMstat4
          +    -0.02397309435656 * GRP_RFMstat5  +     0.05714660987804 * 
        GRP_RFMstat6  +     0.05392761339793 * GRP_RFMstat7
          +    -0.10404114760706 * GRP_RFMstat8  +    -0.03650836068636 * 
        GRP_RFMstat9  +     0.04116122267408 * GRP_RFMstat10
          +     0.13753541644014 * GRP_RMntFrq2  +      0.0317668792713 * 
        GRP_RMntFrq3  +     0.11523758605447 * GRP_RMntFrq4
          +     0.10852100173875 * GRP_RMntFrq5  +     0.03667186301252 * 
        GRP_RMntFrq6  +    -0.06223173606957 * GRP_RMntFrq7
          +    -0.05197320285373 * GRP_RMntFrq8  +      0.0536714967616 * 
        GRP_RMntFrq9  +    -0.07245149526125 * GRP_RMntFrq10
          +     0.27704954327346 * GRP_Recency2  +     0.25740573807381 * 
        GRP_Recency3  +     0.20439671976612 * GRP_Recency4
          +     0.18534302276035 * GRP_Recency5  +    -0.08634066715937 * 
        GRP_Recency6  +    -0.04152228887641 * GRP_Recency7
          +     -0.1178654876661 * GRP_Recency8  +    -0.03862846209631 * 
        GRP_Recency9  +    -0.29135005033449 * GRP_Recency10 ;
   H12  = H12  +    -0.12358391399353 * GRP_AcceptedCmp52
          +     0.11306832872376 * GRP_AcceptedCmpTotal3
          +     0.08912947312263 * GRP_Frq2  +    -0.13015422136859 * GRP_Frq3
          +    -0.27792400778045 * GRP_Frq4  +    -0.10651648985743 * GRP_Frq5
          +    -0.03732786661674 * GRP_Frq6  +    -0.04662568019572 * GRP_Frq7
          +    -0.06947917205093 * GRP_Frq8  +     0.05254998273377 * GRP_Frq9
          +     0.01957801159317 * GRP_Frq10  +     0.13628452101137 * 
        GRP_Income2  +    -0.09359063923432 * GRP_Income3
          +    -0.10391157462422 * GRP_Income4  +     0.10760925079046 * 
        GRP_Income5  +    -0.07055918299672 * GRP_Income6
          +     -0.0149251142626 * GRP_Income7  +      0.1294475718688 * 
        GRP_Income8  +     0.13787831360924 * GRP_Income9
          +    -0.04770321446523 * GRP_Income10  +    -0.12661242170951 * 
        GRP_Mnt2  +    -0.01680251442722 * GRP_Mnt3  +    -0.00079428654781 * 
        GRP_Mnt4  +     0.02546987725967 * GRP_Mnt5  +     0.05570091713344 * 
        GRP_Mnt6  +    -0.02183688370496 * GRP_Mnt7  +    -0.09517660337727 * 
        GRP_Mnt8  +    -0.03851529572653 * GRP_Mnt9  +    -0.05827465643295 * 
        GRP_Mnt10  +     0.00802523112025 * GRP_MntFishProducts3
          +    -0.01688733943855 * GRP_MntFishProducts4
          +     0.07943337387451 * GRP_MntFishProducts5
          +     0.02644522515395 * GRP_MntFishProducts6
          +    -0.05246114356304 * GRP_MntFishProducts7
          +    -0.06256992465552 * GRP_MntFishProducts8
          +     0.12436002700496 * GRP_MntFishProducts9
          +     0.13682966445795 * GRP_MntFishProducts10
          +    -0.09649876431393 * GRP_MntGoldProds2
          +    -0.11706910478166 * GRP_MntGoldProds3
          +    -0.08730464348581 * GRP_MntGoldProds4
          +     0.05245174076261 * GRP_MntGoldProds5
          +     -0.1035255388375 * GRP_MntGoldProds6
          +     0.00012563893979 * GRP_MntGoldProds7
          +    -0.10266062995129 * GRP_MntGoldProds8
          +    -0.14782416880614 * GRP_MntGoldProds9
          +     0.04365461065573 * GRP_MntGoldProds10
          +     0.18618419296898 * GRP_MntMeatProducts2
          +      0.2998175200504 * GRP_MntMeatProducts3
          +     0.14404473594989 * GRP_MntMeatProducts4
          +     0.17498712713152 * GRP_MntMeatProducts5
          +    -0.09995829905417 * GRP_MntMeatProducts6
          +     0.02482370732802 * GRP_MntMeatProducts7
          +     0.04895923112963 * GRP_MntMeatProducts8
          +    -0.10873344351445 * GRP_MntMeatProducts9
          +    -0.17312384972174 * GRP_MntMeatProducts10
          +    -0.00902012942575 * GRP_MntSweetProducts3
          +     0.06413252583793 * GRP_MntSweetProducts4
          +    -0.09476529818205 * GRP_MntSweetProducts5
          +    -0.07611107273614 * GRP_MntSweetProducts6
          +     0.14253043340671 * GRP_MntSweetProducts7
          +     0.09742865741227 * GRP_MntSweetProducts8
          +    -0.11544571066709 * GRP_MntSweetProducts9
          +     0.08202701062194 * GRP_MntSweetProducts10
          +    -0.28467827976516 * GRP_MntWines2  +    -0.29841950757653 * 
        GRP_MntWines3  +    -0.06540040056513 * GRP_MntWines4
          +    -0.09754914006375 * GRP_MntWines5  +    -0.06119841306044 * 
        GRP_MntWines6  +     0.02670590790165 * GRP_MntWines7
          +    -0.05821035551271 * GRP_MntWines8  +     0.11322924730071 * 
        GRP_MntWines9  +    -0.09122092619335 * GRP_MntWines10
          +     0.27446830023682 * GRP_NumCatalogPurchases3
          +     0.27825173190563 * GRP_NumCatalogPurchases4
          +     0.02934600040398 * GRP_NumCatalogPurchases5
          +    -0.24090442859654 * GRP_NumCatalogPurchases6
          +    -0.02232921984924 * GRP_NumCatalogPurchases7
          +     0.00536961043745 * GRP_NumDistPurchases2
          +     0.15977203906353 * GRP_NumDistPurchases3
          +    -0.00187486196353 * GRP_NumDistPurchases4
          +    -0.01825938414528 * GRP_NumDistPurchases5
          +    -0.01999564822103 * GRP_NumDistPurchases6
          +     -0.0442143640548 * GRP_NumDistPurchases7
          +     0.18693222597237 * GRP_NumDistPurchases8
          +    -0.02359750991034 * GRP_NumDistPurchases9
          +     -0.0680563963255 * GRP_NumDistPurchases10
          +    -0.12802896329497 * GRP_NumWebPurchases2
          +    -0.12685525422753 * GRP_NumWebPurchases3
          +    -0.03033098051125 * GRP_NumWebPurchases4
          +     0.02095544507908 * GRP_NumWebPurchases5
          +     0.03784049022201 * GRP_NumWebPurchases6
          +     0.16090474548936 * GRP_NumWebPurchases7
          +     0.18171609694396 * GRP_NumWebPurchases8
          +     0.37797647062994 * GRP_NumWebVisitsMonth2
          +     0.10587828755654 * GRP_NumWebVisitsMonth3
          +     0.05451664437616 * GRP_NumWebVisitsMonth4
          +    -0.03021409617172 * GRP_NumWebVisitsMonth5
          +    -0.04633608914143 * GRP_NumWebVisitsMonth6
          +    -0.26869287409045 * GRP_NumWebVisitsMonth7
          +    -0.15489585245223 * GRP_NumWebVisitsMonth8
          +     0.04054670902677 * GRP_RFMstat2  +     0.03035551464427 * 
        GRP_RFMstat3  +    -0.00215842734485 * GRP_RFMstat4
          +    -0.00336986188983 * GRP_RFMstat5  +     0.03837987482431 * 
        GRP_RFMstat6  +    -0.06136601997942 * GRP_RFMstat7
          +    -0.09044052708393 * GRP_RFMstat8  +     0.05908558862207 * 
        GRP_RFMstat9  +    -0.23243914472362 * GRP_RFMstat10
          +    -0.21793950009643 * GRP_RMntFrq2  +     0.09263896824079 * 
        GRP_RMntFrq3  +    -0.02177304206764 * GRP_RMntFrq4
          +    -0.01603985903338 * GRP_RMntFrq5  +    -0.02811613841156 * 
        GRP_RMntFrq6  +     0.09673849387193 * GRP_RMntFrq7
          +     0.17081250015693 * GRP_RMntFrq8  +     0.13143969405516 * 
        GRP_RMntFrq9  +    -0.01617259091276 * GRP_RMntFrq10
          +     -0.1860010049142 * GRP_Recency2  +    -0.18589866925924 * 
        GRP_Recency3  +    -0.10100462356516 * GRP_Recency4
          +    -0.09663111042726 * GRP_Recency5  +      0.1453243638335 * 
        GRP_Recency6  +    -0.03312445332383 * GRP_Recency7
          +     0.07457300072372 * GRP_Recency8  +     0.18783464452758 * 
        GRP_Recency9  +     0.07093626178585 * GRP_Recency10 ;
   H13  = H13  +    -0.09316706350701 * GRP_AcceptedCmp52
          +    -0.08688221861206 * GRP_AcceptedCmpTotal3
          +     0.02220265937895 * GRP_Frq2  +    -0.13875018547683 * GRP_Frq3
          +    -0.14291899717508 * GRP_Frq4  +    -0.12982048580826 * GRP_Frq5
          +    -0.14448991015426 * GRP_Frq6  +    -0.16562517255203 * GRP_Frq7
          +    -0.03606055584428 * GRP_Frq8  +     0.17132951498331 * GRP_Frq9
          +    -0.16334574950289 * GRP_Frq10  +     0.09472495315184 * 
        GRP_Income2  +    -0.07605749607474 * GRP_Income3
          +      -0.168896055443 * GRP_Income4  +     -0.1596827843405 * 
        GRP_Income5  +     -0.0646899267851 * GRP_Income6
          +      0.0258822267391 * GRP_Income7  +     -0.0904884822833 * 
        GRP_Income8  +     0.05428507585705 * GRP_Income9
          +     0.00010512890986 * GRP_Income10  +     0.05119617882938 * 
        GRP_Mnt2  +    -0.02997356371616 * GRP_Mnt3  +    -0.05392816289734 * 
        GRP_Mnt4  +    -0.13827761149583 * GRP_Mnt5  +    -0.09885275832147 * 
        GRP_Mnt6  +    -0.04305820083191 * GRP_Mnt7  +     0.11892844865074 * 
        GRP_Mnt8  +     0.19210998094844 * GRP_Mnt9  +     0.01770207202247 * 
        GRP_Mnt10  +    -0.09637776760754 * GRP_MntFishProducts3
          +     0.03249702033853 * GRP_MntFishProducts4
          +    -0.00380887152232 * GRP_MntFishProducts5
          +     -0.0331168760152 * GRP_MntFishProducts6
          +    -0.24682693966447 * GRP_MntFishProducts7
          +     -0.1374407396509 * GRP_MntFishProducts8
          +     0.00757425754005 * GRP_MntFishProducts9
          +     0.18310555763672 * GRP_MntFishProducts10
          +      0.1076963463344 * GRP_MntGoldProds2
          +     0.08488912276253 * GRP_MntGoldProds3
          +     0.01529494326542 * GRP_MntGoldProds4
          +    -0.07310538642548 * GRP_MntGoldProds5
          +     0.10073591895022 * GRP_MntGoldProds6
          +     0.13584207577723 * GRP_MntGoldProds7
          +     0.09010798952772 * GRP_MntGoldProds8
          +     0.00269955900589 * GRP_MntGoldProds9
          +    -0.08144297878211 * GRP_MntGoldProds10
          +     0.10865364997679 * GRP_MntMeatProducts2
          +    -0.16623314416655 * GRP_MntMeatProducts3
          +    -0.08127843254095 * GRP_MntMeatProducts4
          +     0.07952423663486 * GRP_MntMeatProducts5
          +     0.02545823425737 * GRP_MntMeatProducts6
          +     0.01303094381526 * GRP_MntMeatProducts7
          +    -0.08413642129666 * GRP_MntMeatProducts8
          +    -0.01951356144631 * GRP_MntMeatProducts9
          +    -0.02053520197857 * GRP_MntMeatProducts10
          +     -0.0424532763378 * GRP_MntSweetProducts3
          +    -0.08309021878343 * GRP_MntSweetProducts4
          +    -0.11807002122632 * GRP_MntSweetProducts5
          +     0.10005111456261 * GRP_MntSweetProducts6
          +    -0.06744979845032 * GRP_MntSweetProducts7
          +    -0.07390127150017 * GRP_MntSweetProducts8
          +     0.14835423526178 * GRP_MntSweetProducts9
          +     0.08543899279812 * GRP_MntSweetProducts10
          +    -0.10439578602844 * GRP_MntWines2  +     0.00963054206289 * 
        GRP_MntWines3  +    -0.01462903394922 * GRP_MntWines4
          +      0.0315670218798 * GRP_MntWines5  +    -0.08830718447644 * 
        GRP_MntWines6  +    -0.04888757421925 * GRP_MntWines7
          +     0.16446494942243 * GRP_MntWines8  +     0.00551008216749 * 
        GRP_MntWines9  +     0.21976336113622 * GRP_MntWines10
          +     0.17051630774993 * GRP_NumCatalogPurchases3
          +    -0.02088308440932 * GRP_NumCatalogPurchases4
          +      0.0281386725231 * GRP_NumCatalogPurchases5
          +    -0.11084406042118 * GRP_NumCatalogPurchases6
          +    -0.19078216800394 * GRP_NumCatalogPurchases7
          +      0.1303570905924 * GRP_NumDistPurchases2
          +     0.10611549096256 * GRP_NumDistPurchases3
          +    -0.07214850779052 * GRP_NumDistPurchases4
          +     -0.0726131258026 * GRP_NumDistPurchases5
          +    -0.15930462512862 * GRP_NumDistPurchases6
          +    -0.02025611365267 * GRP_NumDistPurchases7
          +     0.03104023027558 * GRP_NumDistPurchases8
          +    -0.21123981397458 * GRP_NumDistPurchases9
          +    -0.07863675944569 * GRP_NumDistPurchases10
          +    -0.02032446674941 * GRP_NumWebPurchases2
          +      0.0119766491379 * GRP_NumWebPurchases3
          +    -0.10418911005667 * GRP_NumWebPurchases4
          +    -0.10155996464648 * GRP_NumWebPurchases5
          +     -0.1028519954194 * GRP_NumWebPurchases6
          +     -0.0431961250067 * GRP_NumWebPurchases7
          +    -0.08872321482005 * GRP_NumWebPurchases8
          +     0.17794738403334 * GRP_NumWebVisitsMonth2
          +      0.1103646548326 * GRP_NumWebVisitsMonth3
          +     0.05088867448038 * GRP_NumWebVisitsMonth4
          +     0.17401152862117 * GRP_NumWebVisitsMonth5
          +    -0.07854922730514 * GRP_NumWebVisitsMonth6
          +     0.07649296048845 * GRP_NumWebVisitsMonth7
          +    -0.19774399324915 * GRP_NumWebVisitsMonth8
          +     0.02014842262775 * GRP_RFMstat2  +     0.22173985704338 * 
        GRP_RFMstat3  +    -0.01521326895449 * GRP_RFMstat4
          +     0.02483784481732 * GRP_RFMstat5  +     0.19472181579807 * 
        GRP_RFMstat6  +    -0.15963138075025 * GRP_RFMstat7
          +    -0.01728920293571 * GRP_RFMstat8  +    -0.06782934379146 * 
        GRP_RFMstat9  +    -0.00977250928644 * GRP_RFMstat10
          +    -0.00384489820617 * GRP_RMntFrq2  +     0.06443265930338 * 
        GRP_RMntFrq3  +    -0.04105799474043 * GRP_RMntFrq4
          +    -0.06951947562667 * GRP_RMntFrq5  +     -0.0235821493498 * 
        GRP_RMntFrq6  +    -0.03006344872763 * GRP_RMntFrq7
          +    -0.00961580131923 * GRP_RMntFrq8  +    -0.04016874949009 * 
        GRP_RMntFrq9  +      0.0999752134596 * GRP_RMntFrq10
          +    -0.29178823498774 * GRP_Recency2  +    -0.20350379792721 * 
        GRP_Recency3  +    -0.16522305274562 * GRP_Recency4
          +    -0.13499886552537 * GRP_Recency5  +     0.04952729792615 * 
        GRP_Recency6  +     0.06229836271866 * GRP_Recency7
          +    -0.01852242085361 * GRP_Recency8  +    -0.02131897033996 * 
        GRP_Recency9  +     0.20672895128588 * GRP_Recency10 ;
   H14  = H14  +     0.01071953246911 * GRP_AcceptedCmp52
          +    -0.06461940218584 * GRP_AcceptedCmpTotal3
          +      0.0894324243551 * GRP_Frq2  +     0.14551164674415 * GRP_Frq3
          +    -0.02885007499311 * GRP_Frq4  +     0.14170843056992 * GRP_Frq5
          +      0.1448194087902 * GRP_Frq6  +     0.08643717895232 * GRP_Frq7
          +     0.11509564907961 * GRP_Frq8  +    -0.05089408041983 * GRP_Frq9
          +     0.16579969479484 * GRP_Frq10  +    -0.02948069734808 * 
        GRP_Income2  +    -0.04273634547144 * GRP_Income3
          +     0.07858573820417 * GRP_Income4  +    -0.11819484788777 * 
        GRP_Income5  +     0.10808210050899 * GRP_Income6
          +     0.05635717536035 * GRP_Income7  +     0.02870694648581 * 
        GRP_Income8  +     0.03636364114922 * GRP_Income9
          +    -0.04562436396663 * GRP_Income10  +    -0.06781445122239 * 
        GRP_Mnt2  +    -0.11715572379516 * GRP_Mnt3  +     0.00349054869757 * 
        GRP_Mnt4  +     0.02792197480279 * GRP_Mnt5  +    -0.01017711490326 * 
        GRP_Mnt6  +     0.07473091909769 * GRP_Mnt7  +    -0.08450195284729 * 
        GRP_Mnt8  +    -0.03526653311047 * GRP_Mnt9  +     0.00831740495699 * 
        GRP_Mnt10  +     0.06706826065482 * GRP_MntFishProducts3
          +    -0.10680206251603 * GRP_MntFishProducts4
          +    -0.06224682637669 * GRP_MntFishProducts5
          +    -0.15438234553702 * GRP_MntFishProducts6
          +     0.08554531534173 * GRP_MntFishProducts7
          +    -0.08208798665338 * GRP_MntFishProducts8
          +     -0.0226177845135 * GRP_MntFishProducts9
          +    -0.10213867503731 * GRP_MntFishProducts10
          +     -0.2123383588051 * GRP_MntGoldProds2
          +     -0.0079196011043 * GRP_MntGoldProds3
          +     0.06475631380543 * GRP_MntGoldProds4
          +     0.07663588991326 * GRP_MntGoldProds5
          +    -0.01384879164969 * GRP_MntGoldProds6
          +    -0.08139521928662 * GRP_MntGoldProds7
          +     0.02561995850855 * GRP_MntGoldProds8
          +    -0.12018610491882 * GRP_MntGoldProds9
          +     0.05118819490447 * GRP_MntGoldProds10
          +     0.00621465066793 * GRP_MntMeatProducts2
          +    -0.01128187506021 * GRP_MntMeatProducts3
          +      0.1668151183087 * GRP_MntMeatProducts4
          +    -0.00469589246613 * GRP_MntMeatProducts5
          +    -0.02973638276766 * GRP_MntMeatProducts6
          +     0.09283513897938 * GRP_MntMeatProducts7
          +     0.00156665361561 * GRP_MntMeatProducts8
          +     0.09665827883776 * GRP_MntMeatProducts9
          +     0.02735273826412 * GRP_MntMeatProducts10
          +     0.03319263140422 * GRP_MntSweetProducts3
          +    -0.01090810339485 * GRP_MntSweetProducts4
          +    -0.10386446852846 * GRP_MntSweetProducts5
          +     0.04489390653568 * GRP_MntSweetProducts6
          +     -0.1246309369471 * GRP_MntSweetProducts7
          +     -0.0783468435824 * GRP_MntSweetProducts8
          +    -0.17944550614161 * GRP_MntSweetProducts9
          +    -0.18148708357375 * GRP_MntSweetProducts10
          +    -0.03754810557525 * GRP_MntWines2  +     0.33227616052249 * 
        GRP_MntWines3  +    -0.10952056302187 * GRP_MntWines4
          +    -0.19309977187458 * GRP_MntWines5  +    -0.06665843115254 * 
        GRP_MntWines6  +    -0.15444809679017 * GRP_MntWines7
          +      0.1521480058086 * GRP_MntWines8  +     0.04990234603837 * 
        GRP_MntWines9  +      0.0215190291763 * GRP_MntWines10
          +    -0.03574013909657 * GRP_NumCatalogPurchases3
          +     0.01861868156045 * GRP_NumCatalogPurchases4
          +     0.00164729283365 * GRP_NumCatalogPurchases5
          +    -0.08029264062177 * GRP_NumCatalogPurchases6
          +    -0.12924169806649 * GRP_NumCatalogPurchases7
          +    -0.09991925554011 * GRP_NumDistPurchases2
          +     0.18073050846411 * GRP_NumDistPurchases3
          +    -0.15551006949589 * GRP_NumDistPurchases4
          +     0.15081802950402 * GRP_NumDistPurchases5
          +     0.02312408114206 * GRP_NumDistPurchases6
          +    -0.03169443695609 * GRP_NumDistPurchases7
          +    -0.05379076389738 * GRP_NumDistPurchases8
          +     0.19904110786906 * GRP_NumDistPurchases9
          +     -0.1730044050466 * GRP_NumDistPurchases10
          +     0.18657764271039 * GRP_NumWebPurchases2
          +     0.00353763213276 * GRP_NumWebPurchases3
          +     0.04963223619426 * GRP_NumWebPurchases4
          +    -0.11517591892024 * GRP_NumWebPurchases5
          +    -0.00279774618745 * GRP_NumWebPurchases6
          +     0.05144971022046 * GRP_NumWebPurchases7
          +    -0.08267100800373 * GRP_NumWebPurchases8
          +     0.18968233374036 * GRP_NumWebVisitsMonth2
          +     0.03119260972187 * GRP_NumWebVisitsMonth3
          +     0.21694039557006 * GRP_NumWebVisitsMonth4
          +     0.07376293646884 * GRP_NumWebVisitsMonth5
          +    -0.01740027385397 * GRP_NumWebVisitsMonth6
          +     0.02005403596657 * GRP_NumWebVisitsMonth7
          +    -0.05434956224641 * GRP_NumWebVisitsMonth8
          +    -0.09771756627009 * GRP_RFMstat2  +     0.07194462658446 * 
        GRP_RFMstat3  +    -0.05139062495327 * GRP_RFMstat4
          +    -0.12667411650982 * GRP_RFMstat5  +     0.14186789881049 * 
        GRP_RFMstat6  +    -0.13896429495605 * GRP_RFMstat7
          +     0.15695524778926 * GRP_RFMstat8  +    -0.01905424186169 * 
        GRP_RFMstat9  +     0.08435540734078 * GRP_RFMstat10
          +     0.00857732804196 * GRP_RMntFrq2  +      0.1275041361121 * 
        GRP_RMntFrq3  +    -0.11260162363067 * GRP_RMntFrq4
          +     0.01724794097456 * GRP_RMntFrq5  +     0.07192926542116 * 
        GRP_RMntFrq6  +    -0.02371411275797 * GRP_RMntFrq7
          +    -0.09957818845976 * GRP_RMntFrq8  +     0.04085979984244 * 
        GRP_RMntFrq9  +    -0.08537005727014 * GRP_RMntFrq10
          +    -0.10076590903384 * GRP_Recency2  +    -0.17391140666387 * 
        GRP_Recency3  +    -0.03520132702185 * GRP_Recency4
          +    -0.15270778645553 * GRP_Recency5  +     0.17662248372889 * 
        GRP_Recency6  +     0.01323791656115 * GRP_Recency7
          +    -0.00626808504011 * GRP_Recency8  +      0.0119916912422 * 
        GRP_Recency9  +     -0.0484820772442 * GRP_Recency10 ;
   H15  = H15  +     0.10886307444453 * GRP_AcceptedCmp52
          +    -0.09141476953226 * GRP_AcceptedCmpTotal3
          +    -0.14930623104714 * GRP_Frq2  +      0.0001018204747 * GRP_Frq3
          +    -0.31361056551275 * GRP_Frq4  +    -0.05958442956735 * GRP_Frq5
          +    -0.01962763097788 * GRP_Frq6  +     0.19629918365066 * GRP_Frq7
          +     0.04692744377057 * GRP_Frq8  +     0.17054278472024 * GRP_Frq9
          +     0.07134228041533 * GRP_Frq10  +    -0.12906657270123 * 
        GRP_Income2  +     0.01815973180249 * GRP_Income3
          +     0.04101883053911 * GRP_Income4  +     0.08459345278601 * 
        GRP_Income5  +      0.0665628565644 * GRP_Income6
          +    -0.18654503589953 * GRP_Income7  +    -0.04092050460131 * 
        GRP_Income8  +      0.0042837824954 * GRP_Income9
          +     -0.1225136493777 * GRP_Income10  +    -0.09735261669213 * 
        GRP_Mnt2  +     0.02370606672105 * GRP_Mnt3  +     0.06279496136534 * 
        GRP_Mnt4  +    -0.01641605962318 * GRP_Mnt5  +     0.00058349191947 * 
        GRP_Mnt6  +      0.0262135333519 * GRP_Mnt7  +     0.02402382166218 * 
        GRP_Mnt8  +    -0.11045981131563 * GRP_Mnt9  +     0.01335607474901 * 
        GRP_Mnt10  +      -0.001031809476 * GRP_MntFishProducts3
          +     0.06517892494465 * GRP_MntFishProducts4
          +    -0.02105260007195 * GRP_MntFishProducts5
          +     0.07816980749668 * GRP_MntFishProducts6
          +     0.09166611577818 * GRP_MntFishProducts7
          +     0.02623679207974 * GRP_MntFishProducts8
          +    -0.01701253974019 * GRP_MntFishProducts9
          +    -0.17369285723227 * GRP_MntFishProducts10
          +     -0.0257615698775 * GRP_MntGoldProds2
          +    -0.00281150265384 * GRP_MntGoldProds3
          +    -0.07457719455266 * GRP_MntGoldProds4
          +    -0.02701914687994 * GRP_MntGoldProds5
          +      0.0320668652934 * GRP_MntGoldProds6
          +     0.05874167386173 * GRP_MntGoldProds7
          +    -0.17678260281395 * GRP_MntGoldProds8
          +     0.00108323929767 * GRP_MntGoldProds9
          +    -0.02609952249201 * GRP_MntGoldProds10
          +     0.02269200571808 * GRP_MntMeatProducts2
          +    -0.13735702811418 * GRP_MntMeatProducts3
          +     0.01593653669761 * GRP_MntMeatProducts4
          +    -0.05235397183307 * GRP_MntMeatProducts5
          +     0.06214731463774 * GRP_MntMeatProducts6
          +    -0.04587757079082 * GRP_MntMeatProducts7
          +     0.03385994796195 * GRP_MntMeatProducts8
          +    -0.06730939985929 * GRP_MntMeatProducts9
          +     0.02955920615331 * GRP_MntMeatProducts10
          +     0.02538436200453 * GRP_MntSweetProducts3
          +    -0.05289452464152 * GRP_MntSweetProducts4
          +     0.12111073059475 * GRP_MntSweetProducts5
          +     0.14232094532509 * GRP_MntSweetProducts6
          +    -0.04679821143864 * GRP_MntSweetProducts7
          +     0.13013205904303 * GRP_MntSweetProducts8
          +     0.05234871756974 * GRP_MntSweetProducts9
          +     0.21348485656819 * GRP_MntSweetProducts10
          +    -0.14424630240261 * GRP_MntWines2  +     0.00497090414999 * 
        GRP_MntWines3  +    -0.03461787755729 * GRP_MntWines4
          +      0.0073319659503 * GRP_MntWines5  +     0.06962517498634 * 
        GRP_MntWines6  +    -0.06837792711609 * GRP_MntWines7
          +     -0.0208414323719 * GRP_MntWines8  +     0.01993619131684 * 
        GRP_MntWines9  +    -0.07506403365351 * GRP_MntWines10
          +    -0.01769508366756 * GRP_NumCatalogPurchases3
          +      0.0693344187484 * GRP_NumCatalogPurchases4
          +    -0.15019953298298 * GRP_NumCatalogPurchases5
          +     0.07901567777775 * GRP_NumCatalogPurchases6
          +    -0.00639000664073 * GRP_NumCatalogPurchases7
          +      0.0336567746391 * GRP_NumDistPurchases2
          +      0.1750985730927 * GRP_NumDistPurchases3
          +     0.03546686017737 * GRP_NumDistPurchases4
          +    -0.00971459569262 * GRP_NumDistPurchases5
          +    -0.07855734622345 * GRP_NumDistPurchases6
          +     0.11885795672993 * GRP_NumDistPurchases7
          +    -0.05465836198109 * GRP_NumDistPurchases8
          +      0.0190044315646 * GRP_NumDistPurchases9
          +    -0.02674942070656 * GRP_NumDistPurchases10
          +    -0.02567620277867 * GRP_NumWebPurchases2
          +    -0.05670996651155 * GRP_NumWebPurchases3
          +    -0.04731165021578 * GRP_NumWebPurchases4
          +     0.00812774715596 * GRP_NumWebPurchases5
          +    -0.02473143850008 * GRP_NumWebPurchases6
          +     0.14971881883908 * GRP_NumWebPurchases7
          +     0.05509947478244 * GRP_NumWebPurchases8
          +     0.10573374107522 * GRP_NumWebVisitsMonth2
          +     0.02609642083905 * GRP_NumWebVisitsMonth3
          +     0.12685900243413 * GRP_NumWebVisitsMonth4
          +    -0.08044983304842 * GRP_NumWebVisitsMonth5
          +     0.09577058423339 * GRP_NumWebVisitsMonth6
          +      0.1870383976325 * GRP_NumWebVisitsMonth7
          +     0.13512907999722 * GRP_NumWebVisitsMonth8
          +     0.02499103981433 * GRP_RFMstat2  +     -0.0012604186181 * 
        GRP_RFMstat3  +     -0.0139909895856 * GRP_RFMstat4
          +     0.10092163696892 * GRP_RFMstat5  +     0.05642191959698 * 
        GRP_RFMstat6  +    -0.05954031177389 * GRP_RFMstat7
          +     0.02035715844336 * GRP_RFMstat8  +     0.01687040966927 * 
        GRP_RFMstat9  +     0.11588167321885 * GRP_RFMstat10
          +     0.10058670183272 * GRP_RMntFrq2  +     0.15879689915766 * 
        GRP_RMntFrq3  +     0.04667944767764 * GRP_RMntFrq4
          +    -0.15196599849656 * GRP_RMntFrq5  +     0.02280744723717 * 
        GRP_RMntFrq6  +     0.03763093906535 * GRP_RMntFrq7
          +    -0.00355321572205 * GRP_RMntFrq8  +     0.04758490465011 * 
        GRP_RMntFrq9  +     0.01254716566017 * GRP_RMntFrq10
          +    -0.04848252945572 * GRP_Recency2  +    -0.08043146293306 * 
        GRP_Recency3  +     0.00637533323705 * GRP_Recency4
          +    -0.01156980272453 * GRP_Recency5  +    -0.12161478172017 * 
        GRP_Recency6  +    -0.00510381849313 * GRP_Recency7
          +    -0.09894631445766 * GRP_Recency8  +     0.02314716771759 * 
        GRP_Recency9  +     0.00607453368106 * GRP_Recency10 ;
   H16  = H16  +     0.04560334544784 * GRP_AcceptedCmp52
          +      0.0792009785355 * GRP_AcceptedCmpTotal3
          +     -0.0124290531194 * GRP_Frq2  +     0.03942143739911 * GRP_Frq3
          +     0.15834505962283 * GRP_Frq4  +     0.13657867386823 * GRP_Frq5
          +    -0.09909566873427 * GRP_Frq6  +    -0.00374716809854 * GRP_Frq7
          +     0.05475582453764 * GRP_Frq8  +     0.04177468386811 * GRP_Frq9
          +     0.32130956079427 * GRP_Frq10  +    -0.01663475923697 * 
        GRP_Income2  +    -0.07540253562398 * GRP_Income3
          +     0.09224642047363 * GRP_Income4  +    -0.12632272788468 * 
        GRP_Income5  +    -0.08484542372027 * GRP_Income6
          +     0.06493340074367 * GRP_Income7  +     0.12547279997578 * 
        GRP_Income8  +     0.03305866255367 * GRP_Income9
          +    -0.05334375320475 * GRP_Income10  +     -0.1244751694519 * 
        GRP_Mnt2  +    -0.14333744662066 * GRP_Mnt3  +     0.00923679681586 * 
        GRP_Mnt4  +     0.17011945406529 * GRP_Mnt5  +    -0.01491013870453 * 
        GRP_Mnt6  +      0.1398776007466 * GRP_Mnt7  +    -0.12265469498804 * 
        GRP_Mnt8  +    -0.10470674811597 * GRP_Mnt9  +    -0.11613981752739 * 
        GRP_Mnt10  +     -0.1435145336959 * GRP_MntFishProducts3
          +      0.0671274756531 * GRP_MntFishProducts4
          +    -0.08883253998299 * GRP_MntFishProducts5
          +    -0.03748787285737 * GRP_MntFishProducts6
          +     0.02046138794647 * GRP_MntFishProducts7
          +     0.06541747713468 * GRP_MntFishProducts8
          +      0.0020927081278 * GRP_MntFishProducts9
          +    -0.01820059213204 * GRP_MntFishProducts10
          +     0.12913850719168 * GRP_MntGoldProds2
          +    -0.11454734283992 * GRP_MntGoldProds3
          +    -0.03787480948393 * GRP_MntGoldProds4
          +     0.10090513466885 * GRP_MntGoldProds5
          +    -0.03912797375616 * GRP_MntGoldProds6
          +       0.008573756121 * GRP_MntGoldProds7
          +     0.20210211313573 * GRP_MntGoldProds8
          +    -0.01491860471696 * GRP_MntGoldProds9
          +     0.18300761768606 * GRP_MntGoldProds10
          +     0.07446614047588 * GRP_MntMeatProducts2
          +     0.09479933375513 * GRP_MntMeatProducts3
          +     0.17191509956786 * GRP_MntMeatProducts4
          +     0.00520549298368 * GRP_MntMeatProducts5
          +    -0.03556989667137 * GRP_MntMeatProducts6
          +     0.04882067449331 * GRP_MntMeatProducts7
          +    -0.01002309093613 * GRP_MntMeatProducts8
          +    -0.02726750094366 * GRP_MntMeatProducts9
          +    -0.26142062441213 * GRP_MntMeatProducts10
          +     0.05909942170336 * GRP_MntSweetProducts3
          +    -0.04563924523159 * GRP_MntSweetProducts4
          +       0.037735444613 * GRP_MntSweetProducts5
          +    -0.08613703519228 * GRP_MntSweetProducts6
          +    -0.05795278262054 * GRP_MntSweetProducts7
          +    -0.09155269081154 * GRP_MntSweetProducts8
          +    -0.05696268909421 * GRP_MntSweetProducts9
          +    -0.18187795877629 * GRP_MntSweetProducts10
          +     0.00002022743319 * GRP_MntWines2  +      0.0069639077064 * 
        GRP_MntWines3  +    -0.21365781094781 * GRP_MntWines4
          +    -0.03937352318962 * GRP_MntWines5  +    -0.04669406967934 * 
        GRP_MntWines6  +     0.17339580679014 * GRP_MntWines7
          +     0.08731821722828 * GRP_MntWines8  +     0.06609679803106 * 
        GRP_MntWines9  +     0.15322579318294 * GRP_MntWines10
          +     0.53649313219519 * GRP_NumCatalogPurchases3
          +     0.10802339200943 * GRP_NumCatalogPurchases4
          +     -0.1559722894884 * GRP_NumCatalogPurchases5
          +     0.00690258519125 * GRP_NumCatalogPurchases6
          +    -0.05823581889593 * GRP_NumCatalogPurchases7
          +     -0.0892386326214 * GRP_NumDistPurchases2
          +      0.1099586571427 * GRP_NumDistPurchases3
          +    -0.00372327158741 * GRP_NumDistPurchases4
          +     0.08058130182666 * GRP_NumDistPurchases5
          +     0.07608652810845 * GRP_NumDistPurchases6
          +     0.10728894561959 * GRP_NumDistPurchases7
          +     0.22657815795591 * GRP_NumDistPurchases8
          +     0.00005481450606 * GRP_NumDistPurchases9
          +    -0.04405240256405 * GRP_NumDistPurchases10
          +     0.08531639260704 * GRP_NumWebPurchases2
          +    -0.01311969724144 * GRP_NumWebPurchases3
          +     0.01203598453956 * GRP_NumWebPurchases4
          +      0.0446838861403 * GRP_NumWebPurchases5
          +     0.03172975544028 * GRP_NumWebPurchases6
          +    -0.11743389659544 * GRP_NumWebPurchases7
          +     -0.0032942396637 * GRP_NumWebPurchases8
          +     0.38612227582146 * GRP_NumWebVisitsMonth2
          +     0.04321181405881 * GRP_NumWebVisitsMonth3
          +     0.10743155899433 * GRP_NumWebVisitsMonth4
          +      0.1763198241391 * GRP_NumWebVisitsMonth5
          +    -0.12699239153956 * GRP_NumWebVisitsMonth6
          +    -0.10086837765024 * GRP_NumWebVisitsMonth7
          +    -0.24707273445227 * GRP_NumWebVisitsMonth8
          +    -0.00949311547422 * GRP_RFMstat2  +      0.0606013750995 * 
        GRP_RFMstat3  +     0.00069687993839 * GRP_RFMstat4
          +     0.04757292681257 * GRP_RFMstat5  +    -0.01094643104576 * 
        GRP_RFMstat6  +    -0.06104550696604 * GRP_RFMstat7
          +       0.013881751366 * GRP_RFMstat8  +    -0.01138329284578 * 
        GRP_RFMstat9  +     0.00276718643583 * GRP_RFMstat10
          +     0.08253406999973 * GRP_RMntFrq2  +    -0.13476711166759 * 
        GRP_RMntFrq3  +     0.00109332436232 * GRP_RMntFrq4
          +     0.08254935387199 * GRP_RMntFrq5  +    -0.05031162729999 * 
        GRP_RMntFrq6  +     0.08667223153356 * GRP_RMntFrq7
          +     0.06401664719874 * GRP_RMntFrq8  +    -0.02917008730768 * 
        GRP_RMntFrq9  +     0.15980356286515 * GRP_RMntFrq10
          +    -0.33093762404066 * GRP_Recency2  +    -0.05494964591102 * 
        GRP_Recency3  +    -0.37311459916113 * GRP_Recency4
          +    -0.02680457179473 * GRP_Recency5  +     -0.1060465605844 * 
        GRP_Recency6  +     0.02070105469983 * GRP_Recency7
          +     0.11696205079934 * GRP_Recency8  +     0.18084628307877 * 
        GRP_Recency9  +     0.28706495246548 * GRP_Recency10 ;
   H17  = H17  +     0.00344366732351 * GRP_AcceptedCmp52
          +    -0.05085164462133 * GRP_AcceptedCmpTotal3
          +     0.06849255259405 * GRP_Frq2  +    -0.07381006724232 * GRP_Frq3
          +    -0.07433233570269 * GRP_Frq4  +    -0.01070137611395 * GRP_Frq5
          +    -0.16400408628141 * GRP_Frq6  +     -0.0235493332713 * GRP_Frq7
          +    -0.06977762099822 * GRP_Frq8  +     0.04740490147038 * GRP_Frq9
          +     0.05174511921176 * GRP_Frq10  +     0.10449948098175 * 
        GRP_Income2  +    -0.05546698910271 * GRP_Income3
          +    -0.02026210178594 * GRP_Income4  +    -0.02757426920512 * 
        GRP_Income5  +      0.0188564263716 * GRP_Income6
          +    -0.02773092111365 * GRP_Income7  +     0.01892264748415 * 
        GRP_Income8  +     0.11970327100159 * GRP_Income9
          +     -0.0988518772613 * GRP_Income10  +      0.1072923687804 * 
        GRP_Mnt2  +     0.01196539744907 * GRP_Mnt3  +     0.05319575879007 * 
        GRP_Mnt4  +    -0.04866861102463 * GRP_Mnt5  +       0.071979352321 * 
        GRP_Mnt6  +    -0.03163583853582 * GRP_Mnt7  +    -0.09909179638478 * 
        GRP_Mnt8  +    -0.13687949771862 * GRP_Mnt9  +    -0.07561489859448 * 
        GRP_Mnt10  +    -0.07803390779674 * GRP_MntFishProducts3
          +     0.01478378006285 * GRP_MntFishProducts4
          +     0.07672362238279 * GRP_MntFishProducts5
          +    -0.02358661166706 * GRP_MntFishProducts6
          +    -0.08588488418885 * GRP_MntFishProducts7
          +    -0.11520920807552 * GRP_MntFishProducts8
          +     -0.0197078009616 * GRP_MntFishProducts9
          +    -0.09191265823181 * GRP_MntFishProducts10
          +     0.19411067126627 * GRP_MntGoldProds2
          +      0.2462190553504 * GRP_MntGoldProds3
          +     0.11130765048854 * GRP_MntGoldProds4
          +     0.10751048867742 * GRP_MntGoldProds5
          +    -0.05060557333037 * GRP_MntGoldProds6
          +     0.19117819976798 * GRP_MntGoldProds7
          +     0.11021926619171 * GRP_MntGoldProds8
          +     0.02149837520327 * GRP_MntGoldProds9
          +     0.08784469234715 * GRP_MntGoldProds10
          +     0.04638704950097 * GRP_MntMeatProducts2
          +    -0.05299850180317 * GRP_MntMeatProducts3
          +    -0.07873824950704 * GRP_MntMeatProducts4
          +     0.16695068934671 * GRP_MntMeatProducts5
          +     0.02145858048611 * GRP_MntMeatProducts6
          +     0.13796802778238 * GRP_MntMeatProducts7
          +     0.14983402082758 * GRP_MntMeatProducts8
          +    -0.11974328831838 * GRP_MntMeatProducts9
          +     0.17766752421522 * GRP_MntMeatProducts10
          +     0.04090771242253 * GRP_MntSweetProducts3
          +    -0.01637530761985 * GRP_MntSweetProducts4
          +    -0.03091917565231 * GRP_MntSweetProducts5
          +     -0.1361701861429 * GRP_MntSweetProducts6
          +      -0.121451177342 * GRP_MntSweetProducts7
          +    -0.04776470920755 * GRP_MntSweetProducts8
          +    -0.00419431536984 * GRP_MntSweetProducts9
          +     0.06839103312499 * GRP_MntSweetProducts10
          +     0.03255949749474 * GRP_MntWines2  +    -0.06491639613801 * 
        GRP_MntWines3  +     0.04526032037152 * GRP_MntWines4
          +    -0.13413589293967 * GRP_MntWines5  +     0.01979217538837 * 
        GRP_MntWines6  +     0.06132805645526 * GRP_MntWines7
          +    -0.17884775781432 * GRP_MntWines8  +     0.06723845041252 * 
        GRP_MntWines9  +    -0.11802722706977 * GRP_MntWines10
          +    -0.13469501544875 * GRP_NumCatalogPurchases3
          +     0.10437849330506 * GRP_NumCatalogPurchases4
          +    -0.10238944046221 * GRP_NumCatalogPurchases5
          +     0.25239457618915 * GRP_NumCatalogPurchases6
          +    -0.04311890106122 * GRP_NumCatalogPurchases7
          +     0.14314412544138 * GRP_NumDistPurchases2
          +    -0.02251898653754 * GRP_NumDistPurchases3
          +     0.09923814342281 * GRP_NumDistPurchases4
          +      0.1070484412301 * GRP_NumDistPurchases5
          +     0.03907906433135 * GRP_NumDistPurchases6
          +     0.06744835513133 * GRP_NumDistPurchases7
          +     0.05075217048734 * GRP_NumDistPurchases8
          +     0.05637489409645 * GRP_NumDistPurchases9
          +     0.18422799737764 * GRP_NumDistPurchases10
          +    -0.03724545644791 * GRP_NumWebPurchases2
          +     -0.0425571341212 * GRP_NumWebPurchases3
          +     0.08565233833888 * GRP_NumWebPurchases4
          +    -0.00870288161048 * GRP_NumWebPurchases5
          +     -0.0456295907564 * GRP_NumWebPurchases6
          +     0.00527043360692 * GRP_NumWebPurchases7
          +     0.05595593381462 * GRP_NumWebPurchases8
          +     0.13918156734466 * GRP_NumWebVisitsMonth2
          +    -0.03877657521533 * GRP_NumWebVisitsMonth3
          +    -0.04967689388372 * GRP_NumWebVisitsMonth4
          +    -0.07659986940605 * GRP_NumWebVisitsMonth5
          +    -0.00482027839524 * GRP_NumWebVisitsMonth6
          +    -0.03499153084734 * GRP_NumWebVisitsMonth7
          +    -0.03731338783829 * GRP_NumWebVisitsMonth8
          +    -0.28723503724294 * GRP_RFMstat2  +     -0.1964673241979 * 
        GRP_RFMstat3  +     0.03738704243948 * GRP_RFMstat4
          +     0.00033143322256 * GRP_RFMstat5  +    -0.17142659820969 * 
        GRP_RFMstat6  +     0.01703938377256 * GRP_RFMstat7
          +    -0.04291983565161 * GRP_RFMstat8  +     0.00587396977846 * 
        GRP_RFMstat9  +     0.11123814792375 * GRP_RFMstat10
          +    -0.03576146053433 * GRP_RMntFrq2  +    -0.11388253139104 * 
        GRP_RMntFrq3  +    -0.15950517673473 * GRP_RMntFrq4
          +     0.04949799565035 * GRP_RMntFrq5  +    -0.15524481203884 * 
        GRP_RMntFrq6  +    -0.13504407355289 * GRP_RMntFrq7
          +    -0.03167783548387 * GRP_RMntFrq8  +    -0.03669253223509 * 
        GRP_RMntFrq9  +    -0.05967716551252 * GRP_RMntFrq10
          +    -0.06163563153904 * GRP_Recency2  +     0.01372918489899 * 
        GRP_Recency3  +     0.06331929253132 * GRP_Recency4
          +     0.12554884559749 * GRP_Recency5  +    -0.07871532152132 * 
        GRP_Recency6  +     0.05113686048813 * GRP_Recency7
          +     0.05067053788164 * GRP_Recency8  +    -0.08066403153869 * 
        GRP_Recency9  +    -0.01871140107407 * GRP_Recency10 ;
   H11  =    -0.22090014441173 + H11 ;
   H12  =      0.7938625735214 + H12 ;
   H13  =    -0.02803857026454 + H13 ;
   H14  =    -1.49984857300756 + H14 ;
   H15  =     0.69609172873771 + H15 ;
   H16  =    -0.35701522413568 + H16 ;
   H17  =     0.35195323490594 + H17 ;
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
   P_DepVar1  =      5.2679890618814 * H11  +    -4.64032348095386 * H12
          +    -3.51419784245436 * H13  +    -1.41988180667552 * H14
          +    -0.64492920049272 * H15  +    -4.44282536224268 * H16
          +      0.2098288805141 * H17 ;
   P_DepVar1  =    -1.83708643516383 + P_DepVar1 ;
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
