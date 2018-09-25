-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: evaluacion1
-- ------------------------------------------------------
-- Server version	5.5.61

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `creditos` int(11) DEFAULT NULL,
  `semestres` int(11) DEFAULT NULL,
  `area` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`nombre`,`area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `no_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (2,'juan','perez',NULL,NULL,NULL,NULL),(3,'juan','perez',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `nombre_cliente` varchar(50) NOT NULL DEFAULT '',
  `fecha` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cantidad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES ('juan','2018-09-11 00:00:00',NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `no_control` varchar(10) NOT NULL DEFAULT '',
  `nombre` varchar(50) DEFAULT NULL,
  `Apellido_paterno` varchar(50) DEFAULT NULL,
  `Apellido_materno` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `no_telefono` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_control`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES ('00112233','juan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalles`
--

DROP TABLE IF EXISTS `factura_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_detalles` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `no_factura` int(11) DEFAULT NULL,
  `no_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`clave`),
  KEY `no_factura` (`no_factura`),
  KEY `no_producto` (`no_producto`),
  CONSTRAINT `factura_detalles_ibfk_1` FOREIGN KEY (`no_factura`) REFERENCES `facturas` (`no_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `factura_detalles_ibfk_2` FOREIGN KEY (`no_producto`) REFERENCES `productos` (`no_producto`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalles`
--

LOCK TABLES `factura_detalles` WRITE;
/*!40000 ALTER TABLE `factura_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `no_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` datetime DEFAULT NULL,
  `no_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_factura`),
  KEY `no_cliente` (`no_cliente`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`no_cliente`) REFERENCES `clientes` (`no_cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `materia` varchar(50) DEFAULT NULL,
  `salon` varchar(4) DEFAULT NULL,
  `profesor` varchar(50) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `No_ctrl` varchar(20) DEFAULT NULL,
  `carrera` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestre_actual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `nomre` varchar(100) NOT NULL DEFAULT '',
  `creditos` int(11) DEFAULT NULL,
  `Horas_Teoricas` int(11) DEFAULT NULL,
  `Horas_Practicas` int(11) DEFAULT NULL,
  `Carrera` varchar(3) DEFAULT NULL,
  `semestre` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nomre`,`semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES ('matematicas',NULL,NULL,NULL,NULL,1),('matematicas',NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nueva_carrera`
--

DROP TABLE IF EXISTS `nueva_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nueva_carrera` (
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestres` int(11) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nueva_carrera`
--

LOCK TABLES `nueva_carrera` WRITE;
/*!40000 ALTER TABLE `nueva_carrera` DISABLE KEYS */;
INSERT INTO `nueva_carrera` VALUES ('Sistemas',500,9,'Sistemas y Compotacion'),('Sistemas',500,9,'Sistemas y Compotacion'),('Sistemas',500,9,'Sistemas y Compotacion'),('Sistemas',500,9,'Sistemas y Compotacion'),('Sistemas',500,9,'Sistemas y Compotacion'),('Sistemas',500,9,'Sistemas y Compotacion'),('Sistemas',500,9,'Sistemas y Compotacion');
/*!40000 ALTER TABLE `nueva_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nueva_carrerota`
--

DROP TABLE IF EXISTS `nueva_carrerota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nueva_carrerota` (
  `nombre` varchar(50) DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  `semestres` int(11) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nueva_carrerota`
--

LOCK TABLES `nueva_carrerota` WRITE;
/*!40000 ALTER TABLE `nueva_carrerota` DISABLE KEYS */;
/*!40000 ALTER TABLE `nueva_carrerota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `clave` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(50) NOT NULL,
  `publacion` int(11) DEFAULT '1',
  `continente` enum('Africa','America','Asia','Oceania','Europa') NOT NULL DEFAULT 'Africa',
  PRIMARY KEY (`nombre`,`continente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'mexico',1200000,'America');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona2`
--

DROP TABLE IF EXISTS `persona2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona2` (
  `clave` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `departamento` enum('SISTEMAS','CONTABILIDAD','INHUMANAS','PRODUCCION') DEFAULT NULL,
  `salario` float DEFAULT '1500',
  PRIMARY KEY (`clave`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona2`
--

LOCK TABLES `persona2` WRITE;
/*!40000 ALTER TABLE `persona2` DISABLE KEYS */;
INSERT INTO `persona2` VALUES (1,'RUBEN','Hernandez',NULL,1500),(2,'Juan','Hernandez','SISTEMAS',1500),(3,'x','y','SISTEMAS',500),(5,'v','t',NULL,1500),(6,'huele','a obo','SISTEMAS',500);
/*!40000 ALTER TABLE `persona2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal` (
  `Clave` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `apellido` varchar(50) NOT NULL DEFAULT '',
  `departamento` varchar(50) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `RFC` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nombre`,`apellido`),
  UNIQUE KEY `RFC` (`RFC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (NULL,'Juan','peres','sistemas',NULL,'YOLO1016');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `no_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  PRIMARY KEY (`no_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'pera',20),(2,'manzana',40),(3,'chocolate',50);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-13 12:56:30
