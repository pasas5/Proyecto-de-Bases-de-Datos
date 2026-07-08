# Base de Datos - Tienda Online de Electrónicos

## Descripción del Proyecto
Este repositorio contiene todo el código y la documentación de mi proyecto final: el diseño y la implementación de una base de datos relacional en MySQL para gestionar la operación de una tienda de electrónicos. Básicamente, el sistema está pensado para llevar el control del catálogo de productos, la información de los clientes, los pedidos y las reseñas.

## Reglas de Negocio Implementadas
El modelo de datos está normalizado en la Tercera Forma Normal (3NF). Además, le metí varias restricciones y procedimientos almacenados para que la base respete sí o sí las reglas de la tienda:
* Un cliente no puede tener más de 5 pedidos pendientes a la vez.
* El stock de los productos nunca puede bajar de cero.
* Solo los clientes que de verdad compraron un producto pueden dejarle una reseña.
* Los correos de los usuarios no se pueden repetir.

## Estructura del Repositorio
* `/docs`: Aquí está el PDF con el reporte final, donde incluyo el diagrama ER, la justificación de cómo se normalizó la base y el análisis de las consultas.
* `/sql`:
  * `01_esquema.sql`: El código para crear las 6 tablas con sus respectivas llaves primarias y foráneas.
  * `02_indices_restricciones.sql`: Los índices que armé para optimizar las consultas y las restricciones extra.
  * `03_datos_prueba.sql`: El script con los datos falsos para poblar la base y poder probarla.
  * `04_procedimientos_consultas.sql`: Toda la lógica pesada, incluyendo los 8 procedimientos almacenados y las consultas que pide el proyecto.

## Tecnologías Utilizadas
* **Base de Datos:** MySQL
* **Modelado:** PlantUML para el diagrama ER
* **Control de Versiones:** Git y GitHub 

## Autor
**Joanthan Jesús Flores Reyes**
Universidad Autónoma Metropolitana, Unidad Cuajimalpa