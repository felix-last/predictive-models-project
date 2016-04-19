*------------------------------------------------------------*;
* Metadata Changes;
*------------------------------------------------------------*;
if upcase(NAME) = "HIGHEREDUCATION" then ROLE="REJECTED";
if upcase(NAME) = "HIGHEREDUCATION" then delete;
if upcase(NAME) = "YEAR_BIRTH" then ROLE="REJECTED";
