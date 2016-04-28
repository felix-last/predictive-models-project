*------------------------------------------------------------*;
*Computing Residual Vars: DepVar;
*------------------------------------------------------------*;
Label R_DepVar1='Residual: DepVar=1';
Label R_DepVar0='Residual: DepVar=0';
if 
 F_DepVar ne '1'
and F_DepVar ne '0'
 then do;
R_DepVar1=.;
R_DepVar0=.;
end;
else do;
R_DepVar1= - P_DepVar1;
R_DepVar0= - P_DepVar0;
select(F_DepVar);
when('1')R_DepVar1= R_DepVar1+1;
when('0')R_DepVar0= R_DepVar0+1;
otherwise;
end;
end;
