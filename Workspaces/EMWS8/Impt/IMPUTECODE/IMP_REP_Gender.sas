length IMP_REP_Gender $1;
format IMP_REP_Gender $1.0;
label IMP_REP_Gender = 'Imputed: Replacement: Gender';
IMP_REP_Gender = REP_Gender;
if REP_Gender = '' then IMP_REP_Gender = 'F';
