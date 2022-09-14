use Proyecto_cine;-- nombramos la DB 
/*VISTAS*/
#VISTA EMPLEADO
CREATE VIEW view_empleado AS
SELECT nombres,apellidos,cargo,salario
FROM  empleado
WHERE salario>1000;
SELECT * FROM proyecto_cine.view_empleado;
#VISTA ACTOR
CREATE VIEW view_actor AS
SELECT id_actor,nombre
FROM actor
WHERE year(fecha_nacimiento)>1970;
SELECT * FROM proyecto_cine.view_actor;
#VISTA CLIENTE
CREATE VIEW view_cliente AS
SELECT id_cliente,nombres,apellidos,fecha_nacimiento
FROM cliente WHERE apellidos like 'M%' OR nombres like '%do';
SELECT * FROM proyecto_cine.view_cliente;
#VISTA PELICULA
CREATE VIEW view_pelicula AS
SELECT count(*) FROM pelicula
WHERE  clasificación ='+14 años';
SELECT * FROM proyecto_cine.view_pelicula;
#VISTA SALA
CREATE VIEW view_sala
AS SELECT tipo_sala,ubicacion_asiento
FROM sala WHERE  ubicacion_asiento='1A';
SELECT * FROM proyecto_cine.view_sala;