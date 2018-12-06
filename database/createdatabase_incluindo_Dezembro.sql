-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: maria
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canal` (
  `ID_CANAL` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRICAO` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_CANAL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (1,'Distribuição'),(2,'Varejo'),(3,'Verticais'),(4,'Exportação');
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia_comercial`
--

DROP TABLE IF EXISTS `familia_comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familia_comercial` (
  `COD_FAMILIA_COMERCIAL` int(11) NOT NULL,
  `NOME_FAMILIA_COMERCIAL` varchar(150) NOT NULL,
  PRIMARY KEY (`COD_FAMILIA_COMERCIAL`),
  UNIQUE KEY `UN_FAMILIA_COMERCIAL` (`COD_FAMILIA_COMERCIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia_comercial`
--

LOCK TABLES `familia_comercial` WRITE;
/*!40000 ALTER TABLE `familia_comercial` DISABLE KEYS */;
INSERT INTO `familia_comercial` VALUES (14411063,'Familia B'),(14414013,'Familia A'),(14432035,'Familia D'),(14433025,'Familia C'),(14442568,'Familia E');
/*!40000 ALTER TABLE `familia_comercial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `MES_ANO` date NOT NULL,
  `PRODUTO_SKU` int(11) NOT NULL,
  `ID_CANAL` int(11) NOT NULL,
  `QUANTIDADE` decimal(10,0) NOT NULL,
  PRIMARY KEY (`MES_ANO`,`PRODUTO_SKU`,`ID_CANAL`),
  KEY `FK_PRODUTO_SKU_HISTORICO` (`PRODUTO_SKU`),
  KEY `FK_CANAL_HISTORICO` (`ID_CANAL`),
  CONSTRAINT `FK_CANAL_HISTORICO` FOREIGN KEY (`ID_CANAL`) REFERENCES `canal` (`ID_CANAL`),
  CONSTRAINT `FK_PRODUTO_SKU_HISTORICO` FOREIGN KEY (`PRODUTO_SKU`) REFERENCES `produto` (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES ('2003-01-01',4000400,4,2832),('2003-01-01',4000402,1,942),('2003-01-01',4000404,3,3065),('2003-01-01',4000406,3,2315),('2003-01-01',4000408,3,3958),('2003-01-01',4000440,2,2075),('2003-01-01',4000442,2,2446),('2003-01-01',4000538,3,1794),('2003-01-01',4000540,1,3967),('2003-02-01',4000400,1,2670),('2003-02-01',4000402,2,2349),('2003-02-01',4000404,1,3992),('2003-02-01',4000406,4,1483),('2003-02-01',4000408,1,4835),('2003-02-01',4000440,3,2492),('2003-02-01',4000442,2,2143),('2003-02-01',4000538,3,1859),('2003-02-01',4000540,2,1425),('2003-03-01',4000400,4,2928),('2003-03-01',4000402,1,3529),('2003-03-01',4000404,4,2526),('2003-03-01',4000406,2,3853),('2003-03-01',4000408,1,2991),('2003-03-01',4000440,1,1456),('2003-03-01',4000442,4,2408),('2003-03-01',4000538,1,917),('2003-03-01',4000540,3,2277),('2003-04-01',4000400,2,925),('2003-04-01',4000402,1,912),('2003-04-01',4000404,1,3847),('2003-04-01',4000406,2,3825),('2003-04-01',4000408,1,1635),('2003-04-01',4000440,1,1139),('2003-04-01',4000442,2,4704),('2003-04-01',4000538,4,2505),('2003-04-01',4000540,2,1887),('2003-05-01',4000400,1,1718),('2003-05-01',4000402,4,4820),('2003-05-01',4000404,4,2317),('2003-05-01',4000406,2,2289),('2003-05-01',4000408,3,1344),('2003-05-01',4000440,4,3979),('2003-05-01',4000442,3,4741),('2003-05-01',4000538,4,2498),('2003-05-01',4000540,1,4752),('2003-06-01',4000400,4,2208),('2003-06-01',4000402,2,3995),('2003-06-01',4000404,1,1350),('2003-06-01',4000406,3,981),('2003-06-01',4000408,3,5000),('2003-06-01',4000440,3,2071),('2003-06-01',4000442,2,4800),('2003-06-01',4000538,1,2978),('2003-06-01',4000540,4,4896),('2003-07-01',4000400,4,1278),('2003-07-01',4000402,2,4051),('2003-07-01',4000404,4,4064),('2003-07-01',4000406,1,1989),('2003-07-01',4000408,2,3373),('2003-07-01',4000440,3,4600),('2003-07-01',4000442,2,1620),('2003-07-01',4000538,4,2977),('2003-07-01',4000540,3,3642),('2003-08-01',4000400,1,931),('2003-08-01',4000402,1,4471),('2003-08-01',4000404,3,4762),('2003-08-01',4000406,1,1864),('2003-08-01',4000408,2,2345),('2003-08-01',4000440,3,1850),('2003-08-01',4000442,2,1264),('2003-08-01',4000538,3,1739),('2003-08-01',4000540,4,1423),('2003-09-01',4000400,3,1307),('2003-09-01',4000402,1,2726),('2003-09-01',4000404,2,1236),('2003-09-01',4000406,1,4208),('2003-09-01',4000408,3,2171),('2003-09-01',4000440,3,3960),('2003-09-01',4000442,4,2852),('2003-09-01',4000538,1,1785),('2003-09-01',4000540,1,4355),('2003-10-01',4000400,2,2796),('2003-10-01',4000402,2,1943),('2003-10-01',4000404,4,4765),('2003-10-01',4000406,3,3627),('2003-10-01',4000408,1,2223),('2003-10-01',4000440,4,4010),('2003-10-01',4000442,4,1433),('2003-10-01',4000538,2,2371),('2003-10-01',4000540,1,2681),('2003-11-01',4000400,1,1902),('2003-11-01',4000402,1,3754),('2003-11-01',4000404,3,4307),('2003-11-01',4000406,3,2228),('2003-11-01',4000408,4,2140),('2003-11-01',4000440,2,4940),('2003-11-01',4000442,1,1217),('2003-11-01',4000538,3,2720),('2003-11-01',4000540,2,2765),('2003-12-01',4000400,3,3494),('2003-12-01',4000402,1,3024),('2003-12-01',4000404,3,1586),('2003-12-01',4000406,3,2767),('2003-12-01',4000408,2,3690),('2003-12-01',4000440,4,1052),('2003-12-01',4000442,4,2747),('2003-12-01',4000538,1,1487),('2003-12-01',4000540,1,2022),('2004-01-01',4000400,3,2380),('2004-01-01',4000402,1,2681),('2004-01-01',4000404,4,4657),('2004-01-01',4000406,2,3096),('2004-01-01',4000408,1,4216),('2004-01-01',4000440,2,2729),('2004-01-01',4000442,2,3800),('2004-01-01',4000538,3,1182),('2004-01-01',4000540,3,4133),('2004-02-01',4000400,4,3741),('2004-02-01',4000402,2,4754),('2004-02-01',4000404,3,3716),('2004-02-01',4000406,4,2889),('2004-02-01',4000408,4,2293),('2004-02-01',4000440,2,4263),('2004-02-01',4000442,1,900),('2004-02-01',4000538,2,2010),('2004-02-01',4000540,2,951),('2004-03-01',4000400,3,1078),('2004-03-01',4000402,2,4028),('2004-03-01',4000404,4,4457),('2004-03-01',4000406,4,4571),('2004-03-01',4000408,4,2487),('2004-03-01',4000440,2,2404),('2004-03-01',4000442,3,4286),('2004-03-01',4000538,4,2339),('2004-03-01',4000540,1,3139),('2004-04-01',4000400,4,1480),('2004-04-01',4000402,4,3600),('2004-04-01',4000404,4,3921),('2004-04-01',4000406,2,1772),('2004-04-01',4000408,2,2296),('2004-04-01',4000440,1,2355),('2004-04-01',4000442,3,4584),('2004-04-01',4000538,3,3634),('2004-04-01',4000540,3,2860),('2004-05-01',4000400,4,1370),('2004-05-01',4000402,3,4091),('2004-05-01',4000404,3,4870),('2004-05-01',4000406,2,1028),('2004-05-01',4000408,3,2592),('2004-05-01',4000440,3,1113),('2004-05-01',4000442,1,1991),('2004-05-01',4000538,4,3023),('2004-05-01',4000540,1,1471),('2004-06-01',4000400,3,1105),('2004-06-01',4000402,1,4328),('2004-06-01',4000404,4,4231),('2004-06-01',4000406,1,1671),('2004-06-01',4000408,4,929),('2004-06-01',4000440,1,2610),('2004-06-01',4000442,1,4712),('2004-06-01',4000538,2,4118),('2004-06-01',4000540,4,2439),('2004-07-01',4000400,3,3682),('2004-07-01',4000402,4,1302),('2004-07-01',4000404,1,2710),('2004-07-01',4000406,3,4396),('2004-07-01',4000408,3,4661),('2004-07-01',4000440,3,3199),('2004-07-01',4000442,1,3203),('2004-07-01',4000538,2,1806),('2004-07-01',4000540,1,1014),('2004-08-01',4000400,1,4157),('2004-08-01',4000402,2,3511),('2004-08-01',4000404,1,1447),('2004-08-01',4000406,1,1723),('2004-08-01',4000408,3,4872),('2004-08-01',4000440,3,3038),('2004-08-01',4000442,4,3222),('2004-08-01',4000538,3,3889),('2004-08-01',4000540,3,2926),('2004-09-01',4000400,4,3444),('2004-09-01',4000402,2,1305),('2004-09-01',4000404,2,4414),('2004-09-01',4000406,2,2896),('2004-09-01',4000408,2,3500),('2004-09-01',4000440,2,2247),('2004-09-01',4000442,3,3992),('2004-09-01',4000538,2,4021),('2004-09-01',4000540,3,3330),('2004-10-01',4000400,2,3934),('2004-10-01',4000402,3,3416),('2004-10-01',4000404,2,4121),('2004-10-01',4000406,2,3239),('2004-10-01',4000408,3,3662),('2004-10-01',4000440,1,2992),('2004-10-01',4000442,4,3596),('2004-10-01',4000538,4,1068),('2004-10-01',4000540,2,2309),('2004-11-01',4000400,4,3581),('2004-11-01',4000402,1,1330),('2004-11-01',4000404,2,1725),('2004-11-01',4000406,1,2074),('2004-11-01',4000408,4,2545),('2004-11-01',4000440,4,984),('2004-11-01',4000442,3,3230),('2004-11-01',4000538,3,2133),('2004-11-01',4000540,2,3897),('2004-12-01',4000400,2,4498),('2004-12-01',4000402,2,3691),('2004-12-01',4000404,2,1201),('2004-12-01',4000406,3,3190),('2004-12-01',4000408,3,3741),('2004-12-01',4000440,2,4391),('2004-12-01',4000442,3,1966),('2004-12-01',4000538,3,2671),('2004-12-01',4000540,3,4681),('2005-01-01',4000400,1,2445),('2005-01-01',4000402,1,3476),('2005-01-01',4000404,4,2234),('2005-01-01',4000406,2,1223),('2005-01-01',4000408,2,2330),('2005-01-01',4000440,2,3887),('2005-01-01',4000442,3,2060),('2005-01-01',4000538,1,1242),('2005-01-01',4000540,4,4343),('2005-02-01',4000400,1,4394),('2005-02-01',4000402,3,2610),('2005-02-01',4000404,2,1011),('2005-02-01',4000406,3,1250),('2005-02-01',4000408,1,1667),('2005-02-01',4000440,4,3650),('2005-02-01',4000442,3,2667),('2005-02-01',4000538,3,4314),('2005-02-01',4000540,3,3851),('2005-03-01',4000400,1,2299),('2005-03-01',4000402,2,3953),('2005-03-01',4000404,1,1723),('2005-03-01',4000406,4,1336),('2005-03-01',4000408,1,2473),('2005-03-01',4000440,4,4276),('2005-03-01',4000442,3,4514),('2005-03-01',4000538,4,4460),('2005-03-01',4000540,1,955),('2005-04-01',4000400,3,1583),('2005-04-01',4000402,3,2640),('2005-04-01',4000404,4,3256),('2005-04-01',4000406,4,1834),('2005-04-01',4000408,2,1571),('2005-04-01',4000440,1,2547),('2005-04-01',4000442,4,2988),('2005-04-01',4000538,4,2744),('2005-04-01',4000540,1,1032),('2005-05-01',4000400,1,4266),('2005-05-01',4000402,2,1834),('2005-05-01',4000404,3,1707),('2005-05-01',4000406,1,1988),('2005-05-01',4000408,1,2830),('2005-05-01',4000440,4,2924),('2005-05-01',4000442,2,4860),('2005-05-01',4000538,3,1959),('2005-05-01',4000540,4,1758),('2005-06-01',4000400,1,2448),('2005-06-01',4000402,3,1423),('2005-06-01',4000404,4,3579),('2005-06-01',4000406,2,2026),('2005-06-01',4000408,3,2734),('2005-06-01',4000440,3,4605),('2005-06-01',4000442,3,4792),('2005-06-01',4000538,1,4940),('2005-06-01',4000540,2,2463),('2005-07-01',4000400,3,931),('2005-07-01',4000402,4,2365),('2005-07-01',4000404,1,1763),('2005-07-01',4000406,4,2505),('2005-07-01',4000408,3,4955),('2005-07-01',4000440,3,3128),('2005-07-01',4000442,4,1336),('2005-07-01',4000538,1,4486),('2005-07-01',4000540,1,1500),('2005-08-01',4000400,4,3705),('2005-08-01',4000402,2,4585),('2005-08-01',4000404,3,2818),('2005-08-01',4000406,1,3082),('2005-08-01',4000408,1,3537),('2005-08-01',4000440,1,2974),('2005-08-01',4000442,2,1456),('2005-08-01',4000538,2,2867),('2005-08-01',4000540,1,4551),('2005-09-01',4000400,2,3560),('2005-09-01',4000402,4,4220),('2005-09-01',4000404,3,4384),('2005-09-01',4000406,1,1685),('2005-09-01',4000408,4,4556),('2005-09-01',4000440,3,2123),('2005-09-01',4000442,4,4366),('2005-09-01',4000538,4,1857),('2005-09-01',4000540,1,2601),('2005-10-01',4000400,3,4186),('2005-10-01',4000402,4,3069),('2005-10-01',4000404,2,3582),('2005-10-01',4000406,1,2398),('2005-10-01',4000408,3,1216),('2005-10-01',4000440,2,3203),('2005-10-01',4000442,3,1642),('2005-10-01',4000538,2,3246),('2005-10-01',4000540,1,1176),('2005-11-01',4000400,3,1184),('2005-11-01',4000402,4,1323),('2005-11-01',4000404,3,4399),('2005-11-01',4000406,1,1277),('2005-11-01',4000408,2,2100),('2005-11-01',4000440,3,918),('2005-11-01',4000442,3,2165),('2005-11-01',4000538,3,4437),('2005-11-01',4000540,3,3382),('2005-12-01',4000400,2,2455),('2005-12-01',4000402,4,3931),('2005-12-01',4000404,3,4621),('2005-12-01',4000406,3,1826),('2005-12-01',4000408,4,2009),('2005-12-01',4000440,3,4463),('2005-12-01',4000442,3,4408),('2005-12-01',4000538,1,4859),('2005-12-01',4000540,3,3948),('2006-01-01',4000400,2,3022),('2006-01-01',4000402,1,2410),('2006-01-01',4000404,1,2610),('2006-01-01',4000406,3,4438),('2006-01-01',4000408,4,2103),('2006-01-01',4000440,1,1260),('2006-01-01',4000442,2,2787),('2006-01-01',4000538,4,4456),('2006-01-01',4000540,3,1731),('2006-02-01',4000400,3,4271),('2006-02-01',4000402,4,4382),('2006-02-01',4000404,2,1912),('2006-02-01',4000406,4,2651),('2006-02-01',4000408,1,4666),('2006-02-01',4000440,2,4302),('2006-02-01',4000442,1,1127),('2006-02-01',4000538,2,3495),('2006-02-01',4000540,4,2656),('2006-03-01',4000400,2,3800),('2006-03-01',4000402,1,4883),('2006-03-01',4000404,2,2402),('2006-03-01',4000406,2,5000),('2006-03-01',4000408,2,3726),('2006-03-01',4000440,2,4613),('2006-03-01',4000442,4,4072),('2006-03-01',4000538,2,1408),('2006-03-01',4000540,1,1040),('2006-04-01',4000400,4,1653),('2006-04-01',4000402,2,1218),('2006-04-01',4000404,2,2813),('2006-04-01',4000406,2,1634),('2006-04-01',4000408,4,1835),('2006-04-01',4000440,1,3576),('2006-04-01',4000442,1,4569),('2006-04-01',4000538,2,3124),('2006-04-01',4000540,4,3677),('2006-05-01',4000400,2,2366),('2006-05-01',4000402,1,4569),('2006-05-01',4000404,2,4464),('2006-05-01',4000406,2,4098),('2006-05-01',4000408,4,3256),('2006-05-01',4000440,2,2751),('2006-05-01',4000442,1,4331),('2006-05-01',4000538,2,1699),('2006-05-01',4000540,1,1428),('2006-06-01',4000400,1,1895),('2006-06-01',4000402,4,2776),('2006-06-01',4000404,1,2956),('2006-06-01',4000406,4,3422),('2006-06-01',4000408,4,1262),('2006-06-01',4000440,2,3666),('2006-06-01',4000442,3,4362),('2006-06-01',4000538,1,1920),('2006-06-01',4000540,1,3556),('2006-07-01',4000400,4,2133),('2006-07-01',4000402,4,1898),('2006-07-01',4000404,2,4658),('2006-07-01',4000406,1,2943),('2006-07-01',4000408,4,3283),('2006-07-01',4000440,1,2317),('2006-07-01',4000442,1,3610),('2006-07-01',4000538,1,930),('2006-07-01',4000540,1,3319),('2006-08-01',4000400,3,3551),('2006-08-01',4000402,2,4282),('2006-08-01',4000404,3,4641),('2006-08-01',4000406,4,3287),('2006-08-01',4000408,4,4521),('2006-08-01',4000440,3,1105),('2006-08-01',4000442,4,4631),('2006-08-01',4000538,3,1602),('2006-08-01',4000540,4,3887),('2006-09-01',4000400,2,4643),('2006-09-01',4000402,4,3512),('2006-09-01',4000404,1,3839),('2006-09-01',4000406,2,1630),('2006-09-01',4000408,1,4709),('2006-09-01',4000440,3,1775),('2006-09-01',4000442,4,3734),('2006-09-01',4000538,3,4390),('2006-09-01',4000540,1,4261),('2006-10-01',4000400,1,4996),('2006-10-01',4000402,3,4619),('2006-10-01',4000404,3,1686),('2006-10-01',4000406,4,1435),('2006-10-01',4000408,2,1396),('2006-10-01',4000440,3,1822),('2006-10-01',4000442,3,2292),('2006-10-01',4000538,2,1450),('2006-10-01',4000540,2,2772),('2006-11-01',4000400,1,1416),('2006-11-01',4000402,4,3363),('2006-11-01',4000404,4,3817),('2006-11-01',4000406,3,4760),('2006-11-01',4000408,4,4406),('2006-11-01',4000440,4,2119),('2006-11-01',4000442,3,2898),('2006-11-01',4000538,1,4294),('2006-11-01',4000540,4,1946),('2006-12-01',4000400,2,1329),('2006-12-01',4000402,2,2874),('2006-12-01',4000404,2,3842),('2006-12-01',4000406,3,1552),('2006-12-01',4000408,4,1977),('2006-12-01',4000440,3,5000),('2006-12-01',4000442,1,4413),('2006-12-01',4000538,1,1774),('2006-12-01',4000540,1,1763),('2007-01-01',4000400,1,3516),('2007-01-01',4000402,4,3074),('2007-01-01',4000404,3,1532),('2007-01-01',4000406,3,4528),('2007-01-01',4000408,4,2087),('2007-01-01',4000440,3,954),('2007-01-01',4000442,2,3350),('2007-01-01',4000538,1,1422),('2007-01-01',4000540,3,3485),('2007-02-01',4000400,2,1774),('2007-02-01',4000402,1,3418),('2007-02-01',4000404,1,4373),('2007-02-01',4000406,3,4628),('2007-02-01',4000408,3,2918),('2007-02-01',4000440,3,1947),('2007-02-01',4000442,3,2167),('2007-02-01',4000538,4,1428),('2007-02-01',4000540,4,3699),('2007-03-01',4000400,4,3752),('2007-03-01',4000402,1,4465),('2007-03-01',4000404,1,4706),('2007-03-01',4000406,4,4309),('2007-03-01',4000408,1,3090),('2007-03-01',4000440,4,1378),('2007-03-01',4000442,1,3853),('2007-03-01',4000538,3,1985),('2007-03-01',4000540,3,2061),('2007-04-01',4000400,3,1276),('2007-04-01',4000402,2,2027),('2007-04-01',4000404,3,1459),('2007-04-01',4000406,1,4919),('2007-04-01',4000408,4,2970),('2007-04-01',4000440,2,3998),('2007-04-01',4000442,4,1109),('2007-04-01',4000538,1,2161),('2007-04-01',4000540,3,1875),('2007-05-01',4000400,1,1599),('2007-05-01',4000402,2,2761),('2007-05-01',4000404,3,1148),('2007-05-01',4000406,1,4586),('2007-05-01',4000408,3,4551),('2007-05-01',4000440,3,3929),('2007-05-01',4000442,1,1085),('2007-05-01',4000538,1,3017),('2007-05-01',4000540,4,1207),('2007-06-01',4000400,3,4089),('2007-06-01',4000402,2,1013),('2007-06-01',4000404,2,1778),('2007-06-01',4000406,2,4508),('2007-06-01',4000408,3,2826),('2007-06-01',4000440,3,2091),('2007-06-01',4000442,2,3280),('2007-06-01',4000538,1,2864),('2007-06-01',4000540,4,1118),('2007-07-01',4000400,4,3945),('2007-07-01',4000402,1,4978),('2007-07-01',4000404,3,2077),('2007-07-01',4000406,2,2244),('2007-07-01',4000408,4,3197),('2007-07-01',4000440,4,2620),('2007-07-01',4000442,1,2905),('2007-07-01',4000546,4,2781),('2007-08-01',4000400,1,4216),('2007-08-01',4000402,1,1179),('2007-08-01',4000404,2,3003),('2007-08-01',4000406,2,4289),('2007-08-01',4000408,3,3430),('2007-08-01',4000440,2,2129),('2007-08-01',4000442,3,1852),('2007-08-01',4000546,2,2747),('2007-09-01',4000400,1,4696),('2007-09-01',4000402,3,2934),('2007-09-01',4000404,4,3182),('2007-09-01',4000406,3,4374),('2007-09-01',4000408,4,2884),('2007-09-01',4000440,4,953),('2007-09-01',4000442,3,2675),('2007-09-01',4000546,3,1674),('2007-10-01',4000400,1,4927),('2007-10-01',4000402,3,4466),('2007-10-01',4000404,2,4011),('2007-10-01',4000406,1,2460),('2007-10-01',4000408,2,1162),('2007-10-01',4000440,3,3413),('2007-10-01',4000442,4,3377),('2007-10-01',4000546,1,3156),('2007-11-01',4000400,2,2672),('2007-11-01',4000402,4,4397),('2007-11-01',4000404,1,3214),('2007-11-01',4000406,1,1064),('2007-11-01',4000408,1,2905),('2007-11-01',4000440,2,4530),('2007-11-01',4000442,2,915),('2007-11-01',4000546,1,1171),('2007-12-01',4000400,2,2683),('2007-12-01',4000402,4,2324),('2007-12-01',4000404,1,3066),('2007-12-01',4000406,2,3375),('2007-12-01',4000408,3,2044),('2007-12-01',4000440,2,3545),('2007-12-01',4000442,2,4049),('2007-12-01',4000546,1,3503),('2008-01-01',4000400,1,3158),('2008-01-01',4000402,3,2159),('2008-01-01',4000404,2,1583),('2008-01-01',4000406,3,2165),('2008-01-01',4000408,1,2738),('2008-01-01',4000440,4,3998),('2008-01-01',4000442,4,4850),('2008-01-01',4000546,3,3722),('2008-02-01',4000400,3,3341),('2008-02-01',4000402,4,4351),('2008-02-01',4000404,3,2107),('2008-02-01',4000406,1,2390),('2008-02-01',4000408,1,1319),('2008-02-01',4000440,2,3114),('2008-02-01',4000442,4,4973),('2008-02-01',4000546,3,3992),('2008-03-01',4000400,1,1868),('2008-03-01',4000402,3,4084),('2008-03-01',4000404,2,1871),('2008-03-01',4000406,4,1268),('2008-03-01',4000408,1,3894),('2008-03-01',4000440,3,969),('2008-03-01',4000442,4,4219),('2008-03-01',4000546,1,3469),('2008-04-01',4000400,4,2723),('2008-04-01',4000402,1,3962),('2008-04-01',4000404,2,2891),('2008-04-01',4000406,2,1652),('2008-04-01',4000408,3,3790),('2008-04-01',4000440,4,1056),('2008-04-01',4000442,1,4371),('2008-04-01',4000546,4,1735),('2008-05-01',4000400,2,3756),('2008-05-01',4000402,2,2748),('2008-05-01',4000404,4,1811),('2008-05-01',4000406,1,2399),('2008-05-01',4000408,2,3145),('2008-05-01',4000440,3,4263),('2008-05-01',4000442,4,3703),('2008-05-01',4000546,1,1503),('2008-06-01',4000400,4,4918),('2008-06-01',4000402,3,2072),('2008-06-01',4000404,3,4597),('2008-06-01',4000406,3,4018),('2008-06-01',4000408,4,3871),('2008-06-01',4000440,4,4772),('2008-06-01',4000442,2,2244),('2008-06-01',4000546,2,1628),('2008-07-01',4000400,1,3675),('2008-07-01',4000402,4,3453),('2008-07-01',4000404,1,1430),('2008-07-01',4000406,4,1150),('2008-07-01',4000408,2,3753),('2008-07-01',4000440,2,3015),('2008-07-01',4000442,2,3256),('2008-07-01',4000546,2,2486),('2008-08-01',4000400,4,2992),('2008-08-01',4000402,3,4689),('2008-08-01',4000404,4,3539),('2008-08-01',4000406,4,4021),('2008-08-01',4000408,1,1066),('2008-08-01',4000440,3,2714),('2008-08-01',4000442,3,4204),('2008-08-01',4000546,3,3804),('2008-09-01',4000400,2,4252),('2008-09-01',4000402,1,4399),('2008-09-01',4000404,4,1421),('2008-09-01',4000406,1,2638),('2008-09-01',4000408,2,4695),('2008-09-01',4000440,2,1309),('2008-09-01',4000442,4,4762),('2008-09-01',4000546,3,3101),('2008-10-01',4000400,1,3555),('2008-10-01',4000402,2,4902),('2008-10-01',4000404,1,4903),('2008-10-01',4000406,1,3987),('2008-10-01',4000408,3,3802),('2008-10-01',4000440,1,4315),('2008-10-01',4000442,3,1378),('2008-10-01',4000546,3,1361),('2008-11-01',4000444,3,1977),('2008-11-01',4000546,2,2760),('2008-12-01',4000444,3,2702),('2008-12-01',4000546,3,1591),('2009-01-01',4000444,4,1325),('2009-01-01',4000546,1,1604),('2009-02-01',4000444,2,1874),('2009-02-01',4000546,4,2959),('2009-03-01',4000444,1,2232),('2009-03-01',4000546,2,3814),('2009-04-01',4000444,2,2886),('2009-04-01',4000546,1,2331),('2009-05-01',4000444,4,1826),('2009-05-01',4000546,1,1792),('2009-06-01',4000444,1,2678),('2009-06-01',4000546,3,2707),('2009-07-01',4000444,2,1788),('2009-07-01',4000546,1,3385),('2009-08-01',4000444,2,2555),('2009-08-01',4000546,4,4000),('2009-09-01',4000444,1,2510),('2009-09-01',4000546,4,1063),('2009-10-01',4000444,1,1899),('2009-10-01',4000546,1,1596),('2009-11-01',4000444,3,2202),('2009-11-01',4000546,3,3993),('2009-12-01',4000444,3,2632),('2009-12-01',4000546,3,1509),('2010-01-01',4000444,1,945),('2010-01-01',4000546,2,2385),('2010-02-01',4000444,4,1381),('2010-02-01',4000546,4,2387),('2010-03-01',4000444,2,2450),('2010-03-01',4000546,3,1707),('2010-04-01',4000444,2,1978),('2010-04-01',4000546,3,3479),('2010-05-01',4000444,2,2093),('2010-05-01',4000546,2,1649),('2010-06-01',4000444,3,905),('2010-06-01',4000546,4,2782),('2010-07-01',4000444,3,2767),('2010-07-01',4000546,4,3149),('2010-08-01',4000444,3,2350),('2010-08-01',4000546,4,1731),('2010-09-01',4000444,3,1711),('2010-09-01',4000546,4,1328),('2010-10-01',4000444,3,1046),('2010-10-01',4000546,4,3530),('2010-11-01',4000444,1,2280),('2010-11-01',4000546,4,1150),('2010-12-01',4000444,1,2391),('2010-12-01',4000546,1,3642),('2011-01-01',4000444,3,1561),('2011-01-01',4000546,1,3903),('2011-02-01',4000444,4,2481),('2011-02-01',4000546,1,3956),('2011-03-01',4000444,1,1002),('2011-03-01',4000546,3,3737),('2011-04-01',4000444,1,1453),('2011-04-01',4000546,2,1479),('2011-05-01',4000444,1,2231),('2011-05-01',4000546,1,2334),('2011-06-01',4000444,1,1347),('2011-06-01',4000546,4,2042),('2011-07-01',4000444,4,1771),('2011-07-01',4000546,4,1535),('2011-08-01',4000444,3,2170),('2011-08-01',4000546,1,2057),('2011-09-01',4000444,1,1901),('2011-09-01',4000546,1,3920),('2011-10-01',4000444,1,2965),('2011-10-01',4000546,2,3565),('2011-11-01',4000444,2,1412),('2011-11-01',4000546,3,1860),('2011-12-01',4000444,3,2776),('2011-12-01',4000546,2,1290),('2012-01-01',4000444,2,2581),('2012-01-01',4000546,2,1855),('2012-02-01',4000444,2,2926),('2012-02-01',4000546,2,3991),('2012-03-01',4000444,2,2353),('2012-03-01',4000546,3,3421),('2012-04-01',4000444,3,1716),('2012-04-01',4000546,1,3292),('2012-05-01',4000444,3,1178),('2012-05-01',4000546,3,1329),('2012-06-01',4000444,4,2672),('2012-06-01',4000546,1,3337),('2012-07-01',4000444,2,2882),('2012-07-01',4000546,3,3108),('2012-08-01',4000444,3,1221),('2012-08-01',4000546,2,3480),('2012-09-01',4000444,4,1083),('2012-09-01',4000546,1,2666),('2012-10-01',4000444,4,1560),('2012-10-01',4000546,3,3021),('2012-11-01',4000444,3,1385),('2012-11-01',4000546,2,1061),('2012-12-01',4000444,1,1485),('2012-12-01',4000546,2,1723),('2013-01-01',4000444,1,1326),('2013-01-01',4000546,2,1101),('2013-02-01',4000444,4,2828),('2013-02-01',4000546,3,1503),('2013-03-01',4000444,1,1966),('2013-03-01',4000546,1,3011),('2013-04-01',4000444,3,1790),('2013-04-01',4000546,2,1186),('2013-05-01',4000444,4,2630),('2013-05-01',4000546,4,2265),('2013-06-01',4000444,4,1438),('2013-06-01',4000546,2,3233),('2013-07-01',4000444,4,2994),('2013-07-01',4000546,4,1757),('2013-08-01',4000444,3,981),('2013-08-01',4000546,1,1589),('2013-09-01',4000444,3,1051),('2013-09-01',4000546,2,1870),('2013-10-01',4000444,4,2130),('2013-10-01',4000546,2,1182),('2013-11-01',4000444,1,1095),('2013-11-01',4000546,4,1377),('2013-12-01',4000444,2,2196),('2013-12-01',4000546,4,3530),('2014-01-01',4000444,2,2431),('2014-01-01',4000546,1,1633),('2014-02-01',4000444,4,1966),('2014-02-01',4000546,1,1367),('2014-03-01',4000444,2,2178),('2014-03-01',4000546,1,2927),('2014-04-01',4000444,3,1207),('2014-04-01',4000546,3,2427),('2014-05-01',4000444,2,1641),('2014-05-01',4000546,2,2396),('2014-06-01',3000171,1,2227),('2014-06-01',4000444,3,1330),('2014-06-01',4000546,1,3930),('2014-07-01',3000171,4,3997),('2014-07-01',4000444,1,2820),('2014-07-01',4000546,2,2652),('2014-08-01',3000171,1,3198),('2014-08-01',4000444,3,2074),('2014-08-01',4000546,1,3962),('2014-09-01',3000171,1,4334),('2014-09-01',4000444,3,1184),('2014-09-01',4000546,3,3412),('2014-10-01',3000171,4,2895),('2014-10-01',4000444,3,2446),('2014-10-01',4000546,2,3416),('2014-11-01',3000171,2,2033),('2014-11-01',4000444,2,2071),('2014-11-01',4000546,4,3482),('2014-12-01',3000171,4,1584),('2014-12-01',4000444,3,1888),('2014-12-01',4000546,2,2156),('2015-01-01',3000171,4,2884),('2015-01-01',4000444,4,2503),('2015-01-01',4000546,3,3759),('2015-02-01',3000171,4,1370),('2015-02-01',4000444,1,2999),('2015-02-01',4000546,2,1004),('2015-03-01',3000171,2,4739),('2015-03-01',4000444,1,1441),('2015-03-01',4000546,2,3030),('2015-04-01',3000171,4,1140),('2015-04-01',4000444,1,2901),('2015-04-01',4000546,4,3970),('2015-05-01',3000171,2,2399),('2015-05-01',4000444,4,1579),('2015-05-01',4000546,4,2642),('2015-06-01',3000171,1,3531),('2015-06-01',4000444,4,920),('2015-06-01',4000546,4,1752),('2015-07-01',3000171,1,2555),('2015-07-01',4000444,4,1984),('2015-07-01',4000546,4,972),('2015-08-01',3000171,4,3488),('2015-08-01',4000444,1,2992),('2015-08-01',4000546,2,1691),('2015-09-01',3000171,3,1003),('2015-09-01',4000444,3,1953),('2015-09-01',4000546,4,1971),('2015-10-01',3000171,3,2190),('2015-10-01',4000444,3,2745),('2015-10-01',4000546,2,1265),('2015-11-01',3000171,2,2097),('2015-11-01',4000444,4,1828),('2015-11-01',4000546,2,3221),('2015-12-01',3000171,1,1600),('2015-12-01',4000444,1,1286),('2015-12-01',4000546,3,2449),('2016-01-01',3000171,3,4507),('2016-01-01',4000444,2,1289),('2016-01-01',4000546,2,3379),('2016-02-01',3000171,2,1520),('2016-02-01',4000444,2,2477),('2016-02-01',4000546,4,3951),('2016-03-01',3000171,4,1008),('2016-03-01',4000444,2,2816),('2016-03-01',4000546,3,3834),('2016-04-01',3000171,3,1418),('2016-04-01',4000444,3,1938),('2016-04-01',4000546,3,1322),('2016-05-01',3000171,4,4610),('2016-05-01',4000444,4,1680),('2016-05-01',4000546,1,1666),('2016-06-01',3000171,2,2500),('2016-06-01',4000444,3,2942),('2016-06-01',4000546,4,3998),('2016-07-01',3000171,4,1943),('2016-07-01',4000444,4,2021),('2016-07-01',4000546,2,3310),('2016-08-01',3000171,2,4153),('2016-08-01',4000444,3,2438),('2016-08-01',4000546,3,2757),('2016-09-01',3000171,3,1535),('2016-09-01',4000444,1,1681),('2016-09-01',4000546,1,3384),('2016-10-01',3000171,3,1097),('2016-10-01',4000444,1,1045),('2016-10-01',4000546,2,980),('2016-11-01',3000171,2,2683),('2016-11-01',4000444,2,2893),('2016-11-01',4000546,3,1017),('2016-12-01',3000171,3,2009),('2016-12-01',4000444,1,1619),('2016-12-01',4000546,4,1820),('2017-01-01',3000171,3,4699),('2017-01-01',4000444,2,2461),('2017-01-01',4000546,3,3444),('2017-02-01',3000171,2,4689),('2017-02-01',4000444,3,2482),('2017-02-01',4000546,2,3200),('2017-03-01',3000171,1,4826),('2017-03-01',4000444,2,2172),('2017-03-01',4000546,3,3507),('2017-04-01',3000171,3,3293),('2017-04-01',4000444,3,1025),('2017-04-01',4000546,3,3682),('2017-05-01',3000171,2,2482),('2017-05-01',4000444,2,2541),('2017-05-01',4000546,3,2026),('2017-05-01',4000556,1,1670),('2017-06-01',3000171,3,2729),('2017-06-01',4000444,2,1789),('2017-06-01',4000546,4,2784),('2017-06-01',4000556,3,1192),('2017-07-01',3000171,1,3747),('2017-07-01',4000444,1,2859),('2017-07-01',4000546,4,2229),('2017-07-01',4000556,3,1459),('2017-08-01',3000171,1,2224),('2017-08-01',4000444,4,2272),('2017-08-01',4000546,1,3901),('2017-08-01',4000556,2,3014),('2017-09-01',3000171,3,1760),('2017-09-01',4000444,3,1877),('2017-09-01',4000546,4,3202),('2017-09-01',4000556,4,1905),('2017-10-01',3000171,3,4925),('2017-10-01',4000444,2,2218),('2017-10-01',4000546,1,1490),('2017-10-01',4000556,4,1024),('2017-11-01',3000171,2,3054),('2017-11-01',4000444,4,2870),('2017-11-01',4000546,2,3780),('2017-11-01',4000556,3,1939),('2017-12-01',3000171,4,2693),('2017-12-01',4000444,3,2993),('2017-12-01',4000546,1,2714),('2017-12-01',4000556,2,2284),('2018-01-01',3000171,4,2179),('2018-01-01',4000444,3,2205),('2018-01-01',4000546,1,3320),('2018-01-01',4000556,4,2177),('2018-02-01',3000171,3,2597),('2018-02-01',4000444,2,2179),('2018-02-01',4000546,3,1384),('2018-02-01',4000556,4,1097),('2018-03-01',3000171,2,2324),('2018-03-01',4000444,2,1867),('2018-03-01',4000546,3,3702),('2018-03-01',4000556,2,3027),('2018-04-01',3000171,4,4797),('2018-04-01',4000444,4,2068),('2018-04-01',4000546,3,3550),('2018-04-01',4000556,1,1205),('2018-05-01',3000171,4,3708),('2018-05-01',3000172,2,2458),('2018-05-01',4000444,2,1761),('2018-05-01',4000546,3,3632),('2018-05-01',4000556,1,2110),('2018-06-01',3000171,2,4026),('2018-06-01',3000172,2,2876),('2018-06-01',4000444,3,1855),('2018-06-01',4000546,1,1896),('2018-06-01',4000556,4,1370),('2018-07-01',3000171,1,4391),('2018-07-01',3000172,2,2500),('2018-07-01',4000444,3,2844),('2018-07-01',4000546,2,2524),('2018-07-01',4000556,2,2669),('2018-07-01',6666666,1,1025),('2018-08-01',3000171,1,1157),('2018-08-01',3000172,2,1200),('2018-08-01',4000444,2,1078),('2018-08-01',4000546,3,1009),('2018-08-01',4000556,2,1713),('2018-08-01',4444444,1,1678),('2018-08-01',6666666,1,3366),('2018-09-01',3000171,4,1436),('2018-09-01',3000172,2,800),('2018-09-01',4000444,4,1899),('2018-09-01',4000546,1,944),('2018-09-01',4000556,1,3061),('2018-09-01',4444444,1,1430),('2018-09-01',6666666,1,2225),('2018-10-01',2222222,1,2909),('2018-10-01',3000171,2,2400),('2018-10-01',3000172,2,1500),('2018-10-01',4000444,1,920),('2018-10-01',4000546,1,3263),('2018-10-01',4000556,1,1926),('2018-10-01',4444444,1,3117),('2018-10-01',6666666,1,1746),('2018-11-01',2222222,1,2774),('2018-11-01',3000171,2,2675),('2018-11-01',3000172,2,1325),('2018-11-01',4000444,2,1860),('2018-11-01',4000546,2,1524),('2018-11-01',4000556,2,2574),('2018-11-01',4444444,1,1113),('2018-11-01',6666666,1,3198),('2018-11-01',6666666,2,2540),('2018-12-01',2222222,1,3560),('2018-12-01',3000171,3,1500),('2018-12-01',3000172,2,1527),('2018-12-01',4000444,3,1563),('2018-12-01',4000546,2,3542),('2018-12-01',4000556,2,2540),('2018-12-01',4444444,1,2584);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `COD_FAMILIA_COMERCIAL` int(11) NOT NULL,
  `NOME_PRODUTO` varchar(255) NOT NULL,
  `SKU` int(11) NOT NULL,
  PRIMARY KEY (`SKU`),
  KEY `FK_PRODUTO_FAMILIA_COMERCIAL` (`COD_FAMILIA_COMERCIAL`),
  CONSTRAINT `FK_PRODUTO_FAMILIA_COMERCIAL` FOREIGN KEY (`COD_FAMILIA_COMERCIAL`) REFERENCES `familia_comercial` (`COD_FAMILIA_COMERCIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (14414013,'MM2',2222222),(14414013,'Placa de rede',3000171),(14414013,'Teste_D',3000172),(14414013,'Camera X1',4000400),(14414013,'Camera X3',4000402),(14414013,'Camera X5',4000404),(14414013,'Camera X6',4000406),(14414013,'Camera X7',4000408),(14414013,'Camera X8',4000440),(14414013,'Camera X9',4000442),(14414013,'Camera X10',4000444),(14414013,'Roteador Y1',4000538),(14414013,'Roteador Y2',4000540),(14414013,'Roteador Y3',4000546),(14414013,'Navegador Web',4000556),(14414013,'MM4',4444444),(14414013,'MM6',6666666);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sku_phase`
--

DROP TABLE IF EXISTS `sku_phase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sku_phase` (
  `SKU_PHASE_IN` int(11) NOT NULL,
  `SKU_PHASE_OUT` int(11) NOT NULL,
  PRIMARY KEY (`SKU_PHASE_IN`,`SKU_PHASE_OUT`),
  KEY `FK_SKU_PHASE_OUT` (`SKU_PHASE_OUT`),
  CONSTRAINT `FK_SKU_PHASE_IN` FOREIGN KEY (`SKU_PHASE_IN`) REFERENCES `produto` (`SKU`),
  CONSTRAINT `FK_SKU_PHASE_OUT` FOREIGN KEY (`SKU_PHASE_OUT`) REFERENCES `produto` (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sku_phase`
--

LOCK TABLES `sku_phase` WRITE;
/*!40000 ALTER TABLE `sku_phase` DISABLE KEYS */;
INSERT INTO `sku_phase` VALUES (4000444,4000400),(4000444,4000402),(4000444,4000404),(4000444,4000406),(4000444,4000408),(4000444,4000440),(4000444,4000442),(4000546,4000538),(4000546,4000540);
/*!40000 ALTER TABLE `sku_phase` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-06  0:13:20
