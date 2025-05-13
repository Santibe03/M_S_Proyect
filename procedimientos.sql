USE `tecshop`;
DROP procedure IF EXISTS `fabricantes`;

USE `tecshop`;
DROP procedure IF EXISTS `tecshop`.`fabricantes`;
;

DELIMITER $$
USE `tecshop`$$
CREATE PROCEDURE `fabricantes`(
	in nombre varchar(100)
)
BEGIN
	insert into fabricante (nombre) 
    value (nombre);
END$$

DELIMITER ;
;






USE `tecshop`;
DROP procedure IF EXISTS `producto`;

DELIMITER $$
USE `tecshop`$$
CREATE PROCEDURE `producto` (
	in nombre varchar (100),
    in precio double,
    in codigo_fabricante int (10)
)
BEGIN
	insert into Producto (nombre,precio,codigo_fabricante)
    value (nombre,precio,codigo_fabricante);
END$$

DELIMITER ;