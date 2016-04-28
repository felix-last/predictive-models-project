*------------------------------------------------------------*;
* Ensmbl2: Average Posteriors of 21 models;
*------------------------------------------------------------*;
P_DepVar1 = (
Neural11_P_DepVar1 +
Neural13_P_DepVar1 +
Neural14_P_DepVar1 +
Neural15_P_DepVar1 +
Neural16_P_DepVar1 +
Neural17_P_DepVar1 +
Neural12_P_DepVar1 +
Tree2_P_DepVar1 +
Reg2_P_DepVar1 +
Reg6_P_DepVar1 +
MBR_P_DepVar1 +
Boost3_P_DepVar1 +
Rule2_P_DepVar1 +
DMNeural2_P_DepVar1 +
AutoNeural15_P_DepVar1 +
AutoNeural14_P_DepVar1 +
AutoNeural13_P_DepVar1 +
AutoNeural19_P_DepVar1 +
AutoNeural18_P_DepVar1 +
AutoNeural17_P_DepVar1 +
AutoNeural16_P_DepVar1
)/21;
P_DepVar0 = (
Neural11_P_DepVar0 +
Neural13_P_DepVar0 +
Neural14_P_DepVar0 +
Neural15_P_DepVar0 +
Neural16_P_DepVar0 +
Neural17_P_DepVar0 +
Neural12_P_DepVar0 +
Tree2_P_DepVar0 +
Reg2_P_DepVar0 +
Reg6_P_DepVar0 +
MBR_P_DepVar0 +
Boost3_P_DepVar0 +
Rule2_P_DepVar0 +
DMNeural2_P_DepVar0 +
AutoNeural15_P_DepVar0 +
AutoNeural14_P_DepVar0 +
AutoNeural13_P_DepVar0 +
AutoNeural19_P_DepVar0 +
AutoNeural18_P_DepVar0 +
AutoNeural17_P_DepVar0 +
AutoNeural16_P_DepVar0
)/21;
*------------------------------------------------------------*;
* Ensmbl2: Computing Classification Vars;
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
* Ensmbl2: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl2: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL11_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL11_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL11_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL11_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL13_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL13_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL13_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL13_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL14_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL14_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL14_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL14_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL15_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL15_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL15_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL15_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL16_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL16_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL16_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL16_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL17_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL17_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL17_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL17_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL12_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL12_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL12_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL12_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(TREE2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(TREE2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(TREE2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(TREE2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG6_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG6_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG6_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG6_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(MBR_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(MBR_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(MBR_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(MBR_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(BOOST3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(BOOST3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(BOOST3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(BOOST3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(RULE2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(RULE2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(RULE2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(RULE2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(DMNEURAL2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(DMNEURAL2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(DMNEURAL2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(DMNEURAL2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL15_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL15_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL15_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL15_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL14_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL14_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL14_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL14_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL13_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL13_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL13_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL13_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL19_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL19_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL19_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL19_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL18_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL18_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL18_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL18_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL17_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL17_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL17_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL17_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL16_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL16_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL16_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL16_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl2: Computing Residual Vars;
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
