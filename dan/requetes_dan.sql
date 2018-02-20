--****************************************
-- Auteur : Dan
-- Fonctionnalités : 
--    - afficher_user_byLogin(user_login VARCHAR(45))....selectionne un user par son login
--


- ---------------------------------------------------------
-- afficher offres disponibles pour un user
-- --------------------------------------------------------
DELIMITER $$ 
CREATE PROCEDURE offre_dispo_u(IN idu INT)
BEGIN
SELECT *
FROM T_OFFRE o
WHERE o.id_user=idu and nb_kg_dispo>0 and nb_env_dispo >0 ;
END $$
DELIMITER ;




-- afficher information d'un user

DELIMITER |

CREATE PROCEDURE affichage_profil_utilisateur(IN p_id INT)
BEGIN

SELECT *
FROM T_USER 
WHERE id=p_id;

END |

DELIMITER ;
