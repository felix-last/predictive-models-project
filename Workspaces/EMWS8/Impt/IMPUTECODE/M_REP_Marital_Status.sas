label M_REP_Marital_Status = "Imputation Indicator for REP_Marital_Status";
if REP_Marital_Status = '' then M_REP_Marital_Status = 1;
else M_REP_Marital_Status= 0;
