-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2014 at 05:20 PM
-- Server version: 5.6.11
-- PHP Version: 5.5.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `states2014`
--
CREATE DATABASE IF NOT EXISTS `states2014` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `states2014`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `states2014_add_attraction`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_add_attraction`(IN `inAttractionName` VARCHAR(100), IN `inStateAbbreviation` CHAR(2), IN `inCityId` INT, IN `inAttractionLat` FLOAT(8), IN `inAttractionLong` FLOAT(8), IN `inAttractionImage` VARCHAR(150))
BEGIN
 INSERT INTO attraction(attraction_name, state_abbreviation, city_id, attraction_lat, attraction_long, attraction_image)
        VALUES (inAttractionName, inStateAbbreviation, inCityId, inAttractionLat, inAttractionLong, inAttractionImage);
END$$

DROP PROCEDURE IF EXISTS `states2014_add_city`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_add_city`(IN `inCityName` VARCHAR(100), IN `inStateAbbreviation` CHAR(2), IN `inCityLat` FLOAT(8), IN `inCityLong` FLOAT(8), IN `inCityImage` VARCHAR(150))
BEGIN
 INSERT INTO city (city_name, state_abbreviation, city_lat, city_long, city_image)
        VALUES (inCityName, inStateAbbreviation, inCityLat, inCityLong, inCityImage);
END$$

DROP PROCEDURE IF EXISTS `states2014_add_person`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_add_person`(IN `inPersonName` VARCHAR(100), IN `inStateAbbreviation` CHAR(2), IN `inPersonCategory` VARCHAR(50), IN `inPersonImage` VARCHAR(150), IN `inPersonStory` VARCHAR(150))
BEGIN
 INSERT INTO person(person_name, person_category, person_image, person_story)
        VALUES (inPersonName, inPersonCategory, inPersonImage, inPersonStory);
 INSERT INTO state_person (state_abbreviation,person_id)
        VALUES(inStateAbbreviation, LAST_INSERT_ID());
END$$

DROP PROCEDURE IF EXISTS `states2014_add_person_state`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_add_person_state`(IN `inPersonId` INT, IN `inStateAbbreviation` CHAR(2))
INSERT INTO state_person (state_abbreviation,person_id)
        VALUES(inStateAbbreviation, inPersonId)$$

DROP PROCEDURE IF EXISTS `states2014_add_state`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_add_state`(IN inStateAbbreviation TEXT, IN inStateName TEXT, IN inStateFlag TEXT,IN inStateImage TEXT,IN inStateCapital TEXT)
BEGIN
 INSERT INTO states (state_abbreviation, state_name, state_flag, state_image, state_capital)
        VALUES (inStateAbbreviation, inStateName, inStateFlag, inStateImage, inStateCapital);
END$$

DROP PROCEDURE IF EXISTS `states2014_add_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_add_user`(IN `inUserName` VARCHAR(20), IN `inPassword` VARCHAR(20))
BEGIN
 INSERT INTO users (user_name, password)
        VALUES (inUserName, inPassword);
END$$

DROP PROCEDURE IF EXISTS `states2014_check_login`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_check_login`(IN `inUserName` VARCHAR(50), IN `inPassword` VARCHAR(50))
BEGIN
PREPARE statement FROM
      "SELECT   *
       FROM     Users
       WHERE    user_name LIKE ?
       AND	password LIKE ?
       ORDER BY user_id";
SET @p1 = inUserName;
SET @p2 = inPassword;
EXECUTE statement USING @p1, @p2;
END$$

DROP PROCEDURE IF EXISTS `states2014_get_attractions`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_attractions`()
select * from attraction order by attraction_name$$

DROP PROCEDURE IF EXISTS `states2014_get_attraction_details`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_attraction_details`(IN `inattractionid` INT)
select * from attraction where attraction_id = inattractionid$$

DROP PROCEDURE IF EXISTS `states2014_get_attraction_details_by_attractionname`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_attraction_details_by_attractionname`(IN `inattractionname` VARCHAR(50))
BEGIN
SET @pattern = CONCAT('%',inattractionname,'%');
PREPARE statement FROM
      "SELECT * FROM attraction
       WHERE    attraction_name LIKE ?";
EXECUTE statement USING @pattern;
END$$

DROP PROCEDURE IF EXISTS `states2014_get_category_persons`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_category_persons`(IN `incategory` VARCHAR(20))
select * from person where person_category = incategory
order by person_name$$

