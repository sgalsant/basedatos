\connect bdcines;

-- Insertar datos de ejemplo en la tabla cines
INSERT INTO cines.cines (nombre, direccion)
VALUES
    ('CineCity', ROW('Ciudad1', 'Provincia1', 'Calle1')),
    ('CineMax',  ROW('Ciudad2', 'Provincia2', 'Calle2')),
    ('CineStar', ROW('Ciudad3', 'Provincia3', 'Calle3'));

-- Insertar datos de ejemplo en la tabla salas
INSERT INTO cines.salas (cine_id, nombre, capacidad)
VALUES
    (1, 'Sala 1', 100),
    (1, 'Sala 2', 120),
    (2, 'Sala A', 80),
    (3, 'Sala X', 150);

-- Insertar datos de ejemplo en la tabla peliculas
INSERT INTO cines.peliculas (titulos, genero, duracion_minutos)
VALUES
    ('{"en": "Movie 1", "es": "Película 1"}', ARRAY['Acción', 'Aventura']::cines.genero_type[], 120),
    ('{"en": "Movie 2", "es": "Película 2"}', ARRAY['Comedia']::cines.genero_type[], 90),
    ('{"en": "Movie 3", "es": "Película 3"}', ARRAY['Drama']::cines.genero_type[], 150);

-- Insertar datos de ejemplo en la tabla funciones
INSERT INTO cines.funciones (pelicula_id, sala_id, fecha_hora)
VALUES
    (1, 1, '2024-04-01 15:00:00'),
    (2, 2, '2024-04-02 18:30:00'),
    (3, 3, '2024-04-03 20:00:00');

-- Insertar datos de ejemplo en la tabla clientes
INSERT INTO cines.clientes (nombre, apellido, email, telefono)
VALUES
    ('Juan', 'Perez', 'juan@example.com', '123-456-7890'),
    ('Maria', 'Gomez', 'maria@example.com', '987-654-3210'),
    ('Pedro', 'Lopez', 'pedro@example.com', '555-123-4567');

-- Insertar datos de ejemplo en la tabla entradas
INSERT INTO cines.entradas (cliente_id, funcion_id, precio, fecha_compra)
VALUES
    (1, 1, 10.50, '2024-03-30 09:15:00'),
    (2, 2, 8.75, '2024-03-31 11:30:00'),
    (3, 3, 12.00, '2024-04-01 14:45:00'),
    (3, 3, 22.00, '2024-04-02 14:45:00');

-- Insertar datos de ejemplo en la tabla asientos
INSERT INTO cines.asientos (entrada_id, funcion_id, numero)
VALUES
    (1, 1, 1),
    (1, 1, 2),
    (2, 2, 21),
    (2, 2, 2),
    (3, 3, 31),
    (4, 3, 2);
