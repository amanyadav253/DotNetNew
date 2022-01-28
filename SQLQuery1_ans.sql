use DemoDatabase

select * from Programmer
select * from Software
select * from Studies

alter database sqldemodata1 modify name=NewSQLDemoData1

--1. Find out the selling cost average for package developed in Pascal.
select avg(Scost) as 'Cost Average v1.1' from Software where Dev_In='PASCAL';

--2. Display the names and age of all programmers
select Name, DATEDIFF(YYYY,DOB,GETDATE()) as 'Age v1.2' from Programmer

--3.Display the names of those who have done the dap course.
select Name as 'Name v1.3' from Studies where Course='DAP'

--4.What the highest number of copies sold by a package.
select MAX(Sold) from Software

--5.Display the names and date of birth of all the programmers born in January.
select Name,DOB from Programmer where MONTH(DOB) = 1

--6.Display the lowest course fee.
select MIN(CCost) from Studies

--7.How many programmers have done the pgdca course.
select Count(Name) from Studies where Course = 'PGDCA'

--9.Display the details of the softwere deveolped by ramesh .
select * from Software where Name = 'Ramesh'

--10.How many programmers studied at sabhari.
select Name from Studies where Splace='sabhari'

--select * from Programmer
--select * from Software
--select * from Studies

--11.Display the details of packages whose sales crossed the 20000 marks.
select * from Software where SCost*Sold > 20000

--12.Find Out the number of copies which should be sold in order to recover the development cost of each package.


--13. Display the details of package for which development cost has been recovered.
select * from Software where SCost*Sold >= CCost

--14. What is the price of the costliest softwere developed in basic.
select Max(CCost) as 'Costliest Software' from Software where Dev_In = 'c'

--15.How many package were developed in dbase.
select Count(Dev_In) from Software where Dev_In = 'dbase'

--16.How many programmers studied at pragathi.
select Name from Studies where SPlace = 'pragathi'

--17.How many programmers paid 5000 to 10000 to their course
select Name from Studies where CCost between 5000 and 10000

--18.What is the average course fee.
select avg(CCost) from Studies

--19.Display the details of programmers knowing c.
select Name,DOB,DOJ,Sex,Salary from Programmer where Prof1 = 'c' or Prof2 ='c'

--20.How many programmers knowing either cobol or pascal.XXX
select Name,Prof1,Prof2 from Programmer where Prof1 ='cobol' or Prof1='pascal' and Prof2='pascal' or Prof2='cobol'

--select * from Programmer
--select * from Software
--select * from Studies

--21.How many programmers don’t know cobal & pascal .XXX
select Name,Prof1,Prof2 from Programmer where (Prof1!='cobol' or Prof2!='pascal')  

--22.How old is oldest male programmer.
select Max(DATEDIFF(yyyy,DOB,GETDATE())) as 'Oldest Programmer' from Programmer where Sex='M'

--23.What is the average age of female programmers.
select AVG(DATEDIFF(yyyy,DOB,GETDATE()))as 'Average age of female prog' from Programmer where Sex='F'

--24.Calculate the experience in years for each programmers and display along with the names in descending order.
select Name,YEAR(GETDATE()) - YEAR(DOJ) as 'Experience'from Programmer order by Name Desc

--25.Who are the programmer who celebrate their birthday’s during the current month .
select Name from Programmer where MONTH(GETDATE()) = MONTH(DOB)

--26.How many female programmers are there.
select Count(Name) from Programmer where Sex='F'

--27.What are the languages known by male programmers.
select Name,Prof1,Prof2 from Programmer where Sex='M'

--28.What is the average salary.
select AVG(Salary) from Programmer

--29.. How many people draw 2000 to 4000.
select Count(Salary) from Programmer where Salary between 2000 and 4000

--30.Display the detials of those who don’t know clipper, cobol, pascal.
select * from Programmer where Prof1!='clipper'and Prof1!='cobol' and Prof1!='pascal' and Prof2!='clipper'and Prof2!='cobol' and Prof2!='pascal'

