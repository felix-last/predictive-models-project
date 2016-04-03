
 %EM_Register(Key=Imputed,Type=DATA);



Data &EM_USER_Imputed;
  Set &EM_IMPORT_DATA.;

Run;



proc export
  data=&EM_USER_Imputed
  dbms=xlsx
  outfile="&EMPROJECTPATH.\DataSets_External\EMOutput\&EM_WSNAME._ImputedDataset.xlsx"
  replace;
run;


     %EM_Report(Key=Imputed,
                Viewtype=DATA,
                Autodisplay=Y,
                Block=Output,
                Description=Imputed dataset);
