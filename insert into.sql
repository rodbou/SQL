USE challenge;

INSERT INTO customer_type(ID_customer_type,customer_type)
VALUES (1,'cecommerce');

INSERT INTO subcategory(ID_subcategory,descripcion)
VALUES (1,'cha');

INSERT INTO category(ID_category, descripcion,ID_subcategory)
VALUES (1,'cha2',1);

INSERT INTO orders(ID_order,fecha_order,cantidad,monto_total)
VALUES (1000,'2020-01-09',10,1000);

INSERT INTO estado_item(ID_estado_item,estado_item,ID_order)
VALUES (1,'finalizado',1000);


INSERT INTO item(ID_item,item,ID_category,ID_estado_item,fecha_pub,fecha_finalizacion)
VALUES (1,'bic',1,1,'2019-01-05','2020-01-09');

INSERT INTO customer(ID_customer,apellido,nombre,sexo,email,telefono,dirección,fecha_de_nacimiento,ID_customer_type,ID_item)
VALUES (1,'Gutierrez','Fernando','Masculino','c@gmail.com',1111,'Balv','1989/08/23','1',1);

COMMIT; 


