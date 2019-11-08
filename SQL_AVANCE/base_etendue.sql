-- ============================================================
--   Nom de la base   :  CINEMA                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop index TARIF_PK;

drop table TARIF cascade constraints;

drop index RESERVATION_PK;

drop table RESERVATION cascade constraints;

drop index ROLE_PK;

drop table ROLE cascade constraints;

drop index PLACE_PK;

drop index PLACE_FK1;

drop table PLACE cascade constraints;

drop index SEANCE_PK;

drop index SEANCE_FK1;

drop index SEANCE_FK2;

drop table SEANCE cascade constraints;

drop index FILM_PK;

drop index FILM_FK1;

drop table FILM cascade constraints;

drop index CATEGORIE_PLACE_PK;

drop table CATEGORIE_PLACE cascade constraints;

drop index CATEGORIE_SEANCE_PK;

drop table CATEGORIE_SEANCE cascade constraints;

drop index REALISATEUR_PK;

drop table REALISATEUR cascade constraints;

drop index ACTEUR_PK;

drop table ACTEUR cascade constraints;

-- ============================================================
--   Table : ACTEUR                                            
-- ============================================================
create table ACTEUR
(
    NUMERO_ACTEUR                   NUMBER(3)              not null,
    NOM_ACTEUR                      CHAR(20)               not null,
    PRENOM_ACTEUR                   CHAR(20)                       ,
    NATION_ACTEUR                   CHAR(20)                       ,
    DATE_DE_NAISSANCE               DATE                           ,
    constraint pk_acteur primary key (NUMERO_ACTEUR)
);

-- ============================================================
--   Table : REALISATEUR                                       
-- ============================================================
create table REALISATEUR
(
    NUMERO_REALISATEUR              NUMBER(3)              not null,
    NOM_REALISATEUR                 CHAR(20)               not null,
    PRENOM_REALISATEUR              CHAR(20)                       ,
    NATION_REALISATEUR              CHAR(20)                       ,
    constraint pk_realisateur primary key (NUMERO_REALISATEUR)
);

-- ============================================================
--   Table : CATEGORIE_SEANCE                                  
-- ============================================================
create table CATEGORIE_SEANCE
(
    CATEGORIE_DE_LA_SEANCE          CHAR(1)                not null,
    TYPE_SEANCE                     CHAR(20)                       ,
    constraint pk_categorie_seance primary key (CATEGORIE_DE_LA_SEANCE)
);

-- ============================================================
--   Table : CATEGORIE_PLACE                                   
-- ============================================================
create table CATEGORIE_PLACE
(
    CATEGORIE_DE_LA_PLACE           CHAR(1)                not null,
    TYPE_PLACE                      CHAR(20)                       ,
    constraint pk_categorie_place primary key (CATEGORIE_DE_LA_PLACE)
);

-- ============================================================
--   Table : FILM                                              
-- ============================================================
create table FILM
(
    NUMERO_FILM                     NUMBER(3)              not null,
    TITRE_FILM                      CHAR(30)               not null,
    DATE_DE_SORTIE                  DATE                           ,
    DUREE                           NUMBER(3)              not null,
    GENRE                           CHAR(20)               not null,
    NUMERO_REALISATEUR              NUMBER(3)              not null,
    constraint pk_film primary key (NUMERO_FILM)
);

-- ============================================================
--   Index : FILM_FK1                                          
-- ============================================================
create index FILM_FK1 on FILM (NUMERO_REALISATEUR asc);

-- ============================================================
--   Table : SEANCE                                            
-- ============================================================
create table SEANCE
(
    NUMERO_SEANCE                   NUMBER(3)              not null,
    NUMERO_FILM                     NUMBER(3)              not null,
    CATEGORIE_DE_LA_SEANCE          CHAR(1)                not null,
    DATE_DE_LA_SEANCE               DATE                           ,
    HORAIRE                         NUMBER(2)                      ,
    constraint pk_seance primary key (NUMERO_SEANCE)
);

