-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 23 déc. 2021 à 15:41
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ptut`
--

-- --------------------------------------------------------

--
-- Structure de la table `calendar`
--

CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `calendar`
--

INSERT INTO `calendar` (`id`, `title`, `type`, `link`) VALUES
(2, 'S03', 'ROOM_INFO', '119'),
(7, 'S01', 'ROOM_INFO', '118'),
(12, 'S13', 'ROOM_INFO', '120');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `color_id` int(10) DEFAULT '2',
  `icon` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `coef` float NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `category_id`, `title`, `color_id`, `icon`, `module`, `coef`) VALUES
(1, NULL, 'dut Informatique doua', 11, 'https://img.icons8.com/ios-filled/480/000000/my-computer--v3.png', NULL, 1),
(2, 1, 'semestre 1', 17, 'https://img.icons8.com/material/480/000000/1-circle-c.png', NULL, 1),
(3, 1, 'semestre 2', 17, 'https://img.icons8.com/material/480/000000/2-circle-c.png', NULL, 1),
(4, 1, 'semestre 3', 17, 'https://img.icons8.com/material/480/000000/3-circle-c.png', NULL, 1),
(5, 1, 'semestre 4', 17, 'https://img.icons8.com/material/480/000000/4-circle-c.png', NULL, 1),
(6, 2, 'achitecture', 2, 'https://img.icons8.com/external-flatart-icons-outline-flatarticons/544/000000/external-binary-code-web-security-flatart-icons-outline-flatarticons.png', '', 1),
(7, 2, 'windows', 3, 'https://img.icons8.com/metro/480/000000/windows-logo.png', NULL, 1),
(8, 2, 'linux', 4, 'https://img.icons8.com/ios/550/000000/linux.png', 'M1101-3', 1),
(9, 2, 'algorithmie', 6, 'https://img.icons8.com/ios/480/000000/python--v1.png', 'M1101-1', 1),
(10, 2, 'c', 5, 'https://img.icons8.com/ios-filled/450/000000/circled-c.png', 'M1101-2', 1),
(11, 2, 'MDD', 7, 'https://img.icons8.com/fluent-systems-regular/480/000000/project-diagram.png', 'M1104-1', 1),
(12, 2, 'sql', 10, 'https://img.icons8.com/ios/400/000000/database-restore.png', 'M1104-2', 1),
(13, 2, 'web', 8, 'https://img.icons8.com/ios/250/000000/web.png', 'M1105', 1),
(15, 2, 'économie', 9, 'https://img.icons8.com/ios-filled/450/000000/profit-analysis.png', NULL, 1),
(16, 2, 'fonction orga', 11, 'https://img.icons8.com/wired/320/000000/marketing.png', 'M1205', 1),
(17, 2, 'anglais', 19, 'https://img.icons8.com/ios-filled/50/000000/great-britain.png', 'M1206', 1),
(18, 2, 'ppp', 9, 'https://img.icons8.com/ios-filled/500/000000/thinking-male.png', NULL, 1),
(19, 2, 'communication', 12, 'https://img.icons8.com/dotty/500/000000/communication-skill.png', 'M1205', 1),
(20, 2, 'maths discrètes', 3, 'https://img.icons8.com/ios/480/000000/doughnut-chart--v1.png', 'M1201', 1),
(21, 2, 'algèbre linéaire', 3, 'https://img.icons8.com/external-prettycons-lineal-prettycons/480/000000/external-maths-education-prettycons-lineal-prettycons-1.png', NULL, 1),
(22, 3, 'architecture', 2, 'https://img.icons8.com/pastel-glyph/640/000000/binary-file--v1.png', NULL, 1),
(23, 3, 'réseaux', 6, 'https://img.icons8.com/ios/480/000000/networking-manager.png', 'M2102', 1),
(24, 3, 'sdd', 2, 'https://img.icons8.com/ios/450/000000/python--v1.png', NULL, 1),
(25, 3, 'java', 2, 'https://img.icons8.com/ios-filled/250/000000/java-coffee-cup-logo--v1.png', NULL, 1),
(26, 3, 'CVDA', 2, 'https://img.icons8.com/windows/532/000000/git.png', NULL, 1),
(27, 3, 'UML', 2, 'https://img.icons8.com/windows/32/000000/project-diagram.png', NULL, 1),
(28, 3, 'ergonomie', 2, 'https://img.icons8.com/windows/532/000000/design--v1.png', 'M2105', 1),
(29, 3, 'prog IHM', 2, 'https://img.icons8.com/windows/532/000000/java-files.png', NULL, 1),
(30, 3, 'BDD', 10, 'https://img.icons8.com/ios/480/000000/database-restore.png', 'M2106', 1),
(32, 3, 'comptabilité', 2, 'https://img.icons8.com/ios/450/000000/accounting.png', NULL, 1),
(33, 3, 'droit', 14, 'https://img.icons8.com/dotty/480/000000/law-book.png', 'M2203', 1),
(34, 3, 'GPI', 2, 'https://img.icons8.com/ios/550/000000/task-planning.png', 'M2204', 1),
(35, 3, 'communication', 3, 'https://img.icons8.com/dotty/500/000000/communication-skill.png', 'M2205', 1),
(36, 3, 'anglais', 19, 'https://img.icons8.com/ios-filled/50/000000/great-britain.png', 'M2206', 1),
(37, 3, 'PPP', 9, 'https://img.icons8.com/ios-filled/500/000000/thinking-male.png', NULL, 1),
(38, 3, 'graphes', 3, 'https://img.icons8.com/ios/50/000000/doughnut-chart--v1.png', 'M2201', 1),
(39, 3, 'analyse', 3, 'https://img.icons8.com/external-prettycons-lineal-prettycons/480/000000/external-maths-education-prettycons-lineal-prettycons-1.png', 'M2202', 1),
(40, 4, 'SE', 8, 'https://img.icons8.com/ios-filled/480/000000/linux.png', 'M3101', 1),
(41, 4, 'réseaux', 6, 'https://img.icons8.com/ios/480/000000/networking-manager.png', 'M3102', 1),
(42, 4, 'algorithmie', 6, 'https://img.icons8.com/ios/480/000000/python--v1.png', 'M3103', 1),
(43, 4, 'php', 15, 'https://img.icons8.com/ios/480/000000/php-server.png', 'M3104', 1),
(44, 4, 'GPI', 13, NULL, 'M3301', 1),
(45, 4, 'CPOA', 17, 'https://img.icons8.com/windows/532/000000/git.png', 'M3105', 1),
(46, 4, 'bda', 10, 'https://img.icons8.com/ios/480/000000/database-restore.png', 'M3106C', 1),
(48, 4, 'droit', 14, 'https://img.icons8.com/dotty/480/000000/law-book.png', 'M3203', 1),
(49, 4, 'gsi', 12, 'https://img.icons8.com/ios/450/000000/accounting.png', 'M3204', 1),
(50, 4, 'communication', 3, 'https://img.icons8.com/dotty/500/000000/communication-skill.png', 'M3205', 1),
(51, 4, 'anglais', 19, 'https://img.icons8.com/ios-filled/50/000000/great-britain.png', 'M3206', 1),
(52, 4, 'mod proc', 7, 'https://img.icons8.com/android/480/000000/workflow.png', 'M3301-1', 1),
(54, 4, 'ppp', 9, 'https://img.icons8.com/ios-filled/500/000000/thinking-male.png', 'M3303', 1),
(55, 4, 'probabilité', 3, 'https://img.icons8.com/external-prettycons-lineal-prettycons/480/000000/external-maths-education-prettycons-lineal-prettycons-1.png', 'M3201', 1),
(56, 4, 'modélisation', 3, 'https://img.icons8.com/ios/50/000000/doughnut-chart--v1.png', 'M3202', 1),
(57, 5, 'anglais', 2, 'https://img.icons8.com/ios-filled/50/000000/great-britain.png', NULL, 1),
(58, NULL, 'but informatique', 11, 'https://img.icons8.com/ios-filled/480/000000/my-computer--v3.png', NULL, 1),
(59, 58, 'semestre 1', 17, 'https://img.icons8.com/material/480/000000/1-circle-c.png', NULL, 1),
(60, 58, 'semestre 2', 17, 'https://img.icons8.com/material/480/000000/2-circle-c.png', NULL, 1),
(61, 58, 'semestre 3', 17, 'https://img.icons8.com/material/480/000000/3-circle-c.png', NULL, 1),
(62, 58, 'semestre 4', 17, 'https://img.icons8.com/material/480/000000/4-circle-c.png', NULL, 1),
(63, 59, 'c', 2, 'https://img.icons8.com/ios-filled/450/000000/circled-c.png', 'R1.01-2', 1),
(64, 59, 'algorithmie', 2, 'https://img.icons8.com/ios/450/000000/python.png', 'R1.01-1', 1),
(66, 59, 'web', 2, 'https://img.icons8.com/ios/250/000000/web.png', 'R1.02-1', 1),
(67, 59, 'achitecture', 2, 'https://img.icons8.com/pastel-glyph/640/000000/binary-file--v1.png', 'R1.03', 1),
(68, 59, 'économie', 2, 'https://img.icons8.com/ios-filled/450/000000/profit-analysis.png', 'R1.09', 1),
(69, 59, 'comth', 2, NULL, 'R1.11', 1),
(70, 59, 'anglais', 2, 'https://img.icons8.com/ios-filled/50/000000/great-britain.png', 'R1.10', 1),
(71, 59, 'intro systeme', 2, 'https://img.icons8.com/ios/550/000000/operating-system.png', 'R1.04', 1),
(72, 59, 'conception bd', 2, 'https://img.icons8.com/ios/480/000000/database-restore.png', 'R1.05-1', 1),
(73, 59, 'ppp', 2, 'https://img.icons8.com/ios-filled/500/000000/thinking-male.png', 'R1.12', 1),
(74, 59, 'maths fond', 2, 'https://img.icons8.com/external-prettycons-lineal-prettycons/480/000000/external-maths-education-prettycons-lineal-prettycons-1.png', 'R1.07', 1),
(75, 59, 'maths discretes', 2, 'https://img.icons8.com/ios/480/000000/doughnut-chart--v1.png', 'R1.06', 1),
(76, 59, 'sql', 2, 'https://img.icons8.com/ios/400/000000/database-restore.png', 'R1.05-2', 1),
(77, 59, 'gestion projet', 2, 'https://img.icons8.com/ios/550/000000/task-planning.png', 'R1.08', 1),
(78, 5, 'programation web client riche', 2, '', 'M4103C', 1),
(79, 5, 'administration système et réseau', 2, NULL, NULL, 1),
(80, 5, 'appli mobile', 2, '', 'M4104C', 1),
(81, 5, 'programation répartie', 2, NULL, NULL, 1),
(82, 5, 'sécurité réseau', 2, NULL, NULL, 1),
(83, 5, 'api web', 2, NULL, NULL, 1),
(84, 5, 'sécurité réseau wifi', 2, NULL, NULL, 1),
(85, 5, 'communication', 2, NULL, NULL, 1),
(86, 5, 'anglais', 2, '', 'M4203', 1),
(87, 5, 'Business', 2, NULL, NULL, 1),
(88, 5, 'méthode agiles', 2, NULL, NULL, 1),
(89, 5, 'atelier création d\'entreprise', 2, NULL, NULL, 1),
(90, 5, 'cloud computing', 2, '', 'M41L02C', 1),
(91, 5, 'ia', 2, NULL, NULL, 1),
(92, 5, 'c++', 2, '', NULL, 1),
(93, 5, 'initiation rust', 2, NULL, NULL, 1),
(94, 5, '.net', 2, NULL, NULL, 1),
(95, 5, 'recherche opérationelle', 2, NULL, NULL, 1),
(97, 5, 'complément maths', 2, NULL, NULL, 1),
(98, 5, 'maths avancées', 2, NULL, NULL, 1),
(99, 5, 'imagerie', 2, NULL, NULL, 1),
(100, 5, 'analyse de données', 2, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `semester_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `ics_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `class`
--

INSERT INTO `class` (`id`, `department_id`, `semester_id`, `title`, `ics_link`) VALUES
(0, 1, 4, 'G1', '9311'),
(1, 1, 4, 'G2', '9312'),
(2, 1, 4, 'G3', '9313'),
(3, 1, 4, 'G4', '9314'),
(4, 1, 3, 'G6', '9310'),
(5, 1, 5, 'G6A', '9293'),
(6, 1, 5, 'G6B', '5484'),
(7, 58, 59, 'G1A', '12096'),
(8, 58, 59, 'G1B', '12102'),
(9, 58, 59, 'G2A', '12403'),
(10, 58, 59, 'G2B', '12406'),
(11, 58, 59, 'G3A', '12419'),
(12, 58, 59, 'G3B', '12425'),
(13, 58, 59, 'G4A', '12424'),
(14, 58, 59, 'G4B', '12444'),
(15, 58, 59, 'G5A', '12460'),
(16, 58, 59, 'G5B', '12461');

-- --------------------------------------------------------

--
-- Structure de la table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `color`
--

INSERT INTO `color` (`id`, `color`, `title`) VALUES
(1, '#ffcfcf', 'pink'),
(2, '#ededed', 'grey'),
(3, '#ffcfcf', 'beige'),
(4, '#ffc480', 'orange'),
(5, '#e1cfff', 'light_purple'),
(6, '#8FC7E8', 'blue'),
(7, '#EB4655', 'red'),
(8, '#B791CD', 'purple'),
(9, '#7CCCA8', 'green_blue'),
(10, '#FBE4CD', 'light_beige'),
(11, '#8CE6D3', 'light_green'),
(12, '#7CB6CD', 'sky'),
(13, '#F8E595', 'yellow'),
(14, '#B5D8AB', 'green'),
(15, '#FCB9A9', 'red_orange'),
(16, '#B7CFB7', 'white_green'),
(17, '#D3E8DF', 'light_grey'),
(18, '#F39893', 'light_red'),
(19, '#72BFD9', 'light_blue');

-- --------------------------------------------------------

--
-- Structure de la table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(11) NOT NULL,
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `conversation`
--

INSERT INTO `conversation` (`id`, `user1_id`, `user2_id`) VALUES
(25, 32, 52),
(26, 32, 33),
(27, 32, 34),
(28, 32, 35),
(29, 54, 32),
(30, 32, 32),
(31, 52, 36),
(32, 32, 36),
(33, 52, 50);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `drive_key` varchar(255) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `creation_date` varchar(100) DEFAULT NULL,
  `section` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `category_id`, `user_id`, `drive_key`, `title`, `mimetype`, `creation_date`, `section`) VALUES
(17, 23, 32, '1UveoJ-LeKJXvxMfuhVEwP1iDWkE4Dv8k', 'sami', 'jpg', 'Mon Oct 18 2021 22:03:59 GMT+0200 (heure d’été d’Europe centrale)', 2),
(18, 23, 32, '1QAwtERDqNeaYvy94QNn5fI2g1iHOiDAd', 'test', 'pdf', 'Mon Oct 18 2021 22:05:10 GMT+0200 (heure d’été d’Europe centrale)', 1),
(19, 23, 32, '13COHcqd-lb8ogqAwatcyLx7xEfh8icsC', 'test', 'ppsx', 'Mon Oct 18 2021 22:06:45 GMT+0200 (heure d’été d’Europe centrale)', 3),
(20, 6, 32, '13tuiVlqiIIcWeQ1vphLNSYFbJqmyEmRt', 're', 'docx', 'Mon Oct 18 2021 22:08:24 GMT+0200 (heure d’été d’Europe centrale)', 2),
(21, 23, 32, '1T8NluMr77zkO0tFXwfo7YpLIKmd-wYHw', 'pas encore', 'png', 'Mon Oct 18 2021 22:10:07 GMT+0200 (heure d’été d’Europe centrale)', 1),
(22, 22, 32, '1wq560xMu0Cxu72b0vbogBQXll7XCkU9h', 'test', 'pdf', 'Tue Oct 19 2021 09:47:44 GMT+0200 (heure d’été d’Europe centrale)', 3),
(23, 23, 32, '1tlPVCMNa3DRbzgI4aBJpUeuF0-1Iam6X', 'cours de réseau', 'pdf', 'Tue Oct 19 2021 12:19:14 GMT+0200 (heure d’été d’Europe centrale)', 3),
(24, 23, 32, '1bKVMB8dTd6HJu5grep0xnQusIEYQ7D-W', 'test', 'txt', 'Wed Nov 10 2021 09:46:25 GMT+0100 (heure normale d’Europe centrale)', 3),
(25, 23, 52, '1jRNI0MjE1eC5bZK9sSBVosA61PcruGXW', 'test', 'pdf', 'Thu Nov 11 2021 19:20:52 GMT+0100 (heure normale d’Europe centrale)', 1),
(26, 40, 52, '12GoW1e0Chcbgs8Xu2pbfk1iwYHI3SLUL', 'oi', 'pdf', 'Thu Nov 11 2021 19:21:51 GMT+0100 (heure normale d’Europe centrale)', 1),
(27, 40, 52, '19nTmIA8mAebYdHGaab6INUbZth_cftmP', 'ok', 'txt', 'Thu Nov 11 2021 19:23:05 GMT+0100 (heure normale d’Europe centrale)', 1),
(28, 42, 32, '1AYcyg0jPxsyiVnvNLau-EUXrvrhWPsYj', 'fiche algo', 'pdf', 'Fri Nov 12 2021 21:26:26 GMT+0100 (heure normale d’Europe centrale)', 3),
(29, 42, 32, '1P0BfuycLkbVnjTGfVJlgKtcqeFnjBphd', 'test', 'pdf', 'Sat Nov 13 2021 19:09:35 GMT+0100 (heure normale d’Europe centrale)', 1),
(30, 23, 32, '14hVtBCF9A8YEaLVSZtVFsJwgakfG1que', 'cours sur le réseau', 'pptx', 'Sun Dec 05 2021 22:50:05 GMT+0100 (heure normale d’Europe centrale)', 1),
(31, 23, 32, '13z6UkDKDdHYzD_1bCZVUMWtsWzh_Rslz', 'chapitre 1', 'py', 'Tue Dec 14 2021 13:29:02 GMT+0100 (heure normale d’Europe centrale)', 1),
(32, 7, 32, '1PNGHfQ70_nZKikdnQemLgfWjiK0nNiTU', 'test', 'sql', 'Wed Dec 22 2021 01:22:27 GMT+0100 (heure normale d’Europe centrale)', 1),
(33, 23, 32, '1N8A2Egrx5VeF5JJHe7_9LbDnRLaqf6Db', 'test', 'jpg', 'Wed Dec 22 2021 01:27:17 GMT+0100 (heure normale d’Europe centrale)', 1);

-- --------------------------------------------------------

--
-- Structure de la table `favorite_category`
--

CREATE TABLE `favorite_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `favorite_category`
--

