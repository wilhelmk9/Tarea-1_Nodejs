CREATE DATABASE  IF NOT EXISTS `db_empresa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_empresa`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: db_empresa
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nit` varchar(9) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(8) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'12345678','Ana','García','Calle 123, Ciudad','1234567','1990-05-15'),(2,'98765432','Juan','Pérez','Avenida 456, Otra Ciudad','9876543','1988-10-20'),(3,'55555555','María','López','Plaza 789, Alguna Ciudad','5555555','1995-03-01'),(4,'22222222','Carlos','Martínez','Carrera 987, Ciudad Nueva','2222222','1985-12-08'),(5,'99999999','Laura','Sánchez','Calle 654, Otra Ciudad','9999999','2000-07-30'),(6,'44444444','Pedro','Rodríguez','Avenida 123, Ciudad Vieja','4444444','1992-02-18'),(7,'77777777','Sofía','Hernández','Plaza 456, Alguna Ciudad','7777777','1998-09-25'),(8,'66666666','Fernando','Gómez','Carrera 654, Ciudad Nueva','6666666','1980-06-12'),(9,'88888888','Elena','Torres','Avenida 987, Otra Ciudad','8888888','1993-11-05'),(10,'11111111','Roberto','Díaz','Calle 789, Ciudad Vieja','1111111','1987-04-22'),(11,NULL,NULL,NULL,NULL,NULL,'2023-08-23'),(12,NULL,NULL,NULL,NULL,NULL,'2023-08-02'),(13,NULL,NULL,NULL,NULL,NULL,'2023-08-09'),(14,NULL,NULL,NULL,NULL,NULL,'2023-08-16'),(15,'54546','3365','5656','56565','5656','2023-08-16'),(16,NULL,NULL,NULL,NULL,NULL,'2023-08-23'),(18,'6565','56565','5656','56565','56565','2023-08-01');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `id_puesto` int DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto_puesto_empleado_idx` (`id_puesto`),
  CONSTRAINT `id_puesto_puesto_empleado` FOREIGN KEY (`id_puesto`) REFERENCES `puestos` (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (11,'E001','Carlos','Gómez','Calle 123, Ciudad','1234567','1990-05-15',1),(12,'E002','Laura','Martínez','Avenida 456, Otra Ciudad','9876543','1988-10-20',2),(13,'E003','José','López','Plaza 789, Alguna Ciudad','5555555','1995-03-01',3),(14,'E004','Ana','Hernández','Carrera 987, Ciudad Nueva','2222222','1985-12-08',2),(15,'E005','María','Pérez','Calle 654, Otra Ciudad','9999999','2000-07-30',4),(16,'E006','Juan','Rodríguez','Avenida 123, Ciudad Vieja','4444444','1992-02-18',1),(17,'E007','Sofía','Díaz','Plaza 456, Alguna Ciudad','7777777','1998-09-25',3),(18,'E008','Fernando','Torres','Carrera 654, Ciudad Nueva','6666666','1980-06-12',2),(19,'E009','Elena','Sánchez','Avenida 987, Otra Ciudad','8888888','1993-11-05',4),(20,'E010','Roberto','García','Calle 789, Ciudad Vieja','1111111','1987-04-22',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestos`
--

DROP TABLE IF EXISTS `puestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puestos` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `puesto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestos`
--

LOCK TABLES `puestos` WRITE;
/*!40000 ALTER TABLE `puestos` DISABLE KEYS */;
INSERT INTO `puestos` VALUES (1,'Gerente de Ventas'),(2,'Analista de Marketing'),(3,'Desarrollador de Software'),(4,'Asistente Administrativo'),(5,'Especialista en Recursos Humanos'),(6,'Diseñador Gráfico'),(7,'Ingeniero de Producción'),(8,'Contador Financiero'),(9,'Técnico de Soporte'),(10,'Coordinador de Logística');
/*!40000 ALTER TABLE `puestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_empresa'
--

--
-- Dumping routines for database 'db_empresa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-23  3:43:09
