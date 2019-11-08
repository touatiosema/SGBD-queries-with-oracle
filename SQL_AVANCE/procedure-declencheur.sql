---------------------------------------------------------------------------------------
-- la procédure
---------------------------------------------------------------------------------------

create or replace procedure INSER_1_RESA_OBLIG ( 
    num_seance in RESERVATION.NUMERO_SEANCE%type , 
    num_place in RESERVATION.NUMERO_PLACE%type ) 
  is 
  begin
    if ( num_seance =  1 and num_place =   8 ) 
    or ( num_seance =  1 and num_place =  64 ) 
    or ( num_seance =  1 and num_place = 128 ) 
    or ( num_seance =  2 and num_place =  16 ) 
    or ( num_seance =  2 and num_place =  32 ) 
    or ( num_seance =  2 and num_place =  33 ) 
    or ( num_seance =  2 and num_place =  64 ) 
    or ( num_seance =  2 and num_place = 128 ) 
    or ( num_seance =  2 and num_place = 256 ) 
    or ( num_seance =  2 and num_place = 512 ) 
    or ( num_seance =  5 and num_place =  32 ) 
    or ( num_seance =  5 and num_place =  64 ) 
    or ( num_seance =  8 and num_place = 256 ) 
    or ( num_seance = 10 and num_place =   2 ) 
    or ( num_seance = 10 and num_place =   4 ) 
    or ( num_seance = 10 and num_place =   8 ) 
    or ( num_seance = 10 and num_place =  16 ) 
    or ( num_seance = 10 and num_place =  32 ) 
    or ( num_seance = 10 and num_place =  64 ) 
    or ( num_seance = 10 and num_place = 128 ) 
    or ( num_seance = 10 and num_place = 129 ) 
    or ( num_seance = 10 and num_place = 256 ) 
    or ( num_seance = 10 and num_place = 512 ) 
    or ( num_seance = 10 and num_place = 513 ) 
    or ( num_seance = 12 and num_place =   8 ) 
    or ( num_seance = 12 and num_place =  32 ) 
    or ( num_seance = 12 and num_place =  64 ) 
    or ( num_seance = 12 and num_place = 128 ) 
    or ( num_seance = 15 and num_place =   8 ) 
    or ( num_seance = 15 and num_place =  16 ) 
    or ( num_seance = 15 and num_place =  17 ) 
    or ( num_seance = 15 and num_place = 128 ) 
    or ( num_seance = 15 and num_place = 256 ) 
    or ( num_seance = 16 and num_place = 128 ) 
    or ( num_seance = 16 and num_place = 512 ) 
    or ( num_seance = 17 and num_place =  16 ) 
    or ( num_seance = 17 and num_place =  32 ) 
    or ( num_seance = 17 and num_place =  64 ) 
    or ( num_seance = 20 and num_place =  16 ) 
    or ( num_seance = 20 and num_place =  64 ) 
    or ( num_seance = 20 and num_place = 128 ) 
    or ( num_seance = 20 and num_place = 256 ) then 
      raise_application_error ( -20000 , 'cette reservation est obligatoire : vous ne pouvez pas la supprimer' ) ;
    end if ;
  end ;
/

---------------------------------------------------------------------------------------
-- le déclencheur
---------------------------------------------------------------------------------------

--   NB : la clause when() aurait été plus judicieuse qu'un appel à une procédure...
--        mais l'objectif est d'illustrer sur un exemple simple un déclencheur et une
--        procédure stockée

create or replace trigger AVANT_SUPPR_RESA_OBLIG
    before delete on RESERVATION for each row
  begin
    INSER_1_RESA_OBLIG ( :old.NUMERO_SEANCE , :old.NUMERO_PLACE ) ;
  end ;
/

