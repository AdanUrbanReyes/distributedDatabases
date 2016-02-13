create view v1 as select nombre,direccion from socio;
create view v2 as select idSocio,nombre from socio;
create view v3 as select nombre,tel from socio;
create view v4 as select idProducto,nombre from producto;
create view v5 as select nombre,precioUnitario from producto;
create view v6 as select p.nombre as proveedor ,pr.nombre producto from proveedor p, producto pr where p.idProveedor=pr.idProveedor;
create view v7 as select c.nombre as club, p.nombre as proveedor from club c,proveedor p, proveedorsams ps where c.idClub=ps.idClub and ps.idProveedor=p.idProveedor;
create view v8 as select c.nombre as club, e.nombre as estado from club c, estado e where c.idEdo=e.idEdo;
create view v9 as select c.nombre as club, s.nombre as servicio from club c, servicio s, servicioclub sc where c.idClub=sc.idClub and s.idServicio=sc.idServicio;
create view v10 as select c.nombre as club, g.nombre as gerente from club c, gerente g where c.idClub=g.idClub;

select v8.* from v8;
select v7.club from v7 where proveedor="Sabritas";
select v5.nombre, v7.club from v5,v6,v7 where v6.producto=v5.nombre and v6.proveedor=v7.proveedor and v5.precioUnitario between 20 and 100;
select v9.servicio from v8,v9 where v8.estado="Durango" and v8.club=v9.club;
select v8.club,v10.gerente from v8,v10 where v8.club=v10.club and v8.estado="Durango" order by v8.club;
select v10.* from v10 where v10.gerente like "__R%";
select count(v10.gerente) from v10;
select v8.* from v8,v9 where (v9.servicio="%Joyer_a%" or v9.servicio="%Apple shop%");

select v4.*, v5.precioUnitario from v4,v5,v6,v7 where v4.nombre=v5.nombre and v4.nombre=v6.producto and v6.proveedor=v7.proveedor and (v7.club like "%Culiacan%" or v8.club like "%Ciudad Obreg_n%" or v8.club like "Tuxpan");

select v1.*,v3.tel from v1, v3 where v1.nombre like "%HERNANDEZ%";

