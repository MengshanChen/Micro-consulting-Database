#CPSC 5021 Milestone3
#Team Name: MCAdvising (Micro-Career Advice)
#Team Leader: Erica (Mengshan) Chen
#Team members: Melissa McClure, Nancy (Yue) Zhang
#Team Project: Micro-consulting Database

CREATE TABLE LOCATION(
LOCATION_ID CHAR(5) NOT NULL UNIQUE,
CITY VARCHAR(30) NOT NULL,
STATE VARCHAR(30) NOT NULL,
ZIP CHAR(5) NOT NULL,
PRIMARY KEY (LOCATION_ID)
);

INSERT INTO LOCATION VALUES
('L0001','Seattle','Washington','98121'),
('L0002','Fremont','Washington','98122'),
('L0003','Ballard','Washington','98232'),
('L0004','Los Angeles','California','91335'),
('L0005','Chicago','Illinois','60632'),
('L0006','Boston','Massachusetts','02130'),
('L0007','Detroit','Michigan','48235'),
('L0008','Las Vegas','Nevada','89108'),
('L0009','New York', 'New York City','10025'),
('L0010','Portland','Oregon','97206');

CREATE TABLE USER(
USER_ID CHAR(5) NOT NULL UNIQUE,
L_NAME VARCHAR(15) NOT NULL,
F_NAME VARCHAR(15) NOT NULL,
EMAIL VARCHAR(25) NOT NULL,
PASSWORD VARCHAR(30) NOT NULL,
USER_TYPE VARCHAR(2) NOT NULL,
LOCATION_ID VARCHAR(5) NOT NULL,
PRIMARY KEY (USER_ID),
FOREIGN KEY (LOCATION_ID) REFERENCES LOCATION(LOCATION_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO USER VALUES
('U0001','Hanks','Tom','Hanks@su.edu','123ABC','C1', 'L0001'),
('U0002','Wilson','Rita','Wilson@su.edu','456DEF','C1', 'L0010'),
('U0003','DiCaprio','Leo','DiCaprio@su.edu','789GHI','C1','L0003'),
('U0004', 'Mary', 'Clarke', 'Clarke@se.edu','012JKL','C1','L0002'),
('U0005','Ortiz','Ada', 'Ada@se.edu','MNO345','C1','L0004'),
('U0006','Cruz','Daisy','Daisy@se.edu','PQR678','C1','L0005'),
('U0007','Diaz','Gabe','Gabe@se.edu','STU901','C1','L0001'),
('U0008','Wallace','Jack','Jack@se.edu','VWX234','C1','L0007'),
('U0009','Sullivan','Olive','Olive@se.edu',    'YZA567','C1','L0009'),
('U0010','Ford','Hailey','Hailey@se.edu','BCD890','C1','L0001'),
('U0011','Simmons','Amia','Amia@su.edu','123ABC','C2','L0010'),
('U0012','Flores','Eda','Eda@su.edu','456DEF','C2','L0004'),
('U0013','Howard','Fain','Fain@su.edu','456DEF','C2','L0003'),
('U0014','Reed','Nadia','Nadia@se.edu','789GHI','C2','L0005'),
('U0015','Parker','Noe','Noe@se.edu','012JKL','C2','L0006'),
('U0016','Hill','Tait','Tait@se.edu','MNO345','C2','L0008'),
('U0017','Lewis','Vance','Vance@se.edu','PQR678','C2','L0001'),
('U0018','Clark','Wells','Wells@se.edu','VWX234','C2','L0002'),
('U0019','Martin','Wills','Wills@se.edu','YZA567','C2','L0005'),
('U0020','Jackson','Kacy','Kacy@se.edu','BCD890','C2','L0003');

CREATE TABLE CONSULTEE(
USER_ID CHAR(5) NOT NULL UNIQUE,
STATUS VARCHAR(10) NOT NULL,
PRIMARY KEY (USER_ID),
FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO CONSULTEE VALUES
('U0001','Student'),
('U0002','Employed'),
('U0003','Student'),
('U0004','Retired'),
('U0005','Employed'),
('U0006','Unemployed'),
('U0007','Boss'),
('U0008','Partner'),
('U0009','Employed'),
('U0010','Unemployed');

CREATE TABLE PROGRAM(
PROGRAM_ID CHAR(5) NOT NULL UNIQUE,
DEGREE_EARNED VARCHAR(20) NOT NULL,
FIELD_OF_STUDY VARCHAR(25) NOT NULL,
PRIMARY KEY (PROGRAM_ID)
);

INSERT INTO PROGRAM VALUES
('P0001', 'Bachelorette', 'Business Management'),
('P0002', 'Bachelorette', 'Nursing'),
('P0003', 'Bachelorette', 'Computer Science'),
('P0004', 'Bachelorette', 'Biology'),
('P0005', 'Masters', 'Business Administration'),
('P0006', 'Masters', 'Computer Science'),
('P0007', 'Masters', 'Biology'),
('P0008', 'PHD', 'Computer Science'),
('P0009','PHD', 'Biology'),
('P0010', 'MD', 'Cardiology');

CREATE TABLE SCHOOL(
SCHOOL_CODE CHAR(5) NOT NULL UNIQUE,
SCHOOL_NAME VARCHAR(50) NOT NULL,
PRIMARY KEY (SCHOOL_CODE)
);

INSERT INTO SCHOOL VALUES
('SCH01', 'Seattle University'),
('SCH02', 'University of Washington'),
('SCH03', 'University of Hawaii'),
('SCH04', 'Hawaii Pacific University'),
('SCH05', 'University of Southern California'),
('SCH06', 'Purdue'),
('SCH07', 'Harvard'),
('SCH08', 'University of Michigan'),
('SCH09', 'University of Beijing'),
('SCH10', 'Oxford University');

CREATE TABLE CONSULTANT(
USER_ID CHAR(5) NOT NULL UNIQUE,
YEAR_GRADUATED YEAR NOT NULL,
PROGRAM_ID CHAR(5) NOT NULL,
SCHOOL_CODE CHAR(5) NOT NULL,
PRIMARY KEY (USER_ID),
FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (PROGRAM_ID) REFERENCES PROGRAM(PROGRAM_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SCHOOL_CODE) REFERENCES SCHOOL(SCHOOL_CODE) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO CONSULTANT VALUES ('U0011', '1998', 'P0001', 'SCH04'),
('U0012', '2004', 'P0003', 'SCH05'),
('U0013', '1979', 'P0005', 'SCH01'),
('U0014', '1998', 'P0004', 'SCH01'),
('U0015', '2001', 'P0010', 'SCH10'),
('U0016', '1999', 'P0006', 'SCH02'),
('U0017', '2003', 'P0001', 'SCH03'),
('U0018', '2000', 'P0002', 'SCH10'),
('U0019', '1989', 'P0001', 'SCH08'),
('U0020', '1996', 'P0002', 'SCH09');

CREATE TABLE EXPERIENCE(
EXPERIENCE_ID CHAR(5) NOT NULL UNIQUE,
INDUSTRY VARCHAR(30) NOT NULL,
COMPANY_NAME VARCHAR(40) NOT NULL,
TITLE VARCHAR(25) NOT NULL,
DATE_FROM DATE NOT NULL,
DATE_TO DATE NOT NULL,
USER_ID CHAR(5) NOT NULL,
PRIMARY KEY (EXPERIENCE_ID),
FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO EXPERIENCE VALUES
('Q0001', 'Business', 'Washington Daily', 'Account Manager', '1998-04-01', '2014-08-12', 'U0012'),
('Q0002', 'Marketing', 'Amazon', 'Director of Marketing', '2014-10-11', '2017-10-30', 'U0012'),
('Q0003', 'Engineering', 'IBM', 'Lead Engineer', '2007-06-25', '2010-11-12', 'U0013'),
('Q0004', 'Biology', 'NOAA', 'Lead Biologist','1996-05-11','2012-01-26','U0015'),
('Q0005', 'Business', 'Amazon', 'Operations Specialist', '1997-07-08', '1999-12-13', 'U0018'),
('Q0006', 'Engineering',	'Boeing', 'Assistant Engineer', '2003-08-11', '2007-09-18', 'U0014'),
('Q0007', 'Computer Science', 'Microsoft', 'Database Designer', '2009-01-23', '2016-08-26', 'U0017'),
('Q0008', 'Engineering', 'Google', 'Architect', '2000-02-14', '2004-05-02','U0016'),
('Q0009', 'Human Resources',' Amazon', 'Recruiter', '2002-06-11', '2009-12-22', 'U0019'),
('Q0010', 'Accounting', 'Amazon', 'Auditor', '2007-07-07', '2009-11-30', 'U0011');

CREATE TABLE SERVICE(
SERVICE_CODE CHAR(5) NOT NULL UNIQUE,
PRICE DECIMAL(5,2) NOT NULL,  
LENGTH_OF_TIME TIME NOT NULL,
SERVICE_TYPE VARCHAR(30) NOT NULL,
USER_ID CHAR(5) NOT NULL,
PRIMARY KEY (SERVICE_CODE),
FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO SERVICE VALUES
('S0001', 25.00, '00:30', 'Mock Interview', 'U0012'),
('S0002', 25.00, '00:30', 'Resume Review', 'U0012'),
('S0003', 50.00, '00:45', 'Peer Counseling', 'U0012'),
('S0004', 100.00, '00:30', 'General Counseling', 'U0013'),
('S0005', 80.00,'01:00', 'Mock Interview', 'U0013'),
('S0006', 90.00,'01:00', 'Peer Counseling', 'U0014'),
('S0007', 100.00,'00:45', 'Mock Interview', 'U0014'),
('S0008', 80.00,'01:00', 'Resume Review', 'U0015'),
('S0009', 50.00, '00:45', 'Mock Interview', 'U0015'),
('S0010', 500.00,'01:00', 'General Counseling', 'U0016');

CREATE TABLE ORDERS(
ORDER_ID CHAR(5) NOT NULL UNIQUE,
DATE_OF_ORDER DATE NOT NULL,
TOTALPAYMENT  DECIMAL(5,2) NOT NULL,
PAYMENTTYPE VARCHAR(10)  NOT NULL,
USER_ID CHAR(5) NOT NULL,
PRIMARY KEY (ORDER_ID),
FOREIGN KEY (USER_ID) REFERENCES USER(USER_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ORDERS VALUES
('O0000', '2017-11-10', 75.00, 'VISA', 'U0001'),
('O0001', '2017-11-10', 225.00, 'MASTERCARD', 'U0004'),
('O0002', '2017-11-10', 200.00, 'MASTERCARD', 'U0004'),
('O0003', '2017-11-10', 125.00, 'VISA', 'U0005'),
('O0004', '2017-11-10', 25.00, 'PAYPAL', 'U0005'),
('O0005', '2017-11-10', 25.00, 'MASTERCARD', 'U0006'),
('O0006', '2017-11-10', 100.00, 'PAYPAL', 'U0006'),
('O0007', '2017-11-10', 200.00, 'DISCOVER', 'U0007'),
('O0008', '2017-11-10', 225.00, 'MASTERCARD', 'U0008'),
('O0009', '2017-11-10', 125.00, 'MASTERCARD', 'U0009');

CREATE TABLE ORDER_DETAIL(
ORDER_ID CHAR(5) NOT NULL ,
SERVICE_CODE CHAR(5) NOT NULL ,
QUANTITIY INT NOT NULL,
STAR_RATING INT(5) NOT NULL,
PRIMARY KEY (ORDER_ID, SERVICE_CODE),
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (SERVICE_CODE) REFERENCES SERVICE(SERVICE_CODE) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ORDER_DETAIL VALUES
('O0001','S0001', 1, 3),
('O0002', 'S0002', 2, 4),
('O0003', 'S0001', 1, 3),
('O0004', 'S0004', 2, 0),
('O0004', 'S0005', 2, 1),
('O0005', 'S0005', 2, 1),
('O0006', 'S0010', 2, 1),
('O0007', 'S0006', 2, 3),
('O0008', 'S0006', 2, 3),
('O0009', 'S0007', 2, 0),
('O0009', 'S0009', 2, 0),
('O0009', 'S0010', 2, 5);

# 3
# (1)
# Finds all consultants and returns education details. Ie (year graduated, school name, degree
# earned and field of study).
SELECT USER_ID, YEAR_GRADUATED,SCHOOL_NAME,DEGREE_EARNED,FIELD_OF_STUDY
FROM CONSULTANT 
JOIN SCHOOL USING(SCHOOL_CODE)
JOIN PROGRAM USING(PROGRAM_ID);

# (2) 
# Counts the total number of consultants whose field of study is in compueter science.
SELECT COUNT(DISTINCT USER_ID) 
FROM CONSULTANT 
JOIN PROGRAM USING (PROGRAM_ID) 
WHERE FIELD_OF_STUDY = 'Computer Science';

# (3)
# First query finds the years the consultants graduated.  
# The subquery finds and returns the consultant with 
# the most recent graduation date, limit 1 result.
SELECT USER_ID
FROM EXPERIENCE
JOIN CONSULTANT
USING (user_id)
WHERE YEAR_GRADUATED =
		(SELECT MAX(YEAR_GRADUATED)
         FROM CONSULTANT) LIMIT 1;

# (4)
# Finds the average price of each service. Query only returns the services whose average 
# is greater than or equal to $70, listed in ascending order.
SELECT ROUND(AVG(PRICE), 2) AS AveragePrice, SERVICE_TYPE
FROM SERVICE
GROUP BY SERVICE_TYPE
HAVING AVG(PRICE) >= 70
ORDER BY AveragePrice;

# (5)
# Lists star rating in ascending order with the correlating consultant for each of the orders 
# that have been given a rating. Those that remain null, have been ordered but have not been rated yet.
SELECT ORDERS.USER_ID, ORDERS.ORDER_ID, ORDERS.TOTALPAYMENT, ORDER_DETAIL.SERVICE_CODE, ORDER_DETAIL.STAR_RATING
FROM ORDERS
LEFT JOIN ORDER_DETAIL
ON ORDERS.ORDER_ID = ORDER_DETAIL.ORDER_ID
ORDER BY ORDER_DETAIL.STAR_RATING;


