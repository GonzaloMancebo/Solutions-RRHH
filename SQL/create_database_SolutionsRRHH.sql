DROP database IF exists SolutionsRRHH;
create database SolutionsRRHH;
USE SolutionsRRHH;

CREATE table EMPLOYEE (
employee_id INT NOT NULL auto_increment,
employee_name VARCHAR (12),
employee_surname VARCHAR (22),
employee_email VARCHAR(254),
employee_phone VARCHAR (20),
employee_dni VARCHAR (20),
date_of_birthday DATE,
PRIMARY KEY (employee_id)
)COMMENT 'BASIC EMPLOYEE INFORMATION';

CREATE table ASSISTANCE (
id_assistance INT NOT NULL auto_increment,
date_assistance datetime,
check_in_time datetime,
check_out_time datetime,
type_assistance varchar (2),
employee_id INT,
PRIMARY KEY (id_assistance)
)COMMENT 'ASSITANCE';

CREATE table DEPARTMENT (
id_department INT NOT NULL auto_increment,
name_department varchar (60),
PRIMARY KEY (id_department)
)COMMENT 'DEPARTMENT';

CREATE table POSITION (
id_position INT NOT NULL auto_increment,
name_position varchar (60),
description_position varchar (60),
id_department INT,
PRIMARY KEY (id_position)
)COMMENT 'POSITION';

CREATE table WORKRECORD (
id_record INT NOT NULL auto_increment,
start_date datetime,
finish_date datetime,
employee_id INT,
id_position INT,
PRIMARY KEY (id_record)
)COMMENT 'WORK HISTORY';

CREATE table TRAINING (
id_training INT NOT NULL auto_increment,
name_training VARCHAR (50),
description_training  VARCHAR (100),
start_date_training datetime,
finish_date_training datetime,
employee_id INT,
PRIMARY KEY (id_training)
)COMMENT 'TRAINING HISTORY';


-- ALTER

ALTER TABLE ASSISTANCE
    ADD CONSTRAINT FK_Assistance_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);

ALTER TABLE WORKRECORD
    ADD CONSTRAINT FK_WorkRecord_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


ALTER TABLE WORKRECORD
    ADD CONSTRAINT FK_WorkRecord_Position
    FOREIGN KEY (id_position) REFERENCES POSITION (id_position);


ALTER TABLE POSITION
    ADD CONSTRAINT FK_Position_Department
    FOREIGN KEY (id_department) REFERENCES DEPARTMENT(id_department);


ALTER TABLE TRAINING
    ADD CONSTRAINT FK_Training_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);
 
 
