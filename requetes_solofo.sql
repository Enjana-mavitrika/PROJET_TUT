--********************************************************************************************************************
--								
-- Auteur : S.RABONARIJAONA					
--
-- Fonctionnalités:						
--       - lister_avis_user(user_id INT)............lister les avis sur un utilisateur identifié par son id
--       - calculer_note_generale(user_id INT)......calculer la note generale d'un utilisateur identifié par son id
--       - t_user_update_trig.......................declencheur auto pour enregistrer l'historique de la table t_user
--       - t_offre_update_trig......................declencheur auto pour enregistrer l'historique de la table t_offre
-- 	 - t_avis_update_trig.......................declencheur auto pour enregistrer l'historique de la table t_avis
-- 	 - t_precision_update_trig..................declencheur auto pour enregistrer l'historique de la table t_precision
-- 	 - t_reserver_update_trig...................declencheur auto pour enregistrer l'historique de la table t_reserver
-- 	 - t_type_article_update_trig...............declencheur auto pour enregistrer l'histrorique de la table t_type_article
-- 	 - t_article_update_trig....................declencheur auto pour enregistrer l'histrorique de la table t_article
--						
--*********************************************************************************************************************

-- lister les avis sur un utilisateur par son id
DELIMITER |
CREATE PROCEDURE lister_avis_user (IN user_id INT)
BEGIN
	SELECT T_AVIS.id, T_AVIS.note, T_AVIS.texte
	FROM T_AVIS, T_RESERVER, T_OFFRE
	WHERE T_RESERVER.id_user = user_id
	AND T_RESERVER.id_avis_v = T_AVIS.id -- avis du vendeur sur lui (si client)
	OR T_RESERVER.id_offre = T_OFFRE.id
	AND T_RESERVER.id_avis_c = T_AVIS.id -- avis du client sur lui (si vendeur)
	AND T_OFFRE.id_user = user_id;
END|



-- afficher note generale d'un utilisateur
CREATE PROCEDURE calculer_note_generale (IN user_id INT)
BEGIN
	SELECT AVG(T_AVIS.note) -- moyenne sur la liste de sa note
	FROM T_AVIS, T_RESERVER, T_OFFRE
	WHERE T_RESERVER.id_user = user_id
	AND T_RESERVER.id_avis_v = T_AVIS.id -- note du vendeur sur lui (si client)
	OR T_RESERVER.id_offre = T_OFFRE.id
	AND T_RESERVER.id_avis_c = T_AVIS.id -- note du client sur lui (si vendeur)
	AND T_OFFRE.id_user = user_id;
END|



-- inserer une ligne dans la table T_USER_HISTORY
CREATE PROCEDURE inserer_t_user_history (id INT, id_user INT, date_inscri DATETIME, nom VARCHAR(45), prenom VARCHAR(45), mail VARCHAR(45), tel VARCHAR(45), adresse VARCHAR(150), login VARCHAR(45), password VARCHAR(45), est_confirmee CHAR(1), date_modif DATETIME, ip_adress VARCHAR(45), identite VARCHAR(45), identite_confirme CHAR(1))
BEGIN
	INSERT INTO T_USER_HISTORY VALUES (id, id_user, date_inscri, nom, prenom, mail, tel, adresse, login, password, est_confirmee, date_modif, ip_adress, identite, identite_confirme);
END|



-- declencheur pour enregistrer l'historique de la table T_USER
CREATE TRIGGER t_user_update_trig AFTER UPDATE ON T_USER
FOR EACH ROW
BEGIN
	CALL inserer_t_user_history (0, OLD.id, OLD.date_inscri, OLD.nom, OLD.prenom, OLD.mail, OLD.tel, OLD.adresse, OLD.login, OLD.password, OLD.est_confirmee, NEW.date_modif, OLD.ip_adress, OLD.identite, OLD.identite_confirme);
END|


-- inserer une ligne dans la table T_OFFRE_HISTORY
CREATE PROCEDURE inserer_t_offre_history (id INT, id_offre INT, id_user INT, date_ajout DATETIME, date_modif DATETIME, nb_kg_dispo INT, nb_env_dispo INT, ville_depart VARCHAR(45), ville_arrivee VARCHAR(45), date_depart DATETIME, date_arrivee DATETIME, prix_kg INT, prix_env INT)
BEGIN
	INSERT INTO T_OFFRE_HISTORY VALUES (id, id_offre, id_user, date_ajout, date_modif, nb_kg_dispo, nb_env_dispo, ville_depart, ville_arrivee, date_depart, date_arrivee, prix_kg, prix_env);
END|

