Select * from EmployeeDB

-- count the total number of rows
Select count(*) as CountOfEmp from EmployeeDB

Select count(1) as CountOfEmp from EmployeeDB

Select count('India') as result from EmployeeDB

-- Count :  Ignore the null
Select count(deptid) as result from EmployeeDB

-- Calc the total sum of yearlyincome
select sum(YearlyIncome) as TotalIncome from EmployeeDB

Select sum(100+200) as Result
Select 100 + 200 as Result

select avg(YearlyIncome) as AvgIncome from EmployeeDB

Select min(yearlyincome) as MinIncome from EmployeeDB
Select Max(yearlyincome) as MaxIncome, STDEV(Sales) as std from EmployeeDB

Select count(*) as total_employee,
sum(yearlyincome) as TotalIncome,
avg(yearlyincome) as AvgIncome,
max(yearlyincome) as MaxIncome,
min(yearlyincome) as MinIncome,
Round(STDEV(yearlyincome),2) as std_yearlyincome
From EmployeeDB

Select * from EmployeeDB

Select Grade, count(*) as EmpCount From EmployeeDB
group by Grade

-- Occupation and Grade wise Empcount
Select Occupation, Grade, count(*) as EmpCount From EmployeeDB
group by Grade,Occupation

Select Occupation, Grade, count(*) as EmpCount From EmployeeDB
group by Occupation, Grade

Select * from Superstore

-- Region and Category-wise Sales metrics 

Select Region, Category, round(sum(Sales),2) as TotalSales,
round(avg(Sales),2) as AvgSales, count(*) as TotalCount,
round(Max(Sales),2) as maxSales, round(min(sales),2) as MinSales
From Superstore
Where Category != 'Technology'
Group by Region, Category
Order by Region

-- Filter based on TotalCount
Select Region, Category, round(sum(Sales),2) as TotalSales,
round(avg(Sales),2) as AvgSales, count(*) as TotalCount,
round(Max(Sales),2) as maxSales, round(min(sales),2) as MinSales
From Superstore
Where Category != 'Technology' and TotalCount >= 500  -- Invalid Query
Group by Region, Category
Order by Region


Select Region, Category, round(sum(Sales),2) as TotalSales,
round(avg(Sales),2) as AvgSales, count(*) as TotalCount,
round(Max(Sales),2) as maxSales, round(min(sales),2) as MinSales
From Superstore
Where Category != 'Technology' and count(*) >= 500 -- Invalid query
Group by Region, Category
Order by Region
