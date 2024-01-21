-- % = any number of characters, _ = one character  
  
  --Find clients that are an LLC
  select *
  from client 
  where client_name like '%LLC';

--Find any branch supplier who are in the label business
select * 
from branch_supplier
where supplier_name like '% Lables%';

--Find any employee born in October
select *
from employee
where birth_date like '____-10%';

--Find clients that are schools
select *
from client
where client_name like '%school%'