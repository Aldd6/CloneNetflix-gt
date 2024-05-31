CREATE DATABASE peliculas;

CREATE TABLE peliculas.tbl_resolucion_pelicula(
	id_resolucion SERIAL PRIMARY KEY,
	resolucion VARCHAR(10) NOT NULL
);

CREATE TABLE peliculas.tbl_clasificacion_pelicula(
	id_clasificacion SERIAL PRIMARY KEY,
	clasificacion VARCHAR(10) NOT NULL
);

CREATE TABLE peliculas.tbl_genero(
	id_genero SERIAL PRIMARY KEY,
	genero VARCHAR(255) NOT NULL
);

CREATE TABLE peliculas.tbl_enc_pelicula(
	id_pelicula SERIAL PRIMARY KEY,
	resolucion_id INTEGER REFERENCES peliculas.tbl_resolucion_pelicula(id_resolucion),
	clasificacion_id INTEGER REFERENCES peliculas.tbl_clasificacion_pelicula(id_clasificacion),
	estado_pelicula BOOLEAN DEFAULT TRUE
);

CREATE TABLE peliculas.tbl_detalle_pelicula(
	id_detalle SERIAL PRIMARY KEY,
	pelicula_id INTEGER REFERENCES peliculas.tbl_enc_pelicula(id_pelicula),
	anio_pelicula VARCHAR(4) NOT NULL,
	tags_pelicula VARCHAR(255),
	sinopsis_pelicula VARCHAR(255) NOT NULL,
	horas_pelicula INTEGER NOT NULL,
	minutos_pelicula INTEGER NOT NULL,
	estado_subtitulos BOOLEAN DEFAULT FALSE
);

CREATE TABLE peliculas.tbl_genero_pelicula(
	id_genero_pelicua SERIAL PRIMARY KEY,
	pelicula_id INTEGER REFERENCES peliculas.tbl_enc_pelicula(id_pelicula),
	genero_id INTEGER REFERENCES peliculas.tbl_genero(id_genero)
);