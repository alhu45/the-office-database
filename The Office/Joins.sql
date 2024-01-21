--Combines information into a single table

--Inserting a new branch into branch table without manager id 
--and branch start date
insert into branch values(4, 'Buffalo', null, null);

--Find all branches and the names of their managers
select employee.emp_id, employee.first_name, branch.branch_name
from employee
join branch
on employee.emp_id = branch.mgr_id;

--Find all branches and the names of their managers along with the  
--other employees
select employee.emp_id, employee.first_name, branch.branch_name
from employee
left join branch
on employee.emp_id = branch.mgr_id;

--Find all branches and the names of their managers along with the  
--other branches 
select employee.emp_id, employee.first_name, branch.branch_name
from employee
right join branch
on employee.emp_id = branch.mgr_id;