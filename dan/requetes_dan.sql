--****************************************
-- Auteur : Dan
-- Fonctionnalités : 
--    - afficher_user_byLogin(user_login VARCHAR(45))....selectionne un user par son login
--

DELIMITER |
-- selectionner un user à partir de son login
CREATE PROCEDURE afficher_user_byLogin (user_login VARCHAR(45))
BEGIN
  SELECT * FROM T_USER WHERE login = user_login;
END|

DELIMITER ;


- ---------------------------------------------------------
-- afficher offres disponibles pour un user
-- --------------------------------------------------------
DELIMITER $$ 
CREATE PROCEDURE offre_dispo_u(IN idu INT)
BEGIN
SELECT o.id 
FROM T_OFFRE o
WHERE o.id_user=idu and nb_kg_dispo>0 and nb_env_dispo >0 ;
END $$
DELIMITER ;




-- afficher information d'un user
select nom, prenom, mail from t_user
