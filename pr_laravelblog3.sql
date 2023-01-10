-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: us-cdbr-east-06.cleardb.net    Database: heroku_516b3bc84cc9628
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Programming','programming','2019-11-27 04:56:49','2019-11-27 04:56:49'),(2,'Kesehatan','kesehatan','2019-11-27 04:56:57','2019-11-27 04:56:57'),(3,'Tekhnologi','tekhnologi','2019-11-27 04:57:43','2019-11-27 04:57:43'),(4,'Politik','politik','2019-11-27 04:58:09','2019-11-27 04:58:09'),(14,'Database MYSQL','database-mysql','2022-12-28 03:49:28','2022-12-28 03:49:28'),(24,'Linux','linux','2022-12-28 03:59:56','2022-12-28 03:59:56');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (14,'https://res.cloudinary.com/drliclrj8/image/upload/v1672289077/tutorial/2022-12-29_044437_pd_pasar.jpg','2022-12-29 04:44:37','2022-12-29 04:44:37');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (4,'2022_12_28_080530_create_images_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `project_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `portfolios_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (4,2,'SAHABAT PASAR','pd pasar.jpg','Merupakan sebuah sistem pembayaran seperti hal nya tagihan untuk PDAM, namun hal ini implementasikan pada pembayaran JPF (Jasa Pelayanan Fasilitas)','2022-12-27 10:00:21','2022-12-27 10:00:22');
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `photo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `isPublished` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,2,2,'https://res.cloudinary.com/drliclrj8/image/upload/v1672307344/tutorial/undraw_walk_in_the_city_1ma6_jeolav.png','Menjaga kesehatan mental','menjaga-kesehatan-mental','<p>Tulisan diambil dari <a href=\"/admin/post/hilman.space\">hilman.space</a>&nbsp;</p>\r\n<p><strong>Beberapa tips menjaga kesehatan mental</strong></p>\r\n<p><strong>1. Harga diri sendiri, </strong></p>\r\n<p>jangan mudah menghakimi gagal hanya karena satu kesalahan. Belajar memaafkan diri sendiri. Tidak ada yang sempurna.. tidak ada. Jangan terlena dengan orang lain yang terlihat sempurna. Tidak ada yang sempurna.</p>\r\n<p><strong>2. Ngobrol sama teman yang kamu nyaman (bukan teman di sosialmedia, tapi dunia nyata)</strong></p>\r\n<p>Yang kamu ngga malu kentut dekat dia. (Poinnya tentu saja kamu kentut dekat dia terus, tapi menandakan tidak ada yang kamu rahasiakan). Telfon jika sudah jarang bertemu, memang agak aneh saat di awal.</p>\r\n<p><strong>3. Punya aktivitas yang asyik</strong></p>\r\n<p>Waktu bangun kamu jangan sampai 100% hanya untuk kerja. Apa hobi kamu, apa olahraga yang kamu suka, sediakan waktu untuk itu.</p>\r\n<p>Setelah mengerjakan tugas berat, traktir diri kamu sendiri, beri hadiah yang mengembalikan&nbsp;<em>mood</em>&nbsp;dan semangat. Hadiahnya tidak selalu fisik. Bisa jadi jalan ke taman atau bentuk lainnya yang kamu suka.</p>\r\n<p>Sediakan waktu untuk berpikir, apa yang bisa kamu perbaiki, siapa yang bisa kamu hubungi, dan pertanyaan-pertanyaan penting lainnya. Terus sibuk dari satu hal ke hal lain tanpa waktu kosong diri sendiri juga tidak baik.</p>\r\n<p>Sediakan waktu dan lebih aktif bertanya saat temanmu terlihat berbeda dari biasanya. Orang lebih cenderung menyimpan sakit mental sendiri.</p>\r\n<p>Yang terakhir dan sebenarnya pertama, kamu punya Tuhan, Tuhan yang menciptakan semuanya, setiap hari berusaha mendekat denganNya, jangan malu dan takut, Dia tahu semuanya. Masalah kamu akan diselesaikan, meskipun semuanya terlihat sulit dan tidak mungkin.</p>\r\n<p><strong>Apakah ini hal memalukan?</strong></p>\r\n<p>Kalau kamu merasa sudah banyak uang dan sudah populer, sayangnya justru kita banyak mendengar kabar bunuh diri dari kalangan ini. Hal-hal duniawi sama sekali bukan jaminan kamu bisa terbebas dari masalah penyakit mental ini.</p>\r\n<p>Pernyakit mental adalah hal yang umum yang setiap dari kita bisa rasakan. Menjaga kesehatan mental bukanlah hal yang memalukan. Jangan malu meminta bantuan dan bertanya seputar tema ini. Bikin hal ini menjadi lazim untuk diobrolkan.</p>',1,'2019-11-27 05:11:03','2022-12-29 09:55:03'),(2,2,3,'https://res.cloudinary.com/drliclrj8/image/upload/v1672307344/tutorial/undraw_walk_in_the_city_1ma6_jeolav.png','Mendapatkan uang tanpa keluar rumah','mendapatkan-uang-tanpa-keluar-rumah','<p>Jutaan orang bahkan tidak menyadari, bahwa mereka bisa mendapatkan $1000 perhari tanpa meninggalkan rumah dan Anda adalah salah satunya</p>\r\n<p>Dengan bekerja sebagai freelancer, Anda tentunya bisa mendapatkan uang tanpa meninggalkan rumah, asalkan Anda tahu caranya. Disini saya akan membagikan beberapa situs website untuk Anda supaya bisa bekerja sebagai freelancer.</p>\r\n<p>Sebelum bekerja sebagai freelancer, Anda tentunya harus mempunyai skills yang memupuni skill yang banyak orang lain cari atau butuhkan, beberapa skill yang banyak dibutuhkan orang saat ini diantaranya adalah&nbsp; design, coding, entry data, translate, dan lain-lain.</p>\r\n<p><strong>Beberapa situs Anda dapat mendapat clients :&nbsp;</strong></p>\r\n<h4>1. Sribulancer</h4>\r\n<p>Yang pertama ini ada <a href=\"/admin/post/Sribulancer.com\">Sribulancer.com</a>, Sribulancer adalah salah satu website freelance yang popular di Indonesia. Disini, Anda bisa menemukan pekerjaan seperti yang berhubungan dengan jasa pembuatan website, graphic design, penulisan artikel, penerjemah, sampai dengan social media marketing. Anda tidak perlu khawatir karena Sribulancer bisa dibilang lebih lokal dari website freelance lainnya. Mereka menerima pembayaran melalui transfer bank. Tentunya ini menjadi nilai plus karena kebanyakan orang Indonesia tidak memiliki kartu kredit.</p>\r\n<h4>2. Upwork</h4>\r\n<p><a href=\"https://www.upwork.com/\" target=\"_blank\" rel=\"noopener\">Upwork</a> adalah situs freelance luar negeri, jadi Anda harus siap dengan skill bahasa inggris Anda untuk bisa mencari client di situs ini, kabar baiknya sekarang ada google translate yang siap membantu Anda. Website ini bisa digunakan oleh bisnis dari berbagai ukuran dan freelancer dengan tingkat keterampilan yang berbeda. Upwork memungkinkan Anda untuk menyaring daftar pekerjaan yang tersedia sesuai dengan keterampilan Anda. Selain itu, UpWork juga memiliki fitur yang membantu mendeteksi apakah klien yang mendaftarkan pekerjaan itu palsu atau tidak. UpWork sering disebut sebagai website freelance terbaik karena mereka menyediakan layanan yang berkualitas tinggi.</p>\r\n<p><strong>3. Fiverr</strong></p>\r\n<p><a href=\"/admin/post/fiverr.com\">Fiverr</a> adalah situs dimana freelancer bisa menawarkan keahliannya, menawarkan jasanya di berbagai bidang baik itu design, programmin, dan masih banyak lainnya. Fiverr adalah situs yang sangat menarik menurut Saya, karena situs ini berbeda dengan situs freelancer lainnya. Anda bisa mencobanya sendiri jika ingin merasakan perbedaannya.</p>',1,'2019-11-27 06:09:54','2022-12-29 09:55:08'),(4,2,14,'https://res.cloudinary.com/drliclrj8/image/upload/v1672307715/tutorial/2022-12-29_095515_mysql.png','Cara backup dan Restore Database MYSQL dengan Command Line','cara-backup-dan-restore-database-mysql','<p>Berikut adalah cara <strong>backup</strong> mysql dengan <strong>mysqldump</strong></p>\r\n<div class=\"crayon-pre\" style=\"font-size: 12px !important; line-height: 15px !important; -moz-tab-size: 4; -o-tab-size: 4; -webkit-tab-size: 4; tab-size: 4;\">\r\n<div id=\"urvanov-syntax-highlighter-63abb5feb9cc7114943805-1\" class=\"crayon-line\"><code><span class=\"crayon-v\">mysqldump</span> <span class=\"crayon-o\">-</span><span class=\"crayon-i\">u</span> <span class=\"crayon-sy\">[</span><span class=\"crayon-e\">user </span><span class=\"crayon-v\">name</span><span class=\"crayon-sy\">]</span> &ndash;<span class=\"crayon-i\">p</span> <span class=\"crayon-sy\">[</span><span class=\"crayon-v\">password</span><span class=\"crayon-sy\">]</span> <span class=\"crayon-sy\">[</span><span class=\"crayon-v\">options</span><span class=\"crayon-sy\">]</span> <span class=\"crayon-sy\">[</span><span class=\"crayon-v\">database_name</span><span class=\"crayon-sy\">]</span> <span class=\"crayon-sy\">[</span><span class=\"crayon-v\">tablename</span><span class=\"crayon-sy\">]</span> <span class=\"crayon-o\">&gt;</span> <span class=\"crayon-sy\">[</span><span class=\"crayon-v\">dumpfilename</span><span class=\"crayon-sy\">.</span><span class=\"crayon-v\">sql</span><span class=\"crayon-sy\">]</span></code></div>\r\n<div class=\"crayon-line\">&nbsp;</div>\r\n<div class=\"crayon-line\"><span class=\"crayon-sy\"><span class=\"crayon-sy\">adapun parameternya:<br /></span></span>\r\n<ol>\r\n<li><strong>-u [user_name]:</strong> It is a username to connect to the MySQL server. To generate the backup using <strong><em>mysqldump</em></strong>, &lsquo;<strong>Select</strong>&lsquo; to dump the tables, &lsquo;<strong>Show View</strong>&lsquo; for views, &lsquo;<strong>Trigger</strong>&lsquo; for the triggers. If you are not using &mdash;<strong><em>single-transaction</em></strong> option, then &lsquo;<strong>Lock Tables</strong>&lsquo; privileges must be granted to the user</li>\r\n<li><strong>-p [password]:</strong> The valid password of the MySQL user</li>\r\n<li><strong>[option]:</strong> The configuration option to customize the backup</li>\r\n<li><strong>[database name]:</strong> Name of the database that you want to take backup</li>\r\n<li><strong>[table name]:</strong> This is an optional parameter. If you want to take the backup specific tables, then you can specify the names in the command</li>\r\n<li><strong>&ldquo;&lt;&rdquo; OR &rdquo;&gt;&rdquo;:</strong> This character indicates whether we are generating the backup of the database or restoring the database. You can use &ldquo;<strong>&gt;&rdquo; </strong>to generate the backup and &ldquo;<strong>&lt;</strong>&rdquo; to restore the backup</li>\r\n<li><strong>[dumpfilename.sql]:</strong> Path and name of the backup file. As I mentioned, we can generate the backup in XML, delimited text, or SQL file so we can provide the extension of the file accordingly</li>\r\n</ol>\r\n<p>&nbsp;</p>\r\n<p>Adapun untuk <strong>restorenya</strong> adalah sebagi berikut</p>\r\n<div class=\"crayon-pre\" style=\"font-size: 12px !important; line-height: 15px !important; -moz-tab-size: 4; -o-tab-size: 4; -webkit-tab-size: 4; tab-size: 4;\">\r\n<div id=\"urvanov-syntax-highlighter-63abb5feb9cd6593175344-1\" class=\"crayon-line\"><code><span class=\"crayon-v\">mysql</span> <span class=\"crayon-o\">-</span><span class=\"crayon-i\">u</span> <span class=\"crayon-v\">root</span> <span class=\"crayon-o\">-</span><span class=\"crayon-i\">p</span> <span class=\"crayon-v\">sakila</span> <span class=\"crayon-o\">&lt;</span> <span class=\"crayon-v\">C</span><span class=\"crayon-o\">:</span><span class=\"crayon-sy\">\\</span><span class=\"crayon-v\">MySQLBackup</span><span class=\"crayon-sy\">\\</span><span class=\"crayon-v\">sakila_20200424</span><span class=\"crayon-sy\">.</span><span class=\"crayon-v\">sql</span></code></div>\r\n<div class=\"crayon-line\">&nbsp;</div>\r\n<div class=\"crayon-line\"><span class=\"crayon-v\">atau</span></div>\r\n<div class=\"crayon-line\">&nbsp;</div>\r\n<div class=\"crayon-line\">\r\n<div class=\"crayon-pre\" style=\"font-size: 12px !important; line-height: 15px !important; -moz-tab-size: 4; -o-tab-size: 4; -webkit-tab-size: 4; tab-size: 4;\">\r\n<div id=\"urvanov-syntax-highlighter-63abb5feb9cd8746146583-1\" class=\"crayon-line\"><code><span class=\"crayon-v\">mysql</span><span class=\"crayon-o\">&gt;</span> <span class=\"crayon-e\">create </span><span class=\"crayon-e\">database </span><span class=\"crayon-v\">sakila_dummy</span><span class=\"crayon-sy\">;</span></code></div>\r\n<div id=\"urvanov-syntax-highlighter-63abb5feb9cd8746146583-2\" class=\"crayon-line\"><code><span class=\"crayon-v\">mysql</span><span class=\"crayon-o\">&gt;</span> <span class=\"crayon-st\">use</span> <span class=\"crayon-v\">sakila_dummy</span><span class=\"crayon-sy\">;</span></code></div>\r\n<div id=\"urvanov-syntax-highlighter-63abb5feb9cd8746146583-3\" class=\"crayon-line\"><code><span class=\"crayon-v\">mysql</span><span class=\"crayon-o\">&gt;</span> <span class=\"crayon-i\">source</span> <span class=\"crayon-v\">C</span><span class=\"crayon-o\">:</span><span class=\"crayon-sy\">\\</span><span class=\"crayon-v\">MySQLBackup</span><span class=\"crayon-sy\">\\</span><span class=\"crayon-v\">sakila_20200424</span><span class=\"crayon-sy\">.</span><span class=\"crayon-v\">sql</span></code></div>\r\n<div class=\"crayon-line\"><code></code></div>\r\n<div class=\"crayon-line\"><code></code></div>\r\n<div class=\"crayon-line\">&nbsp;</div>\r\n<div class=\"crayon-line\">&nbsp;</div>\r\n<div class=\"crayon-line\">untuk lebih lengkapnya bisa mengujungi situs berikut https://www.sqlshack.com/how-to-backup-and-restore-mysql-databases-using-the-mysqldump-command/<code></code></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',1,'2022-12-28 03:56:35','2022-12-29 09:55:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (5,2,'Seorang IT Infrastruktur Engginer di Teradata.co.id',NULL,NULL,NULL,NULL,'2022-12-30 02:48:46','2022-12-30 02:48:46');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `achieved` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skills_user_id_foreign` (`user_id`),
  CONSTRAINT `skills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (5,2,'Windows Server','90','2022-12-30 02:47:55','2022-12-30 02:47:55');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media`
