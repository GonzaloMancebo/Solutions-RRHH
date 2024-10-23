
--ADD VIEW 1

CREATE VIEW vw_EmployeeAssistance AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.employee_surname,
    e.employee_email,
    a.date_assistance,
    a.check_in_time,
    a.check_out_time,
    a.type_assistance
FROM 
    EMPLOYEE e
LEFT JOIN 
    ASSISTANCE a ON e.employee_id = a.employee_id;


--ADD VIEW 2

CREATE VIEW vw_EmployeeTraining AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.employee_surname,
    t.name_training,
    t.description_training,
    t.start_date_training,
    t.finish_date_training
FROM 
    EMPLOYEE e
LEFT JOIN 
    TRAINING t ON e.employee_id = t.employee_id;


--ADD VIEW 3

CREATE VIEW vw_EmployeePayroll AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.employee_surname,
    p.salary,
    p.bonus,
    p.deductions,
    p.payment_date
FROM 
    EMPLOYEE e
LEFT JOIN 
    PAYROLL p ON e.employee_id = p.employee_id;

--ADD VIEW 4

    
    CREATE VIEW vw_EmployeeProjects AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.employee_surname,
    pr.name_project,
    pr.description_project,
    pr.start_date,
    pr.finish_date,
    ep.role_in_project
FROM 
    EMPLOYEE e
LEFT JOIN 
    EMPLOYEE_PROJECT ep ON e.employee_id = ep.employee_id
LEFT JOIN 
    PROJECTS pr ON ep.id_project = pr.id_project;


--ADD VIEW 5

CREATE VIEW vw_EmployeeWorkRecord AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.employee_surname,
    wr.start_date,
    wr.finish_date,
    p.name_position,
    d.name_department
FROM 
    EMPLOYEE e
LEFT JOIN 
    WORKRECORD wr ON e.employee_id = wr.employee_id
LEFT JOIN 
    POSITION p ON wr.id_position = p.id_position
LEFT JOIN 
    DEPARTMENT d ON p.id_department = d.id_department;
