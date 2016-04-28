*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_DepVar $ 12;
label I_DepVar = 'Into: DepVar' ;
*** Target Values;
array REG3DRF [2] $12 _temporary_ ('1' '0' );
label U_DepVar = 'Unnormalized Into: DepVar' ;
format U_DepVar BEST.;
*** Unnormalized target values;
ARRAY REG3DRU[2]  _TEMPORARY_ (1 0);

*** Generate dummy variables for DepVar ;
drop _Y ;
label F_DepVar = 'From: DepVar' ;
length F_DepVar $ 12;
F_DepVar = put( DepVar , BEST. );
%DMNORMIP( F_DepVar )
if missing( DepVar ) then do;
   _Y = .;
end;
else do;
   if F_DepVar = '0'  then do;
      _Y = 1;
   end;
   else if F_DepVar = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

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
   goto REG3DR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: GRP_AcceptedCmp5 ;
_TEMP = 1;
_LP0 = _LP0 + (    -0.7446790765921) * _TEMP * _1_0;

***  Effect: GRP_AcceptedCmpTotal ;
_TEMP = 1;
_LP0 = _LP0 + (   -1.47644515097353) * _TEMP * _2_0;

***  Effect: GRP_Frq ;
_TEMP = 1;
_LP0 = _LP0 + (    1.60669977062618) * _TEMP * _3_0;
_LP0 = _LP0 + (    2.43462608830259) * _TEMP * _3_1;
_LP0 = _LP0 + (     2.0853454925309) * _TEMP * _3_2;
_LP0 = _LP0 + (    1.39670974961972) * _TEMP * _3_3;
_LP0 = _LP0 + (    0.42808058742905) * _TEMP * _3_4;
_LP0 = _LP0 + (   -0.71021933964392) * _TEMP * _3_5;
_LP0 = _LP0 + (   -0.48135407112575) * _TEMP * _3_6;
_LP0 = _LP0 + (   -1.63572249476541) * _TEMP * _3_7;
_LP0 = _LP0 + (   -1.72256503137932) * _TEMP * _3_8;

***  Effect: GRP_Income ;
_TEMP = 1;
_LP0 = _LP0 + (    -1.1068873777974) * _TEMP * _4_0;
_LP0 = _LP0 + (    -0.9547086898092) * _TEMP * _4_1;
_LP0 = _LP0 + (   -0.31212332505455) * _TEMP * _4_2;
_LP0 = _LP0 + (     0.4494292325574) * _TEMP * _4_3;
_LP0 = _LP0 + (    0.32802633763272) * _TEMP * _4_4;
_LP0 = _LP0 + (   -0.19075671306322) * _TEMP * _4_5;
_LP0 = _LP0 + (   -0.77559003357315) * _TEMP * _4_6;
_LP0 = _LP0 + (    0.18603490415793) * _TEMP * _4_7;
_LP0 = _LP0 + (    0.63801918363541) * _TEMP * _4_8;

***  Effect: GRP_MntFishProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.95284156310019) * _TEMP * _6_0;
_LP0 = _LP0 + (    0.26502435397607) * _TEMP * _6_1;
_LP0 = _LP0 + (    0.17695765630059) * _TEMP * _6_2;
_LP0 = _LP0 + (   -0.14572197867389) * _TEMP * _6_3;
_LP0 = _LP0 + (    0.01505271297294) * _TEMP * _6_4;
_LP0 = _LP0 + (    0.54563980035699) * _TEMP * _6_5;
_LP0 = _LP0 + (   -0.52118071899185) * _TEMP * _6_6;
_LP0 = _LP0 + (    -0.4363500869228) * _TEMP * _6_7;

***  Effect: GRP_MntMeatProducts ;
_TEMP = 1;
_LP0 = _LP0 + (   -8.31770021190691) * _TEMP * _8_0;
_LP0 = _LP0 + (   -4.36624878948483) * _TEMP * _8_1;
_LP0 = _LP0 + (   -3.04851308469506) * _TEMP * _8_2;
_LP0 = _LP0 + (   -1.48432419417486) * _TEMP * _8_3;
_LP0 = _LP0 + (    0.88788868200015) * _TEMP * _8_4;
_LP0 = _LP0 + (    1.33039344853623) * _TEMP * _8_5;
_LP0 = _LP0 + (    2.74637356935852) * _TEMP * _8_6;
_LP0 = _LP0 + (    2.83781421974894) * _TEMP * _8_7;
_LP0 = _LP0 + (    4.06889115404295) * _TEMP * _8_8;

