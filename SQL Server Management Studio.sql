use logicfirst;

-- Create the branches table
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(25),
    location VARCHAR(20)
);

INSERT INTO branches (branch_id, branch_name, location) VALUES
(1, 'Head Office', 'Chennai'),
(2, 'Tech', 'Maharastra'),
(3, 'solutions', 'Rajasthan');

select * from branches;

drop table branches;


-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(15),
    position VARCHAR(20),
    branch_id INT,
    CONSTRAINT fk_branch_id FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);


-- Insert sample data into the employees table
INSERT INTO employees (employee_id, first_name, last_name, position, branch_id) VALUES
(1, 'John', 'Doe', 'Manager', 1),
(2, 'williams', 'Smith', 'Sales Representative', 2),
(3, 'Robert', 'Johnson', 'Accountant', 3);

select * from employees;

drop table employees;


CREATE TABLE salary (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    effective_date DATE,
    CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


INSERT INTO salary (employee_id, salary_id, salary, effective_date) VALUES
(1, 1, 80000.00, '2023-08-26'),
(2, 2, 30000.00, '2023-08-29'),
(3, 3, 50000.00, '2023-08-28');

select * from salary;

drop table salary;


-- Query 1: Retrieve all employees with their branch and salary information using INNER JOIN
SELECT employees.employee_id, employees.first_name, employees.last_name,
       employees.position, branches.branch_name, branches.location,
       salary.salary, salary.effective_date
FROM employees
INNER JOIN branches ON employees.branch_id = branches.branch_id
INNER JOIN salary ON employees.employee_id = salary.employee_id;



-- Query 2: Retrieve all branches and their employee and salary information using LEFT JOIN
SELECT branches.branch_id, branches.branch_name, branches.location,
       employees.first_name, employees.last_name, employees.position,
       salary.salary, salary.effective_date
FROM branches
LEFT JOIN employees ON branches.branch_id = employees.branch_id
LEFT JOIN salary ON employees.employee_id = salary.employee_id;



-- Query 3: Retrieve the total number of employees in each branch with their average salary
SELECT branches.branch_id, branches.branch_name, COUNT(employees.employee_id) AS total_employees,
       AVG(salary.salary) AS average_salary
FROM branches
LEFT JOIN employees ON branches.branch_id = employees.branch_id
LEFT JOIN salary ON employees.employee_id = salary.employee_id
GROUP BY branches.branch_id, branches.branch_name;



-- Query 1: Retrieve all employees with their branch information using INNER JOIN
SELECT employees.employee_id, employees.first_name, employees.last_name,
       employees.position, branches.branch_name, branches.location
FROM employees
INNER JOIN branches ON employees.branch_id = branches.branch_id;


-- Query 2: Retrieve all branches and their employee information using LEFT JOIN
SELECT branches.branch_id, branches.branch_name, branches.location,
       employees.first_name, employees.last_name, employees.position
FROM branches
LEFT JOIN employees ON branches.branch_id = employees.branch_id;


-- Query 3: Retrieve the total number of employees in each branch
SELECT branches.branch_id, branches.branch_name, COUNT(employees.employee_id) AS total_employees
FROM branches
LEFT JOIN employees ON branches.branch_id = employees.branch_id
GROUP BY branches.branch_id, branches.branch_name;


-- Query 4: Update the position of an employee
UPDATE employees
SET position = 'Senior Sales Representative'
WHERE employee_id = 2;


-- Query 5: Delete an employee
DELETE FROM employees
WHERE employee_id = 3;


-- Query 6: Retrieve the highest and lowest salary positions in each branch
SELECT branches.branch_id, branches.branch_name,
       MAX(employees.position) AS highest_position,
       MIN(employees.position) AS lowest_position
FROM branches
LEFT JOIN employees ON branches.branch_id = employees.branch_id
GROUP BY branches.branch_id, branches.branch_name;

-- Query 7: Retrieve employees whose last names start with 'D'
SELECT * FROM employees
WHERE last_name LIKE 'D%';

-- Query 8: Retrieve the average salary for each position
SELECT position, AVG(salary) AS average_salary
FROM employees
GROUP BY position;

-- Query 9: Increase the salary of all employees by 10%
UPDATE employees
SET salary = salary * 1.1;

-- Query 10: Retrieve the total number of employees for each branch, including branches with no employees
SELECT branches.branch_id, branches.branch_name, COUNT(employees.employee_id) AS total_employees
FROM branches
LEFT JOIN employees ON branches.branch_id = employees.branch_id
GROUP BY branches.branch_id, branches.branch_name;

