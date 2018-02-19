-------------------------------------------------------------
-- 					Mohamed habib HABIB                     -
-- 						19-02-2018                          -
-------------------------------------------------------------

-------------------------------------------------------------
-- affichage les offres par :                               -
--		*Ville depart et Ville arrivee                      - 
--		*Date Depart et Arrive                              -
-------------------------------------------------------------

DELIMITER | 

CREATE PROCEDURE affichage_offre(IN p_ville_depart VARCHAR(45), IN p_ville_arrivee VARCHAR(45), IN p_date_depart DATETIME, IN p_date_arrivee DATETIME) 
BEGIN 
SELECT ville_depart, ville_arrivee, date_depart, date_arrivee      
FROM T_OFFRE WHERE ( (ville_depart=p_ville_depart AND
      ville_arrivee=p_ville_arrivee AND
      date_depart=p_date_depart AND
      date_arrivee=p_date_arrivee )
 OR     
      (ville_depart=p_ville_depart   AND
   ville_arrivee=p_ville_arrivee AND
      date_depart=p_date_depart  )); 
END|


DELIMITER ;


-- AVEC date d'arrive

CALL affichage_offre("Paris","Tunis","2018-02-25 07:00:00","2018-02-25 09:00:00");


-- son date d'arrive

CALL affichage_offre("Paris","Tunis","2018-02-25 07:00:00",NULL);


--------------------------------------------------------------------
-- affichage des commentaire par note pour un offre donné          - 
--------------------------------------------------------------------

----------------------------------------------------------------------
-- Faut pas donner un nom pour l'offre pour recherche par nom, non?  -
---------------------------------------------------------------------- 

DELIMITER |

 CREATE PROCEDURE affichage_commentaire_note(IN p_id int(11))
 BEGIN
 SELECT texte, note FROM T_AVIS
 WHERE id_user=(SELECT id FROM T_OFFRE WHERE id=p_id);
 END | 

DELIMITER ;

CALL affichage_commentaire_note(1);



