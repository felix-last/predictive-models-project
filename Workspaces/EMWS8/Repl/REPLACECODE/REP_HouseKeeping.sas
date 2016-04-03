* ;
*Variable: HouseKeeping;
* ;
Label REP_HouseKeeping= 'Replacement: HouseKeeping';
REP_HouseKeeping= HouseKeeping;
if HouseKeeping eq . then REP_HouseKeeping = .;
else
if HouseKeeping<0 then REP_HouseKeeping=.;
else
if HouseKeeping>35 then REP_HouseKeeping=.;
