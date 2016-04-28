*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG7DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG7DRU[2]  _TEMPORARY_ (1 0);

drop _DM_BAD;
_DM_BAD=0;

*** Generate dummy variables for GRP_AcceptedCmp5 ;
drop _1_0 ;
if missing( GRP_AcceptedCmp5 ) then do;
   _1_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmp5 , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      _1_0 = 1;
   end;
   else if _dm12 = '3'  then do;
      _1_0 = -1;
   end;
   else do;
      _1_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_AcceptedCmpTotal ;
drop _2_0 ;
if missing( GRP_AcceptedCmpTotal ) then do;
   _2_0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_AcceptedCmpTotal , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      _2_0 = 1;
   end;
   else if _dm12 = '4'  then do;
      _2_0 = -1;
   end;
   else do;
      _2_0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Frq ;
drop _3_0 _3_1 _3_2 _3_3 _3_4 _3_5 _3_6 _3_7 _3_8 ;
*** encoding is sparse, initialize to zero;
_3_0 = 0;
_3_1 = 0;
_3_2 = 0;
_3_3 = 0;
_3_4 = 0;
_3_5 = 0;
_3_6 = 0;
_3_7 = 0;
_3_8 = 0;
if missing( GRP_Frq ) then do;
   _3_0 = .;
   _3_1 = .;
   _3_2 = .;
   _3_3 = .;
   _3_4 = .;
   _3_5 = .;
   _3_6 = .;
   _3_7 = .;
   _3_8 = .;
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
               _3_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _3_0 = -1;
                  _3_1 = -1;
                  _3_2 = -1;
                  _3_3 = -1;
                  _3_4 = -1;
                  _3_5 = -1;
                  _3_6 = -1;
                  _3_7 = -1;
                  _3_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _3_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _3_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _3_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _3_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _3_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _3_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _3_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _3_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _3_0 = .;
      _3_1 = .;
      _3_2 = .;
      _3_3 = .;
      _3_4 = .;
      _3_5 = .;
      _3_6 = .;
      _3_7 = .;
      _3_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Income ;
drop _4_0 _4_1 _4_2 _4_3 _4_4 _4_5 _4_6 _4_7 _4_8 ;
*** encoding is sparse, initialize to zero;
_4_0 = 0;
_4_1 = 0;
_4_2 = 0;
_4_3 = 0;
_4_4 = 0;
_4_5 = 0;
_4_6 = 0;
_4_7 = 0;
_4_8 = 0;
if missing( GRP_Income ) then do;
   _4_0 = .;
   _4_1 = .;
   _4_2 = .;
   _4_3 = .;
   _4_4 = .;
   _4_5 = .;
   _4_6 = .;
   _4_7 = .;
   _4_8 = .;
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
               _4_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _4_0 = -1;
                  _4_1 = -1;
                  _4_2 = -1;
                  _4_3 = -1;
                  _4_4 = -1;
                  _4_5 = -1;
                  _4_6 = -1;
                  _4_7 = -1;
                  _4_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _4_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _4_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _4_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _4_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _4_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _4_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _4_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _4_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _4_0 = .;
      _4_1 = .;
      _4_2 = .;
      _4_3 = .;
      _4_4 = .;
      _4_5 = .;
      _4_6 = .;
      _4_7 = .;
      _4_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntFishProducts ;
drop _6_0 _6_1 _6_2 _6_3 _6_4 _6_5 _6_6 _6_7 ;
*** encoding is sparse, initialize to zero;
_6_0 = 0;
_6_1 = 0;
_6_2 = 0;
_6_3 = 0;
_6_4 = 0;
_6_5 = 0;
_6_6 = 0;
_6_7 = 0;
if missing( GRP_MntFishProducts ) then do;
   _6_0 = .;
   _6_1 = .;
   _6_2 = .;
   _6_3 = .;
   _6_4 = .;
   _6_5 = .;
   _6_6 = .;
   _6_7 = .;
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
               _6_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _6_0 = -1;
                  _6_1 = -1;
                  _6_2 = -1;
                  _6_3 = -1;
                  _6_4 = -1;
                  _6_5 = -1;
                  _6_6 = -1;
                  _6_7 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               _6_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _6_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _6_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _6_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _6_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _6_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _6_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _6_0 = .;
      _6_1 = .;
      _6_2 = .;
      _6_3 = .;
      _6_4 = .;
      _6_5 = .;
      _6_6 = .;
      _6_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntMeatProducts ;
