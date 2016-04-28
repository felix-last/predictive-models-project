if upcase(trim(left(NAME))) eq  '_Y_'  then ROLE='PREDICT';
if upcase(trim(left(NAME))) eq  '_R_'  then ROLE='RESIDUAL';
if upcase(trim(left(NAME))) eq  '_ALPHA_'  then ROLE='REJECTED';
if upcase(trim(left(NAME))) eq  '_BOUND_'  then ROLE='REJECTED';
