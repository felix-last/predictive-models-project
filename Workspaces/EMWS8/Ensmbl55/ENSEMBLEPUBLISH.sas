*------------------------------------------------------------*;
* Ensmbl55: Maximum Posteriors of 7 models;
*------------------------------------------------------------*;
_psum = 0;
drop _psum _premainder;
P_DepVar1 = max(
AutoNeural36_P_DepVar1 ,
AutoNeural35_P_DepVar1 ,
AutoNeural34_P_DepVar1 ,
AutoNeural40_P_DepVar1 ,
AutoNeural39_P_DepVar1 ,
AutoNeural38_P_DepVar1 ,
AutoNeural37_P_DepVar1
);
_premainder =1 - _psum;
if P_DepVar1 > _premainder then do;
P_DepVar1 = _premainder;
end;
_psum + P_DepVar1;
P_DepVar0 = max(
AutoNeural36_P_DepVar0 ,
AutoNeural35_P_DepVar0 ,
AutoNeural34_P_DepVar0 ,
AutoNeural40_P_DepVar0 ,
AutoNeural39_P_DepVar0 ,
AutoNeural38_P_DepVar0 ,
AutoNeural37_P_DepVar0
);
_premainder =1 - _psum;
if P_DepVar0 > _premainder then do;
P_DepVar0 = _premainder;
end;
_psum + P_DepVar0;
*------------------------------------------------------------*;
* Ensmbl55: Computing Classification Vars;
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
* Ensmbl55: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl55: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL36_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL36_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL36_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL36_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL35_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL35_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL35_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL35_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL34_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL34_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL34_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL34_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL40_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL40_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL40_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL40_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL39_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL39_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL39_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL39_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL38_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL38_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL38_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL38_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL37_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL37_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL37_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL37_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
