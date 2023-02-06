create or replace procedure pklingon() 
language PLPGSQL
AS
$$
DECLARE
fila record;
fila2 record;
a integer;
r varchar;
media numeric;

begin
r=E'\n';

FOR fila IN select codpel,titulo from peliculas LOOP
r=r||fila.titulo||E'\n';

FOR fila2 IN select * from personaxes 
 inner join personaxes on interpretespel.codper=personaxes.codper where 
 inner join personaxes on klingon.codper=personaxes.codper
where personaxes.nomper LOOP
r=r||E'\t'||fila2.nomper||E'\n';

END loop;

   
END loop;
raise notice '%',r;
end;
$$
;
