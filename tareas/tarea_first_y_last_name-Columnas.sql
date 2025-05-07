SELECT * FROM users;

-- Actualizamos la tabla users para que contenga los nombres y apellidos en columnas separadas.
UPDATE users SET first_name = SUBSTRING(name, 0, POSITION(' ' IN name)),
				 last_name = SUBSTRING(name, POSITION(' ' IN name) + 1);