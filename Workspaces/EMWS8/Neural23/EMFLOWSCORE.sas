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
   H11  =    -0.04164287978559 * S_Year_Birth ;
   H12  =    -0.02490264183444 * S_Year_Birth ;
   H13  =     0.04507798460994 * S_Year_Birth ;
   H14  =      0.1183690193773 * S_Year_Birth ;
   H15  =    -0.21394698598762 * S_Year_Birth ;
   H16  =     0.03665586831897 * S_Year_Birth ;
   H11  = H11  +    -0.41114343375393 * GRP_AcceptedCmp52
          +    -0.14428053886192 * GRP_AcceptedCmpTotal3
          +     0.02494899822458 * GRP_Frq2  +      0.0755437728787 * GRP_Frq3
          +    -0.11590634033502 * GRP_Frq4  +     0.00798603100667 * GRP_Frq5
          +    -0.15439129854138 * GRP_Frq6  +     0.03772268032836 * GRP_Frq7
          +    -0.01518216152977 * GRP_Frq8  +    -0.00058235066611 * GRP_Frq9
          +    -0.03373106828213 * GRP_Frq10  +     0.08259003699244 *
        GRP_Income2  +     0.05322186464327 * GRP_Income3
          +     0.02970652269421 * GRP_Income4  +    -0.03522946367528 *
        GRP_Income5  +     0.01621699696165 * GRP_Income6
          +    -0.07093297239275 * GRP_Income7  +     -0.0122745789347 *
        GRP_Income8  +     0.20668262349288 * GRP_Income9
          +     0.17321621879494 * GRP_Income10  +     0.04203078613277 *
        GRP_Mnt2  +     0.03302522237746 * GRP_Mnt3  +    -0.06604968615825 *
        GRP_Mnt4  +     -0.0338011225884 * GRP_Mnt5  +    -0.06018351711892 *
        GRP_Mnt6  +     0.05369737169858 * GRP_Mnt7  +     0.15193171494077 *
        GRP_Mnt8  +    -0.01001992932469 * GRP_Mnt9  +     0.15132478263306 *
        GRP_Mnt10  +      0.0834891458205 * GRP_MntFishProducts3
          +    -0.01195735120186 * GRP_MntFishProducts4
          +    -0.06708453587041 * GRP_MntFishProducts5
          +    -0.02680253338094 * GRP_MntFishProducts6
          +     0.07892124193799 * GRP_MntFishProducts7
          +     0.12808064695802 * GRP_MntFishProducts8
          +     0.14943450902453 * GRP_MntFishProducts9
          +    -0.03915291343309 * GRP_MntFishProducts10
          +     0.12622003311103 * GRP_MntGoldProds2
          +     0.04845903153601 * GRP_MntGoldProds3
          +    -0.08370679196604 * GRP_MntGoldProds4
          +    -0.05651145689444 * GRP_MntGoldProds5
          +     0.08465653011715 * GRP_MntGoldProds6
          +    -0.04548010470735 * GRP_MntGoldProds7
          +    -0.29950770690943 * GRP_MntGoldProds8
          +    -0.16078656397499 * GRP_MntGoldProds9
          +    -0.12650170215916 * GRP_MntGoldProds10
          +    -0.20582413521459 * GRP_MntMeatProducts2
          +    -0.19301669866874 * GRP_MntMeatProducts3
          +    -0.10052903349136 * GRP_MntMeatProducts4
          +    -0.02673606650631 * GRP_MntMeatProducts5
          +    -0.05608459630015 * GRP_MntMeatProducts6
          +    -0.24453752978062 * GRP_MntMeatProducts7
          +     0.02869831662267 * GRP_MntMeatProducts8
          +     0.01206766737407 * GRP_MntMeatProducts9
          +     0.22489561550264 * GRP_MntMeatProducts10
          +    -0.02209567942784 * GRP_MntSweetProducts3
          +     0.16105454590149 * GRP_MntSweetProducts4
          +    -0.01229323162486 * GRP_MntSweetProducts5
          +    -0.09424409723888 * GRP_MntSweetProducts6
          +     0.12107663427317 * GRP_MntSweetProducts7
          +     0.09962269280971 * GRP_MntSweetProducts8
          +     0.05361406364518 * GRP_MntSweetProducts9
          +    -0.00395783275124 * GRP_MntSweetProducts10
          +     0.08949226622664 * GRP_MntWines2  +     0.04075126649658 *
        GRP_MntWines3  +    -0.11091151930043 * GRP_MntWines4
          +     0.01814630958287 * GRP_MntWines5  +     0.18880264577509 *
        GRP_MntWines6  +     -0.0373067553175 * GRP_MntWines7
          +    -0.00287969317399 * GRP_MntWines8  +     -0.3523382993572 *
        GRP_MntWines9  +    -0.34266498513706 * GRP_MntWines10
          +    -0.14803737137331 * GRP_NumCatalogPurchases3
          +    -0.08265008862549 * GRP_NumCatalogPurchases4
          +    -0.12511088178753 * GRP_NumCatalogPurchases5
          +     0.00474968987534 * GRP_NumCatalogPurchases6
          +     0.14609799849823 * GRP_NumCatalogPurchases7
          +    -0.05389661542955 * GRP_NumDistPurchases2
          +    -0.11738842840653 * GRP_NumDistPurchases3
          +    -0.15421759544192 * GRP_NumDistPurchases4
          +    -0.10089958443443 * GRP_NumDistPurchases5
          +    -0.04876379400743 * GRP_NumDistPurchases6
          +    -0.18872427849232 * GRP_NumDistPurchases7
          +    -0.02839661025435 * GRP_NumDistPurchases8
          +     0.09712629880452 * GRP_NumDistPurchases9
          +     0.12000394616091 * GRP_NumDistPurchases10
          +    -0.13603297525579 * GRP_NumWebPurchases2
          +     0.10268732487313 * GRP_NumWebPurchases3
          +    -0.01771398558841 * GRP_NumWebPurchases4
          +     0.00479481463651 * GRP_NumWebPurchases5
          +    -0.08807024568619 * GRP_NumWebPurchases6
          +    -0.08333649974504 * GRP_NumWebPurchases7
          +     0.28590568471848 * GRP_NumWebPurchases8
          +    -0.06598504122009 * GRP_NumWebVisitsMonth2
          +    -0.02372166000515 * GRP_NumWebVisitsMonth3
          +     -0.1032796286982 * GRP_NumWebVisitsMonth4
          +    -0.10680258273696 * GRP_NumWebVisitsMonth5
          +      0.1065086124019 * GRP_NumWebVisitsMonth6
          +     0.04050154033216 * GRP_NumWebVisitsMonth7
          +     0.32964695288769 * GRP_NumWebVisitsMonth8
          +     0.14827099846784 * GRP_RFMstat2  +    -0.07995093014675 *
        GRP_RFMstat3  +    -0.01585578103823 * GRP_RFMstat4
          +     0.08565308252298 * GRP_RFMstat5  +    -0.09304024805558 *
        GRP_RFMstat6  +    -0.07290227780167 * GRP_RFMstat7
          +    -0.07617585964696 * GRP_RFMstat8  +     -0.0587968344928 *
        GRP_RFMstat9  +    -0.01551420153256 * GRP_RFMstat10
          +     0.21226282821781 * GRP_RMntFrq2  +     0.04770705042442 *
        GRP_RMntFrq3  +     0.22006470165495 * GRP_RMntFrq4
          +     0.13763540637433 * GRP_RMntFrq5  +    -0.10972526934296 *
        GRP_RMntFrq6  +     0.08304532044699 * GRP_RMntFrq7
          +     0.15788377163489 * GRP_RMntFrq8  +      0.1460293835649 *
        GRP_RMntFrq9  +     0.00491352943087 * GRP_RMntFrq10
          +     0.17421887439111 * GRP_Recency2  +     0.20197432720718 *
        GRP_Recency3  +    -0.01610485949606 * GRP_Recency4
          +     0.07705394334947 * GRP_Recency5  +     0.03059327385395 *
        GRP_Recency6  +    -0.13952963263034 * GRP_Recency7
          +    -0.12436739033264 * GRP_Recency8  +     0.03881295285714 *
        GRP_Recency9  +     -0.2017924917039 * GRP_Recency10 ;
   H12  = H12  +     -0.1274374305515 * GRP_AcceptedCmp52
          +    -0.03296718660529 * GRP_AcceptedCmpTotal3
          +    -0.00158749941279 * GRP_Frq2  +     0.13135632234122 * GRP_Frq3
          +     0.11174599066781 * GRP_Frq4  +     0.08293204522419 * GRP_Frq5
          +     0.07891839019015 * GRP_Frq6  +     0.10689447665509 * GRP_Frq7
          +      -0.058875592211 * GRP_Frq8  +    -0.08506909936634 * GRP_Frq9
          +    -0.03761019712811 * GRP_Frq10  +    -0.11942683577675 *
        GRP_Income2  +    -0.08647698006174 * GRP_Income3
          +     0.02000126969083 * GRP_Income4  +    -0.07666270612285 *
        GRP_Income5  +    -0.17332133422853 * GRP_Income6
          +    -0.28328894338184 * GRP_Income7  +    -0.17823712265233 *
        GRP_Income8  +    -0.39080487229489 * GRP_Income9
          +    -0.22583689896606 * GRP_Income10  +     0.14951111119544 *
        GRP_Mnt2  +     0.12789103442776 * GRP_Mnt3  +     0.04989580545705 *
        GRP_Mnt4  +    -0.02181320104822 * GRP_Mnt5  +     0.02850530148713 *
        GRP_Mnt6  +    -0.19810993494342 * GRP_Mnt7  +    -0.12534704012491 *
        GRP_Mnt8  +    -0.01655492905982 * GRP_Mnt9  +     -0.1506358789311 *
        GRP_Mnt10  +    -0.07698731445217 * GRP_MntFishProducts3
          +    -0.02453518527533 * GRP_MntFishProducts4
          +     0.21154268764191 * GRP_MntFishProducts5
          +     0.09340929157714 * GRP_MntFishProducts6
          +     0.05339923043457 * GRP_MntFishProducts7
          +    -0.04852527469447 * GRP_MntFishProducts8
          +     0.02676605860166 * GRP_MntFishProducts9
          +    -0.10646179978188 * GRP_MntFishProducts10
          +    -0.03613972637561 * GRP_MntGoldProds2
          +     0.05734455860002 * GRP_MntGoldProds3
          +     0.09333847144138 * GRP_MntGoldProds4
          +     0.00328029112662 * GRP_MntGoldProds5
          +    -0.14936992509725 * GRP_MntGoldProds6
          +     0.00353880682303 * GRP_MntGoldProds7
          +    -0.10043815369757 * GRP_MntGoldProds8
          +     0.11391765401656 * GRP_MntGoldProds9
          +    -0.01948391001613 * GRP_MntGoldProds10
          +    -0.29139546734074 * GRP_MntMeatProducts2
          +     0.02864747519138 * GRP_MntMeatProducts3
          +     0.04302048132569 * GRP_MntMeatProducts4
          +     0.03633864388021 * GRP_MntMeatProducts5
          +      0.1706364226499 * GRP_MntMeatProducts6
          +     0.10460399820586 * GRP_MntMeatProducts7
          +     0.10544722036212 * GRP_MntMeatProducts8
          +     0.10484997890558 * GRP_MntMeatProducts9
          +     0.22072992127969 * GRP_MntMeatProducts10
          +    -0.04945151391792 * GRP_MntSweetProducts3
          +     0.02524689663103 * GRP_MntSweetProducts4
          +    -0.06481626270428 * GRP_MntSweetProducts5
          +     0.07470460608072 * GRP_MntSweetProducts6
          +    -0.12486393118739 * GRP_MntSweetProducts7
          +     0.01724242943758 * GRP_MntSweetProducts8
          +    -0.17151056991478 * GRP_MntSweetProducts9
          +     0.04475028863027 * GRP_MntSweetProducts10
          +     0.16414039774526 * GRP_MntWines2  +     0.19473803749356 *
        GRP_MntWines3  +     0.03895895414479 * GRP_MntWines4
          +     0.08699407109954 * GRP_MntWines5  +    -0.11234364218935 *
        GRP_MntWines6  +    -0.07501363722112 * GRP_MntWines7
          +    -0.15191945102549 * GRP_MntWines8  +    -0.06897180141209 *
        GRP_MntWines9  +    -0.19206651149079 * GRP_MntWines10
          +    -0.37441473994379 * GRP_NumCatalogPurchases3
          +    -0.15997043005634 * GRP_NumCatalogPurchases4
          +     0.10594548446512 * GRP_NumCatalogPurchases5
          +     0.00263802970324 * GRP_NumCatalogPurchases6
          +    -0.22377381496889 * GRP_NumCatalogPurchases7
          +    -0.04745111038168 * GRP_NumDistPurchases2
          +     0.10357137269812 * GRP_NumDistPurchases3
          +     0.12960605230645 * GRP_NumDistPurchases4
          +     0.07101910011623 * GRP_NumDistPurchases5
          +    -0.12325886494443 * GRP_NumDistPurchases6
          +     0.15246170069312 * GRP_NumDistPurchases7
          +    -0.01297232508723 * GRP_NumDistPurchases8
          +     0.05212728826428 * GRP_NumDistPurchases9
          +     0.12928116467276 * GRP_NumDistPurchases10
          +    -0.01478753974493 * GRP_NumWebPurchases2
          +     0.10209235795139 * GRP_NumWebPurchases3
          +    -0.04108375994117 * GRP_NumWebPurchases4
          +     0.16688325926802 * GRP_NumWebPurchases5
          +    -0.04770670560132 * GRP_NumWebPurchases6
          +     0.10715024172101 * GRP_NumWebPurchases7
          +    -0.03973051658463 * GRP_NumWebPurchases8
          +     -0.0744383975263 * GRP_NumWebVisitsMonth2
          +    -0.10259522429063 * GRP_NumWebVisitsMonth3
          +    -0.15279517866677 * GRP_NumWebVisitsMonth4
          +    -0.10205600897555 * GRP_NumWebVisitsMonth5
          +     0.06264274082103 * GRP_NumWebVisitsMonth6
          +    -0.03339146693683 * GRP_NumWebVisitsMonth7
          +     0.22895413102223 * GRP_NumWebVisitsMonth8
          +     0.14076263555727 * GRP_RFMstat2  +    -0.02707737973045 *
        GRP_RFMstat3  +    -0.08657405680392 * GRP_RFMstat4
          +    -0.10217777279752 * GRP_RFMstat5  +    -0.03537362399141 *
        GRP_RFMstat6  +     0.17860873982293 * GRP_RFMstat7
          +     0.01522782586228 * GRP_RFMstat8  +     0.21139338376926 *
        GRP_RFMstat9  +     0.01471368638362 * GRP_RFMstat10
          +     0.15567346376316 * GRP_RMntFrq2  +     0.01018946161049 *
        GRP_RMntFrq3  +    -0.02038890066544 * GRP_RMntFrq4
          +     0.13621640956781 * GRP_RMntFrq5  +    -0.08857989439102 *
        GRP_RMntFrq6  +    -0.40748794135826 * GRP_RMntFrq7
          +    -0.17056788457056 * GRP_RMntFrq8  +    -0.03167778272421 *
        GRP_RMntFrq9  +    -0.01206824029221 * GRP_RMntFrq10
          +     0.10278059961514 * GRP_Recency2  +      0.1092786681841 *
        GRP_Recency3  +     0.23239315221248 * GRP_Recency4
          +     0.09720642085712 * GRP_Recency5  +     0.05887576799353 *
        GRP_Recency6  +     0.01188389185661 * GRP_Recency7
          +     0.00397153322648 * GRP_Recency8  +     0.06461134827829 *
        GRP_Recency9  +     -0.2652137223798 * GRP_Recency10 ;
   H13  = H13  +     0.03764558557298 * GRP_AcceptedCmp52
          +    -0.17896552838288 * GRP_AcceptedCmpTotal3
          +    -0.05721038687206 * GRP_Frq2  +     0.14420365801953 * GRP_Frq3
          +     0.13453368328851 * GRP_Frq4  +     0.07489184687255 * GRP_Frq5
          +     0.02273664866469 * GRP_Frq6  +     0.06936531343811 * GRP_Frq7
          +     0.14287908984383 * GRP_Frq8  +    -0.09562935941718 * GRP_Frq9
          +    -0.06439332824922 * GRP_Frq10  +    -0.08726367328499 *
        GRP_Income2  +     0.02816796558456 * GRP_Income3
          +     -0.0207313464275 * GRP_Income4  +     0.13866821912401 *
        GRP_Income5  +     0.15211814101672 * GRP_Income6
          +     0.07620761723112 * GRP_Income7  +    -0.05925421936851 *
        GRP_Income8  +     0.00989143831981 * GRP_Income9
          +     0.16776717024284 * GRP_Income10  +     0.10023544927245 *
        GRP_Mnt2  +     0.08000793837961 * GRP_Mnt3  +    -0.03767992174465 *
        GRP_Mnt4  +     -0.0788228470774 * GRP_Mnt5  +    -0.07765017993323 *
        GRP_Mnt6  +    -0.05965223355738 * GRP_Mnt7  +    -0.02483544420982 *
        GRP_Mnt8  +    -0.02399968660167 * GRP_Mnt9  +     0.03648534066717 *
        GRP_Mnt10  +     0.11104910276205 * GRP_MntFishProducts3
          +     0.00799524987781 * GRP_MntFishProducts4
          +    -0.06457653362516 * GRP_MntFishProducts5
          +    -0.07071491433289 * GRP_MntFishProducts6
          +     -0.0297812227606 * GRP_MntFishProducts7
          +      0.1196891870928 * GRP_MntFishProducts8
          +    -0.14027713851715 * GRP_MntFishProducts9
          +    -0.00752775384465 * GRP_MntFishProducts10
          +    -0.08850740451643 * GRP_MntGoldProds2
          +     0.07481260304092 * GRP_MntGoldProds3
          +     0.01197323904138 * GRP_MntGoldProds4
          +     0.08785121348968 * GRP_MntGoldProds5
          +     0.05751686056011 * GRP_MntGoldProds6
          +     0.00465104917946 * GRP_MntGoldProds7
          +     0.09887537416794 * GRP_MntGoldProds8
          +    -0.00612835497608 * GRP_MntGoldProds9
          +    -0.00827610171723 * GRP_MntGoldProds10
          +    -0.50377721374944 * GRP_MntMeatProducts2
          +    -0.37745990165748 * GRP_MntMeatProducts3
          +    -0.29951878376561 * GRP_MntMeatProducts4
          +    -0.18065562816733 * GRP_MntMeatProducts5
          +     0.04961241511311 * GRP_MntMeatProducts6
          +    -0.01243107921859 * GRP_MntMeatProducts7
          +     0.17144282495789 * GRP_MntMeatProducts8
          +     0.14947179247383 * GRP_MntMeatProducts9
          +     0.29454336254711 * GRP_MntMeatProducts10
          +      0.0325450976222 * GRP_MntSweetProducts3
          +     0.00280241083152 * GRP_MntSweetProducts4
          +     0.05505775727165 * GRP_MntSweetProducts5
          +    -0.02141161662537 * GRP_MntSweetProducts6
          +     0.14268872032365 * GRP_MntSweetProducts7
          +    -0.07954317740737 * GRP_MntSweetProducts8
          +    -0.00103134587271 * GRP_MntSweetProducts9
          +    -0.03429967866088 * GRP_MntSweetProducts10
          +     0.41436775660832 * GRP_MntWines2  +     0.29646703075161 *
        GRP_MntWines3  +     0.33836407373023 * GRP_MntWines4
          +     0.21039899243759 * GRP_MntWines5  +     0.07529018465171 *
        GRP_MntWines6  +    -0.00050794764301 * GRP_MntWines7
          +    -0.13139238091467 * GRP_MntWines8  +    -0.17565936222023 *
        GRP_MntWines9  +     -0.3630236345865 * GRP_MntWines10
          +    -0.63590927739857 * GRP_NumCatalogPurchases3
          +    -0.22552370784051 * GRP_NumCatalogPurchases4
          +     0.02273288758795 * GRP_NumCatalogPurchases5
          +     0.23079203529225 * GRP_NumCatalogPurchases6
          +     0.30725851913205 * GRP_NumCatalogPurchases7
          +    -0.09867989528726 * GRP_NumDistPurchases2
          +    -0.11241303549017 * GRP_NumDistPurchases3
          +    -0.11528474272857 * GRP_NumDistPurchases4
          +    -0.03357182591423 * GRP_NumDistPurchases5
          +     0.08825455645935 * GRP_NumDistPurchases6
          +     -0.0608759537195 * GRP_NumDistPurchases7
          +    -0.14923146321169 * GRP_NumDistPurchases8
          +     0.10973172379981 * GRP_NumDistPurchases9
          +     0.10246969778622 * GRP_NumDistPurchases10
          +     0.09815254528418 * GRP_NumWebPurchases2
          +     0.03875957144527 * GRP_NumWebPurchases3
          +     0.13952022642084 * GRP_NumWebPurchases4
          +     0.05210339855186 * GRP_NumWebPurchases5
          +     0.03651981156732 * GRP_NumWebPurchases6
          +    -0.03615687498427 * GRP_NumWebPurchases7
          +    -0.23360859426074 * GRP_NumWebPurchases8
          +    -0.62238234045176 * GRP_NumWebVisitsMonth2
          +     -0.3625955042061 * GRP_NumWebVisitsMonth3
          +    -0.22567740218052 * GRP_NumWebVisitsMonth4
          +    -0.08070988848743 * GRP_NumWebVisitsMonth5
          +     0.12302027379317 * GRP_NumWebVisitsMonth6
          +     0.18991261492457 * GRP_NumWebVisitsMonth7
          +     0.14150646636539 * GRP_NumWebVisitsMonth8
          +    -0.03178806506185 * GRP_RFMstat2  +    -0.20094777838046 *
        GRP_RFMstat3  +     0.07808214585024 * GRP_RFMstat4
          +    -0.01546326977621 * GRP_RFMstat5  +     0.00666033747634 *
        GRP_RFMstat6  +     0.06290810949775 * GRP_RFMstat7
          +    -0.09940864151705 * GRP_RFMstat8  +    -0.03226772053643 *
        GRP_RFMstat9  +     0.11448249247924 * GRP_RFMstat10
          +      0.1225398665263 * GRP_RMntFrq2  +     0.10126972366878 *
        GRP_RMntFrq3  +      0.1145431192407 * GRP_RMntFrq4
          +    -0.18520427743014 * GRP_RMntFrq5  +     0.00047167841324 *
        GRP_RMntFrq6  +    -0.11223000101198 * GRP_RMntFrq7
          +    -0.18586998152107 * GRP_RMntFrq8  +     -0.0179456336917 *
        GRP_RMntFrq9  +    -0.11237241396458 * GRP_RMntFrq10
          +      0.3853209073848 * GRP_Recency2  +     0.29294953726827 *
        GRP_Recency3  +     0.28926654920191 * GRP_Recency4
          +     0.11462720739507 * GRP_Recency5  +     -0.1051639195799 *
        GRP_Recency6  +     0.04327737722129 * GRP_Recency7
          +    -0.11813942587684 * GRP_Recency8  +    -0.29587148545844 *
        GRP_Recency9  +    -0.32397819257324 * GRP_Recency10 ;
   H14  = H14  +     0.15079812629134 * GRP_AcceptedCmp52
          +     0.22962844975229 * GRP_AcceptedCmpTotal3
          +    -0.05554827748543 * GRP_Frq2  +    -0.08417768642905 * GRP_Frq3
          +     0.01076244235421 * GRP_Frq4  +     0.01753394626169 * GRP_Frq5
          +    -0.15834802329472 * GRP_Frq6  +    -0.06085337703386 * GRP_Frq7
          +    -0.04075525665959 * GRP_Frq8  +    -0.09506739541592 * GRP_Frq9
          +    -0.04203961921167 * GRP_Frq10  +      0.1198891926252 *
        GRP_Income2  +     0.16315196590211 * GRP_Income3
          +     0.18493404221827 * GRP_Income4  +     0.08098358950134 *
        GRP_Income5  +    -0.02153158263363 * GRP_Income6
          +     0.15391794393904 * GRP_Income7  +     0.17463803180283 *
        GRP_Income8  +     0.03158286458013 * GRP_Income9
          +     0.24596218762028 * GRP_Income10  +     0.07847966486745 *
        GRP_Mnt2  +    -0.10766377152121 * GRP_Mnt3  +    -0.02322298419621 *
        GRP_Mnt4  +     0.02436572747627 * GRP_Mnt5  +     0.07340030767568 *
        GRP_Mnt6  +     0.02787743356763 * GRP_Mnt7  +     0.06579539785299 *
        GRP_Mnt8  +    -0.07931107893394 * GRP_Mnt9  +    -0.00259718802072 *
        GRP_Mnt10  +    -0.04638486329226 * GRP_MntFishProducts3
          +      0.0275109980019 * GRP_MntFishProducts4
          +     0.00457152762382 * GRP_MntFishProducts5
          +     -0.0256427796426 * GRP_MntFishProducts6
          +     -0.0025601056055 * GRP_MntFishProducts7
          +     0.15477917154458 * GRP_MntFishProducts8
          +    -0.02700327590482 * GRP_MntFishProducts9
          +    -0.01004837932109 * GRP_MntFishProducts10
          +     0.01099545881963 * GRP_MntGoldProds2
          +     0.04693157233551 * GRP_MntGoldProds3
          +    -0.04266329172621 * GRP_MntGoldProds4
          +    -0.02679901647799 * GRP_MntGoldProds5
          +      0.1281459189864 * GRP_MntGoldProds6
          +    -0.06153062103842 * GRP_MntGoldProds7
          +    -0.08088807075079 * GRP_MntGoldProds8
          +     0.05265016419697 * GRP_MntGoldProds9
          +     0.00595108646688 * GRP_MntGoldProds10
          +     0.15482516463083 * GRP_MntMeatProducts2
          +     0.05984633118335 * GRP_MntMeatProducts3
          +     0.13261187884411 * GRP_MntMeatProducts4
          +    -0.00777328161788 * GRP_MntMeatProducts5
          +     0.03377357859895 * GRP_MntMeatProducts6
          +    -0.15782913038235 * GRP_MntMeatProducts7
          +    -0.05089204866776 * GRP_MntMeatProducts8
          +     -0.0971110594902 * GRP_MntMeatProducts9
          +    -0.02558850723317 * GRP_MntMeatProducts10
          +     0.04299817363015 * GRP_MntSweetProducts3
          +    -0.09902465141858 * GRP_MntSweetProducts4
          +    -0.01697537339121 * GRP_MntSweetProducts5
          +     0.06486145596476 * GRP_MntSweetProducts6
          +     0.10943300547797 * GRP_MntSweetProducts7
          +    -0.02182162160296 * GRP_MntSweetProducts8
          +     0.11675594479324 * GRP_MntSweetProducts9
          +     0.09535653780691 * GRP_MntSweetProducts10
          +     -0.1998530200338 * GRP_MntWines2  +     -0.0715511226473 *
        GRP_MntWines3  +    -0.00197101208288 * GRP_MntWines4
          +    -0.05293421174154 * GRP_MntWines5  +    -0.13384442049071 *
        GRP_MntWines6  +    -0.20859731662163 * GRP_MntWines7
          +    -0.04979006341398 * GRP_MntWines8  +     0.14737079189331 *
        GRP_MntWines9  +    -0.11301496992606 * GRP_MntWines10
          +     0.18740768444624 * GRP_NumCatalogPurchases3
          +     0.14555197245715 * GRP_NumCatalogPurchases4
          +    -0.07465109593753 * GRP_NumCatalogPurchases5
          +     0.01725179078473 * GRP_NumCatalogPurchases6
          +    -0.01121762754976 * GRP_NumCatalogPurchases7
          +    -0.15559892251658 * GRP_NumDistPurchases2
          +     0.16551127757982 * GRP_NumDistPurchases3
          +     0.02161946400684 * GRP_NumDistPurchases4
          +    -0.23848222918486 * GRP_NumDistPurchases5
          +     0.10440245784846 * GRP_NumDistPurchases6
          +    -0.04195417570658 * GRP_NumDistPurchases7
          +    -0.08492153051235 * GRP_NumDistPurchases8
          +    -0.18809289244816 * GRP_NumDistPurchases9
          +    -0.15195085859989 * GRP_NumDistPurchases10
          +    -0.09201105550543 * GRP_NumWebPurchases2
          +    -0.06310838957444 * GRP_NumWebPurchases3
          +    -0.01496423304375 * GRP_NumWebPurchases4
          +    -0.17644533807901 * GRP_NumWebPurchases5
          +      -0.110113628078 * GRP_NumWebPurchases6
          +     0.00785303531109 * GRP_NumWebPurchases7
          +     0.05743831457064 * GRP_NumWebPurchases8
          +    -0.05168919326829 * GRP_NumWebVisitsMonth2
          +     0.11290696986069 * GRP_NumWebVisitsMonth3
          +     0.09360100549901 * GRP_NumWebVisitsMonth4
          +    -0.09806451567816 * GRP_NumWebVisitsMonth5
          +     0.12495533860565 * GRP_NumWebVisitsMonth6
          +    -0.02760271368889 * GRP_NumWebVisitsMonth7
          +    -0.11225070952088 * GRP_NumWebVisitsMonth8
          +     0.07121295296305 * GRP_RFMstat2  +     0.06278808825827 *
        GRP_RFMstat3  +     0.22407976217279 * GRP_RFMstat4
          +    -0.01391199439347 * GRP_RFMstat5  +     0.00524986855743 *
        GRP_RFMstat6  +     0.04647229627683 * GRP_RFMstat7
          +    -0.08262115059091 * GRP_RFMstat8  +     0.05568633367355 *
        GRP_RFMstat9  +      0.1619135717285 * GRP_RFMstat10
          +    -0.12663266250917 * GRP_RMntFrq2  +    -0.02019823950141 *
        GRP_RMntFrq3  +     0.06814938923598 * GRP_RMntFrq4
          +     0.01123045702133 * GRP_RMntFrq5  +     0.11389829423469 *
        GRP_RMntFrq6  +    -0.13952956112852 * GRP_RMntFrq7
          +    -0.02257133244216 * GRP_RMntFrq8  +    -0.04067820247483 *
        GRP_RMntFrq9  +     0.17149660062988 * GRP_RMntFrq10
          +    -0.08181666846159 * GRP_Recency2  +      -0.110152228582 *
        GRP_Recency3  +    -0.04515191712692 * GRP_Recency4
          +    -0.07021934274856 * GRP_Recency5  +     0.05576042452735 *
        GRP_Recency6  +     0.01898884275662 * GRP_Recency7
          +     0.37127414267517 * GRP_Recency8  +     0.02568583903077 *
        GRP_Recency9  +     0.06729768371352 * GRP_Recency10 ;
   H15  = H15  +    -0.07474486177584 * GRP_AcceptedCmp52
          +     -0.0813425565032 * GRP_AcceptedCmpTotal3
          +     0.08373011910886 * GRP_Frq2  +     0.15590004679893 * GRP_Frq3
          +    -0.01423869859621 * GRP_Frq4  +     0.23853893377052 * GRP_Frq5
          +     0.00582814648708 * GRP_Frq6  +     0.10745574495653 * GRP_Frq7
          +     0.12283228526609 * GRP_Frq8  +    -0.00260744850823 * GRP_Frq9
          +     0.20713186190941 * GRP_Frq10  +     0.14418190802709 *
        GRP_Income2  +     0.07441582776964 * GRP_Income3
          +    -0.09944544424018 * GRP_Income4  +     -0.1993160747563 *
        GRP_Income5  +     0.15366229436808 * GRP_Income6
          +      0.0104741985443 * GRP_Income7  +     0.03372790306706 *
        GRP_Income8  +     0.07288522457723 * GRP_Income9
          +     0.17752104349269 * GRP_Income10  +    -0.15217900206484 *
        GRP_Mnt2  +     0.03849759187766 * GRP_Mnt3  +    -0.05010164314865 *
        GRP_Mnt4  +     0.02680721226924 * GRP_Mnt5  +    -0.10687670604825 *
        GRP_Mnt6  +    -0.15176693979348 * GRP_Mnt7  +    -0.08667079494869 *
        GRP_Mnt8  +    -0.12429806525962 * GRP_Mnt9  +    -0.17943078316657 *
        GRP_Mnt10  +     0.00950842084882 * GRP_MntFishProducts3
          +     0.06089106976321 * GRP_MntFishProducts4
          +    -0.04055435018644 * GRP_MntFishProducts5
          +    -0.04072533262198 * GRP_MntFishProducts6
          +     0.00316491296302 * GRP_MntFishProducts7
          +     0.14360439865573 * GRP_MntFishProducts8
          +    -0.10561487610195 * GRP_MntFishProducts9
          +      0.0808522264132 * GRP_MntFishProducts10
          +    -0.02372066113373 * GRP_MntGoldProds2
          +     0.05245232490647 * GRP_MntGoldProds3
          +     0.05678231883017 * GRP_MntGoldProds4
          +     0.01560521212362 * GRP_MntGoldProds5
          +     0.09731296556114 * GRP_MntGoldProds6
          +      0.0727075243521 * GRP_MntGoldProds7
          +     0.03845221174429 * GRP_MntGoldProds8
          +    -0.17307450395634 * GRP_MntGoldProds9
          +     0.16609295927199 * GRP_MntGoldProds10
          +     0.24378730593177 * GRP_MntMeatProducts2
          +    -0.01232528635462 * GRP_MntMeatProducts3
          +     0.08632771193059 * GRP_MntMeatProducts4
          +     0.03837956076595 * GRP_MntMeatProducts5
          +     0.01038398564102 * GRP_MntMeatProducts6
          +     -0.1272142230896 * GRP_MntMeatProducts7
          +    -0.06074459624503 * GRP_MntMeatProducts8
          +    -0.15871755763595 * GRP_MntMeatProducts9
          +    -0.12457188762767 * GRP_MntMeatProducts10
          +     0.02566417423056 * GRP_MntSweetProducts3
          +    -0.08945240533844 * GRP_MntSweetProducts4
          +    -0.14155778851078 * GRP_MntSweetProducts5
          +    -0.11568464973367 * GRP_MntSweetProducts6
          +     -0.0060913881508 * GRP_MntSweetProducts7
          +     -0.0784310738091 * GRP_MntSweetProducts8
          +    -0.05760607191513 * GRP_MntSweetProducts9
          +    -0.08178704732211 * GRP_MntSweetProducts10
          +     -0.0051906568099 * GRP_MntWines2  +      0.0630388639453 *
        GRP_MntWines3  +    -0.22313810388763 * GRP_MntWines4
          +      -0.180882719351 * GRP_MntWines5  +     0.02141382546184 *
        GRP_MntWines6  +    -0.05971406502791 * GRP_MntWines7
          +     0.09956935130741 * GRP_MntWines8  +     0.01632287744434 *
        GRP_MntWines9  +     0.10949768587748 * GRP_MntWines10
          +     0.09783291088049 * GRP_NumCatalogPurchases3
          +    -0.02261013277752 * GRP_NumCatalogPurchases4
          +    -0.11492625279985 * GRP_NumCatalogPurchases5
          +    -0.08434829186857 * GRP_NumCatalogPurchases6
          +     -0.0371926608551 * GRP_NumCatalogPurchases7
          +     0.06202987788564 * GRP_NumDistPurchases2
          +     0.22177708973962 * GRP_NumDistPurchases3
          +    -0.13703790658963 * GRP_NumDistPurchases4
          +     0.21149014324079 * GRP_NumDistPurchases5
          +     0.04612264586718 * GRP_NumDistPurchases6
          +      0.1388613782278 * GRP_NumDistPurchases7
          +     0.25380989759373 * GRP_NumDistPurchases8
          +     0.05092017340612 * GRP_NumDistPurchases9
          +    -0.10043094372979 * GRP_NumDistPurchases10
          +    -0.14530592708524 * GRP_NumWebPurchases2
          +     0.08222242220022 * GRP_NumWebPurchases3
          +     0.11023840669649 * GRP_NumWebPurchases4
          +     0.02201767721545 * GRP_NumWebPurchases5
          +      0.0325965365767 * GRP_NumWebPurchases6
          +     0.01387738316429 * GRP_NumWebPurchases7
          +      0.0668944294435 * GRP_NumWebPurchases8
          +    -0.03013978189881 * GRP_NumWebVisitsMonth2
          +    -0.02332621711341 * GRP_NumWebVisitsMonth3
          +    -0.05034424202375 * GRP_NumWebVisitsMonth4
          +    -0.17412564074584 * GRP_NumWebVisitsMonth5
          +    -0.02681384968802 * GRP_NumWebVisitsMonth6
          +    -0.03690686741093 * GRP_NumWebVisitsMonth7
          +    -0.18044101662424 * GRP_NumWebVisitsMonth8
          +     0.18351793268065 * GRP_RFMstat2  +     0.08302753882463 *
        GRP_RFMstat3  +      0.2140782505942 * GRP_RFMstat4
          +     0.08904517954741 * GRP_RFMstat5  +     0.00618619005802 *
        GRP_RFMstat6  +     0.07381352166701 * GRP_RFMstat7
          +    -0.07112387189768 * GRP_RFMstat8  +     0.18177537388268 *
        GRP_RFMstat9  +     0.01993781166098 * GRP_RFMstat10
          +    -0.13633030693385 * GRP_RMntFrq2  +    -0.03091098931044 *
        GRP_RMntFrq3  +     0.01424378851129 * GRP_RMntFrq4
          +    -0.10457271155167 * GRP_RMntFrq5  +    -0.04065636538378 *
        GRP_RMntFrq6  +    -0.21000053348912 * GRP_RMntFrq7
          +      0.1195703554692 * GRP_RMntFrq8  +     0.06433917724909 *
        GRP_RMntFrq9  +     0.03523308730139 * GRP_RMntFrq10
          +    -0.45748566872646 * GRP_Recency2  +     0.00890062656102 *
        GRP_Recency3  +    -0.12573498091966 * GRP_Recency4
          +    -0.11355010854787 * GRP_Recency5  +    -0.06285469349039 *
        GRP_Recency6  +    -0.01372977465721 * GRP_Recency7
          +    -0.00431009782377 * GRP_Recency8  +     0.14264750449817 *
        GRP_Recency9  +     0.06322236291435 * GRP_Recency10 ;
   H16  = H16  +    -0.02857321351589 * GRP_AcceptedCmp52
          +     0.08686492082938 * GRP_AcceptedCmpTotal3
          +    -0.02529651954499 * GRP_Frq2  +    -0.11708686915113 * GRP_Frq3
          +    -0.00271389964637 * GRP_Frq4  +      0.0031520579469 * GRP_Frq5
          +     0.02250592473469 * GRP_Frq6  +    -0.07430823955704 * GRP_Frq7
          +    -0.05511293730159 * GRP_Frq8  +    -0.15083576220167 * GRP_Frq9
          +     0.08624045289076 * GRP_Frq10  +    -0.11336098795831 *
        GRP_Income2  +    -0.01135849326744 * GRP_Income3
          +    -0.01038803441996 * GRP_Income4  +     0.01063081779526 *
        GRP_Income5  +      0.0195138967196 * GRP_Income6
          +    -0.12428695983315 * GRP_Income7  +      0.1762603662968 *
        GRP_Income8  +    -0.04284544297425 * GRP_Income9
          +     0.13548745294575 * GRP_Income10  +      0.1461906889163 *
        GRP_Mnt2  +     0.00789497535067 * GRP_Mnt3  +    -0.10828259948309 *
        GRP_Mnt4  +    -0.09852484093552 * GRP_Mnt5  +     0.12328283591039 *
        GRP_Mnt6  +     0.02645884251294 * GRP_Mnt7  +    -0.06418515760324 *
        GRP_Mnt8  +     0.05033297828056 * GRP_Mnt9  +     0.02319608065987 *
        GRP_Mnt10  +    -0.06409512817059 * GRP_MntFishProducts3
          +    -0.07347763124599 * GRP_MntFishProducts4
          +     0.09606295777047 * GRP_MntFishProducts5
          +     0.04849186843695 * GRP_MntFishProducts6
          +    -0.09816590672897 * GRP_MntFishProducts7
          +    -0.06716198318522 * GRP_MntFishProducts8
          +     0.02729112309666 * GRP_MntFishProducts9
          +     0.15530589859286 * GRP_MntFishProducts10
          +    -0.26850482232692 * GRP_MntGoldProds2
          +      0.0177945850339 * GRP_MntGoldProds3
          +     0.07330868157069 * GRP_MntGoldProds4
          +    -0.07888253464223 * GRP_MntGoldProds5
          +    -0.05383351391678 * GRP_MntGoldProds6
          +     0.06902011208006 * GRP_MntGoldProds7
          +     0.01659381751676 * GRP_MntGoldProds8
          +     0.05511006705343 * GRP_MntGoldProds9
          +    -0.12233490278298 * GRP_MntGoldProds10
          +    -0.06372567187434 * GRP_MntMeatProducts2
          +     0.04258696255136 * GRP_MntMeatProducts3
          +     0.07756827842945 * GRP_MntMeatProducts4
          +    -0.08102882952712 * GRP_MntMeatProducts5
          +    -0.18168349526814 * GRP_MntMeatProducts6
          +    -0.09289639689933 * GRP_MntMeatProducts7
          +    -0.12483836376085 * GRP_MntMeatProducts8
          +    -0.00476358575434 * GRP_MntMeatProducts9
          +    -0.05003834735617 * GRP_MntMeatProducts10
          +     0.08995329370692 * GRP_MntSweetProducts3
          +     0.14420536072862 * GRP_MntSweetProducts4
          +    -0.12656735985005 * GRP_MntSweetProducts5
          +    -0.03927173602614 * GRP_MntSweetProducts6
          +     0.11985794354261 * GRP_MntSweetProducts7
          +    -0.03511406177491 * GRP_MntSweetProducts8
          +     0.00072578123331 * GRP_MntSweetProducts9
          +    -0.10392403461293 * GRP_MntSweetProducts10
          +    -0.05182683414566 * GRP_MntWines2  +    -0.12225589796854 *
        GRP_MntWines3  +    -0.00836365672389 * GRP_MntWines4
          +     0.01817080496827 * GRP_MntWines5  +     0.00139854456371 *
        GRP_MntWines6  +     0.11415329329768 * GRP_MntWines7
          +    -0.07157344425572 * GRP_MntWines8  +    -0.10015424425022 *
        GRP_MntWines9  +     0.01183545951543 * GRP_MntWines10
          +     0.01371669307975 * GRP_NumCatalogPurchases3
          +     0.07907358248279 * GRP_NumCatalogPurchases4
          +     0.01239764907034 * GRP_NumCatalogPurchases5
          +    -0.04021922540013 * GRP_NumCatalogPurchases6
          +     0.09459541866911 * GRP_NumCatalogPurchases7
          +    -0.16967374745579 * GRP_NumDistPurchases2
          +     0.09200080502499 * GRP_NumDistPurchases3
          +    -0.10021352797437 * GRP_NumDistPurchases4
          +    -0.10066040841661 * GRP_NumDistPurchases5
          +     0.00752147985238 * GRP_NumDistPurchases6
          +     0.06652031886304 * GRP_NumDistPurchases7
          +    -0.02043214836484 * GRP_NumDistPurchases8
          +     0.02148909954497 * GRP_NumDistPurchases9
          +    -0.08750148475271 * GRP_NumDistPurchases10
          +    -0.11100944378418 * GRP_NumWebPurchases2
          +     0.15913249284009 * GRP_NumWebPurchases3
          +     0.01344719363688 * GRP_NumWebPurchases4
          +     0.05964097356376 * GRP_NumWebPurchases5
          +    -0.02443578971107 * GRP_NumWebPurchases6
          +    -0.08746113819167 * GRP_NumWebPurchases7
          +    -0.05128856330268 * GRP_NumWebPurchases8
          +    -0.05875299359354 * GRP_NumWebVisitsMonth2
          +     0.07755855794482 * GRP_NumWebVisitsMonth3
          +    -0.07517161675954 * GRP_NumWebVisitsMonth4
          +     0.05144332977229 * GRP_NumWebVisitsMonth5
          +     0.18297745072296 * GRP_NumWebVisitsMonth6
          +     0.06164490867457 * GRP_NumWebVisitsMonth7
          +     0.04580284323085 * GRP_NumWebVisitsMonth8
          +    -0.06378765632552 * GRP_RFMstat2  +     0.02170099547671 *
        GRP_RFMstat3  +     0.05641050433358 * GRP_RFMstat4
          +    -0.01875867792846 * GRP_RFMstat5  +    -0.02966367663118 *
        GRP_RFMstat6  +     0.06778581692325 * GRP_RFMstat7
          +     0.08472702734665 * GRP_RFMstat8  +    -0.07513817936554 *
        GRP_RFMstat9  +    -0.09054195031681 * GRP_RFMstat10
          +     0.09962266457073 * GRP_RMntFrq2  +      0.0269861046733 *
        GRP_RMntFrq3  +    -0.03854288653601 * GRP_RMntFrq4
          +    -0.19936014666985 * GRP_RMntFrq5  +    -0.02515671079355 *
        GRP_RMntFrq6  +     0.04869097060418 * GRP_RMntFrq7
          +    -0.10622821231311 * GRP_RMntFrq8  +    -0.16450480022836 *
        GRP_RMntFrq9  +     0.08581508554974 * GRP_RMntFrq10
          +      0.0101644001149 * GRP_Recency2  +     0.04563803568067 *
        GRP_Recency3  +    -0.12616695833869 * GRP_Recency4
          +    -0.12673939537116 * GRP_Recency5  +    -0.09667218383464 *
        GRP_Recency6  +     0.18574081401557 * GRP_Recency7
          +    -0.06904154623978 * GRP_Recency8  +     0.14085181924583 *
        GRP_Recency9  +     0.09795171549035 * GRP_Recency10 ;
   H11  =    -0.42454680093166 + H11 ;
   H12  =    -0.24175207531939 + H12 ;
   H13  =     -0.3275857158264 + H13 ;
   H14  =     -0.8506199830485 + H14 ;
   H15  =    -0.51670887519827 + H15 ;
   H16  =     1.12226016334851 + H16 ;
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
   P_DepVar1  =     3.47433172236781 * H11  +     3.54768053440586 * H12
          +      7.2593084534657 * H13  +    -2.22651417004259 * H14
          +    -1.72657232208442 * H15  +     0.20378362763414 * H16 ;
   P_DepVar1  =     -1.6184674510088 + P_DepVar1 ;
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
;
drop S_:;
