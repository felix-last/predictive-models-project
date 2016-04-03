

length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(Dependents,BEST.);
length _FILTERNORM1  $32;
drop _FILTERNORM1 ;
%dmnormcp(_FILTERFMT1,_FILTERNORM1);


length _FILTERFMT2  $200;
drop _FILTERFMT2 ;
_FILTERFMT2= put(Education,$10.0);


length _FILTERFMT3  $200;
drop _FILTERFMT3 ;
_FILTERFMT3= put(Gender,$1.0);


length _FILTERFMT4  $200;
drop _FILTERFMT4 ;
_FILTERFMT4= put(Marital_Status,$12.0);
if
_FILTERNORM1 not in ( '.')
 and
_FILTERFMT2 not in ( ' ' , 'OldSchool')
 and
_FILTERFMT3 not in ( ' ' , '?')
 and
_FILTERFMT4 not in ( ' ' , 'BigConfusion')
and
( CatPurchase ne .)
and ( Clothes ne .)
and ( Dt_Customer ne .)
and ( Frq ne .)
and ( HouseKeeping ne . and (0<=HouseKeeping) and (HouseKeeping<=40))
and ( Income ne .)
and ( Kitchen ne . and (0<=Kitchen) and (Kitchen<=40))
and ( Mnt ne .)
and ( NetPurchase ne .)
and ( Rcn ne .)
and ( Recomendation ne .)
and ( SmallAppliances ne .)
and ( Toys ne . and (0<=Toys) and (Toys<=35))
and ( Year_Birth ne .)
then do;
if M_FILTER eq . then M_FILTER = 0;
else M_FILTER = M_FILTER + 0;
end;
else M_FILTER = 1;
label M_FILTER = 'Filtered Indicator';
