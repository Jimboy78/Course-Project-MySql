-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Biblioteca;

-- Usar la base de datos
USE Biblioteca;

-- Creación de la tabla Autor
CREATE TABLE IF NOT EXISTS Autor (
    ID_Autor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255)
);

-- Creación de la tabla Libro
CREATE TABLE IF NOT EXISTS Libro (
    ID_Libro INT PRIMARY KEY,
    Titulo VARCHAR(255),
    ISBN VARCHAR(20),
    ID_Autor INT,
    FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor)
);

-- Creación de la tabla Usuario
CREATE TABLE IF NOT EXISTS Usuario (
    ID_Usuario INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Email VARCHAR(255)
);

-- Creación de la tabla Prestamo
CREATE TABLE IF NOT EXISTS Prestamo (
    ID_Prestamo INT PRIMARY KEY,
    ID_Libro INT,
    ID_Usuario INT,
    Fecha_Prestamo DATE,
    Fecha_Devolucion DATE,
    FOREIGN KEY (ID_Libro) REFERENCES Libro(ID_Libro),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);