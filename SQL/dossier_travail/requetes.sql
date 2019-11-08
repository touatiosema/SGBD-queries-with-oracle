-- =======================================================================
-- version SQL: ORACLE Version 7.0 
-- source: http://slombardy.vvv.enseirb-matmeca.fr/ens/sgbd/tdsql.php#sec1
-- context: TP SGBD, 2eme annee informatique, ENSEIRB MATMECA
-- date: 10/2019
-- =======================================================================
-- fichiers requits:
-- ./base.sql
-- ./donnee.sql
-- ./oracle.sql
-- =======================================================================
-- shema relationel:

-- ACTEUR (NUMERO_ACTEUR, NOM_ACTEUR, PRENOM_ACTEUR, NATION_ACTEUR, DATE_DE_NAISSANCE)
-- ROLE (NUMERO_ACTEUR, NUMERO_FILM, NOM_DU_ROLE)
-- FILM (NUMERO_FILM, TITRE_FILM, DATE_DE_SORTIE, DUREE, GENRE, NUMERO_REALISATEUR)
-- REALISATEUR (NUMERO_REALISATEUR, NOM_REALISATEUR, PRENOM_REALISATEUR, NATION_REALISATEUR)
-- =======================================================================



-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- Requêtes de base (sélection, projection, tri, jointure)
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- les nom des acteurs:
select NOM_ACTEUR from acteur;

-- Les noms des acteurs (sans répétitions).
select distinct NOM_ACTEUR from acteur;

-- Les acteurs français.
select * from acteur where acteur.NATION_ACTEUR='FRANCAISE';

--Les noms des acteurs nés entre le 1er janvier 1950 et le 31 décembre 1999.
select NOM_ACTEUR from acteur 
where DATE_DE_NAISSANCE BETWEEN to_date('01/01/1950', 'DD/MM/YYYY') and to_date('31/12/1999', 'DD/MM/YYYY');

--Les noms des rôles de l'acteur numéro 7 triés par ordre alphabétique.
select nom_du_role from role where numero_acteur = 7 order by nom_du_role asc;

--Les noms et prénoms des réalisateurs qui ont travaillé avec l'acteur numéro 7.
select re.NOM_REALISATEUR, re.prenom_realisateur from  role r inner join film f  on r.numero_film = f.numero_film inner join realisateur re on re.numero_realisateur=f.numero_realisateur where r.numero_acteur=7;

-- Les noms et prénoms des réalisateurs qui ont travaillé avec l'acteur POIRET triés par ordre alphabétique sur le nom.
select re.NOM_REALISATEUR, re.prenom_realisateur from acteur a inner join role r on a.numero_acteur=r.numero_acteur inner join  film f on r.numero_film = f.numero_film inner join realisateur re on re.numero_realisateur=f.numero_realisateur  where a.nom_acteur='POIRET' order by re.NOM_REALISATEUR;

-- Les acteurs qui ont joués avec le réalisateur numéro 7.
select a.* from acteur a inner join role r on r.numero_acteur=a.numero_acteur inner join film f on f.numero_film=r.numero_film inner join realisateur re on re.numero_realisateur=f.numero_realisateur where re.numero_realisateur=7;

