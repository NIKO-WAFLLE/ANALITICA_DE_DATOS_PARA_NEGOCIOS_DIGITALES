-- carga dim
--cliente dim 
select *  from Stage_northwind.dbo.clientes as sc
left join datamart_northwind.dbo.dim_cliente as dc
on sc.clienteid = dc.cliente_codigoBKey;


select sc.clienteid, sc.compania, 
sc.ciudad, sc.region, sc.pais
from Stage_northwind.dbo.clientes as sc


select * from datamart_northwind.dbo.dim_cliente

--categori dimcategoria
select * from Northwind.dbo.Products as nca
inner join Stage_northwind.dbo.categoria as sca
on nca.CategoryID = sca.categoriaid 


---

select se.empleadoid,  CONCAT(se.nombre , ' ', se.apellido) as NombreCompleato  
from Stage_northwind.dbo.empleado as se


select *  from datamart_northwind.dbo.dim_empleado


select st.Tiempo_FechaActual, st.Tiempo_Anio,
st.Tiempo_Trimestre,  st.Tiempo_Mes,
st.Tiempo_Semana, st.Tiempo_DiaDeAnio, 
st.Tiempo_DiaDeMes, st
from Stage_northwind.dbo.Stage_Tiempo as st


-- producto

select p.productoid, p.nombreproducto, c.nombrecategoria  from 
Stage_northwind.dbo.categoria as c 
inner join Stage_northwind.dbo.producto as p
on p.CategoriaID = c.categoriaid

 select *  from datamart_northwind.dbo.dim_producto



 select * from datamart_northwind.dbo.dim_tiempo

 select Tiempo_FechaActual, Tiempo_Anio, Tiempo_Trimestre,
 Tiempo_Mes, Tiempo_Semana, Tiempo_DiaDeAnio,
 Tiempo_DiaDeMes, TIEMPO_DIADESEMANA
 from Stage_northwind.dbo.Stage_Tiempo


 select dc.cliente_Skey, de.empleado_SKey,
 dp.producto_SKey , dt.tiempo_SKey,
 (1) as norden , sv.ventasmonto, sv.ventasunidades,
 sv.ventaspreciounitario, ventasdescuento

 from Stage_northwind.dbo.ventas as sv
 inner join datamart_northwind.dbo.dim_cliente as dc
 on sv.clienteid = dc.cliente_codigoBKey
 inner join datamart_northwind.dbo.dim_empleado as de 
 on sv.empleadocodigo = de.empleado_codigoBKey
 inner join datamart_northwind.dbo.dim_producto as dp 
 on sv.productocodigo = dp.producto_CodigoBKey
 inner join datamart_northwind.dbo.dim_tiempo as dt
on sv.ventasorden = dt.tiempo_fechaActual;

select * from datamart_northwind.dbo.fact_ventas