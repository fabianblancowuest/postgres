-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XX

-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX
SELECT first_name, last_name, last_connection from users WHERE last_connection LIKE'221%';
-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas
SELECT first_name, last_name, followers FROM users WHERE followers > 4600;

-- Operador BETWEEN
SELECT first_name, last_name, followers FROM users WHERE followers BETWEEN 4600 AND 4700
order by followers desc;

-- Funciones agregadas - MAX MIN COUNT ROUND AVG
SELECT COUNT(*) AS total_users, MIN(followers) as min_followers, MAX(followers) as max_followers, ROUND(AVG(followers)) as avg_followers FROM users;

-- Group By
SELECT
    COUNT(*) as total_users,
    followers
from
    users
where
    followers BETWEEN 4500
    AND 4999
GROUP BY
    followers
ORDER BY
    followers DESC;

-- Having -> Se utitliza con funciones de agregación, va siempre despues del GROUP BY y antes del ORDER BY
SELECT count(*) total_by_country, country FROM users group by country having count(*) > 6 order by count(*) desc;


-- La palabra clave DISTINCT en la cláusula SELECT se utiliza para eliminar las filas duplicadas y mostrar una lista única de valores. En otras palabras, la palabra clave DISTINCT recupera valores únicos de una tabla.
select DISTINCT country from users;