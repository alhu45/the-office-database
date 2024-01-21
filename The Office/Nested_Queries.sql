-- Find names of all employees who have sold over 30 000 units to a single client
select employee.first_name, employee.last_name
from employee
where employee.emp_id in (
    select works_with.emp_id
    from works_with
    where works_with.total_sales > 30000
);

-- Find all clients who are handled by the branch that Michale Scott manages
select client.client_name
from client
where client.branch_id = (
    select branch.branch_id
    from branch
    where branch.mgr_id = 102
    limit 1
);


