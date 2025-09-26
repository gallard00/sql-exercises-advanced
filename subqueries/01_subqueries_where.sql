-- 01_subqueries_where.sql
-- Objetivo: subconsultas en WHERE y SELECT.

-- 1) Clientes que hicieron más pedidos que el promedio.
SELECT c.customer_id, c.name
FROM customers c
WHERE (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id)
      > (SELECT AVG(cnt) FROM (
             SELECT COUNT(*) AS cnt FROM orders GROUP BY customer_id
         ) t);

-- 2) Producto(s) con precio mayor al promedio de su categoría.
SELECT p.*
FROM products p
WHERE p.price > (
   SELECT AVG(p2.price) FROM products p2 WHERE p2.category = p.category
 );