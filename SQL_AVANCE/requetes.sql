-- ======================
-- = table descriptions:=
-- ======================

-- ACTEUR (NUMERO_ACTEUR, NOM_ACTEUR, PRENOM_ACTEUR, NATION_ACTEUR, DATE_DE_NAISSANCE)
-- ROLE (#NUMERO_ACTEUR, #NUMERO_FILM,NOM_DU_ROLE)
-- FILM (NUMERO_FILM, TITRE_FILM, DATE_DE_SORTIE, DUREE, GENRE, #NUMERO_REALISATEUR)
-- REALISATEUR (NUMERO\_REALISATEUR, NOM_REALISATEUR, PRENOM_REALISATEUR, NATION_REALISATEUR)
-- SEANCE (NUMERO_SEANCE, #NUMERO_FILM, #CATEGORIE_DE_LA_SEANCE, DATE_DE_LA_SEANCE, HORAIRE)
-- CATEGORIE_SEANCE (CATEGORIE_DE_LA_SEANCE, TYPE_SEANCE)
-- RESERVATION (#NUMERO_SEANCE, #NUMERO_PLACE, NOM_SPECTATEUR)
-- PLACE (NUMERO_PLACE, #CATEGORIE_DE_LA_PLACE)
-- CATEGORIE_PLACE (CATEGORIE_DE_LA_PLACE, TYPE_PLACE)
-- TARIF (#CATEGORIE_DE_LA_PLACE, #CATEGORIE_DE_LA_SEANCE, PRIX)

-- ======================
-- = Les requestes:     =
-- ======================

-- 1.  Les dates des séances (sans répétition) des films dans lesquels l'acteur numéro 1 joue. 
select DISTINCT DATE_DE_LA_SEANCE from SEANCE S  JOIN FILM F  on S.NUMERO_FILM = F.NUMERO_FILM  JOIN ROLE R ON R.NUMERO_FILM = F.NUMERO_FILM  JOIN ACTEUR A ON A.NUMERO_ACTEUR = R.NUMERO_ACTEUR  WHERE A.NUMERO_ACTEUR = 1;

-- 2. Les noms des rôles de l'acteur numéro 4 triées par ordre alphabétique.
SELECT NOM_DU_ROLE FROM ACTEUR  NATURAL JOIN ROLE  WHERE NUMERO_ACTEUR = 4 ORDER BY NOM_DU_ROLE ASC;

-- 3. Les dates et les horaires des séances du film numéro 7 triées par ordre décroissant selon les dates et croissant selon les horaires.
SELECT DATE_DE_LA_SEANCE, HORAIRE FROM SEANCE NATURAL JOIN FILM WHERE NUMERO_FILM = 7 ORDER BY DATE_DE_LA_SEANCE DESC, HORAIRE ASC;

-- 4. Le nombre d'acteurs.
SELECT COUNT(*) NOMBRE_ACTEURS FROM ACTEUR;

-- 5. Le titre des films projetés pendant exactement deux séances.
SELECT TITRE_FILM FROM (SELECT NUMERO_FILM, TITRE_FILM FROM FILM NATURAL JOIN SEANCE group by NUMERO_FILM, TITRE_FILM HAVING  count(*)= 2);

-- 6. Pour les tables ACTEUR et ROLE La jointure interne.
SELECT * FROM ACTEUR  NATURAL NATURAL JOIN ROLE ;
SELECT * FROM ACTEUR A INNER JOIN ROLE R ON A.NUMERO_ACTEUR=R.NUMERO_ACTEUR; 
SELECT * FROM ACTEUR A INNER JOIN ROLE R USING(NUMERO_ACTEUR);
SELECT * FROM ACTEUR A, ROLE A WHERE A.NUMERO_ACTEUR = R.NUMERO_ACTEUR; -- C PAS LE BON CHOIX

-- 7. Pour les tables ACTEUR et ROLE La jointure externe gauche.
SELECT * FROM ACTEUR LEFT OUTER JOIN ROLE USING(NUMERO_ACTEUR);
SELECT * FROM ACTEUR A LEFT OUTER JOIN ROLE R ON R.NUMERO_ACTEUR = A.NUMERO_ACTEUR;
-- 8. Les noms et prénoms des réalisateurs qui ont travaillé avec l'acteur DUBOIS (en utilisant les nouvelles syntaxes pour les jointures).
-- 9. Le classement des acteurs selon le nombre de rôle réalisés (en classant en dernier les acteurs n'ayant pas réalisés de rôles).

