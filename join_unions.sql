SELECT * FROM continent WHERE name LIKE '%America%' UNION

SELECT * FROM continent WHERE code in (3,5) ORDER BY name;

-- Consulta entre dos tablas usando where
select a."name" as country, b."name" from country a, continent b where a.continent = b.code order by a."name";

-- Consulta entre dos tablas usando inner join
select a."name" as country, b."name" as continent from country a inner join continent b on a.continent = b.code order by a."name";

-- Alterar la secuencia
ALTER SEQUENCE continent_code_seq RESTART WITH 8;

-- Consulta entre dos tablas usando full outer join
-- Esta consulta es para ver los paises que no tienen continente
-- y los continentes que no tienen paises
SELECT a."name" as country, a.continent as continent_code, b."name" as continent_name FROM country a FULL OUTER JOIN continent b ON a.continent = b.code order by a."name" desc;

SELECT * FROM continent;

-- Consulta entre dos tablas usando right outer join con exclusión
-- Esta consulta es para ver los continentes que no tienen paises asociados
-- y los paises que no tienen continente asociado
SELECT *
FROM country A
RIGHT OUTER JOIN continent B 
ON A.continent = B.code
WHERE A.continent IS NULL;

-- Aggregations + Joins

(SELECT COUNT(a."name") AS TOTAL_COUNTRIES, b."name" FROM country a FULL OUTER JOIN continent b ON a.continent = b.code GROUP BY  b."name")
UNION
(SELECT COUNT(a."name") AS TOTAL_COUNTRIES, b."name" FROM country a INNER JOIN continent b ON a.continent = b.code GROUP BY  b."name") ORDER BY TOTAL_COUNTRIES;


-- Count Union - Tarea

(SELECT COUNT(*) AS TOTAL_COUNTRIES, b."name" FROM country a INNER JOIN continent b ON a.continent = b.code WHERE b."name" NOT LIKE '%America%' GROUP BY  b."name")
UNION
(SELECT COUNT(*) AS TOTAL_COUNTRIES, 'America' FROM country a INNER JOIN continent b ON a.continent = b.code WHERE b."name" LIKE '%America%') ORDER BY TOTAL_COUNTRIES;

--  Count Union - Con índices
(SELECT COUNT(*) AS TOTAL_COUNTRIES, b."name" FROM country a INNER JOIN continent b ON a.continent = b.code WHERE b.code NOT IN (4,6,8) GROUP BY  b."name")
UNION
(SELECT COUNT(*) AS TOTAL_COUNTRIES, 'America' FROM country a INNER JOIN continent b ON a.continent = b.code WHERE b.code IN (4,6,8)) ORDER BY TOTAL_COUNTRIES;

-- Mostrar el país con más ciudades
SELECT COUNT(*), country."name" from city INNER JOIN country ON city.countrycode = country.code GROUP by country."name" order by count(*) desc LIMIT 1;
