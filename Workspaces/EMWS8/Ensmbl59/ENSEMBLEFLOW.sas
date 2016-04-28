*------------------------------------------------------------*;
* Ensmbl59: Voting to produce predicted target;
*------------------------------------------------------------*;
array Ensmbl59_post{2} _temporary_;
array Ensmbl59_count{2} _temporary_;
array Ensmbl59_level{2} $32 _temporary_ (
"1"
"0"
);
do i=1 to 2;
Ensmbl59_post{i} = 0;
Ensmbl59_count{i} = 0;
end;
if AutoNeural44_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural44_P_DepVar1;
end;
if AutoNeural45_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural45_P_DepVar1;
end;
if AutoNeural47_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural47_P_DepVar1;
end;
if AutoNeural41_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural41_P_DepVar1;
end;
if AutoNeural42_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural42_P_DepVar1;
end;
if AutoNeural43_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural43_P_DepVar1;
end;
if AutoNeural46_I_DepVar = Ensmbl59_level{1} then do;
Ensmbl59_count{1} + 1;
Ensmbl59_post{1}=Ensmbl59_post{1}+ AutoNeural46_P_DepVar1;
end;
if AutoNeural44_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural44_P_DepVar0;
end;
if AutoNeural45_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural45_P_DepVar0;
end;
if AutoNeural47_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural47_P_DepVar0;
end;
if AutoNeural41_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural41_P_DepVar0;
end;
if AutoNeural42_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural42_P_DepVar0;
end;
if AutoNeural43_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural43_P_DepVar0;
end;
if AutoNeural46_I_DepVar = Ensmbl59_level{2} then do;
Ensmbl59_count{2} + 1;
Ensmbl59_post{2}=Ensmbl59_post{2}+ AutoNeural46_P_DepVar0;
end;
*------------------------------------------------------------*;
* Ensmbl59: Determine Into Variable;
*------------------------------------------------------------*;
length I_DepVar $32;
drop i vote_count vote_post;
vote_count = max(
Ensmbl59_count{1} ,
Ensmbl59_count{2}
);
do i=1 to 2;
if Ensmbl59_count{i}=vote_count and Ensmbl59_post{i}>vote_post then do;
I_DepVar = Ensmbl59_level{i};
vote_post = Ensmbl59_count{i};
end;
end;
*------------------------------------------------------------*;
* Ensmbl59: Compute posterior vars using models predicting the chosen level;
*------------------------------------------------------------*;
P_DepVar1 = 0;
P_DepVar0 = 0;
if I_DepVar = AutoNeural44_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural44_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural44_P_DepVar0;
end;
if I_DepVar = AutoNeural45_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural45_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural45_P_DepVar0;
end;
if I_DepVar = AutoNeural47_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural47_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural47_P_DepVar0;
end;
if I_DepVar = AutoNeural41_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural41_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural41_P_DepVar0;
end;
if I_DepVar = AutoNeural42_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural42_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural42_P_DepVar0;
end;
if I_DepVar = AutoNeural43_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural43_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural43_P_DepVar0;
end;
if I_DepVar = AutoNeural46_I_DepVar then do;
P_DEPVAR1 = P_DEPVAR1 + AutoNeural46_P_DepVar1;
P_DEPVAR0 = P_DEPVAR0 + AutoNeural46_P_DepVar0;
end;
* Ensmbl59: Averaging posterior;
P_DepVar1 = P_DepVar1/vote_count;
P_DepVar0 = P_DepVar0/vote_count;
*------------------------------------------------------------*;
* Ensmbl59: Producing Unformatted variable;
*------------------------------------------------------------*;
label U_DepVar = "Unnormalized Into: DepVar";
if I_DepVar = '1' then U_DepVar = 1;
else
if I_DepVar = '0' then U_DepVar = 0;
*------------------------------------------------------------*;
* Ensmbl59: Computing _WARN_ Variable;
*------------------------------------------------------------*;
length _WARN_ $4;
label _WARN_ = 'Warnings';
_WARN_ = '';
if index(AUTONEURAL44_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL44_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL44_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL44_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL45_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL45_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL45_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL45_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL47_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL47_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL47_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL47_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL41_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL41_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL41_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL41_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL42_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL42_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL42_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL42_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL43_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL43_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL43_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL43_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
if index(AUTONEURAL46_WARN_, 'M') and ^index(_WARN_, 'M') then substr(_WARN_, 1, 1) ='M';
if index(AUTONEURAL46_WARN_, 'U') and ^index(_WARN_, 'U') then substr(_WARN_, 2, 1) ='U';
if index(AUTONEURAL46_WARN_, 'P') and ^index(_WARN_, 'P') then substr(_WARN_, 3, 1) ='P';
if index(AUTONEURAL46_WARN_, 'C') and ^index(_WARN_, 'C') then substr(_WARN_, 4, 1) ='C';
*------------------------------------------------------------*;
* Ensmbl59: Computing Residual Vars;
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