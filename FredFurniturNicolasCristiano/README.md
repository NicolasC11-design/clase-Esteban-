-NICOLAS CRISTIANO-

## Parte 1: Análisis conceptual  
(Respuestas a las 5 preguntas)

### 1. ¿Qué problema principal busca resolver la normalización en una base de datos y por qué es crítica en sistemas empresariales?

La normalización busca principalmente **eliminar duplicación de datos** y **evitar inconsistencias**.  
Cuando los datos están repetidos o mal estructurados, las actualizaciones son complicadas y propensas a errores.  

En sistemas empresariales es crítica porque:
- Los datos deben ser **confiables** (clientes, productos, compras, etc.).  
- A medida que la empresa crece, mantener datos duplicados es costoso y arriesgado.  
- Una base normalizada es **más escalable y fácil de mantener**.  
- Reduce el uso innecesario de almacenamiento.

---

### 2. Diferencias entre 1NF, 2NF y 3NF

| Forma Normal | Qué asegura | Ejemplo |
|---------------|-------------|----------|
| **1NF** | Cada campo tiene un único valor atómico. | No poner “Martillo, Llave” en una misma celda. |
| **2NF** | Los atributos dependen de toda la clave primaria. | Si la clave es compuesta, no puede depender solo de una parte. |
| **3NF** | Los atributos no clave dependen únicamente de la clave primaria. | Evita dependencias entre atributos no clave. |

En resumen:
1. **1NF:** Un valor por campo.  
2. **2NF:** Dependencia completa de la clave.  
3. **3NF:** Sin dependencias transitivas.

---

### 3. Ejemplo donde la normalización mejora integridad pero puede afectar el rendimiento

Si separas **productos** y **categorías** en tablas distintas, logras integridad (una sola categoría válida por producto).  
Pero cada vez que se muestran productos con sus categorías, se requiere un **JOIN**, lo que puede afectar el rendimiento en grandes volúmenes de datos.

---

### 4. Papel de las dependencias funcionales

Las **dependencias funcionales** indican qué campos dependen de otros.  
Por ejemplo:  
- `id_producto → nombre_producto, precio`  
- Si un campo depende solo de parte de la clave o de otro atributo no clave, se rompe la forma normal.  

Detectarlas permite saber cómo dividir correctamente las tablas para cumplir 3FN.

---

### 5. Cuándo es justificable desnormalizar

Desnormalizar es **introducir redundancia controlada** para mejorar rendimiento o simplificar consultas.  
Se justifica cuando:
- Hay **consultas muy frecuentes** que requieren muchos JOINs.  
- Se busca **simplicidad de lectura** sobre pureza del modelo.  
- El sistema tiene **más lecturas que escrituras** (por ejemplo, reportes o dashboards).

> “Don’t over-normalize… if every simple query needs five joins, that’s a red flag.” — *Devart*

---

## Parte 2: Caso Fred’s Furniture

### Resumen
El caso permitió aplicar la normalización hasta 3FN, separando entidades redundantes como productos, pedidos, proveedores y clientes, garantizando integridad referencial y reduciendo duplicidad.

### Reglas de negocio principales
1. Cada producto pertenece a una categoría.  
2. Los pedidos dependen de los clientes.  
3. Las ventas y detalles de venta están ligados por una relación 1:N.  
4. Se evitó toda dependencia parcial o transitiva.

---

## Parte 3: Proyecto personal — **Ferretería Básica (3FN)**

### Descripción general
Este proyecto representa una **ferretería pequeña**, donde se registran **categorías, proveedores, productos, compras y sus detalles**.  
Está diseñado bajo **Tercera Forma Normal (3FN)** para garantizar integridad y facilidad de mantenimiento.

---

### 📊 Diagrama Entidad–Relación  


### 🔧 Reglas de negocio
1. Cada producto pertenece a **una categoría** y **un proveedor**.  
2. Cada compra pertenece a **un proveedor**.  
3. Cada detalle de compra asocia un **producto** con una **compra** (relación N:M).  
4. El campo `stock` depende exclusivamente de `producto`, cumpliendo 3FN.  
5. No existen dependencias transitivas ni parciales.

---


- La estructura está normalizada hasta 3FN: sin redundancia ni dependencias indirectas.  
- Las relaciones están organizadas mediante claves foráneas, garantizando integridad referencial.  
- Es un modelo más corto y simple, ideal para visualizar fácilmente las relaciones principales.



```sql
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