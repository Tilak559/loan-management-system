CREATE DATABASE LOAN;

USE LOAN;

-- ---------1.LOAN APPLICATION 
CREATE TABLE LOAN_APPLICATION (
  APP_ID INT NOT NULL, 
  APPLIED_LOAN_AMOUNT NUMERIC(10,2), 
  APPROVED_LOAN_AMOUNT NUMERIC(10,2), 
  APP_STATUS VARCHAR(20),
  APPLIED_DATE DATE DEFAULT NULL, 
  APPLIED_YEAR INT,
  EMPLOYER_NAME VARCHAR(30),
  SSN INT,
  PRIMARY KEY (APP_ID)
);
-- ---------2. CUSTOMER DETAILS 
CREATE TABLE CUSTOMER_DETAILS (
CUSTOMER_ID INT,
CUSTOMER_NAME VARCHAR(30),
CUSTOMER_ADDRESS VARCHAR(50),
CUSTOMER_PHONE NUMERIC(10),
APP_ID INT,
PRIMARY KEY (CUSTOMER_ID),
FOREIGN KEY (APP_ID) REFERENCES LOAN_APPLICATION (APP_ID)
);
-- ----------3.LOAN DETAIL
 CREATE TABLE LOAN_DETAIL (
LOAN_ID int NOT NULL,
APP_ID INT,
DISBURSAL_DATE DATE DEFAULT NULL, OCCUPATION VARCHAR(30),
SALARIED CHAR(10), PROCESSING_FEE INT, LOAN_DETAIL_STATUS VARCHAR(10), DISBURSAL_YEAR INT,
PRIMARY KEY (LOAN_ID),
FOREIGN KEY (APP_ID) REFERENCES LOAN_APPLICATION (APP_ID)
);
-- --------4.LENDER DETAIL
CREATE TABLE LENDER_DETAILS (
LENDER_ID VARCHAR(10) NOT NULL, LENDER_NAME varchar(30) DEFAULT NULL, LOAN_TYPE varchar(30) DEFAULT NULL, LOAN_ID INT,
FOREIGN KEY (LOAN_ID) REFERENCES LOAN_DETAIL (LOAN_ID) );
-- -------5.CREDIT REPORT
CREATE TABLE CREDIT_REPORT (
SSN INT NOT NULL,
CREDIT_SCORE INT,
CUSTOMER_ID INT,
EMPLOYER_NAME varchar(30) DEFAULT NULL,

 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER_DETAILS (CUSTOMER_ID)
);
-- --------6.ACCOUNT DETAILS 
CREATE TABLE ACCOUNT_DETAILS (
ACCOUNT_NO NUMERIC(10) NOT NULL, 
BANK_NAME varchar(30) DEFAULT NULL, 
ROUTING_NO NUMERIC (10) DEFAULT NULL, 
CUSTOMER_ID INT ,
PRIMARY KEY (ACCOUNT_NO),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER_DETAILS (CUSTOMER_ID)
);
-- -------7.LOAN HISTORY
CREATE TABLE LOAN_HISTORY (
CUSTOMER_ID INT,
NO_OF_LOANS INT,
IS_ACTIVE VARCHAR(10), OUTSTANDING_AMOUNT NUMERIC(10,2), DEFAULTS VARCHAR(5),
APP_ID INT,
PRIMARY KEY (CUSTOMER_ID),
FOREIGN KEY (APP_ID) REFERENCES LOAN_APPLICATION (APP_ID)
);
-- ------8.PAYMENT INFORMATION 
CREATE TABLE PAYMENT_INFO (

PAYMENT_ID INT NOT NULL,
PAYMENT_DATE DATE DEFAULT NULL,
PAYMENT_AMOUNT NUMERIC(10,2),
PAYMENT_TYPE VARCHAR(10),
LOAN_ID INT,
PRIMARY KEY (PAYMENT_ID),
FOREIGN KEY (LOAN_ID) REFERENCES LOAN_DETAIL (LOAN_ID)
);
-- -------9.EMI DETAILS
CREATE TABLE EMI_DETAILS (
EMI_SERIAL_NO INT ,
TOTAL_AMOUNT NUMERIC(10,2),
DISBURSED_AMOUNT NUMERIC(10,2),
EMI_AMOUNT NUMERIC (10,2) DEFAULT NULL,
PRINCIPAL_AMOUNT NUMERIC (10,2) DEFAULT NULL,
INTEREST_AMOUNT NUMERIC (10,2) DEFAULT NULL,
EMI_CYCLE INT,
TENURE INT,
N_EMIS_PAID INT,
N_EMIS_PENDING INT,
OUTSTANDING_AMOUNT NUMERIC(10,2),
LOAN_ID INT ,
PAYMENT_ID INT,
PRIMARY KEY (EMI_SERIAL_NO, LOAN_ID),
FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT_INFO (PAYMENT_ID), FOREIGN KEY (LOAN_ID) REFERENCES LOAN_DETAIL (LOAN_ID)
);

