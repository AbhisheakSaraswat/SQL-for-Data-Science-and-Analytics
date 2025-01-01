Select * from EmployeeDB
  
Select * from Superstore
Select FirstName, LastName, Grade, Sales From EmployeeDB

  Select Top 5 FirstName, LastName, Grade, Sales from EmployeeDB
-- Select FirstName, LastName, Grade, Sales from EmployeeDB Limit 5; -- MySQL

Select * from EmployeeDB
Order by FirstName DESC

Select FirstName, LastName, Grade, Sales From EmployeeDB
Order by FirstName ASC, Sales Desc
  
Select FirstName, LastName, Grade, Sales From EmployeeDB
Order by FirstName ASC, Sales Desc, FirstName DESC
  
-- Where Clause
Select * from EmployeeDB
Where Grade = 'A'
  
Select FirstName, LastName, Grade, Sales From EmployeeDB
Where Grade = 'A' or Grade = 'D'
Order by Grade DESC
  
Select FirstName, LastName, Grade, Sales From EmployeeDB
Where (Grade = 'A' or Grade = 'D') AND (Sales > 3000 and Sales < 4000)
Order by Grade DESC
  
Select FirstName, LastName, Grade, Sales From EmployeeDB
Where (Grade = 'A' or Grade = 'D') AND (Sales >= 3000 and Sales < 4000)
Order by Grade DESC
  
Select FirstName, LastName, Grade, Sales From EmployeeDB
Where Sales = 3000 OR Sales = 3805
  
Select FirstName, LastName, Grade, Sales From EmployeeDB
Where Sales = 3000 AND Sales = 3805
  
/* Now, I want to Filter:
Write an SQL query to select the FirstName, Education, Occupation, Grade, and Sales columns
from the EmployeeDB table.
The query should filter the results to include only those employees
who meet all of the following conditions:
Their Education is either 'Bachelors' or 'Intermediate'.
Their Grade is either 'A' or 'D'.
Their Sales are greater than 4000."
*/
Select FirstName, Education, Occupation, Grade, Sales
From EmployeeDB
Where (Education = 'Bachelors' or Education = 'Intermediate')
AND (Grade = 'A' or Grade = 'D') and (Sales > 4000)
  
Select FirstName, Education, Occupation, Grade, Sales
From EmployeeDB
Where (Education = 'Bachelors' or Education = 'Intermediate')
AND (Grade = 'A' or Grade = 'D') OR (Sales > 4000)
Order by Sales DESC, Grade ASC
  
Select Region,Segment,[Sub-Category],Sales from Superstore
Where [Sub-Category] = 'Art'
or [Sub-Category] = 'Tables'
or [Sub-Category] = 'Phones'
or [Sub-Category] = 'Chairs'
or [Sub-Category] = 'Storage'
  
Select Distinct [Sub-Category] from Superstore
Where [Sub-Category] = 'Art'
or [Sub-Category] = 'Tables'
or [Sub-Category] = 'Phones'
or [Sub-Category] = 'Chairs'
or [Sub-Category] = 'Storage'
  
-- In Clause
Select Region,Segment,[Sub-Category],Sales from Superstore
Where [Sub-Category] IN ('Art','Tables','Phones','Chairs','Storage')
  
Select Region,Segment,[Sub-Category],Sales from Superstore
Where [Sub-Category] NOT IN ('Art','Tables','Phones','Chairs','Storage')
  
Select * from EmployeeDB Where Grade not in ('A','D')
  
Select * from EmployeeDB Where not Sales > 4000
  
-- Between Operator
/*
Using this operator we can filter the records within a specified range.
It includes both the starting and ending values of the range.
*/
Select * from EmployeeDB Where Sales between 3000 and 3248
  
Select * from EmployeeDB Where Grade BETWEEN 'C' and 'D'
  
Select * from EmployeeDB Where Grade BETWEEN 'D' and 'C'
  
Select * from EmployeeDB
Where (Grade in ('A','D')) -- 'Grade' = 'A' or 'Grade' = 'B'
And (Sales between 3000 and 5000)
and YearlyIncome > 35000
and Education not in ('High School','Master Degree')
Order by Sales Desc
