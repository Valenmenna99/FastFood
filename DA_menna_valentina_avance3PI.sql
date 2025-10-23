-- 3er avance
USE fastfood_bd
-- ¿Cuál es el total de ventas (TotalCompra) a nivel global?
SELECT SUM (total_compra) AS total_ventas
FROM ventas.orden

-- ¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT AVG (precio) AS precio_promedio_prodcuto, categoria_id
FROM productos.producto
GROUP BY categoria_id

-- ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
SELECT MIN (total_compra) AS valor_orden_min, MAX (total_compra) AS valor_orden_max, sucursal_id
FROM ventas.orden
GROUP BY sucursal_id

-- ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT MAX (km_recorrer) AS mayor_nro_km
FROM ventas.orden

-- ¿Cuál es la cantidad promedio de productos por orden?
SELECT AVG(cantidad) AS promedio_producto, orden_id
FROM ventas.detalle_orden
GROUP BY orden_id

-- ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
SELECT SUM (total_compra) AS facturacion_total, tipo_pago_id
FROM ventas.orden
GROUP BY tipo_pago_id;

-- ¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT TOP (1) sucursal_id, AVG (total_compra) AS promedio_mas_alto
FROM ventas.orden 
GROUP BY sucursal_id
ORDER BY promedio_mas_alto DESC;

-- ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?
SELECT ventas.orden.sucursal_id, SUM(ventas.orden.total_compra) AS total_ventas
FROM ventas.orden 
GROUP BY ventas.orden.sucursal_id
HAVING SUM(ventas.orden.total_compra) > 1000;

-- Revisando, luego de avanzar en las Lecture, aplicaría un JOIN, para traer los nombres de las sucursales, en vez de solos los ID:

SELECT SUM(o.total_compra) AS total_ventas, s.nombre_sucursal
FROM ventas.orden o
JOIN sucursales.sucursal s ON o.sucursal_id = s.sucursal_id
GROUP BY  s.nombre_sucursal
HAVING SUM(o.total_compra) > 1000;

-- ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?
SELECT 
   (SELECT AVG (ventas.orden.total_compra) 
FROM ventas.orden
WHERE ventas.orden.fecha_orden_tomada < '2023-07-01')
AS ventas_promedio_antes,
    (SELECT AVG (ventas.orden.total_compra) 
    FROM ventas.orden 
    WHERE ventas.orden.fecha_orden_tomada > '2023-07-01') 
AS ventas_promedio_despues;

-- Forma 2:
SELECT 
  CASE 
    WHEN fecha_orden_tomada < '2023-07-01' THEN 'Antes del 1 de julio'
    ELSE 'Después del 1 de julio'
  END AS periodo,
  AVG(total_compra) AS ventas_promedio
FROM ventas.orden
GROUP BY 
  CASE 
    WHEN fecha_orden_tomada < '2023-07-01' THEN 'Antes del 1 de julio'
    ELSE 'Después del 1 de julio'
  END;

-- ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?
SELECT horario_venta,
    COUNT(orden_id) AS cantidad_ventas,
    AVG(total_compra) AS promedio_ventas,
    MAX(total_compra) AS max_importe
  FROM ventas.orden
  GROUP BY horario_venta
  ORDER BY max_importe DESC;
