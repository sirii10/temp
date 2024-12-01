-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: isc_database
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `about_page`
--

DROP TABLE IF EXISTS `about_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about_page` (
  `about_page_id` int NOT NULL,
  `heading` tinytext,
  `subheading` text,
  `video_link` tinytext,
  PRIMARY KEY (`about_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about_page`
--

LOCK TABLES `about_page` WRITE;
/*!40000 ALTER TABLE `about_page` DISABLE KEYS */;
INSERT INTO `about_page` VALUES (1,'Our vision is a better life, a better world, through the power of storytelling.','The International Storytelling Center is a tax-exempt nonprofit organization and the premiere educational, arts, and cultural institution dedicated to enriching lives and building a better world through the power of storytelling. Our work falls broadly into three categories: performance, preservation, and practice.','https://www.youtube.com/embed/SIgTvNdDBPc?si=4hOcN8wrTBLbQso2&amp;start=4');
/*!40000 ALTER TABLE `about_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aliases`
--

DROP TABLE IF EXISTS `aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aliases` (
  `alias_id` int NOT NULL,
  `attribute_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `domain_id` int DEFAULT NULL,
  `keyword_id` int DEFAULT NULL,
  `rank` int DEFAULT NULL,
  `searchcount` int DEFAULT NULL,
  `lastsearch` datetime DEFAULT NULL,
  PRIMARY KEY (`alias_id`),
  KEY `aliases_attribute_id_idx` (`attribute_id`),
  KEY `alises_subject_id_idx` (`subject_id`),
  KEY `aliases_domain_id_idx` (`domain_id`),
  KEY `alises_keyword_id_idx` (`keyword_id`),
  CONSTRAINT `aliases_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `isc_attributes` (`attribute_id`),
  CONSTRAINT `aliases_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `isc_domains` (`domain_id`),
  CONSTRAINT `alises_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`keyword_id`),
  CONSTRAINT `alises_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `isc_subjects` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aliases`
--

LOCK TABLES `aliases` WRITE;
/*!40000 ALTER TABLE `aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_images`
--

DROP TABLE IF EXISTS `article_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_images` (
  `article_image_id` int NOT NULL,
  `article_id` int DEFAULT NULL,
  `image_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `image_dir` varchar(260) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `image_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `image_type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`article_image_id`),
  KEY `article_images_article_id_idx` (`article_id`),
  CONSTRAINT `article_images_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_images`
--

LOCK TABLES `article_images` WRITE;
/*!40000 ALTER TABLE `article_images` DISABLE KEYS */;
INSERT INTO `article_images` VALUES (1,1,NULL,'images/performance.jpg','max',NULL,NULL),(2,2,NULL,'images/preservation.jpg',NULL,NULL,NULL),(3,3,NULL,'images/practice.jpg',NULL,NULL,NULL),(4,6,NULL,'images/PerfectWeather.jpg','PerfectWeather','The weather was almost perfect. (Photo credit: Tom Raymond)',NULL),(5,6,NULL,'images/FestivalSwatches.jpg','FestivalSwatches','Another collection of Festival swatches (photo credit: Tom Raymond)',NULL),(6,6,NULL,'images/ClapSignLanguage.jpg','ClapSignLanguage','Our audience “claps” in American Sign Language for storyteller Peter Cook, who is deaf. (Photo credit: Jay Huron)',NULL),(7,6,NULL,'Images/BilLepp.jpg','BilLepp','Bil Lepp tells a tall tale. (Photo credit: Jay Huron)',NULL),(8,6,NULL,'Images/BiSmiles.jpg','Smiles','Big smiles from our audience (Photo credit: Jay Huron)',NULL),(9,6,NULL,'Images/SheilaArnold.jpg','SheilaArnold','Storyteller Sheila Arnold (on left, photo credit: Jay Huron)',NULL),(10,6,NULL,'Images/lenCabral.jpg','Len Cabal','Storyteller Len Cabral was an emcee this year. (Photo credit: Jay Huron)',NULL),(11,6,NULL,'Images/noveltyband.jpg','NoveltyBand','The Jonesborough Novelty Band plays for the crowd, a long-time Festival tradition (Photo credit: Jay Huron)',NULL),(12,6,NULL,'Images/tovafriedman.jpg','tovaFriedman','Tova Friedman, who survived the concentration camps in World War II, speaks candidly about her experience during the Holocaust. (Photo credit: Jay Huron)',NULL),(13,6,NULL,'Images/genetagaban.jpg','genetagaban','Storyteller Gene Tagaban in stunning Native American dress (Photo credit: Jay Huron)',NULL),(14,6,NULL,'Images/donFlemons.jpg','donFlemons','New Voice Don Flemons wows listeners with his musical prowess, especially on banjo. (Photo credit: Jay Huron)',NULL),(15,6,NULL,'Images/geraldinebuckley.jpg','Geraldine','Storyteller Geraldine Buckley shares a laugh with her audience. (Photo credit: Jay Huron)',NULL),(16,6,NULL,'Images/ghostly.jpg','Ghost','The ISC ghoulies take a break from haunting the grounds of our open-air Ghost Stories event. (Photo credit: Jay Huron)',NULL),(17,6,NULL,'Images/tuup.jpg','Tuup','TUUP — the Unorthodox, Unprecedented Preacher — shares a traditional folk tale. (Photo credit: Jay Huron)',NULL),(18,6,NULL,'Images/JasminCardenas.jpg','Jasmin','New Voice Jasmin Cardenas shares a personal story about growing up as a first-generation American in Chicago. (Photo credit: Jay Huron)',NULL),(19,6,NULL,'Images/Swatches.jpg','Swatches','A long-time fan shows off his collection of Festival swatches. (Photo credit: Jay Huron)',NULL),(20,6,NULL,'Images/CourtHouseTent.jpg','CourtHouse','A scenic view of our big-top tents (Photo credit: Jay Huron)',NULL),(21,6,NULL,'Images/BigTopTents.jpg','BigTopTent','The Festival is known for the big-top tents that are scattered across Jonesborough. (Photo credit: Jay Huron)',NULL),(22,4,NULL,'images/SneakPeak.png','SneakPeak',NULL,NULL),(23,5,NULL,'images/storybrookTrail.jpg','StoryBookTrail',NULL,NULL);
/*!40000 ALTER TABLE `article_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `article_id` int NOT NULL,
  `originator_id` int DEFAULT NULL,
  `attribute_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `post_date_gmt` datetime DEFAULT NULL,
  `post_content` mediumtext,
  `post_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `post_excerpt` text,
  `post_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `post_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `post_last_modified` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`article_id`),
  KEY `articles_user_id_idx` (`user_id`),
  KEY `articles_originator_id_idx` (`originator_id`),
  KEY `articles_attribute_id_idx` (`attribute_id`),
  KEY `articles_subject_id_idx` (`subject_id`),
  CONSTRAINT `articles_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `isc_attributes` (`attribute_id`),
  CONSTRAINT `articles_originator_id` FOREIGN KEY (`originator_id`) REFERENCES `originators` (`originator_id`),
  CONSTRAINT `articles_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `isc_subjects` (`subject_id`),
  CONSTRAINT `articles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','Performance includes ISC’s staged events, which span storytelling, music, spoken-word poetry, other oral traditions, and emerging forms. Our signature programming includes Storytelling Live! and the National Storytelling Festival. Each year, we produce more than 300 hours of live performances on our stages.','Performance','Performance includes ISC’s staged events, which span storytelling, music, spoken-word poetry, other oral traditions, and emerging forms. Our signature programming includes Storytelling Live! and the National Storytelling Festival. Each year, we produce more than 300 hours of live performances on our stages.','good','Performance','2017-06-11 00:00:00',1),(2,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','Preservation efforts celebrate and protect oral traditions from around the world at the levels of individuals and families, communities, and regions, as well as shared cultural heritage.','Preservation','Preservation efforts celebrate and protect oral traditions from around the world at the levels of individuals and families, communities, and regions, as well as shared cultural heritage.','good','Preservation','2017-06-11 00:00:00',1),(3,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','Practice (which we sometimes call “applied storytelling”) is how stories are used in the real world. ISC is inspiring and empowering people to use storytelling to address real-world challenges and promote positive change. Stories build healthier communities, more effective workplaces, and more excellent schools. They broker peace and boost business. Stories support health and wellness, institutional change, scientific advances, and so much more.','Practice','Practice (which we sometimes call “applied storytelling”) is how stories are used in the real world. ISC is inspiring and empowering people to use storytelling to address real-world challenges and promote positive change. Stories build healthier communities, more effective workplaces, and more excellent schools. They broker peace and boost business. Stories support health and wellness, institutional change, scientific advances, and so much more.','good','Practice','2017-06-11 00:00:00',1),(4,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','As we move together toward the holidays and the end of the year, we want to give you a little peek into one of our most recent events on the campus of the International Storytelling Center in Jonesborough.\n\nThroughout the second week of November, ISC welcomed groups of very excited fifth graders to its annual Kids Institute, an immersive cultural learning experience that combines learning with exposure to the performing arts.\n\nNow in its third year, Kids Institute is part of ISC’s suite of free programs that serves our region’s young people, many of whom don’t have easy access to cultural institutions and concerts.\n\nThis year, we worked with Reverend Robert B. Jones, a deeply gifted storyteller and musician based in Detroit, to develop an inspirational program that was both entertaining and educational.\n\nHis fully interactive program, “The Oak Ridge 85: A Tennessee Civil Rights Story,” introduced the students to an episode of history that many Americans haven’t heard about. In 1955, Oak Ridge, Tennessee became one of the first schools in the country to fully integrate Black and white students. It was a great, but unpublicized, success. Quietly and joyfully, these students worked together to change the face of American education.\n\nBut the story of the Oak Ridge 85 didn’t gain traction in its time because Oak Ridge was a “secret city,” a community that had been specially built by the federal government around the clandestine Manhattan Project.\n\nWith popular music from the era and interactive activities for the kids, Jones contextualized important milestones in the Civil Rights movement and asked the students to think hard about what made the Oak Ridge project so successful when so many other schools in the South struggled to meet the moment.\n\nJones’s program was keyed to the state’s academic standards in social studies, fine arts, and English to support the subjects that kids are learning about in school. The fifth graders and their teachers went away with new perspectives on important pieces of regional and national history.\n\nYour generous support is what makes ISC’s youth initiatives possible, including Kids Institute, free and subsidized tickets, and our programs for at-risk and underserved young people. Thank you for keeping ISC in mind for Giving Tuesday and your end-of-year giving in mind. Learn more here.\n','Kids Institute 2023: A Giving Tuesday Sneak Peek','The Town of Jonesborough recfently launched a new storytelling feature in Jimmy Neil...','Good','Kids-Institue-2023','2017-06-11 00:00:00',1),(5,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','The Town of Jonesborough recently launched a new storytelling feature in Jimmy Neil Smith Park as part of a large-scale park rejuvenation project.\n\nThe scenic Storybook Trail winds through three acres of wooded land that is part of the International Storytelling Center’s downtown campus. Funded by local residents Harold and Nancy Dishner, the trail is lined with 18 placards that, together, tell a story from a children’s book. Families can walk along the path and read to — or with — their small children.\n\nThe semi-permanent placards will be changed to include the text and illustrations from a new children’s story two or three times a year. The first featured title is Everyone Has a Story to Tell, which was written by Rebecca Isbell and Marilyn Buchanan and illustrated by William Bledsoe. All three creators are local to Jonesborough, and copies of the book are available in ISC’s gift shop in person and online.\n\nThe project was inspired by the Governor’s Early Literacy Foundation in Tennessee. The foundation’s Storybook Trails initiative has established outdoor reading experiences for young children and their families in parks scattered throughout the state. The Dishners recognized that the format was a natural fit with Jimmy Neil Smith Park, even though the privately owned land wasn’t eligible for the state program.\n\nJonesborough’s Storybook Trail has a three-prong goal of helping people form a deeper relationship with the natural world, providing a gentle form of exercise, and supporting kids who are learning to read. Research shows that childhood literacy and the oral tradition of storytelling are closely connected. Kids who frequently hear stories early in life often take to reading more easily when they are older.\n\nJonesborough alderman and ISC Board of Directors’ emeritus member Terry Countermine was a key figure in bringing the project to life. “It’s a good example of cooperation between the town and ISC,” Countermine says, noting that Jimmy Neil Smith Park was named for ISC’s founder. The National Storytelling Festival helped Jonesborough establish its branded identity as the “Storytelling Capital of the World,” and has served as the cornerstone of the town’s rich and thriving arts scene. The Jonesborough Repertory Theatre and the soon-to-open Jackson Theatre are located just steps away from ISC headquarters.\n\nCountermine shares that he and other local stakeholders are forming a Friends of the Park group, in which locals are invited to participate. The collective will meet several times a year to make sure the placards get refreshed with new stories and that the grounds receive extra attention as needed.\n\nIn the meantime, the park and its new Storybook Trail remain open and accessible for visitors to enjoy year-round. The green space is an important part of community life, with people using it for picnics, walks, and special events (including weddings and Easter egg hunts) that mark milestones in Tennessee’s oldest town.\n\n“We want to be as inclusive as possible,” Countermine says, echoing the values of the National Storytelling Festival and ISC to represent people from different cultures. The next title for the Storybook Trail is expected to be selected soon, and a belated grand opening celebration will be held this summer.\n','A Walk Down Storybook Trail','As we move together toward the holidays and the end of the year,...','good','A-Walk-Down-StoryBook-Trail','2017-06-11 00:00:00',1),(6,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','On October 6¬¬–8, ISC was thrilled to host thousands of visitors for the 51st annual National Storytelling Festival, when Jonesborough came alive with stories and traditions from all over the world. With perfect company and *almost* perfect weather (just a little rain on Friday!), we couldn’t have asked for a better event. Thank you to everyone who attended—and for the people around the world who watched our livestream on Friday.\nISC is deeply grateful for our long-standing relationship with the talented photographers Jay Huron and Tom Raymond, who capture the joy and essence of the Festival every year. We’ve chosen a selection of some of our favorite images from this year. Please enjoy!\n\n','Scenes from the 2023 National Storytelling Festival','On October 6-8, ISC was thrilled to host thousands of visitors for the...','good','Scenes-from-the-2023-National-Storytelling-Festival','2017-06-11 00:00:00',1),(7,NULL,NULL,NULL,'2017-06-11 00:00:00','2017-06-11 00:00:00','Duplicate for test purposes','Practice','This is a duplicate for testing purposes','good','Practice','2017-06-11 00:00:00',1);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_keywords`
--

DROP TABLE IF EXISTS `event_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_keywords` (
  `event_keyword_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `keyword_id` int DEFAULT NULL,
  PRIMARY KEY (`event_keyword_id`),
  KEY `event_keywords_event_id_idx` (`event_id`),
  KEY `event_keywords_keyword_id_idx` (`keyword_id`),
  CONSTRAINT `event_keywords_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `event_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_keywords`
--

LOCK TABLES `event_keywords` WRITE;
/*!40000 ALTER TABLE `event_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_performances`
--

DROP TABLE IF EXISTS `event_performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_performances` (
  `event_performance_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int DEFAULT NULL,
  `performance_id` int DEFAULT NULL,
  PRIMARY KEY (`event_performance_id`),
  KEY `event_performances_event_id_idx` (`event_id`),
  KEY `event_performances_performance_id_idx` (`performance_id`),
  CONSTRAINT `event_performances_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `event_performances_performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`performance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_performances`
--

LOCK TABLES `event_performances` WRITE;
/*!40000 ALTER TABLE `event_performances` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_performers`
--

DROP TABLE IF EXISTS `event_performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_performers` (
  `event_performer_id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `performer_id` int DEFAULT NULL,
  PRIMARY KEY (`event_performer_id`),
  KEY `event_performers_event_id_idx` (`event_id`),
  KEY `event_performers_performer_id_idx` (`performer_id`),
  CONSTRAINT `event_performers_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `event_performers_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`performer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_performers`
--

LOCK TABLES `event_performers` WRITE;
/*!40000 ALTER TABLE `event_performers` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `event_id` int NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `description` text,
  `location` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `attendance` int DEFAULT NULL,
  `is_public` bit(1) NOT NULL,
  `program_path` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  FULLTEXT KEY `event_fulltext` (`name`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'50th National StoryTelling Festival','2022-10-07 00:00:00','2022-10-09 00:00:00','Enjoy stories from around the world as we celebrate 50 years of storytelling in the heart of downtown Jonesborough, Tennnessee','Jonesborough, Tennessee',50,_binary '','event_programs/2022 Souvenir Program.pdf'),(2,'Story Slam','2017-06-11 00:00:00','2017-06-15 00:00:00','Poetry Style Stories told in rapid succession','Jonesborough, Tennessee',100,_binary '',NULL),(3,'Jam Jam','2017-06-11 00:00:00','2017-06-11 00:00:00','A series of stories about Jam','Jamsborough, Tennessee',30,_binary '',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_articles`
--

DROP TABLE IF EXISTS `featured_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featured_articles` (
  `featured_article_id` int NOT NULL,
  `article_id` int DEFAULT NULL,
  `about_page_id` int DEFAULT NULL,
  PRIMARY KEY (`featured_article_id`),
  KEY `featured_article_article_id_idx` (`article_id`),
  KEY `featured_article_about_page_id_idx` (`about_page_id`),
  CONSTRAINT `featured_article_about_page_id` FOREIGN KEY (`about_page_id`) REFERENCES `about_page` (`about_page_id`),
  CONSTRAINT `featured_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `articles` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_articles`
--

LOCK TABLES `featured_articles` WRITE;
/*!40000 ALTER TABLE `featured_articles` DISABLE KEYS */;
INSERT INTO `featured_articles` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `featured_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_event`
--

DROP TABLE IF EXISTS `featured_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featured_event` (
  `featured_event_id` int NOT NULL,
  `article_link` varchar(100) DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `title_page_id` int DEFAULT NULL,
  PRIMARY KEY (`featured_event_id`),
  KEY `featured_event_event_id_idx` (`event_id`),
  KEY `featured_event_title_page_id_idx` (`title_page_id`),
  CONSTRAINT `featured_event_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `featured_event_title_page_id` FOREIGN KEY (`title_page_id`) REFERENCES `title_page` (`title_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_event`
--

LOCK TABLES `featured_event` WRITE;
/*!40000 ALTER TABLE `featured_event` DISABLE KEYS */;
INSERT INTO `featured_event` VALUES (1,'tbd',1,1);
/*!40000 ALTER TABLE `featured_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_performer`
--

DROP TABLE IF EXISTS `featured_performer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featured_performer` (
  `featured_performer_id` int NOT NULL,
  `title_page_id` int DEFAULT NULL,
  `featured_performer_image_path` varchar(260) DEFAULT NULL,
  `performer_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`featured_performer_id`),
  KEY `featured_performer_title_page_id_idx` (`title_page_id`),
  CONSTRAINT `featured_performer_title_page_id` FOREIGN KEY (`title_page_id`) REFERENCES `title_page` (`title_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_performer`
--

LOCK TABLES `featured_performer` WRITE;
/*!40000 ALTER TABLE `featured_performer` DISABLE KEYS */;
INSERT INTO `featured_performer` VALUES (1,1,'D:\\Classes\\Fall2024\\BlazorRepo\\StoryTellingWebsite\\StorytellingWebiste\\StoryTellingWebsite\\wwwroot\\images\\Motoko.png',NULL);
/*!40000 ALTER TABLE `featured_performer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isc_attributes`
--

DROP TABLE IF EXISTS `isc_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isc_attributes` (
  `attribute_id` int NOT NULL,
  `term` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isc_attributes`
--

LOCK TABLES `isc_attributes` WRITE;
/*!40000 ALTER TABLE `isc_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `isc_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isc_domains`
--

DROP TABLE IF EXISTS `isc_domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isc_domains` (
  `domain_id` int NOT NULL,
  `term` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isc_domains`
--

LOCK TABLES `isc_domains` WRITE;
/*!40000 ALTER TABLE `isc_domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `isc_domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isc_subjects`
--

DROP TABLE IF EXISTS `isc_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isc_subjects` (
  `subject_id` int NOT NULL,
  `term` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isc_subjects`
--

LOCK TABLES `isc_subjects` WRITE;
/*!40000 ALTER TABLE `isc_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `isc_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keywords` (
  `keyword_id` int NOT NULL,
  `keyword` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `keyword_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `originators`
--

DROP TABLE IF EXISTS `originators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `originators` (
  `originator_id` int NOT NULL,
  `domain_id` int DEFAULT NULL,
  `attribute_id` int DEFAULT NULL,
  `originator_type` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`originator_id`),
  KEY `originators_user_id_idx` (`user_id`),
  KEY `originator_attribute_id_idx` (`attribute_id`),
  KEY `originators_domain_id_idx` (`domain_id`),
  CONSTRAINT `originator_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `isc_attributes` (`attribute_id`),
  CONSTRAINT `originators_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `isc_domains` (`domain_id`),
  CONSTRAINT `originators_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `originators`
--

LOCK TABLES `originators` WRITE;
/*!40000 ALTER TABLE `originators` DISABLE KEYS */;
/*!40000 ALTER TABLE `originators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_keywords`
--

DROP TABLE IF EXISTS `performance_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_keywords` (
  `performance_keyword_id` int NOT NULL,
  `keyword_id` int DEFAULT NULL,
  `performance_id` int DEFAULT NULL,
  PRIMARY KEY (`performance_keyword_id`),
  KEY `performance_keywords_keyword_id_idx` (`keyword_id`),
  KEY `performance_keywords_performance_id_idx` (`performance_id`),
  CONSTRAINT `performance_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`keyword_id`),
  CONSTRAINT `performance_keywords_performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`performance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_keywords`
--

LOCK TABLES `performance_keywords` WRITE;
/*!40000 ALTER TABLE `performance_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_performers`
--

DROP TABLE IF EXISTS `performance_performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_performers` (
  `performance_performer_id` int NOT NULL AUTO_INCREMENT,
  `performance_id` int DEFAULT NULL,
  `performer_id` int DEFAULT NULL,
  PRIMARY KEY (`performance_performer_id`),
  KEY `performance_performer_performance_id_idx` (`performance_id`),
  KEY `performance_performers_performer_id_idx` (`performer_id`),
  CONSTRAINT `performance_performer_performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`performance_id`),
  CONSTRAINT `performance_performers_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`performer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_performers`
--

LOCK TABLES `performance_performers` WRITE;
/*!40000 ALTER TABLE `performance_performers` DISABLE KEYS */;
INSERT INTO `performance_performers` VALUES (1,1,1);
/*!40000 ALTER TABLE `performance_performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_recording`
--

DROP TABLE IF EXISTS `performance_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_recording` (
  `performance_recording_id` int NOT NULL AUTO_INCREMENT,
  `performance_id` int DEFAULT NULL,
  `recording_name` varchar(260) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `recording_path` varchar(260) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `format` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `play_count` int DEFAULT NULL,
  `runtime` time DEFAULT NULL,
  `sequence_number` int DEFAULT NULL,
  `permission_to_release` tinyint(1) DEFAULT NULL,
  `ready_for_release` tinyint(1) DEFAULT NULL,
  `audio_or_video` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`performance_recording_id`),
  KEY `performance_recording_performance_id_idx` (`performance_id`),
  CONSTRAINT `performance_recording_performance_id` FOREIGN KEY (`performance_id`) REFERENCES `performances` (`performance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_recording`
--

LOCK TABLES `performance_recording` WRITE;
/*!40000 ALTER TABLE `performance_recording` DISABLE KEYS */;
INSERT INTO `performance_recording` VALUES (1,1,'My Ghost Story','mp3s/metal-pipe-falling-sound-effect-made-with-Voicemod.mp3','mp3',1,'02:30:00',0,NULL,NULL,NULL),(2,1,'My Ghost Story_2','GhostStory2.mp3','mp3',4,'02:30:00',0,NULL,NULL,NULL),(3,4,'Bil Lep Fails the Yosemite Falls','mp3s/Bil Lepp.wav','wav',1,NULL,NULL,NULL,NULL,NULL),(4,5,'Build Me Up ButterCup_Recording','mp3s/Bill Harley.wav','wav',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `performance_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performances`
--

DROP TABLE IF EXISTS `performances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performances` (
  `performance_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `has_adult_content` tinyint(1) DEFAULT NULL,
  `attendance` int DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `performancescol` varchar(45) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`performance_id`),
  FULLTEXT KEY `performanceName_fulltext` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performances`
--

LOCK TABLES `performances` WRITE;
/*!40000 ALTER TABLE `performances` DISABLE KEYS */;
INSERT INTO `performances` VALUES (1,'My Ghost Story','2017-06-11','2017-06-11','2017-06-11 00:00:00','2017-06-11 00:00:00',0,30,1,NULL,NULL),(2,'My Regular Story','2017-06-11','2017-06-11','2017-06-11 00:00:00','2017-06-11 00:00:00',0,90,1,NULL,NULL),(3,'My Fake Story','2017-06-11','2017-06-11','2017-06-11 00:00:00','2017-06-11 00:00:00',0,4,0,NULL,NULL),(4,'Bil Fails Yosemite Falls','2022-10-08','2022-10-08','2022-10-08 00:00:00','2022-10-08 00:00:00',0,4,1,NULL,NULL),(5,'Build Me Up Buttercup Original','2022-10-08','2022-10-08','2022-10-08 00:00:00','2022-10-08 00:00:00',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `performances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer_biographies`
--

DROP TABLE IF EXISTS `performer_biographies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer_biographies` (
  `performer_biography_id` int NOT NULL AUTO_INCREMENT,
  `performer_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `biography` mediumtext,
  PRIMARY KEY (`performer_biography_id`),
  KEY `performer_biographies_event_id_idx` (`event_id`),
  KEY `performer_biogrpahies_performer_id_idx` (`performer_id`),
  FULLTEXT KEY `biographies_fullTextIndex` (`biography`),
  CONSTRAINT `performer_biographies_event_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`),
  CONSTRAINT `performer_biogrpahies_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`performer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer_biographies`
--

LOCK TABLES `performer_biographies` WRITE;
/*!40000 ALTER TABLE `performer_biographies` DISABLE KEYS */;
INSERT INTO `performer_biographies` VALUES (1,1,1,'For over 30 years, Charlotte Blake Alston has performed in venues throughout North America and abroad, including the Kennedy Center, the Smithsonian Institution, and the Women of the World Festival in South Africa. She breathes life into traditional and contemporary stories from African and African American oral and cultural traditions, enhancing her performances with traditional instruments such as djembe, mbira, and the 21-stringed kora. She is a recipient of the nsn oracle Circle of Excellence award, the Pew Fellowship in the Arts, and the Zora Neale Hurston Award, and in 2021 she was named the Philadelphia Orchestra’s Ofﬁ cial Storyteller, Narrator, and Host. “Eloquent storytelling.”—The New York Times'),(2,2,1,'Peter Chand has told his fantastic tales all over Britain, and in Ireland, Norway, Holland, Belgium, Greece, Canada, Denmark, and India. Chand’s parents migrated to Britain from the Punjab region in the 1950s, and though he was born in the Midlands, he grew up using Punjabi as his ﬁrst language. Chand combines these two cultures seamlessly to tell stories full of life, wisdom, and humor. He is also one of the organizers of the Festival at the Edge International Storytelling Festival, the longest-running festival of its kind in England. “Inspiration was dripping out of every word… \nIt seems to be a story can have a life of its own.”—Amsterdam Storytelling Festival'),(3,3,1,'Born and raised in Jerusalem, Noa is an award-winning storyteller, author, and coach. Her stories, drawn from diverse cultures but primarily from her own Jewish heritage and personal experience, highlight our similarities and celebrate our differences. Baum has performed overseas and across the U.S., including the World Bank and the Kennedy Center. She is also the author of “A Land Twice Promised: An Israeli Woman’s Quest for Peace,” a memoir that won the Anne Izard Storyteller’s Choice Award, and a new children’s picture book, “How the Birds Became Friends.” “Noa Baum spreads cultural truths that eclipse geopolitical boundaries … Her stories transcend their roots.” \n—The Washington Post'),(4,4,1,'Donald Davis was born in a Southern Appalachian mountain world rich \nin stories, surrounded by a family of traditional storytellers who told him gentle fairy tales, simple and silly Jack tales, scary mountain lore, ancient Welsh and Scottish folktales, and most importantly, nourishing and true-to-life stories of his own neighbors and kin. Featured at festivals throughout the U.S. and abroad, Davis is also known as a proliﬁ c author, producer of books and CDs, and a guest host for NPR’s “Good Evening.” Davis is a recipient of the nsn oracle Circle of Excellence and Lifetime Achievement awards. “His stories often left listeners limp with laughter at the same time they struggled with a lump in the throat.” —New York Times'),(5,5,1,'Storyteller, teaching artist, and writer Sarah Brady taught communication and theatre at Hampton University before making her way toward the storytelling world in 2014. She has told stories in the U.S. and U.K., where she lived for three years soaking in stories as her roots grew deep in British soil. Sarah’s telling spans genres of historical, traditional, literary, and personal tales, while her awards include being chosen the Sunburst Performing Artist of the Year from Arts for Learning Virginia and selected “best liar” in the Cambridge Storytellers Liars Contest. “Sarah Brady’s performance…was moving and engrossing, and it gave me chills.” —Paine National Historical Association'),(6,6,1,'Donald Davis was born in a Southern Appalachian mountain world rich \nin stories, surrounded by a family of traditional storytellers who told him gentle fairy tales, simple and silly Jack tales, scary mountain lore, ancient Welsh and Scottish folktales, and most importantly, nourishing and true-to-life stories of his own neighbors and kin. Featured at festivals throughout the U.S. and abroad, Davis is also known as a proliﬁ c author, producer of books and CDs, and a guest host for NPR’s “Good Evening.” Davis is a recipient of the nsn oracle Circle of Excellence and Lifetime Achievement awards. “His stories often left listeners limp with laughter at the same time they struggled with a lump in the throat.” —New York Times'),(7,7,1,'Funny, insightful, and frequently irreverent, Carmen Agra Deedy’s narratives are culled from her childhood as a Cuban refugee in Decatur, Ga. Her personal stories ﬁ rst appeared on NPR’s “All Things Considered.” Deedy is the author of 12 books for children, including “The Library Dragon” and “14 Cows for America,” a New York Times bestseller. She is the host of the four-time Emmy-winning children’s program, “Love That Book!” Deedy has been an invited speaker at venues that include Columbia University, The Library of Congress, TED, and the Kennedy Center. Carmen is a recipient of the nsn oracle Circle of Excellence award. “Whenever Carmen tells stories, this Americanized Cuban Comet leaves a bright trail of laughter … and healing.” —Kathryn Windham'),(8,8,1,'Josh Goforth was already playing piano at four years old, but it was his 6th-grade experience seeing Sheila Kay Adams that inspired his interest in his musical heritage. Master of nearly 20 instruments and best known for his ﬁ ddling, Goforth is a highly accomplished old-time, bluegrass, and swing musician. His credits include playing for the soundtrack and movie, “Songcatcher,” and a Grammy nomination with David Holt. He has performed at venues in every U.S. state and abroad, including Carnegie Hall and the Grand Ole Opry. “Josh Goforth is a superstar in waiting. He shows the same promise I saw in Ricky Skaggs and Vince Gill in the 70s.”—Hugh Sturgill, producer'),(9,9,1,'Jeff Doyle started storytelling by scaring children with creepy tales around the campﬁ re and has now found his place telling funny stories to adult audiences. Doyle enjoys ﬁ nding humor in everyday life and crafts stories that evoke both audience laughter and tears. Doyle is an nsn oracle award winner and founder of the annual Scary Storytelling Festival in Howell, Mich. His CDs include “Live at the Opera House,” “Cage Free,” and “The Cadillac Enterprise.” “Doyle begins as a disarming humorist and ends as a heart rending humanist who invites you to consider what matters.” —Loren Nieme, Storytelling Producer and Author'),(10,10,1,'Songwriter, storyteller, author, and recipient of two Grammy awards, Bill Harley uses song and story to paint a vibrant and hilarious picture of American life. With over 35 award-winning recordings and numerous books to his credit, his work honors the universal joys and hardships that we all share. Harley has been awarded the lifetime achievement award from the Rhode Island Council for the Humanities and an nsn oracle Circle of Excellence award. “In slice-of-life vignettes that exude warmth, wit, and wisdom, Harley uses a consummate storyteller’s toolbox of tone, voice, delivery, and pace, creating something palpable between himself and his listeners.”  \n—PARENTS Magazine'),(11,11,1,'Designated an American Masterpiece Touring Artist by the NEA, Elizabeth Ellis grew up in the Appalachian Mountains hearing stories from her grandfather, a mountain minister. The “Divine Miss E” is a versatile and riveting teller of Appalachian and Texas tales and stories of heroic American women, though her personal stories are arguably her best. An award-winning author, she is a recipient of the John Henry Faulk Award from the Tejas Storytelling Association, and the nsn oracle Circle of Excellence and Lifetime Achievement awards. “It was a breathtaking performance to witness. Elizabeth was so layered and magical and real. Her timing impeccable, her delivery effortless, her impact extraordinary.” —Ann Arbor Observer'),(12,12,1,'Dolores Hydock is an actress and storyteller from Birmingham, Ala. She ﬁ lls the stage with wit, energy, and a swirl of characters that bring to life an array of personal stories, medieval adventures, oral histories, and literary classics. She has collaborated with the Birmingham Museum of Art to blend stories with art, and her Christmas story special has been aired on NPR-afﬁ liate WBHM in Birmingham. She’s held a wide variety of jobs – a house parent at a halfway house for juvenile delinquents, a blues DJ, an au pair in Paris, an IBM computer sales rep, a cookbook copy editor, an acting teacher, and a teacher of Cajun dancing – all material for her stories. “Dolores’ stories are funny and touching, smart and insightful, personal and universal.”\n—The Birmingham News'),(13,13,1,'Kevin Kling is from Minneapolis, Minn., where he lives on purpose because \n“when you freeze paradise, it lasts a little longer.” He has performed his stories Off Broadway, at the Kennedy Center, and at storytelling festivals around the U.S. His adventures abroad include tours of Australia, Europe, and Thailand. Kling has been a commentator on NPR’s “All Things Considered” and was the subject of the Emmy-winning PBS documentary “Kevin Kling: Lost & Found.” He often works with Interact Theater, a company of performers with and without disabilities, exploring how, through our stories, we are connected. Kevin is a recipient of the nsn oracle Circle of Excellence award. “Part funny guy, part poet and playwright, part wise man.” —Krista Tippett, On Being, American Public Media'),(14,14,1,'A native of Osaka, Japan, Motoko \nhas performed storytelling and mime professionally since 1993. Her repertoire includes Asian folktales, Rakugo and Zen tales, and mime vignettes, as well as personal stories from her childhood in Japan and life as an immigrant in the U.S. Her appearances include PBS’ “Mr. Rogers’ Neighborhood” and a tour with the Carnegie Kids in Miyazaki project sponsored by Carnegie Hall. The award-winning teller trained with master mime Tony Montanaro and is a recipient of the nsn oracle Circle of Excellence award. “She effortlessly captures and keeps a whole crowd’s attention, blending her quiet speaking voice with blunt American colloquialisms for emphasis and humor.”—New Haven Advocate'),(15,15,1,'Bil Lepp’s family-friendly tall tales and stories have earned the appreciation of listeners of all ages. Though he is a ﬁ ve-time champion of the West Virginia Liars Contest, his stories often contain morsels of truth that present universal themes in clever and witty ways. Lepp’s amusing tales and insights into everyday life have delighted audiences across the country, from grade schools to corporate executives to Comedy Central’s Hudson stage. His children’s books and audio collections have won numerous awards including the PEN/Steven Kroll Award, Parents’ Choice awards, and a NAPPA (National Parenting Product Award). Lepp has been featured on NPR’s “Mountain Stage” and is a recipient of the nsn oracle Circle of Excellence award. “Just as New Jersey has Bruce Springsteen, West Virginia has…Bil Lepp.” —Goldenseal Magazine'),(16,16,1,'Featured at the National Cowboy Poetry Gathering for the past six years, Brigid Reedy has become a singular young voice representing her beloved home state of Montana. A singer, songwriter, ﬁ ddler, and poet, Reedy carries forward classic cowboy music, poetry, and \nrich Montana ﬁ ddle traditions with exceptional musicianship, a distinctive approach to repertoire, and her strong sense of place. A charismatic performer since the age of two when she ﬁ rst yodeled at the Pioneer Saloon, Brigid (now 20) has traveled widely, carrying with her boundless enthusiasm, grace, passion, and soul. Brigid will be joined by her younger brother, Johnny “Guitar” Reedy, who possesses a phenomenal gift for rhythm and extraordinary musical sensibilities. “One of the most vibrant new shoots coming up at the [National Cowboy Poetry] Gathering…”—The Wall Street Journal'),(17,17,1,'Chuna McIntyre is a master artist, storyteller, and dancer who performs traditional Yup’ik dance and song accompanied by percussion on a hand drum. Born in the village of Eek on the coast of the Behring Sea, McIntyre was raised by his grandmother, from whom he learned the dances, songs, and stories of his ancestors. He later founded and directed the renowned Nunamta (“of our land”) Yup’ik Eskimo Singers and Dancers troupe, who have traveled the world to allow Natives and non-Natives to experience Yup’ik culture. McIntyre dances in his native costume and uses authentic artifacts and masks to illustrate the customs and stories of this ancient Southwest Alaskan tribe.');
/*!40000 ALTER TABLE `performer_biographies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer_images`
--

DROP TABLE IF EXISTS `performer_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer_images` (
  `performer_image_id` int NOT NULL AUTO_INCREMENT,
  `image_path` varchar(230) DEFAULT NULL,
  `image_type` varchar(10) DEFAULT NULL,
  `performer_id` int DEFAULT NULL,
  PRIMARY KEY (`performer_image_id`),
  KEY `performer_images_performer_id_idx` (`performer_id`),
  CONSTRAINT `performer_images_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`performer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer_images`
--

LOCK TABLES `performer_images` WRITE;
/*!40000 ALTER TABLE `performer_images` DISABLE KEYS */;
INSERT INTO `performer_images` VALUES (1,'Images\\PerformerImages\\CharlotteBlakeAlston.png','png',1),(2,'Images\\PerformerImages\\PeterChand.png','png',2),(3,'Images\\PerformerImages\\NoaBaum.png','png',3),(4,'Images\\PerformerImages\\RaymondChristian.png','png',4),(5,'Images\\PerformerImages\\SarahBrady.png','png',5),(6,'Images\\PerformerImages\\DonaldDavis.png','png',6),(7,'Images\\PerformerImages\\CarmenDeedy.png','png',7),(8,'Images\\PerformerImages\\JoshGoforth.png','png',8),(9,'Images\\PerformerImages\\JeffDoyle.png','png',9);
/*!40000 ALTER TABLE `performer_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer_keywords`
--

DROP TABLE IF EXISTS `performer_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer_keywords` (
  `performer_keyword_id` int NOT NULL AUTO_INCREMENT,
  `keyword_id` int DEFAULT NULL,
  `performer_id` int DEFAULT NULL,
  PRIMARY KEY (`performer_keyword_id`),
  KEY `performer_keywords_keyword_id_idx` (`keyword_id`),
  KEY `perfomer_keywords_performer_id_idx` (`performer_id`),
  CONSTRAINT `perfomer_keywords_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`performer_id`),
  CONSTRAINT `performer_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `keywords` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer_keywords`
--

LOCK TABLES `performer_keywords` WRITE;
/*!40000 ALTER TABLE `performer_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `performer_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performer_names`
--

DROP TABLE IF EXISTS `performer_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performer_names` (
  `performer_name_id` int NOT NULL AUTO_INCREMENT,
  `performer_id` int DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `honorifics` varchar(45) DEFAULT NULL,
  `qualifiers` varchar(45) DEFAULT NULL,
  `start_time` date NOT NULL,
  `end_time` date DEFAULT NULL,
  PRIMARY KEY (`performer_name_id`),
  KEY `performer_names_performer_id_idx` (`performer_id`),
  FULLTEXT KEY `name_fulltext` (`first_name`,`middle_name`,`last_name`,`qualifiers`,`honorifics`),
  CONSTRAINT `performer_names_performer_id` FOREIGN KEY (`performer_id`) REFERENCES `performers` (`performer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performer_names`
--

LOCK TABLES `performer_names` WRITE;
/*!40000 ALTER TABLE `performer_names` DISABLE KEYS */;
INSERT INTO `performer_names` VALUES (1,1,'Charlotte','Blake','Alston',NULL,NULL,'2022-10-07',NULL),(2,2,'Peter',NULL,'Chand',NULL,NULL,'2022-10-07',NULL),(3,3,'Noa',NULL,'Baum',NULL,NULL,'2022-10-07',NULL),(4,4,'Raymond',NULL,'Christian',NULL,NULL,'2022-10-07',NULL),(5,5,'Sarah',NULL,'Brady',NULL,NULL,'2022-10-07',NULL),(6,6,'Donald',NULL,'Davis',NULL,NULL,'2022-10-07',NULL),(7,7,'Carmen',NULL,'Deedy',NULL,NULL,'2022-10-07',NULL),(8,8,'Josh',NULL,'Goforth',NULL,NULL,'2022-10-07',NULL),(9,9,'Jeff',NULL,'Doyle',NULL,NULL,'2022-10-07',NULL),(10,10,'Bill',NULL,'Harley',NULL,NULL,'2022-10-07',NULL),(11,11,'Elizabeth',NULL,'Ellis',NULL,NULL,'2022-10-07',NULL),(12,12,'Dolores',NULL,'Hydock',NULL,NULL,'2022-10-07',NULL),(13,13,'Kevin',NULL,'Kling',NULL,NULL,'2022-10-07',NULL),(14,14,'Motoko',NULL,NULL,NULL,NULL,'2022-10-07',NULL),(15,15,'Bil',NULL,'Lepp',NULL,NULL,'2022-10-07',NULL),(16,16,'Brigid',NULL,'Reedy',NULL,NULL,'2022-10-07',NULL),(17,17,'Chuna',NULL,'McIntyre',NULL,NULL,'2022-10-07',NULL);
/*!40000 ALTER TABLE `performer_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performers`
--

DROP TABLE IF EXISTS `performers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performers` (
  `performer_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`performer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performers`
--

LOCK TABLES `performers` WRITE;
/*!40000 ALTER TABLE `performers` DISABLE KEYS */;
INSERT INTO `performers` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17);
/*!40000 ALTER TABLE `performers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_images`
--

DROP TABLE IF EXISTS `profile_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_images` (
  `profile_image_id` int NOT NULL,
  `image_name` varchar(200) DEFAULT NULL,
  `image_path` varchar(260) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `image_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`profile_image_id`),
  KEY `profile_images_user_id_idx` (`user_id`),
  CONSTRAINT `profile_images_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_images`
--

LOCK TABLES `profile_images` WRITE;
/*!40000 ALTER TABLE `profile_images` DISABLE KEYS */;
INSERT INTO `profile_images` VALUES (1,'Motoko','images\\Motoko.png','png',1);
/*!40000 ALTER TABLE `profile_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recording_search`
--

DROP TABLE IF EXISTS `recording_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recording_search` (
  `recording_search_id` int NOT NULL AUTO_INCREMENT,
  `performance_recording_id` int DEFAULT NULL,
  `attribute_id` int DEFAULT NULL,
  `domain_id` int DEFAULT NULL,
  `originator_id` int DEFAULT NULL,
  PRIMARY KEY (`recording_search_id`),
  KEY `recording_search_attribute_id_idx` (`attribute_id`),
  KEY `recording_search_domain_id_idx` (`domain_id`),
  KEY `recording_search_originator_id_idx` (`originator_id`),
  KEY `recording_search_performance_recording_id_idx` (`performance_recording_id`),
  CONSTRAINT `recording_search_attribute_id` FOREIGN KEY (`attribute_id`) REFERENCES `isc_attributes` (`attribute_id`),
  CONSTRAINT `recording_search_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `isc_domains` (`domain_id`),
  CONSTRAINT `recording_search_originator_id` FOREIGN KEY (`originator_id`) REFERENCES `originators` (`originator_id`),
  CONSTRAINT `recording_search_performance_recording_id` FOREIGN KEY (`performance_recording_id`) REFERENCES `performance_recording` (`performance_recording_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recording_search`
--

LOCK TABLES `recording_search` WRITE;
/*!40000 ALTER TABLE `recording_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `recording_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_type`
--

DROP TABLE IF EXISTS `role_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_type` (
  `role_type_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_type`
--

LOCK TABLES `role_type` WRITE;
/*!40000 ALTER TABLE `role_type` DISABLE KEYS */;
INSERT INTO `role_type` VALUES (1,'performer');
/*!40000 ALTER TABLE `role_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `title_page`
--

DROP TABLE IF EXISTS `title_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `title_page` (
  `title_page_id` int NOT NULL,
  `subheading` varchar(500) DEFAULT NULL,
  `page_description` text,
  `read_more_link` varchar(45) DEFAULT NULL,
  `title_image_path` varchar(260) DEFAULT NULL,
  PRIMARY KEY (`title_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `title_page`
--

LOCK TABLES `title_page` WRITE;
/*!40000 ALTER TABLE `title_page` DISABLE KEYS */;
INSERT INTO `title_page` VALUES (1,'We Believe In A Better World Through the Power of StoryTelling ','The International Storytelling Center is open and we look forward to welcoming you back! The safety and well-being of our guests and employees remain our top priority and continue to guide our decisions. During this transitional time, we will monitor the latest safety recommendations from the Centers for Disease Control and Prevention (CDC) and consult with our state and regional health officials in order to take appropriate actions as necessary. We appreciate your patience as we continue to monitor the evolving guidelines as they apply to our events.','','images\\maxwellCat.PNG'),(2,'TitlePage2Subheading',NULL,NULL,NULL),(3,'TitlePage3Subheading','TitlePage3Descriptkon',NULL,NULL);
/*!40000 ALTER TABLE `title_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcription_recording`
--

DROP TABLE IF EXISTS `transcription_recording`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transcription_recording` (
  `transcription_recording_id` int NOT NULL AUTO_INCREMENT,
  `transcription_id` int DEFAULT NULL,
  `Performance_recording_id` int DEFAULT NULL,
  PRIMARY KEY (`transcription_recording_id`),
  KEY `transcription_recording_performance_recording_idx` (`Performance_recording_id`),
  KEY `transcription_recording_transcription_id_idx` (`transcription_id`),
  CONSTRAINT `transcription_recording_performance_recording` FOREIGN KEY (`Performance_recording_id`) REFERENCES `performance_recording` (`performance_recording_id`),
  CONSTRAINT `transcription_recording_transcription_id` FOREIGN KEY (`transcription_id`) REFERENCES `transcription_srt` (`transcription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcription_recording`
--

LOCK TABLES `transcription_recording` WRITE;
/*!40000 ALTER TABLE `transcription_recording` DISABLE KEYS */;
INSERT INTO `transcription_recording` VALUES (1,1,1),(2,2,3),(3,3,4);
/*!40000 ALTER TABLE `transcription_recording` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcription_srt`
--

DROP TABLE IF EXISTS `transcription_srt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transcription_srt` (
  `transcription_id` int NOT NULL AUTO_INCREMENT,
  `srt_filepath` varchar(260) DEFAULT NULL,
  `sequence_number` int DEFAULT NULL,
  `srt_timestamp` timestamp NULL DEFAULT NULL,
  `srt_caption` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `line_by_line` longtext,
  `from_file` varchar(260) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `sequence_start` int DEFAULT NULL,
  `sequence_end` int DEFAULT NULL,
  `permission_to_release` bit(1) DEFAULT NULL,
  `ready_for_release` bit(1) DEFAULT NULL,
  PRIMARY KEY (`transcription_id`),
  FULLTEXT KEY `line_by_line_fulltext` (`line_by_line`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcription_srt`
--

LOCK TABLES `transcription_srt` WRITE;
/*!40000 ALTER TABLE `transcription_srt` DISABLE KEYS */;
INSERT INTO `transcription_srt` VALUES (1,NULL,NULL,NULL,NULL,'“Once upon a midnight dreary, while I pondered, weak and weary,\nOver many a quaint and curious volume of forgotten lore,\nWhile I nodded, nearly napping, suddenly there came a tapping,\nAs of some one gently rapping, rapping at my chamber door.\nTis some visitor,\" I muttered, \"tapping at my chamber door —\nOnly this, and nothing more.\"\n\nAh, distinctly I remember it was in the bleak December,\nAnd each separate dying ember wrought its ghost upon the floor.\nEagerly I wished the morrow; — vainly I had sought to borrow\nFrom my books surcease of sorrow — sorrow for the lost Lenore —\nFor the rare and radiant maiden whom the angels name Lenore —\nNameless here for evermore.\n\nAnd the silken sad uncertain rustling of each purple curtain\nThrilled me — filled me with fantastic terrors never felt before;\nSo that now, to still the beating of my heart, I stood repeating,\nTis some visitor entreating entrance at my chamber door —\nSome late visitor entreating entrance at my chamber door; —\nThis it is, and nothing more.\"\n\nPresently my soul grew stronger; hesitating then no longer,\nSir,\" said I, \"or Madam, truly your forgiveness I implore;\nBut the fact is I was napping, and so gently you came rapping,\nAnd so faintly you came tapping, tapping at my chamber door,\nThat I scarce was sure I heard you\"— here I opened wide the door; —\nDarkness there, and nothing more.\n\nDeep into that darkness peering, long I stood there wondering, fearing,\nDoubting, dreaming dreams no mortals ever dared to dream before;\nBut the silence was unbroken, and the stillness gave no token,\nAnd the only word there spoken was the whispered word, \"Lenore?\"\nThis I whispered, and an echo murmured back the word, \"Lenore!\" —\nMerely this, and nothing more.\n\nBack into the chamber turning, all my soul within me burning,\nSoon again I heard a tapping somewhat louder than before.\nSurely,\" said I, \"surely that is something at my window lattice:\nLet me see, then, what thereat is, and this mystery explore —\nLet my heart be still a moment and this mystery explore; —\n\'Tis the wind and nothing more.\"\n\nOpen here I flung the shutter, when, with many a flirt and flutter,\nIn there stepped a stately raven of the saintly days of yore;\nNot the least obeisance made he; not a minute stopped or stayed he;\nBut, with mien of lord or lady, perched above my chamber door —\nPerched upon a bust of Pallas just above my chamber door —\nPerched, and sat, and nothing more.\n\nThen this ebony bird beguiling my sad fancy into smiling,\nBy the grave and stern decorum of the countenance it wore.\nThough thy crest be shorn and shaven, thou,\" I said, \"art sure no craven,\nGhastly grim and ancient raven wandering from the Nightly shore —\nTell me what thy lordly name is on the Night\'s Plutonian shore!\"\nQuoth the Raven, \"Nevermore.\"\n\nMuch I marveled this ungainly fowl to hear discourse so plainly,\nThough its answer little meaning— little relevancy bore;\nFor we cannot help agreeing that no living human being\nEver yet was blest with seeing bird above his chamber door —\nBird or beast upon the sculptured bust above his chamber door,\nWith such name as \"Nevermore.”',NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,'[0.009 - 2.03] SPEAKER_00  Are you ready?\n[2.05 - 5.853] SPEAKER_00 Show of hands of people who have never seen Bill Lett before.\n[7.294 - 9.015] SPEAKER_00 That\'s eight of you, wow.\n[12.418 - 15.28] SPEAKER_00 I shouldn\'t have said that out loud because his head\'s big enough already.\n[24.327 - 26.108] SPEAKER_00 How many people have seen me before?\n[29.364 - 30.144] SPEAKER_00  Eight, yeah, I got it.\n[31.225 - 32.225] SPEAKER_00 But they were a lot louder.\n[35.887 - 37.728] SPEAKER_00 So, looking at the wrong thing here.\n[39.529 - 39.949] SPEAKER_00 Thank you.\n[43.21 - 46.952] SPEAKER_00 So for those of you who have never seen Bill before, you need to know something about him.\n[46.972 - 57.397] SPEAKER_00 He does practice yoga at home because he is, this is what I\'ve been told, because he is frightened of, he will contort himself into some strange configuration on stage and not be able to get out of it.\n[59.107 - 62.028] SPEAKER_00  But the only configuration I\'ve seen Bill in is this.\n[72.251 - 73.652] SPEAKER_00 I\'m in for it big time later.\n[74.052 - 76.373] SPEAKER_00 He is also a storyteller, a TV star.\n[76.413 - 79.614] SPEAKER_00 If you haven\'t seen him on Man and History, my wife and I, we love Man and History.\n[79.994 - 81.274] SPEAKER_00 So go and see that on the History Channel.\n[81.294 - 81.854] SPEAKER_00 Go and watch it.\n[82.495 - 86.096] SPEAKER_00 I would call him a bold-faced liar, except he has a moustache.\n[87.509 - 92.234] SPEAKER_00  And he tells stories about a childhood you wished you\'d had, but very glad you didn\'t.\n[93.535 - 97.098] SPEAKER_00 And he has the kind of friends that your mother always wondered about.\n[98.019 - 98.86] SPEAKER_00 We\'ve all had them.\n[98.92 - 105.106] SPEAKER_00 Ladies and gentlemen, please welcome our favorite liar, Bill Lep.\n[117.23 - 118.171] SPEAKER_02  He\'s not even English.\n[119.552 - 120.432] SPEAKER_02 His name\'s Tony.\n[120.452 - 121.313] SPEAKER_02 He lives in the Bronx.\n[121.333 - 123.454] SPEAKER_02 He\'s like, hey, I\'m Tony the Storyteller.\n[125.676 - 126.716] SPEAKER_02 Tony!\n[127.817 - 130.859] SPEAKER_03 That\'s my Tony crew over there.\n[133.381 - 135.122] SPEAKER_03 You might not know how to look at me.\n[136.843 - 138.084] SPEAKER_03 Oh, don\'t start laughing yet.\n[140.886 - 141.466] SPEAKER_03 You might not know.\n[149.195 - 150.136] SPEAKER_02  How do you stand?\n[155.779 - 159.862] SPEAKER_03 Bill Harley says the only reason people come see me is because eventually I\'m going to fall.\n[162.423 - 170.889] SPEAKER_03 You might not know it to look at me, but I\'m the sort of person that can just naturally find the most difficult way to do something.\n[172.219 - 173.22] SPEAKER_03  I don\'t even have to try.\n[173.86 - 180.283] SPEAKER_03 There used to be a storytelling festival in Mariposa, California, and Mariposa is just down the road from Yosemite National Park.\n[180.764 - 189.008] SPEAKER_03 And as part of the festival, we would go into Yosemite for one day, and we would get a tour, and then we would tell stories in Yosemite National Park.\n[189.148 - 190.249] SPEAKER_03 It was really neat.\n[190.829 - 199.934] SPEAKER_03 And one of the women that worked for the festival, her husband was a retired ranger at the park, and he and I were standing there at the bottom,\n[200.652 - 203.153] SPEAKER_03  of Yosemite Falls, looking up Yosemite Falls.\n[203.694 - 206.895] SPEAKER_03 And I said to him, how tall is it?\n[208.016 - 210.697] SPEAKER_03 And he said, 2,425 feet.\n[211.818 - 215.6] SPEAKER_03 And I said, no, not from sea level.\n[216.74 - 218.842] SPEAKER_03 How tall is it from the bottom to the top?\n[219.482 - 221.843] SPEAKER_03 And he said, 2,425 feet.\n[222.784 - 227.366] SPEAKER_03 He said, it\'s not quite straight down, but you wouldn\'t feel much after the first bump.\n[232.529 - 236.331] SPEAKER_03  And I said, is there a path to the top?\n[237.391 - 241.213] SPEAKER_03 And he said, yeah, like he used to do it on his lunch hour.\n[243.194 - 244.215] SPEAKER_03 I said, how long is it?\n[244.675 - 247.817] SPEAKER_03 He said, three and a half miles, but you might have to post hole a little bit.\n[249.177 - 250.398] SPEAKER_03 And I said, sure.\n[252.639 - 258.242] SPEAKER_03 Now, if you ever tell me something that you think I ought to know, then my response is, sure.\n[260.407 - 263.849] SPEAKER_03  You can bet your bottom half dollar that I have no idea what you\'re talking about.\n[265.41 - 266.751] SPEAKER_03 So I wasn\'t staying at the park.\n[266.791 - 267.912] SPEAKER_03 I was staying in Mariposa.\n[268.212 - 270.674] SPEAKER_03 And the next morning, I had to get up, and I did a job at a school.\n[270.914 - 272.875] SPEAKER_03 And then I got in my car, and I drove to Mariposa.\n[272.935 - 274.036] SPEAKER_03 And I got to the park.\n[275.116 - 278.959] SPEAKER_03 I parked right near the trailhead at just before 1 o\'clock in the afternoon.\n[279.7 - 281.922] SPEAKER_03  And I changed clothes in the car.\n[282.003 - 291.932] SPEAKER_03 I put on my wool socks and my running pants and my moisture-wicking short-sleeved T-shirt and my moisture-wicking long-sleeved running shirt and my running shoes.\n[292.333 - 302.503] SPEAKER_03 And I had my pocket knife and my driver\'s license so they could identify my remains.\n[304.417 - 306.279] SPEAKER_03  There\'s four kinds of basic hikes.\n[306.319 - 307.6] SPEAKER_03 I don\'t know how many of you are hikers.\n[307.64 - 309.881] SPEAKER_03 I\'m not asking, I\'m just saying, I don\'t know.\n[312.484 - 314.445] SPEAKER_03 So there\'s four basic kinds of hikes, right?\n[314.465 - 316.507] SPEAKER_03 There\'s the point A to point B hike.\n[317.047 - 319.269] SPEAKER_03 There\'s the loop trail.\n[320.15 - 321.991] SPEAKER_03 There\'s the out and back.\n[322.632 - 325.754] SPEAKER_03 And then the lesser talked about is the never come back.\n[330.198 - 331.839] SPEAKER_03 So it was almost one o\'clock.\n[332.339 - 334.101] SPEAKER_03 It\'s a three and a half mile trail.\n[334.878 - 345.465] SPEAKER_03  What the ranger further explained to me is that the falls is 2,425 feet, but you actually have to go up 2,700 feet to get to the top of the trail.\n[345.825 - 348.387] SPEAKER_03 And then you have to descend a little bit to get to the falls.\n[348.647 - 351.509] SPEAKER_03 But it\'s a three and a half mile hike to get to the top of the trail.\n[351.829 - 353.911] SPEAKER_03 And I was thinking to myself, it\'s one o\'clock.\n[354.691 - 356.473] SPEAKER_03 The sun sets at seven.\n[357.113 - 358.394] SPEAKER_03 I have six hours.\n[359.174 - 361.396] SPEAKER_03 It\'s a three and a half mile hike.\n[363.193 - 371.22] SPEAKER_03  Under almost any circumstances, conditions, if I am properly outfitted, I can jog consistent 10-minute miles.\n[372.481 - 373.482] SPEAKER_03 Three and a half miles?\n[374.022 - 376.064] SPEAKER_03 It\'s going to take me 35 minutes to go up.\n[383.99 - 387.974] SPEAKER_03 Then I thought some of it might be uphill.\n[391.024 - 396.566] SPEAKER_03  So maybe I\'ll have to walk a little bit, but I can do a 15-minute mile walk and no problem at all.\n[396.926 - 405.669] SPEAKER_03 So I thought even if I have to walk half of it, let\'s just say it\'s going to take me an hour to get up and 45 minutes to a half hour to get down.\n[406.009 - 413.972] SPEAKER_03 So if I stop and look at all, which I probably won\'t because that\'s not how I roll, we\'re talking tops, two hours.\n[416.434 - 422.976] SPEAKER_03  So I started, well, I went to the water fountain thingy, and I drank a whole bunch of water, because that\'s all the water I was taking with me.\n[423.337 - 428.859] SPEAKER_03 Because he who travels light travels fast.\n[428.899 - 432.52] SPEAKER_03 You have to pee a lot, but it still works.\n[432.62 - 436.681] SPEAKER_03 And so just about 1 o\'clock, almost exactly 1 o\'clock, I started down the trail.\n[436.941 - 440.963] SPEAKER_03 And the first people that I passed coming down the trail\n[442.301 - 446.682] SPEAKER_03  It was an older couple, and they were clearly serious hikers.\n[447.023 - 451.144] SPEAKER_03 Everything they had on was Patagonia, North Face, L.L.\n[451.224 - 452.444] SPEAKER_03 Bean, Columbia.\n[452.684 - 458.966] SPEAKER_03 They had those stupid hats with the big bill on the front and the little flaps on the back so you don\'t get sunburned.\n[459.206 - 463.427] SPEAKER_03 They had headlamps on, and they had vests with a thousand pockets.\n[463.667 - 465.728] SPEAKER_03 And I just know that in those pockets they had...\n[466.048 - 487.706] SPEAKER_03  topographical maps and compasses and GPSs and the little silvery blankets that you wrap up in if you\'re gonna die that no one has ever used and they had Israeli quick clot solution in their pockets and they had granola bars and trail mix and I\'m sure that they had little baggies of their own waste.\n[493.482 - 495.404] SPEAKER_03  And they had those stupid poles.\n[495.464 - 499.507] SPEAKER_03 They were coming at me with those poles, just swishing them at me.\n[499.527 - 501.589] SPEAKER_03 And I could tell they were done.\n[501.83 - 503.831] SPEAKER_03 They had started before dawn.\n[504.072 - 506.153] SPEAKER_03 They had pre-planned their route.\n[506.173 - 508.916] SPEAKER_03 They had designated resting stops along their way.\n[509.136 - 513.779] SPEAKER_03  and they\'re coming at me with their little poles swishing, and they\'re giving me the eye, and I know what they\'re thinking.\n[513.819 - 517.961] SPEAKER_03 They are thinking, you, sir, are starting this trip way too late, young man.\n[518.201 - 520.903] SPEAKER_03 You\'re never going to make it back down before dark.\n[521.143 - 524.304] SPEAKER_03 Now, I don\'t know that they thought young man, but I like to stick it in there.\n[524.585 - 524.885] SPEAKER_03 And so...\n[528.171 - 530.653] SPEAKER_03  Those are the first people that I passed going up that trail.\n[530.893 - 533.295] SPEAKER_03 And I got to where the trail really starts to go up.\n[533.515 - 535.236] SPEAKER_03 Now let\'s talk about this for a minute.\n[535.276 - 538.518] SPEAKER_03 This is called the Yosemite Falls Trail.\n[538.879 - 542.061] SPEAKER_03 The word trail has no business.\n[543.959 - 546.061] SPEAKER_03  In this equation, this is not a trail.\n[546.282 - 548.564] SPEAKER_03 You have to ascend 2,700 feet.\n[548.604 - 549.845] SPEAKER_03 That\'s basically half a mile.\n[550.126 - 554.791] SPEAKER_03 To get up 2,700 feet, you have to go three and a half miles.\n[554.811 - 555.652] SPEAKER_03 That\'s basically 18,500 feet.\n[555.712 - 557.674] SPEAKER_03 The trail starts one mile from the top.\n[568.3 - 571.102] SPEAKER_03  So to go 2,700 feet, you have to go 5,280 feet, but it takes 18,500 feet to do it.\n[571.122 - 571.842] SPEAKER_03 Now, how can that be?\n[582.0 - 587.925] SPEAKER_03  If you were to take the Sears Tower and put it on top of the Sears Tower, if you didn\'t count the little pointy things, that\'s about 2,700 feet.\n[588.226 - 597.113] SPEAKER_03 If you built a three and a half mile trail from the ground to the top of your double Sears Tower, and you had just a gradual slope that went, you know, it\'s annoying, but it\'s gradual.\n[597.133 - 598.334] SPEAKER_03 It\'s a three and a half mile slope.\n[598.655 - 606.782] SPEAKER_03 That trail would start two miles out in Lake Michigan, and you would go up one foot for every six feet that you walked.\n[608.024 - 610.385] SPEAKER_03  That is not what the Yosemite Falls Trail is like.\n[610.465 - 613.346] SPEAKER_03 Again, you go up 2,700 feet in 5,280 feet, but it takes 18,500 feet to do it.\n[613.366 - 615.867] SPEAKER_03 If you look at the topographic map of this trail, which I did six months after I hiked it,\n[635.29 - 636.952] SPEAKER_03  Here are things that you will notice.\n[637.012 - 637.973] SPEAKER_03 The contour lines.\n[638.074 - 640.016] SPEAKER_03 I don\'t care how big you blow that map up.\n[640.076 - 643.921] SPEAKER_03 The contour lines are closer than the swirls on your thumbprint.\n[646.38 - 649.661] SPEAKER_03  The trail comes down the mountain like this.\n[650.321 - 654.602] SPEAKER_03 It looks like a small child\'s depiction of a very long lightning bolt.\n[654.922 - 661.263] SPEAKER_03 It looks like the electrocardiogram of a patient suffering vascular fibrillation.\n[661.323 - 664.083] SPEAKER_03 I mean, it\'s just like this all the way down.\n[664.383 - 673.565] SPEAKER_03 And if you read the brochure, which I did six months after I hiked it, it said that it is a very difficult trail.\n[674.591 - 677.333] SPEAKER_03  and that you should plan 12 and a half hours.\n[685.84 - 691.164] SPEAKER_03 I thought, maybe it\'s going to take me more than 35 minutes to get up this thing.\n[694.126 - 695.087] SPEAKER_03 I started going up.\n[695.899 - 700.624] SPEAKER_03  Going to go up a half a mile and a mile, but it\'s going to take me three and a half miles to do it, so I better get going.\n[700.964 - 702.505] SPEAKER_03 Started to go up, and I\'m passing people.\n[702.525 - 703.546] SPEAKER_03 I\'m already passing people.\n[703.586 - 705.048] SPEAKER_03 People going up, people coming down.\n[705.248 - 707.39] SPEAKER_03 And these people are in all kinds of various states of dress.\n[707.41 - 711.134] SPEAKER_03 They\'re not all wearing our original couple with the sticks thing.\n[711.194 - 713.356] SPEAKER_03 No, some of them are wearing hiking clothes.\n[713.676 - 732.394] SPEAKER_03  Some of them are wearing, there\'s one guy standing in the middle of the path, and he has on corduroy, cut-off corduroys, and dock shoes, and a New York Nets t-shirt, and he\'s standing there, people going by him on both sides, like he\'s standing in the middle of 42nd Street, and I think he was thinking to himself, I didn\'t even know the subway went to Yosemite.\n[738.12 - 751.386] SPEAKER_03  And then there\'s a lot of people who are wearing a style of clothing that I call national park casual, which means they weren\'t sure how they got out of their car.\n[752.927 - 756.188] SPEAKER_03 They had never intended to get out of their car, and now they were on this trail.\n[756.549 - 757.289] SPEAKER_03 So I\'m going up.\n[758.339 - 758.939] SPEAKER_03  passing people.\n[758.979 - 761.301] SPEAKER_03 Some people coming down, some people going up, some people resting.\n[761.561 - 765.464] SPEAKER_03 And this part of the trail is pretty wooded, so you really can\'t see much.\n[765.524 - 768.106] SPEAKER_03 But that\'s okay, because I don\'t know if I\'ve made this clear.\n[768.166 - 769.067] SPEAKER_03 This is not a trail.\n[769.367 - 781.376] SPEAKER_03 This is a ladder that goes into a fire escape, that goes into a spiral staircase, that then goes into the top of a fire truck, and then one of those things that you pull down so you can get up in the attic.\n[781.597 - 786.08] SPEAKER_03 And then once you get closer to the top, it turns into a sliding board that\'s covered with ice.\n[786.34 - 787.181] SPEAKER_03 So I\'m going up, but\n[788.666 - 791.167] SPEAKER_03  This is where the mountain climber, have you ever been to a gym class?\n[791.347 - 793.989] SPEAKER_03 The mountain climber exercise where you have to, you know, do this.\n[794.029 - 795.149] SPEAKER_03 This is where it was invented.\n[795.369 - 796.17] SPEAKER_03 You have to.\n[797.61 - 800.652] SPEAKER_03 Sometimes you can take two steps in the same direction, but mostly not.\n[800.932 - 802.733] SPEAKER_03 And you have to keep your eyes on the trail.\n[802.753 - 803.353] SPEAKER_03 It\'s that steep.\n[803.373 - 806.334] SPEAKER_03 You have to look at it, which isn\'t hard because it\'s right here.\n[806.575 - 807.175] SPEAKER_03 So I\'m going.\n[812.697 - 813.238] SPEAKER_03 I\'m making it.\n[814.398 - 818.04] SPEAKER_03 And then after about, I don\'t know, half a mile,\n[818.925 - 824.849] SPEAKER_03  It quits going uphill for just a minute, and it actually goes downhill a little bit.\n[824.869 - 831.494] SPEAKER_03 And I didn\'t want to go downhill a little bit because I knew that any downhill I went was just going to be worse uphill later on.\n[832.535 - 837.158] SPEAKER_03 And you come through the trees, and you come out.\n[837.659 - 839.56] SPEAKER_03  And you\'re halfway up Yosemite Falls.\n[839.58 - 842.162] SPEAKER_03 You can see it about 100 yards away.\n[842.683 - 844.124] SPEAKER_03 And it is incredible.\n[844.184 - 848.187] SPEAKER_03 Not only can you see Yosemite Falls coming down, but you can look down the valley.\n[848.207 - 850.008] SPEAKER_03 You\'re looking right down the Yosemite Valley.\n[850.268 - 851.869] SPEAKER_03 And you\'re looking at El Capitan.\n[851.989 - 853.09] SPEAKER_03 Columbia Rock is right here.\n[853.37 - 854.511] SPEAKER_03 El Capitan is out there.\n[854.551 - 855.212] SPEAKER_03 And Half Dome.\n[855.572 - 856.293] SPEAKER_03  It\'s incredible.\n[856.633 - 860.375] SPEAKER_03 It\'s a beautiful, beautiful thing to see, and I encourage you all to do it.\n[860.595 - 863.197] SPEAKER_03 And this is like a sub-hike.\n[863.918 - 874.064] SPEAKER_03 Many, many, many people, many people take this first part of the trail, and they go up there, and they stand halfway up Yosemite Falls, and they look at it, and they feel satisfied.\n[874.305 - 876.106] SPEAKER_03 They have made a difficult hike.\n[876.286 - 878.567] SPEAKER_03 They have done something they didn\'t expect to do.\n[878.828 - 880.429] SPEAKER_03 They saw something beautiful.\n[880.469 - 882.33] SPEAKER_03 They checked something off their to-do list.\n[882.55 - 884.972] SPEAKER_03 And then most people, most people,\n[886.814 - 888.316] SPEAKER_03  Somehow I\'m Donnie White all of a sudden.\n[888.416 - 889.157] SPEAKER_03 Most people.\n[889.638 - 892.903] SPEAKER_03 Most people are satisfied with that.\n[894.125 - 897.75] SPEAKER_03 Most people look at that and they think that is nice.\n[898.772 - 899.553] SPEAKER_03 But I got to pee.\n[901.178 - 902.58] SPEAKER_03  So I\'m going back down the mountain.\n[903.181 - 909.268] SPEAKER_03 Most people are smarter than me because I was going to keep going from that point.\n[909.509 - 911.751] SPEAKER_03 I still had like two miles to go to get to the top.\n[911.972 - 914.154] SPEAKER_03 And let me tell you something interesting about myself.\n[915.096 - 918.96] SPEAKER_03 My wife and I do a lot of hiking, but we have very... Together, which is weird.\n[919.161 - 919.741] SPEAKER_03 We have very...\n[920.342 - 923.263] SPEAKER_03  Well, we have very different attitudes toward hiking.\n[923.343 - 926.684] SPEAKER_03 If I said to you, hi, we\'re in your town, is there a nice place to hike?\n[926.724 - 928.245] SPEAKER_03 And you said, yes, you should go do this.\n[928.825 - 932.466] SPEAKER_03 My wife would say to you, oh, what pretty things are there to see?\n[933.046 - 934.467] SPEAKER_03 What can I take pictures of?\n[934.607 - 936.707] SPEAKER_03 Are there any interesting or endangered plants?\n[936.887 - 939.528] SPEAKER_03 I will be sending selfies to every single person I know.\n[939.948 - 942.209] SPEAKER_03 What I would say to you is, what is the record?\n[944.65 - 947.351] SPEAKER_03 What\'s the fastest anyone has ever done this trail?\n[948.746 - 949.947] SPEAKER_03  Because that\'s how I want to hike.\n[950.027 - 950.607] SPEAKER_03 I want to move.\n[950.667 - 951.367] SPEAKER_03 I want to get it done.\n[951.627 - 952.688] SPEAKER_03 So I\'m booking up this trip.\n[952.868 - 956.97] SPEAKER_03 Now this is, as I say, most people at this point turn around and they go the other way.\n[957.07 - 958.791] SPEAKER_03 Most people, but not me.\n[958.991 - 962.712] SPEAKER_03 This is also coincidentally where the snow line starts.\n[964.173 - 967.916] SPEAKER_03  Yeah, it wasn\'t snowing, but there was probably three feet of snow on the ground.\n[968.217 - 978.786] SPEAKER_03 Now, most people turn around at that point, but enough people had continued on from that point that the trail was beaten down, packed down into the snow, so that as you\'re hiking, the snow is about at your knees.\n[978.806 - 980.487] SPEAKER_03 Your feet are on the ground, but the snow is at your knees.\n[980.788 - 983.71] SPEAKER_03 And I\'m going up, and it starts to go uphill again.\n[983.77 - 987.473] SPEAKER_03 This is where the sliding board covered with ice aspect comes into this trail.\n[988.482 - 995.166] SPEAKER_03  And as I\'m climbing up this in my running shoes, I\'m noticing that on both sides of the trail, there\'s these weird little holes.\n[995.506 - 997.187] SPEAKER_03 There may be an inch in diameter.\n[997.227 - 1000.649] SPEAKER_03 Sometimes there\'s three of them, maybe an inch and a half apart.\n[1000.909 - 1002.009] SPEAKER_03 Sometimes there\'s four of them.\n[1002.049 - 1004.751] SPEAKER_03 Sometimes there\'s the fifth one that\'s maybe two inches away.\n[1004.771 - 1006.672] SPEAKER_03 I\'m just thinking, what are those?\n[1007.212 - 1012.135] SPEAKER_03 Is there like some kind of snow clam that lives in Yosemite National Park?\n[1013.868 - 1017.469] SPEAKER_03  kind of California Arctic worm that pops out and eats things.\n[1017.829 - 1020.99] SPEAKER_03 And as I was considering what it could be, I slipped and I went like that.\n[1032.633 - 1034.434] SPEAKER_03 And I knew exactly what those holes were.\n[1036.101 - 1044.129] SPEAKER_03  For the first time in the whole trip, in fact, I was doing six miles an hour, but they were treadmill miles, because my hands were moving and my feet were going, but I was not going anywhere.\n[1045.75 - 1051.196] SPEAKER_03 Dragging myself off this cliff, and I\'m starting to think to myself, you know what, I haven\'t seen anybody else for a long time.\n[1052.679 - 1057.901] SPEAKER_03  Not only am I pretty good at finding the hardest way to do things, I\'m also a world-class warrior.\n[1058.201 - 1064.763] SPEAKER_03 And I started to think maybe I inadvertently went around a gate that said, do not start this hike after 1 p.m.\n[1064.843 - 1065.803] SPEAKER_03 or you will die.\n[1066.144 - 1068.904] SPEAKER_03 And that\'s why there was nobody else on the trail at all.\n[1069.125 - 1076.367] SPEAKER_03 And I started thinking about this time I was hiking in the Sierra Mountains, but I was up near Nevada City, and I was in the Yuba National Forest.\n[1076.687 - 1083.833] SPEAKER_03  And I was hiking, and there were these two young women in front of me, and there were these helicopters clearly doing a grid pattern over top of us.\n[1084.173 - 1088.477] SPEAKER_03 And the one young lady said to the other young lady, what do you think those helicopters are doing?\n[1088.777 - 1095.602] SPEAKER_03 And this young lady said, well, either someone is hurt, there\'s a fire, or they found someone\'s marijuana patch.\n[1098.164 - 1102.368] SPEAKER_03 And this lady, full of compassion, said, gosh, I hope somebody\'s hurt.\n[1112.819 - 1118.624] SPEAKER_03  And I thought, I need to find somebody to ask them how much further it is to the top of this trail.\n[1119.024 - 1120.606] SPEAKER_03 I\'m not going to stop, but I just want to check.\n[1120.906 - 1122.307] SPEAKER_03 And you can\'t just ask anybody.\n[1122.347 - 1128.933] SPEAKER_03 I mean, you\'ve got to find somebody that looks like they\'re in about the same physical condition as you so that they give you a reliable estimate of how far it is.\n[1129.273 - 1134.458] SPEAKER_03 And finally, I see a guy coming down the mountain, and I get up next to him, and I say, hey, how far is it to the top?\n[1134.558 - 1135.939] SPEAKER_03 Oh, Simon, come here a second.\n[1136.64 - 1137.801] SPEAKER_03 No, I need a British accent.\n[1141.633 - 1143.334] SPEAKER_03  He\'s actually Australian, but you\'re all the same.\n[1146.536 - 1148.258] SPEAKER_03 So I say, how far to the top?\n[1148.498 - 1150.8] SPEAKER_03 And you say, you\'re going to need a torch.\n[1151.18 - 1152.321] SPEAKER_03 And then I\'m going to say, thank you.\n[1152.381 - 1154.362] SPEAKER_03 And you\'re going to say, cheers, mate.\n[1154.862 - 1157.664] SPEAKER_03 So I say to him, how far is it to the top?\n[1158.405 - 1159.986] SPEAKER_03 I\'m sorry, you\'re going to need a torch.\n[1160.566 - 1160.707] SPEAKER_03 Right.\n[1160.907 - 1162.568] SPEAKER_03 He said, you\'re going to need a torch.\n[1163.769 - 1164.049] SPEAKER_03 And then.\n[1165.996 - 1168.057] SPEAKER_03  No, I\'m just reiterating so we\'re sure.\n[1168.398 - 1170.679] SPEAKER_03 And then I said, I said, thanks.\n[1170.999 - 1171.64] SPEAKER_03 And he said.\n[1172.84 - 1173.181] SPEAKER_03 Cheers.\n[1174.001 - 1174.602] SPEAKER_03 Cheers, mate.\n[1175.702 - 1176.463] SPEAKER_00 Cheers, mate.\n[1184.808 - 1185.969] SPEAKER_03 We didn\'t even rehearse that.\n[1188.45 - 1191.192] SPEAKER_03  No, but here\'s the thing that I was thinking as I walked away from this.\n[1191.232 - 1213.291] SPEAKER_03 I mean, I was thinking several things, but the first thing I was thinking is that that was the first time in my life, and I don\'t know if you\'ve experienced this, but that was the, I mean, you just did sort of accidentally, adjacently, but that was the first time in my life that I had been actually cheers-mated by a subject of Her Majesty the Queen.\n[1215.493 - 1216.334] SPEAKER_03 Yeah, I know.\n[1217.168 - 1220.929] SPEAKER_03  It probably happens to you all the time, but it doesn\'t happen much in America.\n[1220.969 - 1222.689] SPEAKER_03 People don\'t say, cheers, mate, you know?\n[1222.989 - 1227.97] SPEAKER_03 So anyway, it was a moving experience of all the other things that had happened to me that day.\n[1228.55 - 1231.291] SPEAKER_03 And then I started thinking, he said I was going to need a torch.\n[1231.731 - 1234.411] SPEAKER_03 And I said, well, that\'s dumb, because we\'re in California.\n[1237.352 - 1239.892] SPEAKER_03 You can\'t have a torch in the woods in California.\n[1241.833 - 1243.573] SPEAKER_03 You can burn the whole place down, you know?\n[1245.632 - 1246.152] SPEAKER_03  Foreigners.\n[1246.492 - 1256.917] SPEAKER_03 And then I remembered, because I read Harry Potter, that a torch means a flashlight.\n[1258.337 - 1262.999] SPEAKER_03 And what he probably meant by that was, you\'re going to need a torch.\n[1263.299 - 1267.621] SPEAKER_03 He probably meant, you\'re not going to make it back down before dark.\n[1268.821 - 1272.503] SPEAKER_03 Therefore, you need a light source or you\'re going to die.\n[1274.544 - 1275.184] SPEAKER_03 And I giggled.\n[1276.408 - 1277.771] SPEAKER_03  because I didn\'t have a flashlight.\n[1279.075 - 1280.578] SPEAKER_03 So I just kept on going.\n[1283.004 - 1284.668] SPEAKER_03 And you come around this next curve.\n[1285.441 - 1290.282] SPEAKER_03  And you can see the path going up the cliff face in front of you.\n[1290.322 - 1295.743] SPEAKER_03 Now, it has been steep before this, but now you can see a cross section, just like you can see the front of the stage.\n[1296.023 - 1301.604] SPEAKER_03 You can see a cross section of this cliff and the path going up it in a switchback.\n[1301.825 - 1308.246] SPEAKER_03 Now, this path, I will tell you this information, this path, three and a half miles long, it was built between 1833, I\'m sorry, 1873 and 1877.\n[1313.968 - 1315.109] SPEAKER_03  Small that over for a minute.\n[1315.489 - 1316.93] SPEAKER_03 Three and a half mile trail.\n[1317.63 - 1321.272] SPEAKER_03 It took four years to make it.\n[1321.572 - 1325.894] SPEAKER_03 That is more than or less than a mile a year.\n[1326.154 - 1330.917] SPEAKER_03 And so that\'s 16 feet a day if you work every single day.\n[1330.937 - 1331.637] SPEAKER_03 Maybe it\'s 14.\n[1331.677 - 1332.297] SPEAKER_03 Don\'t double check.\n[1332.798 - 1333.078] SPEAKER_03 And then...\n[1334.218 - 1339.34] SPEAKER_03  If you take off holidays and, you know, Christmas, maybe you take the winter off, that\'s still only like 26 feet a day.\n[1339.56 - 1341.621] SPEAKER_03 That\'s how difficult this trail was to build.\n[1341.841 - 1344.022] SPEAKER_03 And they had just carved it out of this cliff face.\n[1344.102 - 1344.822] SPEAKER_03 But here\'s the thing.\n[1345.122 - 1346.183] SPEAKER_03 I was walking on snow.\n[1346.243 - 1347.243] SPEAKER_03 I think we\'ve made that clear.\n[1347.503 - 1351.465] SPEAKER_03 And I assumed that under the snow was the earth.\n[1358.27 - 1361.633] SPEAKER_03  It didn\'t seem like a crazy logical leap at the time.\n[1361.713 - 1365.877] SPEAKER_03 I thought there was snow, and then there was dirt and rocks, and then there was the earth.\n[1366.077 - 1367.578] SPEAKER_03 And then over here, there was a cliff.\n[1367.598 - 1369.74] SPEAKER_03 I didn\'t want to fall off that cliff, but there was a cliff.\n[1369.76 - 1371.902] SPEAKER_03 But it wasn\'t a fall and die cliff.\n[1372.162 - 1378.347] SPEAKER_03 It was a fall and lay there pretty broken for a few hours, hoping somebody else comes along and then die cliff.\n[1378.848 - 1379.148] SPEAKER_03 And so...\n[1380.828 - 1385.329] SPEAKER_03  When you see the trail going up these switchbacks carved out of the cliff, they\'re covered with snow.\n[1385.57 - 1389.991] SPEAKER_03 But some interesting event in nature had happened.\n[1390.071 - 1393.172] SPEAKER_03 The sun, the heat, had melted some of the snow.\n[1393.512 - 1398.054] SPEAKER_03 But it had not melted the snow on top of the trail.\n[1399.134 - 1402.415] SPEAKER_03 It had melted the snow underneath the trail.\n[1403.255 - 1408.317] SPEAKER_03 So as you\'re watching this path go up this cliffside, there were arches.\n[1409.252 - 1421.159] SPEAKER_03  like 10 inches high, five feet long, these beautiful snow bridges where there was nothing underneath the path except 10 inches and then a miserable fall.\n[1422.78 - 1423.761] SPEAKER_03 All the way, it was beautiful.\n[1424.341 - 1427.883] SPEAKER_03 It was a fascinating little trick of nature, but I didn\'t want to walk on it.\n[1429.744 - 1430.184] SPEAKER_03 So I ran.\n[1430.204 - 1430.264] SPEAKER_03 And...\n[1437.074 - 1443.521] SPEAKER_03  Then, this is three miles into the trip, and it\'s taken slightly more than three and a half hours.\n[1444.903 - 1445.664] SPEAKER_03 It flattens out.\n[1445.764 - 1448.907] SPEAKER_03 It quits going unremittingly uphill.\n[1450.189 - 1452.732] SPEAKER_03 It\'s almost what some people would describe as flat.\n[1453.853 - 1456.396] SPEAKER_03 And I\'m walking across this snow-covered tundra.\n[1457.25 - 1463.956] SPEAKER_03  I could see the peak where I was headed, but I also realized that there were no other footprints where I was.\n[1464.757 - 1468.22] SPEAKER_03 So clearly I was lost, except I could see where I was going.\n[1468.481 - 1474.126] SPEAKER_03 And so I\'m walking across this tundra, trying to catch my breath, and then I learned what post-holing is.\n[1474.766 - 1482.49] SPEAKER_03  And what postholing is, is when you\'re walking across the frozen surface of snow, and then the surface tension breaks, and your leg just falls right in.\n[1482.77 - 1488.212] SPEAKER_03 It just goes, it only went up to here, but all the way up to my thigh, and then this leg crashed through.\n[1488.232 - 1490.173] SPEAKER_03 So now I was, you know, thigh deep in snow.\n[1490.473 - 1495.816] SPEAKER_03 And that\'s why they call it postholing, because suddenly there\'s a hole like a post would go in, and you have to pull your leg out of it.\n[1496.056 - 1499.058] SPEAKER_03  And then once you get your leg out of it, you step again, you go right back down.\n[1499.098 - 1500.399] SPEAKER_03 So you\'re post-holing all the way.\n[1500.699 - 1505.001] SPEAKER_03 And that\'s when I was really glad that I was wearing tennis shoes and not hiking boots.\n[1506.863 - 1509.804] SPEAKER_03 Because it would have been really hard to get those hiking boots out of there.\n[1512.486 - 1513.827] SPEAKER_03 I finally got to the top.\n[1514.367 - 1516.248] SPEAKER_03 I made it to the summit, 2,700 feet.\n[1519.426 - 1521.951] SPEAKER_03  And it\'s a little bit disappointing, I have to tell you the truth.\n[1522.713 - 1525.599] SPEAKER_03 After all that, you can see Yosemite Creek.\n[1526.501 - 1527.763] SPEAKER_03 You can hear the falls.\n[1528.826 - 1530.188] SPEAKER_03 But you can\'t see the falls.\n[1531.892 - 1535.995] SPEAKER_03  And then I remember that the man told me I was going to have to descend a little bit, so I went down this way.\n[1536.035 - 1536.836] SPEAKER_03 There\'s a big boulder.\n[1536.856 - 1537.757] SPEAKER_03 I went around this boulder.\n[1537.777 - 1540.779] SPEAKER_03 You come around that boulder, and there it is.\n[1541.44 - 1545.863] SPEAKER_03 You are not more than maybe 25 yards from the falls where you\'re standing.\n[1546.083 - 1551.007] SPEAKER_03 And at that time of year, in March, don\'t go do this in July because there\'s no water in California.\n[1551.047 - 1554.25] SPEAKER_03 I don\'t know if you\'ve read that headline yet',NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,'[0.049 - 3.47] SPEAKER_00  letters from his alma mater, Hamilton University.\n[3.95 - 13.313] SPEAKER_00 His latest book is called Now You Say Yes by Peachtree Press, which is over in the resource center, the resource tent up there behind the church.\n[14.193 - 16.954] SPEAKER_00 And it\'s award-winning and has been reviewed very highly.\n[18.134 - 22.595] SPEAKER_00 I asked him, Bill, why is storytelling important?\n[22.635 - 23.836] SPEAKER_00 Why do you do this?\n[23.876 - 28.197] SPEAKER_00 And he said, it\'s important because it\'s a chance to build a community.\n[28.857 - 36.622] SPEAKER_00  He referred to a thing called the temporary autonomous zone that occurs when people get together for a good reason.\n[37.123 - 38.583] SPEAKER_00 What do you get out of it, Bill?\n[38.864 - 42.406] SPEAKER_00 And he said, one of the things he said was, it gives a sense of purpose.\n[42.946 - 47.389] SPEAKER_00 And I said, Bill, do you mind if I quote Wallace Stevens in introducing you?\n[47.87 - 50.551] SPEAKER_00 And he said, yes, I do.\n[50.652 - 54.154] SPEAKER_00 No, he said, he said, sure, go ahead.\n[56.328 - 58.133] SPEAKER_00  Wallace Stevens was a New England poet.\n[60.3 - 61.583] SPEAKER_00 Bill Harley is from New England.\n[62.699 - 63.719] SPEAKER_00  man with a blue guitar.\n[64.18 - 66.921] SPEAKER_00 Man bent over his guitar, a shearsman of sorts.\n[67.361 - 68.401] SPEAKER_00 The day was green.\n[68.942 - 71.063] SPEAKER_00 They said, you have a blue guitar.\n[71.383 - 73.063] SPEAKER_00 You do not play things as they are.\n[73.403 - 79.786] SPEAKER_00 The man replied, things as they are are changed upon the blue guitar.\n[80.206 - 88.81] SPEAKER_00 And they said then, but play you must a tune beyond us, yet ourselves, Bill Harley.\n[98.908 - 99.789] SPEAKER_01  Thank you, Ed.\n[100.129 - 100.67] SPEAKER_01 Thank you.\n[100.69 - 103.533] SPEAKER_05 Hi, y\'all.\n[103.553 - 104.114] SPEAKER_05 You made it.\n[105.836 - 107.758] SPEAKER_05 Aren\'t too beat up by yesterday, huh?\n[112.143 - 116.728] SPEAKER_01 Well, it\'s a little early for rock and roll, but we\'re going to see what we can do here.\n[127.614 - 138.502] SPEAKER_05  The unfettered, unalloyed expression of emotion in public is generally frowned upon in our culture.\n[139.783 - 141.164] SPEAKER_05 We don\'t like to see it.\n[141.965 - 143.286] SPEAKER_05 It makes us nervous.\n[144.347 - 153.354] SPEAKER_05 When we see people expressing too much emotions, we turn and we cross the street and we wish that we just stop doing that, okay?\n[153.434 - 154.094] SPEAKER_05 Please stop.\n[154.174 - 155.275] SPEAKER_05 It\'s making us nervous.\n[155.635 - 156.296] SPEAKER_05 We don\'t like it.\n[157.446 - 166.309] SPEAKER_05  The negative emotions, what you could call the negative emotions, you know, rage, anger, grief, sadness, it\'s understandable that we don\'t want to see those things.\n[166.369 - 177.992] SPEAKER_05 Because the truth is, as much as we want to be like strong people making our own way, we are really kind of more like a flock of things.\n[178.853 - 181.173] SPEAKER_05 And we\'re influenced by those around us.\n[181.954 - 186.435] SPEAKER_05 If I start to sing a note and I ask you to sing, you\'re pretty much going to sing that same note.\n[187.878 - 189.659] SPEAKER_05  That\'s what we, it\'s called entrainment.\n[189.699 - 192.601] SPEAKER_05 We find that rhythm or we find that tone.\n[192.921 - 194.182] SPEAKER_05 And it\'s true with emotions.\n[194.262 - 197.284] SPEAKER_05 If someone feels horrible around us, we feel horrible.\n[197.644 - 199.546] SPEAKER_05 And we don\'t like feeling horrible.\n[199.966 - 203.848] SPEAKER_05 So if you feel horrible, I would appreciate it if you didn\'t show it.\n[205.91 - 207.291] SPEAKER_05 So I feel all right.\n[209.332 - 210.813] SPEAKER_05  So that makes some sense, right?\n[211.313 - 214.354] SPEAKER_05 But what about what you call the positive emotions?\n[214.374 - 217.956] SPEAKER_05 You know, like happiness, glee, joy, love.\n[218.396 - 220.497] SPEAKER_05 Even that makes it nervous, you know?\n[220.878 - 225.18] SPEAKER_05 You\'re walking down the street, some guy comes up and you go, he says, I\'m happy.\n[225.2 - 226.72] SPEAKER_05 It\'s like, okay.\n[229.162 - 230.682] SPEAKER_05 Go be happy over there.\n[230.702 - 233.764] SPEAKER_05 I say, well, why is that?\n[233.804 - 235.785] SPEAKER_05 We say, well, it\'s embarrassing.\n[236.67 - 238.951] SPEAKER_05  But that\'s very unspecific.\n[241.092 - 242.612] SPEAKER_05 Who are we embarrassed for?\n[243.173 - 248.335] SPEAKER_05 Well, I guess maybe we\'re embarrassed for them because they\'re showing that they\'re being vulnerable.\n[248.375 - 249.955] SPEAKER_05 Don\'t be vulnerable here.\n[250.595 - 259.259] SPEAKER_05 Or maybe we\'re embarrassed for us because we see someone expressing those feelings and we have them too, but we\'re not showing them.\n[260.279 - 261.66] SPEAKER_05 We\'re hiding who we are.\n[263.38 - 264.501] SPEAKER_05 And then there\'s music.\n[266.308 - 271.352] SPEAKER_05  which is really, at its heart, the expression of feeling.\n[271.892 - 273.814] SPEAKER_05 Music is about feeling.\n[273.914 - 278.737] SPEAKER_05 Music says things that we can only approximate with words.\n[280.359 - 285.443] SPEAKER_05 And there\'s song, the combination of word and music.\n[286.483 - 291.187] SPEAKER_05 Yip Harburg, great songwriter, wrote Brother, Can You Spare a Dime?\n[291.487 - 292.508] SPEAKER_05 It\'s Only a Paper Moon.\n[293.968 - 297.03] SPEAKER_05  and the great American song, Somewhere Over the Rainbow.\n[297.871 - 304.016] SPEAKER_05 Yeah, he was a lyricist and especially the librettist for all of Wizard of Oz.\n[304.376 - 310.141] SPEAKER_05 He said, words express a thought and music expresses a feeling.\n[310.901 - 312.863] SPEAKER_05 So a song feels a thought.\n[315.031 - 317.232] SPEAKER_05  But do we sing out loud in public?\n[317.512 - 317.932] SPEAKER_05 No.\n[318.613 - 319.413] SPEAKER_05 No.\n[319.433 - 320.954] SPEAKER_05 I know where you sing.\n[321.754 - 325.556] SPEAKER_05 You sing in a car with the windows rolled up and nobody can hear you.\n[325.576 - 327.617] SPEAKER_05 And you say, well, I can\'t really sing.\n[327.637 - 331.459] SPEAKER_05 You know, you ask a bunch of four-year-olds who here can sing, they all raise their hand.\n[331.479 - 335.06] SPEAKER_05 You ask a bunch of 50-year-olds who here can sing, most of them say, no, I can\'t do that.\n[335.14 - 336.161] SPEAKER_05 What happened to you?\n[338.089 - 341.593] SPEAKER_05  I mean, we sing, but we don\'t sing in public.\n[341.613 - 346.819] SPEAKER_05 Or we sing with a group of people, but that\'s okay because we\'re all feeling something.\n[347.44 - 348.601] SPEAKER_05 You know, we don\'t do that today.\n[348.621 - 350.784] SPEAKER_05 You know what we do?\n[351.024 - 353.808] SPEAKER_05 Here\'s how I feel, and you give them a song list.\n[358.596 - 361.198] SPEAKER_05  I don\'t trust myself to sing this out loud.\n[361.838 - 369.784] SPEAKER_05 I mean, the notion, this great romantic notion of someone standing underneath someone\'s window and singing, you know, people haven\'t done, do that.\n[369.824 - 370.545] SPEAKER_05 Well, I did it.\n[372.669 - 373.249] SPEAKER_05  I\'ve done it.\n[374.469 - 377.85] SPEAKER_05 I usually had some kind of chemical aid to help me.\n[379.63 - 381.471] SPEAKER_05 But we don\'t do it, you know?\n[382.671 - 383.371] SPEAKER_05 We don\'t do it.\n[383.431 - 390.492] SPEAKER_05 So when I was in eighth grade, my brother, my older brother John, got a radio, a big honking radio.\n[391.312 - 399.114] SPEAKER_05 And this is the other thing, actually, about music, that music, the way it used to be, now the music is like, a lot of times it never makes it into the air.\n[399.394 - 401.034] SPEAKER_05 But music is about the air.\n[401.994 - 402.274] SPEAKER_05  Right?\n[402.695 - 404.276] SPEAKER_05 And the radio, that\'s how we listened to it.\n[404.336 - 405.456] SPEAKER_05 It was music that was in the air.\n[405.476 - 407.377] SPEAKER_05 It wasn\'t these little things in our heads.\n[408.778 - 409.619] SPEAKER_05 And this was important.\n[409.639 - 413.201] SPEAKER_05 It was one of those big radios that had like 17 bands on it, 14 of them.\n[413.241 - 414.722] SPEAKER_05 I don\'t even know what they were for, right?\n[414.942 - 421.026] SPEAKER_01 You know, it had the AM and the FM, shortwave one, shortwave two, shortwave seven, you know, emergency broadcasting system.\n[421.066 - 424.989] SPEAKER_01 It took 27 D-sized batteries unless you plugged it in.\n[425.009 - 428.211] SPEAKER_01 It had this big antenna that broke off immediately.\n[429.266 - 442.028] SPEAKER_05  And this is very important because my brother and I shared a room, a 10 by 12 foot bedroom in a ranch house, small ranch house in the north side of Indianapolis, Indiana.\n[443.028 - 447.029] SPEAKER_05 And I had never had a radio before.\n[448.069 - 453.89] SPEAKER_05 And I had never had access to the songs that I might listen to that my friends were listening to.\n[454.19 - 458.471] SPEAKER_05 Now I must say right at the beginning, my brother was not like me.\n[459.454 - 460.915] SPEAKER_05  who was not like me and my friends.\n[460.975 - 467.818] SPEAKER_05 My brother, you know how they say about someone, he marched to a different drummer?\n[468.659 - 470.86] SPEAKER_05 My brother marched to a different bassoon.\n[474.972 - 479.574] SPEAKER_05  My brother John has never fit in the world, never to this day.\n[479.614 - 483.576] SPEAKER_05 And at a very early age, he fell in love with classical music.\n[484.096 - 488.618] SPEAKER_05 And so by the time he was, so I was in eighth grade and he had started 10th grade in high school.\n[488.638 - 495.881] SPEAKER_05 He was listening to, he loved Brahms and he loved Mahler, Mahler.\n[497.523 - 501.805] SPEAKER_05  I don\'t know how many times I\'ve heard Mahler\'s Fifth Symphony, not again.\n[501.825 - 506.668] SPEAKER_05 And he loved Charles Ives, completely impenetrable.\n[507.168 - 512.631] SPEAKER_05 So he wasn\'t interested, but when he wasn\'t in the room, the radio became mine.\n[514.092 - 519.395] SPEAKER_05 And suddenly, I could hear these songs that were forbidden in my house.\n[524.232 - 528.115] SPEAKER_04  Hey there, little red riding hare.\n[529.155 - 532.237] SPEAKER_04 You sure are looking good.\n[532.818 - 537.981] SPEAKER_04 You\'re anything that a big, bad wolf would want.\n[540.082 - 543.344] SPEAKER_04 Yeah, OK.\n[545.446 - 548.568] SPEAKER_01 Even then, I knew there was something wrong with that song.\n[551.343 - 558.07] SPEAKER_05  And then there was this one, which was only on the radio briefly because it was banned even on the radio.\n[558.11 - 559.531] SPEAKER_05 My friend had a recording of it.\n[559.551 - 561.273] SPEAKER_05 It was like totally contraband.\n[568.841 - 572.445] SPEAKER_04 The eastern world, it is exploding.\n[573.55 - 576.471] SPEAKER_04  Violence flaring, bullets loading.\n[577.171 - 580.533] SPEAKER_04 Old enough to kill, too young for voting.\n[580.593 - 584.294] SPEAKER_04 You don\'t believe in war, but what\'s that gun you\'re toting?\n[584.474 - 588.455] SPEAKER_04 Even the Jordan River, the bodies are floating.\n[588.575 - 595.278] SPEAKER_04 And you tell me over and over and over again, my friend.\n[596.613 - 602.137] SPEAKER_04  You don\'t believe we\'re on evil destruction.\n[602.577 - 604.839] SPEAKER_05 Yeah, no evil destruction in my house.\n[606.44 - 609.543] SPEAKER_05 And I don\'t mean to say there was no music in my house.\n[610.143 - 611.784] SPEAKER_05 There was a lot of music.\n[612.445 - 615.327] SPEAKER_05 My father was a high-fidelity nut.\n[616.608 - 621.351] SPEAKER_05 There was a period where high-fidelity was exploding.\n[621.571 - 624.954] SPEAKER_05 And he didn\'t have a stereo system, but he had built his own speaker.\n[626.385 - 635.05] SPEAKER_05  and he had got a stereo amplifier, I mean, an amplifier kit, and he built that, and he had a turntable, and he played music on it all the time.\n[635.431 - 642.335] SPEAKER_05 But my dad loved classical music, and he loved jazz, and he listened to swing.\n[642.795 - 654.042] SPEAKER_05 But nothing, as a matter of fact, I think, you know, whatever, Stereo Review was publishing articles that said, you know, playing rock and roll on these needles, good high-end needle will destroy the needle.\n[654.062 - 655.223] SPEAKER_05 It was things like that.\n[661.229 - 662.793] SPEAKER_05  But suddenly, I would come home.\n[662.813 - 663.656] SPEAKER_05 My brother wouldn\'t be home.\n[663.696 - 665.822] SPEAKER_05 He\'s from high school, and he had things after school.\n[665.862 - 666.724] SPEAKER_05 And I\'d turn on the radio.\n[666.744 - 667.466] SPEAKER_05 I\'d turn on the radio.\n[675.538 - 679.241] SPEAKER_05  You believe in magic, in a young girl\'s heart.\n[679.301 - 682.583] SPEAKER_05 How the music can free her whenever it starts.\n[682.664 - 685.886] SPEAKER_05 And it\'s magic if the music is groovy.\n[686.106 - 689.169] SPEAKER_05 It makes you feel happy like an old time movie.\n[689.469 - 692.151] SPEAKER_05 I tell you about the magic and free your soul.\n[692.171 - 696.955] SPEAKER_05 It\'s like trying to tell a stranger about rock and roll.\n[697.115 - 698.136] SPEAKER_05 Oh, man.\n[699.376 - 702.179] SPEAKER_05 Just walk away, Renee.\n[704.1 - 707.102] SPEAKER_05  I would come home every day and I would turn on a radio.\n[707.302 - 711.885] SPEAKER_05 And the thing about it is, if you think about it, and this is the way radio was for us, because I didn\'t have a record player.\n[712.105 - 714.446] SPEAKER_05 I didn\'t have any way to own my music.\n[714.686 - 718.289] SPEAKER_05 I was completely dependent on somebody else\'s whims.\n[718.749 - 722.972] SPEAKER_05 And I would come home and hope that they turned, played the song that I wanted to hear.\n[723.792 - 727.874] SPEAKER_05  And in Indianapolis, there were a couple radio stations that played popular music.\n[728.594 - 731.195] SPEAKER_05 WFBM, Wolf Boom Radio, was for my parents.\n[731.675 - 735.056] SPEAKER_05 But they had, WIFE was the pop radio station.\n[735.456 - 737.137] SPEAKER_05 And I would look for other radio stations.\n[737.557 - 739.038] SPEAKER_05 And then I would listen at night.\n[739.96 - 741.301] SPEAKER_05  when my brother wasn\'t there.\n[741.941 - 744.623] SPEAKER_05 And radio stations are like stars.\n[745.664 - 751.408] SPEAKER_05 They come out at night, and suddenly you\'re hearing stations from so far away.\n[751.768 - 752.628] SPEAKER_05 You can\'t believe it.\n[752.909 - 761.614] SPEAKER_05 And one day, one night, evening, my brother was out, I don\'t know, and I came across this station, and I right knew it was like crossing a boundary.\n[762.215 - 764.156] SPEAKER_05 It was an exotic station.\n[764.616 - 766.398] SPEAKER_05 It was from another country.\n[767.518 - 769.5] SPEAKER_05 C-K-L-W.\n[770.48 - 771.821] SPEAKER_05  Windsor, Ontario.\n[774.242 - 775.863] SPEAKER_05 But that\'s not what it really was.\n[776.044 - 777.965] SPEAKER_05 It was the sound of Motown.\n[778.205 - 781.547] SPEAKER_05 Devil with the blue dress, blue dress, blue dress.\n[781.647 - 783.808] SPEAKER_05 Devil with the blue dress song.\n[785.009 - 787.35] SPEAKER_05 Devil with the blue dress, blue dress.\n[787.39 - 789.331] SPEAKER_05 Mitch Ryder and the Detroit Wheels.\n[789.711 - 790.952] SPEAKER_05 But that was not all.\n[791.012 - 795.635] SPEAKER_05 No, but that was the white guy singing, you know, him and Bob Seger and those guys.\n[795.675 - 797.356] SPEAKER_05 But it was really about this.\n[801.778 - 807.679] SPEAKER_02  I got sunshine on a cloudy day.\n[810.84 - 815.921] SPEAKER_05 When it\'s cold outside, I got the month of May.\n[816.582 - 817.062] SPEAKER_05 Go ahead.\n[817.482 - 821.183] SPEAKER_05 Here we go.\n[821.203 - 828.905] SPEAKER_02 I guess you say, what can make me feel this way?\n[829.485 - 830.145] SPEAKER_05 My girl.\n[832.617 - 836.02] SPEAKER_05  I\'m talking about my girl.\n[841.424 - 846.489] SPEAKER_05 R, R, R, R, Levi Stubbs.\n[846.949 - 848.871] SPEAKER_05 Levi Stubbs and four tobs.\n[859.704 - 862.825] SPEAKER_02  Another day, another night.\n[864.905 - 867.106] SPEAKER_02 I long to hold you tight.\n[869.586 - 874.027] SPEAKER_02 I\'m so lonely.\n[874.087 - 877.408] SPEAKER_02 Baby, I need your loving.\n[878.088 - 884.39] SPEAKER_05 Got to have all your, oh man, how could they sing like that?\n[888.018 - 889.079] SPEAKER_05  It was incredible.\n[889.34 - 890.561] SPEAKER_05 And then one day I came home.\n[890.621 - 891.422] SPEAKER_05 My brother wasn\'t there.\n[891.462 - 896.408] SPEAKER_05 I turned on that station and I heard a song and I fell in love with it immediately.\n[896.709 - 901.074] SPEAKER_05 And I consider it the greatest top 40 pop song ever written.\n[908.562 - 932.967] SPEAKER_05  Do you build me up Buttercup baby just to let me down Mess me around and then worst of all You never call baby when you say you will I love you still I need you More than anyone darling you know that I have from the start Build me up Buttercup don\'t break my heart\n[934.54 - 937.541] SPEAKER_01  Tell me time and again you\'ll be over at 10.\n[937.601 - 938.482] SPEAKER_01 But you\'re late.\n[939.222 - 942.383] SPEAKER_01 I wait around and then I go to the door.\n[942.403 - 943.844] SPEAKER_05 I can\'t wait anymore.\n[943.904 - 944.744] SPEAKER_05 It\'s not you.\n[945.465 - 946.745] SPEAKER_05 You let me down again.\n[946.765 - 949.546] SPEAKER_05 Hey, hey, hey, baby, baby, try to.\n[949.706 - 953.988] SPEAKER_05 Oh, man, I love that song.\n[955.849 - 957.189] SPEAKER_05 And it is a little goofy.\n[957.209 - 960.411] SPEAKER_05 I\'m like, the word buttercup immediately makes it suspect.\n[962.79 - 966.775] SPEAKER_05  But it is a great song, and it\'s great for a whole lot of reasons.\n[966.815 - 971.201] SPEAKER_05 The first reason it\'s great is because it immediately breaks the rule.\n[972.486 - 973.687] SPEAKER_05  Good things follow the rules.\n[973.747 - 974.668] SPEAKER_05 Great things break them.\n[974.688 - 981.914] SPEAKER_05 And the thing about this rule, you know, a song is like a story that builds, right?\n[982.194 - 993.003] SPEAKER_05 And you start someplace, and then you go up, and there\'s a sense of a climax somewhere, you know, in the second verse or in the bridge or going into the final verse or the final chorus, you know?\n[993.723 - 998.527] SPEAKER_05 And this song, that\'s usually so like you sing the verse...\n[999.588 - 1014.7] SPEAKER_05  and the chorus were introducing the melody and then the second verse in the chorus, the the singer might leave the melody and then we get to the bridge and suddenly they\'re just going up and up and somewhere up there is the highest note in the song, not in this one.\n[1016.142 - 1019.364] SPEAKER_05 This song, the highest note is the first note.\n[1020.625 - 1023.768] SPEAKER_05 And, you know, because you can\'t sing it.\n[1027.853 - 1029.253] SPEAKER_05  Now, we\'re singing it today.\n[1029.914 - 1031.934] SPEAKER_05 I\'m singing it in F. Why do you?\n[1031.954 - 1032.975] SPEAKER_05 That\'s an F, okay?\n[1033.235 - 1035.835] SPEAKER_05 But they didn\'t sing it in F. Why?\n[1035.895 - 1038.236] SPEAKER_05 They didn\'t sing it in G. Why?\n[1038.276 - 1039.657] SPEAKER_05 They didn\'t sing it in A-flat.\n[1039.897 - 1040.377] SPEAKER_05 Why?\n[1040.417 - 1042.618] SPEAKER_05 They didn\'t sing it in A. Why?\n[1042.658 - 1044.298] SPEAKER_05 They didn\'t sing it in B-flat.\n[1044.458 - 1044.918] SPEAKER_05 Why?\n[1044.958 - 1047.259] SPEAKER_05 They didn\'t sing it in B. Why?\n[1047.539 - 1050.78] SPEAKER_05 They sing it in C. Why do you?\n[1052.461 - 1055.402] SPEAKER_01 And actually, I can\'t believe I got up there.\n[1055.422 - 1056.762] SPEAKER_01 I don\'t think I\'ve ever done that before.\n[1059.048 - 1063.99] SPEAKER_05  That is a high C, and even tenors, true tenors, have a hard time getting up there.\n[1065.57 - 1067.171] SPEAKER_05 So the guy\'s voice breaks.\n[1068.331 - 1069.831] SPEAKER_05 You hear, what do you write?\n[1069.871 - 1071.692] SPEAKER_05 And you\'ve done that, right?\n[1072.632 - 1077.553] SPEAKER_05 They want that voice to break because this song is about the expression of emotion.\n[1077.593 - 1079.754] SPEAKER_05 This is a song of unrequited love.\n[1081.516 - 1083.798] SPEAKER_05  Tell me time and again you\'ll be over at 10.\n[1083.878 - 1084.439] SPEAKER_05 You\'re late.\n[1084.499 - 1085.44] SPEAKER_05 I wait around in there.\n[1085.74 - 1087.081] SPEAKER_05 Baby, baby.\n[1087.562 - 1091.205] SPEAKER_05 And so they want the expression of emotion.\n[1092.186 - 1095.589] SPEAKER_05 In Motown, I was reading a book about Barry Gordy and Motown.\n[1095.629 - 1099.793] SPEAKER_05 Barry Gordy was the president and the producer of a lot of the songs along with Smokey Robinson.\n[1100.593 - 1109.598] SPEAKER_05  And they said they would rehearse those vocal groups, the Tops and the Four Tops and the Temptations, with the Funk Brothers.\n[1109.638 - 1111.899] SPEAKER_05 The Funk Brothers was the rhythm section.\n[1112.85 - 1115.151] SPEAKER_05  And they played on all the Motown hits.\n[1115.471 - 1120.974] SPEAKER_05 There\'s a great, great documentary, Standing in the Shadows of Motown, which you have to watch.\n[1121.234 - 1124.575] SPEAKER_05 And James Jamerson was the bass player for every song.\n[1124.855 - 1126.496] SPEAKER_05 And he played with one finger.\n[1126.556 - 1127.837] SPEAKER_05 He called it the hook.\n[1128.397 - 1132.379] SPEAKER_05 And sometimes, he would record his part, and then they would just build the song.\n[1132.499 - 1135.26] SPEAKER_05 After they found his part, they would just build the song around it.\n[1135.52 - 1136.981] SPEAKER_05 It was a very active bass.\n[1137.461 - 1142.342] SPEAKER_05  There\'s a story in that documentary that we\'re recording, What\'s Going On, by Marvin Gaye.\n[1142.963 - 1144.283] SPEAKER_05 And Jamerson wasn\'t there.\n[1144.303 - 1145.823] SPEAKER_05 And they said, we have to find Jamerson.\n[1145.843 - 1149.424] SPEAKER_05 And they found him in a bar, like three sheets to the wind.\n[1149.784 - 1150.605] SPEAKER_05 And they brought him in.\n[1150.625 - 1151.885] SPEAKER_05 He says, I cannot do this.\n[1151.905 - 1152.805] SPEAKER_05 It was like 2 o\'clock at night.\n[1152.825 - 1153.165] SPEAKER_05 They do.\n[1153.185 - 1155.026] SPEAKER_05 And he said, and first he sat down.\n[1155.526 - 1156.386] SPEAKER_05 And he said, I can\'t do it.\n[1156.406 - 1157.867] SPEAKER_05 And he said, do you mind if I lie down?\n[1157.907 - 1163.008] SPEAKER_05 And he laid down on the studio floor and played the bass line to What\'s Going On.\n[1167.062 - 1168.663] SPEAKER_05  But that group was really tight.\n[1168.723 - 1169.944] SPEAKER_05 The Funk Brothers were really tight.\n[1169.984 - 1177.73] SPEAKER_05 But anyway, they said they would reverse the singing group with the Funk Brothers, and then they would go out to get some water.\n[1178.351 - 1184.636] SPEAKER_05 And Gordy, or the producer, would say, I want you to play that song when we record it a step and a half higher.\n[1186.778 - 1191.081] SPEAKER_05 So instead of, I know you\'re going to leave me.\n[1191.121 - 1191.401] SPEAKER_05 That\'s no.\n[1192.062 - 1195.364] SPEAKER_05 They\'re like, I know you\'re going to.\n[1195.444 - 1195.664] SPEAKER_05 No.\n[1197.725 - 1198.065] SPEAKER_05  No!\n[1198.165 - 1198.906] SPEAKER_05 OK, that\'s good.\n[1198.926 - 1203.489] SPEAKER_05 Because they wanted that breaking of emotion.\n[1204.21 - 1210.234] SPEAKER_05 Now this song, I want to just take a minute and explain to you, because sometimes we hear a song which is really great, but why is it a great song?\n[1210.275 - 1211.075] SPEAKER_05 And I\'ve thought about this.\n[1211.115 - 1212.096] SPEAKER_05 I want to explain.\n[1212.156 - 1214.598] SPEAKER_05 First of all, it\'s a great song because of that.\n[1214.918 - 1215.699] SPEAKER_05 It breaks the rule, right?\n[1215.799 - 1216.96] SPEAKER_05 And it\'s the hook.\n[1217.6 - 1218.401] SPEAKER_05 What do you?\n[1218.521 - 1219.602] SPEAKER_05 Everybody knows that, right?\n[1220.322 - 1225.684] SPEAKER_05  And the second thing about this song is that it follows a traditional rule for writing a hit.\n[1226.104 - 1228.745] SPEAKER_05 I was watching something by Dave Grohl from the Flu Fighters.\n[1228.765 - 1229.786] SPEAKER_05 He said, here\'s how you write a hit.\n[1230.026 - 1231.546] SPEAKER_05 First of all, it\'s a bumper sticker.\n[1233.187 - 1234.347] SPEAKER_05 You\'ve got to have a bumper sticker.\n[1234.367 - 1235.628] SPEAKER_05 The song has to be a bumper sticker.\n[1235.788 - 1239.169] SPEAKER_05 You find the line that\'s a bumper sticker, that\'s the name of the song, and that\'s the line you sing.\n[1239.529 - 1241.33] SPEAKER_05 Second thing is, you sing the chorus first.\n[1243.285 - 1244.346] SPEAKER_05  Think about all the Beatles songs.\n[1244.426 - 1245.846] SPEAKER_05 Help, I need somebody.\n[1247.447 - 1250.689] SPEAKER_05 I want to hold your, it\'s just like one, you do the chorus first.\n[1250.909 - 1259.353] SPEAKER_01 He said, Grohl says, you do the chorus and you sing the chorus again, then you do a verse, then you do another pre-chorus, and you do another chorus, and another chorus, and then you do a bridge, and then you do a chorus, and a chorus.\n[1262.929 - 1264.03] SPEAKER_05  So it does that.\n[1264.39 - 1274.278] SPEAKER_05 But the other thing is, one of the things that\'s interesting about the song is the structure of the song and the harmonics of the song fight against the angst.\n[1275.259 - 1279.462] SPEAKER_05 They fight against this feeling of unrequited love.\n[1279.822 - 1282.064] SPEAKER_05 The first thing that you hear is the bass line.\n[1282.284 - 1286.187] SPEAKER_05 The bass line is played by the piano, and then the bass comes in.\n[1286.207 - 1286.668] SPEAKER_05 It\'s like...\n[1297.462 - 1300.756] SPEAKER_05  Now there\'s something really interesting about that, which is that bass line swings.\n[1301.795 - 1302.135] SPEAKER_05  Okay?\n[1302.416 - 1304.017] SPEAKER_05 And that\'s actually, it\'s a musical term.\n[1304.057 - 1309.342] SPEAKER_03 Like, swinging is, straight is, bum, bum, bum, bum, bum, bum, bum, bum.\n[1309.402 - 1312.504] SPEAKER_03 Swing is bum, ba-bum, bum, ba-bum.\n[1312.845 - 1315.607] SPEAKER_05 And musicians are always talking about, should we swing this a little harder?\n[1315.627 - 1316.688] SPEAKER_05 Should we sing it a little less?\n[1316.748 - 1317.569] SPEAKER_05 Let\'s do it straight.\n[1317.869 - 1319.01] SPEAKER_05 And it swings right away.\n[1319.39 - 1322.793] SPEAKER_05 Swing is kind of jaunty and a little upbeat.\n[1322.833 - 1327.438] SPEAKER_05 So right away, we\'ve got something working against what the singer is going to sing.\n[1328.158 - 1334.465] SPEAKER_05  The bass player comes in, and also right away, on the first backbeat, the tambourine player is there.\n[1335.086 - 1338.209] SPEAKER_05 They put him over in the corner of the room, and he\'s playing.\n[1338.55 - 1340.131] SPEAKER_05 This song was recorded live.\n[1340.151 - 1342.294] SPEAKER_05 It was recorded direct to four-track.\n[1343.626 - 1349.31] SPEAKER_05  And so everybody was in the room playing at the same time, which musicians hardly ever do anymore.\n[1349.931 - 1360.418] SPEAKER_05 They play to a click track and they follow the click track and they might play in different, now the way we\'re doing it, they might play in different parts of the country at different times of the day and put their parts on.\n[1360.638 - 1362.339] SPEAKER_05 But this is record and you can hear it.\n[1362.6 - 1364.101] SPEAKER_05 The whole thing is kind of loose.\n[1364.541 - 1367.403] SPEAKER_05 If you track the beats per minute, it goes up and down.\n[1367.463 - 1369.925] SPEAKER_05 It wanders because it\'s breathing.\n[1370.265 - 1372.927] SPEAKER_05  And the backbeat, the tambourine comes in on the backbeat.\n[1372.967 - 1377.249] SPEAKER_05 Now the backbeat, just to make clear, you understand, there\'s four beats in measure.\n[1377.409 - 1379.49] SPEAKER_05 The backbeats are the two and the four.\n[1380.611 - 1382.172] SPEAKER_05 That\'s where the snare belongs.\n[1382.552 - 1387.075] SPEAKER_05 The kick is on the one and the three, and the snare is on the two and the four.\n[1392.284 - 1393.765] SPEAKER_05  That\'s the snare, all right?\n[1394.286 - 1397.428] SPEAKER_05 But here it starts off with the tambourine over there in the corner.\n[1397.468 - 1398.308] SPEAKER_05 Just stay over there.\n[1398.328 - 1400.49] SPEAKER_05 It\'s kind of like the village idiot just hitting the tambourine.\n[1406.988 - 1409.229] SPEAKER_05  And the piano comes in outlining the melody.\n[1409.269 - 1411.409] SPEAKER_05 This chord structure is the melody.\n[1412.17 - 1413.99] SPEAKER_05 It\'s the chord of the chorus.\n[1418.031 - 1427.274] SPEAKER_05 The other thing that\'s going on in this, which belies where this song is being recorded, is at the end of every other backbeat, there\'s a conga going.\n[1427.294 - 1430.495] SPEAKER_05 They\'ve got conga players going.\n[1430.655 - 1430.835] SPEAKER_05 Oh, OK.\n[1436.653 - 1440.555] SPEAKER_05  They\'re Caribbean conga players.\n[1440.956 - 1442.317] SPEAKER_05 This song was not recorded.\n[1442.377 - 1444.358] SPEAKER_05 They were trying to make a Motown song.\n[1444.798 - 1447.8] SPEAKER_05 They were not as tight a band as the Funk Brothers.\n[1447.82 - 1449.281] SPEAKER_05 It was recorded in England.\n[1450.282 - 1451.682] SPEAKER_05 It was a mixed race band.\n[1452.303 - 1455.405] SPEAKER_05 And most of the musicians were from the Caribbean.\n[1455.805 - 1458.347] SPEAKER_05  They\'re from Trinidad and Curacao.\n[1458.587 - 1461.149] SPEAKER_05 And so we\'ve got this conga thing going underneath.\n[1461.409 - 1467.054] SPEAKER_05 So already before anybody\'s sung, we\'ve got this unbelievable melange of all these different things.\n[1467.714 - 1471.978] SPEAKER_05 And then the song itself, the choral structure is very interesting.\n[1472.538 - 1477.282] SPEAKER_05 The song was written by the lead singer of the Manfred Mann Band.\n[1478.453 - 1479.994] SPEAKER_05  Okay, which is a very poppy.\n[1480.034 - 1486.478] SPEAKER_05 It\'s like, I mean, imagine if Herman\'s Hermit sang this song, what it would sound like.\n[1486.859 - 1488.74] SPEAKER_05 But it\'s a totally different song.\n[1488.92 - 1491.662] SPEAKER_05 It\'s a feel because of the lead singer is black.\n[1491.682 - 1494.024] SPEAKER_05 It\'s from the Caribbean, and the players are black.\n[1496.926 - 1499.407] SPEAKER_05 Right there, that\'s an interesting chord.\n[1499.988 - 1501.389] SPEAKER_05 It\'s not in the key.\n[1502.169 - 1503.41] SPEAKER_05 It\'s the third major.\n[1503.43 - 1504.391] SPEAKER_05 Da-da-da-da.\n[1507.055 - 1508.176] SPEAKER_05  And it changes the tune.\n[1508.296 - 1509.416] SPEAKER_05 It lifts it somehow.\n[1509.776 - 1524.062] SPEAKER_05 If you\'re going to sing it in minor, so it\'s... If I was just going to do the minor of that, which is what belonged in the key... Oh, right?\n[1524.902 - 1525.702] SPEAKER_05 That\'s sadder.\n[1525.742 - 1526.743] SPEAKER_05 It\'s a minor chord, but...\n[1527.992 - 1528.893] SPEAKER_05  So there\'s this lift.\n[1528.953 - 1532.536] SPEAKER_05 So once again, it\'s fighting against this thing.\n[1532.936 - 1539.901] SPEAKER_05 So the other thing is a piano, you can hear the Caribbean influence because when you listen to the verses, if you listen, you hear the piano players going.\n[1544.345 - 1545.005] SPEAKER_05 What\'s that sound like?\n[1545.025 - 1546.687] SPEAKER_05 It\'s reggae.\n[1546.727 - 1549.329] SPEAKER_05 It\'s actually probably either rock steady or ska.\n[1549.569 - 1551.37] SPEAKER_05 Reggae was going to come along a year or two later.\n[1551.891 - 1552.611] SPEAKER_05 Reggae would have been...\n[1558.436 - 1558.636] SPEAKER_05  Right?\n[1560.097 - 1560.438] SPEAKER_05 Okay?\n[1560.758 - 1563.06] SPEAKER_05 So you\'ve got this backbeat, all this stuff going on.\n[1563.08 - 1567.823] SPEAKER_05 And the singer is singing this unrequited love, and his voice is breaking.\n[1568.003 - 1572.106] SPEAKER_05 But the best part, and you know, the best part of this whole thing is the backup singers.\n[1573.508 - 1577.711] SPEAKER_05 It\'s the backup singers that give us permission to sing along.\n[1578.131 - 1581.474] SPEAKER_05 Because honest to God, they\'re not that good.\n[1585.08 - 1588.504] SPEAKER_05  And here I am giving you permission.\n[1588.524 - 1591.266] SPEAKER_05 All right?\n[1591.366 - 1592.728] SPEAKER_05 I don\'t know who it was.\n[1593.408 - 1594.99] SPEAKER_05 Maybe it was the musicians.\n[1595.531 - 1597.773] SPEAKER_05 I was just in the reco',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transcription_srt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_addresses`
--

DROP TABLE IF EXISTS `user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_addresses` (
  `user_address_id` int NOT NULL,
  `street_address_1` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `street_address_2` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `city` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `country` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `regional_division` varchar(85) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `primary_address` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`user_address_id`),
  KEY `user_addresses_user_id_idx` (`user_id`),
  CONSTRAINT `user_addresses_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_addresses`
--

LOCK TABLES `user_addresses` WRITE;
/*!40000 ALTER TABLE `user_addresses` DISABLE KEYS */;
INSERT INTO `user_addresses` VALUES (1,'1234 Street Rd',NULL,'CityVille','USA','South','123 Street Rd',1),(50,'Blah',NULL,NULL,NULL,NULL,NULL,1),(510,'Blah',NULL,NULL,NULL,NULL,NULL,1),(511,'Blah',NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_genders`
--

DROP TABLE IF EXISTS `user_genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_genders` (
  `user_gender_id` int NOT NULL,
  `gender` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`user_gender_id`),
  KEY `id_idx` (`user_id`),
  CONSTRAINT `user_genders_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_genders`
--

LOCK TABLES `user_genders` WRITE;
/*!40000 ALTER TABLE `user_genders` DISABLE KEYS */;
INSERT INTO `user_genders` VALUES (1,'Male','1000-01-01 00:00:00','9999-12-31 23:59:59',1);
/*!40000 ALTER TABLE `user_genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_name`
--

DROP TABLE IF EXISTS `user_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_name` (
  `user_name_id` int NOT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `middle_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `honorifics` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `qualifiers` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`user_name_id`),
  KEY `fk_user_name_users1_idx` (`users_id`),
  CONSTRAINT `fk_user_name_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_name`
--

LOCK TABLES `user_name` WRITE;
/*!40000 ALTER TABLE `user_name` DISABLE KEYS */;
INSERT INTO `user_name` VALUES (1,'Motoko','L','Kusanagi','','','1000-01-01 00:00:00','9999-12-31 23:59:59',1);
/*!40000 ALTER TABLE `user_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_phone_numbers`
--

DROP TABLE IF EXISTS `user_phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_phone_numbers` (
  `user_phone_number_id` int NOT NULL,
  `country_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_primary_phone` bit(1) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`user_phone_number_id`),
  KEY `user_phone_number_user_id_idx` (`user_id`),
  CONSTRAINT `user_phone_number_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_phone_numbers`
--

LOCK TABLES `user_phone_numbers` WRITE;
/*!40000 ALTER TABLE `user_phone_numbers` DISABLE KEYS */;
INSERT INTO `user_phone_numbers` VALUES (1,NULL,NULL,'8653565175',1);
/*!40000 ALTER TABLE `user_phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` int NOT NULL,
  `user_role_id` int NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `id_idx` (`user_id`),
  KEY `id_idx_user_roles` (`user_id`),
  KEY `user_roles_role_id_idx` (`role_id`),
  CONSTRAINT `user_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `role_type` (`role_type_id`),
  CONSTRAINT `user_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,NULL,NULL,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_login` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_nicename` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_registered` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `id` int NOT NULL,
  `user_activation_key` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_status` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `display_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Motoko123','password','Motoko','Motoko@page','true',1,'12345','good','Motoko'),(NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,'JaneDoeTheDoe');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


DROP TABLE IF EXISTS `upload_status`;

CREATE TABLE `upload_status` (
                                 `Id` int NOT NULL AUTO_INCREMENT,
                                 `Progress` int DEFAULT NULL,
                                 `Status` varchar(255) DEFAULT NULL,
                                 `Last_Updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                 `FileName` varchar(255) DEFAULT NULL,
                                 PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20  0:12:38
