# Script de ejemplo
# -----------------
# Para ejecutarlo en el MySQL en el contenedor se puede ejecutar
#   source /scripts/ejemplo.MySQL

use sakila;

## Información de ventas 

SELECT
    CONCAT(city, ',', country) AS store,
    CONCAT(staff.first_name,' ', staff.last_name) AS manager,
    CONCAT(customer.first_name,' ', customer.last_name) AS customer,
    payment_date,
    amount
FROM country
    INNER JOIN city USING(country_id)
    INNER JOIN address USING(city_id)
    INNER JOIN store USING(address_id)
    INNER JOIN staff USING(store_id)
    INNER JOIN payment USING(staff_id)
    INNER JOIN customer USING(customer_id)
LIMIT 10
;    

## Información de ventas por tienda, por cliente, por mes y año


SELECT
    CONCAT(city, ',', country) AS store,
    CONCAT(staff.first_name,' ', staff.last_name) AS manager,
    CONCAT(customer.first_name,' ', customer.last_name) AS customer,
    YEAR(payment_date) AS year,
    MONTH(payment_date) AS month,
    SUM(amount) AS amount
FROM country
    INNER JOIN city USING(country_id)
    INNER JOIN address USING(city_id)
    INNER JOIN store USING(address_id)
    INNER JOIN staff USING(store_id)
    INNER JOIN payment USING(staff_id)
    INNER JOIN customer USING(customer_id)
GROUP BY store, manager, customer, year, month
LIMIT 10
;    

## 3. Información de ventas por tienda, por mes y año, considerando solo el año 2005.

SELECT
    CONCAT(city, ',', country) AS store,
    CONCAT(staff.first_name,' ', staff.last_name) AS manager,
    YEAR(payment_date) AS year,
    MONTH(payment_date) AS month,
    SUM(amount) AS amount
FROM country
    INNER JOIN city USING(country_id)
    INNER JOIN address USING(city_id)
    INNER JOIN store USING(address_id)
    INNER JOIN staff USING(store_id)
    INNER JOIN payment USING(staff_id)
    INNER JOIN customer USING(customer_id)
GROUP BY store, manager, year, month
HAVING year=2005
;    

## 4. Información comparativa de las ventas de los meses 5 y 6 de 2005

SELECT 
    store,
    manager,
    SUM( 
        CASE WHEN month=5 THEN amount ELSE 0 END
    ) as may,
    SUM(
        CASE WHEN month=6 THEN amount ELSE 0 END
    ) as june
FROM (
        SELECT
            CONCAT(city, ',', country) AS store,
            CONCAT(staff.first_name,' ', staff.last_name) AS manager,
            YEAR(payment_date) as year,
            MONTH(payment_date) as month,
            SUM(amount) as amount
        FROM country
            INNER JOIN city USING(country_id)
            INNER JOIN address USING(city_id)
            INNER JOIN store USING(address_id)
            INNER JOIN staff USING(store_id)
            INNER JOIN payment USING(staff_id)
            INNER JOIN customer USING(customer_id)
        GROUP BY store, manager, year, month
        HAVING year=2005
    ) AS sales_2005
GROUP BY store, manager
;        
