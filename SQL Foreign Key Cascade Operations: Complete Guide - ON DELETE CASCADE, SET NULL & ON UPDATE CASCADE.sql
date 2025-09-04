/* FK _ Cascade
When something changes with the main record, here's what should automatically happen to all the
records that depend on it.
*/
Delete From Department Where dept_id = 102;

Drop Table if exists Employee;
Drop Table if exists Department;

Create Table Department
(
	dept_id int primary key,
    dept_name varchar(100),
    dept_location varchar(100)
);

Create Table Employee
(
	emp_id int primary key auto_increment,
    first_name varchar(50),
    emp_city varchar(20),
    department_id int,
    foreign key (department_id) references Department(dept_id)
    on Delete CASCADE
    on Update Cascade
    
);


INSERT INTO Department (dept_id, dept_name, dept_location) VALUES
(101,'HR','New Delhi'), ('102','IT', 'Chennai'),
(103,'Finance', 'New Delhi'), (104, 'Marketing', 'Pune');

Select * From Department;

INSERT INTO Employee (first_name, emp_city, department_id) VALUES
('John', 'New Delhi', 102), ('Anil', 'Pune', 101), ('Eric', 'New Delhi', 102),
('Paul', 'Chennai', 103), ('Ashish', 'Pune', 104), ('Lucy', 'Chennai', 102);

Select * From Employee;

Select 'Before Delete Cascade:' as Status;
SELECT 
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    GROUP_CONCAT(e.first_name) AS employees
FROM
    department d
        LEFT JOIN
    Employee e ON d.dept_id = e.department_id
GROUP BY d.dept_id , d.dept_name
ORDER BY d.dept_id;

-- Delete Cascade : I want to delete the dept_id 102
Delete From Department Where dept_id = 102;

-- Update Cascade

Update Department set dept_id = 201 where dept_id =101;

Select * from Employee;

-- on Delete Set Null


Create Table Department
(
	dept_id int primary key,
    dept_name varchar(100),
    dept_location varchar(100)
);

Create Table Employee
(
	emp_id int primary key auto_increment,
    first_name varchar(50),
    emp_city varchar(20),
    department_id int,
    foreign key (department_id) references Department(dept_id)
    on Delete Set Null
    on Update Cascade
    
);


INSERT INTO Department (dept_id, dept_name, dept_location) VALUES
(101,'HR','New Delhi'), ('102','IT', 'Chennai'),
(103,'Finance', 'New Delhi'), (104, 'Marketing', 'Pune');

Select * From Department;

INSERT INTO Employee (first_name, emp_city, department_id) VALUES
('John', 'New Delhi', 102), ('Anil', 'Pune', 101), ('Eric', 'New Delhi', 102),
('Paul', 'Chennai', 103), ('Ashish', 'Pune', 104), ('Lucy', 'Chennai', 102);

Select * From Employee;

-- Delete set Null: 
Delete from department where dept_id = 104;

Select * From Department;
Delete From Department Where dept_id = 103;





