-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 18 juin 2024 à 14:49
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `angular_admin`
--

-- --------------------------------------------------------

--
-- Structure de la table `justificatif`
--

DROP TABLE IF EXISTS `justificatif`;
CREATE TABLE IF NOT EXISTS `justificatif` (
  `id_justificatif` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `lien` varchar(50) DEFAULT NULL,
  `id_retard` int NOT NULL,
  PRIMARY KEY (`id_justificatif`),
  KEY `id_retard` (`id_retard`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `retard`
--

DROP TABLE IF EXISTS `retard`;
CREATE TABLE IF NOT EXISTS `retard` (
  `id_retard` int NOT NULL AUTO_INCREMENT,
  `justifie` varchar(50) DEFAULT NULL,
  `retard_date` datetime DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_user_1` int NOT NULL,
  PRIMARY KEY (`id_retard`),
  KEY `id_user` (`id_user`),
  KEY `id_user_1` (`id_user_1`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `retard`
--

INSERT INTO `retard` (`id_retard`, `justifie`, `retard_date`, `id_user`, `id_user_1`) VALUES
(1, 'Trafic intense', '2023-10-01 00:00:00', 1, 2),
(2, 'Problème de santé', '2023-10-02 00:00:00', 2, 3),
(3, 'Panne de réveil', '2023-10-03 00:00:00', 3, 4),
(4, 'Grève des transports', '2023-10-04 00:00:00', 4, 5),
(5, 'Accident de voiture', '2023-10-05 00:00:00', 5, 6),
(6, 'Conditions météorologiques', '2023-10-06 00:00:00', 6, 7),
(7, 'Rendez-vous médical', '2023-10-07 00:00:00', 7, 8),
(8, 'Problème familial', '2023-10-08 00:00:00', 8, 9),
(9, 'Oubli de l\'heure', '2023-10-09 00:00:00', 9, 10),
(10, 'Problème de transport', '2023-10-10 00:00:00', 10, 11);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'Admin'),
(2, 'Eleve');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `id_role` int NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_role` (`id_role`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_user`, `email`, `password`, `firstname`, `lastname`, `id_role`) VALUES
(1, 'admin@admin.com', '$2y$10$RG/Cg8O9Jnrs6VZPcb7bw.cDymc/3VVljRLpEecNFJb3CzCUG4P3W', 'Gael', 'Bessac', 1),
(2, 'eleve@eleve.com', '$2y$10$RG/Cg8O9Jnrs6VZPcb7bw.cDymc/3VVljRLpEecNFJb', 'eleve', 'eleve', 2),
(3, 'alice@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Alice', 'Smith', 1),
(4, 'bob@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Bob', 'Johnson', 2),
(5, 'carol@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Carol', 'Williams', 3),
(6, 'dave@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Dave', 'Brown', 1),
(7, 'eve@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Eve', 'Jones', 2),
(8, 'frank@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Frank', 'Garcia', 3),
(9, 'grace@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Grace', 'Martinez', 1),
(10, 'heidi@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Heidi', 'Rodriguez', 2),
(11, 'ivan@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Ivan', 'Wilson', 3),
(12, 'judy@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Judy', 'Lopez', 1),
(14, 'oscar@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Oscar', 'Hernandez', 3),
(15, 'peggy@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Peggy', 'King', 1),
(16, 'trent@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Trent', 'Wright', 2),
(17, 'victor@example.com', ' $2y$10$vQ.KnMQsJnfUzipxlZ0MjO.qxF4Zy8WYYhgypjFMlM0jF.Wb84ksq ', 'Victor', 'Scott', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