-- INSERTION
INSERT INTO LOAN_APPLICATION (APP_ID, APPLIED_LOAN_AMOUNT, APPROVED_LOAN_AMOUNT, APP_STATUS, APPLIED_DATE, APPLIED_YEAR, EMPLOYER_NAME, SSN) VALUES
(1, 1000, 900, 'APPROVED', '2020-12-31', 2020, 'ABC', 123456),
(2, 35000, 9000, 'APPROVED', '2020-12-30', 2020, 'AAA', 123457), (3, 2345, 0, 'REJECTED', '2021-01-04', 2021, 'GHE', 123345),
(4, 25000, 23400, 'APPROVED', '2021-01-10', 2021, 'TEL', 213451), (5, 40000, 31050, 'APPROVED', '2021-01-10', 2021, 'TEL', 345122), (6, 12345, 0, 'REJECTED', '2021-01-13', 2021, 'ABC', 453211),
(7, 50000, 46800, 'APPROVED', '2021-01-20', 2021, 'POE', 984567), (8, 80000, 71808, 'APPROVED', '2021-01-31', 2021, 'YRT', 324321), (9, 200000, 140000, 'APPROVED', '2021-02-10', 2021, 'EEE', 874312), (10, 43345, 0, 'REJECTED', '2021-03-12', 2021, 'KGF', 765890),
(11, 30000, 20700, 'APPROVED', '2021-03-31', 2021, 'KGF', 908712), (12, 29000, 4302, 'APPROVED', '2021-04-21', 2021, 'QWE', 990874), (13, 10000, 6714, 'APPROVED', '2021-05-15', 2021, 'POE', 910567);
INSERT INTO LOAN_DETAIL (LOAN_ID , APP_ID , DISBURSAL_DATE , OCCUPATION , SALARIED , PROCESSING_FEE , LOAN_DETAIL_STATUS , DISBURSAL_YEAR ) VALUES
(100, 1, '2021-01-10', 'WHITE COLLAR','YES',5, 'DISBURSED', 2021),
(101, 2, '2021-01-10', 'BLUE COLLAR','YES',3, 'WRITTENOFF', 2021), (102, 4, '2021-01-20', 'WHITE COLLAR','YES',4, 'DISBURSED', 2021), (103, 5, '2021-01-20', 'WHITE COLLAR','NO',5, 'DISBURSED', 2021),
 (104, 7, '2021-01-25', 'BLUE COLLAR','YES',5, 'DISBURSED', 2021), (105, 8, '2021-02-05', 'WHITE COLLAR','NO',3, 'OVERDUE', 2021), (106, 9, '2021-02-25', 'BLUE COLLAR','YES',5, 'OVERDUE', 2021), (107, 11, '2021-04-10', 'WHITE COLLAR','YES',6, 'DISBURSED', 2021), (108, 12, '2021-05-03', 'BLUE COLLAR','NO',5, 'DISBURSED', 2021), (109, 13, '2021-05-30', 'WHITE COLLAR','YES',2, 'CLOSED', 2021);
INSERT INTO CUSTOMER_DETAILS ( CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_ADDRESS, CUSTOMER_PHONE, APP_ID) VALUES
(1000, 'TILAK', 'RAICHUR', '9987654212', 1),
(1001, 'MALEEHA', 'BANGALORE', '9912654234', 2),
(1002, 'VARUN', 'BANGALORE', '9788754278', 3), (1003, 'ARUN', 'RAICHUR', '9987654890', 4),
(1004, 'SANJANA', 'BANGALORE', '9987654212', 5), (1005, 'PRADYOTH', 'RAICHUR', '8799654324', 6), (1006, 'NANDINI', 'NEW YORK', '77884777', 7),
(1007, 'SHAMANTH', 'NEW JERSEY', '9897654200', 8), (1008, 'JEEVAN', 'BANGALORE', '8899654212', 9), (1009, 'KAJOL', 'RAICHUR', '8887654245', 10),
(1010, 'VANKY', 'NEW BEDFORD', '8976654023', 11), (1011, 'ABHIRAM', 'DARTMOUTH', '8947654267', 12), (1012, 'THANAY', 'MYSORE', '9879654233', 13);
INSERT INTO PAYMENT_INFO (PAYMENT_ID , PAYMENT_DATE , PAYMENT_AMOUNT , PAYMENT_TYPE ,LOAN_ID ) VALUES (111,'2021-02-10',1000,'NACH' , 100),
(222,'2021-02-10',1200,'AUTO' , 101), (333,'2021-02-20',1300,'NACH' , 102), (444,'2021-02-20',1500,'AUTO' , 103),
(555,'2021-02-25',2000,'AUTO' , 104), (666,'2021-03-05',2000,'NACH' , 105), (777,'2021-03-25',2300,'AUTO' , 106), (888,'2021-05-10',1000,'AUTO' , 107), (999,'2021-06-03',1000,'NACH' , 108), (112,'2021-06-30',4000,'AUTO' , 109);

 INSERT INTO LOAN_HISTORY (CUSTOMER_ID, NO_OF_LOANS, IS_ACTIVE , OUTSTANDING_AMOUNT , DEFAULTS ,APP_ID ) VALUES
