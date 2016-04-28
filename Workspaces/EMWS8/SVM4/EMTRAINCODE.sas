%macro main;

   filename temp catalog 'sashelp.emmodl.svm_macros.source';
   %include temp;
   filename temp;
   %SetProperties;
   %if %upcase(&EM_ACTION) = CREATE %then %do;
       filename temp catalog 'sashelp.emmodl.svm_create.source';
       %include temp;
       filename temp;
       %create;
   %end;
   %else
   %if %upcase(&EM_ACTION) = TRAIN %then %do;
       filename temp catalog 'sashelp.emmodl.svm_train.source';
       %include temp;
       filename temp;
       %train;
   %end;
   %else
   %if %upcase(&EM_ACTION) = REPORT %then %do;
       filename temp catalog 'sashelp.emmodl.svm_report.source';
       %include temp;
       filename temp;
       %report;
   %end;

%mend main;

%main;

