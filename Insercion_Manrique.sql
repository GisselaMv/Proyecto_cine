use Proyecto_cine;-- nombramos la DB 
/*INSERCION DE LA TABLAS*/

#INSERCIÓN A LA TABLA EMPLEADO
INSERT INTO  `proyecto_cine`.`empleado`
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) VALUES 
('100001','Administración', 'Livia Monica', 'Muñoz Carrasco','1982-06-02',1800,1),
('100002','Administración', 'Jorge Enrique', 'Rodriguez Alcarraz','1994-08-12',1800,1),
('100003','RR.HH', 'Eddie ', 'Torres Vega','1970-05-08',2000,2),
('100004','Atención al cliente', 'Naomi', 'Perez Gamarra','1990-03-13',1100,3),
('100005','Atención al cliente', 'Flavia Stephany', 'Duarez Jimenez','2000-09-05',1100,4),
('100006','Marketing', 'Pablo Felipe', 'Hernandez Quiroz','1987-04-14',2500,5),
('100007','Administración', 'Silvia Maria', 'Fernandez Quispe','1979-01-18',1800,5),
('100008','Marketing', 'Hector', 'Gomez Ramirez','1982-05-25',2500,2),
('100009','Contabilidad', 'Samuel Esteban', 'Manrique Pie ','1983-04-13',1800,2),
('100010','Administración', 'Carla', 'Nuñez Melendez','1996-07-06',1800,6),
('100011','Atención al cliente', 'Pedro Charlie', 'Perez Hurtado','1992-02-22',1100,7),
('100012','Marketing', 'Isabela Linda', 'Gamma Espinoza','1984-10-14',2500,6),
('100013','Marketing', 'Sofia ', 'Valera Contreras','1986-12-30',2500,1),
('100014','RR.HH', 'Andrea Gabriela', 'Alcarraz Mariño','1991-11-08',2000,7),
('100015','Contabilidad', 'Javier Lucas', 'Becerra Peña','1992-02-20',1800,8),
('100016','Marketing', 'Nadia ', 'Mendoza Soto','1976-03-27',2500,10),
('100017','Administración', 'Rodrigo Gustavo', 'Manivarez Diaz','1993-08-06',1800,9),
('100018','RR.HH', 'Olivia', 'LLoclla Ramos','1977-10-18',2000,7),
('100019','Atención al cliente', 'Harry Lorenzo', 'Mendes Cabello','2001-02-15',1100,5),
('100020','Atención al cliente', 'Jaime ', 'Barrantes Valera','1970-09-28',1100,2),
('100021','Marketing', 'Maria del Carmen', 'Rosales Muñoz','1997-03-05',2500,9),
('100022','Atención al cliente', 'Pamela', 'Lopez Valdivia','1986-08-26',1100,8),
('100023','Contabilidad', 'Cristian Patricio', 'Carrasco Cueva','1989-07-31',1800,8),
('100024','Atención al cliente', 'Joel Guillermo', 'Aguilar Perez','1987-04-08',1100,6),
('100025','Atención al cliente', 'Natalia', 'Lino Garcia','1972-12-29',1100,5),
('100026','Contabilidad', 'Nelly Victoria', 'Humala Vargas','1982-01-12',1800,4),
('100027','Marketing', 'Omar', 'Nuñez Bolañoz','1990-04-30',2500,3),
('100028','Administración', 'Jimena Jamile', 'Diaz Retamozo','1995-05-06',1800,3),
('100029','Atención al cliente', 'Emiliano ', 'Juarez Sotelo','1979-02-19',1100,2),
('100030','RR.HH', 'Mario James ', 'Sandoval Smith','1996-06-27',2000,10);
select*from `proyecto_cine`.`empleado`;

-- INSERCIÓN POR IMPORTACIÓN EN TABLA CLIENTE
select*from `proyecto_cine`.`cliente`;

#INSERCIÓN A LA TABLA SUCURSAL
INSERT INTO `proyecto_cine`.`sucursal`
(departamento,ciudad,dirección,num_empleados) VALUES 
('Ica','El Carmen', 'Urb.Los Lirios Mz K Lt 10',2),
('Lima','Los Olivos', 'Urb.Satelite Santa Rosa ,Calle 18',3),
('Lima','La Marina', 'Urb.Ramón Castilla ,Calle 45',4),
('Lima','Callao', 'Urb.Satelite Santa Rosa Mz H Lt 12 ',3),
('Lima','La Molina', 'Av.Stephen Hawking Mz K Lt 20',2),
('Lima','Chorrillos', 'Av. Defensores del Morro, Calle 21 ',1),
('Lima','Independencia', 'Av.Elmer Faucett ,Calle 15',2),
('Lima','Surco', 'Urb.Los Proceres Mz M Lt 50',1),
('Arequipa','Mollendo', 'Urb.Los Jazmines Mz K Lt 10',2),
('Loreto','Iquitos', 'Urb.Los Lirios Mz K Lt 10',3);
select*from `proyecto_cine`.`sucursal`;

