-- Extraer el dominio de los correos electrónicos

SELECT first_name, last_name, SUBSTRING(email, POSITION('@' in email) + 1) AS Domain FROM users GROUP BY Domain HAVING COUNT(*) > 1;