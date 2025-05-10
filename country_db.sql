-- Añadir llave primaria manualmente

SELECT * FROM country;

-- Eliminamos registros duplicados
DELETE FROM country WHERE code='NLD' AND code2='NA';

-- Añadimos la llave primaria
ALTER TABLE country ADD PRIMARY KEY (code);

-- Añadir CONSTRAINT CHECK para verificar que en el campo surfacearea se carguen datos con valores positivos
ALTER TABLE country ADD CHECK(surfacearea >= 0);

-- Añadir CONSTRAINT CHECK para verificar que en el campo continent se carguen datos con valores válidos
ALTER TABLE
    country
ADD
    CHECK(
        continent IN('Europe', 'South America', 'North America', 'Oceania', 'Antarctica', 'Africa', 'Asia', 'Central America')
    );

-- Eliminar el CONSTRAINT CHECK anterior
ALTER TABLE country
DROP CONSTRAINT country_continent_check6;

SELECT * FROM country WHERE region = 'Central America';

-- Actualizar el campo continent para los registros que tienen region = 'Central America'
UPDATE country SET continent = 'Central America' WHERE region = 'Central America';