#INSERCIÓN A LA TABLA PELICULA
SET FOREIGN_KEY_CHECKS=0;
INSERT INTO `proyecto_cine`.`pelicula` 
(titulo,duración,genero,idioma,clasificación,fecha_estreno,director) VALUES
('Todo en todas partes al mismo tiempo','2h 20 min', 'Ciencia ficción/Aventura ','Ingles','+14 años','2022-06-30',' Dan Kwan'),
('Lightyear','1h 45 min', 'Aventura/Comedia','Español','PG','2022-06-28','Angus MacLane'),
('Minions 2 nace un villano','1h 27 min', 'Aventura/Comedia','Español','PG','2022-07-01','Kyle Balda'),
('Elvis','2h 39 min', 'Musical/Drama','Ingles','+12 años','2022-07-06','Baz Luhrmann'),
('The Black Phone','1h 44 min', 'Terror/Suspenso','Español','+14 años','2022-06-24','Scott Derrickson'),
('Thor: Love and Thunder','1h 59 min', ' Acción/Aventura','Español','+14 años','2022-07-06','Taika Waititi'),
('Jurassic World: Dominion','2h 27 min', 'Ciencia ficción/Acción','Español','PG','2022-06-10','Colin Trevorrow'),
('DC Liga de Supermascotas','1h 45 min', 'Aventura/Acción','Español','PG','2022-07-25','Jared Stern'),
('El exorcismo de Dios','1h 29 min', 'Terror/Drama','Ingles','+18 años','2022-07-20','Alejandro Hidalgo'),
('Tren Bala','2h 06 min', 'Acción/Suspenso','Español','+14 años','2022-07-29','David Leitch');
SELECT*FROM  `proyecto_cine`.`pelicula` ;


#INSERCIÓN A LA TABLA FUNCIÓN
INSERT INTO `proyecto_cine`.`función` (id_función,fecha_función,horario_función) VALUES
('10001','2022-08-01','13:12:45'),('10002','2022-07-31','15:21:45'),('10003','2022-08-03','16:20:45'),
('10004','2022-08-10','18:00:00'),('10005','2022-07-15','13:42:45'),('10006','2022-07-28','14:42:45'),
('10007','2022-08-06','17:12:45'),('10008','2022-07-29','18:12:45'),('10009','2022-08-09','19:12:45'),
('10010','2022-07-25','20:00:00'),('10011','2022-07-29','21:12:45'),('10012','2022-08-05','22:00:00'),
('10013','2022-08-03','13:12:45'),('10014','2022-07-26','11:00:00'),('10015','2022-07-31','14:12:45'),
('10016','2022-08-02','20:30:00'),('10017','2022-08-04','21:12:45'),('10018','2022-07-15','17:12:45'),
('10019','2022-07-10','18:12:45'),('10020','2022-07-01','15:12:45'),('10021','2022-08-08','22:00:00'),
('10022','2022-07-15','13:12:45'),('10023','2022-06-15','12:12:45'),('10024','2022-07-28','17:12:45'),
('10025','2022-07-25','15:12:45'),('10026','2022-08-05','16:12:45'),('10027','2022-07-26','22:12:45'),
('10028','2022-07-16','21:12:45'),('10029','2022-06-30','17:12:45'),('10030','2022-07-20','12:12:45'),
('10031','2022-06-25','11:12:45'),('10032','2022-07-16','18:12:45'),('10033','2022-08-03','12:12:45'),
('10034','2022-07-19','13:12:45'),('10035','2022-08-02','18:12:45'),('10036','2022-08-10','15:12:45'),
('10037','2022-08-01','18:12:45'),('10038','2022-07-30','14:12:45'),('10039','2022-06-30','12:12:45'),
('10040','1982-07-15','15:12:45'),('10041','2022-07-20','14:12:45'),('10042','2022-07-25','11:12:45'),
('10043','2022-07-05','22:12:45'),('10044','2022-06-15','21:12:45'),('10045','2022-07-18','18:12:45'),
('10046','2022-08-02','15:12:45'),('10047','2022-08-05','17:12:45'),('10048','2022-07-24','14:12:45'),
('10049','2022-07-25','13:12:45'),('10050','2022-08-10','20:12:45');
select*from `proyecto_cine`.`función`;