drop _8_0 _8_1 _8_2 _8_3 _8_4 _8_5 _8_6 _8_7 _8_8 ;
*** encoding is sparse, initialize to zero;
_8_0 = 0;
_8_1 = 0;
_8_2 = 0;
_8_3 = 0;
_8_4 = 0;
_8_5 = 0;
_8_6 = 0;
_8_7 = 0;
_8_8 = 0;
if missing( GRP_MntMeatProducts ) then do;
   _8_0 = .;
   _8_1 = .;
   _8_2 = .;
   _8_3 = .;
   _8_4 = .;
   _8_5 = .;
   _8_6 = .;
   _8_7 = .;
   _8_8 = .;
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
               _8_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _8_0 = -1;
                  _8_1 = -1;
                  _8_2 = -1;
                  _8_3 = -1;
                  _8_4 = -1;
                  _8_5 = -1;
                  _8_6 = -1;
                  _8_7 = -1;
                  _8_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _8_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _8_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _8_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _8_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _8_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _8_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _8_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _8_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _8_0 = .;
      _8_1 = .;
      _8_2 = .;
      _8_3 = .;
      _8_4 = .;
      _8_5 = .;
      _8_6 = .;
      _8_7 = .;
      _8_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntSweetProducts ;
drop _9_0 _9_1 _9_2 _9_3 _9_4 _9_5 _9_6 _9_7 ;
*** encoding is sparse, initialize to zero;
_9_0 = 0;
_9_1 = 0;
_9_2 = 0;
_9_3 = 0;
_9_4 = 0;
_9_5 = 0;
_9_6 = 0;
_9_7 = 0;
if missing( GRP_MntSweetProducts ) then do;
   _9_0 = .;
   _9_1 = .;
   _9_2 = .;
   _9_3 = .;
   _9_4 = .;
   _9_5 = .;
   _9_6 = .;
   _9_7 = .;
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
               _9_7 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _9_0 = -1;
                  _9_1 = -1;
                  _9_2 = -1;
                  _9_3 = -1;
                  _9_4 = -1;
                  _9_5 = -1;
                  _9_6 = -1;
                  _9_7 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '3'  then do;
               _9_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _9_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _9_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _9_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _9_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _9_5 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _9_6 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _9_0 = .;
      _9_1 = .;
      _9_2 = .;
      _9_3 = .;
      _9_4 = .;
      _9_5 = .;
      _9_6 = .;
      _9_7 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_MntWines ;
drop _10_0 _10_1 _10_2 _10_3 _10_4 _10_5 _10_6 _10_7 _10_8 ;
*** encoding is sparse, initialize to zero;
_10_0 = 0;
_10_1 = 0;
_10_2 = 0;
_10_3 = 0;
_10_4 = 0;
_10_5 = 0;
_10_6 = 0;
_10_7 = 0;
_10_8 = 0;
if missing( GRP_MntWines ) then do;
   _10_0 = .;
   _10_1 = .;
   _10_2 = .;
   _10_3 = .;
   _10_4 = .;
   _10_5 = .;
   _10_6 = .;
   _10_7 = .;
   _10_8 = .;
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
               _10_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _10_0 = -1;
                  _10_1 = -1;
                  _10_2 = -1;
                  _10_3 = -1;
                  _10_4 = -1;
                  _10_5 = -1;
                  _10_6 = -1;
                  _10_7 = -1;
                  _10_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _10_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _10_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _10_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _10_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _10_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _10_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _10_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _10_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _10_0 = .;
      _10_1 = .;
      _10_2 = .;
      _10_3 = .;
      _10_4 = .;
      _10_5 = .;
      _10_6 = .;
      _10_7 = .;
      _10_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumCatalogPurchases ;
