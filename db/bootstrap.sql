INSERT INTO `brewSettings` (`grindSize`, `waterTemp`, `bloomTime`, `pumpTimingOn`, `pumpTimingOff`, `pourOverPatternId`, `grinderTime`, `tempHolder`, `userId`) VALUES
(0, 195, 15, 10, 10, 8, 3, 75, 0),
(2, 666, 5, 1, 1, 8, 4, 198, 1);

INSERT INTO coffeeTypes (name, varietyId, originId, origin, variety, upc, price, weight, companyName) VALUES ('testname', 1, 1, 'testorigin', 'testvariety', 'testupc', 123, 1234, 'testcompany');

INSERT INTO favorites (userId, favoriteType, brewSettingId, CoffeeTypeId) VALUES (1, "testtype", 1, 0);

INSERT INTO friends (userId, friendUserId) VALUES (0, 1);

INSERT INTO hardwareTypes (hardwareType, voltage, amps) VALUES ("test_hw_type", "test_voltage", "test_amps");

INSERT INTO integrations (integrationName, apiType, authenticationKey, userId) VALUES ("test_integration_name", "test_api_type", "test_auth_key", 0);

INSERT INTO pinMappings (relayChannel, hardwareTypeId, pinNumber) VALUES (1, 0, 1);

INSERT INTO pourOverPatterns (pourOverPattern) VALUES ("pattern1");

INSERT INTO profile (userId, profileType, email) VALUES (0, "user", "mail@example.com");

INSERT INTO userLevels (userLevelType) VALUES ("level_type");

INSERT INTO USERS (userName, userLevel) VALUES ("Bob", 0), ("Alice", 0);


