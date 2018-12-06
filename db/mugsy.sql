-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2018 at 01:41 AM
-- Server version: 10.1.37-MariaDB-0+deb9u1
-- PHP Version: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mugsy`
--
CREATE DATABASE IF NOT EXISTS `mugsy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mugsy`;

-- --------------------------------------------------------

--
-- Table structure for table `brewSettings`
--

CREATE TABLE `brewSettings` (
  `brewSettingsId` int(255) NOT NULL,
  `grindSize` int(255) NOT NULL,
  `waterTemp` int(255) NOT NULL,
  `bloomTime` int(255) NOT NULL,
  `pumpTimingOn` int(255) NOT NULL,
  `pumpTimingOff` int(255) NOT NULL,
  `pourOverPatternId` int(255) NOT NULL,
  `grinderTime` int(255) NOT NULL,
  `tempHolder` int(255) NOT NULL,
  `userId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brewSettings`
--

INSERT INTO `brewSettings` (`brewSettingsId`, `grindSize`, `waterTemp`, `bloomTime`, `pumpTimingOn`, `pumpTimingOff`, `pourOverPatternId`, `grinderTime`, `tempHolder`, `userId`) VALUES
(1, 0, 195, 15, 10, 10, 8, 3, 75, 0),
(2, 2, 666, 5, 1, 1, 8, 4, 198, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coffeeTypes`
--

CREATE TABLE `coffeeTypes` (
  `coffeeTypeId` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `varietyId` int(255) NOT NULL,
  `originId` int(255) NOT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `variety` varchar(255) DEFAULT NULL,
  `upc` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `weight` float(10,2) NOT NULL,
  `companyName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coffeeTypes`
--

INSERT INTO `coffeeTypes` (`coffeeTypeId`, `name`, `varietyId`, `originId`, `origin`, `variety`, `upc`, `price`, `weight`, `companyName`) VALUES
(1, 'Fast Forward', 0, 0, NULL, NULL, '663505000328', 15.00, 12.00, 'Counter Culture Coffee'),
(2, 'Ozolotepec', 3, 12, 'Oaxaca, Mexico', 'Typica', '663505991831', 15.00, 12.00, 'Counter Culture Coffee');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favoriteId` int(255) NOT NULL,
  `userId` int(255) NOT NULL,
  `favoriteType` varchar(255) NOT NULL,
  `brewSettingId` int(255) NOT NULL,
  `CoffeeTypeId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `friendshipId` int(255) NOT NULL,
  `userId` int(255) NOT NULL,
  `friendUserId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hardwareTypes`
--

CREATE TABLE `hardwareTypes` (
  `hardwareTypeID` int(255) NOT NULL,
  `hardwareType` varchar(255) NOT NULL,
  `voltage` varchar(255) NOT NULL,
  `amps` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `integrations`
--

CREATE TABLE `integrations` (
  `integrationId` int(255) NOT NULL,
  `integrationName` varchar(255) NOT NULL,
  `apiType` varchar(255) NOT NULL,
  `authenticationKey` varchar(255) NOT NULL,
  `userId` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinMappings`
--

CREATE TABLE `pinMappings` (
  `pinMappingId` int(255) NOT NULL,
  `relayChannel` int(255) NOT NULL,
  `hardwareTypeId` int(255) NOT NULL,
  `pinNumber` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pourOverPatterns`
--

CREATE TABLE `pourOverPatterns` (
  `pourOverPatternId` int(255) NOT NULL,
  `pourOverPattern` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profileId` int(255) NOT NULL,
  `userId` int(255) NOT NULL,
  `profileType` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userLevels`
--

CREATE TABLE `userLevels` (
  `userLevelId` int(255) NOT NULL,
  `userLevelType` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userId` int(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userLevel` tinyint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brewSettings`
--
ALTER TABLE `brewSettings`
  ADD PRIMARY KEY (`brewSettingsId`);

--
-- Indexes for table `coffeeTypes`
--
ALTER TABLE `coffeeTypes`
  ADD PRIMARY KEY (`coffeeTypeId`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favoriteId`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`friendshipId`);

--
-- Indexes for table `hardwareTypes`
--
ALTER TABLE `hardwareTypes`
  ADD PRIMARY KEY (`hardwareTypeID`);

--
-- Indexes for table `integrations`
--
ALTER TABLE `integrations`
  ADD PRIMARY KEY (`integrationId`);

--
-- Indexes for table `pinMappings`
--
ALTER TABLE `pinMappings`
  ADD PRIMARY KEY (`pinMappingId`);

--
-- Indexes for table `pourOverPatterns`
--
ALTER TABLE `pourOverPatterns`
  ADD PRIMARY KEY (`pourOverPatternId`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profileId`);

--
-- Indexes for table `userLevels`
--
ALTER TABLE `userLevels`
  ADD PRIMARY KEY (`userLevelId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brewSettings`
--
ALTER TABLE `brewSettings`
  MODIFY `brewSettingsId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `coffeeTypes`
--
ALTER TABLE `coffeeTypes`
  MODIFY `coffeeTypeId` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favoriteId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `friendshipId` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userLevels`
--
ALTER TABLE `userLevels`
  MODIFY `userLevelId` int(255) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
