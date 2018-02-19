-----------------------------------------------------------
-- affichage les offres par :
--		*Ville depart et Ville arrivee
--		*Date Depart et Arrive 
-------------------------------------------------------------

SELECT ville_depart, ville_arrivee, date_depart, date_arrivee
     FROM T_OFFRE WHERE ( (ville_depart="Paris" AND
     ville_arrivee="Tunis" AND
     date_depart="2018-02-25 07:00:00" AND
     date_arrivee="2018-02-25 09:00:00" )
     OR
     (ville_depart="Paris" AND
     ville_arrivee="Tunis" AND
     date_depart="2018-02-25 07:00:00" 
     ));

------------------------------------------------------------------
-- affichage des commentaire par note pour un offre donné 
--------------------------------------------------------------------

----------------------------------------------------------------------
-- Faut pas donner un nom pour l'offre pour recherche par nom, non?
--------------------------------------------------------------------

SELECT texte, note FROM T_AVIS 
       WHERE id_user=(SELECT id FROM T_OFFRE WHERE id=1);  




