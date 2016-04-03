*;
/*----G_Education begin----*/
length _NORM10 $ 10;
_NORM10 = put( Education , $10. );
%DMNORMIP( _NORM10 )
drop _NORM10;
select(_NORM10);
when("2N CYCLE  " ) G_Education = 1;
when("BASIC     " ) G_Education = 2;
when("GRADUATION" ) G_Education = 2;
when("MASTER    " ) G_Education = 0;
when("PHD       " ) G_Education = 2;
otherwise substr(_WARN_, 2, 1) = 'U';
end;
label G_Education="Grouped Levels for Education";
/*----G_Education end----*/
