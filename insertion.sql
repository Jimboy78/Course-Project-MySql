-- Inserción de datos en la tabla Autor
INSERT INTO Autor (ID_Autor, Nombre, Apellido) VALUES
(1, 'J.K.', 'Rowling'),
(2, 'George', 'Orwell');

-- Inserción de datos en la tabla Libro
INSERT INTO Libro (ID_Libro, Titulo, ISBN, ID_Autor) VALUES
(101, 'Harry Potter y la Piedra Filosofal', '978-84-9838-916-0', 1),
(102, '1984', '978-0-452-28423-4', 2);

-- Inserción de datos en la tabla Usuario
INSERT INTO Usuario (ID_Usuario, Nombre, Apellido, Email) VALUES
(201, 'John', 'Doe', 'john.doe@example.com'),
(202, 'Jane', 'Smith', 'jane.smith@example.com');

-- Inserción de datos en la tabla Prestamo
INSERT INTO Prestamo (ID_Prestamo, ID_Libro, ID_Usuario, Fecha_Prestamo, Fecha_Devolucion) VALUES
(301, 101, 201, '2023-10-01', NULL),
(302, 102, 202, '2023-10-05', NULL);