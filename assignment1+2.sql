DROP DATABASE salemanagement;

CREATE DATABASE IF NOT EXISTS Salemanagement;
USE  Salemanagement;

CREATE TABLE IF NOT EXISTS drepartment
(
    drepartmentID 		INT,
    drepartmentName 	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Position
(
	positionID    		INT,
    postionName 		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Account`
(
	accountID 		INT,
    Email 			VARCHAR(50),
    Username 		VARCHAR(50),
    fullname		VARCHAR(50),
    DepartmentID 	VARCHAR(50),
    positionID 		VARCHAR(50),
    createdate		date
);

CREATE TABLE IF NOT EXISTS `Group`
(
	GroupID 	INT,
    GroupName	VARCHAR(50),
    CreatorID	INT,
    CreateDate	DATE 
);
CREATE TABLE IF NOT EXISTS GroupAccount
(
	GroupID		INT,
    AccointID	INT,
    JoinDate	DATE 
);

CREATE TABLE IF NOT EXISTS TypeQuestion
(
	TypeID 		INT,
    TypeName	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS CategoryQusetion
(
	CatrgoryID 		INT,
    categoryName	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Question
(
	questionID		INT,
    Content			VARCHAR(225),
    CategoryID		INT,
    TypeID			INT,
    CreatorID		INT,
    CreateDate		DATE 
);

CREATE TABLE IF NOT EXISTS Answer
(
	AnswerID		INT,
    Content			VARCHAR(225),
    questionID		INT,
    isCorrect		VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Exam
(
	ExamID		INT,
    `Code`		INT,
    Title		VARCHAR(225),
    CategoryID	INT,
    Duration	TIME,
    creatorID	INT,
    CreateDate	DATE 
);

CREATE TABLE IF NOT EXISTS Examquestion
(
	ExamID		INT,
    QuestionID	INT 
);
