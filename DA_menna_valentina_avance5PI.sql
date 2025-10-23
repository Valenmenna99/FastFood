USE fastfood_bd

/* Eficiencia de los mensajeros: ¿Cuál es el tiempo promedio desde el despacho hasta
la entrega de los pedidos gestionados por todo el equipo de mensajería?*/

SELECT 
	AVG(DATEDIFF(HOUR, fecha_despacho, fecha_entrega)) AS tiempo_promedio_despacho_entrega
FROM ventas.orden;

/*Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos?*/

SELECT 
	TOP 1
	ori.descripcion,
	SUM (o.total_compra) AS total_ingresos
FROM ventas.orden AS o
INNER JOIN otros.origen AS ori ON o.origen_id = ori.origen_id
GROUP BY ori.descripcion
ORDER BY total_ingresos DESC;

-- Productividad de los Empleados: ¿Cuál es el nivel de ingreso generado por Empleado?

SELECT o.empleado_id, e.nombreyapellido_empleado,
SUM (o.total_compra) AS ventas_empleado
FROM ventas.orden AS o
JOIN personas.empleado AS e ON o.empleado_id = e.empleado_id
GROUP BY o.empleado_id, e.nombreyapellido_empleado
ORDER BY ventas_empleado DESC;

-- Análisis de Demanda por Horario y Día: ¿Cómo varía la demanda de productos a lo largo del día?
SELECT 
o.horario_venta, 
SUM (d.cantidad) AS demanda_productos 
FROM ventas.orden AS o
INNER JOIN ventas.detalle_orden AS d ON o.orden_id = d.orden_id
GROUP BY o.horario_venta;

-- Comparación de Ventas Mensuales: ¿Cuál es la tendencia de los ingresos generados en cada periodo mensual? (analisis estacional). 
SELECT 
  MONTH(o.fecha_orden_tomada) AS mes_num,
  DATENAME(MONTH, o.fecha_orden_tomada) AS mes,
  COUNT(o.orden_id) AS cantidad_ordenes,
  SUM(o.total_compra) AS ingresos_totales
FROM ventas.orden AS o
GROUP BY DATENAME(MONTH, o.fecha_orden_tomada), MONTH(o.fecha_orden_tomada) 
ORDER BY mes_num;




