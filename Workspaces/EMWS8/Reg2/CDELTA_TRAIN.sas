if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'PC_1'
'PC_10'
'PC_11'
'PC_13'
'PC_14'
'PC_15'
'PC_16'
'PC_2'
'PC_3'
'PC_4'
'PC_5'
'PC_6'
'PC_7'
'PC_8'
'PC_9'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg2: Rejected using stepwise selection";
end;
end;
