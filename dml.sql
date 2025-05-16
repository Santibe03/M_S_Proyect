#inserts#
-- Fabricante

call fabricantes ("Asus");
call fabricantes ("Lenovo");
call fabricantes ("Hewlett-Packard");
call fabricantes ("Samsung");
call fabricantes ("SeaGate");
call fabricantes ("Crucial");
call fabricantes ("Gigabyte");
call fabricantes ("Huawei");
call fabricantes ("Xiaomi");

-- producto
CALL producto('Disco duro SATA3 1TB', 86.99, 5);           -- Seagate
CALL producto('Memoria RAM DDR4 8GB', 120, 6);             -- Crucial
CALL producto('Disco SSD 1 TB', 150.99, 4);                -- Samsung
CALL producto('GeForce GTX 1050Ti', 185, 7);               -- Gigabyte
CALL producto('GeForce GTX 1080 Xtreme', 755, 6);          -- Crucial
CALL producto('Monitor 24 LED Full HD', 202, 1);           -- Asus
CALL producto('Monitor 27 LED Full HD', 245.99, 1);        -- Asus
CALL producto('Portátil Yoga 520', 559, 2);                -- Lenovo
CALL producto('Portátil Ideapd 320', 444, 2);              -- Lenovo
CALL producto('Impresora HP Deskjet 3720', 59.99, 3);      -- Hewlett-Packard
CALL producto('Impresora HP Laserjet Pro M26nw', 180, 3);  -- Hewlett-Packard


-- eje 01
select nombre from producto;
-- eje 02
select nombre,precio from producto;
-- eje 03
SELECT p.codigo AS id_producto, p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;
-- eje 04
SELECT nombre, precio ,ROUND(precio * 1.08, 2) 
FROM producto;
-- eje 05
SELECT nombre AS nombre_de_producto,precio AS Euros,ROUND(precio * 1.08, 2) AS Dolares
FROM producto;
-- eje 06
SELECT UPPER(nombre) as nombre, precio
FROM producto;
-- eje 07
SELECT LOWER(nombre) AS nombre,precio
FROM producto;
-- eje 08
SELECT nombre AS nombre_de_fabricante, UPPER(LEFT(nombre, 2)) AS iniciales
FROM fabricante;
-- eje 09
SELECT nombre AS nombre_producto,ROUND(precio) AS precio_redondeado
FROM producto;
-- eje 10
SELECT nombre AS nombre_producto,TRUNCATE(precio, 0) AS precio_truncado
FROM producto;
-- eje 11
SELECT codigo_fabricante
FROM producto;
-- eje 12
SELECT DISTINCT codigo_fabricante
FROM producto;
-- eje 13
SELECT nombre
FROM fabricante ORDER BY nombre ASC;
-- eje 14
SELECT nombre
FROM fabricante ORDER BY nombre DESC;
-- eje 15
-- 1
SELECT nombre, precio
FROM producto ORDER BY nombre ASC;
-- 2
SELECT nombre, precio
FROM producto ORDER BY precio DESC;
-- eje 16
SELECT * 
FROM fabricante LIMIT 5;
-- eje 17
SELECT *
FROM fabricante LIMIT 3, 3;
-- eje 18
SELECT nombre, precio
FROM producto ORDER BY precio ASC LIMIT 1;
-- eje 19
SELECT nombre, precio
FROM producto ORDER BY precio DESC LIMIT 1;
-- eje 20
SELECT nombre 
FROM producto WHERE codigo_fabricante = 2;
-- eje 21
SELECT nombre 
FROM producto WHERE precio <= 120;
-- eje 22
SELECT nombre 
FROM producto WHERE precio >= 400;
-- eje 23
SELECT nombre 
FROM producto WHERE precio < 400;
-- eje 24
SELECT * 
FROM producto WHERE precio >= 80 AND precio <= 300;
-- eje 25
SELECT * 
FROM producto WHERE precio BETWEEN 60 AND 200;
-- eje 26
SELECT * 
FROM producto WHERE precio > 200 AND codigo_fabricante = 6;
-- eje 27
SELECT * 
FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;
-- eje 28
SELECT * 
FROM producto WHERE codigo_fabricante IN (1, 3, 5);
-- eje 29 
SELECT nombre, precio * 100 AS céntimos 
FROM producto;
-- eje 30
SELECT nombre 
FROM fabricante WHERE nombre LIKE 'S%';
-- eje 31
SELECT nombre 
FROM fabricante WHERE nombre LIKE '%e';
-- eje 32
SELECT nombre 
FROM fabricante WHERE nombre LIKE '%w%';
-- eje 33
SELECT nombre 
FROM fabricante WHERE LENGTH(nombre) = 4;
-- eje 34
SELECT nombre 
FROM producto WHERE nombre LIKE '%Portátil%';
-- eje 35
SELECT nombre, precio
FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;
-- eje 36
SELECT nombre, precio 
FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;


