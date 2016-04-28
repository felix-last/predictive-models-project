if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'ACCEPTEDCMPTOTAL'
'MNT'
'MNTMEATPRODUCTS'
'NUMCATALOGPURCHASES'
'RECENCY'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg8: Rejected using stepwise selection";
end;
end;
