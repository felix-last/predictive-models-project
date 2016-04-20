*------------------------------------------------------------*;
* Ensmbl30: Voting to produce predicted target;
*------------------------------------------------------------*;
array Ensmbl30_post{2} _temporary_;
array Ensmbl30_count{2} _temporary_;
array Ensmbl30_level{2} $32 _temporary_ (
"1"
"0"
);
do i=1 to 2;
Ensmbl30_post{i} = 0;
Ensmbl30_count{i} = 0;
end;
if Neural2_I_DepVar = Ensmbl30_level{1} then do;
Ensmbl30_count{1} + 1;
Ensmbl30_post{1}=Ensmbl30_post{1}+ Neural2_P_DepVar1;
end;
if Neural3_I_DepVar = Ensmbl30_level{1} then do;
Ensmbl30_count{1} + 1;
Ensmbl30_post{1}=Ensmbl30_post{1}+ Neural3_P_DepVar1;
end;
if Neural9_I_DepVar = Ensmbl30_level{1} then do;
Ensmbl30_count{1} + 1;
Ensmbl30_post{1}=Ensmbl30_post{1}+ Neural9_P_DepVar1;
end;
if Neural2_I_DepVar = Ensmbl30_level{2} then do;
Ensmbl30_count{2} + 1;
Ensmbl30_post{2}=Ensmbl30_post{2}+ Neural2_P_DepVar0;
end;
if Neural3_I_DepVar = Ensmbl30_level{2} then do;
Ensmbl30_count{2} + 1;
Ensmbl30_post{2}=Ensmbl30_post{2}+ Neural3_P_DepVar0;
end;
if Neural9_I_DepVar = Ensmbl30_level{2} then do;
Ensmbl30_count{2} + 1;
Ensmbl30_post{2}=Ensmbl30_post{2}+ Neural9_P_DepVar0;
end;
*------------------------------------------------------------*;
* Ensmbl30: Determine Into Variable;
*------------------------------------------------------------*;
length I_DepVar $32;
drop i vote_count vote_post;
vote_count = max(
Ensmbl30_count{1} ,
Ensmbl30_count{2}
);
do i=1 to 2;
if Ensmbl30_count{i}=vote_count and Ensmbl30_post{i}>vote_post then do;
I_DepVar = Ensmbl30_level{i};
vote_post = Ensmbl30_count{i};
end;
end;
*------------------------------------------------------------*;
* Ensmbl30: Compute posterior vars using models predicting the chosen level;
*------------------------------------------------------------*;
P_DepVar1 = 0;
P_DepVar0 = 0;
if I_DepVar = Neural2_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + Neural2_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + Neural2_P_DepVar0;
end;
if I_DepVar = Neural3_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + Neural3_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + Neural3_P_DepVar0;
end;
if I_DepVar = Neural9_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + Neural9_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + Neural9_P_DepVar0;
end;
* Ensmbl30: Averaging posterior;
P_DepVar1 = P_DepVar1/vote_count;
P_DepVar0 = P_DepVar0/vote_count;
*------------------------------------------------------------*;
* Ensmbl30: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl30: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(NEURAL2_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL2_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL2_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL2_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL3_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL3_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL3_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL3_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(NEURAL9_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(NEURAL9_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(NEURAL9_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(NEURAL9_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl30: Computing Residual Vars;
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