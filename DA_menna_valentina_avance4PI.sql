USE fastfood_bd

/* Listar todos los productos y sus categorías
¿Cómo puedo obtener una lista de todos los productos junto con sus categorías? */

SELECT p.producto, c.nombre_categoria
FROM Productos.producto AS p
LEFT JOIN productos.categoria AS c ON p.categoria_id = c.categoria_id;

-- Decido usar LEFT JOIN, porque, en caso de que un producto no tenga la categoría asignada, saldrá NULL. 

/* Obtener empleados y su sucursal asignada
Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?*/

SELECT e.nombreyapellido_empleado,  s.nombre_sucursal
FROM personas.empleado AS e
LEFT JOIN sucursales.sucursal AS s ON e.sucursal_id = s.sucursal_id;

-- Por la misma razon que en la anterior, decidí usar LEFT JOIN

/*Identificar productos sin categoría asignada
Pregunta: ¿Existen productos que no tienen una categoría asignada?*/

SELECT p.producto_id, c.categoria_id
FROM productos.producto AS p
LEFT JOIN productos.categoria AS c ON p.categoria_id = c.categoria_id
WHERE c.categoria_id IS NULL;

/*Detalle completo de órdenes
Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, 
incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, 
y Nombre del mensajero que la entregó?*/

SELECT 
	o.orden_id,
	e.nombreyapellido_empleado, 
	c.nombreyapellido_cliente,
	m.nombreyapellido_mensajero
FROM ventas.orden AS o
	LEFT JOIN personas.empleado AS e ON o.empleado_id = e.empleado_id
	LEFT JOIN personas.cliente AS c ON o.cliente_id = c.cliente_id
	LEFT JOIN personas.mensajero AS m ON o.mensajero_id = m.mensajero_id;

-- Para ver todas las órdenes, aunque falte alguno de esos actores (por ejemplo, un pedido que todavía no tiene mensajero asignado), entonces elijo usar LEFT JOIN

/* Productos vendidos por sucursal
Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?*/
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

-- En este caso decidí usar INNER, ya que, solo teníamos datos para la sucursal 1, en caso de que se quieran ver los NULL, tendría que usar LEFT
