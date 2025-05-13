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

SELECT * FROM country WHERE continent = 'South America';

-- Creamos un índice único para el campo name
-- Este índice es único, ya que no puede haber dos países con el mismo nombre
-- En caso de que haya duplicados, se generará un error al intentar crear el índice
-- Este índice se utiliza para mejorar el rendimiento de las consultas que filtran por nombre de país
-- El índice se llama "unique_country_name" y se crea en la tabla country
-- El índice se crea en el campo name
-- El índice se crea como único, lo que significa que no se permiten valores duplicados en el campo name
-- El índice se crea en la tabla country
CREATE UNIQUE INDEX "unique_country_name" on country (name);

-- Creamos un índice para el campo continent
-- Este índice no es único, ya que puede haber varios países en el mismo continente
-- En caso de que haya duplicados, no se generará un error al intentar crear el índice
-- Este índice se utiliza para mejorar el rendimiento de las consultas que filtran por continente
-- El índice se llama "country_continent" y se crea en la tabla country
CREATE INDEX "country_continent" on country (continent);

-- Insertamos los contientes en la tabla continent utilizandos los continentes de la tabla country
insert into continent(name) select distinct continent from country order by continent;

-- Obtener el id de la secuencia
SELECT pg_get_serial_sequence('continent', 'code');

-- Resetear la secuencia para que vuelva a empezar desde 1
ALTER SEQUENCE public.continent_code_seq RESTART WITH 1;

-- Verificar el valor actual de la secuencia
SELECT nextval('public.continent_code_seq');

-- Resetear la tabla perdiendo los datos
-- Esto eliminará todos los registros de la tabla continent y reiniciará el contador de la secuencia
TRUNCATE TABLE continent RESTART IDENTITY;

-- Insertamos todos los registros de la tabla country en la tabla country_backup para hacer una copia de seguridad
INSERT INTO country_backup SELECT * from country;

SELECT * from country;

-- Eliminamos el CONSTRAINT CHECK
ALTER TABLE country DROP CONSTRAINT country_continent_check;

INSERT INTO country_backup SELECT * from country;

ALTER TABLE country DROP CONSTRAINT country_continent_check;

SELECT a.name, a.continent,  ( select code FROM continent b WHERE b.name = a.continent ) from country a;

update country a set continent = ( select code FROM continent b WHERE b.name = a.continent );

select * from country;