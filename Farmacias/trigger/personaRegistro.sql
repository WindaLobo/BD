
DROP FUNCTION propiosRegistro() CASCADE;
CREATE FUNCTION propiosRegistro()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
    AS 
$$  
DECLARE
contaP integer;
contaF integer;

BEGIN
select count (*) into contaP from persoas where  dnip=new.dnip;
select count (*) into contaF from farmaceuticos  where  dnip=new.dnip;
 if contaP=0  and contaF=0 then
  	 raise notice ' añadido';
    else
  	 raise exception 'no se puede añadir  en propio pq ya existe';
  end if;

    return new;
END;
$$;
CREATE TRIGGER propiosRegistrot before INSERT ON propios  for each row EXECUTE PROCEDURE propiosRegistro();





DROP FUNCTION farmaceuticosRegistro() CASCADE;
CREATE FUNCTION farmaceuticosRegistro()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
    AS 
$$  
DECLARE
contaP integer;
contaV integer;
BEGIN
select count (*) into contaP from persoas where  dnip=new.dnip;
select count (*) into contaV from propios where  dnip=new.dnip;
 if contaP=0  and contaV=0 then
  	 raise notice ' añadido';
    else
  	 raise exception 'no se puede añadir farmaceutico  pq ya existe';
  end if;

    return new;
END;
$$;
CREATE TRIGGER farmaceuticosRegistrot before INSERT ON farmaceuticos  for each row EXECUTE PROCEDURE farmaceuticosRegistro();
