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