-- Extraer el dominio de los correos electrónicos con una subconsulta

SELECT domain FROM (SELECT SUBSTRING(email, POSITION('@' in email) + 1) AS Domain FROM users GROUP BY Domain HAVING COUNT(*) > 1) AS email_domains;