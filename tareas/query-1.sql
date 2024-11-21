SELECT
    id,
    UPPER(name) as name, LOWER(name) as name_l, LENGTH(name) as longitud_nombre,
    CONCAT('-- ', id, ' -- ', '-- ', name, ' --') as "Nombre Concatenado"
FROM
    users
ORDER BY
    id;

-- Cortar nombre y apellido
select
    name,
    SUBSTRING(name, 0, POSITION(' ' in name)) as first_name,
    SUBSTRING(name, POSITION(' ' in name) + 1 ) as last_name,
    TRIM(SUBSTRING(name, POSITION(' ' in name))) as trimmed_last_name

from
    users;

-- Actualización de tabla con nombre y apellido por separado
UPDATE
    users
SET
    first_name = SUBSTRING(name, 0, POSITION(' ' in name)),
    last_name = SUBSTRING(name, POSITION(' ' in name) + 1);