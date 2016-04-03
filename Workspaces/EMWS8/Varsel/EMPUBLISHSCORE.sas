******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Warnings";


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


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
