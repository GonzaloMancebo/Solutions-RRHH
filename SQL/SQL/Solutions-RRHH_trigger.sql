DELIMITER //

CREATE TRIGGER trg_AssistanceTypeBeforeInsert
BEFORE INSERT ON ASSISTANCE
FOR EACH ROW
BEGIN
    IF NEW.check_in_time IS NOT NULL AND NEW.check_out_time IS NOT NULL THEN
        SET NEW.type_assistance = 'CO';  -- Asistencia completada
    ELSEIF NEW.check_in_time IS NOT NULL AND NEW.check_out_time IS NULL THEN
        SET NEW.type_assistance = 'IN';  
    ELSE
        SET NEW.type_assistance = NULL;  
    END IF;
END //

DELIMITER ;




DELIMITER //

CREATE TRIGGER trg_CalculateNetSalary
BEFORE INSERT ON PAYROLL
FOR EACH ROW
BEGIN
    SET NEW.salary = NEW.salary + IFNULL(NEW.bonus, 0) - IFNULL(NEW.deductions, 0);
    
    
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END //

DELIMITER ;
