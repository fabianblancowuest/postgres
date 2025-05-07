SELECT id, UPPER(name), NAME, LENGTH(NAME) AS "Cantidad de Caracteres" FROM users ORDER BY id ASC;

-- Inventar otra columna en la consulta
SELECT id, UPPER(name), NAME, 'Activo' AS estado FROM users;

-- Inventar otra columna, incluir operaciones matemáticas por ej
SELECT id, UPPER(name), NAME, (20 * 2) AS "Numero_multiplicado" FROM users;

-- Concatenar columnas con la función CONCAT
SELECT CONCAT(id, ' - ', name) FROM users;

-- Concatenar columnas sin la función CONCAT
SELECT id || ' - ' || '*' || name FROM users;