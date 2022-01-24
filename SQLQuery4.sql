select GETDATE()

select SYSDATETIME()

select GETUTCDATE()

select DATEADD(m,4,'1-24-2022')

select DATEDIFF(m,'11-18-2021',getdate())

select YEAR(GETDATE())

select month(GETDATE())

select RAND()

select ROUND(25.156,1)

select POWER(10,2)

select ABS(-25)

select CEILING(31.86)

select FLOOR(25.3)

select HOST_ID()

select HOST_NAME()

select SUBSTRING('Hello! It is me, I was wondering.',12,5)

select ROUND(9999*Rand(),0)

select LEN('Hello! It is me, I was wondering.')

select Left('Hello! It is me, I was wondering.',15)

select LTRIM(

	
SELECT LEFT(CAST(RAND()*1000000 AS INT),4) as OTP

SELECT LEFT(CAST(10000*RAND()+999 AS INT),4) as OTP