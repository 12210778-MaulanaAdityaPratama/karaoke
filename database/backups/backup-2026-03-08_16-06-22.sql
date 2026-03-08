/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: masterpiece_karaoke
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `fnb_categories`
--

DROP TABLE IF EXISTS `fnb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fnb_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fnb_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnb_categories`
--

LOCK TABLES `fnb_categories` WRITE;
/*!40000 ALTER TABLE `fnb_categories` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fnb_categories` VALUES
(1,'Minuman','minuman','🥤',1,1,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(2,'Makanan Berat','makanan-berat','🍱',1,2,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(3,'Snack & Cemilan','snack-cemilan','🍟',1,3,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(4,'Dessert','dessert','🍰',1,4,'2026-03-04 11:05:24','2026-03-04 11:05:24');
/*!40000 ALTER TABLE `fnb_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `fnb_items`
--

DROP TABLE IF EXISTS `fnb_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fnb_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fnb_category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `badge` varchar(255) DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fnb_items_fnb_category_id_foreign` (`fnb_category_id`),
  CONSTRAINT `fnb_items_fnb_category_id_foreign` FOREIGN KEY (`fnb_category_id`) REFERENCES `fnb_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fnb_items`
--

LOCK TABLES `fnb_items` WRITE;
/*!40000 ALTER TABLE `fnb_items` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fnb_items` VALUES
(1,1,'Es Teh Manis',NULL,12000.00,NULL,1,NULL,1,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(2,1,'Es Jeruk',NULL,15000.00,NULL,1,NULL,2,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(3,1,'Jus Alpukat',NULL,22000.00,NULL,1,'Recommended',3,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(4,1,'Jus Mangga',NULL,20000.00,NULL,1,NULL,4,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(5,1,'Pitcher Juice Mix',NULL,65000.00,NULL,1,'Best Seller',5,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(6,1,'Air Mineral',NULL,8000.00,NULL,1,NULL,6,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(7,1,'Soft Drink (Kaleng)',NULL,15000.00,NULL,1,NULL,7,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(8,1,'Ice Lemon Tea',NULL,18000.00,NULL,1,'Favorit',8,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(9,1,'Orange Juice',NULL,20000.00,NULL,1,NULL,9,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(10,2,'Nasi Goreng Spesial',NULL,35000.00,NULL,1,'Best Seller',1,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(11,2,'Mie Goreng Spesial',NULL,30000.00,NULL,1,NULL,2,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(12,2,'Nasi Ayam Geprek',NULL,32000.00,NULL,1,'Spicy 🌶',3,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(13,2,'Indomie Goreng Telur',NULL,18000.00,NULL,1,NULL,4,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(14,2,'Paket Nasi + Lauk',NULL,40000.00,NULL,1,'Recommended',5,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(15,3,'French Fries',NULL,22000.00,NULL,1,'Favorit',1,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(16,3,'Chicken Pop',NULL,25000.00,NULL,1,NULL,2,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(17,3,'Pisang Goreng Crispy',NULL,18000.00,NULL,1,'Recommended',3,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(18,3,'Tahu Lada Garam',NULL,20000.00,NULL,1,'Favorit',4,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(19,3,'Dimsum (6 pcs)',NULL,28000.00,NULL,1,NULL,5,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(20,4,'Es Krim (2 scoop)',NULL,20000.00,NULL,1,NULL,1,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(21,4,'Brownies Hangat',NULL,22000.00,NULL,1,'Recommended',2,'2026-03-04 11:05:24','2026-03-04 11:05:24'),
(22,4,'Waffle + Topping',NULL,28000.00,NULL,1,NULL,3,'2026-03-04 11:05:24','2026-03-04 11:05:24');
/*!40000 ALTER TABLE `fnb_items` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2024_01_01_000001_create_packages_with_tiers',1),
(5,'2024_01_01_000001_create_rooms_table',1),
(6,'2024_01_01_000003_create_fnb_tables',1),
(7,'2026_03_05_155219_add_image_to_packages',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `package_tiers`
--

DROP TABLE IF EXISTS `package_tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_tiers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '#CD7F32',
  `price` decimal(10,2) NOT NULL,
  `badge` varchar(255) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_tiers_package_id_foreign` (`package_id`),
  CONSTRAINT `package_tiers_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_tiers`
--

LOCK TABLES `package_tiers` WRITE;
/*!40000 ALTER TABLE `package_tiers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `package_tiers` VALUES
(1,1,'Bronze','#CD7F32',300000.00,NULL,1,1,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(2,1,'Silver','#A8A9AD',350000.00,NULL,1,2,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(3,1,'Gold','#FFD700',450000.00,'Best Value',1,3,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(4,2,'Bronze','#CD7F32',400000.00,NULL,1,1,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(5,2,'Silver','#A8A9AD',500000.00,NULL,1,2,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(6,2,'Gold','#FFD700',650000.00,'Best Seller',1,3,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(7,3,'Bronze','#CD7F32',600000.00,NULL,1,1,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(8,3,'Silver','#A8A9AD',750000.00,NULL,1,2,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(9,3,'Gold','#FFD700',950000.00,'Recommended',1,3,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(10,1,'Platinum','#bfb5ab',5000.00,'Best Seller',1,0,'2026-03-04 11:33:43','2026-03-04 11:33:43'),
(11,4,'bronze','#CD7F32',5000.00,NULL,1,0,'2026-03-04 11:35:31','2026-03-04 11:35:31');
/*!40000 ALTER TABLE `package_tiers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `duration_hours` int(11) NOT NULL DEFAULT 2,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `packages` VALUES
(1,'Paket Hemat','Free Room 2 Jam','packages/AV4teiTZ2zFpQKYnUBDQXQWeZfzZjI5OADaPW1tV.jpg',2,1,1,'2026-03-04 11:05:23','2026-03-07 05:47:38'),
(2,'Paket Asik','Free Room 3 Jam + Bonus Snack',NULL,3,1,2,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(3,'Paket Family','Free Room 3 Jam untuk Keluarga',NULL,3,1,3,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(4,'paket ramadhan','free room 3 hours','packages/TOhoRKO8gSVEAUxX7IvvTj1bhpV2yIwcn1HvAeZB.jpg',3,1,0,'2026-03-04 11:34:41','2026-03-05 09:26:50');
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `password_reset_tokens` VALUES
('aditya.neo5@gmail.com','$2y$12$y1WLcO0ms0ywEFKsrfBsMOUCbmsGxOPFmCUsci7nyPjDAu1Fd7ufG','2026-03-08 08:17:21'),
('admin@masterpiece.com','$2y$12$ukJOT1Lzo9EESFr8CTmE9O/APtydNg.NCVDsGdh1ELVo9YEk1vcmO','2026-03-08 07:50:17');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` enum('small','medium','large','vip') NOT NULL DEFAULT 'medium',
  `capacity_min` int(11) NOT NULL DEFAULT 2,
  `capacity_max` int(11) NOT NULL DEFAULT 6,
  `price_weekday` decimal(10,2) NOT NULL,
  `price_weekend` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `facilities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`facilities`)),
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `rooms` VALUES
(5,'Room Bronze','small',2,4,89000.00,89000.00,'Room nyaman untuk bernyanyi berdua atau bersama sahabat dekat. Dilengkapi sistem audio berkualitas tinggi.','rooms/sXpDcDtiysn3bDA3I1gnD5jRW8RxQUInNgjKXjBY.jpg','[\"LED TV 43\\\"\",\"Sistem Audio Premium\",\"AC\",\"Sofa\",\"Mic 2 buah\"]',1,1,'2026-03-02 09:07:03','2026-03-02 09:52:56'),
(6,'Room Silver','medium',4,6,119000.00,119000.00,'Pilihan terbaik untuk grup kecil. Ruangan luas dengan pencahayaan mood lighting yang bisa disesuaikan.','rooms/wczloC2Jp2w92M9buxdPQaW05yjK4WNGurv9qjKJ.jpg','[\"LED TV 42\\\"\",\"Sistem Audio Surround\",\"AC\",\"Sofa Panjang\",\"Mic 2 buah\",\"Mood Lighting\"]',1,2,'2026-03-02 09:07:03','2026-03-02 09:55:20'),
(7,'Room Gold','large',6,8,159000.00,159000.00,'Room besar untuk pesta dan gathering keluarga. Space lega dengan panggung mini dan sistem audio terbaik.','rooms/Yg6ANvw4GTXVHmQBOemXqvMEG1l6F8oEgeNQCAIl.jpg','[\"LED TV 42\\\"\",\"Sistem Audio Theater\",\"AC\",\"Sofa + Kursi Extra\",\"Mic 2 buah\",\"Mood Lighting\",\"Disco Ball\"]',1,3,'2026-03-02 09:07:04','2026-03-02 10:02:09'),
(8,'Room Platinum','vip',8,10,199000.00,199000.00,'Pengalaman karaoke premium dengan dekorasi eksklusif, sofa mewah, dan layanan prioritas. Cocok untuk acara spesial.','rooms/Wc0rtyWoLhohHB9vSMlueA5HLO0zMUUC9X1d4Sfk.jpg','[\"Smart TV 42\\\"\",\"Sistem Audio JBL Pro\",\"AC Inverter\",\"Sofa Kulit Mewah\",\"Mic Wireless 2 buah\",\"Mood Lighting RGB\",\"Disco Ball\"]',1,4,'2026-03-02 09:07:04','2026-03-02 09:58:01'),
(9,'Room Diamond','vip',13,15,299000.00,299000.00,'Room Diamond','rooms/4zpR2K2smCnUVOG83Xxj4sLhl8lks6YAQJqvB9D5.jpg','[\"2 LED TV 42\\\"\",\"Monitor TV 32\\\"\",\"Sistem Audio Surround\",\"AC\",\"Sofa Panjang\",\"Mic 2 buah\",\"Mood Lighting\"]',1,5,'2026-03-02 09:59:59','2026-03-02 10:06:47'),
(10,'Room VIP','vip',18,20,399000.00,399000.00,'Room Vip','rooms/X4Godvych4zONTtL4WMkgym90e6Iu24upnEesCRu.jpg','[\"2 LED TV 42\\\"\",\"Monitor TV 32\\\"\",\"Sistem Audio Theater\",\"AC\",\"Sofa + Kursi Extra\",\"Mic 3 buah\",\"Mood Lighting\",\"Disco Ball\",\"Private Toilet\"]',1,6,'2026-03-02 10:01:45','2026-03-02 10:01:45'),
(11,'Room VIP Signature','vip',18,20,499000.00,499000.00,'Room Vip Signature','rooms/b0THijirhYjTHFlxhmTjJi9BqZ8nvRT4HxW9T9IN.jpg','[\"Smart TV 75\\\"\",\"Sistem Audio TurboSound Pro\",\"AC Inverter\",\"Sofa Kulit Mewah\",\"Mic Wireless 3 buah\",\"Mood Lighting RGB\",\"Disco Ball\"]',1,7,'2026-03-02 10:04:20','2026-03-02 10:07:14'),
(12,'Room VVIP','vip',23,25,599000.00,599000.00,'Room VVIP','rooms/Pt9E3jiux6iyMdLu2H6upYMXDEi3L4GG448gOvio.jpg','[\"2 LED TV 42\\\"\",\"Monitor TV 32\\\"\",\"Sistem Audio Theater\",\"AC\",\"Sofa + Kursi Extra\",\"Mic 3 buah\",\"Mood Lighting\",\"Disco Ball\",\"Private Toilet\"]',1,8,'2026-03-02 10:05:34','2026-03-02 10:07:24'),
(13,'Room Solitare','vip',28,30,699000.00,699000.00,'Room Solitare','rooms/vUwGKD6jEdobwCFAdQIkWD31sTGjhkeAL7P1GDvY.jpg','[\"2 LED TV 42\\\"\",\"Monitor TV 32\\\"\",\"Sistem Audio Theater\",\"AC\",\"Sofa + Kursi Extra\",\"Mic 3 buah\",\"Mood Lighting\",\"Disco Ball\",\"Private Toilet\"]',1,9,'2026-03-02 10:06:33','2026-03-02 10:07:29');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sessions` VALUES
('9L9o332NUhysfWULnGdMqkINZ5z78C0sNBH2Gkfl',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEZrZ3BHekxNT2hwNWVqaFNTeUxyZUI1ZFNiYzdIbUUzczh1NkV5RiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fX0=',1772983653),
('C1nxEqxMvl5ip2xp5uTp3DOPqOGta0xXJtzqJLCM',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVZrcEJLYURyZ3FuVkZiTEc2dTNtZHVxYU5PZWhXc1VPNTU1YXhPSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1772985618);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tier_includes`
--

DROP TABLE IF EXISTS `tier_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tier_includes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `package_tier_id` bigint(20) unsigned NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tier_includes_package_tier_id_foreign` (`package_tier_id`),
  CONSTRAINT `tier_includes_package_tier_id_foreign` FOREIGN KEY (`package_tier_id`) REFERENCES `package_tiers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tier_includes`
--

LOCK TABLES `tier_includes` WRITE;
/*!40000 ALTER TABLE `tier_includes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tier_includes` VALUES
(1,1,'Ice Lemon Tea','1 Pitcher',0),
(2,1,'Pisang Goreng','1 Porsi',1),
(3,1,'Tahu Lada Garam','1 Porsi',2),
(4,2,'Ice Lemon Tea','1 Pitcher',0),
(5,2,'Orange Juice','1 Glass',1),
(6,2,'Pisang Goreng','1 Porsi',2),
(7,2,'Tahu Lada Garam','1 Porsi',3),
(8,3,'Ice Lemon Tea','2 Pitcher',0),
(9,3,'Pisang Goreng','1 Porsi',1),
(10,3,'Tahu Lada Garam','1 Porsi',2),
(11,4,'Ice Lemon Tea','1 Pitcher',0),
(12,4,'Pisang Goreng','1 Porsi',1),
(13,4,'French Fries','1 Porsi',2),
(14,5,'Ice Lemon Tea','1 Pitcher',0),
(15,5,'Orange Juice','1 Glass',1),
(16,5,'Pisang Goreng','1 Porsi',2),
(17,5,'French Fries','1 Porsi',3),
(18,5,'Tahu Lada Garam','1 Porsi',4),
(19,6,'Ice Lemon Tea','2 Pitcher',0),
(20,6,'Orange Juice','2 Glass',1),
(21,6,'Pisang Goreng','2 Porsi',2),
(22,6,'French Fries','1 Porsi',3),
(23,6,'Tahu Lada Garam','1 Porsi',4),
(24,6,'Chicken Pop','1 Porsi',5),
(25,7,'Ice Lemon Tea','2 Pitcher',0),
(26,7,'Pisang Goreng','2 Porsi',1),
(27,7,'French Fries','1 Porsi',2),
(28,7,'Tahu Lada Garam','1 Porsi',3),
(29,8,'Ice Lemon Tea','2 Pitcher',0),
(30,8,'Orange Juice','2 Glass',1),
(31,8,'Pisang Goreng','2 Porsi',2),
(32,8,'French Fries','2 Porsi',3),
(33,8,'Tahu Lada Garam','1 Porsi',4),
(34,9,'Ice Lemon Tea','3 Pitcher',0),
(35,9,'Orange Juice','2 Glass',1),
(36,9,'Pisang Goreng','2 Porsi',2),
(37,9,'French Fries','2 Porsi',3),
(38,9,'Tahu Lada Garam','1 Porsi',4),
(39,9,'Chicken Pop','1 Porsi',5),
(40,9,'Free Dekorasi','1 Set',6),
(41,10,'nangka','1 buah',0),
(42,11,'sda','2',0);
/*!40000 ALTER TABLE `tier_includes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'Administrator','admin@masterpiece.com',NULL,'$2y$12$qmaDiL5czk3ynR0kUZdrc.JLnIIN3KTjZpFONn10N2LhLEr2XSaM.',NULL,'2026-03-04 11:05:23','2026-03-04 11:05:23'),
(4,'adit','aditya.neo5@gmail.com',NULL,'$2y$12$Pr5KeMP4XZ01QiKFovn82OaKcUevAPzsg6GEjhZuytwK3HgElz9/m',NULL,NULL,NULL),
(5,'noriani','noriani296@gmail.com',NULL,'$2y$12$1FUd3NglviSnHc9Hxodzw.oG4OyROQEIWZdQNX6J3uXylgUIgHqi.','3h1v4oCAmPivtmgt083uFTnW5u0vNuTRUT4BXotWX7yRmBaUmsKfijuogZeT',NULL,'2026-03-08 08:27:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-08 23:06:22
