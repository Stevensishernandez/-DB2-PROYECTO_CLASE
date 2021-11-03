CREATE DATABASE db_bases;

USE db_bases;



CREATE TABLE Categoria(
	codigo_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	categoria varchar(50)
);

CREATE TABLE Generacion(
	generacion INT NOT NULL PRIMARY KEY
);
CREATE TABLE Tipo(
	codigo_tipo INT NOT NULL PRIMARY KEY,
	nombre varchar(50)
);
CREATE TABLE Locacion(
	codigo_locacion INT NOT NULL PRIMARY KEY,
	nombre varchar(50) NULL,
    padre varchar(50) NULL
);

CREATE TABLE Efecto_Movimiento(
	codigo_efecto INT NOT NULL PRIMARY KEY,
	efecto varchar(250)
);

CREATE TABLE Rareza(
	codigo_rareza INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	rareza varchar(50)
);

CREATE TABLE Juego(
	codigo_juego INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	codigo_locacion INT,
    codigo_pokemon INT,
     FOREIGN KEY (codigo_locacion) REFERENCES Locacion(codigo_locacion) ON DELETE CASCADE,
     FOREIGN KEY (codigo_pokemon) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE
);

CREATE TABLE Tiempo(
	codigo_tiempo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tiempo varchar(50)
);

CREATE TABLE CategoriaItem(
	codigo_categoria INT NOT NULL PRIMARY KEY,
	categoria varchar(100)
);

CREATE TABLE Item(
	codigo_item INT NOT NULL PRIMARY KEY,
	item varchar(100),
	codigo_categoria INT,
    FOREIGN KEY (codigo_categoria) REFERENCES CategoriaItem(codigo_categoria) ON DELETE CASCADE
);
CREATE TABLE Habilidad(
	codigo_habilidad INT NOT NULL PRIMARY KEY,
	nombre varchar(50),
    descripcion varchar(250),
    cantidadpk int
);

CREATE TABLE Movimiento(
	codigo_movimiento INT NOT NULL PRIMARY KEY,
	nombre varchar(50) NULL,
    poder int NULL,
    pp int NULL,
    preciso int NULL,
    prioridad int NULL, 
    codigo_generacion INT,
    codigo_tipo INT,
    FOREIGN KEY (codigo_generacion) REFERENCES Generacion(generacion) ON DELETE CASCADE,
	FOREIGN KEY (codigo_tipo) REFERENCES Tipo(codigo_tipo) ON DELETE CASCADE
);


CREATE TABLE Pokemon(
	codigo_pokemon INT NOT NULL PRIMARY KEY,
	id_pokemon varchar(10) NULL,
    nombre varchar(100),
    total int null,
    hp int null,
    ataque int null,
    defensa int null,
    sp_ataque int null,
    sp_defensa int null,
    rapidez int null,
    altura int null,
    peso int null
);

CREATE TABLE Evolucion(
	codigo_evolucion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nivel INT NULL,
    condicion varchar(150) NULL,
    pockemon_inicio INT,
    pockemon_fin INT,
    FOREIGN KEY (pockemon_inicio) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE,
    FOREIGN KEY (pockemon_inicio) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE
);
CREATE TABLE PokemonItem(
	codigo_pokemon INT,
    codigo_item INT,
    rareza INT,
    FOREIGN KEY (codigo_pokemon) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE,
    FOREIGN KEY (codigo_item) REFERENCES Item(codigo_item) ON DELETE CASCADE
);


CREATE TABLE PokemonTipo(
	codigo_pokemon INT,
    codigo_tipo INT,
    FOREIGN KEY (codigo_pokemon) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE,
    FOREIGN KEY (codigo_tipo) REFERENCES Tipo(codigo_tipo) ON DELETE CASCADE
);

CREATE TABLE PokemonMovimiento(
	codigo_pokemon INT,
    codigo_movimiento INT,
    FOREIGN KEY (codigo_pokemon) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE,
    FOREIGN KEY (codigo_movimiento) REFERENCES Movimiento(codigo_movimiento) ON DELETE CASCADE
);

CREATE TABLE PokemonHabilidad(
	codigo_pokemon INT,
    codigo_habilidad INT,
    FOREIGN KEY (codigo_pokemon) REFERENCES Pokemon(codigo_pokemon) ON DELETE CASCADE,
    FOREIGN KEY (codigo_habilidad) REFERENCES Habilidad(codigo_habilidad) ON DELETE CASCADE
);

select * from habilidad;


