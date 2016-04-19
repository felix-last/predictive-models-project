if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'ACCEPTEDCMP1'
'ACCEPTEDCMP2'
'ACCEPTEDCMP3'
'ACCEPTEDCMP4'
'ACCEPTEDCMP5'
'INCOME'
'MARITAL_STATUS'
'MNTFISHPRODUCTS'
'MNTFRUITS'
'MNTMEATPRODUCTS'
'MNTWINES'
'NUMCATALOGPURCHASES'
'NUMDEALSPURCHASES'
'NUMSTOREPURCHASES'
'NUMWEBPURCHASES'
'NUMWEBVISITSMONTH'
'RECENCY'
'TEENHOME'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg9: Rejected using stepwise selection";
end;
end;
