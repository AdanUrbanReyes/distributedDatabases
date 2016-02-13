--crear las siguientes vistas:
--drop view nameView;
-- describe v1;
--select * from v1;

--1. que muestre el nombre del grerente y el club al que esta asignado
	create view v1 as select g.nombre as gerente, c.nombre as club from gerente g,club c where g.idclub=c.idclub order by g.nombre;
--2. provedor y sus productos
	create view v2 as select p.nombre as proveedor, pr.nombre as producto from proveedor p, producto pr where p.idproveedor=pr.idproveedor order by p.nombre,pr.nombre;
--3. el nombre del club y el estado en donde se ubica
	create view v3 as select c.nombre as club, e.nombre as estado from club c, estado e where c.idedo=e.idedo order by e.nombre, c.nombre desc;
--4. nombre del socio, club el que esta asignado
	create view v4 as select s.nombre as socio, c.nombre as club from socio s, club c, socioclub sc where s.idsocio=sc.idsocio and sc.idclub=c.idclub order by c.nombre, s.nombre;
--5.nombre del club, nombre del servicio
	create view v5 as select c.nombre as club, s.nombre as servicio from club c, servicio s, servicioclub sc where s.idservicio=sc.idservicio and sc.idclub=c.idclub order by c.nombre, s.nombre;
--6. club y proveedor
	create view v6 as select c.nombre as club, p.nombre as proveedor from club c, proveedor p, proveedorsams ps where c.idclub=ps.idclub and ps.idproveedor= p.idproveedor order by c.nombre, p.nombre;
--7. apartir de las vistas creadas resolver las siguientes consultas
--7.1 mostrar el nombre de los socios , club al que fueron asignados y los gerentes designados a dicho club, donde los socios se apellidan HERNANDEZ.
	select v4.*, v1.gerente from v4,v1 where v4.club=v1.club and v4.socio like "Hern_ndez%";
--7.2 mostrar el nombre de los proveedores que suministran productos alos cluves exixtentes en el estado de mexico
	select v6.* from v6, v3 where v3.club=v6.club and v3.estado like "%M_xico%";
--7.3 que clubes tiene el servicio de joyeria mostrar el nombre del club y el estado donde se uvica dicho club
	select v3.* from v3,v5 where v3.club=v5.club and v5.servicio like "Joyer_a%";
--7.4 mostrar el nombre de los productos que son suminstrados en el club VILLA JARDIN
	select v2.producto from v2,v6 where v2.proveedor=v6.proveedor and v6.club like "%VILLA JARDIN%";
--7.5 mostrar el nombre del club de los gerentes que se apellidan GARCIA ademas de indicar el estado donde se ubican dichos clubes 
	select v1.*, v3.estado from v1,v3 where v1.club=v3.club and v1.gerente like "%Garcia%";	