***  Effect: GRP_MntSweetProducts ;
_TEMP = 1;
_LP0 = _LP0 + (    0.30891510159184) * _TEMP * _9_0;
_LP0 = _LP0 + (    0.71823102140593) * _TEMP * _9_1;
_LP0 = _LP0 + (    0.40751268124015) * _TEMP * _9_2;
_LP0 = _LP0 + (    -0.0500970886438) * _TEMP * _9_3;
_LP0 = _LP0 + (    0.75914971161272) * _TEMP * _9_4;
_LP0 = _LP0 + (   -0.27777464352641) * _TEMP * _9_5;
_LP0 = _LP0 + (   -0.19862700981974) * _TEMP * _9_6;
_LP0 = _LP0 + (   -0.38787782785805) * _TEMP * _9_7;

***  Effect: GRP_MntWines ;
_TEMP = 1;
_LP0 = _LP0 + (    3.97976057988328) * _TEMP * _10_0;
_LP0 = _LP0 + (     2.7500535043595) * _TEMP * _10_1;
_LP0 = _LP0 + (    2.23351774782852) * _TEMP * _10_2;
_LP0 = _LP0 + (     1.7536016671876) * _TEMP * _10_3;
_LP0 = _LP0 + (     0.1640545854573) * _TEMP * _10_4;
_LP0 = _LP0 + (   -0.36967718483959) * _TEMP * _10_5;
_LP0 = _LP0 + (   -1.60242387302593) * _TEMP * _10_6;
_LP0 = _LP0 + (   -2.18568823441387) * _TEMP * _10_7;
_LP0 = _LP0 + (   -3.01781681630858) * _TEMP * _10_8;

***  Effect: GRP_NumCatalogPurchases ;
_TEMP = 1;
_LP0 = _LP0 + (   -6.23994183900208) * _TEMP * _11_0;
_LP0 = _LP0 + (   -2.68869740629193) * _TEMP * _11_1;
_LP0 = _LP0 + (   -0.15877773244651) * _TEMP * _11_2;
_LP0 = _LP0 + (    1.53123175936135) * _TEMP * _11_3;
_LP0 = _LP0 + (    2.69517926058072) * _TEMP * _11_4;

***  Effect: GRP_NumWebVisitsMonth ;
_TEMP = 1;
_LP0 = _LP0 + (    -3.3002412240753) * _TEMP * _14_0;
_LP0 = _LP0 + (   -2.20033226941868) * _TEMP * _14_1;
_LP0 = _LP0 + (   -1.72135475558275) * _TEMP * _14_2;
_LP0 = _LP0 + (   -0.69842997035409) * _TEMP * _14_3;
_LP0 = _LP0 + (    0.59993420393711) * _TEMP * _14_4;
_LP0 = _LP0 + (    0.72581883605563) * _TEMP * _14_5;
_LP0 = _LP0 + (    2.32956561429985) * _TEMP * _14_6;

***  Effect: GRP_RMntFrq ;
_TEMP = 1;
_LP0 = _LP0 + (    2.78248187088817) * _TEMP * _16_0;
_LP0 = _LP0 + (    1.57916958099666) * _TEMP * _16_1;
_LP0 = _LP0 + (    0.80760708078323) * _TEMP * _16_2;
_LP0 = _LP0 + (   -0.84109819008678) * _TEMP * _16_3;
_LP0 = _LP0 + (   -0.83990394353114) * _TEMP * _16_4;
_LP0 = _LP0 + (   -1.88920830968665) * _TEMP * _16_5;
_LP0 = _LP0 + (   -1.53102493561927) * _TEMP * _16_6;
_LP0 = _LP0 + (   -0.00003768720234) * _TEMP * _16_7;
_LP0 = _LP0 + (   -0.59460667119256) * _TEMP * _16_8;

***  Effect: GRP_Recency ;
_TEMP = 1;
_LP0 = _LP0 + (    4.15436119707335) * _TEMP * _17_0;
_LP0 = _LP0 + (    3.08080497220808) * _TEMP * _17_1;
_LP0 = _LP0 + (    2.90742407234312) * _TEMP * _17_2;
_LP0 = _LP0 + (    1.50207200800462) * _TEMP * _17_3;
_LP0 = _LP0 + (   -0.21286194047464) * _TEMP * _17_4;
_LP0 = _LP0 + (    -0.3852938818758) * _TEMP * _17_5;
_LP0 = _LP0 + (   -1.39433099504826) * _TEMP * _17_6;
_LP0 = _LP0 + (   -1.80436921997444) * _TEMP * _17_7;
_LP0 = _LP0 + (   -3.75257988441601) * _TEMP * _17_8;

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -3.20489068488757 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REG3DR1:

*** Residuals;
if (_Y = .) then do;
   R_DepVar1 = .;
   R_DepVar0 = .;
end;
else do;
    label R_DepVar1 = 'Residual: DepVar=1' ;
    label R_DepVar0 = 'Residual: DepVar=0' ;
   R_DepVar1 = - _P0;
   R_DepVar0 = - _P1;
   select( _Y );
      when (0)  R_DepVar1 = R_DepVar1 + 1;
      when (1)  R_DepVar0 = R_DepVar0 + 1;
   end;
end;

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
I_DepVar = REG3DRF[_IY];
U_DepVar = REG3DRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
