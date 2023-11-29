use logicfirst;

-- Create tables for Hospital Management System

CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(15),
    last_name VARCHAR(10),
    date_of_birth DATE,
    gender VARCHAR(10),
    contact_number VARCHAR(15),
    address VARCHAR(25)
);


INSERT INTO patients (patient_id, first_name, last_name, date_of_birth, gender, contact_number, address)
VALUES
(1, 'John', 'Doe', '2006-05-15', 'Male', '1234567890', '123 Main St'),
(2, 'Jane', 'Smith', '2011-08-20', 'Female', '9876543210', '456 Oak St');


SELECT * FROM patients;


CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(15),
    specialization VARCHAR(20),
    contact_number VARCHAR(10),
    address VARCHAR(28)
);


INSERT INTO doctors (doctor_id, first_name, last_name, specialization, contact_number, address)
VALUES
(1, 'Dr. Michael', 'Johnson', 'Cardiologist', '5551112233', '789 Elm St'),
(2, 'Dr. Emily', 'Williams', 'Pediatrician', '5554445566', '101 Pine St');

SELECT * FROM doctors;


CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    PRIMARY KEY (patient_id, appointment_date),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);


INSERT INTO appointments (appointment_id, patient_id, doctor_id, task_description, appointment_date)
VALUES
(1, 1, 1, 'Consultation', '2023-04-10 10:00:00');


SELECT * FROM appointments;


CREATE TABLE medical_records (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_id INT,
    diagnosis TEXT,
    prescription TEXT,
    test_results TEXT,
    PRIMARY KEY (patient_id, appointment_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);


SELECT * FROM medical_records;



CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    task_description VARCHAR(25),
    task_status VARCHAR(50), 
    assigned_doctor_id INT, 
    assigned_patient_id INT,
    assigned_date DATETIME,
    FOREIGN KEY (assigned_doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (assigned_patient_id) REFERENCES patients(patient_id)
);

INSERT INTO tasks (task_id, task_description, task_status, assigned_doctor_id, assigned_patient_id, assigned_date)
VALUES
(1, 'Blood Test', 'Pending', 1, 1, '2023-04-15 14:00:00');



DELIMITER //

CREATE PROCEDURE GetPatientAppointments(IN p_patient_id INT)
BEGIN
  
    DECLARE patient_first_name VARCHAR(255);
    DECLARE patient_last_name VARCHAR(255);
    DECLARE doctor_first_name VARCHAR(255);
    DECLARE doctor_last_name VARCHAR(255);
    

    SELECT first_name, last_name INTO patient_first_name, patient_last_name
    FROM patients
    WHERE patient_id = p_patient_id;

    SELECT 'Patient Details:', 'Name:', patient_first_name, patient_last_name;

    SELECT appointments.appointment_id,
           doctors.first_name AS doctor_first_name,
           doctors.last_name AS doctor_last_name,
           appointments.task_description,
           appointments.appointment_date
    FROM appointments
    INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id
    WHERE appointments.patient_id = p_patient_id;

END //

DELIMITER ;



SELECT * FROM tasks;

drop table patient;

drop table doctors;



delimiter $$
create procedure employeecnt(
in jdesc varchar(10)
)
begin
declare total int default 0;
select count(emp_id)
into total
from employee
where job_desc=jdesc;
select total;
end$$
delimiter ;

call employeecnt('ADMIN');

call employeecnt('CEO');



DELIMITER //

CREATE PROCEDURE GetPatientAppointments(IN p_patient_id INT)
BEGIN

    DECLARE patient_first_name VARCHAR(255);
    DECLARE patient_last_name VARCHAR(255);
    DECLARE doctor_first_name VARCHAR(255);
    DECLARE doctor_last_name VARCHAR(255);
   
    IF EXISTS (SELECT 1 FROM patients WHERE patient_id = p_patient_id) THEN
       
        SELECT first_name, last_name INTO patient_first_name, patient_last_name
        FROM patients
        WHERE patient_id = p_patient_id;

        SELECT 'Patient Details:', 'Name:', patient_first_name, patient_last_name;

        SELECT appointments.appointment_id,
               doctors.first_name AS doctor_first_name,
               doctors.last_name AS doctor_last_name,
               appointments.task_description,
               appointments.appointment_date
        FROM appointments
        
        INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id
        WHERE appointments.patient_id = p_patient_id;
        
    ELSE
        SELECT 'Patient not found';
    END IF;

END //

DELIMITER ;


CALL GetPatientAppointments(1);

