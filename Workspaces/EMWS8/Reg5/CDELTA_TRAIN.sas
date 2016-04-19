if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'ACCEPTEDCMPTOTAL'
'FRQ'
'INCOME'
'MARITAL_STATUS'
'MNT'
'MNTGOLDPRODS'
'MNTMEATPRODUCTS'
'NUMCATALOGPURCHASES'
'NUMDEALSPURCHASES'
'NUMWEBVISITSMONTH'
'RFMSTAT'
'RECENCY'
'TEENHOME'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg5: Rejected using stepwise selection";
end;
end;
