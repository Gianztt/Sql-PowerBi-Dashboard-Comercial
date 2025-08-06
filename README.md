# SQL + Power BI Dashboard Comercial

<img width="1325" height="762" alt="image" src="https://github.com/user-attachments/assets/c106ac64-feb6-4207-b937-8d0bb837da94" />

Este proyecto consiste en la construcción de un dashboard comercial interactivo con datos extraidos desde postgresql

----

## Paso a paso del proyecto

### 1. Desarrollo de la base de datos (PostgreSQL)

- Se creó una base de datos desde cero en PostgreSQL utilizando pgAdmin.
- Se diseñaron e implementaron las siguientes tablas: `clientes`, `productos`, `ordenes` y `detalles_ordenes`.
<img width="1767" height="800" alt="image" src="https://github.com/user-attachments/assets/45a84dda-6674-47e8-9557-b1ff2f4f89ef" />
- Se insertaron datos ficticios para simular un entorno comercial realista.
- Se validó la calidad de los datos mediante queries exploratorias en SQL.
- Se desarrollaron consultas para calcular métricas clave como ingresos, descuentos, márgenes y rentabilidad por región y categoría.

### 2. Extracción de datos desde SQL a Power BI

- Se configuró el controlador **psqlODBC** para permitir la conexión entre Power BI y PostgreSQL.
- <img width="679" height="653" alt="image" src="https://github.com/user-attachments/assets/0ff9b824-fe0a-4fff-9b4c-4a17cb898e86" />
- Se ingresaron los parámetros de conexión correspondientes (host, base de datos, usuario).
- Se importaron las cuatro tablas mencionadas al entorno de Power BI para el modelado y visualización.
- <img width="886" height="700" alt="image" src="https://github.com/user-attachments/assets/54d4c0fe-42ec-4643-bac8-144417e0e7a9" />


### 3. Creación del dashboard en Power BI

- Se verificaron y ajustaron las relaciones entre tablas utilizando claves primarias y foráneas.
<img width="1340" height="616" alt="image" src="https://github.com/user-attachments/assets/93131e17-4573-463d-9def-c3c71550349d" />
- Se crearon medidas DAX personalizadas para calcular KPIs como:
  - Total de ingresos
<img width="1548" height="122" alt="image" src="https://github.com/user-attachments/assets/d9435494-a14e-40a1-b428-daf769935cef" />
  - Margen promedio
  - Productos vendidos
  - Porcentaje de descuento promedio
  - Ganancia por pedido
- Se diseñó el dashboard con los siguientes elementos:
  - Segmentadores por **Categoría** y **Segmento de cliente**
  - Gráfico de barras con ingresos por **Región**
  - Gráfico de líneas con ingresos mensuales y línea de tendencia
  - KPIs destacados en tarjetas
  - Título y layout uniforme con tipografía coherente
  
<img width="1325" height="762" alt="image" src="https://github.com/user-attachments/assets/c106ac64-feb6-4207-b937-8d0bb837da94" />
