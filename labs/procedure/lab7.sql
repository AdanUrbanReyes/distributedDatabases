--create los siguintes sp...
--1. que permita agregar un asociado y asignarlo a un club determinado
delimiter &
create procedure p1(in ida varchar(20), in na varchar(50), in nh varchar(60))
begin

insert into asociado(idAsociado,homeDepot_idhd,nombre) values(ida,(select idhd from homedepot where nombre like concat(nh,"%")),na);

select a.*, h.idhd, h.nombre
from asociado a, homedepot h
where a.idAsociado=ida
and a.homedepot_idhd=h.idhd;

end &
delimiter ;

call p1("17311","Ayan","Miami");
--2. modificar el nombre de un departamento determinado
delimiter &
create procedure p2(in idd varchar(20),in nd varchar(50))
begin
select *from depto;
update depto set nombre=nd where iddepto=idd;
select *from depto;

end &
delimiter ;

call p2("D006","PISOSCAMBIO");
--3. que permita cambiar el credito de un socio determinado, aumentar su credito a un % determinado
delimiter &
create procedure p3(in ids varchar(20),in p int)
begin
select * from socio where idsocio=ids;
update socio set credito=credito*(1+(p/100))
where idsocio=ids;
select * from socio where idsocio=ids;
end &
delimiter ;
call p3 ("S0004",20);
--4. 
delimiter &
create procedure p4(in ids varchar(20),in d varchar(200))
begin
select * from socio where idsocio=ids;
update socio set direccion=d
where idsocio=ids;
select * from socio where idsocio=ids;
end &
delimiter ;
call p4 ("S0004","AyaniAlizita");
--5.
delimiter &
create procedure p5(in idh varchar(20), in nh varchar(60), in eh varchar(40))
begin
select * from homedepot where idhd=idh;
insert into homedepot(idHd,nombre,estado) value(idh,nh,eh);
select * from homedepot where idhd=idh;
end &
delimiter ;
call p5("HD003","Ayan","Yucatan");
--6. cambiar el telefono de un asociado determinado
delimiter &
create procedure p6(in na varchar(50),in ta varchar(30))
begin
select *
from asociado 
where nombre like concat(na,"%");

update asociado set tel=ta where nombre like concat(na,"%");

select *
from asociado 
where nombre like concat(na,"%");
end &
delimiter ;
call p6("5540027762","SANCHEZ RAMIREZ GUSTAVO");
