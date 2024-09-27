--ADD VIEWS 1
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


--ADD VIEWS 2
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
