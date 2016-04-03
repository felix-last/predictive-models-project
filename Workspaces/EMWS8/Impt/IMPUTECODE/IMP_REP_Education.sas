length IMP_REP_Education $10;
format IMP_REP_Education $10.0;
label IMP_REP_Education = 'Imputed: Replacement: Education';
IMP_REP_Education = REP_Education;
if REP_Education = '' then IMP_REP_Education = 'Graduation';