#INSERCIÓN A LA TABLA SALA
INSERT INTO `proyecto_cine`.`sala`
(tipo_sala,capacidad,ubicacion_asiento) VALUES
('Tradicional',120,'1A'),('VIP',100,'1A'),('D-Box',120,'1A'),
('Tradicional',120,'6U'),('VIP',100,'14J'),('D-Box',120,'1A'),
('Tradicional',120,'14O'),
('VIP',100,'3H'),
('Premium',100,'5H'),
('D-Box',120,'1A'),
('Tradicional',120,'15A'),
('VIP',100,'6U'),
('D-Box',120,'7H'),
('Tradicional',120,'12T'),
('VIP',100,'6G'),
('D-Box',120,'15A'),
('Tradicional',120,'8C'),
('VIP',100,'3B'),
('D-Box',120,'4A'),
('Tradicional',120,'2A');
select*from `proyecto_cine`.`sala`;

-- INSERCIÓN POR IMPORTACIÓN EN TABLA DISTRIBUIDORA
select*from `proyecto_cine`.`distribuidora` ;

#INSERCIÓN A LA TABLA ACTOR
INSERT INTO `proyecto_cine`.`actor` (nombre,fecha_nacimiento) VALUES
('Brad Pitt','1963-12-18'),
('Joey King','1999-07-30'),
('Sandra Bullock','1964-07-26'),
('Logan Lerman','1992-01-19'),
('Ethan Hawke','1970-11-06'),
('James Ransone','1979-06-02'),
('Steve Carell','1962-08-16'),
('Julie Andrews','1935-10-01'),
('Jean-Claude Van Damme','1960-10-18'),
('Michelle Yeoh','1962-08-06'),
('Jonathan Ke Quan','1971-08-20'),
('Jamie Lee Curtis','1958-11-22'),
('Stephanie Hsu','1990-11-25'),
('James Hong','1929-02-22'),
('Dwayne Johnson','1972-05-02'),
('John Krasinsk','1979-10-20'),
('María Gabriela de Faría','1992-09-11'),
('Austin Butler','1991-08-17'),
('Tom Hanks','1956-07-09'),
('Kodi Smit-McPhe','1996-06-13');
select*from`proyecto_cine`.`actor`;

#INSERCIÓN A LA TABLA TIPO DE PAGO
INSERT INTO  `proyecto_cine`.`tipo_pago` (nombre_tipo_pago,descripción) VALUES
('Efectivo','Completo'),
('Debito','VISA'),
('Credito','VISA');
select*from `proyecto_cine`.`tipo_pago`;


#INSERCIÓN A LA TABLA PRECIO
INSERT INTO `proyecto_cine`.`precio` (nombre,num_entradas,valor) VALUES
('Ramon',2,34),('Carlos',1,17),('Nataly',3,51),
('Beatriz',2,34),('Armando',4,68),('Patricia',2,34),
('Danna',3,51),('Jimena',1,17),('Luis',2,34),
('Alberto',1,17),('Mario',2,34),('Silvia',5,85),
('Amy',4,68),('Luisa',2,34),('Rogelio',3,51),
('Martina',4,68),('Clara',1,17),('Bertha',2,34),
('Leonardo',3,51),('Veronica',1,17),('Victor',2,34),
('Pablo',2,34),('Jean Carlos',1,17),('Catalina',2,34),
('Dominic',3,51),('Gissela',5,85),('Maria',3,51),
('Margarita',4,68),('Mia',2,34),('Eduardo',3,51),
('Karin',4,68),('Felipe',2,34),('Luciana',2,34),
('Alfredo',1,17),('Indira',3,51),('Dora',2,34),
('Alessia',1,17),('Joaquin',1,17),('Matias',1,17),
('Melany',2,34),('Elena',4,68),('Edwin',2,34),
('Yakelyn',3,51),('Ignacio',4,68),('Brenda',2,34),
('Brandon',2,34),('Guillermo',1,17),('Tommy',3,51),
('Ana',2,34),('Adrian',3,51);
select*from `proyecto_cine`.`precio`;

