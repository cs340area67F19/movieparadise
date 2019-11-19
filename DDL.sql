-- MySQL dump 10.16  Distrib 10.1.32-MariaDB, for Linux (x86_64)
--
-- Host: localhost	Database: sakila
-- ------------------------------------------------------
-- Server version    10.1.32-MariaDB

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
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS movie;
/*!40101 SET @saved_cs_client 	= @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE movie (
	movie_id int unsigned NOT NULL AUTO_INCREMENT,
	name varchar(32) NOT NULL,
    year YEAR,
	movie_type varchar(32),
	country varchar(32),
	length int,
	cast_group_id int unsigned,
	movie_review_id int unsigned,
	PRIMARY KEY (movie_id),
	FOREIGN KEY (cast_group_id) REFERENCES cast_movie_association(cast_group_id),
	FOREIGN KEY (movie_review_id) REFERENCES review_movie_association(movie_review_id)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES movie WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO movie VALUES (1,'Casablanca', 1942, 'Drama/Romance','United States','102',NULL,NULL), (2, 'Looper', 2012,'Drama/Fantasy', 'United States', '119', NULL, NULL);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_movie_association`
--

DROP TABLE IF EXISTS review_movie_association;
/*!40101 SET @saved_cs_client 	= @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE review_movie_association (
	review_id int unsigned,
	movie_review_id int unsigned NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (review_id,movie_review_id),
	KEY idx_fk_film_id (movie_review_id),
	CONSTRAINT fk_review FOREIGN KEY (review_id) REFERENCES review (review_id) ON UPDATE CASCADE,
	CONSTRAINT fk_movie FOREIGN KEY (movie_review_id) REFERENCES movie (movie_id) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES review_movie_association WRITE;
/*!40000 ALTER TABLE `review_movie_association` DISABLE KEYS */;
INSERT INTO review_movie_association VALUES (1,1), (2,1), (3,2);
/*!40000 ALTER TABLE `review_movie_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS review;
/*!40101 SET @saved_cs_client 	= @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE review (
	review_id int unsigned NOT NULL AUTO_INCREMENT,
	review_date datetime NOT NULL,
	rating float,
	user_id int unsigned,
	PRIMARY KEY (review_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES review WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO review VALUES (1, NOW(), 7.6, 1), (2, NOW(), 8.2, 2), (3, NOW(), 7.8, 1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS users;
/*!40101 SET @saved_cs_client 	= @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE users (
	user_id int unsigned NOT NULL AUTO_INCREMENT,
	username varchar(32) NOT NULL,
	gender varchar(1),
	birthdate datetime,
	PRIMARY KEY (user_id)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES users WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO users VALUES (1,'parksju', 'M', DATE '1998-03-05'), (2, 'luwa', 'M', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast`
--
DROP TABLE IF EXISTS cast;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE cast (
  cast_id int  unsigned NOT NULL AUTO_INCREMENT,
  fname varchar(45) NOT NULL,
  lname varchar(45) NOT NULL,
  birthdate date NOT NULL,
  PRIMARY KEY (cast_id),
  KEY idx_cast_lname (lname)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO cast VALUES (1,'Humphrey',' Bogart','1899-12-25'),(2,'Ingrid','Bergman','1915-08-29'),(3,'Paul','Henreid','1908-01-10');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `movie_cast`
--
DROP TABLE IF EXISTS movie_cast;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE movie_cast (
  movie_cast_cast_id int  unsigned NOT NULL,
  movie_cast_movie_id int  unsigned NOT NULL,
  cast_fname varchar(45) NOT NULL,
  cast_lname varchar(45) NOT NULL,
  PRIMARY KEY (movie_cast_cast_id,movie_cast_movie_id),
  KEY idx_fk_film_id (movie_cast_movie_id),
  CONSTRAINT fk_movie_cast_cast FOREIGN KEY (movie_cast_cast_id) REFERENCES cast (cast_id) ON UPDATE CASCADE,
  CONSTRAINT fk_movie_cast_movie FOREIGN KEY (movie_cast_movie_id) REFERENCES movie (movie_id) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `movie_cast`
--

/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
INSERT INTO movie_cast VALUES (1,1,'Rick', 'Blaine'),(2,1,'Ilsa', 'Lund'),(3,1,'Victor', 'Laszlo');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;