--select * from Programmer
--select * from Software
--select * from Studies

--31.How many female programmers knowing c are above 24 years of age .XXX
select count(Name) from Programmer where Sex='F' and Prof1='c'or Prof2='c' and  DATEDIFF(YYYY,DOB,GETDATE())>24 

--32.Who are the programmers who will be celebrating their birthday within a week.
select * from Programmer where DATEPART(WEEK,DOB)=DATEPART(WEEK,GETDATE())

--33.Display the details of those with less than one year of experience.
select Name from Programmer where YEAR(GETDATE()) - year(DOJ) < 1 

--34.Display the details of those who will be completing 2 years of service this year.
select * from Programmer where YEAR(GETDATE()) - year(DOJ) = 2

--35.Calculate the amount to be recovered for those packages whose development cost has not yet been recovered.
select Title,( Ccost - (Scost*Sold) ) AS 'Amount To Be Recovered' from Software where Scost * Sold !> Ccost

--36 list the packages which has been sold so FAR
select Title from Software where Sold > 0

--37 FIND OUT THE COST OF SOFTWARES DEVELOPED BY MARY
select Ccost from Software where Name = 'Mary'

--39 HOW MANY DIFFERENT COURSES ARE MENTIONED IN STUDIES TABLE
select (Count(Distinct Course)) from Studies

--40 DISPLAY THE NAMES OF THE PROGRAMMERS WHOSE NAME CONTAINS 2 OCCURANCES OF THE LETTER 'A'
select Name from Programmer where Name like '%a%a%' and Name not like '%a%a%a%'

--select * from Programmer
--select * from Software
--select * from Studies

--41 DISPLAY THE NAMES OF THE PROGRAMMERS WHOSE NAMES ARE UPTO 5 CHARACTERS
select Name from Programmer where Len(Name) <= 5

--42 DISPLAY THE NAME.DOB,DOJ OF THOSE WHOSE MONTH OF BIRTH AND THE MONTH OF JOINING ARE SAME.
select Name,DOb,DOJ from Programmer where MONTH(DOB) = MONTH(DOJ)

--43 DISPLAY NAME, DOB OF THE PROGRAMMERS BORN ON THE LAST DAY OF THE MONTH.
select Name,DOB from Programmer where DOB=EOMONTH(DOB)

 -----------------------------------------------------------------------------------------------------

--1 DISPLAY THE NUMBER OF PACKAGES DEVELOPED IN EACH LANGUAGE.
select Dev_In,Count(Title) as NoOfProjects from Software group by Dev_In

--2 DISPLAY THE NUMBER OF PACKAGES DEVELOPED BY EACH PERSON
select Name,Count(Title) as 'Software Developed' from Software group by Name

--3 DISPLAY THE NUMBER OF PEOPLE BORN IN EACH YEAR
select Year(DOB),Count(YEAR(DOB)) from Programmer group by YEAR(DOB)

--4 DISPLAY THE NUMBER OF PEOPLE JOINED IN EACH YEAR.
select YEAR(DOJ),Count(YEAR(DOJ)) from Programmer group by Year(DOJ)

--5 DISPLAY THE NUMBER OF PEOPLE BORN IN EACH MONTH.
select MONTH(dob) as 'Month',Count(MONTH(Dob)) from Programmer group by MONTH(DOB)

--6 DISPLAY THE NUMBER OF PEOPLE JOINED IN EACH MONTH.
  select MONTH(doj) as 'Month',COUNT(MONTH(doj)) from Programmer group by MONTH(doj)

--7 DISPLAY THE LANGUAGE WISE COUNT OF PRO1
select prof1,Count(Prof1) from Programmer group by Prof1

--8 DISPLAY THE LANGUAGE WISE COUNT OF PROF2
select prof2,COUNT(prof2) from Programmer group by Prof2