DROP PROCEDURE IF EXISTS `states2014_get_cities`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_cities`()
select * from city order by city_name$$

DROP PROCEDURE IF EXISTS `states2014_get_city_attractions`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_city_attractions`(IN `incityid` INT)
select * from attraction where city_id = incityid$$

DROP PROCEDURE IF EXISTS `states2014_get_city_details`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_city_details`(IN `incityid` INT)
select * from city where city_id = incityid$$

DROP PROCEDURE IF EXISTS `states2014_get_city_details_by_cityname`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_city_details_by_cityname`(IN `incityname` VARCHAR(50))
BEGIN
SET @pattern = CONCAT('%',incityname,'%');
PREPARE statement FROM
      "SELECT * FROM city
       WHERE    city_name LIKE ?";
EXECUTE statement USING @pattern;
END$$

DROP PROCEDURE IF EXISTS `states2014_get_highestscores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_highestscores`()
select user_name, highest_score from users
order by highest_score desc, user_name
limit 0, 10$$

DROP PROCEDURE IF EXISTS `states2014_get_persons`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_persons`()
select * from person order by person_name$$

DROP PROCEDURE IF EXISTS `states2014_get_person_details`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_person_details`(IN `inpersonid` INT)
select * from person where person_id = inpersonid$$

DROP PROCEDURE IF EXISTS `states2014_get_person_details_by_personname`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_person_details_by_personname`(IN `inpersonname` VARCHAR(50))
BEGIN
SET @pattern = CONCAT('%',inpersonname,'%');
PREPARE statement FROM
      "SELECT * FROM person
       WHERE    person_name LIKE ?";
EXECUTE statement USING @pattern;
END$$

DROP PROCEDURE IF EXISTS `states2014_get_random_state_images`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_random_state_images`(IN `instateabbreviation` CHAR(2))
select state_image, state_abbreviation from state_images 
where state_abbreviation != instateabbreviation
order by RAND()
LIMIT 8$$

DROP PROCEDURE IF EXISTS `states2014_get_states`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_states`()
Select * from States Order By State_Name$$

DROP PROCEDURE IF EXISTS `states2014_get_state_attractions`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_state_attractions`(IN `instateabbreviation` CHAR(2))
select * from attraction where state_abbreviation = instateabbreviation$$

DROP PROCEDURE IF EXISTS `states2014_get_state_cities`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_state_cities`(IN `inStateAbbreviation` CHAR(2))
select * from city where state_abbreviation = instateabbreviation$$

DROP PROCEDURE IF EXISTS `states2014_get_state_details`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_state_details`(IN `InStateAbbreviation` CHAR(2))
select * from states where state_abbreviation = instateabbreviation$$

DROP PROCEDURE IF EXISTS `states2014_get_state_details_by_statename`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_state_details_by_statename`(IN `instatename` VARCHAR(50))
select * from states where state_name = instatename$$

DROP PROCEDURE IF EXISTS `states2014_get_state_images`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_state_images`(IN `instateabbreviation` CHAR(2))
select state_image, state_abbreviation from state_images where state_abbreviation = instateabbreviation$$

DROP PROCEDURE IF EXISTS `states2014_get_state_persons`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_state_persons`(IN `instateabbreviation` CHAR(2))
select * from person, state_person
where state_person.state_abbreviation = instateabbreviation
and state_person.person_id = person.person_id$$

DROP PROCEDURE IF EXISTS `states2014_get_users`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_users`()
select * from users order by user_name$$

DROP PROCEDURE IF EXISTS `states2014_get_user_details`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_user_details`(IN `inuserid` INT)
select * from users where user_id = inuserid$$

DROP PROCEDURE IF EXISTS `states2014_get_user_details_by_username`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_user_details_by_username`(IN `inusername` VARCHAR(50))
select * from users where user_name = inusername$$