SET FOREIGN_KEY_CHECKS=0;
INSERT INTO  `proyecto_cine`.`ticket`
(id_ticket,fecha_emision,tipo_pago_id_tipo_pago,precio_id_precio,pelicula_id_pelicula,
sucursal_id_sucursal1,cliente_id_cliente,función_id_función,sala_id_sala,empleado_id_empleado) VALUES 
(10000001,'2022-08-01 18:30:18',1,1,31,1,1001,10001,1,'100004'),
(10000002,'2022-07-31 12:30:18',2,1,32,1,1002,10002,1,'100004'),
(10000003,'2022-08-03 11:00:15',3,2,33,2,1003,10003,2,'100005'),
(10000004,'2022-08-10 15:30:00',5,3,35,3,1004,10004,1,'100011'),
(10000004,'2022-08-10 15:30:00',5,3,35,3,1004,10004,1,'100011'),
(10000005,'2022-07-15 12:30:45',5,2,31,2,1005,10005,3,'100005'),
(10000006,'2022-07-28 14:00:10',6,1,32,4,1006,10006,1,'100019'),
(10000007,'2022-08-06 16:30:18',7,1,38,3,1007,10007,4,'100020'),
(10000008,'2022-07-29 15:45:18',8,2,40,3,1008,10008,5,'100011'),
(10000009,'2022-08-09 18:30:18',9,3,35,10,1009,10009,6,'100029'),
(10000010,'2022-07-25 19:30:18',10,3,32,5,1010,10010,7,'100020'),
(10000011,'2022-07-29 20:00:12',11,2,31,7,1011,10011,10,'100024'),
(10000012,'2022-08-05 20:30:18',12,1,36,10,1012,10012,11,'100029'),
(10000013,'2022-08-03 12:45:18',13,2,38,1,1013,10013,4,'100004'),
(10000014,'2022-07-26 10:30:45',14,3,37,2,1014,10014,12,'100005'),
(10000015,'2022-07-31 13:30:08',15,2,33,3,1015,10015,13,'100011'),
(10000016,'2022-08-02 18:30:18',16,1,31,9,1016,10016,14,'100025'),
(10000017,'2022-08-04 17:45:23',17,2,32,7,1017,10017,12,'100024'),
(10000018,'2022-07-15 16:45:23',18,3,40,7,1018,10018,8,'100024'),
(10000019,'2022-07-10 15:30:18',19,1,38,2,1019,10019,15,'100005'),
(10000020,'2022-07-01 17:30:26',20,1,34,1,1020,10020,19,'100004'),
(10000021,'2022-08-08 21:30:18',21,2,33,5,1021,10021,16,'100020'),
(10000022,'2022-07-15 12:30:18',22,3,32,2,1022,10022,3,'100005'),
(10000023,'2022-06-15 11:00:08',23,3,32,1,1023,10023,17,'100004'),
(10000024,'2022-07-28 16:30:38',24,3,36,4,1024,10024,18,'100019'),
(10000025,'2022-07-25 15:00:18',25,2,37,7,1025,10025,19,'100024'),
(10000026,'2022-08-05 15:45:10',26,1,38,2,1026,10026,20,'100005'),
(10000027,'2022-07-26 20:00:18',27,2,39,3,1027,10027,2,'100011'),
(10000028,'2022-07-1  19:50:49',28,2,40,3,1028,10028,9,'100011'),
(10000029,'2022-06-30 14:30:18',29,1,31,2,1029,10029,10,'100005'),
(10000030,'2022-07-20 11:10:27',30,1,33,6,1030,10030,17,'100022'),
(10000031,'2022-06-25 10:30:18',31,1,36,4,1031,10031,3,'100019'),
(10000032,'2022-07-16 10:35:25',32,3,37,3,1032,10032,4,'100011'),
(10000033,'2022-08-03 11:00:25',33,3,32,1,1033,10033,5,'100004'),
(10000034,'2022-07-19 13:00:58',34,2,33,9,1034,10034,15,'100025'),
(10000035,'2022-08-02 18:00:53',35,1,31,1,1035,10035,19,'100004'),
(10000036,'2022-08-10 15:25:28',36,2,35,10,1036,10036,4,'100029'),
(10000037,'2022-08-01 16:50:18',37,3,40,1,1037,10037,1,'100004'),
(10000038,'2022-07-30 14:00:18',38,1,37,4,1038,10038,2,'100019'),
(10000039,'2022-06-30 11:45:48',39,2,32,1,1039,10039,1,'100004'),
(10000040,'2022-07-15 14:20:00',40,1,31,7,1040,10040,18,'100024'),
(10000041,'2022-07-20 13:30:18',41,2,40,9,1041,10041,17,'100025'),
(10000042,'2022-07-25 10:50:18',42,1,39,4,1042,10042,20,'100019'),
(10000043,'2022-07-05 21:30:00',43,3,38,7,1043,10043,14,'100024'),
(10000044,'2022-06-15 20:30:18',44,3,39,9,1044,10044,11,'100025'),
(10000045,'2022-07-18 15:45:30',45,2,35,3,1045,10045,8,'100011'),
(10000046,'2022-08-02 13:00:58',46,1,34,2,1046,10046,5,'100005'),
(10000047,'2022-08-05 16:30:18',47,1,33,4,1047,10047,3,'100019'),
(10000048,'2022-07-24 13:25:45',48,2,33,1,1048,10048,18,'100004'),
(10000049,'2022-07-25 11:30:18',49,1,37,2,1049,10049,2,'100005'),
(10000050,'2022-08-10 17:00:18',50,1,31,7,1050,10050,20,'100024');
select*from  `proyecto_cine`.`ticket` ;    