--9 DISPLAY THE NUMBER  OF PEOPLE WHO STUDIED IN EACH INSTITUTE.
select Splace, Count(Name) from Studies group by Splace

--10 DISPLAY THE NUMBER OF PEOPLE WHO STUDIED IN EACH COURSE.
select Course, Count(Name) from Studies group by Course

--select * from Programmer
--select * from Software
--select * from Studies

--11 DISPLAY THE TOTAL DEVELOPMENT COST OF THE PACKAGES DEVELOPED IN  EACH  LANGUAGE.
select Dev_in, SUM(Ccost) from Software group by Dev_in
   
--12 DISPLAY THE SELLING COST OF THE PACKAGE DEVELOPED BY EACH PROGRAMMER.
    select Name,Sum(Scost) from Software group by Name order by Sum(Scost) desc

--13 DISPLAY THE SALES COST OF THE PACKAGES DEVELOPED BY EACH PROGRAMMER LANGUAGE  WISE.
  select Dev_in,Name, SUM(Scost) as 'Sales Cost' from Software group by Dev_in,Name order by Dev_In
    
    
/*14 DISPLAY EACH PROGRAMMERS NAME, COSTIEST PACKAGE AND CHEAPEST PACKAGE 
   DEVELOPED BY HIM/HER.
*/
  select Name,Max(Ccost) as 'COSTIEST',Min(ccost) as 'CHEAPEST' from Software group by Name

--15 DISPLAY THE NUMBER OF PACKAGES DEVELOPED BY EACH PROGRAMMER.
     select Name,Count(Title) from Software group by Name
--16 DISPLAY EACH LANGUAGE NAME WITH NUMBER OF COURSES, AVERAGE COST PER COURSE.

--17 DISPLAY EACH INSTITUTE NAME WITH NUMBER OF COURSES, AVERAGE COST PER COURSE.
select Splace,Count(Course) as 'No of cources',AVG(ccost) as 'avg cost' from Studies group by Splace
  
--18 DISPLAY EACH INSTITUTE NAME WITH NUMBER OF STUDENTS
select Splace,Count(Distinct Name) from Studies group by Splace

--19 DISPLAY NUMBER OF MALE AND FEMALE PROGRAMMER
 select Sex,Count(Sex) from Programmer group by Sex 

--20 DISPLAY THE PROGRAMMERS NAME AND THE PACKAGES
select Name,salary from Programmer
 
--select * from Programmer
--select * from Software
--select * from Studies

--21 DISPLAY THE NUMBER OF PACKAGES IN EACH LANGUAGE FOR WHICH DEVELOPMENT COST IS LESS THAN 1000
select Count(Title) as 'no of package',Dev_In from  Software where Ccost < 1000 Group by Dev_In
   
--22 DISPLAY THE AVERAGE DIFFERENCE BETWEEN SCOST AND DCOST FOR EACH LANGUAGE.
select Avg(ccost - scost) as 'AVERAGE DIFFERENCE BETWEEN SCOST AND DCOST',Dev_in from software group by Dev_in
   
/*23 DISPLAY THE TOTAL SCOST, SCOST AND THE AMOUNT TO BE RECOVERED FOR EACH  
   PROGRAMMER FOR WHOSE DCOST HAS NOT YET BEEN RECOVERED.
   */
   select Title,Scost*sold as 'Total Scost',Scost,Ccost-(Scost*sold) as'AMOUNT TO BE RECOVERED' from Software where Scost*sold < Ccost

--24 DISPLAY HIGHEST, LOWEST AND AVERAGE SALARIES FOR THOSE EARNING MORE THAN 2000
select MAX(salary) as 'HIGHEST',MIN(salary) as LOWEST,avg(salary) as 'AVERAGE SALARIES'  from Programmer where salary > 2000

select * from programmer where DATEPART(WEEK,DOB) = DATEPART(WEEK,GETDATE())
select Name +' Completed Courese= '+Prof1 + ', '+ Prof2+' --Name--of--user--> '+Name from Programmer