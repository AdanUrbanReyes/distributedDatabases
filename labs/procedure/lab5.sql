show procedure status;
drop procedure nombreProcedure;

--obtener todos los porfesores que tengan como apellido hernandes
--get all teachers that they have like surname "Henandez"
delimiter #
create procedure pwsh()
begin
select * from profesor
where apPaterno like "Hern_ndez%"
order by apMaterno;
end #
delimiter ;

--obtener los trabajos terminales que a dirijido la profesora con nombre Fabiola y apellido Ocampo
--get all terminal works supervised by professor  Fabiola Ocampo
delimiter &
create procedure twsbfo()
begin
select t.*
from tt t, dirige d, profesor p
where t.nott=d.nott
and d.idprof=p.idprof
and p.nombre like "Fabio%"
and p.apPaterno like "Ocampo%"
order by t.nott;
end &
delimiter ;

--obtener el numero de trabajos terminales presentados en el mes de diciembre del 2019 asi como el trabajo terminal precentado y los datos del profesor
-- get the count termial work present on month of december 2009 so data of terminal work (terminal work join professor)
delimiter $
create procedure twomd2009()
begin
select count(*) as numberTerminalWorksPresented
from presentacion
where fecha like "2009-12%";
select t.nott, p.nombre, p.apPaterno, p.apMaterno
from tt t, profesor p,dirige d, presentacion x
where x.nott=t.nott
and t.nott=d.nott
and d.idprof=p.idprof
and x.fecha like "2009-12%"
order by x.fecha;
end $
delimiter ;

--obtener el numeor de tt en los que el sinodal fue el profesor Andres Ortigoza asi como los que si fueron presentados
-- get the number of terminal work where the sinodal was the professor Andres Ortigoza so the presented
delimiter /
create procedure twpwsao()
begin
select t.nott
from tt t, sinodalia s, profesor p
where t.nott=s.nott
and (s.s1=p.idprof or s.s2=p.idprof or s.s3=p.idprof)
and p.nombre like "Andr_s%"
and p.apPaterno like "Ortigoz%"
order by t.nott;
select t.nott
from tt t, sinodalia s, profesor p, presentacion x
where t.nott=s.nott
and (s.s1=p.idprof or s.s2=p.idprof or s.s3=p.idprof)
and t.nott=x.nott
and p.nombre like "Andr_s%"
and p.apPaterno like "Ortigoz%"
order by x.fecha,t.nott;
end /
delimiter ;


--obtener el nombre del profesor asi como la informacion del tt donde el titulo sea Redes Neuronales asi como su descripcion
--get professor so information of terminal work where title is Redes Neuronales so his description
delimiter &#
create procedure twrn()
begin
select t.*, p.nombre, p.apPaterno
from tt t, profesor p, dirige d
where t.nott=d.nott
and d.idprof=p.idprof
and t.titulo like "%Redes Neuronales%"
order by p.apPaterno;
select p.nombre, p.apPaterno, ge.descripcion
from tt t, profesor p, dirige d, gradoprof gp, gradoestudios ge
where t.nott=d.nott
and d.idprof=p.idprof
and p.idprof=gp.idprof
and gp.idgrado=ge.idgrado
and t.titulo like "%Redes Neuronales%"
order by p.apPaterno;
end &#
delimiter ;

--obtener los trabajos terminales remediales asi como el profesor que estubo en ellos
--get terminal works remediales so the professor
delimiter ##
create procedure twrwp()
begin
select p.nott, p.fecha, p.califRevisor
from presentacion p
where p.tipo="TT R";
select p.nott, ps.nombre, ps.apPaterno
from presentacion p, tt t, sinodalia s, profesor ps
where p.nott=t.nott
and t.nott=s.nott
and (s.s1=ps.idprof or s.s2=ps.idprof or s.s3=ps.idprof)
and p.tipo="TT R";
end ##
delimiter ;

--que mueste la fecha de presentacion, califacion de los sinodales y el tipo de aquellos tts donde ha sido sinodal el profecor
Marco A. Doreantes.
	a) que diga el numero de tts que ha dirigido el profesor de la consulta anterior

