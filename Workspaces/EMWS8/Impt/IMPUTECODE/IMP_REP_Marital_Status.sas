length IMP_REP_Marital_Status $12;
format IMP_REP_Marital_Status $12.0;
label IMP_REP_Marital_Status = 'Imputed: Replacement: Marital_Status';
IMP_REP_Marital_Status = REP_Marital_Status;
if REP_Marital_Status = '' then IMP_REP_Marital_Status = 'Married';
