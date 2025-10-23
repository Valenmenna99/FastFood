USE fastfood_bd

/* Listar todos los productos y sus categor�as
�C�mo puedo obtener una lista de todos los productos junto con sus categor�as? */

SELECT p.producto, c.nombre_categoria
FROM Productos.producto AS p
LEFT JOIN productos.categoria AS c ON p.categoria_id = c.categoria_id;

-- Decido usar LEFT JOIN, porque, en caso de que un producto no tenga la categor�a asignada, saldr� NULL. 

/* Obtener empleados y su sucursal asignada
Pregunta: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?*/

SELECT e.nombreyapellido_empleado,  s.nombre_sucursal
FROM personas.empleado AS e
LEFT JOIN sucursales.sucursal AS s ON e.sucursal_id = s.sucursal_id;

-- Por la misma razon que en la anterior, decid� usar LEFT JOIN

/*Identificar productos sin categor�a asignada
Pregunta: �Existen productos que no tienen una categor�a asignada?*/

SELECT p.producto_id, c.categoria_id
FROM productos.producto AS p
LEFT JOIN productos.categoria AS c ON p.categoria_id = c.categoria_id
WHERE c.categoria_id IS NULL;

/*Detalle completo de �rdenes
Pregunta: �C�mo puedo obtener un detalle completo de las �rdenes, 
incluyendo el Nombre del cliente, Nombre del empleado que tom� la orden, 
y Nombre del mensajero que la entreg�?*/

SELECT 
	o.orden_id,
	e.nombreyapellido_empleado, 
	c.nombreyapellido_cliente,
	m.nombreyapellido_mensajero
FROM ventas.orden AS o
	LEFT JOIN personas.empleado AS e ON o.empleado_id = e.empleado_id
	LEFT JOIN personas.cliente AS c ON o.cliente_id = c.cliente_id
	LEFT JOIN personas.mensajero AS m ON o.mensajero_id = m.mensajero_id;

-- Para ver todas las �rdenes, aunque falte alguno de esos actores (por ejemplo, un pedido que todav�a no tiene mensajero asignado), entonces elijo usar LEFT JOIN

/* Productos vendidos por sucursal
Pregunta: �Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?*/
SELECT 
    o.sucursal_id,
    p.categoria_id,
    SUM(d.cantidad) AS total_articulos_vendidos
FROM 
    ventas.orden AS o
INNER JOIN 
    ventas.detalle_orden AS d ON o.orden_id = d.orden_id
INNER JOIN 
    productos.producto AS p ON d.producto_id = p.producto_id
GROUP BY 
    o.sucursal_id, p.categoria_id;

-- En este caso decid� usar INNER, ya que, solo ten�amos datos para la sucursal 1, en caso de que se quieran ver los NULL, tendr�a que usar LEFT
