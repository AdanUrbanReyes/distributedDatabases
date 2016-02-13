-- source path
--desc cliente;
--select idcliente,nombre,apPaterno from cliente order by apPaterno;
--select count(*) as "ALL STOCKS" from tienda ;//count registros of tienda

--1. En que estados existen sucursales de electra?
	select distinct estado from tienda order by estado;// lectura secuencial por eso lleva mas tiempo
--	select estado from tienda group by estado;//lectura secuencial con indices por eso lleva menos tiempo
--2. Cuantos clientes (en numero ) se apellidan Urban Reyes
	select count(*) from cliente where apPaterno='Hernandez';
--3. Mostrar el nombre de la sursal el estado donde fueron dados de alta aquellos clientes que se apellidan Urban
	--select t.nombre, t.estado, c.nombre, c.apPaterno, c.apMaterno from cliente c, tienda t, pago p where c.idCliente=p.idCliente and p.idTienda=t.idTienda and c.apPaterno='Hernandez';	
	select s.nombre s.estado from tienda s, cliente c, pago p where c.idCliente=p.idCliente and p.idTienda=s.idTienda and c.apPaterno="Urban";
--4. Cual es el monto de credito que tiene los clientes que ganan mas de $10,000
--	select cliente.nombre, cliente.apPaterno, cliente.apMaterno, credito.monto from cliente, pago , credito where cliente.idcliente=pago.idcliente and pago.idcredito=credito.idcredito and cliente.salario>10000 order by cliente.salario;
	select cr.monto from cliente c, credito cr, pago p where c.idcliente=p.idcliente and cr.idcredito=p.idcredito and c.salario>10000;
--5. Que categorias existen en los productos, mostrar (nombre y categoria del producto)
--	select producto.nombre as product, categoria.nombre as categoria from producto, categoria, subcategoria where categoria.idcategoria=subcategoria.idcategoria and producto.idsubcategoria=subcategoria.idsubcategoria order by categoria;
	select p.nombre as producto, c.nombre as categoria from categoria c, producto p, subcategoria sc where p.idsubcategoria=sc.idsubcategoria and sc.idcategoria=c.idcategoria;
--comandos ddl 
--6. Renombrar la relacion tienda y llamarla sucursal;
	show tables;
	alter table tienda rename as sucursal;
	show tables;
--7. Agregar un campo en la relacion sucursal para almacenar la extencion telefonica
	describe sucursal;
	alter table sucursal add column extencion varchar(15);
	describe sucursal;
--	alter table nameTable add column nameNewColumn typeofNewColumn
--8. Renombrar el campo nombre en la relacion cliente llamarle asociado 
	describe cliente;
	alter table cliente change column nombre asociado varchar(45);
	describe cliente;
--	alter table nameTable change column oldNameColumn newNameColumn typeDataofOldNameColumn;
--9. Aumentar el tamano en el tipo de dato del campo marca en la relacion producto y que permita almacenar 60 caracteres
	alter table producto modify column marca varchar(60);
--	alter table nameTable modify column nameColumn alteraciones;

--10. Structurar la relacion cliente para almacenar multiples correos electronicos y asociarlo con cliente
	create table emailClient(idClient int not null, email varchar(50) not null, primary key(idClient,email), foreign key(idClient) references cliente(idcliente) on delete cascade on update cascade);
	insert into emailClient(select idcliente,email from cliente where email is not NULL and email not like "NULL%");
	alter table cliente drop column email;



mysql -u root -p nameDataBase > pathToSave
