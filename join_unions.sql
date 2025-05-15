SELECT * FROM continent WHERE name LIKE '%America%' UNION

SELECT * FROM continent WHERE code in (3,5) ORDER BY name;