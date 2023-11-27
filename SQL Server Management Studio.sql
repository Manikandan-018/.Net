use logicfirst;

create table employee(
emp_id int primary key,
ename varchar(25),
job_desc varchar(20),
salary decimal(8,2)
);

insert into employee values(1,'ram','admin',50000);
insert into employee values(2,'rish','engineer',40000);
insert into employee values(3,'brown','doctor',50000);
insert into employee values(4,'green','Hr',30000);
insert into employee values(5,'james','Ceo',60000);
insert into employee values(6,'nath','manager',20000);
insert into employee values(7,'greek','Ceo',70000);
insert into employee values(8,'ragu','engineer',10000);
insert into employee values(9,'roman','contractor',10000);
insert into employee values(10,'jhon','labour',5000);
insert into employee values(11,'mike','worker',20000);



select * from employee;

select * from employee
where 'enmae'="roman";
select * from employee
where 'enmae'<>"roman";


select * from employee
where job_desc in ("Hr","worker");

select * from emloyee
where job_desc not in ("worker","doctor");

select * from employee
where salary between 20000 and 40000;

select * from employee
limit 7; 

-- like 
-- wildcards %(zero or more characters) _(one character)

select * from employee
where enmae like 'g%';

select * from employee 
where ename like '_r%';

update employee
set job_desc="analyst";

select distinct job_desc
from employee;

select curdate();


select * from employee
order by ename;


select * from employee
order by salary;

select * from employee 
order by salary,ename;

select * from employee 
where job_desc="manager"
order by salary;

select avg (salary)
from employee
where job_desc="ceo";

select sum(salary)
from employee
where job_desc="engineer";

select max(salary)
from employee;

select min(salary)
from employee;

select ucase(ename) name,salary
from employee;

select enmae,concat('RS.',salary)
from employee;

alter table employee add column Hire_date date;

select * from employee;
 
 update employee
 set Hire_date="2023-11-25"
 where job_desc="Engineer";

select date_format(curdate(), "%d/%m/%y") as date;

select datediff(curdate(),"2026/05/11") as days; 

-- add not null constraint
alter table employee
modify ename varchar(30) not null;

-- drop not null constarint
alter table employee
alter job_desc set default 'unassigned';


drop table employee;

create table branch(
branch_id int primary key,
br_name varchar(30) not null,
addr varchar (200) );

 