CREATE DATABASE IF NOT EXISTS trainees;

USE trainees;

CREATE TABLE IF NOT EXISTS trainee 
(
    traineeID 			INT AUTO_INCREMENT PRIMARY KEY,
    full_name 			VARCHAR(50),
    birth_date 			VARCHAR(20),
    gender				ENUM('M','F'),
    ET_IQ 				INTEGER(2),
    ET_gmath 			INTEGER(2),
    ET_English 			INTEGER(2),
    trainee_class 		VARCHAR(20),
    evaluation_notes 	VARCHAR(225)
);
  ALTER TABLE trainee 
  DROP COLUMN VTI_Account;
ALTER TABLE trainee
ADD COLUMN VTI_Account VARCHAR(50) UNIQUE KEY;

CREATE TABLE trainee1
(
	ID 				INT AUTO_INCREMENT PRIMARY KEY,
    `NAME` 			VARCHAR(30),
    `Code`			VARCHAR(5),
    ModifiedDate	DATETIME
);

CREATE TABLE trainee2
(
	ID				INT AUTO_INCREMENT PRIMARY KEY,
    Birthdate		DATE,
    `name`			VARCHAR(30),
    Gendr			INTEGER(1) NULL,
    IsDeletedFlag	INTEGER(1)
    );
    
    