/*=========================================TESTINGASSIGNMENT1+2==========================================================*/

DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE IF NOT EXISTS TestingSystem;
USE TestingSystem;

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 		NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW()
);

-- create table 5: GroupAccount
CREATE TABLE IF NOT EXISTS GroupAccount(
	GroupID						TINYINT UNSIGNED,
    AccountID					TINYINT UNSIGNED,
    JoinDate					DATETIME,
    FOREIGN KEY (GroupID) 		REFERENCES `Group` (GroupID) ON DELETE NO ACTION,
    FOREIGN KEY (AccountID) 	REFERENCES `Account` (AccountID)
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL UNIQUE KEY,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    Answers					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    PRIMARY KEY (ExamID,QuestionID)
);

/*================================================THE END======================================================*/
									
                                    /*_____TESTINGASSIGNMENT 3_____*/
-- Question 1: Thêm ít nhất 10 record vào mỗi table.
INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'	),
						(N'Sale'		),
						(N'Bảo vệ'		),
						(N'Nhân sự'		),
						(N'Kỹ thuật'	),
						(N'Tài chính'	),
						(N'Phó giám đốc'),
						(N'Giám đốc'	),
						(N'Thư kí'		),
						(N'Bán hàng'	);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyen Hai Dang'		,   '5'			,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Tong Quang Anh'		,   '1'			,   '2'		,'2020-03-05'),
					('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
					('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
					('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang'	,   '4'			,   '4'		,'2020-03-10'),
					('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
					('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		,'2020-04-05'),
					('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
					('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
					('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09'),
					('vtiaccademy@gmail2.com'			, 'vtiaccademy2'	,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- Add data Group
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Developement'		,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

-- Add data GroupAccount
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Add data TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'Câu hỏi về Java'	,	1		,   '1'			,   '1'		,'2020-04-05'),
						(N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'Hỏi về Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'Hỏi về Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Trả lời 01'	,   1			,	0		),
					(N'Trả lời 02'	,   1			,	1		),
                    (N'Trả lời 03'	,   1			,	0		),
                    (N'Trả lời 04'	,   1			,	1		),
                    (N'Trả lời 05'	,   2			,	1		),
                    (N'Trả lời 06'	,   3			,	1		),
                    (N'Trả lời 07'	,   4			,	0		),
                    (N'Trả lời 08'	,   8			,	0		),
                    (N'Trả lời 09'	,   9			,	1		),
                    (N'Trả lời 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'Đề thi PHP'			,	10			,	60		,   '1'			,'2019-04-05'),
                    ('VTIQ003'		, N'Đề thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'Đề thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 

-- Question 2: lấy ra tất cả các phòng ban.

SELECT *
FROM department;

-- Question 3: lấy ra id của phòng ban "Sale".

SELECT *
FROM 	department
WHERE 	DepartmentName = 'Sale';

-- Question 4: lấy ra thông tin account có full name dài nhất và sắp xếp chúng theo thứ tự giảm dần.

SELECT MAX(LENGTH(FullName))
FROM	`Account`;

SELECT *
FROM	`Account`
WHERE	LENGTH(FullName) = (SELECT MAX(LENGTH(FullName))
							FROM	`Account`)
order by AccountID DESC;

-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3.

SELECT *
FROM	`Account`
WHERE	LENGTH(FullName) = (SELECT MAX(LENGTH(FullName))
							FROM	`Account`)
	AND DepartmentID = 3;

-- Question 6: lấy ra tên group đã tham gia trước ngày 20/12/2019.

SELECT GroupName,CreateDate
FROM	`Group`
WHERE	CreateDate < '2019-12-20';

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời.

SELECT QuestionID,COUNT(Answers)
FROM 	Answer
GROUP BY QuestionID
HAVING	COUNT(Answers) >= 4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019.

SELECT ExamID,Duration,CreateDate
FROM	Exam
WHERE	Duration > 60 AND CreateDate < '2019-12-20';

-- Question 9: Lấy ra 5 group được tạo gần đây nhất.

SELECT *
FROM	`Group`
ORDER BY CreateDate DESC
LIMIT 1,5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT DepartmentID,COUNT(AccountID)
FROM	`Account`
GROUP BY DepartmentID
HAVING	DepartmentID = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o".

SELECT FullName
FROM	`Account`
WHERE 	FullName LIKE 'D%o';

-- Question 12: xóa tất cả các exam được tạo trước ngày 20/12/2019.

SET foreign_key_checks =0;
DELETE
FROM	exam
WHERE	CreateDate < '2019-12-20';

-- Question 13: xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi".

DELETE 
FROM question
WHERE Content LIKE 'Cau hoi%';

-- Question 14: update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
-- email thành loc.nguyenba@vti.com.vn.

UPDATE `Account`
	SET 
		FullName = 'Nguyễn Bá Lộc',
        Email	 = 'loc.nguyenba@vti.com.vn'
WHERE	AccountID = 5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4.

UPDATE groupaccount
	SET 
		GroupID = 4
WHERE	AccountID = 5;

/*==================================================THE END=================================================================*/


										/*_____TESTINGASSIGNMENT 4_____*/
-- Exercise 1: Join
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ.

SELECT FullName,DepartmentID,DepartmentName
FROM	`account`
JOIN	department USING(DepartmentID);

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010.

SELECT *
FROM	`Account`
WHERE	CreateDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT *
FROM 	`Account`
JOIN	position USING(PositionID)
WHERE 	PositionName = 'DEV';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên.

SELECT DepartmentID,DepartmentName,COUNT(AccountID)
FROM	`account`
JOIN	department USING(DepartmentID)
GROUP BY DepartmentID
HAVING	COUNT(AccountID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất.


SELECT *,COUNT(ExamID)
FROM	examquestion
GROUP BY QuestionID
HAVING	COUNT(ExamID) = (SELECT MAX(SLDT)
						FROM	(SELECT *,COUNT(ExamID) AS SLDT
									FROM	examquestion
									GROUP BY QuestionID) AS TAM);
                                    
-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question.

SELECT CategoryID,CategoryName,COUNT(QuestionID),GROUP_CONCAT(QuestionID)
FROM	categoryquestion
LEFT JOIN	question USING(CategoryID)
GROUP BY CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam.

SELECT *,COUNT(ExamID),GROUP_CONCAT(ExamID)
FROM	examquestion
GROUP BY QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất.

SELECT QuestionID,COUNT(Answers),GROUP_CONCAT(Answers)
FROM	answer
GROUP BY QuestionID
HAVING	COUNT(Answers) = (SELECT MAX(SLCTL)
							FROM (SELECT QuestionID,COUNT(Answers) AS SLCTL
									FROM	answer
									GROUP BY QuestionID) AS TAM );

-- Question 9: Thống kê số lượng account trong mỗi group.

SELECT GroupID,GroupName,COUNT(AccountID),GROUP_CONCAT(AccountID)
FROM	`group`
LEFT JOIN	groupaccount USING(GroupID)
GROUP BY GroupID;

-- Question 10: Tìm chức vụ có ít người nhất.

SELECT PositionID,PositionName,COUNT(AccountID)
FROM	position
LEFT JOIN `account` USING(PositionID)
GROUP BY PositionID
HAVING 	COUNT(AccountID) = (SELECT MIN(SLN)
							FROM	(SELECT PositionID,PositionName,COUNT(AccountID) AS SLN
									FROM	position
									LEFT JOIN `account` USING(PositionID)
									GROUP BY PositionID) AS TAM);

-- Question 11: thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM.

SELECT DepartmentID,DepartmentName,COUNT(PositionName),GROUP_CONCAT(PositionName)
FROM		department
LEFT JOIN	`account` USING(DepartmentID)
LEFT JOIN	position  USING(PositionID)
GROUP BY  DepartmentID;

/*Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...*/

SELECT *
FROM question
JOIN categoryquestion USING(CategoryID)
JOIN `account` ON `account`.AccountID = question.CreatorID
ORDER BY QuestionID;

-- Question 13: lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm.

SELECT TypeID,TypeName,COUNT(QuestionID),GROUP_CONCAT(QuestionID)
FROM	typequestion
JOIN	question USING(TypeID)
GROUP BY TypeID;

-- Question 14: lấy ra group không có account nào

SELECT *
FROM	groupaccount
WHERE	AccountID IS NULL;

-- Question 15: lấy ra group không có account nào
-- Question 16: lấy ra question không có answer nào.

SELECT *
FROM answer
WHERE Answers IS NULL;

-- Exercise 2: Union
/*Question 17:
a) Lấy các account thuộc nhóm thứ 1
b) Lấy các account thuộc nhóm thứ 2
c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau.*/

SELECT *
FROM groupaccount
WHERE GroupID = 1

UNION

SELECT *
FROM groupaccount
WHERE GroupID = 2; 

/*Question 18:
a) Lấy các group có lớn hơn 5 thành viên
b) Lấy các group có nhỏ hơn 7 thành viên
c) Ghép 2 kết quả từ câu a) và câu b).*/

SELECT *,COUNT(AccountID)
FROM	groupaccount
GROUP BY GroupID
HAVING COUNT(AccountID) > 5

UNION ALL

SELECT *,COUNT(AccountID)
FROM	groupaccount
GROUP BY GroupID
HAVING COUNT(AccountID) < 7;

/*===================================================THE END============================================================*/

									/*________SQL – ASSIGNMENT 5______*/

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale.
-- CACH 1:
DROP VIEW IF EXISTS Question1;
CREATE VIEW Question1 AS
		SELECT DepartmentID,DepartmentName,COUNT(AccountID),GROUP_CONCAT(AccountID)
        FROM	`account`
        JOIN	Department USING(DepartmentID)
        GROUP BY DepartmentID
        HAVING	DepartmentName = 'sale';
									
SELECT *
FROM Question1;

-- CACH 2:

WITH Question1 AS (
					SELECT DepartmentID,DepartmentName,COUNT(AccountID),GROUP_CONCAT(AccountID)
					FROM	`account`
					JOIN	Department USING(DepartmentID)
					GROUP BY DepartmentID
					HAVING	DepartmentName = 'sale')
SELECT *
FROM	Question1;

-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất.
-- CACH 1:
DROP VIEW IF EXISTS Question2;
CREATE VIEW Question2 AS 
		SELECT	*,COUNT(GroupID) AS SLN,GROUP_CONCAT(GroupID)
        FROM	`account`
        JOIN	groupaccount USING(AccountID)
        GROUP BY AccountID;

SELECT *
FROM	Question2
HAVING 	SLN = (SELECT MAX(SLN)
				FROM Question2);

-- CACH 2:

WITH Question2 AS (
		SELECT	*,COUNT(GroupID) AS SLN,GROUP_CONCAT(GroupID)
        FROM	`account`
        JOIN	groupaccount USING(AccountID)
        GROUP BY AccountID)

SELECT *
FROM	Question2
HAVING 	SLN = (SELECT MAX(SLN)
				FROM Question2); 
                
-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 15 ký tự
-- được coi là quá dài) và xóa nó đi.
-- CACH 1:

DROP VIEW IF EXISTS Question3;
CREATE VIEW Question3 AS
		SELECT QuestionID,Content
        FROM	answer
        WHERE	LENGTH(Content) > 15;

DROP VIEW IF EXISTS Question3;

-- CACH 2:

WITH Question3 AS (
		SELECT QuestionID,Content
        FROM	answer
        WHERE	LENGTH(Content) > 15)
SELECT *
FROM	Question3;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất.
-- CACH 1:
DROP VIEW IF EXISTS Question4;
CREATE VIEW Question4 AS
		SELECT DepartmentID,DepartmentName,COUNT(AccountID) AS SLNV,GROUP_CONCAT(AccountID)
        FROM	`account`
        JOIN	department	USING(DepartmentID)
        GROUP BY DepartmentID;

SELECT *
FROM	Question4
WHERE	SLNV = (SELECT MAX(SLNV)
				FROM	Question4);

-- CACH 2:
		
WITH Question4 AS (
		SELECT DepartmentID,DepartmentName,COUNT(AccountID) AS SLNV,GROUP_CONCAT(AccountID)
        FROM	`account`
        JOIN	department	USING(DepartmentID)
        GROUP BY DepartmentID)
SELECT *
FROM	Question4
WHERE	SLNV = (SELECT MAX(SLNV)
				FROM	Question4);

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo.

DROP VIEW IF EXISTS Question5;
CREATE VIEW Question5 AS 
		SELECT Username,FullName,COUNT(QuestionID),GROUP_CONCAT(QuestionID)
        FROM `account`
        JOIN question ON question.CreatorID = `account`.AccountID
        GROUP BY Username
        HAVING	FullName LIKE 'Nguyen%';

SELECT *
FROM Question5;

-- CACH 2:

WITH Question5 AS (
		SELECT Username,FullName,COUNT(QuestionID),GROUP_CONCAT(QuestionID)
        FROM `account`
        JOIN question ON question.CreatorID = `account`.AccountID
        GROUP BY Username
        HAVING	FullName LIKE 'Nguyen%')
SELECT *
FROM	Question5;

/*====================================================THE END=============================================================*/

												/*____ASSIGNMENT6____*/
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó.

DROP PROCEDURE IF EXISTS Question1 ;
DELIMITER $$
CREATE PROCEDURE Question1 (IN department_name VARCHAR(100)) 
 BEGIN
 SELECT *
        FROM `Account`
        WHERE DepartmentID = ( SELECT DepartmentID
								FROM department
								WHERE DepartmentName = department_name); 
 END $$
DELIMITER ;

-- Question 2: Tạo store để in ra số lượng account trong mỗi group.

DROP PROCEDURE IF EXISTS Question2;
DELIMITER $$
CREATE PROCEDURE Question2 ()
	BEGIN
		SELECT GroupID,GroupName,COUNT(AccountID),GROUP_CONCAT(AccountID)
        FROM	`GROUP`
        JOIN	groupaccount USING(GroupID)
        GROUP BY GroupID;
	END $$
DELIMITER ;
        
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại.

DROP PROCEDURE IF EXISTS Question3;
DELIMITER $$
CREATE PROCEDURE Question3()
	BEGIN
		SELECT TypeID,TypeName,COUNT(QuestionID),GROUP_CONCAT(QuestionID)
		FROM	question
		JOIN	typequestion USING(TypeID)
		GROUP BY TypeID
        HAVING MONTH(CreateDate) = MONTH(NOW());
	END $$
DELIMITER ;

-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất.

DROP PROCEDURE IF EXISTS Question4;
DELIMITER $$
CREATE PROCEDURE Question4()
	BEGIN
		SELECT TypeID,COUNT(QuestionID),GROUP_CONCAT(QuestionID)
        FROM	question
        GROUP BY TypeID
        HAVING COUNT(QuestionID) = (SELECT MAX(SLQuestion)
									FROM	(SELECT TypeID,COUNT(QuestionID) AS SLQuestion,GROUP_CONCAT(QuestionID)
												FROM	question
												GROUP BY TypeID) AS TAM);
	END $$
DELIMITER ;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question.

/*Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của
người dùng nhập vào*/

DROP PROCEDURE IF EXISTS Question6;
DELIMITER $$
CREATE PROCEDURE Question6 (IN Chuoi_NDN VARCHAR(100))
	BEGIN
		SELECT 	*,1
        FROM	`GROUP` 
        WHERE	GroupName LIKE CONCAT('%',Chuoi_NDN,'%')
        
        UNION ALL
        
        SELECT 	*,2
        FROM	`Account` 
        WHERE	Username LIKE ('%',Chuoi_NDN,'%');
	END $$
DELIMITER ;
/*Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
trong store sẽ tự động gán
username sẽ giống email nhưng bỏ phần @..mail đi
positionID: sẽ có default là developer
departmentID: sẽ được cho vào 1 phòng chờ
Sau đó in ra kết quả tạo thành công*/

DROP PROCEDURE IF EXISTS Question7;
DELIMITER $$
CREATE PROCEDURE Question7 (IN in_email VARCHAR(50), IN in_fullName NVARCHAR(50))
	BEGIN
		DECLARE username VARCHAR(150) DEFAULT SUBSTRING_INDEX(in_email,'@',1);
-- SELECT SUBSTRING_INDEX("cuongnm@gmail.com.vn", "@", 1);
		DECLARE positionID12 TINYINT UNSIGNED DEFAULT 1;
		DECLARE departmentID123 TINYINT UNSIGNED DEFAULT 10;
set FOREIGN_KEY_CHECKS = 0;
		INSERT INTO `Account` (Email ,Username, FullName , DepartmentID, PositionID)
			VALUE 			(in_email ,username, in_fullName , departmentID123, positionID12);
		SELECT *
		FROM `Account`A
		WHERE A.Username = Username;
	END$$
DELIMITER ;

-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất.

DROP PROCEDURE IF EXISTS Question8;
DELIMITER $$
CREATE PROCEDURE Question8 (IN NguoiDungNhap ENUM('Essay','Multiple-Choice'))
	BEGIN
		SELECT TypeID,TypeName,CONTENT,LENGTH(Content)
        FROM	Question
        JOIN	Typequestion USING(TypeID)
        GROUP BY TypeID
        HAVING 	LENGTH(Content) = (SELECT MAX(SLKT)
											FROM  (SELECT TypeID,TypeName,LENGTH(Content) AS SLKT
													FROM	Question
													JOIN	Typequestion USING(TypeID)
													GROUP BY TypeID) AS TAM);
	END$$
DELIMITER ;

-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID.

DROP PROCEDURE IF EXISTS Question9;
DELIMITER $$
CREATE PROCEDURE Question9 (IN NDN TINYINT UNSIGNED)
	BEGIN
		DELETE
        FROM	exam
        WHERE	ExamID = NDN;
	END$$
DELIMITER ;
		
        SELECT * FROM EXAM;
/*Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
dụng store ở câu 9 để xóa), sau đó in số lượng record đã remove từ các table liên quan
trong khi removing.*/

DROP PROCEDURE IF EXISTS Question10;
DELIMITER $$
CREATE PROCEDURE Question10()
	BEGIN
		SET foreign_key_checks = '0';
        DELETE
        FROM 	Exam
        WHERE	(YEAR(NOW()) - YEAR(CreateDate)) > 3;
	END$$
DELIMITER ;
 
/*Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng
ban default là phòng ban chờ việc.*/

DROP PROCEDURE IF EXISTS Question11;
DELIMITER $$
CREATE PROCEDURE Question11 (IN NguoiDungNhap NVARCHAR(30))
	BEGIN
		UPDATE `account`
			SET 
				DepartmentID = 10
			WHERE
				DepartmentID = (SELECT DepartmentID
								FROM  Department
                                WHERE DepartmentName = NguoiDungNhap);
              
        DELETE 
        FROM 	Department
        WHERE 	DepartmentName = NguoiDungNhap;
	END$$
DELIMITER ;

SELECT * FROM `account` JOIN Department USING(DepartmentID);

-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay.

DROP PROCEDURE IF EXISTS Question12;
DELIMITER $$
CREATE PROCEDURE Question12()
	BEGIN
		SELECT *,COUNT(QuestionID)
        FROM  Question
        GROUP BY MONTH(CreateDate)
        HAVING month(CreateDate) = month(YEAR(NOW()) - YEAR(CreateDate)) < 1;
	END$$
DELIMITER ;

/*Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
tháng gần đây nhất (nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào
trong tháng").*/

DROP PROCEDURE IF EXISTS Question13;
DELIMITER $$
CREATE PROCEDURE Question13()
	BEGIN
		SELECT *,COUNT(QuestionID)
        FROM  Question
        GROUP BY MONTH(CreateDate)
        HAVING (MONTH(NOW()) - MONTH(CreateDate)) < 6;
	END$$
DELIMITER ;
        
/*=======================================================THE END================================================================*/
												
                                                  /*____ASSIGNMENT7____*/

-- Question 1: Tạo trigger không cho phép người dùng nhập vào Group có ngày tạo trước 1 năm trước.
DROP TRIGGER IF EXISTS Question1;
DELIMITER $$
CREATE TRIGGER Question1
BEFORE INSERT ON `Group`
FOR EACH ROW
	BEGIN
		IF (DATEDIFF(CURDATE(),NEW.`CreateDate`) > 365) THEN 
			SIGNAL SQLSTATE '12345'	
            SET MESSAGE_TEXT = 'loi ngay thang';
		END IF;
	END $$
DELIMITER ;
INSERT INTO `Group` VALUE (20, 'Huy Dep Trai', 2, '2018-05-11');

/*Question 2: Tạo trigger Không cho phép người dùng thêm bất kỳ user nào vào
department "Sale" nữa, khi thêm thì hiện ra thông báo "Department "Sale" cannot add
more user".*/
DROP TRIGGER IF EXISTS Question2;
DELIMITER $$
CREATE TRIGGER Question2
AFTER INSERT ON `account`
FOR EACH ROW
	BEGIN
		IF (SELECT NEW.`Username`
			FROM `account`
			WHERE departmentID = (SELECT departmentID
								FROM department
								WHERE departmentName = 'sale')) THEN 
			SIGNAL SQLSTATE '11000'
            SET MESSAGE_TEXT = 'Department "Sale" cannot add more user';
		END IF;
	END $$
DELIMITER ;
INSERT INTO `account` (Email,	Username,	FullName,	DepartmentID, PositionID,CreateDate)
VALUE				  ('huybeo@gmail', 'huybeo', 'bui van huy', '2',' 3', '2020-01-29');

-- Question 3: Cấu hình 1 group có nhiều nhất là 5 user.
DROP TRIGGER IF EXISTS Question7;
DELIMITER $$
CREATE TRIGGER Question7
BEFORE INSERT ON `GroupAccount`
FOR EACH ROW
	BEGIN
		IF (new.GroupID in (SELECT GroupID
					FROM GroupAccount
					GROUP BY GroupID
					HAVING Count(AccountID) > 5))
		THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'Một group có nhiều nhất 5 User';
		END IF;
	END $$
DELIMITER ;
SELECT *
FROM GroupAccount;
INSERT INTO `GroupAccount` ( GroupID , AccountID , JoinDate )
VALUE ( 1 , 3 ,'2020-03-05');

-- Question 4: Cấu hình 1 bài thi có nhiều nhất là 10 Question
DROP TRIGGER IF EXISTS Question4;
DELIMITER $$
CREATE TRIGGER Question4
BEFORE INSERT ON `examquestion`
FOR EACH ROW
	BEGIN
		IF NEW.ExamID IN (SELECT ExamID
							FROM examquestion
                            GROUP BY ExamID
                            HAVING COUNT(QuestionID) > 10)  
		THEN
				SIGNAL SQLSTATE '15000'
                SET MESSAGE_TEXT = 'Loi cau Hoi De Thi';
		END IF;
	END $$
DELIMITER ;

/*Question 5: Tạo trigger không cho phép người dùng xóa tài khoản có email là
admin@gmail.com (đây là tài khoản admin, không cho phép user xóa), còn lại các tài
khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó.*/
DROP TRIGGER IF EXISTS before_accounts_delete;
DELIMITER $$
CREATE TRIGGER before_accounts_delete
BEFORE DELETE ON `account`
FOR EACH ROW
BEGIN
DECLARE v_account_id TINYINT;
SELECT AccountID INTO v_account_id
FROM account
WHERE Email = OLD.Email;
IF OLD.Email = 'admin@gmail.com' THEN
SIGNAL SQLSTATE '12345'
SET MESSAGE_TEXT = 'This is Admin account, you can not delete!';
ELSE
DELETE FROM groupaccount WHERE AccountID = v_account_id;
UPDATE `group` SET CreatorID = NULL WHERE CreatorID = v_account_id;
UPDATE exam SET CreatorID = NULL WHERE CreatorID = v_account_id;
UPDATE question SET CreatorID = NULL WHERE CreatorID = v_account_id;
END IF;
END$$
DELIMITER ;
SET foreign_key_checks = 0;
SET GLOBAL log_bin_trust_function_creators = 1;
DELETE FROM account
WHERE Email = 'haidang29productions@gmail.com';
SELECT * FROM account;
/*Question 6: Không sử dụng cấu hình default cho field DepartmentID của table
Account, hãy tạo trigger cho phép người dùng khi tạo account không điền vào
departmentID thì sẽ được phân vào phòng ban "waiting Department".*/

DROP TRIGGER IF EXISTS Question6;
DELIMITER $$
CREATE TRIGGER Question6
BEFORE INSERT ON `Account`
FOR EACH ROW
	BEGIN
		IF NEW.`DepartmentID` IS NULL THEN 
        INSERT INTO `Account`(AccountID,Email, Username,FullName,DepartmentID,PositionID,CreateDate)
        VALUES				(accountID ,Email, USERNAME,FULLNAME,'waiting Department',POSITIONID,CREATEDATE);
		END IF;
	END $$
DELIMITER ;

SET foreign_key_checks = 0;
SET GLOBAL log_bin_trust_function_creators = 1;
INSERT INTO `account` (Email,   Username,  FullName,  PositionID,Createdate)
VALUE				 ('huybeo@..',  'huybui',     'bui van huy',    2,'2020-12-29');

SELECT * FROM account;

/*Question 7: Cấu hình 1 bài thi chỉ cho phép user tạo tối đa 4 answers cho mỗi
question, trong đó có tối đa 2 đáp án đúng.*/

DROP TRIGGER IF EXISTS Question7;
DELIMITER $$ 
CREATE TRIGGER Question7
BEFORE INSERT ON `answer`
FOR EACH ROW
	BEGIN
		IF NEW.QuestionID IN (SELECT QuestionID
							FROM 	answer
							GROUP BY QuestionID
                            HAVING COUNT(Answers) >= 4 
                            
                            
                            

/*Question 8: Viết trigger sửa lại dữ liệu cho đúng: nếu người dùng nhập vào gender
của account là nam, nữ, chưa xác định thì sẽ đổi lại thành M, F, U cho giống với cấu
hình ở database.*/
DROP TRIGGER IF EXISTS Question8;
DELIMITER $$
CREATE TRIGGER Question8
BEFORE INSERT ON `Account`
FOR EACH ROW
	BEGIN
		IF NEW.Gender = 'Nam' THEN
			SET NEW.Gender = 'M';
			ELSEIF NEW.Gender = 'Nu' THEN
			SET NEW.Gender = 'F';
			ELSEIF NEW.Gender = 'Chưa xác định' THEN
			SET NEW.Gender = 'U';
		END IF ;
	END $$
DELIMITER ;
INSERT INTO `Account`(Email , Username , FullName ,Gender , DepartmentID , PositionID, CreateDate)
VALUE ('haidang29productions@gmail.com1' , 'dangblack1' ,'Nguyen Hai Dang' ,'Nu' , '5' , '1' ,'2020-03-05');
select * from `Account`;
-- Question 9: Viết trigger không cho phép người dùng xóa bài thi mới tạo được 2 ngày.
DROP TRIGGER IF EXISTS Question9;
DELIMITER $$
CREATE TRIGGER Question9
BEFORE 
/*Question 10: Viết trigger chỉ cho phép người dùng chỉ được update, delete các
question khi question đó chưa nằm trong exam nào.*/

DROP TRIGGER IF EXISTS Question10;
DELIMITER $$
CREATE TRIGGER Question10
AFTER 

/*Question 12: Lấy ra thông tin exam trong đó
Duration <= 30 thì sẽ đổi thành giá trị "Short time"
30 < duration <= 60 thì sẽ đổi thành giá trị "Medium time"
duration >60 thì sẽ đổi thành giá trị "Long time".*/

SELECT ExamID,Title,`Code`,Duration,
	CASE 	WHEN Duration <= 30 THEN "Short time" 
            WHEN Duration > 30 and Duration <= 60 THEN "Medium time"
            WHEN Duration > 60 THEN "Long time"             
	END AS Duration
FROM exam;

/*Question 13: Thống kê số account trong mỗi group và in ra thêm 1 column nữa có tên
là the_number_user_amount và mang giá trị được quy định như sau:
Nếu số lượng user trong group =< 5 thì sẽ có giá trị là few
Nếu số lượng user trong group <= 20 và > 5 thì sẽ có giá trị là normal
Nếu số lượng user trong group > 20 thì sẽ có giá trị là higher.*/

SELECT GroupID,AccountID,COUNT(AccountID),
	CASE	WHEN COUNT(AccountID) <= 5 THEN 'FEW'
			WHEN COUNT(AccountID) > 5 AND COUNT(AccountID) <= 20 THEN 'normal'
            WHEN COUNT(AccountID) > 20 THEN 'higher'
	END AS the_number_user_amount
FROM groupaccount
GROUP BY GroupID;

