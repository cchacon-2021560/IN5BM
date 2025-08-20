drop database if exists DB_Perifericos;
create database DB_Perifericos;
use DB_Perifericos;
 
create table Proveedores (
	codigoProveedor int not null auto_increment,
    nombreProveedor varchar(100) not null,
    direccionProveedor varchar(255) not null,
    telefonoProveedor varchar(20) not null,
    correoProveedor varchar(100) not null,
    primary key PK_codigoProveedor(codigoProveedor)
);
 
create table Productos(
	codigoProducto int not null auto_increment,
    nombreProducto varchar(100) not null,
    descripcionProducto varchar(255),
    precioProducto decimal(10,2) not null,
    stock int not null,
    primary key PK_codigoProducto(codigoProducto),
    codigoProveedor int,
    constraint FK_proveedor foreign key (codigoProveedor) 
        references Proveedores(codigoProveedor) on delete cascade
);
 
-- CRUD PROVEEDORES
-- Agregar proveedores
Delimiter $$
	create procedure sp_AgregarProveedores(
		in nombreProveedor varchar(100),
		in direccionProveedor varchar(255),
		in telefonoProveedor varchar(20) ,
		in correoProveedor varchar(100) )
	begin
		insert into Proveedores (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor)
		values (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor);
	end $$
Delimiter ;
 
call sp_AgregarProveedores('Red Dragon', 'Zona 2', '56896532', 'ReDragon@empresa.com');
call sp_AgregarProveedores('Logitech', 'Zona 10', '12345678', 'Logitech@empresa.com');
call sp_AgregarProveedores('Steren', 'Zona 6', '78946532', 'Steren@empresa.com');
call sp_AgregarProveedores('HyperX', 'Zona 5', '96385274', 'HyperX@empresa.com');
call sp_AgregarProveedores('Razer', 'Zona 6', '15995165', 'Razer@empresa.com');
 
-- Listar Proveedores
Delimiter $$
	create procedure sp_ListarProveedores()
		begin
			select codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor
			from Proveedores;
		end $$
Delimiter ;
call sp_ListarProveedores();
 
-- Eliminar Proveedor
Delimiter $$
	create procedure sp_EliminarProveedor
		(in codigoProv int)
		begin
			delete from Proveedores 
				where codigoProveedor = codigoProv;
		end $$
Delimiter ;
-- call sp_EliminarProveedor(1);
 
-- Buscar Proveedor
Delimiter $$
	create procedure sp_BuscarProveedor
		(in codigoProv int)
	begin
		select codigoProveedor, nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor from Proveedores
			where codigoProveedor = codigoProv;
	end $$
Delimiter ;
call sp_BuscarProveedor(2);
 
-- Editar Proveedor
Delimiter $$
	create procedure sp_EditarProveedor(
		in codigoProv int,
		in nombreProv varchar(100),
		in direcProv varchar(255),
		in telProv varchar(20),
		in correoProv varchar(100))
	begin
		update Proveedores
		set nombreProveedor = nombreProv,
			direccionProveedor = direcProv,
			telefonoProveedor = telProv,
			correoProveedor = correoProv
		where codigoProveedor = codigoProv;
	end $$
Delimiter ;
 
 
-- CRUD PRODUCTO
delimiter $$
	create procedure sp_agregarProducto(
		in nombreP varchar(100),
		in descripcionP varchar(255),
		in precioP decimal(10,2),
		in stockP int,
		in codigoProveedor int)
	begin
		insert into productos (nombreProducto, descripcionProducto, precioProducto, stock, codigoProveedor)
		values (nombreP, descripcionP, precioP, stockP, codigoProveedor);
	end $$
delimiter ;
call sp_agregarProducto('RedDragon teclado', 'Teclado Gamer de alta gama marca RedDragon', 500.00, 12, 1);
call sp_agregarProducto('RedDragon mouse', 'Mouse Gamer de alta gama marca RedDragon', 400.00, 5, 1);
call sp_agregarProducto('Steren cable', 'Cable de alta gama marca Steren', 50.00, 2, 3);
call sp_agregarProducto('Razer teclado', 'Teclado Gamer de alta gama marca Razer', 750.00, 6, 5);
call sp_agregarProducto('HyperX mouse', 'Mouse Gamer de alta gama marca HiperX', 250.00, 2, 4);
call sp_agregarProducto('Logitech teclado', 'Teclado Gamer de alta gama marca Logitech', 250.00, 5, 2);
call sp_agregarProducto('Logitech mouse', 'Mouse Gamer de alta gama marca Logitech', 150.00, 60, 2);
 
 
-- Listar Producto
delimiter $$
	create procedure sp_listarProductos()
	begin
		select codigoProducto, nombreProducto, descripcionProducto, precioProducto, stock, codigoProveedor
		from productos;
	end $$
delimiter ;
 
-- Buscar Producto
delimiter $$
	create procedure sp_buscarProducto(in codigoP int)
	begin
		select codigoProducto, nombreProducto, descripcionProducto, precioProducto, stock, codigoProveedor
		from productos
		where codigoProducto = codigoP;
	end $$
delimiter ;
 
-- Editar Producto
delimiter $$
	create procedure sp_editarProducto(
		in codigoP int,
		in nombreP varchar(100),
		in descripcionP varchar(255),
		in precioP decimal(10,2),
		in stockP int,
		in codigoProveedor int)
	begin
		update productos
		set nombreProducto = nombreP,
			descripcionProducto = descripcionP,
			precioProducto = precioP,
			stock = stockP,
			codigoProveedor = codigoProveedor
		where codigoProducto = codigoP;
	end $$
delimiter ;
 
-- Eliminar Producto
delimiter $$
	create procedure sp_eliminarProducto(in codigoP int)
	begin
		delete from productos
			where codigoProducto = codigoP;
	end $$
delimiter ;
call sp_listarProductos();