SELECT * FROM city ORDER BY NAME ASC;
SELECT * FROM countrylanguage;

-- 1. Crear una llave primaria en city (id)
ALTER TABLE city ADD PRIMARY KEY (id);


-- 2. Crear un check en population, para que no soporte negativos
ALTER TABLE city ADD CHECK (population >= 0);


-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language
ALTER TABLE countrylanguage ADD PRIMARY KEY (countrycode, language); 


-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100
ALTER TABLE countrylanguage ADD CHECK(percentage >=0 AND percentage <= 100);

SELECT * FROM CITY;


-- 5. Crear un índice único en city, para que no permita duplicados
-- en los campos name, countrycode y district
-- Este índice se llama "unique_name_countrycode_district" y se crea en la tabla city
-- Este índice se crea en los campos name, countrycode y district
CREATE UNIQUE INDEX "unique_name_countrycode_district" on city (name, countrycode, district);

-- 6. Crear un índice en city, para que no permita duplicados
-- en el campo district
CREATE INDEX "index_district" on city (district);

select * from city where name='Jinzhou';

SELECT * FROM city where countrycode = 'AFG';

-- Creamos llave foránea en city, para que countrycode haga referencia a code de country
ALTER TABLE city ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);

select * from country order by "name";

-- Insertamos un registro en country
-- Este registro tiene un código de país que no existe en la tabla city
-- y por lo tanto no se puede insertar
INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');

-- Agregamos la llave foránea en countrylanguage, para que countrycode haga referencia a code de country
ALTER TABLE countrylanguage ADD CONSTRAINT fk_country_code FOREIGN KEY (countrycode) REFERENCES country(code);