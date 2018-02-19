-- selectionner un user à partir de son login
select nom, prenom from t_user -- where login = "login-user"

-- afficher offres disponibles - indisponibles pour un user
-- je savais pas trop comment la faire comme je voulais
-- mais voici une requête proche de la solution
select nom, prenom, t_offre.id from t_user join t_offre on t_user.id = t_offre.id_user


-- afficher information d'un user
select nom, prenom, mail from t_user