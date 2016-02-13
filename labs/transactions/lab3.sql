17/OCT/2015

1)
//Operación de lectura
select t.* from tt t, dirige d, profesor p where t.nott=d.nott and d.idprof=p.idprof and p.apPaterno="Zagal";

//Operación escritura
insert into tt values("2015B02", "Manejo del cuarto oscuro");
insert into presentacion (idPresentacion,fecha,tipo,nott) values (501,"2015-10-16","TT 1","2015B02");

//Operación consulta_escritura
select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott="2015B02";

__________________________________
2
//lectura
lo mismo que la 1
//escritura
lo mismo que la 1
//consulta
lo mismo que la 1
//commint
commit;   //almacene en disco duro
//operación consulta escritura
lo mismo que la 1

___________________________________
3
select t.* from tt t, dirige d, profesor p where t.nott=d.nott and d.idprof=p.idprof and p.nombre="Sanchez";

insert into tt values("2015B03", "Servidor de bases de datos de reprobados de DDB");
insert into presentacion (idPresentacion,fecha,tipo,nott) values (502,"2015-10-17","TT 1","2015B03");

select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B03");

//cerramos terminal
//ingresamos de nuevo
//aplicamos consulta --> no se refleja el cambio anterior

_________________________________
4
begin;
select t.* from tt t, dirige d, profesor p where t.nott=d.nott and d.idprof=p.idprof and p.nombre="Sanchez";

insert into tt values("2015B04", "Navegacion de interiores SENACEC");
insert into presentacion (idPresentacion,fecha,tipo,nott) values (503,"2015-11-17","TT 1","2015B04");

select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B04");

insert into tt values("2015B06", "find your best pair");
insert into presentacion (idPresentacion,fecha,tipo,nott) values (505,"2015-11-17","TT 1","2015B06");

select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B06");
commit;
//cerramos (fallo del sistema)
//ingresamos de nuevo

select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B03");
__________________________________
Trabajamos con dos terminales
Transacción 5 (negra)
Transacción 6 (blanca)

select t.* p.nombre, p.apPaterno from tt t, dirige d, profesor p where t.nott=d.nott and d.idprof=p.idprof and p.apPaterno like "Hern_ndez%";

insert into tt values("2015B04", "Sistema Multibase para lalala...");
insert into presentacion (idPresentacion,fecha,tipo,nott) values (503,"2015-10-18","TT 1","2015B04");

select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B03","2015B04");

//iniciamos con T5
begin;
select t.* ,p.nombre, p.apPaterno from tt t, dirige d, profesor p where t.nott=d.nott and d.idprof=p.idprof and p.apPaterno like "Hern_ndez%";

insert into tt values("2015B04", "Sistema Multibase para lalala...");
insert into presentacion (idPresentacion,fecha,tipo,nott) values (503,"2015-10-18","TT 1","2015B04");

select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B03","2015B04");

//iniciamos con T6
begin;
select t.*, p.fecha from tt t, presentacion p where p.nott=t.nott and p.nott in("2015B02","2015B03","2015B04");
//no aparece la nueva por la propiedad de aislamiento

//pasamos a T5
commit;

//consultamos en T6

//abrimos una tercera terminal
//realizamos consulta
//commit en T6
//consultar en T6 de nuevo
____________________________________


begin;	 //para iniciar transacciones
rollback;	



-------------------------------------------------------

ESCRITURA: Agregar un profesor nuevo
ESCRITURA: Dar de alta el grado de estudios.
LECTURA:Grado de estudios de un profesor 

insert into profesor value(1731,'Ayan','Urban','Reyes');
insert into gradoprof value(1731,'D',13711,'Institute for Ayans');
select p.nombre, p.apPaterno, gp.*, ge.descripcion from profesor p, gradoprof gp, gradoestudios ge where p.idProf=gp.idProf and gp.idGrado=ge.idGrado and p.idProf=1731;

insert into profesor value(1371,'Alizita','Rios','Palacios');
insert into gradoprof value(1371,'D',17311,'Institute for Alizitas');
select p.nombre, p.apPaterno, gp.*, ge.descripcion from profesor p, gradoprof gp, gradoestudios ge where p.idProf=gp.idProf and gp.idGrado=ge.idGrado and p.idProf=1371;
