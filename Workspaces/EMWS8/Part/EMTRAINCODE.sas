*------------------------------------------------------------*;
* Part: Retrieving stratification variable(s) levels;
*------------------------------------------------------------*;
proc freq data=EMWS8.Trans_TRAIN noprint;
format
DepVar BEST.
;
table
DepVar
/out=WORK.Part_FREQ(drop=percent);
run;
proc sort data=WORK.Part_FREQ;
by descending count;
run;
* Part: Retrieving levels that meet minimum requirement;
data WORK.Part_FREQ2(keep = count);
set WORK.Part_FREQ;
where (.01 * 70 * count) >= 3;
run;
*------------------------------------------------------------*;
* Part: Create stratified partitioning;
*------------------------------------------------------------*;
data
EMWS8.Part_TRAIN(label="")
EMWS8.Part_VALIDATE(label="")
;
retain _seed_ 12345;
drop _seed_ _genvalue_;
call ranuni(_seed_, _genvalue_);
_dataobs_ = _N_;
drop _c00:;
set EMWS8.Trans_TRAIN;
length _Pformat1 $58;
drop _Pformat1;
_Pformat1 = strip(put(DepVar, BEST.));
if
_Pformat1 = '0'
then do;
if (2878+1-_C000003)*_genvalue_ <= (2015 - _C000001) then do;
_C000001 + 1;
output EMWS8.Part_TRAIN;
end;
else do;
_C000002 + 1;
output EMWS8.Part_VALIDATE;
end;
_C000003+1;
end;
else if
_Pformat1 = '1'
then do;
if (514+1-_C000006)*_genvalue_ <= (360 - _C000004) then do;
_C000004 + 1;
output EMWS8.Part_TRAIN;
end;
else do;
_C000005 + 1;
output EMWS8.Part_VALIDATE;
end;
_C000006+1;
end;
run;
