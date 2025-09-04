-- Not Null Constraint

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,       -- Must provide Name 
    email VARCHAR(100) NOT NULL,      -- Must provide email
    phone VARCHAR(15)                 
);

INSERT INTO Student (student_id, name, email, phone) 
VALUES (1, 'Vivek', 'vivek@email.com', '123-456-7890');


-- Name Missing
INSERT INTO Student (student_id, email, phone) 
VALUES (2,'abc@email.com','123-456-9090');

-- Phone is optional
INSERT INTO Student (student_id, name, email) 
VALUES (2,'Shri','abc@email.com');

Select * From Student;

-- Default Constraint : If no value given, use the default value

Drop table Student;

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    city VARCHAR(50) DEFAULT 'Mumbai', -- Default City      
    Status varchar(20) Default 'Active', -- Default Status
    join_date Date default (curdate()), -- default to today
    fees Decimal(8,2) default 5000.00
);

INSERT INTO Student (student_id, name, email, city, status, join_date, fees)
VALUES (1, 'Raj', 'raj@email.com', 'Delhi', 'Active', '2024-01-15', 7000.00);

-- Insert with some defaults (city, status, join_date, fees will use defaults)
INSERT INTO Student (student_id, name, email)
VALUES (2, 'Priya', 'priya@email.com');

-- Check Constraint -- Value must pass a condition or test.

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age int CHECK (age >= 18 and age <= 60), -- Age must be 18-60
    grade char(1) Check (grade in ('A','B','C','D')), -- Only these grades
    fees Decimal(8,2) Check(fees > 0), -- Fees must be positive
	email varchar(100) check (email like '%@%.%') , -- Must look like email
    city varchar(50) Default 'NewDelhi'
    );
    
Select * from Student;

INSERT INTO Student (student_id, name, age, grade, fees, email)
VALUES (1, 'Vikash', 22, 'A', 5000.00, 'vikash@gmail.com');

INSERT INTO Student (student_id, name, age, grade, fees, email)
VALUES (2, 'Vivek', 22, 'A', 5000.00, 'vivek@gmailcom');

-- Unique Constraint : All Values must be different, no duplicates allowed
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) Unique,
    phone VARCHAR(10) Unique,
    roll_number VARCHAR(10) Unique,
    age int
);

-- Insert the records
INSERT INTO Student (student_id, name, email, phone, roll_number, age)
VALUES (1, 'Rahul', 'rahul@email.com', '9876543210', 'CS001', 20);

INSERT INTO Student (student_id, name, email, phone, roll_number, age)
VALUES (2, 'Ravi', 'ravi@email.com', '9876543510', 'CS001', 21);

-- Can we capture null value in this column (in unique key column) - Yes

INSERT INTO Student (student_id, name, email, phone, roll_number, age)
VALUES (3, 'Rohit', 'rohit@email.com', '9976543510', null, 21);

INSERT INTO Student (student_id, name, email, phone, roll_number, age)
VALUES (4, 'Romil', 'romil@email.com', '9076543510', null, 21);


INSERT INTO Student (student_id, name, email, phone, roll_number, age)
VALUES (5, 'Abhishek', 'abhishek@email.com', '8076543510', null, 25);

Select * from Student;

-- Note: In MySQL, we can capture multiple null value in the unique key column where as we can not capture the multiple null value in unique key column in MS SQL.


-- Composite -- Unique Key Constraint

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course VARCHAR(30),
    semester INT,
    section CHAR(1),
    UNIQUE(course, semester, section)
);

INSERT INTO Student VALUES (1, 'Arjun', 'Computer Science', 1, 'A');
INSERT INTO Student VALUES (2, 'Bheem', 'Computer Science', 1, 'B');
INSERT INTO Student VALUES (3, 'Krishna', 'Computer Science', 2, 'A');

INSERT INTO Student VALUES (4, 'Karna', 'Computer Science', 1, 'A');

Drop Table If Exists Employee;
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,                              
    name VARCHAR(50) NOT NULL,                     
    email VARCHAR(100) NOT NULL UNIQUE,      
    phone VARCHAR(15) UNIQUE,                         
    employee_code VARCHAR(10) UNIQUE,          
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0),   
    department VARCHAR(30) DEFAULT 'General',           
    status VARCHAR(10) DEFAULT 'Active' CHECK (status IN ('Active','Inactive','OnLeave')),
    join_date DATE DEFAULT (CURDATE()),               
    age INT CHECK (age >= 18 AND age <= 65),        
    manager_id INT,                            
    UNIQUE(department, employee_code)
);



SELECT 'NOT NULL: Column must have a value' as Constraint_Type
UNION ALL SELECT 'DEFAULT: Uses default value if none provided'
UNION ALL SELECT 'CHECK: Value must pass validation condition'  
UNION ALL SELECT 'UNIQUE: All values must be different (no duplicates)'
UNION ALL SELECT 'PRIMARY KEY: Combination of NOT NULL + UNIQUE'
UNION ALL SELECT 'COMPOSITE UNIQUE: Combination of columns must be unique together';



















