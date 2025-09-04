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
);

INSERT INTO Department (dept_id, dept_name, dept_location) VALUES
(101,'HR','New Delhi'), ('102','IT', 'Chennai'),
(103,'Finance', 'New Delhi'), (104, 'Marketing', 'Pune');

Select * From Department;

INSERT INTO Employee (first_name, emp_city, department_id) VALUES
('John', 'New Delhi', 102), ('Anil', 'Pune', 101), ('Eric', 'New Delhi', 102),
('Paul', 'Chennai', 103), ('Ashish', 'Pune', 104), ('Lucy', 'Chennai', 102);

Select * From Employee;

INSERT INTO Employee (first_name, emp_city, department_id) VALUES
('Rahul','New Delhi',105);

Select * From Department;

Delete From Department Where dept_id = 102;

/*  If you want to update or delete the recs from the parent table then we need to follow the CASCADE
approach in mysql.

Benefits of FK:

1. Data Integrity : 
2. Referential Consistency
3. Error Prevention
4. Easier Maintenance