drop _11_0 _11_1 _11_2 _11_3 _11_4 ;
*** encoding is sparse, initialize to zero;
_11_0 = 0;
_11_1 = 0;
_11_2 = 0;
_11_3 = 0;
_11_4 = 0;
if missing( GRP_NumCatalogPurchases ) then do;
   _11_0 = .;
   _11_1 = .;
   _11_2 = .;
   _11_3 = .;
   _11_4 = .;
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
            _11_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _11_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '5'  then do;
            _11_2 = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _11_3 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _11_4 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _11_0 = -1;
            _11_1 = -1;
            _11_2 = -1;
            _11_3 = -1;
            _11_4 = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      _11_0 = .;
      _11_1 = .;
      _11_2 = .;
      _11_3 = .;
      _11_4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_NumWebVisitsMonth ;
drop _14_0 _14_1 _14_2 _14_3 _14_4 _14_5 _14_6 ;
*** encoding is sparse, initialize to zero;
_14_0 = 0;
_14_1 = 0;
_14_2 = 0;
_14_3 = 0;
_14_4 = 0;
_14_5 = 0;
_14_6 = 0;
if missing( GRP_NumWebVisitsMonth ) then do;
   _14_0 = .;
   _14_1 = .;
   _14_2 = .;
   _14_3 = .;
   _14_4 = .;
   _14_5 = .;
   _14_6 = .;
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
            _14_0 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '3'  then do;
               _14_1 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '4'  then do;
            _14_2 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '5'  then do;
               _14_3 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 = '6'  then do;
            _14_4 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '7'  then do;
               _14_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _14_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _14_0 = -1;
               _14_1 = -1;
               _14_2 = -1;
               _14_3 = -1;
               _14_4 = -1;
               _14_5 = -1;
               _14_6 = -1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _14_0 = .;
      _14_1 = .;
      _14_2 = .;
      _14_3 = .;
      _14_4 = .;
      _14_5 = .;
      _14_6 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_RMntFrq ;
drop _16_0 _16_1 _16_2 _16_3 _16_4 _16_5 _16_6 _16_7 _16_8 ;
*** encoding is sparse, initialize to zero;
_16_0 = 0;
_16_1 = 0;
_16_2 = 0;
_16_3 = 0;
_16_4 = 0;
_16_5 = 0;
_16_6 = 0;
_16_7 = 0;
_16_8 = 0;
if missing( GRP_RMntFrq ) then do;
   _16_0 = .;
   _16_1 = .;
   _16_2 = .;
   _16_3 = .;
   _16_4 = .;
   _16_5 = .;
   _16_6 = .;
   _16_7 = .;
   _16_8 = .;
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
               _16_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _16_0 = -1;
                  _16_1 = -1;
                  _16_2 = -1;
                  _16_3 = -1;
                  _16_4 = -1;
                  _16_5 = -1;
                  _16_6 = -1;
                  _16_7 = -1;
                  _16_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _16_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _16_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _16_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _16_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _16_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _16_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _16_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _16_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _16_0 = .;
      _16_1 = .;
      _16_2 = .;
      _16_3 = .;
      _16_4 = .;
      _16_5 = .;
      _16_6 = .;
      _16_7 = .;
      _16_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_Recency ;
drop _17_0 _17_1 _17_2 _17_3 _17_4 _17_5 _17_6 _17_7 _17_8 ;
*** encoding is sparse, initialize to zero;
_17_0 = 0;
_17_1 = 0;
_17_2 = 0;
_17_3 = 0;
_17_4 = 0;
_17_5 = 0;
_17_6 = 0;
_17_7 = 0;
_17_8 = 0;
if missing( GRP_Recency ) then do;
   _17_0 = .;
   _17_1 = .;
   _17_2 = .;
   _17_3 = .;
   _17_4 = .;
   _17_5 = .;
   _17_6 = .;
   _17_7 = .;
   _17_8 = .;
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
               _17_8 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '11'  then do;
                  _17_0 = -1;
                  _17_1 = -1;
                  _17_2 = -1;
                  _17_3 = -1;
                  _17_4 = -1;
                  _17_5 = -1;
                  _17_6 = -1;
                  _17_7 = -1;
                  _17_8 = -1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '2'  then do;
               _17_0 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            _17_1 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '4'  then do;
               _17_2 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm12 <= '7'  then do;
         if _dm12 <= '6'  then do;
            if _dm12 = '5'  then do;
               _17_3 = 1;
               _dm_find = 1;
            end;
            else do;
               if _dm12 = '6'  then do;
                  _17_4 = 1;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm12 = '7'  then do;
               _17_5 = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '8'  then do;
            _17_6 = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '9'  then do;
               _17_7 = 1;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      _17_0 = .;
      _17_1 = .;
      _17_2 = .;
      _17_3 = .;
      _17_4 = .;
      _17_5 = .;
      _17_6 = .;
      _17_7 = .;
      _17_8 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.151221567;
   _P1 = 0.848778433;
   goto REG7DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.43533664969535) * _TEMP * _1_0;

