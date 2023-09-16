use sakila_datawh;

with datos as (
    select 
        fact.count_rentals,
        fact.count_returns,
        dim_customer.*,
        dim_date.*,
        dim_film.*,
        dim_staff.*,
        dim_store.* 
    from fact_rental as fact
        left join dim_customer
            on fact.customer_key = dim_customer.customer_key
        left join dim_date
            on fact.date_key = dim_date.date_key
        left join dim_film
            on fact.film_key = dim_film.film_key
        left join dim_staff
            on fact.staff_key = dim_staff.staff_key
        left join dim_store
            on fact.store_key = dim_store.store_key
)
select 
    sum(count_rentals) alquileres,
    store_city ciudad,
    customer_city ciudad_cliente,
    year_month_number mes
from datos
group by 
    ciudad,
    ciudad_cliente,
    mes
;