use Aman
--Create Temporary Table #CourseSales
CREATE TABLE #CourseSales
(Course VARCHAR(50),Year INT,Earning  MONEY)
GO
--Populate Sample records
INSERT INTO #CourseSales VALUES('.NET',2012,10000)
INSERT INTO #CourseSales VALUES('Java',2012,20000)
INSERT INTO #CourseSales VALUES('.NET',2012,5000)
INSERT INTO #CourseSales VALUES('.NET',2013,48000)
INSERT INTO #CourseSales VALUES('Java',2013,30000)
GO

drop table #CourseSales

SELECT *
FROM #CourseSales
PIVOT(SUM(Earning) 
      FOR Course IN ([.NET], Java)) AS PVTTable

SELECT *
FROM #CourseSales
PIVOT(SUM(Earning) 
      FOR Year IN ([2012],[2013])) AS PVTTable

--Create Temporary Sales Table
CREATE TABLE #Sales
(SalesId INT IDENTITY(1,1), SalesDate DateTime)
GO
--Populate 1000 Sample Sales Records With 
--Random past 0-1000 days as sales date
INSERT INTO #Sales(SalesDate)
VALUES(DATEADD(dd, - CONVERT(INT, (1000+1)*RAND()),GETDATE()))
GO 1000

SELECT Year, QPivot.[1] As Q1, QPivot.[2] As Q2, 
 QPivot.[3] As Q3, QPivot.[4] As Q4
FROM (SELECT YEAR(SalesDate) [Year],
     DATEPART(QUARTER, SalesDate) [Quarter], 
         COUNT(1) [Sales Count]
      FROM #Sales
      GROUP BY YEAR(SalesDate), 
         DATEPART(QUARTER,SalesDate)) AS QuarterlyData
PIVOT( SUM([Sales Count])   
        FOR QUARTER IN ([1],[2],[3],[4])) AS QPivot

SELECT *
FROM (SELECT YEAR(SalesDate) [Year], 
       DATENAME(MONTH, SalesDate) [Month], 
       COUNT(1) [Sales Count]
      FROM #Sales
      GROUP BY YEAR(SalesDate), 
      DATENAME(MONTH, SalesDate)) AS MontlySalesData
PIVOT( SUM([Sales Count])   
    FOR Month IN ([January],[February],[March],[April],[May],
    [June],[July],[August],[September],[October],[November],
    [December])) AS MNamePivot

--PIVOT the #CourseSales table data on the Course column 
SELECT *
INTO #CourseSalesPivotResult
FROM #CourseSales
PIVOT(SUM(Earning) 
      FOR Course IN ([.NET], Java)) AS PVTTable
GO
--UNPIVOT the #CourseSalesPivotResult table data 
--on the Course column    
SELECT Course, Year, Earning
FROM #CourseSalesPivotResult
UNPIVOT(Earning
      FOR Course IN ([.NET], Java)) AS UNPVTTable

----------------------------------------------------------------

Create table tbl_student (studentname nvarchar(200), grade nvarchar(10), marks int)

Insert into tbl_student (studentname,grade,marks)
Select 'Vivek Johari','I',30
Union All
Select 'Vivek Johari','II',20
Union All
Select 'Vivek Johari','III',35
Union All
Select 'Vivek Johari','IV',40
Union All
Select 'Vivek Johari','V',45
Union All
Select 'Avinash Dubey','I',30
Union All
Select 'Avinash Dubey', 'II', 2
Union All
Select 'Avinash Dubey', 'III' ,35
Union All
Select 'Chandra Singh', 'I', 30
Union All
Select 'Chandra Singh', 'II', 20
Union All
Select 'Chandra Singh', 'III', 35
Union All
Select  ' Pankaj Kumar', 'I', 33
Union All
Select ' Pankaj Kumar', 'II', 29

Select  *  from tbl_student

Select studentname, [I], [II], [III], [IV] , [V]
 from
( Select grade, studentname, marks from tbl_student) as sourcetable
Pivot (  avg(marks) for grade in ([I],[II],[III],[IV],[V])) as pivotable order by V desc,IV desc,III desc,II desc,I desc

Select studentname, [I], [II], [III], [IV] , [V] from tbl_student
Pivot  (  avg(marks) for grade in ([I],[II],[III],[IV],[V])) as pivotable order by V desc,IV desc,III desc,II desc,I desc