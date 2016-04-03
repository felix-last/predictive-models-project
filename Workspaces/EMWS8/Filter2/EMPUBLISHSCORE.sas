

length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(Education,$10.0);


length _FILTERFMT2  $200;
drop _FILTERFMT2 ;
_FILTERFMT2= put(Gender,$1.0);


length _FILTERFMT3  $200;
drop _FILTERFMT3 ;
_FILTERFMT3= put(Marital_Status,$12.0);
if
_FILTERFMT1 not in ( 'OldSchool')
 and
_FILTERFMT2 not in ( '?')
 and
_FILTERFMT3 not in ( 'BigConfusion')
and
( HouseKeeping eq . or (0<=HouseKeeping) and (HouseKeeping<=40))
and ( Kitchen eq . or (0<=Kitchen) and (Kitchen<=40))
and ( Toys eq . or (0<=Toys) and (Toys<=40))
then do;
if M_FILTER eq . then M_FILTER = 0;
else M_FILTER = M_FILTER + 0;
end;
else M_FILTER = 1;
label M_FILTER = 'Filtered Indicator';
