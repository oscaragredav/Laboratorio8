CREATE DATABASE  IF NOT EXISTS `lab8` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab8`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: lab8
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
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad` (
  `idEspecialidad` int NOT NULL,
  `nombreEspecialidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idEspecialidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,'Ingeniería Biomédica'),(2,'Ingeniería Electrónica'),(3,'Ingeniería Informática'),(4,'Ingeniería de Telecomunicaciones');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus`
--

DROP TABLE IF EXISTS `estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatus` (
  `idestatus` int NOT NULL,
  `nombreStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`idestatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus`
--

LOCK TABLES `estatus` WRITE;
/*!40000 ALTER TABLE `estatus` DISABLE KEYS */;
INSERT INTO `estatus` VALUES (1,'Normal'),(2,'Silver'),(3,'Gold'),(4,'Platinum');
/*!40000 ALTER TABLE `estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguro`
--

DROP TABLE IF EXISTS `seguro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguro` (
  `idseguro` int NOT NULL,
  `nombreSeguro` varchar(45) NOT NULL,
  PRIMARY KEY (`idseguro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguro`
--

LOCK TABLES `seguro` WRITE;
/*!40000 ALTER TABLE `seguro` DISABLE KEYS */;
INSERT INTO `seguro` VALUES (1,'Rimac'),(2,'Pacifico'),(3,'La Positiva'),(4,'Seguro Internacional'),(5,'Otro');
/*!40000 ALTER TABLE `seguro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `codigo` int NOT NULL,
  `idEspecialidad` int NOT NULL,
  `estatus` float NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `passwordHashed` varchar(70) NOT NULL,
  `estatus_idestatus` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_especialidad_idx` (`idEspecialidad`),
  KEY `fk_usuario_estatus1_idx` (`estatus_idestatus`),
  CONSTRAINT `fk_usuario_especialidad` FOREIGN KEY (`idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`),
  CONSTRAINT `fk_usuario_estatus1` FOREIGN KEY (`estatus_idestatus`) REFERENCES `estatus` (`idestatus`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan','Pérez',25,20182023,1,55.2,'a20182023@pucp.edu.pe','@Password123','69e45613e534dab256a77929d08c579e7025fc8ca2d48c86898556af54e460fb',1),(2,'María','López',19,20182321,2,95.6,'a20182321@pucp.edu.pe','@Password456','9501a5d0c211218b08e58204a643202f31545797f9457f0e1b6fd19ede998a15',1),(3,'Luis','García',28,20183720,2,36.7,'a20183720@pucp.edu.pe','@Password789','84d39fd1669de2c7a61e16b7749a8eb03c7f81810a300bcc4add0c87f92cad00',1),(4,'Ana','Martínez',22,20180082,4,43.3,'a20180082@pucp.edu.pe','@Passwordabc','987c162125a86efe0d67086aee44a05f4255235a4117b4319c33a27510a8105c',1),(5,'Carlos','Rojas',32,20191024,3,235.4,'a20191024@pucp.edu.pe','@Passwordxyz','b4a046938633504f245c7547aba77ee348338ca4479169db8982d5903ef65ab1',2),(6,'Laura','González',27,20193735,4,423.7,'a20193735@pucp.edu.pe','@Password234','fecee6b56e09d38c863c517e33a13c1aef0bd8ef0f5e1d752e74bc8059d6486c',2),(7,'Javier','Sánchez',29,20194432,3,134.8,'a20194432@pucp.edu.pe','@Password246','f721dba53f8266dbdbe0a08ea0349b940e9a669183e7475e574d3006bb44aeb6',2),(8,'Lucía','Herrera',24,20193228,4,765.3,'a20193228@pucp.edu.pe','@Password357','a95e44e8ccb8ce1986124c583a8c04435d8158265899a5be916c70f147ec28e2',2),(9,'Gabriel','Romero',26,20204027,1,1525.5,'a20204027@pucp.edu.pe','@Passwordefg','8adb7b41364de8c2d812e4162105f5b48c277d18bca83cea2c3426219c2978e9',3),(10,'Carolina','Silva',18,20203526,4,3255.3,'a20203526@pucp.edu.pe','@Passwordhij','efb5ecd6b87225c0588442f814ecd2c363d8ba6584fcc101fef03a95f3d0dbbc',3),(11,'Miguel','Mendoza',23,20203640,4,2154.9,'a20203640@pucp.edu.pe','@Password135','99aa1c29a625bb7940681382d0f61b62eb208dde1ba366fbfeb0e337fc691397',3),(12,'Paola','Vargas',33,20202527,4,4325.4,'a20202527@pucp.edu.pe','@Password567','9e0d1552e28a7518a0e127cb55e84e47855d4043a31f7458084a3472b77002f6',3),(13,'David','Gómez',27,20213529,4,22354.6,'a20213529@pucp.edu.pe','@Password235','9a8c29cc2510aca607479504a05e4844c0051a4ecb403539654a5a1e78bd1aef',4),(14,'Sofía','Ortega',29,20213723,1,12355.2,'a20213723@pucp.edu.pe','@Password248','9a8c29cc2510aca607479504a05e4844c0051a4ecb403539654a5a1e78bd1aef',4),(15,'Jose','Sanchez',29,20212725,4,23349.4,'a20212725@pucp.edu.pe','@Passwordklm','c58fa2dbf39f7e4d6970dcf8824cfced6de0be7da796527265ee31368ae7b16e',4),(16,'Mabel','Ruiz',29,20211739,4,32445.8,'a20211739@pucp.edu.pe','@Passwordopq','54497f6a9447a384d482a65bddd8e13802466de7faeabcb0fcf9c50464268955',4);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viaje`
--

DROP TABLE IF EXISTS `viaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaje` (
  `idviaje` int NOT NULL AUTO_INCREMENT,
  `fechaReserva` date NOT NULL,
  `fechaViaje` date NOT NULL,
  `ciudadOrigen` varchar(45) NOT NULL,
  `ciudadDestino` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `costoUnitario` int NOT NULL,
  `costoTotal` int DEFAULT NULL,
  `idseguro` int NOT NULL,
  `usuario_idUsuario` int NOT NULL,
  PRIMARY KEY (`idviaje`),
  KEY `fk_viaje_seguro1_idx` (`idseguro`),
  KEY `fk_viaje_usuario1_idx` (`usuario_idUsuario`),
  CONSTRAINT `fk_viaje_seguro1` FOREIGN KEY (`idseguro`) REFERENCES `seguro` (`idseguro`),
  CONSTRAINT `fk_viaje_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaje`
--

LOCK TABLES `viaje` WRITE;
/*!40000 ALTER TABLE `viaje` DISABLE KEYS */;
INSERT INTO `viaje` VALUES (8,'2023-06-20','2023-07-01','Lima','Trujillo',1,50,NULL,1,7),(9,'2023-06-21','2024-01-01','Madrid','Lima',2,150,NULL,1,8),(10,'2023-06-22','2023-06-30','Santiago','Lima',4,400,NULL,4,11),(11,'2023-06-30','2023-07-10','Lima','Bogota',2,75,NULL,4,8),(12,'2023-06-21','2023-07-11','Miami','Lima',1,400,NULL,3,5),(13,'2023-10-10','2023-10-12','Lima','Santiago',1,100,NULL,2,4),(14,'2023-10-14','2023-10-12','Santiago','Buenos Aires',2,110,NULL,2,4),(15,'2023-10-16','2023-10-18','Buenos Aires','Montevideo',1,120,NULL,2,4);
/*!40000 ALTER TABLE `viaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-17 20:30:42