Declare @test TINYINT = 255
print @test


Declare @int SMALLINT = 32769
print @int

Declare @bit bit = 'False'
print @bit

Declare @dcml DECIMAL(10,2) = 18085.50 -- Stores upto 6 digits and 2 after decimal
print @dcml

-- Non-Unicode and Unicode
-- Non-Unicode - 1 byte per char : char and varchar (1 to 8000)
-- Unicode : nChar and nVarchar : 2 byte per char (1 to 4000)

Select DATABASEPROPERTYEX(DB_NAME(),'Collation') as Result

Alter Database YourDataBase Collate Latin1_General_100_CI_AS_SC

-- To Cpature Chinese Lang
Create Table ChineseData
(
ID int,
Name NVARCHAR(100), -- Unicode for chinese chars
DESCRIPTION NVARCHAR(MAX)
)

Select * FROM ChineseData
Insert into chineseData (ID, Name, DESCRIPTION)
Values (1,N'敏',N'地球描述')

Select column_name, collation_name from information_schema.columns
Where table_name ='ChineseData' and column_name = 'Name'

Select Serverproperty('Collation') as Servercolation
Select Name as DataBaseName, Collation_Name as COLLATION
from sys.Databases

Create Table HindiTable
(
ID int primary key,
HindiText nvarchar(100)
)

Insert into HindiTable(ID,HIndiText)
values (1,N'पृथ्वी वर्णन')

Select * from HindiTable

Select column_name, collation_name from information_schema.columns
Where table_name ='HindiTable' and column_name = 'HindiText'
