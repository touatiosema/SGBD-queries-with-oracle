-- ============================================================
--    suppression des donnees
-- ============================================================

delete from ROLE ;
delete from ACTEUR ;
delete from FILM ;
delete from REALISATEUR ;

commit ;

-- ============================================================
--    creation des donnees
-- ============================================================

-- REALISATEUR

insert into REALISATEUR values (  1 , 'SAUTET'     , 'CLAUDE'       , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  2 , 'PINOTEAU'   , 'CLAUDE'       , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  3 , 'DAVOY'      , 'ERIC'         , 'BELGE'      ) ;
insert into REALISATEUR values (  4 , 'ZIDI'       , 'CLAUDE'       , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  5 , 'AUTAN-LARA' , 'CLAUDE'       , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  6 , 'ROHMER'     , 'ERIC'         , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  7 , 'MALLE'      , 'LOUIS'        , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  8 , 'BESSON'     , 'LUC'          , 'FRANCAISE'  ) ;
insert into REALISATEUR values (  9 , 'PREMINGER'  , 'OTTO'         , 'FRANCAISE'  ) ;
insert into REALISATEUR values ( 10 , 'BEINEIX'    , 'JEAN-JACQUES' , 'FRANCAISE'  ) ;
insert into REALISATEUR values ( 11 , 'GERONIMI'   , 'C.'           , 'AMERICAINE' ) ;
insert into REALISATEUR values ( 12 , 'LYNE'       , 'ADRIAN'       , 'AMERICAINE' ) ;
insert into REALISATEUR values ( 13 , 'TRUFFAUT'   , 'FRANCOIS'     , 'FRANCAISE'  ) ;
insert into REALISATEUR values ( 14 , 'COCTEAU'    , 'JEAN'         , 'FRANCAISE'  ) ;

commit ;

-- FILM

insert into FILM values (  1 , 'GARCON'                       , '01-JAN-83' , 110 , 'COMEDIE'            ,  1 ) ;
insert into FILM values (  2 , 'CESAR ET ROSALIE'             , '02-APR-71' ,  90 , 'COMEDIE'            ,  1 ) ;
insert into FILM values (  3 , 'LA FAC'                       , '24-FEB-89' , 420 , 'SATYRIQUE'          ,  3 ) ;
insert into FILM values (  4 , 'LA PISCINE'                   , '13-MAY-67' , 120 , 'COMEDIE DRAMATIQUE' ,  2 ) ;
insert into FILM values (  5 , 'LA 7EME CIBLE'                , '01-JAN-84' , 115 , 'SUSPENSE'           ,  2 ) ;
insert into FILM values (  6 , 'ASSOCIATION DE MALFAITEURS'   , '01-JAN-87' , 115 , 'COMEDIE'            ,  4 ) ;
insert into FILM values (  7 , 'LA JUMENT VERTE'              , '01-JAN-59' ,  95 , 'COMEDIE'            ,  5 ) ;
insert into FILM values (  8 , 'AU REVOIR LES ENFANTS'        , '01-JAN-87' , 115 , 'DRAME'              ,  7 ) ;
insert into FILM values (  9 , 'LE GRAND SCOGRIFFE'           , '01-JAN-76' , 110 , 'COMEDIE'            ,  2 ) ;
insert into FILM values ( 10 , 'LA FEMME DE L''AVIATEUR'      , '01-JAN-79' , 100 , 'COMEDIE DRAMATIQUE' ,  6 ) ;
insert into FILM values ( 11 , 'L''ANIMAL'                    , '01-JAN-77' , 100 , 'COMEDIE'            ,  4 ) ;
insert into FILM values ( 12 , '9 SEMAINE 1/2'                , '01-JAN-86' , 125 , 'DRAME EROTIQUE'     , 12 ) ;
insert into FILM values ( 13 , 'LA SIRENE DU MISSIPI'         , '01-JAN-69' , 120 , 'COMEDIE POLICIERE'  , 13 ) ;
insert into FILM values ( 14 , 'LA TRAVERSEE DE PARIS'        , '01-JAN-56' ,  95 , 'COMEDIE DRAMATIQUE' ,  5 ) ;
insert into FILM values ( 15 , 'PAULINE A LA PLAGE'           , '01-JAN-82' ,  95 , 'COMEDIE DE MOEURS'  ,  6 ) ;
insert into FILM values ( 16 , 'LE GRAND BLEU'                , '01-JAN-87' , 175 , 'COMEDIE DRAMATIQUE' ,  8 ) ;
insert into FILM values ( 17 , 'ALICE AU PAYS DES MERVEILLES' , '01-JAN-51' ,  85 , 'DESSIN ANIME'       , 11 ) ;
insert into FILM values ( 18 , 'EXODUS'                       , '01-JAN-60' , 190 , 'DRAME'              ,  9 ) ;
insert into FILM values ( 19 , '37 2 LE MATIN'                , '01-JAN-91' , 178 , 'DRAME'              , 10 ) ;
insert into FILM values ( 20 , 'LE RAYON VERT'                , '01-JAN-86' ,  95 , 'COMEDIE DRAMATIQUE' ,  6 ) ;

