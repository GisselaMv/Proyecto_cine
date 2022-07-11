# Proyecto_DB_Cine
Base de datos que guarda la colección de información y maneja la relación de un modelo de negocio.

#CREACIÓN DE LA BASE DE DATOS
create database Proyecto_cine;
use Proyecto_cine;

#CREACIÓN DE TABLAS
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`empleado` (
 `id_empleado` INT(10) UNSIGNED NOT NULL,
 `cargo` VARCHAR(30) NULL DEFAULT NULL,
 `nombres` VARCHAR(40) NULL DEFAULT NULL,
 `apellidos` VARCHAR(40) NULL DEFAULT NULL,
 `fecha_nacimiento` DATE NULL DEFAULT NULL,
 `salario` INT(11) NULL DEFAULT NULL,
 PRIMARY KEY (`id_empleado`)
 );
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`sucursal` (
 `id_sucursal` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `departamento` VARCHAR(20) NULL DEFAULT NULL,
 `ciudad` VARCHAR(20) NULL DEFAULT NULL,
 `dirección` VARCHAR(30) NULL DEFAULT NULL,
 `num_empleados` INT(11) NULL DEFAULT NULL,
 PRIMARY KEY (`id_sucursal`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`cliente` (
 `id_cliente` INT(10) UNSIGNED NOT NULL,
 `nombres` VARCHAR(50) NOT NULL,
 `apellidos` VARCHAR(50) NOT NULL,
 `fecha_nacimiento` DATE NULL DEFAULT NULL,
 `dirección` VARCHAR(60) NOT NULL,
 `num_telefonico` INT(10) NOT NULL,
 `correo` VARCHAR(50) NULL DEFAULT NULL,
 PRIMARY KEY (`id_cliente`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`pelicula` (
 `id_pelicula` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `titulo` VARCHAR(50) NULL DEFAULT NULL,
 `duración` TINYINT(4) NULL DEFAULT NULL,
 `genero` VARCHAR(20) NULL DEFAULT NULL,
 `idioma` VARCHAR(20) NULL DEFAULT NULL,
 `clasificación` VARCHAR(30) NULL DEFAULT NULL,
 `fecha_estreno` DATE NOT NULL,
 `director` VARCHAR(30) NULL DEFAULT NULL,
 `ticket_id_ticket` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`id_pelicula`, `ticket_id_ticket`),
 INDEX `fk_pelicula_ticket1_idx` (`ticket_id_ticket` ASC) VISIBLE,
 CONSTRAINT `fk_pelicula_ticket1`
 FOREIGN KEY (`ticket_id_ticket`)
 REFERENCES `proyecto_cine`.`ticket` (`id_ticket`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`función` (
 `id_función` INT(10) UNSIGNED NOT NULL,
 `fecha_función` DATE NOT NULL,
 `horario_función` TIME NOT NULL,
 PRIMARY KEY (`id_función`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`sala` (
 `id_sala` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `tipo_sala` VARCHAR(20) NULL DEFAULT NULL,
 `capacidad` INT(11) NULL DEFAULT NULL,
 `ubicacion_asiento` VARCHAR(10) NULL DEFAULT NULL,
 PRIMARY KEY (`id_sala`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`distribuidora` (
 `id_ditribución` INT(10) UNSIGNED NOT NULL,
 `compañia` VARCHAR(30) NULL DEFAULT NULL,
 `tipo_estreno` VARCHAR(30) NULL DEFAULT NULL,
 `recaudación` INT(10) UNSIGNED NULL DEFAULT NULL,
 `espectadores` INT(10) UNSIGNED NULL DEFAULT NULL,
 PRIMARY KEY (`id_ditribución`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`actor` (
 `id_actor` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `nombres` VARCHAR(30) NULL DEFAULT NULL,
 `apellidos` VARCHAR(30) NULL DEFAULT NULL,
 `fecha_nacimiento` DATE NULL DEFAULT NULL,
 PRIMARY KEY (`id_actor`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`tipo_pago` (
 `id_tipo_pago` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `nombre_tipo_pago` VARCHAR(30) NULL DEFAULT NULL,
 `descripción` VARCHAR(20) NULL DEFAULT NULL,
 PRIMARY KEY (`id_tipo_pago`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`precio` (
 `id_precio` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 `nombre` VARCHAR(20) NULL DEFAULT NULL,
 `num_entradas` TINYINT(4) NULL DEFAULT NULL,
 `valor` INT(11) NOT NULL,
 PRIMARY KEY (`id_precio`));
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`ticket` (
 `id_ticket` INT(10) UNSIGNED NOT NULL,
 `fecha_emision` DATETIME NULL DEFAULT NULL,
 `tipo_pago_id_tipo_pago` INT(10) UNSIGNED NOT NULL,
 `precio_id_precio` INT(10) UNSIGNED NOT NULL,
 `sucursal_id_sucursal1` INT(10) UNSIGNED NOT NULL,
 `cliente_id_cliente` INT(10) UNSIGNED NOT NULL,
 `función_id_función` INT(10) UNSIGNED NOT NULL,
 `sala_id_sala` INT(10) UNSIGNED NOT NULL,
 `empleado_id_empleado` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`id_ticket`, `sucursal_id_sucursal1`, `cliente_id_cliente`, `función_id_función`, 
`sala_id_sala`, `empleado_id_empleado`),
 /*INDEX `fk_ticket_tipo_pago1_idx` (`tipo_pago_id_tipo_pago` ASC) VISIBLE,
 INDEX `fk_ticket_precio1_idx` (`precio_id_precio` ASC) VISIBLE,
 INDEX `fk_ticket_sucursal2_idx` (`sucursal_id_sucursal1` ASC) VISIBLE,
 INDEX `fk_ticket_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
 INDEX `fk_ticket_función1_idx` (`función_id_función` ASC) VISIBLE,
 INDEX `fk_ticket_sala1_idx` (`sala_id_sala` ASC) VISIBLE,
 INDEX `fk_ticket_empleado1_idx` (`empleado_id_empleado` ASC) VISIBLE,*/
CONSTRAINT `fk_ticket_tipo_pago1`
 FOREIGN KEY (`tipo_pago_id_tipo_pago`)
 REFERENCES `proyecto_cine`.`tipo_pago` (`id_tipo_pago`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_ticket_precio1`
 FOREIGN KEY (`precio_id_precio`)
 REFERENCES `proyecto_cine`.`precio` (`id_precio`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_ticket_sucursal2`
 FOREIGN KEY (`sucursal_id_sucursal1`)
 REFERENCES `proyecto_cine`.`sucursal` (`id_sucursal`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_ticket_cliente1`
 FOREIGN KEY (`cliente_id_cliente`)
 REFERENCES `proyecto_cine`.`cliente` (`id_cliente`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_ticket_función1`
 FOREIGN KEY (`función_id_función`)
 REFERENCES `proyecto_cine`.`función` (`id_función`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_ticket_sala1`
 FOREIGN KEY (`sala_id_sala`)
 REFERENCES `proyecto_cine`.`sala` (`id_sala`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_ticket_empleado1`
 FOREIGN KEY (`empleado_id_empleado`)
 REFERENCES `proyecto_cine`.`empleado` (`id_empleado`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`empleado_has_sucursal` (
 `empleado_id_empleado` INT(10) UNSIGNED NOT NULL,
 `sucursal_id_sucursal` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`empleado_id_empleado`, `sucursal_id_sucursal`),
 INDEX `fk_empleado_has_sucursal_sucursal1_idx` (`sucursal_id_sucursal` ASC) ,
 INDEX `fk_empleado_has_sucursal_empleado1_idx` (`empleado_id_empleado` ASC) ,
 CONSTRAINT `fk_empleado_has_sucursal_empleado1`
 FOREIGN KEY (`empleado_id_empleado`)
 REFERENCES `proyecto_cine`.`empleado` (`id_empleado`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_empleado_has_sucursal_sucursal1`
 FOREIGN KEY (`sucursal_id_sucursal`)
 REFERENCES `proyecto_cine`.`sucursal` (`id_sucursal`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`sucursal_has_función` (
 `sucursal_id_sucursal` INT(10) UNSIGNED NOT NULL,
 `función_id_función` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`sucursal_id_sucursal`, `función_id_función`),
INDEX `fk_sucursal_has_función_función1_idx` (`función_id_función` ASC) ,
 INDEX `fk_sucursal_has_función_sucursal1_idx` (`sucursal_id_sucursal` ASC) ,
 CONSTRAINT `fk_sucursal_has_función_sucursal1`
 FOREIGN KEY (`sucursal_id_sucursal`)
 REFERENCES `proyecto_cine`.`sucursal` (`id_sucursal`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_sucursal_has_función_función1`
 FOREIGN KEY (`función_id_función`)
 REFERENCES `proyecto_cine`.`función` (`id_función`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`sala_has_función` (
 `sala_id_sala` INT(10) UNSIGNED NOT NULL,
 `función_id_función` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`sala_id_sala`, `función_id_función`),
INDEX `fk_sala_has_función_función1_idx` (`función_id_función` ASC) ,
 INDEX `fk_sala_has_función_sala1_idx` (`sala_id_sala` ASC) ,
 CONSTRAINT `fk_sala_has_función_sala1`
 FOREIGN KEY (`sala_id_sala`)
 REFERENCES `proyecto_cine`.`sala` (`id_sala`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_sala_has_función_función1`
 FOREIGN KEY (`función_id_función`)
 REFERENCES `proyecto_cine`.`función` (`id_función`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`cliente_has_sucursal` (
 `cliente_id_cliente` INT(10) UNSIGNED NOT NULL,
 `sucursal_id_sucursal` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`cliente_id_cliente`, `sucursal_id_sucursal`),
 INDEX `fk_cliente_has_sucursal_sucursal1_idx` (`sucursal_id_sucursal` ASC) ,
 INDEX `fk_cliente_has_sucursal_cliente1_idx` (`cliente_id_cliente` ASC) ,
 CONSTRAINT `fk_cliente_has_sucursal_cliente1`
 FOREIGN KEY (`cliente_id_cliente`)
 REFERENCES `proyecto_cine`.`cliente` (`id_cliente`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_cliente_has_sucursal_sucursal1`
 FOREIGN KEY (`sucursal_id_sucursal`)
 REFERENCES `proyecto_cine`.`sucursal` (`id_sucursal`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`pelicula_has_actor` (
 `pelicula_id_pelicula` INT(10) UNSIGNED NOT NULL,
 `pelicula_ticket_id_ticket` INT(10) UNSIGNED NOT NULL,
 `actor_id_actor` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`pelicula_id_pelicula`, `pelicula_ticket_id_ticket`, `actor_id_actor`),
 INDEX `fk_pelicula_has_actor_actor1_idx` (`actor_id_actor` ASC) ,
 INDEX `fk_pelicula_has_actor_pelicula1_idx` (`pelicula_id_pelicula` ASC, 
`pelicula_ticket_id_ticket` ASC) ,
 CONSTRAINT `fk_pelicula_has_actor_pelicula1`
 FOREIGN KEY (`pelicula_id_pelicula` , `pelicula_ticket_id_ticket`)
 REFERENCES `proyecto_cine`.`pelicula` (`id_pelicula` , `ticket_id_ticket`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_pelicula_has_actor_actor1`
 FOREIGN KEY (`actor_id_actor`)
 REFERENCES `proyecto_cine`.`actor` (`id_actor`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`distribuidora_has_pelicula` (
 `distribuidora_id_ditribución` INT(10) UNSIGNED NOT NULL,
 `pelicula_id_pelicula` INT(10) UNSIGNED NOT NULL,
 `pelicula_ticket_id_ticket` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`distribuidora_id_ditribución`, `pelicula_id_pelicula`, `pelicula_ticket_id_ticket`),
 INDEX `fk_distribuidora_has_pelicula_pelicula1_idx` (`pelicula_id_pelicula` ASC, 
`pelicula_ticket_id_ticket` ASC) ,
 INDEX `fk_distribuidora_has_pelicula_distribuidora1_idx` (`distribuidora_id_ditribución` ASC),
 CONSTRAINT `fk_distribuidora_has_pelicula_distribuidora1`
 FOREIGN KEY (`distribuidora_id_ditribución`)
 REFERENCES `proyecto_cine`.`distribuidora` (`id_ditribución`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_distribuidora_has_pelicula_pelicula1`
 FOREIGN KEY (`pelicula_id_pelicula` , `pelicula_ticket_id_ticket`)
 REFERENCES `proyecto_cine`.`pelicula` (`id_pelicula` , `ticket_id_ticket`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`cliente_has_pelicula` (
 `cliente_id_cliente` INT(10) UNSIGNED NOT NULL,
 `pelicula_id_pelicula` INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (`cliente_id_cliente`, `pelicula_id_pelicula`),
 INDEX `fk_cliente_has_pelicula_pelicula1_idx` (`pelicula_id_pelicula`) ,
 INDEX `fk_cliente_has_pelicula_cliente_idx` (`cliente_id_cliente` ),
 CONSTRAINT `fk_cliente_has_pelicula_cliente`
 FOREIGN KEY (`cliente_id_cliente`)
 REFERENCES `proyecto_cine`.`cliente` (`id_cliente`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `fk_cliente_has_pelicula_pelicula1`
 FOREIGN KEY (`pelicula_id_pelicula`)
 REFERENCES `proyecto_cine`.`pelicula` (`id_pelicula`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION);