-- Les numéros et noms des acteurs ayant une nationalité dont la valeur est renseignée (le champ a une valeur et non la pseudo-valeur d'indétermination).

select a.numero_acteur, a.nom_acteur from acteur a where  a.NATION_ACTEUR is not null;

-- Les noms des réalisateurs qui ont réalisé un film (au moins un).
select distinct re.NOM_REALISATEUR from realisateur re inner join film f on f.numero_realisateur=re.numero_realisateur;    


-- ++++++++++++++++++++++++++++++
-- Requêtes sur les regroupements
-- ++++++++++++++++++++++++++++++


-- Le nombre de réalisateurs.
select count(*) from realisateur;

-- Pour chaque acteur, le nombre de ses rôles
select a.nom_acteur, count(*) nb_roles from acteur a join role r on r.numero_acteur=a.numero_acteur group by a.nom_acteur;

-- Pour chaque acteur, la durée de son film le plus court, la durée de son film le plus long, l'écart maximal de durée entre ses films et la moyenne de durée de ses films.

select a.nom_acteur, min(f.DUREE) min_duree, max(f.DUREE) max_duree, max(f.DUREE)-min(f.DUREE), avg(f.duree) from acteur a join role r on r.numero_acteur=a.numero_acteur join film f on f.NUMERO_FILM=r.NUMERO_FILM group by a.nom_acteur;

-- Les réalisateurs ayant réalisé exactement deux films.

select re.NOM_REALISATEUR, count(*) as nb_realisation from realisateur re join film f on f.numero_realisateur=re.numero_realisateur group by  re.NOM_REALISATEUR having count(*)=2;

-- Les réalisateurs ayant réalisé au moins trois films, en affichant le numéro et le nom des réalisateurs ainsi que le nombre de films ; le résultat est trié par ordre décroissant du nombre de films et par ordre croissant sur le nom.

select re.numero_realisateur, re.NOM_REALISATEUR name , count(*) as nb_film from realisateur re join film f on f.numero_realisateur=re.numero_realisateur group by  re.numero_realisateur, re.NOM_REALISATEUR having count(*)>=3 order by nb_film desc, name asc;

-- Les numéros des acteurs dont la durée moyenne des films dans lesquels ils ont joué des rôles est égale à 2h.

select a.numero_acteur from acteur a join role r on r.numero_acteur=a.numero_acteur join film f on f.numero_film=r.numero_film group by a.numero_acteur having  avg(f.duree)=120;

-- Les numéros des acteurs français dont la somme cumulée des durées de leurs rôles est inférieure à 10 heures (tous films confondus).

select a.numero_acteur from acteur a join role r on r.numero_acteur=a.numero_acteur join film f on f.numero_film=r.numero_film where a.NATION_ACTEUR='FRANCAISE' group by a.numero_acteur having sum(f.duree)<10*60;


-- ++++++++++++++++++++++++++++++++++++++++
-- Requêtes sur les opérations ensemblistes
-- ++++++++++++++++++++++++++++++++++++++++


-- Les noms des acteurs et les noms des réalisateurs (sans répétitions, sur une seule colonne).

select distinct a.nom_acteur nom from ACTEUR a union select distinct r.NOM_REALISATEUR nom from realisateur r;

-- Les noms communs aux acteurs et aux réalisateurs (sans répétitions).

select distinct a.nom_acteur NOM_ACTEUR from acteur a INTERSECT select DISTINCT r.NOM_REALISATEUR NOM_ACTEUR from realisateur r;

-- Les noms des acteurs qui ne sont pas des noms de réalisateur (sans répétitions).

select distinct a.nom_acteur nom from acteur a MINUS select DISTINCT r.nom_realisateur nom from realisateur r;

-- Les numéros et noms des acteurs français ou américains.

select a.numero_acteur, a.nom_acteur from acteur a where a.NATION_ACTEUR='FRANCAISE' union select a.numero_acteur, a.nom_acteur from acteur a where a.NATION_ACTEUR='AMERICAINE';


-- Les réalisateurs n'ayant réalisé aucun film.

select * from realisateur minus select NUMERO_REALISATEUR, nom_realisateur, prenom_realisateur, nation_realisateur from realisateur re join film m using (numero_realisateur);


-- ++++++++++++++++++++++
-- ## Requêtes imbriquées
-- ++++++++++++++++++++++


--Les noms communs aux acteurs et aux réalisateurs (trouver une solution différente de celle trouvée précédemment).

select nom_acteur nom from acteur a join (select nom_realisateur nom from realisateur re) on re.nom_acteur=a.nom;

-- Les numéros des réalisateurs ayant réalisé le film le plus long.

select numero_realisateur from realisateur join film f using (numero_realisateur) where  f.duree=(select max(duree) from film);

-- Les numéros et noms des acteurs ayant la(les) nationalité(s) la(les) plus fréquente(s).

select numero_acteur, nom_acteur from acteur a where a.nation_acteur in( select b.nation_acteur from (select max(count(*)) c from acteur group by nation_acteur) a join (select nation_acteur, count(*) c from acteur group by nation_acteur) b on a.c=b.c);

-- Les noms des acteurs n'ayant pas joué avec le réalisateur numéro 7.

select nom_acteur from acteur a join role r using(numero_acteur) join film f using(numero_film) where f.numero_realisateur!=7;

select nom_acteur from acteur a join role r using(numero_acteur) where numero_film not in (select numero_film from film f join realisateur re using(numero_realisateur) where numero_realisateur=7);
-- Les réalisateurs n'ayant réalisé aucun film (trouver une solution différente).

select * from realisateur re where numero_realisateur not in (select numero_realisateur from film);



-- ++++++++++++++++++++++
-- ## Requêtes avancées:
-- ++++++++++++++++++++++


-- Que fait les requêtes suivantes ?
-- #####################################################

-- select distinct NOM_ACTEUR
-- from REALISATEUR, ACTEUR
-- where NOM_ACTEUR = NOM_REALISATEUR;

-- trouver les acteurs qui partage le meme nom avec un des realisateur.


-- #####################################################
-- select A.NOM_ACTEUR
-- from ACTEUR A, ACTEUR COPIE
-- where A.NOM_ACTEUR = COPIE.NOM_ACTEUR
-- group by A.NOM_ACTEUR
-- having count(*) = 1;

-- touver les acteur dont le nom ne se repete pas (ils ont un nom unique sur la bd)


-- ++++++++++++++++++++++++
-- Requêtes de mise à jour:
-- ++++++++++++++++++++++++

-- Insérer un réalisateur.

insert into REALISATEUR (NUMERO_REALISATEUR, NOM_REALISATEUR, PRENOM_REALISATEUR, NATION_REALISATEUR) values (15, 'TOUATI', 'Osema', 'Algerien');

-- Supprimer tous les acteurs américains.
delete from ROLE where numero_acteur in (select numero_acteur from acteur a where nation_acteur='AMERICAINE');
delete from acteur where nation_acteur ='AMERICAINE';


-- Modifier la durée de tous les films en leur ajoutant une heure.

update film set duree=duree+60;