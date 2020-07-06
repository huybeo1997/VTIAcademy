CREATE DATABASE IF NOT EXISTS trainees;

USE trainees;

CREATE TABLE IF NOT EXISTS trainee 
(
    traineeID 			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    full_name 			VARCHAR(225),
    birth_date 			DATE,
    gender				ENUM('M','F') null,
    ET_IQ 				TINYINT(2) UNSIGNED NOT NULL CHECK( ET_IQ <= 20 ),
    ET_gmath 			TINYINT(2) UNSIGNED NOT NULL CHECK( ET_gmath <= 20 ),
    ET_English 			TINYINT(2) UNSIGNED NOT NULL CHECK( ET_English <= 50 ),
    trainee_class 		VARCHAR(20),
    evaluation_notes 	VARCHAR(225)
);
  ALTER TABLE trainee 
  DROP COLUMN VTI_Account;
ALTER TABLE trainee
ADD COLUMN VTI_Account VARCHAR(50) UNIQUE KEY;

CREATE TABLE trainee1
(
	ID 				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `NAME` 			VARCHAR(30),
    `Code`			CHAR(5),
    ModifiedDate	DATETIME
);

CREATE TABLE trainee2
(
	ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Birthdate		DATE,
    `name`			VARCHAR(30),
    Gendr			ENUM('0','1') NULL,
    IsDeletedFlag	ENUM('0','1')
    );
    
    