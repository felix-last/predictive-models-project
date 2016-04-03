*;
* Drop prediction variables since they are for INPUTS not TARGETS;
* Replace _NODE_ by _XODE_ so it can be safely dropped;
*;
drop
P_Income
P_REP_HouseKeeping
P_REP_Kitchen
P_REP_Toys
;
