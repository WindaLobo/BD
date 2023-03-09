 DROP PROCEDURE pcidadefarmacias(codigoF integer); 
CREATE or replace procedure pcidadefarmacias (codigoF integer)
    LANGUAGE PLPGSQL
    AS
$$
DECLARE
filax integer;
fila record;
r varchar;
	
BEGIN
r=E'\n';
   select count(*) into filax from cidades where codc=codigoF;
 if filax = 0 then
  r = r || 'esta farmacia no se enceuntra en esa ciudad'; 
   else

for fila in select nomf from farmacias where codc=codigoF  LOOP
 r = r||'La farmacia es:'||fila.nomf||E'\n';

   end LOOP; 
 
	   end if;
			   
raise notice '%',r;
end;
$$;

