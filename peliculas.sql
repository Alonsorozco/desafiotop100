
-- 1. Crear base de datos llamada películas.
CREATE DATABASE peliculas;
\c peliculas;
-- 2. Cargar ambos archivos a su tabla correspondiente.
CREATE TABLE peliculas (
    id INT,
    Pelicula VARCHAR(255),
    Año_estreno CHAR(4),
    Director VARCHAR(50),
    PRIMARY KEY(id)
);


CREATE TABLE reparto (
        id SERIAL ,
        id_peliculas INT,
        actor VARCHAR(50),
        PRIMARY KEY(id),
        FOREIGN KEY(id_peliculas) REFERENCES peliculas(id)
);

\copy peliculas FROM 'Data/peliculas.csv' csv header;
\copy reparto(id_peliculas, actor) FROM 'Data/reparto.csv' csv header;


-- Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT * FROM reparto WHERE id_peliculas = 2;

--Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT * FROM reparto WHERE actor = 'Harrison Ford';

--Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
--manera ascendente.
SELECT pelicula,Año_estreno FROM peliculas WHERE Año_estreno BETWEEN '1990' AND '1999' ORDER BY pelicula ASC;

--  Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
--nombrado para la consulta como “longitud_titulo”.
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT MAX(LENGTH(pelicula)) FROM peliculas;

-- nombre de la pelicula y solo un nombre del actor de pelicula
SELECT actor , pelicula FROM reparto
INNER JOIN peliculas
ON reparto.id = peliculas.id
WHERE peliculas.id = 2
LIMIT 1;