DROP PROCEDURE IF EXISTS `states2014_get_user_highestscore_by_username`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_get_user_highestscore_by_username`(IN `inusername` VARCHAR(50))
select highest_score from users where user_name = inusername$$

DROP PROCEDURE IF EXISTS `states2014_update_attraction`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_update_attraction`(IN `inAttractionName` VARCHAR(150), IN `inStateAbbreviation` CHAR(2), IN `inCityId` INT, IN `inAttractionLat` FLOAT(8), IN `inAttractionLong` FLOAT(8), IN `inAttractionImage` VARCHAR(150), IN `inAttractionId` INT)
UPDATE attraction
 SET    attraction_name = inAttractionName, 
		state_abbreviation = inStateAbbreviation,
		city_id = inCityId,
		attraction_lat = inAttractionLat,
		attraction_long = inAttractionLong,
		attraction_image = inAttractionImage
 WHERE  attraction_id = inAttractionId$$

DROP PROCEDURE IF EXISTS `states2014_update_city`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_update_city`(IN `inCityName` VARCHAR(50), IN `inStateAbbreviation` CHAR(2), IN `inCityLat` FLOAT(8), IN `inCityLong` FLOAT(8), IN `inCityImage` VARCHAR(150), IN `inCityId` INT)
UPDATE city
 SET    city_name = inCityName, 
		state_abbreviation = inStateAbbreviation, 
		city_lat = inCityLat,
		city_long = inCityLong,
		city_image = inCityImage
 WHERE  city_id = inCityId$$

DROP PROCEDURE IF EXISTS `states2014_update_person`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_update_person`(IN `inPersonName` VARCHAR(150), IN `inPersonCategory` VARCHAR(150), IN `inPersonImage` VARCHAR(150), IN `inPersonStory` VARCHAR(150), IN `inPersonId` INT)
UPDATE person
 SET    person_name = inPersonName, 
		person_category = inPersonCategory,
		person_image = inPersonImage,
		person_story = inPersonStory
 WHERE  person_id = inPersonId$$

DROP PROCEDURE IF EXISTS `states2014_update_state`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_update_state`(IN `inStateName` VARCHAR(50), IN `inStateFlag` VARCHAR(150), IN `inStateImage` VARCHAR(150), IN `inStateCapital` VARCHAR(50), IN `inStateAbbreviation` CHAR(2))
UPDATE states
 SET    state_name = inStateName, 
		state_flag = inStateFlag, 
		state_image = inStateImage,
		state_capital = inStateCapital
 WHERE  state_abbreviation = inStateAbbreviation$$

DROP PROCEDURE IF EXISTS `states2014_update_user`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_update_user`(IN `inUserName` VARCHAR(50), IN `inPassword` VARCHAR(50), IN `inHighestScore` INT, IN `inUserId` INT)
UPDATE users
 SET    user_name = inUserName, 
		password = inPassword,
		highest_score = inHighestScore
 WHERE  user_id = inUserId$$

DROP PROCEDURE IF EXISTS `states2014_update_user_highestscore`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `states2014_update_user_highestscore`(IN `inHighestScore` INT, IN `inUserId` INT)
UPDATE users
 SET    highest_score = inHighestScore
 WHERE  user_id = inUserId$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `attraction`
--

