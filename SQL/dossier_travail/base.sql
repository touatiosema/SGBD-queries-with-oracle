-- ============================================================
--   Nom de la base   :  CINEMA                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  30/10/96  12:09                       
-- ============================================================

drop table ROLE cascade constraints;

drop table FILM cascade constraints;

drop table REALISATEUR cascade constraints;

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
--   Table : ROLE                                              
-- ============================================================
create table ROLE
(
    NUMERO_ACTEUR                   NUMBER(3)              not null,
    NUMERO_FILM                     NUMBER(3)              not null,
    NOM_DU_ROLE                     CHAR(30)                       ,
    constraint pk_role primary key (NUMERO_ACTEUR, NUMERO_FILM)
);

alter table FILM
    add constraint fk1_film foreign key (NUMERO_REALISATEUR)
       references REALISATEUR (NUMERO_REALISATEUR);

alter table ROLE
    add constraint fk1_role foreign key (NUMERO_ACTEUR)
       references ACTEUR (NUMERO_ACTEUR);

alter table ROLE
    add constraint fk2_role foreign key (NUMERO_FILM)
       references FILM (NUMERO_FILM);

