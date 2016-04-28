*------------------------------------------------------------*;
* Ensmbl18: Average Posteriors of 7 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural22_P_DepVar1 +
Neural21_P_DepVar1 +
Neural18_P_DepVar1 +
Reg7_P_DepVar1 +
Reg3_P_DepVar1 +
Neural5_P_DepVar1 +
AutoNeural26_P_DepVar1
)/7;
P_DepVar0 = (
Neural22_P_DepVar0 +
Neural21_P_DepVar0 +
Neural18_P_DepVar0 +
Reg7_P_DepVar0 +
Reg3_P_DepVar0 +
Neural5_P_DepVar0 +
AutoNeural26_P_DepVar0
)/7;
*------------------------------------------------------------*;
* Ensmbl18: Computing Classification Vars;
*------------------------------------------------------------*;
length I_DepVar $32;
label I_DepVar = 'Into: DepVar';
length _format $200;
drop _format;
_format= ' ';
_p_= 0;
drop _p_;
if P_DepVar1 > _p_ then do;
_p_= P_DepVar1;
_format= '1';
end;
if P_DepVar0 > _p_ then do;
_p_= P_DepVar0;
_format= '0';
end;
%DMNORMCP(_format,I_DepVar);
*------------------------------------------------------------*;
* Ensmbl18: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl18: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL22_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL22_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL22_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL22_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL21_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL21_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL21_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL21_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL18_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL18_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL18_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL18_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL5_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL5_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL5_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL5_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL26_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL26_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL26_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL26_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl18: Computing Residual Vars;
*------------------------------------------------------------*;
if
F_DepVar NE '1'
AND F_DepVar NE '0'
then do;
R_DepVar1 = .;
R_DepVar0 = .;
end;
else do;
R_DepVar1 = -P_DepVar1;
R_DepVar0 = -P_DepVar0;
SELECT(F_DepVar);
WHEN('1') R_DepVar1 = R_DepVar1 +1;
WHEN('0') R_DepVar0 = R_DepVar0 +1;
OTHERWISE;
END;
END;
