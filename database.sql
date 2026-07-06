CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    ciudad VARCHAR(100)
);

INSERT INTO usuarios(nombre, correo, ciudad)
VALUES
('Ana Torres', 'ana@gmail.com', 'Guadalajara'),
('Carlos Ruiz', 'carlos@gmail.com', 'Monterrey'),
('Maria Lopez', 'maria@gmail.com', 'CDMX');