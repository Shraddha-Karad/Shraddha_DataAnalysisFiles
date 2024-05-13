create database Hospital_Management

use Hospital_Management

-- Table Creation

create table Doctor (
    DoctorID char(5) primary key,
    Fname varchar(50),
    Lname varchar(50),
    Speciality varchar(50),
    ContactEmail varchar(50)
);

create table Patients (
    PatientID char(5) primary key,
    Fname varchar(50),
    Lname varchar(50),
    Contact varchar(20),
    Age int
);


create table Appointment (
    AppointmentID char(5) primary key,
    PatientID char(5),
    DoctorID char(5),
    Date datetime,
    EndTime datetime,
    Status varchar(20),
    foreign key (PatientID) references Patients(PatientID),
    foreign key (DoctorID) references Doctor(DoctorID)
);


create table MedicalHistory (
    HistoryID char(5) primary key,
    PatientID char(5),
    Date datetime,
    Condition varchar(100),
    Surgeries varchar(100),
    Medication varchar(100),
    foreign key (PatientID) references Patients(PatientID)
);

create table PatientsAttendAppointments (
    PatientID char(5),
    AppointmentID char(5),
    primary key (PatientID, AppointmentID),
    foreign key (PatientID) references Patients(PatientID),
    foreign key (AppointmentID) references Appointment(AppointmentID)
);

create table PatientFillHistory (
    PatientID char(5),
    HistoryID char(5),
    DateFilled datetime,
    primary key (PatientID, HistoryID),
    foreign key (PatientID) references Patients(PatientID),
    foreign key (HistoryID) references MedicalHistory(HistoryID)
);

create table MedicineCost (
    Medication varchar(50) primary key,
    Cost_in$ decimal(10, 2)
);

--------------------------------------------------------------------------------------------------------------------------------------------------

-- Data Insertion

-- Patients Table Data

insert into Patients (PatientID, Fname, Lname, Contact, Age) values 
('P0001', 'John', 'Doe', '123-456-7890', 35),
('P0002', 'Jane',	'Smith', '987-654-3210', 25),
('P0003', 'Michael',	'Johnson', '555-555-5555', 62),
('P0004', 'David', 'Lee', '111-222-3333', 33),
('P0005', 'Sarah', 'Brown', '444-555-6666', 21),
('P0006', 'John',	'Doe', '777-888-9999',	28),
('P0007', 'Jane', 'Smith', '333-222-1111', 30),
('P0008', 'Michael', 'Johnson', '666-777-8888', 41),
('P0009', 'David', 'Lee', '999-888-7777',	41),
('P0010', 'Sarah', 'Brown', '222-333-4444', 60);


-- Doctors Table Data

insert into Doctor (DoctorID, Fname, Lname, Speciality, ContactEmail) values 
('D0001', 'Dr. John', 'Doe', 'General Physician', 'john.doe@example.com'),
('D0002', 'Dr. Jane', 'Smith', 'Pediatrician', 'jane.smith@example.com'),
('D0003', 'Dr. Michael', 'Johnson', 'Cardiologist', 'michael.j@example.com');


-- Appointment Table Data



insert into Appointment (AppointmentID, PatientID, DoctorID, Date, EndTime, Status) values 
('A0001','P0001', 'D0001', '11/7/23 10:00', '11/7/23 11:15', 'Scheduled'),
('A0002','P0002', 'D0002', '11/8/23 11:00', '11/8/23 12:06', 'Completed'),
('A0003','P0003', 'D0003', '11/9/23 12:00', '11/9/23 1:21', 'Cancelled'),
('A0004','P0004', 'D0001', '11/10/23 13:00', '11/10/23 14:17', 'Scheduled'),
('A0005','P0005', 'D0002', '11/11/23 14:00', '11/11/23 15:45', 'Completed'),
('A0006','P0006', 'D0003', '11/12/23 15:00', '11/12/23 16:15', 'Cancelled'),
('A0007','P0007', 'D0001', '11/13/23 16:00', '11/13/23 17:09', 'Scheduled'),
('A0008','P0008', 'D0002', '11/14/23 17:00', '11/14/23 18:29', 'Completed'),
('A0009','P0009', 'D0003', '11/15/23 18:00', '11/15/23 19:11', 'Cancelled'),
('A0010','P0010', 'D0001', '11/16/23 19:00', '11/16/23 20:05', 'Scheduled');




