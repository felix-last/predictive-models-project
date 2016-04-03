* ;
*Variable: Toys;
* ;
Label REP_Toys= 'Replacement: Toys';
REP_Toys= Toys;
if Toys eq . then REP_Toys = .;
else
if Toys<0 then REP_Toys=.;
else
if Toys>40 then REP_Toys=.;
