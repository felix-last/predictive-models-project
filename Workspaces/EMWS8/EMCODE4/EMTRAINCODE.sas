Data &EM_EXPORT_TRAIN.;
 Set &EM_IMPORT_DATA.;



  RMntFrq=Mnt/Frq;

  HigherEducation=1*(upcase(Education) in ("GRADUATION","MASTER","PHD"));

  Age = year(today())-Year_Birth;


Run;

