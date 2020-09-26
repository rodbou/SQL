CREATE DATABASE IF NOT EXISTS CHALLENGE;

USE CHALLENGE;

CREATE TABLE IF NOT EXISTS customer_type(ID_customer_type INT NOT NULL,
customer_type VARCHAR(25) NOT NULL,
CONSTRAINT customer_type_pk PRIMARY KEY (ID_customer_type)
);
 

CREATE TABLE IF NOT EXISTS subcategory(ID_subcategory INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(200),
CONSTRAINT subcategory_pk PRIMARY KEY (ID_subcategory)
);

CREATE TABLE IF NOT EXISTS category(ID_category INT NOT NULL AUTO_INCREMENT,
descripcion VARCHAR(200),
ID_subcategory INT NOT NULL, 
CONSTRAINT category_pk PRIMARY KEY (ID_category),
CONSTRAINT subcategory_fk FOREIGN KEY (ID_subcategory) REFERENCES subcategory(ID_subcategory)
);

CREATE TABLE IF NOT EXISTS orders (ID_order INT NOT NULL AUTO_INCREMENT,
fecha_order DATE,
cantidad NUMERIC(50,2),
monto_total NUMERIC(50,2),
CONSTRAINT orders_pk PRIMARY KEY (ID_order)
);


CREATE TABLE IF NOT EXISTS estado_item(ID_estado_item INT NOT NULL AUTO_INCREMENT,
estado_item VARCHAR(200),
id_order INT ,
CONSTRAINT estado_item_pk PRIMARY KEY (ID_estado_item),
CONSTRAINT order_fk FOREIGN KEY (ID_order) REFERENCES orders(ID_order));

CREATE TABLE IF NOT EXISTS Item(ID_item INT NOT NULL AUTO_INCREMENT,
item VARCHAR(200) NOT NULL,
precio_item NUMERIC(50,2) NOT NULL,
ID_category INT NOT NULL,
ID_estado_item INT NOT NULL,
fecha_pub DATE,
fecha_finalizacion DATE,
CONSTRAINT item_pk PRIMARY KEY (ID_item),
CONSTRAINT category_fk FOREIGN KEY (id_category) REFERENCES category(ID_category),
CONSTRAINT estado_item_fk FOREIGN KEY (id_estado_item) REFERENCES estado_item(id_estado_item)
);

CREATE TABLE IF NOT EXISTS Customer(ID_customer INT NOT NULL AUTO_INCREMENT,
apellido VARCHAR(50) NOT NULL,
nombre VARCHAR(50) NOT NULL,
sexo VARCHAR(10),
email VARCHAR(50),
telefono NUMERIC(15),
dirección VARCHAR(50) NOT NULL,
fecha_de_nacimiento DATE,
ID_customer_type INT NOT NULL,
ID_item INT NOT NULL,
CONSTRAINT customer_pk PRIMARY KEY (ID_customer),
CONSTRAINT customer_type_fk FOREIGN KEY (ID_customer_type) REFERENCES customer_type(ID_customer_type),
CONSTRAINT item_fk FOREIGN KEY (ID_item) REFERENCES item(ID_item)
);
  



    	 
	   