DROP TABLE IF EXISTS `attraction`;
CREATE TABLE IF NOT EXISTS `attraction` (
  `attraction_id` int(11) NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state_abbreviation` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(5) DEFAULT NULL,
  `attraction_lat` float(9,6) DEFAULT NULL,
  `attraction_long` float(9,6) DEFAULT NULL,
  `attraction_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`attraction_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=41 ;

--
-- Dumping data for table `attraction`
--

INSERT INTO `attraction` (`attraction_id`, `attraction_name`, `state_abbreviation`, `city_id`, `attraction_lat`, `attraction_long`, `attraction_image`) VALUES
(1, 'The US Space & Rocket Center', 'AL', NULL, 34.712364, -86.653511, 'usspaceandrocketcenter.jpg'),
(2, 'Noccalula Falls', 'AL', NULL, 34.041485, -86.021088, 'noccalulafalls.jpg'),
(3, 'Cathedral Caverns State Park', 'AL', NULL, 34.573334, -86.222221, 'cathedralcavernsstatepark.jpg'),
(4, 'Birmingham Zoo', 'AL', 2, 33.489922, -86.777283, 'birminghamzoo.jpg'),
(5, 'USS Alabama Battleship Memorial Park', 'AL', 3, 30.683701, -88.015755, 'ussalabamabattleshipmemorialpark.jpg'),
(6, 'Denali National Park', 'AK', NULL, 63.333332, -150.500000, 'denalinationalpark.jpg'),
(7, 'Kenai Fjords National Park Day Cruise', 'AK', NULL, 60.043777, -149.816360, 'kenaifjordsnationalparkdaycruise.jpg'),
(8, 'Museum Of The North In Fairbanks', 'AK', 6, 64.858955, -147.842270, 'museumofthenorthinfairbanks.jpg'),
(9, 'Klondike Gold Rush National Historical Park Visitor Center', 'AK', NULL, 59.446602, -135.284988, 'klondikegoldrushnationalhistoricalparkvisitorcenter.jpg'),
(10, 'Mendenhall Glacier', 'AK', NULL, 58.495834, -134.532227, 'mendenhallglacier.jpg'),
(11, 'Grand Canyon', 'AZ', NULL, 36.054443, -112.140114, 'grandcanyon.jpg'),
(12, 'Sedona', 'AZ', NULL, 34.869740, -111.760986, 'sedona.jpg'),
(13, 'Monument Valley', 'AZ', NULL, 36.991371, -110.193871, 'monumentvalley.jpg'),
(14, 'Hoover Dam', 'AZ', NULL, 36.015865, -114.737740, 'hooverdam.jpg'),
(15, 'Montezuma Castle', 'AZ', NULL, 34.611576, -111.834984, 'montezumacastle.jpg'),
(16, 'Hot Springs National Park', 'AR', NULL, 34.531322, -93.063744, 'hotspringsnationalpark.jpg'),
(17, 'William J. Clinton Presidential Library', 'AR', 10, 34.746670, -92.260101, 'williamjclintonpresidentiallibrary.jpg'),
(18, 'Little Rock Zoo', 'AR', 10, 34.748524, -92.333183, 'littlerockzoo.jpg'),
(19, 'Riverfront Park', 'AR', 10, 35.394173, -94.428818, 'riverfrontpark.jpg'),
(20, 'Arkansas Arts Center', 'AR', 10, 34.739567, -92.267097, 'arkansasartscenter.jpg'),
(21, 'Redwood National Park', 'CA', NULL, 41.213181, -124.004631, 'redwoodnationalpark.jpg'),
(22, 'Venice Beach', 'CA', 15, 33.993614, -118.479912, 'venicebeach.jpg'),
(23, 'Yosemite National Park', 'CA', NULL, 37.863018, -119.535858, 'yosemitenationalpark.jpg'),
(24, 'Golden Gate Bridge', 'CA', 14, 37.819977, -122.478470, 'goldengatebridge.jpg'),
(25, 'Disneyland', 'CA', NULL, 33.809708, -117.917007, 'disneyland.jpg'),
(26, 'Rocky Mountain National Park', 'CO', NULL, 40.342793, -105.683640, 'rockymountainnationalpark.jpg'),
(27, 'Mesa Verde National Park', 'CO', NULL, 37.183781, -108.488693, 'mesaverdenationalpark.jpg'),
(28, 'Vail', 'CO', NULL, 39.640263, -106.374191, 'vail.jpg'),
(29, 'Mount Evans', 'CO', NULL, 39.587788, -105.642380, 'mountevans.jpg'),
(30, 'Black Hawk', 'CO', NULL, 39.796932, -105.493881, 'blackhawk.jpg'),
(31, 'Mystic Seaport', 'CT', NULL, 41.361359, -71.966171, 'mysticseaport.jpg'),
(32, 'New England Air Museum', 'CT', NULL, 41.947109, -72.691376, 'newenglandairmuseum.jpg'),
(33, 'Roseland Cottage', 'CT', NULL, 41.949177, -71.976120, 'roselandcottage.jpg'),
(34, 'Peabody Museum at Yale University', 'CT', 22, 41.316322, -72.922340, 'peabodymuseumatyaleuniversity.jpg'),
(35, 'Mark Twain House', 'CT', 20, 41.766449, -72.701225, 'marktwainhouse.jpg'),
(36, 'Dover International Speedway', 'DE', 23, 39.189915, -75.530663, 'doverinternationalspeedway.jpg'),
(37, 'Riverfront Wilmington', 'DE', 24, 39.731178, -75.563156, 'riverfrontwilmington.jpg'),
(38, 'Frightland', 'DE', NULL, 39.524883, -75.648445, 'frightland.jpg'),
(39, 'Delaware Art Museum', 'DE', 24, 39.765465, -75.564713, 'delawareartmuseum.jpg'),
(40, 'Hagley Museum and Library', 'DE', 24, 39.773697, -75.578987, 'hagleymuseumandlibrary.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state_abbreviation` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `city_lat` float(9,6) DEFAULT NULL,
  `city_long` float(9,6) DEFAULT NULL,
  `city_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `state_abbreviation`, `city_lat`, `city_long`, `city_image`) VALUES
(1, 'Montgomery', 'AL', 32.366806, -86.299973, 'montgomery_al.jpg'),
(2, 'Birmingham', 'AL', 33.520660, -86.802490, 'birmingham_al.jpg'),
(3, 'Mobile', 'AL', 30.694357, -88.043053, 'mobile_al.jpg'),
(4, 'Juneau', 'AK', 58.301945, -134.419724, 'juneau_ak.jpg'),
(5, 'Anchorage', 'AK', 61.218056, -149.900284, 'anchorage_ak.jpg'),
(6, 'Fairbanks', 'AK', 64.837776, -147.716385, 'fairbanks_ak.jpg'),
(7, 'Phoenix', 'AZ', 33.448376, -112.074036, 'phoenix_az.jpg'),
(8, 'Tucson', 'AZ', 32.221745, -110.926476, 'tucson_az.jpg'),
(9, 'Mesa', 'AZ', 33.415184, -111.831474, 'mesa_az.jpg'),
(10, 'Little Rock', 'AR', 34.746483, -92.289597, 'littlerock_ar.jpg'),
(11, 'Fort Smith', 'AR', 35.385925, -94.398544, 'fortsmith_ar.jpg'),
(12, 'Fayetteville', 'AR', 36.062580, -94.157425, 'fayetteville_ar.jpg'),
(13, 'Sacramento', 'CA', 38.581573, -121.494400, 'sacramento_ca.jpg'),
(14, 'San Francisco', 'CA', 37.774929, -122.419418, 'sanfrancisco_ca.jpg'),
(15, 'Los Angeles', 'CA', 34.052235, -118.243683, 'losangeles_ca.jpg'),
(16, 'San Diego', 'CA', 32.715328, -117.157257, 'sandiego_ca.jpg'),
(17, 'Denver', 'CO', 39.737568, -104.984718, 'denver_co.jpg'),
(18, 'Colorado Springs', 'CO', 38.833881, -104.821365, 'coloradosprings_co.jpg'),
(19, 'Aurora', 'CO', 39.729431, -104.831917, 'aurora_co.jpg'),
(20, 'Hartford', 'CT', 41.763710, -72.685097, 'hartford_ct.jpg'),
(21, 'Bridgeport', 'CT', 41.186546, -73.195175, 'bridgeport_ct.jpg'),
(22, 'New Haven', 'CT', 41.308273, -72.927879, 'newhaven_ct.jpg'),
(23, 'Dover', 'DE', 39.158169, -75.524368, 'dover_de.jpg'),
(24, 'Wilmington', 'DE', 39.745834, -75.546669, 'wilmington_de.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `person_category` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_story` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `person_name`, `person_category`, `person_image`, `person_story`) VALUES
(1, 'Helen Keller', 'Author', 'helenkeller.jpg', 'Blind author'),
(2, 'W. C. Handy', 'Musician', 'wchandy.jpg', 'I''m not familiar with your name but I get such strong impressions of your heyday up and down old Beale Street'),
(3, 'Martin Luther King, Jr.', 'Hero', 'martinlutherking.jpg', 'I have a dream'),
(4, 'Nat King Cole', 'Musician', 'natkingcole.jpg', 'Unforgettable'),
(5, 'Rosa Parks', 'Hero', 'rosaparks.jpg', 'You are the spark'),
(6, 'Wyatt Earp', 'Lawman', 'wyattearp.jpg', 'Gary Cooper'),
(7, 'Jack London', 'Author', 'jacklondon.jpg', 'White Fang'),
(8, 'Jewel Kilcher', 'Musician', 'jewelkilcher.jpg', 'Singer songwriter'),
(9, 'Sarah Palin', 'Politician', 'sarahpalin.jpg', 'OMG'),
(10, 'Bob Ross', 'Artist', 'bobross.jpg', 'The Painter'),
(11, 'Glen Campbell', 'Musician', 'glencampbell.jpg', 'Phoenix, Galveston, Wichita, Beach Boys'),
(12, 'Geronimo', 'Native American', 'geronimo.jpg', ''),
(13, 'Alice Cooper', 'Musician', 'alicecooper.jpg', 'Schools out'),
(14, 'Charles Mingus', 'Musician', 'charlesmingus.jpg', ''),
(15, 'Stevie Nicks', 'Musician', 'stevienicks.jpg', ' Leather and lace'),
(16, 'Johnny Cash', 'Musician', 'johnnycash.jpg', 'The man in black'),
(17, 'Maya Angelou', 'Author', 'mayaangelou.jpg', 'I know why the caged bird sings'),
(18, 'Bill Clinton', 'Politician', 'billclinton.jpg', 'Rhodes scholar'),
(19, 'Douglas MacArthur', 'Military', 'douglasmacarthur.jpg', 'Five gold stars'),
(20, 'Arnold Schwarzenegger', 'Politician', 'arnoldschwarzenegger.jpg', 'I''ll be back'),
(21, 'Steve Jobs', 'Business', 'stevejobs.jpg', '666'),
(22, 'Paul Pierce', 'Sports', 'paulpierce.jpg', 'Boston Celtics'),
(23, 'Snoop Dogg', 'Musician', 'snoopdogg.jpg', 'rap'),
(24, 'Marilyn Monroe', 'Actor', 'marilynmonroe.jpg', 'Some like it hot'),
(25, 'John Elway', 'Sports', 'johnelway.jpg', 'American Football Quarterback'),
(26, 'Tim Allen', 'Actor', 'timallen.jpg', 'To infinity and beyond'),
(27, 'Bill Murray', 'Actor', 'billmurray.jpg', 'groundhog ghostbuster lost in translation'),
(28, 'Glenn Miller', 'Musician', 'glennmiller.jpg', 'Chatanooga'),
(29, 'John Denver', 'Musician', 'johndenver.jpg', 'I guess he''d rather  be in Colorado'),
(30, 'George W. Bush', 'Politician', 'georgewbush.jpg', 'Doh!'),
(31, 'Mark Twain', 'Author', 'marktwain.jpg', 'Tom Sawyer and Huckleberry Finn'),
(32, 'Katharine Hepburn', 'Actor', 'katharinehepburn.jpg', 'The greatest actress of all time'),
(33, 'Vint Cerf', 'Hero', 'vintcerf.jpg', 'Internet pioneer'),
(34, 'Martha Stewart', 'Business', 'marthastewart.jpg', 'Lifestyle guru'),
(35, 'Henry Heimlich', 'Medicine', 'henryheimlich.jpg', 'Heimlich Manoeuvre'),
(36, 'Elisabeth Shue', 'Actor', 'elisabethshue.jpg', 'Back To The Future'),
(37, 'DJ Jazzy Jeff', 'Musician', 'djjazzyjeff.jpg', 'The Fresh Prince'),
(38, 'Judge Reinhold', 'Actor', 'judgereinhold.jpg', 'Comedy'),
(39, 'Tom Verlaine', 'Musician', 'tomverlaine.jpg', 'Television Guitar Hero');