***  Effect: GRP_AcceptedCmpTotal ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.80259368074474) * _TEMP * _2_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (    0.91100459014326) * _TEMP * _3_0;
_LP0 = _LP0 + (    1.30517605331849) * _TEMP * _3_1;
_LP0 = _LP0 + (    1.11556358848526) * _TEMP * _3_2;
_LP0 = _LP0 + (    0.75137606837703) * _TEMP * _3_3;
_LP0 = _LP0 + (    0.22667584665051) * _TEMP * _3_4;
_LP0 = _LP0 + (   -0.36355490163716) * _TEMP * _3_5;
_LP0 = _LP0 + (   -0.27212699434389) * _TEMP * _3_6;
_LP0 = _LP0 + (   -0.89978590791079) * _TEMP * _3_7;
_LP0 = _LP0 + (   -0.94480140724689) * _TEMP * _3_8;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (   -0.67863268191527) * _TEMP * _4_0;
_LP0 = _LP0 + (   -0.57046328857592) * _TEMP * _4_1;
_LP0 = _LP0 + (    -0.1890918276771) * _TEMP * _4_2;
_LP0 = _LP0 + (    0.23692190511298) * _TEMP * _4_3;
_LP0 = _LP0 + (    0.20526853412013) * _TEMP * _4_4;
_LP0 = _LP0 + (   -0.17214495632527) * _TEMP * _4_5;
_LP0 = _LP0 + (   -0.39723869175524) * _TEMP * _4_6;
_LP0 = _LP0 + (    0.12606456143445) * _TEMP * _4_7;
_LP0 = _LP0 + (    0.42361200787646) * _TEMP * _4_8;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.48752062405289) * _TEMP * _6_0;
_LP0 = _LP0 + (    0.17481352517088) * _TEMP * _6_1;
_LP0 = _LP0 + (    0.09853640441631) * _TEMP * _6_2;
_LP0 = _LP0 + (   -0.07229233845021) * _TEMP * _6_3;
_LP0 = _LP0 + (   -0.01389179233941) * _TEMP * _6_4;
_LP0 = _LP0 + (     0.3386403333754) * _TEMP * _6_5;
_LP0 = _LP0 + (   -0.25832507184609) * _TEMP * _6_6;
_LP0 = _LP0 + (   -0.26492098163096) * _TEMP * _6_7;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -4.59610842787446) * _TEMP * _8_0;
_LP0 = _LP0 + (   -2.32024987229394) * _TEMP * _8_1;
_LP0 = _LP0 + (   -1.64646759719417) * _TEMP * _8_2;
_LP0 = _LP0 + (   -0.76151212861519) * _TEMP * _8_3;
_LP0 = _LP0 + (    0.51722378376922) * _TEMP * _8_4;
_LP0 = _LP0 + (    0.75208074934091) * _TEMP * _8_5;
_LP0 = _LP0 + (    1.45871842458832) * _TEMP * _8_6;
_LP0 = _LP0 + (    1.52563715317721) * _TEMP * _8_7;
_LP0 = _LP0 + (    2.21558270110625) * _TEMP * _8_8;

