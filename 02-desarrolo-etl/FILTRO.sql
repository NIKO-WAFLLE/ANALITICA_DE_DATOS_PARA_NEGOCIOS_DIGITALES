select CustomerID, CompanyName, 
isnull (city, 'SC') AS CITY, 
isnull (Region, 'sr') as region,
ISNULL (PostalCode, 'SPC') AS POSTALCODE,
ISNULL (Country, 'SCOUN') AS Country
from Northwind.dbo.Customers

SELECT *  FROM Stage_northwind.dbo.clientes
go

select c.CustomerID, e.EmployeeID, p.ProductID, OrderDate, 
(od.Quantity * od.UnitPrice * (1 - od.Discount)) as monto,
od.Quantity, od.UnitPrice, od.Discount
from Northwind.dbo.Customers as c
inner join Northwind.dbo.Orders as o
on c.CustomerID = o.CustomerID
inner join Northwind.dbo.Employees as e
on e.EmployeeID = o.EmployeeID
inner join Northwind.dbo.[Order Details] as od
on od.OrderID = o .OrderID
inner join Northwind.dbo.Products as p
on od.ProductID = p.ProductID;


select ProductID, ProductName,UnitPrice from Northwind.dbo.Products;

SELECT *  FROM Stage_northwind.dbo.ventas
go

select SupplierID, CompanyName, City, 
isnull (Region , 'sr') as region, Country
from Northwind.dbo.Suppliers

SELECT *  FROM Stage_northwind.dbo.proveedor


truncate table [dbo].[categoria];
truncate table [dbo].[clientes];
truncate table [dbo].[empleado];
truncate table [dbo].[producto];
truncate table [dbo].[proveedor];
truncate table [dbo].[ventas];



CREATE TABLE [dbo].[Stage_Tiempo](
	[Tiempo_Skey] [int] IDENTITY(1,1) NOT NULL,
	[Tiempo_FechaActual] [datetime] NOT NULL,
	[Tiempo_Anio] [int] NOT NULL,
	[Tiempo_Trimestre] [int] NOT NULL,
	[Tiempo_Mes] [int] NOT NULL,
	[Tiempo_Semana] [int] NOT NULL,
	[Tiempo_DiaDeAnio] [int] NOT NULL,
	[Tiempo_DiaDeMes] [int] NOT NULL);


	SELECT Distinct(OrderDate),
		YEAR(OrderDate) AS Anio,
		DATEPART(QUARTER,OrderDate) as Trimestre,
		DATEPART(MONTH,OrderDate) as Mes,
		DATEPART(WEEK,OrderDate) as Semana,
		DATEPART(DAYOFYEAR,OrderDate) as DiaDeAnio,
		DATEPART(DAY,OrderDate) as DiaDeMes,
		DATEPART(WEEKDAY,OrderDate-1) as DiaDeSemana
		FROM Northwind.DBO.Orders;

		select *  from categoria
		select *  from clientes
		select * from empleado
		
		select * from producto
		select * from proveedor
		select * from Stage_Tiempo

		select * from ventas

		select * from Stage_northwind.dbo.Stage_Tiempo
