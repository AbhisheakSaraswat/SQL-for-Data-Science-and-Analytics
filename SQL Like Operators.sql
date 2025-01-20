-- Mastering SQL LIKE Operator: Real-World Examples with Superstore

Select * from Superstore
--Find the names of customers whose names start with the letter 'A' and the products they purchased.
 
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like 'A%' 

/* Find the names of customers whose names have the third character as 'd'
 and the products they purchased.
*/ 
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like '__d%' 
 
/* Find the names of customers whose names start with 'An', 
 have exactly two more characters, followed by 'e', and the products they purchased.
*/
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like 'An__e%' 
 
/* Find the names of customers whose names start with 'A' and end with 'Y', 
 and the products they purchased.
*/
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like 'A%Y' 

/* Find the names of customers whose names contain the letter 'H' 
 preceded by any character, and the products they purchased.
*/
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like '% H%' 

-- Find the names of customers whose middle and List Name start with H and the products they purchased.
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like '% H% H%' 

/* Find the names of customers whose names start with 'An', 
have exactly two characters after it, followed by 'e', and the products they purchased. 
*/
 Select [Customer Name], [Product Name] from Superstore 
 Where [Customer Name] like 'An__e%' 

/* Find the names of customers whose names start with letters 'A', 'B', or 'C', 
and the products they purchased. Order the results by customer name.
*/
Select [Customer Name], [Product Name] from Superstore 
Where [Customer Name] like '[A-C]%' 
Order by [Customer Name] 

/* Find the names of customers whose names start with the letters 'I', 'P', or 'Q',
and the products they purchased. Order the results by customer name.
*/

Select [Customer Name], [Product Name] from Superstore 
Where [Customer Name] like '[IPQ]%' 
Order by [Customer Name] 

/* Find the names of customers whose names start with 'de', but the next character is not 'n',
and the products they purchased. Order the results by customer name.
*/

Select [Customer Name], [Product Name] from Superstore 
Where [Customer Name] like 'de[^n]%' 
Order by [Customer Name] 

/* Find the names of customers whose names include a middle name starting with the letters 
'D', 'E', or 'F', and the products they purchased. Order the results by customer name.
*/

Select [Customer Name], [Product Name] from Superstore 
Where [Customer Name] like '% [D-F]%' 
Order by [Customer Name] 

/* Find the distinct names of customers whose first names start with 'A', 'B', or 'C' 
and whose last names start with 'D', 'E', or 'F'. Order the results by customer name.
*/

Select Distinct [Customer Name] from Superstore 
Where [Customer Name] like '[A-C]% [D-F]%' 
Order by [Customer Name]
