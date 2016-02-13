--1.El nomobre completo su genero y el nombre del homem depot de aquellos empleados que tenga un apellido paterno determinado.
--1. Get full name, gener and name of home depot of employers that have a surname determinet
delimiter $
create procedure eh(in surname varchar(30))
begin
select e.nombre, e.sexo, h.nombre
from asociado e, homedepot h
where h.idHD=e.HomeDepot_idHD
and e.nombre like concat(surname,'%')
order by h.nombre, e.nombre;
end $
delimiter ;

-- a.nombre like concat(ap,%) = a.nombre like "ap%"; pero el segundo like no se puede aser por eso se ase el concat

--2. el nombre completo del socio y su tarjeta y monto de credito asignado, de aquiellos socios resistrados en una sucursal determinada
--2. get full name tarjet and credit of socio for each socio registred on sucursal determinet
delimiter /
create procedure ss(in sucursal varchar(60))
begin
select s.nombre, t.nombre, s.credito
from socio s, tarjeta t, homedepot h, hdsocio x
where s.idSocio=t.Socio_idSocio
and x.Socio_idSocio=s.idSocio
and h.idHD=x.HomeDepot_idHD
and h.nombre like concat(sucursal,'%')
order by s.credito, s.nombre;
end /
delimiter ;

--3. que mueste el nombre del home y su direccion para las sucursales existentes en un estado determinado
--3. get name address for existent sucursales on a state
delimiter #
create procedure se(in contry varchar(40))
begin
select h.nombre, h.direccion
from homedepot h
where h.estado like concat(contry,'%')
order by h.estado, h.nombre;
end #
delimiter ;

--4. Aue muestre el nombre de los socios y su correo electronico para aquellos socios que tienen una tarjeta determinada
--4. get name email of socios that have tarjet determinet
delimiter &
create procedure st(in tarjet varchar(50))
begin
select s.nombre, s.email
from socio s, tarjeta t
where s.idSocio=t.Socio_idSocio
and t.nombre like concat(tarjet,'%')
order by s.nombre;
end &
delimiter ;

--5. que muestre el nombre y el home al que estan asignados los asociados con un genero determinado.
--5. get name of asociado and homedepot for each asociado with gener determinet
delimiter $
create procedure ag(in gener varchar(30))
begin
select a.nombre, h.nombre
from asociado a, homedepot h
where a.HomeDepot_idHD=h.idHD
and a.sexo like concat(gener,'%')
order by a.nombre;
end $
delimiter ;

--6 Cuales son los departamentos que tiene una sucursal determinada
--6 Get aparmets that have a sucursal determinet
delimiter $
create procedure ds(in sucursal varchar(60))
begin
select d.nombre
from depto d, hddepto hdd, homedepot h
where d.idDepto=hdd.Depto_idDepto
and h.idHD=hdd.HomeDepot_idHD
and h.nombre like concat(sucursal,'%')
order by d.nombre;
end $
delimiter ;

--7. que muestre el nombre y el estado de las sucursales que tienen un identificador determnado
--7. get name and contry of sucursales that have a id determinate

delimiter #
create procedure si(in id varchar(20))
begin
select nombre, estado 
from homedepot
where idHD=id;
end #
delimiter ;

--8. que muestre el nombre, tel y el monto de credito ademas de mostrar el nombre de la sucursal donde fue asignado un socio con un identificador determinado.
--8. get name phone and credit of credit so name of sucursal where was assing a socio with id determinet
delimiter $
create procedure si2(in id varchar(20))
begin
select s.nombre, s.tel, s.credito, h.nombre
from socio s, homedepot h, hdsocio x
where s.idsocio=x.socio_idsocio
and x.homedepot_idhd=h.idhd
and s.idsocio=id
order by h.nombre, s.nombre;
end $
delimiter ;

--.9 que muestre el nombre de socio que tiene resitrados una sucursal determinal.
--9. get name of socio that have registred sucursal determinet
delimiter *
create procedure ss2(in sucursal varchar(60))
begin
select s.nombre
from socio s, homedepot h, hdsocio hds
where s.idSocio=hds.Socio_idSocio
and h.idHD=hds.HomeDepot_idHD
and h.nombre like concat(sucursal,'%')
order by s.nombre;
end *
delimiter ;

--10. con base a un monto determinado, que muestre el identificador del socio , su nombre y el nombre de la sucursal y el tel a donde fue registrado.
--10. whit base a mont determinet get id nombre of socio so name phone of sucursal where was registred 

delimiter #
create procedure sm(in monto int)
begin
select s.idSocio, s.nombre, h.nombre, h.tel
from socio s, homedepot h,hdsocio hds
where s.idSocio=hds.Socio_idSocio
and h.idHD=hds.HomeDepot_idHD
and s.credito=monto
order by s.nombre;
end #
delimiter ;
