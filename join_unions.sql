SELECT * FROM continent WHERE name LIKE '%America%' UNION

SELECT * FROM continent WHERE code in (3,5) ORDER BY name;

-- Consulta entre dos tablas usando where
select a."name" as country, b."name" from country a, continent b where a.continent = b.code order by a."name";

-- Consulta entre dos tablas usando inner join
select a."name" as country, b."name" as continent from country a inner join continent b on a.continent = b.code order by a."name";