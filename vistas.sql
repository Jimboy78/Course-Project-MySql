-- Descripción de la Vista LibrosPrestadosPorUsuario
-- Esta vista muestra la lista de usuarios con los libros que tienen prestados.

-- Script de Creación de la Vista LibrosPrestadosPorUsuario
CREATE VIEW LibrosPrestadosPorUsuario AS
SELECT Usuario.ID_Usuario, Usuario.Nombre AS Nombre_Usuario, Usuario.Apellido AS Apellido_Usuario,
       Libro.Titulo AS Titulo_Libro, Prestamo.Fecha_Prestamo, Prestamo.Fecha_Devolucion
FROM Prestamo
JOIN Libro ON Prestamo.ID_Libro = Libro.ID_Libro
JOIN Usuario ON Prestamo.ID_Usuario = Usuario.ID_Usuario;

-- Ejemplo de cómo usar LibrosPrestadosPorUsuario
SELECT * FROM LibrosPrestadosPorUsuario;


-- Descripción de la Vista ResumenPrestamosPendientes
-- Esta vista proporciona un resumen de los préstamos pendientes.

-- Script de Creación de la Vista ResumenPrestamosPendientes
CREATE VIEW ResumenPrestamosPendientes AS
SELECT COUNT(*) AS Cantidad_Prestamos_Pendientes
FROM Prestamo
WHERE Fecha_Devolucion IS NULL;

-- Ejemplo de cómo usar ResumenPrestamosPendientes
SELECT * FROM ResumenPrestamosPendientes;
