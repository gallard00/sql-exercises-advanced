-- 01_select_basics.sql
-- Objetivo: consultas SELECT simples sobre customers y products.

-- 1) Traer todos los clientes ordenados por fecha de creación descendente.
SELECT customer_id, name, email, city, created_at FROM customers ORDER BY created_at DESC;

-- 2) Listar productos de la categoría 'Periféricos' ordenados por precio ascendente.
SELECT product_id, name, price FROM products WHERE category = 'Periféricos' ORDER BY price ASC;

-- 3) Mostrar los emails únicos de clientes de 'Buenos Aires' o 'Córdoba'.
SELECT DISTINCT email FROM customers WHERE city IN ('Buenos Aires', 'Córdoba');