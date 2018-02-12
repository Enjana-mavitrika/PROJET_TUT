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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;