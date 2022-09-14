use Proyecto_cine;-- nombramos la DB 
#TRIGGERS
#TRIGGGER 1
#CREAMOS UNA TABLA DE AUDITORIA CLIENTES
drop table if  exists LOG_AUDITORIA_CLIENTES;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_CLIENTES(
id_log INT AUTO_INCREMENT ,
id_cliente INT UNSIGNED NOT NULL,
nombres VARCHAR(50) NOT NULL,
apellidos VARCHAR(50) NOT NULL,
fecha_nacimiento DATE NULL DEFAULT NULL,
dirección VARCHAR(60) NOT NULL,
num_telefonico INT(10) NOT NULL,
correo VARCHAR(50) NULL DEFAULT NULL,
nombre_de_accion VARCHAR(10) ,
nombre_tabla VARCHAR(50) ,
usuario VARCHAR(100) ,
fecha_upd DATE   ,
hora TIME,
PRIMARY KEY (id_log)
);

#CREAMOS UN TRIGGER PARA CLIENTES AL INGRESAR NUEVOS REGISTROS 
DROP TRIGGER TRG_LOG_CLIENTES ;
DELIMITER //
CREATE TRIGGER TRG_LOG_CLIENTES AFTER INSERT ON Proyecto_cine.cliente
FOR EACH ROW 
BEGIN
INSERT INTO LOG_AUDITORIA_CLIENTES(id_cliente,nombres , apellidos,fecha_nacimiento,dirección,num_telefonico,correo,
 nombre_de_accion , nombre_tabla ,usuario, fecha_upd,hora)
VALUES (NEW.id_cliente, NEW.nombres  ,NEW.apellidos,NEW.fecha_nacimiento,NEW.dirección,NEW.num_telefonico,
NEW.correo, 'INSERT' , 'CLIENTE' ,CURRENT_USER(), NOW(),CURTIME());
END//
DELIMITER ;

#INSERTAMOS REGISTROS DE LA TABLA CLIENTE
INSERT INTO  `proyecto_cine`.`cliente`
(id_cliente,nombres,apellidos,fecha_nacimiento,dirección,num_telefonico,correo) VALUES 
('1051','Brunno', 'Sandoval Silva','1982-06-22','Av.Mariano Melgar,Etapa 10',995765273,'Bruno8567@Hotmail.com');

INSERT INTO  `proyecto_cine`.`cliente`
(id_cliente,nombres,apellidos,fecha_nacimiento,dirección,num_telefonico,correo) VALUES 
('1052','Mia', 'Bracamonte Diaz','1994-08-13','Av. Universitaria  Nº 120',995765274,'Mia2489@Hotmail.com'),
('1053','Freddy', 'Hernandez Solar', '1970-05-18','Urb Santa Catalina Calle 20',995765275,'Freddy1059@Hotmail.com'),
('1054','Leonela', 'Quispe Guitierrez','1990-03-03','Av Nicolas de Pierola Etapa 1',995765276,'Leonela2674@Hotmail.com');
#VERIFICAMOS SI CUMPLIO CON LO SOLICITADO LA TABLA CLIENTE Y LA TABLA AUITORIA  
select*from cliente;
select*from LOG_AUDITORIA_CLIENTES;

#TRIGGGER 2
#CREAMOS UNA TABLA DE AUDITORIA PELICULAS
drop table if  exists LOG_AUDITORIA_PELICULAS;
CREATE TABLE IF NOT EXISTS LOG_AUDITORIA_PELICULAS(
id_log INT AUTO_INCREMENT ,
titulo varchar(50) DEFAULT NULL,
clasificación varchar(60) DEFAULT NULL,
nombre_de_accion VARCHAR(10) ,
nombre_tabla VARCHAR(50) ,
usuario VARCHAR(100) ,
fecha_upd DATE   ,
hora TIME,
PRIMARY KEY (id_log)
);
#CREAMOS UN TRIGGER PARA PELICULAS AL INGRESAR NUEVOS REGISTROS 
DROP TRIGGER IF EXISTS TRG_LOG_PELICULAS  ;
DELIMITER //
CREATE TRIGGER TRG_LOG_PELICULAS  BEFORE  UPDATE ON Proyecto_cine.pelicula
FOR EACH ROW 
BEGIN
INSERT INTO LOG_AUDITORIA_PELICULAS(clasificación,titulo,nombre_de_accion , nombre_tabla ,usuario, fecha_upd ,hora)
VALUES ( concat('Campo anterior : ', OLD.clasificación,'  Campo nuevo : ' , NEW.clasificación) ,
		NEW.titulo ,'UPDATE' ,'PELICULA' ,CURRENT_USER(),NOW(),curtime()
        );
END//
DELIMITER ;
#ACTUALIZAMOS LA CLASIFICACION DE LA PELICULA DE LA TABLA 
UPDATE Proyecto_cine.pelicula SET clasificación='+14 años'  WHERE  titulo ='El exorcismo de Dios' ;#+16
UPDATE Proyecto_cine.pelicula SET clasificación='+12 años'  WHERE  titulo ='Thor: Love and Thunder';#+14
#VERIFICAMOS SI CUMPLIO CON LO SOLICITADO LA TABLA PELICULA Y LA TABLA AUITORIA  
select*from pelicula;
select*from LOG_AUDITORIA_PELICULAS;