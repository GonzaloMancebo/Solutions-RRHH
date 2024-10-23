DELIMITER //

CREATE TRIGGER trg_AssistanceTypeUpdate
AFTER INSERT ON ASSISTANCE
FOR EACH ROW
BEGIN
    IF NEW.check_in_time IS NOT NULL AND NEW.check_out_time IS NOT NULL THEN
        UPDATE ASSISTANCE
        SET type_assistance = 'CO'  -- Asistencia completada
        WHERE id_assistance = NEW.id_assistance;
    ELSEIF NEW.check_in_time IS NOT NULL AND NEW.check_out_time IS NULL THEN
        UPDATE ASSISTANCE
        SET type_assistance = 'IN'  -- Solo entrada registrada
        WHERE id_assistance = NEW.id_assistance;
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
