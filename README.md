# sql-exercises-advanced📘 SQL Exercises – Consultas Avanzadas con PostgreSQL

Este repositorio contiene una colección de ejercicios prácticos en SQL enfocados en consultas avanzadas. La idea es practicar y dominar conceptos clave como:

JOINS (INNER, LEFT, RIGHT, FULL)

Subconsultas (en WHERE, FROM, SELECT)

Agregaciones y agrupamientos (GROUP BY, HAVING, funciones agregadas)

CASE WHEN y lógica condicional

CTEs (Common Table Expressions)

Funciones de ventana (ROW_NUMBER, RANK, DENSE_RANK, OVER)

El objetivo es que puedas ejecutar, resolver y entender consultas SQL avanzadas que son muy utilizadas en entrevistas técnicas y en proyectos reales.

📂 Estructura del proyecto
sql-exercises/
 ├── README.md              # Documentación principal
 ├── datasets/              # Scripts .sql para crear tablas y poblar datos
 │    └── init.sql
 ├── basics/                # Consultas introductorias
 ├── joins/                 # Ejercicios de JOINS
 ├── subqueries/            # Ejercicios de subconsultas
 ├── group_aggregates/      # GROUP BY, HAVING y agregaciones
 ├── advanced/              # CASE WHEN, CTEs, funciones de ventana
 └── solutions/             # Posibles soluciones a los ejercicios

🐳 Entorno con Docker

Para facilitar la práctica, este proyecto incluye un contenedor de PostgreSQL junto con pgAdmin para administrar la base de datos desde una interfaz web.

1️⃣ Levantar el entorno

Ejecuta en la raíz del proyecto:

docker-compose up -d


Esto levantará:

Un contenedor con PostgreSQL

Un contenedor con pgAdmin (interfaz web en http://localhost:8080)

2️⃣ Credenciales por defecto

PostgreSQL

Host: localhost

Puerto: 5432

Usuario: postgres

Contraseña: postgres

Base de datos: sql_exercises

pgAdmin

URL: http://localhost:8080

Usuario: admin@admin.com

Contraseña: admin

3️⃣ Inicializar las tablas de ejemplo

Ejecuta dentro del contenedor de PostgreSQL:

docker exec -i sql_db psql -U postgres -d sql_exercises < datasets/init.sql


Esto creará las tablas (Customers, Orders, Products, etc.) y cargará datos de prueba.

🚀 Cómo usar el proyecto

Levanta los contenedores con Docker.

Conéctate a pgAdmin en http://localhost:8080.

Ejecuta los ejercicios de cada carpeta (joins/, subqueries/, etc.).

Revisa las soluciones propuestas en solutions/.

📑 Ejemplos de ejercicios

JOINs:

Obtener el nombre de los clientes y los productos que compraron.

Subconsulta:

Encontrar a los clientes que hicieron más pedidos que el promedio.

CTE + Window Function:

Calcular el segundo salario más alto por departamento usando ROW_NUMBER().

🎯 Objetivo del repositorio

Este proyecto es ideal para:

Practicar consultas SQL avanzadas.

Prepararse para entrevistas técnicas.

Reforzar habilidades en análisis de datos.

📌 Requisitos

Docker y Docker Compose instalados.

Editor de texto/IDE (ej: VS Code, DBeaver, DataGrip o pgAdmin).

🤝 Contribuciones

Si quieres aportar más ejercicios, soluciones alternativas o datasets, ¡bienvenido! Puedes abrir un Pull Request o proponer mejoras en Issues.

📜 Licencia

Este proyecto está bajo la licencia MIT.
