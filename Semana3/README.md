# 🧩 Actividad Integradora: Del Modelo al Script – Construcción de Bases de Datos Reales en SQL

## 📘 Descripción General
Este proyecto forma parte de la actividad integradora del curso, cuyo propósito es aplicar de forma integral los conocimientos adquiridos sobre el **diseño, estructuración y construcción física de bases de datos relacionales**, implementando soluciones en **PostgreSQL** y **MySQL**.

Cada base de datos aborda un contexto distinto, con el fin de demostrar dominio en la definición de entidades, relaciones, restricciones, integridad referencial y carga de datos mediante scripts SQL.

---

## 🗃️ Bases de Datos Implementadas

### 1. **Sistema de Gestión Hospitalaria (PostgreSQL)**
**Objetivo:**  
Gestionar la información relacionada con doctores, pacientes, especialidades, habitaciones y citas médicas dentro de una institución de salud.

**Entidades Principales:**
- **Doctores:** Contiene información del personal médico y su especialidad.  
- **Pacientes:** Almacena los datos generales de los pacientes registrados.  
- **Especialidades:** Define las distintas áreas médicas disponibles (cardiología, pediatría, etc.).  
- **Habitaciones:** Representa las salas o habitaciones disponibles en el hospital.  
- **Citas:** Registra las citas médicas, asociando doctor, paciente, habitación, fecha y motivo.  

**Relaciones Clave:**
- Un **doctor** pertenece a una **especialidad**.  
- Una **cita** relaciona a un **paciente**, un **doctor** y una **habitación**.  
- Las habitaciones pueden estar **disponibles** o **ocupadas** según su uso.

**Archivos asociados:**
- `hospital_estructura.sql` → Contiene las sentencias `CREATE TABLE`, `ALTER TABLE` y restricciones.  
- `hospital_inserciones.sql` → Contiene los datos de ejemplo con sentencias `INSERT`.  

**Diagrama E-R:**  
(Archivo: `diagrama_hospital.png`)

---

### 2. **Sistema de Biblioteca (MySQL)**
**Objetivo:**  
Administrar el préstamo de libros, sus autores, editoriales y usuarios.

**Entidades Principales:**
- **Autor:** Registra los escritores de los libros.  
- **Editorial:** Contiene información de las editoriales que publican los libros.  
- **Libro:** Representa los ejemplares disponibles, vinculados a un autor y editorial.  
- **Usuario:** Contiene los datos de los usuarios que solicitan préstamos.  
- **Préstamo:** Registra las operaciones de préstamo y devolución de libros.  

**Relaciones Clave:**
- Un **libro** pertenece a un **autor** y una **editorial**.  
- Un **usuario** puede tener múltiples **préstamos**.  
- Un **préstamo** asocia un **usuario** con un **libro**, junto con las fechas de préstamo y devolución.

**Archivos asociados:**
- `biblioteca_estructura.sql` → Sentencias `CREATE TABLE`, llaves primarias y foráneas.  
- `biblioteca_inserciones.sql` → Datos de prueba para validar integridad.  

**Diagrama E-R:**  
(Archivo: `diagrama_biblioteca.png`)

---

## 🧠 Decisiones de Diseño
1. **Integridad referencial:** Se implementaron claves foráneas en todas las relaciones para asegurar coherencia de datos.  
2. **Normalización:** Todas las tablas cumplen con la **Tercera Forma Normal (3FN)**.  
3. **Tipos de datos adecuados:** Uso de `serial`/`int` para identificadores, `varchar` para texto, y `date`/`timestamp` para fechas.  
4. **Convenciones de nomenclatura:** Nombres en **minúsculas** con `snake_case` y prefijos `id_`.  
5. **Datos de ejemplo:** Registros ficticios usados para validar integridad estructural.  

---

## 📄 Documentación Técnica

### Estructura del repositorio
```
/
├── PostgreSQL/
│   ├── hospital_estructura.sql
│   ├── hospital_inserciones.sql
│   └── diagrama_hospital.png
│
├── MySQL/
│   ├── biblioteca_estructura.sql
│   ├── biblioteca_inserciones.sql
│   └── diagrama_biblioteca.png
│
└── README.md
```

### Ejecución
1. Crear las bases de datos:
   ```sql
   CREATE DATABASE hospital;
   CREATE DATABASE biblioteca;
   ```

2. Ejecutar scripts de estructura:
   ```bash
   psql -d hospital -f hospital_estructura.sql
   mysql -u root -p biblioteca < biblioteca_estructura.sql
   ```

3. Insertar datos de ejemplo:
   ```bash
   psql -d hospital -f hospital_inserciones.sql
   mysql -u root -p biblioteca < biblioteca_inserciones.sql
   ```

---

## 🌐 Publicación
El proyecto completo se encuentra disponible en un **repositorio público de GitHub**, que incluye los scripts, diagramas y documentación técnica.

---

## 👥 Autores
Proyecto realizado por el **Equipo de Desarrollo de Bases de Datos Relacionales**  
Curso: *Diseño y Construcción de Bases de Datos en SQL*  
Fecha: Noviembre 2025
