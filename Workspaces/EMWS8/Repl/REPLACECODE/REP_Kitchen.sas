* ;
*Variable: Kitchen;
* ;
Label REP_Kitchen= 'Replacement: Kitchen';
REP_Kitchen= Kitchen;
if Kitchen eq . then REP_Kitchen = .;
else
if Kitchen<0 then REP_Kitchen=.;
else
if Kitchen>40 then REP_Kitchen=.;
