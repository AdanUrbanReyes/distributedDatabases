--desbloquear tables
unlock tables;
--bloquear una relacion socio
lock tables socio read;
	select idsocio,nombre,email from socio where nombre like "SANCHES%"
--operacion de lectura
	select idsocio,nombre,email from socio where nombre like "SANCHEZ %";
--operacion de escritura
	insert into depto values(100,"cuarto oscuro");
--consultar escritura
	select * from depto where iddepto=100;
--
//cuando ago un bloque de lectura puedo consultar ese objeto de la vase de datos pero no puedo consultar cualquier otro objeto de la vase de datos, tampoco puedo escrivir ese objeto de la vase de datos, solo puedo aser consulta sobre ese objeto;

select * from asociado where nombre like "A%";
select * from socio where nombre like "A%";
select * from tarjeta where nombre like "DECO%";
select * from depto where nombre like "E%";
select * from homedepot where nombre like "Ver%";
select nombre from homedepot where nombre like "V%";




insert into socio (idsocio,nombre) values ("2000","EulerCITO");

--precedencia de bloques escritura,lectura

--2.
	--bloquera escritura tabla departamento de maneara escritura
		lock tables depto write;--cuando se bloquea de escritura puedo leer, escrivir en la tabla depto, pero no se puede leer de otra tabla, tampoco puedo escrivir en otra tabla que no sea depto

		select * , from depto;
	--operacion de escritura
		insert into depto values(100,"cuarto oscuro");
	--consultar escritura
		select * from depto where iddepto=100;
	--no se podra
		select * from socio;
		
--3. transaction
	--ayan terminal
		begin
		lock table homedepot read; //bloqueo tabla home en modo lectura
		select nombre from homedepot;
		select nombre from socio;--No se pudo leer porque esta bloqueada checar punto 2
		lock table depto write;
		insert into depto values (101,"locura");
		select * from depto;
	--alizita
		begin
		select nombre from homedepot;
		select nombre from socio;--se pudo leer porque todos las demas terminales (transacciones) si podran leer todas las tablas (punto 2)
		lock tables homedepot write;--queda en espera a que se livere el bloqueo que iso la terminal ayan (transaccion)
	--abigail
		begin
		lock table homedepod read;
		select nombre, from homedepot;
		lock table depto write;
	--alexa
		begin
		lock table depto write;-- se quedo en espera asta que termine 
