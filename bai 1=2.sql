CREATE DATABASE IF NOT EXISTS trainees;

USE trainees;

CREATE TABLE trainees 
(
    traineeID INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(50),
    birth_date VARCHAR(20),
    gender VARCHAR(20),
    ET_IQ INT(2),
    ET_gmath INT(5),
    trainee_class VARCHAR(20),
    evaluation_notes VARCHAR(225)
);
  
  