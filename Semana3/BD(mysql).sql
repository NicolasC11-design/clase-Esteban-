
CREATE TABLE libro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150),
  año_publicacion INT,
  isbn VARCHAR(20),
  id_autor INT,
  FOREIGN KEY (id_autor) REFERENCES Autor(id)
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    direccion VARCHAR(150)
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(50)
);

CREATE TABLE prestamo (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_usuario INT,
    id_empleado INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (id_libro) REFERENCES libro(id_libro),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

INSERT INTO Libro (titulo, año_publicacion, isbn, id_autor) VALUES
('Cien años de soledad', 1967, '978-84-376-0494-7', 1),
('Rayuela', 1963, '978-84-376-0493-0', 2),
('La casa de los espíritus', 1982, '978-84-376-0492-3', 3),
('La ciudad y los perros', 1962, '978-84-376-0491-6', 4),
('Ficciones', 1944, '978-84-376-0490-9', 5);

INSERT INTO autor (nombre, nacionalidad, fecha_nacimiento) VALUES
('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
('Isabel Allende', 'Chilena', '1942-08-02'),
('Mario Vargas Llosa', 'Peruana', '1936-03-28'),
('Jorge Luis Borges', 'Argentina', '1899-08-24'),
('Julio Cortázar', 'Argentina', '1914-08-26');

INSERT INTO usuario (nombre, correo, direccion) VALUES
('Nicolás Herrera', 'nicolas.herrera@example.com', 'Calle 45 #12-20 Bogotá'),
('Laura Ramírez', 'laura.ramirez@example.com', 'Carrera 8 #21-15 Medellín'),
('Andrés Gómez', 'andres.gomez@example.com', 'Av. 30 de Agosto #10 Pereira'),
('Sofía Torres', 'sofia.torres@example.com', 'Calle 60 #14-90 Cali'),
('Camila López', 'camila.lopez@example.com', 'Carrera 15 #33-08 Bucaramanga');

INSERT INTO empleado (nombre, cargo) VALUES
('María Rodríguez', 'Bibliotecaria'),
('Carlos Pérez', 'Archivista'),
('Daniel Ortiz', 'Atención al público'),
('Lucía Sánchez', 'Gestora cultural'),
('Juan Fernández', 'Administrador de base de datos');

INSERT INTO prestamo (id_libro, id_usuario, id_empleado, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, 1, '2025-10-01', '2025-10-15'),
(2, 2, 2, '2025-09-25', '2025-10-09'),
(3, 3, 3, '2025-09-28', '2025-10-12'),
(4, 4, 4, '2025-10-02', '2025-10-16'),
(5, 5, 5, '2025-10-05', '2025-10-19');








