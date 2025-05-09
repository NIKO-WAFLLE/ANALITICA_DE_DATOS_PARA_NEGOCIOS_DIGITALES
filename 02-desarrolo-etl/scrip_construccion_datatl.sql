IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Northwind')
BEGIN
    CREATE DATABASE [Northwind];
END;
GO
USE [Northwind];
GO

IF OBJECT_ID(N'OrderDetails', N'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID(N'Orders', N'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID(N'Products', N'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID(N'Categories', N'U') IS NOT NULL DROP TABLE Categories;
IF OBJECT_ID(N'Customers', N'U') IS NOT NULL DROP TABLE Customers;
IF OBJECT_ID(N'Employees', N'U') IS NOT NULL DROP TABLE Employees;
IF OBJECT_ID(N'Shippers', N'U') IS NOT NULL DROP TABLE Shippers;
IF OBJECT_ID(N'Suppliers', N'U') IS NOT NULL DROP TABLE Suppliers;
GO

BEGIN TRANSACTION;

CREATE TABLE Categories
(      
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(25),
    Description VARCHAR(255)
);

create table clientes (
	clienteid char(5) not null,
	compania varchar(40) not null,
	ciudad varchar (15) not null,
	region varchar (15),
	codigopostal char(10),
	pais varchar(15)
	

);


create table empleado(
	empleadoId int not null,  
	nombre varchar(10) not null,
	apellido varchar(20)not null,
	fecha_contratacion date,
)

create table producto (
	productoID int not null,
	nombre_producto varchar (50) not null,
	precioUnitario decimal (15,2) not null,
);

create table provedor(
	provedorid int not null,
	provedornombre varchar(40) not null,
	ciudad varchar(15),
	region varchar(15),
	pais varchar(15)
)

create table ventas(
	clientes char(5) not null,
	empleadocodigo int not null,
	producto_codigo int not null,
	ventasorden datetime not null,
	ventas_monto decimal (15,2) not null,
	ventasUnidades int not null,
	ventaspreciounitatio decimal(15,2) not null,
	ventasdescuento decimal(15,2) not null

);

use datamart_nortwind

create table dim_cliente(
 cliente_Skey int not null identity (1,1),
 cliente_codigokey char (5) not null, 
 cliente_compania varchar(40) not null,
 cliente_ciudad varchar(15) not null,
 cliente_region varchar(25) not null,
 cliente_pais varchar(15) not null,
 constraint pk_dimcliente
 primary key (cliente_skey)
)

create table dim_empleado(
empleado_Skey int not null identity(1,1),
empleado_codigoBkey int not null,
empleado_NombreCompleto varchar(100) not null,
constraint pk_dimempleado
primary key (empleado_Skey)

);


create table dim_producto (
	producto_Skey int not null identity(1,1),
	producto_CodigoBkey int not null,
	producto_nombre varchar(80) not null,
	producto_Categoria_nombre varchar (15) not null,
	constraint pk_dimproducto
	primary key (producto_Skey)

);

create table dim_tiempo(
tiempo_Skey int not null identity(1,1),
tiempo_fechaActual datetime not null,
tiempo_anio int not null,
tiempo_trimestre int not null,
tiempo_mes int not null,
tiempo_semana int not null,
tiempo_diadeanio int not null,
tiempo_diademes int not null,
constraint pk_dimtiempo
primary key (tiempo_Skey)

);

create table fact_ventas (
	 cliente_skey int not null,
	 empleado_Skey int not null,
	 producto_Skey int not null,
	 tiempo_Skey int not null,
	 ventas_Norden int not null,
	 ventas_monto decimal(15,2),
	 ventas_unidades int not null,
	 ventas_punitario decimal(15,2)not null,
	 ventas_descuento decimal(15,2)not null, 
	 constraint fact_ventas
	 primary key (cliente_skey,empleado_Skey,producto_Skey,tiempo_Skey),
	 
	 constraint fk_factventas_dimcliente
	 foreign key(cliente_Skey)
	 references dim_cliente(cliente_skey),

	 constraint  fk_factventas_dimempleado
	 foreign key (empleado_Skey) 
	 references dim_empleado(empleado_skey),

	 constraint fk_factuventas_dimpreducto
	 foreign key (producto_Skey) 
	 references dim_producto(producto_Skey),

	 constraint fk_factuventas_dimtiempo
	 foreign key (tiempo_Skey) 
	 references dim_tiempo(tiempo_Skey),
	 
);