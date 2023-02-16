/* insert into klingon values ('p1',null);*/
DROP FUNCTION tkdamp() CASCADE;
CREATE FUNCTION tkdamp()
RETURNS TRIGGER
LANGUAGE PLPGSQL
 AS 
$$  
DECLARE
contaH integer;
contaV integer;
BEGIN
select count (*) into contaH from humanos where codper=new.codper;
select count (*) into contaV from vulcanos where codper=new.codper;
 if contaH=0  and contaV=0 then
  	 raise notice ' añadido';
    else
  	 raise exception 'no se puede añadir a klingon pq ya existe';
  end if;

  return new;
END;
$$;
CREATE TRIGGER ftkdamp before INSERT ON klingon for each row EXECUTE PROCEDURE tkdamp();