***  Effect: GRP_MntSweetProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.18739902632568) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.37870460830373) * _TEMP * _9_1;
_LP0 = _LP0 + (    0.22908519374031) * _TEMP * _9_2;
_LP0 = _LP0 + (   -0.00561701310679) * _TEMP * _9_3;
_LP0 = _LP0 + (     0.3857620674363) * _TEMP * _9_4;
_LP0 = _LP0 + (   -0.16844878587934) * _TEMP * _9_5;
_LP0 = _LP0 + (    -0.1305347485537) * _TEMP * _9_6;
_LP0 = _LP0 + (   -0.18036392668341) * _TEMP * _9_7;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    2.19744807146287) * _TEMP * _10_0;
_LP0 = _LP0 + (    1.49780556010343) * _TEMP * _10_1;
_LP0 = _LP0 + (    1.20853403645007) * _TEMP * _10_2;
_LP0 = _LP0 + (    0.91522429321633) * _TEMP * _10_3;
_LP0 = _LP0 + (    0.07188342963614) * _TEMP * _10_4;
_LP0 = _LP0 + (   -0.19911189687109) * _TEMP * _10_5;
_LP0 = _LP0 + (   -0.89304358322459) * _TEMP * _10_6;
_LP0 = _LP0 + (   -1.20703026995025) * _TEMP * _10_7;
_LP0 = _LP0 + (   -1.59039392715362) * _TEMP * _10_8;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -3.40703872318535) * _TEMP * _11_0;
_LP0 = _LP0 + (   -1.45181049982561) * _TEMP * _11_1;
_LP0 = _LP0 + (   -0.08347404660345) * _TEMP * _11_2;
_LP0 = _LP0 + (    0.81955944534199) * _TEMP * _11_3;
_LP0 = _LP0 + (    1.45035693356184) * _TEMP * _11_4;

***  Effect: GRP_NumWebVisitsMonth ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.81981937806131) * _TEMP * _14_0;
_LP0 = _LP0 + (   -1.17799242784665) * _TEMP * _14_1;
_LP0 = _LP0 + (   -0.94053899638537) * _TEMP * _14_2;
_LP0 = _LP0 + (   -0.36886112918233) * _TEMP * _14_3;
_LP0 = _LP0 + (    0.29366599559997) * _TEMP * _14_4;
_LP0 = _LP0 + (    0.37587988225403) * _TEMP * _14_5;
_LP0 = _LP0 + (     1.2821313793468) * _TEMP * _14_6;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (    1.52257971842016) * _TEMP * _16_0;
_LP0 = _LP0 + (    0.89925185098242) * _TEMP * _16_1;
_LP0 = _LP0 + (    0.43979399106939) * _TEMP * _16_2;
_LP0 = _LP0 + (   -0.48868452275874) * _TEMP * _16_3;
_LP0 = _LP0 + (   -0.47818270496821) * _TEMP * _16_4;
_LP0 = _LP0 + (   -0.97732618505089) * _TEMP * _16_5;
_LP0 = _LP0 + (   -0.76235371002566) * _TEMP * _16_6;
_LP0 = _LP0 + (   -0.06176798843746) * _TEMP * _16_7;
_LP0 = _LP0 + (   -0.36783009575746) * _TEMP * _16_8;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    2.27376799087472) * _TEMP * _17_0;
_LP0 = _LP0 + (    1.66840677656296) * _TEMP * _17_1;
_LP0 = _LP0 + (    1.58394582906104) * _TEMP * _17_2;
_LP0 = _LP0 + (    0.81992790457539) * _TEMP * _17_3;
_LP0 = _LP0 + (   -0.09864306453973) * _TEMP * _17_4;
_LP0 = _LP0 + (   -0.23893324542319) * _TEMP * _17_5;
_LP0 = _LP0 + (   -0.78852448679899) * _TEMP * _17_6;
_LP0 = _LP0 + (   -0.94445512442103) * _TEMP * _17_7;
_LP0 = _LP0 + (   -2.02058858598198) * _TEMP * _17_8;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_P0 = probnorm((   -1.74663497603269) + _LP0);
_P1 = 1.0 - _P0;

REG7DR1:


*** Posterior Probabilities and Predicted Level;
label P_DepVar1 = 'Predicted: DepVar=1' ;
label P_DepVar0 = 'Predicted: DepVar=0' ;
P_DepVar1 = _P0;
_MAXP = _P0;
_IY = 1;
P_DepVar0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_DepVar = REG7DRF[_IY];
U_DepVar = REG7DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
