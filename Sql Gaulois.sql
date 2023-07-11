-- Exercice 1
SELECT nom_lieu FROM lieu
WHERE nom_lieu LIKE "%um";

-- Exercice 2
SELECT COUNT(nom_personnage), nom_lieu 
FROM personnage p, lieu l
WHERE p.id_lieu = l.id_lieu
GROUP BY nom_lieu
ORDER BY nom_lieu DESC;

-- Exercice 3
SELECT nom_personnage, nom_specialite, adresse_personnage, nom_lieu
FROM lieu l, personnage p, specialite s
WHERE l.id_lieu = p.id_lieu
AND s.id_specialite = p.id_specialite
ORDER BY nom_lieu, nom_personnage; 

-- Exercice 4
SELECT COUNT(nom_personnage), nom_specialite 
FROM personnage p, specialite s
WHERE p.id_specialite = s.id_specialite
GROUP BY nom_specialite
ORDER BY COUNT(nom_personnage) DESC;

-- Exercice 5
SELECT nom_bataille, DATE_FORMAT(date_bataille, "%d %m %Y"), nom_lieu
FROM bataille b, lieu l
WHERE b.id_lieu = l.id_lieu
ORDER BY date_bataille DESC;

-- Exercice 6
SELECT nom_potion, SUM(cout_ingredient) AS total
FROM potion p, ingredient i, composer c
WHERE p.id_potion = c.id_potion
AND i.id_ingredient = c.id_ingredient
GROUP BY p.nom_potion
ORDER BY total DESC;

-- Exercice 7
SELECT nom_ingredient, cout_ingredient, qte, nom_potion
FROM ingredient i, potion p, composer c
WHERE i.id_ingredient = c.id_ingredient
AND p.id_potion = c.id_potion
AND nom_potion = "Santé";

-- Exercice 8
SELECT nom_personnage, nom_bataille, MAX(qte) AS total_casque
FROM personnage p, bataille b, prendre_casque pc
WHERE p.id_personnage = pc.id_personnage
AND b.id_bataille = pc.id_bataille
AND nom_bataille = "Bataille du village gaulois"
GROUP BY nom_personnage
ORDER BY total_casque DESC
LIMIT 1;

-- Exercice 9
SELECT nom_personnage, SUM(dose_boire) AS total_boire
FROM personnage p, boire b
WHERE p.id_personnage = b.id_personnage
GROUP BY nom_personnage
ORDER BY total_boire DESC;

-- Exercice 10
SELECT nom_bataille, SUM(qte) AS total_casque
FROM bataille b, prendre_casque p
WHERE b.id_bataille = p.id_bataille
GROUP BY nom_bataille DESC
LIMIT 1;

-- Exercice 11
SELECT nom_type_casque, COUNT(c.id_type_casque) AS nb, SUM(cout_casque)
FROM type_casque t, casque c
WHERE t.id_type_casque = c.id_type_casque
GROUP BY nom_type_casque
ORDER BY nb DESC;

-- Exercice 12
SELECT nom_potion, nom_ingredient
FROM potion p, ingredient i, composer c
WHERE p.id_potion = c.id_potion
AND i.id_ingredient = c.id_ingredient
AND nom_ingredient = "Poisson frais";

-- Exercice 13
SELECT nom_lieu, COUNT(nom_personnage) AS total
FROM lieu l, personnage p
WHERE l.id_lieu = p.id_lieu
AND nom_lieu != "Village gaulois"
GROUP BY nom_lieu
ORDER BY total DESC
LIMIT 2;

-- Exercice 14
SELECT nom_personnage, dose_boire
FROM personnage p, boire b
WHERE p.id_personnage = b.id_personnage
AND dose_boire = 0;

-- Exercice 15
SELECT nom_personnage
FROM personnage
WHERE id_personnage NOT IN (
    SELECT id_personnage
    FROM autoriser_boire
       
INNER JOIN potion ON autoriser_boire.id_potion = potion.id_potion
       
WHERE potion.nom_potion = 'Magique'
);

-- Exercice A
INSERT INTO personnage VALUES (46, "Champdeblix", "résidant à la ferme Hantassion", "indisponible.jpg", 6, 12);

-- Exercice B
INSERT INTO autoriser_boire VALUES (1, 12);

-- Exercice C
DELETE FROM casque
WHERE casque.id_type_casque = 2
AND NOT EXISTS (
    SELECT * FROM prendre_casque
    WHERE prendre_casque.id_casque = casque.id_casque
);

-- Exercice D
UPDATE personnage
SET adresse_personnage = "Prison", id_lieu = 9
WHERE id_personnage = 23;

-- Exerice E
DELETE FROM composer
WHERE composer.id_ingredient = 19 AND composer.id_potion = 9;

-- Exercice F
UPDATE prendre_casque
SET id_casque = 10, qte = 42
WHERE id_personnage = 5 AND id_bataille = 9;