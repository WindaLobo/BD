/*
que liste os nomes de todas as farmacias */

CREATE or replace procedure pfarmacias()
    LANGUAGE PLPGSQL
    AS
$$
DECLARE
fila record;
	filax record;
	r varchar;
	 cuenta integer;
	
BEGIN
r=E'\n';
cuenta = 0;
for fila in select nomf from farmacias LOOP
r = r||fila.nomf ||E'\n';
cuenta = cuenta +1;

 end LOOP;   
raise notice '%',r;
end;
$$;
