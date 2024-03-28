\connect bdcines;

CREATE TYPE cines.direccion_type AS (
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    direccion VARCHAR(255)
);

-- Crear tipo enumerado para los géneros de películas
CREATE TYPE cines.genero_type AS ENUM (
    'Acción',
    'Aventura',
    'Comedia',
    'Drama',
    'Ciencia Ficción',
    'Fantasía',
    'Terror',
    'Romance',
    'Documental',
    'Animación',
    'Thriller',
    'Otros'
);

-- Crear tabla para cines
CREATE TABLE cines.cines (
    cine_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion cines.direccion_type NOT NULL
);

-- Crear tabla para salas
CREATE TABLE cines.salas (
    sala_id SERIAL PRIMARY KEY,
    cine_id INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    FOREIGN KEY (cine_id) REFERENCES cines.cines (cine_id)
);

-- Crear tabla para películas
CREATE TABLE cines.peliculas (
    pelicula_id SERIAL PRIMARY KEY,
    titulos JSONB NOT NULL, -- clave-valor para el título en cada idioma
    duracion_minutos INT NOT NULL,
    genero cines.genero_type[] 
);

-- Crear tabla para funciones
CREATE TABLE cines.funciones (
    funcion_id SERIAL PRIMARY KEY,
    pelicula_id INT NOT NULL,
    sala_id INT NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    FOREIGN KEY (pelicula_id) REFERENCES cines.peliculas (pelicula_id),
    FOREIGN KEY (sala_id) REFERENCES cines.salas (sala_id)
);

-- Crear tabla para clientes
CREATE TABLE cines.clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefono VARCHAR(20)
);

-- Crear tabla para entradas
CREATE TABLE cines.entradas (
    entrada_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    funcion_id INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_compra TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   
    FOREIGN KEY (cliente_id) REFERENCES cines.clientes (cliente_id),
    FOREIGN KEY (funcion_id) REFERENCES cines.funciones (funcion_id)
);

-- creamos un indice para establecer la clave ajena de asientos a entradas
CREATE UNIQUE INDEX idx_entradas ON cines.entradas (entrada_id, funcion_id);

-- Crear tabla para asientos asociados a las entradas
CREATE TABLE cines.asientos (
    entrada_id INT NOT NULL,
    funcion_id INT NOT NULL,
    numero INT NOT NULL,

    PRIMARY KEY (funcion_id, numero),
    FOREIGN KEY (entrada_id, funcion_id) REFERENCES cines.entradas (entrada_id, funcion_id)
);
