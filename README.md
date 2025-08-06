# 📊 SQL + Power BI Dashboard Comercial

<img width="1325" height="762" alt="Dashboard Comercial" src="https://github.com/user-attachments/assets/c106ac64-feb6-4207-b937-8d0bb837da94" />

Este proyecto consiste en la construcción de un **dashboard comercial interactivo** utilizando una base de datos en PostgreSQL conectada a Power BI.

El objetivo fue simular un entorno empresarial real para analizar ingresos, márgenes y comportamiento de clientes mediante KPIs clave y visualizaciones dinámicas.

---

## 🧱 1. Desarrollo de la Base de Datos (PostgreSQL)

- Se creó una base de datos desde cero en **pgAdmin**.
- Se diseñaron las tablas `clientes`, `ventas`, `productos` y `categorias`.

<img width="1767" height="800" alt="Modelo de datos" src="https://github.com/user-attachments/assets/45a84dda-6674-47e8-9557-b1ff2f4f89ef" />

- Se insertaron datos ficticios representando cinco meses de ventas.
- Se ejecutaron queries SQL para validar integridad de datos y calcular:
  - Total de ingresos
  - Ganancia total
  - Margen promedio (%)
  - Ventas por región

---

## 🔗 2. Conexión a Power BI desde PostgreSQL

- Se utilizó el **driver psqlODBC** para permitir la conexión.

<img width="679" height="653" alt="Configuración ODBC" src="https://github.com/user-attachments/assets/0ff9b824-fe0a-4fff-9b4c-4a17cb898e86" />

- Se importaron las 4 tablas a Power BI.

<img width="886" height="700" alt="Tablas importadas" src="https://github.com/user-attachments/assets/54d4c0fe-42ec-4643-bac8-144417e0e7a9" />

---

## 📐 3. Construcción del Dashboard

- Modelado de datos mediante relaciones bien definidas.

<img width="1340" height="616" alt="Relaciones entre tablas" src="https://github.com/user-attachments/assets/93131e17-4573-463d-9def-c3c71550349d" />

- Creación de **medidas DAX personalizadas** para los siguientes KPIs:
  - Total de ingresos
```dax
Total_Ingresos = 
SUMX(
    ventas;
    ventas[cantidad] * RELATED(productos[precio_unitario]) * (1 - ventas[descuento])
)

```
  - Ganancia total
```dax
Ganancia_Total = 
SUMX(
    ventas;
    (RELATED(productos[precio_unitario]) - ventas[costo_unitario]) * ventas[cantidad]
)
```
  - Unidades vendidas
```dax
Unidades_Vendidas = SUM(ventas[cantidad])
```   
  - Ganancia por pedido
```dax
Ganancia_por_Pedido = [Ganancia_Total] / (DISTINCTCOUNT(ventas[id_venta]))
```

- Diseño del dashboard final con:
  - Segmentadores por **Categoría** y **Segmento de cliente**
  - Gráfico de barras con ingresos por **Región**
  - Gráfico de líneas con ingresos mensuales y línea de tendencia
  - KPIs destacados en tarjetas
  - Título y layout uniforme con tipografía coherente
<img width="1325" height="762" alt="Dashboard Final" src="https://github.com/user-attachments/assets/c106ac64-feb6-4207-b937-8d0bb837da94" />

---

## 🔍 4. Principales Insights Obtenidos

- Electrónica representa el 75% de los ingresos totales con solo un 5% del total de unidades vendidas, lo que sugiere un alto margen de ganancia por unidad y baja rotación de productos.
- El segmento Corporativo genera el 83% de los ingresos, pero representa solo el 7% del volumen de ventas, lo que indica que compra productos de alto valor, con poca frecuencia.
- Las regiones del Biobío y Los Lagos muestran un crecimiento lineal sostenido en ingresos mensuales, lo que sugiere una expansión comercial saludable.
- La región de Valparaíso, por el contrario, presenta un decrecimiento lineal en sus ingresos, lo que podría señalar problemas de retención de clientes o saturación del mercado.
- A pesar de vender el 59% del total de unidades, Valparaíso solo aporta un 6% de los ingresos, lo que indica una alta rotación de productos de bajo margen, posiblemente productos básicos o con fuertes descuentos.


---

## 🛠️ Herramientas

- PostgreSQL con interfaz gráfica pgAdmin
- Power BI
- Controlador ODBC psqlODBC

---

## 📁 Datos y Archivos en el Repositorio

- `DashboardVentas.pbix` — Archivo Power BI con el dashboard final.
- `dump_dataset_comercial.sql` — Dump completo de la base de datos PostgreSQL.
- `querys_dataset_comercial.sql` — Script SQL con creación de tablas, inserciones y consultas para KPIs.
