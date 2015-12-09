use students

CREATE TABLE Status
(
	StatusId int NOT NULL IDENTITY(0,1) CONSTRAINT Status_pk PRIMARY KEY,
	StatusName nvarchar(50)
);

INSERT INTO Status(StatusName)
SELECT 'Absent' UNION ALL
SELECT 'Present'

select *from Status
Create table Students
(
	StudentId int not null IDENTITY(1,1) Primary key,
	Name varchar(30) not null,
	Address varchar(30) not null
);
INSERT INTO Students(Name,Address)
SELECT 'Dipesh','Dhangadhi' UNION ALL
SELECT 'Ganesh','Dhanagadhi' UNION ALL
SELECT 'Sunita','Dhanagadhi' UNION ALL
SELECT 'Laxman','Dhanagadhi' UNION ALL
SELECT 'Arjun','Dhanagadhi' UNION ALL
SELECT 'Ramita' ,'Dhanagadhi'UNION ALL
SELECT 'Binita','Dhanagadhi' UNION ALL
SELECT 'Puspa','Dhanagadhi' 
select *from students

Create table Attendence
(
	AttendenceId int not null IDENTITY(1,1) primary key,
	StudentId int not null,
	StatusId int NOT NULL CONSTRAINT Attendence_Status_fk REFERENCES Status(StatusId)
);

select COUNT(*) from Attendence where StatusId=1 and StudentId=1;