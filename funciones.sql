-- Descripción de la Función CalcularMulta
-- Esta función calcula la multa por retraso en la devolución de libros.

-- Script de Creación de la Función CalcularMulta
CREATE FUNCTION CalcularMulta(FechaDevolucion DATE) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE Multa DECIMAL(10, 2);
    SET Multa = 0.00;
    
    IF FechaDevolucion IS NOT NULL AND FechaDevolucion > CURDATE() THEN
        SET Multa = DATEDIFF(FechaDevolucion, CURDATE()) * 0.50;
    END IF;

    RETURN Multa;
END;

-- Ejemplo de cómo usar CalcularMulta
SELECT CalcularMulta('2023-10-15') AS MultaPorRetraso;


-- Descripción de la Función ObtenerLibrosDisponibles
-- Esta función devuelve la lista de libros disponibles para préstamo.

-- Script de Creación de la Función ObtenerLibrosDisponibles
CREATE FUNCTION ObtenerLibrosDisponibles() RETURNS TABLE
BEGIN
    RETURN (
        SELECT Libro.ID_Libro, Libro.Titulo, Autor.Nombre AS NombreAutor, Autor.Apellido AS ApellidoAutor
        FROM Libro
        JOIN Autor ON Libro.ID_Autor = Autor.ID_Autor
        WHERE Libro.ID_Libro NOT IN (SELECT ID_Libro FROM Prestamo WHERE Fecha_Devolucion IS NULL)
    );
END;

-- Ejemplo de cómo usar UsuarioTienePrestamosPendientes
SELECT UsuarioTienePrestamosPendientes(201) AS TienePrestamosPendientes;


-- Descripción de la Función UsuarioTienePrestamosPendientes
-- Esta función verifica si un usuario tiene libros pendientes de devolución.

-- Script de Creación de la Función UsuarioTienePrestamosPendientes
CREATE FUNCTION UsuarioTienePrestamosPendientes(IDUsuario INT) RETURNS BOOLEAN
BEGIN
    DECLARE PrestamosPendientes INT;
    
    SELECT COUNT(*) INTO PrestamosPendientes
    FROM Prestamo
    WHERE ID_Usuario = IDUsuario AND Fecha_Devolucion IS NULL;
    
    RETURN PrestamosPendientes > 0;
END;

-- Ejemplo de cómo usar UsuarioTienePrestamosPendientes
SELECT UsuarioTienePrestamosPendientes(201) AS TienePrestamosPendientes;
