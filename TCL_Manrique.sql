use Proyecto_cine;-- nombramos la DB 
#TRANSACCIONES
select @@autocommit;
set @@autocommit=0;#estado
#PARA LA TABLA 1
select*from cliente;#mostrar todos os registros de cliente
start transaction;#iniciar la transaccion
#eliminar registros de clientes por su nombre
delete from cliente where nombres='Ana';
delete from cliente where nombres='Tommy';
delete from cliente where nombres='julio';
delete from cliente where nombres='Guillermo';
delete from cliente where nombres='Brandon';
delete from cliente where nombres='Brenda';
SET SQL_SAFE_UPDATES=0;
SET FOREIGN_KEY_CHECKS=0; 
rollback;#desahacer
commit;#confirmar
#re-ingresar
/*
insert into cliente(id_cliente,nombres,apellidos,fecha_nacimiento,dirección,num_telefonico,correo)values
(1045,Brenda,"Maldonado Bustos",1997-08-02,"Av. AngÃ©lica Gamarra de LeÃ³n Velarde 1361",995765257,'Brenda1520@gmail.com'),
(1046,Brandon,"Pino Palma",1997-08-03,"Urb. Las Praderas de LurÃ­n,Calle 04",995765260,'Brandon2674@Hotmail.com'),
(1047,Guillermo,"Moreno Carvajal",1995-08-04,"Urb. PrÃ³ceres de la independencia 2555 ",995765263,'Guillermo1520@gmail.com'),
(1048,Julio,"Navarrete Bustamante",1984-12-05,"Av. El Sol Urb. La CampiÃ±a",995765266,'Julio2674@Hotmail.com'),
(1049,Tommy,"Toro Ortega",1976-11-06,"Jr. Chinchaysuyo 710",995765269,'Tommy1520@gmail.com'),
(1050,Ana,"Guerrero Figueroa",2001-08-07,"Urb. Santa Catalina,Calle 15",995765272,'Ana2674@Hotmail.com');
*/



-- PARA LA TABLA 2
start transaction;#iniciar la transaccion
#INSERTAR LOS REGISTRO DE EMPLEADO
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100031','Marketing', 'Ammy Rosa', 'Lopez Cabral','1998-03-28',2500,9);
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100032','Atención al cliente', 'Melissa', 'Nuñez Garcia','1987-08-30',1100,8);
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100033','Contabilidad', 'Jhon', 'Valdivia Maldivieso','1989-07-31',1800,8);
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100034','Atención al cliente', 'Felipe Lorenzo', 'Gonzales Kaplan','1987-04-08',1100,6);
savepoint sp1;#PUEDE CONFIRMAR O DESHACER
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100035','Atención al cliente', 'Lidia Diana', 'Bravo Montero','1972-12-29',1100,5);
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100036','Contabilidad', 'Leandro ', 'Cruz Rincón','1982-01-12',1800,4);
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100037','Marketing', 'Diego Enrique', 'Sandoval Bolañoz','1990-04-30',2500,3);
insert into empleado
(id_empleado,cargo,nombres,apellidos,fecha_nacimiento,salario,id_sucursal_ciudad) values
('100038','Administración', 'Jimena Selena', 'Diaz Avila','1995-05-06',1800,3);
savepoint sp2;#PUEDE CONFIRMAR O DESHACER

release savepoint sp1;-- eliminando el savepoint 1
rollback;
select*from  empleado;#mostrar la tabla empleado