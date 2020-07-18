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
    ModifiedDate	DATETIME DEFAULT NOW()
);

CREATE TABLE trainee2
(
	ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Birthdate		DATE,
    `name`			VARCHAR(30),
    Gendr			ENUM('0','1') NULL,
    IsDeletedFlag	ENUM('0','1')
    );

-- Question 1: Thêm ít nhất 10 bản ghi vào table

INSERT INTO trainee (traineeID, Full_name, birth_date, gender, ET_IQ, ET_gmath, ET_English, trainee_class, evaluation_notes, VTI_account)
VALUE				('01','Bui Van Huy','25-01-1997','M','20','18','19','CNTT','tot','huyvtia@...'),
					('02','Bui Quang Tung','23-01-1997','M','17','12','16','CNTT','kha','tungvtia@..'),
                    ('03','Pham Huyen Trang','23-02-1997','F','16','18','15','CNTT','Tot','trangvtia@...'),
                    ('04','Nguyen Manh Cuong','16-05-1997','M','13','11','9','CNTT','can co gang','cuongvtia@...'),
                    ('05','Tran Manh Hung','25-06-1996','M','15','14','14','CNTT','can co gang','hungvtia@...'),
                    ('06','Nguyen Mai Phuong','16-03-1997','F','18','15','10','CNTT','can cai thien English','phuongvtia@...'),
                    ('07','Bui Thi Nga','09-11-1997','F','13','16','7','CNTT','can co gang','ngavtia@...'),
                    ('08','Nguyen Phuong Thuy','09-12-1998','F','15','10','17','CNTT','kha','thyvtia@...'),
                    ('09','Le Thi GIang','23-01-1997','F','15','15','15','CNTT','kha','giangvtia@...'),
                    ('10','Tran Van Tuan','12-06-1997','M','14','17','18','CNTT','tot','tuanvtia@..');
                          
-- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,nhóm chúng thành các tháng sinh khác nhau

SELECT 	Full_Name,birth_date
FROM	trainee
GROUP BY birth_date;

/* Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)*/

SELECT 	MAX(LENGTH(Full_Name))
FROM	trainee;

SELECT 	*
FROM	trainee
WHERE	LENGTH(Full_Name) = (SELECT 	MAX(LENGTH(Full_Name))
								FROM	trainee);


/*Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:

 ET_IQ + ET_Gmath>=20
 ET_IQ>=8
 ET_Gmath>=8
 ET_English>=18_____________*/


SELECT 	Full_Name AS ET 
FROM	trainee
WHERE	(ET_IQ + ET_Gmath) >=20
		AND ET_IQ >= 8
		AND ET_Gmath>=8
		AND ET_English>=18;

-- Question 5: xóa thực tập sinh có TraineeID = 3.

DELETE FROM	trainee
WHERE		TraineeID = 3;

-- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". 
-- Hãy cập nhật thông tin vào database

UPDATE	trainee
	SET
		trainee_class = '2'
	WHERE
		TraineeID = 5;

/*=======================================================THE AND======================================================================*/
											
												  /* ExtraAssignment 4 */
-- Exercise 1:
-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu.
CREATE DATABASE NhanVien;
USE NhanVien;

DROP TABLE IF EXISTS  Department,Employee,EmployeeSkill;
CREATE TABLE Department
(
	DepartmentID	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName	NVARCHAR(50)
    );
    
CREATE TABLE Employee
(
	EmployeeID		INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeName	NVARCHAR(50),
    DepartmentID	INT UNSIGNED,
FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID) ON DELETE CASCADE
);

CREATE TABLE EmployeeSkill
(
	EmployeeID		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Skill_ID		CHAR(15) NOT NULL,
    DateRegistered	DATE
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table.


INSERT INTO `Department`(DepartmentName)
VALUE							(N'Sale'		),
								(N'Bảo vệ'		),
								(N'Nhân sự'		),
								(N'Kỹ thuật'	),
								(N'Tài chính'	),
								(N'Phó giám đốc'),
								(N'Giám đốc'	),
								(N'Thư kí'		),
								(N'Bán hàng'	);
    
INSERT INTO `Employee`	(EmployeeName, DepartmentID)
VALUE					(N'Bùi Văn Huy', 		1),
						(N'Bùi Phương Cường',	5),
                        (N'Bùi Ngọc Hà',		2),
                        (N'Nguyễn Mạnh Hùng',	3),
                        (N'Nguyễn Mai Phương',	9),
                        (N'Lê Thị Giang',		4),
                        (N'Bùi Thị Ngà',		7),
                        (N'Nguyễn Phương Thúy',	6),
                        (N'Bùi Quang Tùng',		6),
                        (N'Trần Văn Tuấn',		8);

INSERT INTO `EmployeeSkill`	(Skill_ID,DateRegistered)
VALUE 								('Java',	'2018-03-29'),
									('ASP.NET',	'2015-06-23'),
									('ADO.NET',	'2015-12-12'),
									('SQL',		'2018-09-15'),
									('Postman',	'2017-10-17'),
									('Ruby',	'2019-01-23'),
									('Python',	'2014-07-28'),
									('C++',		'2016-05-12'),
									('C Sharp',	'2016-05-25'),
									('PHP',		'2018-09-14');
							

-- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java.













