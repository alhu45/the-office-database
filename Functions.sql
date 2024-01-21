--Find number of employees
select count(emp_id)
from employee; 

--Find the number of female employees born after 1970
select count(emp_id)
from employee
where sex = 'F' and birth_date > '1971-01-01';

--Finding average of all employee salaries
select avg(salary)
from employee;

--Finding average of male employees
select avg(salary)
from employee
where sex = 'M';

--Sum of all salaries
select sum(salary)
from employee;

--Finding number of females and males employees
select count(sex), sex
from employee
group by sex;

--Finding total sales of each salesman 
select sum(total_sales), emp_id
from works_with
group by emp_id;