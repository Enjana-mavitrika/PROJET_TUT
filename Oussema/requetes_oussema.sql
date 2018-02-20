-- -----------------------------------------------------
-- Requetes Realisé le 19/02/2018  
--par: Trabelsi Oussema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Filter offres par: nb kilo ( on vire les <)
-- -----------------------------------------------------

DELIMITER $$ 
CREATE PROCEDURE filtre_kg(IN kg INT )
BEGIN
SELECT id FROM T_OFFRE 
WHERE nb_kg_dispo>kg ;
END $$
DELIMITER ;

call filtre_kg(10);


-- -----------------------------------------------------
-- Filter offres par: prix(max)
-- -----------------------------------------------------

DELIMITER $$ 
CREATE PROCEDURE filtre_prix(IN prix INT )
BEGIN
SELECT id FROM T_OFFRE 
WHERE prix_kg<prix ;
END $$
DELIMITER ;

call filtre_prix(20);



-- -----------------------------------------------------
-- Filter offres par: company	
-- -----------------------------------------------------

DELIMITER $$ 
CREATE PROCEDURE filtre_company(IN nomc VARCHAR(40) )
BEGIN
SELECT o.id 
FROM T_OFFRE o,T_PRESICION p 
WHERE o.id=p.id_offre and nom_company=nomc ;
END $$
DELIMITER ;

call filtre_company("TunisAir");
-- -----------------------------------------------------
-- Filter offres par: *utilisateurs(confirmé)
-- -----------------------------------------------------

DELIMITER $$ 
CREATE PROCEDURE filtre_userconfirme()
BEGIN
SELECT o.id 
FROM T_OFFRE o,T_USER u 
WHERE o.id_user=u.id and u.est_confirmee='O' ;
END $$
DELIMITER ;


call filtre_userconfirme();

-- -----------------------------------------------------
-- Effacer une procedure:
-- -----------------------------------------------------
DROP PROCEDURE nom_procedure ;









