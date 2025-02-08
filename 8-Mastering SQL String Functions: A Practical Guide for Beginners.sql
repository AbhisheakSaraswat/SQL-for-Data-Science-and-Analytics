Select * from Superstore

-- Length of customer name
Select Distinct [Customer_name], len(Customer_name) as CustLen from Superstore

-- First 10 Chars
Select [Customer_name], Left(Customer_name,10) as First10Char from Superstore

-- CharIndex Function: Using this function we can find the first occurance of your substring
Declare @str VARCHAR(50) = 'Programming Is Fun with SQL'
Select CHARINDEX(' ',@str,1) as FirstSpacePosition
Select CHARINDEX(' ',@str,13) as SecondSpacePosition
Select CHARINDEX(' ',@str,CHARINDEX(' ',@str,1)+1) as SecondSpacePosition
Select CHARINDEX(' ',@str,CHARINDEX(' ',@str,CHARINDEX(' ',@str,1)+1)+1) as ThirdSpacePos
Select CHARINDEX(' ',@str,
CHARINDEX(' ',@str,CHARINDEX(' ',@str,CHARINDEX(' ',@str,1)+1)+1)+1) as FourthSpacePos


-- First Name from Customer_Name
Select Distinct Customer_Name,
Left(customer_name,CHARINDEX(' ',customer_name + ' ',1)-1) as FirstName,
len(Left(customer_name,CHARINDEX(' ',customer_name + ' ',1)-1)) as FirstNameLength
 from Superstore

-- First Name and Last Name from Customer_Name
Select Distinct Customer_Name,
Left(customer_name,CHARINDEX(' ',customer_name + ' ',1)-1) as FirstName,
Right(customer_name,len(customer_name) - CharIndex(' ',customer_name)) as LastName
 from Superstore
Order by Customer_Name

DECLARE @str1 varchar(50) = 'Programming*Is*Fun'
--Select CHARINDEX('*',@str1) as Result
Select Left(@str1,CHARINDEX('*',@str1)-1) as FirstName
--Select CHARINDEX('*',@str1,CHARINDEX('*',@str1)+1) as Result
Select Right(@str1,len(@str1) - CHARINDEX('*',@str1,CHARINDEX('*',@str1)+1)) as Result

-- Lower, Upper
Select lower('Programming') as Result
Select upper('programminG') as Result
Select REVERSE('programming') as Result
Select rtrim('programming        ') as Result
Select rtrim('programming!!!','!') as Result
select ltrim('   programming!!!') as result
select ltrim('!!!!programming!!!','!') as result
select rtrim(ltrim('!!!!programming!!!','!'),'!') as result

/*
-- Stuff
It deletes s specified length of chars and inserts another string into the original string
*/

-- STUFF(string, start_position, length, new_string)
Select STUFF('hello world',7,5,'SQL') as Result

-- Substring
-- Substring(expression, start_pos, length)
Select SUBSTRING('Programming Is Fun',1,11) as Result
Select SUBSTRING('Programming Is Fun',13,2) as Result
Select SUBSTRING('Programming Is Fun',16,3) as Result

declare @st VARCHAR(50) = 'Programming Is Fun'
Select SUBSTRING(@st,1,CharIndex(' ',@st)-1) as FName
select SUBSTRING(@st,CharIndex(' ',@st)+1,2) as MiddlName
select SUBSTRING(@st,CharIndex(' ',@st,CharIndex(' ',@st)+1),len(@st))

/*
Patindex(pattern,string)
*/
Select PATINDEX('%Is%','Programming Is Fun') as Result

-- Format : Using this function we can format numbers, dates and string.
-- Format(value, format, culture)

Select FORMAT(12345,'n2') as Result
Select FORMAT(12345,'n0') as Result
Select FORMAT(12345,'c','en-US') as Result
Select FORMAT(12345,'c','fr-FR') as Result
Select format(0.85,'p') as Result
Select format(0.85,'p0') as Result
-- Customer number format
Select format(12345.678,'#,##0.00') as Result
Select format(12345.678,'000000.000') as Result

-- Formatting dates
select format(getdate(),'yyyy-MM-dd') as Result
select format(getdate(),'dddd, MMMM dd,yyyy') as Result

-- Time Formatting
Select format(getdate(),'hh:mm tt') as Result
select format(getdate(),'hh:mm:ss') as Result
-- Culture specific
Select format(getdate(),'D','en-Us') as Result

-- Fixed Length string
Select format(123,'00000') as Result

-- Combining with other string
Select 'Invoice Number: ' + format(456,'000000') as FormattedString






