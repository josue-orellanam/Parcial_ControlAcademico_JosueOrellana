-- 1. Creación de la base de datos
CREATE DATABASE control_academico;
USE control_academico;

-- 2. Creación de tabla Alumno
CREATE TABLE Alumno (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    carnet VARCHAR(20) UNIQUE NOT NULL,
    correo VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);

-- 3. Creación de tabla Curso
CREATE TABLE Curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    creditos INT
);

-- 4. Creación de tabla Inscripcion
CREATE TABLE Inscripcion (
    id_inscripcion INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- 5. Inserción de datos (3 Alumnos)
INSERT INTO Alumno (nombre, apellido, carnet, correo, activo) VALUES 
('Josue', 'Orellana', 'JO202601', 'josue@correo.com', TRUE),
('Maria', 'Lopez', 'ML202602', 'maria@correo.com', TRUE),
('Carlos', 'Perez', 'CP202603', 'carlos@correo.com', FALSE);

-- 6. Inserción de datos (3 Cursos)
INSERT INTO Curso (nombre, codigo, creditos) VALUES 
('Desarrollo de Software', 'DS01', 4),
('Bases de Datos I', 'BD02', 4),
('Matematica Computacional', 'MC03', 2);

-- 7. Inserción de datos (4 Inscripciones)
INSERT INTO Inscripcion (id_alumno, id_curso, fecha_inscripcion) VALUES 
(1, 1, '2026-03-01'), -- Josue en Software
(1, 2, '2026-03-02'), -- Josue en Bases de Datos
(2, 1, '2026-03-01'), -- Maria en Software
(3, 3, '2026-03-03'); -- Carlos en Matematica