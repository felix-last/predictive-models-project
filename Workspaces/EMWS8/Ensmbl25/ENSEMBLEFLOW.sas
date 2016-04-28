*------------------------------------------------------------*;
* Ensmbl25: Maximum Posteriors of 20 models;
*------------------------------------------------------------*;
_psum = 0;
drop _psum _premainder;
P_DepVar1 = max(
Rule_P_DepVar1 ,
Neural10_P_DepVar1 ,
Neural9_P_DepVar1 ,
Neural7_P_DepVar1 ,
Neural3_P_DepVar1 ,
Neural2_P_DepVar1 ,
Neural_P_DepVar1 ,
Neural4_P_DepVar1 ,
Tree_P_DepVar1 ,
Reg_P_DepVar1 ,
Reg5_P_DepVar1 ,
DMNeural_P_DepVar1 ,
Boost_P_DepVar1 ,
AutoNeural12_P_DepVar1 ,
AutoNeural11_P_DepVar1 ,
AutoNeural9_P_DepVar1 ,
AutoNeural10_P_DepVar1 ,
AutoNeural8_P_DepVar1 ,
AutoNeural7_P_DepVar1 ,
AutoNeural6_P_DepVar1
);
_premainder =1 - _psum;
if P_DepVar1 > _premainder then do;
P_DepVar1 = _premainder;
end;
_psum + P_DepVar1;
P_DepVar0 = max(
Rule_P_DepVar0 ,
Neural10_P_DepVar0 ,
Neural9_P_DepVar0 ,
Neural7_P_DepVar0 ,
Neural3_P_DepVar0 ,
Neural2_P_DepVar0 ,
Neural_P_DepVar0 ,
Neural4_P_DepVar0 ,
Tree_P_DepVar0 ,
Reg_P_DepVar0 ,
Reg5_P_DepVar0 ,
DMNeural_P_DepVar0 ,
Boost_P_DepVar0 ,
AutoNeural12_P_DepVar0 ,
AutoNeural11_P_DepVar0 ,
AutoNeural9_P_DepVar0 ,
AutoNeural10_P_DepVar0 ,
AutoNeural8_P_DepVar0 ,
AutoNeural7_P_DepVar0 ,
AutoNeural6_P_DepVar0
);
_premainder =1 - _psum;
if P_DepVar0 > _premainder then do;
P_DepVar0 = _premainder;
end;
_psum + P_DepVar0;
*------------------------------------------------------------*;
* Ensmbl25: Computing Classification Vars;
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
* Ensmbl25: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl25: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(RULE_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(RULE_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(RULE_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(RULE_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL10_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL10_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL10_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL10_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL9_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL9_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL9_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL9_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL4_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL4_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL4_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL4_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(TREE_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(TREE_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(TREE_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(TREE_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(REG5_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(REG5_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(REG5_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(REG5_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(DMNEURAL_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(DMNEURAL_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(DMNEURAL_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(DMNEURAL_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(BOOST_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(BOOST_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(BOOST_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(BOOST_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL12_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL12_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL12_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL12_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL11_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL11_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL11_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL11_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL9_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL9_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL9_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL9_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL10_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL10_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL10_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL10_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL8_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL8_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL8_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL8_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL7_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL7_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL7_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL7_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL6_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL6_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL6_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL6_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl25: Computing Residual Vars;
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
