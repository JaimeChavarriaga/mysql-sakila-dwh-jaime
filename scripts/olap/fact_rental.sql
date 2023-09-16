INSERT INTO fact_rental (
    customer_key,
    staff_key,
    film_key,
    store_key,
    date_key,
    count_returns,
    count_rentals
)
SELECT 
    customer_key,
    staff_key,
    film_key,
    store_key,
    date_key,
    SUM(count_returns),
    SUM(count_rentals)
FROM (
    SELECT 
        dim_customer.customer_key,
        dim_staff.staff_key,
        dim_film.film_key,
        dim_store.store_key,
        TO_DAYS(rental_date) AS date_key,
        CASE WHEN return_date IS NULL THEN 0 ELSE 1 END AS count_returns,
        1 as count_rentals
    FROM sakila.rental AS rental
        LEFT JOIN sakila_datawh.dim_customer AS dim_customer
            ON rental.customer_id = dim_customer.customer_id
        LEFT JOIN sakila_datawh.dim_staff as dim_staff
            ON rental.staff_id = dim_staff.staff_id
        LEFT JOIN sakila.inventory AS inventory
            ON rental.inventory_id = inventory.inventory_id
        LEFT JOIN sakila_datawh.dim_film as dim_film
            ON inventory.film_id = dim_film.film_id
        LEFT JOIN sakila_datawh.dim_store as dim_store
            ON inventory.store_id = dim_store.store_id
    ) AS datos
GROUP BY 
    customer_key,
    staff_key,
    film_key,
    store_key,
    date_key
;