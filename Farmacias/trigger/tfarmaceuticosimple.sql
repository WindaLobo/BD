DROP FUNCTION tfarmaceuticosimple() CASCADE;
CREATE FUNCTION tfarmaceuticosimple()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
    AS 
$$  
DECLARE
cuenta integer;

Begin

select count(*) into cuenta from traballan where codf=new.codf;
  if cuenta=0 then
   raise notice 'inserción añadida';
      else
   raise exception 'no se pueden añadir';
  	   		
  	end if;
    return new;
END;
$$;
CREATE TRIGGER tfarmaceuticosimplet before INSERT ON traballan for each row EXECUTE PROCEDURE tfarmaceuticosimple();
