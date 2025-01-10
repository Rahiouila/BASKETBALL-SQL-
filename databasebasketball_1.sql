-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: databasebasketball
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Temporary view structure for view `besteuropeanfinalplayers`
--

DROP TABLE IF EXISTS `besteuropeanfinalplayers`;
/*!50001 DROP VIEW IF EXISTS `besteuropeanfinalplayers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `besteuropeanfinalplayers` AS SELECT 
 1 AS `Player_ID`,
 1 AS `Name`,
 1 AS `Competition_Type`,
 1 AS `Season`,
 1 AS `FreeThrows_Percentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `Club_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `League` varchar(255) DEFAULT NULL,
  `Sponsor_ID` int DEFAULT NULL,
  PRIMARY KEY (`Club_ID`),
  KEY `Sponsor_ID` (`Sponsor_ID`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`Sponsor_ID`) REFERENCES `sponsor` (`Sponsor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club_competition`
--

DROP TABLE IF EXISTS `club_competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club_competition` (
  `Competition_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Season` int DEFAULT NULL,
  `Winner` int DEFAULT NULL,
  PRIMARY KEY (`Competition_ID`),
  KEY `Winner` (`Winner`),
  CONSTRAINT `club_competition_ibfk_1` FOREIGN KEY (`Winner`) REFERENCES `club` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `clubswithmorethan3euroleaguewins`
--

DROP TABLE IF EXISTS `clubswithmorethan3euroleaguewins`;
/*!50001 DROP VIEW IF EXISTS `clubswithmorethan3euroleaguewins`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clubswithmorethan3euroleaguewins` AS SELECT 
 1 AS `Club_ID`,
 1 AS `ClubName`,
 1 AS `EuroleagueWins`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `clubwithtallestplayers`
--

DROP TABLE IF EXISTS `clubwithtallestplayers`;
/*!50001 DROP VIEW IF EXISTS `clubwithtallestplayers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clubwithtallestplayers` AS SELECT 
 1 AS `Club_ID`,
 1 AS `ClubName`,
 1 AS `AvgHeight`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `game_club`
--

DROP TABLE IF EXISTS `game_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_club` (
  `Game_ID` int NOT NULL,
  `Season` int DEFAULT NULL,
  `Competition_Type` varchar(255) DEFAULT NULL,
  `Team_1_ID` int DEFAULT NULL,
  `Team_2_ID` int DEFAULT NULL,
  `Score_Team_1` int DEFAULT NULL,
  `Score_Team_2` int DEFAULT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `Team_1_ID` (`Team_1_ID`),
  KEY `Team_2_ID` (`Team_2_ID`),
  CONSTRAINT `game_club_ibfk_1` FOREIGN KEY (`Team_1_ID`) REFERENCES `club` (`Club_ID`),
  CONSTRAINT `game_club_ibfk_2` FOREIGN KEY (`Team_2_ID`) REFERENCES `club` (`Club_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_international`
--

DROP TABLE IF EXISTS `game_international`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_international` (
  `Game_ID` int NOT NULL,
  `Season` int DEFAULT NULL,
  `Competition_Type` varchar(255) DEFAULT NULL,
  `Team_1_ID` int DEFAULT NULL,
  `Team_2_ID` int DEFAULT NULL,
  `Score_Team_1` int DEFAULT NULL,
  `Score_Team_2` int DEFAULT NULL,
  PRIMARY KEY (`Game_ID`),
  KEY `Team_1_ID` (`Team_1_ID`),
  KEY `Team_2_ID` (`Team_2_ID`),
  CONSTRAINT `game_international_ibfk_1` FOREIGN KEY (`Team_1_ID`) REFERENCES `national_team` (`National_Team_ID`),
  CONSTRAINT `game_international_ibfk_2` FOREIGN KEY (`Team_2_ID`) REFERENCES `national_team` (`National_Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `international_competition`
--

DROP TABLE IF EXISTS `international_competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `international_competition` (
  `Competition_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Season` int DEFAULT NULL,
  `Winner` int DEFAULT NULL,
  PRIMARY KEY (`Competition_ID`),
  KEY `Winner` (`Winner`),
  CONSTRAINT `international_competition_ibfk_1` FOREIGN KEY (`Winner`) REFERENCES `national_team` (`National_Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `national_team`
--

DROP TABLE IF EXISTS `national_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `national_team` (
  `National_Team_ID` int NOT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Competition` varchar(255) DEFAULT NULL,
  `Sponsor_ID` int DEFAULT NULL,
  PRIMARY KEY (`National_Team_ID`),
  KEY `Sponsor_ID` (`Sponsor_ID`),
  CONSTRAINT `national_team_ibfk_1` FOREIGN KEY (`Sponsor_ID`) REFERENCES `sponsor` (`Sponsor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Player_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Birth_Date` date DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `Citizenship` varchar(255) DEFAULT NULL,
  `Club_ID` int DEFAULT NULL,
  `National_Team_ID` int DEFAULT NULL,
  PRIMARY KEY (`Player_ID`),
  KEY `Club_ID` (`Club_ID`),
  KEY `National_Team_ID` (`National_Team_ID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `club` (`Club_ID`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`National_Team_ID`) REFERENCES `national_team` (`National_Team_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `playerstatscurrentseason`
--

DROP TABLE IF EXISTS `playerstatscurrentseason`;
/*!50001 DROP VIEW IF EXISTS `playerstatscurrentseason`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `playerstatscurrentseason` AS SELECT 
 1 AS `Player_ID`,
 1 AS `Name`,
 1 AS `Total3Points`,
 1 AS `Total2Points`,
 1 AS `TotalFreeThrows`,
 1 AS `AvgFreeThrowPercentage`,
 1 AS `TotalAssists`,
 1 AS `TotalRebounds`,
 1 AS `TotalBlocks`,
 1 AS `TotalFouls`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `Sponsor_ID` int NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Amount` bigint DEFAULT NULL,
  PRIMARY KEY (`Sponsor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistic` (
  `Stat_ID` int NOT NULL,
  `Player_ID` int DEFAULT NULL,
  `Game_ID_Club` int DEFAULT NULL,
  `Game_ID_International` int DEFAULT NULL,
  `Number_of_3_Points` int DEFAULT NULL,
  `Number_of_2_Points` int DEFAULT NULL,
  `FreeThrows` int DEFAULT NULL,
  `FreeThrows_Percentage` decimal(5,2) DEFAULT NULL,
  `Assists` int DEFAULT NULL,
  `Rebounds` int DEFAULT NULL,
  `Blocks` int DEFAULT NULL,
  `Fouls` int DEFAULT NULL,
  PRIMARY KEY (`Stat_ID`),
  KEY `Player_ID` (`Player_ID`),
  KEY `Game_ID_Club` (`Game_ID_Club`),
  KEY `Game_ID_International` (`Game_ID_International`),
  CONSTRAINT `statistic_ibfk_1` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`Player_ID`),
  CONSTRAINT `statistic_ibfk_2` FOREIGN KEY (`Game_ID_Club`) REFERENCES `game_club` (`Game_ID`),
  CONSTRAINT `statistic_ibfk_3` FOREIGN KEY (`Game_ID_International`) REFERENCES `game_international` (`Game_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `top10nationalplayers`
--

DROP TABLE IF EXISTS `top10nationalplayers`;
/*!50001 DROP VIEW IF EXISTS `top10nationalplayers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top10nationalplayers` AS SELECT 
 1 AS `Player_ID`,
 1 AS `Name`,
 1 AS `TotalPoints`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `topassistsbyplayer`
--

DROP TABLE IF EXISTS `topassistsbyplayer`;
/*!50001 DROP VIEW IF EXISTS `topassistsbyplayer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topassistsbyplayer` AS SELECT 
 1 AS `Player_ID`,
 1 AS `Name`,
 1 AS `Assists`,
 1 AS `ClubName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `topsponsornationalteams`
--

DROP TABLE IF EXISTS `topsponsornationalteams`;
/*!50001 DROP VIEW IF EXISTS `topsponsornationalteams`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `topsponsornationalteams` AS SELECT 
 1 AS `Sponsor_ID`,
 1 AS `SponsorName`,
 1 AS `NationalTeamsSponsored`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'databasebasketball'
--
/*!50003 DROP FUNCTION IF EXISTS `BestNationalPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `BestNationalPlayer`(team_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE best_player_id INT;
    SELECT 
        Player_ID
    INTO 
        best_player_id
    FROM 
        Player p
    JOIN 
        Statistic s ON p.Player_ID = s.Player_ID
    WHERE 
        p.National_Team_ID = team_id
    GROUP BY 
        Player_ID
    ORDER BY 
        SUM(Number_of_3_Points + Number_of_2_Points + FreeThrows) DESC
    LIMIT 1;
    RETURN IFNULL(best_player_id, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `BestPlayerByAssists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `BestPlayerByAssists`(club_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE best_player_id INT;
    SELECT 
        Player_ID
    INTO 
        best_player_id
    FROM 
        Player p
    JOIN 
        Statistic s ON p.Player_ID = s.Player_ID
    WHERE 
        p.Club_ID = club_id
    ORDER BY 
        s.Assists DESC
    LIMIT 1;
    RETURN IFNULL(best_player_id, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ClubWithTallestPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ClubWithTallestPlayers`() RETURNS int
    READS SQL DATA
BEGIN
    DECLARE tallest_club_id INT;
    SELECT 
        Club_ID
    INTO 
        tallest_club_id
    FROM 
        Club c
    JOIN 
        Player p ON c.Club_ID = p.Club_ID
    GROUP BY 
        c.Club_ID
    ORDER BY 
        AVG(p.Height) DESC
    LIMIT 1;
    RETURN IFNULL(tallest_club_id, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `EuroleagueWinsByClub` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `EuroleagueWinsByClub`(club_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total_wins INT;
    SELECT 
        COUNT(*)
    INTO 
        total_wins
    FROM 
        Club_Competition
    WHERE 
        Winner = club_id 
        AND Name = 'Euroleague';
    RETURN IFNULL(total_wins, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TopSponsorNationalTeams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TopSponsorNationalTeams`() RETURNS int
    READS SQL DATA
BEGIN
    DECLARE top_sponsor_id INT;
    SELECT 
        s.Sponsor_ID
    INTO 
        top_sponsor_id
    FROM 
        Sponsor s
    JOIN 
        National_Team nt ON s.Sponsor_ID = nt.Sponsor_ID
    JOIN 
        International_Competition ic ON nt.National_Team_ID = ic.Winner
    GROUP BY 
        s.Sponsor_ID
    ORDER BY 
        COUNT(ic.Competition_ID) DESC
    LIMIT 1;
    RETURN IFNULL(top_sponsor_id, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalAssistsBySeason` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalAssistsBySeason`(season_year INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total_assists INT;
    SELECT 
        SUM(Assists)
    INTO 
        total_assists
    FROM 
        Statistic s
    JOIN 
        Game_Club g ON s.Game_ID_Club = g.Game_ID
    WHERE 
        g.Season = season_year;
    RETURN IFNULL(total_assists, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `TotalPointsByPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `TotalPointsByPlayer`(player_id INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE total_points INT;
    SELECT 
        SUM(Number_of_3_Points + Number_of_2_Points + FreeThrows) 
    INTO 
        total_points
    FROM 
        Statistic
    WHERE 
        Player_ID = player_id;
    RETURN IFNULL(total_points, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `besteuropeanfinalplayers`
--

/*!50001 DROP VIEW IF EXISTS `besteuropeanfinalplayers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `besteuropeanfinalplayers` AS select `p`.`Player_ID` AS `Player_ID`,`p`.`Name` AS `Name`,`g`.`Competition_Type` AS `Competition_Type`,`g`.`Season` AS `Season`,`s`.`FreeThrows_Percentage` AS `FreeThrows_Percentage` from ((`player` `p` join `statistic` `s` on((`p`.`Player_ID` = `s`.`Player_ID`))) join `game_international` `g` on((`s`.`Game_ID_International` = `g`.`Game_ID`))) where ((`g`.`Competition_Type` = 'European Championship') and (`g`.`Season` = 2022)) order by `s`.`FreeThrows_Percentage` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clubswithmorethan3euroleaguewins`
--

/*!50001 DROP VIEW IF EXISTS `clubswithmorethan3euroleaguewins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clubswithmorethan3euroleaguewins` AS select `c`.`Club_ID` AS `Club_ID`,`c`.`Name` AS `ClubName`,count(`cc`.`Competition_ID`) AS `EuroleagueWins` from (`club` `c` join `club_competition` `cc` on((`c`.`Club_ID` = `cc`.`Winner`))) where (`cc`.`Name` = 'Euroleague') group by `c`.`Club_ID`,`c`.`Name` having (`EuroleagueWins` > 3) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clubwithtallestplayers`
--

/*!50001 DROP VIEW IF EXISTS `clubwithtallestplayers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clubwithtallestplayers` AS select `c`.`Club_ID` AS `Club_ID`,`c`.`Name` AS `ClubName`,avg(`p`.`Height`) AS `AvgHeight` from (`club` `c` join `player` `p` on((`c`.`Club_ID` = `p`.`Club_ID`))) group by `c`.`Club_ID`,`c`.`Name` order by `AvgHeight` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `playerstatscurrentseason`
--

/*!50001 DROP VIEW IF EXISTS `playerstatscurrentseason`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `playerstatscurrentseason` AS select `p`.`Player_ID` AS `Player_ID`,`p`.`Name` AS `Name`,sum(`s`.`Number_of_3_Points`) AS `Total3Points`,sum(`s`.`Number_of_2_Points`) AS `Total2Points`,sum(`s`.`FreeThrows`) AS `TotalFreeThrows`,avg(`s`.`FreeThrows_Percentage`) AS `AvgFreeThrowPercentage`,sum(`s`.`Assists`) AS `TotalAssists`,sum(`s`.`Rebounds`) AS `TotalRebounds`,sum(`s`.`Blocks`) AS `TotalBlocks`,sum(`s`.`Fouls`) AS `TotalFouls` from ((`player` `p` join `statistic` `s` on((`p`.`Player_ID` = `s`.`Player_ID`))) join `game_club` `g` on((`s`.`Game_ID_Club` = `g`.`Game_ID`))) where (`g`.`Season` = year(curdate())) group by `p`.`Player_ID`,`p`.`Name` order by `Total3Points` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top10nationalplayers`
--

/*!50001 DROP VIEW IF EXISTS `top10nationalplayers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top10nationalplayers` AS select `p`.`Player_ID` AS `Player_ID`,`p`.`Name` AS `Name`,sum(((`s`.`Number_of_3_Points` + `s`.`Number_of_2_Points`) + `s`.`FreeThrows`)) AS `TotalPoints` from (`player` `p` join `statistic` `s` on((`p`.`Player_ID` = `s`.`Player_ID`))) where (`s`.`Game_ID_International` is not null) group by `p`.`Player_ID`,`p`.`Name` order by `TotalPoints` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topassistsbyplayer`
--

/*!50001 DROP VIEW IF EXISTS `topassistsbyplayer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topassistsbyplayer` AS select `p`.`Player_ID` AS `Player_ID`,`p`.`Name` AS `Name`,`s`.`Assists` AS `Assists`,`c`.`Name` AS `ClubName` from ((`player` `p` join `statistic` `s` on((`p`.`Player_ID` = `s`.`Player_ID`))) join `club` `c` on((`p`.`Club_ID` = `c`.`Club_ID`))) order by `s`.`Assists` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topsponsornationalteams`
--

/*!50001 DROP VIEW IF EXISTS `topsponsornationalteams`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topsponsornationalteams` AS select `s`.`Sponsor_ID` AS `Sponsor_ID`,`s`.`Name` AS `SponsorName`,count(`ic`.`Winner`) AS `NationalTeamsSponsored` from ((`sponsor` `s` join `national_team` `nt` on((`s`.`Sponsor_ID` = `nt`.`Sponsor_ID`))) join `international_competition` `ic` on((`nt`.`National_Team_ID` = `ic`.`Winner`))) group by `s`.`Sponsor_ID`,`s`.`Name` order by `NationalTeamsSponsored` desc limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 22:57:55
