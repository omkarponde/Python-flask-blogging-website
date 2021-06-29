-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2021 at 02:04 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `avalanche_gaming`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sr_no` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sr_no`, `name`, `phone`, `message`, `date`, `email`) VALUES
(1, 'sample_name', '123456789', 'THis is a test message', '2021-06-06 22:29:54', 'test@gmail.com'),
(2, 'Omkar Ponde', '12323232', 'hi i am avalanche\r\n', '2021-06-07 14:34:41', 'omkar.gmail.com'),
(6, 'meranaam', '12323232', 'sdfsfggb', '2021-06-10 19:41:25', 'omkar.gmail.com'),
(7, 'hello', '12323232', 'send me email fraandds', '2021-06-12 12:30:21', 'hello@gmail.com'),
(8, 'hello', '12323232', 'send me email fraandds', '2021-06-12 12:44:02', 'hello@gmail.com'),
(9, 'hello', '12323232', 'heloo bro ssup', '2021-06-12 13:47:16', 'hello@gmail.com'),
(10, 'hello', '12323232', 'dowkoijoijifj\r\n', '2021-06-12 13:50:53', 'hello@gmail.com'),
(11, 'hello', '12323232', 'asw', '2021-06-12 13:52:07', 'hello@gmail.com'),
(12, 'kedar bot', '12323232', 'kedar is noob anfd anup is bot', '2021-06-15 10:16:06', 'anup.kedar@gamil.com'),
(13, 'yagnesh', '21342', 'fuge fuge', '2021-06-24 16:24:40', 'yagnesh@bardi.com'),
(14, 'Avalanche', '1234543210', 'Hi!!\r\nI am Omkar Ponde .\r\nAvalanche gaming blog is finally ready to get uploaded on github.\r\nThis blog is a project made by me to apply my python and flask knowledge so that I can see\r\nwhat are the challenges that are faced while working in the backend of a website.\r\nThank you!!!!', '2021-06-29 15:06:33', 'avalanche@gaming.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sr_no` int(50) NOT NULL,
  `title` text NOT NULL,
  `sub_heading` varchar(400) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sr_no`, `title`, `sub_heading`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'This is my first post title.', 'This is the sub heading of my first post. Yes', 'first-post', 'This is my first post and i am very excited about learning flask .Everybody should learn flask.', 'post.jpg', '2021-06-29 16:32:52'),
(2, 'PUBG Mobile is back in India', 'PUBG Mobile comes back to India as BGMI', 'pubg-as-bgmi', 'PUBG Moblie was definitely one of the most played and loved game in India , but i  September 2020 , it was banned because it\'s parent company krafton was in partnership with chinese company.Although krafton is totally a korean company but the requirements of Indian Governent were not fulfilled. After so much controversy and wait , krafton has been given permission by India Government to launch the game in India on the condition that it should not have any connection with any chinese company and the global version of PUBG Mobile, hence krafton has introduced BATTLEGROUNDS MOBILE INDIA (BGMI) a totally different game from PUBG Mobile.The wait for PUBG lovers in Indiahas come to an end.', 'bgmi.jpg', '2021-06-13 13:38:39'),
(3, 'Valorant Mobile: How it will differ from PUBG Mobile and other battle royale games', 'Here\'s all you need to know about Valorant, the popular tactical shooting game that is set to arrive', 'valorant-mobile', 'Valorant has been one of the most popular tactical shooter games of all time, quickly rising to popularity after its launch back in June 2020. The game is today a popular title for shooting game enthusiasts as well as a major eSports competitive title. Now developer Riot Games has suggested that Valorant could soon be coming to the mobile platform.\r\n\r\nThe developer announced the same earlier this month on the game’s one-year anniversary. However, Valorant Mobile is set to be very different from battle royale games on mobiles like PUBG Mobile, Call of Duty Mobile or Fortnite. For those of you that don’t know about the game, here’s what Valorant is about, and how it will differ from titles like PUBG Mobile and Call of Duty Mobile.\r\nValorant: What is the game about?\r\nValorant is a tactical shooting game that sets matches between ten players split into two teams of five players each. The game is similar to the classic shooting game Counter-Strike in its basic form, where one team is tasked with bombing a location (the bomb site) while another team has to stop the first team from reaching their goal.\r\nApart from planting or diffusing the bomb, each team can also win the round by killing all the members of the opposite team. Players also start with basic weapons and have an in-match economy system where kills at the end of each round earn them temporary currency that they can spend on more powerful weapons and tactical equipment.\r\n\r\nIf that premise seems too similar to Counter-Strike: Global Offensive, that’s because it is. The game’s maps were also co-designed by CS: GO map designer Salvatore Garozzo. However, here’s what makes Valorant different from Counter-Strike, or pretty much any other title.', 'valom.jpg', '2021-06-13 14:17:01'),
(4, 'Valorant: Abilies of OMEN', 'A dark figure lurking in the shadow waiting to pounce on your opponents.', 'omen-abilites', 'Abilities Paranoia: Omen fires a shadow ball that can move past walls and covers nearly blinding your enemies. Opponents won’t be able to see beyond a few feet opening up space for you or your teammates to attack. Shrouded Step: The move allows Omen to teleport a short distance that you marked. This comes in handy when you want to escape a situation, gain an advantage, or even to surprise up your enemies. Signature – Dark Cover: Omen equips a smoke grenade-like orb that can be fired through walls just like paranoia. This too blinds enemies allowing you to take advantage. Ultimate – From the Shadows: Equip a minimap and select your target location for Omen to teleport to. However, there will be a loud audio cue and if your enemies were to shoot, you’d teleport back to your original location.', 'omen.jpg', '2021-06-21 11:56:38'),
(5, 'PUBG Mobile:PUBG Mobile Pro League Arabia Finals Day 3', 'PUBG Mobile: Gunz Esports crowned the champions of PMPL Arabia 2021, GXR scores a #1 on Day 3', 'pubgm-plam', 'PUBG Mobile: Gunz Esports crowned the champions of PMPL Arabia Finals, GXR scores a Chicken Dinner on Day 3: PUBG Mobile Pro League Arabia comes to an end with Gunz Esport claiming the winner’s share of $10,000 USD. The action-packed finale that went on for three days, was full of iconic moments & breath-taking endgames to delight PUBG Esports fans all around the globe. The stakes were high as there were only 6 matches left to decide which teams are gonna fill up the top 5 spots & qualify EMEA Championship.\r\n\r\nGunz Esports with their robust gameplay on the final day, finished at the top and left all their competitors way behind in the points table. Out of 6 matches on the final day, Gunz bagged 3 chicken dinners and came second in two other matches. In the final day alone, the team secured 128 points & overtook Rico Infinity by miles. Gunz Esport was crowned the champions with 245 points whereas Rico Inifinity & SUDOR Esports came second and third with 172 & 162 points respectively.', 'pubgma.jpg', '2021-06-14 07:47:57'),
(7, 'Things that gaming teach us', 'Video and computer games are a waste of time,right?', 'things-that-gaming-teach-', 'Enhanced spatial skills, problem-solving and creativity – particularly with fast-paced action games. Games keep players in a motivational “sweet spot” where challenge and frustration are balanced with success, and this sweet spot changes with gamer progress. Games use failure as a motivational tool; persistence is rewarded. Games nurture optimism and create positive emotions. Gaming teaches players how to deal with frustration and anxiety. Gaming promotes social skills; more than 70 per cent of gamers play, either competitively or co-operatively, with a friend. Games are being used to treat certain medical and mental health conditions.', 'gaming.jpg', '2021-06-29 17:19:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sr_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sr_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
