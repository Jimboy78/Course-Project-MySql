-- Informe: Obtener lista de préstamos con detalles de libro y usuario
SELECT Prestamo.ID_Prestamo, Libro.Titulo as Titulo_Libro, Usuario.Nombre as Nombre_Usuario, Prestamo.Fecha_Prestamo, Prestamo.Fecha_Devolucion
FROM Prestamo
JOIN Libro ON Prestamo.ID_Libro = Libro.ID_Libro
JOIN Usuario ON Prestamo.ID_Usuario = Usuario.ID_Usuario;