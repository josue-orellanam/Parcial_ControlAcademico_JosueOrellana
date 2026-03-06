-- 1. No necesitamos CREATE DATABASE porque ya la creamos manualmente

-- 2. Creación de tabla Alumno (Usamos SERIAL para el incremento automático)
CREATE TABLE Alumno (
    id_alumno SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    carnet VARCHAR(20) UNIQUE NOT NULL,
    correo VARCHAR(100),
    activo BOOLEAN DEFAULT TRUE
);

-- 3. Creación de tabla Curso
CREATE TABLE Curso (
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    creditos INT
);

-- 4. Creación de tabla Inscripcion
CREATE TABLE Inscripcion (
    id_inscripcion SERIAL PRIMARY KEY,
    id_alumno INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- 5. Inserción de datos
INSERT INTO Alumno (nombre, apellido, carnet, correo, activo) VALUES 
('Josue', 'Orellana', 'JO202601', 'josue@correo.com', TRUE),
('Maria', 'Lopez', 'ML202602', 'maria@correo.com', TRUE),
('Carlos', 'Perez', 'CP202603', 'carlos@correo.com', FALSE);

INSERT INTO Curso (nombre, codigo, creditos) VALUES 
('Desarrollo de Software', 'DS01', 4),
('Bases de Datos I', 'BD02', 4),
('Matematica Computacional', 'MC03', 2);

INSERT INTO Inscripcion (id_alumno, id_curso, fecha_inscripcion) VALUES 
(1, 1, '2026-03-01'),
(1, 2, '2026-03-02'),
(2, 1, '2026-03-01'),
(3, 3, '2026-03-03');

-- 6. Consultas de la Parte III
SELECT * FROM Alumno WHERE activo = TRUE;

SELECT * FROM Curso WHERE creditos > 3;

SELECT A.nombre, A.apellido, C.nombre AS curso
FROM Alumno A
INNER JOIN Inscripcion I ON A.id_alumno = I.id_alumno
INNER JOIN Curso C ON I.id_curso = C.id_curso;

SELECT C.nombre, COUNT(I.id_alumno) AS total_inscritos
FROM Curso C
LEFT JOIN Inscripcion I ON C.id_curso = I.id_curso
GROUP BY C.nombre;

-- 7. Operaciones adicionales de CRUD (Update y Delete)

-- UPDATE: Actualizar el correo de un alumno específico
UPDATE Alumno SET correo = 'j.orellana_actualizado@correo.com' WHERE id_alumno = 1;

-- DELETE: Eliminar una inscripción (ejemplo: el registro con ID 4)
DELETE FROM Inscripcion WHERE id_inscripcion = 4;

-- Verificación final de datos
SELECT * FROM Alumno;