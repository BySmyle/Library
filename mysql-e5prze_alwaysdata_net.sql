-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-e5prze.alwaysdata.net
-- Generation Time: Jun 11, 2024 at 10:49 AM
-- Server version: 10.6.17-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e5prze_library`
--
CREATE DATABASE IF NOT EXISTS `e5prze_library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `e5prze_library`;

-- --------------------------------------------------------

--
-- Table structure for table `Annonce`
--

CREATE TABLE `Annonce` (
  `IdAnnonce` int(11) NOT NULL,
  `Titre` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `IdUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Annonce`
--

INSERT INTO `Annonce` (`IdAnnonce`, `Titre`, `Description`, `IdUtilisateur`) VALUES
(1, 'BD TINTIN', 'BD Tintin très bon état', 1),
(2, 'Bd gaston', 'bd', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Auteur`
--

CREATE TABLE `Auteur` (
  `IdAuteur` int(11) NOT NULL,
  `LibelAuteur` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Auteur`
--

INSERT INTO `Auteur` (`IdAuteur`, `LibelAuteur`) VALUES
(0, 'Hergé');

-- --------------------------------------------------------

--
-- Table structure for table `Concerner`
--

CREATE TABLE `Concerner` (
  `IdAnnonce` int(11) NOT NULL,
  `IdUtilisateur` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `NumeroExemp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Concerner`
--

INSERT INTO `Concerner` (`IdAnnonce`, `IdUtilisateur`, `ISBN`, `NumeroExemp`) VALUES
(1, 1, '9782203001091', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Concevoir`
--

CREATE TABLE `Concevoir` (
  `ISBN` varchar(20) NOT NULL,
  `IdAuteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Concevoir`
--

INSERT INTO `Concevoir` (`ISBN`, `IdAuteur`) VALUES
('9782203001091', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Conversation`
--

CREATE TABLE `Conversation` (
  `IdConversation` int(11) NOT NULL,
  `IdAnnonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Conversation`
--

INSERT INTO `Conversation` (`IdConversation`, `IdAnnonce`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Echange`
--

CREATE TABLE `Echange` (
  `IdAnnonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Exemplaire`
--

CREATE TABLE `Exemplaire` (
  `IdUtilisateur` int(11) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `NumeroExemp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Exemplaire`
--

INSERT INTO `Exemplaire` (`IdUtilisateur`, `ISBN`, `NumeroExemp`) VALUES
(1, '9782203001091', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Format`
--

CREATE TABLE `Format` (
  `IdFormat` int(11) NOT NULL,
  `LibelFormat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Format`
--

INSERT INTO `Format` (`IdFormat`, `LibelFormat`) VALUES
(1, 'Bande dessinée');

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `IdGenre` int(11) NOT NULL,
  `LibelGenre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`IdGenre`, `LibelGenre`) VALUES
(1, 'Aventure');

-- --------------------------------------------------------

--
-- Table structure for table `Genrer`
--

CREATE TABLE `Genrer` (
  `ISBN` varchar(20) NOT NULL,
  `IdGenre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Genrer`
--

INSERT INTO `Genrer` (`ISBN`, `IdGenre`) VALUES
('9782203001091', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Image`
--

CREATE TABLE `Image` (
  `IdImage` int(11) NOT NULL,
  `LienImage` varchar(200) DEFAULT NULL,
  `IdAnnonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Image`
--

INSERT INTO `Image` (`IdImage`, `LienImage`, `IdAnnonce`) VALUES
(1, './images/tintin.jpg', 1),
(2, 'https://www.bdfugue.com/media/catalog/product/cache/072aec3fcd47dee2d0b978892a40d848/9/7/9791034752065_1_75.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE `Location` (
  `IdAnnonce` int(11) NOT NULL,
  `Prix` double DEFAULT NULL,
  `Duree` int(11) DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateRendu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`IdAnnonce`, `Prix`, `Duree`, `DateDebut`, `DateRendu`) VALUES
(1, 2, 3, '2024-06-15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MaisonEdition`
--

CREATE TABLE `MaisonEdition` (
  `IdMaisonEdit` int(11) NOT NULL,
  `LibelMaisonEdit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MaisonEdition`
--

INSERT INTO `MaisonEdition` (`IdMaisonEdit`, `LibelMaisonEdit`) VALUES
(1, 'Casterman');

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

CREATE TABLE `Message` (
  `IdMessage` int(11) NOT NULL,
  `Texte` text DEFAULT NULL,
  `DateEnvoie` datetime DEFAULT NULL,
  `IdConversation` int(11) NOT NULL,
  `IdUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Message`
--

INSERT INTO `Message` (`IdMessage`, `Texte`, `DateEnvoie`, `IdConversation`, `IdUtilisateur`) VALUES
(2, 'Bonjour', '2024-06-13 12:15:41', 1, 2),
(3, 'Test', '2024-06-11 01:12:58', 1, 2),
(4, 'Bonjour', '2024-06-11 01:24:38', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Ouvrage`
--

CREATE TABLE `Ouvrage` (
  `ISBN` varchar(20) NOT NULL,
  `Titre` varchar(50) DEFAULT NULL,
  `numTome` int(11) DEFAULT NULL,
  `Resume` text DEFAULT NULL,
  `LienImageCouverture` varchar(200) DEFAULT NULL,
  `IdMaisonEdit` int(11) NOT NULL,
  `IdFormat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Ouvrage`
--

INSERT INTO `Ouvrage` (`ISBN`, `Titre`, `numTome`, `Resume`, `LienImageCouverture`, `IdMaisonEdit`, `IdFormat`) VALUES
('9782203001091', 'Tintin - L\'Etoile mystérieuse', 10, 'C\'est une histoire de Tintin', './images/tintin.jpg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Repondre`
--

CREATE TABLE `Repondre` (
  `IdUtilisateur` int(11) NOT NULL,
  `IdAnnonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Repondre`
--

INSERT INTO `Repondre` (`IdUtilisateur`, `IdAnnonce`) VALUES
(2, 1);

--
-- Triggers `Repondre`
--
DELIMITER $$
CREATE TRIGGER `verifReponse` BEFORE INSERT ON `Repondre` FOR EACH ROW BEGIN
    DECLARE nbLigne INT;
    SELECT COUNT(*)
    INTO nbLigne
    FROM Repondre
    WHERE IdAnnonce = NEW.IdAnnonce AND IdUtilisateur = NEW.IdUtilisateur;
    
    IF nbLigne > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Vous avez déjà répondu à cette annonce';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Souhaiter`
--

CREATE TABLE `Souhaiter` (
  `ISBN` varchar(20) NOT NULL,
  `IdAnnonce` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Utilisateur`
--

CREATE TABLE `Utilisateur` (
  `IdUtilisateur` int(11) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Pseudo` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `Tel` char(10) DEFAULT NULL,
  `Mdp` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Utilisateur`
--

INSERT INTO `Utilisateur` (`IdUtilisateur`, `Email`, `Pseudo`, `Prenom`, `Tel`, `Mdp`) VALUES
(1, 'vincent@gmail.com', 'Vin100', 'Vincent', '0102030405', '2713174f3c43672ebf6ade9e6d3094e5c87226ca634457906f710bff899dff34'),
(2, 'sarah@gmail.com', 'P_Sarah', 'Sarah', '0203040506', '3885b3bd0dcfdaad1ec7f3c09d6ea18080057a505df26781cecb5e3fd4d41e27');

-- --------------------------------------------------------

--
-- Table structure for table `Vente`
--

CREATE TABLE `Vente` (
  `IdAnnonce` int(11) NOT NULL,
  `Prix` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Vente`
--

INSERT INTO `Vente` (`IdAnnonce`, `Prix`) VALUES
(2, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Annonce`
--
ALTER TABLE `Annonce`
  ADD PRIMARY KEY (`IdAnnonce`),
  ADD KEY `IdUtilisateur` (`IdUtilisateur`);

--
-- Indexes for table `Auteur`
--
ALTER TABLE `Auteur`
  ADD PRIMARY KEY (`IdAuteur`);

--
-- Indexes for table `Concerner`
--
ALTER TABLE `Concerner`
  ADD PRIMARY KEY (`IdAnnonce`,`IdUtilisateur`,`ISBN`,`NumeroExemp`),
  ADD KEY `IdUtilisateur` (`IdUtilisateur`,`ISBN`,`NumeroExemp`);

--
-- Indexes for table `Concevoir`
--
ALTER TABLE `Concevoir`
  ADD PRIMARY KEY (`ISBN`,`IdAuteur`),
  ADD KEY `IdAuteur` (`IdAuteur`);

--
-- Indexes for table `Conversation`
--
ALTER TABLE `Conversation`
  ADD PRIMARY KEY (`IdConversation`),
  ADD KEY `IdAnnonce` (`IdAnnonce`);

--
-- Indexes for table `Echange`
--
ALTER TABLE `Echange`
  ADD PRIMARY KEY (`IdAnnonce`);

--
-- Indexes for table `Exemplaire`
--
ALTER TABLE `Exemplaire`
  ADD PRIMARY KEY (`IdUtilisateur`,`ISBN`,`NumeroExemp`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `Format`
--
ALTER TABLE `Format`
  ADD PRIMARY KEY (`IdFormat`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`IdGenre`);

--
-- Indexes for table `Genrer`
--
ALTER TABLE `Genrer`
  ADD PRIMARY KEY (`ISBN`,`IdGenre`),
  ADD KEY `IdGenre` (`IdGenre`);

--
-- Indexes for table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`IdImage`),
  ADD KEY `IdAnnonce` (`IdAnnonce`);

--
-- Indexes for table `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`IdAnnonce`);

--
-- Indexes for table `MaisonEdition`
--
ALTER TABLE `MaisonEdition`
  ADD PRIMARY KEY (`IdMaisonEdit`);

--
-- Indexes for table `Message`
--
ALTER TABLE `Message`
  ADD PRIMARY KEY (`IdMessage`),
  ADD KEY `IdConversation` (`IdConversation`),
  ADD KEY `IdUtilisateur` (`IdUtilisateur`);

--
-- Indexes for table `Ouvrage`
--
ALTER TABLE `Ouvrage`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `IdMaisonEdit` (`IdMaisonEdit`),
  ADD KEY `IdFormat` (`IdFormat`);

--
-- Indexes for table `Repondre`
--
ALTER TABLE `Repondre`
  ADD PRIMARY KEY (`IdUtilisateur`,`IdAnnonce`),
  ADD KEY `IdAnnonce` (`IdAnnonce`);

--
-- Indexes for table `Souhaiter`
--
ALTER TABLE `Souhaiter`
  ADD PRIMARY KEY (`ISBN`,`IdAnnonce`),
  ADD KEY `IdAnnonce` (`IdAnnonce`);

--
-- Indexes for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`IdUtilisateur`);

--
-- Indexes for table `Vente`
--
ALTER TABLE `Vente`
  ADD PRIMARY KEY (`IdAnnonce`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Annonce`
--
ALTER TABLE `Annonce`
  MODIFY `IdAnnonce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Conversation`
--
ALTER TABLE `Conversation`
  MODIFY `IdConversation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Format`
--
ALTER TABLE `Format`
  MODIFY `IdFormat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Genre`
--
ALTER TABLE `Genre`
  MODIFY `IdGenre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Image`
--
ALTER TABLE `Image`
  MODIFY `IdImage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `MaisonEdition`
--
ALTER TABLE `MaisonEdition`
  MODIFY `IdMaisonEdit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Message`
--
ALTER TABLE `Message`
  MODIFY `IdMessage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `IdUtilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Vente`
--
ALTER TABLE `Vente`
  MODIFY `IdAnnonce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Annonce`
--
ALTER TABLE `Annonce`
  ADD CONSTRAINT `Annonce_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur` (`IdUtilisateur`);

--
-- Constraints for table `Concerner`
--
ALTER TABLE `Concerner`
  ADD CONSTRAINT `Concerner_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`),
  ADD CONSTRAINT `Concerner_ibfk_2` FOREIGN KEY (`IdUtilisateur`,`ISBN`,`NumeroExemp`) REFERENCES `Exemplaire` (`IdUtilisateur`, `ISBN`, `NumeroExemp`);

--
-- Constraints for table `Concevoir`
--
ALTER TABLE `Concevoir`
  ADD CONSTRAINT `Concevoir_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Ouvrage` (`ISBN`),
  ADD CONSTRAINT `Concevoir_ibfk_2` FOREIGN KEY (`IdAuteur`) REFERENCES `Auteur` (`IdAuteur`);

--
-- Constraints for table `Conversation`
--
ALTER TABLE `Conversation`
  ADD CONSTRAINT `Conversation_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`);

--
-- Constraints for table `Echange`
--
ALTER TABLE `Echange`
  ADD CONSTRAINT `Echange_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`);

--
-- Constraints for table `Exemplaire`
--
ALTER TABLE `Exemplaire`
  ADD CONSTRAINT `Exemplaire_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur` (`IdUtilisateur`),
  ADD CONSTRAINT `Exemplaire_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `Ouvrage` (`ISBN`);

--
-- Constraints for table `Genrer`
--
ALTER TABLE `Genrer`
  ADD CONSTRAINT `Genrer_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Ouvrage` (`ISBN`),
  ADD CONSTRAINT `Genrer_ibfk_2` FOREIGN KEY (`IdGenre`) REFERENCES `Genre` (`IdGenre`);

--
-- Constraints for table `Image`
--
ALTER TABLE `Image`
  ADD CONSTRAINT `Image_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`);

--
-- Constraints for table `Location`
--
ALTER TABLE `Location`
  ADD CONSTRAINT `Location_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`);

--
-- Constraints for table `Message`
--
ALTER TABLE `Message`
  ADD CONSTRAINT `Message_ibfk_1` FOREIGN KEY (`IdConversation`) REFERENCES `Conversation` (`IdConversation`),
  ADD CONSTRAINT `Message_ibfk_2` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur` (`IdUtilisateur`);

--
-- Constraints for table `Ouvrage`
--
ALTER TABLE `Ouvrage`
  ADD CONSTRAINT `Ouvrage_ibfk_1` FOREIGN KEY (`IdMaisonEdit`) REFERENCES `MaisonEdition` (`IdMaisonEdit`),
  ADD CONSTRAINT `Ouvrage_ibfk_2` FOREIGN KEY (`IdFormat`) REFERENCES `Format` (`IdFormat`);

--
-- Constraints for table `Repondre`
--
ALTER TABLE `Repondre`
  ADD CONSTRAINT `Repondre_ibfk_1` FOREIGN KEY (`IdUtilisateur`) REFERENCES `Utilisateur` (`IdUtilisateur`),
  ADD CONSTRAINT `Repondre_ibfk_2` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`);

--
-- Constraints for table `Souhaiter`
--
ALTER TABLE `Souhaiter`
  ADD CONSTRAINT `Souhaiter_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Ouvrage` (`ISBN`),
  ADD CONSTRAINT `Souhaiter_ibfk_2` FOREIGN KEY (`IdAnnonce`) REFERENCES `Echange` (`IdAnnonce`);

--
-- Constraints for table `Vente`
--
ALTER TABLE `Vente`
  ADD CONSTRAINT `Vente_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
