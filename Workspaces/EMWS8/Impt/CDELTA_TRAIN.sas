if NAME = "Income" then delete;
else 
if NAME    = "IMP_Income"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_Education" then delete;
else 
if NAME    = "IMP_REP_Education"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_Gender" then delete;
else 
if NAME    = "IMP_REP_Gender"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "BINARY" ;
   ORDER   = "" ;
end;
if NAME = "REP_HouseKeeping" then delete;
else 
if NAME    = "IMP_REP_HouseKeeping"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_Kitchen" then delete;
else 
if NAME    = "IMP_REP_Kitchen"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_Marital_Status" then delete;
else 
if NAME    = "IMP_REP_Marital_Status"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "NOMINAL" ;
   ORDER   = "" ;
end;
if NAME = "REP_Toys" then delete;
else 
if NAME    = "IMP_REP_Toys"  then do;
   ROLE    = "INPUT" ;
   FAMILY  = "" ;
   REPORT  = "N" ;
   LEVEL   = "INTERVAL" ;
   ORDER   = "" ;
end;