-- ============================================================
--   Index : SEANCE_FK1                                        
-- ============================================================
create index SEANCE_FK1 on SEANCE (NUMERO_FILM asc);

-- ============================================================
--   Index : SEANCE_FK2                                        
-- ============================================================
create index SEANCE_FK2 on SEANCE (CATEGORIE_DE_LA_SEANCE asc);

-- ============================================================
--   Table : PLACE                                             
-- ============================================================
create table PLACE
(
    NUMERO_PLACE                    NUMBER(3)              not null,
    CATEGORIE_DE_LA_PLACE           CHAR(1)                not null,
    constraint pk_place primary key (NUMERO_PLACE)
);

-- ============================================================
--   Index : PLACE_FK1                                         
-- ============================================================
create index PLACE_FK1 on PLACE (CATEGORIE_DE_LA_PLACE asc);

-- ============================================================
--   Table : ROLE                                              
-- ============================================================
create table ROLE
(
    NUMERO_ACTEUR                   NUMBER(3)              not null,
    NUMERO_FILM                     NUMBER(3)              not null,
    NOM_DU_ROLE                     CHAR(30)                       ,
    constraint pk_role primary key (NUMERO_ACTEUR, NUMERO_FILM)
);

-- ============================================================
--   Table : RESERVATION                                       
-- ============================================================
create table RESERVATION
(
    NUMERO_SEANCE                   NUMBER(3)              not null,
    NUMERO_PLACE                    NUMBER(3)              not null,
    NOM_SPECTATEUR                  CHAR(20)                       ,
    constraint pk_reservation primary key (NUMERO_SEANCE, NUMERO_PLACE)
);

-- ============================================================
--   Table : TARIF                                             
-- ============================================================
create table TARIF
(
    CATEGORIE_DE_LA_PLACE           CHAR(1)                not null,
    CATEGORIE_DE_LA_SEANCE          CHAR(1)                not null,
    PRIX                            NUMBER(3)                      ,
    constraint pk_tarif primary key (CATEGORIE_DE_LA_PLACE, CATEGORIE_DE_LA_SEANCE)
);

-- Commente pour des raisons pedagogiques :
-- Avoir un film avec un realisateur inexistant pour montrer l'interet des
-- jointures externes droites.
-- alter table FILM
--     add constraint fk1_film foreign key (NUMERO_REALISATEUR)
--        references REALISATEUR (NUMERO_REALISATEUR);

alter table SEANCE
    add constraint fk1_seance foreign key (NUMERO_FILM)
       references FILM (NUMERO_FILM);

alter table SEANCE
    add constraint fk2_seance foreign key (CATEGORIE_DE_LA_SEANCE)
       references CATEGORIE_SEANCE (CATEGORIE_DE_LA_SEANCE);

alter table PLACE
    add constraint fk1_place foreign key (CATEGORIE_DE_LA_PLACE)
       references CATEGORIE_PLACE (CATEGORIE_DE_LA_PLACE);

alter table ROLE
    add constraint fk1_role foreign key (NUMERO_ACTEUR)
       references ACTEUR (NUMERO_ACTEUR);

alter table ROLE
    add constraint fk2_role foreign key (NUMERO_FILM)
       references FILM (NUMERO_FILM);

alter table RESERVATION
    add constraint fk1_reservation foreign key (NUMERO_SEANCE)
       references SEANCE (NUMERO_SEANCE);

alter table RESERVATION
    add constraint fk2_reservation foreign key (NUMERO_PLACE)
       references PLACE (NUMERO_PLACE);

alter table TARIF
    add constraint fk1_tarif foreign key (CATEGORIE_DE_LA_PLACE)
       references CATEGORIE_PLACE (CATEGORIE_DE_LA_PLACE);

alter table TARIF
    add constraint fk2_tarif foreign key (CATEGORIE_DE_LA_SEANCE)
       references CATEGORIE_SEANCE (CATEGORIE_DE_LA_SEANCE);

