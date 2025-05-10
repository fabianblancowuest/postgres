-- Añadir llave primaria manualmente

SELECT * FROM country;

-- Eliminamos registros duplicados
DELETE FROM country WHERE code='NLD' AND code2='NA';

-- Añadimos la llave primaria
ALTER TABLE country ADD PRIMARY KEY (code);