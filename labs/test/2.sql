select distinct HomeDepot_idHD from asociado;

select s.nombre,s.email,hd.nombre from socio s, hdsocio hds, homedepot hd where hds.HomeDepot_idHD=hd.idHD and hds.Socio_idSocio=s.idSocio;

select count(*) from asociado a, homedepot hd where hd.nombre="Cancun" and hd.idHD=a.HomeDepot_idHD; 

select a.nombre from asociado a, homedepot hd where hd.nombre="Cancun" and hd.idHD=a.HomeDepot_idHD; 

select s.nombre, s.tel, hd.nombre from socio s,hdsocio hds, homedepot hd where s.nombre like "%RAMIREZ%" and s.idSocio=hds.Socio_idSocio and hds.HomeDepot_idHD=idHD;

select count(*) from homedepot hd, hddepto hdd, depto d where hd.nombre="Mixcoac" and hd.idHD=hdd.HomeDepot_idHD and hdd.Depto_idDepto=d.idDepto;

select s.nombre,s.email, hd.nombre from tarjeta t, socio s, hdsocio hds, homedepot hd where t.nombre="DECORE" and s.idSocio=t.Socio_idSocio and s.idSocio=hds.Socio_idSocio and hds.HomeDepot_idHD=hd.idHD;

select * from socio where nombre like "%GABRIELA%";

select hd.estado from homedepot hd, (select * from asociado where nombre like "%VARGAS%ANGEL%" or nombre like "LAREDO%DAVID") as a where hd.idHD= a.HomeDepot_idHD;









select hd.nombre, hd.estado from depto d, homedepot hd, hddepto hdd where d.nombre="TECHOS" and hdd.Depto_idDepto=d.idDepto and hdd.HomeDepot_idHD=hd.idHD;

create view v1 as select a.idAsociado, a.nombre,a.sexo from asociado a,homedepot hd where a.nombre like "%LOPEZ%" and hd.idHD=a.HomeDepot_idHD;

create view v2 as select s.nombre, s.credito,t.nombre as tarjeta from socio s, tarjeta t where s.idSocio=t.Socio_idSocio and s.nombre like "%MORENO%";








select a.nombre, a.sexo, hd.nombre from asociado a,homedepot hd where a.HomeDepot_idHD=hd.idHD;
