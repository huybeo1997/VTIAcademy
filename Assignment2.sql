DROP DATABASE IF EXISTS thuc_tap; 
CREATE DATABASE IF NOT EXISTS thuc_tap; 
USE thuc_tap;

CREATE TABLE IF NOT EXISTS khoa
(
	khoa_ID 		CHAR(10) NOT NULL PRIMARY KEY,
    Tenkhoa 		CHAR(30) NOT NULL,
    Dienthoai 		CHAR(10) NULL UNIQUE KEY
);

CREATE TABLE GiangVien
(
	ID_Gv 		INT NOT NULL PRIMARY KEY,
    name_Gv		CHAR(30) NOT NULL,
    Luong		DECIMAL(5,2) NOT NULL,
	Khoa_ID		CHAR(10) NOT NULL,
FOREIGN KEY ( Khoa_ID ) REFERENCES Khoa ( Khoa_ID ) ON DELETE CASCADE
);
DROP TABLE IF EXISTS SinhVien;
CREATE TABLE IF NOT EXISTS SinhVien
(
	ID_Sv		INT NOT NULL PRIMARY KEY,
    Name_Sv		CHAR(30) NOT NULL,
    Khoa_ID		CHAR(10) NOT NULL,
    NamSinh		INT(4) NULL,
    QueQuan		CHAR(30) NULL,
FOREIGN KEY ( Khoa_ID ) REFERENCES Khoa ( Khoa_ID ) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS DeTai
(
	DeTai_ID		CHAR(10) NOT NULL PRIMARY KEY,
    Name_Dt			CHAR(30) NOT NULL,
    KinhPhi			INT NULL,
    NoiThucTap		CHAR(30)
);

CREATE TABLE IF NOT EXISTS HuongDan
(
	ID_Sv		INT NOT NULL PRIMARY KEY,
    DeTai_ID	CHAR(10) NOT NULL,
    ID_Gv		INT NOT NULL,
    KetQua		DECIMAL(5,2),
FOREIGN KEY ( DeTai_ID ) REFERENCES DeTai ( DeTai_ID ) ON DELETE CASCADE,
FOREIGN KEY ( ID_Gv ) REFERENCES GiangVien ( ID_Gv ) ON DELETE CASCADE
);

INSERT INTO `Khoa` VALUES 	( Khoa_ID, TenKhoa, DienThoai ),
							( '01_T', 'Toan' ,'0150550258' ),
                            ( '02_V', 'Van', '012548796'),
                            ( '03_H', 'Hoa', '412548687'),
                            ( '04_S', 'Sinh', '4582145368'),
                            ( '05_T', 'Triet', '5214789258'),
                            ( '06_D', 'Dia', '5214759857'),
                            ( '07_L', 'Ly', '5852452566'),
                            ( '08_TD', 'GDTC', '2514569875'),
                            ( '09_A', 'QLTN', '0123585247'),
                            ( '10_CD', 'Tieng_Trung', '0123589574'),
							( '11_QP', 'GDQP', '0123587459'),
                            ( '12_TA', 'Tieng Anh', '0124789584');

INSERT INTO `GiangVien` VALUE 	( '01', 'Bui Van Huy', '125.23', '01_T'),
								( '02', 'Pham Huyen Trang', '251.12', '01_T'),
								( '03', 'Bui Quang Tung', '765.22', '01_T'),
                                ( '04', 'Nguyen Manh Hung', '123.55', '01_T'),
                                ( '05', 'Nuyen Thi Trang', '879.09', '01_T'),
								( '06', 'Nguyen Manh Cuong', '987.00', '01_T'),
                                ( '07', 'Bui Quang Chien', '414.44', '01_T'),
                                ( '08', 'Pham Thi Hoa', '125.00', '01_T'),
                                ( '09', 'Phan Dinh Ha', '452.23', '02_V'),
                                ( '10', 'Tran Van Tuan', '452.23', '02_V'),
                                ( '11', 'Nguyen Manh Tung', '452.23', '02_V'),
                                ( '12', 'Bui Manh Cuong', '452.23', '02_V'),
                                ( '13', 'Nguyen Trung Anh', '452.23', '02_V'),
                                ( '14', 'Phan Viet Anh', '452.23', '02_V'),
                                ( '15', 'Pham Thi Chuc', '524.14', '03_H'),
                                ( '16', 'Bui Van Manh', '524.14', '03_H'),
                                ( '17', 'Bui Kim Chi', '524.14', '03_H'),
                                ( '18', 'Tran Quoc Tuan', '524.14', '03_H'),
                                ( '19', 'Bui Phuong Cuong', '524.14', '03_H'),
                                ( '20', 'Tran Quang Chien', '414.22', '04_S'),
                                ( '21', 'Nguyen Ngoc Khoa', '414.22', '04_S'),
                                ( '22', 'Pham Quang Huy', '251.22', '05_T' ),
                                ( '23', 'Bui Thi Trang', '547.25', '06_D' ),
                                ( '24', 'Nguyen Manh Tung', '547.25', '06_D' ),
                                ( '25', 'Bui Quang huan', '547.25', '06_D' ),
                                ( '26', 'Nguyen Hoai Thu', '874.01', '07_L' ),
                                ( '27', 'Vuong Sy Khai', '874.01', '07_L' ),
                                ( '28', 'Pham Quang Manh', '451.00', '08_TD' ),
                                ( '29', 'Pham Quang Chinh', '124.54', '09_A' ),
                                ( '30', 'Le Tien Nam',  '124.54', '09_A' ),
                                ( '31', 'Le Tien Cuong', '124.54', '09_A' ),
                                ( '32', 'Nguyen Quoc Viet', '201.78', '10_CD' ),
                                ( '33', 'Nguyen Ngoc Tuan',  '201.78', '10_CD' ),
                                ( '34', 'Vuong Van Cuong', '854.45', '11_QP' ),
                                ( '35', 'Nguyen Thi Trang', '541.21', '12_TA' );


INSERT INTO `sinhvien` VALUE	('01', 'Bui Manh Cuong',	'01_T', 	1997, 	'Ha Noi' ),
								('02', 'Bui Phuong Cuong',	'01_T', 	1997, 	'Ha Noi' ),
                                ('03', 'Nguyen Tien Cuong', '01_T', 	1997,	'Ha Noi' ),
                                ('04', 'Bui Tien Anh',		'01_T', 	1997, 	'Ha Noi' ),
                                ('05', 'Nguyen Lan Anh', 	'01_T', 	1997, 	'Ha Noi' ),
                                ('06', 'Nguyen Thi Lan Anh','01_T', 	1997, 	'Ha Noi' ),
                                ('07', 'PHam Thi Anh', 		'01_T', 	1998, 	'Ha Noi' ),
                                ('08', 'Bui Thi Anh',  		'01_T', 	1998, 	'Ha Noi' ),
                                ('09', 'Bui Quang Anh', 	'01_T', 	1998, 	'Ha Noi' ),
                                ('10', 'Phan Thi Lua', 		'01_T', 	1998, 	'Ha Noi' ),
                                ('11', 'Nguyen Thi Dung', 	'02_V', 	1996, 	'Cao Bang' ),
                                ('12', 'Le Thi Dung', 		'02_V', 	1996,	'Cao Bang' ),
                                ('13', 'Bui Thi Dinh', 		'02_V', 	1996, 	'Cao Bang' ),
                                ('14', 'Bui Thi Hanh', 		'02_V', 	1997, 	'Cao Bang' ),
                                ('15', 'Nguyen Thi Hanh', 	'02_V', 	1996, 	'Cao Bang' ),
                                ('16', 'Pham Hong Hanh', 	'02_V', 	1996, 	'Cao Bang' ),
                                ('17', 'Nguyen Tien Vu', 	'02_V', 	1996, 	'Cao Bang' ),
                                ('18', 'Le Tien Nam', 		'02_V', 	1998, 	'Cao Bang' ),
                                ('19', 'Le Hong Phong', 	'02_V', 	1998, 	'Cao Bang' ),
                                ('20', 'Bui Tien Dung', 	'02_V', 	1998, 	'Cao Bang' ),
                                ('21', 'Le Thi Lan Anh', 	'03_H', 	1998, 	'Ha Nam' ),
                                ('22', 'Pham Nhat Huy', 	'03_H', 	1998, 	'Ha Nam' ),
                                ('23', 'Pham QUang Huy', 	'03_H', 	1998, 	'Ha Nam' ),
                                ('24', 'Pham Tien Trung', 	'03_H', 	1998, 	'Ha Nam' ),
                                ('25', 'Nguyen Viet Xuan', 	'03_H', 	1998, 	'Ha Nam' ),
                                ('26', 'Pham Nhat Nam',  	'03_H', 	1998, 	'Ha Nam' ),
                                ('27', 'Do Lai Thuc',  		'03_H', 	1996, 	'Ha Nam' ),
                                ('28', 'Nguyen Thi Hoa', 	'03_H', 	1996, 	'Ha Nam' ),
                                ('29', 'Le Tien Tai', 		'03_H', 	1996, 	'Ha Nam' ),
                                ('30', 'Le Hong Son', 		'03_H', 	1996, 	'Ha Nam' ),
                                ('31', 'Nguyen Thu Trang', 	'04_S', 	1996, 	'Ha Tinh' ),
                                ('32', 'Nguyen Thi Dao', 	'04_S', 	1996, 	'Ha Tinh' ),
                                ('33', 'Pham Thi Dao',		'04_S', 	1996, 	'Ha Tinh' ),
                                ('34', 'Nguyen Thi Man', 	'04_S', 	1996, 	'Ha Tinh' ),
                                ('35', 'Pham Nhat Huy', 	'04_S', 	1997, 	'Ha Tinh' ),
                                ('36', 'Le Thi Hoa', 		'04_S', 	1997, 	'Ha Tinh' ),
                                ('37', 'Nguyen Van Huan',  	'04_S', 	1997, 	'Ha Tinh' ),
                                ('38', 'Do Van Long',  		'04_S', 	1997, 	'Ha Tinh' ),
                                ('39', 'Nguyen Tien Long', 	'04_S', 	1997, 	'Ha Tinh' ),
                                ('40', 'Pham Nhat Long', 	'04_S', 	1997, 	'Ha Tinh' ),
                                ('41', 'Pham Trung Hieu', 	'05_T', 	1998, 	'Nghe An' ),
                                ('42', 'Do Van Tung',		'05_T', 	1998, 	'Nghe An' ),
                                ('43', 'Do Thi Trang', 		'05_T', 	1998, 	'Nghe An' ),
                                ('44', 'Do Quang Manh', 	'05_T', 	1998, 	'Nghe An' ),
                                ('45', 'Tran Thu Hoai', 	'05_T', 	1998, 	'Nghe An' ),
                                ('46', 'Tran Hoai Thu', 	'05_T', 	1997, 	'Nghe An' ),
                                ('47', 'Le Thi Tien', 		'05_T', 	1997, 	'Nghe An' ),
                                ('48', 'Tran Quoc Tuan', 	'05_T', 	1997, 	'Nghe An' ),
                                ('49', 'Pham Quang Huy', 	'06_D', 	1997, 	'Hai Phong' ),
                                ('50', 'Nguyen Dinh Long', 	'06_D', 	1997, 	'Hai Phong' ),
                                ('51', 'Nguyen Dinh Phong', '06_D', 	1996, 	'Hai Phong' ),
                                ('52', 'Nguyen Tan Tuan', 	'06_D', 	1996, 	'Hai Phong' ),
                                ('53', 'Nguyen Tuan Thang', '06_D', 	1996, 	'Hai Phong' ),
                                ('54', 'Tran Thi Nga', 		'06_D', 	1996, 	'Hai Phong' ),
                                ('55', 'Nguyen Thi Thu Nga','06_D', 	1996, 	'Hai Phong' ),
                                ('56', 'Bui Thi Nga', 		'06_D', 	1996, 	'Hai Phong' ),
                                ('57', 'Nguyen Quang Toi', 	'06_D', 	1996, 	'Hai Phong' ),
                                ('58', 'Bui Manh Dung', 	'07_L', 	1996, 	'Hai Duong' ),
                                ('59', 'Pham Nhat Long', 	'07_L', 	1996, 	'Hai Duong' ),
                                ('60', 'Pham Huy Nhat', 	'07_L', 	1997, 	'Hai Duong' ),
                                ('61', 'Vuong Thi Thoa',  	'07_L', 	1997, 	'Hai Duong' ),
                                ('62', 'Vuong Dac Khai', 	'07_L', 	1997, 	'Hai Duong' ),
								('63', 'Nguyen Dinh Thi', 	'07_L', 	1997, 	'Hai Duong' ),
                                ('64', 'Nguyen Thanh Nam', 	'08_TD',	1997, 	'Thanh Hoa' ),
                                ('65', 'Pham Nhat Nam', 	'08_TD',	1997, 	'Thanh Hoa' ),
                                ('66', 'Pham Nhat Duat', 	'08_TD',	1997, 	'Thanh Hoa' ),
                                ('101', 'Bui Tien Nam', 		'09_A', 	1997, 	'bac Ninh' ),
                                ('67', 'Nguyen Thi Thanh', 	'09_A', 	1996, 	'bac Ninh' ),
                                ('68', 'Pham Quoc Chung', 	'09_A', 	1996, 	'bac Ninh' ),
                                ('69', 'Bui thi Huyen', 	'09_A', 	1996, 	'bac Ninh' ),
                                ('70', 'Vuong Dinh Phuc', 	'09_A', 	1996, 	'bac Ninh' ),
                                ('71', 'Nguyen Dinh Vuong', '09_A', 	1996, 	'bac Ninh' ),
                                ('72', 'Nguyen Thi Mo', 	'09_A', 	1996, 	'bac Ninh' ),
                                ('73', 'Nguyen Thi Nhun', 	'09_A', 	1996, 	'bac Ninh' ),
                                ('74', 'Bui Thi Nhung', 	'10_CD',	1997, 	'Phu Tho' ),
								('75', 'Nguyen Nho An', 	'10_CD',	1997, 	'Phu Tho' ),
                                ('76', 'Nguyen Tien Anh', 	'10_CD',	1997, 	'Phu Tho' ),
                                ('77', 'Nguyen Trung Nhi', 	'10_CD',	1997, 	'Phu Tho' ),
                                ('78', 'Bui Nhat Phong', 	'11_QP',	1997, 	'Thai Binh' ),
                                ('79', 'Nguyen Manh Cuong', '11_QP',	1997, 	'Thai Binh' ),
                                ('80', 'Nguyen Lan Anh', 	'11_QP',	1997, 	'Thai Binh' ),
                                ('81', 'Nguyen Nho An', 	'11_QP',	1997, 	'Thai Binh' ),
                                ('82', 'Bui Tien Dung', 	'11_QP',	1997, 	'Thai Binh' ),
                                ('83', 'Nguyen Ngoc Mai', 	'11_QP',	1997, 	'Thai Binh' ),
                                ('84', 'Bui Thi Mai', 		'11_QP',	1997, 	'Thai Binh' ),
                                ('85', 'Nguyen Thi Mai Phuong', '11_QP',1997, 	'Thai Binh' ),
                                ('86', 'Nguyen Thi Giang', 	'11_QP', 	1997, 	'Thai Binh' ),
                                ('87', 'Le Thi Giang', 		'11_QP', 	1997, 	'Thai Binh' ),
                                ('88', 'Nguyen Phuong Thuy','11_QP', 	1996, 	'Thai Binh' ),
                                ('89', 'Pham Trung nhi', 	'12_TA', 	1996, 	'Nam Dinh' ),
                                ('90', 'Pham Thi Nhi', 		'12_TA', 	1996, 	'Nam Dinh' ),
                                ('91', 'Pham Nhat Anh', 	'12_TA', 	1996, 	'Nam Dinh' ),
                                ('92', 'Bui Manh KHoa', 	'12_TA', 	1996, 	'Nam Dinh' ),
                                ('93', 'Nguyen Dang Khoa', 	'12_TA', 	1996, 	'Nam Dinh' ),
                                ('94', 'Pham Thi Ngoan', 	'12_TA', 	1996, 	'Nam Dinh' ),
                                ('95', 'Lo Thi Ngoan', 		'12_TA', 	1996, 	'Nam Dinh' ),
                                ('96', 'Do Van Manh', 		'12_TA', 	1996, 	'Nam Dinh' ),
                                ('97', 'Nguyen Thi Nguyet', '12_TA', 	1996, 	'Nam Dinh' ),
                                ('98', 'Nguyen thi Thao', 	'12_TA', 	1996, 	'Nam Dinh' ),
                                ('99', 'Ngo Duc Anh', 		'12_TA', 	1996, 	'Nam Dinh' ),
                                ('100', 'Nguyen Manh Toan', '12_TA', 	1996, 	'Nam Dinh' );
                                
INSERT INTO detai	(DeTai_ID,	 	Name_Dt, 		KinhPhi, 	NoiThucTap)
VALUE 				('01A',			'thiet lap...',	15000000,	'ha noi'),
					('02B',			'Thiet Lap...',	15000000,	'ha noi');
                    
INSERT INTO huongdan			(ID_Sv,		DeTai_ID,		ID_Gv,		KetQua)
VALUE 							('01', 		'01A',			'11', 	 87.25),
								('02',		'01A',			'12', 	 50.25),
                                ('03', 		'01A', 			'35', 	 87.25),
                                ('04', 		'01A',			'24', 	 87.25),
                                ('05', 		'01A', 			'12', 	 87.25),
                                ('06', 		'01A',			'01', 	 87.25),
                                ('07', 		'02B', 			'01', 	 87.25),
                                ('08', 		'02B',  		'02', 	 87.25),
                                ('09', 		'02B', 			'03', 	 50.25),
                                ('10', 		'02B', 			'04', 	 50.25),
                                ('11', 		'02B', 			'09', 	 50.25),
                                ('12', 		'02B', 			'07', 	 67.85),
                                ('13', 		'02B', 			'06', 	 67.85),
                                ('14', 		'02B', 			'05', 	 67.85),
                                ('15', 		'02B', 			'04', 	 67.85),
                                ('16', 		'02B', 			'03', 	 67.85),
                                ('17', 		'02B', 			'02', 	 67.85),
                                ('18', 		'01A', 			'05', 	 88.25),
                                ('19', 		'01A', 			'04', 	 88.25),
                                ('20', 		'01A', 			'06', 	 88.25),
                                ('21', 		'01A', 			'07', 	 88.25),
                                ('22', 		'01A', 			'08', 	 88.25),
                                ('23', 		'01A', 			'32', 	 88.25),
                                ('24', 		'01A', 			'12', 	 88.25),
                                ('25', 		'01A', 			'20', 	 90.05),
                                ('26', 		'02B',  		'22', 	 90.05),
                                ('27', 		'02B',  		'21', 	 90.05),
                                ('28', 		'02B', 			'22', 	 90.05),
                                ('29', 		'02B', 			'23', 	 90.05),
                                ('30', 		'02B', 			'24', 	 90.05),
                                ('31', 		'02B', 			'25', 	 90.05),
                                ('32', 		'02B', 			'26', 	 90.05),
                                ('33', 		'02B',			'27', 	 90.05),
                                ('34', 		'02B', 			'28', 	 92.75),
                                ('35', 		'02B', 			'29', 	 92.75),
                                ('36', 		'02B', 			'30', 	 92.75),
                                ('37', 		'01A',  		'31',    92.75),
                                ('38', 		'01A',  		'31',    92.75),
                                ('39', 		'01A', 			'32',    92.75),
                                ('40', 		'01A', 			'33', 	 92.75),
                                ('41', 		'01A', 			'34', 	 92.75),
                                ('42', 		'01A',			'35', 	 75.85),
                                ('43', 		'01A', 			'23', 	 75.85),
                                ('44', 		'02B', 			'11', 	 75.85),
                                ('45', 		'02B', 			'15', 	 75.85),
                                ('46', 		'02B', 			'18', 	 75.85),
                                ('47', 		'02B', 			'19', 	 75.85),
                                ('48', 		'02B', 			'18', 	 75.85),
                                ('49', 		'02B', 			'17', 	 76.75),
                                ('50', 		'02B', 			'17', 	 76.75),
                                ('51', 		'02B', 			'16', 	 76.75),
                                ('52', 		'02B', 			'12', 	 76.75),
                                ('53', 		'02B', 			'01', 	 76.75),
                                ('54', 		'02B', 			'02', 	 76.75),
                                ('55', 		'02B',			'02', 	 76.75),
                                ('56', 		'02B', 			'03', 	 76.75),
                                ('57', 		'01A', 			'17', 	 76.75),
                                ('58', 		'01A', 			'18', 	 54.05),
                                ('59', 		'01A', 			'19', 	 54.05),
                                ('60', 		'01A', 			'21', 	 54.05),
                                ('61', 		'01A', 		 	'27', 	 54.05),
                                ('62', 		'01A', 			'34', 	 54.05),
								('63', 		'01A', 			'23', 	 54.05),
                                ('64', 		'01A', 			'26',	 54.05),
                                ('65', 		'01A', 			'20',	 54.05),
                                ('66', 		'01A', 			'06',	 54.05),
                                ('101',		'01A', 			'12', 	 54.05),
                                ('67', 		'01A', 			'11', 	 64.75),
                                ('68', 		'01A', 			'14', 	 64.75),
                                ('69', 		'01A', 			'16', 	 64.75),
                                ('70', 		'01A', 			'32', 	 64.75),
                                ('71', 		'02B', 			'21', 	 64.75),
                                ('72', 		'02B', 			'31', 	 64.75),
                                ('73', 		'02B', 			'33', 	 64.75),
                                ('74', 		'02B', 			'28',	 64.75),
								('75', 		'02B', 			'19',	 64.75),
                                ('76', 		'02B', 			'10',	 64.75),
                                ('77', 		'02B', 			'01',	 64.75),
                                ('78', 		'02B', 			'12',	 64.75),
                                ('79', 		'02B', 			'25',	 64.75),
                                ('80', 		'02B',		 	'21',	 99.15),
                                ('81', 		'02B', 			'12',	 99.15),
                                ('82', 		'02B', 			'15',	 99.15),
								('83', 		'01A', 			'25',	 99.15),
								('84', 		'01A', 			'16',	 99.15),
                                ('85', 		'01A', 			'33',	 99.15),
								('86', 		'01A', 			'21', 	 99.15),
								('87', 		'01A', 			'12', 	 99.15),
                                ('88', 		'01A',			'17', 	 69.25),
                                ('89', 		'01A', 			'21', 	 69.25),
                                ('90', 		'01A', 			'27', 	 69.25),
                                ('91', 		'01A', 			'16', 	 69.25),
                                ('92', 		'01A', 			'18', 	 69.25),
                                ('93', 		'01A', 			'21', 	 69.25),
                                ('94', 		'01A', 			'16', 	 69.25),
                                ('95', 		'01A', 			'10', 	 69.25),
                                ('96', 		'01A', 			'21', 	 69.25),
                                ('97', 		'01A', 			'31',    69.25),
                                ('98', 		'01A', 			'30', 	 69.25),
                                ('99', 		'01A', 			'32', 	 69.25),
                                ('100',		'01A', 			'18', 	 69.25);

-- 2. Đưa ra thông tin gồm mã số, họ tênvà tên khoa của tất cả các giảng viên.
SELECT	ID_Gv, name_Gv, Tenkhoa
FROM	giangvien
JOIN	Khoa	USING(khoa_ID);

-- 3. Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’.

SELECT	ID_Gv, name_Gv, Tenkhoa
FROM	giangvien
JOIN	Khoa	USING(khoa_ID)
WHERE	Tenkhoa = 'Dia'

UNION ALL

SELECT	ID_Gv, name_Gv, Tenkhoa
FROM	giangvien
JOIN	Khoa	USING(khoa_ID)
WHERE	Tenkhoa = 'QLTN';

-- 4. Cho biết số sinh viên của khoa ‘TIENG ANH’.

SELECT 	Khoa_ID,TenKhoa,COUNT(ID_Sv),GROUP_CONCAT(ID_Sv)
FROM 	khoa
JOIN	SinhVien USING(Khoa_ID)
GROUP BY khoa_ID
HAVING	Tenkhoa = 'Tieng Anh';

-- 5. Đưa ra danh sách gồm mã số, họ tênvà tuổi của các sinh viên khoa ‘TOAN’.

SELECT 	*,(YEAR(now())-NamSinh) AS Tuổi
FROM	SinhVien
JOIN	Khoa	USING(Khoa_ID)
GROUP BY ID_Sv
HAVING	Tenkhoa = 'Toan';

-- 6. Cho biết số giảng viên của khoa ‘Tieng Anh’.

SELECT	khoa_ID,Tenkhoa,COUNT(ID_Gv),GROUP_CONCAT(ID_Gv)
FROM	Khoa
JOIN	giangvien	USING(khoa_ID)
GROUP BY khoa_ID
HAVING	Tenkhoa = 'Tieng Anh';

-- 7. Cho biết thông tin về sinh viên không tham gia thực tập.
 SELECT *
 FROM	SinhVien
 LEFT JOIN	HuongDan	USING(ID_Sv)
 GROUP BY ID_Sv
 HAVING KetQua IS NULL;
 
 -- 8. Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa.
 
 SELECT khoa_ID,Tenkhoa,COUNT(ID_Gv),GROUP_CONCAT(ID_Gv)
 FROM	Khoa
 JOIN	GiangVien	USING(Khoa_ID)
 GROUP BY Khoa_ID;
 
 -- 9. Cho biết số điện thoại của khoa mà sinh viên có tên ‘Bui Manh Cuong’ đang theo học

SELECT ID_Sv,Name_Sv,Tenkhoa,Dienthoai
FROM	Khoa
JOIN	SinhVien	USING(Khoa_ID)
WHERE	Name_Sv = 'Bui Manh Cuong';

-- 10. Cho biết mã số và tên của các đề tài do giảng viên ‘Bui Quang Huan’ hướng dẫn

SELECT 	DeTai_ID,Name_Dt,name_Gv
FROM	huongdan
JOIN	giangvien USING(ID_Gv)
JOIN	detai	  USING(DeTai_ID)
WHERE	name_Gv = 'Bui Quang Huan';

-- 11. Cho biết tên đề tài không có sinh viên nào thực tập.

SELECT	DeTai_ID,Name_Dt,ID_Sv
FROM		DeTai
LEFT JOIN	HuongDan	USING(DeTai_ID)
GROUP BY 	DeTai_ID
HAVING		ID_Sv IS NULL;

-- 12. Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên.

SELECT	ID_Gv,name_Gv,Tenkhoa,COUNT(ID_Sv),GROUP_CONCAT(ID_Sv)
FROM	GiangVien
JOIN	HuongDan	USING(ID_Gv)
JOIN	Khoa		USING(Khoa_ID)
GROUP BY ID_Gv
HAVING	COUNT(ID_Sv) > 3;

-- 13. Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất.

SELECT	DeTai_ID,Name_Dt,KinhPhi
FROM	DeTai
WHERE	KinhPhi = (SELECT MAX(KinhPhi)
					FROM  DeTai);

-- 14. Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập.

SELECT	DeTai_ID,Name_Dt,COUNT(ID_Sv),GROUP_CONCAT(ID_Sv)
FROM	detai
JOIN	huongdan	USING(DeTai_ID)
GROUP BY DeTai_ID
HAVING	COUNT(ID_Sv) > 2;

-- 15. Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’.

SELECT ID_Sv,Name_Sv,Khoa_ID,Tenkhoa,KetQua
FROM	sinhvien
JOIN	Khoa		USING(Khoa_ID)
JOIN	HuongDan	USING(ID_Sv)
WHERE	Tenkhoa	= 'Dia'

UNION ALL

SELECT ID_Sv,Name_Sv,Khoa_ID,Tenkhoa,KetQua
FROM	sinhvien
JOIN	Khoa		USING(Khoa_ID)
JOIN	HuongDan	USING(ID_Sv)
WHERE	Tenkhoa	= 'QLTN';

-- 16. Đưa ra tên khoa, số lượng sinh viên của mỗi khoa.

SELECT Tenkhoa,COUNT(ID_Sv),GROUP_CONCAT(ID_Sv)
FROM	Khoa
JOIN	SinhVien	USING(Khoa_ID)
GROUP BY Tenkhoa;

-- 17. Cho biết thông tin về các sinh viên thực tập tại quê nhà.

SELECT	ID_Sv,Name_Sv,Khoa_ID,NamSinh,QueQuan,NoiThucTap
FROM	SinhVien
JOIN	HuongDan	USING(ID_Sv)
JOIN	DeTai		USING(DeTai_ID)
WHERE	QueQuan = NoiThucTap;

-- 18. Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập.

SELECT ID_Sv,Name_Sv,Khoa_ID,NamSinh,QueQuan,KetQua
FROM		SinhVien
LEFT JOIN	HuongDan	USING(ID_Sv)
GROUP BY 	ID_Sv
HAVING		KetQua IS NULL;

-- 19. Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0.

SELECT ID_Sv,Name_Sv,KetQua
FROM		SinhVien
JOIN		HuongDan	USING(ID_Sv)
GROUP BY 	ID_Sv
HAVING		KetQua = 0;

