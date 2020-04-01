-- TABLE
CREATE TABLE IF NOT EXISTS `brewSettings` (
  `brewSettingsId` int(255) PRIMARY KEY,
  `grindSize` int(255) NOT NULL,
  `waterTemp` int(255) NOT NULL,
  `bloomTime` int(255) NOT NULL,
  `pumpTimingOn` int(255) NOT NULL,
  `pumpTimingOff` int(255) NOT NULL,
  `pourOverPatternId` int(255) NOT NULL,
  `grinderTime` int(255) NOT NULL,
  `tempHolder` int(255) NOT NULL,
  `userId` int(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `coffeeTypes` (
  `coffeeTypeId` int(255) PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `varietyId` int(255) NOT NULL,
  `originId` int(255) NOT NULL,
  `origin` varchar(255) DEFAULT NULL,
  `variety` varchar(255) DEFAULT NULL,
  `upc` varchar(255) NOT NULL,
  `price` float(10,2) NOT NULL,
  `weight` float(10,2) NOT NULL,
  `companyName` varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `favorites` (
  `favoriteId` int(255) PRIMARY KEY,
  `userId` int(255) NOT NULL,
  `favoriteType` varchar(255) NOT NULL,
  `brewSettingId` int(255) NOT NULL,
  `CoffeeTypeId` int(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `friends` (
  `friendshipId` int(255) PRIMARY KEY,
  `userId` int(255) NOT NULL,
  `friendUserId` int(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `hardwareTypes` (
  `hardwareTypeID` int(255) PRIMARY KEY,
  `hardwareType` varchar(255) NOT NULL,
  `voltage` varchar(255) NOT NULL,
  `amps` varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `integrations` (
  `integrationId` int(255) PRIMARY KEY,
  `integrationName` varchar(255) NOT NULL,
  `apiType` varchar(255) NOT NULL,
  `authenticationKey` varchar(255) NOT NULL,
  `userId` int(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `pinMappings` (
  `pinMappingId` int(255) PRIMARY KEY,
  `relayChannel` int(255) NOT NULL,
  `hardwareTypeId` int(255) NOT NULL,
  `pinNumber` int(10) NOT NULL
);
CREATE TABLE IF NOT EXISTS `pourOverPatterns` (
  `pourOverPatternId` int(255) PRIMARY KEY,
  `pourOverPattern` varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `profile` (
  `profileId` int(255) PRIMARY KEY,
  `userId` int(255) NOT NULL,
  `profileType` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `userLevels` (
  `userLevelId` int(255) PRIMARY KEY,
  `userLevelType` varchar(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS `users` (
  `userId` int(255) PRIMARY KEY,
  `userName` varchar(255) NOT NULL,
  `userLevel` int(255) NOT NULL
);

