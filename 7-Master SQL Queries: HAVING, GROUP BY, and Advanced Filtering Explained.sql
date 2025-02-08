Select * from EmployeeDB

Select count(*) as TotalEmp from EmployeeDB
having COUNT(*) > 30

-- Having without group by or aggregate function

Select * From EmployeeDB
Having Occupation = 'Professional'

-- Find departments and occupation with a total yearlyincome greater than 100,000

Select DeptID, Occupation, Sum(YearlyIncome) as TotalIncome from EmployeeDB
Group by DeptID, Occupation
Having sum(YearlyIncome) > 100000

Select DeptID, Occupation, Sum(YearlyIncome) as TotalIncome from EmployeeDB
Group by DeptID, Occupation
Having TotalIncome > 100000

-- Find Grade with an average sales greater than 3000

Select Grade, Avg(Sales) as AvgSales
from EmployeeDB
GROUP by Grade
Having avg(Sales) > 3000

-- Occupation and Grade-Wise Employee count, TotalSales, AvgerageIncome Analysis
Select Occupation,Grade,
COUNT(EmpID) as EmpCount,
SUM(Sales) as TotalSales,
AVG(YearlyIncome) as AvgIncome From EmployeeDB
Where YearlyIncome > 40000
Group by Occupation,Grade
Having Sum(Sales) > 5000;

Select * From Superstore

-- Region and Category of Total Sales with Specific Range
Select Region, Category,Round(Sum(Sales),2) as TotalSales 
From Superstore
GROUP BY Region, Category
Having Sum(Sales) > 167026.42 and sum(Sales) < 220853.25

-- Details Sales Analysis by Region and Category
Select Region, Category,
    ROUND(SUM(Sales),2) as TotalSales,
    ROUND(AVG(Sales),2) as AvgSales,
    COUNT(*) AS TotalCount,
    ROUND(MAX(Sales),2) as MaxSales,
    ROUND(MIN(Sales),2) as MinSales
 From Superstore
 Where Category != 'Technology'
 GROUP BY Region, Category
 Having count(*) BETWEEN 500 AND 1000
 ORDER BY TotalCount







