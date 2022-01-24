use  DemoDatabase

create table Programmer
(
Name varchar(10) not null,
DOB datetime not null,
DOJ datetime,
Sex varchar(1),
Prof1 varchar(8),
Prof2 varchar(8),
Salary int
)

select * from Programmer

create table Software
(
Name varchar(20) not null,
Title varchar(20) not null,
Dev_In varchar(20) not null,
SCost bigint,
CCost bigint,
Sold bigint
)

select * from Software

create table Studies
(
Name varchar(20) not null,
SPlace varchar(20) not null,
Course varchar(10) not null,
CCost bigint
)

select * from Studies

insert into Programmer values('Vijaya','14-DEC-66','02-MAY-92','F','Foxpro','C',3600)

insert into Software values('Vijaya','Isk Editor','C',900,700,6)

insert into Studies values('Remitha','BDPS','DCS',6000)


update Programmer set Prof2='Dbase' where Name='Juliana'

/*1.*/ select avg(SCost) as 'Cost Average' from Software where Dev_In='Pascal'

/*2.*/ select Name, datediff( YY, DOB,getdate()) as age from Programmer

/*3.*/ select Name from Studies where Course='DAP'

/*4.*/ select MAX(Sold) as MaxSold from Software

/*5.*/ select Name, DOB from Programmer where month(DOB)=1

/*6.*/ select MIN(CCost) as MinCostCourse from Studies

/*7.*/ select count(Course) as noofProg from Studies where Course='PGDCA'

/*9.*/ select * from Software where Name='Ramesh'

/*10*/ select COUNT(Course) as noofProg from Studies where SPlace='Sabhari'

/*11.*/select * from Software where SCost*Sold>=20000

/*12.??*/select Title, (CCost/SCost) as no from Software where (CCost%SCost)>=1

/*13.*/select * from Software where SCost*Sold>=CCost

