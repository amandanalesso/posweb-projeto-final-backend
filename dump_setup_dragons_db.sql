CREATE DATABASE IF NOT EXISTS setup_dragons_db;

USE setup_dragons_db;

-- Criação da tabela Houses
CREATE TABLE IF NOT EXISTS Houses (
    HouseID INT PRIMARY KEY AUTO_INCREMENT,
    HouseName VARCHAR(50) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    Founder VARCHAR(50) NOT NULL
);

-- Criação da tabela Characters (depende da tabela Houses)
CREATE TABLE IF NOT EXISTS Characters (
    CharacterID INT PRIMARY KEY AUTO_INCREMENT,
    CharacterName VARCHAR(50) NOT NULL,
    HouseID INT,
    Role VARCHAR(50),
    FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
);

-- Criação da tabela dragons (sem referências externas ainda)
CREATE TABLE IF NOT EXISTS dragons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    origin VARCHAR(255) NOT NULL,
    color VARCHAR(255),
    rider_count INT,
    RiderID INT
);

-- Criação da tabela Riders (depende das tabelas Characters e dragons)
CREATE TABLE IF NOT EXISTS Riders (
    RiderID INT AUTO_INCREMENT PRIMARY KEY,
    CharacterID INT,
    DragonID INT,
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
    FOREIGN KEY (DragonID) REFERENCES dragons(id)
);

-- Criação da tabela Battles (depende da tabela Houses)
CREATE TABLE IF NOT EXISTS Battles (
    BattleID INT PRIMARY KEY AUTO_INCREMENT,
    BattleName VARCHAR(50) NOT NULL,
    Date DATE,
    HouseID INT,
    FOREIGN KEY (HouseID) REFERENCES Houses(HouseID)
);

-- Criação da tabela DragonBattles (depende das tabelas dragons e Battles)
CREATE TABLE IF NOT EXISTS DragonBattles (
    DragonBattleID INT AUTO_INCREMENT PRIMARY KEY,
    DragonID INT,
    BattleID INT,
    FOREIGN KEY (DragonID) REFERENCES dragons(id),
    FOREIGN KEY (BattleID) REFERENCES Battles(BattleID)
);

-- Inserção dos dados nas tabelas
INSERT INTO Houses (HouseName, Region, Founder) VALUES
('House Stark', 'The North', 'Bran the Builder'),
('House Lannister', 'The Westerlands', 'Lann the Clever'),
('House Targaryen', 'Dragonstone', 'Aegon the Conqueror'),
('House Tyrell', 'The Reach', 'Harlan Tyrell'),
('House Baratheon', 'The Stormlands', 'Orys Baratheon');

INSERT INTO Characters (CharacterName, HouseID, Role) VALUES
('Jon Snow', 1, 'King in the North'),
('Tyrion Lannister', 2, 'Hand of the King'),
('Daenerys Targaryen', 3, 'Queen of Dragons'),
('Olenna Tyrell', 4, 'Queen of Thorns'),
('Robert Baratheon', 5, 'King of the Andals');

INSERT INTO dragons (name, origin, color, rider_count, RiderID) VALUES
('Balerion', 'Valyria', 'Black', 1, NULL),
('Vhagar', 'Valyria', 'Green', 3, NULL),
('Meraxes', 'Valyria', 'Purple', 1, NULL),
('Drogon', 'Essos', 'Black', 1, 3),
('Rhaegal', 'Essos', 'Green', 0, 3),
('Viserion', 'Essos', 'White', 0, 3),
('Syrax', 'Dragonstone', 'Gold', 1, 7),
('Caraxes', 'Dragonstone', 'Red', 1, 8),
('Meleys', 'Dragonstone', 'Pink', 1, NULL);

INSERT INTO Riders (CharacterID, DragonID) VALUES
(3, 4),  -- Daenerys Targaryen montou Drogon
(3, 5),  -- Daenerys Targaryen montou Rhaegal
(3, 6),  -- Daenerys Targaryen montou Viserion
(7, 7),  -- Rhaenyra Targaryen montou Syrax
(8, 8);  -- Daemon Targaryen montou Caraxes

INSERT INTO Battles (BattleName, Date, HouseID) VALUES
('Battle of the Bastards', '305-01-01', 1),
('Battle of Blackwater', '298-01-01', 2),
('Battle of the Goldroad', '299-01-01', 3),
('Battle of the Whispering Wood', '298-01-01', 1),
('Battle of the Tower of Joy', '283-01-01', 5);

INSERT INTO DragonBattles (DragonID, BattleID) VALUES
(4, 2),  -- Drogon participou da Batalha de Blackwater
(5, 2),  -- Rhaegal participou da Batalha de Blackwater
(6, 2),  -- Viserion participou da Batalha de Blackwater
(7, 4),  -- Syrax participou da Batalha da Torre de Alegria
(8, 4);  -- Caraxes participou da Batalha da Torre de Alegria

-- Adicionando coluna para indicar participação em batalhas na tabela dragons
ALTER TABLE dragons ADD COLUMN participated_in_battle BOOLEAN DEFAULT FALSE;

-- Atualizando coluna para indicar participação em batalhas
UPDATE dragons SET participated_in_battle = TRUE WHERE id IN (4, 5, 6, 7, 8);

