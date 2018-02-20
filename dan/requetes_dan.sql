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

-- afficher offres disponibles - indisponibles pour un user
-- je savais pas trop comment la faire comme je voulais
-- mais voici une requête proche de la solution
select nom, prenom, t_offre.id from t_user join t_offre on t_user.id = t_offre.id_user


-- afficher information d'un user
select nom, prenom, mail from t_user
