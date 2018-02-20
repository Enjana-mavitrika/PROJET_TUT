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


-- sans date d'arrive

CALL affichage_offre("Paris","Tunis","2018-02-25 07:00:00",NULL);


--------------------------------------------------------------------
-- affichage des commentaire par note pour un offre donné          - 
--------------------------------------------------------------------

-- Faut pas donner un nom pour l'offre pour recherche par nom, non?  

DELIMITER |

 CREATE PROCEDURE affichage_commentaire_note(IN ido int, IN note int)
 BEGIN
 SELECT a.* FROM T_AVIS a ,T_OFFRE o ,T_RESERVER r 
 WHERE o.id=r.id_offre and r.id_avis_c=a.id and o.id=ido and a.note=note  ;
 END | 

DELIMITER ;

CALL affichage_commentaire_note(1,8);



