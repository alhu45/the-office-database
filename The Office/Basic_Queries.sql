--Find all employees
select *
from employee
order by salary desc; 

--Find all employee ordered by sex then name 
select *
from employee
order by sex, first_name, last_name;

--Limit to 5 employees
select *
from employee
limit 5;

--Change the first name into forenames and last name as surname 
select first_name as forename, last_name as surname
from employee;

--Find all genders
select distinct sex
from employee;

--Find all branches
select distinct branch_id
from employee;



