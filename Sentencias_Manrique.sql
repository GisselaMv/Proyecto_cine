use proyecto_cine;-- nombramos la DB 
use mysql ;
#usuarios 
select * from user;
/*Crear un 1° usuario */
create user if not exists 'Usuario_cine'@'localhost'
identified by 'usuario123';
/*Permiso de solo lectura sobre todas las tablas*/
grant select on proyecto_cine.* to 'Usuario_cine'@'localhost';

/*Crear un 2° usuario */
create user if not exists 'Usuario_cine2'@'localhost'
identified by 'usuario234';
/*Permiso de lectura,inserción y actualización sobre todas las tablas*/
grant select,insert,update on proyecto_cine.* to 'Usuario_cine2'@'localhost';

 /*Mostar permisos*/
show grants for 'Usuario_cine'@'localhost';
show grants for 'Usuario_cine2'@'localhost';