CREATE or replace procedure pcidadefarmacias (codigoF integer)
    LANGUAGE PLPGSQL
    AS
$$
DECLARE
filax record;
fila record;
r varchar;
cuenta integer;
nombre varchar;
	
BEGIN
r=E'\n';
cuenta = 0;
nombre='';
for fila in select nomf,codc from farmacias where codc=codigoF  LOOP
cuenta = cuenta +1;
nombre=E'\n'||fila.nomf||nombre||E'\n';
   end LOOP; 
   if cuenta != 0 then
     r = r||'La farmacia es:'||nombre;

	      else
	  r = r || 'esta farmacia no se enceuntra en esa ciudad'; 
	   end if;
			   
raise notice '%',r;
end;
$$;

