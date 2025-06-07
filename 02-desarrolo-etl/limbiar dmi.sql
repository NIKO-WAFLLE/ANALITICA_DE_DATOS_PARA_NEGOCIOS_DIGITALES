select *  from datamart_northwind.dbo.dim_cliente
select * from datamart_northwind.dbo.dim_empleado
select * from datamart_northwind.dbo.dim_producto
select *  from datamart_northwind.dbo.dim_tiempo
select *  from datamart_northwind.dbo.fact_ventas



--- este codigo es para limpiar la base de datos data mark 
truncate table fact_ventas;

DBCC CHECKIDENT ('dim_cliente',RESEED,0); 
go
truncate table dim_cliente;
go

DBCC CHECKIDENT ('dim_empleado',RESEED,0); 
go
truncate table dim_empleado
go

DBCC CHECKIDENT ('dim_producto',RESEED,0); 
go
truncate table dim_producto
go

DBCC CHECKIDENT ('dim_tiempo',RESEED,0); 
go
truncate table dim_tiempo
go

delete from dim_cliente;