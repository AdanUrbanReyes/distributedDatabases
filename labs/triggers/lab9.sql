11-DIC-2015

1. Crear una bd
2. Crear las siguientes relaciones

	Cliente (idCliente,nombre,nombreSucursal)

	HistorialCliente(idHistorial,nombreCliente,sucursalModificado,fechaActualización,usuarioSistema)


		create table cliente(
				idCliente int not null primary key auto_increment,
				nombre varchar(70),
				nombreSucursal varchar(80)
		);

		create table HistorialCliente(
			idHistorial int not null primary key auto_increment,
			nombreCliente varchar (70),
			sucursalModificado varchar(80),
			fechaActualizacion datetime,
			usuarioSistema varchar(50)
		);

3. Cargar la relación ELECTRA
	insert into client(name,branch)
	select concat(c.nombre," ",c.apPaterno," ",c.apMaterno) as nameClient, t.nombre as branchName
	from elektra.cliente c, elektra.tienda t, elektra.pago g
	where c.idcliente=g.idcliente
	and g.idtienda=t.idtienda
	order by c.apPaterno;
	
4. Crear el siguiente trigger que permita almacenar en la relación historial un registro cuando se hace una actualización en el nombre de la sucursal donde se encuentra asignado un empleado
	create trigger changeClient after update on client
	for each row
	insert into customer_history (nameClient,branchModified,updateDate,systemUsers)
	values (old.name,old.branch,now(),current_user());
	
5. Crear procedure que permita enviar un idCliente y sucursal
	delimiter &
	create procedure p1(in idClient int, in branchName varchar(80))
	begin
		select * from client where id=idClient;
		update client set branch=branchName where id=idClient;
		select * from client where id=idClient;
	end &
	delimiter ;
	call p1(1,"Ayan Fashion Clothes");
	call p2(7,"Ayan WEB");
	call p3(3,"Dj Ayan");
	select * from customer_history;
	
6. Crear un trigger que permita incrementar el limite de credito de un cliente al comprar un producto que pertenezca a la categoria refigeradores.(incrementar el 15%, trabajar en la bd ELEK)
	
	create trigger t1 after insert on pago
	for each row 
	update credito
	set monto=monto * 1.15
	where credito.idcredito=pago.idcredito
	and pago.idcliente=c.idcliente
	and pago.idPago=new.idPago;
	
	insert into pago(idPago, idcliente,idcredito,idProducto) values(2000,50,(select c.idcredito from credito c, pago p  where c.idcredito=p.idcredito and c.idcliente=50), 21);	


	create trigger incrementCredito after insert on pago
	for each row
	update credito set monto = monto * 1.25;
	where credito.idcredito=pago.idcredito
