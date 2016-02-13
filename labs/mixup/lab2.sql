select distinct estado from tienda order by estado;

select estado from tienda group by estado;--

select count(*) from cliente where apPaterno='Hernandez';

select s.nombre s.estado from tienda s, cliente c, pago p where c.idCliente=p.idCliente and p.idTienda=s.idTienda and c.apPaterno="Urban";

select p.nombre as producto, c.nombre as categoria from categoria c, producto p, subcategoria sc where p.idsubcategoria=sc.idsubcategoria and sc.idcategoria=c.idcategoria;


show tables;
alter table tienda rename as sucursal;
show tables;

describe sucursal;
alter table sucursal add column extencion varchar(15);
describe sucursal;
-- alter table nameTable add column nameNewColumn typeofNewColumn


describe cliente;
alter table cliente change column nombre asociado 
varchar(45);
describe cliente;
-- alter table nameTable change column oldNameColumn newNameColumn typeDataofOldNameColumn;


alter table producto modify column marca varchar(60);
-- alter table nameTable modify column nameColumn changes;

create table emailClient(idClient int not null, email varchar(50) not null, primary key(idClient,email), foreign key(idClient) references cliente(idcliente) on delete cascade on update cascade);
insert into emailClient(select idcliente,email from cliente where email is not NULL and email not like "NULL%");
alter table cliente drop column email;
