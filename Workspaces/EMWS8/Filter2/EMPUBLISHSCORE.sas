if
( Income eq . or (Income<=107000))
and ( MntFishProducts eq . or (MntFishProducts<=200))
and ( MntFruits eq . or (MntFruits<=157))
and ( MntGoldProds eq . or (MntGoldProds<=196))
and ( MntMeatProducts eq . or (MntMeatProducts<=964))
and ( MntSweetProducts eq . or (MntSweetProducts<=143.2))
and ( MntWines eq . or (MntWines<=1325))
and ( NumCatalogPurchases eq . or (NumCatalogPurchases<=14))
and ( NumDealsPurchases eq . or (NumDealsPurchases<=10.5))
and ( NumWebVisitsMonth eq . or (NumWebVisitsMonth<=13.42))
then do;
if M_FILTER eq . then M_FILTER = 0;
else M_FILTER = M_FILTER + 0;
end;
else M_FILTER = 1;
label M_FILTER = 'Filtered Indicator';
