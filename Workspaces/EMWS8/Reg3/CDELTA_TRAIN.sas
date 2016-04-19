if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'GRP_ACCEPTEDCMP5'
'GRP_FRQ'
'GRP_INCOME'
'GRP_MNTFISHPRODUCTS'
'GRP_MNTMEATPRODUCTS'
'GRP_MNTWINES'
'GRP_NUMCATALOGPURCHASES'
'GRP_NUMDISTPURCHASES'
'GRP_RMNTFRQ'
'GRP_RECENCY'
'YEAR_BIRTH'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg3: Rejected using stepwise selection";
end;
end;
