CREATE DATABASE IF NOT EXISTS freds_furniture;
USE freds_furniture;

-- Clientes
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150),
  telefono VARCHAR(50),
  email VARCHAR(100)
);

-- Categorías
CREATE TABLE categorias (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre_categoria VARCHAR(100)
);

-- Proveedores
CREATE TABLE proveedores (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150),
  telefono VARCHAR(50),
  email VARCHAR(100)
);

-- Productos
CREATE TABLE productos (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(150) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  id_categoria INT,
  id_proveedor INT,
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
  FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Inventario
CREATE TABLE inventario (
  id_inventario INT PRIMARY KEY AUTO_INCREMENT,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL DEFAULT 0,
  fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Pedidos (órdenes de clientes)
CREATE TABLE pedidos (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  fecha_pedido DATE,
  id_cliente INT,
  estado VARCHAR(50),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Detalles de pedido
CREATE TABLE detalles_pedido (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Ventas (registro de transacciones finalizadas)
CREATE TABLE ventas (
  id_venta INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE,
  id_cliente INT,
  total DECIMAL(12,2),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Detalles de venta
CREATE TABLE detalles_venta (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2),
  FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);