/*----G_Marital_Status begin----*/
length _NORM12 $ 12;
_NORM12 = put( Marital_Status , $12. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
when("DIVORCED    " ) G_Marital_Status = 1;
when("MARRIED     " ) G_Marital_Status = 2;
when("SINGLE      " ) G_Marital_Status = 3;
when("TOGETHER    " ) G_Marital_Status = 2;
when("WIDOW       " ) G_Marital_Status = 0;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Marital_Status="Grouped Levels for Marital_Status";
/*----G_Marital_Status end----*/
