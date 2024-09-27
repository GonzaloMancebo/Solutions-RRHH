DELIMITER //

CREATE FUNCTION fn_GetEmployeeAssistanceCount(emp_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE assistance_count INT;
    
    SELECT COUNT(*) INTO assistance_count
    FROM vw_EmployeeAssistance
    WHERE employee_id = emp_id;
    
    RETURN assistance_count;
END; //

DELIMITER ;



DELIMITER //

CREATE FUNCTION fn_GetEmployeeTrainingHistory(emp_id INT)
RETURNS TEXT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE training_list TEXT DEFAULT '';

    SELECT GROUP_CONCAT(name_training SEPARATOR ', ') INTO training_list
    FROM vw_EmployeeTraining
    WHERE employee_id = emp_id;

    RETURN training_list;
END; //

DELIMITER ;

