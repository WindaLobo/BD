
DROP FUNCTION cidadesRegistro() CASCADE;
CREATE FUNCTION cidadesRegistro()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
    AS 
$$  
DECLARE
 cuenta integer;

BEGIN
  select count( nomc ) into cuenta from cidades where  nomc =new.nomc;
 if  cuenta = 1  then
 raise notice 'rechazada insecion';
    else
    raise exception ' aceptada insercion ';
  	 
  end if;
    return new;
END;
$$;
CREATE TRIGGER cidadesRegistrot before INSERT ON cidades for each row EXECUTE PROCEDURE cidadesRegistro();
