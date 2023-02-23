/*tmesmotitulop

impedir que se rexistre una película de igual titulo que calquera das series existentes

insert into peliculas values ('pel10','cosmos',1980, 'adams');
rexeitada insercion;

insert into peliculas values ('pel10','cosmas',1980, 'adams');
aceptada insercion*/


DROP FUNCTION tmesmotitulop() CASCADE;
CREATE FUNCTION tmesmotitulop()
RETURNS TRIGGER
LANGUAGE PLPGSQL
 AS 
$$  
DECLARE

seriesT integer;
BEGIN

select count (titulo) into seriesT from series where titulo=new.titulo;
 if  seriesT= 1  then
 raise notice 'rexeitada insercion';
  
    else
    raise exception ' aceptada insercion ';
  	 
  end if;

  return new;
END;
$$;
CREATE TRIGGER tmesmotitulopt before INSERT ON peliculas for each row EXECUTE PROCEDURE tmesmotitulop();



DROP FUNCTION tmesmotitulop() CASCADE;
CREATE FUNCTION tmesmotitulop()
RETURNS TRIGGER
LANGUAGE PLPGSQL
 AS 
$$  
DECLARE
peliculasT integer;

BEGIN

select count (titulo) into peliculasT from peliculas where titulo=new.titulo;
 if  peliculasT=1 then
 raise notice ' rexeitada insercion ';
 
  	 
    else
    raise exception 'aceptada insercion';
  	 
  end if;

  return new;
END;
$$;
CREATE TRIGGER tmesmotitulopt before INSERT ON series for each row EXECUTE PROCEDURE tmesmotitulop();


