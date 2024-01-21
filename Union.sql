--Union combines a bunch of select statments together 

--Find a list of employee and branch names 
select first_name as bruh
from employee
union
select branch_name
from branch;

--Find a list of all clients and branch sipplier names
select client_name, client.branch_id
from client
union
select supplier_name, branch_supplier.branch_id
from branch_supplier;

--Find a list of all money spent or earned by company
select salary
from employee
union 
select total_sales
from works_with;  