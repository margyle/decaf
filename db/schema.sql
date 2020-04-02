-- TABLE
CREATE TABLE IF NOT EXISTS `brewSettings` (
  `brewSettingsId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `grindSize` INTEGER NOT NULL,
  `waterTemp` INTEGER NOT NULL,
  `bloomTime` INTEGER NOT NULL,
  `pumpTimingOn` INTEGER NOT NULL,
  `pumpTimingOff` INTEGER NOT NULL,
  `pourOverPatternId` INTEGER NOT NULL,
  `grinderTime` INTEGER NOT NULL,
  `tempHolder` INTEGER NOT NULL,
  `userId` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `coffeeTypes` (
  `coffeeTypeId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` TEXT NOT NULL,
  `varietyId` INTEGER NOT NULL,
  `originId` INTEGER NOT NULL,
  `origin` TEXT DEFAULT NULL,
  `variety` TEXT DEFAULT NULL,
  `upc` TEXT NOT NULL,
  `price` REAL NOT NULL,
  `weight` REAL NOT NULL,
  `companyName` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `favorites` (
  `favoriteId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userId` INTEGER NOT NULL,
  `favoriteType` TEXT NOT NULL,
  `brewSettingId` INTEGER NOT NULL,
  `CoffeeTypeId` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `friends` (
  `friendshipId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userId` INTEGER NOT NULL,
  `friendUserId` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `hardwareTypes` (
  `hardwareTypeID` INTEGER PRIMARY KEY AUTOINCREMENT,
  `hardwareType` TEXT NOT NULL,
  `voltage` TEXT NOT NULL,
  `amps` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `integrations` (
  `integrationId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `integrationName` TEXT NOT NULL,
  `apiType` TEXT NOT NULL,
  `authenticationKey` TEXT NOT NULL,
  `userId` INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS `pinMappings` (
  `pinMappingId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `relayChannel` INTEGER NOT NULL,
  `hardwareTypeId` INTEGER NOT NULL,
  `pinNumber` int(10) NOT NULL
);
CREATE TABLE IF NOT EXISTS `pourOverPatterns` (
  `pourOverPatternId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `pourOverPattern` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `profile` (
  `profileId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userId` INTEGER NOT NULL,
  `profileType` TEXT NOT NULL,
  `email` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `userLevels` (
  `userLevelId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userLevelType` TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS `users` (
  `userId` INTEGER PRIMARY KEY AUTOINCREMENT,
  `userName` TEXT NOT NULL,
  `userLevel` INTEGER NOT NULL
);

