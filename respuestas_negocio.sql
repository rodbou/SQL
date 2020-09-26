USE CHALLENGE;

/* Query 1 */

SELECT count(apellido) cantidad_usuarios 
FROM Customer 
WHERE apellido like 'M%';

/* Query 2 */

SELECT *
FROM Customer
WHERE date_format(fecha_de_nacimiento,'%m/%d') = DATE_FORMAT(NOW(),'%m/%d')
;

/* Query 3 */

SELECT date_format(fecha_order,'%d') dia,count(ID_order) as ventas, count(cantidad) as productos, SUM(monto_total) as total_ventas
FROM orders
Where date_format(fecha_order,'%Y/%m') = 2020/01
Group by date_format(fecha_order,'%d') 
;

/* Query 4 */

SELECT DATE_FORMAT(fecha_order,'%Y/%m') mesyaño,nombre,apellido,SUM(cantidad) as cantidad_vendida,SUM(monto_total) as monto_total_transaccionado
FROM customer CR
INNER JOIN orders OS
ON CR.id_item = OS.id_item
INNER JOIN item IT
ON CR.ID_item = IT.ID_item
WHERE date_format(fecha_order,'%Y') = 2019 and item = 'viandas' and ID_customer_type = 2 /* ID_customer_type = 2 es VENDEDOR */
GROUP BY DATE_FORMAT(fecha_order,'%m') 
ORDER BY monto_total_transaccionado DESC
LIMIT 5
;  

/* Query 5 */

DELIMITER //
CREATE PROCEDURE ins_precio_estadoitem(
 IN _precio NUMERIC(30,2),
 IN _estadoitem INT 
)
BEGIN 
	INSERT INTO  precio_estadoitem (precio,estadoitem) VALUES (_precio,_estadoitem)
END
//

CREATE EVENT Actualizaciondiaria
ON SCHEDULE EVERY 1 DAY STARTS '00:00:01'
DO UPDATE ins_precio_estadoitem
   

 /* Query 6 */
 
DELIMITER//
 CREATE TRIGGER upd_category
 AFTER UPDATE ON item FOR EACH ROW
 BEGIN
   IF (old.id_item != new.id_item)
   THEN
   INSERT INTO nueva_tabla (ID_Category, descripcion, id_subcategory,LastUpdated)
   VALUES  new.ID_category , new.descripcion, new.id_subcategory, new.LastUpdated
   END IF;
   END
   //
   

   
   
  




