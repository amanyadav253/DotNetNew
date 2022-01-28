create database Aman

use Aman

create table test
(
username varchar(25)
)

alter table test add constraint uk_test_username unique(username)
alter table test add id int primary key

select * from test

insert into test values('admin',2)

create table child
(
child_id int primary key,
name varchar(25),
test_id int foreign key references test(id)
)

select * from child

insert into child values(3,'child2',1)

create table Salary_Dest
(
Id int primary key identity(1,1),
Name varchar(25) not null,
TotalSal int not null,
InHandSal as (TotalSal*80/100),
HRA as (TotalSal*10/100),
DA as (TotalSal*5/100),
Tax as (Totalsal*5/100)
)

insert into Salary_Dest values ('Emp4',28000)

select * from Salary_Dest

drop table Salary_Dest

select distinct test_id from child

select top 2 * from Salary_Dest

select * into Salary_Det_Backup from Salary_Dest

select * from Salary_Det_Backup

use Aman

CREATE TABLE NewEmployees 