-- 1.1.4 consultas
-- eje 01
select p.nombre, p.precio, f.nombre as fabricante 
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo;
-- eje 02
select p.nombre, p.precio, f.nombre as fabricante 
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo order by f.nombre asc;
-- eje 03
select p.codigo as codigo_producto, p.nombre as nombre_producto, f.codigo as codigo_fabricante, f.nombre as nombre_fabricante  
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo;
-- eje 04 
select p.nombre as producto, p.precio, f.nombre as fabricante 
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo ORDER BY precio ASC LIMIT 1;
-- eje 05
select p.nombre as producto, p.precio, f.nombre as fabricante 
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo ORDER BY precio desc LIMIT 1;
-- eje 06
select p.nombre, f.nombre
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre like '%lenovo%';

-- eje07
select p.nombre, p.precio, f.nombre
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre like '%Crucial%' and p.precio >200;

-- eje08
select p.nombre, f.codigo 
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where f.codigo = 1 OR f.codigo = 3 OR f.codigo = 5;

-- eje 09
select p.nombre, f.codigo 
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where f.codigo in (1,3,5);

-- eje 10
select p.nombre, p.precio, f.nombre
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre like '%e';
-- eje11
select p.nombre, p.precio, f.nombre
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where f.nombre like '%w%';

-- eje 12
select p.nombre, p.precio, f.nombre
from producto as p inner join fabricante as f on p.codigo_fabricante = f.codigo where p.precio >= 180 ORDER BY precio ASC, f.nombre DESC;

-- eje13
SELECT DISTINCT f.codigo, f.nombre
FROM fabricante f
INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 1.1.5 consultas multitabla 
-- eje021 
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- eje02
SELECT f.nombre
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo_fabricante IS NULL; 

-- 1.1.6 consulta resumen 
-- eje01
SELECT COUNT(*) AS total_productos
FROM producto;
-- eje02
SELECT COUNT(*) AS total_fabricantes
FROM fabricante;
-- eje03
SELECT COUNT(DISTINCT codigo_fabricante) AS total_fabricantes_distintos
FROM producto;
-- eje04
select avg (precio) from producto;
-- eje 05
SELECT MIN(precio) FROM producto;
-- eje06
SELECT max(precio) FROM producto;
--  eje07
select nombre, min(precio)
from producto;
-- eje08
select nombre, max(precio)
from producto;
-- eje09
select sum(precio)
from producto;
-- eje10
SELECT COUNT(*)
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');
-- eje11
SELECT AVG(precio)
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');
-- eje12
SELECT MIN(precio)
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');
-- eje13
SELECT Max(precio)
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');
-- eje14
SELECT SUM(precio)
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus');
-- eje15
SELECT MAX(precio), MIN(precio), AVG(precio), COUNT(*)
FROM producto
WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Crucial');
-- eje16
SELECT f.nombre, COUNT(p.codigo) AS total_productos
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
ORDER BY total_productos DESC;
-- eje17
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio)
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;
-- eje18
SELECT codigo_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*)
FROM producto
GROUP BY codigo_fabricante
HAVING AVG(precio) > 200;
-- eje19
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*)
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING AVG(p.precio) > 200;
-- eje20
SELECT COUNT(*)
FROM producto
WHERE precio >= 180;
-- eje21
SELECT f.nombre, COUNT(p.codigo)
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 180
GROUP BY f.nombre;
-- eje22
SELECT codigo_fabricante, AVG(precio)
FROM producto
GROUP BY codigo_fabricante;
-- eje23
SELECT f.nombre, AVG(p.precio)
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre;
-- eje24
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre HAVING AVG(p.precio) >= 150;
-- eje25
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) >= 2;
-- eje26
SELECT f.nombre, COUNT(p.codigo)
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio >= 220
GROUP BY f.nombre
HAVING COUNT(p.codigo) > 0;
-- eje27
SELECT f.nombre, COUNT(p.codigo) AS total_productos_caros
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante AND p.precio >= 220
GROUP BY f.nombre;
-- eje28
SELECT f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING SUM(p.precio) > 1000;
-- eje29
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE (p.codigo_fabricante, p.precio) IN (
    SELECT codigo_fabricante, MAX(precio)
    FROM producto
    GROUP BY codigo_fabricante
)
ORDER BY f.nombre ASC;