-- --------------------------------------------------------

--
-- Table structure for table `state_images`
--

DROP TABLE IF EXISTS `state_images`;
CREATE TABLE IF NOT EXISTS `state_images` (
  `state_abbreviation` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `state_image` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`state_abbreviation`,`state_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `state_images`
--

INSERT INTO `state_images` (`state_abbreviation`, `state_image`) VALUES
('AK', 'alaska_flag.png'),
('AK', 'alaska_image.png'),
('AK', 'alaska_motto.png'),
('AK', 'alaska_text.png'),
('AL', 'alabama_flag.png'),
('AL', 'alabama_image.png'),
('AL', 'alabama_motto.png'),
('AL', 'alabama_text.png'),
('AR', 'arkansas_flag.png'),
('AR', 'arkansas_image.png'),
('AR', 'arkansas_motto.png'),
('AR', 'arkansas_text.png'),
('AZ', 'arizona_flag.png'),
('AZ', 'arizona_image.png'),
('AZ', 'arizona_motto.png'),
('AZ', 'arizona_text.png'),
('CA', 'california_flag.png'),
('CA', 'california_image.png'),
('CA', 'california_motto.png'),
('CA', 'california_text.png'),
('CO', 'colorado_flag.png'),
('CO', 'colorado_image.png'),
('CO', 'colorado_motto.png'),
('CO', 'colorado_text.png'),
('CT', 'connecticut_flag.png'),
('CT', 'connecticut_image.png'),
('CT', 'connecticut_motto.png'),
('CT', 'connecticut_text.png'),
('DE', 'delaware_flag.png'),
('DE', 'delaware_image.png'),
('DE', 'delaware_motto.png'),
('DE', 'delaware_text.png');

-- --------------------------------------------------------

--
-- Table structure for table `state_person`
--

DROP TABLE IF EXISTS `state_person`;
CREATE TABLE IF NOT EXISTS `state_person` (
  `state_abbreviation` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`state_abbreviation`,`person_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `state_person`
--

INSERT INTO `state_person` (`state_abbreviation`, `person_id`) VALUES
('AK', 6),
('AK', 7),
('AK', 8),
('AK', 9),
('AK', 10),
('AL', 1),
('AL', 2),
('AL', 3),
('AL', 4),
('AL', 5),
('AR', 11),
('AR', 16),
('AR', 17),
('AR', 18),
('AR', 19),
('AZ', 11),
('AZ', 12),
('AZ', 13),
('AZ', 14),
('AZ', 15),
('CA', 20),
('CA', 21),
('CA', 22),
('CA', 23),
('CA', 24),
('CA', 40),
('CO', 25),
('CO', 26),
('CO', 27),
('CO', 28),
('CO', 29),
('CT', 30),
('CT', 31),
('CT', 32),
('CT', 33),
('CT', 34),
('DE', 35),
('DE', 36),
('DE', 37),
('DE', 38),
('DE', 39);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `state_abbreviation` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `state_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `state_flag` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_capital` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`state_abbreviation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`state_abbreviation`, `state_name`, `state_flag`, `state_image`, `state_capital`) VALUES
('AL', 'Alabama', 'alabama_flag.gif', 'alabama_image.jpg', 'Montgomery'),
('AK', 'Alaska', 'alaska_flag.gif', 'alaska_image.jpg', 'Juneau'),
('AZ', 'Arizona', 'arizona_flag.gif', 'arizona_image.jpg', 'Phoenix'),
('AR', 'Arkansas', 'arkansas_flag.gif', 'arkansas_image.jpg', 'Little Rock'),
('CA', 'California', 'california_flag.gif', 'california_image.jpg', 'Sacramento'),
('CO', 'Colorado', 'colorado_flag.gif', 'colorado_image.jpg', 'Denver'),
('CT', 'Connecticut', 'connecticut_flag.gif', 'connecticut_image.jpg', 'Hartford'),
('DE', 'Delaware', 'delaware_flag.gif', 'delaware_image.jpg', 'Dover');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `highest_score` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `password`, `highest_score`) VALUES
(1, 'Joni', 'Spark', 15),
(2, 'Dylan', 'Bob', 0),
(3, 'Bobby', 'Cat', 25),
(4, 'Paul Simon', 'Graceland', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

grant all on states2014 to 'statesadmin'@'localhost' identified by 'statesadmin';