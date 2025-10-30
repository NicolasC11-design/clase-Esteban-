CREATE DATABASE IF NOT EXISTS ferreteria_basica;
USE ferreteria_basica;

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre_categoria VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE proveedor (
  id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
  nombre_empresa VARCHAR(120) NOT NULL,
  telefono VARCHAR(30),
  email VARCHAR(100)
);

CREATE TABLE producto (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre_producto VARCHAR(100) NOT NULL,
  precio_compra DECIMAL(10,2) NOT NULL,
  precio_venta DECIMAL(10,2) NOT NULL,
  stock INT DEFAULT 0,
  id_categoria INT NOT NULL,
  id_proveedor INT NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE compra (
  id_compra INT PRIMARY KEY AUTO_INCREMENT,
  fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
  total DECIMAL(10,2) NOT NULL,
  id_proveedor INT NOT NULL,
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

CREATE TABLE detalle_compra (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_compra INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_compra) REFERENCES compra(id_compra) ON DELETE CASCADE,
  FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);