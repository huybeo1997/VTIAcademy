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

CREATE TABLE IF NOT EXISTS SinhVien
(
	ID_Sv		INT NOT NULL PRIMARY KEY,
    Name_Sv		CHAR(30) NOT NULL,
    Khoa_ID		CHAR(10) NOT NULL,
    NamSinh		TINYINT(4) NULL,
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

INSERT INTO `GiangVien` VALUE 	( '01', 'Bui Van Huy', '125.23', '01_T');
INSERT INTO `GiangVien` VALUE 	( '02', 'Pham Huyen Trang', '251.12', '01_T'),
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
                                
