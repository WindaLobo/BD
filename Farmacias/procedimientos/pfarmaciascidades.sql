/*llamado pfarmaciascidades que liste los nombres de todasa las farmacias y el nombre de la ciudad donde se encuentran*/

CREATE or replace procedure pfarmaciascidades()
    LANGUAGE PLPGSQL
    AS
$$
DECLARE
fila record;
filax record;
r varchar;
 cuenta integer;
  e integer;
	
BEGIN
r=E'\n';
cuenta = 0;


for fila in select nomf from farmacias LOOP
cuenta = cuenta+1;
select nomc into filax from cidades;
r = r||fila.nomf ||'  '||filax.nomc || E'\n';



end LOOP;

raise notice ' % ',r;
end;
$$;
