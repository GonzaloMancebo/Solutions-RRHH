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

CREATE TABLE PAYROLL (
    id_payroll INT NOT NULL auto_increment,
    employee_id INT,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    deductions DECIMAL(10,2),
    payment_date DATE,
    PRIMARY KEY (id_payroll)
) COMMENT 'EMPLOYEE SALARY INFORMATION';

CREATE TABLE BENEFITS (
    id_benefit INT NOT NULL auto_increment,
    employee_id INT,
    benefit_name VARCHAR(50),
    benefit_description VARCHAR(100),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id_benefit)
) COMMENT 'EMPLOYEE BENEFITS INFORMATION';

CREATE TABLE PROJECTS (
    id_project INT NOT NULL auto_increment,
    name_project VARCHAR(60),
    description_project VARCHAR(100),
    start_date DATE,
    finish_date DATE,
    status_project VARCHAR(20),
    PRIMARY KEY (id_project)
) COMMENT 'PROJECTS INFORMATION';

CREATE TABLE EMPLOYEE_PROJECT (
    id_employee_project INT NOT NULL auto_increment,
    employee_id INT,
    id_project INT,
    role_in_project VARCHAR(50),
    PRIMARY KEY (id_employee_project)
) COMMENT 'RELATION BETWEEN EMPLOYEES AND PROJECTS';

CREATE TABLE LEAVE_REQUESTS (
    id_leave_request INT NOT NULL auto_increment,
    employee_id INT,
    start_date DATE,
    end_date DATE,
    leave_reason VARCHAR(100),
    status_leave_request VARCHAR(20),
    PRIMARY KEY (id_leave_request)
) COMMENT 'EMPLOYEE LEAVE REQUESTS';

CREATE TABLE EVALUATIONS (
    id_evaluation INT NOT NULL auto_increment,
    employee_id INT,
    evaluation_date DATE,
    score DECIMAL(5,2),
    comments VARCHAR(255),
    PRIMARY KEY (id_evaluation)
) COMMENT 'EMPLOYEE PERFORMANCE EVALUATIONS';

CREATE TABLE TASKS (
    id_task INT NOT NULL auto_increment,
    task_name VARCHAR(100),
    task_description VARCHAR(255),
    due_date DATE,
    employee_id INT,
    id_project INT,
    status_task VARCHAR(20),
    PRIMARY KEY (id_task)
) COMMENT 'TASKS ASSIGNED TO EMPLOYEES';

CREATE TABLE CONTRACTS (
    id_contract INT NOT NULL auto_increment,
    employee_id INT,
    start_date DATE,
    end_date DATE,
    contract_type VARCHAR(50),
    salary DECIMAL(10,2),
    PRIMARY KEY (id_contract)
) COMMENT 'EMPLOYEE CONTRACTS';


CREATE TABLE DISCIPLINARY_ACTIONS (
    id_disciplinary_action INT NOT NULL auto_increment,
    employee_id INT,
    action_date DATE,
    action_description VARCHAR(255),
    action_status VARCHAR(50),
    PRIMARY KEY (id_disciplinary_action)
) COMMENT 'EMPLOYEE DISCIPLINARY ACTIONS';



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


ALTER TABLE PAYROLL
    ADD CONSTRAINT FK_Payroll_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


ALTER TABLE BENEFITS
    ADD CONSTRAINT FK_Benefits_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


ALTER TABLE EMPLOYEE_PROJECT
    ADD CONSTRAINT FK_EmployeeProject_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    ADD CONSTRAINT FK_EmployeeProject_Project
    FOREIGN KEY (id_project) REFERENCES PROJECTS(id_project);


ALTER TABLE LEAVE_REQUESTS
    ADD CONSTRAINT FK_LeaveRequests_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


ALTER TABLE EVALUATIONS
    ADD CONSTRAINT FK_Evaluations_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


ALTER TABLE TASKS
    ADD CONSTRAINT FK_Tasks_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id),
    ADD CONSTRAINT FK_Tasks_Project
    FOREIGN KEY (id_project) REFERENCES PROJECTS(id_project);


ALTER TABLE CONTRACTS
    ADD CONSTRAINT FK_Contracts_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


ALTER TABLE DISCIPLINARY_ACTIONS
    ADD CONSTRAINT FK_DisciplinaryActions_Employee
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEE(employee_id);


 
