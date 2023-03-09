-- insert into traballan values ('10','3688');

DROP FUNCTION impedirFarmacias() CASCADE;
CREATE FUNCTION impedirFarmacias()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
    AS 
$$  
DECLARE
contaP integer;
contaF integer;
BEGIN
 select count (*) into contaP from traballan where  codf=new.codf;

 if  contaP >=2 then
 raise exception 'rechazada insecion';
 
    else
    raise notice ' aceptada insercion ';
  	 
  end if;
    return new;
END;
$$;
CREATE TRIGGER impedirFarmaciast before INSERT ON traballan for each row EXECUTE PROCEDURE impedirFarmacias();