(1000, 2,'YES',200,'NO' , 1),
(1001, 1,'NO', 500,'NO' , 2),
(1003, 1,'YES',800,'NO' , 4), (1004, 2,'YES',200,'NO' , 5), (1006, 3,'YES',300,'NO' , 7), (1007, 2,'NO', 400,'NO' , 8), (1008, 2,'YES',400,'NO' , 9), (1010, 1,'YES',300,'NO' , 11), (1011, 2,'NO', 200,'NO' , 12), (1012, 1,'YES',500,'NO' , 13);
INSERT INTO ACCOUNT_DETAILS (ACCOUNT_NO , BANK_NAME , ROUTING_NO , CUSTOMER_ID ) VALUES
(1223121,'HDFC',389182,1000 ),
(2818291,'HDFC',928092,1001 ),
(2912919,'RBL',663789,1003 ), (3736172,'RBL',338292,1004 ), (1928189,'ICICI',283982,1006 ), (2817281,'ICICI',347392,1007 ), (3829138,'SBI',445602,1008 ), (1728192,'SBI',990232,1010 ), (2839128,'UBIN',092832,1011 ), (2839129,'UBIN',123832,1012 );
INSERT INTO CREDIT_REPORT (SSN, CREDIT_SCORE, CUSTOMER_ID, EMPLOYER_NAME) VALUES
(123456, 700, 1000, 'ABC'),
(123457, 678, 1001, 'AAA'),
(123345, 564, 1002, 'GHE'), (213451, 801, 1003, 'TEL'), (345122, 779, 1004, 'TEL'), (453211, 698, 1005, 'ABC'), (984567, 754, 1006, 'POE'),

 (324321, 670, 1007, 'YRT'), (874312, 710, 1008, 'EEE'), (765890, 734, 1009, 'KGF'), (908712, 808, 1010, 'KGF'), (990874, 678, 1011, 'QWE'), (910567, 789, 1012, 'POE');
INSERT INTO LENDER_DETAILS (LENDER_ID , LENDER_NAME , LOAN_TYPE , LOAN_ID) VALUES
('AB100', 'HDFC', 'PERSONAL' , 100),
('AB100', 'HDFC' ,'GOLD' , 101),
('CD100', 'RBL' , 'STUDENT' , 102), 
('CD100', 'RBL' , 'STUDENT' , 103), 
('EF102', 'ICICI' , 'PERSONAL' , 104), 
('EF102', 'ICICI' , 'HOME' , 105), 
('GH106', 'SBI' , 'MORTGAGE' , 106), 
('GF106', 'SBI', 'HOME' , 107), 
('TH101', 'UBIN', 'STUDENT' , 108), 
('TH101', 'UBIN', 'GOLD' , 109);

INSERT INTO EMI_DETAILS (EMI_SERIAL_NO, TOTAL_AMOUNT, DISBURSED_AMOUNT, EMI_AMOUNT, PRINCIPAL_AMOUNT, INTEREST_AMOUNT, EMI_CYCLE, TENURE, N_EMIS_PAID, N_EMIS_PENDING, OUTSTANDING_AMOUNT, LOAN_ID, PAYMENT_ID) VALUES
(1, NULL, NULL, NULL, 100, 15, 1, 9, 1, NULL, NULL, 100, 111),
(1, NULL, NULL, NULL, 1000, 150, 1, 9, 1, NULL, NULL, 101, 222),
(1, NULL, NULL, NULL, 2340, 200, 5, 10, 1, NULL, NULL, 102, 333),
(1, NULL, NULL, NULL, 3450, 350, 1, 9, 1, NULL, NULL, 103, 444),
(1, NULL, NULL, NULL, 7800, 500, 9, 6, 1, NULL, NULL, 104, 555),
(1, NULL, NULL, NULL, 8976, 700, 10, 8, 1, NULL, NULL, 105, 666),
(1, NULL, NULL, NULL, 10000, 1000, 30,14, 1, NULL, NULL, 106, 777),
(18, NULL, NULL, NULL, 2300, 345, 1, 24, 18, NULL, NULL, 107, 888),
(24, NULL, NULL, NULL, 478, 49, 25, 30, 24, NULL, NULL, 108, 999),
(24, NULL, NULL, NULL, 746, 44, 6, 36, 24, NULL, NULL, 109, 112);

UPDATE EMI_DETAILS SET EMI_AMOUNT = PRINCIPAL_AMOUNT + INTEREST_AMOUNT;
UPDATE EMI_DETAILS SET TOTAL_AMOUNT = EMI_AMOUNT * TENURE; UPDATE EMI_DETAILS SET OUTSTANDING_AMOUNT = TOTAL_AMOUNT - (EMI_AMOUNT * N_EMIS_PAID);
UPDATE EMI_DETAILS SET DISBURSED_AMOUNT = PRINCIPAL_AMOUNT * TENURE;
UPDATE EMI_DETAILS SET N_EMIS_PENDING = TENURE - N_EMIS_PAID;