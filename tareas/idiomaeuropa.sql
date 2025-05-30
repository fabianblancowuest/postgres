-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from continent;

Select * from "language";

-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)
SELECT count(a."language") AS more_speak_language, a."language", a.languagecode 
FROM countrylanguage a 
INNER JOIN country b ON a.countrycode = b.code 
WHERE isofficial = TRUE AND continent = 5 GROUP BY a."language", a.languagecode 
ORDER BY more_speak_language DESC LIMIT 1;

SELECT * FROM country a 
INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE a.continent = 5 AND b.isofficial = TRUE AND b.languagecode = 135;










