-------------------------------------------------------------
-- 					Mohamed habib HABIB                     -
-- 						13-03-2018                          -
-------------------------------------------------------------

-------------------------------------------------------------
-- Procedure n_offre_disponible                            --
--		qui retourne la liste des N dernier offres         -- 
--		disponible(nb_kg,nb_env,date)                      --
-------------------------------------------------------------


DELIMITER |
CREATE PROCEDURE n_derniere_offre_disponible(IN N INT)
BEGIN
SELECT  nb_kg_dispo,
        nb_env_dispo,
        date_depart
FROM T_OFFRE 
WHERE ((nb_kg_dispo>0) OR (nb_env_dispo>0)
        AND date_depart<CURDATE()) LIMIT 0,N ;
END |  

DELIMITER ;

CALL n_derniere_offre_disponible(2);   
