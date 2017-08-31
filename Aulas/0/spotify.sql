-- 
-- Criar tabelas
-- 

CREATE TABLE artista (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    nome 	  TEXT,
    popularidade  INTEGER,
    seguidores    INTEGER
);

CREATE TABLE genero (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    nome 	  TEXT
);

CREATE TABLE musica (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    nome          TEXT,
    url           TEXT, 
    artista_id	  INTEGER,
    FOREIGN KEY(artista_id) REFERENCES artista(id)
);

CREATE TABLE pais (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    sigla 	  TEXT,
    nome    TEXT
);

CREATE TABLE artista_genero (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    artista_id INTEGER,
    genero_id INTEGER,
    FOREIGN KEY(artista_id) REFERENCES artista(id),
    FOREIGN KEY(genero_id) REFERENCES genero(id)
);

CREATE TABLE pais_musica (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pais_id INTEGER,
    musica_id INTEGER,
    posicao       INTEGER,
    streams       INTEGER,
    FOREIGN KEY(pais_id) REFERENCES pais(id),
    FOREIGN KEY(musica_id) REFERENCES musica(id)
);
