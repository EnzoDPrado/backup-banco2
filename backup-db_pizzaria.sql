CREATE DATABASE  IF NOT EXISTS `db_pizzaria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_pizzaria`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pizzaria
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tbl_bebida`
--

DROP TABLE IF EXISTS `tbl_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preco` double NOT NULL,
  `volume` varchar(15) NOT NULL,
  `id_tipo_bebida` int NOT NULL,
  `id_sabor_bebida` int NOT NULL,
  `id_marca_bebida` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_tipo_bebida_bebida` (`id_tipo_bebida`),
  KEY `FK_sabor_bebida_bebida` (`id_sabor_bebida`),
  KEY `FK_marca_bebida` (`id_marca_bebida`),
  CONSTRAINT `FK_marca_bebida` FOREIGN KEY (`id_marca_bebida`) REFERENCES `tbl_marca_bebida` (`id`),
  CONSTRAINT `FK_sabor_bebida_bebida` FOREIGN KEY (`id_sabor_bebida`) REFERENCES `tbl_sabor_bebida` (`id`),
  CONSTRAINT `FK_tipo_bebida_bebida` FOREIGN KEY (`id_tipo_bebida`) REFERENCES `tbl_tipo_bebida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bebida`
--

LOCK TABLES `tbl_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_bebida` DISABLE KEYS */;
INSERT INTO `tbl_bebida` VALUES (1,10.5,'500ml',1,1,2);
/*!40000 ALTER TABLE `tbl_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contato`
--

DROP TABLE IF EXISTS `tbl_contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(18) DEFAULT NULL,
  `celular` varchar(18) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensagem` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contato`
--

LOCK TABLES `tbl_contato` WRITE;
/*!40000 ALTER TABLE `tbl_contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionario`
--

DROP TABLE IF EXISTS `tbl_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `foto` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionario`
--

LOCK TABLES `tbl_funcionario` WRITE;
/*!40000 ALTER TABLE `tbl_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_funcionarios`
--

DROP TABLE IF EXISTS `tbl_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_funcionario` int NOT NULL,
  `id_pizzaria` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_funcionario_funcionarios` (`id_funcionario`),
  KEY `FK_pizzaria_funcionarios` (`id_pizzaria`),
  CONSTRAINT `FK_funcionario_funcionarios` FOREIGN KEY (`id_funcionario`) REFERENCES `tbl_funcionario` (`id`),
  CONSTRAINT `FK_pizzaria_funcionarios` FOREIGN KEY (`id_pizzaria`) REFERENCES `tbl_pizzaria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_funcionarios`
--

LOCK TABLES `tbl_funcionarios` WRITE;
/*!40000 ALTER TABLE `tbl_funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ingredientes_pizza`
--

DROP TABLE IF EXISTS `tbl_ingredientes_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ingredientes_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ingrediente` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ingredientes_pizza`
--

LOCK TABLES `tbl_ingredientes_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_ingredientes_pizza` DISABLE KEYS */;
INSERT INTO `tbl_ingredientes_pizza` VALUES (1,'Mussarela'),(2,'Tomate'),(3,'Manjericão'),(4,'Parmesão');
/*!40000 ALTER TABLE `tbl_ingredientes_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_marca_bebida`
--

DROP TABLE IF EXISTS `tbl_marca_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_marca_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_marca_bebida`
--

LOCK TABLES `tbl_marca_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_marca_bebida` DISABLE KEYS */;
INSERT INTO `tbl_marca_bebida` VALUES (1,'Del Vale'),(2,'La Pizzaria');
/*!40000 ALTER TABLE `tbl_marca_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_mensagens`
--

DROP TABLE IF EXISTS `tbl_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_mensagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pizzaria` int NOT NULL,
  `id_contato` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_pizzaria_mensagens` (`id_pizzaria`),
  KEY `FK_contato_mensagens` (`id_contato`),
  CONSTRAINT `FK_contato_mensagens` FOREIGN KEY (`id_contato`) REFERENCES `tbl_contato` (`id`),
  CONSTRAINT `FK_pizzaria_mensagens` FOREIGN KEY (`id_pizzaria`) REFERENCES `tbl_mensagens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_mensagens`
--

LOCK TABLES `tbl_mensagens` WRITE;
/*!40000 ALTER TABLE `tbl_mensagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza`
--

DROP TABLE IF EXISTS `tbl_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preco` double NOT NULL,
  `sabor` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza`
--

LOCK TABLES `tbl_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_pizza` DISABLE KEYS */;
INSERT INTO `tbl_pizza` VALUES (1,51.9,'Marguerita');
/*!40000 ALTER TABLE `tbl_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza_componentes`
--

DROP TABLE IF EXISTS `tbl_pizza_componentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza_componentes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ingredientes_pizza` int NOT NULL,
  `id_pizza` int NOT NULL,
  `id_tamanho_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_ingredientes_pizza_pizza_componentes` (`id_ingredientes_pizza`),
  KEY `FK_pizza_pizza_componentes` (`id_pizza`),
  KEY `FK_tamanho_pizza_pizza_componentes` (`id_tamanho_pizza`),
  CONSTRAINT `FK_ingredientes_pizza_pizza_componentes` FOREIGN KEY (`id_ingredientes_pizza`) REFERENCES `tbl_ingredientes_pizza` (`id`),
  CONSTRAINT `FK_pizza_pizza_componentes` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`),
  CONSTRAINT `FK_tamanho_pizza_pizza_componentes` FOREIGN KEY (`id_tamanho_pizza`) REFERENCES `tbl_tamanho_pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza_componentes`
--

LOCK TABLES `tbl_pizza_componentes` WRITE;
/*!40000 ALTER TABLE `tbl_pizza_componentes` DISABLE KEYS */;
INSERT INTO `tbl_pizza_componentes` VALUES (1,1,1,3),(2,2,1,3),(3,3,1,3),(4,4,1,3);
/*!40000 ALTER TABLE `tbl_pizza_componentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizza_favorito`
--

DROP TABLE IF EXISTS `tbl_pizza_favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizza_favorito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_pizza_pizza_favorito` (`id_pizza`),
  CONSTRAINT `FK_pizza_pizza_favorito` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizza_favorito`
--

LOCK TABLES `tbl_pizza_favorito` WRITE;
/*!40000 ALTER TABLE `tbl_pizza_favorito` DISABLE KEYS */;
INSERT INTO `tbl_pizza_favorito` VALUES (1,1);
/*!40000 ALTER TABLE `tbl_pizza_favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pizzaria`
--

DROP TABLE IF EXISTS `tbl_pizzaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_pizzaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cep` varchar(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pizzaria`
--

LOCK TABLES `tbl_pizzaria` WRITE;
/*!40000 ALTER TABLE `tbl_pizzaria` DISABLE KEYS */;
INSERT INTO `tbl_pizzaria` VALUES (1,'La Pizzaria','Rua oliveira lima','Santo antonio','06130-090');
/*!40000 ALTER TABLE `tbl_pizzaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promocao_bebida`
--

DROP TABLE IF EXISTS `tbl_promocao_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_promocao_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preco_promocao` double NOT NULL,
  `id_bebida` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_bebida_promocao_bebida` (`id_bebida`),
  CONSTRAINT `FK_bebida_promocao_bebida` FOREIGN KEY (`id_bebida`) REFERENCES `tbl_bebida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promocao_bebida`
--

LOCK TABLES `tbl_promocao_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_promocao_bebida` DISABLE KEYS */;
INSERT INTO `tbl_promocao_bebida` VALUES (1,5,1);
/*!40000 ALTER TABLE `tbl_promocao_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promocao_pizza`
--

DROP TABLE IF EXISTS `tbl_promocao_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_promocao_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preco` double NOT NULL,
  `id_pizza` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_pizza_promocao_pizza` (`id_pizza`),
  CONSTRAINT `FK_pizza_promocao_pizza` FOREIGN KEY (`id_pizza`) REFERENCES `tbl_pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promocao_pizza`
--

LOCK TABLES `tbl_promocao_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_promocao_pizza` DISABLE KEYS */;
INSERT INTO `tbl_promocao_pizza` VALUES (1,30.5,1);
/*!40000 ALTER TABLE `tbl_promocao_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sabor_bebida`
--

DROP TABLE IF EXISTS `tbl_sabor_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sabor_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sabor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sabor_bebida`
--

LOCK TABLES `tbl_sabor_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_sabor_bebida` DISABLE KEYS */;
INSERT INTO `tbl_sabor_bebida` VALUES (1,'Uva');
/*!40000 ALTER TABLE `tbl_sabor_bebida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tamanho_pizza`
--

DROP TABLE IF EXISTS `tbl_tamanho_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tamanho_pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tamanho` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tamanho_pizza`
--

LOCK TABLES `tbl_tamanho_pizza` WRITE;
/*!40000 ALTER TABLE `tbl_tamanho_pizza` DISABLE KEYS */;
INSERT INTO `tbl_tamanho_pizza` VALUES (1,'Broto'),(2,'Médio'),(3,'Grande');
/*!40000 ALTER TABLE `tbl_tamanho_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_tipo_bebida`
--

DROP TABLE IF EXISTS `tbl_tipo_bebida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_tipo_bebida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(75) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_tipo_bebida`
--

LOCK TABLES `tbl_tipo_bebida` WRITE;
/*!40000 ALTER TABLE `tbl_tipo_bebida` DISABLE KEYS */;
INSERT INTO `tbl_tipo_bebida` VALUES (1,'Suco'),(2,'Refrigerante'),(3,'Cerveja');
/*!40000 ALTER TABLE `tbl_tipo_bebida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01  7:40:14