-- declencheur pour enregistrer l'historique de la table T_OFFRE
CREATE TRIGGER t_offre_update_trig AFTER UPDATE ON T_OFFRE
FOR EACH ROW
BEGIN
	CALL inserer_t_offre_history (0, OLD.id, OLD.id_user, OLD.date_ajout, NEW.date_modif, OLD.nb_kg_dispo, OLD.nb_env_dispo, OLD.ville_depart, OLD.ville_arrivee, OLD.date_depart, OLD.date_arrivee, OLD.prix_kg, OLD.prix_env);
END|


-- inserer une ligne dans la table T_AVIS_HISTORY
CREATE PROCEDURE inserer_t_avis_history (id INT, id_avis INT, note INT, texte VARCHAR(200), id_user INT, date_modif DATETIME)
BEGIN
	INSERT INTO T_AVIS_HISTORY VALUES (id, id_avis, note, texte, id_user, date_modif);
END|

-- declencheur pour enregistrer l'historique de la table T_AVIS
CREATE TRIGGER t_avis_update_trig AFTER UPDATE ON T_AVIS
FOR EACH ROW
BEGIN
	CALL inserer_t_avis_history(0, OLD.id, OLD.note, OLD.texte, OLD.id_user, NOW());
END|

-- inserer une ligne dans la table T_PRECISION_HISTORY
CREATE PROCEDURE inserer_t_precision_history (id INT, id_precision INT, id_offre INT, numero_vol VARCHAR(45), dimensionL INT, dimensionH INT, nom_company VARCHAR(45), detail VARCHAR(200), date_modif DATETIME)
BEGIN
	INSERT INTO T_PRECISION_HISTORY VALUES (id, id_precision, id_offre, numero_vol, dimensionL, dimensionH, nom_company, detail, date_modif);
END|

-- declencheur pour enregistrer l'historique de la table T_PRECISION
CREATE TRIGGER t_precision_update_trig AFTER UPDATE ON T_PRECISION
FOR EACH ROW
BEGIN
	CALL inserer_t_precision_history(0, OLD.id, OLD.id_offre, OLD.numero_vol, OLD.dimensionL, OLD.dimensionH, OLD.nom_company, OLD.detail, NOW());
END|

-- inserer une ligne dans la table T_RESERVER_HISTORY
CREATE PROCEDURE inserer_t_reserver_history (id INT, id_offre INT, id_user INT, nb_kg INT, nb_env INT, id_avis_v INT, id_avis_c INT, date_reservation DATETIME, est_confirme CHAR(1), date_modif DATETIME)
BEGIN
	INSERT INTO T_RESERVER_HISTORY VALUES (id, id_offre, id_user, nb_kg, nb_env, id_avis_v, id_avis_c, date_reservation, est_confirme, date_modif);
END|

-- declencheur pour enregistrer l'historique de la table T_RESERVER
CREATE TRIGGER t_reserver_update_trig AFTER UPDATE ON T_RESERVER
FOR EACH ROW
BEGIN
	CALL inserer_t_reserver_history(0, OLD.id_offre, OLD.id_user, OLD.nb_kg, OLD.nb_env, OLD.id_avis_v, OLD.id_avis_c, OLD.date_reservation, OLD.est_confirme, NOW());
END|


-- inserer une ligne dans la table t_type_article_history
CREATE PROCEDURE inserer_t_type_article_history(id INT, id_article INT, type VARCHAR(50), date_modif DATETIME)
BEGIN
	INSERT INTO T_TYPE_ARTICLE_HISTORY VALUES (id, id_article, type, date_modif);
END|

-- declencheur pour enregistrer l'historique de la table T_TYPE_ARTICLE
CREATE TRIGGER t_type_article_update_trig AFTER UPDATE ON T_TYPE_ARTICLE
FOR EACH ROW
BEGIN
	CALL inserer_t_type_article_history(0, OLD.id_article, OLD.type, NOW());
END|

-- inserer une ligne dans la table t_article_history
CREATE PROCEDURE inserer_t_article_history(id INT, id_article INT, id_reservation INT, id_user INT, type INT, marque VARCHAR(45), valeur CHAR(1), date_modif DATETIME)
BEGIN
	INSERT INTO T_ARTICLE_HISTORY VALUES (id, id_article, id_reservation, id_user, type, marque, valeur, date_modif);
END|

-- declencheur pour enregistrer l'historique de la table T_ARTICLE_HISTORY
CREATE TRIGGER t_article_update_trig AFTER UPDATE ON T_ARTICLE
FOR EACH ROW
BEGIN
	CALL inserer_t_article_history(0, OLD.id, OLD.id_reservation, OLD.id_user, OLD.type, OLD.marque, OLD.valeur, NOW());
END|
