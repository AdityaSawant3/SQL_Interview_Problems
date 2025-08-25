-- Create the Patients table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name NVARCHAR(100),
    conditions NVARCHAR(100)
);

-- Insert data into Patients table
INSERT INTO Patients (patient_id, patient_name, conditions)
VALUES
(1, 'Daniel', 'YFEV COUGH'),
(2, 'Alice', ''),
(3, 'Bob', 'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100'),
(5, 'Alain', 'DIAB201');

-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. 
-- Type I Diabetes always starts with DIAB1 prefix.
SELECT *
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%'

DROP TABLE Patients;