--

DROP TABLE IF EXISTS `social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `media_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_media_user_id_foreign` (`user_id`),
  CONSTRAINT `social_media_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media`
--

LOCK TABLES `social_media` WRITE;
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_post`
--

DROP TABLE IF EXISTS `tag_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_post_post_id_foreign` (`post_id`),
  KEY `tag_post_tag_id_foreign` (`tag_id`),
  CONSTRAINT `tag_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tag_post_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_post`
--

LOCK TABLES `tag_post` WRITE;
/*!40000 ALTER TABLE `tag_post` DISABLE KEYS */;
INSERT INTO `tag_post` VALUES (1,1,4,NULL,NULL),(2,2,1,NULL,NULL),(4,4,14,NULL,NULL);
/*!40000 ALTER TABLE `tag_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'website','website','2019-11-27 04:58:14','2019-11-27 04:58:14'),(2,'mobile app','mobile-app','2019-11-27 04:58:24','2019-11-27 04:58:24'),(3,'bahasa pemrograman','bahasa-pemrograman','2019-11-27 04:58:40','2019-11-27 04:58:40'),(4,'psikologi','psikologi','2019-11-27 04:59:07','2019-11-27 04:59:07'),(14,'database','database','2022-12-28 04:00:03','2022-12-28 04:00:03');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Tatang Kosasih','ta2n9@aol.com','0000-00-00 00:00:00','$2y$10$KOs6yqBAh8DHeDIAbdvKG.nbTJxxc49uYV0BlwqtFRXl1yQJMe9t6','IMOuXiuviMRnXpLDqOhMsdTSqFRBktY0TmZwr9oLXcmrtq6VuouTpqEtERvw','2019-11-27 05:49:55','2019-11-27 05:49:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-02 15:14:29
