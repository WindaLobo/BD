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
select count (*) into contaF from farmacias  where  codf=new.codf;
 if  contaP =0 and  contaF=0  then
 raise notice ' aceptada insercion ';
    else
    raise exception 'rechazada insecion';
  	 
  end if;
    return new;
END;
$$;
CREATE TRIGGER impedirFarmaciast before INSERT ON farmacias for each row EXECUTE PROCEDURE impedirFarmacias();
