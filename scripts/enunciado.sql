use sakila;

# Pagos realizados por los clientes
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

# Bodega de datos para "pagos"
# ------
# Hechos: pagos
#   - sumar valor -- campo amount 
# Dimensiones: 
#   - dim_customer
#   - dim_date
#   - dim_staff
#   - dim_store

# 1. Diseño de una bodega de datos para pagos
#    - conceptual: dibujo con puntos y lineas
#    - logico-relacional: esquema con las tablas (esquema en estrella)
# 2. Hacer el create de la tabla "fact_payment"
#    - solo la tabla de hechos con los FK, similar a fact_rental
# 3. Hacer un script de carga de datos
#    - solo un script "fact_payment.sql"