-- carga dim
--cliente dim 
select *  from Stage_northwind.dbo.clientes as sc
left join datamart_northwind.dbo.dim_cliente as dc
on sc.clienteid = dc.cliente_codigoBKey;


select sc.clienteid, sc.compania, 
sc.ciudad, sc.region, sc.pais
from Stage_northwind.dbo.clientes as sc


select * from datamart_northwind.dbo.dim_cliente

