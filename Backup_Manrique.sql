/*Tablas incluidas en el backup
ACTOR
CLIENTE
DISTRIBUIDORA
EMPLEADO
FUNCION
LOG_AUDITORIA
LOG_AUDITORIA_CLIENTES
LOG_AUDITORIA_PELICULAS
PELIULA
PRECIO
SALA
SUCURSAL
TICKET
TIPO_PAGO
*/

-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_cine
-- ------------------------------------------------------
-- Server version	5.7.35-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actor` (
  `id_actor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int(10) unsigned NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `dirección` varchar(60) NOT NULL,
  `num_telefonico` int(10) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribuidora`
--

DROP TABLE IF EXISTS `distribuidora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidora` (
  `id_ditribución` int(10) unsigned NOT NULL,
  `compañia` varchar(30) DEFAULT NULL,
  `tipo_estreno` varchar(30) DEFAULT NULL,
  `recaudación` int(20) unsigned DEFAULT NULL,
  `origen` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_ditribución`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int(10) unsigned NOT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `salario` int(11) DEFAULT NULL,
  `id_sucursal_ciudad` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `función`
--

DROP TABLE IF EXISTS `función`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `función` (
  `id_función` int(10) unsigned NOT NULL,
  `fecha_función` date NOT NULL,
  `horario_función` time NOT NULL,
  PRIMARY KEY (`id_función`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `ID_LOG` int(11) NOT NULL AUTO_INCREMENT,
  `CAMPONUEVO_CAMPOANTERIOR` varchar(255) DEFAULT NULL,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA_UPD_INS_DEL` date DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria_clientes`
--

DROP TABLE IF EXISTS `log_auditoria_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_clientes` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(10) unsigned NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `dirección` varchar(60) NOT NULL,
  `num_telefonico` int(10) NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `nombre_de_accion` varchar(10) DEFAULT NULL,
  `nombre_tabla` varchar(50) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha_upd` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_auditoria_peliculas`
--

DROP TABLE IF EXISTS `log_auditoria_peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_peliculas` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `clasificación` varchar(60) DEFAULT NULL,
  `nombre_de_accion` varchar(10) DEFAULT NULL,
  `nombre_tabla` varchar(50) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `fecha_upd` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio` (
  `id_precio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `num_entradas` tinyint(4) DEFAULT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id_sala` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_sala` varchar(20) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `ubicacion_asiento` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `id_sucursal` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `departamento` varchar(30) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `dirección` varchar(60) DEFAULT NULL,
  `num_empleados` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sucursal`),
  CONSTRAINT `fk_id_empleado` FOREIGN KEY (`id_sucursal`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id_ticket` int(10) unsigned NOT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `tipo_pago_id_tipo_pago` int(10) unsigned NOT NULL,
  `precio_id_precio` int(10) unsigned NOT NULL,
  `pelicula_id_pelicula` int(10) unsigned NOT NULL,
  `sucursal_id_sucursal1` int(10) unsigned NOT NULL,
  `cliente_id_cliente` int(10) unsigned NOT NULL,
  `función_id_función` int(10) unsigned NOT NULL,
  `sala_id_sala` int(10) unsigned NOT NULL,
  `empleado_id_empleado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_ticket`,`sucursal_id_sucursal1`,`cliente_id_cliente`,`función_id_función`,`sala_id_sala`,`empleado_id_empleado`),
  KEY `fk_ticket_tipo_pago1_idx` (`tipo_pago_id_tipo_pago`),
  KEY `fk_ticket_precio1_idx` (`precio_id_precio`),
  KEY `fk_ticket_pelicula1_idx` (`pelicula_id_pelicula`),
  KEY `fk_ticket_sucursal2_idx` (`sucursal_id_sucursal1`),
  KEY `fk_ticket_cliente1_idx` (`cliente_id_cliente`),
  KEY `fk_ticket_función1_idx` (`función_id_función`),
  KEY `fk_ticket_sala1_idx` (`sala_id_sala`),
  KEY `fk_ticket_empleado1_idx` (`empleado_id_empleado`),
  CONSTRAINT `fk_ticket_cliente1` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_empleado1` FOREIGN KEY (`empleado_id_empleado`) REFERENCES `empleado` (`id_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_función1` FOREIGN KEY (`función_id_función`) REFERENCES `función` (`id_función`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_pelicula1` FOREIGN KEY (`pelicula_id_pelicula`) REFERENCES `pelicula` (`id_pelicula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_precio1` FOREIGN KEY (`precio_id_precio`) REFERENCES `precio` (`id_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_sala1` FOREIGN KEY (`sala_id_sala`) REFERENCES `sala` (`id_sala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_sucursal2` FOREIGN KEY (`sucursal_id_sucursal1`) REFERENCES `sucursal` (`id_sucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_tipo_pago1` FOREIGN KEY (`tipo_pago_id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_tipo_pago` varchar(30) DEFAULT NULL,
  `descripción` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-21 20:22:13
