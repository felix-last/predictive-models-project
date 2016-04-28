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
   H11  =    -0.11779994129006 * S_Year_Birth ;
   H12  =     0.01439270223905 * S_Year_Birth ;
   H13  =     0.16810576596239 * S_Year_Birth ;
   H14  =      0.0126323556283 * S_Year_Birth ;
   H15  =     0.00490126786427 * S_Year_Birth ;
   H11  = H11  +    -0.10120130038823 * GRP_AcceptedCmp52
          +    -0.29145091653241 * GRP_AcceptedCmpTotal3
          +     0.01802833275582 * GRP_Frq2  +     0.15272820858021 * GRP_Frq3
          +     0.14370686750504 * GRP_Frq4  +    -0.06074271943474 * GRP_Frq5
          +    -0.16494155191767 * GRP_Frq6  +    -0.03508219706844 * GRP_Frq7
          +     0.03801978911133 * GRP_Frq8  +    -0.04837268754875 * GRP_Frq9
          +     0.04133949833009 * GRP_Frq10  +     0.01585269216602 *
        GRP_Income2  +     0.02526921062614 * GRP_Income3
          +     0.19310035357829 * GRP_Income4  +     0.16615699836751 *
        GRP_Income5  +    -0.01656164262311 * GRP_Income6
          +     0.04387641774257 * GRP_Income7  +    -0.17330241074594 *
        GRP_Income8  +     0.16738656775649 * GRP_Income9
          +      0.1630131883969 * GRP_Income10  +     0.34279387127093 *
        GRP_Mnt2  +     0.02575623945089 * GRP_Mnt3  +      0.0148719039037 *
        GRP_Mnt4  +    -0.14622490571067 * GRP_Mnt5  +    -0.19294026942757 *
        GRP_Mnt6  +    -0.00783114298777 * GRP_Mnt7  +     0.09174888699683 *
        GRP_Mnt8  +    -0.08601289398209 * GRP_Mnt9  +     0.21448453029375 *
        GRP_Mnt10  +     0.10697869967047 * GRP_MntFishProducts3
          +     0.06225775049469 * GRP_MntFishProducts4
          +    -0.01408797391558 * GRP_MntFishProducts5
          +     0.02848289613699 * GRP_MntFishProducts6
          +     0.05325776779504 * GRP_MntFishProducts7
          +     0.02437321250069 * GRP_MntFishProducts8
          +      0.2617858307061 * GRP_MntFishProducts9
          +    -0.07319837564913 * GRP_MntFishProducts10
          +    -0.02161432541757 * GRP_MntGoldProds2
          +     0.19849470180453 * GRP_MntGoldProds3
          +     0.08066760525249 * GRP_MntGoldProds4
          +     0.14331081076233 * GRP_MntGoldProds5
          +     0.05943247571249 * GRP_MntGoldProds6
          +      0.0608061458335 * GRP_MntGoldProds7
          +     0.05038235669624 * GRP_MntGoldProds8
          +    -0.04685805642629 * GRP_MntGoldProds9
          +    -0.29152354570589 * GRP_MntGoldProds10
          +    -0.39968469332087 * GRP_MntMeatProducts2
          +    -0.19201423289799 * GRP_MntMeatProducts3
          +    -0.27560935050599 * GRP_MntMeatProducts4
          +     -0.0283731212244 * GRP_MntMeatProducts5
          +     0.03960809803437 * GRP_MntMeatProducts6
          +    -0.18777726757179 * GRP_MntMeatProducts7
          +    -0.05524894778392 * GRP_MntMeatProducts8
          +     0.13594754762959 * GRP_MntMeatProducts9
          +     0.43906108436269 * GRP_MntMeatProducts10
          +    -0.06435829145013 * GRP_MntSweetProducts3
          +     -0.0210530647656 * GRP_MntSweetProducts4
          +     0.12313868065999 * GRP_MntSweetProducts5
          +     0.09312437748244 * GRP_MntSweetProducts6
          +    -0.12471463660639 * GRP_MntSweetProducts7
          +     0.06602921514536 * GRP_MntSweetProducts8
          +     0.08468927916869 * GRP_MntSweetProducts9
          +    -0.13586571968305 * GRP_MntSweetProducts10
          +     0.36708616844444 * GRP_MntWines2  +     0.10783294052251 *
        GRP_MntWines3  +     0.04439392359556 * GRP_MntWines4
          +     0.03715965915951 * GRP_MntWines5  +    -0.03210586065209 *
        GRP_MntWines6  +     0.11894764415135 * GRP_MntWines7
          +    -0.11667658986463 * GRP_MntWines8  +    -0.00166194976989 *
        GRP_MntWines9  +    -0.40981775275403 * GRP_MntWines10
          +    -0.44861088264537 * GRP_NumCatalogPurchases3
          +    -0.16773306967441 * GRP_NumCatalogPurchases4
          +    -0.09165932058272 * GRP_NumCatalogPurchases5
          +     0.14298090214424 * GRP_NumCatalogPurchases6
          +    -0.02734458137769 * GRP_NumCatalogPurchases7
          +     0.08564176396946 * GRP_NumDistPurchases2
          +    -0.04992946661847 * GRP_NumDistPurchases3
          +    -0.02597736910094 * GRP_NumDistPurchases4
          +    -0.05061636893507 * GRP_NumDistPurchases5
          +    -0.03128813104108 * GRP_NumDistPurchases6
          +    -0.13321401016342 * GRP_NumDistPurchases7
          +    -0.16916873887958 * GRP_NumDistPurchases8
          +     0.27222053253076 * GRP_NumDistPurchases9
          +     0.31493873732485 * GRP_NumDistPurchases10
          +     0.00940915246846 * GRP_NumWebPurchases2
          +    -0.09454543870383 * GRP_NumWebPurchases3
          +     0.02354360806187 * GRP_NumWebPurchases4
          +      0.0623848511153 * GRP_NumWebPurchases5
          +    -0.14177656017556 * GRP_NumWebPurchases6
          +    -0.08722967193472 * GRP_NumWebPurchases7
          +     0.08762950710966 * GRP_NumWebPurchases8
          +    -0.02407598807456 * GRP_NumWebVisitsMonth2
          +    -0.08734142313349 * GRP_NumWebVisitsMonth3
          +    -0.07761023656162 * GRP_NumWebVisitsMonth4
          +     -0.1666467425177 * GRP_NumWebVisitsMonth5
          +    -0.08134770955005 * GRP_NumWebVisitsMonth6
          +     0.02327986356952 * GRP_NumWebVisitsMonth7
          +     0.35444907806561 * GRP_NumWebVisitsMonth8
          +     0.09441161284057 * GRP_RFMstat2  +     -0.1319671606322 *
        GRP_RFMstat3  +     0.02748981688883 * GRP_RFMstat4
          +    -0.11127405232643 * GRP_RFMstat5  +     0.02825604094962 *
        GRP_RFMstat6  +    -0.11039280017266 * GRP_RFMstat7
          +    -0.26019386650861 * GRP_RFMstat8  +    -0.21523161156313 *
        GRP_RFMstat9  +    -0.03629252062158 * GRP_RFMstat10
          +     0.15763266470046 * GRP_RMntFrq2  +     0.08780054158661 *
        GRP_RMntFrq3  +     0.17890334374232 * GRP_RMntFrq4
          +     0.19959789054927 * GRP_RMntFrq5  +    -0.13310639896206 *
        GRP_RMntFrq6  +     0.02766923637797 * GRP_RMntFrq7
          +    -0.00498872677557 * GRP_RMntFrq8  +     0.28068860472864 *
        GRP_RMntFrq9  +    -0.00625449404896 * GRP_RMntFrq10
          +     0.14035437235589 * GRP_Recency2  +     0.21926411321176 *
        GRP_Recency3  +     0.40977962900363 * GRP_Recency4
          +    -0.04780791117376 * GRP_Recency5  +     0.06447865348011 *
        GRP_Recency6  +     0.02645001728685 * GRP_Recency7
          +    -0.25500720229394 * GRP_Recency8  +    -0.33194208803227 *
        GRP_Recency9  +    -0.37509931095396 * GRP_Recency10 ;
   H12  = H12  +    -0.00249283048209 * GRP_AcceptedCmp52
          +    -0.09776325087959 * GRP_AcceptedCmpTotal3
          +    -0.00891809516361 * GRP_Frq2  +     0.14615554769541 * GRP_Frq3
          +      0.1722454322885 * GRP_Frq4  +     0.09138515117743 * GRP_Frq5
          +     0.14064605711365 * GRP_Frq6  +       0.208609928829 * GRP_Frq7
          +     0.06763174841825 * GRP_Frq8  +    -0.16985550967141 * GRP_Frq9
          +    -0.30826093029849 * GRP_Frq10  +    -0.17205683871698 *
        GRP_Income2  +    -0.07552170179471 * GRP_Income3
          +    -0.08527885170211 * GRP_Income4  +     0.06185373635887 *
        GRP_Income5  +     0.00815930818625 * GRP_Income6
          +    -0.19329281237864 * GRP_Income7  +    -0.24838123961567 *
        GRP_Income8  +     -0.3451185715786 * GRP_Income9
          +    -0.06156031870187 * GRP_Income10  +     0.12646781621248 *
        GRP_Mnt2  +     0.20774819950358 * GRP_Mnt3  +     0.09336734204436 *
        GRP_Mnt4  +    -0.01383466332001 * GRP_Mnt5  +     0.00434172484009 *
        GRP_Mnt6  +    -0.09016745393613 * GRP_Mnt7  +     0.02434881276443 *
        GRP_Mnt8  +     0.10420387102641 * GRP_Mnt9  +     0.03849142222263 *
        GRP_Mnt10  +     0.00119020430694 * GRP_MntFishProducts3
          +    -0.04202232011311 * GRP_MntFishProducts4
          +     0.00471909191461 * GRP_MntFishProducts5
          +    -0.01341208106056 * GRP_MntFishProducts6
          +    -0.03381180366256 * GRP_MntFishProducts7
          +     0.07915179388389 * GRP_MntFishProducts8
          +     -0.2118274361441 * GRP_MntFishProducts9
          +     0.00900226925099 * GRP_MntFishProducts10
          +    -0.07254685103355 * GRP_MntGoldProds2
          +     0.07651956492684 * GRP_MntGoldProds3
          +      0.0379503877146 * GRP_MntGoldProds4
          +     -0.0143124128849 * GRP_MntGoldProds5
          +    -0.09371264388109 * GRP_MntGoldProds6
          +    -0.08979093146507 * GRP_MntGoldProds7
          +    -0.11428579149697 * GRP_MntGoldProds8
          +     0.02515117293126 * GRP_MntGoldProds9
          +     0.03958828108962 * GRP_MntGoldProds10
          +    -0.53525050445826 * GRP_MntMeatProducts2
          +    -0.38303217784514 * GRP_MntMeatProducts3
          +    -0.15105347636013 * GRP_MntMeatProducts4
          +    -0.12802941645278 * GRP_MntMeatProducts5
          +     0.10972081378946 * GRP_MntMeatProducts6
          +     0.22627684747763 * GRP_MntMeatProducts7
          +     0.23914993995125 * GRP_MntMeatProducts8
          +     0.21711314655121 * GRP_MntMeatProducts9
          +     0.17696755989253 * GRP_MntMeatProducts10
          +     0.01432518789616 * GRP_MntSweetProducts3
          +       0.112537640149 * GRP_MntSweetProducts4
          +     0.02389715897828 * GRP_MntSweetProducts5
          +    -0.05432364662019 * GRP_MntSweetProducts6
          +     0.12863266937677 * GRP_MntSweetProducts7
          +    -0.12170377984261 * GRP_MntSweetProducts8
          +    -0.15569754043078 * GRP_MntSweetProducts9
          +     0.11101814605488 * GRP_MntSweetProducts10
          +     0.26441611005377 * GRP_MntWines2  +     0.20796872121882 *
        GRP_MntWines3  +     0.18485529175745 * GRP_MntWines4
          +     0.20613815212747 * GRP_MntWines5  +    -0.08399507703703 *
        GRP_MntWines6  +    -0.12917024022546 * GRP_MntWines7
          +    -0.11831999499226 * GRP_MntWines8  +    -0.23794898937509 *
        GRP_MntWines9  +    -0.24100263717396 * GRP_MntWines10
          +    -0.64938371587273 * GRP_NumCatalogPurchases3
          +    -0.26502090013033 * GRP_NumCatalogPurchases4
          +     0.11962176026494 * GRP_NumCatalogPurchases5
          +     0.23744578086114 * GRP_NumCatalogPurchases6
          +     0.33203573078088 * GRP_NumCatalogPurchases7
          +     -0.1355753508144 * GRP_NumDistPurchases2
          +    -0.19902516536157 * GRP_NumDistPurchases3
          +     0.01617542872985 * GRP_NumDistPurchases4
          +     0.03558443617419 * GRP_NumDistPurchases5
          +     0.01694358499533 * GRP_NumDistPurchases6
          +    -0.03587174008246 * GRP_NumDistPurchases7
          +    -0.13059687132935 * GRP_NumDistPurchases8
          +    -0.00261084476059 * GRP_NumDistPurchases9
          +     0.03959312715152 * GRP_NumDistPurchases10
          +    -0.00699065524457 * GRP_NumWebPurchases2
          +     0.08645828622182 * GRP_NumWebPurchases3
          +     0.06137932095071 * GRP_NumWebPurchases4
          +     0.04397086481384 * GRP_NumWebPurchases5
          +     0.03939129656232 * GRP_NumWebPurchases6
          +      0.0761710872424 * GRP_NumWebPurchases7
          +    -0.18535375992005 * GRP_NumWebPurchases8
          +    -0.37974326775206 * GRP_NumWebVisitsMonth2
          +    -0.21664462893373 * GRP_NumWebVisitsMonth3
          +    -0.29354965662623 * GRP_NumWebVisitsMonth4
          +     0.05912309691805 * GRP_NumWebVisitsMonth5
          +     0.00336298282733 * GRP_NumWebVisitsMonth6
          +     0.18685442551954 * GRP_NumWebVisitsMonth7
          +     0.07672545849498 * GRP_NumWebVisitsMonth8
          +    -0.07207149498011 * GRP_RFMstat2  +    -0.15950305183546 *
        GRP_RFMstat3  +    -0.04769364516978 * GRP_RFMstat4
          +    -0.00882390888626 * GRP_RFMstat5  +    -0.07661006142272 *
        GRP_RFMstat6  +     0.10619202272066 * GRP_RFMstat7
          +     0.12781265381966 * GRP_RFMstat8  +    -0.06589954645466 *
        GRP_RFMstat9  +      0.0920076477391 * GRP_RFMstat10
          +     0.22417426812948 * GRP_RMntFrq2  +     0.12308955447252 *
        GRP_RMntFrq3  +     -0.0709096722458 * GRP_RMntFrq4
          +    -0.09665324906445 * GRP_RMntFrq5  +     0.05404802941496 *
        GRP_RMntFrq6  +     -0.2773732279586 * GRP_RMntFrq7
          +    -0.30308069179408 * GRP_RMntFrq8  +    -0.11423475800051 *
        GRP_RMntFrq9  +    -0.00207097504576 * GRP_RMntFrq10
          +     0.48750564548185 * GRP_Recency2  +     0.33320222570381 *
        GRP_Recency3  +     0.24796788740541 * GRP_Recency4
          +     0.24418511158274 * GRP_Recency5  +     0.04836980441754 *
        GRP_Recency6  +     0.00192843617184 * GRP_Recency7
          +    -0.09040437561133 * GRP_Recency8  +    -0.13695951196499 *
        GRP_Recency9  +    -0.38555406809777 * GRP_Recency10 ;
   H13  = H13  +    -0.23975949521409 * GRP_AcceptedCmp52
          +    -0.15038912427149 * GRP_AcceptedCmpTotal3
          +    -0.02639019894622 * GRP_Frq2  +      0.0209879343907 * GRP_Frq3
          +    -0.04701151124137 * GRP_Frq4  +     0.21097277354199 * GRP_Frq5
          +     0.12012227863902 * GRP_Frq6  +    -0.07421032341607 * GRP_Frq7
          +     0.19658431807083 * GRP_Frq8  +    -0.05226562615755 * GRP_Frq9
          +     0.05597653780122 * GRP_Frq10  +     0.17120341383362 *
        GRP_Income2  +     0.09812054914141 * GRP_Income3
          +     0.15644165989621 * GRP_Income4  +     0.04090465657337 *
        GRP_Income5  +     0.14854142220811 * GRP_Income6
          +     0.10518345156393 * GRP_Income7  +     0.07639614158562 *
        GRP_Income8  +     0.17046626234482 * GRP_Income9
          +     0.03825262112761 * GRP_Income10  +    -0.06766465427377 *
        GRP_Mnt2  +    -0.08563392300903 * GRP_Mnt3  +    -0.21787222756548 *
        GRP_Mnt4  +     0.01899823791029 * GRP_Mnt5  +     0.05967271085466 *
        GRP_Mnt6  +    -0.12499644228381 * GRP_Mnt7  +    -0.14435081412155 *
        GRP_Mnt8  +    -0.14252043260208 * GRP_Mnt9  +    -0.08323850676532 *
        GRP_Mnt10  +     0.04114477269411 * GRP_MntFishProducts3
          +     0.09893856338637 * GRP_MntFishProducts4
          +      0.1385215809505 * GRP_MntFishProducts5
          +    -0.14638498466154 * GRP_MntFishProducts6
          +    -0.00648777978091 * GRP_MntFishProducts7
          +     0.10782473267799 * GRP_MntFishProducts8
          +     0.13001972812092 * GRP_MntFishProducts9
          +    -0.15664721122766 * GRP_MntFishProducts10
          +     0.06207283716621 * GRP_MntGoldProds2
          +    -0.16540502618932 * GRP_MntGoldProds3
          +    -0.00419113426167 * GRP_MntGoldProds4
          +    -0.15616562124594 * GRP_MntGoldProds5
          +     0.19299597306567 * GRP_MntGoldProds6
          +     0.06014052355635 * GRP_MntGoldProds7
          +    -0.04575999486456 * GRP_MntGoldProds8
          +      0.0095752569809 * GRP_MntGoldProds9
          +    -0.05949014660438 * GRP_MntGoldProds10
          +    -0.19601970187904 * GRP_MntMeatProducts2
          +    -0.05185736813653 * GRP_MntMeatProducts3
          +    -0.09619773384577 * GRP_MntMeatProducts4
          +    -0.01027665288868 * GRP_MntMeatProducts5
          +    -0.07620773034876 * GRP_MntMeatProducts6
          +    -0.21888659802114 * GRP_MntMeatProducts7
          +     0.09136355079296 * GRP_MntMeatProducts8
          +    -0.03462987847874 * GRP_MntMeatProducts9
          +      0.2033242827681 * GRP_MntMeatProducts10
          +    -0.03870314975231 * GRP_MntSweetProducts3
          +     0.02833274507907 * GRP_MntSweetProducts4
          +    -0.14006037291884 * GRP_MntSweetProducts5
          +     0.02172045500272 * GRP_MntSweetProducts6
          +     0.10356823396614 * GRP_MntSweetProducts7
          +     0.19721738077737 * GRP_MntSweetProducts8
          +    -0.04378585782125 * GRP_MntSweetProducts9
          +     0.08558224507445 * GRP_MntSweetProducts10
          +     0.18750621323673 * GRP_MntWines2  +     0.20631370991164 *
        GRP_MntWines3  +     0.18264845188539 * GRP_MntWines4
          +     0.19517731981032 * GRP_MntWines5  +      0.3172348878549 *
        GRP_MntWines6  +     -0.0700174737681 * GRP_MntWines7
          +    -0.13433821831179 * GRP_MntWines8  +    -0.18525074858401 *
        GRP_MntWines9  +    -0.00462918646351 * GRP_MntWines10
          +    -0.26862743551871 * GRP_NumCatalogPurchases3
          +     -0.1922446276115 * GRP_NumCatalogPurchases4
          +    -0.14822362894342 * GRP_NumCatalogPurchases5
          +    -0.04052742965098 * GRP_NumCatalogPurchases6
          +     0.21101352511891 * GRP_NumCatalogPurchases7
          +    -0.09588775463072 * GRP_NumDistPurchases2
          +    -0.15658252158004 * GRP_NumDistPurchases3
          +      0.0013743090184 * GRP_NumDistPurchases4
          +    -0.11554368014443 * GRP_NumDistPurchases5
          +     0.07423244034811 * GRP_NumDistPurchases6
          +     0.05834805090718 * GRP_NumDistPurchases7
          +    -0.12463576132288 * GRP_NumDistPurchases8
          +    -0.03179189812652 * GRP_NumDistPurchases9
          +     0.01279300331344 * GRP_NumDistPurchases10
          +    -0.05148868227287 * GRP_NumWebPurchases2
          +       0.126407567911 * GRP_NumWebPurchases3
          +    -0.07384834706894 * GRP_NumWebPurchases4
          +     0.20664248870859 * GRP_NumWebPurchases5
          +     0.12584364051888 * GRP_NumWebPurchases6
          +    -0.07856262149859 * GRP_NumWebPurchases7
          +     -0.0421904538227 * GRP_NumWebPurchases8
          +    -0.39807813413922 * GRP_NumWebVisitsMonth2
          +    -0.41818221692382 * GRP_NumWebVisitsMonth3
          +    -0.10842629005668 * GRP_NumWebVisitsMonth4
          +     0.04070704103804 * GRP_NumWebVisitsMonth5
          +     0.14449276979575 * GRP_NumWebVisitsMonth6
          +    -0.03455833946004 * GRP_NumWebVisitsMonth7
          +      0.2795681557571 * GRP_NumWebVisitsMonth8
          +    -0.11584512993649 * GRP_RFMstat2  +    -0.08000771454672 *
        GRP_RFMstat3  +     0.15435047581932 * GRP_RFMstat4
          +     0.15639777401667 * GRP_RFMstat5  +     0.13653913265734 *
        GRP_RFMstat6  +     0.01738099885837 * GRP_RFMstat7
          +    -0.09833460018931 * GRP_RFMstat8  +      0.1824870541175 *
        GRP_RFMstat9  +    -0.06768797179234 * GRP_RFMstat10
          +     0.12594211084791 * GRP_RMntFrq2  +    -0.01760788766872 *
        GRP_RMntFrq3  +     0.17892049391542 * GRP_RMntFrq4
          +      0.0600208306946 * GRP_RMntFrq5  +    -0.01237732322599 *
        GRP_RMntFrq6  +     0.05686770073947 * GRP_RMntFrq7
          +     0.02731624688039 * GRP_RMntFrq8  +     0.00340498223629 *
        GRP_RMntFrq9  +    -0.22067101016209 * GRP_RMntFrq10
          +      0.2098710117924 * GRP_Recency2  +     0.14903439860077 *
        GRP_Recency3  +     0.13401249348315 * GRP_Recency4
          +     0.07298641932791 * GRP_Recency5  +    -0.06050660489562 *
        GRP_Recency6  +    -0.09715484342683 * GRP_Recency7
          +    -0.07334022459066 * GRP_Recency8  +     0.08622885824343 *
        GRP_Recency9  +    -0.14521252633207 * GRP_Recency10 ;
   H14  = H14  +     0.09775139014406 * GRP_AcceptedCmp52
          +    -0.05185326111457 * GRP_AcceptedCmpTotal3
          +     0.06346844628454 * GRP_Frq2  +    -0.12509273928412 * GRP_Frq3
          +    -0.09198262128828 * GRP_Frq4  +    -0.01182504550004 * GRP_Frq5
          +      -0.056768207716 * GRP_Frq6  +    -0.16132581110621 * GRP_Frq7
          +    -0.04959596102282 * GRP_Frq8  +    -0.04567484157076 * GRP_Frq9
          +    -0.19802300351641 * GRP_Frq10  +      0.0752413635351 *
        GRP_Income2  +     0.00476632282991 * GRP_Income3
          +     0.06457401869132 * GRP_Income4  +     0.17338522672456 *
        GRP_Income5  +     0.05634925985236 * GRP_Income6
          +    -0.04324886540049 * GRP_Income7  +     0.12151783797002 *
        GRP_Income8  +     0.05164926456192 * GRP_Income9
          +     0.00485439723946 * GRP_Income10  +     0.15110097357718 *
        GRP_Mnt2  +     0.09865119271264 * GRP_Mnt3  +    -0.00511534178899 *
        GRP_Mnt4  +    -0.05719362330008 * GRP_Mnt5  +     0.02913562361493 *
        GRP_Mnt6  +     0.13642412041981 * GRP_Mnt7  +      0.0644852158438 *
        GRP_Mnt8  +     0.11260528545055 * GRP_Mnt9  +    -0.04836232783362 *
        GRP_Mnt10  +    -0.10704879727804 * GRP_MntFishProducts3
          +    -0.10246133021659 * GRP_MntFishProducts4
          +     0.07511280205792 * GRP_MntFishProducts5
          +     0.05316490785199 * GRP_MntFishProducts6
          +    -0.08700716569909 * GRP_MntFishProducts7
          +    -0.09682177985634 * GRP_MntFishProducts8
          +     0.07439756883922 * GRP_MntFishProducts9
          +     0.00446074450706 * GRP_MntFishProducts10
          +    -0.09001143924347 * GRP_MntGoldProds2
          +     0.01609312672536 * GRP_MntGoldProds3
          +     0.07035469032678 * GRP_MntGoldProds4
          +     0.00711603846698 * GRP_MntGoldProds5
          +    -0.04068446183089 * GRP_MntGoldProds6
          +     0.15395481242479 * GRP_MntGoldProds7
          +    -0.11308236846443 * GRP_MntGoldProds8
          +    -0.03537344566096 * GRP_MntGoldProds9
          +     0.06051838016414 * GRP_MntGoldProds10
          +      0.2035141766276 * GRP_MntMeatProducts2
          +     0.11278969513967 * GRP_MntMeatProducts3
          +     0.04661931313376 * GRP_MntMeatProducts4
          +     0.16452320933838 * GRP_MntMeatProducts5
          +     0.10770184592821 * GRP_MntMeatProducts6
          +     0.13901339765753 * GRP_MntMeatProducts7
          +    -0.05190887812163 * GRP_MntMeatProducts8
          +     0.01954217936532 * GRP_MntMeatProducts9
          +     0.03332801536639 * GRP_MntMeatProducts10
          +     0.08361196701406 * GRP_MntSweetProducts3
          +     0.12046863267625 * GRP_MntSweetProducts4
          +    -0.06960624989657 * GRP_MntSweetProducts5
          +     0.02528342548299 * GRP_MntSweetProducts6
          +     0.06650097777299 * GRP_MntSweetProducts7
          +     0.11859111222476 * GRP_MntSweetProducts8
          +    -0.06554622682799 * GRP_MntSweetProducts9
          +     0.21001957500605 * GRP_MntSweetProducts10
          +     0.00731755704127 * GRP_MntWines2  +    -0.13735139324497 *
        GRP_MntWines3  +    -0.04158270471567 * GRP_MntWines4
          +     0.07926049065675 * GRP_MntWines5  +    -0.02429458037724 *
        GRP_MntWines6  +     -0.1282166172913 * GRP_MntWines7
          +    -0.08677752910806 * GRP_MntWines8  +     0.07540797934238 *
        GRP_MntWines9  +     0.17493983229139 * GRP_MntWines10
          +     -0.0713614079649 * GRP_NumCatalogPurchases3
          +     0.04023033957679 * GRP_NumCatalogPurchases4
          +     0.05335371946994 * GRP_NumCatalogPurchases5
          +    -0.04900718695282 * GRP_NumCatalogPurchases6
          +    -0.02899204623539 * GRP_NumCatalogPurchases7
          +     0.03938478596542 * GRP_NumDistPurchases2
          +    -0.11842065825647 * GRP_NumDistPurchases3
          +     0.12810519506777 * GRP_NumDistPurchases4
          +     0.03251975367652 * GRP_NumDistPurchases5
          +    -0.20095019460601 * GRP_NumDistPurchases6
          +     0.10812326965005 * GRP_NumDistPurchases7
          +      0.0287453988047 * GRP_NumDistPurchases8
          +     -0.0969283103509 * GRP_NumDistPurchases9
          +    -0.16520433255669 * GRP_NumDistPurchases10
          +    -0.05852836521422 * GRP_NumWebPurchases2
          +    -0.09748986581637 * GRP_NumWebPurchases3
          +     -0.1035732808226 * GRP_NumWebPurchases4
          +    -0.02657669178935 * GRP_NumWebPurchases5
          +    -0.14302610588281 * GRP_NumWebPurchases6
          +    -0.02401715848443 * GRP_NumWebPurchases7
          +    -0.00665464700774 * GRP_NumWebPurchases8
          +     0.10779106619083 * GRP_NumWebVisitsMonth2
          +    -0.02984428486672 * GRP_NumWebVisitsMonth3
          +     0.13778787733685 * GRP_NumWebVisitsMonth4
          +     0.00802707801664 * GRP_NumWebVisitsMonth5
          +    -0.16625282394015 * GRP_NumWebVisitsMonth6
          +     0.10106887697617 * GRP_NumWebVisitsMonth7
          +    -0.08824472498437 * GRP_NumWebVisitsMonth8
          +    -0.03526513082645 * GRP_RFMstat2  +     0.10283156836959 *
        GRP_RFMstat3  +    -0.01757421618587 * GRP_RFMstat4
          +     0.14132635365523 * GRP_RFMstat5  +    -0.03672768186133 *
        GRP_RFMstat6  +     0.00258056988376 * GRP_RFMstat7
          +     0.05732533278238 * GRP_RFMstat8  +    -0.11555107353955 *
        GRP_RFMstat9  +     0.13078950712504 * GRP_RFMstat10
          +     0.06981855039942 * GRP_RMntFrq2  +     -0.0674188031774 *
        GRP_RMntFrq3  +     0.01403624484254 * GRP_RMntFrq4
          +     0.15675245151505 * GRP_RMntFrq5  +     0.02655321401599 *
        GRP_RMntFrq6  +     0.19673158757121 * GRP_RMntFrq7
          +    -0.07596120973163 * GRP_RMntFrq8  +    -0.02098873085179 *
        GRP_RMntFrq9  +     0.05038094121628 * GRP_RMntFrq10
          +     0.06723803817114 * GRP_Recency2  +    -0.05982635501022 *
        GRP_Recency3  +    -0.08002228635654 * GRP_Recency4
          +     -0.0814806856315 * GRP_Recency5  +     -0.0111860674205 *
        GRP_Recency6  +     0.14684736173087 * GRP_Recency7
          +     0.03782442851658 * GRP_Recency8  +     0.27840617851866 *
        GRP_Recency9  +     0.06367048710928 * GRP_Recency10 ;
   H15  = H15  +    -0.07806115508508 * GRP_AcceptedCmp52
          +    -0.07253207743328 * GRP_AcceptedCmpTotal3
          +     0.00068319550289 * GRP_Frq2  +     0.01053423185442 * GRP_Frq3
          +     0.12146836577194 * GRP_Frq4  +    -0.02109847088645 * GRP_Frq5
          +     0.12117603213018 * GRP_Frq6  +    -0.05610800968967 * GRP_Frq7
          +     0.03978492600567 * GRP_Frq8  +     0.04223735193015 * GRP_Frq9
          +    -0.06520463728003 * GRP_Frq10  +       0.062049900978 *
        GRP_Income2  +     0.03328830262974 * GRP_Income3
          +    -0.02319751936777 * GRP_Income4  +    -0.14018290895085 *
        GRP_Income5  +    -0.20161259066579 * GRP_Income6
          +     0.04520749587308 * GRP_Income7  +    -0.12005951328941 *
        GRP_Income8  +     -0.0271220049046 * GRP_Income9
          +    -0.01279023704027 * GRP_Income10  +     0.08937556740583 *
        GRP_Mnt2  +    -0.10612717465916 * GRP_Mnt3  +     0.17815428575003 *
        GRP_Mnt4  +     -0.0370614578947 * GRP_Mnt5  +    -0.01135345278923 *
        GRP_Mnt6  +    -0.12746479049026 * GRP_Mnt7  +    -0.10029531183924 *
        GRP_Mnt8  +    -0.05531509364291 * GRP_Mnt9  +    -0.05237212542444 *
        GRP_Mnt10  +    -0.11135939029175 * GRP_MntFishProducts3
          +     0.00523055501837 * GRP_MntFishProducts4
          +     0.06995755836785 * GRP_MntFishProducts5
          +    -0.04271980194111 * GRP_MntFishProducts6
          +     0.01174513507622 * GRP_MntFishProducts7
          +    -0.01277525563734 * GRP_MntFishProducts8
          +     0.12998167316257 * GRP_MntFishProducts9
          +    -0.09861861312574 * GRP_MntFishProducts10
          +     0.01241278109567 * GRP_MntGoldProds2
          +    -0.08099817362086 * GRP_MntGoldProds3
          +     0.06851172830818 * GRP_MntGoldProds4
          +     0.08958140948505 * GRP_MntGoldProds5
          +    -0.00218658598252 * GRP_MntGoldProds6
          +     -0.0121636699266 * GRP_MntGoldProds7
          +     0.08312530546896 * GRP_MntGoldProds8
          +    -0.09695558162329 * GRP_MntGoldProds9
          +    -0.13362889085159 * GRP_MntGoldProds10
          +      0.1497720820291 * GRP_MntMeatProducts2
          +     0.13747884120385 * GRP_MntMeatProducts3
          +    -0.01382324310957 * GRP_MntMeatProducts4
          +      0.1026627602622 * GRP_MntMeatProducts5
          +     0.12473983237959 * GRP_MntMeatProducts6
          +    -0.00460258978783 * GRP_MntMeatProducts7
          +    -0.02636237932342 * GRP_MntMeatProducts8
          +     0.01088187708787 * GRP_MntMeatProducts9
          +    -0.06235232820082 * GRP_MntMeatProducts10
          +    -0.01027496660636 * GRP_MntSweetProducts3
          +    -0.03339881469063 * GRP_MntSweetProducts4
          +    -0.00006744319692 * GRP_MntSweetProducts5
          +    -0.08133264214994 * GRP_MntSweetProducts6
          +    -0.08611045862832 * GRP_MntSweetProducts7
          +     0.04349149520384 * GRP_MntSweetProducts8
          +    -0.11983272725696 * GRP_MntSweetProducts9
          +      0.0295546319232 * GRP_MntSweetProducts10
          +    -0.08123379301643 * GRP_MntWines2  +     0.04651831039743 *
        GRP_MntWines3  +     0.06310002346307 * GRP_MntWines4
          +    -0.17933545315591 * GRP_MntWines5  +     -0.1937708146292 *
        GRP_MntWines6  +    -0.03101077799974 * GRP_MntWines7
          +     -0.1041503240188 * GRP_MntWines8  +     0.05775300092738 *
        GRP_MntWines9  +    -0.03058517174309 * GRP_MntWines10
          +     0.07560261351989 * GRP_NumCatalogPurchases3
          +    -0.02171409354554 * GRP_NumCatalogPurchases4
          +    -0.05679659919998 * GRP_NumCatalogPurchases5
          +    -0.12764205653408 * GRP_NumCatalogPurchases6
          +    -0.08101121779612 * GRP_NumCatalogPurchases7
          +     0.01667103886915 * GRP_NumDistPurchases2
          +    -0.01671279072694 * GRP_NumDistPurchases3
          +      0.1259674987166 * GRP_NumDistPurchases4
          +    -0.16321313045784 * GRP_NumDistPurchases5
          +     0.11936322929288 * GRP_NumDistPurchases6
          +    -0.06556668418313 * GRP_NumDistPurchases7
          +     0.10511131736767 * GRP_NumDistPurchases8
          +     0.15706878704211 * GRP_NumDistPurchases9
          +    -0.02459606438141 * GRP_NumDistPurchases10
          +    -0.12649905874392 * GRP_NumWebPurchases2
          +    -0.19047040809704 * GRP_NumWebPurchases3
          +     0.05314754301096 * GRP_NumWebPurchases4
          +     0.07985015828954 * GRP_NumWebPurchases5
          +     0.03142129782708 * GRP_NumWebPurchases6
          +    -0.06854751810317 * GRP_NumWebPurchases7
          +     0.04252315624645 * GRP_NumWebPurchases8
          +     0.05095051650376 * GRP_NumWebVisitsMonth2
          +    -0.06364646216319 * GRP_NumWebVisitsMonth3
          +     -0.0763099305682 * GRP_NumWebVisitsMonth4
          +    -0.09328993733351 * GRP_NumWebVisitsMonth5
          +    -0.15992682318474 * GRP_NumWebVisitsMonth6
          +     0.05855154160855 * GRP_NumWebVisitsMonth7
          +    -0.02936254579621 * GRP_NumWebVisitsMonth8
          +     0.03386330448388 * GRP_RFMstat2  +     0.15736501855948 *
        GRP_RFMstat3  +     0.00191361166205 * GRP_RFMstat4
          +     0.13353067210356 * GRP_RFMstat5  +     0.07177888737143 *
        GRP_RFMstat6  +    -0.09136544703087 * GRP_RFMstat7
          +     0.06240017584936 * GRP_RFMstat8  +    -0.13392008107813 *
        GRP_RFMstat9  +      0.1640400559806 * GRP_RFMstat10
          +    -0.04729585381288 * GRP_RMntFrq2  +    -0.10696256491016 *
        GRP_RMntFrq3  +    -0.01612962997775 * GRP_RMntFrq4
          +     0.03988781041495 * GRP_RMntFrq5  +    -0.16331389081736 *
        GRP_RMntFrq6  +    -0.04782412873041 * GRP_RMntFrq7
          +    -0.26113374531456 * GRP_RMntFrq8  +     0.12714151557135 *
        GRP_RMntFrq9  +     0.04516692519663 * GRP_RMntFrq10
          +    -0.02063571135452 * GRP_Recency2  +    -0.26395733111279 *
        GRP_Recency3  +     0.06052941897951 * GRP_Recency4
          +     0.02037202909561 * GRP_Recency5  +    -0.03853508999085 *
        GRP_Recency6  +    -0.04725141215181 * GRP_Recency7
          +    -0.03539071681016 * GRP_Recency8  +     0.00231218046757 *
        GRP_Recency9  +     0.15061319591771 * GRP_Recency10 ;
   H11  =    -0.41794755051402 + H11 ;
   H12  =    -0.49840292545282 + H12 ;
   H13  =     0.68519838870778 + H13 ;
   H14  =    -0.29927820698876 + H14 ;
   H15  =    -1.33189145036759 + H15 ;
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
   P_DepVar1  =     3.74750910029477 * H11  +     6.03649252206533 * H12
          +     3.79892216009428 * H13  +    -0.91884002074191 * H14
          +    -0.46883154533119 * H15 ;
   P_DepVar1  =    -1.84390654654668 + P_DepVar1 ;
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
;
drop S_:;
