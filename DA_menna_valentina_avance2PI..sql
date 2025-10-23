-- Insertar datos. 
-- En tabla de categoria. 
INSERT INTO productos.categoria (nombre_categoria) VALUES
('Comida R�pida'), 
('Postres'), 
('Bebidas'), 
('Ensaladas'), 
('Desayunos'),
('Cafeter�a'), 
('Helados'), 
('Comida Vegana'), 
('Carnes'), 
('Pizzas');

-- Consulta tabla Categorias
SELECT * FROM productos.categoria

-- En tabla productos.
INSERT INTO productos.producto (producto, categoria_id, precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), 
('Cheeseburger', 1, 7.99), 
('Pizza Margarita', 10, 11.99), 
('Pizza Pepperoni', 10, 12.99), 
('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), 
('Ensalada C�sar', 4, 5.99), 
('Ensalada Griega', 4, 6.99), 
('Pastel de Zanahoria', 2, 3.99), 
('Brownie', 2, 2.99);

-- Consulta tabla de productos
SELECT * FROM productos.producto

-- En tabla surcusal
INSERT INTO sucursales.sucursal  (nombre_sucursal, direccion) VALUES
('Sucursal Central', '1234 Main St'), 
('Sucursal Norte', '5678 North St'), 
('Sucursal Este', '9101 East St'), 
('Sucursal Oeste', '1121 West St'), 
('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), 
('Sucursal Monta�a', '1718 Mountain St'), 
('Sucursal Valle', '1920 Valley St'), 
('Sucursal Lago', '2122 Lake St'), 
('Sucursal Bosque', '2324 Forest St');

-- Consulta tabla sucursal 
SELECT * FROM sucursales.sucursal;

-- En tabla empleados:
-- Insertar datos en Empleados
INSERT INTO personas.empleado (nombreyapellido_empleado, puesto, departamento, sucursal_id, rol) VALUES
('John Doe', 'Gerente', 'Administraci�n', 1, 'Vendedor'), 
('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), 
('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), 
('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), 
('Tom Brown', 'Barista', 'Cafeter�a', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Log�stica', 1, 'Mensajero'), 
('Lucas Miller', 'Atenci�n al Cliente', 'Servicio', 1, 'Vendedor'), 
('Olivia Garc�a', 'Encargado de Turno', 'Administraci�n', 1, 'Vendedor'), 
('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), 
('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

--Consulta tabla empleados: 
SELECT * FROM personas.empleado

-- Insertar datos
INSERT INTO personas.cliente (nombreyapellido_cliente, direccion) VALUES
('Cliente Uno', '1000 A Street'), 
('Cliente Dos', '1001 B Street'), 
('Cliente Tres', '1002 C Street'), 
('Cliente Cuatro', '1003 D Street'), 
('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), 
('Cliente Siete', '1006 G Street'), 
('Cliente Ocho', '1007 H Street'), 
('Cliente Nueve', '1008 I Street'), 
('Cliente Diez', '1009 J Street');

-- Consulta tabla cliente 
SELECT * FROM personas.cliente

-- En tabla origen
INSERT INTO otros.origen (descripcion) VALUES
('En l�nea'), 
('Presencial'), 
('Tel�fono'), 
('Drive Thru'), 
('App M�vil'),
('Redes Sociales'), 
('Correo Electr�nico'), 
('Publicidad'), 
('Recomendaci�n'), 
('Evento');

--Consulta tabla origen
SELECT * FROM otros.origen

-- En tabla tipos de pago:
INSERT INTO otros.tipo_pago (descripcion) VALUES
('Efectivo'), 
('Tarjeta de Cr�dito'), 
('Tarjeta de D�bito'), 
('PayPal'), 
('Transferencia Bancaria'),
('Criptomonedas'), 
('Cheque'), 
('Vale de Comida'), 
('Cup�n de Descuento'), 
('Pago M�vil');

-- Consulta tabla tipos de pago.
SELECT * FROM otros.tipo_pago

-- En tabla mensajero:
INSERT INTO personas.mensajero (nombreyapellido_mensajero, es_externo) VALUES
('Mensajero Uno', 0), 
('Mensajero Dos', 1), 
('Mensajero Tres', 0), 
('Mensajero Cuatro', 1), 
('Mensajero Cinco', 0),
('Mensajero Seis', 1), 
('Mensajero Siete', 0), 
('Mensajero Ocho', 1), 
('Mensajero Nueve', 0), 
('Mensajero Diez', 1);

-- Consulta tabla mensajero
SELECT * FROM personas.mensajero

-- En tabla de ordenes:
INSERT INTO ventas.orden (cliente_id , empleado_id , sucursal_id, mensajero_id, tipo_pago_id, origen_id, horario_venta, total_compra, km_recorrer, fecha_despacho, fecha_entrega, fecha_orden_tomada, fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

-- Consutla tabla de orden
SELECT * FROM ventas.orden

-- En tabla detalle orden
INSERT INTO ventas.detalle_orden (orden_id, producto_id, cantidad, total) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

-- Consulta tabla de detalle orden
SELECT * FROM ventas.detalle_orden

--UPDATE Y DELETE

--ACTUALIZACIONES DE EJEMPLO (UPDATE)

USE fastfood_bd
-- Aumentar el precio de todos los productos en la categor�a 1
SELECT * FROM productos.producto
UPDATE productos.producto 
SET precio = precio + 1 
WHERE categoria_id= 1;

-- Cambiar la posici�n de todos los empleados del departamento 'Cocina' a 'Chef'
SELECT * FROM personas.empleado
UPDATE personas.empleado 
SET puesto = 'Chef' 
WHERE departamento = 'Cocina';

-- Actualizar la direcci�n de una sucursal espec�fica
SELECT * FROM sucursales.sucursal
UPDATE sucursales.sucursal 
SET direccion = '1234 New Address St' 
WHERE sucursal_id = 1;

--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden espec�fica
Imaginemos que quieres eliminar una orden espec�fica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operaci�n eliminar�a la orden junto con sus detalles asociados 
(deber�as asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/
SELECT * FROM ventas.detalle_orden
SELECT * FROM ventas.orden
DELETE FROM ventas.detalle_orden WHERE orden_id = 10;
DELETE FROM ventas.orden WHERE orden_id = 10;

/*2. Eliminar todos los productos de una categor�a espec�fica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podr�as querer eliminar todos los productos asociados a esa categor�a.*/
SELECT * FROM productos.producto WHERE categoria_id = 2
SELECT * FROM ventas.orden
SELECT * FROM ventas.detalle_orden
SELECT * FROM productos.categoria
DELETE FROM ventas.detalle_orden WHERE producto_id IN (9,10);
DELETE FROM productos.producto WHERE categoria_id = 2;
DELETE FROM productos.categoria WHERE categoria_id = 2;
--Antes de ejecutar este comando, deber�as considerar si hay �rdenes que incluyen estos productos y decidir c�mo manejar esas referencias.
-- No ejecuto la eleminaci�n de la categor�a 2, ya que, solo se pide la eliminaci�n de los productos de la categor�a 2, pero no la categor�a en s�. 

/*3. Eliminar empleados de una sucursal que cerr�
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podr�as necesitar eliminar a todos los empleados asociados con esa sucursal.*/
SELECT * FROM personas.empleado;
DELETE FROM personas.empleado WHERE sucursal_id = 10;
-- no hay registros de empleados en la sucursal 10.

-- Preguntas para consultas
-- �Cu�l es la cantidad total de registros �nicos en la tabla de �rdenes?
SELECT COUNT (DISTINCT orden_id) AS total_registro_unicos
FROM ventas.orden;

-- �Cu�ntos empleados existen en cada departamento?
SELECT COUNT (empleado_id) AS cantidad_dempleados, departamento 
FROM personas.empleado
GROUP BY departamento

--�Cu�ntos productos hay por c�digo de categor�a?
SELECT COUNT (*) AS cantidad_producto, categoria_id
FROM productos.producto
GROUP BY categoria_id

-- �Cu�ntos clientes se han importado a la tabla de clientes?
SELECT COUNT (*) AS cantidad_clientes
FROM personas.cliente

/* �Cu�les son las sucursales con un promedio de Facturaci�n/Ingresos superior a 1000.00 y 
que minimizan sus costos en base al promedio de kil�metros recorridos de todas de sus entregas gestionadas? 
Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.
*/ 

SELECT AVG (total_compra) AS promedio_facturacion, AVG (km_recorrer) AS promedio_km, sucursal_id
FROM ventas.orden
GROUP BY sucursal_id
HAVING AVG (total_compra) > 1000
ORDER BY promedio_km ASC