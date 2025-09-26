-- Schema & seed data for SQL exercises

-- Drop if exists (idempotent re-run friendly when using a fresh volume)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS customers;

-- Core tables
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(120) UNIQUE NOT NULL,
    city        VARCHAR(80),
    created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE products (
    product_id  SERIAL PRIMARY KEY,
    name        VARCHAR(120) NOT NULL,
    category    VARCHAR(60)  NOT NULL,
    price       NUMERIC(10,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    order_date  DATE NOT NULL,
    status      VARCHAR(20) NOT NULL CHECK (status IN ('PENDING','PAID','SHIPPED','CANCELLED'))
);

CREATE TABLE order_items (
    order_id    INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id  INT NOT NULL REFERENCES products(product_id),
    quantity    INT NOT NULL CHECK (quantity > 0),
    unit_price  NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE payments (
    payment_id  SERIAL PRIMARY KEY,
    order_id    INT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    amount      NUMERIC(10,2) NOT NULL,
    paid_at     TIMESTAMP NOT NULL DEFAULT NOW(),
    method      VARCHAR(20) NOT NULL CHECK (method IN ('CASH','CARD','TRANSFER'))
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    name          VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id   SERIAL PRIMARY KEY,
    department_id INT REFERENCES departments(department_id),
    first_name    VARCHAR(60) NOT NULL,
    last_name     VARCHAR(60) NOT NULL,
    hire_date     DATE NOT NULL,
    salary        NUMERIC(10,2) NOT NULL CHECK (salary >= 0)
);

-- Indexes useful for exercises
CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_products_category ON products(category);

-- Seed data
INSERT INTO customers (name, email, city) VALUES
('Ana López',       'ana@example.com',       'Buenos Aires'),
('Bruno Pérez',     'bruno@example.com',     'Córdoba'),
('Carla Ríos',      'carla@example.com',     'Rosario'),
('Diego Martínez',  'diego@example.com',     'Mendoza'),
('Elena García',    'elena@example.com',     'La Plata');

INSERT INTO products (name, category, price) VALUES
('Teclado mecánico',     'Periféricos', 22000),
('Mouse inalámbrico',    'Periféricos', 15000),
('Monitor 24"',          'Pantallas',   130000),
('Notebook 14"',         'Computadoras',800000),
('Auriculares',          'Audio',       35000);

INSERT INTO departments (name) VALUES
('Ventas'),
('Soporte'),
('IT');

INSERT INTO employees (department_id, first_name, last_name, hire_date, salary) VALUES
(1, 'Nicolás', 'Suárez', '2021-02-15', 350000),
(1, 'Laura',   'Bassi',  '2022-08-03', 410000),
(2, 'Marina',  'Iglesias','2020-11-20',320000),
(2, 'Julián',  'Paredes','2019-05-12',300000),
(3, 'Rocío',   'López',  '2023-01-10',500000);

-- Orders
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2024-11-05', 'PAID'),
(1, '2025-01-12', 'SHIPPED'),
(2, '2025-02-18', 'CANCELLED'),
(3, '2025-03-10', 'PAID'),
(3, '2025-04-02', 'PAID'),
(4, '2025-05-22', 'PENDING');

-- Order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 22000),
(1, 2, 2, 15000),
(2, 3, 1, 130000),
(3, 2, 1, 15000),
(4, 5, 2, 35000),
(4, 3, 1, 130000),
(5, 4, 1, 800000),
(5, 1, 1, 22000),
(6, 2, 3, 15000);

-- Payments
INSERT INTO payments (order_id, amount, paid_at, method) VALUES
(1, 52000, '2024-11-05 13:30', 'CARD'),
(2, 130000, '2025-01-12 09:10','TRANSFER'),
(4, 200000, '2025-03-10 16:45','CASH'),
(5, 822000, '2025-04-02 10:00','CARD');