commit ;

-- ACTEUR

commit ;

insert into ACTEUR values (  1 , 'MONTAND'   , 'YVES'        , 'FRANCAISE'    , '13-OCT-21' ) ;
insert into ACTEUR values (  2 , 'GARCIA'    , 'NICOLE'      , 'FRANCAISE'    , '21-FEB-57' ) ;
insert into ACTEUR values (  3 , 'VILLERET'  , 'JACQUES'     , 'FRANCAISE'    , '06-FEB-51' ) ;
insert into ACTEUR values (  4 , 'DUBOIS'    , 'MARIE'       , 'FRANCAISE'    , '12-FEB-37' ) ;
insert into ACTEUR values (  5 , 'SCHNEIDER' , 'ROMY'        , 'AUTRICHIENNE' , '01-APR-42' ) ;
insert into ACTEUR values (  6 , 'FREY'      , 'SAMY'        , 'FRANCAISE'    , '24-MAY-40' ) ;
insert into ACTEUR values (  7 , 'RICARDO'   , 'BRUNOZZI'    , 'ITALIENNE'    , '08-APR-58' ) ;
insert into ACTEUR values (  8 , 'DUPRILLOT' , 'JOHEL'       , 'TCHEQUE'      , '24-APR-68' ) ;
insert into ACTEUR values (  9 , 'LESTRADOS' , 'DOMINIQUOS'  , 'MEXICAINE'    , '19-FEB-69' ) ;
insert into ACTEUR values ( 10 , 'DELON'     , 'ALAIN'       , 'FRANCAISE'    , '04-OCT-33' ) ;
insert into ACTEUR values ( 11 , 'VENTURA'   , 'LINO'        , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 12 , 'MASSARI'   , 'LEA'         , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 13 , 'POIRET'    , 'JEAN'        , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 14 , 'CLUZET'    , 'FRANCOIS'    , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 15 , 'MALAVOY'   , 'CHRISTOPHE'  , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 16 , 'BOURVIL'   , 'BOURVIL'     , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 17 , 'ROBERT'    , 'YVES'        , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 18 , 'MANESSE'   , 'GASPARD'     , 'ALLEMANDE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 19 , 'BELLI'     , 'AGOSTINA'    , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 20 , 'BRASSEUR'  , 'CLAUDE'      , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 21 , 'MARLAUD'   , 'PHILIPPE'    , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 22 , 'BELMONDO'  , 'JEAN-PAUL'   , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 23 , 'ROURKE'    , 'MICKEY'      , 'AMERICAINE'   , '01-JAN-01' ) ;
insert into ACTEUR values ( 24 , 'BASINGER'  , 'KIM'         , 'AMERICAINE'   , '01-JAN-01' ) ;
insert into ACTEUR values ( 25 , 'DENEUVE'   , 'CATHERINE'   , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 26 , 'GABIN'     , 'JEAN'        , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 27 , 'DE FUNES'  , 'LOUIS'       , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 28 , 'LANGLET'   , 'AMANDA'      , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 29 , 'BARR'      , 'JEAN-MARC'   , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 30 , 'ARQUETTE'  , 'ROSANNA'     , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 31 , 'RENO'      , 'JEAN'        , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 32 , 'NEWMAN'    , 'PAUL'        , 'AMERICAINE'   , '01-JAN-01' ) ;
insert into ACTEUR values ( 33 , 'DALLE'     , 'BEATRICE'    , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 34 , 'ANGLADE'   , 'JEAN-HUGUES' , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 35 , 'RIVIERE'   , 'MARIE'       , 'FRANCAISE'    , '01-JAN-01' ) ;
insert into ACTEUR values ( 36 , 'MALLE'     , 'ALAIN'       , null           , '01-JAN-01' ) ;
insert into ACTEUR values ( 37 , 'DALLE'     , 'HIND'        , null           , '01-JAN-01' ) ;

commit ;

-- ROLE

insert into ROLE values (  1 ,  1 , 'ALEX'                         ) ;
insert into ROLE values (  2 ,  1 , 'CLAIRE'                       ) ;
insert into ROLE values (  3 ,  1 , 'GILBERT'                      ) ;
insert into ROLE values (  4 ,  1 , 'MARIE PIERRE'                 ) ;
insert into ROLE values (  1 ,  2 , 'CESAR'                        ) ;
insert into ROLE values (  5 ,  2 , 'ROSALIE'                      ) ;
insert into ROLE values (  6 ,  2 , 'DAVID'                        ) ;
insert into ROLE values (  5 ,  4 , 'MARIE'                        ) ;
insert into ROLE values ( 10 ,  4 , 'MAURICE'                      ) ;
insert into ROLE values (  7 ,  4 , 'LARNAQUE'                     ) ;
insert into ROLE values (  7 ,  3 , 'NANARD'                       ) ;
insert into ROLE values (  8 ,  3 , 'BAUDERON'                     ) ;
insert into ROLE values (  9 ,  3 , 'COUKY'                        ) ;
insert into ROLE values ( 11 ,  5 , 'BASTIEN'                      ) ;
insert into ROLE values ( 12 ,  5 , 'NELLY'                        ) ;
insert into ROLE values ( 13 ,  5 , 'JEAN'                         ) ;
insert into ROLE values ( 14 ,  6 , 'THIERRY'                      ) ;
insert into ROLE values ( 15 ,  6 , 'GERARD'                       ) ;
insert into ROLE values ( 16 ,  7 , 'HONORE HAUDOIN'               ) ;
insert into ROLE values ( 18 ,  8 , 'JUIEN'                        ) ;
insert into ROLE values (  1 ,  9 , 'MORLAND'                      ) ;
insert into ROLE values ( 19 ,  9 , 'AMANDINE'                     ) ;
insert into ROLE values ( 20 ,  9 , 'ARI'                          ) ;
insert into ROLE values ( 21 , 10 , 'FRANCOIS'                     ) ;
insert into ROLE values ( 22 , 11 , 'MICHEL GAUCHER/BRUNO FERRARI' ) ;
insert into ROLE values ( 23 , 12 , 'JOHN'                         ) ;
insert into ROLE values ( 24 , 12 , 'ELISABETH'                    ) ;
insert into ROLE values ( 22 , 13 , 'LOUIS MAHE'                   ) ;
insert into ROLE values ( 25 , 13 , 'JULIE ROUSSEL'                ) ;
insert into ROLE values ( 26 , 14 , 'GRAND-GIL'                    ) ;
insert into ROLE values ( 16 , 14 , 'MARTIN'                       ) ;
insert into ROLE values ( 27 , 14 , 'JAMBIER'                      ) ;
insert into ROLE values ( 28 , 15 , 'PAULINE'                      ) ;
insert into ROLE values ( 29 , 16 , ''                             ) ;
insert into ROLE values ( 30 , 16 , ''                             ) ;
insert into ROLE values ( 31 , 16 , ''                             ) ;
insert into ROLE values ( 32 , 18 , 'ARI BEN CANNAN'               ) ;
insert into ROLE values ( 33 , 19 , 'BETTY'                        ) ;
insert into ROLE values ( 34 , 19 , 'ZORG'                         ) ;
insert into ROLE values ( 35 , 20 , 'DELPHINE'                     ) ;

commit ;

-- ============================================================
--    verification des donnees
-- ============================================================

select count(*),'= 37 ?','ACTEUR' from ACTEUR 
union
select count(*),'= 20 ?','FILM' from FILM 
union
select count(*),'= 14 ?','REALISATEUR' from REALISATEUR 
union
select count(*),'= 40 ?','ROLE' from ROLE ;
