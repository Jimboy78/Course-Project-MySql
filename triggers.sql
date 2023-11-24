-- Trigger: Actualizar la fecha de devolución al devolver un libro
DELIMITER //
CREATE TRIGGER actualiza_fecha_devolucion
BEFORE UPDATE ON Prestamo
FOR EACH ROW
BEGIN
    IF NEW.Fecha_Devolucion IS NOT NULL THEN
        UPDATE Libro SET Stock = Stock + 1 WHERE ID_Libro = OLD.ID_Libro;
    END IF;
END;
//
DELIMITER ;