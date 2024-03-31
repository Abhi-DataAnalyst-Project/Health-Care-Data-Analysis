SELECT * FROM health_care_master;

## How many columns and rows does table have?
SELECT COUNT(*)
	FROM health_care_master;
    
SELECT COUNT(*)
	FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'health_care_master';

## How many patient admitted from which admission type?
SELECT 
	A.description AS Admission_type, 
	COUNT(H.encounter_id) AS Total_admission
FROM health_care_master H
JOIN admission_type A
	ON H.admission_type_id = A.admission_type_id
GROUP BY admission_type;

## How many patient admitted from which source?
SELECT 
	A.description AS source_type,
	COUNT(H.encounter_id) AS Total_admissison
FROM health_care_master H
JOIN admission_source A
	ON H.admission_source_id = A.source_id
GROUP BY source_type;

## How many days do patients spend in hospital and how many patients for each of those days and show in bar chart?
SELECT 
	time_in_hospital AS Days_stay_in_hospital,
    COUNT(*) AS Number_of_patient,
    RPAD('',COUNT(*)/100,'*') AS bar_chart
    FROM health_care_master
GROUP BY Days_stay_in_hospital
ORDER BY Days_stay_in_hospital;

## What is the average number of procedures by department and the amount of patients?
SELECT 
	medical_specialty AS Department,
    ROUND(AVG(num_procedures),1) AS Avg_procedures,
    COUNT(*) AS Total_patients
FROM health_care_master
GROUP BY department
ORDER BY Avg_procedures DESC;

## Show only those department where Avg number of procedure in more than 2.5 and patient over 50?
SELECT medical_specialty AS department,
	ROUND(AVG(num_procedures),1) AS number_of_procedure,
    COUNT(*) AS total_patients
FROM health_care_master
GROUP BY department
HAVING number_of_procedure > '2.0'
	AND total_patients > 50
ORDER BY number_of_procedure DESC;

## Show race catagory wise what is the avg number of lab procedure?
SELECT 
	race, ROUND(AVG(num_lab_procedures),1) AS Number_of_lab_procedures
    FROM 
    health_care_master
GROUP BY race
ORDER BY Number_of_lab_procedures DESC;

## What is the minimum, average and maximum number of lab procedures carried out?
SELECT 
	MIN(num_lab_procedures) AS minimum_numer_of_lab_procedures,
    ROUND(AVG(num_lab_procedures),2) AS Average_numer_of_lab_procedures,
    MAX(num_lab_procedures) AS maximum_numer_of_lab_procedures
FROM health_care_master;

## Show How frequently num of lab procedure proceduces those patient how are spent avg time in hospital?
## If lab_procedure less then 25 then 'few' IF more then 50 then 'avg' else 'Many time'?
SELECT 
	ROUND(AVG(time_in_hospital),2) AS avg_spent_days,
    COUNT(num_lab_procedures) AS number_of_lab_procedure, 
    CASE
		WHEN num_lab_procedures < 25 THEN 'Few time'
        WHEN num_lab_procedures < 50 THEN 'Avgrage time'
        ELSE 'Many'
	END AS
Frequently_procedure
FROM health_care_master
GROUP BY frequently_procedure;

## Create a list of patient numbers where their race catagory is 'AfricanAmerican' and their Metformin is 'Up'?
SELECT race, metformin,
	COUNT(*) AS Number_of_patient
FROM health_care_master
WHERE race = 'AfricanAmerican' AND
	metformin = 'up';

## Find out those patients who are admitted in an emergency and stayed less than the average stay days in hospital?
WITH Avg_time AS 
		(SELECT AVG(time_in_hospital) 
		FROM health_care_master)
SELECT H.encounter_id,H.patient_nbr,H.race,
H.admission_type_id, A.description AS admission_type,
H.time_in_hospital,H.medical_specialty,
H.num_lab_procedures,H.num_procedures FROM health_care_master H
JOIN admission_type A ON H.admission_type_id = A.admission_type_id
WHERE H.admission_type_id = '1'
AND H.time_in_hospital < (SELECT * FROM Avg_time);
	
## Create a list of patient number, race, readmission status for top 100 patients 
## those have had the most number of medication & the most of number of lab procedures.
SELECT patient_nbr, race, 
	(CASE 
		WHEN readmitted = 'no' THEN 'Not admitted'
	ELSE 'Re admitted'
END) AS Readmission_status,
	num_medications AS medication,
    num_lab_procedures AS lab_procedures
    FROM health_care_master
ORDER BY lab_procedures DESC,medication DESC
LIMIT 100;

SELECT MAX(num_medications) FROM health_care_master;
SELECT MAX(num_lab_procedures) FROM health_care_master;