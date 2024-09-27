DELIMITER //

CREATE PROCEDURE sp_GetEmployeeDetails(IN emp_id INT)
BEGIN
    SELECT 
        e.employee_id, 
        e.employee_name, 
        e.employee_surname, 
        e.employee_email,
        a.date_assistance,
        a.check_in_time,
        a.check_out_time,
        t.name_training,
        t.start_date_training,
        t.finish_date_training
    FROM 
        EMPLOYEE e
    LEFT JOIN 
        ASSISTANCE a ON e.employee_id = a.employee_id
    LEFT JOIN 
        TRAINING t ON e.employee_id = t.employee_id
    WHERE 
        e.employee_id = emp_id;
END //

DELIMITER ;


DELIMITER //



  
CREATE PROCEDURE sp_AddAssistanceRecord(
    IN emp_id INT, 
    IN date_assistance DATETIME, 
    IN check_in_time DATETIME, 
    IN check_out_time DATETIME, 
    IN type_assistance VARCHAR(2)
)
BEGIN
    INSERT INTO ASSISTANCE (date_assistance, check_in_time, check_out_time, type_assistance, employee_id)
    VALUES (date_assistance, check_in_time, check_out_time, type_assistance, emp_id);
END //

DELIMITER ;

