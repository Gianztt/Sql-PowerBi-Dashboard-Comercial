-- Querys 

-- Creacion de Tablas

-- Tabla de Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    region VARCHAR(50),
    segmento VARCHAR(50)
);

-- Tabla de Categorías
CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100)
);

-- Tabla de Productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_unitario NUMERIC(10,2),
    id_categoria INTEGER REFERENCES categorias(id_categoria)
);

-- Tabla de Ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_cliente INTEGER REFERENCES clientes(id_cliente),
    id_producto INTEGER REFERENCES productos(id_producto),
    fecha DATE,
    cantidad INTEGER,
    descuento NUMERIC(4,2),
    costo_unitario NUMERIC(10,2)
);

-- Inserción de datos

-- Insertar categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Electrónica'),
('Muebles'),
('Papelería');

-- Insertar productos
INSERT INTO productos (nombre_producto, precio_unitario, id_categoria) VALUES
('Laptop HP', 700000, 1),
('Monitor Samsung', 250000, 1),
('Silla ergonómica', 120000, 2),
('Escritorio madera', 220000, 2),
('Cuaderno universitario', 2500, 3),
('Pack lápices', 1000, 3);

-- Insertar clientes
INSERT INTO clientes (nombre, region, segmento) VALUES
('Empresa A', 'Metropolitana', 'Corporativo'),
('Empresa B', 'Valparaíso', 'PYME'),
('Cliente C', 'Biobío', 'Individual'),
('Cliente D', 'Metropolitana', 'Individual'),
('Empresa E', 'Los Lagos', 'Corporativo');

-- Insertar ventas
INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad, descuento, costo_unitario) VALUES
(1, 1, '2025-01-15', 2, 0.10, 500000),
(1, 2, '2025-01-20', 3, 0.05, 180000),
(2, 3, '2025-02-10', 1, 0.00, 90000),
(2, 5, '2025-02-12', 50, 0.15, 1800),
(3, 6, '2025-03-01', 20, 0.00, 700),
(4, 4, '2025-03-03', 1, 0.10, 180000),
(5, 2, '2025-03-15', 2, 0.10, 200000),
(5, 1, '2025-04-01', 1, 0.00, 500000),
(3, 5, '2025-04-10', 30, 0.05, 1800),
(2, 6, '2025-04-15', 40, 0.00, 700),
(1, 4, '2025-05-05', 2, 0.20, 180000),
(4, 3, '2025-05-15', 1, 0.00, 90000);

-- Exploración de datos

-- Ver datos de ventas
SELECT * FROM ventas;

-- Ver productos
SELECT * FROM productos;

-- Ver clientes
SELECT * FROM clientes;

-- Consultas para KPIs

-- Total de ingresos
SELECT 
  SUM(v.cantidad * p.precio_unitario * (1 - v.descuento)) AS ingresos_netos
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto;

-- Ganancia total
SELECT 
  SUM((p.precio_unitario - v.costo_unitario) * v.cantidad) AS ganancia_total
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto;

-- Margen promedio (%)
SELECT 
  AVG((p.precio_unitario - v.costo_unitario) / p.precio_unitario) * 100 AS margen_promedio_pct
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto;

-- Ventas por región
SELECT 
  c.region,
  SUM(v.cantidad * p.precio_unitario * (1 - v.descuento)) AS ingresos_region
FROM ventas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY c.region
ORDER BY ingresos_region DESC;

-- Top 5 productos mas rentables
SELECT 
  p.nombre_producto,
  SUM((p.precio_unitario - v.costo_unitario) * v.cantidad) AS ganancia_producto
FROM ventas v
JOIN productos p ON v.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY ganancia_producto DESC
LIMIT 5;


