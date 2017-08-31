-- Artistas e musica 

SELECT a.nome, 
       m.nome 
FROM artista a
INNER JOIN musica m ON m.artista_id = a.id

-- Artistas e países que eles tocam

SELECT DISTINCT a.nome AS artist, 
                p.nome AS pais 
FROM artista a
INNER JOIN musica m ON m.artista_id = a.id
INNER JOIN pais_musica pm ON pm.musica_id = m.id
INNER JOIN pais p ON pm.pais_id = p.id
ORDER by p.nome

-- Top 10 músicas de determinado país

SELECT m.nome AS musica, 
       p.nome as pais 
FROM musica m
INNER JOIN pais_musica pm ON pm.musica_id = m.id
INNER JOIN pais p ON pm.pais_id = p.id
WHERE p.nome LIKE 'Brazil'
LIMIT 10

-- Quantidade total de generos

SELECT DISTINCT count(*) FROM genero

-- Quantidade de generos por artista

SELECT a.nome, count(*) AS qtd 
FROM artista a
INNER JOIN artista_genero ag ON ag.artista_id = a.id
GROUP BY a.id
ORDER BY qtd

-- Generos de determinado pais
SELECT DISTINCT g.nome as genero,
       p.nome as pais
FROM genero g
INNER JOIN artista_genero ag ON ag.genero_id = g.id
INNER JOIN artista a ON ag.artista_id = a.id
INNER JOIN musica m ON m.artista_id = a.id
INNER JOIN pais_musica pm ON pm.musica_id = m.id
INNER JOIN pais p ON pm.pais_id = p.id
WHERE p.nome LIKE 'Brazil'

-- Quantidade de musicas por pais

SELECT DISTINCT p.nome AS pais,
       count(*) AS qtd_musicas
FROM pais p
INNER JOIN pais_musica pm ON pm.pais_id = p.id
INNER JOIN musica m ON m.id = pm.musica_id
GROUP BY p.nome

-- Artista com a popularidade mais alta

SELECT a.nome, 
       MAX(a.popularidade) AS popularidade
FROM artista a

-- Musica com maior quantidade de streams

SELECT m.nome, 
       MAX(pm.streams) AS streams
FROM musica m
INNER JOIN pais_musica pm ON m.id = pm.musica_id

-- Quantidade de paises que cada musica toca

SELECT m.nome,
       count(*)
FROM pais_musica pm 
INNER JOIN musica m ON m.id = pm.musica_id
GROUP BY pm.musica_id