/*CREACION DE  LA BASE DE DATOS*/
create database Proyecto_cine;
use Proyecto_cine;
drop database proyecto_cine;

/*CREACIÓN DE LAS TABLAS*/
#EMPLEADO
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`empleado` (
  `id_empleado` INT(10) UNSIGNED NOT NULL,
  `cargo` VARCHAR(30) NULL DEFAULT NULL,
  `nombres` VARCHAR(40) NULL DEFAULT NULL,
  `apellidos` VARCHAR(40) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `salario` INT(11) NULL DEFAULT NULL,
  `id_sucursal_ciudad` INT(10) NULL DEFAULT NULL,
    PRIMARY KEY (`id_empleado`)
  );
#SUCURSAL
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`sucursal` (
  `id_sucursal` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `departamento` VARCHAR(30) NULL DEFAULT NULL,
  `ciudad` VARCHAR(30) NULL DEFAULT NULL,
  `dirección` VARCHAR(60) NULL DEFAULT NULL,
  `num_empleados` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  CONSTRAINT `fk_id_empleado` FOREIGN KEY (`id_sucursal`) REFERENCES `empleado` (`id_empleado`)
  );
 #CLIENTE 
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`cliente` (
  `id_cliente` INT(10) UNSIGNED NOT NULL,
  `nombres` VARCHAR(50) NOT NULL,
  `apellidos` VARCHAR(50) NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `dirección` VARCHAR(60) NOT NULL,
  `num_telefonico` INT(10) NOT NULL,
  `correo` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`));
SET FOREIGN_KEY_CHECKS=0;
#PELICULA
CREATE TABLE IF NOT EXISTS `pelicula` (
  `id_pelicula` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `duración` varchar(20) DEFAULT NULL,
  `genero` varchar(30) DEFAULT NULL,
  `idioma` varchar(20) DEFAULT NULL,
  `clasificación` varchar(30) DEFAULT NULL,
  `fecha_estreno` date NOT NULL,
  `director` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_pelicula`),
  CONSTRAINT `fk_id_actor` FOREIGN KEY (`id_pelicula`) REFERENCES `actor` (`id_actor`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_pelicula`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `fk_id_ditribución` FOREIGN KEY (`id_pelicula`) REFERENCES `distribuidora` (`id_ditribución`)
);
#FUNCION
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`función` (
  `id_función` INT(10) UNSIGNED NOT NULL,
  `fecha_función` DATE NOT NULL,
  `horario_función` TIME NOT NULL,
  PRIMARY KEY (`id_función`));
#SALA
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`sala` (
  `id_sala` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_sala` VARCHAR(20) NULL DEFAULT NULL,
  `capacidad` INT(11) NULL DEFAULT NULL,
  `ubicacion_asiento` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sala`));
#DISTRIBUIDORA
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`distribuidora` (
  `id_ditribución` INT(10) UNSIGNED NOT NULL,
  `compañia` VARCHAR(30) NULL DEFAULT NULL,
  `tipo_estreno` VARCHAR(30) NULL DEFAULT NULL,
  `recaudación` INT(20) UNSIGNED NULL DEFAULT NULL,
  `origen` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`id_ditribución`));
#ACTOR
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`actor` (
  `id_actor` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_actor`));
#TIPO_PAGO
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`tipo_pago` (
  `id_tipo_pago` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_tipo_pago` VARCHAR(30) NULL DEFAULT NULL,
  `descripción` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pago`));
#PRECIO  
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`precio` (
  `id_precio` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NULL DEFAULT NULL,
  `num_entradas` TINYINT(4) NULL DEFAULT NULL,
  `valor` INT(11) NOT NULL,
  PRIMARY KEY (`id_precio`));
#TICKET
CREATE TABLE IF NOT EXISTS `proyecto_cine`.`ticket` (
  `id_ticket` INT(10) UNSIGNED NOT NULL,
  `fecha_emision` DATETIME NULL DEFAULT NULL,
  `tipo_pago_id_tipo_pago` INT(10) UNSIGNED NOT NULL,
  `precio_id_precio` INT(10) UNSIGNED NOT NULL,
  `pelicula_id_pelicula` INT(10) UNSIGNED NOT NULL,
  `sucursal_id_sucursal1` INT(10) UNSIGNED NOT NULL,
  `cliente_id_cliente` INT(10) UNSIGNED NOT NULL,
  `función_id_función` INT(10) UNSIGNED NOT NULL,
  `sala_id_sala` INT(10) UNSIGNED NOT NULL,
  `empleado_id_empleado` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_ticket`, `sucursal_id_sucursal1`, `cliente_id_cliente`, 
  `función_id_función`, `sala_id_sala`, `empleado_id_empleado`),
  INDEX `fk_ticket_tipo_pago1_idx` (`tipo_pago_id_tipo_pago` ASC) ,
  INDEX `fk_ticket_precio1_idx` (`precio_id_precio` ASC) ,
  INDEX `fk_ticket_pelicula1_idx` (`pelicula_id_pelicula` ASC),
  INDEX `fk_ticket_sucursal2_idx` (`sucursal_id_sucursal1` ASC) ,
  INDEX `fk_ticket_cliente1_idx` (`cliente_id_cliente` ASC) ,
  INDEX `fk_ticket_función1_idx` (`función_id_función` ASC) ,
  INDEX `fk_ticket_sala1_idx` (`sala_id_sala` ASC) ,
  INDEX `fk_ticket_empleado1_idx` (`empleado_id_empleado` ASC) ,
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
CONSTRAINT `fk_ticket_pelicula1`
    FOREIGN KEY (`pelicula_id_pelicula`)
    REFERENCES `proyecto_cine`.`pelicula` (`id_pelicula`)
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