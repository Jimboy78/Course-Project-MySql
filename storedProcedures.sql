-- Descripción del Procedimiento AlmacenarDevolucion
-- Este procedimiento almacenado registra la devolución de un libro y calcula la multa si es necesario.

-- Script de Creación del Procedimiento AlmacenarDevolucion
CREATE PROCEDURE AlmacenarDevolucion(IN PrestamoID INT)
BEGIN
    DECLARE FechaDevolucionPrevista DATE;
    DECLARE Multa DECIMAL(10, 2);

    -- Obtener la fecha de devolución prevista
    SELECT Fecha_Devolucion INTO FechaDevolucionPrevista FROM Prestamo WHERE ID_Prestamo = PrestamoID;

    -- Actualizar la fecha de devolución
    UPDATE Prestamo SET Fecha_Devolucion = CURDATE() WHERE ID_Prestamo = PrestamoID;

    -- Calcular la multa si la devolución se realiza después de la fecha esperada
    IF FechaDevolucionPrevista IS NOT NULL AND CURDATE() > FechaDevolucionPrevista THEN
        SET Multa = DATEDIFF(CURDATE(), FechaDevolucionPrevista) * 0.50;
        
        -- Puedes almacenar la multa en una tabla de multas si es necesario
        INSERT INTO Multas (ID_Prestamo, Monto) VALUES (PrestamoID, Multa);
        
        -- También puedes imprimir un mensaje o hacer otras acciones según sea necesario
        SELECT CONCAT('Se ha registrado la devolución con una multa de $', Multa) AS Mensaje;
    ELSE
        -- Si no hay multa, simplemente imprime un mensaje
        SELECT 'Se ha registrado la devolución sin multa.' AS Mensaje;
    END IF;
END;

-- Ejemplo de cómo usar AlmacenarDevolucion para el préstamo con ID 301
CALL AlmacenarDevolucion(301);
