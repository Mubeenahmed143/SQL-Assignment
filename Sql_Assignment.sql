create database CampanyDB;
use CampanyDB;

create table Employees(
EmployeesID int primary key identity,
FirstName varchar(255),
LastName varchar(255),
Salary decimal(10 , 2),
DepartmentID int 
foreign key (DepartmentID) references Departments(DepartmentID)  
);

alter table Employees add HireDate datetime;

insert into Employees(FirstName , LastName , Salary , DepartmentID , HireDate )
values ('Mubeen' , 'Sheikh' , 99000 , 1 , 23-01-01),
('Zaid' , 'Rocky' , 90000 , 4 , 2022-02-11),
('Murtaza' , 'Sadiq' , 75000 , 3  , 2022-09-15),
('Hanif' , 'Khan' , 50000  , 1 , 2024-07-20),
('Ahtesham' , 'Arain' , 55000  , 5 , 2021-03-04),
('Hasan' , 'khan' , 85000  , 3 , 2022-04-09),
('Shaheer' , 'Shah' , 79000  , 2 , 2022-08-01),
('Maham' , 'Fatima' , 86000  , 2 , 2020-03-07),
('Dawood' , 'Bhai' , 45000 , 4 , 2021-01-02),
('Imran' , 'Khan' , 46000  , 1 , 2021-03-09);

select * from Employees;


UPDATE Employees SET Salary = Salary * 1.1 WHERE DepartmentID = 1;

DELETE from Employees  where Salary < 60000 ;

drop table Employees;


create table Departments(
DepartmentID int primary key ,
DepartmentName varchar(255) 
);

alter table Departments drop column HireDate;

select * from Departments;

insert into Departments(DepartmentID,DepartmentName)
values ( 1 , 'ITDepartment' ),
( 2 , 'AdminDepartment' ),
( 3 , 'CookingDepartment' ),
( 4 , 'HRDepartment' ),
( 5 , 'FeesDepartment' );

insert into Departments(DepartmentID,DepartmentName)
values ( 6 , 'MachineDepartment' ),
( 7 , 'BookDepartment' );


select * from Employees  inner join Departments on Departments.DepartmentID = Employees.DepartmentID;

select Employees.FirstName , Employees.LastName , Departments.DepartmentName , Employees.Salary 
from Employees join Departments on Departments.DepartmentID = Employees.DepartmentID;

SELECT * from Employees left join Departments on Departments.DepartmentID = Employees.DepartmentID;

SELECT * from Employees right join Departments on Departments.DepartmentID = Employees.DepartmentID  ;

select Departments.DepartmentID , Departments.DepartmentName, count(Employees.EmployeesID) as Total_Employee
from Departments left join Employees on Employees.DepartmentID = Departments.DepartmentID 
group by Departments.DepartmentID ,Departments.DepartmentName;

select * from Employees inner join Departments  on Departments.DepartmentID = Employees.DepartmentID where EmployeesID = 6;

select FirstName , LastName , HireDate from Employees where HireDate = 23-01-01;