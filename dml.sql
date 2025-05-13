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
-- eje 04/05
SELECT nombre AS nombre_de_producto, precio AS euros, ROUND(precio * 1.08, 2) AS dolares
FROM producto;


select * from fabricante;

