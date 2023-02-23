/*impedir que un mismo actor interprete mas de 500 horas en una misma serie.
insert into  interpretesser values('a18','p16','s3',1);
rechaza insercion, ese actor no puede trabajar mas de 500 horas en la serie s3
insert into actores interpretesser values('a12','p16','s3',101);
rechaza insercion, ese actor no puede trabajar mas de 500 horas en la serie s3
insert into actores interpretesser values('a12','p16','s3',100);
aceptada insercion*/

DROP FUNCTION HorasMaximas() CASCADE;
CREATE FUNCTION HorasMaximas()
RETURNS TRIGGER
LANGUAGE PLPGSQL
 AS 
$$  
DECLARE
sumHoras integer;
BEGIN
select sum(horas) into sumHoras from interpretesser where cods=new.cods and coda=new.coda;
 if(sumHoras+new.horas)>500 then
  	 raise exception 'rechaza insercion, ese actor no puede trabajar mas de 500 horas en la serie';
    else
  	 raise notice 'aceptada insercion';
  end if;
  return new;
END;
$$;
CREATE TRIGGER HorasMaximasf before INSERT ON interpretesser for each row EXECUTE PROCEDURE HorasMaximas();
