-- selectionner un user à partir de son login
select nom, prenom from t_user -- where login = "login-user"


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