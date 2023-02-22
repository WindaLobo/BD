DROP FUNCTION HorasMaximas() CASCADE;
CREATE FUNCTION HorasMaximas()
RETURNS TRIGGER
LANGUAGE PLPGSQL
 AS 
$$  
DECLARE
contaH integer;
contaV integer;
BEGIN
select count (*) into contaH from series where cods=new.cods;
select count (*) into contaV from actores where coda=new.coda;
 if contaH=0  and contaV=0 then
  	 raise notice ' añadido';
    else
  	 raise exception 'no se puede añadir a klingon pq ya existe';
  end if;
  return new;
END;
$$;
CREATE TRIGGER HorasMaximasf before INSERT ON series for each row EXECUTE PROCEDURE HorasMaximas();