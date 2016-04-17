drop _temp_;
if (P_DepVar1 ge 0.980785875345) then do;
b_DepVar = 1;
end;
else
if (P_DepVar1 ge 0.83203277475849) then do;
b_DepVar = 2;
end;
else
if (P_DepVar1 ge 0.43137123253418) then do;
b_DepVar = 3;
end;
else
if (P_DepVar1 ge 0.16309067738074) then do;
b_DepVar = 4;
end;
else
if (P_DepVar1 ge 0.06726712135925) then do;
b_DepVar = 5;
end;
else
if (P_DepVar1 ge 0.03492810511934) then do;
b_DepVar = 6;
end;
else
if (P_DepVar1 ge 0.02319135232731) then do;
b_DepVar = 7;
end;
else
if (P_DepVar1 ge 0.01728572787016) then do;
b_DepVar = 8;
end;
else
if (P_DepVar1 ge 0.00813439589975) then do;
b_DepVar = 9;
end;
else
if (P_DepVar1 ge 0.00303945084466) then do;
b_DepVar = 10;
end;
else
if (P_DepVar1 ge 0.00082639242193) then do;
b_DepVar = 11;
end;
else
if (P_DepVar1 ge 0.00022056742045) then do;
b_DepVar = 12;
end;
else
if (P_DepVar1 ge 0.000078449593) then do;
b_DepVar = 13;
end;
else
if (P_DepVar1 ge 0.0000329292338) then do;
b_DepVar = 14;
end;
else
if (P_DepVar1 ge 0.00001563071851) then do;
b_DepVar = 15;
end;
else
if (P_DepVar1 ge 9.5509002667676E-6) then do;
b_DepVar = 16;
end;
else
if (P_DepVar1 ge 6.1627076498896E-6) then do;
b_DepVar = 17;
end;
else
do;
_temp_ = dmran(1234);
b_DepVar = floor(18 + 3*_temp_);
end;
