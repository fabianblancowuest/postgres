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