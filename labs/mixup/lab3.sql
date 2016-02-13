-- 1. mostrar el nombre del articulo y el departamento al que pertenece
	select a.nombre as articulo, d.nombre as departamento from articulo a join departamento d on a.idDepto=d.idDepto order by d.nombre,a.nombre;
--2. mostrar el nombre del socio y la sucursal al que fue dado de alta
	select s.nombre as socio, m.nombre from socio s join sociomix sm on s.idsocio=sm.idsocio join mixup m on m.idmixup=sm.idmixup order by m.nombre, s.nombre desc;
--3. mostrar nombre del articulo y precio unitario de los articulos
	select a.nombre, a.precioUnitario from articulo a join departamento d on a.iddepto=d.iddepto where d.nombre like "%accesorios%" order by a.preciounitario;
--4.
	select a.nombre as articulo, a.precioUnitario as precio from articulo a where a.preciounitario between 500 and 2000 order by a.preciounitario;
--5. mostrar los datos correspondientes de los asociados que se apellidan garsia
	select * from asociado where nombre like "%Garc_a%";
--6. cuales son los mixup que se encuentran en el df
	select nombre,ubicacion from mixup where ubicacion like "%DF%" order by nombre;
--7. mostrar los datos del asociado que fueron dados de alta en cuernavaca ordenalos alfabeticamente
	select a.*, m.nombre from asociado a join mixup m on a.idmixup=m.idmixup where m.ubicacion like "%Cuenta%" order by a.nombre;
--8. mostrar el nombre de las sucursales y la ubicacion de aquellas que tiene el cp 58270,27001.7760 y 11510
	select nombre, ubicacion from mixup where dir like "%58270%" or dir like "%27001%" or dir like "%7760%" or dir like "%11510%";
--9. cuantos articulos (en numero) tienen en su descripcion "iphone 6"
	select count(*) as iphones from articulo where descripcion like "%iphone 6%";
--10. que departamentos tiene las dsucursales ubicadas en queretaro
--	select d.nombre, from departamento d,mixupdepto md, mixup m, where d.idDepto=md.idDepto and m.idmixUp=md.idmixUp and m.ubicacion like "%ueretaro%";

	select distinct d.nombre from departamento d join mixupdepto md on md.iddepto=d.iddepto join mixup m on m.idmixup=md.idmixup where m.ubicacion like "Queretar%" order by d.nombre;
--11. agregar 2 asociados y asignarlos al mixup acapulco y mixup tuxtla galerias
	insert into asociado values(2000,"PEREZ PEREZ PANCHITO","55-40-02-77-62",(select idmixup from mixup where nombre like "Acapulc%")),(2001,"CRUZ CRUZ XIMENA","55-18-89-59-98",(select idmixup from mixup where nombre like "Tuxtla Galeri%"));
	select * from asociado where idasociado in(2000,2001);
