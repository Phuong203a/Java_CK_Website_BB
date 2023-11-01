-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlyphongkham
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `cccd` varchar(100) NOT NULL,
  `sdt` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `admin_FK` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bac_si`
--

DROP TABLE IF EXISTS `bac_si`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bac_si` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_bac_si` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ngay_sinh` date NOT NULL,
  `cccd` varchar(50) NOT NULL,
  `sdt` varchar(50) NOT NULL,
  `ma_dinh_danh_nghe_nghiep` varchar(100) NOT NULL,
  `chung_chi_nghe` mediumblob NOT NULL,
  `status` int DEFAULT NULL COMMENT 'trạng thái: chờ xét duyệt, ok, đã bị cấm',	
  PRIMARY KEY (`id`),
  CONSTRAINT `bac_si_FK` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bac_si`
--

LOCK TABLES `bac_si` WRITE;
/*!40000 ALTER TABLE `bac_si` DISABLE KEYS */;
/*!40000 ALTER TABLE `bac_si` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benh_an`
--

DROP TABLE IF EXISTS `benh_an`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benh_an` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_benh_nhan` varchar(250) NOT NULL,
  `id_lich_su_kham` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `benh_an_FK` (`id_lich_su_kham`),
  CONSTRAINT `benh_an_FK` FOREIGN KEY (`id_lich_su_kham`) REFERENCES `lich_su_kham_benh` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benh_an`
--

LOCK TABLES `benh_an` WRITE;
/*!40000 ALTER TABLE `benh_an` DISABLE KEYS */;
/*!40000 ALTER TABLE `benh_an` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benh_nhan`
--

DROP TABLE IF EXISTS `benh_nhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benh_nhan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_benh_nhan` varchar(250) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `dan_toc` varchar(100) NOT NULL,
  `cccd` varchar(100) NOT NULL,
  `sdt` varchar(100) NOT NULL,
  `dia_chi` varchar(250) NOT NULL,
  `que_quan` varchar(250) NOT NULL,
  `status` int DEFAULT NULL COMMENT 'trạng thái: ok, bị cấm',
  PRIMARY KEY (`id`),
  CONSTRAINT `benh_nhan_FK` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benh_nhan`
--

LOCK TABLES `benh_nhan` WRITE;
/*!40000 ALTER TABLE `benh_nhan` DISABLE KEYS */;
/*!40000 ALTER TABLE `benh_nhan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dich_vu_kham`
--

DROP TABLE IF EXISTS `dich_vu_kham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dich_vu_kham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_dich_vu` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu_kham`
--

