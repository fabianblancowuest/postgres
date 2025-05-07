SELECT * FROM users;

-- Utilizamos la función SUBSTRING para cortar un string y utilizamos la función POSITION para elegir desde que posición los queremos cortar
SELECT
    SUBSTRING(name, 0, POSITION(' ' IN name)) AS first_name,
    SUBSTRING(name, POSITION(' ' IN NAME) + 1) AS last_name
FROM
    users;