INSERT INTO `favorite_category` (`id`, `category_id`, `user_id`) VALUES
(72, 1, 33),
(73, 23, 33),
(75, 1, 34),
(76, 23, 34),
(78, 1, 36),
(79, 23, 36),
(81, 1, 35),
(82, 23, 35),
(88, 42, 50),
(89, 41, 50),
(90, 50, 50),
(97, 23, 32),
(98, 5, 32),
(105, 52, 52),
(112, 38, 32),
(113, 3, 32),
(115, 56, 54),
(116, 49, 54),
(118, 4, 54),
(119, 4, 52),
(120, 4, 32),
(122, 40, 52);

-- --------------------------------------------------------

--
-- Structure de la table `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `creation_date` varchar(255) NOT NULL,
  `tomuss` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `grade` float NOT NULL DEFAULT '10',
  `max` float NOT NULL DEFAULT '20',
  `description` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `coef` float NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mark`
--

INSERT INTO `mark` (`id`, `creation_date`, `tomuss`, `deleted`, `grade`, `max`, `description`, `title`, `coef`, `user_id`) VALUES
(107, '2021-11-22 15:38:04.000', 1, 0, 7, 20, 'M3206 Collaborer En Anglais,<br>Valeur modifiée par <b>anne.corrigan</b>,<br>14h38.04 le 22/11/2021<br>', 'Groups', 1, 52),
(108, '2021-11-25 22:34:49.000', 1, 0, 13.5, 20, 'M3201 Probabilités Et Statistiques,<br>Valeur modifiée par <b>aude.joubert</b>,<br>21h34.49 le 25/11/2021<br>', 'DS2', 1, 52),
(109, '2021-12-14 19:47:09.000', 1, 0, 14.75, 20, 'M3204-1 Partie 2,<br>Valeur modifiée par <b>a.lagache</b>,<br>18h47.09 le 14/12/2021<br>', 'DS', 1, 52),
(110, '2021-12-15 21:53:25.000', 1, 0, 18, 20, 'M3104-1 Php,<br>Valeur modifiée par <b>quentin.vergara</b>,<br>20h53.25 le 15/12/2021<br>', 'DS', 1, 52),
(111, '2021-06-21 12:57:40.000', 1, 0, 17.5, 20, 'M2102 : Architecture Des Réseaux,<br>Valeur modifiée par <b>ariane.baron</b>,<br>10h54.52 le 21/06/2021<br>', 'DS_commun', 1, 52),
(112, '2021-06-21 14:03:04.000', 1, 0, 15.1, 20, 'M2106 : Programmation Et Administration Des Bases De Données,<br>Valeur modifiée par <b>ch.bonnet</b>,<br>12h03.04 le 21/06/2021<br>', 'Moyenne_(note_finale)', 1, 52),
(113, '2021-06-21 21:23:33.000', 1, 0, 16.25, 20, 'M2203 :Environnement Comptable, Financier, Juridique, Social,<br>Valeur modifiée par <b>a.lagache</b>,<br>19h23.33 le 21/06/2021<br>', 'DS2', 1, 52),
(114, '2021-06-21 23:16:24.000', 1, 0, 13, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.24 le 21/06/2021<br>', 'Séance7', 1, 52),
(115, '2021-06-21 23:16:25.000', 1, 0, 13, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.25 le 21/06/2021<br>', 'Séance8', 1, 52),
(116, '2021-06-21 23:16:26.000', 1, 0, 17, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.26 le 21/06/2021<br>', 'Séance9', 1, 52),
(117, '2021-06-21 23:16:31.000', 1, 0, 13, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.31 le 21/06/2021<br>', 'Séance10', 1, 52),
(118, '2021-06-21 23:38:41.000', 1, 0, 15.5, 20, 'M2205 Expression-Communication : Information &amp; Argumentation,<br>Valeur modifiée par <b>jocelyne.deboute</b>,<br>21h38.41 le 21/06/2021<br>', 'Affiche', 1, 52),
(119, '2021-06-21 23:42:34.000', 1, 0, 18, 20, 'M2205 Expression-Communication : Information &amp; Argumentation,<br>Valeur modifiée par <b>jocelyne.deboute</b>,<br>21h42.34 le 21/06/2021<br>', 'Argu', 1, 52),
(120, '2021-06-22 00:38:21.000', 1, 0, 14, 20, 'M2205 Expression-Communication : Information &amp; Argumentation,<br>Valeur modifiée par <b>jocelyne.deboute</b>,<br>22h38.21 le 21/06/2021<br>', 'Radio', 1, 52),
(121, '2021-01-17 18:32:31.000', 1, 0, 9.25, 20, 'M1202 : Algèbre Linéaire,<br>Valeur modifiée par <b>christophe.jaloux</b>,<br>17h32.31 le 17/01/2021<br>', 'Note_DS2', 1, 52),
(122, '2021-01-17 22:21:43.000', 1, 0, 15, 20, 'M1105-1 Web,<br>Valeur modifiée par <b>quentin.dalmazir</b>,<br>21h21.43 le 17/01/2021<br>', 'Séance1', 1, 52),
(123, '2021-01-17 23:20:35.000', 1, 0, 12.958, 20, 'M1101-2 C Introduction,<br>Valeur modifiée par <b>vincent.vidal</b>,<br>22h20.35 le 17/01/2021<br>', 'DS_promo', 1, 52),
(124, '2021-01-17 23:21:41.000', 1, 0, 14.825, 20, 'M1101-2 C Introduction,<br>Valeur modifiée par <b>vincent.vidal</b>,<br>22h21.41 le 17/01/2021<br>', 'Note_finale_C', 1, 52),
(125, '2021-01-18 12:12:49.000', 1, 0, 16.75, 20, 'M1101-3 Initiation Linux,<br>Valeur modifiée par <b>ariane.baron</b>,<br>18h48.35 le 17/01/2021<br>', 'DS_promo', 1, 52),
(126, '2021-01-18 21:14:46.000', 1, 0, 15.5, 20, 'M1204 : Fonctionnement Des Organisations,<br>Valeur modifiée par <b>a.lagache</b>,<br>20h14.46 le 18/01/2021<br>', 'DS2', 1, 52),
(127, '2021-03-22 10:19:48.000', 1, 0, 15.1, 20, 'Dut Informatique 1Ère Année,<br>Valeur modifiée par <b>stephane.leroux</b>,<br>09h19.48 le 22/03/2021<br>', 'UE1', 1, 52),
(128, '2021-03-22 10:22:24.000', 1, 0, 13.26, 20, 'Dut Informatique 1Ère Année,<br>Valeur modifiée par <b>stephane.leroux</b>,<br>09h22.24 le 22/03/2021<br>', 'UE2', 1, 52),
(129, '2021-03-22 10:22:39.000', 1, 0, 14.3, 20, 'Dut Informatique 1Ère Année,<br>Valeur modifiée par <b>stephane.leroux</b>,<br>09h22.39 le 22/03/2021<br>', 'Moy_S1', 1, 52),
(130, '2021-11-22 15:38:04.000', 1, 0, 7, 20, 'M3206 Collaborer En Anglais,<br>Valeur modifiée par <b>anne.corrigan</b>,<br>14h38.04 le 22/11/2021<br>', 'Groups', 1, 32),
(131, '2021-11-25 22:34:49.000', 1, 0, 13.5, 20, 'M3201 Probabilités Et Statistiques,<br>Valeur modifiée par <b>aude.joubert</b>,<br>21h34.49 le 25/11/2021<br>', 'DS2', 1, 32),
(132, '2021-12-14 19:47:09.000', 1, 0, 14.75, 20, 'M3204-1 Partie 2,<br>Valeur modifiée par <b>a.lagache</b>,<br>18h47.09 le 14/12/2021<br>', 'DS', 1, 32),
(133, '2021-12-15 21:53:25.000', 1, 0, 18, 20, 'M3104-1 Php,<br>Valeur modifiée par <b>quentin.vergara</b>,<br>20h53.25 le 15/12/2021<br>', 'DS', 1, 32),
(134, '2021-06-21 12:57:40.000', 1, 0, 17.5, 20, 'M2102 : Architecture Des Réseaux,<br>Valeur modifiée par <b>ariane.baron</b>,<br>10h54.52 le 21/06/2021<br>', 'DS_commun', 1, 32),
(135, '2021-06-21 14:03:04.000', 1, 0, 15.1, 20, 'M2106 : Programmation Et Administration Des Bases De Données,<br>Valeur modifiée par <b>ch.bonnet</b>,<br>12h03.04 le 21/06/2021<br>', 'Moyenne_(note_finale)', 1, 32),
(136, '2021-06-21 21:23:33.000', 1, 0, 16.25, 20, 'M2203 :Environnement Comptable, Financier, Juridique, Social,<br>Valeur modifiée par <b>a.lagache</b>,<br>19h23.33 le 21/06/2021<br>', 'DS2', 1, 32),
(137, '2021-06-21 23:16:24.000', 1, 0, 13, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.24 le 21/06/2021<br>', 'Séance7', 1, 32),
(138, '2021-06-21 23:16:25.000', 1, 0, 13, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.25 le 21/06/2021<br>', 'Séance8', 1, 32),
(139, '2021-06-21 23:16:26.000', 1, 0, 17, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.26 le 21/06/2021<br>', 'Séance9', 1, 32),
(140, '2021-06-21 23:16:31.000', 1, 0, 13, 20, 'M2206 : Communiquer En Anglais,<br>Valeur modifiée par <b>gisele.dufaud</b>,<br>21h16.31 le 21/06/2021<br>', 'Séance10', 1, 32),
(141, '2021-06-21 23:38:41.000', 1, 0, 15.5, 20, 'M2205 Expression-Communication : Information &amp; Argumentation,<br>Valeur modifiée par <b>jocelyne.deboute</b>,<br>21h38.41 le 21/06/2021<br>', 'Affiche', 1, 32),
(142, '2021-06-21 23:42:34.000', 1, 0, 18, 20, 'M2205 Expression-Communication : Information &amp; Argumentation,<br>Valeur modifiée par <b>jocelyne.deboute</b>,<br>21h42.34 le 21/06/2021<br>', 'Argu', 1, 32),
(143, '2021-06-22 00:38:21.000', 1, 0, 14, 20, 'M2205 Expression-Communication : Information &amp; Argumentation,<br>Valeur modifiée par <b>jocelyne.deboute</b>,<br>22h38.21 le 21/06/2021<br>', 'Radio', 1, 32),
(144, '2021-01-17 18:32:31.000', 1, 0, 9.25, 20, 'M1202 : Algèbre Linéaire,<br>Valeur modifiée par <b>christophe.jaloux</b>,<br>17h32.31 le 17/01/2021<br>', 'Note_DS2', 1, 32),
(145, '2021-01-17 22:21:43.000', 1, 0, 15, 20, 'M1105-1 Web,<br>Valeur modifiée par <b>quentin.dalmazir</b>,<br>21h21.43 le 17/01/2021<br>', 'Séance1', 1, 32),
(146, '2021-01-17 23:20:35.000', 1, 0, 12.958, 20, 'M1101-2 C Introduction,<br>Valeur modifiée par <b>vincent.vidal</b>,<br>22h20.35 le 17/01/2021<br>', 'DS_promo', 1, 32),
(147, '2021-01-17 23:21:41.000', 1, 0, 14.825, 20, 'M1101-2 C Introduction,<br>Valeur modifiée par <b>vincent.vidal</b>,<br>22h21.41 le 17/01/2021<br>', 'Note_finale_C', 1, 32),
(148, '2021-01-18 12:12:49.000', 1, 0, 16.75, 20, 'M1101-3 Initiation Linux,<br>Valeur modifiée par <b>ariane.baron</b>,<br>18h48.35 le 17/01/2021<br>', 'DS_promo', 1, 32),
(149, '2021-01-18 21:14:46.000', 1, 0, 15.5, 20, 'M1204 : Fonctionnement Des Organisations,<br>Valeur modifiée par <b>a.lagache</b>,<br>20h14.46 le 18/01/2021<br>', 'DS2', 1, 32),
(150, '2021-03-22 10:19:48.000', 1, 0, 15.1, 20, 'Dut Informatique 1Ère Année,<br>Valeur modifiée par <b>stephane.leroux</b>,<br>09h19.48 le 22/03/2021<br>', 'UE1', 1, 32),
(151, '2021-03-22 10:22:24.000', 1, 0, 13.26, 20, 'Dut Informatique 1Ère Année,<br>Valeur modifiée par <b>stephane.leroux</b>,<br>09h22.24 le 22/03/2021<br>', 'UE2', 1, 32),
(152, '2021-03-22 10:22:39.000', 1, 0, 14.3, 20, 'Dut Informatique 1Ère Année,<br>Valeur modifiée par <b>stephane.leroux</b>,<br>09h22.39 le 22/03/2021<br>', 'Moy_S1', 1, 32);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `text_content` longtext,
  `creation_date` varchar(100) DEFAULT NULL,
  `modification` int(11) NOT NULL DEFAULT '0',
  `conv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `topic_id`, `user_id`, `text_content`, `creation_date`, `modification`, `conv_id`) VALUES
(2, 5, 32, 'salut', NULL, 0, NULL),
(8, 17, 32, '<p>salut à tous <span style=\"color:hsl(0,75%,60%);\">les gamers !</span></p><p>&nbsp;</p><p><span style=\"color:hsl(0,75%,60%);\">voici un code en php:</span></p><pre><code class=\"language-php\">$lol = \"lol\"</code></pre>', 'Thu Jan 01 1970 01:00:00 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(9, 18, 32, '<p>salut à tous <span style=\"color:hsl(0,75%,60%);\">les gamers</span></p><p>&nbsp;</p><p><span style=\"color:hsl(0,75%,60%);\">voici un code en php:</span></p><pre><code class=\"language-php\">$lol = \"lol\"</code></pre>', 'Thu Jan 01 1970 01:00:00 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(13, 5, 32, '<p>ajout</p>', 'Sat Oct 30 2021 21:59:52 GMT+0200 (heure d’été d’Europe centrale)', 0, NULL),
(14, 5, 32, '<p>ça fonctionne !!!!</p>', 'Sat Oct 30 2021 22:00:34 GMT+0200 (heure d’été d’Europe centrale)', 2, NULL),
(15, 5, 32, '<p>h</p>', 'Sat Oct 30 2021 22:00:52 GMT+0200 (heure d’été d’Europe centrale)', 0, NULL),
(22, 7, 32, '<p>ggg</p>', 'Thu Nov 11 2021 15:36:49 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(23, 8, 32, '<p>gggggg</p>', 'Thu Nov 11 2021 15:36:57 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(24, 7, 32, '<p>salut</p>', 'Thu Nov 11 2021 16:21:15 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(27, 24, 32, '<p>salut à tous <span style=\"color:hsl(0,75%,60%);\">les gamers</span></p><p>&nbsp;</p><p><span style=\"color:hsl(0,75%,60%);\">voici un code en php:</span></p><pre><code class=\"language-php\">$lol = \"lol\"\nfor($i) = 4c</code></pre>', 'Thu Nov 11 2021 17:06:35 GMT+0100 (heure normale d’Europe centrale)', 2, NULL),
(31, 24, 52, '<p>hzy</p>', 'Thu Nov 11 2021 17:55:01 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(33, 5, 52, '<p>gfdv</p><p>gfdv</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>gvdf</p><p>&nbsp;</p><p>b</p><p>gdfvc</p>', 'Thu Nov 11 2021 18:19:28 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(35, 15, 32, '<p>tgrgfdvc</p>', 'Thu Nov 11 2021 18:33:45 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(44, 24, 32, '<p><mark class=\"marker-yellow\">nhdfvcsxv !!!!</mark></p>', 'Thu Nov 11 2021 19:51:37 GMT+0100 (heure normale d’Europe centrale)', 2, NULL),
(46, 24, 32, '<p>salut</p><p>&nbsp;<img class=\"image_resized\" style=\"width:9.59%;\" src=\"data:image/png;base64,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\"></p>', 'Fri Nov 12 2021 20:16:34 GMT+0100 (heure normale d’Europe centrale)', 2, NULL),
(48, 28, 32, '<p>salut à tous les gamers</p><p>&nbsp;</p><p><span style=\"color:hsl(0,75%,60%);\">voici un code en pi</span></p><pre><code class=\"language-php\">$lol = \"lol\"\nfor($i)</code></pre><p>&nbsp;</p><p>lol</p>', 'Fri Nov 12 2021 20:23:29 GMT+0100 (heure normale d’Europe centrale)', 2, NULL),
(49, 29, 32, '<p><mark class=\"marker-yellow\">salut à tous les gamers</mark></p><figure class=\"image\"><img src=\"data:image/gif;base64,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\"></figure><pre><code class=\"language-php\">$lol = \"lol\"\nfor($i)</code></pre>', 'Fri Nov 12 2021 20:24:55 GMT+0100 (heure normale d’Europe centrale)', 2, NULL),
(52, 32, 32, '<h2>voici un code en c</h2><p>&nbsp;</p><pre><code class=\"language-c\">int i = 5;</code></pre><p>&nbsp;</p>', 'Fri Nov 12 2021 21:29:13 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(55, 8, NULL, '<blockquote><p>gggggg</p></blockquote><p>salut</p>', 'Sat Nov 13 2021 12:17:14 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(56, 17, NULL, '<pre><code class=\"language-javascript\">let i=5</code></pre>', 'Sat Nov 13 2021 12:18:11 GMT+0100 (heure normale d’Europe centrale)', 1, NULL),
(58, 24, NULL, '<blockquote><p>salut</p><p>&nbsp;</p></blockquote>', 'Sat Nov 13 2021 16:20:08 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(59, 28, 32, '<p>k,cdfsxqwgdfv</p>', 'Sun Nov 14 2021 21:47:42 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(60, 5, 32, '<p>dfvc</p>', 'Sun Nov 14 2021 21:57:44 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(61, 24, 32, '<blockquote><p>hzy</p></blockquote><p>nvbcfvxdcwsx</p>', 'Tue Nov 16 2021 13:37:03 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(63, 32, 32, '<p>f</p>', 'Sat Dec 04 2021 12:34:45 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(64, NULL, 32, 'OK', 'Sat Dec 04 2021 13:01:45 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(65, NULL, 32, 'OK', 'Sat Dec 04 2021 13:02:10 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(66, NULL, 32, 'OK', 'Sat Dec 04 2021 13:04:13 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(67, NULL, 32, 'OK', 'Sat Dec 04 2021 13:06:24 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(69, NULL, 32, 'salut', 'Sat Dec 04 2021 14:11:06 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(82, 24, 32, '<p>yo</p>', 'Sat Dec 04 2021 16:41:48 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(84, 18, 32, '<p>yo</p>', 'Sat Dec 04 2021 17:45:00 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(109, 32, 32, '<p>fff</p>', 'Sat Dec 04 2021 21:24:52 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(139, 7, 32, '<p>test</p>', 'Sat Dec 04 2021 21:38:34 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(140, NULL, 32, 'hh\n', 'Sat Dec 04 2021 21:46:03 GMT+0100 (heure normale d’Europe centrale)', 0, 27),
(141, NULL, 32, '', 'Sat Dec 04 2021 21:50:45 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(142, NULL, 32, '', 'Sat Dec 04 2021 21:50:46 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(143, 36, 32, '<h2><span style=\"color:hsl(0,75%,60%);\"><mark class=\"marker-yellow\">jjle fd</mark></span></h2><p><strong>jbgfvdcd</strong></p><pre><code class=\"language-c\">int a = 5;</code></pre><ul><li>hhhh</li><li>hhh</li></ul><p>&nbsp;</p>', 'Sun Dec 05 2021 22:52:52 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(144, NULL, 54, 'salut', 'Sun Dec 05 2021 22:57:30 GMT+0100 (heure normale d’Europe centrale)', 0, 29),
(146, NULL, 32, 'kkk\n', 'Mon Dec 06 2021 08:06:43 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(147, NULL, 32, 'kkkkk', 'Mon Dec 06 2021 08:06:47 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(148, NULL, 32, 'kk\nkkk\nkk', 'Mon Dec 06 2021 08:06:52 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(149, NULL, 32, 'kkk\n', 'Mon Dec 06 2021 08:07:06 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(150, NULL, 32, 'kkkk', 'Mon Dec 06 2021 08:07:11 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(151, NULL, 32, 'kkkkk', 'Mon Dec 06 2021 08:07:14 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(152, NULL, 32, 'salut', 'Mon Dec 06 2021 08:34:07 GMT+0100 (heure normale d’Europe centrale)', 0, 30),
(153, 37, 32, '<h2><span style=\"color:hsl(0,75%,60%);\"><mark class=\"marker-yellow\">jjle fd</mark></span></h2><p><strong>jbgfvdc</strong></p>', 'Mon Dec 06 2021 10:20:53 GMT+0100 (heure normale d’Europe centrale)', 3, NULL),
(154, 38, 32, '<h2><span style=\"color:hsl(0,75%,60%);\"><mark class=\"marker-yellow\">jjle fd</mark></span></h2><p><strong>jbgfvdcd</strong></p><pre><code class=\"language-c\">int a = 5;</code></pre><ul><li>hhhh</li><li>hhh</li></ul><p>&nbsp;</p>', 'Wed Dec 08 2021 16:58:12 GMT+0100 (heure normale d’Europe centrale)', 0, NULL),
(155, NULL, 32, 'vgv', 'Fri Dec 10 2021 19:32:33 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(156, NULL, 52, 'cc', 'Fri Dec 10 2021 21:20:10 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(157, NULL, 52, 'jj', 'Fri Dec 10 2021 21:20:46 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(158, NULL, 52, 'j', 'Fri Dec 10 2021 21:24:08 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(159, NULL, 52, 'f', 'Fri Dec 10 2021 21:31:56 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(160, NULL, 52, 'c\n', 'Fri Dec 10 2021 21:32:22 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(161, NULL, 52, 'd', 'Fri Dec 10 2021 21:34:31 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(162, NULL, 32, 'hey\n', 'Fri Dec 10 2021 21:34:59 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(163, NULL, 32, 'x', 'Fri Dec 10 2021 21:35:12 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(164, NULL, 52, 'c', 'Fri Dec 10 2021 21:35:18 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(165, NULL, 52, 'yo', 'Fri Dec 10 2021 21:35:36 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(166, NULL, 52, 'd', 'Fri Dec 10 2021 21:44:22 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(167, NULL, 32, 'gg', 'Fri Dec 10 2021 22:15:32 GMT+0100 (heure normale d’Europe centrale)', 0, 29),
(168, NULL, 52, 'salut', 'Fri Dec 10 2021 22:30:42 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(169, NULL, 52, 'cc', 'Fri Dec 10 2021 22:32:44 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(170, NULL, 32, 'hhh', 'Sat Dec 11 2021 00:32:49 GMT+0100 (heure normale d’Europe centrale)', 0, 28),
(171, NULL, 52, 'salut', 'Sat Dec 11 2021 00:33:14 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(172, NULL, 32, 'gggg', 'Sat Dec 11 2021 12:38:20 GMT+0100 (heure normale d’Europe centrale)', 0, 30),
(173, NULL, 52, 'salut\n', 'Sat Dec 11 2021 12:39:33 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(174, NULL, 32, 'salut', 'Sat Dec 11 2021 12:40:05 GMT+0100 (heure normale d’Europe centrale)', 0, 32),
(175, NULL, 32, 'bbbg', 'Sun Dec 12 2021 16:56:57 GMT+0100 (heure normale d’Europe centrale)', 0, 27),
(176, NULL, 32, 'vvv', 'Sun Dec 12 2021 17:24:06 GMT+0100 (heure normale d’Europe centrale)', 0, 27),
(177, NULL, 32, 'v', 'Sun Dec 12 2021 17:25:00 GMT+0100 (heure normale d’Europe centrale)', 0, 27),
(178, NULL, 52, 'vv', 'Sun Dec 12 2021 17:26:36 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(179, NULL, 32, 'cc', 'Sun Dec 12 2021 17:26:42 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(180, NULL, 32, 'cc', 'Sun Dec 12 2021 17:26:54 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(181, NULL, 32, 'fff', 'Sun Dec 12 2021 17:27:24 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(182, NULL, 32, 'h', 'Sun Dec 12 2021 17:27:38 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(183, NULL, 52, 'ffff', 'Sun Dec 12 2021 17:28:22 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(184, NULL, 32, 'fffffhntbgrfed', 'Sun Dec 12 2021 17:28:26 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(185, NULL, 52, 'fff', 'Sun Dec 12 2021 17:28:30 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(186, NULL, 52, 'ggbg', 'Sun Dec 12 2021 17:28:37 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(187, NULL, 52, 'hhh', 'Sun Dec 12 2021 17:28:49 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(188, NULL, 52, 'g', 'Sun Dec 12 2021 17:32:30 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(189, NULL, 52, 'g', 'Sun Dec 12 2021 17:32:55 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(190, NULL, 52, 'vgb', 'Sun Dec 12 2021 17:33:21 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(191, NULL, 52, 'f', 'Sun Dec 12 2021 17:34:18 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(192, NULL, 52, '', 'Sun Dec 12 2021 17:34:39 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(193, NULL, 52, 'f', 'Sun Dec 12 2021 17:34:41 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(194, NULL, 52, 'h', 'Sun Dec 12 2021 17:38:16 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(195, NULL, 52, 'g', 'Sun Dec 12 2021 17:38:28 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(196, NULL, 32, 'g', 'Sun Dec 12 2021 17:38:31 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(197, NULL, 52, 'f', 'Sun Dec 12 2021 17:38:49 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(198, NULL, 52, 'v', 'Sun Dec 12 2021 17:40:23 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(199, NULL, 52, 'salut', 'Sun Dec 12 2021 17:40:47 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(200, NULL, 32, 'hello', 'Sun Dec 12 2021 17:41:00 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(201, NULL, 32, 'bbgbg', 'Sun Dec 12 2021 17:42:14 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(202, NULL, 32, 'v', 'Sun Dec 12 2021 17:42:21 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(203, NULL, 52, 'vf', 'Sun Dec 12 2021 17:42:24 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(204, NULL, 52, 'v', 'Sun Dec 12 2021 17:42:31 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(205, NULL, 52, 'f', 'Sun Dec 12 2021 17:42:37 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(206, NULL, 32, 'v', 'Sun Dec 12 2021 17:42:49 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(207, NULL, 32, 'v', 'Sun Dec 12 2021 17:42:49 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(208, NULL, 32, 'vbb', 'Sun Dec 12 2021 17:43:21 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(209, NULL, 32, 'c', 'Sun Dec 12 2021 17:43:29 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(210, NULL, 32, 'vbffbg', 'Sun Dec 12 2021 17:43:37 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(211, NULL, 32, 'hello', 'Sun Dec 12 2021 17:43:45 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(212, NULL, 52, 'bb', 'Sun Dec 12 2021 18:21:14 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(213, NULL, 52, 'b', 'Sun Dec 12 2021 18:32:22 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(214, NULL, 52, 'n', 'Sun Dec 12 2021 18:32:37 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(215, NULL, 52, 'b', 'Sun Dec 12 2021 18:32:43 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(216, NULL, 52, 'h', 'Sun Dec 12 2021 18:32:50 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(217, NULL, 52, 'h``\r', 'Sun Dec 12 2021 18:32:58 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(218, NULL, 52, 'h', 'Sun Dec 12 2021 18:33:02 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(219, NULL, 52, 'mùm', 'Sun Dec 12 2021 18:33:08 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(220, NULL, 32, 'test', 'Sun Dec 12 2021 19:16:56 GMT+0100 (heure normale d’Europe centrale)', 0, 27),
(221, NULL, 32, 'g', 'Sun Dec 12 2021 19:17:05 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(222, NULL, 32, ' ', 'Sun Dec 12 2021 19:17:09 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(223, NULL, 32, 'b', 'Sun Dec 12 2021 19:17:21 GMT+0100 (heure normale d’Europe centrale)', 0, 32),
(224, NULL, 32, 'f', 'Sun Dec 12 2021 19:17:28 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(225, NULL, 32, 'f', 'Sun Dec 12 2021 19:17:34 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(226, NULL, 52, 'll', 'Sun Dec 12 2021 19:33:11 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(227, NULL, 52, 'b', 'Sun Dec 12 2021 19:35:02 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(228, NULL, 32, 'vv', 'Sun Dec 12 2021 19:41:24 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(229, NULL, 32, ' c', 'Sun Dec 12 2021 19:41:34 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(230, NULL, 32, 'v', 'Sun Dec 12 2021 19:41:53 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(231, NULL, 32, 'v', 'Sun Dec 12 2021 19:42:34 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(232, NULL, 32, 'bb', 'Sun Dec 12 2021 19:42:40 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(233, NULL, 32, 'c', 'Sun Dec 12 2021 19:44:11 GMT+0100 (heure normale d’Europe centrale)', 0, 32),
(234, NULL, 32, 'bb', 'Sun Dec 12 2021 19:45:41 GMT+0100 (heure normale d’Europe centrale)', 0, 32),
(235, NULL, 32, 'lk', 'Sun Dec 12 2021 19:45:53 GMT+0100 (heure normale d’Europe centrale)', 0, 32),
(236, NULL, 32, 'v', 'Sun Dec 12 2021 19:46:07 GMT+0100 (heure normale d’Europe centrale)', 0, 30),
(237, NULL, 52, 'vv', 'Sun Dec 12 2021 19:46:28 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(238, NULL, 52, 'salut', 'Sun Dec 12 2021 19:46:47 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(239, NULL, 52, 'lol', 'Sun Dec 12 2021 19:47:03 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(240, NULL, 52, 'fl', 'Sun Dec 12 2021 19:50:21 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(241, NULL, 52, 'vv', 'Sun Dec 12 2021 19:50:35 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(242, NULL, 52, 'vv', 'Sun Dec 12 2021 19:50:39 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(243, NULL, 52, 'bbb', 'Sun Dec 12 2021 19:51:18 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(244, NULL, 32, 'bb', 'Sun Dec 12 2021 19:51:34 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(245, NULL, 32, 'f', 'Sun Dec 12 2021 19:51:40 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(246, NULL, 52, 'b', 'Sun Dec 12 2021 19:51:46 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(247, NULL, 32, 'bb', 'Sun Dec 12 2021 19:52:37 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(248, NULL, 32, 'nnn', 'Sun Dec 12 2021 20:15:35 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(249, NULL, 52, 'c', 'Sun Dec 12 2021 20:15:47 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(250, NULL, 32, '  ', 'Sun Dec 12 2021 20:16:08 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(251, NULL, 52, 'k', 'Sun Dec 12 2021 20:59:23 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(252, NULL, 52, 'k', 'Sun Dec 12 2021 20:59:44 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(253, NULL, 32, ',', 'Sun Dec 12 2021 20:59:51 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(254, NULL, 52, 'salut', 'Mon Dec 13 2021 16:11:26 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(255, NULL, 32, 'f', 'Mon Dec 13 2021 16:11:36 GMT+0100 (heure normale d’Europe centrale)', 0, 30),
(256, NULL, 32, 'f', 'Mon Dec 13 2021 16:11:41 GMT+0100 (heure normale d’Europe centrale)', 0, 32),
(257, NULL, 52, 'cc', 'Mon Dec 13 2021 16:11:54 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(258, NULL, 32, 'cc', 'Mon Dec 13 2021 16:12:16 GMT+0100 (heure normale d’Europe centrale)', 0, 26),
(259, NULL, 52, 'ff', 'Mon Dec 13 2021 16:12:28 GMT+0100 (heure normale d’Europe centrale)', 0, 31),
(260, NULL, 52, 'hi', 'Mon Dec 13 2021 16:12:41 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(261, NULL, 32, 'mai', 'Mon Dec 13 2021 16:12:59 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(262, NULL, 52, 'mais ?', 'Mon Dec 13 2021 16:13:07 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(263, 39, 32, '<h2>fbdfvdf</h2><p><mark class=\"marker-yellow\">ggg</mark></p><p>&nbsp;</p><p>&nbsp;</p>', 'Tue Dec 14 2021 13:45:22 GMT+0100 (heure normale d’Europe centrale)', 1, NULL),
(264, NULL, 32, 'dgfgd', 'Tue Dec 14 2021 13:47:17 GMT+0100 (heure normale d’Europe centrale)', 0, 25),
(265, NULL, 52, 'frfr', 'Tue Dec 14 2021 13:58:08 GMT+0100 (heure normale d’Europe centrale)', 0, 25);

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `mark` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `topic_id`, `mark`, `document_id`) VALUES
(21, 32, 5, 1, NULL),
(22, 32, 24, 1, NULL),
(23, 36, 24, 1, NULL),
(24, 52, 5, 0, NULL),
(25, 32, NULL, 0, 21),
(26, 52, NULL, -1, 21),
(27, 52, NULL, -1, 18),
(28, 52, NULL, 0, 26),
(29, 32, NULL, 1, 25),
(30, 32, NULL, 0, 18),
(31, 32, NULL, 1, 20),
(32, 32, 7, 0, NULL),
(33, 32, NULL, 1, 24),
(34, 32, NULL, -1, 19),
(35, 32, NULL, 1, 23),
(36, 32, NULL, -1, 28),
(41, 32, NULL, -1, 29),
(42, 32, 29, 0, NULL),
(43, 32, 32, 1, NULL),
(44, 32, NULL, 1, 27),
(45, 32, NULL, 1, 30),
(46, 32, 36, 0, NULL),
(47, 32, 8, -1, NULL),
(48, 32, 37, 0, NULL),
(49, 32, 38, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `creation_date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `topic`
--

INSERT INTO `topic` (`id`, `user_id`, `category_id`, `title`, `status`, `creation_date`) VALUES
(5, 35, 35, 'ceci est un test', 1, 'Sat Oct 30 2021 00:17:10 GMT+0200 (heure d’été d’Europe centrale)'),
(7, 33, 9, 'faire des boucles do-while en python ?', 1, 'Sat Oct 30 2021 00:11:10 GMT+0200 (heure d’été d’Europe centrale)'),
(8, 35, 10, 'faire de la POO en c ?', NULL, 'Sat Oct 30 2021 00:09:10 GMT+0200 (heure d’été d’Europe centrale)'),
(15, 32, 28, 'salut a toi jeu fdcsqxcsv gfdvcsd', 1, 'Sat Oct 30 2021 00:19:10 GMT+0200 (heure d’été d’Europe centrale)'),
(17, 32, 27, 'ceci est un test ', 1, '2021-10-30 13:08:01.808'),
(18, 32, 80, 'sssssssssssssssss dddddddd', 1, '2021-10-30T11:15:27.895Z'),
(24, 32, 26, 'ghdfvcsxsw est un test dfvcs', 1, 'Thu Nov 11 2021 17:06:35 GMT+0100 (heure normale d’Europe centrale)'),
(25, 32, 25, 'test test test ce gbfdvcs', 1, 'Fri Nov 12 2021 20:20:27 GMT+0100 (heure normale d’Europe centrale)'),
(26, 32, 25, 'test test test ce gbfdvcs', 1, 'Fri Nov 12 2021 20:21:20 GMT+0100 (heure normale d’Europe centrale)'),
(28, 32, 7, 'ghdfvcsfghnjbvfvgb ghfdvc', 1, 'Fri Nov 12 2021 20:23:29 GMT+0100 (heure normale d’Europe centrale)'),
(29, 32, 40, 'createtopiccreatetopiccreatetopic', 1, 'Fri Nov 12 2021 20:24:55 GMT+0100 (heure normale d’Europe centrale)'),
(32, 32, 10, 'je comprends au c !!!!!!!!!', 1, 'Fri Nov 12 2021 21:29:13 GMT+0100 (heure normale d’Europe centrale)'),
(35, 32, 55, 'sssssssssssssssss dddddddd', 1, 'Sat Dec 04 2021 12:22:02 GMT+0100 (heure normale d’Europe centrale)'),
(36, 32, 23, 'besoin d\'aide sur cette exo', 1, 'Sun Dec 05 2021 22:52:52 GMT+0100 (heure normale d’Europe centrale)'),
(37, 32, 40, 'je m\'appel jolan fffffffff', 1, 'Mon Dec 06 2021 10:20:53 GMT+0100 (heure normale d’Europe centrale)'),
(38, 32, 40, 'dffffffffffffffffffffffffdffffffffffffffffffffffff', 1, 'Wed Dec 08 2021 16:58:12 GMT+0100 (heure normale d’Europe centrale)'),
(39, 32, 56, 'je ne comprends cet execrice', 1, 'Tue Dec 14 2021 13:45:22 GMT+0100 (heure normale d’Europe centrale)');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `crypted_password` varchar(100) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `user_privilege` int(2) DEFAULT NULL,
  `creation_date` varchar(100) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `verification` varchar(255) DEFAULT NULL,
  `forgot_password` varchar(255) DEFAULT 'FALSE',
  `tomuss` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `last_name`, `first_name`, `mail`, `crypted_password`, `icon`, `user_privilege`, `creation_date`, `class_id`, `verification`, `forgot_password`, `tomuss`) VALUES
(32, 'hanine', 'sami', 'sami.hanine@etu.univ-lyon1.fr', '$2b$10$h8FIkwZJwJr4hlkse7QcT.rJ8gA4tVA5etTXPLix0vprZzKOiAYiq', 'https://drive.google.com/uc?export=view&id=1uvjQDfrcW8DItsBsItNZkt8bsj1F-E25', 1, 'Sun Oct 17 2021 18:17:24 GMT+0200 (heure d’été d’Europe centrale)', 3, 'TRUE', '5f9863ca-4ee5-4d82-9519-6408982fa1a8', 'b7766ed7841b2df'),
(33, 'blanchard', 'noah', 'noah.blanchard@etu.univ-lyon1.fr', '$2b$10$bZHjNcowLAvEAvQKyRxhgOZv79r6LSWmH0dN8Fj6.efpgQDV1c2Du', 'https://drive.google.com/uc?export=view&id=1bzet6u1df9aB1O6mtvSgSu518reAAAhu', 1, 'Sun Oct 17 2021 18:20:28 GMT+0200 (heure d’été d’Europe centrale)', 3, 'TRUE', 'FALSE', ''),
(34, 'del pup', 'samuel!', 'samuel.del-pup@etu.univ-lyon1.fr', '$2b$10$pM6Gy5apq0DzVrQclBUgoeFxQ7DPhwu6L8so1zDfD1L9I.GkYuY5y', 'https://drive.google.com/uc?export=view&id=1ndQa7GljuCCFLpA2Frw5LTVE1GEsarFE', 1, 'Sun Oct 17 2021 18:27:42 GMT+0200 (heure d’été d’Europe centrale)', 3, 'TRUE', 'FALSE', ''),
(35, 'escoffier jarrosson', 'booba', 'booba.escoffier-jarrosson@etu.univ-lyon1.fr', '$2b$10$HANwu2mtMyY7FOXP12ed3.k7pYYZGZyGSPeeD/eJN8vAxpe/suaIS', 'https://drive.google.com/uc?export=view&id=1qfv0K8rbOlWAl9yopWrJXEcnRjBRTnwp', 1, 'Sun Oct 17 2021 18:31:06 GMT+0200 (heure d’été d’Europe centrale)', 2, 'TRUE', 'FALSE', ''),
(36, 'dautrait', 'antoine', 'antoine.dautrait@etu.univ-lyon1.fr', '$2b$10$j39MDOWgVvb5sPTXm9hAYO1vMu5n1HF68T4K2wYmf9fnTYP1kURgK', 'https://drive.google.com/uc?export=view&id=1983YEjd8g4lPwXrymGGOPpTkWOducAFg', 1, 'Sun Oct 17 2021 18:33:44 GMT+0200 (heure d’été d’Europe centrale)', 3, 'TRUE', 'FALSE', ''),
(43, 'utilisateur', 'supprimé', 'deleted.user@etu.univ-lyon1.fr', '$2b$10$Xis194MA2GGswYaU7YQAu.GOeOvuEjtG34poS8h9EJDGCfkZi0blu', 'https://drive.google.com/uc?export=view&id=1eVhnpO_GG8GyLDnDKtUMU0-_iUtM7FI1', 1, 'Sun Oct 17 2021 18:54:26 GMT+0200 (heure d’été d’Europe centrale)', 7, 'TRUE', 'FALSE', ''),
(50, 'marouani', 'ceif-edine', 'ceif-edine.marouani@etu.univ-lyon1.fr', '$2b$10$asxDTVpX2kAcSAVh41Ivh.CH.fnsKBXWdAr3fdZkdv3GMMwY4.Laq', 'https://drive.google.com/uc?export=view&id=19XkXFojC0yq7MqPqF8vuszRtp132P9_n', 1, 'Tue Oct 19 2021 12:15:00 GMT+0200 (heure d’été d’Europe centrale)', 3, 'd37fbf42-b956-4a33-80ba-7b1135cf278c', 'FALSE', ''),
(52, 'aubourg', 'thomas', 'thomas.aubourg@etu.univ-lyon1.fr', '$2b$10$h8FIkwZJwJr4hlkse7QcT.rJ8gA4tVA5etTXPLix0vprZzKOiAYiq', 'https://img.icons8.com/officel/1600/ffffff/user.png', 2, 'Wed Nov 10 2021 09:42:00 GMT+0100 (heure normale d’Europe centrale)', 3, 'TRUE', 'FALSE', 'b7766ed7841b2df'),
(54, 'ben-redjeb', 'mia', 'mia.ben-redjeb@etu.univ-lyon1.fr', '$2b$10$zxA52Y27w9VI59ojBKq5K.LcusK7wd3pR/kaFHik5GnClMnaTvAO.', 'https://drive.google.com/uc?export=view&id=12994ouiLCzq1af15q4JZqjRovOOamPt0', 1, 'Sun Dec 05 2021 22:55:02 GMT+0100 (heure normale d’Europe centrale)', 3, 'TRUE', 'FALSE', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `calendar`
--
ALTER TABLE `calendar`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_category` (`category_id`),
  ADD KEY `FK_category_color` (`color_id`);

--
-- Index pour la table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_semester_class` (`semester_id`),
  ADD KEY `FK_department_class` (`department_id`);

--
-- Index pour la table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userid1` (`user1_id`),
  ADD KEY `fk_userid2` (`user2_id`);

--
-- Index pour la table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_document_category` (`category_id`),
  ADD KEY `FK_user_document` (`user_id`);

--
-- Index pour la table `favorite_category`
--
ALTER TABLE `favorite_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_category_favorite` (`category_id`),
  ADD KEY `FK_user_favorite` (`user_id`);

--
-- Index pour la table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_mark` (`user_id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_message_topic` (`topic_id`),
  ADD KEY `FK_user_message` (`user_id`),
  ADD KEY `FK_message_conversation` (`conv_id`);

--
-- Index pour la table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_topic_rating` (`topic_id`),
  ADD KEY `fk_user_rating` (`user_id`),
  ADD KEY `fk_document_rating` (`document_id`);

--
-- Index pour la table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_topic` (`user_id`),
  ADD KEY `FK_topic_category` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_class_user` (`class_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `calendar`
--
ALTER TABLE `calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `favorite_category`
--
ALTER TABLE `favorite_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT pour la table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT pour la table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_category_color` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_category_topic` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_cateogy_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `FK_department_class` FOREIGN KEY (`department_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_semester_class` FOREIGN KEY (`semester_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `fk_userid1` FOREIGN KEY (`user1_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userid2` FOREIGN KEY (`user2_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_document_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_document` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `favorite_category`
--
ALTER TABLE `favorite_category`
  ADD CONSTRAINT `FK_category_favorite` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_favorite` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `fk_user_mark` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_message_conversation` FOREIGN KEY (`conv_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_message_topic` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_message` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_document_rating` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_topic_rating` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_rating` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `FK_topic_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user_topic` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_class_user` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