-- PatientsAttendAppointments Table


insert into PatientsAttendAppointments (PatientID, AppointmentID) values 
('P0001' ,'A0001'),
('P0002' ,'A0002'),
('P0003' ,'A0003'),
('P0004' ,'A0004'),
('P0005' ,'A0005'),
('P0006' ,'A0006'),
('P0007' ,'A0007'),
('P0008' ,'A0008'),
('P0009' ,'A0009'),
('P0010' ,'A0010'),
('P0001' ,'A0004'),
('P0002' ,'A0005'),
('P0003' ,'A0006');



-- MedicalHistory TAble


insert into MedicalHistory (HistoryID, PatientID, Date, Condition, Surgeries, Medication) values 
('H0001','P0001', '11/1/23 8:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
('H0002','P0002', '11/2/23 9:00', 'Diabetes', 'None', 'Metformin'),
('H0003','P0004', '11/3/23 10:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0004','P0004', '11/4/23 11:00', 'Migraine', 'Appendectomy', 'Ibuprofen'),
('H0005','P0005', '11/5/23 12:00', 'Diabetes', 'None', 'Insulin'),
('H0006','P0006', '11/6/23 13:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0007','P0007', '11/7/23 14:00', 'Hypertension', 'Appendectomy', 'Lisinopril'),
('H0008','P0008', '11/8/23 15:00', 'Diabetes', 'None', 'Metformin'),
('H0009','P0009', '11/9/23 16:00', 'Asthma', 'Tonsillectomy', 'Albuterol'),
('H0010','P0010', '11/10/23 17:00', 'Migraine', 'Appendectomy', 'Ibuprofen');



UPDATE MedicalHistory
SET Date = CONVERT(varchar, Date, 120);



-- PatientFillHistory Table


insert into PatientFillHistory (PatientID, HistoryID, DateFilled) values 
('P0001','H0001','11/4/23 8:30'),
('P0002','H0002','11/5/23 9:45'),
('P0003','H0003','11/6/23 10:30'),
('P0004','H0004','11/7/23 11:15'),
('P0005','H0005','11/8/23 12:45'),
('P0006','H0006','11/9/23 13:30'),
('P0007','H0007','11/10/23 14:15'),
('P0008','H0008','11/11/23 15:45'),
('P0009','H0009','11/12/23 16:30'),
('P0010','H0010','11/13/23 17:15');


-- MedicineCost TAble


insert into MedicineCost (Medication, Cost_in$) values 
('Lisinopril', 10),
('Metformin', 15),
('Albuterol', 12),
('Ibuprofen', 8),
('Insulin', 20);



--------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 1  :  Find the names of patients who have attended appointments scheduled by Dr. John Doe.

select distinct P.Fname, P.Lname
from Patients P
join PatientsAttendAppointments PA on P.PatientID = PA.PatientID
join Appointment A on PA.AppointmentID = A.AppointmentID
join Doctor D on A.DoctorID = D.DoctorID
where D.Fname = 'Dr. John' and D.Lname = 'Doe';


---------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 2  :  Calculate the average age of all patients.

select avg( Age ) AS AverageAge from Patients;

SELECT ROUND(AVG(Age), 2) AS AverageAge
FROM Patients;

---------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 3  :  Create a stored procedure to get the total number of appointments for a given patient.

create procedure GetTotalAppointments
    @PatientsID char(5)
as
begin
    select count(*) as TotalAppointments
    from PatientsAttendAppointments
    where PatientID = @PatientsID;
end;


declare @PatID char(5) = 'P0006'; 
exec GetTotalAppointments @PatID;


---------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 4  :  Create a trigger to update the appointment status to 'Completed' when the appointment date has passed.


create trigger UpdateAppointmentStatusee
on Appointment
after insert, update
as
begin
    update Appointment
    set Status = 'Sceduled'
    where Date < getdate() and Status <> 'Completed';
end;

select * from Appointment;






/*
update Appointment
set Date = '2023-11-7 10:00'
where AppointmentID = 'A0001';
*/


---------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 5  :   Find the names of patients along with their appointment details and the corresponding doctor's name.

select
    P.Fname + ' ' + P.Lname as PatientName,
    A.AppointmentID,
    A.Date as AppointmentDate,
    A.EndTime,
    A.Status as AppointmentStatus,
	D.Fname + ' ' + D.Lname as DoctorName
from
    Patients P
join
    PatientsAttendAppointments PA on P.PatientID = PA.PatientID
join
    Appointment A on PA.AppointmentID = A.AppointmentID
join
    Doctor D on A.DoctorID = D.DoctorID;


-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 6  :   Find the patients who have a medical history of diabetes and their next appointment is scheduled within the next 7 days.


declare @SpecificDate datetime = '2023-11-7 18:21';


select distinct P.PatientID, 
	P.Fname + ' ' + P.Lname as PateintName
from 
	Patients P
join 
	Appointment A on P.PatientID = A.PatientID
join 
	MedicalHistory MH on P.PatientID = MH.PatientID
where 
	MH.Condition = 'Diabetes'
and A.Date between @SpecificDate and DATEADD(day, 7, @SpecificDate); 

----------------------------------------------------------------------------------------

/*
 
select
	P.PatientID, 
	P.Fname + ' ' + P.Lname as PateintName
    MH.Date as MedicalHistoryDate,
    A.AppointmentID,
    A.Date as AppointmentDate
from
    Patients P
join
    MedicalHistory MH on P.PatientID = MH.PatientID
join
    PatientsAttendAppointments PA on P.PatientID = PA.PatientID
join
    Appointment A on PA.AppointmentID = A.AppointmentID
where
    MH.Condition = 'Diabetes'

    and A.Date between GETDATE() and DATEADD(DAY, 7, GETDATE())
order by
    P.PatientID, A.Date;


*/



---------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 7  :   Find patients who have multiple appointments scheduled.

select
    P.PatientID,
    P.Fname + ' ' + P.Lname as PateintName,
    count(A.AppointmentID) as NumberOfAppointments
from
    Patients P
join
    PatientsAttendAppointments PA on P.PatientID = PA.PatientID
join
    Appointment A on PA.AppointmentID = A.AppointmentID
group by
    P.PatientID, P.Fname, P.Lname
having
    count(A.AppointmentID) > 1;


---------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 8  :   Calculate the average duration of appointments for each doctor.



select
    D.DoctorID,
    D.Fname + ' ' + D.Lname as DoctorName,
    AVG(abs(datediff(minute, A.Date, A.EndTime))) as AverageDuration
from
    Doctor D
join
    Appointment A on D.DoctorID = A.DoctorID
group by
    D.DoctorID, D.Fname, D.Lname;

--------------------- If Appointment Completed then only time calculated otherwise 0 min


select
    D.DoctorID,
    D.Fname + ' ' + D.Lname as DoctorName,
    AVG(case when A.Status = 'Completed' then datediff(minute, A.Date, A.EndTime) else 0 end) as AverageDuration
from
    Doctor D
join
    Appointment A on D.DoctorID = A.DoctorID
group by
    D.DoctorID, D.Fname, D.Lname;


----------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 9  :   Find Patients with Most Appointments

select top 1 with ties
    P.PatientID,
    P.Fname + ' ' + P.Lname as PateintName,
    count(PA.AppointmentID) as TotalAppointments
from
    Patients P
join
    PatientsAttendAppointments PA on P.PatientID = PA.PatientID
group by
    P.PatientID, P.Fname, P.Lname
order by
    TotalAppointments desc;



----------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 10  :   Calculate the total cost of medication for each patient.

select
    P.PatientID,
    P.Fname + ' ' + P.Lname as PateintName,
    SUM(MC.Cost_in$) as TotalMedicationCost
from
    Patients P
join
    MedicalHistory MH on P.PatientID = MH.PatientID
join
    MedicineCost MC on MH.Medication = MC.Medication
group by
    P.PatientID, P.Fname, P.Lname;


-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Querie 11  :   Create a stored procedure named CalculatePatientBill that calculates the total bill for a patient based on their medical
--               history and medication costs. The procedure should take the PatientID as a parameter and calculate the total cost by
--               summing up the medication costs and applying a charge of $50 for each surgery in the patient's medical history. 
--               If the patient has no medical history, the procedure should still return a basic charge of $50.

create procedure CalculatePatientTotalBill
    @PatientsID char(5)
as
begin
    declare @TotalBill decimal(10, 2);

    -- Calculating medication costs
    select @TotalBill = coalesce(sum(MC.Cost_in$), 0)
    from MedicalHistory MH
    join MedicineCost MC on MH.Medication = MC.Medication
    where MH.PatientID = @PatientsID;

    -- Adding $50 for each surgery in medical history
    select @TotalBill = @TotalBill + (count(*) * 50)
    from MedicalHistory
    where PatientID = @PatientsID and Surgeries <> 'None';

    -- Returning the total bill
    select @TotalBill as TotalBill;
end;


declare @PatID char(5) = 'P0002'; 
exec CalculatePatientTotalBill @PatID;


--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++













































update Appointment
set Date = convert(varchar, Date, 120);

update Appointment
set Date = convert(varchar, EndTime, 120);



update PatientFillHistory
set DateFilled = convert(varchar, DateFilled, 120);






DECLARE @SpecificDate DATETIME = '2023-11-7 18:21';  

WITH NextAppointments AS (
    SELECT
        PatientID,
        Date AS AppointmentDate
    FROM
        Appointment
    WHERE
        Date >= @SpecificDate  -- Consider only future appointments from the specific date
),
AppointmentsWithin7Days AS (
    SELECT
        PatientID,
        AppointmentDate
    FROM
        NextAppointments
    WHERE
        DATEDIFF(DAY, @SpecificDate, AppointmentDate) <= 7  
)
SELECT
    P.PatientID,
    P.Fname,
    P.Lname,
    A.AppointmentDate
FROM
    Patients P
JOIN
    AppointmentsWithin7Days A ON P.PatientID = A.PatientID;







DECLARE @SpecificDate DATETIME = '2023-11-11 18:00';  

WITH DiabetesPatients AS (
    SELECT DISTINCT
        MH.PatientID
    FROM
        MedicalHistory MH
    WHERE
        MH.Condition = 'Diabetes'
),
NextAppointments AS (
    SELECT
        A.PatientID,
        A.Date AS AppointmentDate
    FROM
        Appointment A
    JOIN
        DiabetesPatients DP ON A.PatientID = DP.PatientID
    WHERE
        A.Date >= @SpecificDate  
),
AppointmentsWithin7Days AS (
    SELECT
        PatientID,
        AppointmentDate
    FROM
        NextAppointments
    WHERE
        DATEDIFF(DAY, @SpecificDate, AppointmentDate) <= 7  -- Filter appointments within the next 7 days from the specific date
)
SELECT
    P.PatientID,
    P.Fname,
    P.Lname,
    A.AppointmentDate
FROM
    Patients P
JOIN
    AppointmentsWithin7Days A ON P.PatientID = A.PatientID;









UPDATE Appointment
SET Date = CONVERT(varchar, Date, 120);

UPDATE Appointment
SET Date = CONVERT(varchar, EndTime, 120);



UPDATE PatientFillHistory
SET DateFilled = CONVERT(varchar, DateFilled, 120);

