--Table for employees
CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

DESCRIBE employee;

--Table for branches
CREATE TABLE branch(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    --if employee is deleted, sets it as null
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

--deleting employee
delete from employee
where emp_id = 102;


ALTER TABLE employee
ADD FOREIGN KEY (branch_id) 
REFERENCES branch(branch_id) 
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY (super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

--Table for clients
CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

--Works with table 
CREATE TABLE works_with(
    emp_id INT,
    client_id int,
    total_sales int,
    primary key(emp_id, client_id),
    foreign key(emp_id) references employee(emp_id) on delete cascade,
    foreign key(client_id) references client(client_id) on delete cascade
);

--Branch supplier table
create table branch_supplier(
    branch_id int,
    supplier_name varchar(40),
    supply_type varchar(40),
    primary key (branch_id, supplier_name),
    --delete cascade deletes all references of the deleted branch in the branch supplier table
    foreign key (branch_id) references branch(branch_id) on delete cascade
);

--deleting branch
delete from branch
where branch_id = 2;

--Inserting employees into employee table
insert into employee values(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, null, null);
insert into employee values(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
insert into employee values(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--Inserting a branch in branch table
insert into branch values(1, 'Corporate', 100, '2006-02-09');
INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

--Updating David Wallace's branch id to 1
update employee
set branch_id = 1
where emp_id= 100;

--Updating Michael Scott's branch id to 2
UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

SELECT * 
FROM employee;

select *
from branch;

-- Stamford Branch
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

select *
from branch_supplier;

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

select *
from works_with;