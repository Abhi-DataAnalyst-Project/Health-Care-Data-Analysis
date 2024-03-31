CREATE TABLE admission_type (
admission_type_id INT PRIMARY KEY,
description VARCHAR (50));

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\admission_type.csv'
INTO TABLE admission_type
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM admission_type;

CREATE TABLE discharge_type (
discharge_id INT PRIMARY KEY,
description VARCHAR (200));

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\discharge_type.csv'
INTO TABLE discharge_type
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM discharge_type;

CREATE TABLE admission_source(
source_id INT PRIMARY KEY,
description VARCHAR (100));

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\admission_source.csv'
INTO TABLE admission_source
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM admission_source;
DROP TABLE HEALTH_CARE;

CREATE TABLE health_care_master(
encounter_id INT,
patient_nbr INT,
race VARCHAR (50),
gender VARCHAR (20),
age VARCHAR (20),
weight VARCHAR (20),
admission_type_id INT,
discharge_id INT,
admission_source_id INT,
time_in_hospital INT,
payer_code VARCHAR (20),
medical_specialty VARCHAR (50),
num_lab_procedures INT,
num_procedures INT,
num_medications INT,
number_outpatient INT,
number_emergency INT,
number_inpatient INT,
diag_1 VARCHAR (20),
diag_2 VARCHAR (20),
diag_3 VARCHAR (20),
number_diagnoses INT,
max_glu_serum VARCHAR (20),
A1Cresult VARCHAR (20),
metformin VARCHAR (20),
repaglinide VARCHAR (20),
nateglinide VARCHAR (20),
chlorpropamide VARCHAR (20),
glimepiride VARCHAR (20),
acetohexamide VARCHAR (20),
glipizide VARCHAR (20),
glyburide VARCHAR (20),
tolbutamide VARCHAR (20),
pioglitazone VARCHAR (20),
rosiglitazone VARCHAR (20),
acarbose VARCHAR (20),
miglitol VARCHAR (20),
troglitazone VARCHAR (20),
tolazamide VARCHAR (20),
examide VARCHAR (20),
citoglipton VARCHAR (20),
insulin VARCHAR (20),
glyburide_etformin VARCHAR (20),
glipizide_etformin VARCHAR (20),
glimepirid_pioglitazone VARCHAR (20),
metformin_osiglitazone VARCHAR (20),
metformin_ioglitazone VARCHAR (20),
changes VARCHAR (20),
diabetesMed VARCHAR (10),
readmitted VARCHAR (20));

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Health_care.csv'
INTO TABLE health_care_master
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM health_care_master;