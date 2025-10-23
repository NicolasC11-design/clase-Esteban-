
# Informe: Implementación de Bases de Datos en Contenedores Docker

## Introducción
En este informe se documenta la implementación y administración de contenedores Docker que ejecutan distintos motores de bases de datos: **MySQL**, **MariaDB** y **PostgreSQL**.
Además, se prueba su conexión desde tres herramientas gráficas: **HeidiSQL**, **DBeaver** y **Beekeeper Studio**.

---

## 1. Implementación de contenedores Docker

Se descargaron y ejecutaron las imágenes oficiales desde Docker Hub para cada motor de base de datos.

**Comandos ejecutados:**
```bash
docker pull mysql:latest
docker run -d --name cont_mysql -e MYSQL_ROOT_PASSWORD=12345 -p 3306:3306 mysql:latest

docker pull mariadb:latest
docker run -d --name cont_mariadb -e MARIADB_ROOT_PASSWORD=12345 -p 3307:3306 mariadb:latest

docker pull postgres:latest
docker run -d --name cont_postgres -e POSTGRES_PASSWORD=12345 -p 5432:5432 postgres:latest
```
**Verificación de contenedores activos:**
```bash
docker ps
```

📸 **Captura 1 – Ejecución de contenedores Docker:**
![Docker CMD](Docker_CMD.png)

---

## 2. Conexión desde HeidiSQL

Una vez los contenedores estaban activos, se realizaron conexiones desde **HeidiSQL** a cada uno de ellos usando los puertos correspondientes.

**Bases creadas:**
```sql
CREATE DATABASE db_heidisql_mariadb;
CREATE DATABASE db_heidisql_mysql;
CREATE DATABASE db_heidisql_postgres;
SHOW DATABASES;
```

📸 **Captura 2 – HeidiSQL conectado a los tres contenedores:**
![HeidiSQL](HeidiSQL.png)

---

## 3. Conexión desde DBeaver

También se realizaron pruebas con **DBeaver**, creando nuevas bases de datos en los mismos contenedores.

**Bases creadas:**
```sql
CREATE DATABASE db_dbeaver_mysqlS;
CREATE DATABASE db_dbeaver_mariadbS;
CREATE DATABASE db_dbeaver_postgresS;
SHOW DATABASES;
```

📸 **Captura 3 – DBeaver conectado a los contenedores Docker:**
![DBeaver](DBeaver.png)

---

## 4. Conexión desde Beekeeper Studio

Finalmente, se conectaron los contenedores desde **Beekeeper Studio**, verificando la visibilidad de todas las bases creadas desde las herramientas anteriores.

**Comando usado:**
```sql
SHOW DATABASES;
```

📸 **Captura 4 – Beekeeper Studio mostrando todas las bases:**
![Beekeeper](Beekeeper.png)

---

## 5. Conclusiones

- Los tres contenedores Docker (MySQL, MariaDB y PostgreSQL) se ejecutaron correctamente de manera simultánea.  
- Se pudo acceder a cada motor de base de datos desde diferentes clientes SQL.  
- Docker facilita el despliegue de entornos aislados, portátiles y reproducibles para pruebas y desarrollo.  
- Las herramientas de administración permiten la verificación visual de la correcta conexión y gestión de las bases.

---
**Autor:** *Nicolás Cristiano*  

