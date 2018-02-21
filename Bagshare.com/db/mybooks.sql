-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 22 Mai 2017 à 22:35
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `mybooks`
--

-- --------------------------------------------------------

--
-- Structure de la table `t_participe`
--

CREATE TABLE IF NOT EXISTS `t_participe` (
  `id_user` int(11) NOT NULL,
  `id_seance` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`,`id_seance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `t_participe`
--

INSERT INTO `t_participe` (`id_user`, `id_seance`, `value`) VALUES
(1, 1, 'y'),
(2, 1, 'y');

-- --------------------------------------------------------

--
-- Structure de la table `t_seance`
--

CREATE TABLE IF NOT EXISTS `t_seance` (
  `id_seance` int(11) NOT NULL AUTO_INCREMENT,
  `title_seance` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_seance` datetime NOT NULL,
  `place_seance` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_seance`),
  UNIQUE KEY `title_seance` (`title_seance`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `t_seance`
--

INSERT INTO `t_seance` (`id_seance`, `title_seance`, `date_seance`, `place_seance`) VALUES
(1, 'SEANCE 1', '2017-05-23 06:30:00', 'rue Desiré Claude 42100 - Saint Etienne (Devant Tinasoa)');

-- --------------------------------------------------------

--
-- Structure de la table `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `usr_salt` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `usr_role` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `usr_mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `usr_firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `t_user`
--

INSERT INTO `t_user` (`usr_id`, `usr_name`, `usr_salt`, `usr_role`, `usr_mail`, `usr_firstName`, `usr_phone`, `usr_password`) VALUES
(1, 'bina', '01422fce46e0ddb17f0d529', 'ROLE_USER', 'rabona@gm.com', 'rabona', '0608518247', '$2y$13$Z2iorr9BhcM6nK/la7uhNOnvFPj80dXarvuUeYtFD6nluu57YQn66'),
(2, 'bela', '6a50e18f6b96c25db72a591', 'ROLE_USER', 'bela@mav.ocm', 'bela', '0608518247', '$2y$13$lj1RAeCOWasU8qy7D2yyWugRXItF7xtj0hWH.lM9tqlAyBT9CcN2O');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
