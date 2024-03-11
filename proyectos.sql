-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: proyectos
-- ------------------------------------------------------
-- Server version 8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `proyectos`
--

/*!40000 DROP DATABASE IF EXISTS `proyectos`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `proyectos` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `proyectos`;

--
-- Table structure for table `categorias_productos`
--

DROP TABLE IF EXISTS `categorias_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_productos` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_productos`
--

LOCK TABLES `categorias_productos` WRITE;
/*!40000 ALTER TABLE `categorias_productos` DISABLE KEYS */;
INSERT INTO `categorias_productos` VALUES (1,'Electrónica'),(2,'Ropa'),(3,'Hogar'),(4,'Alimentos'),(5,'Libros');
/*!40000 ALTER TABLE `categorias_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'Estados Unidos'),(2,'España'),(3,'Francia'),(4,'Alemania');
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias_productos` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Teléfono móvil','Teléfono inteligente de última generación',1),(2,'Portátil','Ordenador portátil ligero y potente',1),(3,'Smart TV','Televisor con funciones inteligentes',1),(4,'Cámara DSLR','Cámara profesional para fotografía',1),(5,'Auriculares inalámbricos','Auriculares Bluetooth con cancelación de ruido',1),(6,'Camisa','Camisa de algodón de alta calidad',2),(7,'Pantalones vaqueros','Pantalones vaqueros de moda',2),(8,'Vestido elegante','Vestido de fiesta para ocasiones especiales',2),(9,'Zapatillas deportivas','Zapatillas cómodas para correr',2),(10,'Chaqueta de cuero','Chaqueta de cuero genuino',2),(11,'Sofá modular','Sofá cómodo y versátil para el salón',3),(12,'Mesa de comedor','Mesa de madera maciza para la cocina',3),(13,'Lámpara de pie','Lámpara elegante para iluminar el salón',3),(14,'Robot aspirador','Robot inteligente para limpieza automática',3),(15,'Set de utensilios de cocina','Juego completo de utensilios de cocina',3),(16,'Aceite de oliva virgen extra','Aceite de oliva de alta calidad',4),(17,'Vino tinto reserva','Vino de cosecha seleccionada',4),(18,'Chocolate belga','Tableta de chocolate con leche',4),(19,'Café gourmet','Café molido de granos arábica',4),(20,'Miel orgánica','Miel natural y sin aditivos',4),(21,'El señor de los anillos','Trilogía épica de fantasía de J.R.R. Tolkien',5),(22,'Cien años de soledad','Obra maestra del realismo mágico de Gabriel García Márquez',5),(23,'1984','Clásico distópico de George Orwell',5),(24,'Orgullo y prejuicio','Novela romántica de Jane Austen',5),(25,'Harry Potter y la piedra filosofal','Primer libro de la saga de J.K. Rowling',5);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'Construcción de un parque temático','Proyecto de construcción de un parque temático de diversiones','2023-01-01','2023-12-31',1),(2,'Desarrollo de una nueva aplicación móvil','Desarrollo de una aplicación móvil para facilitar la vida cotidiana','2024-03-01','2024-08-31',2),(3,'Construcción de un museo de arte moderno','Proyecto de construcción de un museo dedicado al arte moderno','2023-07-15','2024-12-31',3),(4,'Producción de una película de ciencia ficción','Producción de una película de gran presupuesto sobre viajes en el tiempo','2024-06-01','2025-01-31',1),(5,'Renovación de un edificio histórico','Renovación y restauración de un edificio emblemático de la ciudad','2023-10-01','2024-06-30',2),(6,'Implementación de un sistema de energía renovable','Proyecto para implementar paneles solares en edificios públicos','2024-01-15','2024-11-30',4);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos_productos`
--

DROP TABLE IF EXISTS `proyectos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos_productos` (
  `id_proyecto` int NOT NULL,
  `id_producto` int NOT NULL,
  `id_suministrador` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`,`id_producto`,`id_suministrador`),
  KEY `id_suministrador` (`id_suministrador`,`id_producto`),
  CONSTRAINT `proyectos_productos_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`),
  CONSTRAINT `proyectos_productos_ibfk_2` FOREIGN KEY (`id_suministrador`, `id_producto`) REFERENCES `suministradores_productos` (`id_suministrador`, `id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos_productos`
--

LOCK TABLES `proyectos_productos` WRITE;
/*!40000 ALTER TABLE `proyectos_productos` DISABLE KEYS */;
INSERT INTO `proyectos_productos` VALUES (2,2,2,150),(2,3,2,200),(2,4,3,100),(3,2,2,150),(4,4,3,200),(4,9,6,100),(5,12,7,10),(5,13,7,20),(5,14,8,10);
/*!40000 ALTER TABLE `proyectos_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministradores`
--

DROP TABLE IF EXISTS `suministradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministradores` (
  `id_suministrador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` text,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_suministrador`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministradores`
--

LOCK TABLES `suministradores` WRITE;
/*!40000 ALTER TABLE `suministradores` DISABLE KEYS */;
INSERT INTO `suministradores` VALUES (1,'Suministrador A','Calle Principal 123, Ciudad Global','123-456-7890'),(2,'Suministrador B','Avenida Central 456, Ciudad Proyectos','987-654-3210'),(3,'Suministrador C','Calle de los Suministros 789, Ciudad Suministros','555-123-4567'),(4,'Suministrador D','Dirección 1','111-111-1111'),(5,'Suministrador E','Dirección 2','222-222-2222'),(6,'Suministrador F','Dirección 3','333-333-3333'),(7,'Suministrador F','Dirección 4','444-444-4444'),(8,'Suministrador H','Dirección 5','555-555-5555'),(9,'Suministrador I','Dirección 6','666-666-6666'),(10,'Suministrador J','Dirección 7','777-777-7777');
/*!40000 ALTER TABLE `suministradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministradores_paises`
--

DROP TABLE IF EXISTS `suministradores_paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministradores_paises` (
  `id_suministrador` int NOT NULL,
  `id_pais` int NOT NULL,
  PRIMARY KEY (`id_suministrador`,`id_pais`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `suministradores_paises_ibfk_1` FOREIGN KEY (`id_suministrador`) REFERENCES `suministradores` (`id_suministrador`),
  CONSTRAINT `suministradores_paises_ibfk_2` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministradores_paises`
--

LOCK TABLES `suministradores_paises` WRITE;
/*!40000 ALTER TABLE `suministradores_paises` DISABLE KEYS */;
INSERT INTO `suministradores_paises` VALUES (1,1),(2,1),(4,1),(9,1),(10,1),(1,2),(3,2),(7,2),(1,3),(5,3),(6,3),(7,3),(1,4),(8,4);
/*!40000 ALTER TABLE `suministradores_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministradores_productos`
--

DROP TABLE IF EXISTS `suministradores_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministradores_productos` (
  `id_suministrador` int NOT NULL,
  `id_producto` int NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_suministrador`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `suministradores_productos_ibfk_1` FOREIGN KEY (`id_suministrador`) REFERENCES `suministradores` (`id_suministrador`),
  CONSTRAINT `suministradores_productos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministradores_productos`
--

LOCK TABLES `suministradores_productos` WRITE;
/*!40000 ALTER TABLE `suministradores_productos` DISABLE KEYS */;
INSERT INTO `suministradores_productos` VALUES (1,1,90.00),(1,2,60.00),(1,3,70.00),(2,1,100.00),(2,2,50.00),(2,3,600.00),(2,4,800.00),(2,5,150.00),(2,6,20.00),(2,7,40.00),(2,8,80.00),(2,9,60.00),(2,10,200.00),(2,11,300.00),(2,12,150.00),(2,13,50.00),(2,14,200.00),(2,15,30.00),(2,16,10.00),(2,17,20.00),(2,18,5.00),(2,19,8.00),(2,20,12.00),(3,4,800.00),(3,5,150.00),(3,6,20.00),(4,7,40.00),(5,8,80.00),(6,9,60.00),(6,10,200.00),(6,11,300.00),(7,12,150.00),(7,13,50.00),(8,14,200.00),(8,15,30.00),(9,16,10.00),(10,17,20.00),(10,18,5.00),(10,19,8.00),(10,20,12.00);
/*!40000 ALTER TABLE `suministradores_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11 19:29:49