LOCK TABLES `dich_vu_kham` WRITE;
/*!40000 ALTER TABLE `dich_vu_kham` DISABLE KEYS */;
/*!40000 ALTER TABLE `dich_vu_kham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_thuoc`
--

DROP TABLE IF EXISTS `don_thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_thuoc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_thuoc` varchar(250) NOT NULL,
  `so_luong` int NOT NULL,
  `ghi_chu` varchar(250) NOT NULL,
  `id_benh_nhan` bigint NOT NULL,
  `id_bac_si` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `don_thuoc_FK` (`id_benh_nhan`),
  KEY `don_thuoc_FK_1` (`id_bac_si`),
  CONSTRAINT `don_thuoc_FK` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhan` (`id`),
  CONSTRAINT `don_thuoc_FK_1` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_si` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_thuoc`
--

LOCK TABLES `don_thuoc` WRITE;
/*!40000 ALTER TABLE `don_thuoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_bac_si` bigint NOT NULL,
  `id_benh_nhan` bigint NOT NULL,
  `noi_dung` varchar(250) NOT NULL,
  `sao` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_FK` (`id_bac_si`),
  KEY `feedback_FK_1` (`id_benh_nhan`),
  CONSTRAINT `feedback_FK` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_si` (`id`),
  CONSTRAINT `feedback_FK_1` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_don_thuoc` bigint NOT NULL,
  `ten_thuoc` varchar(250) NOT NULL,
  `id_phong_kham` bigint NOT NULL,
  `id_bac_si` bigint NOT NULL,
  `ten_bac_si` varchar(250) NOT NULL,
  `id_benh_nhan` bigint NOT NULL,
  `ten_benh_nhan` varchar(250) NOT NULL,
  `id_dich_vu_kham` bigint NOT NULL,
  `id_lich_kham` bigint NOT NULL,
  `tong_tien` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hoa_don_FK` (`id_bac_si`),
  KEY `hoa_don_FK_1` (`id_benh_nhan`),
  KEY `hoa_don_FK_2` (`id_don_thuoc`),
  KEY `hoa_don_FK_3` (`id_dich_vu_kham`),
  KEY `hoa_don_FK_5` (`id_phong_kham`),
  KEY `hoa_don_FK_4` (`id_lich_kham`),
  CONSTRAINT `hoa_don_FK` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_si` (`id`),
  CONSTRAINT `hoa_don_FK_1` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhan` (`id`),
  CONSTRAINT `hoa_don_FK_2` FOREIGN KEY (`id_don_thuoc`) REFERENCES `don_thuoc` (`id`),
  CONSTRAINT `hoa_don_FK_3` FOREIGN KEY (`id_dich_vu_kham`) REFERENCES `dich_vu_kham` (`id`),
  CONSTRAINT `hoa_don_FK_4` FOREIGN KEY (`id_lich_kham`) REFERENCES `lich_kham` (`id`),
  CONSTRAINT `hoa_don_FK_5` FOREIGN KEY (`id_phong_kham`) REFERENCES `phong_kham` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyen_mai`
--

DROP TABLE IF EXISTS `khuyen_mai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khuyen_mai` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_khuyen_mai` varchar(250) NOT NULL,
  `gia_tri` float NOT NULL,
  `thoi_gian_bat_dau` datetime NOT NULL,
  `thoi_gian_ket_thuc` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyen_mai`
--

LOCK TABLES `khuyen_mai` WRITE;
/*!40000 ALTER TABLE `khuyen_mai` DISABLE KEYS */;
/*!40000 ALTER TABLE `khuyen_mai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_kham`
--

DROP TABLE IF EXISTS `lich_kham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_kham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_bac_si` bigint NOT NULL,
  `id_benh_nhan` bigint NOT NULL,
  `thoi_gian_kham` datetime NOT NULL,
  `noi_dung_kham` varchar(250) NOT NULL,
  `khoa_kham` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lich_kham_FK` (`id_benh_nhan`),
  KEY `lich_kham_FK_1` (`id_bac_si`),
  CONSTRAINT `lich_kham_FK` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhan` (`id`),
  CONSTRAINT `lich_kham_FK_1` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_si` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_kham`
--

LOCK TABLES `lich_kham` WRITE;
/*!40000 ALTER TABLE `lich_kham` DISABLE KEYS */;
/*!40000 ALTER TABLE `lich_kham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_su_giao_dich`
--

DROP TABLE IF EXISTS `lich_su_giao_dich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_su_giao_dich` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ma_giao_dich` varchar(100) NOT NULL,
  `so_tien` float NOT NULL,
  `trang_thai` varchar(100) NOT NULL,
  `id_lich_kham` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lich_su_giao_dich_FK` (`id_lich_kham`),
  CONSTRAINT `lich_su_giao_dich_FK` FOREIGN KEY (`id_lich_kham`) REFERENCES `lich_kham` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_su_giao_dich`
--

LOCK TABLES `lich_su_giao_dich` WRITE;
/*!40000 ALTER TABLE `lich_su_giao_dich` DISABLE KEYS */;
/*!40000 ALTER TABLE `lich_su_giao_dich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_su_kham_benh`
--

DROP TABLE IF EXISTS `lich_su_kham_benh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_su_kham_benh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `noi_dung_kham` varchar(250) NOT NULL,
  `id_benh_nhan` bigint NOT NULL,
  `phong_kham` varchar(100) NOT NULL,
  `id_bac_si` bigint NOT NULL,
  `trang_thai` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lich_su_kham_benh_FK` (`id_bac_si`),
  KEY `lich_su_kham_benh_FK_1` (`id_benh_nhan`),
  CONSTRAINT `lich_su_kham_benh_FK` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_si` (`id`),
  CONSTRAINT `lich_su_kham_benh_FK_1` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_su_kham_benh`
--

LOCK TABLES `lich_su_kham_benh` WRITE;
/*!40000 ALTER TABLE `lich_su_kham_benh` DISABLE KEYS */;
/*!40000 ALTER TABLE `lich_su_kham_benh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong_kham`
--

DROP TABLE IF EXISTS `phong_kham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phong_kham` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ten_phong_kham` varchar(250) NOT NULL,
  `dia_chi` varchar(250) NOT NULL,
  `gio_mo_cua` datetime NOT NULL,
  `gio_dong_cua` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong_kham`
--

LOCK TABLES `phong_kham` WRITE;
/*!40000 ALTER TABLE `phong_kham` DISABLE KEYS */;
/*!40000 ALTER TABLE `phong_kham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_bac_si` bigint NOT NULL,
  `id_benh_nhan` bigint NOT NULL,
  `noi_dung` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_FK` (`id_bac_si`),
  KEY `report_FK_1` (`id_benh_nhan`),
  CONSTRAINT `report_FK` FOREIGN KEY (`id_bac_si`) REFERENCES `bac_si` (`id`),
  CONSTRAINT `report_FK_1` FOREIGN KEY (`id_benh_nhan`) REFERENCES `benh_nhan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thong_ke`
--

DROP TABLE IF EXISTS `thong_ke`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thong_ke` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tong_doanh_thu` float NOT NULL,
  `so_luong_benh_nhan` int NOT NULL,
  `so_luong_bac_si` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thong_ke`
--

LOCK TABLES `thong_ke` WRITE;
/*!40000 ALTER TABLE `thong_ke` DISABLE KEYS */;
/*!40000 ALTER TABLE `thong_ke` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` longtext NOT NULL,
  `role` varchar(100) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Cánh cụt cưng','23lvi230@cmoi204iiodnfsoidnfsd233453456','DOCTOR',NULL,NULL),(2,'Cánh cụt phượng','23lvi230@cmoi204iiodnfsoidnfsd233453456','PATIENT',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'quanlyphongkham'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-25 22:34:21
