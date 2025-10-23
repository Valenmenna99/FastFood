-- Creación de base de datos.

CREATE DATABASE [fastfood_bd]
ON 
(
    NAME = 'fastfood_bd_datos',
    FILENAME = N'C:\HENRYSQL\fastfood_bd_datos.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON 
(
    NAME = 'fastfood_bd_log',
    FILENAME = N'C:\HENRYSQL\fastfood_bd_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);

USE fastfood_bd

-- Creación de esquemas
CREATE SCHEMA productos;
CREATE SCHEMA ventas;
CREATE SCHEMA personas;
CREATE SCHEMA sucursales;
CREATE SCHEMA otros; 

-- Creación de tablas
-- En productos: 
CREATE TABLE productos.categoria (
    categoria_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    nombre_categoria NVARCHAR(100) NOT NULL
);

CREATE TABLE productos.producto (
    producto_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    producto NVARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES productos.categoria(categoria_id)
); 

-- En sucursales:
CREATE TABLE sucursales.sucursal (
    sucursal_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    nombre_sucursal NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(255) NOT NULL
);

-- En personas:
CREATE TABLE personas.empleado (
    empleado_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    nombreyapellido_empleado NVARCHAR(100) NOT NULL,
    rol NVARCHAR(50) NOT NULL,
    puesto NVARCHAR(50) NOT NULL,
    departamento NVARCHAR(50) NOT NULL,
    sucursal_id INT NOT NULL,
    FOREIGN KEY (sucursal_id) REFERENCES sucursales.sucursal(sucursal_id)
);

CREATE TABLE personas.mensajero (
    mensajero_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    nombreyapellido_mensajero NVARCHAR(100) NOT NULL,
    es_externo BIT NOT NULL
);

CREATE TABLE personas.cliente (
    cliente_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    nombreyapellido_cliente NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(100) NOT NULL,
    telefono NVARCHAR (20) NOT NULL
);

ALTER TABLE personas.cliente
ADD telefono NVARCHAR (20) NULL

-- En otros
CREATE TABLE otros.tipo_pago (
    tipo_pago_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    descripcion NVARCHAR(100) NOT NULL
);

CREATE TABLE otros.origen (
    origen_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    descripcion NVARCHAR(100) NOT NULL
);

-- En ventas:
CREATE TABLE ventas.detalle_orden (
    producto_id INT,
    cantidad INT NULL, 
    orden_id INT,
    total DECIMAL (10,2) NOT NULL,
    PRIMARY KEY (producto_id, orden_id),
    FOREIGN KEY (producto_id) REFERENCES productos.producto (producto_id),
    FOREIGN KEY (orden_id) REFERENCES ventas.orden (orden_id)
 );

CREATE TABLE ventas.orden (
    orden_id INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    sucursal_id INT NOT NULL,
    empleado_id INT NULL,
    mensajero_id INT NULL,
    tipo_pago_id INT NOT NULL,
    origen_id INT NOT NULL,
    cliente_id INT NOT NULL,
    horario_venta TIME NOT NULL,
    total_compra DECIMAL(10,2) NOT NULL,
    km_recorrer DECIMAL(5,2) NULL,
    fecha_despacho DATETIME NULL,
    fecha_entrega DATETIME NULL,
    fecha_orden_tomada DATETIME NOT NULL,
    fecha_orden_lista DATETIME NULL,
    FOREIGN KEY (sucursal_id) REFERENCES sucursales.sucursal(sucursal_id),
    FOREIGN KEY (empleado_id) REFERENCES personas.empleado(empleado_id),
    FOREIGN KEY (mensajero_id) REFERENCES personas.mensajero(mensajero_id),
    FOREIGN KEY (tipo_pago_id) REFERENCES otros.tipo_pago(tipo_pago_id),
    FOREIGN KEY (origen_id) REFERENCES otros.origen(origen_id),
    FOREIGN KEY (cliente_id) REFERENCES personas.cliente(cliente_id)
);

ALTER TABLE ventas.orden 
DROP COLUMN horario_venta 
ALTER TABLE ventas.orden
ADD horario_venta NVARCHAR (20) NOT NULL
